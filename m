Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010014.outbound.protection.outlook.com [52.101.46.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F139219C553;
	Tue, 30 Jun 2026 19:48:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782848914; cv=fail; b=Du8S4FLWMR8Ws7CvtmIHFjx7jQchd4ttxzR+O9SwWhsTptGvltg5+jNq3+3yRBkSJ8+KzdrIXcwwahx9n2yJlGzajIw0siv42FXM/yo46HevDi2r5y1+ICRsFmBY9gOyC9Lm9SqpdRf8PwdkuFR/4PFVV8peDKUINRYDnpRyS+Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782848914; c=relaxed/simple;
	bh=ozC+MSZAWz4nkH5iAVXzb6olrFpNoj1wESNz/NP3ds4=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=O3BmyGTNtQqV9jHSrxxwrrQsVVOtdKT9p7g8sEU7biVkjbZgIU9O6KrIaWEsNTJo1fT5hbNr8KrmKYX4oWTFD1vOSyHAQ6+ALVgLknozMQXozhcecPhU/sb7idUZ3q0eI/qORMmtJAUA9GzxnQbTtq8znBU9evIfl03Y+Cp7dY8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=P7ns2dXn; arc=fail smtp.client-ip=52.101.46.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="P7ns2dXn"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sVhMXj8UNhURaoGGvtXsQ1NDV1iAxfM7y/NPIEVKAP1QCn00595SJv0ivZxrbN30qIDzlj1z9+Ie/nl/85cFa1Qxogb5hFOxazx0BE19I0ub2ZOz+wZ313wUgeT/kZ35tZS/5+t2qb0gvnxK9csDOD6nD/l4r+U/3PFGmgZHzOf1oJQA9WbilnyddZgjcl7xEZB3AqSC8SUJDkRffRAuyiYJuR/UKWFECgGV3S4M4VbBiay9jgeE2Zmb1oCCoyhvUTvWba5bAIDYzHurX4FkMKKND3MJX78MKMMmXF/3AuK2iowcYiG6SrlG/N48xi9OuehTKHg8RGYGVRa0EZf3Lg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GGUsSgRhIcY7QYdX0zYlRLdMNZLcqzlypW5hcifSZxc=;
 b=GObDj3HzkVFlOGr3GESj3TbCeVXgy23MrIV2GKBRSQFa9zHZE9jwTr4qZXuHGcHSvWP0964yS+c69K8AwtiSluc+h0fFRWOJztSA34cfsMT8S92teXH07kxr+JuQNDnJNHz2d+QykinGQIpkiYzUtqhoSHP8BjS3QBG3qzVGEdLM29lu8lV4DQNS+Gsjvdbhs5+cCfb4m/YGCtfT0DzKUtIND0tDSsLwPh151PyzWL+YvN+WpU5WY9NqXAoN0sM9L2n3VpLwGRssAJCx27O/8KFgwnfDwMbRtf5ytXEaMMWRnIBOhb/PcuytL2uP82I5gkBtFoRdyNTiIXXG6eLKsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GGUsSgRhIcY7QYdX0zYlRLdMNZLcqzlypW5hcifSZxc=;
 b=P7ns2dXnX7hzg2f/jkNt4DSaWlLDau0D1Rm6w1BRPMsmhMeQ7jG56bcJp3z+uh0Zdk72mBHJEPpam2rl8PrzlGwF6/pE+4dPqXHT2UucyftV4AEiwC6Pc3talUxpjFETPQJZpsZuzppjFM8HiZsK4J0migeYlK0rdM4JbbVI80j4k5pRMisxZShZrKkUE5EvvabE3tQPs1lEH5vy/7XgIFxbAr7Js3bYIgpKfsUJoK6dUpWpxtciAgWfNQ2nHMhrzlqC0lYAmeGB7BssaXBxScLKbfo6CczsT83Lydkr95qyHmd2R6zR+PLS9CxO7vJWjrc/dOO4/asITSD6IZnsyA==
Received: from SA1P222CA0172.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:3c3::28)
 by LV2PR12MB5968.namprd12.prod.outlook.com (2603:10b6:408:14f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 19:48:25 +0000
Received: from SA2PEPF00001504.namprd04.prod.outlook.com
 (2603:10b6:806:3c3:cafe::17) by SA1P222CA0172.outlook.office365.com
 (2603:10b6:806:3c3::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 19:48:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00001504.mail.protection.outlook.com (10.167.242.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 19:48:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 12:48:08 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 12:48:06 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 2/7] gpu: nova-core: add TLV parser for firmware files
Date: Tue, 30 Jun 2026 14:47:44 -0500
Message-ID: <20260630194749.1209490-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00001504:EE_|LV2PR12MB5968:EE_
X-MS-Office365-Filtering-Correlation-Id: 216feff3-7862-42c0-db4f-08ded6e08c74
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|376014|23010399003|1800799024|921020|3023799007|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	UjC3JxE70CRhXzrp86GFiYKXyzBRGQpNYdMexqfQI+nSeT9NrWarIzRt2bldfVpohUf3X4qm4eq4VOxyRcbOP73u6isDzVgfA8d/lwdgWMF99Nf+ATHKPe/7OhcGn7Kg7LN6Ct20eWwXkEXO5RCM7XGbMrNEhT20QbszpGNLF8v6Ri9xKkvbAyznAVHynO6Bt4RwoPU8giIQ5796okhPOdDiPMQ6M4lC+7DH5h2DXVA0I76KW5iWZRVAYyRffUePAS89v2zq78C8nDkNG+gPUQ4yxiDAGlu8P0Hy/5gwOgP9xrkJmuMXKw4k4mZ5sbl79iyPbr45Lb9X6aHhVvw7alCnuG9K+6evRIqwcQUvyZbDBLwohrBy/8HnGZBKQJW5HXZxgVwx6FQoGuQWRmk89t2NxwyWT8+MsLk9ylPJwcVdeJ9j1CTJFxB2GSlUjKjhh3t9jT+9oDJES5jSAABzGGDzlLb+cG7O3i6ofUyjYRQJgOBBAVL0Q8jbpZkeqqg1FThSD4Oa+z7XUvIYKKJtwhvl0GOFYgcwA0hAGr4/ufHU2UPsfNyesX5gqTE8KO02tOfBVImO0Ol9nVX1GLGk1txNsXgbz4HGl9sr1oULiIYmClzEDs5bpaqQaEcBE3tO5V05ml+wwbBUyJHmtjceRmtC+syM8AgMTeM7vja7/J2ziyp3AxxTBGwrsYYje4qOnUi1Y310p8oe9hqJybUTGZJpFXM4CoS0tAqzqIE+JzaCkwpzcMaQq1UOeC3ABrC0
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(23010399003)(1800799024)(921020)(3023799007)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	8N4/mmIx2azcu9uXDr/fLdG94G6UQe+v4CC56wq7xIKUzem/dJCRPi41/C9qOSV+yyoLxkXd0rW3rLFMPWUA5rF4oVzvi46k2iYg3hibBW3PURhIE0tEE8AcnrZ1CnSdhi0kdkFfQGpv3RKYfxxNO7k7xQ/GIfe+Iwfu9i/17XQBDp3+//1xHsVUDSoHvKGD3AEW1HpiV0292IXSw3B2qSP5MKm81CXa4J3oi9jqIC+iTBZqf6yDidLHpURprcvS0UaWg0AAFpBiNT8uG/W4bVSOgdxxah3LUBlprmWcZZR+ELBK6fHANZIhXfmS8L7TM8GpRY6KzvkoLeL3mz1M62NRqvENW8ZJuWOf/JHeC53JCQHU+Cbd2qgBKQzcg8ZFitcmrWgPEtTHXIW2A5OpWiIca8Id7zwmjkuPST3wx7h2iXawpCiYPwMaMy32bn5W
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:48:24.9212
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 216feff3-7862-42c0-db4f-08ded6e08c74
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF00001504.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5968

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
 Documentation/gpu/nova/core/tlv.rst   | 182 +++++++++++++++++++++
 drivers/gpu/nova-core/firmware.rs     |   1 +
 drivers/gpu/nova-core/firmware/tlv.rs | 225 ++++++++++++++++++++++++++
 3 files changed, 408 insertions(+)
 create mode 100644 Documentation/gpu/nova/core/tlv.rst
 create mode 100644 drivers/gpu/nova-core/firmware/tlv.rs

diff --git a/Documentation/gpu/nova/core/tlv.rst b/Documentation/gpu/nova/core/tlv.rst
new file mode 100644
index 000000000000..e4eb6ab6d02f
--- /dev/null
+++ b/Documentation/gpu/nova/core/tlv.rst
@@ -0,0 +1,182 @@
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
+Values
+======
+Values are one of three types.  The type is not encoded in the format; rather,
+the parser expects a given tag to have a value of a given type.
+
+1) Integers, encoded in 32-bit or 64-bit little-endian format.
+2) Strings, encoded as-is and expected to be ASCII only, without a null terminator.
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
index 000000000000..e05179f03f85
--- /dev/null
+++ b/drivers/gpu/nova-core/firmware/tlv.rs
@@ -0,0 +1,225 @@
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
+use crate::gpu;
+
+/// Requests the GPU firmware TLV `name` suitable for `chipset`.
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
+    tag: &'a [u8; 4],
+    value: &'a [u8],
+}
+
+/// On-wire TLV block header: 4-byte ASCII tag + little-endian payload length (bytes, excluding
+/// padding to a 4-byte boundary).
+struct TlvBlockHeader<'a> {
+    tag: &'a [u8; 4],
+    length: usize,
+}
+
+impl<'a> TlvBlockHeader<'a> {
+    const SIZE: usize = size_of::<[u8; 4]>() + size_of::<u32>();
+
+    /// Parses the first [`Self::SIZE`] bytes of `hdr` (caller may pass a longer slice).
+    fn parse(hdr: &'a [u8]) -> Option<Self> {
+        let hdr = hdr.get(..Self::SIZE)?;
+        let tag = <&[u8; 4]>::try_from(hdr.get(..4)?).ok()?;
+        if !tag.is_ascii() {
+            return None;
+        }
+        let len_arr = <[u8; 4]>::try_from(hdr.get(4..Self::SIZE)?).ok()?;
+        let length = u32::from_le_bytes(len_arr) as usize;
+        Some(Self { tag, length })
+    }
+}
+
+/// /// Iterator over the [`TlvBlock`]s of a [`Tlv`].
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
+        self.pos += advance;
+
+        Some(TlvBlock {
+            tag: header.tag,
+            value,
+        })
+    }
+}
+
+/// The payload of a validated TLV (type, length, value) firmware image.
+///
+/// TLV firmware images start with a 4-byte "NVFW" magic header, followed by a sequence of
+/// blocks. Each block has a 4-byte type tag, a 4-byte length field, and a data payload
+/// whose stored size is the length rounded up to the nearest multiple of 4.
+///
+/// [`Self::new`] checks the magic header and walks every block: tags must be ASCII,
+/// lengths and padding must fit without overflow, and the byte stream after `NVFW` must
+/// be exactly partitionable into blocks (no trailing partial header or slack). After
+/// that, [`TlvIter`] only signals end-of-stream via [`None`], not parse failure.
+///
+/// # Invariants
+///
+/// `data` is a validated TLV payload (the bytes *after* the `NVFW` magic): it is the exact
+/// concatenation of zero or more well-formed blocks, with no trailing partial header or slack.
+/// Consequently, any offset `o` into `data` that is a block boundary and satisfies
+/// `o < data.len()` is the start of a complete block whose header parses and whose stored
+/// extent (`TlvBlockHeader::SIZE + header.length.next_multiple_of(4)` bytes) lies within
+/// `data`. `data.len()` is itself a boundary.
+#[allow(dead_code)]
+pub(crate) struct Tlv<'a> {
+    data: &'a [u8],
+}
+
+#[allow(dead_code)]
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
+            return Err(EINVAL);
+        }
+
+        let mut rest = payload;
+        while !rest.is_empty() {
+            // Validate and extract the header (type, length).
+            let Some(header) = rest
+                .get(..TlvBlockHeader::SIZE)
+                .and_then(TlvBlockHeader::parse)
+            else {
+                return Err(EINVAL);
+            };
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
+            if length > rest.len() {
+                return Err(EINVAL);
+            }
+
+            // Advance to the next block. `length <= rest.len()` was just checked, so this
+            // slice is always in bounds and lands on the next block boundary (or empties
+            // `rest` after the final block).
+            rest = &rest[length..];
+        }
+
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
+        self.iter().find(|b| b.tag == tag).ok_or(EINVAL)
+    }
+
+    pub(crate) fn get_bytes(&self, tag: &[u8; 4]) -> Result<&'a [u8]> {
+        let tlv = self.find(tag)?;
+
+        Ok(tlv.value)
+    }
+
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
+    pub(crate) fn get_string(&self, tag: &[u8; 4]) -> Result<&'a str> {
+        let tlv = self.find(tag)?;
+
+        let bytes = tlv.value;
+
+        // To make sure the value actually is a string, make sure it's all ASCII.
+        if !bytes.is_ascii() {
+            return Err(EINVAL);
+        }
+
+        core::str::from_utf8(bytes).map_err(|_| EINVAL)
+    }
+}
-- 
2.54.0

