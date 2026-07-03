Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012056.outbound.protection.outlook.com [52.101.48.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A672354AE3
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 05:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783055876; cv=fail; b=o4AR5sWdj1HHgy0skCYol04kuznfxfzqAcJt1TYJ16lPI7ZXwWj5e+mKmH2Sgm5EFzNohVriUTJIHLfELRGQ4f1wTyIQa/4l+3ZoAD3VcrrI+lePn6xkZsQOT3E2XEQOhFiFNxFT7pJ6zpEPWGYxrRahVkLX7xBVzn3KrH0rAbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783055876; c=relaxed/simple;
	bh=IhhZhtElqBLCZgofeOR8qRjW4TmT51sj6IJP4uXEGgI=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=UUFuA+Yb25RqegEPuyiMklfqzeAUeKJ+sVkreTFCzHN9c1SJ5nlj/nQbt2GDSdTWFm52+x41QX3YnXYhnfGWf+jxyy7MOsa10qsMjuMSMjC2d9Txu4Hfvg9eo/YtIeB5DBLbHg8z6H80E6DjuCHG8CO4mh21Zi07m9ixmjyC2Nc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jO4w/dbl; arc=fail smtp.client-ip=52.101.48.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jO4w/dbl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YuRO0WiV4OXyzPxNoZy7UYfv40/IB/FF2378d8+ZekvIDAZbnLapckkj7Uga0iYwHvQ7CSsEwL/9Dhm6WfjBqGBl0a1Acv5TFGNo55n0CcNgWXAlHs9hQqaUP6H7S1EGFFZqf+foDrZZEgowRiBEhrtJlSXdZZ9suvMg0SP6TN9r0IaEuGzAmaYF80/sipuCdSohg/FKiAisqdzIaXE2PzR2dkLW9n1xPmnOOEqJhmhfVdfodlcpbehbuMNJ2P/wNtJwjgiU5zqHecJVZxltYI5JoW7e1G+BFwSW+SnfvNZdsvXHINHV7tFK2kAhj1MHAeeRYuK7Yi34LqaI7dJcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IhhZhtElqBLCZgofeOR8qRjW4TmT51sj6IJP4uXEGgI=;
 b=S5nNdrowm5pWY9bWtJ3glCSbT+GF+GyXzQ/QSD/xtGnw7gNKPTKmZaL+MwDJKKnMryDXfmqwn6WZVBYB3q+y7dYfFRhwguuV6CJ2iZ5UyKbA0cN7Bx5q84Ijx5bNDab+uGmmcFnlu/Nzf7jVTq6sh7HF7jkvuHe59BA9Xe0onzaUcAAgGBxOa3MMM0NMC6ytvl5nipbz9Pl8HhGWk/T+/HJphHev8qUQ+6Tpsh73FydUrmrrtDSumVB+NCWTB5IE3vb81Y0Qrv5ihg//byvQKQDCtF+Wvhd55o//Ix7hoTKuFzGGc8nMsCJEHV/RBo5NbKV8ggmi19vL4cxe92mV9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IhhZhtElqBLCZgofeOR8qRjW4TmT51sj6IJP4uXEGgI=;
 b=jO4w/dblMFzXHeM+uYsC/0ZX6KPDJ1QwbXYYoKp5rysYrfyi1CFGhhym5N5KawBoolbJ5rsChEcIMHAHGnBiz+eKzrnC0dUQ89XOTjYb0du+k1ZA3uP56Z+qKPHrw5ynkodLWBfJet9bidX+srm+i4OY6FDM6W5y7YsznQVJWN7VHXTHdqTeAruiYTmSS0iNBcgHaK2ojToFS53lA3kKDMBVHnLELWd3z97dvnlQuKnmKinRFxhjhgpJXpv1ux26w5ktpXNxEshu2vZDGVub31ukAzoLah3yHTMrhx57LewUbVkRTSROSUagF5o5gAcd8pbUXAkANzQRpgCZCed9WA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH8PR12MB9743.namprd12.prod.outlook.com (2603:10b6:610:27a::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Fri, 3 Jul 2026
 05:17:43 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.008; Fri, 3 Jul 2026
 05:17:43 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 03 Jul 2026 14:17:38 +0900
Message-Id: <DJOOJTFV8FE2.3UYVGM255LEAH@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Link Mauve" <linkmauve@linkmauve.fr>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Tamir Duberstein" <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: io: fix example in `register!` macro
References: <20260701160357.29031-1-linkmauve@linkmauve.fr>
In-Reply-To: <20260701160357.29031-1-linkmauve@linkmauve.fr>
X-ClientProxiedBy: OSTPR01CA0073.jpnprd01.prod.outlook.com
 (2603:1096:604:21a::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH8PR12MB9743:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d385801-5aa8-4b57-274f-08ded8c268dc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	5kNZvPg/QzX+0D9VuFAzkGJ8TrH3B6QMX+zkiTDwjchXIiOZUQu59ry4IUwlRais58m2PbiIPYBj7KYoa1HGPO3/1iwieCMajC+Lr1JIjfSF46SvCFT990LspGHgv0LlXCtDZ9gsr03rXQwvY1DIQ/wo2Y6dmA26/ySaJ2a8LuDXzvS/DwnXhxmwNRSnZaFJYGZ4K3kHA4r4onX+gW04TnzNP6uhcGeWn5nFpWoAWcxzpStMKJlpNpO5dTSd2AD3oq/WnxEVClKy2P4eYdWIICYzH/TSbVoJf7Zkby9dIeWk0LNXvubdhtFttV6/eU9HTS+RSiPqYa6q6GuyOWBUJnYDkKpnZg+RTld+qsasnMc2wEiH7HNaNcKrROiMcFdK5g1iAQeZUTKfDLWQ+U+di8CmRQG4wihOIdI3CQBKF5kaqZOlxLmEE/liD3/Tpa3bZ49VMyJ7fliKnfiYl9jRz5F5GdE4YCfuU8WzTvvwzWpvIMG1EWkikMGpdVPP+ysrdwqeX16IQV5FrAPSZxea9rr0qVJKx3iNJ3F/6IjS8H6hFbU5vdx7+NY5SK2bZrMteSiLu/BLpxa6lFkvXvepwLrqpKXFDQm85V9FkvuKphNFM3Oi+KyyiKhcqxBH4tmGkhYpGYUnri7ro0ut/kLeTU+JxzQXjq6xRuu0h4pjUaM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXJiTk15d2pOWGNUb1Rsd0wvUGh1U2NPK09kWmVIY0JFdWtGOGpUSysraWEr?=
 =?utf-8?B?NVRoMURFRG5jT1pPRHpVVUl4QU5USmw1czdQUmdBSUFiWHgvR0RoODZWRktk?=
 =?utf-8?B?R0JjWFcrUG9KaGNaY2RyQlV3MHdNSFRwVFZUbHUxOFM1ckYvVkllREprSllj?=
 =?utf-8?B?R3Z0OVdoZjJqUnVER2Q1RHRXeld1QmovNk1GRGVKVWxtZnlwbDZFVC9GSnN6?=
 =?utf-8?B?cHA5VmY2SWc0YllPZXNNdzB0amQzRFNLQnNWenZDc0lIYnR0Umw0ZWE1aysv?=
 =?utf-8?B?Y2hMeEtWR0ZNQ3FGRkx3VUxCNXNZQkFTT3h4RmZtbkJqWnN4cVk3Z3lraWp2?=
 =?utf-8?B?YnU3cW5QUU5YMUtEZHdXOEpFdUlXbjJ6V2pXVFNBenpOMG5JNjR4elhiTTNp?=
 =?utf-8?B?TnQ4OTY1THA1SnJyTENORFNsSDFPZmVWbkxUYThhVHhSMjlqeDA5VWFzbTlR?=
 =?utf-8?B?L1I5b0t4aGFuZlBzNmpCaDk2eXNDSUhUQ2JueTdMeVl0dkZMTzVKSVV2SHFv?=
 =?utf-8?B?b2FFTnBRS2JRUnFsZ1J3YXJOckNGazh5dFh2SFVFVmdkaVM4R2NPRDJSM2R3?=
 =?utf-8?B?VjhQbUpOZG1ESkI0bTRPN2lPL1BCM3YzS3pibEN4WFc4U0VZSm5WcGhna2M0?=
 =?utf-8?B?citTT05oaVoyT0RHVUw5MHVoRDlQVzViN2dETHZ3WGpYVjBuV0ZUMDcxdng1?=
 =?utf-8?B?WXZRanV3akxJY3FSYXhmejlRbVlUN2w1empzbkJ2cDVUREdQSURGZlVDN0FB?=
 =?utf-8?B?ZHIzOFRFSU9Yb2dzZlp4YXJyN21kQkQ2Z0NQVEhWcUhsVU9YZ1ZqTEcvTVV0?=
 =?utf-8?B?N08vdGZReU1pL2h4azVQbE9ISFRCdlVSQWVja2FPSkVXZTlENXI0ZjFOWWxT?=
 =?utf-8?B?T2FEL04zcHhPbFZ3QUlUR2xRSUJ5S2dsa0UrRnhLaGFyd0tjVHdhN1BnWGdY?=
 =?utf-8?B?T3NTOHNhOHdzYk90ejE1eGNmNUhxcndaRjY2UDJ6RG9rV0lQbnRybmdPRzJy?=
 =?utf-8?B?NGlpdHIzcUkrOXFKRVhkREZ5czkwK1ZSY2gvcFY0SGRwcjRLRFJtVEJoUG5Q?=
 =?utf-8?B?TlYxRVZ2ZGFMSkNPNzR4M1M0Tk96NndUdmowQ0NwSU1wcHMzWmwyUmFQQjZZ?=
 =?utf-8?B?MzJEZmVvQUNNZ0RLc2JTMmM5bEM5UXkwQlVZbTRha3JHVWN3TmZoR3dwa1ZY?=
 =?utf-8?B?N1o0SS9nK3hYaWxLSXVTVDl1emgvalZBc3ZJZHR5eS9HYlBSUEpuSUswRTJ2?=
 =?utf-8?B?U0xsZU0zWmZkc3NkdXJUQ0EzSHU4aFBiaHpMMG05TDA0NEhvcHZUQm5lQ3gz?=
 =?utf-8?B?OWFKeTJ3bjdiQUNjSGc3Yks5ako5eXZIUUdMOVNYbk0rSUhpNVZFOUwwNXdH?=
 =?utf-8?B?OW0wZ1B3eW01OUY2d0lnUGEyRzVFc2ZHTm5yaWRrVU5wOUVod0x4MkZGTXlu?=
 =?utf-8?B?bFBGS2szN3dzdGFBa3NIeUhtWlIwVHFlaWR6R1BIenhHRXFsZldZSEQxTk9k?=
 =?utf-8?B?WThJMzJIYVVxVnpMeWwyNlNGUDJ4NzNJc1hkZXNPVHNRckFhbFdsTjN1clo2?=
 =?utf-8?B?ODcxa2gxZmNEUU5BUmt1WW5Rbk8xbk1VZTc5dVRrckF3NFhMdE1zMnE4eVdD?=
 =?utf-8?B?Zks0VW5tUjJzS0d3dkFtSCtMUlE4TlZEQ3B2MVhsQlBUbVhhYzY3bnpSNGFt?=
 =?utf-8?B?UGtZMEhqaDJMbmJsQ00xVy8rcDB0YVA3U1ZMM1h1SG9HY3hKU0cxVFN5SXR6?=
 =?utf-8?B?LythNHpXUXZRaDc5Wm9jYllhOVRaN3EyQk1WNVJYbkJkMVBMdFYrVGJ1bkJk?=
 =?utf-8?B?NXczWnBTSVNReWJGTTBVYVJ1Ym14c3FjcWsvYlJIc3VHNDB4OXlvaUlnaEJo?=
 =?utf-8?B?M0lTNk56Rm9ORmE4WlVhMFhIR3c5Z25PWnF6eVZSNHllb0dBU3N1ZmVyVVZu?=
 =?utf-8?B?SnYray9SSVhQd3NYaEdFcWxwSlBmU2xSL0c2bm5SM0hmajVFWG5yamJMUEtl?=
 =?utf-8?B?UUMxNXhuT3dyblNqZGR5L1lpMzFMYzJuYzNYVDZQMGhoN0hyVENERXVHd2E1?=
 =?utf-8?B?ZnhCNHZ1YzQrditEeXlpVUl6bXZXS0prVzVKN2h5OHF2N1JtNVp3MCtQN2hN?=
 =?utf-8?B?Rm1xdUtRcFJWcHVqTkN2UFhSelpHTWdCTFFTTkIyYkxsWmNHNG9TS08vbVRE?=
 =?utf-8?B?OXpVdWxZeGMvSm1KZGlZMklZTXg2RFlPNklzNHBUT2EwSzdBM0lhOXBrK0Fp?=
 =?utf-8?B?OUQxQ2lLS2VsZTV1Qkpqa0hUbmhuRnB4eW9STlMzTWVJVi9TS0prdEpNdERv?=
 =?utf-8?B?bVN0N1pMeTBzekh5MkZsNy9ubG5mRGIvb0kxSEU2Z2xsV25CZThHYmNEa0N1?=
 =?utf-8?Q?1kF+/Ez+sijjNJpUHB6X8KlLDCINp3cV9lZBQtjdfgrWG?=
X-MS-Exchange-AntiSpam-MessageData-1: xl2rzCTSeOVtVA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d385801-5aa8-4b57-274f-08ded8c268dc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2026 05:17:43.4141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXIuIw02Mx0nGg0ayIb0DzSXJCvimxwABIMNxRIlKoM9lBKUHmc/sNi9qrIVPZGoRSqXDk46ReOyBhSK6eqd4g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH8PR12MB9743

On Thu Jul 2, 2026 at 1:03 AM JST, Link Mauve wrote:
> In this example, an u32 register is split in two u8 in big-endian order,
> but the high byte is actually defined as taking nine bits instead of
> eight.
>
> This is completely inconsequential, as I expect most users will just
> copy the bit ranges from their datasheets, but it doesn=E2=80=99t hurt to=
 fix
> that typo.
>
> Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>

Acked-by: Alexandre Courbot <acourbot@nvidia.com>
