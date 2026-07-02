Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013066.outbound.protection.outlook.com [40.93.196.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E0D37A831;
	Thu,  2 Jul 2026 19:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020480; cv=fail; b=tb6JuQ4PlxxxQDZp/OZpm4b3lOTxFl5LzPm3ABVssWEDfvPQ6xl969ELDRs/J+jdMm3WQj6oS5r3o3ubrx/peF0x+Y0/VTUV2DpnFNmKyNPRHsJUfNJAWLEYL/yUeznlJBf7r0v/BkBrWObQdqiBf4qC7o1h4gyozsmA6BMiQuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020480; c=relaxed/simple;
	bh=t4/obfF331XujYnmzIAreZllQ34tErMJe/2/jTy2m+4=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Su9DXy3bN3XzTnw74qH/M8ZAkZKZNQX7ItXtkbq0TdiNVsEpjSHTP/MM2ZFf/z97L1ea70Ttv4zuexRWLNWNHUpp17sJTU9IgF/6LXtHBoa0exwgifdJ7w0LMdTtVi36Ob5/T7UfYjHLE69IN85xPzLNEj9GB2vfYOEkJM+x7Zc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I4T1AUmU; arc=fail smtp.client-ip=40.93.196.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I4T1AUmU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PyaeTDvop4BatbkCruIWjAJrFuawGeBIGb5Acee0HBbIeiA+w1RBchSt281OeP3G7gNaeyqopAIiCFg/C4rf1PKgKc4nJLAkK1h82qibOu1k9peGfomoPEijGhKxdQ/PsLZa1grAqRH6zMjxKBfLN7B+p4qxkbqHkXLqY/Z3gsB/sYs4np98iisYzb8B0qEw1PvlsJyWFpjCy7Gw70+t0wFX1hyU7cntiUM0cHWYRT9KV7OCkyS6FdojgP84dlUyLP1UrOu8i77AsH2UR+WkGnEYTMbRE47aIZZvNznbhXlGM3n76oIo3FZG05/L8Trg/Hb+TBwYYb2tdJMhX9l6ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/VAbfAfRDK2u9AJGEgiMk1Bdyd/saBq7msZdpVKgxrs=;
 b=RMj9F1Dq7vL+QBVC49bJgxoHtLlwW/ctjLfv79Y3SCY/Smh5fstClXBkua0eyB9OddN32WGJdqqAD01PuYqLetKGVUIpJsjyhIfhpXIAxerql5D3unwKJo7ZLQCwfrWQK8UHWhWq8DhlDwOV6G71aTTt+vBXopsIyoDE/R3MdGpsst4iPhEkArlpPp1KS3p7JYhmulX2dZsN+aoq2Wp5nYqDdkAyy0LDlJ4Ymy/xuSRsiByABmRjGg1yfQSz+DkvzWwuReSVvml9YKCvkZF95Ir3uJk4bio7CQIoLjcDaddXipZpswLD9KJigUm2s35Y7BjGx6sbjV2cEcEwjK0JIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/VAbfAfRDK2u9AJGEgiMk1Bdyd/saBq7msZdpVKgxrs=;
 b=I4T1AUmUPYTPNEf1ji+npKmX6SjsztYbNaYSoMLhj9ZxXnmW3viwOrRaVChW5hQX3IOXz5B/JC0TvrKAKdshhxJ14X6dGAhPq85gc+LQWmcbYGRueZWN9hjQfyJw+dxvxrKpPAm+K+zD/CHTCk+DZdqfnOG3J8b/lwmPhBt+noycbmAU3vNEZKeRa7u9qIBbkWhhk5/T9xfg1+85Wc2/nNYicmrNAjfWchPWc6GOP3/sPb9/fcMl37ch4xvqfn8/v79iOLmyEFnLqDgmvowYLR1aB+HIOYrwMLROHGXWyLQIRECxvnEIiSEdoFj8JEhZfOQJfDToRza+gokPmAkaiA==
Received: from MW4PR04CA0334.namprd04.prod.outlook.com (2603:10b6:303:8a::9)
 by BL4PR12MB9478.namprd12.prod.outlook.com (2603:10b6:208:58e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 19:27:53 +0000
Received: from SJ1PEPF000026C9.namprd04.prod.outlook.com
 (2603:10b6:303:8a:cafe::8c) by MW4PR04CA0334.outlook.office365.com
 (2603:10b6:303:8a::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 19:27:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ1PEPF000026C9.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 19:27:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:27 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:25 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [PATCH v3 0/7] Transition Nova Core to TLV firmare images
Date: Thu, 2 Jul 2026 14:27:05 -0500
Message-ID: <20260702192712.3450652-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF000026C9:EE_|BL4PR12MB9478:EE_
X-MS-Office365-Filtering-Correlation-Id: 50557d11-721a-497a-a22a-08ded8700250
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|23010399003|82310400026|376014|921020|13003099007|18002099003|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	GQyPTvdL5DmnRf79uVGUDHNdZFx6Mk7pw2JdfZV7sFv0ln02+wWCnDAr+uPAKQ8NCk1gXcQQT0Ov1GQs+U6BzY5CSPVbsGgoQoYUfMYXir2QxHPHHbjJgRPgQERLcQh4yE9FXnqIwFQRvgm6YzehDECP36FxPT3CrEZH5TB+WKfcCfMs5uiz1BatiYT59lPJ2Lbv3TrLyry7F3ggb8e1H90WEAi36WtFQIZQE9ki9Rb2snu8b8fGIx/zON2d/gTaADYGBoXEe2v3xL4dtp6P1TduOIDO/mM6Os5Rtt/R32p19PSe4YDlNa3oG69cE21YF/qakh/JfBlMecGPjvWfwRQ1cXKNZWa5BYsD+aXABiBpsDSKZLZn1XuQOkRDlDhy7fT8iEJSOynNeDG4OKIQCrj7LC4Y/me3guQQxcAdE/7sl4luBAQsrouM0e/v7ynrCPkCCiQEINpsWduBia7E4WKuFjZxYqi3cszGub824eGNyT/IoZds97tcoM7LUTW18q5uKeMvKjp5baN7ONGGbG8yO/YnTbBaFZ0O/PyW1JBcDmAtVAOKZXJlwX/Vs2PUgrwVDVnHtKZ+HJZte1wWRnIm0TMxZ8rTHZ37+uUAkvpUcqCPUMQaJ+4ACYlJdGVbx5Wgcme7kni2XonO9avENNsHlCybIk+FJFx4MtFBm4Rq5uaetxSHMZmBrUIn5NRKh0bVqvvduEnmBno/Smc0l2EmW9K/4mOzGA/L6RS3OMvSNB7Nu+tjZwc/typekTwC
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(23010399003)(82310400026)(376014)(921020)(13003099007)(18002099003)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	BgaWDE+3n9IkW154gmnK35mbGSZCze8bfQtNeNdZNyoTHkXTiD5szr6SSmXh20nRYFCfExsXh9yqaZos20JTbQdpux/lohQtk1JrK0ImiRVpocYyKRkLVVFdb6i3HV891tfzndk3UE0UQ7p98dUDi41zSULY0yRgIJuDTG3PZap64bolRFhSvEv7g4e0qC/oNC27jHv/VBJKqTgmVEqQ7HhqNKe0UM6TOynij903F8aognqkhhvOSpUez9rZYxd9yNY4a8iYpVRRVDLoJGRr2GK4gWpkwbV02yDhN2O3S5qu9hwZoSMHxkwCH/IlSJmRcw1PcQMo9jOd7B+6otAOElXTVV/ea/cYKUlEhpmSS6raru6PWwZP87RcH+xX5Ul19SDON1iiOeajoVeVeT7AIAwK/zdBHoselpfIfJ+1PgexM+hsaEJII4Uf67umOB9i
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:27:51.8609
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50557d11-721a-497a-a22a-08ded8700250
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000026C9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL4PR12MB9478

This patch set transitions nova-core to use the new "TLV" firmware image
files, instead of the ones that Nouveau uses.

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

v3:
1) Added test for empty slices in request_into_buf
2) Added [expect(dead_code)]
3) Documented handling of duplicate TLV tags

