Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010000.outbound.protection.outlook.com [52.101.61.0])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC663C3447;
	Thu,  9 Jul 2026 21:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.0
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633204; cv=fail; b=NafbE8jvv1vjgQ2HmaynMKPf/XKl7viRzzEG2JvoYtREi18dxfDlutEbwdzZMOKSb+KU4IdioGT3mc525oyHtdtruDOuiphuH+BWjQ9utT4ZZ0jaeabO4XsfR6J370PiC5FPJevalSy7y3Jq+E9pfABq/1EqGAYdtg5BG5KBZSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633204; c=relaxed/simple;
	bh=xZAGhq3HEmRq4IgefT0/cgAg8KOhEF9257ZDsK2O5MA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q8wfDkiLx7nkXutaw9dDexN8BkJPu0SioeoY4yP60TKCFWdqtq1zKXF1d5abYeiH+UujxeAJ6fb4wcZkAKwKlZNsmwk6aSsKVUcxQ2BI7gzF+iTq2ho6qg0wXh8eLF63edtH8aZHljDAGLYYN7KjSgAke3yk0AruDJsP/+huYrU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=okpQGUV4; arc=fail smtp.client-ip=52.101.61.0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="okpQGUV4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VkuZ3fUc9JaxCkexqXOdH+ieji8U2Zub+5WohoPOFYsacc6sNYNLBuryTfKqNS7bkVbi+9m1sbZSveI6eYasfICJ5m5r4Tp8Bgmmr375KFTUj4/AlFs25F12osY8m9/kfjwN/Qdcmwo56iAopSmUqGO9Vi/Z1oUxqLJQyxv6x4vPk4M7nW9FoFjxTkAExsXtiliB3MGaOCBs6u4NbGc6AP6yVIzBVRgMtZlJLt2j1EFhNjYgDiCjM8qxZ6irtAJVjixfGHYf+Zd83xY7kwWZa8u3lKBQGMTN9tDloyGPyW3oGe/4V9iFzTdPs+s0kY7vW5GLdhDwxqUhrKATJfxz0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=awbkIX6DIkbwJzw2MCmv8SAEL/EGypIs3zJ//xAeywI=;
 b=LcjhUwj+a50H0Ld8B8dP5ReLMyUk1pww15hsiPXXcaypTj3jMscdoWEPPPet7rjZ8cmiiEZkjYoEP1cysHCRzCeBDvRstsbltxqrPN17x/5t/hiVIJdYyYuXW0k0kDTL1RYLYLFGC/dhucbXe2118t5X/dZvnGpJicxPz74KNJGz9RsNu9OMelNQ8dzF2jcV2oKzvIMSxaVo3x1ipgob0zGZfOBtPCR4dvdGQnDNncEjPO5/acYOD5juff3yIHoxcxI3DJOHbqHBNAEEoio+AIWkVYU+1FWsKK4fx0uAW4Eti6BSVjouvFIDrGUcyMkaSGhHr/nSopY94wBp1bNCww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=awbkIX6DIkbwJzw2MCmv8SAEL/EGypIs3zJ//xAeywI=;
 b=okpQGUV4bxM7vdWWAd/qrUikUDxqaG6UMnNjpOhPzNhJbFsqEI/dte2eWdLsYrQCjDRL8XqIFIcUOlsF/0lgAFkZ0YCOC/UH3/8wmwwOMHTRJ+R9Sk2P1h2cj/H6bidpz8CRojmPOSLF2zkhLJxzK02OE+nzGKDFlDkbkXQrdW8gXNayIKgn/MnnAFK3tsIvtEa96YMN24wRni3lsD73KAMSJyLLDHhMkzfLEZAgG3w2eNLWyyfQcvKpae02ESGXTs/ttNqxbPM3xWDLtMBD73M19yGFGMwsX6pVynYu1dE/z57XYNXie6baSVPKt+tKBJuajitVbyRbDDNB9vyPWw==
