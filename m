Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010063.outbound.protection.outlook.com [52.101.69.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF5CD435EF3
	for <driver-core@lists.linux.dev>; Tue,  6 Oct 2026 13:24:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791293086; cv=fail; b=hRUKMOuJ3gp4v2Nz9zXgzZaL6EVati3E7qYBaP1e6irdpRiObODJJeR00wNVBrOlqmKaxNe7FpmDIpZCbOEbbPR6BFTn2oCDjmH2DmJmuGiCwbeDv/97/m+NiIYM2q0iADTh9+Q9Mqfio2q2WN7UCV82/cycl6iSvEu/VzvSY6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791293086; c=relaxed/simple;
	bh=9/81FqUiVZY7swnlXRhCdnUovHDJDgyE8t9JuozP4SU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=AftxvFNhY/qUIY/wAbKjEIUgwmzkoTAIn1xwEgT5h7Bth6lqavsprh3IWE+QW70hERgpt0pQ4CxjHxLXx77jzbjScaTXtfXma+d4xFyETEkhLPwvip6ll/el0wa/gK1wUpv8OHQ4tteGllV2OJ944t2Ku6H123q+Id8GeoJbH7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com; spf=fail smtp.mailfrom=leica-geosystems.com; dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b=J7OxI1Ni; arc=fail smtp.client-ip=52.101.69.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=leica-geosystems.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=leica-geosystems.com header.i=@leica-geosystems.com header.b="J7OxI1Ni"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ng5xVPQhwZN9LElMrbIBr5ZikHqC2KnFR2iZx9wgK44KfsOFvTxybmEfnLhSpvg1A0nAAPJdrFRx9Nbi5LP8VP1yvRq+C6hBWDCQy1oaLiUznJ/Zdu321hC7Em8UKLiAL+CSklvQyG5e/E1d/gjEuEuycHWrWDksBMTp5nkhRMtJlICDenBRnMLkRKldEQ42dBXhb9qBLncnHa1gDFoPiZsFqOSWN+YNG/lpCck7i6OpOlEhXuicjwpI6vGPv8vJYC0nzLt7js0YKcpYUXvhZHVuMmOXv8EOicmuXMZMqIzvSOtlaBBiA4qfDGKvvdRXUD4wDZxOPFHO76v0mXxpYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Tr82ieWf5JZx6iq8zqU9F0kEATgydCxD2I6Dn7BR/H4=;
 b=ZEoxMJb5Ry3dOgVBXHK4/mQ7t3eA1QSVvm6fdCNZsQx6vp0p2z/AorPJpqO6cVNaJm9UypVIopChOZPwCFghPfSTM377D2twDtubKPNp9LHGwcKFxvmpiWm2z+lj5O0G+6KSVI67nV6SwGmjn4xhUMrJPvF4el5GwvXw/t/QFbouffmNrRhHvLRlK6P52Yeq7kF9IKrAv0fJz0ffVUZw91h9gr+sdnOtNeLdRFRBDrouYe1seCLxC6qz1C7lOtQzDCXZqMNThkYA5MovKA6GGTO8UA5gWwTohvdoYZh7AqSon+QuN+nDTfZmizukszpqBixzULCq/gXS0K21cAlQMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 193.8.40.99) smtp.rcpttodomain=lists.linux.dev
 smtp.mailfrom=leica-geosystems.com; dmarc=pass (p=reject sp=reject pct=100)
 action=none header.from=leica-geosystems.com; dkim=none (message not signed);
 arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=leica-geosystems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Tr82ieWf5JZx6iq8zqU9F0kEATgydCxD2I6Dn7BR/H4=;
 b=J7OxI1Ninmsn/4knOUVBCgrToGUEFEDNB5yElgj8b66ZgdQU9MUIYcsptJ9cAgtTiGTCAMyChJ5lHszSIl/4nkF8I7wrokKHPdjNFK3UsTrzyyqwAOkfYm3BtIhymhoIYdQCisrpREbdskrR77zWn91H66qa+Tft8mb1zbqdZzg=
