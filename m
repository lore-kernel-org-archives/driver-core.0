Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010029.outbound.protection.outlook.com [52.101.85.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78D4386549
	for <driver-core@lists.linux.dev>; Wed, 15 Apr 2026 23:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776295256; cv=fail; b=sctpBkZA6L/fF5hdmX0dY8plgv8XsamgcwhC4Y8LiX3cK+EQk1hXG+3XCQokWYaiMwFCyhtuCfwC1IuvTxWVH6AqQ6c2f700XyJdeSDXmMitnEOOK4SObrZwUSTq1gtedAE+NHQfTJdF/b5Ap7hMZQhYo7SmYpBRSU9Hk70cKhk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776295256; c=relaxed/simple;
	bh=xXHjJXFwwywiW02jad6bbvy2MrX9lZ8H7xlWEdF04r4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=f9wxPvCN1zKcFE7DBX9UMPf37k3H1URz7PMOwjUKuYHcE8TiI1B38OaDHvLYaWFIFcr82zNmLcv4Y2/JE75cA6NkhTgEPUqP0bYa36NaOQz4qjjgXigQaBDa24sOPzFKi5qmrh+760NDZro1mua4ixQKAiRcVJYYxNklOliyR50=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rxorZcGr; arc=fail smtp.client-ip=52.101.85.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rxorZcGr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fon8FhnQweDfaBym8P+TYUbGI+f6fcI2mDpFHJcBNbPtWw+M58vPJDJu30opoAfsPJC8rrD8XPJFOJbP6+dhdMhEAnfYCscvbzTCt1VhshWAOuPUgu3mzYwa45AnxKYy5b3tQYs9Gxy+HRqwLTjR+LG8hW9QtRUbWO5j96dNrFgryrIc5yFhgZvzzims3JIvFy6OPcy0wQatpe7mX7UJTU5KHEcwX+So2PuExdbBn2hSUuhcpbTFqXYVoSBo6YXlj1eHUaGh1sGRgajgDC2Eri6BUdvuUD+Vm5MCuzroTU18WDcJFvc3kcgjSvB7lYrK7KQv4Dn2RHkEhv7G+FZ/FQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C5tUcSYkASTBvWplQAG1kKiLSb/qKfi2+1+jHZBFEH8=;
 b=Az2I6oHVjEayRFeKQuPAXpGTVhzdbz0tElmMHklxHnR45SynuFmAWZ9XPfTqElWSfooLgYUUGGdJVYQuLqcBXQ7rf81k0XItD+YlJN3td2itiZ3ukUbwAYjCLt2fO+VERaJzYwa2iMCY4mm1DOnGYQaoHy1ykB6C3446uTKzSG8AwzKXTripEM0URV6Fgd8OWu+WkJGJadLCfAvgWCWYlL18fZffaHDR3bdxOC9uB0wDyHihz7Y0Qzvo5crjzNupG761sXXBdbXHJ+xM1TJTWfU2J8otS8/J6hmt5hZRiJ9luXu2JJG3snzrZYEq2ULAu8OUIox9cLbRiFT4P7B5TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C5tUcSYkASTBvWplQAG1kKiLSb/qKfi2+1+jHZBFEH8=;
 b=rxorZcGrHo215Jyr0nUJc6/XpoNiOkwzXwwzs1o8RHAZL+M6AOJwNXNZtC816clrr91SzHwiYus5AQBUPxPLHFQLoP/tMNsJxOotkCgIQ2jjU+kedlVKxO3Xkf1jZ8Pjl3WpYCJOST4Qtr2Rpi3tsZIVKiInEfvu3LwakMHqlM4MqjZkDeHZkncHsKW8xYzupgxAqvxquG4/hkBoK/XJiO0hU5KnNFHc9md62ImU3dbI9F6eGlsZ58dVLcoTCbM1++xFNSJINPJ3mTK+dF4FmVD6FeBmoXsA5fGZmZ92RzqvP1FZjtkuxIKVo4Z7OdJ0P6gjuYeAA0hIeoR/BviJxQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 MW4PR12MB5627.namprd12.prod.outlook.com (2603:10b6:303:16a::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9791.33; Wed, 15 Apr 2026 23:20:45 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%5]) with mapi id 15.20.9818.017; Wed, 15 Apr 2026
 23:20:44 +0000
