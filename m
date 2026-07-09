Received: from BN1PR04CU002.outbound.protection.outlook.com (mail-eastus2azon11010016.outbound.protection.outlook.com [52.101.56.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E876B1B4224;
	Thu,  9 Jul 2026 02:25:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.56.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783563911; cv=fail; b=oYXnMFZG1sf1Dl7lq23HDU5O4YkR1dAgaw//8B3VUKLklBtQNSKUiNDXZLukZGzg93LnyKIPc+O0FV/zepfmCy71hIe95S6NlHSTqJxuqc3fqzwwQ4x1s/mzq8+Rq+q8rY8YPUpxhlxZpCoHvYdn9SYJwJTY0LzI8lOb1bNyh58=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783563911; c=relaxed/simple;
	bh=weZnFSpLBfcwwyL9XkFxARiakOvaCNGIPMwCVn9I1d4=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=C3tnBb860kGWB6fk3SQlgV0+VKlfl+iU8C7JDrXkxWq703ZGdRC+EBmewOuDzGqH/DMX+TTHZUykNA+NMw/gSpFQ4KPeX3OvrvPX4g8b5ywMlDs3cWQa3fH1kkjHKGHOPbWJqCtzL/KStUgOZXISVJt3N2pWdk5xBqIgr3lQk/k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tSc/WaHE; arc=fail smtp.client-ip=52.101.56.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tSc/WaHE"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eAzJFlgvZFfKVmhsmNhASSWsZU9DHOaMjz6XVFir5suKR/R6lkjOGXkfyZsOjHi1CZTvsoG9DCnym5Bsg3YZSKVk3YvUflLMpBHZGhQyW8LlDEOZxGMwjtsfWf8zS0Yk9FDrL78Vn02L+C9XQxq5HNdV61uh5RMVVUfYXvD0UcAxQBtw7dZ15Ww7MSGoeODoqyXlP3svjZGWAuMGU1kc/IZdNKZnzAnRBaJ9dmtade1JEZ7d9pQVdYgDLIIPxHYlF7/73bEdS10AyZUhotRloJzp7FDRRq4npreGL5aeE5L2DYOlqTwPzZZVjtlpfHYdZCSP5/zSIAFrJUTKzL6GTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=weZnFSpLBfcwwyL9XkFxARiakOvaCNGIPMwCVn9I1d4=;
 b=r86fw/yBtfXlVmMObnNi2MHeQ7/Ja2aPC7/mGpK+nem3nyRtcQiudLSs0InGDMiThTINk/e/0WbWn0CRxsl9p/eMr8yMI+1g2v0monWFcgldAHWNVJRAFtYew0OOoVaOzNd5oDKDm2PnsqwQ6523N/4y8gLsCtQpKGATNuD2SlG/0L2wWMVJMfJUsRyx7oNNVi+HW6FijgEwFnCqbXFflBTp1q3vquRoAq6W3BE24zXsPaFC0Som6wzbede7ykB5mx6vgAynnt0YTrHQVXId7t9lFDcWEJe5lipRw294/jmxyF5Fgu4P2TdLwN2vNXHQ12GDSTIFhYNeRVyBNbMVHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=weZnFSpLBfcwwyL9XkFxARiakOvaCNGIPMwCVn9I1d4=;
 b=tSc/WaHEiWRyq1bNVFdd//7TQs3oQvkqXE8fg1n5DluP8bK99g3RCq5uBRAnPfU6sELcn4lS7+YVVEX3K5dsD9t3ghYBeT57uQsiZvEWinj2pkZrzAO0qQ+3eNEPb1YcO0AameIGW2NKe7urYZo9GTN22UYNbfsMpZRjtXR0FZ40QI12a0gh5cYx1VfD/sGJa4fV2I7uchB04E6RBIbrruZmr16tEcAQKM3gXxj2TKBCKagSJ0jpclTrpwU7SGw2MJxMl2Ybaw5/YwCDx1A1XebjWppyoQ4PMFXaoIYyS6EhlS0lu1oFLBNAAGcsia9Tl1D0tpDLbKGOjMZiJ5MY/w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3997.namprd12.prod.outlook.com (2603:10b6:208:161::11)
 by PH7PR12MB5952.namprd12.prod.outlook.com (2603:10b6:510:1db::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 02:24:56 +0000
Received: from MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf]) by MN2PR12MB3997.namprd12.prod.outlook.com
 ([fe80::73c6:e479:9b75:b2cf%6]) with mapi id 15.21.0181.014; Thu, 9 Jul 2026
 02:24:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 09 Jul 2026 11:24:51 +0900
Message-Id: <DJTOMSK9WVHH.GA7X7JR0PYIO@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>, "Zhi Wang" <zhiw@nvidia.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "mcgrof@kernel.org"
 <mcgrof@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "russ.weight@linux.dev"
 <russ.weight@linux.dev>
Subject: Re: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-6-ttabi@nvidia.com>
 <DJRA02VV16AS.3W0QHW9YYSLXE@nvidia.com>
 <79b4033973c675355a25d8fcc701cdedf8f30bc7.camel@nvidia.com>
In-Reply-To: <79b4033973c675355a25d8fcc701cdedf8f30bc7.camel@nvidia.com>
X-ClientProxiedBy: TYCP301CA0054.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:384::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3997:EE_|PH7PR12MB5952:EE_
X-MS-Office365-Filtering-Correlation-Id: e3034ae7-0996-4960-2304-08dedd6143bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|10070799003|376014|10063799003|4143699003|11063799006|6133799003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	/k53CAphB2WZg/PGE+aaBYtr9wu4Vlny0m62FBgqLCe1lBOOo4MohIwC6EW/foDpUjXGW1M3ZzCcDyMAwqhcjMXQ970jZCz5EpwQvD5o7mtAUwkKgc6kG52jh3Ea+BUWvYnU488HbgpARq+ECGi+DwGcbRcAYjn3Iwc8CrbnUiET+8WUFCit8QYxedti+CLnAHvA6mnADrCw047+mt3I76GU6khn8561LxLuqUM6uFhOR3BjS0wFHNzvhEBfAiyDLMy7dziWT+RWWsGeXzOi5d2bAu1yOV0MIb7M6u69TAwLOb/ncNkczZY1/Trm2H43W7S1cyWcxUfxWCif7+nQ9lBLllAuJZ4hJOxvYMLiHLjTAzc+fxMidQJVXuZBQ7NmiVCGkDeBhgPd47B5flHTq43W1NSvCtamKe+J5YzXPM4M+Hnz8p8HbMjgXCVesSbupAUSB138dCVl2gQK8MJOkVYFk0LXkHqsLPwExoycSK7YS6EGd/Iktml2/2uGZwUqjGCJJhqhR0NQhyYgOUYb/gQ9kc5PFTcZ6e4Q/jvMu24CCpan62jnIupu18TMYd9yQinwmURhr2e5VYtSVZTJsO8L9brxh6Lrp32VsKzWknf/CcZAx3WHWF0h6YI169Atan03oVu1UzEim3UgRNHBOIPKIr471dinR9Tnr47Sx54=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MN2PR12MB3997.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(10070799003)(376014)(10063799003)(4143699003)(11063799006)(6133799003)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ejlGVFdUNXJUdDRqcW80V2ZHcjVMMy9mYTBUWnRGVkFZL0U3SnZza3RXcTNP?=
 =?utf-8?B?U1I3MzlmZE5jRVdlVlFxcHdiWVhxblFyUHdwbHNXQmRzVCs4b0hqOHNDeTdF?=
 =?utf-8?B?SXVkeXovV0wwNGszMEpid1AwTUt5clFQVkNVWWNvam9CdlRrSlBPNGlWS3pW?=
 =?utf-8?B?RERld0d3eHNTcXVzRitWUmtoUitGdHlMNndIVTBEa3I5TnZmeEVaYjVmbTRC?=
 =?utf-8?B?WkxXY05FOWxxV2V0czZVdEc0emlnanRzeklndkg0L0FUQXo2NFc0ZURXZ0Ir?=
 =?utf-8?B?MW95Y0JGV1JvWDB3Yk1sUk9CS1M5Y1RjVGFpbVAxZGFOZTlnTGFLZGR6akU3?=
 =?utf-8?B?cWs5YzhMU1VqOUZXNVVQOCtmOEpIUW1oNXRpditNelVUbEJkOXUrYnppMUxo?=
 =?utf-8?B?WndlSVdmdE95U3FPdWwwemdvSTc5VkhKL2wrT290eEU3bTZKbGdvL3FyZXBE?=
 =?utf-8?B?MGl6bmNnZDF1QmdNTXhuMS9pTjE3TzdWeWRRK3Ywa3RjYWJtdUIwb2M5Y0ts?=
 =?utf-8?B?UjE5dEdiR1dLa3ovOGh0UFl1NFQ1WG9XMklrSjJpeWk0MXUyaitBckVRV1No?=
 =?utf-8?B?YklOY1R1Mk5ockhBRWlXVUNYdDhUWmhTWnJwVTU2NUNJOVl2RGlCdU9nUlYy?=
 =?utf-8?B?MlF0RkpLeVYrRXBNZk04WUZZQTZXR2lKN3R2bEt2L1VxdU8zMzJvQjA1VHFu?=
 =?utf-8?B?aC9rclJyMDc1bnZ0NGUrYXN0ZXE1eDhRcU5hM3BlZ0JCdVBlVzk1MXhmZkxm?=
 =?utf-8?B?ZlB0UVhQYmFnYWxsQ1hEdjhwdlJ5V0UrRTF3VlJsUnNYNWF6L1RKcHlmYUdS?=
 =?utf-8?B?WGk1YlhqRTVtUU11R00wdkZWVlNMTW80R3ZHODBVQXlEYjBsSGVwajg4azRo?=
 =?utf-8?B?bEdLcHAwYUpUci9qOTI4Y0tiUmVTdkY3cHpjMlNhMHhzOVA4THVQdzNiQTlG?=
 =?utf-8?B?eUY0WmJreVo0WjFJSlhMQ3cvZW03bkFjM3NNZWk5R21ZYXhRWVA5dFQ4QmtF?=
 =?utf-8?B?b3A4L052bDk3djE5OUxQTEpPNXlDMExVNmc0Qm1OOVYzQitHaUlMaldXRjFH?=
 =?utf-8?B?YS9vRG1aajN6b1RjSkFkMFRSai9TdFRUSFVOUjJiN3pxdnFJZk1XUFRIdnM2?=
 =?utf-8?B?SW9tT2E1a1B0VC93WGRuOE1nNlhJZThwSnByUUkyOFdaNWxYSzAvcUdHcTV5?=
 =?utf-8?B?cXIraURHcjgrdXhQVkF4L1ZzUURiSUxhS2VtZm1nWEV4YzB4WVRhbVFraWJI?=
 =?utf-8?B?Y3laeTJxREhWdlRWY3JSUXFzMkc1V3ZBdFNaN0xsK05JeTdYUnBZWXl6MHNJ?=
 =?utf-8?B?RnphdHlaZDZMYUp5SC9ELzlEUzV0S25oaEJLTTN4YmJDaVVUbUMzbkNTQVNY?=
 =?utf-8?B?cUhBQmE4Q3dJTkE2VE5CQ3UvODkwcWhicUZxK20wM1J0VWF2TzRObGRyeHJl?=
 =?utf-8?B?ZnppMlhDMWVYUCsrMGErUnFLa2w3ZzF3MTNTbG9ZOWVYejBwZ1VrWk42aW0z?=
 =?utf-8?B?bTVRZktKSmQ2SDhTZlZKUXZsc2pYUXZDeXhIVnF3UjdUd0M2STVMRzFFQ2Jr?=
 =?utf-8?B?UFo2clZrWE9xM2NwQlp6UzVoUGx6eEVWNkxUTW4vRWhvc0ZDREhQclIxUmZU?=
 =?utf-8?B?RmtNb3hJZE4zWmZPR1lmZXZ5KzZFNktuL1NuRVVIODJhY1JGSmFkT25DU05Z?=
 =?utf-8?B?VHR2azdBUThSdVM0REM5ekgvYUxrbVI1a2xaVXdwa2xrMVZqQ1ppMkN4ZTlM?=
 =?utf-8?B?UTc2Y3Rua2swVzNuY3A2NGtPYVpmWTRsZTY4TE5QVHI2d29TN2sycEN2eUc2?=
 =?utf-8?B?YzIvQVdKWHJRWlE0dExzWWZ6T1ZybmhXRHZ6aXlta3BSU3NncDlDUG5WV3JF?=
 =?utf-8?B?UyttRGJ0WEtsaE1jQmV4Wk1zYjIybkJTZE81N1Q2R1EzZGdac01landCUCtw?=
 =?utf-8?B?bzZUN1dYQWJGTzRHU3paSUpZQXdqbWJCc29Ra1RDRzV1ZFNVL3g5SlBHOGxv?=
 =?utf-8?B?WlBHaE9YUXdXUEVpRGtWS0JBajZ2T1pwUEdIcXBCSzhPVzg2dW9TWHBPbCs4?=
 =?utf-8?B?Z3I0SDdvWEZONUl3eEI5bDR6YUpsLzJuUS9sRjhmM0t5d2ZxWWRzdEpEZ3Z5?=
 =?utf-8?B?TmpLL0liamZnSzk0YmxvUnNnd09pbFRwWGlDZnlhQ2lkczdSd0Q1T2RtcGJk?=
 =?utf-8?B?Y2o1aDFrYWNOS29WeDhNNFJmb29ESEZtbGE4TEs1UHgvSWhNbWJFM3hMdm0z?=
 =?utf-8?B?Y3hoU3R3TUtZWmo5NDFzODZYbmIxNFRwNnVMcEUyV2taN3JWTmpvdjVtNWpX?=
 =?utf-8?B?SzcrOFgrZXhweVErNHFwZ25vUW96cmpwLzRMYVlSdXpqdy85OE02KzE1cDdv?=
 =?utf-8?Q?9hwUPDFAj5mnnZFrQhLwgCagNvWa5ib7ZE40T1TpUDRYE?=
X-MS-Exchange-AntiSpam-MessageData-1: euUADrrXpcBBCA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3034ae7-0996-4960-2304-08dedd6143bb
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 02:24:56.3372
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88EUh/rY3+Vb8d0v2v5V4K25H2eAzjBpxRp4Z8I8/j5fpykFN8AfWY3PsOCNrVIFAd9AosmLYDiG8mTe+TSE1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5952

On Thu Jul 9, 2026 at 7:26 AM JST, Timur Tabi wrote:
> On Mon, 2026-07-06 at 15:31 +0900, Alexandre Courbot wrote:
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 dev_info!(
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 de=
v,
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "l=
oaded generic bootloader firmware v{}\n",
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 tl=
v.get_string(b"VERS")?
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 );
>>=20
>> s/dev_info/dev_dbg.
>>=20
>> Also, since `dev_dbg` can be compiled out, the check performed on the
>> `VERS` tag existing is not guaranteed to be performed. We should
>> probably extract it out of the `dev_dbg` statement. This is true across
>> the series; which makes me think it might also benefit from a helper to
>> factor out the request_t.v/Tlv::new/dev_dbg common sequence.
>
> We don't care about the VERS tag if we're not going to print it out, so w=
e probably should not
> extract it otherwise.

The spec mentions that this tag is present in all TLV files, so its
absence means the file is invalid and should trigger an error.

>
> I know it's a common pattern, but I couldn't find a way to cleanly combin=
e request_tlv() with
> Tlv::new().

Ah right, `Tlv` keeps a reference to the `Firmware` instance, which
would become a local variable if we used a helper. We could work around
this by using more generics, but that cascades into other ownership
issues and is more trouble than is worth for now.
