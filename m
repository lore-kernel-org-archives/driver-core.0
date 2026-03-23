Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021107.outbound.protection.outlook.com [52.101.100.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 250613C0627
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 17:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285317; cv=fail; b=FY3GZUYM4D3FpFaF/Gu7BCuej4MCkhb3esmgwjPD5E8q9BsM5j1ysDHiuSYh2EN/DHi8N0d/0K1w6CGmvTuIn8vkSJzLrNWXE6orw+SInLZG/yamsRjG67ZQDah/O9zvu0NoV93GXhcdrmNfAQs1+Do11cMhxyKEC1ZU9QhG6HQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285317; c=relaxed/simple;
	bh=yw0dHs+16osq0y9talGuNpJQPDyBPDRnQ0qatSjHB1I=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=m0ihk5/DWhmyxDwaCONyF0vsf2jxGf1FHkdd1dl9venq5YIGxG4nJdsckLasUi/mjVFiaTmhVmMQfnv39oRzniUH0GIEAMy5frkI7mTP3FHjX5oZ4Achq/muj19xd0jtrJpqfapYC2YV3GLuIsssXxCtOMeyqhItmnDt6i20v0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ohp80AE1; arc=fail smtp.client-ip=52.101.100.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ohp80AE1"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XFK95OlkMmLXcSTyd6RlyxJeQnRKneRsWSbW5qr+O2QGId6KYyCnwAXgwO523L3vkC2t+/HsM4Pk+9Acr9tvN37E5tidpOxPSplAetNsuuI315wpJqaUlZDll6ZA7A27pf95JDKnUz++C5cWuPdpf8j4Q4KeOeVQmIZDow6TbMwMQ46yjrLpb8+13cPOUEhdmZXV2XIZ5bRPZFx9ZpOwyGv4H+G7Ve5Wgk/2Qs18vsOZTsjJoBNcq2uR/uQXLvxdpk/91CykjD2fzgFdipXSpUxpBolTb4N1/gDnGqPGUtK5SZYBZeNzMjg9NWhFR9ZTf/uOqF9PUwRKYXwneyGK+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLlcwIdPPopPErapj5/6LSvoRtHAh9DWE1tvKRg3b5U=;
 b=RkLoICuDCq3HksZIjE9phutqUHhHXXkcb4SpnNy+PpGusyJHh+EsKNifeWeChqu+3x5mNyiM8M9miBRjF6leKSe1VSLvuw8ooJqrSOj5sAYA+SSzntuS2HGvjgrnZBtpoaTVs4LEUW6Y4JXQ8vyVp0h105kIF1M4vQwAPd5Y7SDuk1NQZK5H7PNG0PL2R8TscPnVJVApCMHbwAPuMexO51dSOzJYAY9GLkV+J5+hfbKZna4ayyxvvNvSOeL/mKDGmihQT9cOrjLsPse5SY5feK5G9C23hS7RuljO+yd5UZ483SJk/cyxJ0vqGTeDwCGbtDQjblnOwOaEBycOLIrhjQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLlcwIdPPopPErapj5/6LSvoRtHAh9DWE1tvKRg3b5U=;
 b=ohp80AE1NMoNJRat6ajC3KfbvlMJaqx4Dw1oIBj0OM0eVabiX2S8MFlk3MWY4bVg6CF+r+honb5U7byf+57glivu1lL71xw9P0mV7/U5kkMu77Ovib30SaXeuuPMrpcvQyqu9huB0DcGbf+K3ht6pYquREXt2TnaYqoIEis1RoI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO9P265MB7565.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a3::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 17:01:52 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 17:01:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 17:01:51 +0000
Message-Id: <DHABNFS4CQWT.2KHANQER78ZX6@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/7] rust: dma: add from-slice constructors and use them
 in nova-core
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
In-Reply-To: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
X-ClientProxiedBy: LO4P123CA0374.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18e::19) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO9P265MB7565:EE_
X-MS-Office365-Filtering-Correlation-Id: 5daa0f23-668a-4b37-9738-08de88fde17c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|22082099003|18002099003|56012099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	nBwoWKxSaajCgtuQ53KxPdFj0mpaXeOlBgvarPtAb7au6/Zggd5aSJR+tvgL+xZAP4NI+e73Zdnh8FjNkZi2RnCW8pu1HzRjDX9bIGAUK4OabDfhP38h1eCZhlSqO0zydbgLznpbaM6QSHwTyzGh0fwTvrStugrcLx2ApfM4/4bTy6smbuEZgekyJEhls1DS+XTGo8uwgH1nplXNZctJ/sB/mzdoINRBnA3m3F5PZXsD8Y0ytpDMzDcwIVbT2H0XRtZMkW5wHC0f0PV7GUv8SRKIXObH/0KNhtJb9/AlL4XoKttZwDdyPpQ/XOv0x9b3uKLo1ZcTszOeMkA877FnnVPTQD8DCLo9bd7j+klx9phArK1vFJ5ZPDrfoWhwZjF++708duBA30L2BQfVnYB2kq3d54GreNsmplO05jhmQLbTv76qWeca/W7hVmRpO4YbZO6L4ZBq44unEmvWY91xOkIBzZFch5vcsId9NURpzdT6Qsav1J/bVnYpX34WpSwVaoqbsJifOgDcKRkdlex/9FUN9DuF1n6ZLQl9s2LIrYitPIojmWEKpLcZRmLEvIZYbsN0rHxxypTUas9IpM2XbKNlTWZMIYNq1qiSQdD3UgGbA71u/Bg3Geh1tuwmFzyk9REkcpuLdOTUzJcMsJyJIxlCASaGKXh6e2n5ZzxgX4gLIwiLydis8Psin7Al7A4wHtXnEPl/QJ/H/QhVqViwzlyOyGx9DwPTLoC2f2UyBD3hyV9RAgfOmRgmobvRFgBMXuVgmWxrrGBdV53t0eSOcg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(22082099003)(18002099003)(56012099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STYxY2pFWUxjaU5LWUVQRDBvMWFaTWhVdjJoTERPSWUvWWgyOXZHZFZiM0xV?=
 =?utf-8?B?RHJjWlhvVjdqY0NkL0VtQjkzWEJadEFIdnZVMXBVLzNHWS9kZzhSZWp5S2NH?=
 =?utf-8?B?SkZ2YUQrNFU1aGRjeDU0RVVRcVVEa0VNVnNBUXVsbkJBSjZCRWFPdjF0MVEv?=
 =?utf-8?B?U3Z1dmJ1RnI0TVZvdjlkbm1UbXZpQm90WGFGRGUvSXVyS3ptcTd6dm5haURz?=
 =?utf-8?B?elFORDZnUVM1aStRUE1HTWF5M1NRdTduZTduOXMzSHpGZ3kyR3lHTlJBQitR?=
 =?utf-8?B?aCtCNUpvU0VNYmxpaXZ0TEF6S0o0dkZEbEt1VHNNZ1RPMnpCeW5vUEF6N2kw?=
 =?utf-8?B?MitNNGd6dEhjdU5xa0thaFpuNUIxSHVTMXFlNzBKY3BCUE1OR3FCU2ZIN2dQ?=
 =?utf-8?B?LzNEb3JPWGU5V0c4N1hJYlhqZmRsWHVXQytaMzVLLytaQ0xsYVREUVRRVGFn?=
 =?utf-8?B?Qmh6YUcrT1Z2eU0vbGo5ZEEvU0VBVkQ4NGY5UzduWkV6dHpFbmZUd3psSHl4?=
 =?utf-8?B?LzFTTVBNYlNwTWpJZ2xaZTRNK3h4ajJweE4waUprVjBXUDRsK1hhZGlmWUJ0?=
 =?utf-8?B?VXdTaVJ6WkhtRW83T0N2MFFXOEU4aUkzWmYrL05ucjU2UURYb2psVSszSHpF?=
 =?utf-8?B?NHI3TkJ1SXlyTEIyY2o5b3RhV1B6QkZZaDZqT0tKakt2Sk4wWUc0R0tZNC9V?=
 =?utf-8?B?SW5NVjVQMGI5ejZWMUJYa2lvVGFSVUVWWDJWN3Fwa3kyc2t0c1pHQ3QxbDhl?=
 =?utf-8?B?YTlLejdjaERTUnJQZStaV29Vbk5xTThvYnVZQXlRci94b1ZMUXdVc2hpOFB2?=
 =?utf-8?B?OFF3MmFPQTc5SCsxaGZsdVgrSVpmWXVSQU5PS2V0WmJFYmo1K2hVYStYQ3J3?=
 =?utf-8?B?WTYwT1pRYlBtTnNKUzlxNlorTXN0VktyZzN5cGNLUkZFUGRGbGFJSWhhQ3Ns?=
 =?utf-8?B?NG9nRS9EOEMwd3Z5V1Via2xQZDN3SWMxdkI0bkR3WDlFSVk1eXdZblVobVZ5?=
 =?utf-8?B?UG5HVlhtZHNuZEQ2UU5TUEFtbVJGbTN1VDh3Y0hYZnNtckR4U2NHWjR6Vk4z?=
 =?utf-8?B?M0poZFJmQXpIZGt0V1pTa01rcEh4R09QNVF3NkZGcTlaTjJFNjBDQjJmZUtU?=
 =?utf-8?B?bnUwbkVNd2kyWFpDY3pHeTV2aHZ5a2UzQW5sUmRMQmE5ZjA3aUFNSEI3VExH?=
 =?utf-8?B?ZHRSV1VKMnZTUzhUV2hwTHV5czdLMEduZWFCOE5JTFYrcUZzQTZuQ2N2NjM4?=
 =?utf-8?B?L05aTFR2OHkvWTNRWnZzQzlhTUNWcG43ZFVZeXhTem82K3l5K09SazBxUktP?=
 =?utf-8?B?UDIzbkp5WHEzSXhyNUllc2RFV0t3c0hhMmJpRnBxdnEwL3lFWUJjZmFRRzNa?=
 =?utf-8?B?ZVN3bUZTOUxpQUhKNVBKVHJOMlVDRDl4eWxLRkdxdnB0R2hwM2lzL3ppb2h5?=
 =?utf-8?B?by8ySDFHREVuM3ZzOFpOd3R4VkIzVm5ZTXN4NjE1amttbjFReGRYMGExT2Ir?=
 =?utf-8?B?TWxHM0tab0ltc0ltWWdXd0U0ZFBlb0s3ZzkzZVU5MW14akFLY3VGb2F1V1F6?=
 =?utf-8?B?Z1ZBcGVyeUdUaUR4bHdJSC9UWWZ6WTVOd3JwbmpucWgzbVFtcFZZN0gzRVZD?=
 =?utf-8?B?c0RXU1hyR2tsSFZuVGtZbWJ1TWdINFBlMUhDN25qUDFUSkhrcHJ1K3E4bUlF?=
 =?utf-8?B?LzZ2MlREY2MyblMxUklZcVZGQ1ZNdjFpVnRmZ1NCSHFVM3htZ2V6dHdxQ0p3?=
 =?utf-8?B?V1lyYmVmZWtJbTMzOUk5elRSeUpNUUhPNWpTR0lwclQ3SC9LZDhsamJFbWpM?=
 =?utf-8?B?TmZ0NUg4b1ZBY3piRXU5MjNXc09PNmtTWGt5RjZKeFF1RWdoM2xTMHFXekhw?=
 =?utf-8?B?RkVGL2p5WW9RbEhPYWxLUnoxNFpIblpoUkhQbTlKZnBXNjE4U2luUDErVEJa?=
 =?utf-8?B?UTFXQUVjTHdvL2x2UUpUNzV0UHBWQ29sL0toQm5ldTZkb25WV0k0UnF1a2Vj?=
 =?utf-8?B?OGJCSm1zNXBkVk1Da3dBVkJOZjMvREIrUFBrbUJwMUtLaTJBYjhwN0trRXVs?=
 =?utf-8?B?RXVMS1pNTmRuaW1mb205czNIT3RJY3NlS3J6ajNWTHJQQzdiS0pDbU1WYU43?=
 =?utf-8?B?WXAwajVmbWs0M2UvbElSUU51ZFVHVklQRjdHQkYwQ0k4TTZycTJiMkVEUWRN?=
 =?utf-8?B?NnNCRHFzQTB1WXhtd05FV3IxLzNidEJEdTRhSDBaMVgwdEgxT1ErWnMvWXFP?=
 =?utf-8?B?WHhWbXVUMjFTNC9KZTRzQkdjQ0o2VjkrOWJTL3FuQ2JSeCtrK3JtU2M5cng5?=
 =?utf-8?B?RGVrRys2ZDNqWHNuN1VZUWxMblN0aFNHeWdhcnJSa1g3NEV5UE1rQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 5daa0f23-668a-4b37-9738-08de88fde17c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 17:01:52.5252
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RLUKywo9NqBfH3CWhOM5rHTVjkYgZLuW3BxVqY/oCkBqMpt7nDHHddQGhhH+v8ZiRa7Bl8zMuqvUx6EXHLDvtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO9P265MB7565

On Sat Mar 21, 2026 at 1:36 PM GMT, Alexandre Courbot wrote:
> nova-core's `DmaObject` type has been created to serve the same purpose
> as `dma::Coherent`, with the addition of a handy constructor to create
> an object from a slice of bytes, but without the flexibility of
> `dma::Coherent` since `DmaObject` is limited to slices of bytes.
>
> This series adds new constructors to `Coherent` and `CoherentBox` to
> cover this (arguably common) use-case, and updates the nova-core code to
> use them. This results in more consistent code overall, and allows us to
> retire `DmaObject` and nova-core's `dma` module.
>
> Depends on drm-rust-next as of 2026-03-21 + [1].
>
> [1] https://lore.kernel.org/all/20260320194626.36263-1-dakr@kernel.org/
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Looks like a good cleanup. For the series (with nits fixed in first patch):

Reviewed-by: Gary Guo <gary@garyguo.net>

Best,
Gary

> ---
> Alexandre Courbot (7):
>       rust: dma: add from-slice constructors for Coherent and CoherentBox
>       gpu: nova-core: firmware: riscv: use dma::Coherent
>       gpu: nova-core: firmware: fwsec: use dma::Coherent
>       gpu: nova-core: falcon: use dma::Coherent
>       gpu: nova-core: fb: use dma::Coherent
>       gpu: nova-core: firmware: gsp: use dma::Coherent for signatures
>       gpu: nova-core: firmware: gsp: use dma::Coherent for level0 table
>
>  drivers/gpu/nova-core/dma.rs                       |  53 -----------
>  drivers/gpu/nova-core/falcon.rs                    |   6 +-
>  drivers/gpu/nova-core/fb.rs                        |   6 +-
>  drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |   6 +-
>  drivers/gpu/nova-core/firmware/gsp.rs              |  27 +++---
>  drivers/gpu/nova-core/firmware/riscv.rs            |   6 +-
>  drivers/gpu/nova-core/nova_core.rs                 |   1 -
>  rust/kernel/dma.rs                                 | 102 +++++++++++++++=
++++++
>  8 files changed, 129 insertions(+), 78 deletions(-)
> ---
> base-commit: 19761c783a46bc4fb2ba0ef22111f7dd27b441e6
> change-id: 20260321-b4-nova-dma-removal-a7e88d4a6790
>
> Best regards,

