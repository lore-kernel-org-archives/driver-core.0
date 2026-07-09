Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010059.outbound.protection.outlook.com [52.101.56.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44E713C5DBE;
	Thu,  9 Jul 2026 21:40:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633210; cv=fail; b=MjgKI9FsN3t6RYdvzHtrZedDan4sfEq4hkWiqbILa1R/TLSXXYJmaDgtYY0vl4DAzNypV5c3OvW/ZIjx1fDMg0d0hIZjdWm0jwgmLP1Lrp8gjJQc4hyA6ROCZYC0bz2plOPEYeG6Rn79ElfaHTVSWuCm81yjwIceQzHvORA48g8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633210; c=relaxed/simple;
	bh=5EqXJ6BKSkBILqIy8UhcLP2d10ERZk7CYGC/kl2EvDI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DuYuMn6iMA58ZW/sAMMy0w/yXHsx4tksDblT7YlF1sSbrZDh1fAINTm8OpB0ZIylKnzUUt9BV985UShoskH3Wa9H9U6Om0a2cjuqZyBTjK4PCcp9z0BMz4fHytHJaFAYGynJ8E7/zSGKEPXX+JT9G8qXzJ/D2hXLiQiOOP353Yw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jM++ep3Y; arc=fail smtp.client-ip=52.101.56.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jM++ep3Y"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SmWgVRgKhhL9BuGAtZtSReABZrz1oEKD5uULjTm7884N9CxmRb6yjspBHRx/+/cetkl2+TOoCLciwVtvAVWGQRnBS3YL5ylDSon/wePb0U7GyNJGg/M0ixOZRMtOSwGBbbtCFNpG3XBP4vWDnLkOZ4eZJp95H+zSrah17SuEg10HGdB0fcs1LnYYXpXZPr+GA99iEe+kT4LAfzLCJfx9i3dOjCxzFX8r2mxaC5hvxoM5vWOqce3yN5YMFLhBUDxDqbJZBzilLMzHbxoH65aIk7Ts8MEECGBJxBIwcmO7XRbzeeYoEJEThY28RN9VWmddEAcGcscG9VghxDyyFWs+xw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TmXUeT/OXnzwV7d4yhrChJ83X+RlzdiChcadKyChwqc=;
 b=aDObWghH5gUZes69GUnGiGESSu/BPBT7sf1ca8g7zxEoJOAFR7EMIVD4CuGOlAwkRfPx4hSdH+ILj/zGRYKBgraYDNRON2N0dFry9T7wDbZ4fKAYTjTnJfW4Kb/PdvLe+9Rs2RuHrqhexSZDmSznYeV747m46kwWisgxXgmtpKCR1Jvoee1j8396rvCFACcWd2bd9Ra63EQI71sSm+bJa/8+HXO2CL0Qz8+wcF8OsAhWWeRrUFnSJOKwsFt101FtX9k7pikioXGp2tth2TZXSQTzoLCyOS8OOTHLl+1tVpXQ9nmn/S99NNZXXrL3mIFysctmkiSCZmcECY7WiMFlpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TmXUeT/OXnzwV7d4yhrChJ83X+RlzdiChcadKyChwqc=;
 b=jM++ep3YkH8m+kYHmmMMUQx6VkOGcfNtUsTHh37RjDVWSivbFgJJ7M1pn2yx4R6YZDGlT519qNiHKlPsNcjaRFz1tVxbe0QDyea/sLWEGrbbWhiNzhA7OrNIGQYWEkZd8Cfu0Hkq6W+F73CE5LMNX1f9Mox1y1Y+oam4/mGkB7YMFaEjXNC+7AoqXTxpXqyCucCOSFSB6iPun/KGj174J9zJY/HNgICOgOWwODWwqWxQZuueHEM2/7k9OscrS90eFb1Rtqmpv8AKdMMv5NrOWTsmP0xbayXCeID+liEJsYE3JqfawlVkXB/+5l6qV2eQfXKkn8iM4JplDcTRKsszAA==
Received: from BN0PR04CA0178.namprd04.prod.outlook.com (2603:10b6:408:eb::33)
 by CH1PPFC8B3B7859.namprd12.prod.outlook.com (2603:10b6:61f:fc00::622) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Thu, 9 Jul
 2026 21:39:58 +0000
Received: from BN2PEPF000044A3.namprd02.prod.outlook.com
 (2603:10b6:408:eb:cafe::51) by BN0PR04CA0178.outlook.office365.com
 (2603:10b6:408:eb::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 21:39:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A3.mail.protection.outlook.com (10.167.243.154) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 21:39:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:31 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:29 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	<driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
	<nova-gpu@lists.linux.dev>, Gary Guo <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v4 6/7] gpu: nova-core: transition fsp to TLV images
Date: Thu, 9 Jul 2026 16:39:14 -0500
Message-ID: <20260709213915.520109-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A3:EE_|CH1PPFC8B3B7859:EE_
X-MS-Office365-Filtering-Correlation-Id: f26274c6-19df-4ab5-16d8-08dede029f45
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|82310400026|23010399003|921020|56012099006|3023799007|11063799006|22082099003|18002099003|6133799003;
X-Microsoft-Antispam-Message-Info:
	g7C47zErFubbPb6eH9Mwg6KUagaVyClpdK6NRBox1geWx69xWt7Ugzgx+PMtyG/A8VRZBvoEUe9ao4j2DCYeQpNLgso4f7Cnu3l2+4TU5zgZYRiS4J6MZLg8zOwLBk6c8v5Xpy+hkUJ7QVEoGKiKRGhs80A4ABP0urv/o2Mzeh4zsfaEaRhwtlbq7eIhSJg6p+Apw55xGuaGMBpUWZHVeq73HU3YHs8ygJtPNANTFYDDXjORwpZqwDMfbGphakosSQ9W2UFuOhxknBAdbKci95t7JvA/ce8TfbXhWis/Ax5nZoYLUcnySkGdoRBd7NAgmEwqcfsrtqBZ0save2eGu+gHPPAiNw/Vm46x2dJS6h4gV4Wa1dim27nmuLHy21I9PSSMHHxcDKt4bMRttTbgKdlvvbTq0Gmp1doviZiJBXuHMRIPksuNSuDk/+g0jPQJ9HbUgHJH6IeeadYncFqG/Mcr+dI3ZolY7MqlPl3goisuADEmjhJ+bt6rDGF6U9JK1EqOJpMP1L3wOcMxDqAmrq4Hgg5SpNfM2FfjmfB3cluBSvDiPeeaMIEpYj5oSmeT/4ojFKro8H1YwFFeKGO7r4lvQZKGkLij/WNm27Vc+Zg0SGQwZ8m1hQKGfweVjDzjr7GC7IrsJvfTMqjoFGn3uXi3sFrncf/REBmEQi+YdYQJnSffAQJ8FA4+EisS9rOzWGqacRE08U7AyhLbj1wOJ0kAYGDo80JSPfgASyXt8nnje9eC7QVo4ghdEuK6GcSD
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(82310400026)(23010399003)(921020)(56012099006)(3023799007)(11063799006)(22082099003)(18002099003)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	DcGTLM/mv+44WEttFleFgsWJl0v9ZuHEnO+uKa+EmvkBU2abITFnmcDkCdCPxRKDluMe9PaOk31ahVHnDHfO56F21AyERHOVtizZyrKPaIm/mJcDemY1QVMQnAaj22D1znSr8ehXh2rEjteTRgKPHAiae+J6dympjEjEMNjKA5H8BV7B8PCMtG66VUu4UwgraB1OU8lo1YE26M4Hy0Bx63pXrpfMzScUJGFu7ccOy02qqOKO+YTko61EAVdnBexdc7g0tfIUSED10kHgUZDid7tyYOrkU6UC2gLN6GpAPoxweTf0vb98d1uSEbmMqO8eGCwHzc4WsEAxrUlOsEvmdqr5jLwZIBmjUjup/1kUVm2hAXyP7SKm6lHDTaEsx2On32FcSNBVPaK3SqX6A/Mq8NF5ab1Uu1KI/b45wwAirY0fi8DeuD1U87Q/ONYzjrc0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:39:57.4675
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f26274c6-19df-4ab5-16d8-08dede029f45
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A3.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC8B3B7859

Switch the FSP firmware loaders from the legacy ELF32 format to the new
TLV format.  This change requires the new TLV versions of the r570.144
firmware images.

Because we are no longer loading ELF images, we can also delete the ELF
parser.

Also remove function request_firmware() as this was the last user.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 219 --------------------------
 drivers/gpu/nova-core/firmware/fsp.rs |  88 +++++------
 drivers/gpu/nova-core/fsp.rs          |  11 +-
 3 files changed, 45 insertions(+), 273 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4b41368a6b2f..4ea9eef46354 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -8,7 +8,6 @@
 use core::ops::Deref;
 
 use kernel::{
-    device,
     firmware,
     prelude::*,
     str::CString, //
@@ -32,19 +31,6 @@
 
 pub(crate) const FIRMWARE_VERSION: &str = "570.144";
 
-/// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
-fn request_firmware(
-    dev: &device::Device,
-    chipset: gpu::Chipset,
-    name: &str,
-    ver: &str,
-) -> Result<firmware::Firmware> {
-    let chip_name = chipset.name();
-
-    CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}-{ver}.bin"))
-        .and_then(|path| firmware::Firmware::request(&path, dev))
-}
-
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone, FromBytes)]
@@ -396,208 +382,3 @@ pub(crate) const fn create(
         this.0
     }
 }
