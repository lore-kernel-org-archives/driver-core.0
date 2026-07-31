Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010011.outbound.protection.outlook.com [52.101.56.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1A5536A37B;
	Fri, 31 Jul 2026 20:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528650; cv=fail; b=lorVEm59CeZcYKX5qA5kefmx1RKXrQRPVuKwBWzISNHUmKPIDhm2qNmYPndidOf0I4OID3ZP6V+sCBYoNA3/xeRmsvCBi9X+9/Xr6CJNzxWqGZp1I4ntNfFJiG0Owc0DfWnmQjXfXkpGBc0sPmIyYdYBUQS1SqgwFcs+iEfNYJU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528650; c=relaxed/simple;
	bh=CFahx1gT5pqkHSk7PoqpuTWmczQLQfDuZUOJMc7XirQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Xs7qx4CoZYW5hFHCyyWdEz+DZH2Dcp6RKYNlxydzWlfqDIqx3EEpi6Eh0IXeOIKuub4mjhvlGDieobtzIhBvypFW2bw7n8W/DFDoxhLmg5h2reYrf68M1JLJa9b/I+tnxLSNQw1O3hpUkrWJ37XYDJ+jKRzEww02pfaGATIDjOc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=LS4HBmUu; arc=fail smtp.client-ip=52.101.56.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="LS4HBmUu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qKMqa5odMmQi/Ma9nJ+iJVCVPvqkDi2hy8w0mzC+kRXuWzyKXdiBoopPv1hqnjAbYj3uoN+3rPPyHSrKrFcGirqtE6WukMCXgsThzDTZ/7saMAjrVBRvJ83b66gfjpnbQ6Xu1gcxGtPRUHTYjYCNUbpe9YAk9tjHzndBnFfTo95P1pWE+KT+R7SPrG4S7oNgcdSKbo9w57T67cdjL+KbAarVR08lykuY2hUFl5kH0Fynd2sBczsUmxUkGpFNrosYU4gQ3e0k1QKHaQebzWIz0kPy8PjWiyGUaXOT+C2cCrdAIH7HnPPGScTMqeyc++gsjUC13RKRmxGHO84GOVXZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8YMiL+9a2h4c7Lf4oOYcHbeaI000OAo7WQACKltPlVU=;
 b=OAK7FR2kFVa+3D2rvYGfJgYZi6+UScOtCog++dnzmkcepLDtPOs3m6OFq24qpH8Qi6V4aVGpdcrYoKDKuzxS8zPsobFoQVvYctR/QjLz1B5s2m0bY+mAo+9nAqArbI84yIz3FffH3vLyIIIAhUY/Qlj9RLJxUL7kAcHPf0CSyiAjfGlEdqxv0dYf6VyVh9Y9Jw0Y3HBZRHy3IIiOa2kwl8v7Qyf7qzaTcudyOz9hamBRXrGePJJdP9eQY9vaPpp7J1w7erKBbvsdHo8C1QbsWW5lCc7W2T1Y6eW8Vmy9c96Pz/Od9PF7a/iKpWsSEbsoaPrYkMTjNsfpVaiUlyFEYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8YMiL+9a2h4c7Lf4oOYcHbeaI000OAo7WQACKltPlVU=;
 b=LS4HBmUulzxlktmU1B/IdWcpIZbxNPTZEyJlHm5kij3AR3GUqEt39s9XhCgVcoT6TcA+bnunZFiHdqfWkD110C++82KNYTad19mY7kvIR8t2BVNY2UBIx/LbWEN7fzbCw1XPxi0K9tgF2h9+U5Qi2xmAUnLyAzz0r5K80W90j15xgNdGspz/WXjwdYc4rRbtKeiIr/jxhzSTliPXghhAeWBs4sqrw9mMGchMliq2bIf3gdZi+mqE3B3FMOkrzauzdHzPTqEk9EQ/hzA5pPKF0CSqUzWC4LD0wbWWd524rgkrCp2wAOSaQ8bAnzE9hJCH907j11q6crLG3FSHjGMQkA==
Received: from DS7PR03CA0059.namprd03.prod.outlook.com (2603:10b6:5:3b5::34)
 by CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 20:10:41 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::3b) by DS7PR03CA0059.outlook.office365.com
 (2603:10b6:5:3b5::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.15 via Frontend Transport; Fri,
 31 Jul 2026 20:10:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 20:10:40 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:25 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:24 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v7 0/8] Transition Nova Core to TLV firmware images
