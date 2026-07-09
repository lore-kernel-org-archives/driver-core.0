Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013056.outbound.protection.outlook.com [40.93.196.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73ED8339853;
	Thu,  9 Jul 2026 22:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783636926; cv=fail; b=mVafFQqmoF17wM7+Kdr5vSOuZSmER/mbyySJCVFzDiXQD6p/UKiEAm+CMnl6u8QVdBnMX+GP2SBAKI3fBOC/5upuUVviqDDMvUOnMKdL+AMmofgE+pZXZL2msiNq3GoztYGM6q+SeF+YFlMFLA2YOEAksLZSRg8QtpSVQkTRCHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783636926; c=relaxed/simple;
	bh=715M9r+Omhr5kwap8elJo/Pu1YpaocN82QzqJ0NIsbI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kPmFq08rbgxuGBZedtw9LHwij/R6JboJHCnX73iXhe60GB2GsZtb4jgo6zWiAq0kmCQqOw9NVOT2nonAFGUaXwN4j+3QwcG54PqY885GQ/wlDH6nxA+fEi+qG8GmJ5Xw7oQzl8xTM2eOXomx6qrGu7+mQVFQHSjnyDssF+kxgs0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FIj1X6MF; arc=fail smtp.client-ip=40.93.196.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FIj1X6MF"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b7CmMrBVym2OKnWVzHEBwR2daY20xpZbNsi48hbRBOs5RF3aMGUTIY7e7ix1EyUErIok8sIjfDnqQMGEdUQfijme7VZjun+o9eq6P2Wsm4HUlby0QWszP9k/vDswFzuXcq786ap5T3KebwBGHIkwhkSTmaZwsOo2fXHziJLdVnq3ormzsj9fWljiWRX5fSnmIlqfmTUifYz7Ne/csIJYEhJQV2hHoIdDPefMVQ0wJl85Qp0Z/E3/1iRZppCGbTD4rquEXCb1YZxuVDf/sEAqJhysKuI9RBcM8+H5LfIpU4N+Npzm9Y/yxCd0dOnWoUwYhwABKf64glOZd33NQRJbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+cAoLOhgAIcHp/p+vHbonDl7evR11QmmQH3whI6iXsc=;
 b=vgUy62ELKRhGvtC8gxQ3cLYsJR3l3q2I3KsYGwRaGtlfeq6/K85aZIfECHe2e7E4xtyrEglNsptoqlOFnCxqVgOe2ScyxxflVzlJ9hD/jK2iS3S/1TMxBcoqenCKMo+PDWlVuoQBRaQJSyyIi6AfpGoLG6DeZ2yRiTeJuJasBYyWSuwvvFlGi32Gm3dOa8/x9DAe1VO44ip8IYVzOiWV5vu7hqt2JusKTt1KIR/ExnR+3Fp3S/fDTNjhDmC/KkmRLXgYPPXge2pty4bvrZwSkbAIV8NbiDDL+Vxi4DRGj52FGo2ZkaBUkkK4gVWvuvlYhM3gYLJBrF3IdArCECd0Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+cAoLOhgAIcHp/p+vHbonDl7evR11QmmQH3whI6iXsc=;
 b=FIj1X6MFIVe/cvGhPdPYS3Ow9Oc3PJ4SJexhUyKHNo6f018ygZc6bGcP8ic7o0cc04wXDToF9gx0/w8fdLf/yE+vs1lkNgP8odY0LGQkmSX3cG8AB1lXiIam8mM1eBv1GFCxZ6PCiZllhxhnnSdOAntS93U7/es1BRrw6y0+Ow1AyTjIyh+KE+VMWuaVl+i2U3LYZkQq3Iw+G05w/AM7AV55jTnMf5SoLjMJxkBiYHy+Bzgp0kkyPvcKwO3v+vm6eDz9UJVmIYmcAp5cK14456TzeswPtuOvCkKki0HnkDOd3BstOCfANvbnLfyZ9uYmsybNlqjgQUvaNHPiTVXN9Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from LV3PR12MB9412.namprd12.prod.outlook.com (2603:10b6:408:211::18)
 by IA0PR12MB8645.namprd12.prod.outlook.com (2603:10b6:208:48f::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.15; Thu, 9 Jul
 2026 22:42:00 +0000
Received: from LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4]) by LV3PR12MB9412.namprd12.prod.outlook.com
 ([fe80::c319:33b5:293:6ec4%4]) with mapi id 15.21.0181.009; Thu, 9 Jul 2026
 22:42:00 +0000
