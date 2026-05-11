Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021075.outbound.protection.outlook.com [52.101.100.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6BE481AA3;
	Mon, 11 May 2026 16:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517286; cv=fail; b=Scbyt9GbHkFyzSpH4Np2ehs1H6iwncZgECWr0tSSBjI1l6D8DI3loptXL3nF6ObQYzCE0rKvxEvzu4GT88PXlzcL2i9pESu6ld6SMQlGnRI86aSbd4eOTB7dq9A8eJFuvIya0kp551/FDlM34C7eEbJ0Nf7KfHyIwMJ3gNrIJec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517286; c=relaxed/simple;
	bh=tl6CugNzWpKHvpoZ5lpgKFcLkLi2HRnVWo9nntjLwnE=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=HPb8R9yEsYxzq35I2BnK2HXDH3JMVSEpoYTGyN2USk7bgOM7waxeRDrmTUov4+Goc8ajb6cmk3LbAM1ufzBq99pqjwSFMIcdOqBgHDVtVd2g3xZGIS8Rg9XRPXRyFk4FfHw9k+7qh/Zar/6c1AWT9cRJ/Fo8k1KhiESBvjCElEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mVgd5/++; arc=fail smtp.client-ip=52.101.100.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mVgd5/++"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gdb9fANloAxVGWo+Kkgt6MJtgQDcTgNPKzditPOVP8Z+jUu8BebGjbvgvVmjLe9FitLRFm826Ngd6x4IGuAslSfzNX1zBOq2caaPo5mNiEfRQa2psyk/4m7QupMXWvjkZgjnkQP4BmZzg+Yzz+08ibM7H9rdKKaTVXp3IVfRAbgyqa+aM1rJgrXO7ZMX96vg+3wD0qvbwA5eXrgZACoG8+YmhUv1TeZPgDaVGbRY7y+6VaLAXqir8ej6zNDIKVZ4vDdMsU+CKhBrNXl18F4yWxirJggGKlqN7hTuTmBWZ5+AEbDzI71ouqEBo4BEWfUKfFB5GMj8sG5bXgG7jQw0qQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nHWuAO36hLTkX1Nk81hRkzHDJ+5JojMYY6mJJGrMIFQ=;
 b=x9s/WB2MKvZdrkaDPjZO7Vwl+wzFtQ6b3AYyUz8Ue1VodMv71SAOxz61yKy2TP1e9pRg1yfOLw/A5a1kgusmIGvhJ0+wjjvFBTvuO93y/r0ioOf+0p62Pw3qkHczzmEBaN8PN8TgpjNaMvYeHoMwimDqh8w7YkyvU4B5wZes5YCsBKaFleFgNAwDCXFGbYG0/I4IlCpo0XZUQZAuKhlAt7fAc44FoKNyIgrr7uUz8QKe8mKOzOUnqUYQcwWKJLZ8XJmzZtmPZSUw1/nsN9znXEzCvirngrapRd+1Ywwvovq/nVe8W7Zit0Citq66dssi4Q64EkYXZxxDjOCPcbrXoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nHWuAO36hLTkX1Nk81hRkzHDJ+5JojMYY6mJJGrMIFQ=;
 b=mVgd5/++yanZ5NDb3mFGQDwFz5u5cBbvzgVdjQdYEVNa5ud2w6UpPQXmgMBgsZpuJmoVoqnq9esVJgAkOS2MyEGE/Vv1E0JSVvipVzn7OZ3hUm1t3N8npyLHRSJpdHdIaoUPQKSBWRubcCcziYfxQWJF5bKM/6TDSHUUjR8DlY0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO4P265MB6185.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:27e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9891.23; Mon, 11 May
 2026 16:34:41 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9891.021; Mon, 11 May 2026
 16:34:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 17:34:40 +0100
Message-Id: <DIFZRBF3LYHN.19Z6RBMECXDVM@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <driver-core@lists.linux.dev>, "Yury Norov"
 <ynorov@nvidia.com>
Subject: Re: [PATCH v3 1/5] rust: extract `bitfield!` macro from `register!`
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Yury Norov" <yury.norov@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
 <20260501-bitfield-v3-1-aa1076c3337d@nvidia.com>
In-Reply-To: <20260501-bitfield-v3-1-aa1076c3337d@nvidia.com>
X-ClientProxiedBy: LO4P302CA0030.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::16) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO4P265MB6185:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea102a4-5483-4715-209f-08deaf7b3376
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020|3023799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3aYNwHTNZHnZ0lavoVUyBAFjuM20DKKvm4uVdPU6QGrpsIlWUsGHDbegrquhQyu9oa1PT7h74JJ1OH5GbQv4BYrZsE86QMdW+PbgMXKFx+db0G2jhNRCoVxEcDlhZuophq21VJhuMX64SndREvywyZAbNuy3mNXN2LoSvhPGC3U1nXOesO2VwNC9PpIwxtAqME81DPSicmJFuJa0CnH7lyZJl3BGDHEGWryamRdBFjmk9GhcPZyvH5xe+fja6RcMTvSa33iwuvWL8NxLbmwI7ic1EGZCW+zAaVm1YvFfqnlX+go7ehGvi3SWmbAAb+gvgiOkSDq95mOnIdBGfmCljW9+qauogmSu9XXXyOHjMcD2GXvkMXLEQeu1RNvkr1wiE5qRUbjnil+/pxME+yR0WdB24nS7bqnXd8+ENG59OwD6Py/8rUgctO3R8O+1TQc5VqIk5bBJvHK8uadr3/8ui9lUi6oBeMbL7YGdNrQxuZnbqh/4vf12jR4fL+sPZ6xfuA9ppfvz7i8uMOA3glJN2x3pDQZEXbXhsheHyVpyST9RI70U7cTy3r2TPo9G2cUm+hZdHiZKZxScHyEk1KOWokkWktR6cQs7EDaEccxEMill59jPQxF4sORvd+hefOwx4i9SjrICH6NvfsK1SkCVH3pH6I/f+XKA9/SHfCwCrBqGa6J4O5wGw1N5TO2AQY4/48mDxhFdEdZhjSGUUkh4XWRw6e4vCsFvv8MOdPAraKU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020)(3023799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cVphSVo2NkFPangwbFZPWVl1MG95aC8wcjd1SjlrSmkwSFpQc0lNM2NRblF4?=
 =?utf-8?B?Zk8ralBZclNTNGNMYWZtRUZGbVlSTExpY1NDbnNweWhBQ0Z6Q3JRYWVPRU1o?=
 =?utf-8?B?MCt4ZzB0d2V5NUZUbGJJVW93YXlMZ3dPSkQxL29mWUFHNkhwZ0pkZkszejRu?=
 =?utf-8?B?L0ZyY291YXdDMmdIdlVrSkZsd1BRUytRQVprTVFDMXhPaTdKTlBGSGRiclpt?=
 =?utf-8?B?WitNN21CZ2hWMFd5UksxYXFDcmxkVHRtV2ZJVFZNQVNsNURJZGxiOUhEVHFs?=
 =?utf-8?B?RlZwSHUvNjdibjZzTUxXRWkxVW1PSlBlWFo0YS9QSlFTU0RVb21zeGlvRnB0?=
 =?utf-8?B?S0ZwNVpQZHRxMk5BNzd2NE9YZTMyZjZ2cHB5ZFYyTDUrRWJjQ3pFcHZsYXhU?=
 =?utf-8?B?RlppSnJhV0xKOHJuNFJZZ2pwL3cwVkV6QUVjUnh5UkdCSzJveUtaZFE3VzZS?=
 =?utf-8?B?eUZOcmIwSGtiK0Q1Vmt4OVN4RU9icXovRE9ycDI2ZTR3d3k4U3pOdHVCdU9v?=
 =?utf-8?B?UWJnNHc0Z0ZyNUdkUEozZzV6RlhjWWxkVzBnNFhwMEJlZW5FTi82K1NFNGhC?=
 =?utf-8?B?cjJJWWZoNEUyRTFJOG9TR1Y0WVllaFFQOVYxcjFUWjlyM014TzlOZm5IUnJM?=
 =?utf-8?B?eHJrWWVJSmgwVU42TEhmcGQ3TGRtSmcwejZNSXN3TWpkYkl1SXZ2a1dBeHhM?=
 =?utf-8?B?d1dwd2hOaGp3S08rdTFJSzFNQ1hSdG83cDA0a1JJV0JvdU1uYWc1NjUwREto?=
 =?utf-8?B?c2xnWE5XaDl5WDR4T1Q2NUUyTUVGWVBmOG5JRk9kT281ekE0bEhXc1VaanF6?=
 =?utf-8?B?OFFScldDNVFyTTh1Y2ZTYjlhRSttbmd4WTIvais1cEdHdDdSNjdyMjFPVERM?=
 =?utf-8?B?Y0tXTkhnQ0hMSnRWWkF4YWhLNXRUTGhYeEx0aWMxd0tEK3VaMUR3eDVVNVBz?=
 =?utf-8?B?TGNwQ1BnRlF6UGNHM0hTT1hTaFROWWpTcXM0RWdxeVlQTlRxZ2ZPaUw5UHpR?=
 =?utf-8?B?Q1ZqYmdiZG1SYXdFaU1yWnhFZmt3bWp6WW9DVTV5SEF3VVZTOVZpTjVxcWxm?=
 =?utf-8?B?bTJ0ZUtiZkxrMVZ4U0llVDNiSXo4d1hsUENLY2lXdUhRcU1KU1hBbXRNUmtX?=
 =?utf-8?B?a2M5Sm9NNy9ieUppMHU5TGsxdUhYbk16OUpZWEFsZ3IxRU9WNmU3U2IwVmcr?=
 =?utf-8?B?WUVBZEZUWVVWSXVjUTFyaWFvWXFCV3IwOFlmcnh4VXk3OFZ6N2VqcUgwQ25U?=
 =?utf-8?B?eFRtRkRFU0ZPNCtOcU9vWDUyQUVxQVZnRjZkSjU1TTQyV2kxSUtKQlloTTVV?=
 =?utf-8?B?K1VWVjNaM2tIWis3Y2l0cWp3YU40NnMwdi81UHhEcDRTTldmeWRoK043ejQy?=
 =?utf-8?B?b1A0M0lRSDhRQ0hJb0xzRUpUMXlnUFl0WEZyRVZoOW9QZkpGV0pDeG5NY3pP?=
 =?utf-8?B?eFo5c1hrWEcySy9GMi9SZmZzN0x6RFdZNnNLeGQzS0U4aEkvWFZPOFlNcllH?=
 =?utf-8?B?Z1U5Z2R6ZVhONDVvc3doL3hEbUlCZWxXUXBENXUrREdXOUJWUkg1QWw2VW82?=
 =?utf-8?B?UTNyUldPaUE0V21uWjZMb2pQelhwZWxYTFpQWGx4TUpKZUNDR1FKbEFkRWl2?=
 =?utf-8?B?ZFQrYURGWmtmSUlQM3BsK2diZi95eU9wSVRVVHZ4c1lDZ1hJWTF5U3ZJLysv?=
 =?utf-8?B?ZVg0b25rSmU1TlVCQ0Q5TEY4UGlrd2orM0ZlcXV2T3ZiTnBmRHBuQkVKNGl1?=
 =?utf-8?B?U2xXa25pdkRYUitnT1RYYW01TnNVK1ZnNHRlM1I2dk9LUElqMmRQL2dTQVV2?=
 =?utf-8?B?QzkwM0J4K2FYdmZmWEV2OFdQNjFNUHo1cVRmWE82MFFFUmF4cVJ0REFMbmxD?=
 =?utf-8?B?ejFCVllDSFltUWVTUVJMYzc2MkpRcG9TelVyZm9uK0FSalg3VCtBbitBRGpz?=
 =?utf-8?B?Mzk4TEk1SWovYzBsZFpwd2RBSGUzZ3U2WW0xcmdHTWpnVXc2d1FiejVNN2R6?=
 =?utf-8?B?L1FMUFlkRVkrbXFGTjc3ZE4wV2tTbmRpVnNVTlhZU0NtUnI0WFJhV3FsVC9X?=
 =?utf-8?B?eWUyVGh1Ym9raTJ3Z1gwb29yYUs2Q1ZJTzltWlA2bDdRK0wyTzNBYm1CUGt5?=
 =?utf-8?B?NGNzQkRWUW53elovMU04cGJOdk4zUng5eUVscGZ6M1ZDTjRKWldxQ0g5Z2Rp?=
 =?utf-8?B?WlRJaW5mQ0lGMGRLVkNNUUlpL2dMTDh1ZnlSWjdjMThhd3ZJK25mY0V0TEMw?=
 =?utf-8?B?aXhKaGRpQlppUXNaWGUrUjVVVGJNYzc3K21vTVJMWEtHdkkxWjdpVjBGb1Mz?=
 =?utf-8?B?Zkt5cHQ2bmZFaFNsSHdvbEE0dCszbFQ4WkNKL1RUc0Fnd3d4UEtndz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea102a4-5483-4715-209f-08deaf7b3376
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2026 16:34:41.3897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ftVbKo0aLVkFHqQiHVOZakYFpLwN1o4mh+fUrwiLt1BBgXJ/xIyw4V09luxspXJjv8JpetXZBNivaI7kJVgn+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO4P265MB6185

On Fri May 1, 2026 at 7:03 AM BST, Alexandre Courbot wrote:
> +    // Private field accessors working with the exact `Bounded` type for=
 the field.
> +    (
> +        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:=
tt:$lo:tt $field:ident
> +    ) =3D> {
> +        ::kernel::macros::paste!(
> +        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<=
u8> =3D $lo..=3D$hi;
> +        $vis const [<$field:upper _MASK>]: $storage =3D
> +            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
> +        $vis const [<$field:upper _SHIFT>]: u32 =3D $lo;
> +        );
> +
> +        ::kernel::macros::paste!(
> +        fn [<__ $field>](self) ->

This and the __with_ methods are missing inline annotations. I'm witnessing
these functions showing up in the vmlinux uninlined. (To be fair, this is a=
n
existing issue because the `register!` macro generated onces are also showi=
ng up).

Best,
Gary

> +            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
> +            // Left shift to align the field's MSB with the storage MSB.
> +            const ALIGN_TOP: u32 =3D $storage::BITS - ($hi + 1);
> +            // Right shift to move the top-aligned field to bit 0 of the=
 storage.
> +            const ALIGN_BOTTOM: u32 =3D ALIGN_TOP + $lo;
> +
> +            // Extract the field using two shifts. `Bounded::shr` produc=
es the correctly-sized
> +            // output type.
> +            let val =3D ::kernel::num::Bounded::<$storage, { $storage::B=
ITS }>::from(
> +                self.inner << ALIGN_TOP
> +            );
> +            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
> +        }
> +
> +        const fn [<__with_ $field>](
> +            mut self,
> +            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
> +        ) -> Self
> +        {
> +            const MASK: $storage =3D <$name>::[<$field:upper _MASK>];
> +            const SHIFT: u32 =3D <$name>::[<$field:upper _SHIFT>];
> +
> +            let value =3D value.get() << SHIFT;
> +            self.inner =3D (self.inner & !MASK) | value;
> +
> +            self
> +        }
> +        );
> +    };
