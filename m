Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022098.outbound.protection.outlook.com [52.101.96.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EF5737F8AA;
	Fri,  7 Aug 2026 19:14:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.98
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786130100; cv=fail; b=ddPdgDRDl8ONnxtS7fTh2tvmc+R2aFKXJggS9qWqGepHJb+WbEd/9RSUWQuaHBCOqN6Ex5O+uUEbbOeDETkIlM4PdWjySuwtIcfm+50MepZJf+jvxPcpC4Mczlk1HNtt/Y2frMWLxdYxiSWdqBfEzMg1CKVRON9E5loLXa87YrM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786130100; c=relaxed/simple;
	bh=Wquz6rGQ1d4768uvSr52U/6zew1L5wV1DxP0x3nfoe4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=NbfNx2ZamyBIsFFftIdgZBgiY/6rV5cKrk5xtDGYnpxXB2FX8ja3f8WkiL9RCSco9qwHVIPPJSvd1XhpomKKYEQn+yxwWwCiqS1hiPyqspXiOdcPfGf+zGHu0p93v123E5DLCvBq+9mUdJkjGshRaAr4nf9YZ26Sca8biuceCL8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=TMy3wo80; arc=fail smtp.client-ip=52.101.96.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="TMy3wo80"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hWsafHtUuSn6QpVeTKS/bSpA42ei/UvRk23n7KYgN3D4JxtcG+IJsoiBEi0akd1LJz7Z38mKt8MaX/UbAk+0fc3A6pqCcUuAqa1QIhZUQnf73Plfwj5LeA8hVu30WT8Crx0FVYk0gpgrLCBIl6JUFvlUmztxr9EmPSl5uF6XB+te1KIOLChfUewXDn7EeyxdP9tN2fG2gi7NEQ5oCviHT1FqML2eQBq/X2FJmCh3SzkB/bQ2ANoYfoVSkggj6bbxNM1ScccD21VemqiWTZ053dzHQ50DLuLG5Qb2XC0kG7hOB0UqI4e8ohuWOgvsICe9Y42S5otmpnTmk4/eI4O5rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=maHvxP94m+CgNKEwxsrtnuqmtDlaEXdq0unIBmAUn4A=;
 b=lro6NqAt2GQ53ytkX8GEu81XEJAA/x/DIqtgSTGAV1XG/5/dZLvldokxdSU5dZIJL9WYmowpdV3AcGDy6eJ0+LfNYRrOEAmuosFDkpAce86/ygcGf8Co9TvleWGW3tjTTp2bwsfG8O5npU2wAGlqCBEDCBHSgvW8xGyicKcfQrOq3WNyWH1zWWyyhsYhXXnDtHTQyn8hirgEm7b2xwGdPwRdRSQnvKPURokJW1hh9UIr0AgpK+fHQz50OhnKqxVcJnXBVPHAUDw4p4N1G0nqLuIOhSEI8pXCK4EKD1NFcamAxcz5Mj/5hv40YC6RjkQ6pK+XFh2NBV8HD29Ed18PSA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=maHvxP94m+CgNKEwxsrtnuqmtDlaEXdq0unIBmAUn4A=;
 b=TMy3wo80QZgOXGsSg0A/NeMChx0HjJDSkBbP7aIXPGlhBCH4jqb1uCdhiQsJx+S3cj/5oGuNGigMo/DdrjiVTSeNQ0LS2rg9NSkCD1i9vCyvFCs1aDdxx7TMvUT+Hz/aeovLw1Oa2ZXnUnMTk1fFc7iTK5kgrzSf3LTccX7oQc8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by CW1P265MB9118.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:270::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.24; Fri, 7 Aug
 2026 19:14:56 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.022; Fri, 7 Aug 2026
 19:14:56 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 07 Aug 2026 20:14:55 +0100
Message-Id: <DKIY9YGIPUUE.SZD2DUQM9NGK@garyguo.net>
Cc: <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 02/12] rust: num: reject Bounded::shr overshifts at
 build time
From: "Gary Guo" <gary@garyguo.net>
To: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun
 Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>, =?utf-8?q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>, "Yury Norov" <yury.norov@gmail.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "Shuah Khan" <skhan@linuxfoundation.org>
X-Mailer: aerc 0.21.0
References: <20260805-pramin-split-v1-0-ff3e84a75dac@nvidia.com>
 <20260805-pramin-split-v1-2-ff3e84a75dac@nvidia.com>
