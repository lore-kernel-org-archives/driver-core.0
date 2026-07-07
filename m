Received: from CWXP265CU008.outbound.protection.outlook.com (mail-ukwestazon11020143.outbound.protection.outlook.com [52.101.195.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7A43F88AA
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 11:43:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.195.143
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783424636; cv=fail; b=ZOhZTxT3VxbWeNfHSvXkwj5WvKsdd5/mdm96pXivfQN3tx9AMQFo2iEfjFEFe8gTrziUX1hnRvVVDHVkZDPkUz/LCbLF2c8SCspafZBQtpuYFg8kdKCpHUfLqUZEe8A6cCI0z9BeoR6FT+yR6ETpvvdKBizMUB7QqCyo1QLyEAE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783424636; c=relaxed/simple;
	bh=hpxCkUX02gKVsjpyhkcvnDwh8dIuML0lRuM9IZlJ6WA=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=BjXes0dq5RxCEI02bSlRJjujEt0QsoZ0ns8nAXWC8iLmF43IdEWu/XuoLI52zexTwmCyKsjKAUf+ffVB4hAyd5xGHMbzCQ5qaravX5JqcOJVxnsWmeeAyGcN2QTZUfjPV8fIEE4PhZALJE27P1IwDVxaJi8h62NbdqZauZLOH7I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DgCoRdxr; arc=fail smtp.client-ip=52.101.195.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DgCoRdxr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N1Q9/5M2RwSUuSf/0PZTchhCX7dl4TXu2dpP9tRkjzUUQ6xIzH6NVDWXoALwzgpKechtVkpg8S4Ua4r1wpKNxk+vQTwgoUOBvmH6lfnIo9YvY7Px/APFylbpPRW6XD1FlswsGoxOwJtWhNoqgoVT0LibEZyj0ad0zqfIt5MLWj66AGw0KR9gZ/yqC2uhJvFnHQr0wJ7NQ8uy4oB2IXoAHcimNkDXiwVCjiTRW8/Onfge+/Kij2zIVTfr/PZFZesJ6g9eBFRYD/5yf7MQm8hWEbNvWWa5bfYB6pNdVjrRhkgHnvimqnNQvmg7QMRyyyhujohn0igME/2F9aHLP0lMYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=11NR64F7qDcDsrBCMTO8ijV+DLuOAM4DDVI+ONGGK8w=;
 b=gJB1ujKHE16oZV7/LhfNKsafG+tDj5LnyTlnkMaOWQ83WYbOmfpjYRdDao/VAQtlljAwP47oRejqXKujTwB/lsLsc/cldJEC1ClGfoYBYacECKEytVsHJH6SBEPPCzVEDx79DZoeRfZkW/OR6bEJza37RjTXiC9RKwSBbWggjGXIoOgQk+AZ8QF7XBxKo8J6An2JuSwmQhGW0X+58bAZN5A+J9GVGHDWNuQqC0FZde/cUFg83ir5qH2rdPOTzHyVpBuVKGJlP+DcLxl2wz1Yyza3SLPX1BIBTkW1ioMwWE18pZta1q7FpTqlQn/mDJIty/DJZlEGMXYeAcUHMhj10A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=11NR64F7qDcDsrBCMTO8ijV+DLuOAM4DDVI+ONGGK8w=;
 b=DgCoRdxrUMAGGhr2roLCKM//vmqMktfNZGD3VgNhcyVSSBSE1JPP54BeTYEG4xRH/2RcvyNs3M811P7HWMk7niCs5WyHzt5gc2Hqcu8jKBvDagFrUNOF7V8LWVYoCEz8e428lpXyySzKH8aK34ZfNS+V1XOJ6MawXmgVjGDsWgA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB7221.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:31e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.11; Tue, 7 Jul
 2026 11:43:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0181.008; Tue, 7 Jul 2026
 11:43:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 07 Jul 2026 12:43:48 +0100
Message-Id: <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net>
Subject: Re: [PATCH] rust: soc: silence clippy warning with rustc >= 1.88
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Matthew Maurer" <mmaurer@google.com>
Cc: <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com>
In-Reply-To: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com>
X-ClientProxiedBy: LO4P123CA0164.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18a::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB7221:EE_
X-MS-Office365-Filtering-Correlation-Id: e878b676-8fa7-46d7-8c6b-08dedc1d0291
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|10070799003|1800799024|366016|23010399003|18002099003|22082099003|56012099006|6133799003|921020|3023799007;
X-Microsoft-Antispam-Message-Info:
	z/NyQakJobcHsD604E2KRaeYLglFWp+Jat/rFIHBq1RezJR61MsyxZWR9xIkVzE1U1EEA2SALmK2hIRBNDRijP1x/wEQx1Km/yV/2KBCcsu+SrMGeEvmC0jKxU1GYnCTPopyolNFe2KfmVk11a4AcU4jZXlQ8Hl3GDUUEkT8Cbw8goCM7IoMS+C1yZibP8BU+hgDfPqqKthSJaTv1aaE94jCQwZq4FChmZvjUvG56ViLYJ7mgcpWCq/vvcevo5EBoHuSpz8kj0WGI2gd3NnOHz4atFynXVMs5YZYXQw/06EQmE0yJggmmaL1ckh7jv7ui1gOKD3ScJf2e+aLrvl4UTUeBi4jdopEQEHnsjJcq6jQVXnPmLWhvZI+/vDgM3rq5f/mcwbxdIDF6/dxlPs1CWRwYd47/jIVNEiuFRr+O3x8KZBJz5HAhAxzqS8izwErnkaM9nCOJ/rdvDb54bsMSCQOYpVagYj1kfiwyT8paw17pmnmSvouiBN75WEi03HW2aI5bTnVcldcgl9GW6wOpZHqJBertjpuWP/zJxV7ggc7E7OZ93XXNaZktvcljjBw4cr2uR9VjDWWoi25lHrQLt4hOnKOCTuhl37eBD3/VN59StQq+fK7iSkKGZ2813GkoGTrMvkO9T9sCGDL7jmYUl00efbv0zFwH/ZbKdkoV8o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016)(23010399003)(18002099003)(22082099003)(56012099006)(6133799003)(921020)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?UUwyd3BNU3Z3VmF3MndoeW5DT3pSWlNtQzUrTmFxN0dpTzhkNFpvRjdUN3FQ?=
 =?utf-8?B?ZXB2VlFxQ2dyand6UHpZWnJUbmFRMWZuN3djbExjZGNyc1g5bmplYmRqYUF0?=
 =?utf-8?B?YkFaQlB5ZHpGNlNMNjkrSFJZMnB1R1BnWitnbllSVzUrVCtKaWNiQjFsQ0xZ?=
 =?utf-8?B?empRZ2V5OVBLN3FjbVI2VmQ0TzlnNnh1ckNFS3RyU2tvK05iNlRnQ1F2dGl3?=
 =?utf-8?B?bThENGRZMkd4Unc2UEUxK3R4RzAxeWtFeXdkSk1RcWVSOGt1bjdKZXZuWnc3?=
 =?utf-8?B?c2wxV2hoVGJhejJZYzJCMG11RXpsdys0bjB1UXRla0pWMkdzMFE2eEVORkpP?=
 =?utf-8?B?Q2ZZbis0V1g1NXdhbVdCeE5EalZKcmQxNFpxZnNjT3JiMm9HbWdaTHRQS29q?=
 =?utf-8?B?Y2ZCZjVwUDFsU1RXMFNrSXk4N2k0bUZtTW9ycjZzR3FEeFdMSGRRSGFEeXdU?=
 =?utf-8?B?TWM4RUZYVE5PV3A1U0UxT1FUUXdGTGxmK2Z3NjhqM1IyK3ZTdlZGZXpqOUxo?=
 =?utf-8?B?bENhOUJrektsU0I1WWhPR2p1ZnRMU2k4QUM2TmlQNXF1NnZ2ZnVTY2I2TGJT?=
 =?utf-8?B?U3FQU1dHWXJFS0lxNmFrQzQ2ZjhYSm5Cdzd3WU9BT1JqTkU2MHhSUFFyK2Jo?=
 =?utf-8?B?WmZ3dm5KVit6TUlHZ0JTK2xNT0ZWRW5EOTRqaUhkaERUZ28wQ2N4OWhiVm9F?=
 =?utf-8?B?STBZUjFnSXAwUHcrVFZPRCt1eFd2M1lRRXZmdVJtdWNRRzRWS2hTTEdkSWNH?=
 =?utf-8?B?NHNTaE1NazFjSTZ5SHFsa1F1VklXbGMvcjFhbVFQMFFjbkpHTlUxL3dCL0dq?=
 =?utf-8?B?ak1hckQwWXpNOEFvdlNHL0JFNDNvSGxzYWVpZHk4Zk5mTXJGNmVkL1czVHJu?=
 =?utf-8?B?UnZpVEcrekZpaDhhOU5xQkozUk5oV3RUY01wNVpjL0R4NGdwMUVvZTFIZGdH?=
 =?utf-8?B?Lzd3NDV2bjAwbXFkUzhhd2QrTkhIRVRpWm5Ga0ZQeHVPeG5PbkJScTBYNm9W?=
 =?utf-8?B?YVUwd1hZVHYvZE1PTFlISWdlbTR1SnIzRko0KzVmbGNrS0ZGSnZxZG9kRHcz?=
 =?utf-8?B?Q1IxcEFJaFMwUUJGNkkrRzVkNTNDVGhDMktkR2JUK1g3T0xINlVwNGtGQTR2?=
 =?utf-8?B?L2VFcFJ6TElXekJWVU9ZMFB1SUdVS3h2MlJkUlozOVU3Zk9qVjcxYTNWSmtG?=
 =?utf-8?B?dXVndk9mUjhoaGZKSWtlb1cxQnFRTTJHUFFqbVZubk8rd0VqM253dkNYUk14?=
 =?utf-8?B?OE5YSlozMUwzK0VCbjF0UXBsRU0rY3dzR0oxRURoVjRwM1loY0x5WVpQcnF5?=
 =?utf-8?B?MmgwSmRyYUd5UTVWZWlSRy9MT2ZoYUM5L1VMU1d6STByNTJXMXkxbCswWUFF?=
 =?utf-8?B?MHNvMkFrMmhOWGRITEdjbzYrbXlJWjlWUnRHYzVURlVCZWdxL3A2NXF1UzdC?=
 =?utf-8?B?VUVJUnBSM1hjMWtWY1Ria2xIRXNscUw1Q2VYVzBNTnI3eWdLZDNBbUJ2RGdO?=
 =?utf-8?B?S0t5SWlrbThrSGd6S0NpUDdXV3RGWUREMWlXQWtwd1NxOWVIaXd1TEp1bGZt?=
 =?utf-8?B?cGhQK2RoYXYwY0Q4eG9lYndLd0NCeTlrZllJS2RFeHlDTEZmdFZ4VkMvYXBa?=
 =?utf-8?B?QUJUbE5sdFhnanVCZ2w5THZuSExrQWNrMnROQmtOcXhwbkY3TEtLS2JiTjJT?=
 =?utf-8?B?cHJzL3cvS2JDV2JQRjFDTHZPbjZvdmQwQW5EOElVZjZRQVlnNjU2T01HMGIw?=
 =?utf-8?B?bmpVb2VtNDBjWkNnRzVBNUtwMGgwRTdyV0tRdnc4NU1jWDFEWVIzamJCMFJr?=
 =?utf-8?B?bnM0SVFabUQ3YmhjWGJsYmw1T1l1bkEza2o3WklySkQ5aHFWNUVHZEZ3Q2Z4?=
 =?utf-8?B?TnphVUxMWklYaGVWVWVJa1Y1ZzFOYnF3ZGN6blZGZURlOTg1amw1dVlEMUxp?=
 =?utf-8?B?c3N1dkNVTnRyTDViZHBheEVtbzVITHB0UkRNMkJUVWVzZmVLU2VpZ1hTNmE5?=
 =?utf-8?B?WFhWQWwzRkRLMS9jeWZKcTNlUXRaMXVrSkh2WXAyMjcydFk4amtlNEM3Mmcz?=
 =?utf-8?B?S0xDRkVCT0JyNzdQdmM3ZDVZZk5JcndJREtiRHBpbGJHMWlzelBvdjBTTDlI?=
 =?utf-8?B?WkZwcG54bnZGaDh4YytIcEkvR1JEVDd0NVJhdXVUV0p2c1cvRFdVZ1ZtSDd0?=
 =?utf-8?B?aU10UVplUHViYTB2NmZVUDlDckJoTjRaVUxBOE13bmk3emNkdlQ4cWliRGlV?=
 =?utf-8?B?Y2Z6Yjh1V0pmUjNvQ3RZQStORTJMVCt0MjQ5NFBOQk1QR0pUcTZDdFNMaEFs?=
 =?utf-8?B?UnF5VGxuNldtdUtoR1dpcnFPTVk3NnVlelJoVGc4WGRKR0lGMHp0dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: e878b676-8fa7-46d7-8c6b-08dedc1d0291
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 11:43:49.0241
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJ8DJTaaIn9UomgrJvpakg2+pt06WxMNyTt2aHCR5p/E4iNlhdx03FESsOcViKQG6m44iGrlb9TiUg+wWP329A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB7221

On Tue Jul 7, 2026 at 11:12 AM BST, Alexandre Courbot wrote:
> The `clippy::unwrap_or_default` warning triggers on
> `rust/kernel/soc.rs` since rustc 1.88:
>
>     warning: use of `unwrap_or` to construct default value
>       --> ../rust/kernel/soc.rs:66:10
>       |
>    66 |         .unwrap_or(core::ptr::null())
>       |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `unwrap_or_defau=
lt()`
>       |
>       =3D help: for further information visit https://rust-lang.github.io=
/rust-clippy/rust-1.96.0/index.html#unwrap_or_default
>       =3D note: `-W clippy::unwrap-or-default` implied by `-W clippy::all=
`
>       =3D help: to override `-W clippy::all` add `#[allow(clippy::unwrap_=
or_default)]`
>
> Since our current MSRV is 1.85, we cannot fix the warning as
> recommended, so allow the lint on the `cstring_to_c` function instead.

We set `msrv =3D "1.85"` in our .clippy.toml, and my local testing with 1.8=
8 and
1.96.1 doesn't produce this warning.

Best,
Gary

>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/soc.rs | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
> index 0d6a36c83cb6..7998962560f8 100644
> --- a/rust/kernel/soc.rs
> +++ b/rust/kernel/soc.rs
> @@ -60,6 +60,9 @@ struct BuiltAttributes {
>      inner: Opaque<bindings::soc_device_attribute>,
>  }
> =20
> +// `unwrap_or_default()` on a raw pointer requires `Default for *const T=
`, which is stable since
> +// Rust 1.88. Remove when the MSRV allows it.
> +#[allow(clippy::unwrap_or_default)]
>  fn cstring_to_c(mcs: &Option<CString>) -> *const kernel::ffi::c_char {
>      mcs.as_ref()
>          .map(|cs| cs.as_char_ptr())
>
> ---
> base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
> change-id: 20260707-soc_unwrap_or-ed37e674a759
>
> Best regards,
> -- =20
> Alexandre Courbot <acourbot@nvidia.com>


