Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010028.outbound.protection.outlook.com [52.101.201.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89ECE3C553B;
	Thu,  9 Jul 2026 21:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633209; cv=fail; b=i7tOD133c3Mh+o6FgbdJSoSI5jTniRMB8Ef6OSudHm7N2qx8r0dI1EoDAYhB/9G7YYlvLGPJ55IIdsDLpR3eiLuU+N8LFPaHHiYnZa0cXB2vCGuD83Ay6BDcuJ/Lnnl5CLEvJwPiDNDYNrIa2jEAyjmIMOYd0Frazb8QHU65IJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633209; c=relaxed/simple;
	bh=yBwdhiaiofw+ZcPTG9caw/d09mNDmfNeMhEvJ4E3o38=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=bMwYlLJwRtEgAfFfx6eeG3FOURGMgbLLPAJm352Kf7kdIdFE1kg/ig7FsKfqMwrwH+wEO8rqOdiP+dk9XZxOKes0DwrXqzOGp90srzmvfdEcB7n3oW5rRysJlqsQbcBXAK1gMH5auP3aFPh0p48sNPEV7Pu/UE3/BtASSn8ZrQ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=HtePuUf8; arc=fail smtp.client-ip=52.101.201.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="HtePuUf8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h+DDX5Kos/Z+SbMvfVbhwEvEv5bv+6v2n02rYqwmHb1hNdhNB/EUpKv8J4uBJA8WOd27UEimnFpZe8ft5dNxRfT5S4lNGJYQ3D8GqDILKN4k199xy2OKMXbQwZ6Ftiwcs24BW89Wi9IQvJUpXG935BXuv3lO2gmyVP+u0wp75YOCwqvkIkDcK0p0LQV1042C8F1bjY1UgKcDBJGvjCDegHpxvfebIH2PWkM/owd2tex9F8gDnv6y3kXBeYajeWNPTTrffukdtXDb1+Yitv4Y5FYjjl4xEdGnlwk+A5NdTVNE1TkbLQyEajp3zfP0bbHXmdp4wtfYHZD4E2kjYfb0kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8osvVTn1w0Cm+LkuvWVVQsC72ZVN/rrtkmRxNfYCsw=;
 b=k5A6jOI081nX1G8RQ4VgpVxJT+yU6dDnbMXWI36e4VQNKYp+HL4vS42auG+LHkwKr/Gc7xJciS+suea9rs2qO0G4yc86G9j+3OiVI4vEG7Rv/UjRXQ7L82E2xdilaiiSOi7dVd37ZavzJCgMRezO4Tr2t9YYaVu7fsG9y+ROtqpIQClFRvjTiRhfRxkhtxTQibB7q9oiF6zaV7uGJHRwxebY4niELvr7WAslyLw2sOqHRjKOLQGGN9ebNyS6VT823nYlABIoIgO3z9cJVFd3hHHNV0eSZlNWEidrdiX9TgM2dMU3NncgnUYhhJoV8mij43lOXXjhOMW2dey7WHPrng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8osvVTn1w0Cm+LkuvWVVQsC72ZVN/rrtkmRxNfYCsw=;
 b=HtePuUf836HRCcB3M1PdYAj9Zqd5tR1we/QlQ6DlaJ9h2A58/BLx+8INzvuZQn1aiJohc7JuoFUFwFLqJvpjHH+vByl8/YvNDyOb9rr99kkyvZ81mTeLI37JvyUuOgkh/Uzl9/YVZpxx41keVk/rA515XFThI+KtBxLis2BgfGcDDWTKr51e3kQeQyRpJrjzh/bgSwXRUJIXcE3fXayP+yhkzZWS1mk/6E33u+WYNr4iEnA7pIVU0ULWMhLVvNJb/Mdsj7ynsfgTjmdcxXRcEHixZWJ9IZDnZPeWqn4KZDtXEtyogwlXCIK4ws0l68gofLuXNiXKNeqEN+dyjRCsKQ==
Received: from BN0PR04CA0174.namprd04.prod.outlook.com (2603:10b6:408:eb::29)
 by IA1PR12MB6138.namprd12.prod.outlook.com (2603:10b6:208:3ea::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 21:39:59 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::67) by BN0PR04CA0174.outlook.office365.com
 (2603:10b6:408:eb::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 21:39:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 21:39:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:32 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:30 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	<driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
	<nova-gpu@lists.linux.dev>, Gary Guo <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v4 7/7] gpu: nova-core: update firmware module info for TLV images
Date: Thu, 9 Jul 2026 16:39:15 -0500
Message-ID: <20260709213915.520109-8-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709213915.520109-1-ttabi@nvidia.com>
References: <20260709213915.520109-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|IA1PR12MB6138:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b447952-bcb1-4201-b0ad-08dede02a02a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|11063799006|22082099003|56012099006|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	si0qQ8FttCpFmGaMN03E1MlAN26lMd9iTL+dsg02f1ZsvU5mlf4OveIp1e3hp9mnV4jTbHVdOBcoXfbFa4XnMit04sgXfsmg2wjjvKaeWzdC2iBV1F1ZuJy3OR0EnYUx+dZNf0jY4q0yEkr8QUFwSHPYcyeW979QVi7UaXRwg7kPGCbGW+w2yWZ5oAU92QkEm1Jmi/Hfu0Wlb+R4ImEGCrVug3HpdaA/mL6f6z5lNQSSpFHEiR9LN3Cz48l0jtApn7td43XNC8aXyJbr3tpORqqINJfQ2EAy05RMgAbpSPtVlGcqbCKoFlNQIsVGxUGy/lqY4PhY9AnONsBk/LRq4jDE5F0o/ZD+GPiyUp4dq08CtpBS43C8BkkxWTYt3otvd5NfwDP3TiWfxwHKuWFXSBQzVIZQW0B1KtRCMcJRBFw/rV6fWLUuHD3Um9wsk84SmuU0iK5pE+axgyKcqvE9U0J29zegKv66ra+rhlPCi+btQmshoqQVx95SYn2MFHCj5ott4MfM2np6wu5q9G6XUYl8AmRz6zK6nPjGGjtkFJzKDU9TOlXord5QH8Q/Zshp1LCvQBhZMZ89zAnlQELhaEQGUKDE9bi20v3FTEKA4c7+DA66KGi09ldap9j3mW2yNPDyt/VJXZJ1g2X17jy/WsjjGtmP0kXIncTd2KpKIU84KS0zTNIl4Zj55PSALX4SKbxbRLbCY2VBsRxMSe4Ut1hPcAyJBAUqSoFRvO8Wq4w458OlQG4vO3W96mBp/UBj
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(11063799006)(22082099003)(56012099006)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Vz2Z6AvyCj87yHGmlnuQ5qyzjN9OYkXv/NBMimoxT3ijEFOzSDAO+SRtaf50z0gQZ2M7bzmhUrEqK1fpmcOc+Dz/Nfqknzs285xLE2V9GN1LMvxivJjhCFgPuWfEbjwajYQ2br8rGMx7oUWMzo3G6Cf2LnAtjAYXXH+Ose8LFMWGS0V38eyZgHF3HgvAk404bvnZY9ZXHySS/HGETZc4PmWppcYeIZkSLgf7rSAokwA+9I3DIPhe6J+HvfEPmkwK5teHjqGH7oGYNEMpu1H0W+0DKSfla5vZhNPgmstrGIAtEFMiJuHQEiVnQOqWzXt26T9G07xGeIoq7SffhRL/E/CVX0WxdJ8ccULxIkbzjCIqjIkc4gE6HhzLjNKV8kC8BZ63HJ+ML16+SXyP/Yzo6QjMt4/f0/g2J+o6zs/j7eYUiWixryX5jugv4ZciF4Uc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:39:58.9108
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b447952-bcb1-4201-b0ad-08dede02a02a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6138

Now that nova-core loads the TLV firmware images, update the firmware
module info to specify those files.

Also remove FIRMWARE_VERSION as it is no longer used.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4ea9eef46354..2969f5a9f114 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -29,8 +29,6 @@
 pub(crate) mod riscv;
 pub(crate) mod tlv;
 
-pub(crate) const FIRMWARE_VERSION: &str = "570.144";
-
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone, FromBytes)]
@@ -338,10 +336,7 @@ const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
                 .push("nvidia/")
                 .push(chipset)
                 .push("/gsp/")
