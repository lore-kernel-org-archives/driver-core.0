Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021131.outbound.protection.outlook.com [52.101.95.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5867434F254
	for <driver-core@lists.linux.dev>; Thu, 12 Mar 2026 13:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773323498; cv=fail; b=B6BeiuTWS7+2F0ZfU4iNf7A9s3uxSlyCZfiIPCSckM/R9Otw5dfxCZoqy2HoSGHGEsw1Dak12SYS+oSyo1w+QIoIRI3Nimo/OekLghxzovnod7ITbuKP53JEEKsi7LCNnTrZqZVi1T5rBFP1xpo0bM8aTVUaZYPfTJJ1lc6vCV8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773323498; c=relaxed/simple;
	bh=s+/3Fy5UDCFB9KPCdHZjG+wKkH4lYZy7hzaENGcl4iM=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=VuMlqRDZbpbOzLEZoRmgCVn38CGX9KL7Ae1ZaLFV9eKg2RtPYCIaMpu1iECV6AzWvhat8RB0AM10aTx362Dlb9dNO2DO3Bx3jEUNsqSP5p6uJDiXjesPLFIdqoI3VvWNm6pzB60iSGooZcMsF0GA4N2DTNlrjQ2dDBFSa1WZ5cM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=r5c9k2km; arc=fail smtp.client-ip=52.101.95.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="r5c9k2km"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SJa9HqWlhhQS/H3vxcfd6fzyhc34AmwISwznEGBXTvMCPnQUicpkF3BGtvVwTKclv3F+CUZEbx0Jxgu+MCiKOAXid+fEYvCf25PxryhPcxiExbMlfGc/AU5SI8E4GSLW0mMJV43ZKpq2V5yldupcipIZOgv1MlHOnLI5cUOawP8mYPWJnS7vFJVk/jGAEUjOmRQbnKzKZkIxo4Tzj00ALg8OkHz4ed+Qn5oStnMicnRw26wmHR9pO/nUGdssW9eiEWB8su9N2wmhDojSQyvcQTJjxwiU3tSZoOw9ZiT6iPQi8v+1AmnwaX8UxLK5/N1glfi1uqNxI165X8pqWAIyfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=79pBc7Hg/+T7nt97WWxgvlwnCHFlDe/fUPrNf5IYeOc=;
 b=H4XCDbkkqCuJDOiW7FDnpsEhBhd5EUMoUjhbjau//exEshJ99R+q2ITu/qn3WbvrISJ4xnDqt2LM4qS80J4Z4puxdIGQLY5npn6ZMvINKYjroucTBp1W1nY6w2tHQ7jw95TVdSdnVDKeGqQsn/WA6IyN6J5YyMuhRgqLhErzgejKKvzLS5vt3lFtksc9BtU/Qpd40O7mzf42WwhIq+KV0Joy1WMdGJEBz74IxdzC3PhGoi5gHvgFV1dUBTWJOb6sbyR87vQp9FDfZTefKaNv0iY5LSz8WGISg1wEi26TcQE9QHowvWtf+HC4PqeoCd9a2oDE3ZFH2F5MQDeyP5afkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=79pBc7Hg/+T7nt97WWxgvlwnCHFlDe/fUPrNf5IYeOc=;
 b=r5c9k2kmuPMDimLa4qsFryS+vXpj60GrGNL1S1L8/a+V9ATh/ud8R9oGJhdotgpOYYzH6cw4kdagwe/7r9csnCznjcTCVwIvhT1eRw5P1J5jDqF1UwZZUV4vnOIdQBbbRKSmCOBuOBz0cmYe8sWOm2lg1hk13VyRlvLbtdlEnPk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO7P265MB7825.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:419::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9700.15; Thu, 12 Mar
 2026 13:51:32 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9700.013; Thu, 12 Mar 2026
 13:51:32 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Mar 2026 13:51:31 +0000
Message-Id: <DH0UPPMZPLZO.9VPMF77QDPUT@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>
Cc: <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory
 initialization
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-5-dakr@kernel.org>
In-Reply-To: <20260303162314.94363-5-dakr@kernel.org>
X-ClientProxiedBy: LO4P265CA0137.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:2c4::15) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO7P265MB7825:EE_
X-MS-Office365-Filtering-Correlation-Id: 5760e7eb-0852-48b6-6068-08de803e77f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003|921020|56012099003|22082099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	ajD7WbvgcWvXIpsbgbT5ojp9kfvrQLw7ipsQs7AfmH4hqdxt3AO52cPhyQiP5l2arnK3i/LqJY5Jda9Jbd/kChw+VLo9dDItRaKQN3fubMb9qf7pqaD0mif7QmwbUj4plg8tzTdTlId5+Rv+P1FUxL8jS0KMMUwkAQDEPg4B5Ge/00/HvLLItL7FDuPMXQVXi9NSjkewhV/CTtdk2ttGDiytRC5x/8FYXRpcvVKJKWpExGl2obgL3Zi9MsTM/QP/EPS0ENKN0knRQOzfBblGRU79LYoY3gdutu6RslzgMBpv0J193dP/keSZ/Ca2GiTGeNGWpP8RJth2HoCMUViD0PUy4rT6VbKRgJJSgEDvuVHYUNY01DAQPHb0pnJ3CgRjCicwm+N/s0aynEVBOf/CTRP6MJvpiK5QYl3tN+pro4YSCPV+l9Y5A6gxPqO4vjnIsjG1dwsfrAaomcbqfmhRNAvtpM8oKT2QRtDWbdvRAh2E5BNYgJ4gOPK0o0SGEDjYvkskqA6MrrT1uH9YvQ5kDP7gFlT4+fyX5iNccC+A+1Z508U7RgLU03iQzA4bqlvmTRYJqlttfmAvhOp3h6eQE3om5G6dxjHKNojNX/h8VxSYvvAK6AlhTg24hiPwTdCjw2x0/XFV+lEcVvRCE4jGIw7aYChF4K1fBvsFWGwe2Poo4Mt6eJh6LB406PE8yyYAltj+MgDdG+MOa8wlGz4bD6dfXtY6YRdb9mLr1k15idWZnLJjQB2LeQGdAOfRromxti9GmcxjK3IFdCPKx4WfOg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(921020)(56012099003)(22082099003)(18002099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?M0FIOFpmTXUvWUl0cDJmM25EWEJWMk5PVHN1bVJyc3h4SFU1ZXdobFZvWjc5?=
 =?utf-8?B?Wno1aHN4YW8xNnF3N1I3QWg2aHBKaFNJamNxQ2ZmdTVJZUs0bndlYy8xZHRo?=
 =?utf-8?B?MnRpSW52bnBwMDdzZWxZc2hJWnB4M2VNRDBsSUEzREFXRXlCeEJTYUREaVVD?=
 =?utf-8?B?OFFlOXYycjdKK2JqS1RrdEYybVZkUVA2dDBocmdGRElKdWM2RnFlU0RHZjBq?=
 =?utf-8?B?TGFnNVZBaVlHVHBaYXVManU0TnVweU9ObXJEQWlZM016clp1WU82OVJrdkZi?=
 =?utf-8?B?RllLeStOSHB3cWY1SlpsUm8xTS9PRnBZM0JhUVpvcFhGbTl4ZkI3WHdOSmY1?=
 =?utf-8?B?U3BuQU1NRk9RUFBNUFlzbjZkSmx3eXVEcGJTemttK2NhTE1wVG9QWHc2VE1x?=
 =?utf-8?B?aFZqRnZoTnZYNTdXbzh1VmMzdFg3TGlLaE9KdFJWSUR4M1BjeWM0UmZORklp?=
 =?utf-8?B?YWlTTE4zVXNhekJ5UUpwcUN0MlVDY1F4bkcvSkJtMHdVdWl4V0o5amltMkxz?=
 =?utf-8?B?K3pRWitFaHRLeC80bDNySG83eXhxOFlBU0hLb0tlSXpibUtGcVAzSkRrcis2?=
 =?utf-8?B?SGNzeVpWQmF1YVhVM3VleTU5WkNpMlIwNUROWmlnMnQ3OExaUDlCQWRYUE5a?=
 =?utf-8?B?aks4a3doLzBRNnZ0a2c3NDlpTmZnK1FLWWg4UGxpMEIybVBidU5LR204Kzd1?=
 =?utf-8?B?NjJJc0FKV3NkRmZrZXlFbUZEajcvdnpEdWhiK2dLQnMwakJaUWsxZFNaaHhu?=
 =?utf-8?B?NU55WXFDRWtSQXdHWURzTlVEOStVL2tQTXBmRzdRSWhzajFwcTVnOG40eElI?=
 =?utf-8?B?TGtXMHlxTkNBU2tPM0NtWW41MTBTQ3c2NVNuenNqSE1OczRIbUxvOXR3RVhM?=
 =?utf-8?B?cW9BWnljOHZKcWk0bjlpS2RXcWQwRWloMVF0R0I2UVVOTmJxS25NeHJpTTd6?=
 =?utf-8?B?eEZ3ZUs4b0twTk14UXc0WmdSSXZyWnVvcitvd3IzNGNYN0dDSWxpZzFSazZo?=
 =?utf-8?B?d1dkb1lqYTFQR2tjRlRXa0dwcGlqbzRJNE9uRHVPbDFOaW0xU25wdHBkaEtR?=
 =?utf-8?B?UWY5TW1mSXZjTVhLV09iWkNzQUhZSENNa0VjdE5adU1UYnBTcVFQRzEya2VD?=
 =?utf-8?B?REk2RENTd0tpcWN1aHoyb2c4VFpOK1d5MERHQUZxL2lpVEM4OUlDS3ZZZ1My?=
 =?utf-8?B?WE9lRjd1NU0xdUlPcDYvaUZ4RytVV0E0dWdPNnlmMi9EUVh0VWZrYTRaVEdP?=
 =?utf-8?B?Qit4Q1pLeCtCV2FHUUJYQVo4eGpOa01wWGZIYXJHd2VwUzBVTCtaM3VCSFRM?=
 =?utf-8?B?VHdoODYrVGFRUWVIZFg4d094T1lCRCs5UThWeWJGeUZ1UGd1T2xta2pUcTN5?=
 =?utf-8?B?cVRtZFhxalRuMWR4TUFjcDFmdTdxUXZHVVJqSThhZkF5UWVPVWNCbEQ1Smdu?=
 =?utf-8?B?bmtVU2dsd2grVUFxL1kyNEdvY1pKc3RtQlMrRk13bWQ1NFdYTTJyMTZTeGFt?=
 =?utf-8?B?aEZSZldsQ3ZBWEJReVM4WkpIdEVXYmticVJDUC9Lak5ESnRPQ2xUVnozQ0lp?=
 =?utf-8?B?NEUvZHU3QWRpMWs2U00xMlJVOTdhMWV0elBuQ2hYWEE5dUJ3VnN6VUl3ZjNF?=
 =?utf-8?B?ZHZIdS8yZGpkNVE5OVE1cXZzNmR6NWwvcERKcmtoejdlT2M2cWFOeHlnd0J4?=
 =?utf-8?B?SnU1bEwvYnFkSmJISGp3MnFSUU5sQWFZeXpMUW5IbytMcHdWa3hJelZJQjBK?=
 =?utf-8?B?UHhJejlMQkc4YW5BbUtOTHFFNlRsM3RHU0krcmcyTG0xb2JRcWVIRnV2amo2?=
 =?utf-8?B?NlNNbGJGdzRFeXl1a1ZzVklzTWsvZFI2NVVGVEFnR3FTb05YYjhxalU2WEJM?=
 =?utf-8?B?YWFaTWVEdFU1TE1maWg2Ykd0ays1QWxHSW1BV0hRckg0YlBZVm9Qa1dLbzMr?=
 =?utf-8?B?emF2T0YrdEgySUY1eU9QNEFoSGNDcmV3d0pJWmlTWFo2aW1GcTZPcURBWUFG?=
 =?utf-8?B?K3JVYjZLeGVXaVF6QTFFQlk4eDQybXJLdFJNa2EvN2ZHRnFteUdJTDlMZEM1?=
 =?utf-8?B?SC9DeDdNM3BuTlQySmJDUlgwanNmN09zSTFXaTZ0QmxRTjFJYS9VNjhWcmRL?=
 =?utf-8?B?S0RHWGZvMXdiT1J4TTV4dzFjOHNBSks5SlpjUTdlNVlkWE5XNnpiSllwYWV0?=
 =?utf-8?B?c0J2UE1DMHJldy9JbmEydVU0RXIzdXcybHVWNEk4OUxKLzQ0cFFhOXR6QU9z?=
 =?utf-8?B?RHBabFFQSGpTZFZ4M3hMV3JMbmk3cytyZmFQa3lkKytWYkRNZm5zaXNzYkxy?=
 =?utf-8?B?V3RUazFUQ2poRmJONjVOMTJ2Y2s0ZDFqOGVORHlPaWRmRk9lOWxYdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5760e7eb-0852-48b6-6068-08de803e77f0
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2026 13:51:32.3519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3wdY1E5kc3eJS70OA2iKYPGYPaTnXI2JobIamnO2DYdtZrw9FeEfgiozY1WqvWi57PDAHyyLQ/BgdjDt95bgVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO7P265MB7825

On Tue Mar 3, 2026 at 4:22 PM GMT, Danilo Krummrich wrote:
> Currently, dma::Coherent cannot safely provide (mutable) access to its
> underlying memory because the memory might be concurrently accessed by a
> DMA device. This makes it difficult to safely initialize the memory
> before handing it over to the hardware.
>
> Introduce dma::CoherentInit, a type that encapsulates a dma::Coherent
> before its DMA address is exposed to the device. dma::CoherentInit can
> guarantee exclusive access to the inner dma::Coherent and implement
> Deref and DerefMut.
>
> Once the memory is properly initialized, dma::CoherentInit can be
> converted into a regular dma::Coherent.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/dma.rs | 153 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 152 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 291fdea3b52b..79dd8717ac47 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -20,7 +20,13 @@
>          FromBytes, //
>      }, //
>  };
> -use core::ptr::NonNull;
> +use core::{
> +    ops::{
> +        Deref,
> +        DerefMut, //
> +    },
> +    ptr::NonNull, //
> +};
> =20
>  /// DMA address type.
>  ///
> @@ -352,6 +358,151 @@ fn from(direction: DataDirection) -> Self {
>      }
>  }
> =20
> +/// Initializer type for [`Coherent`].
> +///
> +/// A [`Coherent`] object can't provide access to its memory as (mutable=
) slice safely, since it
> +/// can't fulfill the requirements for creating a slice. For instance, i=
t is not valid to have a
> +/// (mutable) slice to of the memory of a [`Coherent`] while the memory =
might be accessed by a
> +/// device.
> +///
> +/// In contrast, this initializer type is able to fulfill the requiremen=
ts to safely obtain a
> +/// (mutable) slice, as it neither provides access to the DMA address of=
 the embedded [`Coherent`],
