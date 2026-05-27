Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022116.outbound.protection.outlook.com [52.101.96.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97F5922D4D3
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 14:44:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.116
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893095; cv=fail; b=HHhDsfvysAk6FmwksJHBCvfAinVl1FzcVx+adW1BVerhG2YcO6WRkusv2V4uyynAppMny8jYp8RNUvA0zT7/VG475e6syAVLAjtDyAVMcThw1tulCCPuszn6Bbrksc5DZc6306V7vo86W75QwCmRjJ72aIXYYldsMc9ISylvRyE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893095; c=relaxed/simple;
	bh=jeoV8QBbB/+g1WaFGGzuGFHLHdXpJges/ZBk45bcZMQ=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=dJ0EWfkZhvQO3lQA0fEJN42lVcUMuYI4M5CXX06l1PVQw4Tp+A94Qg8a7DelrHlzKZN7XiztA3wLctSxIWXFnNxwn8ckca3qExb7/0gbEsSCyU45nwArXQvtdfYu8xz+aq7PmEOtaU/7rvl50VhBfmlrsDpKjAu6L97RKMsS3As=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=WNgOwBTG; arc=fail smtp.client-ip=52.101.96.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="WNgOwBTG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s81Lxjh1M9UY4qJ9x4LefJ0K5nzrhsa6mIsTCZepL27GRZUlpfmmFDDs6MmUDEU0CGAsJRcz+sV1cvvfxM1DBI/qJbjQOt1ZNSrjR/nibULOku/qLK591KWRwPnz+LH73HKq6JCnoBDtMm6USk3gRCCBxOLa9PfcPxfkwOwyYapmnYYdeJxMPO/ZSs2nd3Vn2QwBRGgw6oiGxdwXKse7IhdCo/tWTZQ640FlBpobLYvt0jsuV0Qkhl8RU529/oDkyzdnk7iYqMnjnk97KllX+lw+w8PMksEvWrQSvLL3k1gfvQZYKmj+kCjhhOSlUjOqF+wNiwjnvfpWqdIPAaszFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rvWcG1G5Sg1LpwWVhjzQ/VxPBYGHD61LyJyNVuoeyi8=;
 b=IbdPi3nypurTx6QSqRVZ1asud1Tyg4s+CPJFwl38uOngSlhPh5HDhh2txezPummae5Eub8dgOZ2wp49wFpoAeVHpySl2GQZJTf669c7lwKE7eTpSv1uOEbb06qK7yyXZvnaOMT2Wgt0+n2kGjxXlMmxaYbeaU538ABZXHKD2hHkF2noRKajpgkL8UbUdqv2SPEYjDFJ5Gi/DZZFHrqGNcT2+7mSfl90U0TBwRvtSe0vsfoKvG3F02GNZgTzxOGptQum14pbe1BijdBqv99YqWsKIPRA1yTq27e0oAJR+0TwwwQUDX+8/IoYOsOwl2lIW5Y6xhki8gV5iVK5wJOPrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rvWcG1G5Sg1LpwWVhjzQ/VxPBYGHD61LyJyNVuoeyi8=;
 b=WNgOwBTGdlUwvvLZI8zLjyM8WxqUZFcFlej4k5KTFvemwqvuwqZAvR+MkH1vx8pW0YfD8Gpr2QLC5OHvba8BoD/ayjlgWWFtgySG5rFScgzTa6tJ/dITp/wjJoashw4xajSzl212/Aq9uStJohlBBhGrPBWHAG77jllNTwNJskY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8600.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4a6::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 14:44:49 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.21.0071.011; Wed, 27 May 2026
 14:44:49 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 27 May 2026 15:44:48 +0100
Message-Id: <DITJFWVQH4ZF.1HYM0UDBMWQ2J@garyguo.net>
Subject: Re: [PATCH] rust: devres: add 'static bound to Devres<T>
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, <gregkh@linuxfoundation.org>,
 <rafael@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <aliceryhl@google.com>, <tmgross@umich.edu>
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260526000447.350558-1-dakr@kernel.org>
In-Reply-To: <20260526000447.350558-1-dakr@kernel.org>
X-ClientProxiedBy: LO3P123CA0021.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:388::9) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8600:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ed3800f-903e-4c3a-7ad0-08debbfe80e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|10070799003|56012099006|6133799003|18002099003|22082099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
	73Og1/xZqh6d1lw9eMWGdvDJCCCScvXXBt2lShOShQiWuTUUutBhDCM0sGqeMOK9Ued35AeV/osHUU1h56r48lXzTmLfr2yjGj38Mhw9vFj1hHBX59bEqG1OezRsNxXO84ge2uYG/HyrutbfiLsflqd3PhqrCZ+xR7iapDs6jiWJja6a00AjHXmSilPJaBU/QoCzCJNj5JBp1cP59exaiTXiIbcaquzRYQKHUaickGP/8RHOe4yQSCrVEjd99AIQReFFB3J1zY/xO5jbzvVEk4ryfZl4IXIQBV328z/kmU2NvqVime9IhWDebRZ5jilWVI9zjFCiZMgTQBpRNWT6MBMnTtUOE5YPQwZuxjcd+aLXQ6HbBRuOhGw9ziM8I/LyRtuQmS7lghQXWfAmFfYyMtdCcwrrh4JpUwyfjR5IFit4sKjWC3+Bj4tj4VFz8L7G6rrwODqUrXjnzU9V79OChaud6ggk6a2yAcqn2d8WEV8qiFoV+4xEFFlVy0dAWiynTNAb/LfX4VbmYdnFCGb08TKqTHgq8ENg4sgeXRJUGFOYr8O2jUDZ3j8g0WBZQ2MI70NRKjcxZjH54z/4UhY3IrR83xhWasLANOR6K877VuTQPGyr7uj5UsY8u6R8aM8sydO6X05J6rZaAPz0+xo+ev0NI40IZXFr82c79UZnDQ7OmxCAKCzI1II0dvp/X1SpN0v6k/rpdnMBXv2SOP76xFQfIe/CU/TTiQfwy+Hmcws=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(10070799003)(56012099006)(6133799003)(18002099003)(22082099003)(3023799007)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZldhR29saEZ5V2VRc2xBdnF1bi90ZVh3aVNjM1pNY1JTQ0RaOC9vRUhXRDc5?=
 =?utf-8?B?Mk5Bdm5xam50UjNBSm5QaSs2Y3FuV1gxbGhRZzZlalhwYnhKYXdsS3dpZlAw?=
 =?utf-8?B?QW0rS2N3aHRWdkxsSlVwT2JSMlZRS3pqbENrdVJTbTF5L1dUYlRvaEdJOENV?=
 =?utf-8?B?cjJWTDV2NnlFRVlOUHhGTnFudGFXNjQybExva09FRXFJWkNDUFpaTlVhYllP?=
 =?utf-8?B?VXNsTFc5a3NsY2U2Z0hsRVltQ2xzaDI5d0NGZ2ZBc09uV3VtN0xYUnhJbmJz?=
 =?utf-8?B?WjYxRlllUURaWEp1WldDRWpBaUQ1OE5DVXJWNzZNWkIxS3J4TGlwVnpmZnZK?=
 =?utf-8?B?L1hFWGd5T3ZTS1BjUllwQ2xJdjA5SGIrLzZBMExKNC9nT0RNdDNmc01McGdo?=
 =?utf-8?B?NTU1NTNSbzFFYmNBT2wzL3Y4SW1Mckt6TzFQdm9uYTRXMzNtalkvN2lYTlo5?=
 =?utf-8?B?bGxaZVVwMGVlR0t6eWp5RG0xb0JWYjIrdDEvR2JYNktQYmMzNVNOdGZvbVRC?=
 =?utf-8?B?UVF0bDRDRGZCZG1JclJPdk5DTCt0MVZQajU1VG1RdGFhR2JWZFdvUUhESncv?=
 =?utf-8?B?V0JZUnFyYWRDRnlmeGxKWWh0T0Q5Vi9PMEcwakVGUWVWVHlORm1kMitKOUlI?=
 =?utf-8?B?NWhNc1ZaVnFXUWFMUC9VM3dpMVh5NkhLV3ViTzJHTnQycFY3VGNZek9QNnJO?=
 =?utf-8?B?MmFxeGxwa3dQbHNyS1VSYWdJak9qcXFidVBTVVNJbmJXS2Z6SkpEN0xWemly?=
 =?utf-8?B?dXpLamx2NzhRaUc5M3gyWmIzOHhOT2RqMTZJdlVuVUhoTTdoYVFxdE5HSnBB?=
 =?utf-8?B?V3hyTlJ5UkNQN1pwT20ya1ZSajI0SjBlUzZPWXoyeWRTVTFGUlVvVGhTMnho?=
 =?utf-8?B?YVI0R1lJOG1RdW9SbjRHR2tZZFZzdE1uOHJvTnplRXdXbEF6emxiK1FGVjRF?=
 =?utf-8?B?UW9sRFF5UEtwaDZLREdEakNVYW00WndUaERxWFg1SkZvQWdEOU5JSHFUNFlz?=
 =?utf-8?B?b29lL3oyZWsrd2pmTUE2Q1ZhbFNjQUZ2M0M1Z1g1NzB6azlCb2gwNlNEYWR0?=
 =?utf-8?B?ZUpJVmRtNnJBMmZjN3FzSVFWa3RKL0xScHdFMEM1dGZYaGlPaE9OaVBxME9i?=
 =?utf-8?B?cXBEcEVqb1A2dC9YVkZsUEhxUVlFZVJjRy9KOWt5REl1Rm5DbHpSN1gvV1Nu?=
 =?utf-8?B?R0hXUU5RWXQ2Tk5JYmRDUEhXRjBDUzZzaHZkeFd0RjVZYy9kcnc2a3Zzc1Qz?=
 =?utf-8?B?Rld1TVNCZThZNE4yOTRjTlVCN3ZzRk14UzhSV2x1dWtQdDNmTDJaaTBUQ2sv?=
 =?utf-8?B?eVo4TENqRmlCQmZWSDRKVDVTcEJkZkxyZk13YXh6SDRKaFpFN2ZQcUo3Ukdy?=
 =?utf-8?B?Q3NSTkYwejBhNU1uRVhWZ2t3U1lleXlkRFd6Wm4yYnVWTXUyUExhY2hmMzdp?=
 =?utf-8?B?elJUbFNBWkYxS3ZWOVV2MWRHTytKVm82bW51UEsrMk9Ja1ZuaFEwQW5yc2x1?=
 =?utf-8?B?L0JBVWxMcEFtL1FRK0lmNERkNWh0cmtQTElGWjFUSzk0VUhTb0IraktacnVK?=
 =?utf-8?B?NXNyZllGZ2hvQmNzVTFraWw0WkNleVhDckI1bVVQLzdBWDgvaGxvMDROMmFO?=
 =?utf-8?B?TERBdVNLZUplaDlJRklzUlVMMVhrU1ZuSEZSWUZ6L1dhcFliOTU4M1p2MmFU?=
 =?utf-8?B?VW5LVml2WDRCS1h0MEllUWt4WjlLSFM2SVIwN1RCeHYwK3JSWTRJWWNVVWlP?=
 =?utf-8?B?bkJPbjhhM2tYR2ZVZjhWcUgvQUFxSmJnV3lPL3RxemZDNll3SXkvU0ZxRmV3?=
 =?utf-8?B?RWhNRVY2dmtjdVdiWHlrK1p2VlZDK2F5bVU0Y2pWbWpPYWl2K0VrVFBmZ1hS?=
 =?utf-8?B?bnUrYnl0WWJhcEFLMmY0T0lTTzQ4NFlQNmVvbU1EUzQrZ2VkQkwyN25BM1BH?=
 =?utf-8?B?a1hMeEZtci9hbjNFYUxjdWRQa1BsQnl4QWFMWDBBbWNoT2NlbmdaK0lsbkNy?=
 =?utf-8?B?MWFwY3BTZlBGZ1ljSGF0NllSc29HVG9GWU5tTUVJNC80NEk2b0c4UCtNTmho?=
 =?utf-8?B?WnRaL0c5SXEydnF6d2tVM1h3cVBzNzd4Z2g4eUhaTWVLdGZiZUduWEtmajF6?=
 =?utf-8?B?clIrdm9VcjdrNFF1bUVHS01pNW53Tmd4cGJEMHJ5blo1ZXJzUGVYblJ4MEMv?=
 =?utf-8?B?b3UxWlpxQzdaMjlhOFFEbzlrRlVSaTJMODdTV2lCZnpNSFNxSWE5SmRNUEZR?=
 =?utf-8?B?eURZbkxxeU9STVRGM1ZqM2tkdWpzNnc4ZDF1ekVGU2lQV29DbUNsM0s2V2ZQ?=
 =?utf-8?B?Y3JoY29GczZXZXl4dUNUU1JIMzRMVjlVYkQxM3lPV0VpTGJ6Q2NLQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ed3800f-903e-4c3a-7ad0-08debbfe80e3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 14:44:49.2617
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ObLNMIpIdoBK4z0B8Ux025UHEJUpJ1V/QCAKOW8SGcqF9M/luGmPjvNLiRUpGnLU5le4Vl3H9HudLRJnUfUQDA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8600

