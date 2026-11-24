Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.88
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795530690;
	b=wFyRgrtAjN9TWPhYnVJfk82mML/ItC2+b7+2znWIryik5mUMNqpjQ1ESMtp1TZAg0aQW
	 IjqSkXljrVZuvyjshg5i56bZItOMuu/7f2QzSG+GIuAO/k8IS1mhHdl3UhYkG2BScCWea
	 sLHq8WQAGdZE3cLaRgJ6a0B1WfPsrkfj/feqk1p8+ic1RQE3e7zePDZoNSyCVFgdGV8H0
	 AO2yAOrwtWi5oLIMvFxSL5LhGpKoW8p8xfLI+lRBi0pYPpV4Gfy4VA/Lp0WTDaCvckXLa
	 3zU4HRHG4Y91v9Kjdnx/dB00+nPAkmxlxRwjBhklknTOmz3Mo9enK5x3HCu3mN8XEjQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795530690;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 Content-Transfer-Encoding:Content-Type:Date:Message-Id:Cc:Subject:
	 From:To:X-Mailer:References:In-Reply-To:X-ClientProxiedBy:
	 MIME-Version:X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZDM/Lss//i8NMDBO/F5exOiQ1EhW1ymITOIW0XUOFqE=;
	b=X9qcvBaBrmVQEY6zR4HuYboQL4vZFEc5E7HbjTViIk+XYJkgSYOy3jZEzdSuMJ2TCRTS
	 nTQqoxBNDbXXl/LFdfQJ4lcNH/xxUOy22x4GWkn9/qpVC5+VO029mi52/zkczwZW0SLMl
	 kHYNrguZNPTXB4y4AIMhC68vDJHH8y3S801psXVsoTyywGq1LVQWqt5bLimcsoEM4Gw7o
	 W1Az21ar32D22IISctdKdH7RcNde24aP4VYCM9s57Zfi6vdxsX0LpkDflnNqlPsJ8njIy
	 9zTtz8IS82uU5xPYCPiWcen8SmNrNkm9ym28ZLmNlWPVVNrKY18xTb3miwWaiJgS78g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=garyguo.net;
	spf=pass smtp.mailfrom=garyguo.net;
	dkim=pass header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b="lkeTo/Q7";
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.96.88
Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022088.outbound.protection.outlook.com [52.101.96.88])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88403606A321
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 14:31:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88403606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=garyguo.net header.i=@garyguo.net header.a=rsa-sha256 header.s=selector1 header.b=lkeTo/Q7
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RwQp00wMy/RqGIBuVNCxjYEpWUZHCwautOJkhpfR+7trtn8d3IeVUznbyajN4z2fhDKs+lxH9T0D374rDFzZVjZk9+08ZjkL1lRI2YvNFU6uEGukNy40BQ2PP7/VIiGst0SRYgDyOYAaxbexpPocFUadB9gvL5N+4C71MS+kM7AlbbNfVbyTp6Q8NTQ+VvF7xUG+qgN8R8OjZ+6tATnhKgjNnOWPLfzbKV0J3BBDYrsuNw5PRlwJBTqK3TgwpJMRyueIEUqgsd2mUpxxw5Ucyn0teC7sDDHowzvBAwZ5vNH6XQWmkbFNjsa8JHRyi7o1dqaIFMurqQG2xlptEyRLSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZDM/Lss//i8NMDBO/F5exOiQ1EhW1ymITOIW0XUOFqE=;
 b=PT2plZzh9CsEo0WqVgFuJoEAPoUG6a9tm+pSkP3Am4Y1GbAS6kih5W62CETbKG3ipZOCy1mue7mdL7Em0d67CL8bsNEy6foE44PBR29c9rvaYw4lajl4bn+QMxlAzoXr78NMWG4TZZT+SbhvVIj8KePit0Cn2Vgp2I/M0z0gTEOu5vwKU0coPzSOG2O9wWVRy0k77Yl1UZ+hyNR1lqv+ieQ0Gql3+AROEZuIKnr2LFCNdO5Ng1BT0iNyetGzkrgjh2n5Xrvl+kL/LzPZkflrEKlb5ddLcAUQRic4nzleM2KFsL5vlLg7IznyirE8Y52dGVMmAK7bOfodvsKzG5ywsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZDM/Lss//i8NMDBO/F5exOiQ1EhW1ymITOIW0XUOFqE=;
 b=lkeTo/Q7qQh5wXUPuxZfDjCp7aqhr5P1myv+TDRfLa0EA/m3pQ9wW98CR3j+PZRjDTFf/qkG+fQN3Ofw5nzkl3i8X9Umhn3QKuSltVv8NSGOuj2VuIYjobtmMPTuwAxd6WUDYyancK9Gcyz5XetZego6mvTJk+Q24D7Zf+dS8Fs=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1cb::9)
 by CWLP265MB5849.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1a2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.639.14; Tue, 24 Nov
 2026 14:31:19 +0000
