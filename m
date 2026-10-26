Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.33
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792987513;
	b=GnmLBoIwSY3x9a6uCPSsHPxD/ZLJJ3KqGqQurF9lrUQ/zyttkkMEFU8Gkh2y4z6EiZhH
	 TYibztHoczGXi10eXFh1Guq7RYZ312hc22oLeUY+F/OMeRkt3V5jY3CBKUdU4v6pH5ngS
	 DSDyluzqb3tUzbT0WF86xZWDi2HhW/SGPf4ZyNvhiafxV+Wfx5Q7bYmPC09egqo8gp3ME
	 MfR/394CjG9sZV/YapNkE8z2GjRZaIZWN+WFUniy9noYczkgHGepy1shkuWwZ/lw/jnrZ
	 YaGpl22UmzU17WNtD9SebarZ3e1SZOTLMzYKZ5ySjGmXGathQWZKdgTv0zE1fWZhrow==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792987513;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:
	 X-MS-Exchange-AntiSpam-MessageData-1:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=7Sv2JAa4TsVUiCajayyKWZ+9/FbXRi0LTSkTaZ07JZ0=;
	b=R0vquOi+s8Zom4DOob8u1HSXqICDzfMYwB26ATb13mq9297v1CMWNlgCBZEm/33xPWAR
	 rUj1YL0CgUsXxAsk0mlQVol5WYEO0jX/NMmtFRbvEDffi9kuzTPdbQ86FDanrcpEZVIKh
	 ULrCojF9EtCU/J3F1e7LfuH08YvCm40JTpyTFLqFAEPcheAThu23yLZL3B0/vaefdR0sZ
	 DQJlPO8rfwK1IBRtBoaQSK2dyaOnt2/zAP0s3gh+xxNM0r1ZvC7vKl7rxBI0T2+H/KaE2
	 qUnLwTQlaTFC8rCgcgDzmbpgib9vi8w/1lELYWEyI4Ii4L2VYjM3Bj2XA0/xRNTJKog==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KhQoYQ7P;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.200.33
Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012033.outbound.protection.outlook.com [40.107.200.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB057606A31D;
	Mon, 26 Oct 2026 04:05:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB057606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=KhQoYQ7P
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WMH5gYTR0se1F1tiYmz/SC+lTNVqPHwjdKdWBOYCTwIi2oN6rPkuahvvj7fsZ949PeNgAOrOxTX6OXEmUDJ+GMUtSVwgUXqGYZ82In9ua78jbb4mn3jYuHAeIPyAZSWPkhk6tfkTeYbCoFtlLvL79AeiPPKvi7PhOYs/H89YXzPgYVhueMbrfqnkM/n+LLw7ISc1sMlGht7cnIse5QUpHhwq1PeTlzMf7XcfHj+oahFHKQZD+tjk82cw+CUiZhIduI6/U2KFHqOwmiuwCMp87TSk9LPb+83rsDqYSYpJFfaa1MK7XPmDl7hwDJbP8kcced1QFyp5pETaHl16x+V2Uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Sv2JAa4TsVUiCajayyKWZ+9/FbXRi0LTSkTaZ07JZ0=;
 b=NWfIl68aB18BlDoigwHF6FTM+511+2HLcOqoqVQI5jhHhdXaMnAdUnqetcoe1UApVGPxqrXjh1kPJU72vUuA8bOdo+KSOv/8Vnpy/vIf8qhBfJKZk+L+7QY27sAMjviZwo9m4aosP6s+DjyoJ6x8+xhY9TqBxBxr3Nmp6Hs0KV7NFDra/6OEUe+aSmcAREuLErov2wc6JWSVn56zy+iNrBJYyL9AAfLOAGz89FCTmqOxxpa+FU0OVoJ8irhoYa3Z4Fh3IbbIJPM5vgTkClS0u7gRYYw9y7jditCcg8Ug2aJHh/8EPwrprC0ebKHJGJcjEZloOyGCRfHAN/TZnREa9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Sv2JAa4TsVUiCajayyKWZ+9/FbXRi0LTSkTaZ07JZ0=;
 b=KhQoYQ7PJIhdxQ/G39HTySGJ5MBw98ZGCPZ1eFYcWj/d/BqMXIih8DG3BDjwHa7JaOVhG6xfb5B9xh23TlYR94r6NSo2ysoHTS3v0xqq2KKdab/eH8CsdMRfM+HxHQhGAxyPP/1rGUCLIJmHmJCQNpmtpdzPheM0A1NfJdoPzIdkytghDgBJD8ExU0/x3mwVLSwTIYayTTsmlva7JtsSfonZaaJQxUxkfr4HM4zUX0qNrKtzwGrgQJD8gY4QxlDWQkf7IUF/j/u2hnBqzQTmTkuqvnvWS1CZpemCepq0+R8QotSpz5YKndHbVtGCyHk5l+4AZI24UJ60X3OFEg1QDw==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6413.namprd12.prod.outlook.com (2603:10b6:8:ce::10) by
 LV2PR12MB999095.namprd12.prod.outlook.com (2603:10b6:408:353::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.22; Mon, 26 Oct
 2026 04:05:08 +0000
Received: from DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa]) by DS0PR12MB6413.namprd12.prod.outlook.com
 ([fe80::e82a:6673:4142:37fa%5]) with mapi id 15.21.0546.016; Mon, 26 Oct 2026
 04:05:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 26 Oct 2026 13:05:04 +0900
