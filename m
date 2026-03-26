Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020072.outbound.protection.outlook.com [52.101.195.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9264179A3
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774536264; cv=fail; b=eys3bem57L55zzoh1R1TtDSQK79z8h+xT4xEnKRyNgF3hHuL9zMWUeIHl9iR97/dG0q9htbcp0CLwNiju7MBSoT1C9n55cGpHkr+1bjlOgCLyVIf1im/gkmJUVRhbE1wMLbwPYXAg8w6RhYYs8jxao6jZtMLik9rYlr/bjumDxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774536264; c=relaxed/simple;
	bh=JYUKtpF5xTrqrNgYq5u1LXdKHL4kwbUBXdWZ62Qcnt0=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=o50uiHuDS5ybPWzekV2aLeIMYoM7HScycYDtFWd27BY7CJ1d9qQvicYfy2s9Nl0a2sRZVQtsTvmjon/NCa2GP0k+f35GT11kUr3dMx6kSeigs9NdmKKeSjqkoNkeGhAhNE1WWB3e8gNZvPJkHUaFS5dnP/dXDDATFR308UdYTRE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=iKK5s63P; arc=fail smtp.client-ip=52.101.195.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="iKK5s63P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wg0nUWgAGVhCWzz1ajk+YJm0wMWSTOWGRzEbBgq4IyPTZEN/nZqolcIf48bo1FbhiKSaVCL2Xi3YgVAk0cxsq1jUsd2qtyknR6NE/fySsrp3AUYmhannvwJYKoHlTI0xM2GhKN0i2Ie/V5J9KYzS8mOZRHYMpU6MFJ2aFUlDrAKdtDXkYCr5f6DFrT4qE7y1RERF8UWaetowk0Bdbga6kdZpbT7kfMbQ9cym5d8lXwIZxvdnSodEo7Ct5g4oP6LC6lFyaulJslQyVXYSUndpWKzcVl4WZ6R6E4HIxLYqiH+UmIDuuKZfDwIvRpkgmQfwgCsC2MZhCOqJtXEC3COIgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uCB2LkKz1yv0JM+U2GzYergMvM4Q/XoT3oJsC3QLMHU=;
 b=NNnB7F1V2hORxRuD6kiVU+KS1VMKib9W4Gxp3AUJ7oerYq6YLss3V6TPMopqwJLVgLvOjTw8VkD7cIDkzdWkXpMP2r1ouaaElK67yj3bGkBDVeR1vJyY63ID0Uh7+V6KGVrJvR9pkJQWfH37M+HAXhHtTsZt+kDkfWkqPLMz1nXsOa3JLATTmW7cMy0yRDiz9U43/lK20OhXx1vTuPiNxLn2VPcZw2c/gnn0RgknpoN+dEqG+ZT9HThjHdjCN+74O7bdaMlC2rTH2W9Rl6Wbr9ii5/Fsd4adqweXyDwp9/oOGg54bJp2IPcR2qfkwoY94dKZS66IvjI6+Kz32fwXQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uCB2LkKz1yv0JM+U2GzYergMvM4Q/XoT3oJsC3QLMHU=;
 b=iKK5s63PGUdM+Q65U4nXA6K5CBUEi/Rfe6AjkgkeDB7JQMXjl6YfLBw68bQ9CTXHYpijVfAB0npRO1XRr8668nVzTtHk/Y9YppUCZlbJpwdPyVdWCA1vlcoM94SNKsGQHXkrMMCdA1RrRVI7js2qZ+eKiRsc3LjThwUZCRwdYNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6360.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2c9::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 14:44:17 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 14:44:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 14:44:16 +0000
Message-Id: <DHCSLQ2MUTU0.34F3VAZ9AEAS@garyguo.net>
Cc: <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 5/8] rust: dma: add methods to unsafely create reference
 from subview
From: "Gary Guo" <gary@garyguo.net>
To: "Andreas Hindborg" <a.hindborg@kernel.org>, "Gary Guo"
 <gary@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>, "Abdiel
 Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>
