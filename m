Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22D6A37F312;
	Sat, 17 Oct 2026 02:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=128.30.2.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202979; cv=none; b=aBxn+1rYQyjpGZd+SHgA79jaaYSXKznJVt+3988hridl+mIt75BRxYmIS85pK8lZva3qq7aAT68Nv8uDh9dh5tzwxJ4mxQVHCh+jQOtaCS8InZC9nkB4+ZKNMi0n15s8TTs62hXYiU3vGL60iM2hDLY1kluvAyFjVMNVlM82fqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202979; c=relaxed/simple;
	bh=RF/W1SaqT/pUmiPWUqs7Mq56awdeg7t7ucnjJap/G/E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p8k6oaIuw+mMKuJoeA6eqEMV96Uz1dwyCbn6jPpU/9S+SvOMr1547GnUUvNyjJeIRUrXJ8wLea2mPhiMRKa6/BXnyFCu7YD6vGPXGplkW18h4cv7igdD9OAiGZDiU3HuRKBFjNcOrjyhQgGOPkps5Moz4yakU/wEPZKzZS1Kpsw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu; spf=pass smtp.mailfrom=csail.mit.edu; arc=none smtp.client-ip=128.30.2.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Received: from escalante.csail.mit.edu ([128.52.128.198])
	by outgoing2021.csail.mit.edu with esmtp (Exim 4.95)
	(envelope-from <nickolai@csail.mit.edu>)
	id 1xHtrb-00HPH5-RG;
	Fri, 16 Oct 2026 22:09:35 -0400
From: Nickolai Zeldovich <nickolai@csail.mit.edu>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Nickolai Zeldovich <nickolai@csail.mit.edu>
Subject: [PATCH v1] driver core: unbind only the driver whose unbind file was written
Date: Fri, 16 Oct 2026 22:09:35 -0400
Message-ID: <20261017020935.792500-1-nickolai@csail.mit.edu>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

unbind_store() checks dev->driver == drv without the device lock and
then calls device_driver_detach(), which is
device_release_driver_internal(dev, NULL, dev->parent): with a NULL
driver that function releases whichever driver is bound once it holds
the lock.  Between the check and the lock another thread can unbind
drv and bind a different driver to the same device (a second write to
the unbind and bind files, a driver_override write followed by
drivers_probe, or the bus re-probing the device after the first
unbind), and the write to drv's unbind file then detaches the other
driver, one the writer never named, and reports success.

The pattern is as old as the unbind file: the check was never under the
lock and the release never named the driver.  The locked variant has
existed since commit 4bdb35506b89 ("driver core: Add a wrapper around
__device_release_driver()") added the drv argument to
device_release_driver_internal() for driver_detach(), which has the
same requirement.

Pass drv to device_release_driver_internal(): it re-checks dev->driver
under the lock and releases the driver only when it is still the one
the file belongs to.  When the driver changed in between, the write
detaches nothing; drv is no longer bound to the device either way, so
the write still returns the count.

Found by formal verification of drivers/base/bus.c.

Fixes: 151ef38f7c0e ("[PATCH] driver core: Add the ability to unbind drivers to devices from userspace")
Assisted-by: LLM
Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
---

Notes:
    The unlocked dev->driver == drv test stays as the fast path (a device
    bound to another driver still gets -ENODEV there); making the write
    return -ENODEV when only the locked re-check fails would need a return
    value from device_release_driver_internal(), which three other callers
    ignore, and the writer's aim, drv no longer bound to the device, is met
    in that case. The race window is the time
    between the test and __device_driver_lock(); it was not hit in testing
    (no in-tree pair of drivers with a slow probe was raced), the
    interleaving is described in the message and a userspace racer is in
    the review material. bind_store() has no such hole: __driver_probe_device()
    checks dev->driver under the lock.

 drivers/base/bus.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index d17bd91490ee..8553183fd67f 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -241,7 +241,7 @@ static ssize_t unbind_store(struct device_driver *drv, const char *buf,
 
 	dev = bus_find_device_by_name(bus, NULL, buf);
 	if (dev && dev->driver == drv) {
-		device_driver_detach(dev);
+		device_release_driver_internal(dev, drv, dev->parent);
 		err = count;
 	}
 	put_device(dev);

base-commit: 70dd4ee72eb2d5793c62e71c14e3aba78e5a4e56
-- 
2.53.0