Message-Id: <DMEH0WG0MQGM.3N81OYGNMHXLV@nvidia.com>
Cc: <acourbot@nvidia.com>, <aliceryhl@google.com>, <apopple@nvidia.com>,
 <bhelgaas@google.com>, <dakr@kernel.org>, <daniel.almeida@collabora.com>,
 <driver-core@lists.linux.dev>, <jhubbard@nvidia.com>,
 <joelagnelf@nvidia.com>, <kwilczynski@kernel.org>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <ttabi@nvidia.com>
Subject: Re: [PATCH] rust: pci: add resource_flags accessor
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Miguel Ojeda" <ojeda@kernel.org>, <ecourtney@nvidia.com>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
References: <20260908-pci-resource-flags-v1-1-269f29f81de6@nvidia.com>
 <20261023154005.95904-1-ojeda@kernel.org>
In-Reply-To: <20261023154005.95904-1-ojeda@kernel.org>
X-ClientProxiedBy: TY4P286CA0114.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::12) To DS0PR12MB6413.namprd12.prod.outlook.com
 (2603:10b6:8:ce::10)
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
X-MS-TrafficTypeDiagnostic: DS0PR12MB6413:EE_|LV2PR12MB999095:EE_
X-MS-Office365-Filtering-Correlation-Id: b5119310-711d-43b6-f3f9-08df331652b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|10070799003|7416014|376014|11063799006|4143699003|56012099006|261009223027099003|261022105027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	lIhPvT+8YYr8S0xiOyih4hliNVjcWpPc8NPs9nckwU4uSKsPqEZRlMasyquTUWQEq0j7MY8TR2hrGdFinQtDVU+//m65ZSjkmWuSY45CJeiXKnsT/ivZYRhm5DqsGFqmP8wGPuUifm4mJ2WzMuCbadhenwDLF8cPCPBFbUvXfhxRsxkO1k2MAHYELOeYkRFbVMu7zqVd0+bLUrqCVZeNldh6nGXuuMzZVMTDTB5TJfCfmugYcJzDoarSNNRMFSxhQ7IpubqeLvPtFjK0qXq9mzrWtoz/+n1s+9CP44ept62aYegBe+V1RLolPa9QPI7bVFg46zguimvtbySY1f73lo5DGWVlQ70U92SpVzhIeocs6iHPIkUXmiStvIqOz3BTUiD4HP/c/ZCsqWndrZIfJIUYFaZVm3Wkb44J+hZwxkEW4QRzi8gidooMCbbDU3PvAwLzCKR5vgtor1UMUCOkwXJcUsjzzZPQZws6/n9XjYOVbu3r1Yc4h4TFvVD5HuG0EV5zja7AVMvQXiBsvidPx+qkmeBWqRfzWcU2oiJDBOMkcyrcIG9ErkzA+jN6ghYkHFSz9BCFbvxnPENeTpG+FZw02FsDoaKvcXC3YhCSMLrp1DSFBgjg8TM3cfVAObIPjBwajYPJqM4ZnessekAI1XrwLnNI3kOyjXZCj0A3Chg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR12MB6413.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(7416014)(376014)(11063799006)(4143699003)(56012099006)(261009223027099003)(261022105027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eW40MUhBbTZaS3E1cEM1WVBjc21uV2Nwb0dGYW9LYTZncEZXMnZiWmlYRW5F?=
 =?utf-8?B?Yk5MbTVsYzJIYUFvVVAwOFd4SWZQa1U2bkpoZnlqeFVFanU5aXpYRy9LUGxG?=
 =?utf-8?B?SXUwOHp3blFFSjVPTUs4Uk9oUHh1YzZGRkZKZzlTNGt2VWhzNFB5N0VhL1lY?=
 =?utf-8?B?K3Q5cC9hZ3N4Uit3UmZteTdaWUNEL2VIZFNUOHl5aFU0M280WmdVajNkSk1B?=
 =?utf-8?B?QlhMRUJ4V2lYNHlwcHhWdzFxTlY1TlYrWTNXbEoySFJ0YkFaM1Zzd0h2cVlG?=
 =?utf-8?B?YWV1WlZaYlljaWJWVGM2Nldib29INXd5S21rd3Q1NW5Tb015UTl5U1loenRj?=
 =?utf-8?B?OElZczJHV1pTOVpmTWpUWTltTzNaeFc0U0lUM0g0QWJLdnpJcXdHdE0xajZp?=
 =?utf-8?B?Y0hKSXhUN3lxNjc2VWtEOTdWSkoyUWp2MEIxZEYvdkZyemJVQkl0SjJWanpQ?=
 =?utf-8?B?MXdod1BaZkUrTkJwd2J5ZEJXRlpoSEh6TnVoM2hEYVl0bnZWbjRGdjV6Z2Iv?=
 =?utf-8?B?WHlCTkN5OTUyOGhXQWsrOUZCUjZTT3M3R3hkT3o2eFhVamlsZHRMbS92eXc5?=
 =?utf-8?B?NVM1YmV0UUJzNmxkRmxtTEpENTNDejFyQ1VaVVc4RUpQSkRrbll0ZEFRV0k1?=
 =?utf-8?B?OGVmVnRGcVJSZDl5SC9ubUNmQm5SQlZCckJsSHNLMFBPNUl5bm12cnBiT3ox?=
 =?utf-8?B?aUFOMFljOTIwTFNFV0JkS01FSCsvWlNPOHNzZWE0SGdEem9hNTg3VFFHa0lC?=
 =?utf-8?B?RkU0cTVpU1BPT2RKcmNQS1pNbzlTMWl1WFpuQTcweTY5eHd2V1p0bEJQdVZp?=
 =?utf-8?B?dloxOHBVb1BacWg4ZnlFTTdRalFPYzRqM3dHUkk5K2JPeTU0Z0IwYmZuVkt0?=
 =?utf-8?B?eDJOZCtKc3RXL2g1ZEVaS2NPbnh2alhSYzc5UDRPbXFRejl6TXBFejBkN2Ro?=
 =?utf-8?B?NUFwVkFYOTJWb1NleTB2blJtTGl5RlVXSUY3L3lvd2poY3AvZXpERFIreTZW?=
 =?utf-8?B?cnNEV05ZTmk4MWppKzArVUxQZ2Zwa2d0dXd0Q3BmclhscDgvRVpRLzhoVWs1?=
 =?utf-8?B?dHF4bG5GanJ4akRaQTU0NDFBbGxEUVJtd1A2enJYdGNBMEl5WGM3Y0FlSHN0?=
 =?utf-8?B?dXlKMDlBWml6bWRqbks4eFVnT0NSYmdMUFhvb3VoRDNPdE9PMUs4aXA1WFVp?=
 =?utf-8?B?MmFJSWZMNmZ4d0JZaHhzR2tuRGliUEg1WFRnRXNld1AwQ0tobzFzWjVIeWZj?=
 =?utf-8?B?UjB2R2ZhZ29xNVpJb25PVjFES2l3L2RIR0lZbnFDQ2dzanBneUhTa3VpMSt2?=
 =?utf-8?B?bjVVTkNzWktyZzBRMmpveW5XQmJ4bXdzZGpwd0tEa3F5dXBYNWNTdzlUdWpW?=
 =?utf-8?B?LzJRZUVFYk5rd0JvYUZiekRnc2srazZOOEJpQUlkZXR6SGdRODJwRzYwTkp2?=
 =?utf-8?B?WTNBUmZaTmdPaVJ4SmlzSHNtcFZ0YTBQakRmTTVnZTVMM3lVRlRzZG5MQzh1?=
 =?utf-8?B?UjRLWlZuVSsrRjgxY2xQb3hyRUw1d2N3ajB1VXhjWTM5SnhqSFIrYjRXZ1d4?=
 =?utf-8?B?aHV4TG1vK29CdlNDZDV0bmpCZWpGNEd4SHRNQ3J6eE9xSTVEeEVIQmZhVml5?=
 =?utf-8?B?c01ta0RtTmlkU3VjOHNKVHhlVlRzWURFaFFRbDhCcGYrRkhjYlkvTjM1ZTVY?=
 =?utf-8?B?MW5jMU9yb2M3T2VEZmphOVVsWmZnWFJPRFNvcTZkdVBjeFdiOHZ0dUR4bWJs?=
 =?utf-8?B?anJqZ1dlRFpBb0RHMEJvZHRlOGVDb0hpeG9seElIRkRUZWkvTlJGRWVzekdW?=
 =?utf-8?B?YnJ1QzNFeDMvYUYyQXlNTnM1V05DOE1xOFBRa1Q3ajFPcmlRSldNY0Y5WDNM?=
 =?utf-8?B?T1JZcXFuNGY5RjZVRVR1cWt5YkNHckhQQkRLazMzTTV2N1llVHZ5TDJOcnJk?=
 =?utf-8?B?bTUyTjlOR0huR0lieE0vc2FweDlSL2NBWDVwQzUrdnA5anE3TXJyZGdneVJM?=
 =?utf-8?B?eUFPcmxPdCt0OFZPaTA3ekJKVE5DYlRUTmN0OElycGpGUnd5YWZ2REpYcnkr?=
 =?utf-8?B?ZEVBKzg5bTFhc1hNd3dscGNsbnlzZjhRTU9pb0tPR3NGaWJVbS9VSHhHMStx?=
 =?utf-8?B?WFV3bUpPcGUyeWN3VE9jbEpyeDBtRzYxS05NTlFKUUhvWC9zZHQrRFNpOE4y?=
 =?utf-8?B?Mk8zWVMxQzFMY2VYWm5PVVQ4QWw5T3htendaODJtK0F6czF2dnRadnR1aTVM?=
 =?utf-8?B?a0ZjbkphYXZoK05FVGJJUEM5WXVEaXpGaWdkLzNtMlZ4STdPaVJ3aE43eFlL?=
 =?utf-8?B?VThDeitMSng0MHZhcjlzdzR0RjVWalZPeWpMK3VtZzcxK3lTMDJtWkdNb2V1?=
 =?utf-8?Q?w17ihFju6HB+c5taa4e1HRMjdIjvqj0uLMum6aU3LRCW3?=