Received: from DUZPR01CA0046.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:469::14) by PAWPR06MB8835.eurprd06.prod.outlook.com
 (2603:10a6:102:388::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.20; Tue, 6 Oct
 2026 13:24:38 +0000
Received: from MAD0EPF000008BC.eurprd04.prod.outlook.com
 (2603:10a6:10:469:cafe::99) by DUZPR01CA0046.outlook.office365.com
 (2603:10a6:10:469::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.20 via Frontend Transport; Tue, 6
 Oct 2026 13:24:38 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 193.8.40.99) smtp.mailfrom=leica-geosystems.com; dkim=none (message not
 signed) header.d=none;dmarc=pass action=none
 header.from=leica-geosystems.com;
Received-SPF: Pass (protection.outlook.com: domain of leica-geosystems.com
 designates 193.8.40.99 as permitted sender) receiver=protection.outlook.com;
 client-ip=193.8.40.99; helo=hexagon.com; pr=C
Received: from hexagon.com (193.8.40.99) by
 MAD0EPF000008BC.mail.protection.outlook.com (10.167.241.171) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.496.14 via Frontend Transport; Tue, 6 Oct 2026 13:24:37 +0000
Received: from aherlnxbspsrv01.lgs-net.com ([10.61.228.61]) by hexagon.com with Microsoft SMTPSVC(10.0.17763.1697);
	 Tue, 6 Oct 2026 15:24:37 +0200
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
Subject: [PATCH v1] driver core: Take parent lock in async device attach
Date: Tue,  6 Oct 2026 13:23:35 +0000
Message-ID: <20261006132335.4014316-1-mario.peter@leica-geosystems.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 06 Oct 2026 13:24:37.0434 (UTC) FILETIME=[08EF51A0:01DD5596]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MAD0EPF000008BC:EE_|PAWPR06MB8835:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: e5a4e356-4192-4ef9-bd2d-08df23ad2ba1
X-SET-LOWER-SCL-SCANNER: YES
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|11063799006|56012099006|10067099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	FsnJ/Lfza4cshRK4OEzi6/pAltiaCP1OImtrMuP3BCkt6Cz+rt5UcCqmxCwMTz5MHGj8tIyioeCjnDmcg84zOJij+JaAOkdqSf9IByx12dxeXbD2pFbrMh0cANs33mOrgfWRC5yPpi4Gfnl1I/4s+MnIjKXXA3eI5QRtMeUCz2lYEqeylo/OezyIQg6cbdKxgeX29w0FAHKUGjV6VwtXbt4WZh29TlHkUpc4YuQeNjxUxatp/9k+sGLGS7hVgCQpe8VQ0AS4QYvVnzpZYUxYZJKxuypytoQmQ7iJWKxv/r+FuCx7VIg5l1Y/siWvaDoJ7zVKnAMMMx/uMidgoEqbG70LRMeyWEIOFeT4vaJHPSXSMOyv1nJ7lwIe1fV9/OCjYfBj4ONZwAEjA5WGcmkoJNMYApMd+qZc+Jeuikie2UlZVlE0FAOOdzbELvdh1j+IDelSj8EUCSSjgjCA9Dcjq30vM0n8V0ugUo71u2ajpRiFyNbLikrc1BiVMQv7mOpuPkrG/aqMgcuHiuyyR3DplG10Qpf57zVpYZK2Nf6oItI5N56rwD3dbBG7SqzvPkOcBT7Hga6kkI/uOY8B7cN1H0D0aBlViHNQl051MfMSgPh4Sl/VHuXJayJoRvox0MKMVk4cwJCfAYqjio+1QJh4ZkpogaIriX87SpTAXGQsESzqZJj+yQSaQ8nwH1SJg7TOcZIRpqBZ77GuHOuE0ASWAw==
X-Forefront-Antispam-Report:
	CIP:193.8.40.99;CTRY:CH;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:hexagon.com;PTR:ahersrvdom51.leica-geosystems.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(11063799006)(56012099006)(10067099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	HR6E7h+vB97NriNoPfgiG7w2OuKtQ567lE5gMv/xXPAvwIYwS/p9oL4f9NPr++SjiWVQ0SIZV+BG+w6xXbSEbXEMvcMXIm1EfPPIh39udJd/+c71FpVaVbLGH8HgzhVnQqG5ckATQf05skDXgJfgVBRzeakROIWUfOvtwvkNTOvzKF6mR7tCfKA7P0lpRhEU7GKIkN1UF/5OHan5j5/Cr4x0zgsUNV4ari8B4bal+f48k2C4XOANuBJhLs6quETuzY8Zm7K8tLLZI8Zhsx5UgJb8pBdhM3mYzgBxCZY+OAYetzqMBQVgvutPF6/61jQLC5yJNfpOHhS61i6MD/cWyf36dOq5kxR8Zh+EQf43kj6phx3ex815cjyQ7Dk/E5uxyplpHwEFYf6F3zpeR7tKJGLKW/g7D20FYnIpcLpfww1LAOtuObANf8MZiIhnlky2
X-OriginatorOrg: leica-geosystems.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2026 13:24:37.7605
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e5a4e356-4192-4ef9-bd2d-08df23ad2ba1
X-MS-Exchange-CrossTenant-Id: 1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=1b16ab3e-b8f6-4fe3-9f3e-2db7fe549f6a;Ip=[193.8.40.99];Helo=[hexagon.com]
X-MS-Exchange-CrossTenant-AuthSource:
	MAD0EPF000008BC.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR06MB8835

On buses with need_parent_lock set (only USB), probe() must run with the
parent device locked. A synchronous attach after device_add() gets this
from the caller, e.g. usb_set_configuration() holds the udev lock while
adding interfaces. __device_attach_async_helper() runs the probe from an
async worker instead, where that lock isn't held, and only takes
device_lock(dev).

With async probing enabled for USB drivers (driver_async_probe=*,
module.async_probe=1), hub_probe() of a multi-TT hub then races with
usb_set_configuration() and both create the interface's endpoint
devices. On an i.MX8MM board this hit 11 of 100 boots:

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

Take the parent lock there as well, like __driver_attach_async_helper()
does, and move __device_driver_lock/unlock() up for that. With this the
warning was gone in 300 boots.

Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for drivers")
Assisted-by: LLM
Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
---
Seen and tested on 6.16.y, which has the same code here. On mainline
only build-tested.

Not covered: deferred_probe_work_func() also re-probes via
__device_attach() without the parent lock.

Analysis and patch done with the help of Claude Code.

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

