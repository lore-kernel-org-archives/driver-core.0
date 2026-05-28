Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021118.outbound.protection.outlook.com [52.101.100.118])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0883C1B4F09
	for <driver-core@lists.linux.dev>; Thu, 28 May 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.118
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974984; cv=fail; b=NeEYv/d7lOBxm7dx7Ncq0W3+NCJLVI6MaYn/ll7eiSw4RDnBtXU/6vClOKwJ/T1YKumcOPkmDS5qw7E56B/NLierUy9FB1NX41mHgoHtkTix9vsOFpgO5AijSYloTxT0ZTgqO253OQxknFseqnkZ7SIqSTY6na5Mvej5PvnDRFA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974984; c=relaxed/simple;
	bh=zjNz7prslsG5cg44H8dOgFsPz4XrSL8IyGU06rnNqZU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=l/Ke7gWFl/vIf9QcyL5pQtUhoAvwBhWSQ6ns1hYtNM896ZCai1o9LFrwvOUwqhlOerIiA1sJrnoMfCp7MwwGB/HJHJtbzbOxlUYL/xAilpYKfsj3udA+S9IDD5EDCqkY0xdTI3syBKK8v2udy3+8Rgq45VQ9NYRimQCe4B26DGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=zV0UYsB0; arc=fail smtp.client-ip=52.101.100.118
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="zV0UYsB0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OX1RsCbaS/mgy7U8z6BBN0hkpY6zVVWJsVBqAeb8ebFPa7XqpZPWxJ6F4dASMLvtXoWGsObUS9+a6B/bhJnmq+OQ7S0220+mCfc/Uo10RI6qmZ+SNcfNZoSAUVsuV/3FGTn4O/ma5VvHiifGZ0CMHGbsEDOImWw9Fkj05KtM+OyPglDGbAKu8+kjfh0jPFFnO/vC7st4f9e+lQDN8nV1/Wrk0lESNaaulIiAc6HqU9ZE0PFVhpw1agmM50r4codKBVbXgh2tO5WZK6+6nGonQpTGXZZtBQhngsWlKpO8cbHfzYTZf0MUPvYLrUuyUuVWxLp1xZ8SKsCFy2mg0dbHqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QVg0E1uJW0LJCVstCS687WFf0RD4fmEGPgO7E8OT2kg=;
 b=pzTaKB29/8QJIJGA9mLpW1bczci4KjOell16fJP40c+W/WZSbiL2gfSIBtJGKT2uhK1G1I4rTjSFJroZv4/SkkVdwiwBQxXtYeMXKK7n9Zg0B5W+b18PLWJsYQ/jELneSoaOAjDhFflQV7n1dI/iWhxoi05MBdk9Nmp40cD/NDSwM8Mo4Wmx4047Wsx+i2STNFDDdHKKVVfrfKXgzTs14CQutyzj1O6HghmevxSN80g/73pd/5dUmSugZgdQXOOooYlrnQfqmUiD7jU5nt7m651TkomxO58HtGJxeKGR7o4Paw2spWeEWkOoX62eOpyLUYXijpcJvBXRZQI9d78/2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QVg0E1uJW0LJCVstCS687WFf0RD4fmEGPgO7E8OT2kg=;
 b=zV0UYsB0gqu2Q5Qpnzwi8p6NIy3sGOtn1iuoWpKZKYTC/DsKWoaSwQyxaAgtgV6xIrGpt/ijpP96kBVoY3EVD5HohagKvdoBzDgX/7r9YbOg+VR6ZU+plw2OMwqjJ8V/j27i6WiOPIyrcKZbdmfz2l/SJyK0kyEvRcXc/W4ZBSo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7917.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3b6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.13; Thu, 28 May
 2026 13:29:38 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.011; Thu, 28 May 2026
 13:29:38 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 28 May 2026 14:29:37 +0100
Message-Id: <DIUCGW63J6ZU.2BL1N832XXYUY@garyguo.net>
Cc: <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/2] rust: device: remove unused ref-to-ref transmute
From: "Gary Guo" <gary@garyguo.net>
To: "Tamir Duberstein" <tamird@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>
X-Mailer: aerc 0.21.0
References: <20260526-trasnmute_ptr_to_ptr-v1-0-d89bc1dda3b5@kernel.org>
 <20260526-trasnmute_ptr_to_ptr-v1-1-d89bc1dda3b5@kernel.org>
