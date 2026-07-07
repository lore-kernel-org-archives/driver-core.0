Received: from DM1PR04CU001.outbound.protection.outlook.com (mail-centralusazon11010031.outbound.protection.outlook.com [52.101.61.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F2183F23C5
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 12:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.61.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426357; cv=fail; b=gavL5I2qmpQJF1Qy1EuownsTTbvvvIhXWb7YeUSdURPZ7ABZrMMbtDsoOQZq5ZoIz5kPMS4l6urEY0YcxV2RkIqgJ2CwS6bguu357vne/DA7r4GKPddQJC3SHa32GBrecyfwAX/C9FmXvyNkQRTs6dR6JQ3bUsHX1LxDKqyXkpo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426357; c=relaxed/simple;
	bh=hb6/4oOuJZl/OcwANJ/oPyJvwPxVxXqJ0Vqeq6+oUGA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ZyCzNPd9k9pHcAoWH0BBYkvDQ97vHi1FnyF7AWifqqQlMmkCklFFgFHVlAgWJj1poNs3YhKE8vQOVAsC0sMVJEdLf84wfhNc0PS0ITbftToXMGmfnjJ1sJD2bL8e8SLzEt1ygEtzUF5z1N2c91onTKmBilhqyLVpyE/GRc/PBIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IGebAzt/; arc=fail smtp.client-ip=52.101.61.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IGebAzt/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e1H1uV6k1A1002Bb55c+x4zQH/AEiUNSHrjX3pYqJ770VRTr5WzBpGy1cyYFAFgGxHnCJy+n6cMezCORNE6wb4ipVzByLWG0iqSn2FYweDNoGzr5Cqtxq32GUb/gKHui4znWM0ZRUItxZ/7lhbKBwLtWQWN6e+om3qdmt/jhGQ42uP35n868Ka0NHChGFdDed88NLjioj8LbSwvoCeqVicQ6rLIDf1lpSwTF9WOsSeTyWMalPp7kWgZgIerNJT5fvzSpry3UI+kiRpTMZFn3lKWEDCFmUxrsDiBjir1821sktMqBUSyGGL/+/C4R6dMxQnuOg132vU0UnLtB/isuPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RbjEPSTyYvFA7cNbU7nvJZw82pMUrnh18wUXSfxql/g=;
 b=rRwjPon4phkJAqn4DCdmvapsY+V2+qaOUL0XRiv2S4rcqUHHfowcYeAZ7vC2JWE9yInX+DEV0lJ6Ag4d+alkkKnKC51UgUDNxtADcQ1W1RnL5QMsoJ3ZtuLU6fKL7cIeLPL6R19K1s0bLa5mNzv8aLL6GtSvMtNhMaZI640OPaLVsjk7J97ZcCui1jCJ2g2jwKszM74zIU9HEro6kmqoikBvFxDnKT8ty8pN9Y0zbsqYzr1nk3o69BwtACmiuN0vorEp1ZGegsbTYxDNK8387iwzEIJBHrwvrjE+L+dUEdHJrT8wJsyAgy44gx1s1koO/wK9F+11JXrJGtEN/kOA8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RbjEPSTyYvFA7cNbU7nvJZw82pMUrnh18wUXSfxql/g=;
 b=IGebAzt/fdLGU0JfgjpJA64kkjEdJN58ILa0W6wMOYct4oGABRxaGMVf10/Ci3EhGl0m4J/eh+buDWmBkAEHXGqftmyFWIY5/S3kd+ivXciUZfeDc/1Od4sNVlTLqnfaX5P28r76amvz1OSem9++XMja8+iY7W4Pik/XC2k5YsK77mRJ9uk+O+Bo3EpYwRReWoeMHM/vItIGqgwFVBwzCmiYosROf/1/83MNsje4zI6cWvKfKH512vIGXNZnZ+KlGmg6ghK/+p0GiAzCZSceMHFqMsLapvZ+OPcOC5UewwZvIeq7gUEMwm7bUPbJKx0XwDo/FMGpIGdqhNwu078TtQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by IA1PR12MB6553.namprd12.prod.outlook.com (2603:10b6:208:3a3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Tue, 7 Jul
 2026 12:12:30 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%6]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 12:12:30 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 21:12:25 +0900
Message-Id: <DJSBVKGB5Y2C.H1NOH4NGA8ML@nvidia.com>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Matthew Maurer" <mmaurer@google.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: soc: silence clippy warning with rustc >= 1.88
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com>
 <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net>
In-Reply-To: <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net>
X-ClientProxiedBy: OS7PR01CA0192.jpnprd01.prod.outlook.com
 (2603:1096:604:250::7) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|IA1PR12MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: 37d682b6-2837-4a7e-db5d-08dedc210474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|23010399003|7416014|376014|22082099003|18002099003|6133799003|11063799006|56012099006|3023799007|4143699003;
X-Microsoft-Antispam-Message-Info:
	0xDXhU5DyIIQdgHrUBZYUa1taDAKFCbzVbWt/B0S/sO6gXGOCJeIn6yR4svqIi4Ilz3iiHi8BUyKeWbOnJQIs7+D5SuomZPMXEjJct9hyeDyKwYULeZOxyvja24s73ygfLwAoWQw7WltDmct1J5LEeBFoV5kFr9XThr7ahs0cWbZ23YH00VfoHvu6a09ObTyBdsgig6vpUV6HtB68PXQkPtVyqxds7yyf9JIJQkIJb5mRmXp6uihiKJmMKJWC4weZMadIO1LLQjVfmhxVEwy6nlnBfA96dbUuwi0NMg8mwFHogb24X1cM2774r5rCqIG0RfE0IMifBDH6L57JHE6LQG4qg/1vo7CEI1/GeSfhC/0oxdzDyq/8UDP97Sb21oMndmBwvKxg1aS2stXNum5djLbs2DV7MJugRpyDYOubv/3ORFBnZLdVRqvd0qGIrAlERZSlPZznHlGmKYzSGhRSdTMJ/m//sTkUqEupMCrJKMNoP1YM4HrDVlbGfbzujMXLDmDyc3saPG4l8t1gRS4xxCtWiOZutoDCGB10xFFakBegMCGA12wSmusdAyIyAsliNCi4aUdqQ6GOwUzCkOKvttQdOr5rWITBTFmCXJn8D0czBxhEWM7BYJR51hBOwLTOreHDnfYpXpg8x9NjPxBAFXWPYwkbzFbUunwd/yybpw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(23010399003)(7416014)(376014)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006)(3023799007)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ajAxeERqRDk2WkUzZytub2hpR2VVdnc1YXQrMnBpSHNCSmdReWZaZURqZWZL?=
 =?utf-8?B?VmlKNDJ0aUh1dVg3RDk4bFY1RWFNWTc5RTgwQmJDanFIck8rb0JXRTEveExj?=
 =?utf-8?B?SVhGL0VBeWs5M3dLOGQrUzFtK2c4R2VPem9xZG8wa0JCNFpTN0prbU5UY2tw?=
 =?utf-8?B?ZUFXaU81ajhmaGtMNXNraUs1ZUNTdUFPL0d5TnNLd3hVc0RvRDVaQ0E1M3pU?=
 =?utf-8?B?bk9vRXo0ZUhyMkxLSlp3aGJhR3c2a3lGQUFwTGswQVBBakU4eE5EbTk3Q3ZH?=
 =?utf-8?B?OXpPMWxWMFpHdnhQWGw5UGdqZ3Y1VTNvUHNWQlgzTHlBN3V3U1ZFR2xRV3pp?=
 =?utf-8?B?NXFDWFZHSXVKZU1mUlVKWkdjTVBYYVVRbHQ1Y2FHSGFtdDlyd3FKdnNtQVho?=
 =?utf-8?B?ZWJ1cDAwMTlreEpzK3ZnSDF6ZjlIdm10OUl4UjBIYWFWTHhkejNGZzJ4UzJr?=
 =?utf-8?B?TnZxL2tPR1Fkb2JPZGJNRzhrL2NHZGhCLzJETVNIV0lpVTI1dmFObGRXK1JU?=
 =?utf-8?B?eldLWjVaZXVIbytoQXM2MlVqMXRwa2tQcmhCZ3UySytGUCtjV2xibmd5dkFG?=
 =?utf-8?B?STVPUkJlbGUrdktNZ2lKVEI0bjJONVZJRVBLS01BY0lvMGJHNjBsSk5nUk4v?=
 =?utf-8?B?VkF2bGhWR04rOHovdm9CZnFHa2Z4RkV1ZVpValJZNTF1ZkYyZGtPOUNCSVBh?=
 =?utf-8?B?Q0xmYndzQU9kSUJuZVFSakV3blBZTXc2dDBQTkdsOFhvbWVPT2ZTOHloVmhv?=
 =?utf-8?B?c0NvV0ZUd0MwKzB2VGtoN3lJTlpMYmk5UldyaFdPRkdSRnB1Sllqb0E1clV5?=
 =?utf-8?B?aXovUlBTb3dUL2xLU1pxcVpBYXhxMGxiWFJDOEJ0b0hFZGZrS3F5dFdCV3o1?=
 =?utf-8?B?RGdTRjV0NTJzazFqM1M1MmRwRlpjUk9EL1Fld1NoWHVGTngxZUZhNStOQnVI?=
 =?utf-8?B?ZGN4MGRQVmpZUWhMVjduZG8wUS9SWHBHaTNZaE80dDZZa29rVGRlQTBPU1R0?=
 =?utf-8?B?WFZxdFhPUU9qWkhDMUswakhMTVQwdkFmSGw1elR4NzNGLzA2N2hrTXBKQTBD?=
 =?utf-8?B?N1pkSnRzT2Y3Zzd5Z0Z5L29UUVJmcUdvOHhVRy9ZUlQrNjRHWkFsaERDREFM?=
 =?utf-8?B?RlZKcW1XcDVPY2Y0emdQdW9VaDU3Q0tjTk9zRDFNcm9zTnp6aG9OUk5lZitN?=
 =?utf-8?B?UjFITVBFV1lIdk5kWWhhdHF4WVlkNXo2RkE0Q1hBZTN4UU9yWVJjSEpTOW1Z?=
 =?utf-8?B?d1N3Nm12RWNhY1pKeks2R3gwVFFsU2hFak9jR09neXkvSE00cUdPak0wQnhE?=
 =?utf-8?B?MEpaSjQyRkFHd2JEN01LaS8zNzg2dGx6bzNwVW1Pak1UTmZEVW9KN2dSMXc0?=
 =?utf-8?B?b3hpcVordXJoazB0aVdyQzk2RUlrOVFPcDVrR2k4QWlTYjBXRHVpb21hVlNB?=
 =?utf-8?B?N09ucGt0TDRTNWV5dUozSjJpWHMxNzJDTGlVV0grVkNnNW1PR0ZWbWlQTEVZ?=
 =?utf-8?B?ckZzSU1GdFV4dnZ5UEhxeWFqQTg5N0xzR1cwa3FIQ2xwWHFIckZwd01QRGYv?=
 =?utf-8?B?QmlNbExEWnJ4OVk5dy9RWEswdzJHbUEwcHhRKy9pWU9lYnV5S0J3U2g2bzVZ?=
 =?utf-8?B?ZjRuWk9XNlpOWlNHQnRSbkVRRkVndlY3eGR5WHArYy9sTDQ3SFBhSDFlTzY2?=
 =?utf-8?B?QlRYTmFMSFJDZG1hQ29yVGx3WDJuRnRlY2ZYWEY4c290OUZ1MnB2RWhXaU8r?=
 =?utf-8?B?VCt1NEVHTmZRVEpJLzBPU25PLzRzWTVFSEl3dyt2VmxlaUFQMFZRRlgrNElo?=
 =?utf-8?B?UTVHUDdyWFBsbnlkbVlGSEZzVjFOdkFvWjNvZE5yU2lrVE9hckJNQnRlaVdP?=
 =?utf-8?B?Q0xFZmlFb0pYNHJNQndFQ1UxRkdHUzd1YWlWZzFDREpUU3kwYlZRQmN5Mml2?=
 =?utf-8?B?bDNyeXAzZHhNV0c0Y0xkNlBQR0l2czZleUlGNXByOU1xUkZUSm8zMlpBRXh0?=
 =?utf-8?B?WGQ4ZmlHNCtEQ1daQWkvYnpvYW5HQWQ0NEIvdmFHN1RmclFiVGdTR2M1dDhB?=
 =?utf-8?B?eGIwOHFoeFIxMEs3ampxbzNjVktyaHFXMGJ4ejRWWTFCY29oVnpxc2pqOUpk?=
 =?utf-8?B?czk5djQzYlZ5MVNHYmVLSWprQ0NaWnRhbW1mSEJ0Sy9oVyswM2pNeUo2a1lB?=
 =?utf-8?B?Skw3VEdSMm5xT0pQUmZsSlZDcTNneWIxTFByTHpPcGdFTUNNWUpOVTl4eU1m?=
 =?utf-8?B?UmtYZ2l1TzVGQ3NvNGN2c3kxT3kvblNXbU56VmdzZGh4V2F3bjhuM2ZITkRY?=
 =?utf-8?B?dSs5VndiNFJXT1V2WVRHLy9QYnhJODUvNEdqditWMGFkY0FVcmJYKzhyT2lK?=
 =?utf-8?Q?4H/wDCEJCRjEPAi8y1llV8rjC5t5w5HhzTz/DcSkKHt8f?=
X-MS-Exchange-AntiSpam-MessageData-1: B05s5Qi9SLHEYg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37d682b6-2837-4a7e-db5d-08dedc210474
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 12:12:30.6878
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ExKIPhYh+XkIeb54/LWX0r4NbOssUy9iyqKgpPGROCtmHKSKuGnAOPek0Ty005/9niesoaf2Zo16lra2Uai6nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6553

On Tue Jul 7, 2026 at 8:43 PM JST, Gary Guo wrote:
> On Tue Jul 7, 2026 at 11:12 AM BST, Alexandre Courbot wrote:
>> The `clippy::unwrap_or_default` warning triggers on
>> `rust/kernel/soc.rs` since rustc 1.88:
>>
>>     warning: use of `unwrap_or` to construct default value
>>       --> ../rust/kernel/soc.rs:66:10
>>       |
>>    66 |         .unwrap_or(core::ptr::null())
>>       |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `unwrap_or_defa=
ult()`
>>       |
>>       =3D help: for further information visit https://rust-lang.github.i=
o/rust-clippy/rust-1.96.0/index.html#unwrap_or_default
>>       =3D note: `-W clippy::unwrap-or-default` implied by `-W clippy::al=
l`
>>       =3D help: to override `-W clippy::all` add `#[allow(clippy::unwrap=
_or_default)]`
>>
>> Since our current MSRV is 1.85, we cannot fix the warning as
>> recommended, so allow the lint on the `cstring_to_c` function instead.
>
> We set `msrv =3D "1.85"` in our .clippy.toml, and my local testing with 1=
.88 and
> 1.96.1 doesn't produce this warning.

Then I guess we will want to understand why I am getting this warning
locally. I'd also expect the `msrv =3D "1.85"` to prevent this from
happening.
