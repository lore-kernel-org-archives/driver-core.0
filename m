Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011013.outbound.protection.outlook.com [40.107.208.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5DF73C5DB6;
	Thu,  9 Jul 2026 21:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633195; cv=fail; b=JRJ+166zbYJLKUQC8QFWx/1gIoI+lgoZTX8mSwE4FP0BRWYxu73835gEvqqE/xkFqwikAtRLq4xizp2PH6UdDNcFjvIpZueMfxtmgd/tOf8LcGQgz+85VsgS2vFz9Yd6kN+hJtoY+LMjmge+AApMPJbv/pCtKh1qyeSSZ02oNpA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633195; c=relaxed/simple;
	bh=DiktRAO1nSj3hF/RIgmiATnoyoZsBmZ8IxYt5Ct0+3E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=oyUlXFw6xpQclZ1ar5vhJmgZLLvNYg6EYOXe1Fz7b5UKv7V7dwqQDg+UG3e0Uw38gM2rSSOgR2v490he1OXljh88oI2iE/mzguazWmN8Wy5iGWhDz2fHJ7MEaU0MJijXfmJfIy2dQCDZ4cRASp+R61hDPAj4HSznnWfIwZmGQ9c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ZdninidA; arc=fail smtp.client-ip=40.107.208.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZdninidA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfheuuynbVumktkQVqN5cSNXCX/+aLsACGGAKem2QZAykPD0muYHOmAOyzKzO2sgXsMwlSQcAts6CO9LuU647NPBeqA7X5leY7EyksanB+Ah4vRXKQs7lFQU9u8Ir9tVQLN3f7AwFM49fAB+QuX7NSCgmcss8iC3WJScPMfQYqdEniR8sTWLekLkVmOYTtjUl/4u2IFVneSehQsMAfwsL2N8xuZXNXRoVZxd7sCiklizX8lQhKW09X9On7JyH68FY4jVQuXN9fstxK8zlRHDzqUuoiRv7FQeNlBwiVzz31WK8uYdxcMc9gtDS2ISQFIrA9gaE+Qb9VYVi4ae2XMsyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ocieyfx+d37SJ9xmFt4iaifdAfjxPGIzzUX6XWRnvHs=;
 b=x9YcufCwxG00mR2GvFQk/6IGp8VuZeU8qDuTP7RXStL0ZTpGYWLkj5EZczIx0eXYTWOBLbsI6WB9fBhEznDMS7cZ2IAzzawuJ92ErYSD1D+34vozInlV9gDBR8sqMgFu0j2VVbs8og8ACnZPfb8TvB308hbBTfVm+BJsA+xvpFbBT4gd1ZnkeAf/poYHCv3VhmgUf9mi6HrXhkm/EWa2QpStppV28yO587b3jBLd3JAuhLwGNH74haCaFFy61tumQeCUzcb2Nlb3l4k9VeW2JWP8dVp5zC4wkZlSC/GR2H354JX9ViCc0ITwSNNFayZrECnfjRLI/bH+1DgAiwyaBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ocieyfx+d37SJ9xmFt4iaifdAfjxPGIzzUX6XWRnvHs=;
 b=ZdninidAx+jjX4B8AxVsu+K1sbiXNdvNprbm0CfhtO1T1teW28iIyjomWRbdTwIpnwlnTEmQBA+5sktTxHeR10JHOSllR/V7qLIZ5yA3iDtmZTxeQqAVbuV0DO41E/IcXc2d7+mf1J1sLaw50z/AIn4zWmbHWDg3t4/WsFeAeAdcAc16Vl6BNvk1JTfh5CQRs90vzyDbIHf2WBdPKXdz0fmzE0B9Uszel02PkTMla+sf+kixQaE0ZBqc1+12h2FZUGy2cFfC4N4hyQrZXN4ZDnQ3G0oySA3En0K3iu+gPcROMgwtQl32V3S9LHMHaQbnWxNAZTg7kYXUJenXoRoUWw==
Received: from BN0PR10CA0022.namprd10.prod.outlook.com (2603:10b6:408:143::30)
 by LV5PR12MB9825.namprd12.prod.outlook.com (2603:10b6:408:2ff::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Thu, 9 Jul
 2026 21:39:49 +0000
Received: from BN2PEPF000044A2.namprd02.prod.outlook.com
 (2603:10b6:408:143:cafe::83) by BN0PR10CA0022.outlook.office365.com
 (2603:10b6:408:143::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 21:39:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF000044A2.mail.protection.outlook.com (10.167.243.153) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 21:39:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:23 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:22 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	<driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
	<nova-gpu@lists.linux.dev>, Gary Guo <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v4 0/7] Transition Nova Core to TLV firmare images
Date: Thu, 9 Jul 2026 16:39:08 -0500
Message-ID: <20260709213915.520109-1-ttabi@nvidia.com>
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
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF000044A2:EE_|LV5PR12MB9825:EE_
X-MS-Office365-Filtering-Correlation-Id: 798ed6f3-a822-45ef-60c7-08dede029a26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|376014|36860700016|11063799006|56012099006|3023799007|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	1NGK2/GQLiIu6ixh58g536nCmDuZfl1VlBmdvEHRe22ZZTCym0RQOUcBLPJIVwvlZCO77shjyBVKQe9fyGULYHOFZJaiF7nrGR0lBWZ1STI/8vreeSUh50U7ckVEBDAMOM3Jy3i4ApcsohZxE88Gqk34gtzbajRgghj7I9TFI3ccye/pNqbYs3ke8SC9uNbeFKgzlAg4WUXYg6OOdLGy2LE0Zq+uRvAwM73m/7MZrfUp4HXrGytXL3CAOPn8+kbJGehTvoPmfPjHpxj51HaIlXP4qR7df1dB9kD7YPLJbJbDL4ZCzrT7BBmgHVhefXXewZoHlsRwprrZrkfviOZYluivSmdHIUS/HlXcPHDippbt4gQhegfPAwUKQkIsfDFwg2LU9aiAVVY5o/nj+NLAr+PKQo9J6cvxs51ONPqGb5O2+DVQfYNMtmoFTacq27pZndKUYtUPtpKfH8ATCCf/6eb/YGvA+GOc3gaTkP4o/yFOEQFm/KT7/JeVls5aKPZYOn15b2nJKX1PdG7q0+u0+Rs0+5v9BNHEWrLy9xXcE9RDkeowPCQQx7kdcI2zTUf7S66XDdboifj8JjBo6ezHougeFfagMGKPcWpWlz6vfcJ0NTbv0OobxZYYaER2xI7IItQQYmQkZZxMt3TpbP5tSyB7LD8gm7d5omWNMJHWV+Jv2W81AhzEqKDV+/b1oEuId3bXlIx2IK1GOm7epDaVGJNBzVVBHkfw+j7C+/sEGLgWOvdqfH4waO9WT5mlk2Ml
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(376014)(36860700016)(11063799006)(56012099006)(3023799007)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	OlTpkc8PRyQQQJV2Xfef2lEtqlQxLk/JfPv3eJXmjZZrpdBAKjtf+4kLxNqUg4mpGBmwiFTNVFr0Ra9XcvOmMOu/0d6Rb5765R6OcpoLhUg6/Z1JfyE3FpM1gLJ+R7j2Bjd73SqTCAgG3GaOrT4dWEtl3+Jt/jgxKWXNXYJRKaduh9RKcVrX5YSkcozkbGozQ27gTbGj3K52Fyu8EaENayAwJuLr/vsDDZ1eSABt0lSYhxp/PpOgUlt1fkfoMXK2hnkvvbC8xPj4MN3kOudHUuy147mR7EBxP+Gs2KtbZVvsOP91WhtH5LFm87hcA2uKwDjwaG0WGHx6BAnmoGOv+bk4MwNBO0Z6U5694UqAlGiEl0h20TauDGjFMdbYYag4Mqbfx1zuk0rnvTD1nIddTPAxIxb88XxH6tUUhiTd9eSodW5TKqqb+xq0mmf39FqV
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:39:48.7809
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 798ed6f3-a822-45ef-60c7-08dede029a26
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF000044A2.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV5PR12MB9825

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

v4:
1) get_bytes returns error if value is empty
2) used to_result! macro.
3) Improved some documentation again.
4) Added Tlv::get_signature()
5) Changed tags from &[u8;4] to just [u8;4], removing lifetimes.
6) Added an INVARIANT comment to Tlv::new()
7) Several other Rust-ism changes.

