Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012043.outbound.protection.outlook.com [52.101.53.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3643CC313;
	Fri, 10 Jul 2026 23:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724705; cv=fail; b=bcFSParDAnrwYa1q3vsY2jH6CFpYauT/63Gjk+PEPw5wiJad5JM9ya3gjE1UeJzkH2+dcGjS5XW8tD2QSguqD1icqLSWfJ1MzSlTAhwUzZNChpfWqCicRJdZXFmTxoT+rw9q+iCBJvaLZthZUH3qDgm44CtI7jmXEuYjXIsS4Rg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724705; c=relaxed/simple;
	bh=DOWgj9P3JQhCLjqcIGF1NZmKxntr6nxJSvNhzd3IhH4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=SVsY54c0ZSNaSEsBYWPBRL1HFCr+h4qzPIw9ou8xaVu+ggwbmfcQ4aaelKtaZ9WfN4vJDxI/36/jHVKeiL3kmsybn2Aoh6Q0PBTdcT9hyhSzwrDwNeKTqeMgGMgXKUjtac0iBJA6rMxY5xQFMbTzvvQVaoXmZpLG2OzMZKFxWcA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=F/LylD0X; arc=fail smtp.client-ip=52.101.53.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="F/LylD0X"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UfwDXbcYDeM58IhYL4NGnNp1IuKLDtXGp+VZVc2Xj8lPujRVZbOjCqoQ7SunLxxeRx/K+D04evpbuIuYFqrzEcZr11NwpYkKOBkUbPbYRf2AsOkCKJVBR/d9yA06l9xYAce1KDGx+aQejWdvSGtTEblD45ktIA+l8dgQP/5JFP7d1MgtQyICTJZIkI1rXRRN4DawNW9ab3Zyy6qvhhdybPEk1z9ErjijS3xvbuoA8PVmjaOZXKjrgcp2CyFvvaPQHnA9mXtTZ5kMu9XW4GTaJEvo+tjGMBf8KJBZDeTutLgmhmE6PZ0PujPzqHO5TBmJaiPOjt6XO91N2IgNe5vs2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wzrx/EF2vj0/PocT61MJezm5hz6hmpbVm14BGaPgRv4=;
 b=yQnh/JfG8CzQJp69grBB+QrP7M5bUNmd59RmLhtQ7EUsqMy2lB7XCRyI9s19GKVKtk9lBviEkPANaxVfjr/XYw0xa16pOmBVweewSwFOfAzl9DQGsWBvOR/Z03dkaLcsYKJVvWJadL6/k2qds6IphNI6Ij1r9P1gULrts+D7ZEektlVYsTuVzp52qDtAzkAnL3Pouq7zc4Qj3DOvFmuXrMPu0MJUy3kxjy/4KfKSq1FlOAUqXOkVAcu8okdh3NtfR4aLaWZvgXc4gRKV5QbfCN55vK4fqrWb+QCMctB6uS46CO+ZHkW4138HWsglJt5v/73N5sGA36+dyYNBgck65w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wzrx/EF2vj0/PocT61MJezm5hz6hmpbVm14BGaPgRv4=;
 b=F/LylD0XUSsyAIKJL0Njh6w4PjOE/nC6zfc3mhcyyROS5a87jSdI2s5ZQ6a1ZQ3Z5L8T8b2ypubCqFgXkjHavymJ20q9OLDqJ5qmpYLOJFGCRF/aipmxda0UNTw6an6sXuwQt+otVYCU4CvF5uxDsUyrURYPdYmYYnCpScD/dK7bmaamtr+MGcr6V/Sj65prl0YrlPxBFeAJCm1J+ZXeT4WbID8HToER0tlMLulzrnvOT4mpiNsTaLZvaaEal/vKbG/Ivw194x4dHNZjoxo9YJYdW42rrrzK5eVkAT85VTdogyzMlvywi9hY6sbm1y4lmAZgMeFakJfRvu06xq9dSA==
Received: from SA0PR11CA0088.namprd11.prod.outlook.com (2603:10b6:806:d2::33)
 by SA1PR12MB7295.namprd12.prod.outlook.com (2603:10b6:806:2b6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 23:04:55 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:d2:cafe::5c) by SA0PR11CA0088.outlook.office365.com
 (2603:10b6:806:d2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 23:04:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 23:04:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:39 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:37 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	<rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>, Gary Guo
	<gary@garyguo.net>, <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v5 0/8] Transition Nova Core to TLV firmare images
Date: Fri, 10 Jul 2026 18:04:20 -0500
Message-ID: <20260710230428.865447-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|SA1PR12MB7295:EE_
X-MS-Office365-Filtering-Correlation-Id: 9de392d8-9f0c-44de-ad3d-08deded7a7fe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|36860700016|23010399003|82310400026|1800799024|921020|56012099006|11063799006|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	oLJrBHRwgae+F4/nZJH1GynoD6AluAORqq19GlogmlBGXasAjfi2zXZOLNo+sg+tAW94o650UoxXky20tFWLNie9xUJqWmQMNw+BvrrlgI71v7vO8stFJkfsDJuR3N2zklYyeT2OEkC8KDZ/dT+3gdqYAHqADLQULBw+9OAsNlKfiR+hO2mgMx2NvXL/eD4nKuYR1AMeQ6e4JqUft7Fp7pUp5DAcCh8Qs03Tdvc+/1M28R2b/g7fOG0YcBATPUQ/vXbQuKc4YwlHn31JOceoUo32Z3hvJiWuIBmmfPb5Drekd3MwhsWbcI4IsiOoaIKh4anoV3cf+FyzCRfbUPohBM0UQkYFN4qPjRDJBLO0igdaWvhiyN+ZZQKNbiNH+y2IjuNtAvOjmtowNJZAVQlXGLSmeVHLgo5HlA/1lD6G1y2JzOJE7Bemwi6aIq83C+fkSy6+DRwxSP2eqtWLd4LJZaVDfVTDpoFQ443ERCY8yCph0St/zr5RLi//i6mf2WnWgvB7YnwLcd3z9cImAFTGhZ1VpY7XErK0Icnr9zsqCnWgk0RghJHGqASodg2tcaIUIhPsKIvo0nEheby3+zvhV3k+8SM1SV2poiQMzkWFt7oehVgXaWm+PS/k3IaM+RDBHrQooSd9DVmC66wT0GO9U3EZlyemyqlQD2tM7XWRtkEtLRSplJRC1G0LVcAjVps3TRLuUD+mlztyKwhE+RU+6c5YAYcyjZIrtH16Ptz0LGIB//LROQRSaf88dMXc/A4r
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700016)(23010399003)(82310400026)(1800799024)(921020)(56012099006)(11063799006)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SQ+bM59HCt7xYudXqFMwwvbCgbj4ePim7zncMj5hUPJDpm4KhCBshr6itUCL0B51i3PAjm0fHwi2ubbEgNcQRDRfSi9K45tdywC4zcXeJsCPxcUAhejIo6hU8o2vf9FHdVapWEyfzn6hIhWw1N0cAXCKmin+uIM5+AiiRVyzp9ZUCt+ae0ZG3J6Ey/xTDISNj2Ino3zlLdMuLQgfsas0BGXi/+06gRnowPgTsfpGo59+GKmx5nKeEgrMwkIb/K3r/QXAVeUqCrub1cRBADTG/EV+hpFymZoeqj2dSl8rJVibMWXduBYjX5QbUgX6dl2tdSayVgPVyxWVxhBJ1zCx13+Sfu29cpLUZan+QX2+NVMbOExbMMmK5dzllere+mdqYDbq/ApciuPcDHiTg1m912ljhuPOS8r7HJBzM1tcRahvL481Rx606ZmsG8Lt5J5n
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 23:04:54.9478
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9de392d8-9f0c-44de-ad3d-08deded7a7fe
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7295

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