Message-ID: <8f7a9763-1e96-4bab-92a9-708eaa526986@nvidia.com>
Date: Thu, 9 Jul 2026 15:41:58 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/7] gpu: nova-core: transition gen_bootloader to TLV
 images
To: Timur Tabi <ttabi@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>
Cc: "gary@garyguo.net" <gary@garyguo.net>,
 Eliot Courtney <ecourtney@nvidia.com>,
 "nova-gpu@lists.linux.dev" <nova-gpu@lists.linux.dev>,
 Zhi Wang <zhiw@nvidia.com>, "mcgrof@kernel.org" <mcgrof@kernel.org>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
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
 <fb1d6ebb-cb45-442e-bfcb-73d3ba82fbb6@nvidia.com>
 <e617f2a79322f05aa26d21492954c07f3b1b47cf.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <e617f2a79322f05aa26d21492954c07f3b1b47cf.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR03CA0144.namprd03.prod.outlook.com
 (2603:10b6:a03:33c::29) To LV3PR12MB9412.namprd12.prod.outlook.com
 (2603:10b6:408:211::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR12MB9412:EE_|IA0PR12MB8645:EE_
X-MS-Office365-Filtering-Correlation-Id: 2eb8f4b3-9524-45b4-3488-08dede0b4a22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|23010399003|1800799024|18002099003|22082099003|4143699003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	2fH5s+UQ231pWDAHaaNSavyOQYFT2UBv6PSfL1VDuihR6cKSdR5WTj2Ud9Yni2P1A1vuk/GfPOftu3jK8zO++zbYTjY+PQJV36y9n3pEOgGEKiNiC+EflYnxz+GvbdlhlQnpEEDtIWSycZqmbe//29Z8CfDGk09LDpFDG0OyGYG3m7JvmeEe4hKg+FTZi32kFyLR3Ua368NBXgvLbMZBpLnk5WSv2U9TTOT92wYMSmGKWzXzf5Ur/On+eDVKesFbjr68h8dBdtHaCdSSqoAqXPMKimYOUAm2VHemqV6uMvKUtI1JCC+Y7BFbSabfGMuUiYrPR7qWt+fYRNMYn2XW9Y4CEZMGr/JwVmR+amkpqDvuoLgIBeGkd0F5QVvx3yK1fN7jcM7DsYbRaLR2OJ7NP2uA6y1pOpWjck21dD2eN1LWJDqhX4eQOdYzVmcZm4J/x4U3ZwbdB6nOLIJXMjZKWg0rtfOqDVKAwFrgN4xLB7sCX4Of5MALmXoChkVlZ9KvOsuswLeYyprjOY7IlMwhzMABJ/3aWlYha1ySi/dJ6LmIEVobHIimCYr7ElL95mbSi+QRJwtJOj3Iy9yT9Tzh6Cun+Z9AevoLWOQjvME0C4hC7ASfHpvlJfxnaDCKbAKmXVnr8+o1Z2Pq7MM5UBjSAYTz8f8Af3GjwPhbal0l0y0=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR12MB9412.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(18002099003)(22082099003)(4143699003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2FwSHpiLzhhOTByM2t3dVg5SW40NXRkelQ2OFBWRUkyMVAxaHJKRU4za1Q2?=
 =?utf-8?B?OG1rajhXanZvUE94dkVLYU51eWQ3Yk14V2lZbDNCL1I5WW8xVGozNGZ4VVRC?=
 =?utf-8?B?bnhHYVc4cVpKWG1WdVNCQVFlYXl6cWIrNlJHWmZmaVdrUjBCWFFEdjRZWVRJ?=
 =?utf-8?B?elkyM09weGtFT2NUdURlK0Z3ZkIvNTNXQ1NLOGMzV2o3Wnd0ZStUcFdoT3dM?=
 =?utf-8?B?UGpib0xTZVBiSUZ2a0F6bWMyNnExQUE5WGtOYWJzYmFIU25uRENzNGpadUk1?=
 =?utf-8?B?T1RtNTAvL2RqOVFtTGJVSVRlcWlRMWpUTUkrVUp1MGI5WDJYeW5kR3BoYnNR?=
 =?utf-8?B?VG1yVWw0c1VCc2pXblpSbTV4T3A4Um9QWkdoODdpaTJlM01WOW9kQ052ODlW?=
 =?utf-8?B?N1gyTkh0b3RqRXBBemU5RGZtL2Rqcmx6cVNDS3l2MDlSUjFrdTFiaUYzN1BQ?=
 =?utf-8?B?U1FWUm1Wdnh6MWtYOEJudklsWi80endRKzZMZTh4K3hzQnNEMldDajhlb1hD?=
 =?utf-8?B?S0ZXV3FhZVVzUjhvQ0xvdTQ1WHdKN0lTbWtZSUdJMko1U3lmNXRSUEhtTlZa?=
 =?utf-8?B?dnlrUWM2aTlqME9ZUThQYVZjTWdTSkVDSEJFemloZnZwcDlqLyttSUlkRUYv?=
 =?utf-8?B?SlhhbGs3SzJhTDcvMTREcU9vSXozWWdhRzV1Ync1bzB0Uk9VcUo5UkxvM2tz?=
 =?utf-8?B?SEJFaEJDTVZtWGgzUm1sc1hVckFkVkNSck1ySk15ZDZiSUc4QUFSa0hCaEUw?=
 =?utf-8?B?U1l2MVBzTGoreDB1TVJWRGM1MzBPcU9xaHRMYktsL1FJMStkVXYxdVN5dnRm?=
 =?utf-8?B?ZU1aYkhHbG55QytseDNlWU15SjJ6N00zRHF3NklRUHlpdy81T0paQ0I2WTlx?=
 =?utf-8?B?R3VVbEl6aWVSMGlTTUtuQWl1QmwreEUxSHBiTHhLSE45TWRjeSsxaTdoRTVU?=
 =?utf-8?B?VDIxejJxS3R3UFFWdFIzYlR4bGNnY2pOVlZvb0xSZnRQcXo4Um1MTlBaNE9P?=
 =?utf-8?B?b1Y3UzJGN3BuNWVydHVhQ1pDbmt0U1F1K0o0WTFFVDVzWm9iK3pndWt5VFlR?=
 =?utf-8?B?QkwwdElWaEN6WUN6dGt3SzlzNHhCdnN6WGVDWW5NZlpxTE8zajdzbzV2NjIv?=
 =?utf-8?B?dyt6eTlWQkthNHhVdXBSMmdqYjZzd1dobDJjVUpmTnFsTTNQTk40SThUblpF?=
 =?utf-8?B?Wnd2Mk1wOERVMzNNVTJablVqU2pFOXZyVE1MYmo2bm5yQ2xKWk1nWDBvNzZt?=
 =?utf-8?B?S3FtcFJMdEpyKzBKZ216NitxR0F4SHpWNkJOU0pLdUJic293cEljWjNUZG54?=
 =?utf-8?B?Y3FuMEhPWFZnVnNTZXR0eElUb0hSQ2JEd2QzUTdxdlhabkNRL3JjckN2YnRW?=
 =?utf-8?B?MUNXeFZpdUhYNjV4Q0tpenFqWUpCNG5DTDZqSU4wWlBGTXVIRy9uc0dRVUh2?=
 =?utf-8?B?eEFSWElWeVFaM3NyUHA3WFVLWGlQL0htME9adjhhbjlCTjJmcE95aVE5NnBy?=
 =?utf-8?B?R2RyRkFJaG44LzJEVHJoQ3kyZU5oM0lVVStuV0RwdW1yYmorT2VnaUV1NThJ?=
 =?utf-8?B?SHV1L0hNWWlEbTBrL2FmWGNKZi9EU1pMRHUwRVZmWU04eDZxUGNUZThFcjlr?=
 =?utf-8?B?VG1mNlJwajFlVTVHa2ZmcndjeXh0amZrVjNqdXR0SjNab3pYK2ZxR0NKbWRR?=
 =?utf-8?B?VTRaMkVRelo5eHNvVlo2WHFrRm5obW9tcm9KNmNHRGtRb2RMcFhUQUxHVHNF?=
 =?utf-8?B?a3NDQmFHeU96ZGYyQWs5RUludjdmdXVnOEZSRE54dHkvTXczUUxZemJJdTMr?=
 =?utf-8?B?cHFueVZSeE1aR2svL0dkbm5VdVFVdUJmbmYrNytFaTJEZmZDZmhwNWVvNjZR?=
 =?utf-8?B?N2VHRjlnaWZ4UEhucnEyME8wd0lVZ2VkR2dwMGVKWnJ4c1hoZFJ6ektGV3Vv?=
 =?utf-8?B?R1BzZnhTc2dDY0k0RjAydkc0RkgwNndVc3NkTk9XL092THp6M2dIZUpMbk80?=
 =?utf-8?B?a21SUDNWYTFPUS9GSHd0VVhBb2lxbUl0WkxXUzFXeERjQm1PS1p3ekhrQlIx?=
 =?utf-8?B?UTg0SkF3VUF4QndIajhidDBjblJFNis5YmxoNUxET1hMaUF2d2N1c2cwcWE3?=
 =?utf-8?B?QTA2VjBlNWZMZ3BvZTY1K3V2ZSt1bFIvajVtY1F4YllrSEpDT1NBVmk2RzRJ?=
 =?utf-8?B?d2ZEdFcydExIbGVhRVF1UHl2OGpKbS9PTUEyOU5ZNDN1K3hldVFpMFJ5L0JX?=
 =?utf-8?B?VXZvbUxWUmU4c2NTZGNPa0YvTFNZWVdzSkJKQ3JnZ2pyVy83RHdmeHJwNm5n?=
 =?utf-8?B?ajI0VHNhbmFnNmNoekpMWHdhK1N1YjM4YWZhNkJQemo2NXRRMi9JZz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2eb8f4b3-9524-45b4-3488-08dede0b4a22
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9412.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 22:42:00.5023
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5lvfpTbESrLwsp+Vh4zzuCDDgXvQilj36UWjttMMZc5w2jg18+kk4Oojc5vuKsdF70pYBn23zL5uHHiv4TyzGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8645

On 7/9/26 3:39 PM, Timur Tabi wrote:
> On Thu, 2026-07-09 at 15:29 -0700, John Hubbard wrote:
>>> I thought this was a forum for discussing things?
>>
>> Yes, sorry again, the idea here is that specs are not fuzzy. I'm
>> not trying to quash discussion, just trying to say that if you have
>> a spec, then you either have to change the spec, or *follow it*.
> 
> Yes, I would like some opinions on whether the spec should be changed or the driver should
> reject TLVs without VERS tags.
> 
> I'm fine with either.  I'm just not 100% sure that we'll never have an unversioned TLV.

I'd suggest keeping it simple and clear: the spec requires VERS tags,
and the driver rejects TLVs that don't comply.

If someone creates TLVs without following the spec, then that's
just...well, I don't know what it is, but it's wrong and we don't
have to care about it.

thanks,
-- 
John Hubbard