X-Mailer: aerc 0.21.0
References: <20260323153807.1360705-1-gary@kernel.org>
 <JzrSpZxmwfo8q1EH2CfDaZi7zjwwJ8X2Gm2rn99EFvWcKZzGbP1DvTqAfAmql3olSG5AWDt3j8d4F5sQxX5SIg==@protonmail.internalid> <20260323153807.1360705-6-gary@kernel.org> <87ecl6y7vj.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87ecl6y7vj.fsf@t14s.mail-host-address-is-not-set>
X-ClientProxiedBy: LO4P302CA0041.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:317::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6360:EE_
X-MS-Office365-Filtering-Correlation-Id: 94bfbda9-5de7-4800-9b5e-08de8b462802
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|1800799024|10070799003|56012099003|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	5iZk9KKLVCVzyecexxtbXtx8TIwu/G1mD/xpW70IbakeimqU9aAjeuZuNSxCDm/5aT/Fbq0ljH9d4q3bMII2vNPFiQCETAp+ggfZe2Wl8+dKy7jqtI9yeE3u2nhyk6Nroy0jcjrAFIPhBwkkGfPBIZH2nLGPmO/2gq+mcTbVyvnvPn6WGrnOuNAHkmSxYFmhS1T8fzzVFtrkIW4nu+xnnlNd7tU0zFUYUkBFmOJ6nWt5aQTwZqNxxwTTe+u+pr2wpkRHK5zXAcvPfGjOX6DB7IrKScy+dZ11uPNFGVUsWbel/okfW1Kk795feC6sYSthBSCTqYPvTJMqfe5c/Ky1ipBSRA6F4/PZyMZnXky3613kHM7zoj57UW+v00MVDeLtPtlGtCvIhox/sK2pd7puy3Glf0xe4btA1ZV7Z5COw65AKysm6jRE7AUEjJzyts/jshP3+extL89UMGSWSDCRkWLavetQ0AcZp6ux0AiiB8ysL8tQnOvAD6DlknMF0/2mH7rBVRusaodRyx4hb9jcqDpg8HGqGzGbAEWJXomj2qjx+pqqsmaNp72h5cStw9IlF8+90LIDHtcLMj4sXMfqrAsS7neAgcZ2h6grYWufEWgImNYTIYH01qrYzWFJ4MjYvEfoDrRMXdC1n6lUMPsMSdBIv+bkM7zsU7uOVNCiPxMxQ61nZ3DPHjolMg/K4VnhZwIbgInItzx3X8f0+5NNyM8dl1uII/ZONXBJxBA1L3me9mhth+kOtsFn+0AJ9sMY4VihCjg9qIdSer10uLKsXg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003)(56012099003)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NW9JdXJXVWd6d1dpRXAvQndYUitUV1l2TkFBWUQrM1AramUvV0RLaGhjTkUx?=
 =?utf-8?B?MXNvUG12LzdmNmxRcUdqNU1oUVJRVmkvb0tza25USjdhRnV5WTZzQUwxSjVn?=
 =?utf-8?B?N2Y3d0JGU3cvWlJUeWluQUJzUjBrZlRUYjVORUhpZlFUZSt5UHFBMWpvSlNh?=
 =?utf-8?B?N3dCa2tKWFo0Q1FBdWVrOENZYTdiLzFUNXJXQUlEZkFoYkJEdFRvQUtqSzVW?=
 =?utf-8?B?a1lLMUk1MGRHOXZBZnNsTkYyMERzeUdzK2dCYkpML1A0Z1lMZHREclF3NkZQ?=
 =?utf-8?B?R3BON2x6ZXFZY3ZKdEtRckllOEFNczFNbzNIV0xkRWJPekpMdUpjNi9QSkRI?=
 =?utf-8?B?aFdWNEFEZWdOYlkzZHJUMVpOTWRPc1ZEYjRVaHp0cU9EQXVOWUl5aEN5MlNH?=
 =?utf-8?B?MldRclFZQWZ6UXB1OVBsSGlPRWVuQ3drL3NUQjN5OFkrajRrUjQrVS9lZjlS?=
 =?utf-8?B?azF5bnBIUW9QVVFidjZnaEdPaUxTZVNUNm1DNUN5UDVuZEZHS2RybnhHYUlU?=
 =?utf-8?B?RnpvaXhWRDFhYnVVaUkyRmFjbnpIb3lhNTFsQkt2emc2NXFNWEpPUVlkd0F6?=
 =?utf-8?B?aDYwQTNpMXdrZTlaMUxTYUUyb2ZsYTdBdGpYeU5xdWN3SXU2MUVta2lQUlM3?=
 =?utf-8?B?YUJ3SU1SUmoxV1hsZmw3RlZWekdIWjlsTVpjdkF1MkNBSzRqUzVSWmpxcXhR?=
 =?utf-8?B?NE82TzdleFVlZnJKQitTUW9Fd2x2dGJrNGpkWXZ2UVJySFFQNXlOb1N2OTg0?=
 =?utf-8?B?cVVEU2o0SUxRNjZ4TklwdE0vSzRXWFhhM3lGSDZBTVBVK1ZjVXJxWm0zeVJO?=
 =?utf-8?B?aGVLaXJheVlGZWZUcStyUlE4T2NoRzJiUGFrZGFPNEdTcXprQjV6L1pDMks1?=
 =?utf-8?B?dWtqRmpkOGU0eWtKalpEMTlVT3RlaE9mQmJuVVkxc0RMMUxaaU8xVDJERWQw?=
 =?utf-8?B?U1BOL0d6WlZ3TG5GUmRlb05nRWduVis1VkJ2K1JDa1ZPdXBnc3A1VGxTaE8r?=
 =?utf-8?B?RkpCVEloZVo0VXcyQlc2ZFVscVZlWXpqMTh0Q3V0NHVxcHdBRXZDN28xU2tM?=
 =?utf-8?B?Vi9kTFRIZzk0aHhBZXdpcDcvdlRZNTVSb2lwamE4d1hTK3A4T2QzMjFBcGsx?=
 =?utf-8?B?Tks5MW9zOXVHYnNaQjBHbDZqYkVtdVJwWjF0d01LR3BGRWdzV1IxelFNT1Vr?=
 =?utf-8?B?MnNuamlZUWl6RUZmRVJ6R2VHK3NoMTNmdk00ZkI1MkFLVzNKSDZjd2xqbUVW?=
 =?utf-8?B?N1A3TFpDbXZUNEFpRENab1FQWXdZVTZIOXc4UXh0ZEFNQjYwYWpKTTNmVkM2?=
 =?utf-8?B?SStyeUFHVFVmQVNWeHNnRFRXLzVFVE9VK3ZvbnFjcE9HQU9uZzBqYTdJY2Qz?=
 =?utf-8?B?dzJJQjVkUE5oc3JqQ2xWOC9uVVdseDBuVTliM1VoWEF4R0piUVA0OThTVFpY?=
 =?utf-8?B?NGNRcUtOSGJPek1kUzA1clFLZjl1NnNuRnJHUlVZcWhtcE02RUF0eVJTdzZV?=
 =?utf-8?B?LzE4L0t1YldPRnNxbmU0enN0b2JTR0t1OFJobTN5WWJUNm5JemptL3ZYNFNE?=
 =?utf-8?B?VHE2ZmNYK0pOUlN5Zk5YcEdHdG5MVnJWSTY2QjVHdS9keWEyY3VGTi8yeGR1?=
 =?utf-8?B?Zjl5WlBXaUg1ZVhKSE40WlMwZXRTMHVBakZ2dTNMZnBlMG5OcktNZVpLanpT?=
 =?utf-8?B?VzRmVU9IdEsvckdueElmSHdUZFMyckRxcTVnOGpWVS9Ub0dWZkZkZHNJS0Nn?=
 =?utf-8?B?WVdqRWxZRmQzRHl2NS9LTkJiSHJHQUhIYjVlcG5HS0ZrOXhjdUErLzRtMTRV?=
 =?utf-8?B?VjNLV2N2V2VEcnk5dzBZZ0w1QUdPZEZTK1NoT04rN1kxdmtYQTdjeVBoc0pB?=
 =?utf-8?B?WCtZcXQ4bVlVUnVZSXhFdFdRVXd0U0VpbGtoTnpTWDBndm04Vm1uUUFvR2V4?=
 =?utf-8?B?STVwaUowQkNIaVMzT0QzZ2FkTWFOak95RFdjaEJSK3EwblFMdlRNWHA4aXA5?=
 =?utf-8?B?cTZUdmp4eXFHVFFOdDRkcWtzelhlazBlQk5UNWozWHVnTlpVVVRxa28vQ3hU?=
 =?utf-8?B?VWdsQzV6RXJoNkgwd1dvbnhSNVJYOEpOUnVOMVJjMG9iTkxhWjNEYVpKTS8x?=
 =?utf-8?B?NEoxbDR2MFE0dkEwVzJBaDZRc0lndVpTWkdEelg3SjRETlAwZHhZaXBVN0Ez?=
 =?utf-8?B?QmhxNXpwVEVoc3JiNXRXUjAvNGZRSVZMRjlBa2toTzNldk04dGR2NnFjYVpl?=
 =?utf-8?B?LzVmbGpjaGtxRzJHdTN0ZlA0dlJYZGVYNFBJVExtaGxDbTUyd0RLdzZRUU1v?=
 =?utf-8?B?NkRlcVhiU0NDdlNMd210M1dQbEtOdGROYXU1STdoVThzdkk0SlBtUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 94bfbda9-5de7-4800-9b5e-08de8b462802
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 14:44:16.9070
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WyKbARSekmJl1Qj2u80qEDMDXxbAzZk3/r3ifD6DSdXJwCAdxNhjvaxdf4gtuVveZyoo110MONMSBrhbdnfodA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6360

