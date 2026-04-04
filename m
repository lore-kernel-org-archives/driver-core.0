Received: from LO2P265CU024.outbound.protection.outlook.com (mail-uksouthazon11021092.outbound.protection.outlook.com [52.101.95.92])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8EE1D435F
	for <driver-core@lists.linux.dev>; Sat,  4 Apr 2026 13:15:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.95.92
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775308534; cv=fail; b=LNwTxlQpgHSj8m5mGUQ6l9U2Rc2UTHxBlefVPEDl5lkOCm03CDWEsW+VcUDu8mdUyu6WPuFn1QkJenqQIjISUvlA7VSdn09cdtxgeVHVtjeb7U/kM56nMxAiXErsYc/ZtleTx0EdBI7yNKXoko9HjxCGA+s3zXlREfqPY9gTMCc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775308534; c=relaxed/simple;
	bh=k6zXOtvtXFyUQW77TmUEhLPybZQxjSTxOA5otINfrMo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=PgIizk8HVHIgQJIUV1nHuSlu/Lub7LNZhxCzVw0i1uMA3nxWUhwwJPhDPiPEWrjAzqW1n7yVfx2nMTI5Tw960wGvLqKeooWZ4/R/8NUXOHZ3Wf8dwZWQJfUGE+JGHOscDZ9aSJOh+zBX4Zyie5ie58WlLYkb6EvVsumIMTgFCfo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=XGpfrGoh; arc=fail smtp.client-ip=52.101.95.92
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="XGpfrGoh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rYkE4QiOzyzVP7Y0eSyOuX7xZvLGVe5H2TMiKSIYOEMnj++AfMrJ0Yg0exy55lKz5zd9Dzwb6LlC/AG7S2Ft/i6qbADswuHNnU0H6zeCzjiliEVJvy4i5wOzqhjqzDLBtdkWMLgrFldqLgt3Dvg2K//jzVm6eTsz+pTV9pLa2Ns1asUXQDIi37wA+L1ex0035JCzsBKtMN3cV2WJTyHcR5ns4RbysDzKFoRbC1rZwcEkr7QOhP6M0d/Lujvcae6L1BNn+VYzEEFU0r6JX4UF+mcYb0eSggO9i6Ir7K4zQVEJrdxOk2lusArUvHRxsPNuWCVtyC9LZ6ZqS9aLKNPzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5PvFf6UGNUFueEk5VGiOO28+7jFGpPS5wAXDu5U1ek0=;
 b=XYQeesgKvs1Ge9Agj5mmlPEo+HvycQgHVML6Iow1eVNHWYkMIzIUNC2y5ahmNHuthaYIXaNtJCVrwktWL6yeB5pgJWTx4qDiSx/3Ug+BWyVNnlJC8scMsy++oFCJgfZos2yrvOakLjhY1ueEFcwo42xnIwI+tEUMwZrDjxQcSPXKBrkJDxgYUIJ7Q5A+cp1pM6ZZlc54COkcTMN3BaNoveczqsC8PxyWN7NNvWK2WJ6VJ21EsUWNmtGs5TYZ7CxiweN6Phg/SKbBC8P8iaWYTEBlWGd+IqgM/x+btqrAF0/A8kVZaqz+tmEuYSFKgdWNWzvOreCySIK/XHFUiq2d2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5PvFf6UGNUFueEk5VGiOO28+7jFGpPS5wAXDu5U1ek0=;
 b=XGpfrGohyeU7FQewARjixutzw/PhX5qbwp1qwkMMOH/ojp9VVlQkk3dI8JwbireRC0GmtUViRVhSZ/hHurlctyv83UkN4GusldRYU2usI1qh42oyOXCxDvDykkU3UqdEYkWgYSdUbdGulvi+p6DAvXlKvhzpzKGRwtefCw0D47A=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB5082.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:195::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.20; Sat, 4 Apr
 2026 13:15:29 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Sat, 4 Apr 2026
 13:15:29 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 14:15:28 +0100
