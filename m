Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012028.outbound.protection.outlook.com [52.101.48.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55432379C37;
	Tue,  7 Jul 2026 05:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783401023; cv=fail; b=cLfyNPMGKclSRRDY8V/jE2/BoYyjq4Ijw08JNq50EJ8rzVvwY59c1IsNfodp1rEcP0RcEe4FBeStbb12G0ic/bHh7X77aWEfPsDymmqDzgs6HPXCG8aDs+uFBWrJ9a8RM4ha/sh9ZBVKEsm6c9O+lZ8BlZ0sRkMvAHBlj7pkJAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783401023; c=relaxed/simple;
	bh=miyEuE0h4ox2X4cClvgUnIUVaOHGrT1xyWNrJi7Xy/Q=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=q+wL6u28R0CKNpI9hEGmG5c3xydQV3TSD35KP/hBfVwuj1zjBioqOsCp5vmm4ZsksobwDKNjp94x27qGvYVFS1y7AQvZvyB5/p3jr/J5snMqL4uRmhyfJhl+yuNtC57sfemNs7G0thDU/FyCmUmOsf+yU068yyVOJzI9BRslyVk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=oucBOtj3; arc=fail smtp.client-ip=52.101.48.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="oucBOtj3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Au9Uj4Snth2yeFrJaDUCEd53oY1angl0YrdW0xDeTq+D/SScuIIeoHl4jleIks1T2no3afVAiLPaqs30rAFaOdxMep6Su4M8/dohuTXtsB0cQO+7au7luvOJewp7DqMyVp9jcFuV6s3eBwEQW1ebwW96OvhrpHIFc6Bosq4x3uR/KH3nxx/6fispSJxYH6lGJX5tG6zkcdpLTVfTFAfzvAj2A0DYhMr3uWbbpAUqMosMngFmMClbzPLJnn95O8WXa0PocluE9IGrdaOU2TdmHjCtGstxk+sZU70zPengmsUubvXIG/r4s0RG+W+DWH8ibd0yiy5N5rFLOgJaVrm3NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wpAVh1lGTJYf+iLua2PXEp5h8WJp6QCzoeoaYN5mfkE=;
 b=oO5XLhYW36Mk6RpuyjQUs1dr7/lZMSp0v3H/D3LxDASinRgac69+Yr9k7So2quwykXl2SZW0OJNfqdAKawmv9zY1fhe62Ya6lzxW/c19YziQDgy1Ji+uaGyPGLg7BGfY1xcVZDDa+76KLXsV4lohqEuhvMX/kZUnX+qcCCYY7i5hwQktmF5GjMg22M0i60Jv4UTTpLiIjWQmSUQgA5IeQ7CsqOq3vNWoCDynMAlqOnEe0EzY/y99GKxro28T33xYnHiX+YIxE65YzNPJmahXnrgNaiPAcN5w9x75XEb+M3FBQ5ENyr++8gtb5npkaSPw9kLLIGALXb4dvmejnJaqAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wpAVh1lGTJYf+iLua2PXEp5h8WJp6QCzoeoaYN5mfkE=;
 b=oucBOtj3A7u0kG23U6t4WaNH0Wx1rawPiT8I9+XhnZh9+UEjeni4m3LAKVc0oq/Rdtmr0dpYoS95/0r5pp+BEQUzV6bl2jc1CSaK77GiHkXxtybA8fLetOKBYEyeModukKxHuP+FPNEQx8s0mtu8EdUW3TrDO2nfSGlEo1ymnJ6VINVi5uD1/ThU3127kHc4gXzwY3PeyMnckdCMQrMAamXB8u4zQvKGpb5DQmkeCTf/11EQgiaiI681ZmjDftQ6woeBvME3N+R9B3c2Dt85usz9+EsYW0biYTDcCCLoE506H3RfrF+aaqIvl5hczIa/FUX+rYBx2O+B3QUM9dRNqA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA5PPFF3CB57EDE.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8eb) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.13; Tue, 7 Jul
 2026 05:10:17 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 05:10:17 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 14:10:14 +0900
