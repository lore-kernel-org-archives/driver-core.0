Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022124.outbound.protection.outlook.com [52.101.96.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BAC43537D6
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 17:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.124
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772558480; cv=fail; b=H5YStD2TQpPu1yrlbIrrtRoLWd8Brae695JK5PhRC6JbdaBPbkUCayvfnGPho0Ap3+ghXY62k6SCAznaH19jwXNbwcI3oRZkv215VvN8Tw2BviurVXW55KdyOAuCgV2b4ysEwfXFPsvZPw4VcLh5LtZC6KmbdKWiRcivsl1Bz+k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772558480; c=relaxed/simple;
	bh=BD3kIZ3emZCrXWbCMZQ3Xu3TOJ/xhFyaR35g7NvwQQM=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=NshMezvT3CDqKmiPJ2mgLWTehHkb/9GXMIdxoPXZq4/Y8yTBDC71ZFbGH44SRIVmMog0ARA8YaZQmPSONten7pwWyKd3hbkLdbvDPXT5ICFYoZJCq4hMq45MWVP9/lN5d0hYyWys1N0gVMK+4ieblz8iSlCMxHGuvzAoDHiF3dk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=sb0W5DP2; arc=fail smtp.client-ip=52.101.96.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="sb0W5DP2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gaIWtBXDhA+QYJAnKa3juHapLNfu3Ajdg1NmuvXSMCW9AM5kaIk4pJQ3NoyC0uaUCRmX59eRhSDqUF648e2s9W2GpfE+lJSAEG68Tn+KutYCnbrV88c1DTJoqirp2fSOxPGf/1vIbqta5xjF8vYCfhxZV9bGXa6MqfjRX0Kt6j4RVOntAF2PuC7SA3VnYFItoZk9Xh9Uqpc/a9q9HYn1XM6quWMXpmhzEAbS2rD2JqeEYPwy9w/7LioN/H1InrsTjI4b01YRtxI+dukioJPYhZ1y1Vgmed7p4DotLBXg8EarbDqbSHr1Jq1gaDdjmk5m1Q5NiK3VXeGv+cNAfKM+zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gTtBrt3UfVBsCZqmTbXfQnqczkPzgq3Qjr2e3OHtfpM=;
 b=xqKFu9/HAEyxbjtCcErDwCoxTh2rM17bwYdO54C00jpvQ7C5fDzl/ZcE/qvw9unQMPbyu6Ghv7h4y3yQUIXdKpahfJGhQm1BeSlC1P0ZJDEc0/zYPctpztA2QmytP3JHwIysOw34fp9oueRAFvZMCEFaxltFTbpKMaMQ4n9f2md8hFgzvAzQMHfKJc5LRl9yEg536+enow/95U7aiDzPaGFqQGU2LNBIFFKlDl+KlwWFwY0yOzvQGkL0kG9FBrjJKtyMq9i9sucYG65iB/8rmTdrJ4WPcev383E+enV6l6oD9XTi0j8m+0pJFYMjVowmsyEH4MSpem4vtJngsuWfZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gTtBrt3UfVBsCZqmTbXfQnqczkPzgq3Qjr2e3OHtfpM=;
 b=sb0W5DP2znMDmOX5HsC2+2lTARTOZ7ELGnLfPeAT39lwCQssfgNrjDL/kSpau55VJeePAhM3IQsWryOaLpILvhs6LA/d2Drf1PUJ1gpiwsfKi2dVhDgQJdVxr/JH2NFcv15ocvJLeN6/N+B/soP3+Zm0sr4Bp80yu2GoFrlCNAQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6849.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Tue, 3 Mar
 2026 17:21:13 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9654.022; Tue, 3 Mar 2026
 17:21:13 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Mar 2026 17:21:09 +0000
Message-Id: <DGTBJBIVFZ2K.2F1ZEFGY0G7NK@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>
Cc: <driver-core@lists.linux.dev>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 6/8] gpu: nova-core: use Coherent::init to initialize
 GspFwWprMeta
X-Mailer: aerc 0.21.0
References: <20260303162314.94363-1-dakr@kernel.org>
 <20260303162314.94363-7-dakr@kernel.org>
