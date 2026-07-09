Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010046.outbound.protection.outlook.com [52.101.56.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC3193CAE73;
	Thu,  9 Jul 2026 21:40:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633207; cv=fail; b=dnPi2ca4zWdQUjxvJ4yJme5B0Qqtpf39P6sXEHm9BOYvul6o0FDBEujbKOWknZhU4hzwfcAdjMzUTlGPntvxMJYuDiRM0SiTLXHChfDvzTtDnv4uUToHQUcE8aX5Embk3G+mR0WoMb0VsvHVAYonliouffnc8e7TtpNInmJLymg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633207; c=relaxed/simple;
	bh=qG9Vl8bG9/JpWLBhkG/JQJKeRrdk5YUnwgYX79ypaVk=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=r5aMJIyeeB3XbY/aErYFho1w/Msvgwic0LKvmPJljZwm2bTL+EO3GV12RpjUZEAnn40gYo6r4dP8agrHEBn6dRe4tad0lb+V++mPB7esvEDMQ0JXyNNBPF8/HSdhG0vf+7hBEo1gMIdQOAj3cltkrSNL18onnNJ/CGozYVG1oXQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Ju7BTTBO; arc=fail smtp.client-ip=52.101.56.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ju7BTTBO"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fAMDqepZvWDNUAy40r4WLSkoHVVDeILFJSO6QXTVCeL76i0W8fVq1zZZ2Hg5MeNzlPPfTFuQHUQGOisghXY1cq0goeH+/aboqunKdw0lzBucUZQaDLEGC5LPdz21nwIkABRxBvFV92585Kkz1SdkuY0QTD+MBTnDQI5SbKHRXhE79mxd+6eEJLRNs+V4i6MobAKqyZv4CpQQ9iuaRfPR/AQ+Ty7b9FLT3cRiR0pgfl3DGDlauTpisPdlruvrY3GqtNT0Q3BS+Ayp+793/tKLw9pPouQpB4hlS7VnKvyirxziEkLUem3Cz+fFGqLHjxlZ3/Ejz39L5C04nMKOuZtO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abQvTaoQb63SY18cX/7oWWPfmadZZwQ0fWkmSnIX6HA=;
 b=BJVJZE0O9b6uDtOZvRLg5mOQUy3vU4IxTART33D2VNWXx4xOmxv8ynVE/sQT8oAYBLqTI1O2DT79E0jL9JXSUDnrCO5CFJ+yLewHy6GqTpPvpv1RixzN90qmchf2J4hudvlwvPOmlgvHzYtLHf7r7fBBkhfzgMEtEE5iufBavb+wiHBIe9OJG/U3BLhboMt9KXhPKDgh8af9TxgE4qNYPZ54c85e32jNXWvMbBZxE4NgvNGCOo2ifevvCQOA4CKI1CujJuN4wCJwPr3Mgoo/GVnKGQWpHu+SnUyctVii2XeTrPseF976uyAQDYBMipctNJvq10hSIR9QH40jZzQ02Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abQvTaoQb63SY18cX/7oWWPfmadZZwQ0fWkmSnIX6HA=;
 b=Ju7BTTBOIxLbULN4owjKD1A0h4rrKQ8xIEDgAKG3Hwu0zowlYIzvfMyCj0ZNCITQLRtvlWlg2UGCQhza/ENjtcbwGTPGUtNJdqiwODwjhOCAqDW89mCoyjUiLYWrzhaKa/YCZ5UEqNovanjbaRZe13Xouks2SGN7Fa35XGfvhhHT8S+xjPho+Et5+LTjaqEOe97CipIV7i/SCSITu+bI35d93OaC3IomKDx5lDj/n09oo21CBAnHelib1bxGJwqPwwGdN2FjQeMxupQznk1scDE6+69ZeCNKmOEwN3sjgrErjeM4trkrCXbZ1qCdTa61w+WofY6dGxuR3xHNQ7ruGg==
Received: from BN0PR04CA0159.namprd04.prod.outlook.com (2603:10b6:408:eb::14)
 by BL1PR12MB5994.namprd12.prod.outlook.com (2603:10b6:208:39a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 21:39:55 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::88) by BN0PR04CA0159.outlook.office365.com
 (2603:10b6:408:eb::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.12 via Frontend Transport; Thu, 9
 Jul 2026 21:39:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 21:39:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:27 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:25 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	<driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
	<nova-gpu@lists.linux.dev>, Gary Guo <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v4 3/7] gpu: nova-core: transition booter_load to TLV images
Date: Thu, 9 Jul 2026 16:39:11 -0500
Message-ID: <20260709213915.520109-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|BL1PR12MB5994:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a6925f7-fb8d-4ec4-1638-08dede029e34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|23010399003|11063799006|6133799003|22082099003|56012099006|18002099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
	xPM69QUnqs+VhaolUEjsDsSht4g1lr0XwTN0nimY714g6Zef8tZpi/LRBswvFpyusMfCRHMJcuHKwVWPozd5bjIKHxckcaUr1s1A9to/TDpBwN0eCRlC3WJB3E9T1OBwFv6ldW6dKE7iU+YstjIFJyPBeFZL9uF+3vN/g/9ciALS67jvLD81gUqvzfVzBaV9yk4AHtj8pkFTGO45Cy4pNINM/hV5I7fUWVwwSwgxLb+jus6MON//P+pZfCZUB2bbmNNOHvsxU5tCJC295ndXBH3SByl411zUiGmVOwTeso5RyK/VRaLpF79IQOR517xL6XIXQ9lALMSL1DQHMSS4pOAHCO0CTtzGjNQAGaxzPUCCZrAe7NM9h2wduWSLwj+zcO//b3I9e2FrrkmtXcOG/jVydt71b+e3XumW71Hp8VVDEhGSZI3B/6DWIHa9JtCz6wx3pxGHQOU3efa+o/KrGkO8Ah/USfTP9LpODimC5tz9ECizHCdprIplnGl5ycFirHBGEOV+ooJUuvKqSkQTtw4fkK1AhoY8DkpEBPJz+HYWoPLLyjfzjYkhTVrVtEXKLBm1YzXdqijQaE7ES022qW1tucRDhfwnA9tx7mJVF5g1JFtiXyC1ETSMpukaQSnj98Z+oSxEqohfcDZjQVfhslIbwajKgd0wmRJ8Oq7IU85DC5IHRn0RYAxkC7Xi/h3Di5hAwV6BJqi9yFc7wJ1nHOVJrdZO3g0/jQdbeDtg/ps2SiECGECqs0CU1g+7IxrZ
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(23010399003)(11063799006)(6133799003)(22082099003)(56012099006)(18002099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	MP369yUvaETRBdJLspjbzYFu/DabH1NZnbfhggOqP/jqlcJL6PvAInBYYK4zbr/zK5qAK+afqTxHxPa0SHqqROHS2JdnuiRPBFANEDEWad6nM1RjtHzEg9o2OZ6xqXTt6XpQH5Qh6duak5mN8vrFpY5n+zIQOSkogEDjcUTs8Bz5HY6bjpd9HdI5sid0sX2Xvzp6e1H/Z4NAlMpi+voa/A9evvfWr0HuOJ3HOhdQx3rzPBkTapqcEcAjBhGIU55JIM1wCL8fnKGbbgqDb6AzN6H6bJaWh8BjYX8N+EOzCrhss5XXDg8XyYjXEp4LxEYKDR2yEPSGWYWq2oI9sd7PmXK6hRzrz0RiqCZwSBMIFg6pLmK3Y5XDr/dNWgXwsgeAO34UIu8s5WZV+67c+fujpKVnNsY8lkhqOFDD9zGKSxNIvnwY7LEOIA0kJieNGnoL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:39:55.6814
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a6925f7-fb8d-4ec4-1638-08dede029e34
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5994

Switch the booter firmware loader from the legacy binary format to the
TLV format.  This change requires the new TLV versions of the r570.144
firmware images.

The new TLV format has all of the metadata needed by Nova encoded as
separate tags, eliminating the need to parse legacy firmware headers
such as HsHeaderV2 and HsSignatureParams.  All of the structs and
code for parsing those headers is therefore deleted.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs        |  15 +-
 drivers/gpu/nova-core/firmware/booter.rs | 329 ++++-------------------
 drivers/gpu/nova-core/firmware/tlv.rs    |   2 -
 drivers/gpu/nova-core/gsp/hal/tu102.rs   |  13 +-
 4 files changed, 62 insertions(+), 297 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index c0cd06579643..7634fe292446 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -21,10 +21,7 @@
         FalconFirmware, //
     },
     gpu,
-    num::{
-        FromSafeCast,
-        IntoSafeCast, //
-    },
+    num::IntoSafeCast,
 };
 
 pub(crate) mod booter;