On Thu Mar 26, 2026 at 2:37 PM GMT, Andreas Hindborg wrote:
> "Gary Guo" <gary@kernel.org> writes:
>
>> From: Gary Guo <gary@garyguo.net>
>>
>> Implement `Io` for `Coherent`, so now `dma::Coherent` can be used with I=
/O
>> projections.
>>
>> This allows the `as_ref()` and `as_mut()` API to be used in smaller regi=
on
>> than the whole DMA allocation itself. For example, if a ring buffer is s=
hared
>> between GPU and CPU, users may now use the `io_project!` API to obtain a=
 view
>> of the buffer that is unified owned by the CPU and get a reference.
>
> What do you mean by "unified owned by the CPU"?

Oops, this should be "uniquely owned".

>
>>
>> Signed-off-by: Gary Guo <gary@garyguo.net>
>> ---
>>  rust/kernel/dma.rs | 56 ++++++++++++++++++++++++++++++++++++++++++++++
>>  1 file changed, 56 insertions(+)
>>
>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>> index 779d4babab9a..ae2939abc166 100644
>> --- a/rust/kernel/dma.rs
>> +++ b/rust/kernel/dma.rs
>> @@ -12,6 +12,10 @@
>>          Core, //
>>      },
>>      error::to_result,
>> +    io::{
>> +        Io,
>> +        IoCapable, //
>> +    },
>>      prelude::*,
>>      ptr::KnownSize,
>>      sync::aref::ARef,
>> @@ -864,6 +868,58 @@ fn drop(&mut self) {
>>  // can be sent to another thread.
>>  unsafe impl<T: KnownSize + Send + ?Sized> Send for Coherent<T> {}
>>
>> +impl<T: ?Sized + KnownSize> Io for Coherent<T> {
>> +    type Type =3D T;
>> +
>> +    #[inline]
>> +    fn as_ptr(&self) -> *mut Self::Type {
>> +        self.as_mut_ptr()
>> +    }
>> +}
>> +
>> +impl<'a, B: ?Sized + KnownSize, T: ?Sized> crate::io::View<'a, Coherent=
<B>, T> {
>
> Will this break orphan rule when we split kernel crate? Or will you put
> `io` and `dma` together in some core crate?

It will unless we mark `View` as fundamental. However, I expect IO and DMA =
be
under the same crate.

Best,
Gary

>
>> +    /// Returns a DMA handle which may be given to the device as the DM=
A address base of
>> +    /// the region.
>> +    #[inline]
>> +    pub fn dma_handle(&self) -> DmaAddress {
>> +        let base =3D self.io();
>> +        let offset =3D self.as_ptr().addr() - base.as_ptr().addr();
>> +        base.dma_handle() + offset as DmaAddress
>
> Do we need a // CAST: annotation?
>
>
> Best regards,
> Andreas Hindborg