In-Reply-To: <20260526-trasnmute_ptr_to_ptr-v1-1-d89bc1dda3b5@kernel.org>
X-ClientProxiedBy: LO6P123CA0018.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:313::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7917:EE_
X-MS-Office365-Filtering-Correlation-Id: 2229bbc1-a9fa-4a64-6d21-08debcbd2a80
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|22082099003|18002099003|6133799003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info:
	wzbi/kWeAWlZRmGdRhxm04NNVo60LGgfmtIyeZvGo9Bx1BWLsIftRzMqa6IRM55+ClANaJSJLM7XIDyU54afjl+P6gnidPSAG5dJBBfdaNK1FHTkT5fi5byEFEvZfIP/IRkRHQd4Gw5nwHWOPi2600IjkunycP6xEAedFiRf+WSDF5X2RHJjRVVngWh/Np07oLoetcqMqxSJbgGXm2d13MhdjT1PupSpU7NQgyhSbkS8Cu4NgKDQVxcwnyacW3dWcdAWarb60iHmWcNFMyU/5o63mp9REWONKZ4J14iNeVruhWjNuzbUfQHQt3eeXIdHKOMP+s1+amXd/X46FPKvmQNlnRPVApqr0o0DX5Iw8HvyNPaW22/aI5+iPSY4eLro5Ao8ibixRjfIxbgtMSHfwnWKWLmiyznNJpO/N0l5kgt0kG13VDEXHvNdrxXIp1sPlNOBDJSLC3ONI+nuijq1EX5GPiHpwHw/Mym67UcX+lFGoV4vvOXQGovUwgliToy0fOOud3UISy5t3BKfQA/4cdJkynJ2Y2BoKyOw+tqAOIuh1ZXMVv7Ka38jAqX8mWbK/dX1o/REPCXzXBBl1+Pfr0VhNrjBY9iMfdHb/vEymaVwl341+glMzHuq+5L9YFwzNe98ANSCsFI9jJMLbPgBcD2A3X6vwjtJ324Hfs6RVuBFizlZ81CnW90uBORJgx2UhLjlVHlZ2GolrA8TZNlO9/Zergf7muqRGNXSYP04QU4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(22082099003)(18002099003)(6133799003)(56012099006)(4143699003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUlSaEtaM1FNWnE2Z08yUFZJRkhOdVd6TERhamlZYjBzTnprRkxRVlVETm03?=
 =?utf-8?B?Znh6alNVOXQxYXg2ZkhyTXlGT2xGZGhNSUUzUTUrcCtXOFg2RzZ5Z3ZMZ20x?=
 =?utf-8?B?blRBMjdXdUxHb0NTajRoeEpwQjZYZ1FiTnhYTVhzazNhSkU4L1haUmk0VThB?=
 =?utf-8?B?MERMei9ILzhhTGJYZjNDemJiTUVaVURVbm4zR0Q5NU1XRHRJM21xbVJoZndT?=
 =?utf-8?B?WkNncEwyaVZiem5GVURFd3JId1M5SU9MN0l3V2gwRmtqWGtCV0Z2bkJ2MExY?=
 =?utf-8?B?dmk1a2J1NDMyb3djUCtOZE9Qd3d3endIZ2MzdEVNV2tJNG5WVnNLcm9DZzJh?=
 =?utf-8?B?TUdlQmVpRVRpbXVWY25CTGcyTDZLU0pxemUrYWVzNXlsc3hZOU9oQWV2c21K?=
 =?utf-8?B?TXgvazRYSDQrNjZZNWFXSTBqL3dWbEM5a3FKK0tLZnluRElFWk9qMzZRQlhu?=
 =?utf-8?B?NEVJd2VNVnkycWk2cEF5UklEbDV3ZUNpOHdubTJybjNmWDFBeTFFSzdVUHlH?=
 =?utf-8?B?VFJCcjZtNW9mczlnd3NTT1BFYjhsOWc4cnFIK1N0MDRRUUsyMkdtdis2VytF?=
 =?utf-8?B?MUc0ZEhoK213WlRnSzV2Unp2M013ZUY1M0t6cWprWDJMUm1RU3lTL0lOVGVE?=
 =?utf-8?B?Qi9SYm1SelUwUnk1cTVQT3hUTXU0UUd0dXQ1U2NRLzBJRFRrOTZ4NDRyZVp0?=
 =?utf-8?B?TWloTzU0c1lubTM4anh3VWZwd2JKYmw2cFNVK3NlM0gwWnJkeFJxUXd0Mkdn?=
 =?utf-8?B?VTUxS3ZlWmtmZVpHbmxMQ055WXhZQno2aW5vTVJMSHNpdzZEOExrNWNpL0Rp?=
 =?utf-8?B?NEIweStzN21IZzhsajJ0UjVnUCs0aDJqNldCWVdNenZXZ3UxQmJPVDBvOVBq?=
 =?utf-8?B?RG1GQnhnbDd6T0J0MytOT1laS01DZ2Zrcy9DWmEvdTJJZFBvNEM1TXpNcEo4?=
 =?utf-8?B?c1R1MDNsUjJnU1RQd0NMTnZxN1dFOGQyaUlUU2RsMUJFYys1ZkNQT0xFZHEr?=
 =?utf-8?B?eDJ3eHBJbUEwbXVPcUlNdFJNSmZZdmpzVUd5cGNqMG5raC9ieUN4Z3ZOMFl4?=
 =?utf-8?B?VFp1OU1uQmVjZUcyZG5YSnpLcktyZ3lnclRtNlF4eC8wN1Z6bkZZVVV4WDc5?=
 =?utf-8?B?ejlMRFdkaGlSaEV5UWJnNmFYdko5VjBXWEVoTHBzQWY2d1ZGNkdiUkRGdG55?=
 =?utf-8?B?a1ZudHBkZnU3SzVaV1QzVXdZWDdDL3FtREpWQ0FQemlJbVF4c1NBSWR6YVV6?=
 =?utf-8?B?dmtUcG1CZDF2YlpGb2dUcnlTTndNdnUyR2VwR2dKcFpMbDg3RzN1MlliQXhj?=
 =?utf-8?B?TDhqRDlYbkovc0hTL1pQVnl3S3JxVWN2OEtQd1YxekxmUjVSeW1IUUF2eFNR?=
 =?utf-8?B?aGQ2SVpZMVprY1FPb09JbTV3dE1JMHpnOHppanNXeWtSR0kyYmI5TGtIRjNZ?=
 =?utf-8?B?dEd3MXJNY1YyejU5bWk3eUdNLzcyM1JrSTMxSW4zcHFjUlpxWjMzZTc4N0VP?=
 =?utf-8?B?ZDRVWVZjR0lvNUR2SUNpejRSTFFyU1ZDdXJNWnk4NURsM3hQY2FSd3Erc25j?=
 =?utf-8?B?Tk5iMjBWOUZKQ1hoTmFGYXJwdE5RWnZRRlV0UjlvL0ljS0VkY2dPVUJtMEFT?=
 =?utf-8?B?and6SzdNeHRYb1dRTlRISUVteURWeWExS21IQjVpbklnT05qbjgxYkJZRzdh?=
 =?utf-8?B?eTJmbDhZRGQ2MUFlc2dwYTlPSS94L2hrT0NZOVliWWFJVEhEVnRTTUJqSFR1?=
 =?utf-8?B?cXZyQ1RUTHcvUHROZzVwZHk3eXJNOVJTRlZzNEwxK1IyM0JVT0lwMktmNVpU?=
 =?utf-8?B?eFR5NzFHbTN6a1AyR1FFQlFZemZ6a0s4a041R3Q0VS9BeDV4dmlvL3ZOWm9w?=
 =?utf-8?B?YU1FNk01Y3grNjhrMGFCcTNXNE9OcGhFRWNOcW9XSW5xRW5zVStCZmROeERB?=
 =?utf-8?B?OGpWdjBLZWtFMGhTZnNieXFNbmdzMHgweWJqY1BjV1k0VGFzOURjZUIyakM2?=
 =?utf-8?B?bC8wOGwwNThXTDZ2YTVDZmIwV3NIM1lXbGVJTlFZNkNJTkYrek93ZmNORktz?=
 =?utf-8?B?Z2V4eXJqVGQ4eVVieDhLYVp2SmtnYXNUQ0F6OE55SE1Fb0xjbDk2VDVyL2pF?=
 =?utf-8?B?a0FvNG1Ed0kwRXFGVEdldnQzWllsUWF2M2cxeVdZL1J4WFNCL2xpNDFzYVE2?=
 =?utf-8?B?TkJiOTBXSlpEOVNDaFI4M0xLNnpjNzdnNWtZL2NEbDluY3hRcW96UURJNWlo?=
 =?utf-8?B?SklOV2ZRY3VFQVZYd3ZxSy94TG4rMUJWcitCdWNRczlnNVJ3VUpSa1VPckNS?=
 =?utf-8?B?VlNiZklxY1VWY2ZuQ1YxcmVYYzE2Q0hVem5XbDA4eGNEMmY5RnB3UT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2229bbc1-a9fa-4a64-6d21-08debcbd2a80
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2026 13:29:38.1916
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /XggW7IixZ0yH5ZwDnGrnRqLvgVHGLwWS3xxSfaYXk1hOWI40ryHKelCSxevd6L8Df1hvRn4blITZrEX56/MJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7917

On Tue May 26, 2026 at 3:39 PM BST, Tamir Duberstein wrote:
> The Ok return value of `read_array_from_fwnode_property` requires a
> reference-to-reference transmute to construct but is never read, thus
> remove it.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>
> ---
>  rust/kernel/device/property.rs | 42 +++++++++++++++++-------------------=
------
>  1 file changed, 17 insertions(+), 25 deletions(-)
>
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property=
.rs
> index 5aead835fbbc..87be2784f7a7 100644
> --- a/rust/kernel/device/property.rs
> +++ b/rust/kernel/device/property.rs
> @@ -136,18 +136,15 @@ pub fn property_read_array_vec<'fwnode, 'name, T: P=
ropertyInt>(
>          let mut val: KVec<T> =3D KVec::with_capacity(len, GFP_KERNEL)?;
> =20
>          let res =3D T::read_array_from_fwnode_property(self, name, val.s=
pare_capacity_mut());
> -        let res =3D match res {
> -            Ok(_) =3D> {
> -                // SAFETY:
> -                // - `len` is equal to `val.capacity - val.len`, because
> -                //   `val.capacity` is `len` and `val.len` is zero.
> -                // - All elements within the interval [`0`, `len`) were =
initialized
> -                //   by `read_array_from_fwnode_property`.
> -                unsafe { val.inc_len(len) }
> -                Ok(val)
> -            }
> -            Err(e) =3D> Err(e),
> -        };
> +        let res =3D res.map(|()| {
> +            // SAFETY:
> +            // - `len` is equal to `val.capacity - val.len`, because
> +            //   `val.capacity` is `len` and `val.len` is zero.
> +            // - All elements within the interval [`0`, `len`) were init=
ialized
> +            //   by `read_array_from_fwnode_property`.
> +            unsafe { val.inc_len(len) }
> +            val
> +        });
>          Ok(PropertyGuard {
>              inner: res,
>              fwnode: self,
> @@ -474,12 +471,12 @@ fn read_from_fwnode_property(fwnode: &FwNode, name:=
 &CStr) -> Result<Self> {
>  /// It must be public, because it appears in the signatures of other pub=
lic
>  /// functions, but its methods shouldn't be used outside the kernel crat=
e.
>  pub trait PropertyInt: Copy + Sealed {
> -    /// Reads a property array.
> -    fn read_array_from_fwnode_property<'a>(
> +    /// Reads a property array into `out`.
> +    fn read_array_from_fwnode_property(
>          fwnode: &FwNode,
>          name: &CStr,
> -        out: &'a mut [MaybeUninit<Self>],
> -    ) -> Result<&'a mut [Self]>;
> +        out: &mut [MaybeUninit<Self>],
> +    ) -> Result;

I think the old signature is quite reasonable. You provide storage and the
buffer is filled and that the return value is the proof of initialization.

If you're concerned with `transmute` it should just be replaced with
`assume_init_mut()`.

Best,
Gary

> =20
>      /// Reads the length of a property array.
>      fn read_array_len_from_fwnode_property(fwnode: &FwNode, name: &CStr)=
 -> Result<usize>;
> @@ -495,11 +492,11 @@ impl Sealed for $int {}
>          impl<const N: usize> Sealed for [$int; N] {}
> =20
>          impl PropertyInt for $int {
> -            fn read_array_from_fwnode_property<'a>(
> +            fn read_array_from_fwnode_property(
>                  fwnode: &FwNode,
>                  name: &CStr,
> -                out: &'a mut [MaybeUninit<Self>],
> -            ) -> Result<&'a mut [Self]> {
> +                out: &mut [MaybeUninit<Self>],
> +            ) -> Result {
>                  // SAFETY:
>                  // - `fwnode`, `name` and `out` are all valid by their t=
ype
>                  //   invariants.
> @@ -515,12 +512,7 @@ fn read_array_from_fwnode_property<'a>(
>                          out.len(),
>                      )
>                  };
> -                to_result(ret)?;
> -                // SAFETY: Transmuting from `&'a mut [MaybeUninit<Self>]=
` to
> -                // `&'a mut [Self]` is sound, because the previous call =
to a
> -                // `fwnode_property_read_*_array` function (which didn't=
 fail)
> -                // fully initialized the slice.
> -                Ok(unsafe { core::mem::transmute::<&mut [MaybeUninit<Sel=
f>], &mut [Self]>(out) })
> +                to_result(ret)
>              }
> =20
>              fn read_array_len_from_fwnode_property(fwnode: &FwNode, name=
: &CStr) -> Result<usize> {


