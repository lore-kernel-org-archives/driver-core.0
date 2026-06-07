Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010030.outbound.protection.outlook.com [40.93.198.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6609324A05D;
	Sun,  7 Jun 2026 12:32:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780835574; cv=fail; b=BZA1ORkWjb5xAeR1vrWKfrsJ8kqr5jqJXn+tJeJx7wIf3N8W7j0jdEYj/Ntr+4NPvNBx/NnjaLU8Rs1meonHz3FslAP9u5zsmn028kC83sXvSTUBGU40myh8zeOvDWAiDaQgrLXJSDSymaGJuLl2XbUlVgZj+1KhsP96oDhJlJA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780835574; c=relaxed/simple;
	bh=1hASBQ3lnbOs57IEqYJFk+iKqUv1dOiNDsPCb2KTryA=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=tpEblpK1T6qYkJTfB/xhAppphIVopZWnTMSUIf+CG5FOYAgP31CQIboVJtWeLciX6Ja0K9TqHdbW2HxNvSdUIoOQ3ObiH82H/Lulatuy+ZNFaW0ZtfCRrBCDfuA9R91Ie6cFkeeVifQE7s5M5t0HKRdycC6mlpQIqJDoSY9qqo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=OW1inw5r; arc=fail smtp.client-ip=40.93.198.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="OW1inw5r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NeeqYXbdv2kMeOMQ9JIlteOMirQ+t0EkiuiiUhkynFS9yhyQxmtze1tnMXG1pdz+wEGuwCjb9Y4IN6s00zIbEaCkHrqKNlBAaP81W9fc8/SOhosiSByWvUGX3hv1OEAWnxPjfEROXm5ecSaGO7SLPALkIhyeOwpAyWgGhRaCUhe30zYAvaP408RHWcuu8y6+otQ1/uuM8DPjL+ytwHU9HfmIwElW0o3S72pkshGVpSmRh8UeuNottOxB+FJWoOsTwCvLF5oU4NtrSfWQLsy2Oa0CHfCF401CZpYmzXzJQvk91ods6oZGDn24ZofdpwrrhokP49kF51KGuqiT50B5TQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LvagYEr+YjggCZsnKUJwHt5LUVW7bp1FOik8rUActn4=;
 b=NcsbirHYf6z0ezL5rSLyR7B+l7Ou4zJzQC5fXzzbKyb3myHhbq2/ipIHbVwmAb9QPt6efJLnhCEXOE5KNgwY9VtNlVT01PX/x6t6yeKA38fVeoUGzh+Fnqdw1E+OLeCSSPS2nPP1uQgprCA7/Gf0Wlkn1Y6EzbHQItm/YHX9ALnjVC1Lp8bB/ujlmsVAT2YchOesElwfM7XJDWThXyS6n9SHbExHVHLU8hEdO/i7XH8vDMQEHOGiaZCBfZtuaeqXAKb/lq8SdYQY7WIYZZDSFBQyMMjDmLvIzS/hrRnqvIEenxVS4aOZB9g1zusUQr6RGyuPGzq+5hoPFJdJ9OO8TA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LvagYEr+YjggCZsnKUJwHt5LUVW7bp1FOik8rUActn4=;
 b=OW1inw5risoT282GHC5NuGpY6ChO3d8VLSxVDyhYQXdJjJwejhO8a706bKprs4otiN7jIDAe0lEFQgJVdm5IADlE49x/erL9vwbh9D3R63RtRYu0JI24CorQb7mKehlRY95YmPD1XgywqyJjlY3yWawSEmJcDgL1eKa+kqUMrWd5NLv7nKcu1Ws/OGXQq2wjsITZqd0TngwRwqGmxcLEt3NObWT+Ut8YLe5k7yTxIL8rNdex6bbnnk1NH0v1rWCQg0JyStDHcCtgqJ/B3GAcmE9J3EgRjCGhcsL0A1AnE7bN1ayW5reu1fuyccuBLvZHSCIrdkYX20uU1vLhb4OU2w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA0PR12MB4352.namprd12.prod.outlook.com (2603:10b6:806:9c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Sun, 7 Jun 2026
 12:32:50 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.011; Sun, 7 Jun 2026
 12:32:49 +0000
Content-Type: text/plain; charset=UTF-8
Date: Sun, 07 Jun 2026 21:32:41 +0900
Message-Id: <DJ2TIQQ0POKC.2705PQAA3B5LJ@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Danilo
 Krummrich" <dakr@kernel.org>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <driver-core@lists.linux.dev>
Subject: Re: [PATCH v5 2/3] rust: bitfield: Add KUnit tests for bitfield
Content-Transfer-Encoding: quoted-printable
References: <20260606-bitfield-v5-0-b92188820914@nvidia.com>
 <20260606-bitfield-v5-2-b92188820914@nvidia.com>
In-Reply-To: <20260606-bitfield-v5-2-b92188820914@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0071.jpnprd01.prod.outlook.com
 (2603:1096:405:2::35) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA0PR12MB4352:EE_
X-MS-Office365-Filtering-Correlation-Id: b0b53a63-26dc-4838-5f4d-08dec490e2f3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|22082099003|18002099003|921020|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	ohyivn9c0e43JPaYwKQwCaPqNsDj5rHkIR6YEZjWEY2cbIhS7gq33pr+MuFKUOry9y7mg9iQSIRM7FtJjxoqyKbP5I1k6TQVItjg3TX3bTVsRkp2pY1gGxfGjbFG6r0be43WosQNdrj0RzkjP7f8EX3Fbad+Y3Q4ISYy+lcIftH3g4Eg4qOs1tU4K3HiYUffo62hNaYc9m5QhvlEapS4VReAK1+iLFua7oJgkZ0uLXM3fpAlw7t5C8knemnoF0J8Ry/UFp2+VhP1AEMCYt0DxHvZn8fVwNOHKBInQKrbrAzf/HiGGeslCSwCkV+7Yw4eKX6rA7VijR8XmFgJRefJkIgwkJjFMCdjnyvFRzFRCG1CbGBT1sVBC3XogNUQuhbt6SCIahgunnBYtMn9yLOPeydT3vbHrP7/nmjFaVzHT1hNkpcamiLLYbky2G72VgCZGaZrfFsObc2rU02ywVGyqRS1bvFqQdo/D/12jGSBDf6WqUxUeWgpoQ+A3wvowc8AvnPA9uy58dTUHn8TbLUrGlogpHmITQlEXyz6at/zYep4YTVj3Yc+XpJow7JonSE0YgJSJRv1OtIcaNz8dhON52W3KeSGaoItY7HsEOeShR+altk4NZO77jQTj9NRpp0Y8dDotG4XJUAgs86WDCsVcDpu8I5SrUcH18XsPdYJ+XUW5+BGAoh06ox2V7c+37I3gItnE+N4OldjXRuz+HW25LQK8a0nyfXZhH0WNIe82ZA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(22082099003)(18002099003)(921020)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHEzNUJTOWRHVWI5eldhb0hLdXV5MXZicENzUC9QQ0QvaW9HT2Vjcndta0FN?=
 =?utf-8?B?a3RhMWlhRHN1VWVaZ29NT0puays3clFzSlp4OUJGRS9XY2NvelM1ZXVaMEsw?=
 =?utf-8?B?aDZva2prelpxY0NLSERjTHQwaVpibVNCbitDL2JnUCtuYXVMMEI2c2hmZCtX?=
 =?utf-8?B?NzhkNU1iY20yMmxjSktiNDFJdHBYUUZTRStVeCt1NmNSUTU3N25LckI2eUNz?=
 =?utf-8?B?UVFPM3drSDZNUWpnM3pBQkRDRkpuMTFvdWt0amR6TTFGakpnNE10YTlLbzJQ?=
 =?utf-8?B?T1JRTUFGVWpnRFRvcGFkajhjUStxQlV5ZkpCSFlDQjB0M1A2VUNzcTJCajlX?=
 =?utf-8?B?ZWIydUF6Tk5lR1IxZVl4czJ6SU9FZVhKRlQrcVJCdkpXUmR3aDhHVFNsMUdk?=
 =?utf-8?B?Ynl2REhXQzNKcGRUaWVVaGxLbVhMTUFBdWxXaVFGS1Jaa2lURzQzVGlKRTlU?=
 =?utf-8?B?YUNuY2w0blZ0WWVHZlErd2Fxa2NCQXY2aGwvTXBpeUE0SDByKzl0Zzl3SFUv?=
 =?utf-8?B?NVRTVkxIQzVoeng3cXFoUG1RUExNalBRZUlRbk9jeWoyYjAzUTBSY09xcmNY?=
 =?utf-8?B?YjJCSG0yOGsrOFd0UDZHbmcySkgzN0hubFJDejJKZU9kQzBPS2ZMdjJXbmJF?=
 =?utf-8?B?eVZyZkl2TE8vQ3pvaE5mMU5zMVF0QURZeFdQQ3dhTWtycnNnU3dQdjhGeXh2?=
 =?utf-8?B?d3QwMFR6d0lRRjJGYWlvUHFLaTVUUSt5SndlekhpZ3NERTMxbmtrTFRSWUEz?=
 =?utf-8?B?VkNSMFFydUZNVUpYdUZXUHQ3VUhGaU02UGpSUFhFZXcxK09wdWY0Z21mMis2?=
 =?utf-8?B?Tng4NTd2VVZISVNGeklvNTdvS3dxMnN2RVBmQzBKZWl6RUFDVDNaYWQ3RUky?=
 =?utf-8?B?WUV0bUxIdGJ1eXRXZThKTTR3dUJEdGtjMTJ0a0o5bU8valdlb3ZOVzc4ZUJq?=
 =?utf-8?B?eFNXd2xuL01ob21MSXMxM1lUbURyM0NqVjNjckx0WmhrVzdTYVNPcGU3YVR6?=
 =?utf-8?B?SG1CSVZYRGJnRlNnV1VENTB6VU13STcra0d2VTlINCtMQmd3UGVUWllYM0kz?=
 =?utf-8?B?THYzazQzNmxGNTJQU3Q1SVdWc1Q5eERCbDFadHJ0VmxwMUpPUFo0azYrcEtB?=
 =?utf-8?B?TVVXbThwVkJNUG9GSHVudHEweVdLUUFud1I3ZnBUaUpFbjFJZEEvWEk2NGRD?=
 =?utf-8?B?MUl3RjBmNGR0Y2FWdlQ1WGxndmxqWENaMzVXQldMMy94czRobVE2SFh6Sng0?=
 =?utf-8?B?YmlUdzdHTVM5MzF2Z3JNeXU2OFJMajRTcWhNa3JqTmVCSlZmK2d6N3VPQ0M0?=
 =?utf-8?B?SEhxd25OMWQycXZuQy9RTWJlV3d5UnZIdWVtelRua2k3dlhaU083L2o3RHA5?=
 =?utf-8?B?UUFhS0dVYjl1eXRyeWgxdWZiWWtWeWdJdWttZTk1M3pJVTNrZGZFZTBiYTdD?=
 =?utf-8?B?aEl2aWhYc1JYcmtzSXdxbTh2ZmR3LzNlb2NQM3U0Z1lnRk1jS3dHeHI4Ulh6?=
 =?utf-8?B?QnBaaWF1ZDdkYkdveXJMSkQzQXhrdUlUK1VCeUZ6c0JFRHMyWmNoUU1Way82?=
 =?utf-8?B?Z3VyU3MrV0tIZ3gzdGlIL1E5UUE3dGJ3eFpydWNPdlRhZGRTb2V5OGxjSkRm?=
 =?utf-8?B?Qk5iUWxMVDUvSE1WNk9QR3ZuZmVXT29vSmkrTW85TTNsKzRRWExLUGhpUE9F?=
 =?utf-8?B?WUFYRjF1c3hieTgzV1U4UDlhYjhKcmZZM2hzdGtFb0JGOUlPVXljZU4wMk1k?=
 =?utf-8?B?T0R4OFFGRm5RNWozTG1lak5KWmw5L0N0ZUY0UFcvZVhZQXNyMTBKV0JMNHRi?=
 =?utf-8?B?S3EyV01YZTYvL09XaUFYWmJaQllabHlJVndvN2NZeTcrZ3hUVm5vWFB5eHpJ?=
 =?utf-8?B?QWxnaXZxU3pCUndQNkxKcExCdnZ6Q1ZwN0U0a1dGQXBGKzhDRXM2bE5aM1JS?=
 =?utf-8?B?NlJYQ1VERTVrWGpaMW5TYllwODU3T1EvSlVUUWJoNGE3MjB0aHA2Q1E5dTdR?=
 =?utf-8?B?MmpwRTQ2VFFGSVNCM21wem9KQWJNWkVNVVpjanhDTlFmSTdDbHB1Wi9pQ3NO?=
 =?utf-8?B?VVFKUSt5eVROUVZvamxQTE5RTm42MGg2NlpFdkd4bjcwKzRaZnRJbzlVNldx?=
 =?utf-8?B?bGNUdHFnM05WWjhQd0U2U0paYjMzKzJTMjFtZk1GYWRWdVQ1aVRUWnVMSmQ0?=
 =?utf-8?B?UnFpT0MrZHFNS1FOTFl5VEJ0TUsxK28zNlZ1MkloR1pqcjA4RDJwQXJEVEVz?=
 =?utf-8?B?cElXQUx6Ri9QaXNobWRVaEVaNGoyeGgveTJCSDRjSEF5SjZTTy9IbmFNZUFB?=
 =?utf-8?B?clkvZmlrRm9ma3kySUVIZENCbHA4eTZFMmY4blZycmpvWGVScmFLLytBWnBu?=
 =?utf-8?Q?yeoew0d1+6TTDlpD6ilP1ntiNGMzwcd3dIRIhY6JxztqE?=
X-MS-Exchange-AntiSpam-MessageData-1: yfAX4nU6iG+efw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0b53a63-26dc-4838-5f4d-08dec490e2f3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2026 12:32:49.7102
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dInocYZZnNmKjTxs0vGp27N31cZrHMBEAXluRmbKzt+irhEdMMIVrAfhyyaUgeZF032uC9VJlYiMcA8J3E1DaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4352

On Sat Jun 6, 2026 at 9:43 PM JST, Alexandre Courbot wrote:
<...>
> diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
> index 2498107979dc..0e2f805c19ba 100644
> --- a/rust/kernel/bitfield.rs
> +++ b/rust/kernel/bitfield.rs
> @@ -546,3 +546,317 @@ fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>)=
 -> ::kernel::fmt::Result {
>          }
>      };
>  }
> +
> +#[cfg(CONFIG_RUST_BITFIELD_KUNIT_TEST)]
> +#[::kernel::macros::kunit_tests(kernel_bitfield)]

Looking at the other tests, this should maybe be named
`rust_kernel_bitfield`.
