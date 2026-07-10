Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1FDA2C3257;
	Fri, 10 Jul 2026 23:05:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724713; cv=fail; b=kcnSpKOHqlmDjiaotN3jlLiXXWl/Yermr0YGI4Y4j9mlrZTqG6W/mfsacE9xc8CH8+SfBS657Ee9z9scLrg7Bu+tLXb9jK/BGOQzIK2O2jlLgi1oHfM4U6qjKTreRb77b96vgNAf3bpjWmOPTE7usXnDCmfUMBMnpD17sn3sYSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724713; c=relaxed/simple;
	bh=xZAGhq3HEmRq4IgefT0/cgAg8KOhEF9257ZDsK2O5MA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=udpQouRT9OyRjM1BvCDZtjRGJ15pMtFkF5MI1SYxzxdK4DaASR2JWYHUNFIWKfwDMD8dDH49bmTIuOPzjHWNMZyIfxXHcBQV3ay/kCSY3RGh7rKBOXzSfsxf52FZ5Xt6iWlCjhK6dRVY9EPYvOrWuAR9LsxUJOdQj9t9rWWaoe0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S7lvqARn; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S7lvqARn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vIbDViKOyHTf5cWbpzP4AnOSGKOAnI7ZeMbwyJQmRgJtqzmOtkjQ/B6JNTCpqSIytGay1CJES6OCtsQEVSiUwQWyLXKScWiyAvajkKmrS7s/XJEuqOB4td14GObfQf9cEuGlHlml2dz8rlJvHnG262Ynzugp1geAvZWIW2zvqWTckY2yY3RQBQjCJvzQPg1cqSFrfmDoq9uhs9leXsDGOqOwgxIFZZnD8CHsfXRE8bftYW/Tw5xSLApYowWlEWMVyYGA3dr6Fe0XoCdEi0aV/5kjOCN2wLghcxcCegFfc6v3lvzTAmZ4hmnrzHycRHv41o2GPBBsCWLIITb5qJVkQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awbkIX6DIkbwJzw2MCmv8SAEL/EGypIs3zJ//xAeywI=;
 b=MAQkN2Mnv+lpgaJZQAQOVuUEIgcCvI333OvixJqGvnFjR6NPPeGfHlQM2ZXXR8MycWYmaCImhQo0kR9T57m/NcK3kDsvPVxqANgs6Od9AzMWmztf4knVyXItt3Dts0Nv33MYWmT/Z0hbI0aLX06P2OdJ5pqRrKd10xnJxcXjI7faQpIKWGmAKlWUgfQpXKfnizu3F4KF/Ki9UJkJndkeHojQWpDiHqLaAdSxvi1tJusDOXjxH76qExZjXapXHIjz4goezPh6VieST3wqvkXr1XnLSbKSz8d/R6BvtvCTlccW4sK/8rbsY8nqwCIcrK5XdzeqxVveiN/74BifxfwZ1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awbkIX6DIkbwJzw2MCmv8SAEL/EGypIs3zJ//xAeywI=;
 b=S7lvqARnJkVAMB8pszuRdMxLlIMY/ZtcPGwJ3FK7X4YBC1odjYuXThOYGV0li4cgM5j+968XdIYY7v60CZZCZDd+8TcVJIFAehS5FdwnWum6a2d93nyOuroNz/m0X/x3zcQ6m/d4O2C0Js21Y+k64qAj5G/nR0yDs2MK8hHyJqganKd4FtR9DV/SY9LbXWFRzcnsA0ZgJAkNazgMHG5iYX2IkC0hhKcDx0oNYBTe2dKGwQQPjS8DR176PwS7Uwtxm+TL3AEhgbvfVvHUbG5vH7SfksemA7wq+PuX3GQJLknbHZxSKanRsZyx1dRBPWXPJ11bj+Xine6oL4d09Cm+7w==
