Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 088F538837B;
	Fri, 31 Jul 2026 20:11:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528664; cv=fail; b=BqsN3mfZB0GZJIWm5X78axjd2KJLIGQxl18jmk/jO3RT3o1iIuw97GLu4jCJHM5TY7p04WI8jqlGfqQ6z++wEWbLdo6q0rUBSIo0IF8We7vFxu66HiH+8r5jRtH1DtdO6OOGErJItpw6x77kI4VM1VvcyAs8mr+EWUpcEQtvQug=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528664; c=relaxed/simple;
	bh=KQty2OembYnKx1yIkt3Go721I2vYoQy+KpvdIBg9vXE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=t8amuKX+XyCQiPH/Vojixjed6NRrJmTNovjOsV9v1eJ5F+1POVTteWhNVzQzF/Eo2lQY1cYHUtpgtaMGbgej40f01WpyO+samoHjZQEXcTzVdBRF+iiKurVJKmPdsIgz5NZb8wqkS8lnlZb+jaz2ysCDbmF8ACsYnESh9+wEXt0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=H2ATQn8g; arc=fail smtp.client-ip=52.101.56.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="H2ATQn8g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=csKVugnDkY0bB3QEreMsXyD1/p12Pvg453sf0kjnNhcOyWixNEOu4IUYhKoDyiR9UElEVTjgR+nx6QfMO9ijQHkFh9EjD4QkRuDQNVCj+aW9YUsg1Mzun/vgITacr9RA3MBwA4JWd36kHKYPDng08squpFqe/2FsP+olUD1w5BwrhmZhkTQrwJJ+MkH0gX3Bv3Bgw34QVUtPi6gGcm/WkI+NSZTeVtSbD9GgTAKC+RfOCKan27+mA4JM3Ydbl4z+SMjRJNfELBY5Lflh9hLgTqC8MQ1ynYsxoMu9Avq+mBqn6WNQ8s3VSVRoewBIfrMQNRLodZNTncgxoxKKRvkGGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMDGvci/QVJqeV/4l4km77juhH8rcfhYskyFFhbfIA4=;
 b=BK3bIlEvRpihN9V6iB77ZvQR3aiqitOPvk6FxuOGSUe7zg1RydNgbeCwHpX8uH4qe7bUQR3L7oN707IIJItDdn0q49J+sZxLz3ANKYK6f3ZgDEOzbqhQwPmE/FB5f2sgmv1Qpj6g+qAULpvqQDqvcZgRfOf5MfN6P6N/siTAtYv+yNoOMMCOchutVZcyftALvKyoVoAcuhYZ+eaKdRW6ASR137DpaBEqloyKDhjKWfVbpt3Rq/sZAN3Dqybu+goaZJfO++dgQ9jcGLJr0obiRu6/vanv59A6aSSzLwqxxQB5Gb8uFiiFbODclNsgiDQCkgq2+bqsCugaIzbEPlGXkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMDGvci/QVJqeV/4l4km77juhH8rcfhYskyFFhbfIA4=;
 b=H2ATQn8gQgPszBwNiAbQo9Ax2kX2a9HRf8k/bdhhxSTJ/K7ngrQJCDVgai5xszhJIPROnb29MOccnq6Quc2w24NefgpoDvo39/XXYsNz4xLsHL7pZGqHxy1PReW6gaSoYKy0XiNl4qYOeX4kjW+1gjHA67llCnA6BHu0IYmuB0XGcY9iCOF76suH3mskjeiaaeosyUnve6V30OMLcD8nL5x+92wHDab1J57iArpdndX3j6zycrkXepar1YRiruFXbQXQS2r4RhybYDRNDSaS7MH8mLg+OzQw0OcI3X092F9vtz7oJOh2w5/RXqBGWjD7EPKni0Kfd/fFGpCCDkdMLg==
