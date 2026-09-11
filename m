Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011049.outbound.protection.outlook.com [52.101.52.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472FE4756D6;
	Fri, 11 Sep 2026 12:38:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789130295; cv=fail; b=XLNScCUNLk+tsfRdWAVyKELleH7gYZ/P36u+sNgWf74y9TxFzdfgRWSvrBWUbAjr/JAbeI2UqFd8fW4NTgAUnjFAfAS3MIBx+dA4YEO2N2B5SMGHFDLGeNl+izexxKxCsEp590dNPS2Y1r1Bw/tCzZELebFqsdVdzTzaY9DoT+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789130295; c=relaxed/simple;
	bh=38SzYgXwWZYL9YoFEK36JqvtzboLfNqyfW4gSBWN1J8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=bDFzB+s4Uc1HUfPW1jzn+0Cczvbr0Vjph2+Z7bs7++Z2XIA2/lMAlgfa1S9tJWorHLBQOk+onuzBqsy6bE1qOllWfHOdknEDvmI6TnJHzJpLb3OJMhodOHSIm88dzYXfJt2jgygqmprPtiwOr8p/fM9trxufTrV2R1bCpdHGQB4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QB5plWng; arc=fail smtp.client-ip=52.101.52.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QB5plWng"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vtt1evvNr9BvwGdtK9NOc5Ha+cObTvUy/XBQYahqT4U2/rEqAAzcaPLOehq4z5VL/6WZROdxKLdB94Bw//8bJZuuumlU1desNk+os/0xgNTmfWL2UB8ACPDXyKyy9vvdFoTa81GMtbDJsFHYKkwFMwGfWy33pzqWbNIbyQbLNnSdC4EWZq6R963nrDEIc4cXjC7fFo9qxxtoB3cb2z3LAofGAxoCvLljWpLxtA2Cb4CDXzV8aYQbkWLyn79FEAo0SatyXbzWZrPutKq1J+WpUd+uI4znAbVqzsP0hHUh5fz7RsC22L8cVsGj/voGX8vkDt31Oqd9ICPT7/ZmApIijA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=38SzYgXwWZYL9YoFEK36JqvtzboLfNqyfW4gSBWN1J8=;
 b=s37xVvV9RYbtrBQ4iFvgnNcemZjXlRHh03NrDBft5Hg8RmY0xx2qqQQQFdCBablngB7KEiA17kBBVmpkVFoTb8Ht2cxv4b19GJQ6E0HoPqw5elBN4N61nA3xJDdU9riEgubTVcT3v+PmI9IyjRyWTHeaDMdpOwkhnTKHHWT+bD3Hk0PVaebaCMuZmALsv2S7bbYoLdcEkcrT7WQesDcXOrD5aIt4e9PAlBItK8/9izMER1bAzm16GbubX/uiRJMWb45mnViI7GdbQpzc9gkMdh/LvaIBEVC3pt1o4r4YAocLzjMcxJJmrBMNwRPIlDbLlXLSBIUudmR4othWyVXJcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=38SzYgXwWZYL9YoFEK36JqvtzboLfNqyfW4gSBWN1J8=;
 b=QB5plWng4rsu1VIPxGtBNY1ST0JeXE3Ku+WWTGB11CBmQus2LrfIa2Qt+fuVOM2HZ1DRlZGExCBpAOPZbV3gfZKdebRM/qT7wNUMsX2xj0pJX+AzE81cYCcjSFSsSwazSU0N/jXUhxgFlJJ6LVBXr/0fuwRFZqRWvSpnkG/dF2TL0GWtiVYKeh98W7M5sUi5aYG9s5We9h7XM0/V+aEC23EDMDAVV7wyCQ5JiWGJxid9IoztiRbSOpNIMSAIrDJGdLOi4Ak3+Cm6Sui6+dCac77t4z99hpElERCkLEMPhOpd2VW4mp+ID4FLqYmH7ZuxM9BjdmF7i4T/dxHUtMlARg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by CY5PR12MB6369.namprd12.prod.outlook.com (2603:10b6:930:21::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.10; Fri, 11 Sep
 2026 12:38:08 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 12:38:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 11 Sep 2026 21:38:04 +0900
Message-Id: <DLCHR65KARVO.2UVL24EEAFDFH@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Bjorn Helgaas" <bhelgaas@google.com>,
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <nova-gpu@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: Re: [PATCH] rust: pci: add resource_flags accessor
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Eliot Courtney" <ecourtney@nvidia.com>
References: <20260908-pci-resource-flags-v1-1-269f29f81de6@nvidia.com>
In-Reply-To: <20260908-pci-resource-flags-v1-1-269f29f81de6@nvidia.com>
X-ClientProxiedBy: TYCP286CA0369.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::13) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|CY5PR12MB6369:EE_
X-MS-Office365-Filtering-Correlation-Id: 87976c7b-4797-4ca3-424b-08df10018824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|23010399003|10070799003|376014|7416014|56012099006|11063799006|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4tydxbwYTarKwe/0on1VPqOKUoh+xlmq5UT7Wl/UJ1Zl5p7HjcBu9hS/fvOMc/CpfthiwQEs+cV6MGXHje6Uod95fLMD4K5m41oduaxTv6UHmUE+MYFncd991U5x0PhKZKvxcnaert8g6sZFTkDN8Yeg0npSeDSqYmGLxtdu4gCxprmjfMhcAnhXWcnCr69hI1wtkpHrJ8rMrOhpOHwQyHeGODFJMsendriunl5DNiNbZnKnav48+XwlYK/Iky7YahTevdTODj4ictP9Ya2DwTbpaU0hpgOlnSSXJMZL3JWoWtfppNvYb0B1ys9glgcZ+DJizlkNdTS5L+vtGaKP1pgr6i0opJ0Ig8ooy3v5VXbMHfUxA46Io/bS1Db8EjLM3Z/Xv2FBdSmuVuSqVVY/u6Dzp17ivgHrJE6HAb7+AMfOJPB+cOz2Km3OR7KGfwfjjU0x7cSXSKOc996pXF1A+OsEtNJK6QcrWrYtvvgkjxI01p9bWFGB+O2K2KUUkzIV0mS9Gdaq3Cz5rfifd1WLKfqGs8aOW1g48+CE/T9gTJH2XVTt4z5ZWFzbE64m/cKZEalq+bIxxnECT1kYhf0pPAQRspHUQxKRzlcGSK0Ts/t2iELW+f96s16QjajcvQrXHDEE97e3CQv4E3DmbYzMEUgerE6WHuh0DQl8o/XtiaU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(23010399003)(10070799003)(376014)(7416014)(56012099006)(11063799006)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aFg4Z0pNRTZWWG80dGlNN2pFTnY0UnpLUVh5VG5nNEFGVUtDYTRrcndsTzVD?=
 =?utf-8?B?VDZUMGVUMXJQYlpCdXUxeW1MWHV5MjFSby9DZm5ZRGdwcmxxWnhWZ29ib1lz?=
 =?utf-8?B?VHF0QnRrMi9NdVE1ckNTS2ErNVBCd3AyOEkyMWdKZnlOZkxvdDFBUkNvS3dT?=
 =?utf-8?B?a1lEVmpXVElmeFQ3VmNIL1ozNGdpNWJOTWRqZ0xmeXNmaEN5OER0M1RwbmRM?=
 =?utf-8?B?SW1HZFdQay9mZmFMTGVwbnp0Z09BTjZIYWxoeXc2QzJ5SlNhUkcrUmxmazdP?=
 =?utf-8?B?eTVmVkdURUhqN3JGWTRDbDVYM1lzY0VsdVpEWEU3aFprZGhjd1JhYUtMSlR6?=
 =?utf-8?B?SUNzWU52UGlHLzRQbTVVK1k5SHEwNEdpWExqYjJlcG1qL01jTytpUFh4aEho?=
 =?utf-8?B?dkhXWmlKWFljT3ZFT0Jpc29ab0x0UUc3d3VabkVlZXdYMjVKUEpwcW1VK1pZ?=
 =?utf-8?B?aU1qZW0xWS92MjdJUjkzaTBBZjdzKzRYaUw2YmxFbk95bnptN1lBNkhjc1VR?=
 =?utf-8?B?T1V1SG1sVnpSQW9iNU9ESHY2dngxbEZ3MjdGSWR4ME16TWZnWm1RNyt6WHRS?=
 =?utf-8?B?dEhOeFE2SnR4blJTMnBDcC9CRFZEMit3eTBKb0sraVk3RzJPczFnS25ZV2M3?=
 =?utf-8?B?bFFJZ01KS3NHK3Fucnl5VGpHNXhuZnh0Z2xCd2I1aEdqME9YdFFvdVlnUTNo?=
 =?utf-8?B?cVNKaC9jVGJHa3hpM1dMR0VkQUZsSW04WElEcnNyTFdCTXliZnNpMlo2dEZY?=
 =?utf-8?B?dmJQbDBtTDFlV3paZk1RTExBa0pKMGVSNFBpbE1mTEs2aEhyaXBtV0JWYTFN?=
 =?utf-8?B?czVXcmZYazk0UnRpVUhnYUVQbFB4bzByNXZxd2hlNHpzS2crS3l0UStmaFVU?=
 =?utf-8?B?c21YWCtQWUtSNDFEVCtOWFRDSktzWlhMeUppby8vMkxXa2VQR3dDRkV6ZmhV?=
 =?utf-8?B?dWM4ME9CZTRpc0R6ekpYd01CY3RaNXRGaS9vaUdtVHlOV2RUL3Jpc3o2Y1BI?=
 =?utf-8?B?bGVuUDZsUlBMcitCdHR2VjFCMlJrRjZSNTh1MmNiREppQjFLcytvandLa3l3?=
 =?utf-8?B?Ny90eDF6UDI2RTdBRkxQdEdUa0xoaHptV3Q4RzZCZ3MvZ1M3aUpvcGx5ZnQw?=
 =?utf-8?B?eXErU1BZajNJYkZuejVTUGFSbVdMbmg2YmxBejJYVkxPZ0daUFNlZlB3YS8x?=
 =?utf-8?B?dmEwSHZtMG9kenhrU1hEOUVub3kwUW5ZV1FRQ0JpWHBEZVpGYUVPS2lsM1ZX?=
 =?utf-8?B?WW81U00wckN4SGZ2aUVsTzlvNkxCN1ZvNmRFZU1weWthK0sxMnVWRU9tck9s?=
 =?utf-8?B?UFpYVlI0SXZkcUVXNXZSU2ZPblpxUFJBZklObFVHSDErZlQ0UHl6d01ZeU40?=
 =?utf-8?B?OTN6ejNwL3c0SVFPUmFqc3NZYXpPNEZtRmg0dTUyK2Ewdmg3MzhSb040d3RE?=
 =?utf-8?B?WGNRcGgyMW9ZSUhpZGRPWXA1QXI2NTZWenVwV3VOVVRVOVhiMXNIUzh5c0Fr?=
 =?utf-8?B?S0M0WGtjSVpLY1I1c21sQ2RYODRtNDViamJQaEFYSFo3b3kwaGtHSjJzSGQr?=
 =?utf-8?B?UmdyWVIvSCsxVlVkd0RCaGlHSGZEZjdMVGFCem8vdVB1VXBEakw2aFNXWkdv?=
 =?utf-8?B?TGtEcE5kNlAxRWtsTjlsYjdEUEEvdFhOK2YwV0MvbGQ0MTAyYUU0Qk1lK1Vi?=
 =?utf-8?B?ZnJuc2VwMzJ4WTFhaFBwcTE1Wk1IOUY0b0ZTV2wwM1huZjJ5Rkd1bjFBQzZt?=
 =?utf-8?B?OUZsQkN0cGFoejhQSVhNMC9ldEQzUENPVzBMWXNxKzFWc3lsTHlBU24vSWtX?=
 =?utf-8?B?ZzdxOFI1ZFd5Z1JHbVBjNlhKdGNpTG0xVTI0d3UySnZmdEQvUCtlYURtam01?=
 =?utf-8?B?L2lCbGhTUjhuYytCazdvOHg1bTFiU1RNS2lxdXMya2FhL2NDS0RtUnhrSWR1?=
 =?utf-8?B?eTVRRzVwWUQzZDlEMkVVdlFONnFKQ3QyTnhaYnppcERUaFoveFFwRmY0bnpR?=
 =?utf-8?B?NHo2NmgrTndhZmhpaVJyMkNvMnBPYW5yM1ZrV0hJd2FqWmcxS2FZRk1HYjFG?=
 =?utf-8?B?MWZWYzh4VktOUnNxZEU3ZEM1eEI0OXFZZnN4Q3dLalBhbW1YcTlvU28wenVv?=
 =?utf-8?B?cDkraVFiSU9yMmVtV1hmYnlySmE4V2J0OEFPODhDc2JKYURuajF4a3I3YXIv?=
 =?utf-8?B?MUo0bnFhRmNpeWxuV1BjNlBLMFVWMmNTc1d4RmQxN3FpdjVLbFF3M0RoMmFO?=
 =?utf-8?B?MW9LZWc4bFVnZHRPRy9wekpPNWdlQWVDQVEzRDBIUlo2MWI1VDZQakloVTAx?=
 =?utf-8?B?N21hR09nWUdxZDdkTU53cUdwSWs1bi9TRlZmOGloN0RQYWlsL0FIUGRLc2k4?=
 =?utf-8?Q?4+sYzic7hF7RuuU4feRVu0pqK4jQjZLN3H3ZZxHpOo8HX?=
X-MS-Exchange-AntiSpam-MessageData-1: VugkxDyQq9Xc5w==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87976c7b-4797-4ca3-424b-08df10018824
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 12:38:07.9387
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLBWwLg38I4Y9Zy/SLY3+8i3VqeViVfpCCbm0Lel3C1gW6S+GRIryjCn4aOSjWqDn1+8rtCz9Kq2V988QeL76A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6369

On Tue Sep 8, 2026 at 4:51 PM JST, Eliot Courtney wrote:
> From: Joel Fernandes <joelagnelf@nvidia.com>
>
> Add a `Device::resource_flags()` method to the PCI Rust abstraction,
> wrapping the C-side static inline `pci_resource_flags()`.
>
> The flags returned correspond to the `IORESOURCE` bitmask carried by a
> PCI BAR's `struct resource`.
>
> The immediate motivation is BAR layout discovery on NVIDIA GPUs: a
> 64-bit BAR consumes two consecutive Linux PCI resource slots (the lower
> 32 bits at index N and the upper 32 bits at index N+1, with the latter
> having no flags or size of its own).
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
