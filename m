Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010037.outbound.protection.outlook.com [52.101.46.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BDA2E7377;
	Wed, 29 Jul 2026 22:56:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785365775; cv=fail; b=oYm/reg7AQNx3Mpwz1nPNH4ktDHB/x4RqHFuzO3q2QjsAJS0/ZxYjZnkl8LOGQujqKMz7uKQCjoEz4M17e30Vze9DTg1bwndtGv7HCIFOsb/g1fXC9mcE1yn0jeZUNNYPIywQcJ9QlentFU5h8gaOXZKb3iznbP/nO/IhU5l8i8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785365775; c=relaxed/simple;
	bh=aB83Lqmi0XOuW301ptlc3LQ4450ZAwyMN+Nglj8N/b8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l7tDD9d7Kfruf8by1q2FwSieqmzNkPI7cReEWhtZrtlQZVV7/OKycPAeceIupB0Rly+e3MfeqhluYtDxKddscsZZQ9t2AQhEkYVUvJ429jC2lHdkuaKup5H5sXcQ2sP5Vue5FJ+N0A6JstCD6vsych17aKgvdi2KztIat8x4RyM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=g/5Ibibo; arc=fail smtp.client-ip=52.101.46.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="g/5Ibibo"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akfqlTBE1ptATlcvxE+hmWZlF0+Rle0HF1ldjS/Ns1rICs6TAPmabmVbhYxzsaOhdbmDSS5cR7mjLEfitodeM3gETh2HwMRShljv3VDo6VU1yEWCfwLCqpNaCV5RRAwWuNV+uwoXplsJlB6QfOaSQdHPJSNyJnIzUzwjlFiRFxxLAmAvYyJkvI31e5yN/gWXzY0xrs18E7CbzIJ2ybTM+BsPmFaIyM2s6vsT0iaKyaJNke+4Nb6rS7vsJxsPtIBK2BVyUWbVhZB3K3tmsHabGcCCnJ8YcyoUG01PT1PvovoHut63XI38cv6o84kW3X1/C68ZGLNZWqxWLBDxjt/y/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ca0jv0/kSSN8hl0yZKa7ziAiQbZbrVbDlMEF9JYTUH0=;
 b=jQoDoS3g475BQIYe7xiLhcIecAmr1vQriMF+s4rMW4UIXjjoxp5GCN15sjOier7bS6ErhVz/L9XXsWA2bv57iygjOENiNlmCBjiOWdTMhupp2dOXqW4akg/SqKyJtnZ9kjNOgAEjGCTt4N+7PELTixbDv2wfMVOjOXp1LoexhIaBLFI+ZDbjyR1MlAnyTHXW8XZmxr0Obg5blumyjpNU4DzB4iDdysgpTnLXaM9BaovjxCjbps0TklL5hxNwNsOrgQY/LsppqpHMuTuYV30O4NB2NOVXqGBazURytDgD+8DeglGDDNSN+0JLZk5X/lPmrhXBCuLXEKMG5IZjf1+OUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ca0jv0/kSSN8hl0yZKa7ziAiQbZbrVbDlMEF9JYTUH0=;
 b=g/5IbiboEAXClUNJEQBRdnjBpthPpjAme10sP3R7dwgPkpsA7OQ6bksf6PDxfoQhRsjNcqWPBJI4+YJFUz1VCGM0fckvoaXPZO5RSUhhXkhV9Xt29k8bJS7JA5eTUs38v/y2WwSUHhhnW+IXpEq18Els44zqMnWU6DfHzvUEfLvTLgdwiNoA6ZPhaELTt/4UkUR4Q/2//mkBk1h2jb8bCxmqKQmt8zXb66B45RnMEeVml+6Hfgxy1K24C4T87WE3Bsdbwk3j3t3wwHSkAnFlb0jH0u5REj/mPzUTFv2O45wuZPi6oKI88JxcN/y0zYqvLnxoQir4B+Zl6/lpEJ5n6A==
Received: from CH0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:610:b2::20)
 by SJ0PR12MB5674.namprd12.prod.outlook.com (2603:10b6:a03:42c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Wed, 29 Jul
 2026 22:56:07 +0000
Received: from CH3PEPF00000009.namprd04.prod.outlook.com
 (2603:10b6:610:b2:cafe::39) by CH0PR13CA0045.outlook.office365.com
 (2603:10b6:610:b2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.7 via Frontend Transport; Wed, 29
 Jul 2026 22:56:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000009.mail.protection.outlook.com (10.167.244.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 22:56:07 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 29 Jul
 2026 15:55:50 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 15:55:48 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v6 0/8] Transition Nova Core to TLV firmare images
Date: Wed, 29 Jul 2026 17:55:26 -0500
Message-ID: <20260729225534.2046933-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000009:EE_|SJ0PR12MB5674:EE_
X-MS-Office365-Filtering-Correlation-Id: 0daf1a14-9ebb-460d-c786-08deedc49333
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|376014|23010399003|1800799024|921020|10067099003|56012099006|11063799006|3023799007|18002099003;
X-Microsoft-Antispam-Message-Info:
	Cns6HFtZqGOY85pEBEVvbBYChtrPZeOG1B7mTDGOnPuHBvUEJ+DcT2xnni3+XspRb9e7qSOYydxBvF1+F1oh56cwmIsd3gdfegPgYO0TTIPZebPY3Y7EgMvCiiyjlbweaPlLn+1VMhHcT+PZBrVwkrLEm64g0GToolrCVvcBjHsJUm4Pjac/S23WnYfigXK0VJhpQgm7tSpy4C1evQKYC+2IUbGMy30FcZhfIr5DwXfesy3T5iQFcC4MFEabz4z8rhYuwqKtYk/FHala/ySMreIrzNdTUaC2NHB6XfqkYgJ2fOT15IE+xfFA+S9Bms+i063fM/Sxhk+T/toIKTeDpZA8OzKAx6gBQNwyXkPSW8qpPa0wJD7cQSZHSLa2tI4DT6NgOSFt2B6sGbQ4UxjsW4CbmtmG1lU3KHb3nSssTZXUK21PD4o9JMjussKNHSICpXZ89r/n1hn4akVpYClAjvCIL5b4JftGdL09OFHpFoZHWuLHetpY2dG3He8cNNuc7vb9ev5YUTi65P4B3Cg8zDp1BAEuOOo0UZexZErIvqc4JxDfw48gjR+mkAYazAcLVXsWcdFowFAvJefPmDzXAu0OZlTGyi6r6JnY1RcziwRl0mCBXmu1SV1wtJQx+Ghklxn3dNCUUvECp/s09rrIcdXDiesDwJCac+SSw/70966xBBh3bcSc3OymoOaNmU0ZhRUASCAZKHcsniXr2Q/csSjbAxY350urLfz09IWI+puVNSeEZ9MP98hDQRi3GIXV
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(376014)(23010399003)(1800799024)(921020)(10067099003)(56012099006)(11063799006)(3023799007)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zCFr/RmK4OlVwh1kMbasXC2ycVyRDs1LysuOP01lCimNLL2oQ3eb201ctPljb4pU+hdzwC27nNyis1F9wqCZ+5Zp4K2pE9TaeWybR8ngLotqWd+NLFUq4cHqMyLTR8drWhvNuolJhhpktff4FOVvOqNprpoIubNdRZ2Fih5JHyZDXCXjNEWVex4Hn8ReWi4SrBVUaYLv/tZbXQeO8y6EFMtSZtVnKXc2ZF5IVqnUM3v0f4CdMpBNWBtw0G3Y1IgEoi7aTx2M9ao4IetW6nHjFszxSoYOTWZzPDgT09516Go6nehyJog5OYUu4BKfJm++JeolK1fiOLU6OeZFCZYpn/cr78fT+PSfUXfeSoW8ffX3wbMxfOFOb8lzMWl9u0eBGyZknAw2fbDp5U0vcqtghP6V0d14n7jIWkkgv8cUf4V2Sf7R7KXQPXX+sE8RlCfM
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:56:07.0653
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0daf1a14-9ebb-460d-c786-08deedc49333
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF00000009.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5674

This patch set transitions nova-core to use the new "TLV" firmware image
files, instead of the ones that Nouveau uses.

A prerequisite patch "rust: error: add remaining error codes" is required
to compile. [1]

The current r570.144 images are a mix of binary headers and ELF files that
are cumbersome to parse in Rust.  There's a significant amount of code
that just reads in a struct, extracts some offset, and uses it to find
another struct, only to have nova-core use just a few fields.

The new format uses a sequence of tag/length/value fields that can be
iterated over.  The script that generates the TLV files,
extract-firmware-nova.py, does the extra work to find the specific metadata
needed by Nova and packages each one separately.

The TLV versions of r570.144 can be found here:

	https://github.com/ttabi/linux-firmware-nova

along with instructions on how to install them.  We are not planning on
submitting these images to linux-firmware.  Rather, if this patchset
is accepted upstream, I expect the small handful of people who are
actually working on Nova to grab and install these images, which needs
to be done only once.

There are still opportunities for improvement.  For example, I would like
to get rid of more GPU-specific code, especially the GA100 quirks.

[1] https://lore.kernel.org/rust-for-linux/20260629183022.2709524-1-ttabi@nvidia.com/

v6:
1) Fixed s/os_code_offset/0 in booter
2) Improve Vec::zeroed() comments
3) Corrected some imports
4) Rebased onto drm-rust-next
5) Clarified TLV booleans and strings