> +/// nor can it be used with the DMA projection accessors.
> +///
> +/// Once initialized, this type can be converted to a regular [`Coherent=
`] object.
> +///
> +/// # Examples
> +///
> +/// `CoherentInit<T>`:
> +///
> +/// ```
> +/// # use kernel::device::{
> +/// #     Bound,
> +/// #     Device,
> +/// # };
> +/// use kernel::dma::{attrs::*,
> +///     Coherent,
> +///     CoherentInit,
> +/// };
> +///
> +/// # fn test(dev: &Device<Bound>) -> Result {
> +/// let mut dmem: CoherentInit<u64> =3D
> +///     CoherentInit::zeroed_with_attrs(dev, GFP_KERNEL, DMA_ATTR_NO_WAR=
N)?;
> +/// *dmem =3D 42;
> +/// let dmem: Coherent<u64> =3D dmem.into();
> +/// # Ok::<(), Error>(()) }
> +/// ```
> +///
> +/// `CoherentInit<[T]>`:
> +///
> +///
> +/// ```
> +/// # use kernel::device::{
> +/// #     Bound,
> +/// #     Device,
> +/// # };
> +/// use kernel::dma::{attrs::*,
> +///     Coherent,
> +///     CoherentInit,
> +/// };
> +///
> +/// # fn test(dev: &Device<Bound>) -> Result {
> +/// let mut dmem: CoherentInit<[u64]> =3D
> +///     CoherentInit::zeroed_slice_with_attrs(dev, 4, GFP_KERNEL, DMA_AT=
TR_NO_WARN)?;
> +/// dmem.fill(42);
> +/// let dmem: Coherent<[u64]> =3D dmem.into();
> +/// # Ok::<(), Error>(()) }
> +/// ```
> +pub struct CoherentInit<T: AsBytes + FromBytes + KnownSize + ?Sized>(Coh=
erent<T>);
> +
> +impl<T: AsBytes + FromBytes> CoherentInit<[T]> {
> +    /// Initializer variant of [`Coherent::zeroed_slice_with_attrs`].
> +    pub fn zeroed_slice_with_attrs(
> +        dev: &device::Device<Bound>,
> +        count: usize,
> +        gfp_flags: kernel::alloc::Flags,
> +        dma_attrs: Attrs,
> +    ) -> Result<Self> {
> +        Coherent::zeroed_slice_with_attrs(dev, count, gfp_flags, dma_att=
rs).map(Self)
> +    }
> +
> +    /// Same as [CoherentInit::zeroed_slice_with_attrs], but with `dma::=
Attrs(0)`.
> +    pub fn zeroed_slice(
> +        dev: &device::Device<Bound>,
> +        count: usize,
> +        gfp_flags: kernel::alloc::Flags,
> +    ) -> Result<Self> {
> +        Self::zeroed_slice_with_attrs(dev, count, gfp_flags, Attrs(0))
> +    }
> +
> +    /// Initializes the element at `i` using the given initializer.
> +    ///
> +    /// Returns `EINVAL` if `i` is out of bounds.
> +    pub fn init_at<E>(&mut self, i: usize, init: impl Init<T, E>) -> Res=
ult
> +    where
> +        Error: From<E>,
> +    {
> +        if i >=3D self.0.len() {
> +            return Err(EINVAL);
> +        }
> +
> +        let ptr =3D core::ptr::from_mut(&mut self[i]);
> +
> +        // SAFETY:
> +        // - `ptr` is valid, properly aligned, and within this allocatio=
n.
> +        // - `T: AsBytes + FromBytes` guarantees all bit patterns are va=
lid, so partial writes on
> +        //   error cannot leave the element in an invalid state.
> +        // - The DMA address has not been exposed yet, so there is no co=
ncurrent device access.
> +        unsafe { init.__init(ptr)? };
> +
> +        Ok(())
> +    }
> +}
> +
> +impl<T: AsBytes + FromBytes> CoherentInit<T> {
> +    /// Same as [`CoherentInit::zeroed_slice_with_attrs`], but for a sin=
gle element.
> +    pub fn zeroed_with_attrs(
> +        dev: &device::Device<Bound>,
> +        gfp_flags: kernel::alloc::Flags,
> +        dma_attrs: Attrs,
> +    ) -> Result<Self> {
> +        Coherent::zeroed_with_attrs(dev, gfp_flags, dma_attrs).map(Self)
> +    }
> +
> +    /// Same as [`CoherentInit::zeroed_slice`], but for a single element=
.
> +    pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc:=
:Flags) -> Result<Self> {
> +        Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
> +    }
> +}
> +
> +impl<T: AsBytes + FromBytes + KnownSize + ?Sized> Deref for CoherentInit=
<T> {
> +    type Target =3D T;
> +

The deref impls should be `#[inline]`.

Some other methods could be as well.

Best,
Gary

> +    fn deref(&self) -> &Self::Target {
> +        // SAFETY:
> +        // - We have not exposed the DMA address yet, so there can't be =
any concurrent access by a
> +        //   device.
> +        // - We have exclusive access to `self.0`.
> +        unsafe { self.0.as_ref() }
> +    }
> +}
> +
> +impl<T: AsBytes + FromBytes + KnownSize + ?Sized> DerefMut for CoherentI=
nit<T> {
> +    fn deref_mut(&mut self) -> &mut Self::Target {
> +        // SAFETY:
> +        // - We have not exposed the DMA address yet, so there can't be =
any concurrent access by a
> +        //   device.
> +        // - We have exclusive access to `self.0`.
> +        unsafe { self.0.as_mut() }
> +    }
> +}
> +
> +impl<T: AsBytes + FromBytes + KnownSize + ?Sized> From<CoherentInit<T>> =
for Coherent<T> {
> +    fn from(value: CoherentInit<T>) -> Self {
> +        value.0
> +    }
> +}
> +
>  /// An abstraction of the `dma_alloc_coherent` API.
>  ///
>  /// This is an abstraction around the `dma_alloc_coherent` API which is =
used to allocate and map

