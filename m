Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011032.outbound.protection.outlook.com [52.101.52.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3CE130C153;
	Wed, 27 May 2026 20:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779915111; cv=fail; b=gAJfIY4Vx2cpCuKecq1p3fdLgkp5+tc4WXaZ9oGBANWNbBSMfMJlZl61se+WqBMIpcCmkmDS+NOF0f2wHfuabjaPqOs0txVgVPj+wvkrloIF402OgH2uXfVL3nEoc71cpn+FzGHhTrCc/Aku8Bq7c2ZYDVN1inHQ/e0FGnor3fo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779915111; c=relaxed/simple;
	bh=K3AvBAOnF9Jcmb+WLu/T9r7SKOx972A74Fz0r3LXV50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YhT2V/cS7r7cJTclrPb85JquoG+82v2NUCuGES0+Lr7rjiYbcL0Af/Jva3LMOvxV1lgOJssSqHnHALKcqivkUaasHfrwsF0llEf9E1KcoUuN5BJnBueP1lL8JzePjsGjK/53hl3J/j2LxSHhYZanMiGbpElMDE5lVgYegAZU20I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QHm0wcjj; arc=fail smtp.client-ip=52.101.52.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QHm0wcjj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSp3EyioznXU6lFDhFiU1jlh12O7ixFAFQlPh2hRDiDQPIf6TwmERi4fFg35Nwn74USmb/bhVvVzx05C+eMq9JzD431wCJUoj43rKuCnhheZCSNOcNMyNyF6WUbBgZ0flSiLuzVOSWmS43d5sMGSIRMSaWGgg6l36lAh2laQbdVOXwDOeF5KFmnL9xU5i2wE4AYC1YDeZJcQd778DjdE8IE0gE0U0iNkbr8cU4ROdD0eaGcypZKyqhQgkeqsOrZWzPkK4IPOXVzMRTWz9fO0DrfcbahW8rrMnpd5xdKZQpb+bYVdEYkAVnuVpcDPn8PKlSDMgcRfKDzKGoWX0rfmFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C7OMoYAuZP9dcYhO7S8w/qtg88r0HuZkB2vcQ6OekJw=;
 b=R0FPLcccpsHsOfrHJkGcP8k+uKktK18PjFcc17IoMkk/CjByGkRep6CabLYxV/+LrushhZl8vfBAN9mS6y/4lnQgIhgbO41tCHakbO5o+WLVaLKU8k1iO5S8im6juostlLEtgQ14F45ssqUkO7PfBTH0K2uCCBqJwq9uMIEhzIs+20C5kvmpnSMJKdr6zDm7eMKpn27GyUhtlHyZ3W1s3f+tv+bw9bnyS36uhckk6EWMZhK6oBKrQbnrFlwJ8PvHjKmU/Fd9Ad/BI3NFpJUw9e4k+yj0r9PeJaF2HJHL//073WeWbtW8XDyPAOXr4S8Wa1aD+LV1j4pK4wKyudjspQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C7OMoYAuZP9dcYhO7S8w/qtg88r0HuZkB2vcQ6OekJw=;
 b=QHm0wcjjbOJzKI/2uGuV7aRaxnNIGS+vGXvDnIBJlmgfWtt1UL6t+Ij9WZhMkLoEsRJlptO3ADqUogX9JdUBs+2sKdp2iyEIlhlZTAVy7iwMtm9A/B+YYAH1FmK3Nfag181diUlpUZuFiGa7OOJ+t7JZFjqdxy+EYEMRSPvY6ICI8zg/e4NxY4Yvozoe80xgwbuJxRnjtvfQcw2NG8kYlqt+ONmcoGrSCEpTzGGfOxsm9y2sjN8FrLbaHr6Db5iC7vI0GB/BR8ZtAHgzdpPxUJLp0ghQyey+LAqgwAwTZLQQqy25LdELdrzGN/JefPUj7tK40k77K/VNx9BLaY8mKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9356.namprd12.prod.outlook.com (2603:10b6:408:20c::21)
 by MW4PR12MB7167.namprd12.prod.outlook.com (2603:10b6:303:225::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.11; Wed, 27 May
 2026 20:51:40 +0000
Received: from LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286]) by LV3PR12MB9356.namprd12.prod.outlook.com
 ([fe80::1c36:31b4:c420:6286%5]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 20:51:40 +0000
Date: Wed, 27 May 2026 16:51:37 -0400
From: Yury Norov <ynorov@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	nova-gpu@lists.linux.dev, driver-core@lists.linux.dev
Subject: Re: [PATCH v4 3/7] rust: bitfield: fully qualify types in macro
Message-ID: <ahdZWR7xTJYgamy_@yury>
References: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com>
 <20260527-bitfield-v4-3-e8821d4efbde@nvidia.com>
 <CANiq72mSYh3TbVHTUvze5vs1uqJ0UxTBUDyUwPOdzPVRsLiRbA@mail.gmail.com>
 <DITI5K1PSC3E.PEYYIBWQCW38@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DITI5K1PSC3E.PEYYIBWQCW38@nvidia.com>
X-ClientProxiedBy: BY5PR03CA0027.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::37) To LV3PR12MB9356.namprd12.prod.outlook.com
 (2603:10b6:408:20c::21)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9356:EE_|MW4PR12MB7167:EE_