In-Reply-To: <20260805-pramin-split-v1-2-ff3e84a75dac@nvidia.com>
X-ClientProxiedBy: LO4P265CA0269.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:37a::9) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|CW1P265MB9118:EE_
X-MS-Office365-Filtering-Correlation-Id: ef2937c7-806d-4808-a1e6-08def4b82b1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|23010399003|22082099003|18002099003|4143699003|10067099003|6133799003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	ZqW3CZaJd1qSCmZ7TSlmw0LoEW+1QPcP4A+Za+PJUGf+/d4eVMD11IXjGKdcp9p2cLI2ktoe+22iKTBO+vDenEIteKIbdHc0YRNnVaePbexhF0AuhkV7KZxCt6roagEEtrxUZI3Q8jt05lBOnWED3qxxsYW/uPoK0A1561xuN9EK7nuwK0XyKz7GJ9RsTfKCUnpCU2DAeobmAYlN4eNwoHYmhUcGhe/ch6LR/k8xylq2lfr4OMMJdcvJDZWtEcFUUJZfdRalRo6sbb/agW9kHw7vujED7kG4N2zrLpW7hhhu3fdJDHsX3DDB8V8I13UXyVWNr+p1FNQKCHvLRQkD1CnRpOnLdTVBeyikQoA/dn84pnW9BtL1od0q3bF1//xzSvFufEewcDRhtVuJO7vFP1xuttgKWyZSsT1LIIeUVVFj03EgFHcchg0Stn7gwOAp57FGCp4ynGPKBTZyc+T1fEN6ENyB6qul9JvEXty5LzgHiZxxI0QC400i6n33O8ksp4t2R/1vrJOpiCFDO4tKVz+XfV13QWFEvJvepDZPrJ0w6Az9O0msssPX+ZcdDhz6WSXPcukh6MgdbCL8jKeKnKnZaoUTJHv2c8sExSdYXp7AOrYWTmQjTjiLNYNcpvoFSISAKqiXecDGQz8jr/VKuFE17M1YwdwgV2OQ3j+3Isj4nnAL2P5785nLOwjXZLgF1rZDvL8WS4m45cIFUHCC9w==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(23010399003)(22082099003)(18002099003)(4143699003)(10067099003)(6133799003)(56012099006)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WDIzNURiVEdtMFcxSUZxUklKdFoxdVR5eXA2YUNKTnlsZGVFTTgyVmErQXBK?=
 =?utf-8?B?WTY1KzJZV3VkOWN2TDlmSFFaS0VRcnhkSEJPVGtDR1JUUDU0dWUrRkNxWE5Z?=
 =?utf-8?B?bmtUazlEcGZ3WXlaaFd0Q2ZhdW9VVjFHRDBTNUFOMU83eVUzdnNXU2xPY3ZK?=
 =?utf-8?B?S2dEaVlDYXlMMTJpQ05MWEFjODM0ZWRmaFcvL2dRTnl2UnhORmV1UmVvYmo1?=
 =?utf-8?B?Mk9kc1Q4NVFrZzVZcDhhRlNWd2xOTDVQYm43cGhaTWowTzE5SWRibFZVdThV?=
 =?utf-8?B?bE1wQ1o3OTAvd1VyRHNqLzhCM2phS2x0THVPNTJRZUs3QWVxcm5Da2pRNGo4?=
 =?utf-8?B?REdrRGJMN3d5Q0ZWMUZEakJ3aVVjTnBvMG1ISHZORnlKUkg0NEJieTVncFNk?=
 =?utf-8?B?Rkc4aHZpMlJWYTRmcU80VkFET0xSQjZQUDdTY3V3SGlKQUxSNkpHR0RXNXha?=
 =?utf-8?B?MEo0L1ZSWjlwZ3dtQS9QSXlMTGROejl0SStydG15Mk05dk9UUFhPNkdYYWhV?=
 =?utf-8?B?RWdXQXBIa1M4WXZxR1dlWjU3TlBqYys2Z0dEUjdsWjk3QjVUSWF0UGRwK24v?=
 =?utf-8?B?T1Nac3Y0N24ybTZNQjJqYWxWVjJYY3Q4ZVN0MDQwT3NMbyszWnpjU2swMWUw?=
 =?utf-8?B?Z1kvTTBTRnE5V1dNamUrSy9RK2lEVndhNmNNK3lCbjBCRU82SERCSTFDdFVP?=
 =?utf-8?B?WlBSdUFzTU5yaE9BNHFGbkxwRUxaWkFiZ3R2NXNMYVc4U1ltMXJydnM2b2p2?=
 =?utf-8?B?N0t1RTRTQ3ZISW9JMnpPMEw5VFhUdE9KaVA3bkJsWnF5dFNOWHhrWVVHMWtQ?=
 =?utf-8?B?RllFalZXUW1ZWi8yUkw1VmVyZlBDaG1tZk04SVdZQkFSRGNwT0tRS3BpQll2?=
 =?utf-8?B?amFiOTI1RUwzUlU1ejFYOTlQbU1yT1E0S1QvZFRvQTRlc1BsUE41cW13a0ZR?=
 =?utf-8?B?OFpETk9PeXJOVXJYRXQ0QU55WGhPQXh6Mi9EdkRNdktRZHNmODgvRks1NTlt?=
 =?utf-8?B?VFlxY3BYajJXZWJxMmNRWUxNUzUrNjFrWENMWmt5SWxNZFhOdkZzajhreTJG?=
 =?utf-8?B?TEY4MjNlT1lnNjVqS28xUnEvc29YUFRwMjdNaS95TndMY1cvbFNEeW1KY0xa?=
 =?utf-8?B?V2hCd1I0K2thYUR1N0lJSlZUaExhZGg2UzRvdWVwN3RtaG14RmszR01NNjJZ?=
 =?utf-8?B?cldZQ05Ub3dPc1JqeDNCS2hsYmtLSjVUUDBrVHhPSkRJVWtlNHZLT0N2R2dM?=
 =?utf-8?B?cWRzZ0pqNHM1ZXF0eE5UVUhRUlBWRUY3MUxPK0dJNTA5STFaT3Q4YUk3MSto?=
 =?utf-8?B?Z3pIMnl5dGxlM3ZCdCs2MkFVQ0JPZFdwR28vUDJGUUNZUmJlbG4zMVRnemRN?=
 =?utf-8?B?cE5HM253eFBvS095Qm4wcVFhVkJjc0VjaXVkb3Q3NkZPdlYrWVI0emNmQkkw?=
 =?utf-8?B?WTJ5blJmWEFqdTdPYnBsYkVjdEpNYWc0U0VualNnMExYZGJUajZ5Wm1vcVM1?=
 =?utf-8?B?ZzU4OWdXb1hqcGFmRTlsQzZGWmg5cE9mRW40cGpQYXk5T1IwSFU3Rks2ejJi?=
 =?utf-8?B?N2tqSk5ZY0FxaitlazNUd1J5YzZSMFBhOW41d0lva0lhb3NMNC9OT3RpSUdL?=
 =?utf-8?B?UmttcGRWRER0Mnpwa2NCUnhTRS9ERkpOSHo2U0VOKzNFUjl2M2x2Wk9ISTNs?=
 =?utf-8?B?czhWZm11aGdLTDNNY3EzS3JFSDE2MG9OY2tLTytGWlJuOStZeit4TVFVaWVF?=
 =?utf-8?B?cWkyLzU2bGdqbStRdWx4ZElDeWt5SGJvUm4yQlJnL28wUW0xTDlCVjVrcHpj?=
 =?utf-8?B?ay82ZUZvTVFPd29LdEZmbi9CcVptR21VM1VyTHJqcHZEN0JJbTBtbitSVFZq?=
 =?utf-8?B?OWRYQjdmRVJLeVUxMG9Ld0ZTYm84a2R3d25CRVZpcEoxMTJVMFNBOVNXYU12?=
 =?utf-8?B?RWpWcHVaSFY4MlUwbmxRYlJEdk9ZNHlneWdlSGlKMXpNUlRSR1Z1TW9ESzNk?=
 =?utf-8?B?MWlyM3c2UnI5Z25DcmtrbzRaQlBkMEJxU0JHeDZ1VmVrSlpMMHZqQVVKQlk0?=
 =?utf-8?B?TTF0bVhPeG8vREc3QkZHdjF2VEhWdm9DR2d0U29RR2NhLzBOSGNTVU1FcERR?=
 =?utf-8?B?eHd2MllCc0wyMDlRT1FUQjFIUTJ2SVM5V0NMRFlkaTR6dDExblh3ZHJmQis0?=
 =?utf-8?B?dVJ3UFBCWkowYm5GVFcxWFY2Tm1ZR0FnaFBQUFRWWEJWbjJaRk5UanY4d2lw?=
 =?utf-8?B?QWlDTnRvaHBCbE9za0VzRXQwa05wbXFoN1RCLzdhZUpUdk0yeVlCV3JBanVB?=
 =?utf-8?B?c3JTTGFiTGpZSFNBTElPYmVJNFdjaGxxTDhOdElxaVh0ZVNQUmtMZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ef2937c7-806d-4808-a1e6-08def4b82b1a
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2026 19:14:56.8281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gNBOIddofRpspfTvUAsU3qRvPdR1WinR47unCuG6wEti9r2Ahe91YswpWDHZGOp7sajK73Ehz4SJamTc9rYqvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CW1P265MB9118

On Wed Aug 5, 2026 at 6:44 AM BST, Eliot Courtney wrote:
> Make `shr` reject shifts of at least the type's bit width at build
> time, instead of panicking or masking the shift amount at runtime.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  rust/kernel/num/bounded.rs | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index dafe77782d79..f263107f001e 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -485,6 +485,7 @@ pub fn cast<U>(self) -> Bounded<U, N>
>      /// assert_eq!(v_shifted.get(), 0xff);
>      /// ```
>      pub fn shr<const SHIFT: u32, const RES: u32>(self) -> Bounded<T, RES=
> {
> +        const { assert!(SHIFT < T::BITS) }

This should use const_assert!()

Best,
Gary

>          const { assert!(RES + SHIFT >=3D N) }
> =20
>          // SAFETY: We shift the value right by `SHIFT`, reducing the num=
ber of bits needed to