-                .push(fw)
-                .push("-")
-                .push(FIRMWARE_VERSION)
-                .push(".bin"),
+                .push(fw),
         )
     }
 
@@ -349,20 +344,21 @@ const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
         let name = chipset.name();
 
         let this = self
-            .make_entry_file(name, "bootloader")
-            .make_entry_file(name, "gsp");
+            .make_entry_file(name, "gsp_bootloader.tlv")
+            .make_entry_file(name, "gsp.tlv")
+            .make_entry_file(name, "gsp.bin");
 
         // FSP-based chipsets (Hopper, Blackwell and later) boot the GSP via the FMC image loaded by
         // FSP. Older chipsets use the SEC2 booter instead.
         let this = if chipset.uses_fsp() {
-            this.make_entry_file(name, "fmc")
+            this.make_entry_file(name, "fmc.tlv")
         } else {
-            this.make_entry_file(name, "booter_load")
-                .make_entry_file(name, "booter_unload")
+            this.make_entry_file(name, "booter_load.tlv")
+                .make_entry_file(name, "booter_unload.tlv")
         };
 
         if chipset.needs_fwsec_bootloader() {
-            this.make_entry_file(name, "gen_bootloader")
+            this.make_entry_file(name, "gen_bootloader.tlv")
         } else {
             this
         }
-- 
2.54.0

