Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010003.outbound.protection.outlook.com [52.101.56.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E932B30C632;
	Fri, 10 Jul 2026 23:05:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724718; cv=fail; b=WrtRlv6nbNrSgWMkTyj5r6ZCCwiTpfuIDLtLfs386z8JHntndPWHUv2YQTM6nffJ2KHT5zP/wl90N+MooqU4Db3ElHN99Vsh5uPEPU5uYDmjGFhtsUOlnOvYJej4YDuPP8WAvF2I3D5tdyxWQaeUl8vke2GLoga/1xI018FliLI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724718; c=relaxed/simple;
	bh=wG5MFWH/bOZnu8dLMJvBXNhItEqhCdoDJ8S8yYz618A=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M9np483SFIdXjHgt36c17wNhw2DvcO+bvYTJAXXZ4CcoLVgsH86/cWgA+LUrTkqoQ10wKNA/qmXTYjtsDqv3LAiEET34Fi0+HUgME4mS/uS2h/ENl0olHd6uytnSVnfbYabQq0adMu2ZpgXU5ogjvU54r+Cf9ilypt0jCLO4/Po=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nQqXkorY; arc=fail smtp.client-ip=52.101.56.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nQqXkorY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fg26H5+I5NOqWn1JWMDJ+xqyiBF3/lvgEfwdoKHIWQZSIz44dKXeujtRGTn0EOk9adVRGKfm/DeSipuJs8YIVR/kDWT7PpAFvFu7ISQZgYVz8pKFrPNzhnJ94zQgXZ1YYMtg3UU1zKS70YqhOIUTsJmq+AdOTTLfWq+cAjaN7hysEybHcXsf5wjA9xoWzY/8AteahOXKIi0axsR/FfK79tgH9bjJPdbt6C1MXaFAbfdv0bBvVS2ZzyXvcK71N9td4zY3cGuAEsDcj2RgtxOgCl3f9Qn3fQvPgf3hrRUMnljYN9ukXLn/0MwWUUi5Swtn3d//FNbUygwreHlf5FHbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zh9vbFu/WPyqG6Q1Lsqf07Dpa7ukfKlj6ZYSswLVNHA=;
 b=DsJeUllQfaxp1osW0iTPQS5HkH8VWH2pI7N/+4hzKEZMUr7kYlQJ2fWiujd/s7vTarhbZCq4D69EqtkINV/l5Jh+XxFjuvg7zZXr+qEESzP+vWimDvx5Ajb9wPYGPsyK6EE4MtKHEYrwK3tsg/Vb/P6DquSWe0gS68DZVg8w3bHzN0IVzfOUja6bLPYb9Mk7N6YO5tasTszzJgvmBG06+YtwMKHLjaRWAT8Gczs4ypIbHeRlMJK8zFHSuHrd4s5cPvTk1vYOUEjFCfPkKAN+8c5qjMhk62oLrFt36qWOQGf29f4k9KKuqK896mNI1oPcdlNbZ0ckJeJW1iGK8HTjZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zh9vbFu/WPyqG6Q1Lsqf07Dpa7ukfKlj6ZYSswLVNHA=;
 b=nQqXkorYfRwnm7XZwM5+71slBJCl5jQQJGO8YvZnOy+EZ0TchAtYXW6LQXMxfZEWk+Usr4lDyOximpRtCG56/iZoD/87fn6Wjn9728oQQrQDUHEnIj+Ka7qchL4CDnpaqx7HpdjS3Ksioe/xUHnatDysHozPNHr24yMfqOacBsSp4BC+p0S4bp62xZFyXhTZ9XF/OJkZ4VT1jfoPl+9uJHf/x0mQoWqedGa0n3Aw/V3MpvArVMiy4NOrLXXw7WDPi9Q+WFhbCyTsgwF+Yq1MUZvYE0KVJZGuPW4hZBsJWKvwh67KbPL73mURzoK2hriij9btu+aL9CFWslF6C4SC5g==
Received: from SA1P222CA0113.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c5::27)
 by SJ0PR12MB6925.namprd12.prod.outlook.com (2603:10b6:a03:483::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 23:05:06 +0000
Received: from SN1PEPF00036F40.namprd05.prod.outlook.com
 (2603:10b6:806:3c5:cafe::3c) by SA1P222CA0113.outlook.office365.com
 (2603:10b6:806:3c5::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 23:05:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00036F40.mail.protection.outlook.com (10.167.248.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 23:05:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:45 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:43 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	<rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>, Gary Guo
	<gary@garyguo.net>, <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v5 3/8] gpu: nova-core: add TLV parser for firmware files
Date: Fri, 10 Jul 2026 18:04:23 -0500
Message-ID: <20260710230428.865447-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710230428.865447-1-ttabi@nvidia.com>
References: <20260710230428.865447-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F40:EE_|SJ0PR12MB6925:EE_
X-MS-Office365-Filtering-Correlation-Id: c0723b94-d897-4f7a-e299-08deded7ab2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|23010399003|376014|22082099003|18002099003|5023799004|11063799006|56012099006|3023799007|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	QtilKiMP5YtxyJXG7B+u4uGIYB+FtAzO8PQ0IAnp4Ea2lRVh2Fu/MPibv7bQVyLRFOXYSyPAT/hOsL7lywo+SJ4b2feUPFZIhp4RJYtXlVfWoOuJiTo7E3rl8n6cn8rPCz55jSXFspaf5+chkrJSufhVsKaHNgq0j7HBYsAUt6k8SmkgBx1LsnzUbG3h0rhkAiYv/eIs6yoxQiAYCs0xCjyyW10gE17Gx7wPu5S4MBaTb3XzVSCZVCFNB3DOK7Urr8XbaN+tfJry2Nut+8kK5jdIPHaqk1zP7dYYfq8W1LvxjUt5gSx7MF22w3zJhdK9++DDZkVqmm2mZaXjUN7RGUu48ByP8TlgUP1ohiCFQQk6A4ZVjbtD6QTgg6xall3NyDEAxGZFwwHa5f5UA/yyTllpx1NYoyr6nZNfpIQm56wcwRcbLviacNVqXOyJNH4WLbqhzMWAG9d7JALG0pGHsIWiz60W/khFKS132oGkiYxOPNDUtdWA7nYfpgKh+rcHK4FwFyrf+RX3zj8G+GXts15xlnoKcYQT8ofEQIJxx0rdRckjXRjZEx5FFxKUnQqNSCMY7k6axHflVd5MnPi2LPg/tvtP8JA2ZXVTVIg6i/Uquuf5tZ9HOLx+Bcxw+g+c4SswdAWSqQrclolz5I2RIV6AxhxgHd5K6x3Xh7ZkWW3OgtxM2NI10lPbf6yvtN+95grZeH/cuzdQVuEFlOoDzCajEYHfgT+uWuW1O69wSDsRXASqnhU8RB2drcxIhKjT
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(23010399003)(376014)(22082099003)(18002099003)(5023799004)(11063799006)(56012099006)(3023799007)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QE+qTuBx1A8LwH80qebWbudNmJh+rJO3KdNl8y7crU4pxmqHNgtrMCMaDkO8CqE4w7CrEWnCWqvv2OUKVoLRQRaggb17dE7C3v1ZKHKOgJUqmFpgB86UF74GtMEFJ37D5xvybqxWSMU/uwWBiSwuoDq0Hp4H7DgOzAFGb0mBb8AEH0thTFV2WQrjQQmplF7Y+W6nnJStq0a2m51mBeCTJjfov4WepOsTiDjvz415AhLYlxTzUKL1MYyAhq2tgLkuxX89OY8P4rzmJcsb1k3jhrGRUBCz3+4whAmGDDSAqDIPfpVec3MdyOzMsTEzOovZ2bP6tJncZFgNjVM1l6VX880qkytSE3mvdmZvCcSchhP8KUueLWEVC0T9KcYkoJOFaEB/cA1I7DxZ6oigVBnjnqFv5l7vTLcqXonOzP/CfgE2MPKd4/gSLO4or1rViVlJ
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 23:05:00.2771
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0723b94-d897-4f7a-e299-08deded7ab2c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F40.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6925

TLV (type, length, value) files are the new image format used by Nova
to encapsulate firmware images and their metadata.  Unlike the firmware
files for previous versions of the firmware, TLV filenames are not
versioned, and they have a .tlv suffix.

Add function request_tlv() to load TLV firmware images.

Add the Tlv struct and supporting types for parsing TLV (type, length,
value) firmware images. TLV files begin with a 4-byte magic header,
which must be "NVFW" for Nvidia firmware files.  This is followed by a
sequence of blocks each containing a 4-byte ASCII tag, a 4-byte
little-endian length, and a payload padded to a 4-byte boundary.

Tlv::new() validates the entire image up front, so that the iterator can
subsequently yield blocks without fallible parsing.

Also add accessor methods for the various encoded types that will be used
by the driver.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 Documentation/gpu/nova/core/tlv.rst   | 187 ++++++++++++++++++
 drivers/gpu/nova-core/firmware.rs     |   1 +
 drivers/gpu/nova-core/firmware/tlv.rs | 274 ++++++++++++++++++++++++++
 3 files changed, 462 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/tlv.rst
 create mode 100644 drivers/gpu/nova-core/firmware/tlv.rs

diff --git a/Documentation/gpu/nova/core/tlv.rst b/Documentation/gpu/nova/core/tlv.rst
new file mode 100644
index 000000000000..9e8c08727977
--- /dev/null
+++ b/Documentation/gpu/nova/core/tlv.rst
@@ -0,0 +1,187 @@
+.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+==================================
+TLV Tags in Nova Firmware Images
+==================================
+
+Nova firmware images use a Type-Length-Value (TLV) format to encapsulate
+firmware components and metadata. The TLV file begins with a 4-byte "magic"
+header that contains the string "NVFW".  Following the header is a sequence of
+TLV blocks.
+
+Each block consists of a 4-byte tag of ASCII characters, a 4-byte length
+encoded as a little-endian unsigned integer, and a sequence of bytes, the size
+of which is equal to the length rounded up to the next multiple of 4.
+
+The driver code that reads the TLV and uses its contents is called the parser.
+It is the responsibility of the parser to handle missing or malformed tags,
+lengths, and values in the TLV.
+
+::
+
+    +------+------+------+------+
+    |  'N' |  'V' |  'F' |  'W' |  Magic header
+    +------+------+------+------+
+    |  Tag (4 bytes, ASCII)     |  TLV block 0
+    +---------------------------+
+    |  Length (4 bytes, LE)     |
+    +---------------------------+
+    |                           |
+    |  Value (length bytes,     |
+    |  padded to 4-byte align)  |
+    |                           |
+    +---------------------------+
+    |  Tag (4 bytes, ASCII)     |  TLV block 1
+    +---------------------------+
+    |  Length (4 bytes, LE)     |
+    +---------------------------+
+    |                           |
+    |  Value (length bytes,     |
+    |  padded to 4-byte align)  |
+    |                           |
+    +---------------------------+
+    |         ...               |  More TLV blocks
+    +---------------------------+
+
+Tags and Length
+===============
+TLV tags are always four-character words, with all letters being upper case.
+Duplicate tags are not allowed.
+
+Lengths of zero are allowed and indicate that the tag is a boolean.  That is,
+presence of the tag indicates ``True`` and absence indicates ``False``.
+
+A TLV file may contain additional tags not described in this document.
+
+Values
+======
+Values are one of three types.  The type is not encoded in the format; rather,
+the parser expects a given tag to have a value of a given type.
+
+1) Integers, encoded in 32-bit or 64-bit little-endian format.
+2) Strings, encoded as-is and required to be ASCII only and without a null terminator.
+3) An array of bytes, for binary data.
+
+Common Tags
+===========
+These tags are shared across firmware types and carry the same meaning
+wherever they appear.  Unlike the firmware-specific tags below, a common tag
+is reserved: its meaning is fixed and may never be redefined for a particular
+firmware type.
+
+``VERS`` (string)
+    Human-readable firmware version string, indicates the version of
+    the firmware.  Present in all TLV files.
+
+A TLV image must contain either a single ``BLOB`` tag (firmware embedded
+inline) or a ``SIZE``/``FILE`` pair (firmware stored in a separate file).
+
+``BLOB`` (bytes)
+    If the firmware microcode binary is stored in the TLV, this tag contains
+    the actual firmware image bytes.
+
+``FILE`` (string)
+    If the firmware binary is stored as a separate file, this tag contains the
+    name of that file, which is required to be in the same directory as the TLV,
+    so no paths are allowed in the filename.  This tag is always paired with
+    ``SIZE``, so as to allow the driver to pre-allocate the buffer before
+    loading the file.
+
+``SIZE`` (u32)
+    Total size in bytes of the firmware image to be loaded from the companion
+    file named by ``FILE``.  This tag is mandatory if ``FILE`` exists, so the
+    size of the firmware image must be known when the TLV is created.  If the
+    firmware image is updated and its size changes, then the TLV must be
+    updated with it.
+
+GSP Firmware Tags
+=================
+``SIGN`` (bytes)
+    Cryptographic signature for the GSP firmware.
+
+``BLID`` (bytes)
+    The build ID, extracted from the ".note.gnu.build-id" section.
+
+Booter Firmware Tags
+====================
+``DAOF`` (u32) - ``os_data_offset``
+    OS data section offset within the firmware image (absolute byte offset).
+    Maps to the DMEM load source.
+
+``DASZ`` (u32) - ``os_data_size``
+    OS data section size in bytes.
+
+``CDOF`` (u32) - ``os_code_offset``
+    OS code section offset within the firmware image (absolute byte offset).
+    Maps to the non-secure IMEM load source.
+
+``CDSZ`` (u32) - ``os_code_size``
+    OS code section size in bytes.
+
+``PLOC`` (u32) - ``patch_loc``
+    Signature patch location -- byte offset within the firmware image where the
+    selected signature should be written.
+
+``FUSE`` (u32) - ``fuse_version``
+    Fuse version of the firmware, used with the hardware fuse register to
+    select the correct signature index.
+
+``ENID`` (u32) - ``engine_id``
+    Engine ID mask identifying the falcon engine this firmware targets.
+
+``UCID`` (u32) - ``ucode_id``
+    Microcode ID used together with the engine ID to query hardware signature
+    fuse registers.
+
+``A0CO`` (u32) - ``app0_code_offset``
+    App0 code offset -- start of the secure code region within the firmware
+    image. Used as the IMEM secure section source.
+
+``A0CS`` (u32) - ``app0_code_size``
+    App0 code size in bytes.
+
+``NSIG`` (u32) - ``num_sigs``
+    Number of signatures included in the ``SIGN`` tag.  A value of 0 indicates
+    unsigned firmware and that there is no ``SIGN`` tag.
+
+``SIGN`` (bytes)
+    Concatenated array of firmware signatures. The size of each signature is
+    the total length of the ``SIGN`` value divided by ``NSIG``. The correct
+    signature is selected using the fuse-version-derived index.
+
+Generic Bootloader Tags
+=======================
+``CDSZ`` (u32) - ``code_size``
+    Size in bytes of the bootloader code to copy from the ``BLOB`` tag and
+    PIO-load into falcon IMEM.
+
+``STRT`` (u32) - ``start_tag``
+    Start tag identifying the IMEM block where execution begins.  The falcon
+    boot address is derived as ``start_tag << 8``.
+
+GSP Bootloader Tags
+===================
+``CDOF`` (u32) - ``code_offset``
+    Offset within the firmware image at which the code section starts.
+
+``DAOF`` (u32) - ``data_offset``
+    Offset within the firmware image at which the data section starts.
+
+``MFOF`` (u32) - ``manifest_offset``
+    Offset within the firmware image at which the manifest starts.
+
+``APPV`` (u32) - ``app_version``
+    Application version of the firmware.
+
+FMC Firmware Tags
+=================
+``HASH`` (bytes)
+    SHA-384 hash of the FMC firmware, exactly 48 bytes long.
+
+``PKEY`` (bytes)
+    Public key used to verify the FMC firmware. At most 384 bytes (RSA-3072),
+    but may be shorter.
+
+``SIGN`` (bytes)
+    Signature of the FMC firmware. At most 384 bytes (RSA-3072), but may
+    be shorter.
\ No newline at end of file
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index a94820a3b335..c0cd06579643 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -32,6 +32,7 @@
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod riscv;
+pub(crate) mod tlv;
 
 pub(crate) const FIRMWARE_VERSION: &str = "570.144";
 
diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
new file mode 100644
index 000000000000..5dfd2dd814f8
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -0,0 +1,274 @@
+// SPDX-License-Identifier: GPL-2.0
+// SPDX-FileCopyrightText: Copyright (c) 2026 NVIDIA CORPORATION & AFFILIATES. All rights reserved.
+
+use kernel::{
+    device,
+    firmware,
+    prelude::*,
+    str::CString, //
+};
+
+use crate::{
+    gpu,
+    num::*, //
+};
+
+/// Requests the GPU firmware TLV `name` suitable for `chipset`.
+#[expect(dead_code)]
+pub(crate) fn request_tlv(
+    dev: &device::Device,
+    chipset: gpu::Chipset,
+    name: &str,
+) -> Result<firmware::Firmware> {
+    let chip_name = chipset.name();
+
+    dev_dbg!(
+        dev,
+        "loading firmware image {}/gsp/{}.tlv\n",
+        chip_name,
+        name
+    );
+
+    CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}.tlv"))
+        .and_then(|path| firmware::Firmware::request(&path, dev))
+}
+
+struct TlvBlock<'a> {
+    tag: [u8; 4],
+    value: &'a [u8],
+}
+
+/// On-wire TLV block header: 4-byte ASCII tag + little-endian payload length (bytes, excluding
+/// padding to a 4-byte boundary).
+struct TlvBlockHeader {
+    tag: [u8; 4],
+    length: usize,
+}
+
+impl TlvBlockHeader {
+    const SIZE: usize = size_of::<[u8; 4]>() + size_of::<u32>();
+
+    /// Parses the first [`Self::SIZE`] bytes of `hdr` (caller may pass a longer slice).
+    fn parse(hdr: &[u8]) -> Option<Self> {
+        let hdr = hdr.get(..Self::SIZE)?;
+        let tag = <[u8; 4]>::try_from(hdr.get(..4)?).ok()?;
+        if !tag.is_ascii() {
+            return None;
+        }
+        let len_arr = <[u8; 4]>::try_from(hdr.get(4..Self::SIZE)?).ok()?;
+        let length = u32_as_usize(u32::from_le_bytes(len_arr));
+        Some(Self { tag, length })
+    }
+}
+
+/// Iterator over the [`TlvBlock`]s of a [`Tlv`].
+///
+/// # Invariants
+///
+/// `pos` is a byte offset into `tlv.data` that always lies on a block boundary (in the sense
+/// of the [`Tlv`] invariant): it is either the start of a well-formed block, or equal to
+/// `tlv.data.len()` (end of iteration).
+struct TlvIter<'tlv, 'a> {
+    tlv: &'tlv Tlv<'a>,
+    pos: usize,
+}
+
+impl<'tlv, 'a> Iterator for TlvIter<'tlv, 'a> {
+    type Item = TlvBlock<'a>;
+
+    /// Returns the block starting at `self.pos` and advances the cursor past it, or [`None`]
+    /// once the cursor reaches the end of the data or encounters an error.
+    ///
+    /// Note that errors cannot actually occur because the data is validated in the constructor.
+    fn next(&mut self) -> Option<Self::Item> {
+        if self.pos >= self.tlv.data.len() {
+            return None;
+        }
+
+        let tail = self.tlv.data.get(self.pos..)?;
+
+        let hdr = tail.get(..TlvBlockHeader::SIZE)?;
+        let header = TlvBlockHeader::parse(hdr)?;
+
+        let stored_size = header.length.checked_next_multiple_of(4)?;
+        let advance = TlvBlockHeader::SIZE.checked_add(stored_size)?;
+        let payload_end = TlvBlockHeader::SIZE.checked_add(header.length)?;
+
+        let value = tail
+            .get(..advance)?
+            .get(TlvBlockHeader::SIZE..payload_end)?;
+
+        // INVARIANT: by the `Tlv` invariant the block at `self.pos` occupies exactly `advance`
+        // bytes, so `self.pos + advance` is the next block boundary (or `data.len()`).
+        self.pos = self.pos.checked_add(advance)?;
+
+        Some(TlvBlock {
+            tag: header.tag,
+            value,
+        })
+    }
+}
+
+/// The post-header part of a validated TLV (type, length, value) firmware image.
+///
+/// TLV firmware images start with a 4-byte "NVFW" magic header, followed by a sequence of
+/// blocks. Each block has a 4-byte type tag, a 4-byte length field, and a data payload
+/// (value) whose stored size is the length rounded up to the nearest multiple of 4.
+///
+/// [`Self::new`] checks the magic header and walks every block: tags must be ASCII,
+/// lengths and padding must fit without overflow, and the byte stream after `NVFW` must
+/// be exactly partitionable into blocks (no trailing partial header or slack). After
+/// that, [`TlvIter`] only signals end-of-stream via [`None`], not parse failure.
+///
+/// Although the spec forbids duplicate tags, neither the constructor nor the iterator
+/// enforces this restriction.  Instead, duplicate tags are simply ignored.
+///
+/// # Invariants
+///
+/// `data` is a validated TLV payload (the bytes *after* the `NVFW` magic): it is the exact
+/// concatenation of zero or more well-formed blocks, with no trailing partial header or slack.
+/// Consequently, any offset `o` into `data` that is a block boundary and satisfies
+/// `o < data.len()` is the start of a complete block whose header parses and whose stored
+/// extent (`TlvBlockHeader::SIZE + header.length.next_multiple_of(4)` bytes) lies within
+/// `data`. `data.len()` is itself a boundary.
+pub(crate) struct Tlv<'a> {
+    data: &'a [u8],
+}
+
+#[expect(dead_code)]
+impl<'a> Tlv<'a> {
+    const MAGIC: &'static [u8; 4] = b"NVFW";
+
+    /// Parses `data` as a TLV firmware image, returning [`EINVAL`] if the image is malformed.
+    pub(crate) fn new(data: &'a [u8]) -> Result<Self> {
+        // Verify that the magic bytes exist and are the correct value
+        let magic_len = Self::MAGIC.len();
+        if data
+            .get(..magic_len)
+            .is_none_or(|magic| magic != Self::MAGIC)
+        {
+            return Err(EINVAL);
+        }
+
+        // The payload is the contiguous sequence of TLV blocks after the magic.
+        let payload = data.get(magic_len..).ok_or(EINVAL)?;
+
+        if payload.is_empty() {
+            // Reject empty TLV files
+            return Err(ENODATA);
+        }
+
+        // The spec says every TLV must have a VERS tag.
+        let mut has_vers = false;
+
+        let mut rest = payload;
+        while !rest.is_empty() {
+            // Validate and extract the header (type, length).
+            let Some(header): Option<TlvBlockHeader> = rest
+                .get(..TlvBlockHeader::SIZE)
+                .and_then(TlvBlockHeader::parse)
+            else {
+                return Err(EINVAL);
+            };
+
+            has_vers |= header.tag == *b"VERS";
+
+            // The `length` field of a TLV block contains the actual byte length of the
+            // value, but each TLV block is aligned to a 4-byte boundary.
+            let Some(stored_size) = header.length.checked_next_multiple_of(4) else {
+                return Err(EINVAL);
+            };
+
+            let length = TlvBlockHeader::SIZE
+                .checked_add(stored_size)
+                .ok_or(EINVAL)?;
+
+            rest = rest.split_at_checked(length).ok_or(EINVAL)?.1;
+        }
+
+        if !has_vers {
+            return Err(EINVAL);
+        }
+
+        // INVARIANT: the loop above walked `payload` block-by-block. For each block, the
+        // header is parsed (`TlvBlockHeader::parse` rejects non-ASCII tags), and the
+        // stored extent (`SIZE + length.next_multiple_of(4)`) is computed without
+        // overflow and split off `rest` only when it fits. The loop ends only when `rest`
+        // is empty, so the byte stream is an exact concatenation of blocks with no
+        // trailing partial header or slack.
+        Ok(Self { data: payload })
+    }
+
+    fn iter(&self) -> TlvIter<'_, 'a> {
+        // INVARIANT: 0 is a block boundary, either the start of the first block,
+        // or `data.len()` when `data` is empty.
+        TlvIter { tlv: self, pos: 0 }
+    }
+
+    fn find(&self, tag: &[u8; 4]) -> Result<TlvBlock<'a>> {
+        self.iter().find(|b| b.tag == *tag).ok_or(EINVAL)
+    }
+
+    /// Return a slice of bytes.  Returns ENODATA if the value is empty.
+    pub(crate) fn get_bytes(&self, tag: &[u8; 4]) -> Result<&'a [u8]> {
+        let tlv = self.find(tag)?;
+
+        // Treat empty value as an error, to avoid trying to parse nothing.
+        if tlv.value.is_empty() {
+            return Err(ENODATA);
+        }
+
+        Ok(tlv.value)
+    }
+
+    // Return a little-endian u32.
+    pub(crate) fn get_u32(&self, tag: &[u8; 4]) -> Result<u32> {
+        let tlv = self.find(tag)?;
+
+        tlv.value
+            .try_into()
+            .ok()
+            .map(u32::from_le_bytes)
+            .ok_or(EINVAL)
+    }
+
+    /// Return a string value.
+    pub(crate) fn get_string(&self, tag: &[u8; 4]) -> Result<&'a str> {
+        let tlv = self.find(tag)?;
+
+        let bytes = tlv.value;
+
+        // To make sure the value actually is a string, ensure it's all ASCII.
+        if !bytes.is_ascii() {
+            return Err(EINVAL);
+        }
+
+        core::str::from_utf8(bytes).map_err(|_| EINVAL)
+    }
+
+    /// Obtain the nth signature from a SIGN tag.  If `index` is None,
+    /// then return the last signature.
+    pub(crate) fn get_signature(&self, index: Option<usize>) -> Result<&'a [u8]> {
+        let num_sigs: usize = match self.get_u32(b"NSIG")? {
+            0 => return Err(EINVAL),
+            n => n.into_safe_cast(),
+        };
+
+        let sig_bytes = self.get_bytes(b"SIGN")?;
+
+        // Ensure that sig_bytes can be divided evenly into chunks.
+        if sig_bytes.len() % num_sigs != 0 {
+            return Err(EINVAL);
+        }
+
+        // num_sigs cannot be 0, and sig_bytes cannot be empty, so this cannot panic.
+        let sig_size = sig_bytes.len() / num_sigs;
+
+        let index: usize = match index {
+            None => num_sigs - 1,
+            Some(index) => index,
+        };
+
+        sig_bytes.chunks_exact(sig_size).nth(index).ok_or(EINVAL)
+    }
+}
-- 
2.54.0