@@ -388,16 +385,6 @@ fn new(fw: &'a firmware::Firmware) -> Result<Self> {
             .map(|hdr| Self { hdr, fw })
             .ok_or(EINVAL)
     }
-
-    /// Returns the data payload of the firmware, or `None` if the data range is out of bounds of
-    /// the firmware image.
-    fn data(&self) -> Option<&[u8]> {
-        let fw_start = usize::from_safe_cast(self.hdr.data_offset);
-        let fw_size = usize::from_safe_cast(self.hdr.data_size);
-        let fw_end = fw_start.checked_add(fw_size)?;
-
-        self.fw.get(fw_start..fw_end)
-    }
 }
 
 pub(crate) struct ModInfoBuilder<const N: usize>(firmware::ModInfoBuilder<N>);
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index acb7f4d8a532..6e7d688deadd 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -10,8 +10,7 @@
 use kernel::{
     device,
     dma::Coherent,
-    prelude::*,
-    transmute::FromBytes, //
+    prelude::*, //
 };
 
 use crate::{
@@ -24,224 +23,19 @@
         FalconFirmware, //
     },
     firmware::{
-        BinFirmware,
+        tlv::{
+            request_tlv, //
+            Tlv,
+        },
         FirmwareObject,
         FirmwareSignature,
         Signed,
         Unsigned, //
     },
     gpu::Chipset,