-
-/// Ad-hoc and temporary module to extract sections from ELF images.
-///
-/// Some firmware images are currently packaged as ELF files, where sections names are used as keys
-/// to specific and related bits of data. Future firmware versions are scheduled to move away from
-/// that scheme before nova-core becomes stable, which means this module will eventually be
-/// removed.
-mod elf {
-    use kernel::{
-        bindings,
-        prelude::*,
-        transmute::FromBytes, //
-    };
-
-    /// Trait to abstract over ELF header differences.
-    trait ElfHeader: FromBytes {
-        fn shnum(&self) -> u16;
-        fn shoff(&self) -> u64;
-        fn shstrndx(&self) -> u16;
-    }
-
-    /// Trait to abstract over ELF section-header differences.
-    trait ElfSectionHeader: FromBytes {
-        fn name(&self) -> u32;
-        fn offset(&self) -> u64;
-        fn size(&self) -> u64;
-    }
-
-    /// Trait describing a matching ELF header and section-header format.
-    trait ElfFormat {
-        type Header: ElfHeader;
-        type SectionHeader: ElfSectionHeader;
-    }
-
-    /// Newtype to provide a [`FromBytes`] implementation.
-    #[repr(transparent)]
-    struct Elf64Hdr(bindings::elf64_hdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64Hdr {}
-
-    impl ElfHeader for Elf64Hdr {
-        fn shnum(&self) -> u16 {
-            self.0.e_shnum
-        }
-
-        fn shoff(&self) -> u64 {
-            self.0.e_shoff
-        }
-
-        fn shstrndx(&self) -> u16 {
-            self.0.e_shstrndx
-        }
-    }
-
-    #[repr(transparent)]
-    struct Elf64SHdr(bindings::elf64_shdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf64SHdr {}
-
-    impl ElfSectionHeader for Elf64SHdr {
-        fn name(&self) -> u32 {
-            self.0.sh_name
-        }
-
-        fn offset(&self) -> u64 {
-            self.0.sh_offset
-        }
-
-        fn size(&self) -> u64 {
-            self.0.sh_size
-        }
-    }
-
-    struct Elf64Format;
-
-    impl ElfFormat for Elf64Format {
-        type Header = Elf64Hdr;
-        type SectionHeader = Elf64SHdr;
-    }
-
-    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations for ELF32.
-    #[repr(transparent)]
-    struct Elf32Hdr(bindings::elf32_hdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf32Hdr {}
-
-    impl ElfHeader for Elf32Hdr {
-        fn shnum(&self) -> u16 {
-            self.0.e_shnum
-        }
-
-        fn shoff(&self) -> u64 {
-            u64::from(self.0.e_shoff)
-        }
-
-        fn shstrndx(&self) -> u16 {
-            self.0.e_shstrndx
-        }
-    }
-
-    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations for ELF32.
-    #[repr(transparent)]
-    struct Elf32SHdr(bindings::elf32_shdr);
-    // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
-    unsafe impl FromBytes for Elf32SHdr {}
-
-    impl ElfSectionHeader for Elf32SHdr {
-        fn name(&self) -> u32 {
-            self.0.sh_name
-        }
-
-        fn offset(&self) -> u64 {
-            u64::from(self.0.sh_offset)
-        }
-
-        fn size(&self) -> u64 {
-            u64::from(self.0.sh_size)
-        }
-    }
-
-    struct Elf32Format;
-
-    impl ElfFormat for Elf32Format {
-        type Header = Elf32Hdr;
-        type SectionHeader = Elf32SHdr;
-    }
-
-    /// Returns a NULL-terminated string from the ELF image at `offset`.
-    fn elf_str(elf: &[u8], offset: u64) -> Option<&str> {
-        let idx = usize::try_from(offset).ok()?;
-        let bytes = elf.get(idx..)?;
-        CStr::from_bytes_until_nul(bytes).ok()?.to_str().ok()
-    }
-
-    fn elf_section_generic<'a, F>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
-    where
-        F: ElfFormat,
-    {
-        let hdr = F::Header::from_bytes(elf.get(0..size_of::<F::Header>())?)?;
-
-        let shdr_num = usize::from(hdr.shnum());
-        let shdr_start = usize::try_from(hdr.shoff()).ok()?;
-        let shdr_end = shdr_num
-            .checked_mul(size_of::<F::SectionHeader>())
-            .and_then(|v| v.checked_add(shdr_start))?;
-
-        // Get all the section headers as an iterator over byte chunks.
-        let shdr_bytes = elf.get(shdr_start..shdr_end)?;
-        let mut shdr_iter = shdr_bytes.chunks_exact(size_of::<F::SectionHeader>());
-
-        // Get the strings table.
-        let strhdr = shdr_iter
-            .clone()
-            .nth(usize::from(hdr.shstrndx()))
-            .and_then(F::SectionHeader::from_bytes)?;
-
-        // Find the section which name matches `name` and return it.
-        shdr_iter.find_map(|sh_bytes| {
-            let sh = F::SectionHeader::from_bytes(sh_bytes)?;
-            let name_offset = strhdr.offset().checked_add(u64::from(sh.name()))?;
-            let section_name = elf_str(elf, name_offset)?;
-
-            if section_name != name {
-                return None;
-            }
-
-            let start = usize::try_from(sh.offset()).ok()?;
-            let end = usize::try_from(sh.size())
-                .ok()
-                .and_then(|sz| start.checked_add(sz))?;
-
-            elf.get(start..end)
-        })
-    }
-
-    /// Extract the section with name `name` from the ELF64 image `elf`.
-    fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
-        elf_section_generic::<Elf64Format>(elf, name)
-    }
-
-    /// Extract the section with name `name` from the ELF32 image `elf`.
-    fn elf32_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
-        elf_section_generic::<Elf32Format>(elf, name)
-    }
-
-    /// Automatically detects ELF32 vs ELF64 based on the ELF header.
-    pub(super) fn elf_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
-        // ELF identification: a 4-byte magic followed by a class byte (32- vs 64-bit).
-        const ELFMAG: &[u8] = b"\x7fELF";
-        const SELFMAG: usize = ELFMAG.len();
-        const EI_CLASS: usize = 4;
-        const ELFCLASS32: u8 = 1;
-        const ELFCLASS64: u8 = 2;
-
-        if elf.get(0..SELFMAG) != Some(ELFMAG) {
-            return None;
-        }
-
-        match *elf.get(EI_CLASS)? {
-            ELFCLASS32 => elf32_section(elf, name),
-            ELFCLASS64 => elf64_section(elf, name),
-            _ => None,
-        }
-    }
-}
diff --git a/drivers/gpu/nova-core/firmware/fsp.rs b/drivers/gpu/nova-core/firmware/fsp.rs
index 6eaf1c684b9d..5462e318410a 100644
--- a/drivers/gpu/nova-core/firmware/fsp.rs
+++ b/drivers/gpu/nova-core/firmware/fsp.rs
@@ -6,12 +6,14 @@
 use kernel::{
     device,
     dma::Coherent,
-    firmware::Firmware,
     prelude::*, //
 };
 
 use crate::{
-    firmware::elf,
+    firmware::tlv::{
+        request_tlv, //
+        Tlv,
+    },
     gpu::Chipset, //
 };
 