Date: Fri, 31 Jul 2026 15:10:09 -0500
Message-ID: <20260731201017.2580713-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: c85a187b-be55-403d-888e-08deef3fcb35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|56012099006|11063799006|10067099003|3023799007|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	ld/brOuwzMJT5wuofsHUgQpTrm8PaRTWMDVfqLkRmy9wtJBjqrkWK1bm57hpWmR7qnu/blYKUKuL3y+kireX6nBSpBOMi5Y0AeQtTVh8NvP71m6rhZ/ouoxczaCNIA4Ny860kt1cYjmo++83LQ5jL215jlugic4HiEA5tcBQMoPpMlDOqgh7CPqXlGC1tm1TBwZdldqqCCLoylv5MS8Dr7AcpfkM+y8EJ7lSdoLd0uwgkGKbef+AGh2dylbMF44+/ZXNAs/ItXv/0eToIaGafx3Uhhy6s4AkLOxLCexBX2g8NkV3Fc9VH5jbpaWHDcxNaoq8+tGET9dGUI9gx3Ipm4DdOTFQeoVABHVe8C5k39QWQaIYPV1tUkL5FH2nQ1gYZ1IAc1xpIvWLo3I9JvVYix2CijRr8JGkrJQL5gTRXAUWxE1reG5f9Fv29J+5fheSiu7niguV71PgtrJny0cH+IMelM2jKBGV/iAYN2cqbravC+GeGQsIhgr7ZMd0Uw+3p5L25emtvdxmgePDQdvr00D8ykJm3jgpcIKNt5uZP+LxjSVpwkjh8cXipyxORMAUwZxgWBV9wJb+tVXENV1Ii3WftLArFJki57dSDsGV6fwNaIU8lP7c3ufZOvqWt9urXjx38f8U0JelfhyOR+pZUFI8Y/txG3lSahDbFVWoNUR4OlufBVXAeHxJqP7QHSnSSsfyzzNGa5VC3FMLAr+pk3m04s9GL3g5IMeHn7eQ48PQZopSGNxBpbF9VMJCC5Ao
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(56012099006)(11063799006)(10067099003)(3023799007)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	aRmx/klbJd6HFxOgv4q2+ezAtOm5ZLvvz/7kiJ/3WcfbZKBmeWlv2QVdA+2MW3wKO93D3+zKZJ4TcV4VJeW/pq16WGU0q5KXstH335XA+8nFwl7UiZQAbH75HAUrIk4rfFXjrK2NPNkUvbAOG9SQHCsk6W6RmmBFVzs7gYHZdh+cJfdOB7ynDpOeK5xWX201hcMRsRjF0AxjnPX8wyAspVkUNEWg2vm8dlG+fmxi2wggrAro+bcgngVFMEpQREe5IIYtz0FPqzERbhtdvr/ax+rBxwZ+42Otw4B6YJ6qWMjfhLXzLnt63gufzWoWfkoR+bO82LbXcLWP0KfIeBGWcDGlroy/AjSEZgxnGXk2nN4rXwv0Q25LGtl2ATP2MNNK4/0RqSVhxz5MY6Lws+9O6IdIMVbt+nsRgRu4RNhBwMZMj+2qs+ZmHm/kwfhLScrr
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 20:10:40.3063
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c85a187b-be55-403d-888e-08deef3fcb35
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9651

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

Note that there are plans to relocate these images into a different
/lib/firmware subdirectory, to further isolate them from the images that
Nouveau uses.

[1] https://lore.kernel.org/rust-for-linux/20260629183022.2709524-1-ttabi@nvidia.com/

v7:
1) Removed errant os_code_offset change in booter
2) Removed stray assert! in gsp.rs
3) Fixed tlv.rst (three -> four)

Timur Tabi (8):
  rust: alloc: add Vec::zeroed method
  rust: firmware: add request_into_buf()
  gpu: nova-core: add TLV parser for firmware files
  gpu: nova-core: transition booter to TLV images
  gpu: nova-core: transition gsp to TLV images
  gpu: nova-core: transition gen_bootloader to TLV images
  gpu: nova-core: transition fsp to TLV images
  gpu: nova-core: update firmware module info for TLV images

 Documentation/gpu/nova/core/tlv.rst           | 184 ++++++++++
 Documentation/gpu/nova/index.rst              |   1 +
 drivers/gpu/nova-core/firmware.rs             | 295 +---------------
 drivers/gpu/nova-core/firmware/booter.rs      | 329 +++---------------
 drivers/gpu/nova-core/firmware/fsp.rs         |  88 +++--
 .../nova-core/firmware/fwsec/bootloader.rs    |  75 +---
 drivers/gpu/nova-core/firmware/gsp.rs         |  59 +---
 drivers/gpu/nova-core/firmware/riscv.rs       |  75 +---
 drivers/gpu/nova-core/firmware/tlv.rs         | 265 ++++++++++++++
 drivers/gpu/nova-core/fsp.rs                  |  11 +-
 drivers/gpu/nova-core/gsp/boot.rs             |   7 +-
 drivers/gpu/nova-core/gsp/hal.rs              |   8 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |  13 +-
 rust/kernel/alloc/kvec.rs                     |  27 ++
 rust/kernel/firmware.rs                       |  48 ++-
 15 files changed, 697 insertions(+), 788 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/tlv.rst
 create mode 100644 drivers/gpu/nova-core/firmware/tlv.rs


base-commit: 44e7e7f7cffb10a93bb88e7cb59b7b8b3e2deb1c
prerequisite-patch-id: 92c2d027299f0bc35d20918668f6874712d12f28
-- 
2.54.0