Received: from CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3]) by CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 ([fe80::55f6:f98b:7fad:c6e3%2]) with mapi id 15.21.0639.012; Tue, 24 Nov 2026
 14:31:19 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 24 Nov 2026 14:31:18 +0000
Message-Id: <DN3II6MGM5KW.364GAZDJSKNMU@garyguo.net>
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <tamird@kernel.org>,
 <acourbot@nvidia.com>, <work@onurozkan.dev>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2] samples: rust_dma: add missing newline in dev_info!
 call
From: "Gary Guo" <gary@garyguo.net>
To: "Ivan Borovyk" <saref012@gmail.com>, <dakr@kernel.org>,
 <ojeda@kernel.org>
X-Mailer: aerc 0.22.0
References: <20261123010430.365536-1-saref012@gmail.com>
 <20261123230618.375172-1-saref012@gmail.com>
In-Reply-To: <20261123230618.375172-1-saref012@gmail.com>
X-ClientProxiedBy: LO0P265CA0001.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:355::9) To CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1cb::9)
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
X-MS-TrafficTypeDiagnostic: CWLP265MB6051:EE_|CWLP265MB5849:EE_
X-MS-Office365-Filtering-Correlation-Id: 42acf6d5-e3f8-4fc6-2153-08df4a379b15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|366016|7416014|1800799024|376014|10067099003|56012099006|261026140227099003|4143699003|261021121427099003|261022105027099003|261021123027099003|261102123227099003|261028144727099003|261009223027099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	dfCpMhKDj+YC1xWCjNk+Iz/1QzxFTa/uOrKX7M6Fiy+AsxPnUh10A/7uMsPYDR8zaKKfszOeu6HH6y14AGsInsKGxJ/D0o7uZH+ypHGm4eWEblEEc9K43qGzNnqjHULFGxHl/nI+4XaWVioYvzcvgCR99ESJ/ROIZXdVh+QbIxg3Nn7GWaJYrVHlplpzoAYAe6IKW3wC763kNAmQGEtiD7YqO4QU5JG/z/aSGUufNQ8dOtn0VEgl1BSuIHJxX5oFlBRkG0ekrDF/3jh64yquxOvxbTUKt49f+nRw97shpu5o43PQb1FHSaCbostnbSGAhc6IPH64owMsOcP4DF+7RbNFoBYstRkYBECYXMU7nNLsP7mvz5R1jhYw81YrZJW8KHxqfVxESGRvaQi4nI2kkAH+JU9xj2Xbt+vqusY8aYk2CmR+wyQ4cyU7pRIQI+LGDndzGAXDG4l4xh5Cs9bAtqpgKIw217N8D4Ek+II8gzP4Jbnf0MkHdYLkIFaPOW0oT8/1NM+S4iGv8ZCYgt0HEWOCBiC/UG1VQ/DLmun+qy+Z2+F+CAtSuU/YETZsLO4VsIu6PTdDKPaEKr4rSt3EmHD2fdQRRQGlU8Rtr53HcDw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(366016)(7416014)(1800799024)(376014)(10067099003)(56012099006)(261026140227099003)(4143699003)(261021121427099003)(261022105027099003)(261021123027099003)(261102123227099003)(261028144727099003)(261009223027099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V3Roa01jSTBnaVhFRGNYNGM5OGVocG1FUkxtbEVFMXd2UUNQekgvZjZYRk5M?=
 =?utf-8?B?M3piM0JTODB0a2NDR0k3WUZ6dExUWWowZEVTZDk4NmFjNDdxcm5ESlExcUJF?=
 =?utf-8?B?cDUvTHdHQ05seEw0REJGc2U0dEJsajRDWFRiTzZDM2c2b0RkQnZCdmtSdjln?=
 =?utf-8?B?TGJ1cDEvZHkwOFQ5Ynh2ZDUxbm81bXhrSFZtRUtodjFaMCtWaUtjcTIyQURJ?=
 =?utf-8?B?N0NaYzg4RGFZZ1lCdElSRzU4R05yNXdwTXRpc3k2VFFsK3RUazlNaVpLeTIw?=
 =?utf-8?B?b0dsQ05rZ2JqdWxGY0lUQ0NTUFIreTZyUDZ5SFR1aSt6SzA3YzBWSEpvNGVu?=
 =?utf-8?B?cXR4dHlkT0t3L1Z5RmEwQ0VvUGhDL25PNGFhMTVZaHA3YkpRdTB4S05IYlRK?=
 =?utf-8?B?T0I0ZCtDaGJ2NkxpUE9WNFlGRHFOdFJya2tXSUEwUWcvaFM1NzVCdExQYlZI?=
 =?utf-8?B?MWRqTDVMbzFqd3F1a2tjdlRzT25FWnl5QUI1WXFCTDJpY05NVDB0ZXJ4MG12?=
 =?utf-8?B?WTZVcURBWHZYVWhVKzM2bVBSWVFrN0FuV0orTHlHZHJXTmhFSHFlTDIrOVhM?=
 =?utf-8?B?ZmNCVW44ZHMzREJ3K2gyNUlhU2MreXlXcUNsM05FR1N2dFpYbnM2NWtnUmdy?=
 =?utf-8?B?MjRnM0syT09wTkdoV3ZyU2NhdEU2ZjkwT2ZYck5RZVFweGVkaHdrZFA0QnhQ?=
 =?utf-8?B?UTJyYjZ4aVI0YjZoR3oxWTg1TnNTWGxXV21PU1FpUG4yRXRaVkFhczl3NHlQ?=
 =?utf-8?B?UmVRTU9uNVlLUXBPcEpKblplTUJCUzNxRFhwMDhibm1wWGNkbmdkMEI2UEND?=
 =?utf-8?B?RmVxY2pQZVBYT0VXa2tFWTR2N2IxWXArdkEyMlhmUUcraHgvOFZyeVlPRkJK?=
 =?utf-8?B?NVNMSUNoVTBVOGpsZU9LQ052M2QyUXRjOTQxTHB5cXNlOEt3VmlHTnFKNW9M?=
 =?utf-8?B?UlRTb29ZZTYzUGdtdlROMElXdnJobjc4Sk1HTTJlSGdqelM3NnkwU3pGd3gr?=
 =?utf-8?B?YnZRa3JLRjlzaDNnRTEvYmUvNE1GRjExSFFTQ3cxUVRqcitJMy9kQlpoVEQx?=
 =?utf-8?B?bXR0R2Y1NXUvcURkK3lQbGp2RXpBbXBKNVRNRUxYWk14K1E1T1Y2ZE05Mm9q?=
 =?utf-8?B?V0JHbmNjMk9HTTNLem5URXdLNmZHUHlyaDBuaU40b1ZBQUtWbVRSdTdKVW5V?=
 =?utf-8?B?MEFSakJEcmN3a1FEK2dpUGtibkQ5QWpvdmRPVTBvY2JjTDNac2VxSEJxQ1pX?=
 =?utf-8?B?N2xBT3gyMVdqQzg2cVZickpxNmFhSUJZZTZPK0VULzFTVHlGRWt6S3RsV2Z6?=
 =?utf-8?B?SXlNbnllWDNZVVk5YnhDTUk5b2llSkcxbzl1S0NVcXV3WXVqUFB6YUdTcjdR?=
 =?utf-8?B?NHMyY1hCOHRiem1xZFI4K2YxRUxZZHRpZGkvUmo4NnhCemJyeXpkSVZ3Wmxt?=
 =?utf-8?B?ZnBYQmNFRERPdnU4eWQ1RGhDMm4zN1RMKyswV05xRGJ2WjJlK0hJSDFtdDln?=
 =?utf-8?B?b2Z2aWFMNG00N24zZ3ZwbHhSWkVtZk83VTJVMi9LTVRzdlk2OHcyUHAyU0l1?=
 =?utf-8?B?N1hFdDhiVTlweVZJcTNNNEZHTjhkcUo3RW1uNmpkT3hUeWpmT08xanJpWENj?=
 =?utf-8?B?dWJYUTloa25nNEU0R0dWZTFIa0dTSWJuZWdrL2tMUnc4NUFhTkNQT2ZNRXd6?=
 =?utf-8?B?UVllcWEzcGtlTjhxejVKNnhCQnh5cEJ0cXo2Qkc4OGxCUU52QXV1ZFAxYkNq?=
 =?utf-8?B?R201d0Z1OUprMDN2WGRELzdoZ0xIeHVXRmc2MzI3czlkZlhsMGt4MmJMZHJR?=
 =?utf-8?B?R0hTand6WUJwUGlhNWxRUGV2M3UrWnRwYUNHdHZUa1ZtcDNlbzNCTlovRnU3?=
 =?utf-8?B?WG5xV241MmFVMUMzUXhGV1VBdjJwL090bHZJUWdmYXpjKzJWTHlvVDVwN0pL?=
 =?utf-8?B?eUxUejNGMWZvQmZjbVVSOGE2cXUxWkFzaWlGMWxmcmhSb2N2TDRWUXh1bWZN?=
 =?utf-8?B?SythaDRmekQzVWlTNGhhYkdTenpsVFNpUGpTWmZSTDNkcEZJaWZTRWZ0Mk8v?=
 =?utf-8?B?QjRvSG55bnNxanNGMlpZTWhiMnN5TjlFQTNIR2grUk5ONmYvVmpJSzc5NDhE?=
 =?utf-8?B?L0pwa2Uwa3NGZ0hONjZDdldTUFVRcnRtc2NQOFBKeXd5bTd3OUxwTDhJaEdV?=
 =?utf-8?B?MEZZU3FZT1Z3RFBEWFlVVllNSHNVUERkYnAxRFVIRjMzM2o1ZEp5eDRZeDRM?=
 =?utf-8?B?cCtEWnJYNW9DaUREMG5PZTNMdGxySjNBclF5NXVuMVZiaDFtVzRPRFNoV2NF?=
 =?utf-8?B?aXlGajR5L0R3ZjZGM2trTTl3U2d1ZWZuU1dVSWFDaHRGcDBLS3cyQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 42acf6d5-e3f8-4fc6-2153-08df4a379b15
X-MS-Exchange-CrossTenant-AuthSource: CWLP265MB6051.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2026 14:31:19.6908
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LhacopCnudIzA12e9rqKSg0bTB7BzflKCOFXll3boPQlQU/BpFG2fzPuk7Jfu/fqQIrG1myoFDG1Ci4FrzMeKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5849

On Mon Nov 23, 2026 at 11:06 PM GMT, Ivan Borovyk wrote:
> The dev_info! call in PinnedDrop::drop() lacks a trailing newline in its
> format string, unlike the other dev_info!() calls in the file. End the
> format string with '\n' for consistency with the dev_*!() and pr_*!()
> macro conventions.
>
> Fixes: 5444799d701c ("samples: rust: dma: add sample code for SGTable")
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: Ivan Borovyk <saref012@gmail.com>

FWIW I have a series that would make trailing newline optional (although I'=
ve
not got any feedbacks about whether people would like that):

https://lore.kernel.org/rust-for-linux/20260728-printk-v1-5-855606634d70@ga=
ryguo.net/

Best,
Gary

> ---
>  Changes in v2:
> - Correct the commit message: the modified call is in PinnedDrop::drop(),
>   not in probe()
> - Reword the rationale: consistency with the pr_*!()/dev_*!() macro
>   conventions rather than log concatenation
> - Add Fixes: tag
>
>  samples/rust/rust_dma.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
> index ffb693544673..b4b161896517 100644
> --- a/samples/rust/rust_dma.rs
> +++ b/samples/rust/rust_dma.rs
> @@ -129,7 +129,7 @@ fn drop(self: Pin<&mut Self>) {
>          for (i, entry) in self.sgt.iter().enumerate() {
>              dev_info!(
>                  self.pdev,
> -                "Entry[{}]: DMA address: {:#x}",
> +                "Entry[{}]: DMA address: {:#x}\n",
>                  i,
>                  entry.dma_address(),
>              );


