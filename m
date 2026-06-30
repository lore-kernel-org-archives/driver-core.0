Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013026.outbound.protection.outlook.com [40.93.196.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D7E421EF8;
	Tue, 30 Jun 2026 19:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782848921; cv=fail; b=PVzZlD5EifxFsaOBQt/QyTtNYJAd6aTEQ5zc2W0hW+WSg0wJzgEHsW2OdRsqtj8KSXrcWE9bp73keQQfp2dbFmU1wdT1MzCyj684/EDenafZuYWqlxsDO+AIN7E7vIIxZDVOaRtyLrTw3a9qgEZM7pA+W+moKi4cKwcsRMucUtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782848921; c=relaxed/simple;
	bh=SPT/0l9rix0b9pzU/Jz8Jt9Ha7DT2iVjxlR0szHMSCs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BdL70TQE1zzbkjDseEy54+Xp1SK8BeF0yHSZ3Zm9AbZT8wTR80mHdGQ5DTFJsUFgLjwhNw+3CutUMZd1cf46zilL1ACKPTVj47nFUoHP66zIBKtiwOGO7k8c7dMQLp2pnZ5th0Ws4p6+ITdIjejT/TlzSlXeM84SfXseuknFW2M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AaotJ8C7; arc=fail smtp.client-ip=40.93.196.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AaotJ8C7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VH2REIDVoRO8rlNuQVRL0zmvfBxZilR3Nxv+2i0B0H0BvIdbSjMsga5rlyZEUWqdj7a2nhytHdRdGDOb0wrUtuE7Re9Oxk6WGXY29ucD3ms41hoaP+i/3Y4tRclvqe9kjrGRs2bPekShRR6Rmh1XDh887WKNWQ1KHmo+jvjXuVLm6G6qC5R78gZ3sy5UG/LGbZswXlUeOYMhzdc9d9UqTHSEn1Uv62elNPUfEEUa13uhIkk+edKqS7KyOYr7E07ANvWnzioUrYaKDQ9LkLPUhwgd52czUbVB3+9K6xmSEBbivw/x1BEueJq6aFUr6L0vywndWUAo12tTQS3VdyZ6uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7+X4EZDgatObS+hG8Jv2BfLKmY2C/36BjcQNVudInUE=;
 b=Dt29UtjbSdVHE2vaTCdgNMsyErwDSBHJD2IkMg1h3yKGwse+U5ipUHxEUNqaKimVFQl0auCCoNt+ozTdefJ5gbo1BZo6JnAw8qTPCK1/tU9DX9S8aWIPeWcljZ34q79cxboQWlsIVRiLG7Id+uDeq9IbXejcM/jtH2FWzwLXow3YXPb6PEQTBXQsPErwZI2QQFot/xwyNK+XlRibLXZRHjrf2rDS3iDtHPTmZlE4WPE/BDVFT5ikGqexmSig3XQlQscIpACeLe95ISb7zrX4DGxLYhN8Qj3PPEiM86LqJ82iBAnivURndblLqEi9jnmoaQUCSEjiub2LXWGjhDta/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+X4EZDgatObS+hG8Jv2BfLKmY2C/36BjcQNVudInUE=;
 b=AaotJ8C71nwKtILI8n9ElWeJ7vg0r+h47LEZYLQ5j05d20mH3jfCH3Ev8x4K5m8TKCj8VrdgTK/B3QlYpxLyMr1ZvjLlF1Gtg+VM5TIhs1/hfJX1nR/r+7nM36wZ19AAH9ch7HNDhp2qUiswEbrQpWcELGC8xTV3BDmCpgNdahJMrBMgH5cONaKmA/xW+qKiBBoBmRZ1A4VSlU4DWY83h8y/pd3UE+qPOIe1di3z3i/9SLRihvcjWbBJ1D30w0SwNKkra7uT37zYmFjBj8FJ1tjS0OQMdtV7u77hfc8ZmtAAHQY6BaEYGw0onHkZV6YEMyx2V7RGVk4k0sg0xhEhGA==
Received: from SJ0PR13CA0166.namprd13.prod.outlook.com (2603:10b6:a03:2c7::21)
 by CH3PR12MB9396.namprd12.prod.outlook.com (2603:10b6:610:1d0::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 19:48:31 +0000
Received: from SJ5PEPF000001C9.namprd05.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::9d) by SJ0PR13CA0166.outlook.office365.com
 (2603:10b6:a03:2c7::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 19:48:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001C9.mail.protection.outlook.com (10.167.242.37) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 19:48:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 12:48:13 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 12:48:11 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 5/7] gpu: nova-core: transition gen_bootloader to TLV images
Date: Tue, 30 Jun 2026 14:47:47 -0500
Message-ID: <20260630194749.1209490-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001C9:EE_|CH3PR12MB9396:EE_
X-MS-Office365-Filtering-Correlation-Id: 86016c5c-fb0f-4de3-4ddf-08ded6e08fa0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|82310400026|23010399003|18002099003|6133799003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	oPfImZfvOrLmgb+mzwR7HOM0+JFzCZHugiqu569ydp9Gy/sPP4b3kklrV4FFIDGrluKHqxS5+atw/NLtOgNWkqFjSXzqfv31fNwrwq9Q8t2lZgapgo0uFbuWvii/j2FNi5ERpg4bt20IeCpDG5IF2cR5uOpMYxDe8R4zP1KYF1jOpJQO+dLvqliZKXpC2F/4m/9IzuED6uKqsfqgihKgsQwk2/CFPOj1Y1SOiWoA0Oo7BkT6PWsKjcvrQltcBVYG9GlfhS3VvOVV/B8niIvR0X/R3xZsyCHm6sBdiecpPiRX75DAasIKFXkD1vkZ/tqdWvNZfiqO7jXUpdTPfS9PqP3IFf1bBuojin3vv5gIawqu3+rr17RGk7hUDUBZ3eKFkzBjdhc7pDAUrJgx4+4ZrVVBFcoBxS3a3xqy37emRLB3A9bQ6cEPWFsdlwa77S5GjbVYYHhnSLtOSOsBUZ5FgWXgbRD/sW0xcnN874VvXEh/q78a7DbZ9zMmFefaXrhIR0oHNBnSaX0EmNMtCUggPCQlmskjT82S0VhbRFC4Y039Sb7tn+6oAAzmHx7caadHH4Aa8RXFssva13Lh++Nm3Rd0ekbVVGM/aX2RinWmAeDK+VXVZCJGcrnNcdTSwnZQ+mwRtQ6R7LJGYC2tharD3L8EPa39ZfExMhNni32TxmwTxpzfQNqwSXoScgTi2Ql7aAz7zEZ1ltdfED+dqew1ncYrlbD/YZ8FnDmEjxgwjxEAz3bTqnF6/drzZct6nY5c
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(82310400026)(23010399003)(18002099003)(6133799003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zb53a3wPK/V6ZJxfQc4gzyFYmSW7gyd/G2Bi4g/lGnNs66SmVk8yxa9l6CVGVVxbNdMePXPtcJSYX41Ba2FC+PAFFi7J0ETjY2LTLwNv7IHc+LVbmVPd4xk+IQoYGjYkhUBYUtKaa3cixz1g9wqXK60C0YEH2QCVqr8C6bSRodMJk8zySJ59zOmIGLa44XfLFlwp12TJTiPhPJ3B6Ak764IelJcQYJAUnWeKh0lvlYBPiUCy3VA0G5ZJP8Lk9OsHkt/yzQ8UgYt+j5I3inJgBVfkYEql5+HMfWvyNZP60fmLJTI7kqAdKdou47KJwHCffUDAsa/oXRPC0jRO7u4F7WdRfCRFY0E/dytfrJnkrR8KH5BAFaP3AbuTfqY9/IAHB99GyI7eZKY5ytkmA8H9/cNVdHbdLcMK8w2nevy/p94564eDaL9o0YzWgXxjlB9l
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:48:30.3430
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86016c5c-fb0f-4de3-4ddf-08ded6e08fa0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001C9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9396

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