On Tue May 26, 2026 at 1:04 AM BST, Danilo Krummrich wrote:
> Devres::new() registers a callback with the C devres subsystem via
> devres_node_add(). If the Devres is leaked (e.g. via
> core::mem::forget(), which is safe), its Drop impl never runs, and the
> devres release callback will revoke the inner Revocable on device
> unbind, which drops T in place. If T contains non-'static references,
> those may be dangling by that point.
>
> Add a 'static bound to prevent storing types with borrowed data in
> Devres.

The bound should be added on `Devres::new` instead.

Best,
Gary

>
> Fixes: 76c01ded724b ("rust: add devres abstraction")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/devres.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
> index 9e5f93aed20c..2e258d31a45c 100644
> --- a/rust/kernel/devres.rs
> +++ b/rust/kernel/devres.rs
> @@ -122,7 +122,7 @@ struct Inner<T> {
>  /// # Ok(())
>  /// # }
>  /// ```
> -pub struct Devres<T: Send> {
> +pub struct Devres<T: Send + 'static> {
>      dev: ARef<Device>,
>      inner: Arc<Inner<T>>,
>  }
> @@ -184,7 +184,7 @@ pub(super) unsafe fn devres_node_remove(
>      }
>  }
> =20
> -impl<T: Send> Devres<T> {
> +impl<T: Send + 'static> Devres<T> {
>      /// Creates a new [`Devres`] instance of the given `data`.
>      ///
>      /// The `data` encapsulated within the returned `Devres` instance' `=
data` will be
> @@ -349,7 +349,7 @@ unsafe impl<T: Send> Send for Devres<T> {}
>  // SAFETY: `Devres` can be shared with any task, if `T: Sync`.
>  unsafe impl<T: Send + Sync> Sync for Devres<T> {}
> =20
> -impl<T: Send> Drop for Devres<T> {
> +impl<T: Send + 'static> Drop for Devres<T> {
>      fn drop(&mut self) {
>          // SAFETY: When `drop` runs, it is guaranteed that nobody is acc=
essing the revocable data
>          // anymore, hence it is safe not to wait for the grace period to=
 finish.
>
> base-commit: 56785dcb2ef6d3cff82ac33f2e34db94377416a3