Message-Id: <DJS2WBOSQ1U7.AQQZA227X9MK@nvidia.com>
Cc: "dakr@kernel.org" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>, "Zhi Wang"
 <zhiw@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "russ.weight@linux.dev" <russ.weight@linux.dev>, "mcgrof@kernel.org"
 <mcgrof@kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "driver-core@lists.linux.dev"
 <driver-core@lists.linux.dev>, "ojeda@kernel.org" <ojeda@kernel.org>
Subject: Re: [PATCH v3 1/7] rust: firmware: add request_into_buf()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-2-ttabi@nvidia.com>
 <DJR9ZKFB5WQQ.1CGI0N3GS1SFM@nvidia.com>
 <DJRFIANMW0AM.2LAQJ114NJQYH@kernel.org>
 <e1c7a5f2ca6fb05b27f76f8f1af2c11532c75ccc.camel@nvidia.com>
In-Reply-To: <e1c7a5f2ca6fb05b27f76f8f1af2c11532c75ccc.camel@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0013.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA5PPFF3CB57EDE:EE_
X-MS-Office365-Filtering-Correlation-Id: 25b5fe8c-e29c-4cec-2f85-08dedbe608cc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|366016|10070799003|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	/zoxRK8/r+FqWJVDCoqG0rLctYqCreK9zVT2WSw6cE/Ho/RBmHL3XHByFOU9dDaze53xRxQ8GRjj0rwWdyLHKf5EHGRykUTRu2MtPYq9OrO0/wpe1LuqGWO0BM8MqrVZ/1y19ArjuM87Ixc00dKQdv/lca7m6vFmsGFurgbrlOyv/00OW9D3Nsy86cKbmk6v26cLGm6sSlYSsWxmMhN1FCNW/Ip4K2ERANVkY8JIi1iaAbsU1khdemNpR+p2STKWpWSE8k7WApU77IVSu1MwmsvYPmTZNo14BJlBvizz15xrSS32ukAO/9XaNrkJmCJW7NxLKzYblyXAqdGK4OBO/22AtQ7Hv0+zvWQOp5MaCj4bl0FRQPRbcBJCqgjprIOghrjBWNprP2uc0SrXVpbhyttzU4dkw/CCImWbAXEjLpjpVemyaTqhu1137lKIlcDsBIJAu9UwWw+kimghR4ciMHtdVWYgPlhFChb5Mw79kwqH0gjq/ZvyQc8zF5Ryxh/1VltnA0ye2Lu3y+aoRQ0K123tMV1Y/5hgXBv2Fys8hwjDDnXHxujUR5LBesyXoYhXQmIoCv0sRYqnjPegDX1GRsPFNkvKPlqD1AXGQHIlR9p0PkwAL6RH4p02tuzC7YyeQB3AKyX6prdv1y5t7D9vvXqqPB85rc6AhE0xI8xEC7I=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(366016)(10070799003)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkFmVXV0c2tVRlhmZmNXUlc5SWJobGFWbUlKYVRPY3VGTzlrNm4xQnRCeEsx?=
 =?utf-8?B?SHQwNGYxM3YwVm1pZGNyT1J6a3dwdGZ6L1ZnMGFuNzNLV1YrNUxGdWQxOUtL?=
 =?utf-8?B?WVl6dm5CR3BSU21KSTFoVUhYUXFIRHJjYzByU3Y3b01qT1JGaFBTVlZRRzl4?=
 =?utf-8?B?cG1nazBKV2IwbWhnajgyQVBTOXlNZjF3OTM3dUxwb21mYXJCbVFWOE9aa1ZS?=
 =?utf-8?B?d3FTOEhzTC81UFZDbHdZZmVIRXphakhXa01jeFJNY1VYSHhZWXRtQTlWaXF0?=
 =?utf-8?B?cGFuVHJIaklkTE5pbUtxMUVHcU5QMFErV1Y0eWwzU05GSWJBVC9YdklUWGU3?=
 =?utf-8?B?Y2ZPQmNaVlJ0dnNzdGt2S0laTlcydnhjQlY1b0ZmWDc5dit4UDBmUXpOaklR?=
 =?utf-8?B?MWZRV1h5UHdLNllDZVU4RC9odzJ4TzR3ekpoQnUrZkVjQVc3UDAyRFo2cHhm?=
 =?utf-8?B?bXp5L05JNGV3SWF5UWNodCtlNHNBSmhmRnRiemsrREFGOUp0UU8rQjZmTnQ2?=
 =?utf-8?B?TThpdHluS3Z4OG5WMUQzUC9VV1ZBUFR5TVVOOXlUQkVEU2Ruay9yRkluWEk1?=
 =?utf-8?B?T1JkOXFZcnBQZzBNU0F0UVk4Z2lCNklwWlhSNXNRbWF4dzRwMmFKRnpIcU04?=
 =?utf-8?B?U2RIME5EQUpLcjljalI3ajBnSXNCRlIrSG5lSWVlTTNsc1lEOStSWUloQTVR?=
 =?utf-8?B?eTVrVm1mYTNabVVETHVrWlJORXJiWXk2ME84VTlRQTExYVRzaVpDVnAxY0hi?=
 =?utf-8?B?SEJMWGoxR3N2THBNSDIycjhPbUhveUplcHRYTVhWUm1Fb3IyODlQVTBTdUI4?=
 =?utf-8?B?RE1LcTU4cEtMYTdUVTNROCtMYmJ4RXV6WWcyOHRKZXp1YTJxVTBNTG43TUha?=
 =?utf-8?B?cDlqVXBiM25EYm5lQ05mSGdPVHR0bTc1bjVWa2pBVzhXSUtvK0ZZRk93UzFl?=
 =?utf-8?B?Z1kyTFQ5QXNTckNGMEM2dUlVRFZsS3JscHBsRURmYTZOVlNISjJtVjVnV1Zk?=
 =?utf-8?B?dEhIQkhGUU5yQ0doc0FGUExuYUdTcEdwaDhlN21Ycmt3cituMkhnTTBkUFBr?=
 =?utf-8?B?enk4cVVnemNuMVFmNVc2M2VwVTBPQmtENENXSytMZ1kydW9sak9ub1Q4ajlO?=
 =?utf-8?B?T3R2WkRCdzdEM29uQkhhN3AvbXR1NzJTclBjNldxTGRhZ0FYY3lMWHVhWkgr?=
 =?utf-8?B?ZDQ1ZmRBUVd1YWJoRlpLWkRoMDNpbVFQL1M5NlRiSTNZVmlVZXFpYk5YOHV6?=
 =?utf-8?B?bCtuaGRkcTJUbHl0dW95UTBaTmpoL1dzOGlwSzNOalZVV1pGd01BVU5YSXR0?=
 =?utf-8?B?UkdvcmZqZDFxN3hwcWpiZ1grcFBsMnFiSzJSV21sckMvbmxBOGpIUEdqeHkr?=
 =?utf-8?B?RWNBLzR3Zi93dUphWnNxVE9PQXV1Nm5kcTA2RWhQQU9nL0krajNxZndSOXRt?=
 =?utf-8?B?Y2xVMTN3WVlCeWpjT2JHMWM0aG4wVHd0RHhyNDFnTHBHelBLWEJpNkF1NlFM?=
 =?utf-8?B?Q2V2NG1hNHJZanU5OVMvUk16bC92N0hzQTJtazI2NXVaYTdSVWlvSTFoakZY?=
 =?utf-8?B?YmhLeHpiYWVxL3NzUFhIUUF3ZUVleWJOWkw1c0dmT2hDdXY2Rjl2K2ZmVFpY?=
 =?utf-8?B?bkRaRDRSSk0zNkRJRnpOZjVXbUV5dnpCMnRsV3ozVFdNcWo2MlNnd1JBTjVk?=
 =?utf-8?B?Rmd4M2tQTkRNdW5Vc05FcGRsa0YzNjg3cDZ5dUdRTVlYN3N4STd0TXNIN0k2?=
 =?utf-8?B?YmJSdWV6bGpvSUxaYmttZ1I2SXVjVjdTZmxzUXB4ZzdGc1lrak5DN1pKb2Zv?=
 =?utf-8?B?cDI3WmNTaGFabW1XS01rMUttWkRWVWNVdW0zNjhLWnJZRlFQWTlFRTB2dlZh?=
 =?utf-8?B?WG9tRWJyOUVHazBWaHdaNC94cmhjZnBwYXpkbVRBSUVTcmFZVVZ5VTBZSDU2?=
 =?utf-8?B?M2tOOGxiYzArV3hlUEU0TU5vcFFLN25Nc2ZIUDhUak5JOFpBcCtpMlBHNkwr?=
 =?utf-8?B?VTczazdkYmYyUEFaL1g1UHlJVkZVcTU4bXpySFJjZ2hkdTgwZFN4Wjg0bUha?=
 =?utf-8?B?OURoaWVOTkk4UWIySytaczlSRXM1KzhHSk0yMlY0OTByTW1vdEJXeG9WbWJZ?=
 =?utf-8?B?Z1VGSnZBN211MUZwRW9FTmVPS2MwdHY3dHBqeitXbVROVmhLTG93cUhobmhG?=
 =?utf-8?B?L1FXVW4reEFVaGtjbU04MTgycWFlSHkyd3BJemwwckxMMFZ2cWhKT1B5em5E?=
 =?utf-8?B?UFRuajdRcSt2ejVwSDBkS2Zzb3YybFJjK3l6dmI0YW80d05hME94Nm15QXdj?=
 =?utf-8?B?Y014cW41TXJRbStUME1UNGdTNUQrK0dkdklCams4dnJzd2w1Z2JRdDFHSm12?=
 =?utf-8?Q?vR4ZGXb7ite9DghQ1IaMNh0ejHra9djZv2K73Jt02EeeF?=
