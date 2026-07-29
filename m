Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012030.outbound.protection.outlook.com [40.107.209.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 681933246F4;
	Wed, 29 Jul 2026 22:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785365784; cv=fail; b=oyDJ34fon5M1wN4yILDZU8hCuC3ak3gliRkflWJ/ch8UDK4a5wdr6PowIOzVCAxGIZdPaUQ7mlWmdprrxYZ7mXs6S5ed6ZON864UjaxtgvhlK4xF47Bcgg3M2Bsfm9gC1LFJq8LC7vRC8AzLxVU4YwplHg3N+qM927Clw8+Ksqs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785365784; c=relaxed/simple;
	bh=dnLJUhMESPQcl6kzCgJuceGhAdhniySvOMxqn/BYOCY=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oaeHbpNu4kpR3YElRHhiU3be7fSVI/3mlrxw1M5kI9RM6tfxIexJx2e1r86DIsuyh7SGuAriltI3ghqGeruKtZ2aNE3rTGoNpcvImoj8GOXkb+tyi9cq2rp01aQJoVUH7QTueTj1qjmY1ptMlQXwaEdhM95h5dOLe5oCr+019Mw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LHKoxxXV; arc=fail smtp.client-ip=40.107.209.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LHKoxxXV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPcS5Ev//YPpjAUScWsw4CWXZArKTQtNFuN5jHIqRt7Kppu78i98KYEpN9Gw7XQGXoygXGa+MAxRBqE58jwcl6X94+90WndXRDzSnGoKPl+QNcNResUlY3ut5zyHf9kGbmk4SKj37/3SPzgAoelkv2NCSwmraA3aILbe+zidHNpGZe3EFeAAIh4GvvxDft6XJZ0BRNLBMrwl3mJfH4Q6SbSygci5RXCGjix4v8wGGqcFWf4t+zUlpPvK+9E2Z8EMyQUT4ZlDFgWEs6AI+7+tLRsTaISjHIht10TvE/b4eblFipNrs2r+VaKhNEgaU1CWj64GDg0vUAy1Z8osMJM9Hw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSs3qUQo4u8XQxpVA8VU2eC1YYN3cN5GqhcdZaqNwSU=;
 b=FzmC8+I9eJeRwRWppMGE+o6rW1wYpdD88pVUi/PkRny6MXXZFFrtSiaY+J7+5CZKZIQtCfZ9Dmt6zUElQlMRQx2YtifchfmrncQTkB4nLpqVNW92lisONcB+aDdz2EYw0RnqMYyiG3GMOFBs9NwHdIjFXzTnFXN16VfXRM96xXMyPdNNYQgZDyGXGhSTgBZdh2nic2K5GQadJ+WFaCk6DXlMqYaZyP4G+geQET+RoBxGN9hWyQF4CgHtD1oGv0Ezzrneqm/yBOXzKqtZPX+SbqCuCDHkw/YBzay/GMxDvCkuIVJ9jxOGdztBH1GLgCpvXIKehkudypChELv3yFoAZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSs3qUQo4u8XQxpVA8VU2eC1YYN3cN5GqhcdZaqNwSU=;
 b=LHKoxxXV4gXWEpdmZP0wN4RY5sC/xYKIqkBbnKmqnkoSXVnZJizwSj2npkAuz6y0BsnECs1JzX+Xztuh+Qafr9NABLaKUpbvXR/1rhFzu0uYJDYUz3gJmZL7n8q32Dd5Qy4o67SXlNXtbQSLXEiAIQuH9gqdmYjAz0dYe4eduXNMO1aEsE9M02UpBQ2d/wbBrhyqSBKXV5EbQ39jPhFENaPr5v8JeLMMx9zzpUfjcluaUhi/n5HiCBUt4Umv2I58e50sL0pk9/ZESAb1y8g+lavQEXUSBhMkoZ04KEnXkFjVbqNaaHtwW4nTkE2S7xZX6LtRK2R2x577qNziB6yvDA==
Received: from CH0PR03CA0047.namprd03.prod.outlook.com (2603:10b6:610:b3::22)
 by DS0PR12MB8248.namprd12.prod.outlook.com (2603:10b6:8:f3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.13; Wed, 29 Jul
 2026 22:56:14 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::79) by CH0PR03CA0047.outlook.office365.com
 (2603:10b6:610:b3::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 22:56:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 22:56:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 29 Jul
 2026 15:55:56 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 15:55:55 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v6 5/8] gpu: nova-core: transition gsp to TLV images
Date: Wed, 29 Jul 2026 17:55:31 -0500
Message-ID: <20260729225534.2046933-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729225534.2046933-1-ttabi@nvidia.com>
References: <20260729225534.2046933-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|DS0PR12MB8248:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d98e6a7-ec20-4f04-2acb-08deedc49762
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|23010399003|36860700016|6133799003|11063799006|3023799007|56012099006|22082099003|18002099003|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	A3PppgaapR6msT6toQV+Z4Oho1KieuSaUH+L7gb9jiqrZDfhYL19BET9Q0y3R9qOIRwl0bNZ9YJI2Y76M7vl9YvzMbQ2bgbEyiLNRW/m/bvLfkjDJUNpA95U/oRRLr38mOan8eaabWjDnCc2o98j77TvdHtg8Kr/kxtTj41zY2VTu6tLmyH+E1tT2Kw21Mrk3slEIkCis7nYjQT+hI4q9tPHQjmmbXqiHdPI8/ap28BcLNQIePG5mVLEjdUHWcY8pi5RXcjaqMuyckDolhMUY5Pv8ge1/HGs1G2SEFrS4DxFACoB7DLM1dDew/jT98mfoaPGkUEVVqbcXoJoqK4X73CYIMCs0xoYvrwPpr++pEesDx6C5xpg3BumzhS0V1HKeJheLqG7tuMlBttwuimddazL/JTqvLp1hzNQTnWAxOpI72SE8ujdpxTYjhj7pM/pgsJIKW9uRIvDNQq8eZUL7a5+k5vYwNTo9ctsuOTYzvAIKfNwaqzTBG5SPTZyV/kRAHLLhtnAj3wMdX5Ld4RS/2oCdNwvCmu8tMTjeK2NnGCEFace7UYdXP80jaGmR/OFfzWXB0brc3psEVdUclQfGYkp5Eki9DFwstEUw50XT65L0z3JX1QTo6yqm8SMLLUHFRSXpjXVpsM+J8HQPpJr+BXY1mnsiA0OhkMetPtNzwDUzFaaLeiC4+y2iOCej2OO8uwA5JvYvy0V2SoOI/1BCv3eRU4PuKdv8cGLyfxETc3K+nJZfsOHvtSncP3XBx+K
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(23010399003)(36860700016)(6133799003)(11063799006)(3023799007)(56012099006)(22082099003)(18002099003)(10067099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	hMREF60H2P3b82GgGaNVMGsSn1RRn/CbxZ58n56kJ34pr1FN3iJcjb5fJXm6NkZ3FCjs5voa10aMoNgbr5iYnzjFpJBil1MInXgyZLlyT6KmYuCzLQsprFMdAbQa+jQyp6ciwQxI13jXmt/CB0G1ZsNMDWhms8/ykIqGvlPHoZjD3XBCMO2ynKAy/FTOGoQciHScF6L9Sg0i6S1nXxdHTtSEBvfNfSEv64kc18FvnJpdy9GoFzBWe2Aap2ER7r56hJ0a0vu+5GsbWKR3RQ95WFPi7CHtBw4w4LvYjjE4xUAtj7VzrPC41DiwZCgLHLZuLggmUBxsJaXkYAvr+zFgH7n02htUFuDgVF3df98GphFA+yfz0AHTzZPxO+ZGAY85DMVpM3NJfhAqTohpeZBNgVdAsGWit51mRPWlpGV9lxJhxoeV9K8jaoqTENP5IKqh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:56:14.0591
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d98e6a7-ec20-4f04-2acb-08deedc49762
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8248

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
 drivers/gpu/nova-core/firmware/gsp.rs   | 61 +++++++-------------
 drivers/gpu/nova-core/firmware/riscv.rs | 75 ++++++-------------------
 drivers/gpu/nova-core/gsp/boot.rs       |  7 +--
 4 files changed, 40 insertions(+), 126 deletions(-)

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
index 99a302bae567..f240c1c2e5d9 100644
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
@@ -63,43 +65,28 @@ pub(crate) struct GspFirmware {
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
+            assert!(fw_vvec.iter().all(|&x| x == 0));
 
-            // Move the firmware into a vmalloc'd vector and map it into the device address
-            // space.
-            let fw_vvec = VVec::with_capacity(fw_section.len(), GFP_KERNEL)
-                .and_then(|mut v| {
-                    v.extend_from_slice(fw_section, GFP_KERNEL)?;
-                    Ok(v)
-                })
-                .map_err(|_| ENOMEM)?;
+            let chip_name = chipset.name();
+            let file = tlv.get_string(b"FILE")?;
+            let filename = CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{file}"))?;
+            firmware::request_into_buf(&filename, dev, fw_vvec.as_mut_slice())?;
+
+            let signatures = Coherent::from_slice(dev, tlv.get_bytes(b"SIGN")?, GFP_KERNEL)?;
 
             Ok(try_pin_init!(Self {
                 fw <- SGTable::new(dev, fw_vvec, DataDirection::ToDevice, GFP_KERNEL),
@@ -145,15 +132,9 @@ pub(crate) fn new<'a>(
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

