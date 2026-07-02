Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010048.outbound.protection.outlook.com [52.101.46.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D21FCA45;
	Thu,  2 Jul 2026 19:28:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020486; cv=fail; b=MYK2ZvcybX0c7gtwlrL8OewBgjLSZKoV63MJH7xES8Zt6VUyZhaY3TzOuJUZhSmEmUFAxQKCa8wOvvhXhoTjCvsE1eJ925v1wZwKivYZmZxik3m5jhGok5V2vXC/MSCXGweF+bnjgPs7JM0cAK/H5Vq8faItbvrvO/xMG9mL5Ok=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020486; c=relaxed/simple;
	bh=SPT/0l9rix0b9pzU/Jz8Jt9Ha7DT2iVjxlR0szHMSCs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=c9jRxUe1qmHvCzjCXZcPQWzqxBy+E+1KlazWXPy6fyDYXTImBVTcxcJz1pbjDWtQsr+q/NqXt8RRsLjzl+8HCU+UBgilFR0nxZmc+5Y4gITunFNb8zOYj1f0iNdfODgL+Z3Oi6kirajU5fxst0jAm3TGwcqYDOATZnsUl2FDWtA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=sfFHqkTU; arc=fail smtp.client-ip=52.101.46.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="sfFHqkTU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MZ7qDcBipjr9ccZkDh+lCbJb/1l8H8TJ9k74OYad8WKqbL/UHSTD0PfF9oB1ce7wfpn3gyfNUqgIG3lajgr/Kh0U2nmhAUjySYEdLdkUvCOVeEDfYPMtUdVy1uXncdc5mMp7TFbE2LhpPvD8skohdUhbkiUWmMeZrkytUL+p/ljiNRi+OU6O9kLQX//PN6L2eNO0td9biLvbUJSZjwN7iBctnO1KS+kI8ZDYGalLSlXIBqb+b9AMymoMYbF3kyhwhy6iE8BA/PRcvu/gYsArkJ3fY1fNNaxqfJjBg/abKEvaor0LqErivORq0Qrlr5ElEkKGLMlzpSv8sIZjipXpMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+X4EZDgatObS+hG8Jv2BfLKmY2C/36BjcQNVudInUE=;
 b=plBmiteq+ZyUWvh2BCTJ4odZG7T+BKJSeik7ob9OfcTd8h/t7lFMQGxdw+iigpkEnu3Fef7s3+iXrm+zE3GoUQ50X08TFL6OR+f6Mn6UbCQW/AtkrIIKLK7Cc155wYN0D4aczc/HNGBOMCSCN/jeTEAxoTzXCwG1eQwybrZ7DF1lyErsJc1T/ZrRAxGYnQtQ5KHU1izE2hniVNK9x8bSC/nAcqSoGNmPI6bX54ZrkRB6eNtQFRjJ3VsV+ZW5E+pid4Vm14Y8mW/YRBSxmn2buFvBAm71Qh9IYcTaK2Cd9KlOVXeFEcV4gIuRclPtjJK1T/DFqC4rTIjzfNv5K8M1vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+X4EZDgatObS+hG8Jv2BfLKmY2C/36BjcQNVudInUE=;
 b=sfFHqkTUC+hofPJJ4WSg2yd2bkhmR6SFurUDOEejiUf7PNWiVjmZo0ObULjKIzSEvERR9HEWHvMntihUTVzzdSpqIXNjjQqeoTen6tPvYHPwh6mtD0/qfzqvFsOBobIuEhcqdvtHuFM+b4qfXrqavkrbQZ0vBDp8PPM7AxeVu8b2Ngd2XQhHBVD+bcE5zyvKsJsenVka9JZCXfQXJH8PiMHOUrWbpm3t6+UfLIgg5TupzNqAOl3wCulkuuvRf3DxdYMbAc+Mv7AsH05hVxmFNYN76U8q09huJB9XvHo2tGceDxdbST429B6EkxOD+uniOHQZgLhkYShuMSuEtiP+Ag==
Received: from PH7P220CA0125.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::18)
 by DS0PR12MB6608.namprd12.prod.outlook.com (2603:10b6:8:d0::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 19:27:54 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::4b) by PH7P220CA0125.outlook.office365.com
 (2603:10b6:510:327::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 19:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 19:27:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:32 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:31 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV images
Date: Thu, 2 Jul 2026 14:27:10 -0500
Message-ID: <20260702192712.3450652-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|DS0PR12MB6608:EE_
X-MS-Office365-Filtering-Correlation-Id: 8823f2ab-6f32-44c8-2305-08ded87003cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|36860700016|82310400026|921020|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	4vFD8Dp5D3UnNp3E+10PbhHTfVlyCOCFbURaT+FIYIF2M2Ozu8dsc0topIv+XPQBXK4+BYnhoBWxJQd+w32JLUA5849WGwXDNsB31oJHFwbN4raaOI2rxjt/QSLF5gHURpkPEKzyJ7RbGd3y9f3YZHkSDKqHherhuvXV5UTrizSoomSbL8J1OBMBiq+hnly/avLwGOwSNq9SWrgjrDzbQHl1/rtr+y/hYOGdTO1SjxIbpO+zOotWunWfpzcg01nrIeLuoKBG5Zp+sSvJqZfdcdKfebddPHYtFgc0wJluybL7vbgbjuzEFMmq5eQkV+tgtU/p1YMplYwpONt1faqQs/MOH9bUTfO0Md3JTVFZ7H9vdkN7vLIeY4xf0GI1FYkNTyHy/TqlbdfqYo/sy2WXdPZnnWnCOaMm9ILI5f8BjazADiDxY2C9KGlOXYSCkHpBPBbgzw6RStB6UGmjIRYsXLWkmmE12pCsbxPMimzzC1guwFnW5hQz0MnLGU5a/O7/VMR8hRoa+To/NnnYR4z3s6A9XSS1nECfK/S42VJlhkPLmUmFqbqM0kzthf8vTptstfzzoDZUIzUDxGpFVPPeH40mXDppah8ZBXSoycjRZcpHDbANNltnWVDuuP3WWSblZHZF0I+KP5XPWoFQeKvtB1a20bKfGNtX8fQv/1KE2t8bMgJ2zo9/BksKRtoJTOx0MCIs+CueaWmFXzxlQdBf1E5QOAh9+Vjy0ZpIw8KMPu3Ld5FWUqXFdZchH3ZqPvZY
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(36860700016)(82310400026)(921020)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iJSbboGq2ISYtHkEzD4usB3rd158aMMZ+nQxrx6PZrNhrO3zP2emokqPpLOWqdBko89gqJdA7mvbUix7JBD+e89LKxEkmUK8b3LVRJGGTrJvzzhgf/QuMoYpRPYApmVrAeSEPD8wd8BiigrIZykG37QNQ3Kgb+xQbIVfbXaA9jys4EyBiWZEGE32q3DJSinAfMXeFnOt5v84jfA5SCzzW1tw9orpmB6xj7AV56kikbi0UAqm8KHbLBqsHUD3tq06P7hvmaYSjIpF2b4lvK5l3tWX58nyP/buApe2XbEfHHwlttSJXXltenntwdFPk7RoWxPLXbH3Dr31i3RA8sRTPchA7Cl9Aa/Q2h/ZNY9IIlUWgmJOwv9gJkVlO6YgGQiLy+oPbyym4vIkr0zKOxkVemKcN5wdhWVYEMOQ05I7gF7AgV/jAM5fTr//iPBuYlta
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:27:54.3270
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8823f2ab-6f32-44c8-2305-08ded87003cb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6608

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
index d9fafd2eea5b..3f758784f684 100644
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
+        dev_info!(
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