X-MS-Exchange-AntiSpam-MessageData-1: lWhRHaPUKALmug==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5119310-711d-43b6-f3f9-08df331652b2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6413.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2026 04:05:08.0892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TedYndmNGZuGzzRjpuTIJU7WJ2PsTi2FlHQnsOvmPA7t5bm7fvRiAPnlfiYq+A+TWdckPVVnlNOnj2sIH1OJTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB999095

On Sat Oct 24, 2026 at 12:40 AM JST, Miguel Ojeda wrote:
> On Tue, 08 Sep 2026 16:51:48 +0900 Eliot Courtney <ecourtney@nvidia.com> =
wrote:
>>
>> +    /// Wrap a raw `c_ulong` value returned by a C API into [`Flags`].
>> +    pub(crate) const fn from_raw(value: c_ulong) -> Self {
>> +        Flags(value)
>> +    }
>
> In linux-next (next-20261022), on UML x86_64, I am seeing:
>
>     error: associated function `from_raw` is never used
>        --> rust/kernel/io/resource.rs:240:25
>         |
>     216 | impl Flags {
>         | ---------- associated function in this implementation
>     ...
>     240 |     pub(crate) const fn from_raw(value: c_ulong) -> Self {
>         |                         ^^^^^^^^
>         |
>         =3D note: `-D dead-code` implied by `-D warnings`
>         =3D help: to override `-D warnings` add `#[allow(dead_code)]`
>
> `kernel::io::resource` is always built, but the only user of `from_raw`
> is under `CONFIG_PCI`.
>
> I hope that helps.
>
> Cheers,
> Miguel

Thanks Miguel! I've sent a fix [1].

[1]: https://lore.kernel.org/all/20261026-pci-fix-v1-1-a6a69ee584d4@nvidia.=
com/
