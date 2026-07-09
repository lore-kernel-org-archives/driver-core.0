Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011015.outbound.protection.outlook.com [52.101.52.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3723C5DBE;
	Thu,  9 Jul 2026 21:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633208; cv=fail; b=hqx4P9T/Ex7UPLUHwux332bOymGXo+41HuXPRLaTVOIWdN2vrzH1ciGGi4IWL4dUpDN9ltYt2znRnxKHNniJKeA0f7Q4fWx1g4W4soHSl4OQJe0DNtM684Cl7LV2pRE+Cp1kf0Wz/4+udWAns85Cdkgc807cSqu6Jdfct1GrkCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633208; c=relaxed/simple;
	bh=YDQXB8dpd8Y9H0vFBmtbKNH9E76uEcpbBA0RYAs1t7k=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=V+Wz5sZW/DOw8A6TGlxcLswWVpYY4norFK3N+ATex6+CcKMmcqVtAmGfqdv/n8fjy946x/T1xskAQ/BNk/+FcB/gEV+DtlYRs9sMKXXAg5SL47cFR4FPXhuO04RHtWcPzUIXlSPjtcDlWpg7atyQWLxRlJGKnRHA1XE2c9fyOQc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LqSolouI; arc=fail smtp.client-ip=52.101.52.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LqSolouI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FjZ0D1eby7tsNg1oVHUe8tPZjs7x3R3gLGIcubIcMrbCneGHEmniiSmrq9RX0mLRIwLf58PkNB7zoRhjQOOAtlLugnxjKOIcfohQq+uixo/+M45CADsgnH7VJXlddzsY5Q+Ljkwk5XDP6hMw1sUNkloLK6LxOtW7mgQHyDgPl1L0lU6/H0jfVmLYl7h4s/JB8r5AksTcHU4XSPw3OIrQsNysDiIahWdPu0OTniEzvaK6+biPotmjv84xkkI7QduoMRh9C1L6LWOfbk8ycNbJDYmJBPSoEvMF3/XIjziTiW6Y9eJFc22y/XPNfOdXYi+DPqcY6oBSYw5tOIlhlizXTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jcGNUS0YQZTjz1BZzsIMDnV1di9L5Ai+X8vIn2X38iE=;
 b=HRc4Eqi1D9KvG/HTiNCg/snWyK/RjNH0MSoRIprb+BcxEhU79D24D2Pjmde6eEipWEZQFox1qTQnHY67WobQeyBA2X0BShooml6Tm9u+ds+mqkrM35dNK9sEGAVX2ZNW9vXctWGFWNT4HM/KBTO48mBP+MEVQSrU5FQRRkGLTBGnmYno517VZzdmmSAc6Wav1ZtL3dEPMx3mhLa1c1xElRGa3rbg0NByHQw1a3Rn8cxEOlRRBluonYwIghyfOdhBHlWqhTM83uDFUyo6yJdWJvbpE7CsiGrzszPVTxEIKxwISs7vQe/CeMM8Z8BtTNaKz8mUpTCfeE4jLUh3/m/cAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jcGNUS0YQZTjz1BZzsIMDnV1di9L5Ai+X8vIn2X38iE=;
 b=LqSolouIGbGQdnnniaV2Yivy39eaidT9DTvNUEzBIiVSqeGqcU7cUm7zpr/2hNNvPMqEkJPFul6/roD0vfhFNkq3UU6WQgxGXLsAKeL5Aurpn7rsABr7m3gS+F9ghNBJL/I14nAmzqQDnybAIJUvcwv4aidcGDMYXJyEAqjjfGkO5YS3gn7tuX8h7uK9iIBZ0zQcjTxfANLApMvbb16NOXCtp4ws+PvBOZ8juLk+tkUbwX24CI9sambDKvKP3VFaJPM3BHIjXIYEbm8piYu471SaDIP/MTXu2dqDA+qMvbl2zdedMIbIN6wU1pgA0Y5yskper+3T96s9/TmwZRFbYA==
Received: from BN9PR03CA0981.namprd03.prod.outlook.com (2603:10b6:408:109::26)
 by PH7PR12MB6417.namprd12.prod.outlook.com (2603:10b6:510:1ff::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 9 Jul 2026
 21:39:56 +0000
Received: from BN2PEPF000044A0.namprd02.prod.outlook.com
 (2603:10b6:408:109:cafe::5e) by BN9PR03CA0981.outlook.office365.com
 (2603:10b6:408:109::26) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.10 via Frontend Transport; Thu, 9
 Jul 2026 21:39:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A0.mail.protection.outlook.com (10.167.243.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 21:39:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:28 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:27 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	<driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
	<nova-gpu@lists.linux.dev>, Gary Guo <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v4 4/7] gpu: nova-core: transition gsp to TLV images
Date: Thu, 9 Jul 2026 16:39:12 -0500
Message-ID: <20260709213915.520109-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A0:EE_|PH7PR12MB6417:EE_
X-MS-Office365-Filtering-Correlation-Id: 926afbbb-8af2-42df-37a2-08dede029ea5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|1800799024|23010399003|82310400026|921020|22082099003|11063799006|56012099006|3023799007|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	Kdp9T9oCYuElGu9OsX2wX9nqP/QA/KRtrnUjtDsOBMyyi+IRNZykkvCwzl4wYu4bb2audiV6IA3BYrgqSQuAByaqLa/lmI7P3y5bB+p48CwnEyIcwfl+DYv6GwtcsKjKVO7vW6bnoLiUM8RJaceNsYiJ31iYfl9Ihv8lGcJxxmLkPf8yb/5v5yW6XIurtSEztloFu9uxTQvg+QEE/jVUKt8C7QYkUe7g6Cp5ithryZbzJ+FYEca4KhfXeSpqYtyVvJ7s/c/5hk5zzKt4HQpO2ZBDuxgSGdo9WWe4jwgG1+JUP7kmsURtQjqT5EpwCANctZKRaFbicW9UZw8WNhub88P8+OzwQSRjnY2VyyEOGjIlPvx7OXLIV/JrmuY/Mw5u34gF7XyjCMDAcIpWSwAISTYcUw9W6nUK3nn31oI3g3OFCqPmyV+/wDGjjwGe+GpeBbW1kg7VfTeSFcLi0FZtPtF+M8QvqO0H5EYe63xC8VO0He3FjJaCq1ebn2uLZ1lorB6nGYVDOFDKV+7wUv8F4IqFW2Lq76641Jryy1I3yXo/Y67usl+f+VEMS8+1QoSiYed7MUUMWy8XTDiSV3wmj9yLsagg6OMOh5+aSCWlM3a8p8xv4H0/uGtESgj1b7c50QZ9KAqTyE24AmErhiCti+NWfWlCSZ2aj1qGKeFphRXCLGeZnXMpUZb8r5YAZoGOz/z1N47+gaHH4MSU8HEwl8cKicJCS8U0DYRIfdJx/1RSfTM1A4x8u/89LB5mCrCg
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(1800799024)(23010399003)(82310400026)(921020)(22082099003)(11063799006)(56012099006)(3023799007)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	JtfUZoOyRMXxi2AdBZHvJveVUpyZl2LzHgz7ImlDrR8cpC5uUE3qRmkmje26urkif6wlorMtAU08jwKZfZe+/Y1J6Hopgk7sR8RrrIGifaeGm+/RwHozmoskII1V6NY/ozPPfdwM3bTQ3k9r5+ZHzkrdGFWNDfB/CaQ4qI+Zy93Pv/Mp+JU4Dqj9TXHCKkfePrEssKMrwcYNUuPeKLgrlCh3r1pDns1IDfMSaFTSENb8bJYDMmeBN1lfen3+dxBxT2Pm5FHynk0PDFGbdke+TAUOD27qPfizLevK/MuQNP3PqfOJvJWXhSx1I+B4qNtniGZyB6sY0FHuzTywaqC5ekLkymUSrub1n9D7XF0IqVONqL2SZfxzR/9qFfdmq+JIwJAbrX6eTTrHTDRo+UpcIIC6pNI0o+aEz9162hg5VAhaLh4iS6IsUoBkKbdxeRC7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:39:56.4163
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 926afbbb-8af2-42df-37a2-08dede029ea5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A0.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6417

Switch the GSP firmware loader from the legacy binary format to the
TLV format.  This change requires the new TLV versions of the r570.144
firmware images.

Unlike the other TLV firmware images, gsp.tlv contains a pointer to
the actual GSP firmware file instead of its contents.  This allows
each small gsp.tlv file to contain the distinct metadata for each GPU
while still allowing the very large gsp.bin to be shared by all
GPUs.

One key piece of metadata is the signature.  The legacy GSP firmware
image is an ELF file that contains multiple sections that needed
to be parsed, and the driver needed to determine which section is
relevant for the GPU.  Instead, gsp.tlv contains the pre-processed
metadata, so all the driver needs to do is to extract it.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       | 23 --------
 drivers/gpu/nova-core/firmware/gsp.rs   | 59 +++++++------------
 drivers/gpu/nova-core/firmware/riscv.rs | 76 ++++++-------------------
 drivers/gpu/nova-core/gsp/boot.rs       |  7 +--
 4 files changed, 38 insertions(+), 127 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 7634fe292446..06b74d82d698 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -364,29 +364,6 @@ struct BinHdr {
 // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
 unsafe impl FromBytes for BinHdr {}
 
-// A firmware blob starting with a `BinHdr`.
-struct BinFirmware<'a> {
-    hdr: BinHdr,
-    fw: &'a [u8],
-}
-
-impl<'a> BinFirmware<'a> {
-    /// Interpret `fw` as a firmware image starting with a [`BinHdr`], and returns the
-    /// corresponding [`BinFirmware`] that can be used to extract its payload.
-    fn new(fw: &'a firmware::Firmware) -> Result<Self> {
-        const BIN_MAGIC: u32 = 0x10de;
-        let fw = fw.data();
-
-        fw.get(0..size_of::<BinHdr>())
-            // Extract header.
-            .and_then(BinHdr::from_bytes_copy)
-            // Validate header.
-            .filter(|hdr| hdr.bin_magic == BIN_MAGIC)
-            .map(|hdr| Self { hdr, fw })
-            .ok_or(EINVAL)
-    }
-}
-
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
 
 impl<const N: usize> ModInfoBuilder<N> {
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 99a302bae567..9bd705061eba 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -8,6 +8,7 @@
         DataDirection,
         DmaAddress, //
     },
+    firmware,
     prelude::*,
     scatterlist::{
         Owned,
@@ -17,13 +18,14 @@
 
 use crate::{
     firmware::{
-        elf,
         riscv::RiscvFirmware, //
+        tlv::{
+            request_tlv, //
+            Tlv,
+        },
+        CString,
     },
-    gpu::{
-        Architecture,
-        Chipset, //
-    },
+    gpu::Chipset,
     gsp::GSP_PAGE_SIZE,
     num::FromSafeCast,
 };
@@ -63,43 +65,26 @@ pub(crate) struct GspFirmware {
 }
 
 impl GspFirmware {
-    fn find_gsp_sigs_section(chipset: Chipset) -> &'static str {
-        match chipset.arch() {
-            Architecture::Turing if matches!(chipset, Chipset::TU116 | Chipset::TU117) => {
-                ".fwsignature_tu11x"
-            }
-            Architecture::Turing => ".fwsignature_tu10x",
-            Architecture::Ampere if chipset == Chipset::GA100 => ".fwsignature_ga100",
-            Architecture::Ampere => ".fwsignature_ga10x",
-            Architecture::Ada => ".fwsignature_ad10x",
-            Architecture::Hopper => ".fwsignature_gh10x",
-            Architecture::BlackwellGB10x => ".fwsignature_gb10x",
-            Architecture::BlackwellGB20x => ".fwsignature_gb20x",
-        }
-    }
-
     /// Loads the GSP firmware binaries, map them into `dev`'s address-space, and creates the page
     /// tables expected by the GSP bootloader to load it.
     pub(crate) fn new<'a>(
         dev: &'a device::Device<device::Bound>,
         chipset: Chipset,
-        ver: &'a str,
     ) -> impl PinInit<Self, Error> + 'a {
         pin_init::pin_init_scope(move || {
-            let firmware = super::request_firmware(dev, chipset, "gsp", ver)?;
+            let firmware = request_tlv(dev, chipset, "gsp")?;
+            let tlv = Tlv::new(firmware.data())?;
+            dev_dbg!(dev, "loaded gsp firmware v{}\n", tlv.get_string(b"VERS")?);
 
-            let fw_section = elf::elf_section(firmware.data(), ".fwimage").ok_or(EINVAL)?;
+            let size = usize::from_safe_cast(tlv.get_u32(b"SIZE")?);
+            let mut fw_vvec = VVec::from_elem(0u8, size, GFP_KERNEL).map_err(|_| ENOMEM)?;
 
-            let size = fw_section.len();
+            let chip_name = chipset.name();
+            let file = tlv.get_string(b"FILE")?;
+            let filename = CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{file}"))?;
+            firmware::request_into_buf(&filename, dev, fw_vvec.as_mut_slice())?;
 
-            // Move the firmware into a vmalloc'd vector and map it into the device address
-            // space.
-            let fw_vvec = VVec::with_capacity(fw_section.len(), GFP_KERNEL)
-                .and_then(|mut v| {
-                    v.extend_from_slice(fw_section, GFP_KERNEL)?;
-                    Ok(v)
-                })
-                .map_err(|_| ENOMEM)?;
+            let signatures = Coherent::from_slice(dev, tlv.get_bytes(b"SIGN")?, GFP_KERNEL)?;
 
             Ok(try_pin_init!(Self {
                 fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
@@ -145,15 +130,9 @@ pub(crate) fn new<'a>(
                     level0.into()
                 },
                 size,
-                signatures: {
-                    let sigs_section = Self::find_gsp_sigs_section(chipset);
-
-                    elf::elf_section(firmware.data(), sigs_section)
-                        .ok_or(EINVAL)
-                        .and_then(|data| Coherent::from_slice(dev, data, GFP_KERNEL))?
-                },
+                signatures,
                 bootloader: {
-                    let bl = super::request_firmware(dev, chipset, "bootloader", ver)?;
+                    let bl = request_tlv(dev, chipset, "gsp_bootloader")?;
 
                     RiscvFirmware::new(dev, &bl)?
                 },
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 2afa7f36404e..27bfd2b5a20f 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -7,53 +7,10 @@
     device,
     dma::Coherent,
     firmware::Firmware,
-    prelude::*,
-    transmute::FromBytes, //
+    prelude::*, //
 };
 
-use crate::{
-    firmware::BinFirmware,
-    num::FromSafeCast, //
-};
-
-/// Descriptor for microcode running on a RISC-V core.
-#[repr(C)]
-#[derive(Debug)]
-struct RmRiscvUCodeDesc {
-    version: u32,
-    bootloader_offset: u32,
-    bootloader_size: u32,
-    bootloader_param_offset: u32,
-    bootloader_param_size: u32,
-    riscv_elf_offset: u32,
-    riscv_elf_size: u32,
-    app_version: u32,
-    manifest_offset: u32,
-    manifest_size: u32,
-    monitor_data_offset: u32,
-    monitor_data_size: u32,
-    monitor_code_offset: u32,
-    monitor_code_size: u32,
-}
-
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for RmRiscvUCodeDesc {}
-
-impl RmRiscvUCodeDesc {
-    /// Interprets the header of `bin_fw` as a [`RmRiscvUCodeDesc`] and returns it.
-    ///
-    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
-    fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
-        let offset = usize::from_safe_cast(bin_fw.hdr.header_offset);
-        let end = offset.checked_add(size_of::<Self>()).ok_or(EINVAL)?;
-
-        bin_fw
-            .fw
-            .get(offset..end)
-            .and_then(Self::from_bytes_copy)
-            .ok_or(EINVAL)
-    }
-}
+use crate::firmware::tlv::Tlv;
 
 /// A parsed firmware for a RISC-V core, ready to be loaded and run.
 pub(crate) struct RiscvFirmware {
@@ -70,26 +27,27 @@ pub(crate) struct RiscvFirmware {
 }
 
 impl RiscvFirmware {
-    /// Parses the RISC-V firmware image contained in `fw`.
     pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<Self> {
-        let bin_fw = BinFirmware::new(fw)?;
-
-        let riscv_desc = RmRiscvUCodeDesc::new(&bin_fw)?;
+        let tlv = Tlv::new(fw.data())?;
+        dev_dbg!(
+            dev,
+            "loaded gsp bootloader firmware v{}\n",
+            tlv.get_string(b"VERS")?
+        );
 
-        let ucode = {
-            let start = usize::from_safe_cast(bin_fw.hdr.data_offset);
-            let len = usize::from_safe_cast(bin_fw.hdr.data_size);
-            let end = start.checked_add(len).ok_or(EINVAL)?;
+        let code_offset = tlv.get_u32(b"CDOF")?;
+        let data_offset = tlv.get_u32(b"DAOF")?;
+        let manifest_offset = tlv.get_u32(b"MFOF")?;
+        let app_version = tlv.get_u32(b"APPV")?;
 
-            Coherent::from_slice(dev, fw.data().get(start..end).ok_or(EINVAL)?, GFP_KERNEL)?
-        };
+        let ucode = Coherent::from_slice(dev, tlv.get_bytes(b"BLOB")?, GFP_KERNEL)?;
 
         Ok(Self {
             ucode,
-            code_offset: riscv_desc.monitor_code_offset,
-            data_offset: riscv_desc.monitor_data_offset,
-            manifest_offset: riscv_desc.manifest_offset,
-            app_version: riscv_desc.app_version,
+            code_offset,
+            data_offset,
+            manifest_offset,
+            app_version,
         })
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 152093aafae6..56658faccdf7 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -19,10 +19,7 @@
         Falcon, //
     },
     fb::FbLayout,
-    firmware::{
-        gsp::GspFirmware,
-        FIRMWARE_VERSION, //
-    },
+    firmware::gsp::GspFirmware,
     gsp::{
         cmdq::Cmdq,
         commands,
@@ -110,7 +107,7 @@ pub(crate) fn boot(
         let dev = pdev.as_ref();
         let hal = super::hal::gsp_hal(chipset);
 
-        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
+        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
-- 
2.54.0

