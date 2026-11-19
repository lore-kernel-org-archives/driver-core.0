Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.140
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795099053;
	b=HOUaOzfbTUGz/5YXRCsHrEk10UbydVNNEA9vFyNCnHOEmdK6ZzYiwreEKYPeT/Te5Fsu
	 BFgqhVsg7e/IyjIO0o8pkZDC+9XASHibcixEpvdCZPlXKa1IEXypoVmTz7wvvVzz3/Rbz
	 BT/EDwKze7uOrGFU08lU9ENsTCHwaxqAf8KZHgEpQpsdCrptbaUm25kk78ddqikGgw9n5
	 nLTxy5B+ADbvAUICm0P2iZUES+Yvvau1bLz5JBipJNY+9OjA4i0o/qkhGZ4RpYDzD/VT8
	 phndtiqkpNYeMMxWapI8ml1D6aI/JUrhKUoq8jRRMzy97/33lNZUtTKtkVGP9oWl15Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795099053;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=twH7FJNnnrGUaYHYn/31Km2/srVMZGvMfUmPErSmjsA=;
	b=YJAs2vNQYmtQDhwbvLK+MLYaDsteiNMcRYSvRR31fipi2eJvSzGxZJBzy1r7C1BRLpGr
	 AH0LATWzKh1AX1O7mxDMXMbEhqtI275IzKwBSPrfrgthZ8vTDaN1ItdrIh8USyTDfakw6
	 6XG6JkntuM0RJQdUL2Om/Ejnj4v9a+Lr6Qnu3+Aop6gPk3bCIJAPiNC8Sfn37xR0KM3Gc
	 k6iwcnWrR2MPLMWHPRsStZJ1poqBXeboIZrwV3buXgBePJfcc4uaNBCfYpLgQRUoGyYEt
	 oNFkaImFXVtoaSg05SCFVAAizhRbkA0Vnf18Sajg229TeXsDjOqfVd1mqyaLf7C0fMw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b="d3IK/ehh";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.95.140
Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021140.outbound.protection.outlook.com [52.101.95.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A6D606A32C
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 14:37:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62A6D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=d3IK/ehh
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z89Fmyu6yfchoVnQNt9q34cJ30ILfFmVG8SRuUlYiK4tdNA6+X3QFxv95ZSpybIS4VXgVvoIRcT58szGx6Q52nF8oLZnUhXxTuEnldawoBppJNkjvZtH8+dA1kN3r0ySr9kdVlwcC7xZeFwWtt4fkLgfJPxMZO+sCWcI/sJtBQV/6H/Sot8iu9uMQ9tglPq6nbpCXq4IaE3S4Nr8sweVIhhl6AlGhMRUhByHyznRnj2/qp/HgbOxhfLtHLHbcQ3MxkHrI1XYl/o5hjr8WrTwhVlJUROubHerjea85pZ8tMJVbHDGpM4b4K6tifTsbaN88W9bDO8RMtrhPwCzUDhSCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=twH7FJNnnrGUaYHYn/31Km2/srVMZGvMfUmPErSmjsA=;
 b=vksLM7eUDyUvUO1pQtZGu+BzfV1rtt0mRlaF88TsEkP5EF95sbzfVYjDT9DvqUuQLXHOwR8Ax86CKttlFwW4xQgQbk0LH4Xw2FbEgDT+m7QRvFnIU6/79wyEvgyk+9081La/Im/RGGMmCKplB9V4POhl8LIRkNVwz+2NNwmH7QMCCdxMoOQ85r93gtpajImFaAo/1WW8p+JgjoBdHbQqmFhLnxpcOWCy4ImEBTm8JjBurX1gs2+1DFB4cjQ14o5g8ER6vd9JB3YehznzkRJpyuatfanLQpQZC8Eu4x2XmZN1i3MGlX1lu4IUUW6Z7qgRk/7LHBb/UJF8peY7bnQc9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=twH7FJNnnrGUaYHYn/31Km2/srVMZGvMfUmPErSmjsA=;
 b=d3IK/ehh7ylVGFq1cYXGE08mTAy8cYZrgwRM4srC+g+b5cpkHeGYzGcomQXbpmmfWEgFyOq+54ML8Cm8m8d0lz+pHDuOLcHcdtbX2rg+Ew0Kn1vy4QJayL9UsrOAkhEES9v4ddsws7Udpz0wLIqpSFsgPh5IlgWnSgIvLle1q9A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by LO6P265MB5950.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2a9::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.10; Thu, 19 Nov
 2026 14:37:31 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0615.015; Thu, 19 Nov 2026
 14:37:31 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 19 Nov 2026 14:37:30 +0000
Message-Id: <DMZ9I76XDTL2.1TTFSPEVEKHB1@garyguo.net>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "John Hubbard"
 <jhubbard@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>
Subject: Re: [PATCH v4 3/5] rust: workqueue: create workqueue subdirectory
From: "Gary Guo" <gary@garyguo.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Tejun Heo" <tj@kernel.org>, "Lai
 Jiangshan" <jiangshanlai@gmail.com>, "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-3-707c68994940@google.com>
In-Reply-To: <20261119-rust-workqueue-v4-3-707c68994940@google.com>
X-ClientProxiedBy: LO4P123CA0034.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:151::21) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|LO6P265MB5950:EE_
X-MS-Office365-Filtering-Correlation-Id: db078ce8-d6b1-4c44-b8bb-08df464aa46c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|1800799024|376014|7416014|22082099003|18002099003|56012099006|4143699003|261026140227099003|261102123227099003|261028144727099003|261022105027099003|261021121427099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	fdJq0QBtdJEhVHbCjRDflBrtTWcosmJD0wkzi5gpDq/4nheH0mJoVUhhl+LOteK0temW7TH2w1RDVefTMno3yN4GDWqrst1vyS+qwjxzV7zgzohFC3c334dJpF/MlLSPrvz9TN077D30fl/3DRPbqcHjSGqwWyAfvuxSCkxB3ffIUEvFbVQt6fFyYg4Z78Tu95OYoXU0H95KYdG/CN0+KWvN7CjiSwwPAHgLr1cbP1XY9BlVoDZ1RJrVSkKGPTvCjGt6rXGb8MoEeG75GYcdGx5RQgk3/rfWhhWpj7AmDM7rJicv7m1O7RmSM9exCrMW1bPThgbR76kZpS56UsiBvAIAhu6TY5FHwIOtnlGFx/WERxzLNqXyxAyp4f46FRIlKiSTw5dllpmx5oVItTn0R38KqpDAbUBs5Nxv2MlYB+9tPsT/zAXCo1KnGA2oPsdBo3wsL8Kq2iuGarx9SGrHbhwkX20yMf6Q19K7A1H8B6Lgb1M6G3lhf0/SQCC8o4Qdb8DQ06y+S4CKmMj7rex/jsGanSNAWCezHtxiYz+RMYQT6hlgm696UspWFr6zm4j7zmzJlNymmVKcW5O67BmOGNZEzGBXfkvQzK+4gFd7k7vrKrP9awEM+UIpXcnmydkBOXX0tiX3gS4fCk1HEDuFGuq7AKi0NC9o27q7L7wRKlo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(1800799024)(376014)(7416014)(22082099003)(18002099003)(56012099006)(4143699003)(261026140227099003)(261102123227099003)(261028144727099003)(261022105027099003)(261021121427099003)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bExsNS9BRzlYZmlpOFZsMyttRGoyNEY4ZGRyanpHU2g3ekYyN2hpK0VtT0Ru?=
 =?utf-8?B?V3Jpd21yc2RSSjk4MzJkdC9zMWVMbEtIL09UbHpvbmNXbkZkTW0rdno2MEpO?=
 =?utf-8?B?ajdxTVJUS2ovZWZLdGk1STJJc1JpSTU2dFZFanlLNW55bnE1UHF5bmY4eklv?=
 =?utf-8?B?aS81cDJnMTRsc2xiZDYybVpCeDJMWUxMK0lvNWVFYXBCSDgrNmsyY0RraXBk?=
 =?utf-8?B?UTVnWnRDMzViMU9GdWtGcGpFRmxReXZvdHovK01TWFV6cHlXTlZEY3d4ZDBM?=
 =?utf-8?B?SU52ak1FckdoZWpDWEVLdUZtSkpLSDZqUUpnaVZVeERvTHVVVDBVekIwU05w?=
 =?utf-8?B?YWx1eDRKNTFJcHIyd3pCL3YwZTJwOHVTTFdFbTNLbHhabWd4S05YZHVkdks1?=
 =?utf-8?B?UHVJb2lnQWhzZ0xpMm5jQmJXaU5Gd3d0MXVUSWpUenpDdThZb3g4czBUSy9I?=
 =?utf-8?B?cFljTkRac09aeGlmQk9YcTdheld4ZW1xT05IM0x3RkI0QUtzWGlOdjlBWDVs?=
 =?utf-8?B?MnlzMDBtTUlFTXhKYW00aCtUMW0rS1UwNGk5YVVaU0xDZzJ0UHVHZ2JKMWxt?=
 =?utf-8?B?RXNxRWNOODZzbXp6b0NXbGZVS044d2NPZ0VGdWc3b2IzNVh0bFhVcEU0dTgr?=
 =?utf-8?B?cVdUMEdOeVIrZG43SnZYOW5tQk4vZDBLNkZnS2d5QmYvaUdDWW1KZE1kaW5j?=
 =?utf-8?B?a2hnSFQzNWFCQ1prSXo5OExPV1ZlekFwYStROU1EQ0RoWGRoNDlUNFVicCsw?=
 =?utf-8?B?UDhFdTNMYlg2bUhsREx2ODBsbnJLUHRHcUpiRFcrVFZuemZPZ3YwMFcxNUdF?=
 =?utf-8?B?ZjNNdW5xekxTR3lyaENWQ1QvVi9mbFFoS0lpekU1TDhPT0w4SUxWTXdaWXE5?=
 =?utf-8?B?L1p3UzlRL3IrdlQ4Rlowa0s3eWZ1YWNBZVpCRFRGb1cybTlzSTZRczRBUHRh?=
 =?utf-8?B?NTdUbjNYVERDZ0NPaDFPK3lPMFZ0eUcvL3B6SVZBd2pZUTMwZGdvMkZVcHRE?=
 =?utf-8?B?dkt0WFRhZmYyTmxoTm05ZktabjNiVXoxelBqcGRCQWNtS2JoNzRzWm85bllQ?=
 =?utf-8?B?YkdUSEFUSW1NYXJubCs4QlBJWnE1bXBVK05kaFhhYnZVSVlJWXpkKzBPOEVr?=
 =?utf-8?B?ZFMxTkU0dFpxODBqZWhaaTd6L0pIWGF6T0ptQ3ova29WRExzb3ZmOC9FYTk5?=
 =?utf-8?B?Y05Jb0k5MEROYWRwcjFjNFhydDloUmw2WXlwNFU1K0t6ak5tck1oSjJmdGU2?=
 =?utf-8?B?b0Iya09SUlJzdkg5emNQOXBFWFVTd2tYd3VzY1BQT0QrZGpYT2VhTTVwVGFI?=
 =?utf-8?B?RU5TWFZhYkpvRVRtUDFuNWpxTVh2OFRjenlWOWdyNE50TDNvQXpUeVBBd2Rj?=
 =?utf-8?B?MUIvaURiRjU0MjJBWkNTaUM1RVlPTjZ0clROY1dLV1ZiUVFYeGVQWC9GbmxT?=
 =?utf-8?B?Mk82d096Q2wzTnBNWGNUTUZBQzNDMXlqcU5PYlAvUm1tc2o2OS9aKzBOejZJ?=
 =?utf-8?B?WlJuNXNTekkrQmtHckZCZS9zV05Qb1I4MkhsZWlEemFCT2tVdVRTL2NGb2Vz?=
 =?utf-8?B?Z2QrS2tBNERJd0xkWTM2d0tPUGg2WWVxcU9kSzAvUFJmb3laQ1luOHBoTi8v?=
 =?utf-8?B?MEs3dFNJMFZ6aEFKL3BYL1dhcnpHUmM2TC95dGVBV3Y1YzFRVUVRUEVyejUw?=
 =?utf-8?B?OUJQbTZBa2R2bERaVlFqNG1XMUlXVmtGZEZjL01zU2NmaUF6biswSVlEVG1P?=
 =?utf-8?B?SkF6UjRON1pPYzBZSmlLRWlNQjZwdktyS1hyNGwvVVcxMC9kTWszWFJObFJi?=
 =?utf-8?B?Z1dDYy8wa0tEN2ZVNTdUZytWdy9ONmJQbXFtWW15VUxCcXRvL3NFRWZKbW5F?=
 =?utf-8?B?Y2tYLzlKT0dHUXI1bHBNdkpTVjlqTlNVWi91TTVuN0diUGRrVUliQlNLeGla?=
 =?utf-8?B?Vkp4anVCV2tZbnJlUC9qU1dFQ3BmbkZwbGppTnFsYVFYMDJ3YlVmeUZjZUdW?=
 =?utf-8?B?dTlleEdNUWhzQlhTdXVkNEQ4T2ZrSEczYXh1bDZpVnhGK2xaQlNBU096b1Nh?=
 =?utf-8?B?N3RTSnNiOUNKK3hyd1pEUExZNjZsRGp4bElPZlhVaU1vUytPdGJjZzI3TTQv?=
 =?utf-8?B?OXhpQ0ordkltUUxLNkRxRlZqQngzZDlzMTdWaTFMMzBuZXpXaE96cGxXNUFv?=
 =?utf-8?B?SGk1LzBLd0l3K1I2OStFY3I4WCs3ak8wZ1J1ckJpOEI2TXdETWxRN0VMTWFL?=
 =?utf-8?B?Y0diQk1abkZtaWFaYVhLcGJHUlg5bVRxdG9zY0djdkpzOVl4bmdsNWd3OCsz?=
 =?utf-8?B?M2JIcEo4R2djY3pMbmFNcHJjcmp2Qi8zT2ZoTERCSC9aa2VDbGI0Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: db078ce8-d6b1-4c44-b8bb-08df464aa46c
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2026 14:37:31.1182
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A7PV7VgsLCzH7V+iAzdUdVxKGuW9TLCrncXyhy/PIQYEADQ4naOLnvTxVLWKe5zD48D3k4iA8Yy/qixdODlxTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB5950

On Thu Nov 19, 2026 at 2:12 PM GMT, Alice Ryhl wrote:
> The following patch will implement a workqueue builder in a separate
> file. To prepare for that, create a rust/kernel/workqueue subdirectory
> and move the existing file.
>=20
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Reviewed-by: Philipp Stanner <phasta@kernel.org>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Gary Guo <gary@garyguo.net>

> ---
>  MAINTAINERS                                    | 1 +
>  rust/kernel/{workqueue.rs =3D> workqueue/mod.rs} | 0
>  2 files changed, 1 insertion(+)