-    num::{
-        FromSafeCast,
-        IntoSafeCast, //
-    },
+    num::IntoSafeCast,
 };
 
-/// Local convenience function to return a copy of `S` by reinterpreting the bytes starting at
-/// `offset` in `slice`.
-fn frombytes_at<S: FromBytes + Sized>(slice: &[u8], offset: usize) -> Result<S> {
-    let end = offset.checked_add(size_of::<S>()).ok_or(EINVAL)?;
-    slice
-        .get(offset..end)
-        .and_then(S::from_bytes_copy)
-        .ok_or(EINVAL)
-}
-
-/// Heavy-Secured firmware header.
-///
-/// Such firmwares have an application-specific payload that needs to be patched with a given
-/// signature.
-#[repr(C)]
-#[derive(Debug, Clone)]
-struct HsHeaderV2 {
-    /// Offset to the start of the signatures.
-    sig_prod_offset: u32,
-    /// Size in bytes of the signatures.
-    sig_prod_size: u32,
-    /// Offset to a `u32` containing the location at which to patch the signature in the microcode
-    /// image.
-    patch_loc_offset: u32,
-    /// Offset to a `u32` containing the index of the signature to patch.
-    patch_sig_offset: u32,
-    /// Start offset to the signature metadata.
-    meta_data_offset: u32,
-    /// Size in bytes of the signature metadata.
-    meta_data_size: u32,
-    /// Offset to a `u32` containing the number of signatures in the signatures section.
-    num_sig_offset: u32,
-    /// Offset of the application-specific header.
-    header_offset: u32,
-    /// Size in bytes of the application-specific header.
-    header_size: u32,
-}
-
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsHeaderV2 {}
-
-/// Heavy-Secured Firmware image container.
-///
-/// This provides convenient access to the fields of [`HsHeaderV2`] that are actually indices to
-/// read from in the firmware data.
-struct HsFirmwareV2<'a> {
-    hdr: HsHeaderV2,
-    fw: &'a [u8],
-}
-
-impl<'a> HsFirmwareV2<'a> {
-    /// Interprets the header of `bin_fw` as a [`HsHeaderV2`] and returns an instance of
-    /// `HsFirmwareV2` for further parsing.
-    ///
-    /// Fails if the header pointed at by `bin_fw` is not within the bounds of the firmware image.
-    fn new(bin_fw: &BinFirmware<'a>) -> Result<Self> {
-        frombytes_at::<HsHeaderV2>(bin_fw.fw, bin_fw.hdr.header_offset.into_safe_cast())
-            .map(|hdr| Self { hdr, fw: bin_fw.fw })
-    }
-
-    /// Returns the location at which the signatures should be patched in the microcode image.
-    ///
-    /// Fails if the offset of the patch location is outside the bounds of the firmware
-    /// image.
-    fn patch_location(&self) -> Result<u32> {
-        frombytes_at::<u32>(self.fw, self.hdr.patch_loc_offset.into_safe_cast())
-    }
-
-    /// Returns an iterator to the signatures of the firmware. The iterator can be empty if the
-    /// firmware is unsigned.
-    ///
-    /// Fails if the pointed signatures are outside the bounds of the firmware image.
-    fn signatures_iter(&'a self) -> Result<impl Iterator<Item = BooterSignature<'a>>> {
-        let num_sig = frombytes_at::<u32>(self.fw, self.hdr.num_sig_offset.into_safe_cast())?;
-        let iter = match self.hdr.sig_prod_size.checked_div(num_sig) {
-            // If there are no signatures, return an iterator that will yield zero elements.
-            None => (&[] as &[u8]).chunks_exact(1),
-            Some(sig_size) => {
-                let patch_sig =
-                    frombytes_at::<u32>(self.fw, self.hdr.patch_sig_offset.into_safe_cast())?;
-
-                let signatures_start = self
-                    .hdr
-                    .sig_prod_offset
-                    .checked_add(patch_sig)
-                    .map(usize::from_safe_cast)
-                    .ok_or(EINVAL)?;
-
-                let signatures_end = signatures_start
-                    .checked_add(usize::from_safe_cast(self.hdr.sig_prod_size))
-                    .ok_or(EINVAL)?;
-
-                self.fw
-                    // Get signatures range.
-                    .get(signatures_start..signatures_end)
-                    .ok_or(EINVAL)?
-                    .chunks_exact(sig_size.into_safe_cast())
-            }
-        };
-
-        // Map the byte slices into signatures.
-        Ok(iter.map(BooterSignature))
-    }
-}
-
-/// Signature parameters, as defined in the firmware.
-#[repr(C)]
-struct HsSignatureParams {
-    /// Fuse version to use.
-    fuse_ver: u32,
-    /// Mask of engine IDs this firmware applies to.
-    engine_id_mask: u32,
-    /// ID of the microcode.
-    ucode_id: u32,
-}
-
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsSignatureParams {}
-
-impl HsSignatureParams {
-    /// Returns the signature parameters contained in `hs_fw`.
-    ///
-    /// Fails if the meta data parameter of `hs_fw` is outside the bounds of the firmware image, or
-    /// if its size doesn't match that of [`HsSignatureParams`].
-    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
-        let start = usize::from_safe_cast(hs_fw.hdr.meta_data_offset);
-        let end = start
-            .checked_add(hs_fw.hdr.meta_data_size.into_safe_cast())
-            .ok_or(EINVAL)?;
-
-        hs_fw
-            .fw
-            .get(start..end)
-            .and_then(Self::from_bytes_copy)
-            .ok_or(EINVAL)
-    }
-}
-
-/// Header for code and data load offsets.
-#[repr(C)]
-#[derive(Debug, Clone)]
-struct HsLoadHeaderV2 {
-    // Offset at which the code starts.
-    os_code_offset: u32,
-    // Total size of the code, for all apps.
-    os_code_size: u32,
-    // Offset at which the data starts.
-    os_data_offset: u32,
-    // Size of the data.
-    os_data_size: u32,
-    // Number of apps following this header. Each app is described by a [`HsLoadHeaderV2App`].
-    num_apps: u32,
-}
-
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsLoadHeaderV2 {}
-
-impl HsLoadHeaderV2 {
-    /// Returns the load header contained in `hs_fw`.
-    ///
-    /// Fails if the header pointed at by `hs_fw` is not within the bounds of the firmware image.
-    fn new(hs_fw: &HsFirmwareV2<'_>) -> Result<Self> {
-        frombytes_at::<Self>(hs_fw.fw, hs_fw.hdr.header_offset.into_safe_cast())
-    }
-}
-
-/// Header for app code loader.
-#[repr(C)]
-#[derive(Debug, Clone)]
-struct HsLoadHeaderV2App {
-    /// Offset at which to load the app code.
-    offset: u32,
-    /// Length in bytes of the app code.
-    len: u32,
-}
-
-// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-unsafe impl FromBytes for HsLoadHeaderV2App {}
-
-impl HsLoadHeaderV2App {
-    /// Returns the [`HsLoadHeaderV2App`] for app `idx` of `hs_fw`.
-    ///
-    /// Fails if `idx` is larger than the number of apps declared in `hs_fw`, or if the header is
-    /// not within the bounds of the firmware image.
-    fn new(hs_fw: &HsFirmwareV2<'_>, idx: u32) -> Result<Self> {
-        let load_hdr = HsLoadHeaderV2::new(hs_fw)?;
-        if idx >= load_hdr.num_apps {
-            Err(EINVAL)
-        } else {
-            frombytes_at::<Self>(
-                hs_fw.fw,
-                usize::from_safe_cast(hs_fw.hdr.header_offset)
-                    // Skip the load header...
-                    .checked_add(size_of::<HsLoadHeaderV2>())
-                    // ... and jump to app header `idx`.
-                    .and_then(|offset| {
-                        offset
-                            .checked_add(usize::from_safe_cast(idx).checked_mul(size_of::<Self>())?)
-                    })
-                    .ok_or(EINVAL)?,
-            )
-        }
-    }
-}
-
 /// Signature for Booter firmware. Their size is encoded into the header and not known a compile
 /// time, so we just wrap a byte slices on which we can implement [`FirmwareSignature`].
 struct BooterSignature<'a>(&'a [u8]);