@@ -19,11 +21,11 @@
 const FSP_HASH_SIZE: usize = 48;
 /// Maximum size of the FSP public key (RSA-3072), in bytes.
 ///
-/// The FMC ELF `publickey` section may be shorter, so the remaining bytes are zero-padded.
+/// The FMC `PKEY` tag may be shorter, so the remaining bytes are zero-padded.
 const FSP_PKEY_SIZE: usize = 384;
 /// Maximum size of the FSP signature (RSA-3072), in bytes.
 ///
-/// The FMC ELF `signature` section may be shorter, so the remaining bytes are zero-padded.
+/// The FMC `SIGN` tag may be shorter, so the remaining bytes are zero-padded.
 const FSP_SIG_SIZE: usize = 384;
 
 /// Structure to hold FMC signatures.
@@ -38,64 +40,35 @@ pub(crate) struct FmcSignatures {
 }
 
 pub(crate) struct FspFirmware {
-    /// FMC firmware image data (only the "image" ELF section).
+    /// FMC firmware image data
     pub(crate) fmc_image: Coherent<[u8]>,
     /// FMC firmware signatures.
     pub(crate) fmc_sigs: KBox<FmcSignatures>,
 }
 
 impl FspFirmware {
-    pub(crate) fn new(
-        dev: &device::Device<device::Bound>,
-        chipset: Chipset,
-        ver: &str,
-    ) -> Result<Self> {
-        let fw = super::request_firmware(dev, chipset, "fmc", ver)?;
+    pub(crate) fn new(dev: &device::Device<device::Bound>, chipset: Chipset) -> Result<Self> {
+        let fw = request_tlv(dev, chipset, "fmc")?;
+        let tlv = Tlv::new(fw.data())?;
+        dev_dbg!(dev, "loaded fsp firmware v{}\n", tlv.get_string(b"VERS")?);
 
-        // FSP expects only the "image" section, not the entire ELF file.
-        let fmc_image_data = elf::elf_section(fw.data(), "image").ok_or_else(|| {
-            dev_err!(dev, "FMC ELF file missing 'image' section\n");
-            EINVAL
-        })?;
+        let fmc_image_data = tlv.get_bytes(b"BLOB")?;
         let fmc_image = Coherent::from_slice(dev, fmc_image_data, GFP_KERNEL)?;
 
         Ok(Self {
             fmc_image,
-            fmc_sigs: Self::extract_fmc_signatures(&fw, dev)?,
+            fmc_sigs: Self::extract_fmc_signatures(&tlv, dev)?,
         })
     }
 
     /// Extract FMC firmware signatures for Chain of Trust verification.
     ///
-    /// Extracts real cryptographic signatures from FMC ELF32 firmware sections.
+    /// Extracts real cryptographic signatures from FMC TLV firmware tags.
     /// Returns signatures in a heap-allocated structure to prevent stack overflow.
-    fn extract_fmc_signatures(
-        fmc_fw: &Firmware,
-        dev: &device::Device,
-    ) -> Result<KBox<FmcSignatures>> {
-        let get_section = |name: &str, max_len: usize| {
-            elf::elf_section(fmc_fw.data(), name)
-                .ok_or(EINVAL)
-                .inspect_err(|_| dev_err!(dev, "FMC firmware missing '{}' section\n", name))
-                .and_then(|section| {
-                    if section.len() > max_len {
-                        dev_err!(
-                            dev,
-                            "FMC {} section size {} > maximum {}\n",
-                            name,
-                            section.len(),
-                            max_len
-                        );
-                        Err(EINVAL)
-                    } else {
-                        Ok(section)
-                    }
-                })
-        };
-
-        let hash_section = get_section("hash", FSP_HASH_SIZE)?;
-        let pkey_section = get_section("publickey", FSP_PKEY_SIZE)?;
-        let sig_section = get_section("signature", FSP_SIG_SIZE)?;
+    fn extract_fmc_signatures(tlv: &Tlv<'_>, dev: &device::Device) -> Result<KBox<FmcSignatures>> {
+        let hash_section = tlv.get_bytes(b"HASH")?;
+        let pkey_section = tlv.get_bytes(b"PKEY")?;
+        let sig_section = tlv.get_bytes(b"SIGN")?;
 
         // The hash section is a SHA-384 output: it must be exactly FSP_HASH_SIZE bytes.
         if hash_section.len() != FSP_HASH_SIZE {
@@ -108,15 +81,36 @@ fn extract_fmc_signatures(
             return Err(EINVAL);
         }
 
+        // The key and signature sections are zero-padded to a fixed maximum, so they may be
+        // shorter, but must not exceed the destination buffers.
+        if pkey_section.len() > FSP_PKEY_SIZE {
+            dev_err!(
+                dev,
+                "FMC public key section size {} > maximum {}\n",
+                pkey_section.len(),
+                FSP_PKEY_SIZE
+            );
+            return Err(EINVAL);
+        }
+        if sig_section.len() > FSP_SIG_SIZE {
+            dev_err!(
+                dev,
+                "FMC signature section size {} > maximum {}\n",
+                sig_section.len(),
+                FSP_SIG_SIZE
+            );
+            return Err(EINVAL);
+        }
+
         // Initialize the signatures in place to avoid building the large `FmcSignatures` on the
         // stack, then fill each section from the firmware.
         let signatures = KBox::init(
             pin_init::init_zeroed::<FmcSignatures>().chain(|sigs| {
                 // PANIC: src and dst lengths are both FSP_HASH_SIZE (verified above).
                 sigs.hash384.copy_from_slice(hash_section);
-                // PANIC: dst is sliced to src.len(); src.len() <= FSP_PKEY_SIZE per `get_section`.
+                // PANIC: dst is sliced to src.len(); src.len() <= FSP_PKEY_SIZE (verified above).
                 sigs.public_key[..pkey_section.len()].copy_from_slice(pkey_section);
-                // PANIC: dst is sliced to src.len(); src.len() <= FSP_SIG_SIZE per `get_section`.
+                // PANIC: dst is sliced to src.len(); src.len() <= FSP_SIG_SIZE (verified above).
                 sigs.signature[..sig_section.len()].copy_from_slice(sig_section);
                 Ok(())
             }),
diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index 08f4acef09f6..654b5b4214a9 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -32,12 +32,9 @@
         Falcon, //
     },
     fb::FbLayout,
-    firmware::{
-        fsp::{
-            FmcSignatures,
-            FspFirmware, //
-        },
-        FIRMWARE_VERSION, //
+    firmware::fsp::{
+        FmcSignatures,
+        FspFirmware, //
     },
     gpu::Chipset,
     gsp::GspFmcBootParams,
@@ -246,7 +243,7 @@ pub(crate) fn wait_secure_boot(
 
         let hal = hal::fsp_hal(chipset).ok_or(ENOTSUPP)?;
         let falcon = Falcon::<FspEngine>::new(dev, chipset, bar)?;
-        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+        let fsp_fw = FspFirmware::new(dev, chipset)?;
 
         read_poll_timeout(
             || Ok(hal.fsp_boot_status(bar)),
-- 
2.54.0

