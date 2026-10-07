Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011042.outbound.protection.outlook.com [52.101.65.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03C5649BD75
	for <driver-core@lists.linux.dev>; Wed,  7 Oct 2026 13:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791378932; cv=fail; b=AayB/YjljNf+RPCohR0odRkxWzVzDlc/DLmE0fOILik5zO1ECzUkV0gXJRz1yX1UTFi5hca+m4yGJCpOGzaGI4SekKYE2Zr5TBM+xkreqituDMCffnWP9R+WpRlp6YzDqfXVDpBW8OiUbquS5Znz0Lacp9kNqLPAKW9S66xHukk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791378932; c=relaxed/simple;
	bh=rXb/jkjG1UGn762JyFVVCxRkvArjqXGo3i7wOsiSFjI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=t1PfLsIYv4CROT4If+vEIE7DpPsTt7eTE2fRm5BxZ9Qbq9cetVitJm3+16VOO1MNhZZqGBT3hbuCpxeVg0OIReHKXtQ9Qy158GmLzI/eS4gODwT9Zo3nRg57LHHTQnCUPe/FR4DJDUjLl2rF/EjFFfd6CMuxNl1ouglebofyKmU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=XtTD5beC; arc=fail smtp.client-ip=52.101.65.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="XtTD5beC"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uakM2XdOmOHWZYB26GyrrHu1bPa0KMfESzt8NitlbN9P2vuWYsISBKfjM0aQT+8Wmbyh5Y72nWLRUmMtPQofl487ZTqpJ1KJyQfB2N1zk07TAkl0g6vlwj9OGyhX0BOKjQLgmWKciuDUAZp0WWKGCt73dT+/02KZI2LKKqAn5lNFAerMIQ2LBj5s4mZ3iY7PzJA6mlGjdgJV9QrCSHKZz7tryH+IGK6C3mUYr9HPvvC1B7sWGfSt1WPcgbZZ2SHX1XCyzxFdCdaPyb/gPPZsOv7nrjkmHXugDmaV/e2/RZyTaRKfS3z7LagziMxiKAhEXMVXOfMXqrvay9ibUJUSSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z2seEb+lTAIxN7WioBfqbQlQGeTvnkUlBkipr4VwVbI=;
 b=PMLXoQ6NBjSkylc6IJPhs7HcBrsNvP2QSmAHFdJ4ZnXnM7FgPkvDOQLwxLCjAfO44I6evO6AFErN/d3awb6jbwMzFv7RT5Y0NGZbvmJuPEmofWtby16ifXmkXfw8/quye/fEvg93L5VKi4PFjfigpjKur8DfiDjrvrg4xX2XGbEAgYpPLoYExXQ1CxA9kYbyXPOZ79xPOdJTk+IlNs4+h+jHsadl1W2VgfyrwV7IX4+vevjqcRaZhpD1fzP1q8E1kBi0vePxflqSt7KqmVKBiR0iPfrAsxVE8jQPPkkacDFlbCEx3BKXLdKu4w4OVR/zeUekpN6mNIoQN5OYSsFxjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z2seEb+lTAIxN7WioBfqbQlQGeTvnkUlBkipr4VwVbI=;
 b=XtTD5beCitiC8JfyVoIxg0F6z/chT46pX1RYYR+QytsrWZNEE/k8o7jmwQtnv2z3T0+kTMaeyEMlnTCVtI6wrVTGlWzYmUpuo9FVQsHWg1J2FR9j3hFxLdqU2SPsKDXFDlVYUTiF9/sizB9QYZRQLek6V5sWc3ZxW3Eeb8m17Nw=
Received: from PR3P191CA0032.EURP191.PROD.OUTLOOK.COM (2603:10a6:102:55::7) by
 PA2PR06MB9267.eurprd06.prod.outlook.com (2603:10a6:102:409::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.15; Wed, 7 Oct 2026 13:15:20 +0000
Received: from AM7PEPF00000056.EURPRD83.prod.outlook.com
 (2603:10a6:102:55:cafe::3f) by PR3P191CA0032.outlook.office365.com
 (2603:10a6:102:55::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Wed, 7
 Oct 2026 13:15:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 AM7PEPF00000056.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.3 via Frontend Transport; Wed, 7 Oct 2026 13:15:18 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Wed, 7 Oct 2026 15:15:18 +0200
From: Mario Peter <mario.peter@leica-geosystems.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>
Subject: [PATCH v2] driver core: Take parent lock in async device attach
Date: Wed,  7 Oct 2026 13:15:14 +0000
Message-ID: <20261007131514.1260696-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 07 Oct 2026 13:15:18.0605 (UTC) FILETIME=[E64287D0:01DD565D]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM7PEPF00000056:EE_|PA2PR06MB9267:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 3b56068f-b4a3-4a0e-d4ed-08df247508da
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|23010399003|6133799003|18002099003|10067099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	PPy902jaff0btB8miOTHgjJx7FD7WMHEVwLdOKDol28eGWLN0X9J7AYpCYfSzz5lskj7T76V5EVeQAbxI91cyyBigXA72uKyOG4g+AhmP0CgPnY/uO0C64N0sB4LwyGNaHSjzh0yasFMSxzn+/cQLYtMOXLDBE0ixrdH2fBWXLG1BY0eyPbvOn9V9zs+NU9ZmOYFnxt2uRMn3OhpdFE3gC/xI/h/gWRzRpRMEnqUoesRY3xayaxlrXV4d+1kZxwkndoOT4G/O1L1TCLDlAXbVTd9Lwss/C42FRyYNbr3nTyTHZXZ+1naWzkOf+ofHPWLQ45WKrgQwCdNy2dDN9S4ieOECpKxgCTUBn//K/tnzW1vioD2dLUUL9bU2/IYvAAQsC9DwhjFOamN9zuLhNQWqrAL/efzR+lZG/qj49ernHWG4VcJpmJUw2p6dguNWk4MzOVU8yAA/OrQdGC9Q521eO4KXrAVP89l+mDGCdv4GNXWgd1WLBNYi6Hmu3xeQvRzVMANkknR+rXVdapq4kTdSjdS8hIZJLv3kc8HUnhcshhQeNtdcPjEXE8ICOTOwogPkbtfsFoNlD9CJEC/AuDRRDvmkaGuj86roaQrj5vCVl30gwROwnG9xcuq42juuFjSnj61z6XlQdyrLV0VkcOGlgRrzOrWwAKSgk+Yt4NREG7QymGMFi+t9ez0f0hICRPGc4dDjgALIaOEdHPDP7Yd1A==
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(23010399003)(6133799003)(18002099003)(10067099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Xl6dWO14XZKM98M6d/2tu3qchyny4MM8FURdSNQJwThiU7NeuoUxtn2Ck0hrLUJ8cnxAN2VhjHlE1cWwge+FWmSz5Un45CYIWyf1ZqXaIC6QzxSPZo8C6PH+9MTenMfpdjq64EUJsa7U6J9s90TTkZ2fuFNPR2sQWKt/mmcffZ2QWzVFwyH0B5Bkdd3QcgNHHT2YreDwvHCLxBUjgsE5OpXCutAG8f1baJVkdtnobmxmTWtz8Zyn8NE9s4TWjCYZuD1NfgKq3lP8pSBUi1d5WB78mdKpgMpyD17q0isuceIXrn4GR9byHyITnK8QtrtMl7Aw7ZFENk/r00KhiZxqzelWvkYUIUdllwrT+JSBmYaSfZTRrSdZIHO6KrzhplcK82xHAEoCIHsLi3n5MSeij8FnUryunVQU0doRBg4ibo80u/ntcFIUlA9bygyTf2y1
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2026 13:15:18.7866
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b56068f-b4a3-4a0e-d4ed-08df247508da
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AM7PEPF00000056.EURPRD83.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA2PR06MB9267

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
---
v2:
- Describe the race in more detail
- Keep the multi-TT detail, but say why the hub has to be multi-TT
  for this symptom
- Reproduce and test on v7.3-rc6 in QEMU

In the same QEMU setup, a debug-only device_lock_assert(&udev->dev) in
usb_probe_interface() fired on every async probe of a hub interface
without this patch (52 of 52) and never with it (0 of 102). The hub
emulator and the test scripts are small, I can post them if that helps.

Not covered: deferred_probe_work_func() also re-probes via
__device_attach() without the parent lock.

Analysis and patch done with the help of Claude Code.

v1: https://lore.kernel.org/all/20261006132335.4014316-1-mario.peter@leica-geosystems.com/

 drivers/base/dd.c | 68 +++++++++++++++++++++++------------------------
 1 file changed, 34 insertions(+), 34 deletions(-)

diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index f6525a7ee8c5..a8912e6d5fbc 100644
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
@@ -1155,38 +1187,6 @@ void device_initial_probe(struct device *dev)
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

base-commit: 22430ae5d90ab288b0ee2ad99ae941f4a666b694
-- 
2.43.0