Message-Id: <DHKECN57N95Q.2DN7NG4GUA24F@garyguo.net>
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: dma: return EOVERFLOW instead of ENOMEM on size
 overflow
From: "Gary Guo" <gary@garyguo.net>
To: "Aditya Rajan" <adi.dev.github@gmail.com>, <dakr@kernel.org>,
 <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260403212822.294288-1-adi.dev.github@gmail.com>
In-Reply-To: <20260403212822.294288-1-adi.dev.github@gmail.com>
X-ClientProxiedBy: LO0P123CA0001.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:354::10) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB5082:EE_
X-MS-Office365-Filtering-Correlation-Id: ff9e7a7b-03f1-4b3c-7bbf-08de924c3e47
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	VwjOjKGmKFg3W95bbs/VtcL3YpzG8JujeDyK6lkbxYEcYwfIBD457Aag/cZWMm/QDDBtHM/W/fdyyIizhdE34qzD6EBZ9a2PiI2Z1v5P05s2yzy0mir/30bJiEK7IdLz58i/bRbcuEd+gL6ek15JHxzLOJJZLYJ5u0cGKI7aoznLv5IkP0ZtQvr8zxs/cV4jiKQvBV7AgGvCoI2w39DqZquCz+56ZsN7vQ+aoj+qWRVzQ2s3W4Snd46BO9j/Nt4ddEPX2RVnIMdkCQjnpRytR/yqxnC8Jpyaymv5tC3uspzuAdJJGOtuUvdteVzt8EESD+aUm6mGnXDR3m0VvxzO8jfHphMumMooZaseHk3R7Tm3y/zGqTnkKbuEXKDIhFObBuQ2X7qa/WjrwA+dz1U1JydbwRNZ7xNPOPtOrtv+JRikjr1aKbkEYYvkefqGzZQnLL/gvkllc3KUAdqMqW/uMlij8x7MDP5wp5oCWX1SanwMxurEAXvV+yG6g7E+LUFvLWCAZ/hNKxeVy7TkIzy8x16yDv504KkWO6sNnkZJZrkB0exxflgscw4GH2ofV6sQ+tXPJtKO9t8R43lTqNnnDeHVDogNPrCLC3LinSgY2vEb9hjIyiNYeIaaknhBT8LVCC+MOhErhjedSBjoxC4StdNQFveUmqOIiE1kmOQC3EpJfDSA79oeFImaDF7hTwTIgyBMFhhlIeYVok1UfhaAZ4o6hiJECO5j9fIZJ1dt3ZE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OHBLTWhXcU4wV0hIUHRTelF0Y2lZRnRHMTlsa0syNGc1ZXpQY1ZtbWkvL1FN?=
 =?utf-8?B?SjB1YzkrNkgwRGRaUGRrS3VlcVdJakxSRHZjeHgxZkJyZG40RWRSSkRNRkF2?=
 =?utf-8?B?UUFKaEQ4YmVOUHhwZmxpMXEvSWh4YWtYTTV0ZWJjMXZOSGU4d1d0eFZkeUpW?=
 =?utf-8?B?TW54eExYN2E3S3NFbjY2Z3lxMjFiK3JDY3laZGxQbmpJNVIzcERzSWRkeXpW?=
 =?utf-8?B?bWFPYWFaOFovMFBEaGM0d2VwamFXN3djTVcweW02WHdEa3p6Q0pIM3RmY0RR?=
 =?utf-8?B?MTd5Mk1Fb3RqYWFEbVQ5dHcxQnlZMFJhMjBoNVM3dHZjRTFCUEZJVmhVamNa?=
 =?utf-8?B?YnBlWkNWMnlVeVljcXZmTTl6dHVra2c4R2RlVWRQQ2hlTkt5cFN0azd3dlBo?=
 =?utf-8?B?M01xeHlleWxkcVlWSnhsdEFsUjVFbHZCRHN2TUI4Y2l2UjVobnpCMFBlSlhi?=
 =?utf-8?B?Q0VEMXpRdDU1V051K1dhYTdSWFNTVzlrVEZRR2M3MjVBMXNhWkxpcTlFeWxP?=
 =?utf-8?B?aVVHMHV3Y3BrMXF3cytIcmxmcUhid3Nwc0VTZHhwMEVTY2I2bUpaeUpENklS?=
 =?utf-8?B?enBsMk1PYU84ck8xQ095T09id3FDemhnTTBJVmRxajRYWVlRWHdLQi9ZUTdN?=
 =?utf-8?B?ZEdnZDZjeTJlU0VFQmRWT2lEd3B2L3o5YjRLMkYxQkZXN09HRnJyNzFpRVJN?=
 =?utf-8?B?MTVtbmlNTVVpU3BTb092bGxZOFpaeUhsT21XR291RGdyUnYyS2FWZkFtRmg2?=
 =?utf-8?B?ckVIK01iOVVPa1BBRUozMHZPaDI5aHAzTExYY3AwWUxxME1IUnAwQ2tXeFVp?=
 =?utf-8?B?NE5GdVdxcXdzSWxmSmpVeE9CcTFhZndEVHZ2KzVnQnJMVlp6L0I2aHRab0o2?=
 =?utf-8?B?dGR3eWVxU0FYV09yUVZ1Y3lNMGVvWjIzVkhLTWp2VXY3TFBmNjQ1ekIzTDRk?=
 =?utf-8?B?dmVpbWJwVnp6MHJ6WGUxQXMrVnA1RFRac3IvYVhwbDdRYzA2MTZwZGthQ2lO?=
 =?utf-8?B?clpWWXJkUkMxaW1YTGdjenlrZjdJNjZaZmJIb0tDOVlsVnhPU1F5andqVncz?=
 =?utf-8?B?NmVPSDhmSmlpaDRrYVQ5WXFSYXZxVU41UzdzdjI0dFZobitxK2JuS1lZZU40?=
 =?utf-8?B?MGYyUmZWNFZCMElPMm9sclQzeE94ZXNPNVhZaW0wVmpJMlFGbDBOTHg5dVhO?=
 =?utf-8?B?RUtUVEZxTjNDbzRybzRJN2JFckErZDJzTm42bzhhajU5Nm5iU3Z6NXI5RTFR?=
 =?utf-8?B?OEFqVUtzazcxdUM4aGpxMlpzOWhIcUtFQ3dNajlqbkx2L1dDaldpdHRqMUNO?=
 =?utf-8?B?YnlhSU5RamFwdnZZaXU1bzRLZnV4Y091U3A5N2pSai92d2w0cUsrdlZXS1J2?=
 =?utf-8?B?eFpsRXMxT1ErUGxRM2l4Qy8vMnhmWmE5Tlc0blNpdGl2Tks3N1hlV0oyeE03?=
 =?utf-8?B?cGpHbXNTQ3R4aWl6KzRkMVJFL0ZlTXVocUpFVmNGSStZa0QreXBsWnFrV1hp?=
 =?utf-8?B?amROano4clJtbnUzcXF5YmtPQUlYRjFRcFJpeUxvTW16UEc1alllQVZSUEhS?=
 =?utf-8?B?bkxNUGtwTHN1VFdzaEJ1WTVvOGo5NGFPUXNna2o3djhhMzBrU1ExSWQyd21t?=
 =?utf-8?B?RnpMM1gwQlBwRjBPeENORlZDS0VqTkFDQUJBL2hkWlo4Znc4Nkh4enJXdkYw?=
 =?utf-8?B?S3docWYvR3d6RW1BV3pXUWZ2VFVMYkRJTFlRSnFHT2hwQU91dVNONkJNNGRt?=
 =?utf-8?B?eGQ4c21YM2FQMXQ0S2hKL3RWS0wwT0ZsbTlUUWlqRlcvSzBNS1hhSHlWTEdI?=
 =?utf-8?B?bTJMRm9FQld2QW94YlA2QkF6ZGxQdTJObkhQeS9kTjFrNUpCV0M3L09oS1VH?=
 =?utf-8?B?UUhycTM0Z3UvWTBWQzc2UUpwUVBhZGREOUdPS3NhbDBZQXQzYmR1bm5jaFY0?=
 =?utf-8?B?emNQbXMrVWVhdm9lOHB2ME04bTV6cVZVbmY1UkdhZW1YUmNvUW1rWGZoQWVu?=
 =?utf-8?B?blo2TUh6UUROUXNVN3RRVjEvZVlnMkpkWm9rOE50d0N2RXRVOFNYZlNpWVFE?=
 =?utf-8?B?a0VHRlZsbHU4U1VPVVNvcjZXRWxMK244SkMraldNOHN0MHk2cEdJSjd4SUc4?=
 =?utf-8?B?VlZtYUtpZUpSYUkra21QOWNhK1YvWnppSnk1dGFHaVVSSnlSYmF3VVYyU0dn?=
 =?utf-8?B?c2lRdVMxUHlFdGhtcnZNLzE4cGhkaFg2Z3pyb21aRlkraXMrSGp5aHVHVnhN?=
 =?utf-8?B?U0VkMFFpWWhJTE9Fc0FnZlVXcUlkMlBHbklONnVCZjZoTDFrVXcrMW1DZG4w?=
 =?utf-8?B?NzAwMDZ2b3M5SncrN3NaMXZJYmdEQ2xzSEtKMW10V1BHR0E3Ry9GUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ff9e7a7b-03f1-4b3c-7bbf-08de924c3e47
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 13:15:29.4105
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T6EW7lXcUcq1bwyz2mcArDvEZ5omQOLR7pnUL1JnPK3cmledbA22cj0us8HMFi9BYkV74UUKiy4stCKLsVqY8g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB5082

