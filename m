Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013032.outbound.protection.outlook.com [40.93.196.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 119FD384232;
	Tue, 30 Jun 2026 19:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782848917; cv=fail; b=htONChZhDuJGfOMBgeJ5fFFi8UddUINcEeVzhsunPLBvkADOoUeRQmYMftvVD13ZVK9agouNF13opkIsy33PYuC8VduIhCNSiM+BTkv4rdejw/Cv3dNEKccC5m04Px0XhgMdbTZLcibFROFKoMXt8f7DwVKjJvBTa4tywNSboZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782848917; c=relaxed/simple;
	bh=ZfK6jMMnidPluWn2c/pb2TkCmTnk/Yl2IP3RTDH6jNU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mHi/N0UMG84FqgXh8gJX445z+8QRwohDMapekEwkFggFB2eSZVjtKdEO80liWTGd2+kIbTS3psm/pEyU+DTMlMkehI5sSbJMLLIeKnaCWy3OXI3JU3JbhCJ7jHdhSqtZJEIRsrrI7zITMvSdGPY8fRx1wF7bWzNdPMH8cE9G1uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=CXAXHDXv; arc=fail smtp.client-ip=40.93.196.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="CXAXHDXv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nnA8Id80B3zatogWZ8nHuxuE4rloobuRG4kaMHZgIbS4M6p2oMShN+7LD0Asrn8OHQpjtM4NqIzXgOgkuqH3XxP99r+nutMr6MBwbHI6Yt37ZxGoLIUzJzZ4Pb/Qb5jbTmYCFAuiqi6JadiaS4MEOnCQiMcCkCWJLDCe+r6mIj2Ysbryc8sqD9lRrF/NtMaRW4AmIbqFSjTiLRtq4OoHnNgjLhl9+e3TaaQm8uRxwST/431iVV1RpFBxNUQq0jGBpvWy+7G3VVTocpeiiPVrbVLjG0i9yTDcJmlzzy6sfqZKueBlKv3+esExbZ2xA8W+s4P0DBpd1IqdHPfmMyY8Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lcu6GMmJIu3N90w0dgHS0Rht/qzyf/B31+FJLVCZbw=;
 b=W9YZ1o23LLTgSc6ekLu9X8AgzJwxn8NsuYEZ9BuctEruVVUX8IdKt32j0+pkPBQrj/fajLzEM/sfDwe9U4YpYhBbH1Y7Cd6nYn0K0/kO9qJD2Rq8iRdg36Lpx8g80FTkXlZo2bjH08oMg6cC5fW8XHY9Tp5kA2aCuJKH2B7OiG75NLoYFA0Rug0iOm4k5HjgRcyxIfcx/ILshLvZAgYGeno6MJrFZKbOhpRIEXynj5VpvM1h1sUI0NJ/GhuxFrp0RLS+ncHjArjGuwhQGBxBzIvj0QQSRNYtgMEo3HI331QtggQqIy4kidk3b8apZYfk93/9dRBRXcbJZl42NMKoOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lcu6GMmJIu3N90w0dgHS0Rht/qzyf/B31+FJLVCZbw=;
 b=CXAXHDXvztR/8pGe04tdJwFq+s5eCdkw31Jb2Z+QKOgVaD0l9hqRFv3h6ESufF66KF/A+aeuBG1YQLMhiCjzarBacjvyfC6cuECa/lBg94WnJD5ZMM/HptM+YGvkmWdkHNor+gUxutNKKIAyVkBlAzs6HxYkOi7PrPW1+DoamIL9hbzR3dXUK4ZFzPvWeYGwBUAJOdm9jJndcKs/nGEOSGPf+cHgG5q2c8CfCHRpoVw7i7p2J9N5eJ6JIxFzdZNPSsImomTHOhboZozfTDASzh15VCHBMDsy5PM6WesYtCfkl8baFemXHQ7PYtZeSsnL57jDLQ2MatsN+lR4+NTi+w==
Received: from SJ0PR13CA0097.namprd13.prod.outlook.com (2603:10b6:a03:2c5::12)
 by SA1PR12MB8600.namprd12.prod.outlook.com (2603:10b6:806:257::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 30 Jun
 2026 19:48:28 +0000
Received: from SJ5PEPF000001CC.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::32) by SJ0PR13CA0097.outlook.office365.com
 (2603:10b6:a03:2c5::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 19:48:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001CC.mail.protection.outlook.com (10.167.242.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 19:48:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 12:48:11 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 12:48:09 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 4/7] gpu: nova-core: transition gsp to TLV images
Date: Tue, 30 Jun 2026 14:47:46 -0500
Message-ID: <20260630194749.1209490-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630194749.1209490-1-ttabi@nvidia.com>
References: <20260630194749.1209490-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CC:EE_|SA1PR12MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 0bce4921-896e-4a74-43ef-08ded6e08e1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|82310400026|36860700016|376014|1800799024|921020|18002099003|22082099003|3023799007|11063799006|56012099006|6133799003;
X-Microsoft-Antispam-Message-Info:
	bOarXI6Cl25st3QEMcyiWLyzux3d7o1TRC8VMLO47SL5GesoZsYAAnn2lPgEDQExP9d5nydyN8r1Es+doRz8ABiRBvXFeIVIV4ty8v7KgWrX47Kspz1E8KWIznmC4ImS9rcMiTBshkpwEeKLs6WJg5bj7Ejo2IqRJx3Bx/ewKj9XcLQ7XWeoD6sILarch60I3EkcHUuIkSKZUul2/fhboWiEc13ktPmoYsO7f+L7RWJVQrEoPLS9PR/rranayll8aFvAvUAP3sKNbEAyl0p91yc8B70jFkcgHKiN4sKLEiQzG3zUPR1HoGsNlE9CbDmf/OCZ80Hbx2gdKTljziMi7STfhhUEPK2N+PdsFH2kBNrknhMUcAS6Vyj1Hoa6FFEExWEQJ02cQB3v+4s2d8pANvV79RmmHaagMS0OtXUXsF8e/clr+3PaWErnyzchHBYtKVaB3goFKRvHGKCUUwlDAkHFvD8aKqAtal6HcWikTdpER3zov7/DQvHabFb7aY5OryZCpla0uvwQc/miml6h9j8wgrUVPhcAewWMvS/5Zs8yJeBw5yEhjMUU4DUNAAe975aMHIyMPvXfy4vLscZOfSILXuK5k6VOVAYTJ/4tVvo+Z3dFSV6SXkoRKAdhl/pUNK9/yCdyYQLcEK5eaSKTWOPstN0BGZ1lmjZrjs775631Yf0gFaHBIjNnytKVPJmdTelK3BajTxHGCJIx1+o4p7ZaYJ6z8eXG2JS/yvB+q9kXUYq6MmyBCITXwG4diAGx
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(82310400026)(36860700016)(376014)(1800799024)(921020)(18002099003)(22082099003)(3023799007)(11063799006)(56012099006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TqPNu3tH/jnL0BFanVf3j9o8tjpIB1o2oAHyhOQGfoknDgAn8CYohLzSJa0sWN8IxQL9wZ0XGsXOons+0vZyFQVLkBTxMa1V1aJc6s290nhMKLEH/99blELfWPx0jlNZ8aaJlvgqzcXljEg8QfzNBCZwLghQOKyAg2hyoF+OSA5bkDz4zwrsXy+6jCWyLFqNvbiqUfSgN3Oi0sUelpn/SRInvOPLsVIYle2zlwfnnh+iuDfTnbBIrjhX1LUJLZpC9GLycF766rj/BfZduMw+bGG1Tr7WN6fgDbYYWBZD2rSKWm3F2tEChyFeu23gwTe6MSh8WfA5NmlLVC4zkGtfM0XJ6uBBXBEHMu+hUarnkKU/YVftFt3gvoxdlZ4ALpNPkOk44ljznXtjAOLFAJm1YFfiiXmbGlcY+LwRVEN/Uh64YqQVjxspeCmKA8HfITc3
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:48:27.8140
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0bce4921-896e-4a74-43ef-08ded6e08e1a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CC.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8600

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
index ab0491b57944..1acd169ddb6c 100644
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