@@ -291,85 +85,76 @@ pub(crate) fn new(
         dev: &device::Device<device::Bound>,
         kind: BooterKind,
         chipset: Chipset,
-        ver: &str,
         falcon: &Falcon<'_, <Self as FalconFirmware>::Target>,
     ) -> Result<Self> {
         let fw_name = match kind {
             BooterKind::Loader => "booter_load",
             BooterKind::Unloader => "booter_unload",
         };
-        let fw = super::request_firmware(dev, chipset, fw_name, ver)?;
-        let bin_fw = BinFirmware::new(&fw)?;
-
-        // The binary firmware embeds a Heavy-Secured firmware.
-        let hs_fw = HsFirmwareV2::new(&bin_fw)?;
+        let fw = request_tlv(dev, chipset, fw_name)?;
+        let tlv = Tlv::new(fw.data())?;
+        dev_dbg!(
+            dev,
+            "loaded {} firmware v{}\n",
+            fw_name,
+            tlv.get_string(b"VERS")?
+        );
+
+        let os_data_offset = tlv.get_u32(b"DAOF")?;
+        let os_data_size = tlv.get_u32(b"DASZ")?;
+        let os_code_offset = tlv.get_u32(b"CDOF")?;
+        let os_code_size = tlv.get_u32(b"CDSZ")?;
+        let patch_loc = tlv.get_u32(b"PLOC")?;
+        let fuse_version: usize = tlv.get_u32(b"FUSE")?.into_safe_cast();
+        let engine_id = tlv.get_u32(b"ENID")?;
+        let ucode_id = tlv.get_u32(b"UCID")?;
+        let app0_code_offset = tlv.get_u32(b"A0CO")?;
+        let app0_code_size = tlv.get_u32(b"A0CS")?;
 
-        // The Heavy-Secured firmware embeds a firmware load descriptor.
-        let load_hdr = HsLoadHeaderV2::new(&hs_fw)?;
-
-        // Offset in `ucode` where to patch the signature.
-        let patch_loc = hs_fw.patch_location()?;
-
-        let sig_params = HsSignatureParams::new(&hs_fw)?;
         let brom_params = FalconBromParams {
-            // `load_hdr.os_data_offset` is an absolute index, but `pkc_data_offset` is from the
+            // `os_data_offset` is an absolute index, but `pkc_data_offset` is from the
             // signature patch location.
-            pkc_data_offset: patch_loc
-                .checked_sub(load_hdr.os_data_offset)
-                .ok_or(EINVAL)?,
-            engine_id_mask: u16::try_from(sig_params.engine_id_mask).map_err(|_| EINVAL)?,
-            ucode_id: u8::try_from(sig_params.ucode_id).map_err(|_| EINVAL)?,
+            pkc_data_offset: patch_loc.checked_sub(os_data_offset).ok_or(EINVAL)?,
+            engine_id_mask: u16::try_from(engine_id).map_err(|_| EINVAL)?,
+            ucode_id: u8::try_from(ucode_id).map_err(|_| EINVAL)?,
         };
-        let app0 = HsLoadHeaderV2App::new(&hs_fw, 0)?;
 
-        // Object containing the firmware microcode to be signature-patched.
-        let ucode = bin_fw
-            .data()
-            .ok_or(EINVAL)
+        let ucode = tlv
+            .get_bytes(b"BLOB")
             .and_then(FirmwareObject::<Self, _>::new_booter)?;
 
-        let ucode_signed = {
-            let mut signatures = hs_fw.signatures_iter()?.peekable();
-
-            if signatures.peek().is_none() {
-                // If there are no signatures, then the firmware is unsigned.
-                ucode.no_patch_signature()
-            } else {
-                // Obtain the version from the fuse register, and extract the corresponding
-                // signature.
-                let reg_fuse_version = falcon
-                    .signature_reg_fuse_version(brom_params.engine_id_mask, brom_params.ucode_id)?;
-
-                // `0` means the last signature should be used.
-                const FUSE_VERSION_USE_LAST_SIG: u32 = 0;
-                let signature = match reg_fuse_version {
-                    FUSE_VERSION_USE_LAST_SIG => signatures.last(),
-                    // Otherwise hardware fuse version needs to be subtracted to obtain the index.
-                    reg_fuse_version => {
-                        let Some(idx) = sig_params.fuse_ver.checked_sub(reg_fuse_version) else {
-                            dev_err!(dev, "invalid fuse version for Booter firmware\n");
-                            return Err(EINVAL);
-                        };
-                        signatures.nth(idx.into_safe_cast())
-                    }
-                }
-                .ok_or(EINVAL)?;
-
-                ucode.patch_signature(&signature, patch_loc.into_safe_cast())?
-            }
+        // Obtain the version from the fuse register, and extract the corresponding
+        // signature.
+        let reg_fuse_version: usize = falcon
+            .signature_reg_fuse_version(brom_params.engine_id_mask, brom_params.ucode_id)?
+            .into_safe_cast();
+
+        const FUSE_VERSION_USE_LAST_SIG: usize = 0;
+
+        let index = match reg_fuse_version {
+            // `0` means the last signature should be used.
+            FUSE_VERSION_USE_LAST_SIG => None,
+            // Otherwise, hardware fuse version needs to be subtracted to obtain the index.
+            _ => Some(fuse_version.checked_sub(reg_fuse_version).ok_or(EINVAL)?),
         };
 
+        // Extract the nth signature.  Booter is always signed.
+        let sig_chunk = tlv.get_signature(index)?;
+
+        let signature = BooterSignature(sig_chunk);
+        let ucode_signed = ucode.patch_signature(&signature, patch_loc.into_safe_cast())?;
+
         // There are two versions of Booter, one for Turing/GA100, and another for
         // GA102+.  The extraction of the IMEM sections differs between the two
         // versions.  Unfortunately, the file names are the same, and the headers
         // don't indicate the versions.  The only way to differentiate is by the Chipset.
         let (imem_sec_dst_start, imem_ns_load_target) = if chipset <= Chipset::GA100 {
             (
-                app0.offset,
+                app0_code_offset,
                 Some(FalconDmaLoadTarget {
                     src_start: 0,
-                    dst_start: load_hdr.os_code_offset,
-                    len: load_hdr.os_code_size,
+                    dst_start: os_code_offset,
+                    len: os_code_size,
                 }),
             )
         } else {
@@ -378,15 +163,15 @@ pub(crate) fn new(
 
         Ok(Self {
             imem_sec_load_target: FalconDmaLoadTarget {
-                src_start: app0.offset,
+                src_start: app0_code_offset,
                 dst_start: imem_sec_dst_start,
-                len: app0.len,
+                len: app0_code_size,
             },
             imem_ns_load_target,
             dmem_load_target: FalconDmaLoadTarget {
-                src_start: load_hdr.os_data_offset,
+                src_start: os_data_offset,
                 dst_start: 0,
-                len: load_hdr.os_data_size,
+                len: os_data_size,
             },
             brom_params,
             ucode: ucode_signed,
diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
index 855f32b2922c..55db15c02496 100644
--- a/drivers/gpu/nova-core/firmware/tlv.rs
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -14,7 +14,6 @@
 };
 
 /// Requests the GPU firmware TLV `name` suitable for `chipset`.
-#[expect(dead_code)]
 pub(crate) fn request_tlv(
     dev: &device::Device,
     chipset: gpu::Chipset,
@@ -135,7 +134,6 @@ pub(crate) struct Tlv<'a> {
     data: &'a [u8],
 }
 
-#[expect(dead_code)]
 impl<'a> Tlv<'a> {
     const MAGIC: &'static [u8; 4] = b"NVFW";
 
diff --git a/drivers/gpu/nova-core/gsp/hal/tu102.rs b/drivers/gpu/nova-core/gsp/hal/tu102.rs
index ff71b45b5432..33dcf3eab162 100644
--- a/drivers/gpu/nova-core/gsp/hal/tu102.rs
+++ b/drivers/gpu/nova-core/gsp/hal/tu102.rs
@@ -27,8 +27,7 @@
             FwsecCommand,
             FwsecFirmware, //
         },
-        gsp::GspFirmware,
-        FIRMWARE_VERSION, //
+        gsp::GspFirmware, //
     },
     gpu::Chipset,
     gsp::{
@@ -112,7 +111,6 @@ fn build(
                     dev,
                     BooterKind::Unloader,
                     chipset,
-                    FIRMWARE_VERSION,
                     sec2_falcon,
                 )?,
             },
@@ -313,14 +311,11 @@ fn boot<'a>(
             "Using SEC2 to load and run the booter_load firmware...\n"
         );
 
-        BooterFirmware::new(
+        BooterFirmware::new(dev, BooterKind::Loader, chipset, sec2_falcon)?.run(
             dev,
-            BooterKind::Loader,
-            chipset,
-            FIRMWARE_VERSION,
             sec2_falcon,
-        )?
-        .run(dev, sec2_falcon, wpr_meta)?;
+            wpr_meta,
+        )?;
 
         Ok(unload_guard)
     }
-- 
2.54.0

