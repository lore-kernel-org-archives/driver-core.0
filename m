Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011018.outbound.protection.outlook.com [40.107.208.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7A53E171C;
	Thu,  9 Jul 2026 22:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783636187; cv=fail; b=IkRgJuJfBAtjIDE6irFWkkOLuBJf9di3hBv8BBwfQEf6w8tXWfCP+ePhjVTdJ1lNqyNdnHyfOeu2vSnkKuNMat+An2QEug4eXxyI4ueYCzKY3QbuNkA/y16kczbmgURSw6Y7DTsw3HOwuabqDBF+1usEG98RyLqg2658G6eg6+M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783636187; c=relaxed/simple;
	bh=O8S+tomiH4Hj66XgTavlkek/yoLUoS91gOgbunxOeO0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=pib7i3MoSaEEIyUekEuvxyoMQHCfvv7ivZXjFy6xNW6AuDIhSAhnG0xAMvB1D0B5igUPvcg2Pak1DtY/k5gAbPoYpEvpLo2+h3PwQc9Ia8KUBqMpf/uoUyvv61KbBTw7fPCpNggwuYknrD5Bto/09wvp97pwPv8s1NeWr7rxXXw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TGPIexMV; arc=fail smtp.client-ip=40.107.208.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TGPIexMV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UAywpdMvcWEdOeoYzcArxLeoOXNeo2u/yOIVveeI/7r7cAWcxWU8heOFhVTyrMRAwt28jEPb36iQTmxt9ubwYesbngpk9Sx+bNDQJoxOrvF4D0k9x3Ou7wHGGamS+h4FT4/DSIc0F98kb3faehgzeGqVYABaV1BO2T+nqPFc5MS9eMGPoIBKrWLCKhdpDC5E253Sl5c2bKE4M8kkw/7KKTgTokqVxKrc72oum04s4ieG0ofyG7/NboEjDweFoZgb0MYtRrE+wOo64a38JFp16Prx62NUe21CW53+Yr8reBYIBqwr5optrs9X2SxqGTHBLJgjz1+uYVOLlNQg7CSZfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcLsTGFZ7Mtg0CTfeawnra5QszsS/7SG3dz0Rf7N2Og=;
 b=dpYueKQ4/byQRjthEeDhNMGa4ar/6fIHoJQXWJU1fHAIfkPRcRVM+oOTJOj/MYZHGgQkJuo3zB1ADBkjecz6PzqxxvyfLGYfjXHGzg+lloQIBd0AW+j+tKHmXTwa+Tw/3EO8nzTEX0ZHke64rmF8m+hLJY71qs/Z4FyvU0winWVmXx3k5ppBVdSNnOPy8z2RU59npfRvoRwPAeJhaoME12s+GgttKR54UCulsbVLiQE1T3yIS5eZAt+xEJ3ymwg6+ElZFNv4KmugSMcOHjBVH0pJc1spULVgQOENZsfWmcmvXyEJKdtlcYdqfJe9D0xblqCtEImRob1OQeDACEpyUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcLsTGFZ7Mtg0CTfeawnra5QszsS/7SG3dz0Rf7N2Og=;
 b=TGPIexMVLMLWouUHo4Ki99JCIyeDF2SU0hlI4mF20JmRkcpHP+YukW4+OH297/Olegmd9XXtRg9B0OCIQXQmlSxtWf378aDOCU66JgpY398OtZNz7ksK1J1sMmtV8n8ZdmAu6R4z1x+Xk6uw/vnyK7SDJHvo77JWSG/ra848L7SYODPuOCOnAXxWejTuXe9128pRFdsqpnjUZEepK4Tu9YyTf0kHQrxqI6iOz7DDWAjLXWMi0DtR1G5ALf4czpsNfpuFCAy7xqf9c3Wl2tcfdtdjeG6kaMF/ZbB/D1vU3egOWAJaztqO+1RXML/t/oGBr9h+kLKOPGhOImkcL1L+fw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by IA1PR12MB6116.namprd12.prod.outlook.com (2603:10b6:208:3e8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 22:29:37 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%4]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 22:29:37 +0000
Message-ID: <fb1d6ebb-cb45-442e-bfcb-73d3ba82fbb6@nvidia.com>
Date: Thu, 9 Jul 2026 15:29:34 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: "gary@garyguo.net" <gary@garyguo.net>,
 Eliot Courtney <ecourtney@nvidia.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Zhi Wang <zhiw@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "dakr@kernel.org" <dakr@kernel.org>, "mcgrof@kernel.org"
 <mcgrof@kernel.org>,
 "driver-core@lists.linux.dev" <driver-core@lists.linux.dev>,
 "ojeda@kernel.org" <ojeda@kernel.org>,
 "russ.weight@linux.dev" <russ.weight@linux.dev>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
 <20260702192712.3450652-6-ttabi@nvidia.com>
 <DJRA02VV16AS.3W0QHW9YYSLXE@nvidia.com>
 <79b4033973c675355a25d8fcc701cdedf8f30bc7.camel@nvidia.com>
 <DJTOMSK9WVHH.GA7X7JR0PYIO@nvidia.com>
 <09b1d5117a38726d216074d7e3d56d4aeaae2bb1.camel@nvidia.com>
 <4fa55816-68dd-4642-aa7b-c7e6f3d528b4@nvidia.com>
 <6cb2d2292131615c44e03283092724a11b9e5619.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <6cb2d2292131615c44e03283092724a11b9e5619.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0035.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::10) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|IA1PR12MB6116:EE_