In-Reply-To: <20260303162314.94363-7-dakr@kernel.org>
X-ClientProxiedBy: GV3P280CA0020.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:150:b::32) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 3712045e-1eff-488c-53c2-08de794944e9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|10070799003|366016|921020|7053199007;
X-Microsoft-Antispam-Message-Info:
	jjelfEhUHJGA3dkW+SzrZesh5mo6wjlohJEviUAhCfEfXpjHYFby3kFRluYUc6E/gn2ZO8PXYjeLK+PEYx4bX/UEkpNBVpYgeNzKhv6aL3Ts+U9l2x2D+P0+230EFYuT4aWLsauOLL/uS8xfUIS/m2LnKGNrBS2iYqv7yZbdIVxgJmmtoMOFDIdey8vadN+TF4GuRMj8CQXNh4E1LAWa9SZS/sKMt+2F/tMWl/P7SD6l9jB3Me5L8UnQOpiPb4coOBl5kLSckE3JP5Ap8FTHow+lNbCf2dDy2C/LVajiJ9vUpQyaXhyHCGchT++9w6gwlyNJEgsI+hVBXhD8BtFTP01cZShhUn8Q/U2oShVvkcGxR3rxJIBpi/gV7m711Mw+L+VzkeTGiEazAQDAUlr08qOqA1poVWfWCtwcClHH67mbgM2bkk9hb5Kw7BSo93BoKxjtREstabg6M2w5qnQRScQAFYH3zxmEUX8LD9gN6VhxIuGdVt6CbAszZqrk2v92+nT7v7ZJFqhBltRVe6r9Q395PM4dn2PeggPThvUMl7xf6eoXeUGgfBTc0mk60OF3ptrF1BWsS+4T7kXQmbuG0Xp96tvEm9bVOm3vwETByTPbf4NXQkOpNS0WpVPyxDzMCBOIlWzHH990Oi3+WAdzxZWO4bCQqf16ATYqltrvNFWaZfNvgALmyQ59i4omTKstY/rLH+1D/xaY90REYFkoZ/ZrnLcTap+VH52BlXUdwmjGqE60sR5qqtlAGokrezP1Nb6BuDOHvOS9ksUb29qBlA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(10070799003)(366016)(921020)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?U3hENG81K0pjWTFFb1RmVUYxY09MZGV6K3pTd1MwQmVTbzhQejc2VFU4NXhn?=
 =?utf-8?B?VG1YMGxSOVF5dWltT0JHRXBUTmVSeDVXRktnZ1d4czR1aDgwL1BOVGxsREQ4?=
 =?utf-8?B?ZC9QWVdoYlZ0ZFFnZHlOc3YrTkpPUmR3Tkt5SE92Mmc1LzNhei9RQTJqZTlm?=
 =?utf-8?B?ZmRYbVE3ZjRYUURsbi82VUR4dTA4ai9xSy9IaTZjd2h1N3gzOG9sbTN3THZT?=
 =?utf-8?B?TDlhRm9ER3Fma2lMTGYwRFdjS1o1QmdBM1RWRzIwUm1kamZyeUhVaU9kZHlG?=
 =?utf-8?B?RnBRd0VHVG94YUovV1ZpTWlPampWdjFlVGh2VUNQd25qeUhtcXl1OHFBMmFl?=
 =?utf-8?B?eWJ6K2N6eWp1SzBIc2QvWnJ1ZXlyY01BMHg2M1NiVDFMenVpbEFZNUdsTU5Y?=
 =?utf-8?B?aStlTnhwYmtxdW1ETndEcE1nODJBaDZSaUJNWDQ2UXVGbnJoYXF0VlVTWGYw?=
 =?utf-8?B?OWhMenFML0g4YUZkdDFOZytxM3JDWmlDYUxTRnJsTFZaTjZDWEhDeWFUWTlj?=
 =?utf-8?B?UU9PRWRuZ0pDanZkNTdJZXlRNFc3dzBSWE04VkxNMnJ1b0cyLy9TSHJzam8y?=
 =?utf-8?B?TkpxVFdSb2Fub2g3TS9zaHU0WTAycnlJSk93c2EydUJEejd6SjBneGpidFQz?=
 =?utf-8?B?QVRqRUJCcW5OQTlhSmdYVUN3eUNRZFBzZ1NRbklnSzRZVnltZjRMU3AyRURW?=
 =?utf-8?B?cEFNQmRrYjZLL3ZQZVFOa09jL2VuTlZNMEpsZ0lDT0dLOWdnT2MrVG5XaHdF?=
 =?utf-8?B?OEdSdTB0N25pYlRGNjZGMG04TGRMMHNYcGpKaVp3Z2M4NkdPZEp6dzN6VjB0?=
 =?utf-8?B?ZFhvMlJ4cTY2a2RhKytDSDg3ZGpqREpiVFBLYW1QZjdzUzdRWEhZcm9qNE54?=
 =?utf-8?B?aDJ3cDRHdDNjb3ZUdDUvcnd1Y293TGJzdnYyUExuMVl2YzZQTFZLNHBaMHpW?=
 =?utf-8?B?OUdxYytKejlxQ2tuSnNLY3laRzJVMWlGOVFLVjV3R1I2SHNaYk5PeVl5dzZ3?=
 =?utf-8?B?QmxaWGxZMi85WGw3MkVpczBSSmdza3B2OTRzeHoxc25aQUFXQ2pZaFY5MFcv?=
 =?utf-8?B?WFlvUDN1emM5VExUUmJBMUVTdDRPTlhWcHFBaXkydE1FOFpZSGlDajNlRWxo?=
 =?utf-8?B?NHRnSDExT2lrRGY4STZ6a0taN1Q5bHhvc1N6L01mQThxdWpMNTZuamtVNHNB?=
 =?utf-8?B?aExqcVFYNExnRWhtOG5pUDBzdEcxOWd4Ymc4Z0NDYVZpbk0zMkl5UnBqWjNk?=
 =?utf-8?B?R1R6RHJHQmV1dy9jQWRNMnNYQkwyWkRSVWw0OTd2THozRjR2cVNELzdzMi9M?=
 =?utf-8?B?UHEyMDhjOGl3R2NyeTEybHJJbjRGU09nNUovZ09uMVBGN1ZxQmUwUEVmYnRK?=
 =?utf-8?B?eG1ac0Z5Z0JoQXB1QndwYkU1ZkQwV2Zjc3JHSmUvVjZQR3l0by9YMEg1Mm9L?=
 =?utf-8?B?TkdHV1ZsUEdIK1RBTTBQSVV1MUVQWitvREpYSXBRSzhSKzZrTjFzSlBXenBG?=
 =?utf-8?B?VzhkUDZka0owNjRQTVJmbXd3d29ieGplMXdFMENvTG5Ra29LbHlJczZxTnYz?=
 =?utf-8?B?cXF5Y29Kd05FbE9VWEQ2M1p4QzJ3OUlQYlFxV1J1WEdpb0VNY29vU05sWWtU?=
 =?utf-8?B?ZWt4dVZ6eTNXUm4wWCtSVDFGTlU5ZFhCWVdkWXJJN2JFeWZGNUlWRmV3eFdI?=
 =?utf-8?B?SnhlR0l4eFJ5Ky9oU1VhdHlQMFFaUkJFNWwrd1JVSktQcTluWEJGZ1RCQjVk?=
 =?utf-8?B?S1NhUXR1dENMaGhacTJ5RFJtTEp1cGg0N1ROckk3WE4rRVdFTjJsenpiRlpG?=
 =?utf-8?B?d29sK3hEQXlvTU12cWV2Z21PUzV5K2hkREl5ODN3dVNJVWZ2bVljMUg2QXhE?=
 =?utf-8?B?ZnhPNDk2RXRUaWhPYmNmQXJJeTBCWTg1MGpobU5pMGc4R3c4bzFsR1ZBWmgy?=
 =?utf-8?B?TjlXaUtUak9ZQ2h0M3ZiWUlWc3R4akJabzJOY0NQc29TSjAvMTQrMVZlMjMx?=
 =?utf-8?B?TVhrVWhmVWFZWUJHemh5Q3NXSkJhMGtHb2dOVEplMUVieGlOVDYzOGdrTS9q?=
 =?utf-8?B?NmJsY1ljSHhzeEt3NmJ2dGNRQzJMMklDTGkyZmFGS0JNa0hyNjZXbzhoTDRS?=
 =?utf-8?B?aHE3S2RXR3lwSWxaZDRXK2tIZ0VWRkZ6dXN0VzZ3QitBV1VoRU5mYlNpb3F6?=
 =?utf-8?B?WnpDdyt2R3FhL00vNGQ1N1BUcGlSdlROQy92M0FWcHhVYitLL2E1WVArMncw?=
 =?utf-8?B?dFpBd3RIbTNHamFGalpsTW5IZHdETHRseXVlek9zMHFLNW9xdk1TQzhlczB4?=
 =?utf-8?B?TThKTjlTc0RHVVhJdTJCcEtxc3RuK2YyamlFajBWRW5MTnQrUnJQQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 3712045e-1eff-488c-53c2-08de794944e9
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2026 17:21:12.9956
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ek9+TzY34t9Fbugs+XUNzQ/HtoUTA++hIViqNWRcBDk4NlUJOii2Ck4nAQpjngHXcg8OfD5mq6FIcRGrObl1BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6849

