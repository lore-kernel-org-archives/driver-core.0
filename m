Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010029.outbound.protection.outlook.com [52.101.201.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE843385515;
	Fri, 31 Jul 2026 20:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528658; cv=fail; b=aLJ6P31AF7H9+bGE8uzp9eUcNSer8H32ZfOJirO7H9q7yHodBlb/+/NiG3q0kiqwYj16dgyhhSjPH3vuFFKHBjd7K/vjUfPqMFEoAULLwes5Qw6rDkUOTh8a6DETWGWGPq7yxt74g8vJbElFkQ67i3xN5ZGHJTfICkNa9tb7nes=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528658; c=relaxed/simple;
	bh=UuAOycUjx69AfrpKBOslxZ5OJrAhhPE4bOt28C+mt3s=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mLniCA5Ahd2PGt8Bv6fUBnN4+13sdgl+Uq98wIQi3I44TCPGVTOGI87or7Xlv8erCp7aWjIHieTl7mbS08tagxcjVXWTmt1NjqmpTmLIIEhDL6i7ePy0fSyJg5ocl6V9/2Wm+hwHEOMzNdkmhQIlnvYocIAjAZx4toiQt8f/6I8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=S1j46YPN; arc=fail smtp.client-ip=52.101.201.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="S1j46YPN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NyDut/3ZrmSyCCj7Jb8y92FkLTBb0u/bAoLGQm2Vlfv0AwZRo9rJBeMApaCE6O1INiyVi0Y+AXWtkskKhuFW3hbDwp34O+X2euEKhsTAYaMscmFr9Fz75HGy4VxSc+zrDJj6ao/AWMK1ohp2tZR/2C/U3lOlG3/rlkAnIMJOBKNbWUnQ0rx5TQhKIXm+ugsM+V5hcrYEnn01TE6C5OzD2Ew89/XkFFja1n3lCUCoAkDynx3jd99gZeCk0DJdKiGVNhqlLPEyQplEZxbBUV8KQbwvBoX1JfJOM/JFFJqI+xcZ/Gav+TfZ+DDyrjeqbg2s9A125/2EOX2Ns31Ib+38wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T0gFPVw2mxat4AeQ+E0nK5E7xsgdNczSGjcCnR+rKAA=;
 b=qKVir2frIzF+TxM5ms2FzNksUTKKfWwUArXjjp89tPJOlHWSszwpHzdrbw7TybKDNeEiBH3gR0aWLy7LxiBPYgShAESXPT2YvutJ1SdTdsXA+7qMMCYcgfxOeoQBEVF4VX3XpV7tfLnqQ+AoiG8gYAUNnvfiDz6mPI825L4YQng7yWYyoQsOfFBhx/ZiMvPGlOR5SGr3aMrVhMqacvpaqbNDSARVOEo97U6Kje7ZdxlyV1VvsbPZtHIAnRFW4SWehaV9R2BsG9t4NE9UJP0rUdfLPYDabygEw0dx0xnyS/RhHQmjklKz9pmhyKdSPi9ow04zCbm7ltSedOsKXdcRdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T0gFPVw2mxat4AeQ+E0nK5E7xsgdNczSGjcCnR+rKAA=;
 b=S1j46YPNf1rq/bJM2FDbTN9LmKe/bufX+f2WhTiinJVnqM7GChZx244qzW2uEdb42Zd74mPTOwqLMRqKxtImAfU8cEgpS09UsXTjV9NQdd7Pd77PmyNK4q+s0ZTpvUeaQKrPlyrgLsKREfghtyL4lwVkC38gX3LVk9KE9oxeBU/4TbdhaQxPFeJOdx5fcDRFJri1CfQIIrNEUVfCgu67kf9AmZJgFs4qchF9RqkRMSDur+KVHzAvy1Yovqag8lzoZvevDXxV8NDZpBg4Zbtvfi7DtG+6nRpChdvh/FPiMrcP9RrQ8NsnfOWkKUw5Uibw++JkAaycnwcklL0XUUhWPw==
Received: from DS1P220CA0002.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:455::11) by
 DM4PR12MB5842.namprd12.prod.outlook.com (2603:10b6:8:65::13) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.16; Fri, 31 Jul 2026 20:10:44 +0000
