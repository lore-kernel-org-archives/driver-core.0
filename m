Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010044.outbound.protection.outlook.com [52.101.61.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4362C401A25;
	Wed, 27 May 2026 12:52:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886341; cv=fail; b=FUSkFpcf+pgXUdHVDID2FMgSIOQQam1VYZRWGrwG4q3bQjZXd6vd4yPqy+fJ8PVQj2/44FnRU9F/+kBHbHrEPJqiKnKWQ5CWGyQh9VUNHuqSKUobij/QnN49dE0RB5u7jxNB2q/VEqFHhpykNR7GVbuWZkQkY+YLJgsO9uOThHw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886341; c=relaxed/simple;
	bh=pA1eNao08+WWWs1L6tkVyUrtqvVPHCJZcudSbPFowi8=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=TiHpEr4V7ly+TuHhyANyGjgSz2q0JgllEkHH/epZpr5Dm0aKm/G3guDjepVd3Bz8Ra867MvL4ZlbjshKwF8RPJRlY024FVJIUSYUMBBJEdDVtalbT/w3RBEWAmFlpSNHeAhZrPTHcDSlXrDC0LR7JbiS2RYKuWXoy2qTTFQD8AQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oPe6rXPI; arc=fail smtp.client-ip=52.101.61.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oPe6rXPI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mpti6mOxPeOgg36Hcn9Ad5uKvYbXmUhZV4iW6QWwvFqv8qAwb/HEeZNhGpxKXP8D85O7J8P0KxzFfXISNlqiAArbXq+4zmfI1oK2IEqI55E+YyAlhL5TIWqBEHvp0iaMxDjR6ldy0Zja0z+oRLy6aXxp6Nlr7vlrhwYDmSrWmGwK8tYu1QnjEzoEHRRiPeSUaunP7JmLddCthCcug1Taq72jae/+mzBBAbGCgAkGPPA/dqBHpZHBHHKOwz/cdfE8Yy0cz4evZS2AJAHzKnpeXj12lQDYNRHC/4CCOZ4s56YuQDFjknFAdbIf697mMQKmv5LoT5o/q1XHXKMH+8LIAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ov3ge6goFOmHO4r3mzffgk/PNv/LvqxdFd3J92V/xPM=;
 b=iko5tiR1gOIf/34R0iEdDo4p7oDirQOrraagzC+qzV6gZQ4Kr+rqN4eiA57U97eqOBTcXndwQWt5kzISn93P8YmTXjwhte7H9IhGC7gZEo6B7Ugz2fIrRe1VMQTTsxwhf1YniCPpFA3yTDO1EwSFHWJd5q6SoLy4KWAdzS5ghipWi2BdBnSKYXN0VicT0GQ9e5KyfClrhn1oGZWKeaf3Md0ZIFO2hcgQniLi0ZgkZNz5kLG6MbBrpaAPxG823E8doxEbH2myzNcSLNkcn+5p/O878C9uXckWYDIZVr1qsK9Tvf2mTlWd0ttPqnIcuR4Uz2vXxmL8QSJ3Y4jAEO0qfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ov3ge6goFOmHO4r3mzffgk/PNv/LvqxdFd3J92V/xPM=;
 b=oPe6rXPILlpkZ76gbdaChZiwbKXI+WWGaKsMxJtB85s6WOWbRYEAR7It+dkb8wqES9tpOuf40R60531REmI+Bo9Kabo20d7VgtpH6CV4IrxKB2MdZTtUt1uBGVjQ7X9B5vyioD0mhHagdCnjM+jcvI1rEgtFyVtB37ZfKLFsAKwRGxG6o2dXgp+fOqF5ac7oKMN3D809oiIAD7UodDXFJYkUcbZbJDUqWZyFVvLB91Acnv4zK4W8o9BxWAAfrqQmZxRJ4LLDIU962xfRA+BtG/PDfrS02ERk6qU6/btjTTwEFgTcO9z5op0GuQcvMh++PK2wm0jB56FHtUPvKdPrkA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6730.namprd12.prod.outlook.com (2603:10b6:303:1ec::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 12:52:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 12:52:04 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v4 0/7] rust: add `bitfield!` macro
Date: Wed, 27 May 2026 21:51:54 +0900
Message-Id: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/1WQzW7DIBCEX8XiXKKFxTb1qe9R5cDP0lDVdgsOS
 hTl3YttVWkuSCPmG2a4sUwpUmZDc2OJSsxxnqpQLw1zJzN9EI++aiZBdqBAcxuXEOnL846Elq0
 KKnjHqv07UYiXLer9uOt8tp/klpVfHaeYlzldt7eKXH1/sa+P2CI5cInGKQDohbNvU4k+moObR
 7bmFnyQLYh/JFbSGAF95xCx90/kfa+U6OdcRy57T2ZNJl7vx7gMTS89otU2kHG2rnJBOm9U1wJ
 pApCeAmAX9LplpJzN9jtDs48QPaBoURzqKbXggl+nOc3lucX9F/IShFVyAQAA
X-Change-ID: 20260408-bitfield-6e18254f4fdc
To: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nova-gpu@lists.linux.dev, driver-core@lists.linux.dev, 
 Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <ynorov@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4PR01CA0109.jpnprd01.prod.outlook.com
 (2603:1096:405:378::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6730:EE_
X-MS-Office365-Filtering-Correlation-Id: 2edfd1a9-580f-4e79-b3cd-08debbeec08b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|10070799003|376014|7416014|921020|11063799006|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	+0C4vQm8Io6lM0bAfNU7rrYL03XWENa7zdELOGP/EiZl83KkRZwNf1UG7eaxrHd2JxRePxGBE2cABl9Qh1lDB635px84kFs7CaWCGhIPLVK8b6LrL7RROs+qOaV7X6/KIKTyzsxtWyQneth3Cce4Hc1f61iTK1fFyM7u2tE0lvkvtLTk9RitZemHbZKKwqHvSu/q4SXwcO9yVx3lJ6PqPd4/iN/Spa9g9iBazVOKDuN6wvmKdPz8Dj2kwzFi6whgEMK1wKubFIJVzt3GIMI6cxwD9vzZDveZQzaUbs7m+iyRb4SKjGiIry8aN3bSOJeEbuWGcGpMrliSw/gAvEmUeA3F7FDjc+MwmwuQBnk4by0b38vCOA6JK70E8PxFJFj/7/6Ymdl5W5bOkdIJxMDLIISTq3s1rpMPquV9Jaq+eR8XBqssY0kdUrz3T23WRhWd8ZSa5BMmRgduuaRfEAHDgQvBfdRgx/dZpEnFj2d8OLVkXvGw06SxHhqNGtzaZw6bc3/ptO5lkYkCOWV/EbxLMzZ7vqFK4mP4bpmemVP+scVBLVcCnY9PfWBs4s2381gjhUldSe+U+D3gQsV4IAcCrzVxf3RaopzgbbpSyFxZGRX1BzkulV2EcbdC8Bqp2FoVj9CEUmWrMo2ew0L/qn6rEuzGMFSmgcycuI1SWqCd9xuIarXEqsXuiy6yB2PfQebYuU2Ae+oN/4lfXKUmgNjke38L6PsPDj3+XpU3MOWblr4rrQk08icLHnfy3JxXwPu0
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(10070799003)(376014)(7416014)(921020)(11063799006)(18002099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aUVGK3RGLzN1eFZNa1F5bVlYUm15eE53c3M2TlRXZkp2ZEF1WmFBcXhLdVR4?=
 =?utf-8?B?M2tsZUExaTB1Ty9mQUxBVDRWalVvYXZKalppdVNrL1loTko2dUpnQ3E3d0px?=
 =?utf-8?B?eE5PMG1JZnJ1YVE2UHNMREo1OTBrUzBUZlVXY1o3S2lXM1NBSWhoaUtYYkxo?=
 =?utf-8?B?MmlhRDBKamMxaFIwb1NCUFBXWkEwY1AyWmVNYUp6T3FkR3cySmFrRjI0ZFdX?=
 =?utf-8?B?akppY3pyVjlmcGxUdDAyWEg5MWZBakduc3Vlbk8vOHZQTFFzcktXNmJqdmR0?=
 =?utf-8?B?R29yOEtuRXF5VkpYSEhmam9XQWRucCtUSGtYWEVodkIvSFNycjUxdXFERVdX?=
 =?utf-8?B?TEphSU1YWVJNVnlPWUc4V3cySkM0NEQ1RmxMNzlna1NSeGIxZ0t1ckgxUGtB?=
 =?utf-8?B?YTdDaElkRXZLWHp6UWVmeWFUeUdiQzVsZllTRGlIeUtkR0pRUkFKZU1DQzVa?=
 =?utf-8?B?UlE1QWhObTh4VkJwOVpOVXZyNGNodEs5Q3Jya051c0N5WCtrM0FoeU4yQ0Zx?=
 =?utf-8?B?SnoyYU15MXBFRmpzOTFuWnNsSXVlYm0yM0cyMjRNSDh3cW1lUTNoRjRzV1ZT?=
 =?utf-8?B?N2VubHRyR0cvNkVnZTZjRkdsQ0ZZYzBPdjFKWTRiVkduUkhRVVdkNVl0Vzd1?=
 =?utf-8?B?V0wxZURDeDBGNkNvZ21kdngyUUlNUWdYdEpEWFdVeUR3OG95ZXFteXJsRVRx?=
 =?utf-8?B?WDZheEtHbzFlVHdySzAwMkIzL1N4NTA1MFFVa3c5Z0M4U1ZBWDVxT25VUERj?=
 =?utf-8?B?RExjaWtjRkVXVXVFUmJxMkxXQS84WmlsQnJnaHV4aWtVSTE5NUVZQSt4SGh2?=
 =?utf-8?B?bEN0SVhrendZSFFIVGpJYUtyTFQ1OWd3dHB6Uit0UVhBUldhTFBnSktNQlN3?=
 =?utf-8?B?Nml2UDdBdTBYZWdjU09VYVRTWDJKbjh5MG84SzdCcGJETVY4WWVvWlNSQ1dY?=
 =?utf-8?B?SjlXTVBtV1NuQ244WkcvUXJKUW5oaHR5cExBSHh6bkRqVmhlNFlXVURsckxq?=
 =?utf-8?B?cHNUQ2JBMG5Udzh2N0IydENzdWRzbXkyQVJGNVFBSVdXa21rMXlVM3ljZDRU?=
 =?utf-8?B?eHFrRzJ3ZWd0YXIvRG9uclhoVVVWbmcyNlliU2FYREZVRlJqY3BPbkNycEVn?=
 =?utf-8?B?VWUwYmltVGJMeW82MlZmV0tvejhycEM0bk4zQ0RpMnJja0lQTnZVMjZEN1NV?=
 =?utf-8?B?RmFwQkxhTS9qdzdhdVcrZ3BMdHd0cFdDR1ppRkFQeEpHUHhMcFU5aURmTTBS?=
 =?utf-8?B?Y3orZVk0QWhuNlJsT2daVllJeUtkLzRRelI3b1pTcU5uQytmZW1QQlZLQmxD?=
 =?utf-8?B?cDFIQnlkZzdFbU8vQjFTYU9nZ29qa0VnYXlhNVFNWVIwUmk4OWptelRuZWw0?=
 =?utf-8?B?QXpVTW9NbG5pUUk0TDlTWDRtOTJPT0JxbHVxTUFCbTY1aFFMenlpVy9ibG9i?=
 =?utf-8?B?V1ozRlJjdWVrUU9aWDRXOURGS2VtV2xQczVYYllCZnAwR2o1ZU16azRNMlBE?=
 =?utf-8?B?UTJhQnUvenU2TjFTRTE5ZWJBamZlMmxNQzEzMlFWV1cyVkVPUk0vSkdDUGs5?=
 =?utf-8?B?WnRuS0kyMEZsZUM0RnFNVzVUSjJvUzRraDljYXBlaDFCWW9EMjdXK3B4MHNp?=
 =?utf-8?B?N2dsSGhWWDJNSEFBbWV3QkQvcHEveDlVamJZU0g5cWRGemV1d3VqcFZXSE5s?=
 =?utf-8?B?Sm5SY2dlQ2VzMkxNUlZPYmVxYUFYblpXdUNqbjdWYVhIS1V4YU1ac01lRjNM?=
 =?utf-8?B?eEUrZWdxVFpNRTV4MG5TSEF3d3VtR1cwaitFZDZSQzlYd05pZGpHdGhYaFNP?=
 =?utf-8?B?UldXdk9iSFJucmFuc3lMbjVrYjVDMnlqV2hmcjh3N3U3ZmluZVIvQUZINzgy?=
 =?utf-8?B?dVpjUGVIWWlrajl3YWFRZjJKU3pHNWpkaTEvUmdQOUpac2tINEY3WEtLOUFx?=
 =?utf-8?B?aUl4blZzKzlRVmEzVjI2QlJxNUU5WDRCOU1za1pzN3JNU1c0Y3BRMTJNc01G?=
 =?utf-8?B?Ny9wS3RqY203OW1iYzE1UjRmL3FwVE1Lb0NkZFdmRkRwNG1KaHVTNFhNbjlO?=
 =?utf-8?B?TFI1N2hDQWtaRUR1c3RrR1J4MVF6ck9IQTVqZXBhQ3hNdGxmRkdCWTRaVXVa?=
 =?utf-8?B?QXcxUUM5UFhPUWFnZE5GUWc1aUVjUWtXMmFpZDdhRzFDZksrMlZmdHpob0FP?=
 =?utf-8?B?RTFFdnpSTXJHUDRZV1lvSkFRRG5wYmtlQ0FNc1VhdndQUHVLWGl0VmhhTk16?=
 =?utf-8?B?Uks2cjFsUER6Nk4wdlZvM2s5cUEvK2xKVjBXN0R2SlRXVG5QckpxRnE2Kytq?=
 =?utf-8?B?eW5NYlFQc3Jtdlh0NSsyYnNYVzduajh1bHpPWmUvKytXTjR2Y2x0NHAyODcv?=
 =?utf-8?Q?W7rjZOOF2FHUgciCcdRaJOa5v9nWYUN63RlwjdwdC0UOM?=
X-MS-Exchange-AntiSpam-MessageData-1: 9GCr9Gn86rRoTA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2edfd1a9-580f-4e79-b3cd-08debbeec08b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:52:04.8416
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ONohvEqAYBBkYt+iklNd3yir6OgoWv+X7JasneL09CKCVddLlVRnvEQtWR1egJTOoqRW7H8J45ZOb/dRbredAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6730

This is the continuation of the `bitfield!` macro which started
alongside the `register!` one before being temporarily integrated into
it [1].

Thanks for all the feedback on v2; I believe this version addresses all
of it, modulo Eliot's suggestion for more explicit range error messages.
Since this is not fundamentally broken, I'd like to address this in a
follow-up change to keep the series focused on the macro extraction from
`register!`.

This version is based on `rust-next`, with [2] applied. If review proves
satisfying, the merge path with the least friction seems to be patches
1-3 into the rust tree this cycle, followed by patch 4 through the I/O
tree, and patches 5-6 via the DRM tree during the next cycle. Patch 7
can be merged after [2].

A tree with this branch and its dependencies is available at [3].

[1] https://lore.kernel.org/all/20260120-register-v1-0-723a1743b557@nvidia.com/
[2] https://lore.kernel.org/all/20260417031531.315281-1-ynorov@nvidia.com/
[3] https://github.com/Gnurou/linux/tree/b4/bitfield

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v4:
- Inline private bitfield accessor methods.
- Fully qualify types in `bitfield!` macro.
- Rename `RUST_KERNEL_BITFIELD_KUNIT_TEST` to `RUST_BITFIELD_KUNIT_TEST`.
- Link to v3: https://patch.msgid.link/20260501-bitfield-v3-0-aa1076c3337d@nvidia.com

Changes in v3:
- Split patch 1 into the addition of the `bitfield!` macro and its use
  in the `io` module.
- Mention reserved field names in `bitfield!`'s doccomment.
- Properly order fields in the KUnit test.
- Add a Kconfig option for building the KUnit tests.
- Document behavior on non-covered bits.
- Document support for signed fields and storage types (TL;DR: not
  supported).
- Move `nova-core`'s `bitfield` module deletion into its own patch.
- Link to v2: https://patch.msgid.link/20260409-bitfield-v2-0-23ac400071cb@nvidia.com

---
Alexandre Courbot (6):
      rust: extract `bitfield!` macro from `register!`
      rust: bitfield: inline private accessors
      rust: bitfield: fully qualify types in macro
      rust: io: use the `bitfield!` macro in `register!`
      gpu: nova-core: switch to kernel bitfield macro
      gpu: nova-core: remove the driver-local `bitfield!` macro

Joel Fernandes (1):
      rust: bitfield: Add KUnit tests for bitfield

 MAINTAINERS                        |   7 +
 drivers/gpu/nova-core/bitfield.rs  | 329 --------------
 drivers/gpu/nova-core/gsp/fw.rs    |  11 +-
 drivers/gpu/nova-core/nova_core.rs |   3 -
 rust/kernel/Kconfig.test           |  10 +
 rust/kernel/bitfield.rs            | 863 +++++++++++++++++++++++++++++++++++++
 rust/kernel/io/register.rs         | 246 +----------
 rust/kernel/lib.rs                 |   1 +
 8 files changed, 889 insertions(+), 581 deletions(-)
---
base-commit: 72d33b8bfeacbfdccf2cda4650e8e002def036f8
change-id: 20260408-bitfield-6e18254f4fdc
prerequisite-message-id: 20260417031531.315281-1-ynorov@nvidia.com
prerequisite-patch-id: 403e34bb92b42d3f31ed972e11896d18902585e3
prerequisite-patch-id: 42ae775aa6762a9e28ff31c5f69a0b65a7b40dcc
prerequisite-patch-id: 19b3e535962348f7627ede57ea829b34abda08c7

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

