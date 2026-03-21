Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5039531F9B0
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 13:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100192; cv=fail; b=J9CZopQFyVv7F4W34uSogrd1oLX2ZP5Vs88r3CXO5H5QQOHV92HJqLJNy1cfKKv/E0ICI01iWG6MsNNrOPjTZtx5MPekVR6au/XGPWd7M/LwaDrXQ//OqPWzZWz6c5u2k3IMhiTrZ6NC+h6arVIFjvw/3yREbRgKJnfLOkGXIDE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100192; c=relaxed/simple;
	bh=Pp7vOuT9is0rjFomIyay8h7XNUG0R2YXg4mBS/nzvNM=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=J9FvpLQMbIFVKSwH4aJNbyK4S76XCeeULMd6p0G1wBl+UZYEZ7muIdCQ2tUeq++As1s/YBQJAwuukPIbSYEO6fddycAGRSK/pY4r+OFpQW5mdRhKDbFqNz2Lb4i8BWDKg3N4nsR+ehqg48DhHcLahhdcXu3425r5YwtJE/v23LA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BoHepclT; arc=fail smtp.client-ip=52.101.46.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BoHepclT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AsE8FqyQTwcM12KWd9B0ao/nb1zqKJlqzhH/mIERkz1yxA0garfQSGDNpFx/xW+iQEBPDFABx9Q+oACKGCa/7V+W7jrd0wVJSqjCdYgSqNi95PVqN4LO4VLeR1PWPInkw92WLyaumVN1/5fVtik5sTFQwzYC7Gv488vyLvh80Wwe2uutgYNxg9hmWplK1hvYQA60nh2tTOM+K8/fzayCHqQTFq3pX8WKeSYkaTL2UNFkfyrPsmYk5VixCCUgBb3gINbpoohWsjOLZMny/92ieDLM3d+m4yeJjUERYRC1tTmdyeBtgzCkoZQc/tOcIiSXAL/kjV9lQ44zGdr21azS/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W+rdYpziuRkTN7qo4gyU28xERZwCtsR3lXglB9HS38o=;
 b=LkINtZa4HtWlJA8oOv/p4aphVvLDG+8kviak3bvQirlSqQwXSmiWasuLBEwkiH0UGWOLHevAHpGpUFomf6mrEp+vx46j0hXL9kKsjm9cSBdUSs8PQzy3jCs0ak9dVUMTQJ+2j0bNkOXxBdFzuiI2MbBfXPvX7l+AZZFKOmocBmbvks68l7NxyhWbbeuU7yAg06FHmpcpTOeOg6c5DEGugoHYOg6elmteVRvsK8oHyyxAMFaENhJXkcXS5cT64s2rxUDVKglTu0RpmIKpcba3rwnjSyIxkVXsWepYhHyYJGjzHGCrIYQk6wbYYeNGwkwCTEDS1q9R0qynavojcSAYjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W+rdYpziuRkTN7qo4gyU28xERZwCtsR3lXglB9HS38o=;
 b=BoHepclT4lPBtXUWtTKDD2lrscURBeRpIQlkXPLAFPbjqQgeXHpDD2V2AsuohJ6l7Y/LL0f9Kej3miKAmyhmazWjYpSd/8ZX1aXBhFWzZIfuQvJ9Udvu2vEjBqmkpYwvMWTF/lmKPEdrPWnNEBLaw+6pLyUF8XvRVB7RuiNgkO/BV3854PvWHlIap0UygB9BSx+ydmvjxCrlYwq2t76QoO1CB8uvqhJg/3X2oHRWMAkiHRyL3DGi+cG7JCIZrvO4v+WR/Z21RYNWq2wgpNaP1w/vgv9ji8sMCVs3HMqLSaRivoRbbn9LaOVax+TJP1GtwjDUe4ISpgxKGz7h3TZP+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 13:36:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 13:36:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 0/7] rust: dma: add from-slice constructors and use them in
 nova-core
