Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010035.outbound.protection.outlook.com [52.101.61.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08445376A03;
	Fri, 31 Jul 2026 20:11:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528667; cv=fail; b=uHc33W93AfGft/v0MHJOCQcK9qN0Xu2yuxw3X8CQ1H2BjCQtMt2TAnRdXJogCh8eZ6KvQApqTBlPQLZ+bCQZM5diBun6ZGbIrMGEI+HomWciCUkGN+yjrSculWVfZCzJTSWwdafyUXHDzS7TOSn2NVShbd8CwQH/tBOURueeRu4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528667; c=relaxed/simple;
	bh=e88DHkpxKa1do9uPKAMCWaOAyXy6HIimWBQA2w1Rl38=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=I+3lolBdqQp4LfxtFE7lHqvDWwt35YiDk6aibys+rtUoC1k4++5OQ4Y5C4Y75qcjm5Ee+IhQv61GuqDXCoIxYcTyQm6xhGFvFz5Yrmud3jKVQUWR9Ap6Mu2nEcCYCUIaeHibZQgEm5SgegISiKhOp0pNc4cLosfXLf3WPH8hSZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UNzHekQr; arc=fail smtp.client-ip=52.101.61.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UNzHekQr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dv+zivZEumomEnYvcUDdIqBgogzbNcp7M6MhBow9MOvJR5xx6HnEQ0FqaJbaxUerXabqZHhb1HH8ljJRfGX8su114OdMSGJsrWJuAhL9fU/Ob3ibM6vqUC7apsD14wqwrwzxhhSTeeUEok1eCZMd57daBZDtE9s4EoeI+d9GJptYlbc0plpmzRvdQ7stRlF8Wg8w+eucnL/ECKXU23cJD5pMkFL2xhwv2z3owaiFZEC+oxkCpFm1bEg6xzRXHDwunHkY9w+Ga8rKOHFrWRF99ENwoa75fnBk3H8q1NT7B4gGklmQ/cF3Mi+H4OaZjgurZskiRDQWd62NtkQEj1Ja3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+z7yaEdci0bIs84A0SIDIWiWCc+lqeecTWgQdrg18Y=;
 b=NezRt0jKtfK5c+12NAbviSDqTFe2ky5uPODivD/ZYE2A9E90RjKiH1CyiUd4UDrni6ZC1hHtV1JByGgNwI6T3zEV2yjh0AIxIaG/7RQnrzQo43uFFCl7zU9nqdZeINM7m3L0haadDaI1mNPeluVxQ9ZqFbgulN3HUMGe64xUJWkXvx0VdzwfZyLDGfO0nvlDo3/DMAjskzFJ0KtcUVjOAW1zmP+X8VaEV3Ul+lm9lS1NnEDikRnEFg3Cw0m9Q2CdPBT1uH2rh0Mb4UTazj6dtjCi5S+sqZztbSH8NDqUvhmgvhRUMkJfbFUogfk0oPcE91SkTUiQnO6qrk9EC5iruw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+z7yaEdci0bIs84A0SIDIWiWCc+lqeecTWgQdrg18Y=;
 b=UNzHekQrX+DkVNaKmpKSnI07B0Mqrd1FHFoa6kHvST2lPUToqQ9Z/qy/YUfy8/NUdYWNql5+3ehMCjqO9epA927kJFmCBZ+X8rIMl4qoIs1tqXzZ65u4LJxxPjIMwK83SV6jwU2OU5KxkGq7UUBtfTnIbesT80N3AeFwFAyYxVik3l1x9nvvbeT8GOofNaI8kmC2RuamWyi+Saa4ITs2CVfdOmwt2mHzCXeXyTJeR29Znj59PW4lhjlRSd5/gNFaHbNkMxFMZ/MY6d9pdUPSslGh4Gmeqettd6g/xFGyhdi2tx1S9oah2xkWE2vGhOLjMF4a/xBlO3qX9yv7DDdNeA==
Received: from BN9P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:408:10b::8)
 by DM4PR12MB5865.namprd12.prod.outlook.com (2603:10b6:8:64::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 20:10:54 +0000
Received: from BN2PEPF000055E1.namprd21.prod.outlook.com
 (2603:10b6:408:10b:cafe::2c) by BN9P223CA0003.outlook.office365.com
 (2603:10b6:408:10b::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.14 via Frontend Transport; Fri,
 31 Jul 2026 20:10:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000055E1.mail.protection.outlook.com (10.167.245.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.315.0 via Frontend Transport; Fri, 31 Jul 2026 20:10:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Fri, 31 Jul
 2026 13:10:34 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:33 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v7 7/8] gpu: nova-core: transition fsp to TLV images
Date: Fri, 31 Jul 2026 15:10:16 -0500
Message-ID: <20260731201017.2580713-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF000055E1:EE_|DM4PR12MB5865:EE_
X-MS-Office365-Filtering-Correlation-Id: 255be489-8a84-46bf-6ffe-08deef3fd351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|36860700016|82310400026|10067099003|11063799006|6133799003|56012099006|18002099003|3023799007|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	PU1u4XF1SQbOvIIdwAIaQZQdtcv5pgxxTaUPQZd+qx/qKwwWC/SSLR4GiyeWtw8jbErphmf3TERsOMX9UT+rqlVdDbyLbYkOlvMbz8+OWSXUWx+J/AdieDrHY8z0OOw+6MqlMeZwwGGe6IU3/TGTEeSIkuXmGQPncpnITOPkhpmyNhhFPLQVP2gBCVn05SiIM8oMR/cIeuoXAmhIEqzJHNsIbX61WGjlgOEBNwuNz7w60UgSJRan2qE0GQj1Fdr65gTrp21ufiB0WXUQtgslMJcqloiAd5/PXt/kyra/y8/V6gSrmog6WkDKTm4lZWQzsxLuEaJM7pbQAA00gsLlLcqK5Wi3vSF/z9rZdlnUwGmqKh7RtIrJ6hj/b9+ab0LRDEt/tbTZmf6RDxDob/PbenHfybS2BzkdsCLhH+p0gVUC861IUcR8Va0j3NPr0xCGVZrsCd1XqBCElc8zzc3u6MmQrLFQvGEzv2sYUE87XDxTvc+sYg5HORIz8wvg8DGINu5ZPMYUxxqdZ+9ZENJkivemi87PMqLq3bkIPU0dv77NCatJLeSBrB3uxwdWBkD1X9vqs7pFKVoi7nBNxejQ2T8MhGxTA96Lqdw3D/yael0B/vfuP4PrLQpEH3C8JCvSPrbhbYaQCWGoOPIACJoh3jS7sMOIIE3PuUnBu4l7bO9JtjJM3SW2R09m5B3IhQwyfdyeGtOsm9EhtzZPLzT3hA==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(36860700016)(82310400026)(10067099003)(11063799006)(6133799003)(56012099006)(18002099003)(3023799007)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	NFbqiIOJePOqFuIO00XhVaxklgff4yIDJrOQnGpfZDM81QWt7YOvykoHkvqj4Ef+3UagL7m/zTLpp21vQnjHDWD8Z0sY2ygrWPfaN92GSV72IBMtKH6KL8j+eq6bOgKjuI2ReytyjnwnekAzxBH4z1w0o8vpgjvnXYiiSKUotFlyM/COkJH5MZOAX1rlqbDUj96F48zdrgfGi3sUnoyoGXF4q/gGRVFMBIil9/UHxnByKKcmOLuemCF1zQGZ9gJItfIH18wu2W+oljfNmlZmFrWkWKH7mN0O/kvjvcwUSiu7qFsTyLSQ+V9LSnkDrTo7ocwPkpkSAIaqUcHaS39V5cQxDobttR8pBH1/L1KHXdgtscQZ1XcnW+Nqdl/qvXZue0s/jaPlMZ5rIWs6z/xbWZwLqnpg7UZ1sv0lxhyY3mmnSrYYRJ1nNvT3pkO5vbv1
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 20:10:53.8642
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 255be489-8a84-46bf-6ffe-08deef3fd351
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000055E1.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5865

Switch the FSP firmware loaders from the legacy ELF32 format to the new
TLV format.  This change requires the new TLV versions of the r570.144
firmware images.

Because we are no longer loading ELF images, we can also delete the ELF
parser.

Also remove function request_firmware() as this was the last user.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs     | 222 +-------------------------
 drivers/gpu/nova-core/firmware/fsp.rs |  88 +++++-----
 drivers/gpu/nova-core/fsp.rs          |  11 +-
 3 files changed, 46 insertions(+), 275 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index c285e57268f0..d58a3d5770d5 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -8,10 +8,8 @@
 use core::ops::Deref;
 
 use kernel::{
-    device,
     firmware,
-    prelude::*,
-    str::CString, //
+    prelude::*, //
 };
 
 use crate::{
@@ -33,19 +31,6 @@
 
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
@@ -393,208 +378,3 @@ pub(crate) const fn create(
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
index ba4544210e40..29c809e1557e 100644
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
     gsp::{
@@ -413,7 +410,7 @@ fn wait_secure_boot(
         const FSP_SECURE_BOOT_TIMEOUT_MS: i64 = 5000;
 
         let falcon = Falcon::<FspEngine>::new(dev, chipset, bar)?;
-        let fsp_fw = FspFirmware::new(dev, chipset, FIRMWARE_VERSION)?;
+        let fsp_fw = FspFirmware::new(dev, chipset)?;
 
         read_poll_timeout(
             || Ok(hal.fsp_boot_status(bar)),
-- 
2.54.0