On Tue Mar 3, 2026 at 4:22 PM GMT, Danilo Krummrich wrote:
> Convert wpr_meta to use Coherent::init() and simplify the
> initialization.  It also avoids a separate initialization of
> GspFwWprMeta on the stack.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  drivers/gpu/nova-core/gsp/boot.rs |  7 ++-----
>  drivers/gpu/nova-core/gsp/fw.rs   | 20 +++++++++++++++-----
>  2 files changed, 17 insertions(+), 10 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gs=
p/boot.rs
> index 7f46fa5e9b50..1a4d9ee4f256 100644
> --- a/drivers/gpu/nova-core/gsp/boot.rs
> +++ b/drivers/gpu/nova-core/gsp/boot.rs
> @@ -2,8 +2,7 @@
> =20
>  use kernel::{
>      device,
> -    dma::CoherentAllocation,
> -    dma_write,
> +    dma::Coherent,
>      io::poll::read_poll_timeout,
>      pci,
>      prelude::*,
> @@ -155,9 +154,7 @@ pub(crate) fn boot(
>              bar,
>          )?;
> =20
> -        let wpr_meta =3D
> -            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, G=
FP_KERNEL | __GFP_ZERO)?;
> -        dma_write!(wpr_meta, [0]?, GspFwWprMeta::new(&gsp_fw, &fb_layout=
));
> +        let wpr_meta =3D Coherent::init(dev, GFP_KERNEL, GspFwWprMeta::n=
ew(&gsp_fw, &fb_layout))?;
> =20
>          self.cmdq
>              .send_command(bar, commands::SetSystemInfo::new(pdev))?;
> diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/=
fw.rs
> index f1797e1f0d9d..751d5447214d 100644
> --- a/drivers/gpu/nova-core/gsp/fw.rs
> +++ b/drivers/gpu/nova-core/gsp/fw.rs
> @@ -131,7 +131,9 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, =
fb_size: u64) -> u64 {
>  /// Structure passed to the GSP bootloader, containing the framebuffer l=
ayout as well as the DMA
>  /// addresses of the GSP bootloader and firmware.
>  #[repr(transparent)]
> -pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
> +pub(crate) struct GspFwWprMeta {
> +    inner: bindings::GspFwWprMeta,
> +}
> =20
>  // SAFETY: Padding is explicit and does not contain uninitialized data.
>  unsafe impl AsBytes for GspFwWprMeta {}
> @@ -144,10 +146,14 @@ unsafe impl FromBytes for GspFwWprMeta {}
>  type GspFwWprMetaBootInfo =3D bindings::GspFwWprMeta__bindgen_ty_1__bind=
gen_ty_1;
> =20
>  impl GspFwWprMeta {
> -    /// Fill in and return a `GspFwWprMeta` suitable for booting `gsp_fi=
rmware` using the
> +    /// Returns an initializer for a `GspFwWprMeta` suitable for booting=
 `gsp_firmware` using the
>      /// `fb_layout` layout.
> -    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) =
-> Self {
> -        Self(bindings::GspFwWprMeta {
> +    pub(crate) fn new<'a>(
> +        gsp_firmware: &'a GspFirmware,
> +        fb_layout: &'a FbLayout,
> +    ) -> impl Init<Self> + 'a {
> +        #[allow(non_snake_case)]

I suppose this is from the field accessor generated?

@Benno we probably should add `#[allow(nonstandard_style)]` on the accessor
generated.

Best,
Gary

> +        let init_inner =3D init!(bindings::GspFwWprMeta {
>              // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC=
` unmodified.
>              magic: bindings::GSP_FW_WPR_META_MAGIC as u64,
>              revision: u64::from(bindings::GSP_FW_WPR_META_REVISION),
> @@ -182,7 +188,11 @@ pub(crate) fn new(gsp_firmware: &GspFirmware, fb_lay=
out: &FbLayout) -> Self {
>              fbSize: fb_layout.fb.end - fb_layout.fb.start,
>              vgaWorkspaceOffset: fb_layout.vga_workspace.start,
>              vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vg=
a_workspace.start,
> -            ..Default::default()
> +            ..Zeroable::init_zeroed()
> +        });
> +
> +        init!(GspFwWprMeta {
> +            inner <- init_inner,
>          })
>      }
>  }