X-MS-Office365-Filtering-Correlation-Id: 2176aa19-8355-4b37-c6cf-08debc31c0bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|10070799003|366016|11063799006|56012099006|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9NaPpG1Cq7RIrgeNYvy3DGi4VUpxRYyDKvPRHwv2UIYxsQwfuLBo0lksbOWx/rxkFZAXV8YilMv6n4WsJX19qBxTyqCqOGE6j2ajlf25AT3ZYkuvbxi1O5JijQWOKANaevRnxgqoSSz2odOuBhjVHqYezshFl109RBTPnLzwAq5Gj2Ch5ikAllnkrOb0wjyWBbfGlTnM+O2z1QgpYblolGYM78IB7nY4KtLVM37hVgpyzsy8IwmWik036fsNSLX/jZ2+u86gEh+qzO000mocntHAdwMi9tLH6z1VNWkzQHFpUon6CPm1q/C7BIahQ5kHge/Pq6Qdnl4UKjKUxO6b7v7MbDZJQBTFrTXYtGjaopEZYW6yAkxdiNqcw3p3g8pEvqWhQpga8D3UjDtn423JaAYX0a0rTV46oJ+JTOPlRsuJkSWvds4+GYHasYvkhbBNoSVN7VAVhhnyGUXb7cNat2aLTU6g/1eKVOvWIRIA1vke60m05ngBftC4rDUFTZ7590OdvS5vtLD2c0kqXWc4PFME4fu3OQcAGjVelpOVhklRMP83o5wzTtaii600Yo2pQ5WHPVKvHg0tap/qEpf5xFSBr1xGbcMWn2m1eucyvC2ASJeipwi7sSaSGxZyDK9eg1BWP/cvMXDPEtogU3eFguvV4rlRRuHDhreqVwMSGKRcKloSmYtE5qQJI3tvNVfu
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9356.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016)(11063799006)(56012099006)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bG5VNWdveFZkWldjeEN2aXdiVnZXRXJCcFN0eXZhV3NscUNYWDBRaUlybUZa?=
 =?utf-8?B?d0NxdXRIb0JqLzlEVXl2UVNNV0JTeTJpMExkK3p3QTBtaWkzY0pRN2lLZ2F5?=
 =?utf-8?B?U0lSY3NKQ25VdldudE1kbFA0dXMvVkp3eHRaOS9hc3o5c0x2cHZuOTlqdTZJ?=
 =?utf-8?B?L3NJM0ZQS1hqN0FqeU55NzVEZ0YyTXFGOUpjUDJ1M1BwU2xVM3YrWG9BUEpz?=
 =?utf-8?B?SzhjeTZobis3cVhnMTRQNXl1aTRqcm0zRE5USGkzY21zWHdIbHdLUlFPL0ZC?=
 =?utf-8?B?Q3VWK3ZVZmdMYXAyRW5BQTI3M3oyY2FQejhyaXBoOUsrdTcrNlovLzNZWG02?=
 =?utf-8?B?aUpXYjQyRWcwTVRvS05iL3l4UEhXUkFEU0lNWVJPQ0R0cW9xamYxbjhmV2Nz?=
 =?utf-8?B?bFMyWWUvQ3NsWkpPOU1wdm02TzZhNUZ0SGowcjZaZTk1N1FjQ0xNMXdnYzll?=
 =?utf-8?B?STNVR2xnejB6cnRDWElHN0pHaWcxTGo1Q05ManJjWVRaL1QxZXp5ZU5VMmgr?=
 =?utf-8?B?OFFQOGEzOThJVHFCSDhZWFB4Ly9WdnZGVW5XL0tGbGxsRkVveWZQTTZSWEpn?=
 =?utf-8?B?WEMvSEFtQTFMbStGSCtqVzBBN0pyT01FcFNDbEhHNVdmR0dzeCtzazlKeWMw?=
 =?utf-8?B?d2ExUGRLNko3Z0lNUkMwMDRxcU1UL1RZY250V2kxQTkvZTUwanB2SGNLZExm?=
 =?utf-8?B?U3prWVl0d0h3OXA4b09ncHhKRk5HTWJRdkM2QmxQYjQxc2M1VG5xalM1dEQ3?=
 =?utf-8?B?QXVXaWQxYkFoZklaY2Z0R3JLTTF4ZUxkVS9PTGozR3VqcUVTREdrcFBFUXRI?=
 =?utf-8?B?aWhJQmxNOFBoZG9ySGp6QkNtTXpMWFlNSFp5WTZHdDJ1c3VHK2ZyUkFWOFU4?=
 =?utf-8?B?VHhoR3VydHlMcnlkOGhFa3V0ZXd6dGUxdkNvTTNZNnBWWkJQcEIwUjhMNGQ5?=
 =?utf-8?B?emVxaW42UWlNc2t2UUFiNzV2ZW92NlR4bW1XeHkwbG9menRFYXhCckVOZ0U5?=
 =?utf-8?B?ZWY4b1hYVzJqaDlIL1p2cURrS1Jxa2t5SDNGVXhuZXRnMHF3MlBQWTZJc0Ri?=
 =?utf-8?B?MTZXbFA4UmlKZVl3UlRobGlRZC9kc3lEZmcvemdEbzFTS1VKTFNsbEsxRGhB?=
 =?utf-8?B?NExBNEUwclZEQzcya0R2NWtRejA2M2pwUEt5Wnh4aVFzaDhvRms4cC9iNVB5?=
 =?utf-8?B?STNYUGZiTlExYlRva0FDL3VpcE1leERGZVpaVldUNnJFa0xqeEprcnJyQVA0?=
 =?utf-8?B?WEJUeG9KVlc5MFhqQ0V5TzJ0cUdya2c4WityQ0RlRXJlZmZEV2hMWXFON3lx?=
 =?utf-8?B?Q25PcHY2RVJ3MUFtRlB5KzY4MHpraUpSazAxMzFIOEE0a0FNK2dvMFhpQXhY?=
 =?utf-8?B?Q1ZsYytTRUsxUlk5TG9nQVZ6Tis4bjNUc0MyWUlSVnpjTlpSMmV0Wkl6Tm5I?=
 =?utf-8?B?VnBtazd4VWdTQ2RHaEVWVHNOTTVTMktmZ0JSR25WL0kvdndteUF6dEZPUnJz?=
 =?utf-8?B?YUVRTklCa1dlUWtxeXBlZFpoejA4TGI3RWJlT3U4Wm9Zc0tzWC9kUDZDTy9C?=
 =?utf-8?B?RUt0eGJ4cjJxQTJGclQwSlhseDBPYkdCc21SbFRSUDhWU2RqTldiRXRKNWE2?=
 =?utf-8?B?QWhDTjNCREdUa2ZLRHhzSjY4Y0xOcmVWcHAyemdIbUtJVmsvMm1sWmhnak9H?=
 =?utf-8?B?UnpIMzFVR2oxSld6RGNJSWRlNmw0cXE4QjdwOFB3VWNVcGx5MnduMVdHZldQ?=
 =?utf-8?B?MlR5NThNRGxMUUh2WVMxLzhxZDJ4akdQZSt6M3NwaFZTZFFrVkp5cVl1SHJz?=
 =?utf-8?B?NzI5Z0RUb0VnZUd5RlNWUzBzSGV1T0hSRVFhbURDRnJSUGFkVHEvQlA4bFov?=
 =?utf-8?B?WURRMUZPRkZWZ05VWlpFOEVyUjhaaWh1STBydktVcWNZZ0h0TFBOcENjNWJw?=
 =?utf-8?B?bFFGdkNxbmVkamlDTXVyc0NoNFhPSmNRaFJyMWdGYXpSdkI2L0pvb0E4dnFv?=
 =?utf-8?B?Y3BvaEtjQjlnczg1ZGNWNDRubThBczNoV3pqZi94dE92Tk1qdFVFNHlSSEJi?=
 =?utf-8?B?Y0VEWVJxUW5vcWNBbWkyT2NMaFJHSE1rR1poV211N2Jvcjc1cnV6aGVvbDZ3?=
 =?utf-8?B?S1h5UklTeUY2c1BUVzZVa2VIT094ajNHZENWdHVIYmpUMnlPUll4eGIrRU5o?=
 =?utf-8?B?TjRRSDR6blNVVDVjV1UxSHpkY3Fnc0hFOFVtVUZEOEZMWkpBOVdIcDlmSWFC?=
 =?utf-8?B?eG53Mit6NHQ4T2NuTGxGUXNWb0VCTmJoQ3pRTjU2bzdjclZUSDAxemE4YUh2?=
 =?utf-8?B?Mis0Yk5XZE9waDlab0Eybm5rcEZlOGpzdTNaa0ZSQ0RqUEJLMmJhOTZQek11?=
 =?utf-8?Q?sL6Nf9dyYRcFwPf7W7bJO4/htkpX7jEc6C/iV?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2176aa19-8355-4b37-c6cf-08debc31c0bd
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9356.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 20:51:40.7521
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ggg8RwXGQZT0h4SA/wF/9DSmHsAW8i8Q5tB4IAi+rfwb2rk81OS16+QnQwIRDuQoP0+fsiy7mLYGn2x2dPJD6A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7167

On Wed, May 27, 2026 at 10:44:16PM +0900, Alexandre Courbot wrote:
> On Wed May 27, 2026 at 10:24 PM JST, Miguel Ojeda wrote:
> > On Wed, May 27, 2026 at 2:52 PM Alexandre Courbot <acourbot@nvidia.com> wrote:
> >>
> >> These types were not fully qualified, which could cause issues if the
> >> local module shadows them.
> >>
> >> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> >
> > Should we fixup this into #1? (on apply maybe?)
> >
> > Similarly, for #2, I guess it may separate to give credit to Gary (?),
> > but typically we don't create extra commits if it is still not landed.
> >
> > Or what am I missing? Perhaps they are intended to show the changelog (?).
> 
> The intent was to make #1 a pure code move - except that, upon actual
> inspection, it does not move the code but only extracts it, which weakens
> that argument.
> 
> So yes, if you prefer it that way I agree that squashing #2 and #3 into
> #1 (with a description of the changes in the commit log) should be fine.

Both ways are OK for me. If you decide to merge the patches, can you
explicitly list everything that is not a plain move in the change log?

Acked-by: Yury Norov <yury.norov@gmail.com>