Received: from BN0PR07CA0015.namprd07.prod.outlook.com (2603:10b6:408:141::30)
 by CH3PR12MB9080.namprd12.prod.outlook.com (2603:10b6:610:1a7::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Fri, 10 Jul
 2026 23:05:06 +0000
Received: from BN1PEPF00006000.namprd05.prod.outlook.com
 (2603:10b6:408:141:cafe::a6) by BN0PR07CA0015.outlook.office365.com
 (2603:10b6:408:141::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 23:05:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00006000.mail.protection.outlook.com (10.167.243.232) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 23:05:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:51 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:49 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	<rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>, Gary Guo
	<gary@garyguo.net>, <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v5 6/8] gpu: nova-core: transition gen_bootloader to TLV images
Date: Fri, 10 Jul 2026 18:04:26 -0500
Message-ID: <20260710230428.865447-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710230428.865447-1-ttabi@nvidia.com>
References: <20260710230428.865447-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006000:EE_|CH3PR12MB9080:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d38691f-9b6a-42e4-824d-08deded7ae8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|82310400026|1800799024|376014|18002099003|56012099006|11063799006|22082099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info:
	YHN54i5+mwuRFPy6HmWCH2pEtvqdllW2AMHBVlD59GBUUHha5Bf6C0LPHmzPj8NYx7XK7xoSSaB7GyeHrs31hCIeBuX6wIcNrY4owrtwrdLo/CzsHZlLqNcW6cto4s8TD1dTM+Q0rt5MgphTq6bY5PE1MjQQjj9fsFd1UOTY8aQPJAZR2xCs3bxEZzejChVCnxnT9UQ6t8kSjkYlRfQH2/ugWmCfj78ig41Zv2W2Uno/dafZtRZ8fY5HjyDGDdtW+91UnqCAmuzcqWiGwc4+2Ags3pwKTyzvqSr9gOaeRKg/rJST307LC1qWmUbqWDsdfpSt5q5ZWJ1fFbX4aBMr6804RNq4j9DOsyFCqdhk+Vj2cB+rxQArvkaoDOf43MqbzSEseaCbnXsq/XwMOmgfMBeIgl/Jes3meRPOYTgXCi9ADXC50ZhRYsAt/J58v8JjvD9XIr37hmYlJhPTrJDxX5Kz6zl+HBXh7WYmoZnfujcAJNQUpgbZs/aILI3riZYNRJQglJ8Aa0ptzEQHFhVrHb/qkTBL32TbO+yVUrf27TFWA+p/j7q0P/BhUG7dFT3Ds7bGSBoUJp3Ym5H63gCLSmyJDwGKyapCLRcpyDhSogbPwHIbHylaT9I2QkCDa4xsuumnMgtVe86LxB1wLxnqpQyfvu3wAqiIVOpfc7Iy3KM69zYx2PYXsPuAZuXbryo4FVIYAwwU6kr85i26CxSPRT2qFa0F5XJzSzVWoXIvsNhfDhSxVzKADLZ67M+Rp71D
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(82310400026)(1800799024)(376014)(18002099003)(56012099006)(11063799006)(22082099003)(6133799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hJ9w2t1nWHNEhSuvH3OV4zN0YTdGdvaghRRZ4Az+NfDdZezK1YQ2R/scf2eLn3rnb1bhC/fo/OAKcJEqhGfFgHPcGXGJJ5OCunLqviPsfvEF3OhREdQ5ih/SuQsUEtZngLc1Oa9WYuHJef7bW3zHwIsVPMsLYEQSyVNPcklJm4hkOtRNAop/6OJWn47aqBOHHvaJ/VvsEvFGfpNF2XrWUgfRBEaIr8mGV7PAoT2DLkiPFVYJ4FyEL50bjYtnluntpVvG77iZBa9LbMaBTBjRRMfsA1TB85gJFP9WbkknlRyiPjT5NH9ODt60DKPpc/fhq8ZBK/8XOYWc0wMMs4Z5geIWN9TwiRwiuxwV+qc0k6dyy5Eg7QnfUqWkokanLp0UteYJ4nt8XekiF9rStvXGRh+KsXTMeu/uWwTG5KDIcWGl0Ok709cg+vcuYxC93XUG
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 23:05:05.8977
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d38691f-9b6a-42e4-824d-08deded7ae8b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006000.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9080

Switch the generic bootloader firmware loader from the legacy binary
format to the TLV format.  This change requires the new TLV versions
of the r570.144 firmware images.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs             | 24 +-----
 .../nova-core/firmware/fwsec/bootloader.rs    | 74 +++++--------------
 2 files changed, 19 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 06b74d82d698..4b41368a6b2f 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -11,8 +11,7 @@
     device,
     firmware,
     prelude::*,
-    str::CString,
-    transmute::FromBytes, //
+    str::CString, //
 };
 
 use crate::{
@@ -343,27 +342,6 @@ fn no_patch_signature(self) -> FirmwareObject<F, Signed> {
     }
 }
 
-/// Header common to most firmware files.
-#[repr(C)]
-#[derive(Debug, Clone)]
-struct BinHdr {
-    /// Magic number, must be `0x10de`.
-    bin_magic: u32,
-    /// Version of the header.
-    bin_ver: u32,
-    /// Size in bytes of the binary (to be ignored).
-    bin_size: u32,
-    /// Offset of the start of the application-specific header.
-    header_offset: u32,
-    /// Offset of the start of the data payload.
-    data_offset: u32,
-    /// Size in bytes of the data payload.
-    data_size: u32,
-}
-
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for BinHdr {}
-
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {
diff --git a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
index d9fafd2eea5b..5b130c2897c8 100644
--- a/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec/bootloader.rs
@@ -19,10 +19,7 @@
         Alignment, //
     },
     sizes,
-    transmute::{
-        AsBytes,
-        FromBytes, //
-    },
+    transmute::AsBytes,
 };
 
 use crate::{
@@ -42,38 +39,16 @@
     },
     firmware::{
         fwsec::FwsecFirmware,
-        request_firmware,
-        BinHdr,
-        FIRMWARE_VERSION, //
+        tlv::{
+            request_tlv, //
+            Tlv,
+        },
     },
     gpu::Chipset,
     num::FromSafeCast, //
     regs,
 };
 
