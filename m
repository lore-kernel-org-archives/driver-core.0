Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B3B72630;
	Sun, 18 Oct 2026 00:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792282721; cv=none; b=sw/qByii0kXSaqLLdGHbEg14znq57H95BlIyYA7AsbHeSzLfSb+dfiJv9ChEeG0/YGtkME2l30BCKRBsYdNIYesYS5DTKuRoXUfmk0tlD08NA/0jpsPBKJ9Y77lyTC01kYLS4H2RNWjyPBTqt/fiYeEmTacSAclzyBc+4x4Wu44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792282721; c=relaxed/simple;
	bh=5Ry1YhrxI4V/iE+uGSCah4ycYlYixOa7ZsrES5WEIRg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BdxrJZG2M/iDAiNOmebAAxT9lIoCgpxWK+FwI0Z/XIsmZnMP9vp7tPriwxfp86TdidIBwu4oFGrd9wDY88V/qdMYS23S8kDMYNmxKHDXTaun2FjG66iFq/DSLYgKi6nwoDQryWCfBKHBHqg9tflBjeFbnGRGrb+FrrAU9DrkyDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xIEbm-003x5t-4B;
	Sat, 17 Oct 2026 20:18:38 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] driver core: Don't take the device lock in waiting_for_supplier_show()
Date: Sat, 17 Oct 2026 20:18:37 -0400
Message-ID: <20261018001837.797946-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reading a device's waiting_for_supplier attribute while the device is
being probed hangs both the reader and the probing task for good, in
uninterruptible sleep, if the probe succeeds. The file is world
readable and fw_devlink, enabled by default, creates it for every
device with a firmware node until the device is bound, so any user
reading sysfs during a probe (udev, a tool walking /sys, a plain cat)
can wedge it. The probing task keeps holding the device lock, so the
module load or deferred probe work that ran the probe, and everything
that takes that device's lock later, hangs as well. Kernels since v5.9
are affected.

waiting_for_supplier_show() blocks in device_lock() while the read
holds an active reference on the sysfs file. On successful probe,
driver_bound() calls device_links_driver_bound() with the device lock
held, which removes the file, and kernfs waits for that active
reference to be dropped: the reader waits for the prober and the
prober for the reader. Lockdep does not report it because dev->mutex
is not validated.

The device lock is not needed here. The value is computed by
fwnode_links_check_suppliers() under fwnode_link_lock, which every
writer of the fwnode supplier list holds, and the active reference keeps
the device from being deleted while the callback runs. Drop the device
lock.

Reproduced on x86_64 under QEMU with an lsi53c895a SCSI controller and
sym53c8xx built as a module: its probe resets the SCSI bus and the
synchronous scan then waits for the settle delay (3 seconds by default),
and a read of the PCI device's waiting_for_supplier file 1 second into
the module load hangs. Before the change the hung task detector reports
insmod in kernfs_drain() under device_links_driver_bound() and cat in
waiting_for_supplier_show(), neither ever returns, and a power-off
afterwards hangs in device_shutdown() on the same lock; after the
change the read returns 0 and the module load completes.

Fixes: da6d647598a6 ("driver core: Add waiting_for_supplier sysfs file for devices")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    Every writer of the fwnode supplier list (fwnode_link_add(), the purge
    helpers, __fwnode_links_move_consumers() via
    fw_devlink_pickup_dangling_consumers(), and the cycle/link code under
    fw_devlink_link_device()) holds fwnode_link_lock, so the walk in
    fwnode_links_check_suppliers() needs nothing more.
    
    Reproducer (x86_64 defconfig + CONFIG_SCSI_SYM53C8XX_2=m + CONFIG_DETECT_HUNG_TASK,
    QEMU with -device lsi53c895a,id=scsi0 -device scsi-hd,drive=d0,bus=scsi0.0; the
    PCI device has an ACPI companion, so it owns a waiting_for_supplier file until a
    driver binds; sym2_probe() resets the SCSI bus and the synchronous scan waits for
    the settle delay, so the probe takes "settle" seconds). Busybox /init, with
    sym53c8xx.ko in the initramfs:
    
    #!/bin/sh
    mount -t proc proc /proc
    mount -t sysfs sysfs /sys
    mount -t devtmpfs devtmpfs /dev
    for d in /sys/bus/pci/devices/*; do
    	read v < $d/vendor; read i < $d/device
    	[ "$v $i" = "0x1000 0x0012" ] && dev=${d##*/}
    done
    (insmod /sym53c8xx.ko settle=8 && echo "init: module load done") &
    sleep 1
    (echo "init: read returned $(cat /sys/bus/pci/devices/$dev/waiting_for_supplier), attribute access done") &
    sleep 30
    echo "init: after 30 s:"
    ps | grep -E 'insmod|cat /sys'
    echo w > /proc/sysrq-trigger
    
    qemu-system-x86_64 -cpu max -smp 2 -m 512M -nographic -no-reboot -kernel bzImage \
        -initrd initramfs.cpio -drive file=disk.img,if=none,id=d0,format=raw \
        -device lsi53c895a,id=scsi0 -device scsi-hd,drive=d0,bus=scsi0.0 \
        -append "console=ttyS0 panic=-1 rdinit=/init loglevel=7"
    
    Before:
      INFO: task insmod:72 blocked for more than 10 seconds.
       kernfs_drain+0xf6/0x170
       __kernfs_remove+0x188/0x250
       kernfs_remove_by_name_ns+0x78/0xd0
       device_links_driver_bound+0xd4/0x350
       driver_bound+0x46/0x180
       really_probe+0x1b1/0x360
       __driver_attach+0xfc/0x1d0
       bus_add_driver+0x15c/0x270
       init_module+0xc9/0xff0 [sym53c8xx]
      INFO: task cat:79 blocked for more than 10 seconds.
       __mutex_lock+0x395/0xa00
       waiting_for_supplier_show+0x1f/0xa0
       dev_attr_show+0x17/0x60
      INFO: task cat:79 is blocked on a mutex likely owned by task insmod:72.
      init: after 30 s:
         72 0        {insmod} /bin/sh /init
         79 0        cat /sys/bus/pci/devices/0000:00:04.0/waiting_for_supplier
      (a power-off afterwards hangs too: device_shutdown() takes the same lock)
    After:
      init: read returned 0, attribute access done
      sd 2:0:0:0: [sda] Attached SCSI disk
      init: module load done

 drivers/base/core.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4c0c373998a1..a3a28d83d339 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1317,10 +1317,8 @@ static ssize_t waiting_for_supplier_show(struct device *dev,
 {
 	bool val;
 
-	device_lock(dev);
 	scoped_guard(mutex, &fwnode_link_lock)
 		val = !!fwnode_links_check_suppliers(dev->fwnode);
-	device_unlock(dev);
 	return sysfs_emit(buf, "%u\n", val);
 }
 static const DEVICE_ATTR_RO(waiting_for_supplier);

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.53.0

