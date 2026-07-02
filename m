Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012017.outbound.protection.outlook.com [40.93.195.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB4C38C42D;
	Thu,  2 Jul 2026 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020480; cv=fail; b=nWSMrR4GLJMnzPtG7MsTL57+L5XvV+yBLQ8Laxz8w7AHpLOrhZZycAHaoKMtFkxsEeKz9qoMzdKEC9yr8rSunrk2q9c3EK1AscTtpuj8r48agdy086+rDozQn6/cI09UcW1SQzBEMegr/iIlhIzBXHbuQFbtjFmrjV5wffHJqZA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020480; c=relaxed/simple;
	bh=ZfK6jMMnidPluWn2c/pb2TkCmTnk/Yl2IP3RTDH6jNU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cqYf82ww/g6TfVeY/ZSOa98C/Dy/hldEXVwdxN/OBTUxwy4QKM5j3BiX6O2W7jpEO5F/gPssNK2LCJ2Ap7EF2fFLbGGc2t/cu+ZV3UURsLSNUDo0iExSB0oEEla2EP1BdWdxUi6EIEFW25HqkqzPUijNbVcq54sq4lyQpSdjF6Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=KBIUX5LS; arc=fail smtp.client-ip=40.93.195.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="KBIUX5LS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rF0da5ocIHflJYlJEReeu2huimGs4aNA1dwqq0QLeZWSfE7Zg3JkLyYMuR85W3jdaYhJ4U5qtoTdumwyLpH0+2WOutFjt6ca9BbFM6WOPzuSFf+guvYTZxqwAaePuel29spf/TfwZo0GEjKm5OJjeAjpBOioKAqzoq5HhWoMjXW2f6dKN0IfU6xZbyWm1eiZqAnFhf9BWKIxNlW0Knr+IvQjTvymRBfFoCJcynBMT+gLIxk6M+bcsULcAT2+8BHUKosTCIgnieM/dou9S8LnTYELMGAY8UTJNKyf0irUr/SuSFixNlnU9+1y9Rytx1xZyauq9PmkvYbZhbVyrxyYcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7lcu6GMmJIu3N90w0dgHS0Rht/qzyf/B31+FJLVCZbw=;
 b=YGZxeovjBKEqzVfpxAo06VaNLy1E3TECd3SLJwsubQZ+uZN5Onyp2fBRxV+tK+FO9YB1dBzo9RAY3Fp/433MjmUz8KEGCCqP2enCmqUiSYZh5VriNQ/t2S7BZzDSTZj4tD75tOlly6aLwRr18eAGVr3u41kDMgd8PExfbJdYDya98mJco4XWoYPhgoEhhkX5xjc4wvyPLBhH0vqbd7EG7aIiGlE6xNnEKf9e3LzcK0r9R/Np81KIirBPkJBVkTAsprELD7Sir9HOrlxF0uYO0aY8ZOWHlBC5rGImTTGyBzEIVaZyjL+dREunLQl2/lIz3JtKSmxC6aTipYzcZiaf6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7lcu6GMmJIu3N90w0dgHS0Rht/qzyf/B31+FJLVCZbw=;
 b=KBIUX5LSvBAdlB/TM9NL5v2Q/+oVRSgjTJLEnb4cfyJeX4akeCpAmo9LLZcIkqcbcBeuBKUIh+feHrIlsRYJT9pBGH7gAJJtW4TnpvmjMCQ4ZkyXPafaFO7PTXKG9FjLwj1acawaViPUhQA5LyvAcDKWhY1cCQjzuwPq+jMtSNWxJbUmTLek5OvBOAtSutMGPV0BgzTAI5mJYg8Of0VPUuATpuHysgBXzxSeYQ9UGKqOCKOpryVrX/Aul/kkLJviaMlxfn+H4KmVSHs2hnOBuSpl+1qi1BlUGIif9jYNNf6OboEWotfVw3qocR9pCTlJCHA+Wlc+w6s4OY4Y48RpQw==
Received: from PH7P220CA0126.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::11)
 by LV2PR12MB5845.namprd12.prod.outlook.com (2603:10b6:408:176::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 19:27:52 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::43) by PH7P220CA0126.outlook.office365.com
 (2603:10b6:510:327::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 19:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 19:27:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:31 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:30 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [PATCH v3 4/7] gpu: nova-core: transition gsp to TLV images
Date: Thu, 2 Jul 2026 14:27:09 -0500
Message-ID: <20260702192712.3450652-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702192712.3450652-1-ttabi@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|LV2PR12MB5845:EE_
X-MS-Office365-Filtering-Correlation-Id: e48d2a0a-f359-45f8-cea1-08ded870025f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|23010399003|1800799024|36860700016|921020|11063799006|22082099003|56012099006|18002099003|3023799007|6133799003;
X-Microsoft-Antispam-Message-Info:
	F5l1j6bons5IcW2WX66KRSZTBQ1TFXzyXqqhnkXCndoV52Kphsu2Be5IkMj/3b7pwMb0ktuEWlE7xWF+kSiJsj6hMTHL5SGsZBnzHfEnbxH4eb/IHFHhJ6mjC7SgCc9udrP8f3Vy6kVG5lLHU6x1vKMlW0lprB/aF9eDDb37caiCJjRrub3UGMb7s0LNjoPuH8nimFPOcyCFZdNFcATctjFnTvR7RDlxlyB73fkdSVmkcYm//jHHBc6YojXF+i95NTJ1rzz341abXwiu/zgWFdwLAbODemxgSEajMxKZllukykpyJnKqwQxE8YpJaxs3pWMpPTntxSFiOhR4nt4clgMFPuBO5Rw69CpVBpD+KnJI3RwBkDvOmnFpDt5ZbFfnysnoPjDR9f+O4dhce+J3UYhZpAn68v1MC32NCkCwNx/sREyfvDb4lPwPHUbTWsJhYB+m8rqwaG4GaQWz2//Hh0yCewvbNaVxUsIvOsxMCYC5wxYTJ/oWT5A4mzzan9zMI7yA8/9HkijVMw/J4YOA3rjUWvv9ZXkYDqzZDR7Q0+tNA+h/9KZxAk9XxBkss4OgVmxT5a7R0dMWOc7XHuMixKBVmLpRFdJYZ5dbv2Zco0IJQf+WoiJn/0HA2UVbQnfScmck5LQ9ybLWU/gLouCtVoHfTexUN909oYs6C6q5O59vaABngDkyfXWBE/96sUiql3SLgOvtMIGOg8ErXjZM2w2hLZupjUVhP6ckmbl/ODZAdYk+gJrivDcabWYoWSwj
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(23010399003)(1800799024)(36860700016)(921020)(11063799006)(22082099003)(56012099006)(18002099003)(3023799007)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	YE0kjuOJsRY4j0Za7sXszGJUZx2jk36V/xkX2oAc4zEY6qVe5A5Y5LQPs9JpF9BLx584niXEdkpJclhgDMntYFHGy9ATuhjy26BuguMKrwH8QUv8l0Inu4TAhmFd8nS66QxonEmpiwCTwS2tYwqI3w/vrd1sLTXgOM+yWtvZmlcWLNFj1cZiy6FxU4SOf03+UD2YfiftXHsIrlm2LhBxWrFCLQvg86eAIID60BEKiO4eBxWCi2BG/XGDvX94+n0MsrWL2FcmOhcy6SZtQeQRewhlta1CvAStgUSmqindxcOkty0xbMj7Uy3dY82UamUULTEioVZT6wCuzxJ6i48qktpHfwhcIJGu2sYSimtLTFOnaoqbf3+4sqNv4xXRA3PQlxX6xsfzapv742bO2WlbSqWvv/TNibwr2pSoWueBysB1nBFvBSOxsvfFm74A/ysg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:27:51.9494
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e48d2a0a-f359-45f8-cea1-08ded870025f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5845

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

