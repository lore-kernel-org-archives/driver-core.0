Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011062.outbound.protection.outlook.com [40.107.208.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E8873DA7E3;
	Mon, 27 Jul 2026 08:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139602; cv=fail; b=RDzhJLUXaarvqZHm/dqyjK6B509Z3/Dnm8ozHUuoKxhvGMBZW/d5GdEceAdImFC96V4aMoHt5x/yFG06RVWBE7EI4SUMNU0ckOYjzgfj+sEcwd/RCfu7c8YFFbkQV2JxYLN3G2gh936RjU/ET7VmgV6ceedfb2FACXKGP/8BoHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139602; c=relaxed/simple;
	bh=to801/9Fwg1fkYDhJxqp7VcuquWshteDYj2KLcboOOY=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=VRHWYMdxn+LIdZmU5IWHFRyuzvGWIT19Ffpeu7hipKndqs5RwAn7GfmYBYQC5yBx3qiiCoSemk9R+tdMdbkDeB/EwWETgqhzRPjIgPLtHwPF3EnzZ7uH5kwOFxSiTLQFCYZuteT+3LtR+xCArJZv1zrIWzovNnLhIbHuvKbdpNE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NGI3D+dh; arc=fail smtp.client-ip=40.107.208.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NGI3D+dh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z+1joFxT59Ii4dJbzCkGg4O2DvjezOvnBlmZmLyBfHJeg7jNPnjtWsgpcB9HuWPpO286VXZQMelxPXmH9i6g9TmyxkTyvpqklBDtal21iLUoAWJbOxNQmHV1NMipnNnCkXX3a8a8wiUPoMplfAYVnSixk7N5QiIOZ1iGfdAnr/rerHrYzWD/fVZnhg/fitYkjXRq8IyEZdcLc4Gi+iq/Sk4OBqnTtvwNCboj6D/JlZJnfSLvldmulerdj0i4TIrCkiL/irDOUcDq7oFaT1ThispB3G9ye+tva2ocyVX8S6jGosSHtfKsZbAJUJKPeBsWrtDO0R9bZG5J1rcOqfS//g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GxB9zvoDoK2GQxAfpyMtASqJ5Y7XyGC5WxsfYezlTv4=;
 b=b6JJylMEjaMPKNKNvevJdVi7RJHIwy9BspqoENh9Yz1xGqDdz3UwTB+tDZEocgg56q3gBOPy1XgmO8Xq99/KZnhqsYxgbCtrQZvvH8GBqtpwKe5QHL+wVGam2tRKHvRW7rf23YW75sPm0GVPulX2lyaE2C5YFHv5EUNJxUD/WXl42N8o/yIACldx5pjGBTT7Cu4/kO003+hjuKUKuFIIhigNwuwqAazgXf4EltYHAh9ESi8AQwr8WkQlgGzcZT5UboB+uyMh1UAHlaDj3iNUY6FmVpTWXbmA88h1ApwFDoQrTUsZAJN1JksRBQYcfOBSItDosHnHkK07IRQrT8iQXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GxB9zvoDoK2GQxAfpyMtASqJ5Y7XyGC5WxsfYezlTv4=;
 b=NGI3D+dhaMmwIvqDAa2TNUrcssjblS4Yf7G9ZIY/RjH7ZaJZdIjbM1Xi39ZfM0waDlWIgTW0sGgPZxWNqT+7dcO9IjdGFVmA8/jqGm184qaGaJtci6vjPft4P77x6j5Xwmjqqk7+W3VvcIcKADMxgk1w+okZ7OznPErVOgu6PyYZ9ItniGY+WEQ34hnjGO51gebyi0gYFt16ouw1vycbM7NFBfCJO/CBEmrcdaoo5JlBU9tZRJFTkkTeFDV1pqBUt+IhVKT1eIX6Yz51e6CqVACSXDEpvM0ujSI7+t8BW+zKv+x2/DkFyzZ+Tw7EVoSKVZb4Pa3dO2i4Ps2Zm4pYOA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9172.namprd12.prod.outlook.com (2603:10b6:610:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 08:06:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 08:06:36 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 17:06:33 +0900
Message-Id: <DK9767ODPIPL.7FWLIRIVH7H6@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, "Gary Guo" <gary@garyguo.net>,
 <nova-gpu@lists.linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v5 2/8] rust: firmware: add request_into_buf()
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260710230428.865447-1-ttabi@nvidia.com>
 <20260710230428.865447-3-ttabi@nvidia.com>
In-Reply-To: <20260710230428.865447-3-ttabi@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0071.jpnprd01.prod.outlook.com
 (2603:1096:405:370::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9172:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f338d1d-b6aa-4f50-e608-08deebb5fad7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|4143699003|56012099006|11063799006|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	3Wby6WLuraV1ajd/EUm791IT4eQtrVXOgLJsa2I4hFHOOmFJwVMcHtxGDto0+88NSecygRoRiR5/BtsxqEmSQHL/jjrU94aUKNvSrkmTfBGjhRMJf0z6bO7kjF5XlKpTQJA6o0OeCiaEQSAePTT0YPSaHzaijQV7rUrmem0nZfaidAythFmBWSTDA/b+B/HEgJzKIxhObM00wKGmG1oSDDCwXMy8UfoO5YIXJqwMgzoF0KWGsrNTVF4aUlvngmAk+zTH5x7l5suReR9zlCnzc9ygLjlOnBQoc4yoXBnuNISvr0WypioGcFIGjLYZhVqx7abs1zb58m62+4PxtNXI1JTpXUcZRSZU9vyCPJZOkK7cWwpDNFTXmqwjWSoLk+G03M69WX7eVjwD1o52NBlxqNsGc3GvnSl4GpM+kVvJGnyyvohXHTrrXYpbR0OjcB+rutX+rWBOB23tJHVmo0T+4QK2ef0v7xQNm3BKZz97lbNFstf7VT5Qc6e5Y9S75QHnLOdPQNGEAOGePk6mqUjf98xJJPKO6hy+e9TUcc7uxfI7KMafaVmQH/suc/ONNntl1R9lxMF7yQSnVlIQ3XLUJ8pN7N6hoGG0m2/hKXFn3Drhnp3XHWVt6CWbq867taAGycHUJ12y/m+B5Y5byFrKOFuI5pGTKvsBBvE9eF2QJLg=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(4143699003)(56012099006)(11063799006)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?V255WHR5VWVLandOdk1CUlFKTVhPT29lMkUvYXBZdkErNlF5V1hSR3FsMmcr?=
 =?utf-8?B?cnNMY2MvMC9qSHV3NHZXUTZiczExOVkvNWM5dEt4WG1mRXp4NnBLc05jaTJS?=
 =?utf-8?B?THpFUHhWbmZlWWlXSWR4eGdMM3BvRU1SdXJNNXk3MGY3eHJRdSt5Q1ZHRlFh?=
 =?utf-8?B?eWw0SDV2elNzNktLeEY1Kzl1d2hZSEFBU1hFOFdaVllta1BjTVQxRlJudjJt?=
 =?utf-8?B?WFdrVHpXV1NaaW9odlpLbmpvTVI1TXBDcEhnOHlqb0JnSlIxdHl4dWlWNU9h?=
 =?utf-8?B?algzaytRVnZNdE9rWGRDTkR1VDFMWkYwYUZkL0w0akIrLzBTbFlRQjZ2dWJL?=
 =?utf-8?B?UE1wb0cySFZnbXMvbXUvemtNRnFJcmdiMG1LMmdWYllEek13eTZiVU5SajhT?=
 =?utf-8?B?VldkU3VObWEwN2l0Zm5RejU5S1hxUXFhb0RsaVNzMW1OcHEya0dRTnQrcmQw?=
 =?utf-8?B?KzVDeSt2WHdXWTh1U3FkdHVseWtMaDR2dkF5cEg4K1dhZEo2elY3QW4yUVhG?=
 =?utf-8?B?Zy9qblpFbys5U29uNGlMNXpjM0YwKy9Ibkg3aVVBa0E1K2t0TVZ0d1FIVTlu?=
 =?utf-8?B?a2R2QkhzeGZGcVd0QldNTXJJZnV1dVdiNlRvRitGNnJzYVNtS0dDdUIxWmNn?=
 =?utf-8?B?RWJ0VWVxOHd0VzVvVisxSy9VcXNEdEhINmNrS00vQzZ2WEg0TmFYSndZd2Ir?=
 =?utf-8?B?WkxWSzJlK0NWcXdNWldIUG5YWksvclUraHJwZTl2SFhxVmNDZkE3a2cyeVAz?=
 =?utf-8?B?c3cvNmdZaXNlTVZIWXdwbHVIL1BuN3dFZVZFSlBkNzVWUDZOVVpWSllVcHJC?=
 =?utf-8?B?U3p5WThWVXhubmZSNjZoeWxxVVVPSXJ3Y25WSHBsRFRGM2pRUTVWaHBnNHdZ?=
 =?utf-8?B?bEtFa3I1QWlsakVsUkhNZUtMWEJNYjRQR2JseXNEN2kzcWplQU5CRnUvV1Qr?=
 =?utf-8?B?RlQ0Z3dQc3N4bFo1dlAvMWdmV0UrU1Y1S01ka1dCWEJHZ2hxZU0xZDduNktP?=
 =?utf-8?B?ZzVPaDU4RlZRbis0RU4wREpWNTkyL040bWxPZFNHYUoyZ21acmpLcTBrS0s2?=
 =?utf-8?B?d1k2TWoyVExGSHdEVHlEMTZjTHpjeS9USk9mWThFaGZyUWFiWm43bTZXZjhi?=
 =?utf-8?B?cmxDcHZyVVBJd25ncXo5SG5CTU5kS2t5Wk1ySTRkdUwreG91bXdwdFBGaGlO?=
 =?utf-8?B?TTFlemhLdVhEdXNramJRTmFTbEFzdGxqUW1aeHE2dHNFWWtvUnlIbGNleENF?=
 =?utf-8?B?RXB4T2VKRE5FTnI0VldsS1BzTXcxWnFyelZpd0hMVlF2NEZmNDkreElDeHNF?=
 =?utf-8?B?UitUWjlyZEtVUG9UaTFsK0RscHJnblJXb3ZzNVAyNFdjUmZkNkI3Q3ZBWXY1?=
 =?utf-8?B?VDJOSzk0d0IvbFkvS2RUT1lBSmpWd2F0UmsyMi9rUXJpSVA4emt6aEJieG5o?=
 =?utf-8?B?bjhzRDRxazdkSmswQ3k5enI1SERWNS80YzRwUlFhZVozRmFhY2hvWk9ycWs2?=
 =?utf-8?B?N1NVblhFS1dLK0FZM1BiZ01FdGJpRVlBTzFhWjJ3anQvQ092VnM1ZEV5SUlx?=
 =?utf-8?B?OC93YnlSM25WR243RzdDMjNadVcvMVAyU1JwbEZueEVjN1hzcTVuY3hvU2dU?=
 =?utf-8?B?a0ZHaDI3dW5DMU0zS1p1VzVDU1UwUlN0VlErdWJSVENkejNMNTBmc2R6Rm5y?=
 =?utf-8?B?YVlMVXVGWEhtVHhtYi96VWhnL3owaE1zRHZ6OVk2U0FTM1QwcTBrcThIR3Bu?=
 =?utf-8?B?MVhsTzFRQVRqVUdjMGNGdTQ2c0U0Y1lmb2tWY2J0eTlOdWUwL2ZHS3pzUkcz?=
 =?utf-8?B?dkI4cnZOY3dRVG9XOXlmVEtPcXRCQ1lVeEFGcnArb09wdFZ6TnZ4ZFRDRVJG?=
 =?utf-8?B?LzlnMDdkdDRmeW81bVpYYTJsNElsQ2FxeFpRcXgyTFlBNit2UUVEZUhhSTN5?=
 =?utf-8?B?bjNid0ZZNEdLcWtTcUJPRWdGUVJlZ2dTV2EvZmdhbndaRmQyWkpCSWcrb1Vh?=
 =?utf-8?B?MzJqdnVqL2ZZNDN2RDJiamk1UjlsMmxjTTI0M0pDbnNGZkJlbzg5K2pZSktY?=
 =?utf-8?B?cDliSUJJVUtRRHdXcGMvR0lzNVFvZGhjV3R2allyczlMYXRhZWt5QXRmdUkr?=
 =?utf-8?B?Z1FTb0MzcWpPZkVQWmNNS3VOUUVoempJeE9oRXpwelZ0aUNEV1BJQWNZUjBz?=
 =?utf-8?B?ZEt4ZnJqTVM0QUxyMUIzcG5VRnBaSVZQNHFYY2RmKzE3OTN2YldyRkJHZE5n?=
 =?utf-8?B?bzdVbkFZKzV3SUF5aXhTeklPYlFGaFlqTXlrZENWcWVzQTdDdG93d01RNjhM?=
 =?utf-8?B?em5HSElEWmFjdzJQZkJtYjF5c3dnUU44U1FEYUJqcE9KbWp5Sm9xL2t0NXZt?=
 =?utf-8?Q?rP6xzPf8a4+JPni6+zy3YWEKpjkWLhtfc7kdNOtqgVd0i?=
X-MS-Exchange-AntiSpam-MessageData-1: uPSQwYA4nDSk0g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f338d1d-b6aa-4f50-e608-08deebb5fad7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 08:06:36.5118
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LX3PlRRPhk7m4SCjPALe0KtXfSYqHchBsK2gikBL8ia+qD+IXWDHVYFvdx9ce8zgknqiOlFHdm2adte4fEOlnQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9172

On Sat Jul 11, 2026 at 8:04 AM JST, Timur Tabi wrote:
<snip>
> @@ -120,6 +121,50 @@ fn drop(&mut self) {
>      }
>  }
> =20
> +/// Load firmware directly into the caller-provided `buf`.
> +///
> +/// On success the firmware image has been copied into `buf`; the caller=
 accesses the data
> +/// through `buf` itself.
> +///
> +/// This is intentionally a stand-alone function rather than a `Firmware=
` constructor. For
> +/// the `into_buf` path, the firmware data lives in the caller's `buf`, =
not in a
> +/// kernel-owned buffer, so returning a `Firmware` would expose `Firmwar=
e::data()` as a
> +/// second handle aliasing `buf` (and `release_firmware()` does not free=
 `buf` anyway).
> +pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> Re=
sult {
> +    // `as_mut_ptr()` on an empty slice returns a non-NULL pointer to
> +    // memory which the loader does not own. Passing that pointer with `=
size =3D=3D 0`
> +    // makes the loader believe that it is buffer it allocated itself, s=
o when
> +    // `release_firmware()` is called, it will vfree the pointer and tri=
gger a
> +    // bug. Reject empty slices to avoid this situation.
> +    if buf.is_empty() {
> +        return Err(EINVAL);
> +    }
> +
> +    let mut fw: *mut bindings::firmware =3D core::ptr::null_mut();
> +    let pfw: *mut *mut bindings::firmware =3D &mut fw;
> +    let pfw: *mut *const bindings::firmware =3D pfw.cast();
> +
> +    // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings:=
:firmware` pointer.
> +    // `name` and `dev` are valid as by their type invariants. `buf` is =
a valid writable
> +    // buffer of `buf.len()` bytes.\

Stray `\` here on the last line.
