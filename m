Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013063.outbound.protection.outlook.com [40.93.201.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F93876C9;
	Fri, 31 Jul 2026 20:10:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528662; cv=fail; b=Y1UI5aepyMZONmdCUWMR2PcU8dIvudbJemUYjFK2XLNzYdch7gCxZvPuZ58uUf6IhwS4H7bH0qiN9Zf5gwQOZoD5FvFYL3Qy52O1l8TcNyr/wwUataGoRHp+ES4rIf10xo+r+jQfC359IPVHTTlPC60S7xVYFO16+nHRUMDeXqQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528662; c=relaxed/simple;
	bh=vlVUSxyRyiHnD6Pfkd4SjGMSuPgjEpu3mzvP1TfGsIQ=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r+5AOm02BsoSd8OkO6kOI/Q2mIdXNaHMKBPNEdFk0aHhBFfW0OPwX+Ac/AfTDfv1iZEa5Z/NTditdi00ooCqhpUeR5zGLzokwcev1kymcspta53PX3WBDDh3RTXKrF7c8FAKnU1h/heRIhtN7+5ZHuxg3Jf/A8zo6Y+ibXTRSLU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KG7ktds1; arc=fail smtp.client-ip=40.93.201.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KG7ktds1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KZbdmziQfK7phYS6WwTMFz6ZB+NV7Kx8eA8xxuE8USEY77flu3IUVMzBAj8wGrUAXDbUbxJ6y5E5O30sflT9HaL8kTE5ZGoKYCKlSYZXZfpem/GjTOhUF/7/l4idTXHQUv6GhXUqEJaA31y4qg4OwemHwsfslZSKKlrl4085+FyOvGI/YgvtEJrQhSoxCV54XD107TmBm74wO9860950OmaDlE4yjRBXQ6fN3jAzrsmSmXlrH5fObMX3qziIgbCrPo2iXCcFWUzbQrep69vFR/UXCOcsY+tHCzgFQ3nl4gCf3vuSQdA4s49WZmC8ICCAuzORuKDIT7x8lsl68XWWWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LMGKNIdb1YCxGWzEszb0Y2lTQN1b0t5nqSTzqB+iyO0=;
 b=AgON2b5oXiWpSPhbAAwfRXNhzm4afT1D1xO7qoXKdcqKzK5/q5KvZKPltTz84IDMSxnMd56VWA/pPHv15zXHbQsZbTZa27WpHrurvkPONaHTC3f74KRSdGuwkVOZH36of3aFtdE2OR50HDeLMIquWfij57AOHfjA8z596HTr8y/8CluHZCNiDATICOSrD+PqKAss3lvIGEVIkwBKMEMajRsJugw31/tdMz1Xi34591VqgetbbKeixDQ2U2Nz8OjnjX0otsB1B1AfQAwnCwB0br4LQjcr/XqBi5p2gkdx/t3UvAKdXSL/3Y0kyTElnaRqf+Hv9rpYoB+zQ975ccsuMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LMGKNIdb1YCxGWzEszb0Y2lTQN1b0t5nqSTzqB+iyO0=;
 b=KG7ktds1dh9AyUGaWRmLgtoW+QuDv351JJ++bRP3sfyE4xGPU8Ha5gR2WUPlgvx8MrQA11vw4KLC6YhNQZMKqgSuVAq7p43YOBBB6OmP/TZhPO+8w7wKvSB3ZW1IbumGnMG0WlDtIAWcc1nG07A0d3yH0ZvGRE6snkBXMAm+PIhL4q8P6JDuBd3jd0IqZkh3AjvxWxSBWs583e1GL6FZaU76vnPPojlvU9NdT0wecAZNXkS8WJdDVhBwK9jqDMVEr9v3r/UmJ0AI9NroLwJWgKpXeb3WnztxbVsqF3ACdqX1XquLX1LLRE3mrVLhG5QxOsPn7bmjqbLBDdXxXDkgSg==
Received: from BN0PR04CA0067.namprd04.prod.outlook.com (2603:10b6:408:ea::12)
 by SA1PR12MB8966.namprd12.prod.outlook.com (2603:10b6:806:385::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 20:10:50 +0000
Received: from BN2PEPF000055E0.namprd21.prod.outlook.com
 (2603:10b6:408:ea:cafe::67) by BN0PR04CA0067.outlook.office365.com
 (2603:10b6:408:ea::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 20:10:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055E0.mail.protection.outlook.com (10.167.245.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Fri, 31 Jul 2026 20:10:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 31 Jul
 2026 13:10:32 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:30 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v7 5/8] gpu: nova-core: transition gsp to TLV images
Date: Fri, 31 Jul 2026 15:10:14 -0500
Message-ID: <20260731201017.2580713-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E0:EE_|SA1PR12MB8966:EE_
X-MS-Office365-Filtering-Correlation-Id: 8414e686-9ae4-425f-4e1d-08deef3fd13c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|18002099003|22082099003|11063799006|3023799007|56012099006|10067099003|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	uBknLZey8r6VTlknmm2c7bPcz7mZfZq3lnMBmLTqfgHxJKNF/8bMQvRTaKGkr0SONpz+4AktKFHh+Dy0UuCNZyKfrinZ2QaFrGr7OxgrA4mNuQ/+VCuu7OxfbBf8HUqTnYpUzXJ4tWEQE0PKn/09/xA22bjIlxAhF7yBmSLjQ9RuAr24KE5/NbKAg0fF/0KRoF5U5m8uLDcmk6H5Kq+yoX9Ca3jRGk0Sy2hfC2rVyJRK8EPQSShQrcVlpkg6CuEAr0Im6g2QzryV/ubGHwDdMTlvwFJfO0ETyuesYmqHPVshR99ql6Y4MjHB/PolNcvThKbGNz0bWYWuBlwQDAFRXK66kSN2Xm3ia2Jg6VUPPf1MCoEBmPm5OeDrskn7wfSGfm/SZTurNB7b/XkcxCI7zIdR5ozvhRoqhV7LYmYVA9ikqu/P42JQi7SYyiKJkGxs0r3vWXgWdiMp54i9/KK5MuV2nw6TQhK1Piyj2n+NhuHWJWstkc98Aqiynj/yW8jap/YLplAqi0xiD95OqUVuYha7yWSqORKkV03AKWqrfi8XHhFIhWyIReEYS4dSzdjev9+M96UyEgbr1KKzSL6vAUf+sBKbmljKazUXmIrBdbOrGcUWDMQ5labtOZb7mrVMcA4tfPlFmWvtXF12MRWtyA8pA8Nvl3kqt3CABg06Mq/sCsi3kbwp/Ws7I2ZAyu6Cj7a0jvi+XB9B9DXzi85hCQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(18002099003)(22082099003)(11063799006)(3023799007)(56012099006)(10067099003)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YAHJPN09ixn2iP0tvWF/zf+89MF9HNU75wDhvbkvOfpph/GENWHrJYFgqGUNL4Saik0FWoQgl6u86pQOua1JMKzRkRSPCYTP7+CfpR702CJDaCRmNaMe8wUQUWNs5F/sEqctoy4kkVEgL7EwzkUFccuJVP5CvuhcV2NzmllFtt7a5co0gHmUnUzDq9g7Sdda0FHnqNYmTT3golxcup4T1R1JPTvWtip1IrOjkaqiC49yNf/ZzCVRYq21HGpN6GWnCQtDmHUXRGFkh8FKIt3EjjtCCSfu9+LMjnGd+NM9n68KvT4Rt9clgjA/Ju0t4QNDu+9NT8eHGHyC7I7Vry2Zz9g0EdNAcP/gYOyHVdg3/iKbxlEPZ6g4UPa6tkK2lAnP0tOs+bMFrIVp9g85G8+743Q4qkNeUEM0daOa/WKdGQsINk6IyYrrqVLpV5am/nxo
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 20:10:50.3655
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8414e686-9ae4-425f-4e1d-08deef3fd13c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E0.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8966

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
 drivers/gpu/nova-core/firmware/riscv.rs | 75 ++++++-------------------
 drivers/gpu/nova-core/gsp/boot.rs       |  7 +--
 4 files changed, 38 insertions(+), 126 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index bd47ebbb013e..3aa0137cba53 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -365,29 +365,6 @@ struct BinHdr {
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
index 99a302bae567..55a8c513e3a9 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -8,22 +8,24 @@
         DataDirection,
         DmaAddress, //
     },
+    firmware,
     prelude::*,
     scatterlist::{
         Owned,
         SGTable, //
     },
+    str::CString,
 };
 
 use crate::{
     firmware::{
-        elf,
         riscv::RiscvFirmware, //
+        tlv::{
+            request_tlv, //
+            Tlv,
+        },
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
+            let mut fw_vvec = VVec::zeroed(size, GFP_KERNEL).map_err(|_| ENOMEM)?;
 
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
index 2afa7f36404e..1403f05a7305 100644
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
@@ -72,24 +29,26 @@ pub(crate) struct RiscvFirmware {
 impl RiscvFirmware {
     /// Parses the RISC-V firmware image contained in `fw`.
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
index 727b8ae4bcb7..1f1c419b9302 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -17,10 +17,7 @@
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
@@ -48,7 +45,7 @@ pub(crate) fn boot(
         let dev = pdev.as_ref();
         let hal = super::hal::gsp_hal(chipset);
 
-        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset, FIRMWARE_VERSION), GFP_KERNEL)?;
+        let gsp_fw = KBox::pin_init(GspFirmware::new(dev, chipset), GFP_KERNEL)?;
 
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw, ctx.vgpu.state())?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
-- 
2.54.0