Received: from DS1P221CA0004.NAMP221.PROD.OUTLOOK.COM (2603:10b6:8:451::17) by
 SA3PR12MB9160.namprd12.prod.outlook.com (2603:10b6:806:399::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.9; Thu, 9 Jul 2026 21:39:52 +0000
Received: from SA2PEPF000015C9.namprd03.prod.outlook.com
 (2603:10b6:8:451:cafe::47) by DS1P221CA0004.outlook.office365.com
 (2603:10b6:8:451::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 21:39:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF000015C9.mail.protection.outlook.com (10.167.241.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 21:39:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:30 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:28 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	<driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
	<nova-gpu@lists.linux.dev>, Gary Guo <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v4 5/7] gpu: nova-core: transition gen_bootloader to TLV images
Date: Thu, 9 Jul 2026 16:39:13 -0500
Message-ID: <20260709213915.520109-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF000015C9:EE_|SA3PR12MB9160:EE_
X-MS-Office365-Filtering-Correlation-Id: 482ae140-8278-4328-5360-08dede029bf5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|921020|56012099006|22082099003|11063799006|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NGiTPj8mbmo3085Uf1Qp6Dqofz6J/PRPfnjcy085N7F/B92nuMqJnhz+nwqD5vKxeYKy+MlW+/qals7Be7ayNwEYiD87c7QsLLx6AQTfWyeRjtyStThX+YPx5cjRtwhUQlvST/KATYTdG5awVBL9bPuiOwqcruKroM/31/aWUnYUUHTb115bIo0SYUXMaf0fUCMeJ4JJ0AOcPvnA+yhgr8sZn/1KUvB/O+aHxb2OduoX7fCNl7nluraDuZFcdHNpPHxoUsElDluA20hSwZL49gJLWLrqozSu1qBPn5LjeoqFCtUm/+CiS4kwl5HDcCgP8cp5aUwNwpexS9qigw+L9GUeAM4r+FeK9V2mymL9UnQZVoaMZsePP8kB38697zw2lDN/bSzJ7RbUDj6eNVSGsuWOgUPEjsYsdnCGLtYGQPzUNxNpn9MUveap6mYEuqzp9+V9OdUzMLTmonWNSF5QOVw5UIwyM+LrvdzMq+K2VWZy0XI/RW4hw5Zx/PGcKTv7L9zkpbNRKZ/+Os0vXSi6xlR6kp1mOxhu8kBTAOqmqFjHjkWBnskxTWDi/fSp1mTN2eOlGrtvNhuSwqrG198yUMlvder5OjQLm+wwzYzRadaYW5SF7h/4RKDng+Rwjkhv4uWKM7NEgc8BIsOAlU9us6bjAeLFG2LSOBEm9BFtnHETqZ99nUQfhaVUDqcAUFOkAEl3HeK317kL4ghWwdw+oyfzK7hc0TMHd5KpbGH78ClF/xBLGUXrQb+DYC4SRJwc
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(921020)(56012099006)(22082099003)(11063799006)(6133799003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aIJ6HG47IRuXxhTstzihCpBJcbtjVmoNgrF/g5HFUSkQJB/ElMgWC8PLNsnaS160ZlSzrzzxR+GjNpF/f/b3W07pv5jo3jhsDG8A7bli0U5r0bEUd+vD2yZc83dTNXkB/FtxSXZtyZxWh9K7y5JnHkFkKA4D4OoZtkCKgPL5gB7ESTSqgK9hCYtw8eAecad12Tv24IXdFaOzn9+Doc4d0QnSomgOQbxHSO8fM3fRzzAiC6bvkPAO3xm11e285X1kDi5bwY1z5pgbiU1/nf2M8pcP+Dz/bGPl2SzK5LvcGFULhg+iyIrVbgyVa5BrlziDCy+rzhlELuSPoT3rtrkL/62Ne4qOKgAX+GDrw+lR++pRNcvStZ3ddgxgMkYNycsH6b6meoIOVIJ0jHiSGA9HzsFAV3yNEcnd8Fekn55LnaSI8pD6//YhPGBSpKDPeOC7
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:39:51.9504
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 482ae140-8278-4328-5360-08dede029bf5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF000015C9.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9160

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

