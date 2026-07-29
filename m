Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013042.outbound.protection.outlook.com [40.93.196.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58FE7420460;
	Wed, 29 Jul 2026 22:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785365786; cv=fail; b=TIcSvzWEA3ZRJCToTnpCAX0ucxVdhkTSBgdWqigO9OhjspYm+SI1Tj1+DnzAzUugp/B7rooRMw7awgVEe2xNsneF78FYUP79s3BhjTYHmOB2pk5mpG0Cd6ZQ587g7TEZ8Af7lklaTmiFp2JWQozx0oqjoX/sG/3AApn4G2Y2BsM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785365786; c=relaxed/simple;
	bh=lVsoN8yeRiRkjbTwMPACNI+34n3G5zyPAijzzYQWnR4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VaA9aGcipPL5ZtHPm0utujiag+ZfUCX3VKCXwJSz31A/dyY8bXW8lcS9pKhtTR1SeWXFelzI7S0iqKhvUQXsqvpLY4MgbFCPR0BZ5p2uGmhfERdbxwU5hMQUvDeKkwK5QagixLmBIEvBbGw9wm4x2KdojKtrbRnScgGYqNZWqck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GyBz/BHZ; arc=fail smtp.client-ip=40.93.196.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GyBz/BHZ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e9irFnyqG9ExGzY1IqV5TwaHuxE7umrXOuHNL/HbHdTuIOPCBQgeNfCIWtch7rpKwnO0N5mPhO/Jk23cDVpTtAwbX6SerBvHDGRyOjTl/wRMkmK+sUfkJegyzU/C4sZqduUGt2+Pc+UPM6A4aBgsr6GuSPElCPiQo/uzqtLrqoVcniEKEBY3l24V4A4V7wmnAgQ+LczDQLR+4mJkBsvuz2zXK58UNxaAC2YFbeWtwlGPm/pB2fHca8ejlKpnRPbfw4zoJdN+0upNEY6gmJwkfBKM+1DQWSOqc8F6CwLP1KUS3HutWyjOi3ucJzZFGC2JlmHXQ0+lYm9m3r5pe1sAMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlpU+zO/Uj86g6C7Aru0QtLLd0/CionGNHXPcYqcWrU=;
 b=GMfBkepSJ+lmFi19n+Lj93KzX29+JoaPw8t1v3m/4xQl1MXVn7EMVAopVIIOmnvdKexZ9QIVqMGgD7ld6qH/3KrUEO2Xrn5xTpTTwuNkKcsfwevtMxmIsTr8SJkZEn78vlEAcm7dXkOLTceyH7x02bHWNuzY8P/qsQt3U5RXO2xhrncag/eWQBOvqEABLP6h4AgfAv9L4GU2HHga2b9jmWdeDYvnn8X3gvqWWKlzvSn2s49OydUmyJB/LP1jStY+nQwcp+EMYpoCCiFTgTzwksonYEIB1v3Itj8C/P+48YBCxDr3Y9bC6hLOaqI+9rVA2m51hydbBAUKqmXrENnDxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlpU+zO/Uj86g6C7Aru0QtLLd0/CionGNHXPcYqcWrU=;
 b=GyBz/BHZQudtLuoU/fezyfqiZ37ee7/eiwPQBamS9uzK3gwSZZBjOKXlz5hBl4v3AAzQy41eZ0WZOviW83URgNBpUYYUifLUhNoLz+kKtGKB1fgIrKHyCXsdtaExoAcgMYBJaLidlx0XPt7kcG4j7dxmC0A/D2QTC0Z0Ees5xjaD2noQT8nAX1RCwPglzDJLoP70+U6rb3acDoHC8OByUhNKnkC/Q2uq6VINnKSH1X0cAqpfWgVa/0SOod5023wfBpNU9ClWkEAtIXnlxlqYOiLcy6V++VEOmHzk5mYyP8p+yG7arOjnQA4h6Q25dTfOWl2BtlF5+rBip7EDBLbItg==
Received: from SA0PR11CA0072.namprd11.prod.outlook.com (2603:10b6:806:d2::17)
 by SN7PR12MB8435.namprd12.prod.outlook.com (2603:10b6:806:2e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 22:56:17 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:d2:cafe::98) by SA0PR11CA0072.outlook.office365.com
 (2603:10b6:806:d2::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 22:56:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 22:56:16 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 15:55:57 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 15:55:56 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v6 6/8] gpu: nova-core: transition gen_bootloader to TLV images
Date: Wed, 29 Jul 2026 17:55:32 -0500
Message-ID: <20260729225534.2046933-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|SN7PR12MB8435:EE_
X-MS-Office365-Filtering-Correlation-Id: 46cfb46d-ebfa-4a0f-c850-08deedc49915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|376014|23010399003|82310400026|11063799006|56012099006|10067099003|18002099003|22082099003|6133799003|921020;
X-Microsoft-Antispam-Message-Info:
	ttxHG6rHMB0XM8p4OCcSYSHaGBjNUjpbonf9XQU8KDWQp23FLCt11UL8xTCAl0vLtxN+ZyeoN5G2og1mGsnNZsmgVTQFovC1RWGpOfp7A0Cr+L2E5YcOQ+4UOXOhIJ76myemNYHIHBsrsHvA/WdzHKh54C0JvUJYDB5BRPIvBd4oBW2C7xp7jZPUN7wn7AxwJqMmP/z+ULMQHAVDynHJIgZ2BIy0gCwCBOqOy+LDJgI5NBvvd6jtnav0XoDXpAg/+7HSlhtITaqFzxE7mMnYKL1Fc/GOGBKYLzHCg8berLS4OTwblbPSBc4C8cVhhJLg24QsrbW6nfOxmkwnQMDr7CryfSW+qIt0cpcW+q8+KJa1uwuyXufrctUlCxr4MqKJhl59wr9kCjAZ/0yKTZhUrqBA+q1/IoidM3gaZ6qadchAoa4D7pRUdM6+qzdTQlMtsiPSd41Hy5YcKDeGNBbMNXjLmLqmMBZ+hGCc0J3AMVxQtovfPSE7g+GqBgz84lEIhzOl9IoMym7deBI4Ar6bDwe36XAv3I4AihRstURrg+aEKqDKfBtgHHTdvU7PD7OhUdOX+h8EzlnBChhPA5kbgE9PNErdjcj9kIsaZ6Hi0wK07Pcd7aEfQiScBDaA5QSCcYsrGEFSFPFZr7m55cJvB/cq3jszFOBGI1HRT7+LrsHL/Pw730FfDK/zbKdHqeedkQToO4JVvs1mEKhsS/bR6e1zRdVH03xlsCoc5PVM3+p+VhkxVJwfa0n90vSb7+1L
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(376014)(23010399003)(82310400026)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(6133799003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	0N1+eeVX6FzsCJEBswyMh/gRhil8SfvmEaL9vODgT8weUVy84OCSqjQrzJzTUtetadyvXLvQ7KIWw1uZmhk616eibR1ju8bKbdxknDhi1vc/LBswnEqAaTShd4u7P780uQpwolEJaIZWS60YChvl+9ZzQX0yKuiR67Al3jiGqVaBJu6LhTQQjCw6cCbL7lRmawxcYsMywaWGgtI7had+E2rPJNaFUN/dNiTIaeC///flByRzx88Lac/oer9P3V2NAq2Kb676ZdrNvqDST2V84rMLKu4e4kmm3AI/hDLl89dCc3bMadOtp6JZ4UeAFdx03LvBRSAGgNafFP1oBG25diAdRPYSYfeqWyyydkmL0YHx4Up9kwgzrxFoDmSggLAy7at81j+5FrjuCc9koLCYJNO+2XPjVHwdT/EuqXC4EIDnp5LF5rbzEmqJ98yGc29w
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:56:16.9528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46cfb46d-ebfa-4a0f-c850-08deedc49915
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8435

Switch the generic bootloader firmware loader from the legacy binary
format to the TLV format.  This change requires the new TLV versions
of the r570.144 firmware images.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs             | 24 +-----
 .../nova-core/firmware/fwsec/bootloader.rs    | 75 +++++--------------
 2 files changed, 20 insertions(+), 79 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 3aa0137cba53..c285e57268f0 100644
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
@@ -344,27 +343,6 @@ fn no_patch_signature(self) -> FirmwareObject<F, Signed> {
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
index d9fafd2eea5b..30d247b59848 100644
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
@@ -146,38 +121,24 @@ pub(crate) fn new(
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
+            let code = blob.get(..code_size).ok_or(EINVAL)?;
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
+            ucode.extend_from_slice(code, GFP_KERNEL)?;
             ucode.resize(aligned_code_size, 0, GFP_KERNEL)?;
 
             ucode
@@ -258,13 +219,15 @@ pub(crate) fn new(
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