v5:
1) Fixed imports in firmware.rs
2) Add VERS tag check to Tlv::new()
3) Added Vec::zeroed() method
4) Added BLID tag to gsp.tlv

Timur Tabi (8):
  rust: alloc: add Vec::zeroed method
  rust: firmware: add request_into_buf()
  gpu: nova-core: add TLV parser for firmware files
  gpu: nova-core: transition booter_load to TLV images
  gpu: nova-core: transition gsp to TLV images
  gpu: nova-core: transition gen_bootloader to TLV images
  gpu: nova-core: transition fsp to TLV images
  gpu: nova-core: update firmware module info for TLV images

 Documentation/gpu/nova/core/tlv.rst           | 187 ++++++++++
 drivers/gpu/nova-core/firmware.rs             | 302 +---------------
 drivers/gpu/nova-core/firmware/booter.rs      | 329 +++---------------
 drivers/gpu/nova-core/firmware/fsp.rs         |  88 +++--
 .../nova-core/firmware/fwsec/bootloader.rs    |  74 +---
 drivers/gpu/nova-core/firmware/gsp.rs         |  59 +---
 drivers/gpu/nova-core/firmware/riscv.rs       |  76 +---
 drivers/gpu/nova-core/firmware/tlv.rs         | 272 +++++++++++++++
 drivers/gpu/nova-core/fsp.rs                  |  11 +-
 drivers/gpu/nova-core/gsp/boot.rs             |   7 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |  13 +-
 rust/kernel/alloc/kvec.rs                     |  20 ++
 rust/kernel/firmware.rs                       |  49 ++-
 13 files changed, 699 insertions(+), 788 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/tlv.rst
 create mode 100644 drivers/gpu/nova-core/firmware/tlv.rs


base-commit: d85845b64c0020b2812243a22fa79d57cc1c1e38
prerequisite-patch-id: 92c2d027299f0bc35d20918668f6874712d12f28
-- 
2.54.0

