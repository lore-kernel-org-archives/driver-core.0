Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010024.outbound.protection.outlook.com [52.101.56.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F8DD3845D9;
	Thu,  2 Jul 2026 19:28:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020487; cv=fail; b=hmRIKMHY3azs1p3g9evP51qFlhJw2Ewy+Is2iGxCTP5XekoXoc7+XUpWupbq//IkevalCLeDt05IpB+V1X+bRFaeMm0NB9zPE+UpKfxVUhRoECZAB+ziOrPy7EQ7Pl6TZw2PdlEUput9xq1UuztafDdgV8GnLf3szQIJ1iWdTJw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020487; c=relaxed/simple;
	bh=GZVW82t4hmQi2ThI0Xx4nhMaFjej4aZCqQeS5H8UV2c=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dBMO47C7yfxyFGQ154KTbLxzsc9Nvs0tKVypvcilJOYX23dYSVutLru9mjP9f1u6rDF5lkxD+s91jFDGTM+KPXeowbe4bxLivnp+jtZo/7t2VoXXfWU/z1gZvwYT2xNagtcxqnE8ZbCrMLxvL6nCFjae4o1QmKR8OXoz316vgOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=RBU7bGWw; arc=fail smtp.client-ip=52.101.56.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="RBU7bGWw"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xKbNnfku29zAY3UomPBfxjR79uSWIbYKt9fDyU2Wbk/SDkzs+bP7oErrsB0boXoAky6n7prAIyAXAhLi5VrYJ26TtS1SFyhNcDKWgqwIjvcJJJPcjjNBn/IP0+iEDhdd3rI1PB0GUFi3aPICwCfwXOnjHYMsNZ20GnZgKQs3odpoBe0yYRouucdSJLymXvR31G38LzOT+4jiNkCikvUI/KDAV5WF0yrrBWaepXywD99gw8Uxuq9uUk4xSsdnzHrDDtTxDhr5GYWHu1oghjxZV2fQRUi/qexLvg2cCRw3Znu8pyL+VAEnH8v9Dp12/9xqCQsTgkatUdwpl+qWPnNpUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50ascQXsLweaR7nV07xf+A+9NAyx4iFfOAUPxAeM4Lw=;
 b=b8z9isBQvvdcqEinMAfB3HMrlXKr2+310+iFiTb+FXT1NbLqwIv/NCY1MgapEPmzT5Zs+9sfWSOiy6vP5VIstqdKYYIxRH7D6UKOAUkQUO7LVwlPVepX8mnooimqqkGymxCcbEmnaluL4KgTjJd5SUBRsrMeeMgNyElVU/+6OTLTFyLjOkgclWh3sf2nLPu9FwZo+muEak7LDoeLgm1UVEu08jAToEhrPOfzmrrLRdHEwUg3tKqL1gGKDYB0XRoo26NfrkGPVtvY+mGO9YD/K3YtG8eDs33hDM+NlFeE2wfusscYmuIDblyc3V7Pk2aJwfjMClzvKW4z2izzPrXwrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50ascQXsLweaR7nV07xf+A+9NAyx4iFfOAUPxAeM4Lw=;
 b=RBU7bGWwXlLRHwiAwO2xH5i4Cvcs8foCsTuOCoKOyHWNjUIITEesSUMVnVt6n47LGp260DITHiaol3t4jDRWE8gsduAibyELneP1px20w3nGMOhcy23U8huEW4Zx/grtmaWR5F7msUbiMJam3SKvMrLUnOM3HDryX4Gxp6ejWN8HnXf43MHZKShWYxLbZV4ST/2uG9h8Zd1KH+HAJX5QEEf9+U1n3k1RDcxLH67ZR3v9xyl6EhQDwHyeWM/xDRx8pclkxWwCm3qtywx87tj99ixdyAXKDiu2OjNHlM6X1Img9kLAJAXlO0iHB9rJePS4I2lCWPoE/I8C3gCKy6wPMg==
Received: from SA9PR13CA0046.namprd13.prod.outlook.com (2603:10b6:806:22::21)
 by DSVPR12MB999124.namprd12.prod.outlook.com (2603:10b6:8:38b::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Thu, 2 Jul 2026
 19:27:56 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:22:cafe::73) by SA9PR13CA0046.outlook.office365.com
 (2603:10b6:806:22::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 19:27:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 19:27:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:33 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:32 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [PATCH v3 6/7] gpu: nova-core: transition fsp to TLV images
Date: Thu, 2 Jul 2026 14:27:11 -0500
Message-ID: <20260702192712.3450652-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|DSVPR12MB999124:EE_
X-MS-Office365-Filtering-Correlation-Id: 15667034-925d-4523-7df5-08ded87004ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|82310400026|36860700016|1800799024|921020|18002099003|22082099003|56012099006|3023799007|11063799006|6133799003;
X-Microsoft-Antispam-Message-Info:
	TBpUG7W7PzXLm8Q1HAICT4NsR7+sbRVy/vpECvqkdqrV0J6eC13KlmZfvEZQfE2gMqrrmcdDfINr30QbwP7PSQb5IJ/EfpBLlv29pFxCpEPuRa3NYq5DWntnYJnMKP0gMVo6vqxq7/uG/W9bft5ejmPBQnIQysjfayapecR414/HNTiPXn7PaUU4Otwm8T+w8xZK/BV1/TYzbrJ7tj+Wf0QN3XjFitWtyd34d/fUI2rP/4LAXFpzNY/oo3E+ucU0Qozhur+c39+MFnVS8jp6wIScS9m2gl5JapM3hPZFBwWlHeTWcTy4sbfFy7uM0u/RiWjAn8GB+sL5A9js8gnnHvYdsb4WJz/mL4IF9WwvKwx2AyGauMBDbrGhW2D7Dcbh3dWfFHTJWPHtzHHKdDvvvwktpLDNamrMxFcMm6vsbXn3PRvoam+bZeTtBeegn2nxWBfcPXYV5eU013Q4BFPcr1LjHrdhRWuyBLVrMGE4r/ZZjS59qdRlLTgaYImUqJhPeexfNfEwgC1Z4D+GQ4q4j0slzKgDVsO9R0SrWiA24d5Kz3DD5kkVXNPi0AKlU90AQW6xtFYswTPmNkHZzZiB/kUEOAr77d2eISsLZvPvKDY+LfQ91n6JnvZXp+zEx39HdKZP5cyFKPT5+6QDetBFtKbJlUwr9KPBRtRcIb8BM+AGxgQHpBD/AP7sic6byvGUft3EWEVwjDSYqkKRuCihlXTcq7559u39pqs+HqD3LaqBs39LxTmNL2exKh6kg+wg
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(376014)(82310400026)(36860700016)(1800799024)(921020)(18002099003)(22082099003)(56012099006)(3023799007)(11063799006)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wezQA2NX0y5YGXcrmsLVQI68H+DuPzbjQ8XaFm/LFvhsMHvR7ilShVI2wneLazgjj+XNtILX8f/VYAqbkBTpIp8tTKlTLg/Nap4A0rMGOzjjQaht5QtXroJJnTjnnn3W7jZrcypXCTl1c6bX9YjbipENL8E3rK8orvDUuZuODjycqmHmZM5boAhvl8VZ5r1zMTjvvRWYhBoLWspeMox1kqQVmVHxGMc/jaKwLuhL7WkIwyrP+jIuxy7TyYKVnZHI7nNGIGHbNb8bVIMdVGYDYaRl6FW/Tmp8ZVCBKe5BFLW2hj3gxz9LcOK7KEKF3HTzj1U4ZhivuuRayrRvUXy6g2GOsgLHR0kqQIAxPH+M3lcpb2mP1fgmQNZaNHLWyRtP3XUkvfnXjxPLMCOiRZRlugW+dvUQ9wxpA68Pet7kCdSwsEsYEm3lyYMVNCadCEh1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:27:56.0041
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 15667034-925d-4523-7df5-08ded87004ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999124

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
index 574e1627e63c..033848772d23 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -31,12 +31,9 @@
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
@@ -245,7 +242,7 @@ pub(crate) fn wait_secure_boot(
 
         let hal = hal::fsp_hal(chipset).ok_or(ENOTSUPP)?;
         let falcon = Falcon::<FspEngine>::new(dev, chipset, bar)?;
-        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+        let fsp_fw = FspFirmware::new(dev, chipset)?;
 
         read_poll_timeout(
             || Ok(hal.fsp_boot_status(bar)),
-- 
2.54.0