Received: from BN9PR03CA0796.namprd03.prod.outlook.com (2603:10b6:408:13f::21)
 by PH7PR12MB8796.namprd12.prod.outlook.com (2603:10b6:510:272::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 20:10:56 +0000
Received: from BN2PEPF000055DA.namprd21.prod.outlook.com
 (2603:10b6:408:13f:cafe::79) by BN9PR03CA0796.outlook.office365.com
 (2603:10b6:408:13f::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 20:10:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055DA.mail.protection.outlook.com (10.167.245.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Fri, 31 Jul 2026 20:10:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 31 Jul
 2026 13:10:36 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:34 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v7 8/8] gpu: nova-core: update firmware module info for TLV images
Date: Fri, 31 Jul 2026 15:10:17 -0500
Message-ID: <20260731201017.2580713-9-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731201017.2580713-1-ttabi@nvidia.com>
References: <20260731201017.2580713-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DA:EE_|PH7PR12MB8796:EE_
X-MS-Office365-Filtering-Correlation-Id: aae2e1ce-d6aa-4111-9505-08deef3fd47d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|36860700016|23010399003|11063799006|56012099006|10067099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	+TOQzVIhEuHRC+STyEK06xK8XZOn6SeDU08mM3Kl2pBaTIkI64YR7LB//ZHfUd43eBZhRTIxcXGgbsohRHKRzysX6nrUg2ZxvS5r/F7yFmggeJyK/z6LYt1byJ7ZX4EE53yXur/HGTWXb3rqd3sNuD3web9MjSUgcdg6DH2RWEAqyOtZ81j7Ttt7adjG9hrNz6KtkMeSZ+6aB20oCdqJYe964pIZRNemZxAxT22GpUXPFfbXVgNLa+19hVycVpbIp8xUX1X2cVarIHhqIHk9dcUsJV5IFisAOK7Ue4lbjDv/kKDw0kuz+MWLD9q4xIo3Jk5NpOAbXIMDL9dlvsia6XufWOYPRA4Cn3+FqJNf+Zb17GcjudM5dX2YJGzOpDcKN+w41/7PTrgAxn+r/8QL170+kPTsJxTze/ljZw7+c8WepSWCI/JtdXDD5wTircVflXlcR3BW7IesEveXWogjRKYfjrtH2kyqFkXby6j6wX5agw1zcNf7u8O6M7NhzeTVHJc4tXkPDvayByQxoL0gdw3eCXipioq3iy8dCDPcR6rkPO+p2NNQhFu2pKby60/HfG4V+/CYSLBr/nuNVAt69xRzkmSJQ0qQbxZRO5b7g2zI+mfyJ+u0p5JfXxJZMlwyzMOdaA4M7VASvwGWXNrypTp+scCOw2K32bsWl8YDJRcENdKzucDsd3UnSLNzeh9xTQs8qM4So54Bw+bhTS8bNA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(36860700016)(23010399003)(11063799006)(56012099006)(10067099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	kH1LZBXpuRyJWy5oEIDta9CJil7ZeTdcc872QGqNopCC/ViLC+jQdmh+W3Fg8Imx31zulbipGONJo279UWi1h91AHQztJB9QIQpdp0WAcRKkdta+Ug9+sROqIEIhx5YOEKhFyWQIuZ4nR7s3GJv19MAUNwmDQGfGqzprDS4JJnDZEamfhAAy7Oh6z3HQDG7OYkkswcGaNdCDHj7FhHKpS6k6aqmyNZyCSytJTlsgMQPxanUeHtAifvjm/A3XSOj2pauYHfdLjh/Eq3uUxM8DA+Se8wPE6HHXthgZnyhpOYiw5KIB6EA00hlHzq6/ykCXySRlmy5Ev4aD1kN3WSqxaeaqgQFiI7zxzTmTcVHbE5ja0ZhFAwVXvEf6d4p9pcu/O/oBgIemoorWdotUJf82ULkUG4GccMjEFO7hJKeCnBfDSuZ6IENwlBmEvoInNmeo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 20:10:55.8367
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aae2e1ce-d6aa-4111-9505-08deef3fd47d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8796

Now that nova-core loads the TLV firmware images, update the firmware
module info to specify those files.

Also remove FIRMWARE_VERSION as it is no longer used.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 12 ++++--------
 drivers/gpu/nova-core/gsp/hal.rs  |  8 ++++----
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index d58a3d5770d5..b49613a90bf0 100644
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
 
@@ -350,8 +345,9 @@ const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
 
         // GSP firmware files are always present.
         let mut this = self
-            .make_entry_file(name, "bootloader")
-            .make_entry_file(name, "gsp");
+            .make_entry_file(name, "gsp_bootloader.tlv")
+            .make_entry_file(name, "gsp.tlv")
+            .make_entry_file(name, "gsp.bin");
 
         // Add the firmware files specific to the GSP boot method of `chipset`.
         let boot_files = boot_firmware_files(chipset);
diff --git a/drivers/gpu/nova-core/gsp/hal.rs b/drivers/gpu/nova-core/gsp/hal.rs
index 34b4bb82a999..2177ea17dee6 100644
--- a/drivers/gpu/nova-core/gsp/hal.rs
+++ b/drivers/gpu/nova-core/gsp/hal.rs
@@ -67,16 +67,16 @@ fn post_boot(
 pub(crate) const fn boot_firmware_files(chipset: Chipset) -> &'static [&'static str] {
     match chipset.arch() {
         // Turing chipsets boot the GSP via the SEC2 Booter, and require the FWSEC bootloader.
-        Architecture::Turing => &["booter_load", "booter_unload", "gen_bootloader"],
+        Architecture::Turing => &["booter_load.tlv", "booter_unload.tlv", "gen_bootloader.tlv"],
         // GA100 also requires the FWSEC bootloader.
         Architecture::Ampere if matches!(chipset, Chipset::GA100) => {
-            &["booter_load", "booter_unload", "gen_bootloader"]
+            &["booter_load.tlv", "booter_unload.tlv", "gen_bootloader.tlv"]
         }
         // Other Ampere chipsets, as well as Ada chipsets, run FWSEC directly.
-        Architecture::Ampere | Architecture::Ada => &["booter_load", "booter_unload"],
+        Architecture::Ampere | Architecture::Ada => &["booter_load.tlv", "booter_unload.tlv"],
         // Hopper and later chipsets boot the GSP via the FMC image loaded by FSP.
         Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
-            &["fmc"]
+            &["fmc.tlv"]
         }
     }
 }
-- 
2.54.0

