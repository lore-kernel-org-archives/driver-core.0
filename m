Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012052.outbound.protection.outlook.com [40.107.209.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D6D30C35E;
	Wed, 27 May 2026 13:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779889473; cv=fail; b=fMPo/4YAeuZu5F222KpDfowMLb1AhYaVWDGHNgC3nUaM6Hp1RP7pE8X14rOdpyKx8LALnWIA+glQkrpUOxx2B4gRLVTrF8rP2Of+dM1VqOSGn1XbLMFfyWR+OQKKo9rK8yRm8CuAkCiIB5Xti8i6Hu4HNbNmCU+OcO1w+Mt3pnM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779889473; c=relaxed/simple;
	bh=DlrcLO9w1JDqbbLeRE8jsKyTkoBEzzHrr99Dvrt+45c=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=DpismLPYu/osDlDXXX97WMAbYxy925ZC6k+nWm/LB0rIEq34L2GEgTAF/s8aSmbJ91nBegvKnKg0nwxdYnFGxLPYhl1qGhVnWq7tp9On0y7aObMf0ED6ttXhDNeLXXns+YSpapVTtoNFpPF8kXU50RXFzaBCeSsbquzoPOKXuVY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OtFkuREs; arc=fail smtp.client-ip=40.107.209.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OtFkuREs"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uz1HIiep0qXR4WTQLmBpmo1smJMkaFU0a9phFKmyOCCDgIR7KTNL/XDkjOB35g15MV1FjKFiqWqtVr+J4/dbSFEEFwcgGvykY2KXWInv5OrvkyipxbyPycj01KxWqbWyZkEGD51b5cBqzxo5gj3AsE8nAhXY0ZMwEVXwFYzSyy2UMd8DRcWQ1DMC/itewKy9h5vG2NbubQSMh7YeFtflng3dR3WXXR48x8gWABLTdGQgn6VH89uZL4FtjZNOcXC2n9iTL0sT/Hth9cD/Oy2+quL9m02IgairmlPKGTapnSfgEox98HYFslzPQuSeEs8q2DL/TXjAhH7Loyunit4b5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DlrcLO9w1JDqbbLeRE8jsKyTkoBEzzHrr99Dvrt+45c=;
 b=mM+r7f9pqVevqWdjW6Sus/THp7BBAWuooI42nws4IODQh6SBp07MP4rvnPE6bYPYI1xCTfq/7GrsbHP4myN00VbA4Tjdxxa9m3aFSyiUH9Tu/4fi7kV2fN/Y/LHCh8LcBtAmONcDp56fTnEuM4h2VJrsV+sSCnlLwVZDIPftoASQOoQ4Np8mLK+7C2u85acb8kuJCOH/ctUQ3TYvwnrfhW5IniXXuogsTwSP8YfsKGRv5uh9mWNvmwYNAAOKSZhRDRDNLXVogS/wZQ2vhzWIEo7VFSk+yoTy4RMy5fkcQWwU4vySJtrxg/cZBogRRykN88IUoMsSxLmQWDfC89tkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DlrcLO9w1JDqbbLeRE8jsKyTkoBEzzHrr99Dvrt+45c=;
 b=OtFkuREsrZSFCrf9mMvRvG3voLD1l7ln+ekM8s2aHhArrwNScksGaf7Qw1yTEKtsRWtAvsP21GGUQvysh7VPO7WLqYmNZvKjeS+6SObr/d0/P2zdLm4DjuU0Gg2MvwtJonrtkpVdDgM83JxRHHlr+Od6wxn+l40jL5Ltyh39Sc8pd00ogjDhExfWKV3HniPM3KJuKqsMLDpRSY9BNp4cXb7zULZYGXQID5dz7TME2ZMY+5ZhwDSRzoFbcxzdZTbVWzJgeuv4viaNtVvErnj/9B2KBmO9OHfWs8PZCIsYg4h/M+GZsujs8MW8hUGxYSuBFJLrDwq3CHjYBWwal08PZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7626.namprd12.prod.outlook.com (2603:10b6:208:438::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Wed, 27 May
 2026 13:44:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 13:44:20 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 22:44:16 +0900
Message-Id: <DITI5K1PSC3E.PEYYIBWQCW38@nvidia.com>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair
 Popple" <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <driver-core@lists.linux.dev>
Subject: Re: [PATCH v4 3/7] rust: bitfield: fully qualify types in macro
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
References: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com>
 <20260527-bitfield-v4-3-e8821d4efbde@nvidia.com>
 <CANiq72mSYh3TbVHTUvze5vs1uqJ0UxTBUDyUwPOdzPVRsLiRbA@mail.gmail.com>
In-Reply-To: <CANiq72mSYh3TbVHTUvze5vs1uqJ0UxTBUDyUwPOdzPVRsLiRbA@mail.gmail.com>
X-ClientProxiedBy: TY4P286CA0025.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:2b0::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7626:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c87add3-01d6-4725-a654-08debbf60d87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|18002099003|22082099003|11063799006|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	o+Zh+bjS7pG75u3esej2lwSMNaXC2qOJ5H7bYL1hTJQuisJ2Km2SMDlO0opsTvSwuijqJ20IJxkWEn2Yh0IcObz/EkEX3liBk89kNh62p+Y93YRxrUCYHC9CdYELB0RTSEzhzTFStYA/zuSHIuBeW9uTiZt75dOw/ssc7upTGENeX8h1QVzhM+wusZ8W+y2QhikkUnXrgNhZ55sL3dmUJttYwpWNVXrhnadLzDvgD+ObHNQNp8o6y6jtm9VnZMl//EKBH931Pz6hkCUqgD8znkPGqDKEGO4BViYmMfT7mbPhTwPhoJTKKr7vomt48SGuwMPIFsPGeYjJyRKD3lwd4nZS+hPb1ErIIXUDMfgkTcIyagar00hWi1FvmNlbYqAwxALtnqCkUznLTNBymGXPkuKQizNC5f4xntWzKnoWW21ElJU1ZPK6519IjTYbipaQ9Ro+Ufcqe9wuPJATZ+Zw1RlexmYtQHgdRz+SHu6dlGdG06xAo0riuT16UQp7RwRAeu0YzM23DfA6jcKS9cSZlVQ4hZivy90eWNra5+t8eiIlZtt/TRcc0YEEXzVFkz3zvh4mH4i/2fziHKWPcybtYKq4s9gvoyNWQnMDkpDioF6kx5gInd/4rBQGfHcmPKEh4EB1JbquwpKlcTOwAdoiTLf5fC7tQf6SZeHXKIhw2V8T9GykU3TWC7bGnnC+ctqX
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(18002099003)(22082099003)(11063799006)(4143699003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVU2Sy9SOHlYZUFQUEp5Q2FQQzNtblAxclZUb1lzbUJXN3V0Q2d4ZGNBMldK?=
 =?utf-8?B?TWFaeG1FaGZ1U1pBdGRDVVJyWlVWRlkvMUVHYzlqOHE5SytHUGhCVEZtWEtj?=
 =?utf-8?B?alo2VnRxeU1YTHZYUGZsWUVRSlFOdnV1VTRuaWZwaFpjUGVORmR2MlBycjFW?=
 =?utf-8?B?UzJPY0FJTUNsa3Z1WG11elREUTFGYUdOUjUrSE9KbDBBQVdidEdzbC8xV01P?=
 =?utf-8?B?UERORnJYU2hwL1JWd1BBYWZmc0h3azVrRkxnVUl5ZnA5NkVjalFBV1EvSEN1?=
 =?utf-8?B?blZUSDBpZUhXMXdqK0EvbzM2OXl6UWJ1blhHZ3dtUGhnTmVSVWtFZERuNmdq?=
 =?utf-8?B?VHE1MHdXU09kVGhWZkp5WHA1Q2N4ZGdNbmtmdlZUYWt4RkI2ankweU5iZTA2?=
 =?utf-8?B?dkJWcFJYU1R0TnBnVnRDM2JBYmJGUk9ySkZUK3c5a1BvVE1VaEltZExnTWJZ?=
 =?utf-8?B?RVJsYWF0VjJ3UzZ6Mi9HbzRHc1JRQWNEa3pLY2tsMG84dEZsMFBCMXFsMHZD?=
 =?utf-8?B?ellwUTlUNk9Wc010KzIxeEdtMmdpVFJYRytnYUdCS1Y3TVBodmd0NytQYjBK?=
 =?utf-8?B?bitLNnJUVWttNjQwNmwyei8rTUxQaWsvZ0JuTnN5dFp1WVpaVXRrVDV1Yksr?=
 =?utf-8?B?SStDZGY1RCtkQ2l4cnJwMllhaDBXQUkzdEMyZ0s2eHcyZTd4VmhsbjBqT0FJ?=
 =?utf-8?B?cUE4eGswMzh1cGQ3NzY0TnB3bkMwL3FRS3cxTWJseVpodjBZUHFCZ0kvUEMz?=
 =?utf-8?B?RkpsSGhldWlsTk54RVlmRUR3MXdvZmkyNE52WkZRV0YvbDdPK2k5U1V5aUM0?=
 =?utf-8?B?bjBscUR3bGk0Tm5QeENicHZoa2ZlOXptZmNpTHJOdndLZUQyd2FkQW9udEJD?=
 =?utf-8?B?Rjg5aXVRWUsvbXNOL054bXZYMW0zR1RkNXFxNFlzV0ZUbk5POXlHdE8xSmFP?=
 =?utf-8?B?SmpJR3l3K3JIQVBQa0twTFFGblJNZG9MR2dteGwzeG9OVEkrb2Z4VDZhZldj?=
 =?utf-8?B?amxyM1NibVB6Q05VUEt0YjkxNE15TnVtUlhmdmdXWFU4U29sWTVFT3M5elBM?=
 =?utf-8?B?dzdVeEdHUVB6WjJhMC9iMk40aElLYnQwODMzbThXNEJhN1dpM2Z4WWM4cDBr?=
 =?utf-8?B?bDJCSTdOTE5oU0pCLzA3Z2IwSXF3K092Z2ZyRG5EYUlZQTc2bVAxWjdkRW9B?=
 =?utf-8?B?M3NWcnNLOFRGZzVueU9Fd2gxVW5VTUZJczZvNkMyK3N2b1hmVDFxZzdkRlk3?=
 =?utf-8?B?RXVQbUl0d2xKNTJiYmg5bDBPYXhodm1lUC9GR0xRTkl6UkJBYkpPb2FVN2Na?=
 =?utf-8?B?ODhLVTdPQm5hc0hlUmloUXJJT2lIK1BOM2dRZ3VMQ0JvZVdCeDdOQ1R1aTFt?=
 =?utf-8?B?c1c2TkxtYVZYVTQvZkJwOG9wUWNXYzVMU2lCRC9jZnRxcEF6L2R3L2pBclZD?=
 =?utf-8?B?TVhLK042ajlvSHplTzlEY1kvNE1vNTZMdWZGamhxT0VpazNOdDFzRWNiQWw1?=
 =?utf-8?B?Nlh4VmVXR0xoVjY5d0c1T253cXdtdGQyY2gyL2J5YXhzYUxUVGEwdWJuL2NE?=
 =?utf-8?B?UTI3dGMwa3NaSnJDRVUwbFF0OWlNQjZWSkdTaGNJSm9HblJjS3dkRnBQWHUw?=
 =?utf-8?B?UXk1ZEdBczhYdmN1UXlMY1FHM21kTVdwUXIwTFBzQTFMOXIvRExuNWk2Ukpm?=
 =?utf-8?B?T280MWRGSXlJTFNhOUtXTWJUVVNXOTBJYXBjcnI0VFJTRkxIR2tUZjVuZ3Rj?=
 =?utf-8?B?MEk0K2UvdkVXVVU3bmE3YUtFTGxzMGIyN0ZYcEZkTVpJVElIVjZvSHpUT3U5?=
 =?utf-8?B?YWs2TXdvRjdiclIrbUdjLzRJajhud2pRU0VYSWlZRDF3NEZTQVlka0lGdnlv?=
 =?utf-8?B?RUNoN25CT29Sa1YrTXpaM08xMDgwQ3lZZW5YVTc2aEl3MTBxQ0xWOU5md1dW?=
 =?utf-8?B?RnFJdmtYL1RjM2taQkprMTIrMWpDWWQ4czRDS0VCM2RFWGVnbVFraFFqTDMw?=
 =?utf-8?B?TmpMOUdOQzlXSmlDOWJudXE2THJtK3JseGowbWkxY0tuTWk0OG94MTdGWHZO?=
 =?utf-8?B?NkRKcXlyL0E0ZHRDYTJucWMvcEx1WTFCTVI4NHhDai9TejhvNWhwRi9hZWZ5?=
 =?utf-8?B?d3B2ZHE0VWNCcEFiM0gycUdhRXB4VjhGU09nUHRkYWlWN1I5UnlxMjJ5ZDdn?=
 =?utf-8?B?QlVhM25CRDZ2U2Q0a0dEK1hNUG5ndXQyV0RqbVVZYVdiWnlwR0ZwbjdnS01r?=
 =?utf-8?B?TG1XSk1yRWk4YTljVkxtemNnNFR2c0kzSjlnclJtWWpUNFhpN3pxMnF5Z1dq?=
 =?utf-8?B?L1N0Q0E1UFJiT2Urb0YvSlhHWnVuK0pQdWwyTGNRRW01Y0U2UStLMThTQ1Ax?=
 =?utf-8?Q?PMUMvoc9ALLuP+9VhNiPTKHiDVyBoSDtBJ8VaLEUh+FGd?=
X-MS-Exchange-AntiSpam-MessageData-1: 916kruXkEukLhA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c87add3-01d6-4725-a654-08debbf60d87
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 13:44:20.0294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K23kHNf2WnByg/cxp2Ep2+P+9qIOb4mmg7EOlPhIqSQYXUl8XVuUWIvvMrn+OtR9mVhPnDwfMzvY4IH9l9aUfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7626

On Wed May 27, 2026 at 10:24 PM JST, Miguel Ojeda wrote:
> On Wed, May 27, 2026 at 2:52=E2=80=AFPM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> These types were not fully qualified, which could cause issues if the
>> local module shadows them.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>
> Should we fixup this into #1? (on apply maybe?)
>
> Similarly, for #2, I guess it may separate to give credit to Gary (?),
> but typically we don't create extra commits if it is still not landed.
>
> Or what am I missing? Perhaps they are intended to show the changelog (?)=
.

The intent was to make #1 a pure code move - except that, upon actual
inspection, it does not move the code but only extracts it, which weakens
that argument.

So yes, if you prefer it that way I agree that squashing #2 and #3 into
#1 (with a description of the changes in the commit log) should be fine.