X-MS-Office365-Filtering-Correlation-Id: d51b3972-9b03-4d26-8a89-08dede098efe
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|56012099006|11063799006|4143699003;
X-Microsoft-Antispam-Message-Info:
	bxUqTzjTVsOLbdgP8XeJFA8mAm94shTr4uKVTIhmjLgCMIrALFLxsj1mO8WnGzfJQhFR/S7QiVmQdYV4gitZOzYX0Vn1KR2Tr6S20BIjcvOC/xKxsuhKte4gReL9FxcnP4mT/4cHexco4hca4Lk3Wt4KZSqDhRvHXziAznbog7MVwssPL+iv1aGJ0mpR+Vx1sDvo1ZUW4Wq9ID6fMhkX5hiWYhgy9qhuW9Co966r+pRdifySxMhIt+lKOnOo3A9HTLj4NA6/WLKHrUkKm46FKLnLCpECTlhp0Epvi3bposdsWiH93I8GhNGNRmTXDey1Yq7coY2Y8HzppfNg57iUn2T/QeExINff14LwpZWQ/1m/oOmQ/eyAPI3M7zIrhCeOmsdEaqSiNZPc1svfMnYUoBCnWdDaG70Vp4Wvx3Rs5RR1NVxY21Y+mz3baAAfXHDB9rXUt1V+jzTB+BrLoAHZf8sUjr4IZkjK2km8cJIMgoWWe4jB0uYnkJIicpvQ13nbs/iK/6uoZIv0z1euge//AX2NKU6LPIes6soqlhK6QkklUsRs5aVgCh8jtq+CQkbV+6YIE1/6Gc8a3c0KcNzgfrqOGQ7Sv8fhc0TAEqeExIqjk8u2CRx9Mm1odGNIumGH8WAc/9CYHtVJAmHWg+6PIaAuo8/5LLADr5OjD8G8mYk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(11063799006)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NUFIU3dFVFhIVTFVTkE2UHlISEh1dnI4QlkrR21ZTDFlYlh0a1djak90TUR3?=
 =?utf-8?B?dEpHQkpzeC9SaUlUN3lPdTZtNjJ0Y0RqMEkrZzQ1TmJIZUIxSGxQZFRrUDBK?=
 =?utf-8?B?eWs2Y05LT2dQZHNKdC9aRGdaTjd1NmpWTE9UL3d5bWFTQ25BVTFvdGFJQ25P?=
 =?utf-8?B?OHhCWk5KNGVnWlBWZ2pqVHluRmtRMVdHZ0YrR2E1UzRiT2JUcUtXYWFjYVFQ?=
 =?utf-8?B?eVc0S3FuQWlLVVlXQlJVVkRxQkgrdlE5ZTJZRC9rNFR3MmxEY2ZBZFBEdGpi?=
 =?utf-8?B?ZlBkUHVUbytaL0NsYmtaRU9BaXc2SnBaVEl1TnA5bGtyMGFCcDQydTc1MW5k?=
 =?utf-8?B?M0daWU9QZXM5eEZLQVc1L3FkbHFoY0RMTHhSY1BNa085L1UvTXFKU1NMN2Nj?=
 =?utf-8?B?WFdlRU1ZYnpBTmNTeGh0Q2ZjY2VaeW16a3ZiQ25zY2pRYXFBNXZVZTcrMm1v?=
 =?utf-8?B?cng0bnQwRjdPc0I1Y1Ezam5vRGpPKzBFQjZFSmd0WlhkbmMvUThHMUxzcjlj?=
 =?utf-8?B?eUJxVUhjU2hPOEc5L1FHTWtwWU5vUG5wdDNEOVAxNlh5ZWJ6bHNLK0g1ZUpR?=
 =?utf-8?B?czJpeXhnQmlYVFV6b0grQUdITlBxc2QwSHhISDkzWVVjcHdlaTNWV0dQTGd1?=
 =?utf-8?B?Q1F0T01OSFhGYTRqMDRIMTFkODlaRElnVkhYZ2RIWklHbmdRRm9paXNhQ05T?=
 =?utf-8?B?L21OVlptekpVVndUZVJhbVhoOWtQUWUxWlFSWE9HcXFyL2t0b1BvNDBRekts?=
 =?utf-8?B?ZjNrcXBSWG9rNjBuWXhHYTlOTTdUTXNwV25sbzN2QUYyank4RjlibHdDMlhl?=
 =?utf-8?B?Z0U4K3FXTG9zazVFTzN1Z0p4VnA3ZEFPUERxZTdNeU9jcnhZQ1Bnczl0dnRQ?=
 =?utf-8?B?VVFUSW9rUnpLL3crc3BDUkFBZE9LMGoxQ1llTjFSVW1vUkRqcFJNSGNYL3Vu?=
 =?utf-8?B?ZFk0VDNxN2g2UzZCR2RHVjBoYWw2d21ReVpkUjlQVTRHR01USk1ITUFvenp1?=
 =?utf-8?B?Y0x5Z1V5OVJDcW04dnpIakRvUU1TMXloek41NUMyOXcrWUhVOXlCRFFZdWRZ?=
 =?utf-8?B?c21QL204Rm9ySXAvL3lMay9RTGhKNnRPeWZ5cEs0NnNCOHYxTGJXL0dOQW5F?=
 =?utf-8?B?cmFHeDR2UG0wOGFCd2I0R2J3K1F0WHNscmk1NEZ3ZmRGL3hVREU3Y3kxMDdD?=
 =?utf-8?B?YjcrQjFzakdsM200WVJ6cDRhVWxiWUpoUVowWVNzaTJnbDRXR0lyUERUbHZu?=
 =?utf-8?B?Q3ZWc0ZKM3hNZVVuUFprM0pUbXV0NDBXV3NQdXk3NCtDWWRBejNzT2s4NytC?=
 =?utf-8?B?ZVlMYjBvYmxTMHNEaDJUZ0lCcHlsRWYxeEp6NkdzdmNRWTBnUVRHc1JLcFlt?=
 =?utf-8?B?TnhVQW80RXNIUy9VdWNVb2hkTUxxZytPbE9TYXQyVFIxQnViRWVUdFpsL2t3?=
 =?utf-8?B?MmpvOG8wY2lTTGVCM0xWWVJhbEttMEJHUm1qWFd3NWRiNnlCeFpaQlViejRo?=
 =?utf-8?B?bHZGNjZvcStVUnpKbkQwZWR6ZGRIV0cxcndsSGdoTmljYVB6cFk0RGF2WDdG?=
 =?utf-8?B?TWFFVUhWWkF2ZUZNYjA3THdsOXZDVXJXazFwdkVITGNHSGxWNnUyWWNjWWJL?=
 =?utf-8?B?VjZRZGNDSVNsQU5BTXR4OHdZczFoTmlWVVFscVRmUmIvTENxZktMcjUzcXQ2?=
 =?utf-8?B?RGxRQnRydi9RSEt2WWpBMEpGNHVVNmdvNVF0ZjMzM1FvTXVTMDlkd0lwSDdh?=
 =?utf-8?B?bllsYkRJVW40RGRTNDRQWlhHQzM1bHlIcENEL2NDSGxOUHdTN0oxUVIwR1VY?=
 =?utf-8?B?MTRaQUYrWHpTTkVTNmlPSzQrMDFHc2RqWEdoeDhSSDNYL0ZzMm1MUldTZnJk?=
 =?utf-8?B?ZkZVOWhRVTluNkhnNGl1MDZlM1BMTGVPdzM0MjZsOEdZL1BseURGK2ZyRHE1?=
 =?utf-8?B?UkJRaUY3UmgySmZObXNjdEpYNDV4QlhMTnlWVUZocGtraHVxN09zUmd4M2VR?=
 =?utf-8?B?RUlJVkFacUh3SjhCK0ZxQ3laY1pzZnF5QTlvcEJYUkgzb0dQNXdSNzVJdnU2?=
 =?utf-8?B?amU4Q3ZnU3lkZ09vVjQyZzZhdFYwWXF1U0huMkQ4WTN5ZU5ORVdWeG5WWFZG?=
 =?utf-8?B?Z1ptM3hFeHpoRVhSTDQ5aXJZZDVsbTRNTFlWdllZS2ExRVBoTUNFQW51ODNP?=
 =?utf-8?B?bTJFQS94ODh3bkorQ1JuWk9aUmZXaTlLdXcxSDUwZnBUV1RvL0NmNnd0MGY1?=
 =?utf-8?B?aUV2T1dkcnhFS1JzUXYzWllyTUtCY1MzYjVqY25GTHdKZ3VUTmoybEtjdGJk?=
 =?utf-8?B?U3cxSE1ZRTFsQzk2YjUyUVpyMjlCMGtpR0VlemYvaVV5cUowL2l1UT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d51b3972-9b03-4d26-8a89-08dede098efe
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:29:37.1069
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZImeK4N43rENquLibTgxTFonTxqwullVgp0xAO/ZSWX+4Y4+47zEsenD3/vx2hS8Macs4MmRsL9wSIMtyq9Y5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6116

On 7/9/26 3:13 PM, Timur Tabi wrote:
> On Thu, 2026-07-09 at 14:49 -0700, John Hubbard wrote:
>>> I'm going to post a v4 today in the meantime.
>>
>> If you have a spec, then it's either a spec or it's just a waste of time.
> 
> That's a little harsh.  I was thinking that maybe we should change the spec instead, to specify
> that if the TLV references a version firmware image, then it should have a VERS tag.

oh sorry about sounding harsh. I'm trying to communicate that specs
are harsh. Because they are.

> 
>> Assuming that it's a spec, then if it says "shall have a VERS tag", then
>> by gosh we should fail out if that tag is missing.
>>
>> Otherwise, write the spec differently.
>>
>> This is not a fuzzy sort of thing.
> 
> I thought this was a forum for discussing things?

Yes, sorry again, the idea here is that specs are not fuzzy. I'm
not trying to quash discussion, just trying to say that if you have
a spec, then you either have to change the spec, or *follow it*.

thanks,
-- 
John Hubbard