Timur Tabi (7):
  rust: firmware: add request_into_buf()
  gpu: nova-core: add TLV parser for firmware files
  gpu: nova-core: transition booter_load to TLV images
  gpu: nova-core: transition gsp to TLV images
  gpu: nova-core: transition gen_bootloader to TLV images
  gpu: nova-core: transition fsp to TLV images
  gpu: nova-core: update firmware module info for TLV images

 Documentation/gpu/nova/core/tlv.rst           | 182 +++++++++
 drivers/gpu/nova-core/firmware.rs             | 302 +--------------
 drivers/gpu/nova-core/firmware/booter.rs      | 344 ++++--------------
 drivers/gpu/nova-core/firmware/fsp.rs         |  88 +++--
 .../nova-core/firmware/fwsec/bootloader.rs    |  74 +---
 drivers/gpu/nova-core/firmware/gsp.rs         |  59 +--
 drivers/gpu/nova-core/firmware/riscv.rs       |  76 +---
 drivers/gpu/nova-core/firmware/tlv.rs         | 227 ++++++++++++
 drivers/gpu/nova-core/fsp.rs                  |  11 +-
 drivers/gpu/nova-core/gsp/boot.rs             |   7 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs        |  13 +-
 rust/kernel/firmware.rs                       |  47 +++
 12 files changed, 644 insertions(+), 786 deletions(-)
 create mode 100644 Documentation/gpu/nova/core/tlv.rst
 create mode 100644 drivers/gpu/nova-core/firmware/tlv.rs


base-commit: 24d2581fd911d34f88153af59d3b0d6bc5f07adf
-- 
2.54.0

