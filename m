Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C04BB3F5BFC;
	Tue, 13 Oct 2026 14:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900295; cv=none; b=jTqwiCEW6V/5H8ksKL8RrxtNInB2OLqPh5qMcN8dU/n2nc4KfeGVDndiwH5EzsezmZaEiAbsOBIXx2c5gq292u3FX+dWlrFWjAV5bKNjBCilBVcCSDbuqlgS90H99bGf+trqrr2rL5r5gzoIkYOy+OWHoG2MlEa3UBaxDhRLO4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900295; c=relaxed/simple;
	bh=Ci+V/twvrSuCTaHq3Y2h0sHhVNTrB8cyrxc7c22af1c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hoiflv3AZ1a3xsyQCOyu6+pIJVf402yorVsx4DAkeqw3ZtmhAFp7mwM+pfLgu3be9Rtq6N59y3mxeeOBbC7phg9OVHu32Fs6cAuYw3vT2LiekljLAhDJu7PUHhY9HSn8hKLGCNIpcKJS3kly6NnLHimCxWCxV6WAcPx7xg8IGj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=A7e0u2bR; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="A7e0u2bR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 310E21F000FF;
	Tue, 13 Oct 2026 14:04:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791900293;
	bh=+65tjF/rN2b9dRPCperIxDap/oLJJZWIgz70YxGogrk=;
	h=From:To:Cc:Subject:Date;
	b=A7e0u2bRKyyPdlWu0Mc9DFegqeQ7lnuPpSN2/913zcG5yrYFH24nGy0JBvjFiI/qg
	 5RXA24/qL4m9v/ll3Td2w/8vPrO6oPLeWSwthHrsnupLmi4cgcC1Bqh/WLeGH2uXNj
	 zwGg6mZ74YPaEiwLMn6FlQnMEeHA78arn5MrBk+45QXP7djLileBSDBJBOrZnr0t9+
	 HunWiLTy+O+OiNfWDia3lR+tMNkl8q/Lzg+WuKsvKsfRRMKB7TkyYgGbkFuja498zf
	 gPqNyByaVfRzytI6KLilH4tD75tvWP3N7FZst9NWP5+Yd1/X41xBUHtXiHkGvuCIQu
	 GJKVcb5FTjgpQ==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xGd7a-000000059AR-36Pr;
	Tue, 13 Oct 2026 16:04:50 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>
Subject: [PATCH v3] driver core: take parent lock in async device attach
Date: Tue, 13 Oct 2026 16:04:08 +0200
Message-ID: <20261013140408.1226841-1-johan@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Peter <mario.peter@leica-geosystems.com>

On buses with need_parent_lock set (only USB), probe() must run with the
parent device locked. A synchronous attach after device_add() gets this
from the caller, e.g. usb_set_configuration() holds the udev lock while
adding interfaces. __device_attach_async_helper() runs the probe from an
async worker instead, where that lock isn't held, and only takes
device_lock(dev).

With async probing enabled for the hub driver (e.g. driver_async_probe=*
or driver_async_probe=hub), this races when a multi-TT hub is
configured. For multi-TT hubs, hub_probe() calls
usb_set_interface(hdev, 0, 1) to select the TT-per-port altsetting, and
usb_set_interface() creates the endpoint devices of the interface a
second time:

  usb_set_configuration()           async worker
    [udev locked]
    device_add(intf)
      queues the probe  ----------> __device_attach_async_helper()
                                      [intf locked, udev not locked]
                                      hub_probe()
                                        usb_set_interface(hdev, 0, 1)
    create_intf_ep_devs(intf)             create_intf_ep_devs(intf)

create_intf_ep_devs() checks and sets intf->ep_devs_created without a
lock of its own. If usb_set_configuration() has created ep_81 but not
yet set the flag, usb_set_interface() skips removing the endpoint
devices of the old altsetting and creates ep_81 again. With a
synchronous probe, hub_probe() runs inside device_add() with the udev
lock held, and usb_set_configuration() then finds ep_devs_created
already set.

Single-TT hubs don't call usb_set_interface() from hub_probe() and
don't show this warning, but their probe runs without the udev lock as
well.

On an i.MX8MM board with an onboard USB2514 hub this hit 11 of 100
boots:

  sysfs: cannot create duplicate filename '.../1-1/1-1:1.0/ep_81'
  Call trace:
   sysfs_warn_dup
   usb_create_ep_devs
   create_intf_ep_devs
   usb_set_interface
   hub_probe
   usb_probe_interface
   really_probe
   __device_attach_async_helper
   async_run_entry_fn

It also shows on v7.3-rc6 in QEMU, with dummy_hcd and a raw-gadget
program emulating a multi-TT hub: re-authorizing the hub in a loop,
while a SCHED_FIFO task preempts the writing task at random points for
3 ms, hit the warning in 29 of 6000 iterations.

Take the parent lock in __device_attach_async_helper() as well, like
__driver_attach_async_helper() does, and move
__device_driver_lock/unlock() up for that. With this the warning was
gone in 300 boots on the board and in 6000 iterations in QEMU.

Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for drivers")
Assisted-by: LLM
Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
[ johan: switch to async_schedule_dev_nocall() to avoid deadlock if
         async_schedule_dev() runs synchronously when parent lock is
	 held ]