Date: Sat, 21 Mar 2026 22:36:18 +0900
Message-Id: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MQQqAIBAAvxJ7bsEstPpKdNhyq4WyUJAg+nvSb
 eYw80DkIByhLx4InCTK6bNUZQHzRn5lFJcdtNJG1brCqUF/JkJ3EAY+Mu5IltvWNWRspyCXV+B
 F7v86jO/7AbFCX+FlAAAA
X-Change-ID: 20260321-b4-nova-dma-removal-a7e88d4a6790
To: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYWPR01CA0028.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: 1da6425a-d678-4300-1c1a-08de874ed90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|10070799003|18002099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	SEQK29wr4DNZzHCb9XwzQjSXxG6PUVSomsCVyXn3gTfBPWs32f3hwOIHDIImX92D+dP3vlPteVepG7q+TTgMGh6q5PZPxZvac32MLd6ANocf/LoUMSgw6UrXEl07byu7bkv9nMSJLt/Ca5ryga/3Y2L7CcS0faFo4mp1P/XS7upg4s9dM7mR9CZsKz7o6ykMzBABhW5Lxqs+clkTwYJyN4pbS0wFrEsC1bFTmR4lioVUY/HU4gcQu41o2MSMfmTiItJQbr5ZmKUaheTE7Rckryju0oVHeZV7ggB2EDhF6rQQMZD8STemn5U3rhxrvaJj0LIxvzWLU91/+4yr6fnGKqaIu4Qyopog6FyahPkunXVPkiKf104BnmqKAa5D5j08YhtGSnrS2WvtJvxZ2958eaN+fKgXU+I1SL17TDa8esHlK0g4qeFUjAL62FhzaEiFup7tbE37yguoYIuUNltrnN8HxJYoTSkAl+RH8eA0v1pI5Zx5u35tK4+2CpFZGA0tVGwYpYTlGhDO2VtGHHh0QMI8iPeOk+9xR6sEId7RpLL8f7eoWXoRw7d1l5bEmkt21661aoDTrXBtHxe4p5jXRFgU8+SZa7YLn7uShDCUdrntl/0IHYOQc3h7DnNugdI5vhRldaVfRX9M2mre50Oka+YUc/p53KIhUvIvpPYhZ/8E5VURjqNZ2sq5ErobTBKIJqdv83rxJiYu/hG9os0fuNF7tWkiyaWlvhaIErK0aDh0OEuEcZ+CMc97C8pnsH7s6ilhRuo31MtzOx5puYeE6vog6rSAdP/xU2V7KVcvncQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(10070799003)(18002099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Tnd3MDIrT1kyZUFOcklNa0d6eVJwUjRVV1ZaZDBjMi9sTkJKbE1sK0dzUlB6?=
 =?utf-8?B?MXlOQURUVytSVHNnQTJqRUdvTEJWZUVHWkxYcWpYekZ3MWhWcHFtYVlwdVRP?=
 =?utf-8?B?WGJjaTE0ZVUxS205OEl0RGFVNXY1QzVrUzNXQlNZdzFxZzZJN2dHWWdLRGR6?=
 =?utf-8?B?WTF3MWJGUDNoMUU5VkxScWtsdUpGU3lSUWthZWdTY29icWJid0ZHcldERGR2?=
 =?utf-8?B?MDVra0xzU1F0NFQ5NE9DU0s2SHRUWFlvMFQrY0ZSRi91bkJ2Z1JBcHBaZjZG?=
 =?utf-8?B?eVNvQUhaZEhJNnc2bXp4dUhPek1SMjZwRWgxWDgrKzFVQllCOEJlSFVrbWNs?=
 =?utf-8?B?NjVnbHNBbHl0UytyVXJJd0JKd0laY3RuNjlqUlR2c3lUc25jcFowN3BrTFF2?=
 =?utf-8?B?cFpObDJMMUtjeXdFVUo5VHRNS2YwUEJxRGFrVlN0WnZMTWRnS01YVzl1NXJR?=
 =?utf-8?B?eGZlcHN2dmJ5UEIwWmtqeDJYS290NGwxeUFRUThCNEhtRUdZbmV6UVEvMmpT?=
 =?utf-8?B?MTBzNkFHRFhuN0JUZStsVW1TbjB4NkgxRHNpNUdWdUtBYjdjdjBlSHRaNnpV?=
 =?utf-8?B?Ui9nQ01PUGVIcER6SE42S2hVaHJScjFOSXlXV2FVdEJCOWFCTXIrUUFqVXZS?=
 =?utf-8?B?WVBkRmRlSEFmYjJoOUMzcFE0SzRpTzFIaVk5RWI1SjhqNWs0MUFhR05OalpR?=
 =?utf-8?B?bXFkYWtCRGdqSXh2dWYzSFVDQi9BSlpMZzFPUGlEcTRZMFBhMVRDcGJCZW5W?=
 =?utf-8?B?Z2E4WDRadDVIajc0V29pVGp5SUFzQWlnOW8wblUrVWQyUHRsTHJJbnpLd0tp?=
 =?utf-8?B?Mm1meGJDbjZPYyttUVRaS0NVVWxHM1dKWlNNY0tTcGErSFdacTNFVlRkYjZy?=
 =?utf-8?B?U0FCdk9rUEQwNmRhK1VTeDhEcnhUNVRnQ3R3NnVDa2VkbjRKWEh3QUo4VHFs?=
 =?utf-8?B?UGpaS25OVVRuODlEVEx4bmFLVitpV1JySG54ZEVudmQvc3pDMlZyRExGc0cx?=
 =?utf-8?B?YVZ1blFoWmlJcWlNZzdLQ2VMZ3EvTUp0cFM0WXA1K0VWWnFLd0pYb1dhb1Zh?=
 =?utf-8?B?eXFkQzgrSzNqME44eDBwbk5qSW9GYkF4RW9GN01rMmhLcHRNSHoxclJNTmVk?=
 =?utf-8?B?U1Fxb2cyQjQ1Z1VqZWxXeHhxbmdIRnVhNGZPcmRQYThPMWFLTlBFaGZFSklo?=
 =?utf-8?B?dUVjRGcxL1Q0V1pjMGJ1WktDU3ZmR3pNVXhMeVJVMzRWNi8rTkFkU2VPaVJp?=
 =?utf-8?B?UzZGQWtoUzBtZTQ0azhabXZ6cXJ5RTdabkdlSUJ1ajdiMEtRUlYxSktqWnFR?=
 =?utf-8?B?TmNpU29MWnVJeHRnaGVLa2lXK0FsZnhuWjlSNnBwL0QyVWRGdUJnZU9sL1Bl?=
 =?utf-8?B?U3Y4dXVGR01Ra2huTWlMVVFYdEc4OEgrVUxUM3RlUEpCVXh6djREZkVLcXZD?=
 =?utf-8?B?OTZUclpYYnNJZGhKckhERDVwRWU2Wms0S2VPKzhiNlpEOVpJRTBHMGV5VzVP?=
 =?utf-8?B?cEJSRXdQL2tYWS9uNmFvR3FtWXpBeHJiNG8ybkhGRHJjZGw4L3FpeHQvV1pM?=
 =?utf-8?B?VkQ4L21RdUFXcjM3VHNQY1hZMVJTbit4am14TW8rL3kxYXI1Tlo1c2NHTUQv?=
 =?utf-8?B?ZURNcXpEbTczRVM1ZVVzYmQ4dkljWk1DU1pGSFJVbW82cGtUT0JVUzRRampU?=
 =?utf-8?B?TmhjVVJUTEdPM2hFeFhiZXdURjY2RjV2OWdrenZaYTQrMi9IVGFzUGFIQ05I?=
 =?utf-8?B?VTBKWXBXaWtLaUJyT0loTnQ4a2xkanM2WkhOVE5maTNNbkFQWTBhWXpSY043?=
 =?utf-8?B?a3FKRzRvZ0Zhb2I3Nm93cFlIN290dGtmZWs1alNnbkczaUR2TG42MDZyYnJH?=
 =?utf-8?B?NjV0NmFSTk1nL3k2WGt6cTRkVitkVEZ6eUhyYmZsTk05UC9XeTU0dHZjY3Yw?=
 =?utf-8?B?bSs5ZGs3NUFqaUN4Yy9TZlpSK0ZFbTkyRzBDdFYvQllkeFowOFQxeURibzVi?=
 =?utf-8?B?WnU0UkJudWNqdjdDR3RDSXRDYjdUVnEzendZOUtlcTYydmtoWkxJdmp2dzZr?=
 =?utf-8?B?cjgwWnhOYlhTUzR1OVlnY1ZsWTBvbGl1ZTFUT21jT0tlYnIxV2YyM1ZybEF3?=
 =?utf-8?B?amE2UmVxM0g4Z1NxdDhGSHdCQ1kvczhCUHBlTU9UUjlNN0Exc2FaQVhQTHli?=
 =?utf-8?B?UlA2a1JBYkltR0YwQ0tnL2ZRSExhSXcwditLSklIN0JZaVNXaWwyejdOTHQw?=
 =?utf-8?B?aFA5VEh2WkJObjExYVc2NVliY1ZwVWJscVp2dkdyS1p4Q25UN1FFNC9EdEd2?=
 =?utf-8?B?ajJma0RRMUpmU09BalpFQnU2WnNNZmg2U1hKUTJyMVJ0MVc4RVBodDdLNndi?=
 =?utf-8?Q?pEcjiD98payoq/tCLxLxUXepbiU61ry8HPhORL/disAwJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 2dQ6TKfehTmU5A==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1da6425a-d678-4300-1c1a-08de874ed90b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 13:36:25.3490
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +yvRR9MfTxY9Q/pU2k2HSW2BJe6WGFAlDm0ATqiqFW8EYldggEZfPaQzIfPy8z8YhAYyQewV7K4iZmkSIPVyXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133

nova-core's `DmaObject` type has been created to serve the same purpose
as `dma::Coherent`, with the addition of a handy constructor to create
an object from a slice of bytes, but without the flexibility of
`dma::Coherent` since `DmaObject` is limited to slices of bytes.

This series adds new constructors to `Coherent` and `CoherentBox` to
cover this (arguably common) use-case, and updates the nova-core code to
use them. This results in more consistent code overall, and allows us to
retire `DmaObject` and nova-core's `dma` module.

Depends on drm-rust-next as of 2026-03-21 + [1].

[1] https://lore.kernel.org/all/20260320194626.36263-1-dakr@kernel.org/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Alexandre Courbot (7):
      rust: dma: add from-slice constructors for Coherent and CoherentBox
      gpu: nova-core: firmware: riscv: use dma::Coherent
      gpu: nova-core: firmware: fwsec: use dma::Coherent
      gpu: nova-core: falcon: use dma::Coherent
      gpu: nova-core: fb: use dma::Coherent
      gpu: nova-core: firmware: gsp: use dma::Coherent for signatures
      gpu: nova-core: firmware: gsp: use dma::Coherent for level0 table

 drivers/gpu/nova-core/dma.rs                       |  53 -----------
 drivers/gpu/nova-core/falcon.rs                    |   6 +-
 drivers/gpu/nova-core/fb.rs                        |   6 +-
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |   6 +-
 drivers/gpu/nova-core/firmware/gsp.rs              |  27 +++---
 drivers/gpu/nova-core/firmware/riscv.rs            |   6 +-
 drivers/gpu/nova-core/nova_core.rs                 |   1 -
 rust/kernel/dma.rs                                 | 102 +++++++++++++++++++++
 8 files changed, 129 insertions(+), 78 deletions(-)
---
base-commit: 19761c783a46bc4fb2ba0ef22111f7dd27b441e6
change-id: 20260321-b4-nova-dma-removal-a7e88d4a6790

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