X-MS-Exchange-AntiSpam-MessageData-1: 5SvRA8+XWKEGRg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25b5fe8c-e29c-4cec-2f85-08dedbe608cc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 05:10:17.1424
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxILeu9VGVib8+RiH3JLNd7mWcSFCvdM7gnlObQibJpaZ5f4eI44H6ZvV+uFdJSUlVxwB8ObVg40FRfDc3phpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFF3CB57EDE

On Tue Jul 7, 2026 at 11:54 AM JST, Timur Tabi wrote:
> On Mon, 2026-07-06 at 12:50 +0200, Danilo Krummrich wrote:
>> On Mon Jul 6, 2026 at 8:30 AM CEST, Alexandre Courbot wrote:
>> > Sashiko is correct to point out that this doesn't return the number of
>> > bytes actually written into `buf`. We might not use that information i=
n
>> > nova-core, but this is a kernel-wide API.
>>=20
>> Returning the size only doesn't carry a lot of value, please see [1].
>>=20
>> > Returning a `Result<&[u8]>` would take care of this and cover the
>> > general use-case nicely.
>>=20
>> I'm fine with either this or just Result, as we don't have a user for th=
e
>> former.
>>=20
>> [1] https://lore.kernel.org/nova-gpu/DJ6JV2QQY0QD.1ZK1PRRBN5BRP@kernel.o=
rg/
>
> Guys, please come to a consensus.  I had it return a size originally, but=
 then Danilo said don't
> bother, and now Alex says I should return a size.

Incorrect; I said you should return a slice. :)

What makes me a bit nervous with this API is that it is not sound
against incorrect size information or race conditions (e.g. if the file
on disk changes after we determined its size). But that's true of my
proposal as well anyway.

Another inefficiency is that the buffer must be initialized when passed,
only for its content to be immediately overwritten. I'd like to make
this function accept a `MaybeUninit`, but that will require more generic
code.

All that to say, I will likely think some more about it and revisit
after it lands, but the current version does the job, so:

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