Signed-off-by: Johan Hovold <johan@kernel.org>
---

Changes in v3:
 - fix deadlock if async_schedule_dev() runs synchronously

v2: https://lore.kernel.org/all/20261007131514.1260696-1-mario.peter@leica-geosystems.com/
v1: https://lore.kernel.org/all/20261006132335.4014316-1-mario.peter@leica-geosystems.com/


 drivers/base/dd.c | 85 ++++++++++++++++++++++++++---------------------
 1 file changed, 47 insertions(+), 38 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f6525a7ee8c5..9dc7cce9bd8d 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -1029,6 +1029,38 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
 	return ret == 0;
 }
 
+/*
+ * __device_driver_lock - acquire locks needed to manipulate dev->drv
+ * @dev: Device we will update driver info for
+ * @parent: Parent device. Needed if the bus requires parent lock
+ *
+ * This function will take the required locks for manipulating dev->drv.
+ * Normally this will just be the @dev lock, but when called for a USB
+ * interface, @parent lock will be held as well.
+ */
+static void __device_driver_lock(struct device *dev, struct device *parent)
+{
+	if (parent && dev->bus->need_parent_lock)
+		device_lock(parent);
+	device_lock(dev);
+}
+
+/*
+ * __device_driver_unlock - release locks needed to manipulate dev->drv
+ * @dev: Device we will update driver info for
+ * @parent: Parent device. Needed if the bus requires parent lock
+ *
+ * This function will release the required locks for manipulating dev->drv.
+ * Normally this will just be the @dev lock, but when called for a
+ * USB interface, @parent lock will be released as well.
+ */
+static void __device_driver_unlock(struct device *dev, struct device *parent)
+{
+	device_unlock(dev);
+	if (parent && dev->bus->need_parent_lock)
+		device_unlock(parent);
+}
+
 static void __device_attach_async_helper(void *_dev, async_cookie_t cookie)
 {
 	struct device *dev = _dev;
@@ -1038,7 +1070,7 @@ static void __device_attach_async_helper(void *_dev, async_cookie_t cookie)
 		.want_async	= true,
 	};
 
-	device_lock(dev);
+	__device_driver_lock(dev, dev->parent);
 
 	/*
 	 * Check if device has already been removed or claimed. This may
@@ -1060,7 +1092,7 @@ static void __device_attach_async_helper(void *_dev, async_cookie_t cookie)
 	if (dev->parent)
 		pm_runtime_put(dev->parent);
 out_unlock:
-	device_unlock(dev);
+	__device_driver_unlock(dev, dev->parent);
 
 	put_device(dev);
 }
@@ -1117,8 +1149,13 @@ static int __device_attach(struct device *dev, bool allow_async)
 	}
 out_unlock:
 	device_unlock(dev);
-	if (async)
-		async_schedule_dev(__device_attach_async_helper, dev);
+	if (async) {
+		if (!async_schedule_dev_nocall(__device_attach_async_helper, dev)) {
+			put_device(dev);
+			ret = 2;	/* retry synchronously */
+		}
+	}
+
 	return ret;
 }
 
@@ -1145,48 +1182,20 @@ EXPORT_SYMBOL_GPL(device_attach);
 void device_initial_probe(struct device *dev)
 {
 	struct subsys_private *sp = bus_to_subsys(dev->bus);
+	int ret;
 
 	if (!sp)
 		return;
 
-	if (sp->drivers_autoprobe)
-		__device_attach(dev, true);
+	if (sp->drivers_autoprobe) {
+		ret = __device_attach(dev, true);
+		if (ret == 2)
+			__device_attach(dev, false);
+	}
 
 	subsys_put(sp);
 }
 
-/*
- * __device_driver_lock - acquire locks needed to manipulate dev->drv
- * @dev: Device we will update driver info for
- * @parent: Parent device. Needed if the bus requires parent lock
- *
- * This function will take the required locks for manipulating dev->drv.
- * Normally this will just be the @dev lock, but when called for a USB
- * interface, @parent lock will be held as well.
- */
-static void __device_driver_lock(struct device *dev, struct device *parent)
-{
-	if (parent && dev->bus->need_parent_lock)
-		device_lock(parent);
-	device_lock(dev);
-}
-
-/*
- * __device_driver_unlock - release locks needed to manipulate dev->drv
- * @dev: Device we will update driver info for
- * @parent: Parent device. Needed if the bus requires parent lock
- *
- * This function will release the required locks for manipulating dev->drv.
- * Normally this will just be the @dev lock, but when called for a
- * USB interface, @parent lock will be released as well.
- */
-static void __device_driver_unlock(struct device *dev, struct device *parent)
-{
-	device_unlock(dev);
-	if (parent && dev->bus->need_parent_lock)
-		device_unlock(parent);
-}
-
 /**
  * device_driver_attach - attach a specific driver to a specific device
  * @drv: Driver to attach
-- 
2.55.0