On Fri Apr 3, 2026 at 10:28 PM BST, Aditya Rajan wrote:
> In alloc_slice_with_attrs(), the checked_mul() guards against
> arithmetic overflow when computing the total byte size
> (size_of::<T>() * len). If this overflows, the current code returns
> ENOMEM, which is misleading -- the system is not out of memory, the
> requested size simply cannot be represented in a usize.
>
> Return EOVERFLOW instead, which accurately describes the failure. This
> also distinguishes it from the actual allocation failure two lines
> below, which correctly returns ENOMEM when dma_alloc_attrs() yields a
> null pointer.
>
> Fixes: d9aee73c56ee ("rust: dma: add generalized container for types othe=
r than slices")
> Link: https://lore.kernel.org/all/20260320194626.36263-3-dakr@kernel.org/
>
> Signed-off-by: Aditya Rajan <adi.dev.github@gmail.com>
> ---
>  rust/kernel/dma.rs | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 4995ee5dc689..179bc8832947 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -832,7 +832,7 @@ fn alloc_slice_with_attrs(
>              Err(EINVAL)?;
>          }
> =20
> -        let size =3D core::mem::size_of::<T>().checked_mul(len).ok_or(EN=
OMEM)?;
> +        let size =3D core::mem::size_of::<T>().checked_mul(len).ok_or(EO=
VERFLOW)?;
>          let mut dma_handle =3D 0;
>          // SAFETY: Device pointer is guaranteed as valid by the type inv=
ariant on `Device`.
>          let addr =3D unsafe {

Hi Aditya,

Thanks for the patch, but the behaviour here is intended.

Neither our `KVec` implementation nor upstream Rust distinguishes between
allocation error caused by array size exceeding address space or running ou=
t of
memory to allocate (`AllocError` is returned and it converts to ENOMEM).

`kmalloc_array` also just returns `NULL` when overflows, so arguably this
behaviour also aligns us with C side.

Abstractly, the system is indeed running out memory because it cannot alloc=
ate
something larger than its address space.

Best,
Gary