As before, if I've overlooked a specific review comment, I apologize.

Timur Tabi (7):
  rust: firmware: add request_into_buf()
  gpu: nova-core: add TLV parser for firmware files
  gpu: nova-core: transition booter_load to TLV images
  gpu: nova-core: transition gsp to TLV images
  gpu: nova-core: transition gen_bootloader to TLV images
  gpu: nova-core: transition fsp to TLV images
  gpu: nova-core: update firmware module info for TLV images

 Documentation/gpu/nova/core/tlv.rst           | 182 ++++++++++
 drivers/gpu/nova-core/firmware.rs             | 302 +---------------
 drivers/gpu/nova-core/firmware/booter.rs      | 329 +++---------------
 drivers/gpu/nova-core/firmware/fsp.rs         |  88 +++--
 .../nova-core/firmware/fwsec/bootloader.rs    |  74 +---
 drivers/gpu/nova-core/firmware/gsp.rs         |  59 +---
 drivers/gpu/nova-core/firmware/riscv.rs       |  76 +---
 drivers/gpu/nova-core/firmware/tlv.rs         | 263 ++++++++++++++
 drivers/gpu/nova-core/fsp.rs                  |  11 +-
 drivers/gpu/nova-core/gsp/boot.rs             |   7 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |  13 +-
 rust/kernel/firmware.rs                       |  47 ++-
 12 files changed, 663 insertions(+), 788 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/tlv.rst
 create mode 100644 drivers/gpu/nova-core/firmware/tlv.rs


base-commit: d85845b64c0020b2812243a22fa79d57cc1c1e38
prerequisite-patch-id: 92c2d027299f0bc35d20918668f6874712d12f28
-- 
2.54.0

