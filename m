Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021138.outbound.protection.outlook.com [52.101.100.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D0A931327D
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 10:33:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.138
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780914814; cv=fail; b=k8xxeJ0J/1SbHAopPLKvyJv90MNaBCXhqzV4Gg9dxfeTTF42hS+kK7mq2bjX8MvW4v0RbFR0WWkWqrfz79expnIYvGYFvjripCo0vvAfFlc4vQLFrqs7+GctA4c9QsGLAAKs1vu9RbVwW6sZcjuMd/1lIuBKCT/xrEW7SxPz4N8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780914814; c=relaxed/simple;
	bh=hG9DV/a++cPQoqw1i9f5iBTeYqXWTLDyphLyT7CSmMs=;
	h=Content-Type:Date:Message-Id:To:Cc:Subject:From:References:
	 In-Reply-To:MIME-Version; b=VhXk0zHeILxlhT59QzinZ4P3bvAVP2Im8Dt4Qt5xrROZU7ORSWqNB19oshdLN/srbw7QHVoeSUn+GOUcpqFVgFgWkGwmAqYr6z05thxpofY2jjcEoZnv82ZDCpqd6Vd/LoGT05ViTeheQwLYKYeUMlrx8w5mhOBkirc/2xiB9jQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=wDZK14E3; arc=fail smtp.client-ip=52.101.100.138
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="wDZK14E3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YQhpxa4g7WgUJ27jZh/cnGJ2m8bElK/IpVGFOE/t0Of6RK81ZTcGZ4SWxxNnWpCT0lnVoSSfojrna2dycfH/dGluWo3BPgvQFmtc1N2GuBxAjVDqlJXoQyzalBQGPexdGAgccPjSUDu53IkhEWoDbq6XnbPuDw9jEF9M0DGrxqYEPRanVl97V0gtMlBmQJix53oqPoY+Mk8trp8HX8iv454DruI2xlaXDFrfQeR3f66GaHgRlFw+1pDpMyPNYaQFlL4CL+yfa1c1nxJb5QvG0g9qHPNZQtdgsJJuW62kcwhvlKwUZNkhPV9d8KCwKvbC0v/32OR/rK6b9Uli+grQDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BZTfpLGbh9ZvogWmrRxSKcHrApoJqPl6dJ4YbfuzTc=;
 b=JXk8Km0SHFuvYAVE+L0+Vam0wVmhAY/9+FtOvBdUoD+LqM6OhzUx4lLcj7dwUyKnJfW/qodxB9Pl0LDRItZ7Wa4dP6a0R07ycYV0QhzjgsnBaGvYXMTi6AXERNbqD+KMu8MNnP9l1FE++/tXrIvF6z12SC3QQOzBRThKLjkXTWSCeP5oiZzgJeG1A+hx2m+AGzi722ppMOsUivvJM26Z237u9tXYIr2FKCZ8bDRTbGxGdVMB+u4c9oAZHrIyobuo04UTEIxq2RSZYlICQpC105WPSzfSsjdAT+LHP0N4xxBnNbHlguau2mGWqKXBZ3brnrU+6vNYMLWDYXlzw00ASw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BZTfpLGbh9ZvogWmrRxSKcHrApoJqPl6dJ4YbfuzTc=;
 b=wDZK14E3tqGZUk6jIBcV0IK67TjBjVuwkcuw+DQxNM0xsz6Ukk9bkJl9i8NxOcIWkPTezGltMHTmrzeiWmYpYuZd/Wx46YtX44ljH6NeSuTqCpq8Z0oaGvQxC3O0b1D1HJ2C/PMIze6kybMoOesDEe5ro9q3fG0sT00brv3HDYs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB3319.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:e7::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.12; Mon, 8 Jun 2026
 10:33:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 10:33:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 08 Jun 2026 11:33:28 +0100
Message-Id: <DJ3LM0JABTV7.1SGWCGBBLAZ2M@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>
Cc: <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: io: require proper alignment in the safety
 contracts of `IoCapable`
From: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260608-iocapable-align-v1-1-4d4b5ad2b1f4@nvidia.com>
In-Reply-To: <20260608-iocapable-align-v1-1-4d4b5ad2b1f4@nvidia.com>
X-ClientProxiedBy: LO4P265CA0180.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:311::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB3319:EE_
X-MS-Office365-Filtering-Correlation-Id: a343980c-46a8-462b-ddf4-08dec549619b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|10070799003|1800799024|7416014|376014|921020|5023799004|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	ChR+Lb6tQuVFy4Ucehw+BcsmYD5yAIycxovOGm8nGQtHWWjvDUgaS+WIXx6BC0H7xN8kDN5PDRWyLM/wKPOCSAWxTVxwlb5GDjQYx6KwRe8cK41IQ6j17xWTrHeeP+WBC9nuerV/VLlyLv1myuNkPlMqKCbfUW0sz3CGUnHKZgHmI2iYFCHnMEjhmwYWRxqNughH5Y36q3H2kE4nHYX6HJsOCSflxt8rVNdesMdu2mOwtMiQOKi4GTJa7zT91u46nLkknu9C9JbSLND/+VA7SXa3rOBI9X35wisNOP1Kr5q0ow2OysfdLaP4sxmNOjCSI/VawvT4Y8woWeOn8S+5Y5TphHVcc0mXnFjqx9b2EszAh1fmptRdpEiXI7/wjdtLBua+sCAh0Q0uJyjP50hRYaQNk2XlMPmno4auKiaMrS2F4pRoOq25x91L6kfLCblrEkiFUg22kzVldqbtvLilQgncMImDD8v319jXsDRhszteGMWm6XnnSC7Po5AkpkTB28mpTc/FF8AetNt4M8PdzhMLIvc1el+/V2qswHcDsoth5hexeeBqywIpNL6cGojZGP1HyynGKopQSo+ld1D0qbU1eMm5sE87imrXXgCbXdedR9E4CfkwSwaf+U+T27dFc5EWxBiSnvue19FtBwOX7FcJyMz4mWQ5rQa0kWe6dh5oAZJIl4bv+5/LxiL1R1IFH1x6bu3KHH4Hr6TVBJkM5vZbNSRb65xWJNYXwQ8gSk1ocG63jUyWj+Mi4cGdAfdT
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(10070799003)(1800799024)(7416014)(376014)(921020)(5023799004)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXZrQ3pzaU9sWEp5c1FWSnVZMThERXZFMjVEZHVOd25Bd1ZYY3owMk02OTIv?=
 =?utf-8?B?SGxYQWhGL1R6WUZOU1RzcjN1WE5yRHJ2RmhwYk8vQXMvNEdyZXplOEFlc0g0?=
 =?utf-8?B?allidEZpVHh1RllwTkQ2WkdWNmIwODZRK1IvZi9HUzNpU0N5cTJBZGh1SnM0?=
 =?utf-8?B?NEpiRDZDR0hJNk9xeHNGbkxjVXVTZFFLbVY5UnNhek4vRnhEcGhQUXBBQWVv?=
 =?utf-8?B?b05FL3NSWjc4SGlOeXFVYzdwc2tZOHRWbXh5TldqTTNKZUc3ZWJJTVFmRzIw?=
 =?utf-8?B?dThvc2k0WHVwOEdDM3RrZDF4L1diSjFnRFlibDlkOE11WWFrTVdBSVpwaU42?=
 =?utf-8?B?SzFBUUVoM3hyVUJ6cVdaNXEvYzl6Wmc2OG9YTThVSEN1bDJGdGxDTkdaMVVU?=
 =?utf-8?B?SlEwakJ0VWRBbUxVM3JUR0hENFFPbzVhNHNEUlp1amNCb1h0bkkwWVpuR080?=
 =?utf-8?B?ZmpnOWJ1N2gzRFdNbjlBOFFocmZZOVF4OTRnVnVwSmtjUmxnNERSWTNwbmIy?=
 =?utf-8?B?UUg1VS9oTVZOVFJuTlU2Vyt3UkFNTTlYRmV3UTRQY0o5eHpzWWp6R05VaSs3?=
 =?utf-8?B?UHkwRzI5ZSswKzZEaWJrMkZGZlI1NmVjb2svTkplUE1zeHFkNnU4emxHVmR4?=
 =?utf-8?B?QzFZdXZKZFVxbDNZa0k1T0k1bUtWOFMwYjhSdEZaUjJoTkFYQkJpL0QwOGlL?=
 =?utf-8?B?ekRjTFlJc1hqbmM3MTdjVjVBeW94M1BWZFJ5QXJUOWRpQlowcitCemp2RFdS?=
 =?utf-8?B?eTFneXJ2TVFMRjExMXl1QkpYNmhqelkxaGtBNUVxdldVWEdwWEwxUjF5M1VR?=
 =?utf-8?B?VlIrMGdPbVRIQnhmeWNjS2pOc2hkYTRlTnlxbGlRRm9Ha1Avem5EWVFmVVNO?=
 =?utf-8?B?bVhGMThqTmZvLy91YWkxRFNOdGxJdURydi9ObE02aU1CR0NESFJtY09MbURP?=
 =?utf-8?B?dDBGVXk4Q3cwSVJJQS9nWnNaZ0xmYk1vMXNDQ2pwV0NsNURURU03bm43UUFM?=
 =?utf-8?B?RDVEK21ud3FJS25mVU1jbkNVQ2VLRWJ2bll5a2FGcytYRFZPblUwVWR4Uyt0?=
 =?utf-8?B?S1M4eldDWkxzVmdZQ0RlZ2NyeUZjdENiRlgzR1I4S1pCZkNJN1F5RUE2OVlK?=
 =?utf-8?B?bGIzYmJJbkFzRXRDaER2eXc0Ulg3UFd0RDg0OTdyV2NPZGtPL3pQb0Q4bjJ1?=
 =?utf-8?B?RGU5U2puOVVqNlkzWCtSNkhDb1VWUUxCckFldXZxMlFxa0RpTkp5Sm5VOUQ1?=
 =?utf-8?B?c2JVeGNmL2JGelZsMjNvdHFaclJWb0N1cU10L3hFY1ZPS3hnU2hqL2FmZXFG?=
 =?utf-8?B?RW5kSzlnZGY1RXhTeFU5YkgzRXg4OWRKS0dZNW5nZE5SN1ZZUnJtSW1qMit6?=
 =?utf-8?B?Qlg3d1RuZGhNbzljbDI3TnRoUHFSNnpVQ3E3YlJUcDNGdForalM1aEpqeWV4?=
 =?utf-8?B?K2N1eVcyemJ4Q1ZDYlczRTVvd2VHbmFmSnZlenNxTTdKdW1qZ3dEQTE5d2pY?=
 =?utf-8?B?QU5NYTBUK3lwcHZjQWFPdzJoTTdjcVQwWVlna1JLanIwd0xNQWw5MVhyZUI0?=
 =?utf-8?B?UjVUTUdneXNmeHRqNDh4eDFCN1l5Qk5PR0ZBOGJibmh0YXdyOUllRlFDazh5?=
 =?utf-8?B?bEI1b2V6TkdCM1JWRDJxL01TdzVHSCtBZFVYZWQ2Q3ZlbzJPb1A1U25oQlc4?=
 =?utf-8?B?MXhWekloZWxsYUFldGhxTTZCbzZjNjBXaHJJdngvUWRXaTg1SXFIS09vMzlL?=
 =?utf-8?B?Z2Jxc1g3SmpobThHODFYeGJ2RVYzK3Zsd3pGUXdodDRPditCS2dCV1BFbysw?=
 =?utf-8?B?cmxuL3ZEdzVlR3hEb3pKKzZCMENjMncwYnBWUnJMa0Y0Rm9MY0dtWUYxYmJv?=
 =?utf-8?B?MXFHSVlXTkZucG5EbUJBWTBNWm12QnFlSE1RRDZTbDNDai9Zbit6TVhDMHhP?=
 =?utf-8?B?Mm43VktZSzlSNm5JWkxuZ2lnb2N0ODRXWENyMjlLZE9HR3p2T2xBVVU1QUlp?=
 =?utf-8?B?c0o0QmNCMXY1WmNWblRLbUMzNDEzUENaNEQvaXpSeUx6UTJnaUpHcXNpYjR5?=
 =?utf-8?B?SDErVTdzMDEwZ2NwSWlTblpKcU5vMUd4aVN5Ym1lVUNoVjVQeHgwZXk5U3J4?=
 =?utf-8?B?NnplMjA4aFdlZ1Z2OEhiUXlROVJFNU9jTkdqcUh4N3orUkh4LzQxb1VUQ2lL?=
 =?utf-8?B?SDFnV2R4ZnNLcWdOQjJQYUlidlN2SWVWcjJXcmc3bHl3ajhaNlpLdktXM0tK?=
 =?utf-8?B?UjZBMzAxMzduQ1JjQndjbjByNU9IVEhVT1JJcUFBRnNwRG9jRDlEN29nUXp1?=
 =?utf-8?B?a05mbSt6WE92ZDY4emd6VFZQQkJJNmYvOUdTSGxGajJ2angwWTE0Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a343980c-46a8-462b-ddf4-08dec549619b
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 10:33:29.5811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kW2xnymVSq3YDsDgYsoxBuyRx4/qd7BaRT7NYo/koh5kTVgKKnWwPsc2SRK+HKRNsV8+Jf5LeLpyfMqEhcXg3w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB3319

On Mon Jun 8, 2026 at 9:14 AM BST, Alexandre Courbot wrote:
> The addresses passed to `io_read` and `io_write` must be properly
> aligned, but the safety contract only mentions a valid range as a
> requirement.
>
> Add alignment to the requirements. The existing call sites already
> obtain the address through `io_addr()` or `io_addr_assert(),` which
> both check alignment, so no code changes are needed to them.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

There is
https://lore.kernel.org/rust-for-linux/20260421-io_projection-v2-4-4c251c69=
2ef4@garyguo.net/.

Although this patch will be gone from v3, as `IoCapable` is not going to be
unsafe anymore.

Best,
Gary

> ---
> I noticed this when reviewing the GEM SHMEM series; it is probably better=
 to
> explicitly mention this requirement.
> ---
>  rust/kernel/io.rs | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
> index fcc7678fd9e3..854932d1cb72 100644
> --- a/rust/kernel/io.rs
> +++ b/rust/kernel/io.rs
> @@ -166,14 +166,16 @@ pub trait IoCapable<T> {
>      ///
>      /// # Safety
>      ///
> -    /// The range `[address..address + size_of::<T>()]` must be within t=
he bounds of `Self`.
> +    /// - The range `[address..address + size_of::<T>()]` must be within=
 the bounds of `Self`.
> +    /// - `address` must be properly aligned for `T`.
>      unsafe fn io_read(&self, address: usize) -> T;
> =20
>      /// Performs an I/O write of `value` at `address`.
>      ///
>      /// # Safety
>      ///
> -    /// The range `[address..address + size_of::<T>()]` must be within t=
he bounds of `Self`.
> +    /// - The range `[address..address + size_of::<T>()]` must be within=
 the bounds of `Self`.
> +    /// - `address` must be properly aligned for `T`.
>      unsafe fn io_write(&self, value: T, address: usize);
>  }
> =20
>
> ---
> base-commit: 46def663dd34da36464ba059f7cfeacf29d98e5e
> change-id: 20260607-iocapable-align-fa8bf1ac7208
>
> Best regards,
> -- =20
> Alexandre Courbot <acourbot@nvidia.com>