Received: from DS1PEPF00017094.namprd03.prod.outlook.com
 (2603:10b6:8:455:cafe::77) by DS1P220CA0002.outlook.office365.com
 (2603:10b6:8:455::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 20:10:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017094.mail.protection.outlook.com (10.167.17.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 20:10:44 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:29 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:28 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v7 3/8] gpu: nova-core: add TLV parser for firmware files
Date: Fri, 31 Jul 2026 15:10:12 -0500
Message-ID: <20260731201017.2580713-4-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017094:EE_|DM4PR12MB5842:EE_
X-MS-Office365-Filtering-Correlation-Id: 48e63b18-d72d-4e0b-b8a8-08deef3fcd96
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|56012099006|5023799004|11063799006|10067099003|3023799007|6133799003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	Guo8rwDDe9qe81tgGeYXQljQ99y0WZcwP7eb0k3/jAL7W1BB01ktIgxCu3zigX697wQrxgzu+st4wwT7y6oI87xJC5dTxzejMICzudp6UedYqQLtw0vEAgFg6wRww5QujLPkvvGz564ZWTz9C9aabj2vr8ZgS9k/osu7Ct599K3hiqmmPyjKBtCvm3SM/xX4k1PQ6yX7nxr1Rnen6B9rfitEV0qjK2sdAfNYXYL9CsL7a8kNXYQuhatcruko4jh8YRAaYTDauvEBh4ePvF8L0i6WFiwqyttb5TbhHGFB+0B2FTUirq4tkJwjztvyUkwU8aB8zVIP/yhc71TvRijp6cJt6dUHN5Yh3UJxmzapSzB2viFAwhFFenmQeYz02sm1XMdsJZb/o3qkJl4kH6BY+fbwEpV56EmHY188BigIKCw1l9DhCE/R+7KZcDqSy4+HfmvUdZ9ns/FdkNhTQFS/aX17bAGkhHhdlvydpdWLEKX2cOwbcsvCpOSHVdbGnlW95e+FdJabrZ/Tf2bwXYcIuoc5vmoCQvtG9fmm3/eZcSYXSy6QnT45Vc8sYuq83njQSp6Fiz7KDzfU4rBJpk68hZgG+NpZF5cWKQVidz3g5CxCi42UchNZa20Dg8JRCytHGtKguB43b6O5owwXAqiRrnehNbZ2lFVnDQTWotWlGkrFXaX+xyktw54FUuVgIwwu3/L9kGNBX5Ad0/aHX773A+11z3h3zQKR2J+9aPqSceSEDJWPpHGTFjI6JUzOlhN/
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(56012099006)(5023799004)(11063799006)(10067099003)(3023799007)(6133799003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cTTZyBgmhR8Fk8Td2gPHbJENijpyvWvcA/5KjH56ZuPUYY38wAzHu1TJ0jYBimiG+XkOC6lOSgJtjjV9ii0gXdRMASDE99PrbBglFsB1UFvBtB0M+Wd+7iKqceqHQcoWLoUY/q2gU3bVEEIkZRDp4kQzIX6qH6dA/QURoYA1zojDv/yMd9jYzKC1dOtI6NwlJaY8W/TW1zv+Rplh/+F4rGngm4yXzQIAezUfhj/UHwi2D3dkTs1zr5/z3B/n1bUl0bX1PJpSCFwRHNECQqBMbv2fVBx0Ghj+56Hrf+Xii/l6mv9sJM9BBBXBzFKc3P1qGh6i3lYO4lK0w++s7TL/VCH6+Wn68lJdHDfjMnKfrAtQQ3tpiC4OE/nGxM8FUV9ZyW1Qxx6Dj2KERU1cIoPZbEHcOf1Ou3EL41a+T/aTCW5tiEI/bWh6zfnzK/NUFet5
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 20:10:44.2972
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 48e63b18-d72d-4e0b-b8a8-08deef3fcd96
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017094.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5842

TLV (type, length, value) files are the new image format used by Nova
to encapsulate firmware images and their metadata.  Unlike the firmware
files for previous versions of the firmware, TLV filenames are not
versioned, and they have a .tlv suffix.

Add function request_tlv() to load TLV firmware images.

Add the Tlv struct and supporting types for parsing TLV firmware images.
TLV files begin with a 4-byte magic header, which must be "NVFW" for
Nvidia firmware files.  This is followed by a sequence of blocks each
containing a 4-byte ASCII tag, a 4-byte little-endian length, and a
payload padded to a 4-byte boundary.

Tlv::new() validates the entire image up front, so that the iterator can
subsequently yield blocks without fallible parsing.

Also add accessor methods for the various encoded types that will be used
by the driver.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 Documentation/gpu/nova/core/tlv.rst   | 184 ++++++++++++++++++
 Documentation/gpu/nova/index.rst      |   1 +
 drivers/gpu/nova-core/firmware.rs     |   1 +
 drivers/gpu/nova-core/firmware/tlv.rs | 267 ++++++++++++++++++++++++++
 4 files changed, 453 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/tlv.rst
 create mode 100644 drivers/gpu/nova-core/firmware/tlv.rs

diff --git a/Documentation/gpu/nova/core/tlv.rst b/Documentation/gpu/nova/core/tlv.rst
new file mode 100644
index 000000000000..3ce508e9545a
--- /dev/null
+++ b/Documentation/gpu/nova/core/tlv.rst
@@ -0,0 +1,184 @@
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
+A TLV file may contain additional tags not described in this document.
+
+Values
+======
+Values are one of four types.  The type is not encoded in the format; rather,
+the parser expects a given tag to have a value of a given type.
+
+1) Integers, encoded in 32-bit or 64-bit little-endian format.
+2) Strings, encoded as-is and required to be only printable ASCII characters
+   and without a null terminator.
+3) An array of bytes, for binary data.
+4) Boolean, encoded as single byte, with a value of 0 for False or 1 for True.
+
+Common Tags
+===========
+These tags are shared across firmware types and carry the same meaning
+wherever they appear.  Unlike the firmware-specific tags below, a common tag
+is reserved: its meaning is fixed and may never be redefined for a particular
+firmware type.
+
+``VERS`` (string)
+    Human-readable firmware version string.  Present in all TLV files.
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
+``BLID`` (string)
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
+    Number of signatures included in the ``SIGN`` tag.
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
diff --git a/Documentation/gpu/nova/index.rst b/Documentation/gpu/nova/index.rst
index 1783513cbd05..2afa58e8f08d 100644
--- a/Documentation/gpu/nova/index.rst
+++ b/Documentation/gpu/nova/index.rst
@@ -33,3 +33,4 @@ vGPU manager VFIO driver and the nova-drm driver.
    core/fsp
    core/fwsec
    core/falcon
+   core/tlv
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 20eff987c5d6..2075b68b364a 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -33,6 +33,7 @@
 pub(crate) mod fwsec;
 pub(crate) mod gsp;
 pub(crate) mod riscv;
+pub(crate) mod tlv;
 
 pub(crate) const FIRMWARE_VERSION: &str = "570.144";
 
diff --git a/drivers/gpu/nova-core/firmware/tlv.rs b/drivers/gpu/nova-core/firmware/tlv.rs
new file mode 100644
index 000000000000..99b911cbf39f
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -0,0 +1,267 @@
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
+    let filename = CString::try_from_fmt(fmt!("nvidia/{chip_name}/gsp/{name}.tlv"))?;
+
+    dev_dbg!(dev, "loading firmware image {:?}\n", &filename);
+
+    firmware::Firmware::request(&filename, dev)
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
+    /// Return a little-endian u32.
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
+        // Strings can only contain printable ASCII characters.
+        if bytes.iter().any(|&b| !(32..127).contains(&b)) {
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
+        let index = index.unwrap_or(num_sigs - 1);
+
+        sig_bytes.chunks_exact(sig_size).nth(index).ok_or(EINVAL)
+    }
+}
-- 
2.54.0