-/// Descriptor used by RM to figure out the requirements of the boot loader.
-///
-/// Most of its fields appear to be legacy and carry incorrect values, so they are left unused.
-#[repr(C)]
-#[derive(Debug, Clone)]
-struct BootloaderDesc {
-    /// Starting tag of bootloader.
-    start_tag: u32,
-    /// DMEM load offset - unused here as we always load at offset `0`.
-    _dmem_load_off: u32,
-    /// Offset of code section in the image. Unused as there is only one section in the bootloader
-    /// binary.
-    _code_off: u32,
-    /// Size of code section in the image.
-    code_size: u32,
-    /// Offset of data section in the image. Unused as we build the data section ourselves.
-    _data_off: u32,
-    /// Size of data section in the image. Unused as we build the data section ourselves.
-    _data_size: u32,
-}
-// SAFETY: any byte sequence is valid for this struct.
-unsafe impl FromBytes for BootloaderDesc {}
-
 /// Structure used by the boot-loader to load the rest of the code.
 ///
 /// This has to be filled by the GPU driver and copied into DMEM at offset
@@ -146,38 +121,23 @@ pub(crate) fn new(
         dev: &Device<device::Bound>,
         chipset: Chipset,
     ) -> Result<Self> {
-        let fw = request_firmware(dev, chipset, "gen_bootloader", FIRMWARE_VERSION)?;
-        let hdr = fw
-            .data()
-            .get(0..size_of::<BinHdr>())
-            .and_then(BinHdr::from_bytes_copy)
-            .ok_or(EINVAL)?;
-
-        let desc = {
-            let desc_offset = usize::from_safe_cast(hdr.header_offset);
-
-            fw.data()
-                .get(desc_offset..)
-                .and_then(BootloaderDesc::from_bytes_copy_prefix)
-                .ok_or(EINVAL)?
-                .0
-        };
+        let fw = request_tlv(dev, chipset, "gen_bootloader")?;
+        let tlv = Tlv::new(fw.data())?;
+        dev_dbg!(
+            dev,
+            "loaded generic bootloader firmware v{}\n",
+            tlv.get_string(b"VERS")?
+        );
 
         let ucode = {
-            let ucode_start = usize::from_safe_cast(hdr.data_offset);
-            let code_size = usize::from_safe_cast(desc.code_size);
-            // Align to falcon block size (256 bytes).
+            let blob = tlv.get_bytes(b"BLOB")?;
+            let code_size = usize::from_safe_cast(tlv.get_u32(b"CDSZ")?);
             let aligned_code_size = code_size
                 .align_up(Alignment::new::<{ falcon::MEM_BLOCK_ALIGNMENT }>())
                 .ok_or(EINVAL)?;
 
             let mut ucode = KVec::with_capacity(aligned_code_size, GFP_KERNEL)?;
-            ucode.extend_from_slice(
-                fw.data()
-                    .get(ucode_start..ucode_start + code_size)
-                    .ok_or(EINVAL)?,
-                GFP_KERNEL,
-            )?;
+            ucode.extend_from_slice(blob.get(..code_size).ok_or(EINVAL)?, GFP_KERNEL)?;
             ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
 
             ucode
@@ -258,13 +218,15 @@ pub(crate) fn new(
             .checked_sub(ucode.len())
             .ok_or(EOVERFLOW)?;
 
+        let start_tag = u16::try_from(tlv.get_u32(b"STRT")?)?;
+
         Ok(Self {
             _firmware_dma: firmware_dma,
             ucode,
             dmem_desc,
             brom_params: firmware.brom_params(),
             imem_dst_start: u16::try_from(imem_dst_start)?,
-            start_tag: u16::try_from(desc.start_tag)?,
+            start_tag,
         })
     }
 
-- 
2.54.0