Timur Tabi (8):
  rust: alloc: add Vec::zeroed method
  rust: firmware: add request_into_buf()
  gpu: nova-core: add TLV parser for firmware files
  gpu: nova-core: transition booter_load to TLV images
  gpu: nova-core: transition gsp to TLV images
  gpu: nova-core: transition gen_bootloader to TLV images
  gpu: nova-core: transition fsp to TLV images
  gpu: nova-core: update firmware module info for TLV images

 Documentation/gpu/nova/core/tlv.rst           | 184 ++++++++++
 Documentation/gpu/nova/index.rst              |   1 +
 drivers/gpu/nova-core/firmware.rs             | 295 +---------------
 drivers/gpu/nova-core/firmware/booter.rs      | 331 +++---------------
 drivers/gpu/nova-core/firmware/fsp.rs         |  88 +++--
 .../nova-core/firmware/fwsec/bootloader.rs    |  75 +---
 drivers/gpu/nova-core/firmware/gsp.rs         |  61 ++--
 drivers/gpu/nova-core/firmware/riscv.rs       |  75 +---
 drivers/gpu/nova-core/firmware/tlv.rs         | 265 ++++++++++++++
 drivers/gpu/nova-core/fsp.rs                  |  11 +-
 drivers/gpu/nova-core/gsp/boot.rs             |   7 +-
 drivers/gpu/nova-core/gsp/hal.rs              |   8 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |  13 +-
 rust/kernel/alloc/kvec.rs                     |  27 ++
 rust/kernel/firmware.rs                       |  48 ++-
 15 files changed, 700 insertions(+), 789 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/tlv.rst
 create mode 100644 drivers/gpu/nova-core/firmware/tlv.rs


base-commit: 0755a4e3e809610a14befc9ad28d35e2e460da68
prerequisite-patch-id: 92c2d027299f0bc35d20918668f6874712d12f28
-- 
2.54.0