Message-ID: <3bcc1806-396f-4fae-b88c-c79cc242cf03@nvidia.com>
Date: Wed, 15 Apr 2026 16:20:36 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] gpu: nova-core: switch to kernel bitfield macro
To: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <20260409-bitfield-v2-3-23ac400071cb@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <20260409-bitfield-v2-3-23ac400071cb@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY3PR05CA0010.namprd05.prod.outlook.com
 (2603:10b6:a03:254::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|MW4PR12MB5627:EE_
X-MS-Office365-Filtering-Correlation-Id: e2a07071-03da-4016-f0e2-08de9b459e62
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	RQNMNWw+3fvJXgamUv/HouZGvPYh8vytxpXJzc20mA6hqTi7pY3v/hsbjNnBJMIN72e9wnUAjW4IRkPKgQiWcW+s6aSU/k+WuCL6GBwak3GpTDw+i71gAz7h00b59nTkWr9iJTzF90Xf++a1dZUGZnAeN/+QuHQl87V9QGi/l7gieSz7rg6Iceka+iu7UFxIT7cTDzlxYcOjK4GLui0bMzeirvOxS90+esYzgHC2YtliFKcwn0HUZ8RdNw7DPuI6iNVDlAONB+g+feusTBAisnJRuPqhpo8Pfv9StmZ0A4xRnG03Ujo/YxNYB9p+ZitT3ljlEacQ9ShTp2jbBpDnmuZALFBviUIzdp1Ct6e3zvrxB/+3Qj3PFqc3vxGbqsHkf7DknumhnT8LSm0MRKXYCXj+q7TdjzDD2/uNxGwkPaJ+fTEDGo7JG6lau/5/OgQGM8hStpmFQofGoSgFp6ad3pJhWRabRw3GA1z88VPL5KBJeX/K2gZVPJ2jozuc6e7KSWbM1DjClYCxLohtUay/dUL5+nI3b8b9A9/UR7CTDSf6EIPkaHiWz6qUe7u+u8ZuGTjBNyoLSB5z5nrErp205vfVk7ZzvPqTxSkWR6NX0z6afyeXhN7hihtNizLD2P4imHFBA0PNvd7dJCShC0DQFrCw10/W7jrOzwa/QrKvOXN1rQDdLqI73KFED6C9VSChnDdIjFFA00jkEwMLHkzDK3omkVhUqOCkvSVu4hhG/w/IgY5ASpThJyMBtWcl9oPi4VQUxbw8/Qqrlv1+cRBgKg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NFpJM3RyUldYN2VvM2s3Um5wRG5ZQzk5a2p4VWRXa3g3ZUs4ZXcwaUxKeTlH?=
 =?utf-8?B?WjZtdGFJMzJ6dkNHRjdwVXJNMmlwRnpCSHlBZ3IyZDN0MzJPRnVWR3gzbmhy?=
 =?utf-8?B?bW8rTmkyL0xyelZleVFxcmdaYkg1S29yZjlFOTNsU1lXUWYyaFFTZ2RkdzNQ?=
 =?utf-8?B?cXBUTEc3YjhaNlFoSnBQQ0FCakc4NXhlVFFJZHRtNlVZTnI4aFR4aTVyK1RG?=
 =?utf-8?B?ZWZ5b3lnVDJPWHNpTXB2bDBCdUw1SmN4N3YvYUhkYkl2OWoyUUlhVFlDUnV1?=
 =?utf-8?B?V0xDNWVKMXdyOC9zUzhXYmpYUE1ybXNGblpMVmtmY0UvbENnMWJjNExIQklp?=
 =?utf-8?B?SnUweWZRcnNYZ0U0VXVaV090ZWRLQkROREdJOTNQTGYrZlNUSU5icmM5TjNy?=
 =?utf-8?B?Y212Y1h0N1VBVXBML0N3VmRlRlFheVpoalpDTU0zZWtSL08yN0lzU0xTbU05?=
 =?utf-8?B?UzVQWXFiWW42NDNFc1dTVDRPZ1UvYXdVTXJ2TmxwTFNjUGh5UXR2cmlsL1Jx?=
 =?utf-8?B?RXRLTUNIVVAzNXFpM3RFNkM0cU5wYWhXVkFCcmozWFBFK2xld0ZjeEdOMzVi?=
 =?utf-8?B?U0dBUDk2czBNYnFoUURMN0RERmFyMExFZkVDdU44RnQxQ3VKSEFRTEVhRUhG?=
 =?utf-8?B?ejY2dm5FcStPTHo2SE5wYmJHWDI0VGNhR0EzbDkvSE13amJwTEkzWHEvL0Rz?=
 =?utf-8?B?R0ZJam5qMU5odlpBOTIrZEpPKzNuWWhiOVovZjFLRmdCN3N3WFBiS3FOZ2ZD?=
 =?utf-8?B?V0llRXQzMkZEZDhPMDFqSEJFMFRhb3BYb1B6UElXS1NLakJrTEZHd29vRld1?=
 =?utf-8?B?U3lTNE82UDJYOGlZVUlJSFBMT1NzcGxxVW1tRzdjL0c4b2JYZ3lMNkhseWRu?=
 =?utf-8?B?RzFtdFM3V1RoQ01DUWpHc1E2YldCMyt5c21GUkNLSUMwRGpHOGZRWjRXdHFn?=
 =?utf-8?B?Yjk5Sk16cTdxVHBkU1VzVXFtRUNuUnZpSkxWTSsrZ1MrOGFEalREYTZ5TlFB?=
 =?utf-8?B?Q2hBMzdPa3Q4cnFuQWhVZ2JuVjUvNUNMWWxtS0taZm02c2RpYTNhV0lpNzBR?=
 =?utf-8?B?Q2NpZytyRWZ6Rm1zdkRINjBlc29ORXlhZWhDNklWYzUxOFdhTkVtSnIyOERY?=
 =?utf-8?B?bkZCcEpoZ1lVOFhCQ0lqRDk4TjhORDFDYjIrMG1ScmRFR3A2MVJ2MTU2Yk02?=
 =?utf-8?B?NzFCSjZzTEdVNDRPd2hhT1IzR0Z4TStvano4ZjJUQmViZURNS011Y281a3M2?=
 =?utf-8?B?NlpzUERzTTZRd0V1RnNLdVowazBZeGlUUlNIamhZMUZCVnNLNFJPdk5hM1ZD?=
 =?utf-8?B?NjFwK01MVEE3dGI3cnF5MnNxWlJSRldXU2gvQ0JmUzIzczV1SXR6SUJONTZQ?=
 =?utf-8?B?cy9wQVArZVFkOXppV2NjOXNkU1RCcHhaeEppU0Q2ZlN2OW9Xbk9pUmxEZW51?=
 =?utf-8?B?ZmRRT2t3MWpDWFV1bHdSS0xyZ00vOGNYR1YzU0hrRnNpREJVRjVLQVlaNUht?=
 =?utf-8?B?NWdYdFRIcEl2Y2RSNjRyWDBjcUxDQTdKVDFWaWF3ZEZqaFIxMk1CYmZ1NDV6?=
 =?utf-8?B?dUdmM3dsUDN4UWRIM1U1OGY1bys5K3B1ZzV2LzZxb1RxRGFBSTBDNmhpWG9q?=
 =?utf-8?B?N1dOVmFzbTVJUVRyUk1UYSt6M0pxbWwwRXV4T2VXSmpyRnNySjZJSzAyaFpU?=
 =?utf-8?B?WkI4Zit0bFZHZnlCdi9mMm9ZcklBUHE5SmxQdit4YWRLUG55dWNtTWVpZzNy?=
 =?utf-8?B?Z2I3T3JobCtoY05ReUhubGVCeERRaFpEVm1MbHVDTHZPQkFwd0x4OFRmdzB6?=
 =?utf-8?B?RmVmMTBDa2ZiY2xmNWxsUm1BWUhxcG96SHltYVFkN0VOWWxnRTN3ZmNUY2l0?=
 =?utf-8?B?amdCbzhrQnRNSElSRnlJa1ExYU9SOFE5d3JEandqODNyL3dKZnUyUDRnclFM?=
 =?utf-8?B?b09ZVmpNd3YzSm5aL1VHRndVNG1QM09UVFJJM2dUR0crdDJISlRqMWp0VGlv?=
 =?utf-8?B?Sy9ZdGsyQld1d0lYSk9xa0JBbmZPdVg5aEFFUkZyaGVPeW00N0NIc2VyWW5z?=
 =?utf-8?B?elJTSzc0VUVYRkNIZjQxaGV3QWt0K2V4Z2NMU1Q5bmtpTEVYQ1p4QUJLdW8w?=
 =?utf-8?B?cnY2Y2E2OG8vK2hsTjJ6TGQzcXdXY1dqQldaTjlXa1JYSFVrbWptNGt0aXZE?=
 =?utf-8?B?SHh2VE01L3dsR3FESjF6Qmt1ckJ5R055K0dEemVkcGYzYkZmcEUxdTluN2xl?=
 =?utf-8?B?aXBMNG5XTXMwMHBZeFBNZXBSeFAzRTlkT3cyRW03a1pOVnFhNzdlSWIwUXBK?=
 =?utf-8?B?dVd4ZENQWDRrSmR3TnljdFdhbVlHZFI2c2d0UEdMUjZvSlZoTHYwdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e2a07071-03da-4016-f0e2-08de9b459e62
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 23:20:44.7459
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unzrehXH09WNc5R7r3MSLE1jzwrJzdwy39UytmBjMtsmDDQ84nUowPoqI1m7xo/DtocFKVcaQXckcELpOmiqNA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5627

On 4/9/26 7:58 AM, Alexandre Courbot wrote:
> Replace uses of the Nova-internal `bitfield!` macro by the kernel one,
> and remove the now-unneeded local macro.

"and". :)

Translation: this wants to be two patches: a "use the new kernel
macro", and a pure "delete unused code" patch.

...
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
> index 0c8a74f0e8ac..a7f75368c90e 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -9,6 +9,7 @@
>  use core::ops::Range;
>  
>  use kernel::{
> +    bitfield,
>      dma::Coherent,
>      prelude::*,
>      ptr::{
> @@ -17,8 +18,8 @@
>          KnownSize, //
>      },
>      sizes::{
> -        SZ_128K,
> -        SZ_1M, //
> +        SZ_128K, //

Just a nit, but definitely one we don't want to leave alone: that
trailing // belongs on the next line.

> +        SZ_1M,
thanks,
-- 
John Hubbard

