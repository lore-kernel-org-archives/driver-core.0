Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010005.outbound.protection.outlook.com [52.101.201.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F50937B3FE;
	Fri, 31 Jul 2026 20:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528660; cv=fail; b=jbsN5FOG9uJyl0pA78fTILpogWaj1g7c6xTXREtHhjiGDevtH6Gd6n2dCbBPPt1vTUEuUEluxhh9EQ50dc5YPAIlB2dCFp1tqfYIQwlU7ZGEH0alB3TjagBIcmr6Hg2uFkeC7pkWlICVvHyIDeXZPqtTHmASuelILSN6BffTHkU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528660; c=relaxed/simple;
	bh=lVsoN8yeRiRkjbTwMPACNI+34n3G5zyPAijzzYQWnR4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GVEo1xToxu9i0BmtsrNlB13neoHLG0sKAWx4/fpWqHcv8wfz1MQ4UuL8N7tPb7Tk2Rye//TvVf0PitwmMT2ukqeZoVGTY4HpkZS1/ZGT5hSY3edtwNPjZoHnSTdE/1R6nCYGfNMySbM/Vvc3/Tt93Fh2ubhRvQhUIVyPKKcXwNo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jRkD1tt4; arc=fail smtp.client-ip=52.101.201.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jRkD1tt4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LGSAuYGcRto8VBBJwDZmbcy57ufZqHSTNyKi4NWE+p4NU2mFd03D9vQTPU2+FaXrjeK3/MOfa9qybzlY4OvM9WnTKn7ekkjWQ92YtKnm9uDgZFDnNjkKueuElSbrkT384Qr5Mnul4K3fYlzSJQMIXGwXWwQrZgrLq98lflvu1Gw1llHi8QOVlkwpWT8D+aNXftrMwv1Az+NO1mgXeieKXhzUZSpY05cUB/A7Y8A/TZT4VwRrs8mCSrEqC9VgTmYA0VbML9PFSBD4ShOobMbx6iLhNgnthqw27nf+SVQDy3QTOEnEGeAJR3x8TyX5HUtCkUSBUgs+zUUojcaQPHmVeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jlpU+zO/Uj86g6C7Aru0QtLLd0/CionGNHXPcYqcWrU=;
 b=Qn+wDBnLksxJ9byaWT69KxvumBxqPV9UlrPmLvpahneyB9AnpdeDtBXX3QmlVomuK4EaHzT5y+9IuNmWJkklOpFWxV6P09WDzYxLldxaAIp0F/ZrHakQEoxSWU2I4tyOVy368pz/L+k8KIGFePlghgFhhGL89xWj61SV75JmiPowOZe7IjhuxkB3gtFmpU9pa5Qn3Wdzty87eV4EwtWaGYtHopvZ/K9TH3OG67T/eUYFfA3HlMzyWBLqyXcLlUyDBks7ozWbng3L9WBMUnZAvRAE3NaXNStsrpanA1+AQZA3TK5/EmFOHIe+V7+djEQP7teqkJTMLKZgxda0SLBwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jlpU+zO/Uj86g6C7Aru0QtLLd0/CionGNHXPcYqcWrU=;
 b=jRkD1tt48RuV6A/0nPNjabUV2pSQ2SuqwZJDVSRyhrpzYzSAOgansrwAlltvnwAOryGU3P+v8T9Nl++Mv1LgfD8DteakZcJ4lk/XlLwinZNiorW3+MkuZmSKaa0Nv7X9CF0cICK4s4ZpFGpUZdqa0HesZr+TUcUYkKM87z/SQGIghFzrhAiH2EIPzskZ4OXMibRR6y4/YmnHwsPm5X2yvOwZ72i9zRk+dGDqygHCwgOg5+iUhneh2YENB3NEjTywNL0H24HDsOqQgi959fyN9tUbko8+fOXQ8dtvjKnoQfQgK8BCglIiSjUZrAb39QWWvT/Z5fuZh08e8WebQJxqPw==
Received: from BN9PR03CA0347.namprd03.prod.outlook.com (2603:10b6:408:f6::22)
 by CHXPR12MB999244.namprd12.prod.outlook.com (2603:10b6:610:2fc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 20:10:52 +0000
Received: from BN2PEPF000055DE.namprd21.prod.outlook.com
 (2603:10b6:408:f6:cafe::93) by BN9PR03CA0347.outlook.office365.com
 (2603:10b6:408:f6::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 20:10:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055DE.mail.protection.outlook.com (10.167.245.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Fri, 31 Jul 2026 20:10:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 31 Jul
 2026 13:10:33 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:32 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v7 6/8] gpu: nova-core: transition gen_bootloader to TLV images
Date: Fri, 31 Jul 2026 15:10:15 -0500
Message-ID: <20260731201017.2580713-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055DE:EE_|CHXPR12MB999244:EE_
X-MS-Office365-Filtering-Correlation-Id: e51559eb-48f8-46a7-b047-08deef3fd21b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|82310400026|1800799024|921020|6133799003|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kFs3Ep6Jy2s9lTNGb5r0FCQwU4VQcr9tzo7qfLB8HwfqmPy+a9J8RqRZ4rBbqrf3loC/PlOlNbo58O1GzjLBF38dqnZUaRl6H1JnMvbI67r+FVpM7MVvEbYBPAJdoael5lcgSy+aLx+0FdnZzBZBs304dYzPGiwdJ4cVR3pGY7qwc+1wpOuOgMmmgdcyyquQpRn7ezovnaxbUTXQ7f16oCXBAqxDg2Orn7wXCzs3zrZ8iYsmp10mfqeFvM62VImUuyTUHA4xuf3KNmy3YKkR/EZ/QL4wGyFD3M3UgEqhGPNn2mi/Yj4sKKcJE9JnbTuj0ragnmvj1/h8vTpJItC70QLY8n+rm3cLiAg3sdJzJJ6OOmFFFQhn9XDIvu8Kc+vAzENJJefxg7FSVpk1fz2lY4uXQf2oN4yclDb+TqWnogMT/xmIrTADvz3TU49W2WzkFZZKJjjxY8jJUTCdpmhfugPyB5u+Sr6ZYB15Lhj42s9nck7e4AeJnXTBafmLUOu4rQMMkVg+43vPhKzfUTO+G1ubNq3SUY09HcAYYxEIeUgnZ3oQvmzEN2IWh9RzBDtQNlPP0oCNeXHLBhgWhtBRFPjvjbY3rmx8rARDFxPaDScT0kFCNPt8Qv+JaldGO/YGr58a/kYxsuM/dTFWZHxXzt3RgcVTHiPbCAp3v8j/pIaOcsgK0IbEBCgnSvB14gVoW03Dg1+RzNKkedJ25rq3KlxfaTUXCrsLrpHVi6i7gckxRGGYhgsJUqN1kv/njFiN
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(82310400026)(1800799024)(921020)(6133799003)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	gMdRjZZDfvzSwQ2tKeilsh1lSWnVoSYpqSGd1Hwri/1NO2kSPa/TX9Rd8CsdHjDNapb6zjmMSTAOcB4frQLjh1ca1T2b+imD8dDAnNgrwaIty0wyTQa2qPkMCu+2NsiIzD5V95Mmz9xkjZmDKTPE6cGyF4ML41W7uOmqiuE/kMZDphPfmwf8wTkpWQAG6CTRSJfy948sZvsy+8bfRvovNwJK82Nc8KtQ9PB6BIVYZVzBFs/EzsjsIhfk5Auoy6+ofiY1ID1J2JS9/xZCC7NqbFwR/dCwr/GsspNRL0zEjcziuKWMBeq+LjKXZTgNKc9f4shqydnNmjrM3cy5ZI+gxc7yg57IXWplgc53Z8MkT/qclJFcXWo3mLF6FZOTrzvWB014TNiVGeG+4WDpHq0MctShMJtQ9scE9M4MWkE3dOdjKRa77/BC0NDrueJqAd3g
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 20:10:51.8386
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e51559eb-48f8-46a7-b047-08deef3fd21b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055DE.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHXPR12MB999244

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

