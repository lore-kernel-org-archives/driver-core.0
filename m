Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020083.outbound.protection.outlook.com [52.101.196.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A25BB2DF153
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 00:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.83
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784854011; cv=fail; b=goR+iAluYpCAA8sypnF264Mjo7K5iPGveH23D6/vR2kGKVOK09qyHhDtsdXjcylz0A/gIK1TiJE/Efp/IHqq8B6uj5MF9wcL/CmzUyurS/+H5W/LXF1eCi2Vrtd7z8UpuTRe6OQ7g1YvLmuoBdoWXBwACXTT91kCbZOUZKwy52U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784854011; c=relaxed/simple;
	bh=Oi/6qPhf07XzklwE0MkmTNG7hkoM4JXcAA8hq26doDQ=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:References:
	 In-Reply-To:MIME-Version; b=LWT08sevVAePeOmHB0y/bZ7hD87mrnSUF711qMnpFnaLuAsXIGSOD+Ea9FAy4c8HXmfmVwhQ5XyR23V7beBOAjJqpMFR2MER0iFnlGE4n8VMqLkXaYBfDVHM7wJZFwpM08SDx5tHMr+RvPPCseyb1BMx/7+cLkVFC1r+531S0tk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=aMIXhPju; arc=fail smtp.client-ip=52.101.196.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="aMIXhPju"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQaZRGHkIC+iy8VHHo+KJjlaiE+54UTWs3NQQnOG87rysIYLHfPoGjmqfjtPP5vPdQ9hjbUnzFi80NVSW5ru1BdgFqWx9hgjbXj91xKCxMa6J2GnDKl9jAmdXcVkp5PYIxbMNiYmiDpPWwX7OZ5tieyRbbK/9BwfoeRkHWxOaxRZLMguCuPPu6bDbYZG+6F/cSho5prPmAXs3NScnUp89ZNu0eJIfq07aQi9WLKwDmPF69VSNDEw7D397A5mEJAUHyQbZd/lwz7hNfFVPWV8IPMDvNFaVO06TMpPbmB3Oti5+wvzElOWitKmeMmNIxlbbgywlciEKXJfiLFYbtzw5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lnAplNiSITt1rgBc0oYQsJdQ4nhP41ANlzdLbd4kY8E=;
 b=JblVcWGcnhffK9eyWELkfv2ReFv4YLaahJvLW1aMBitlj/yH8ToOlZ8PgxGvz3t/UyU+HnO/UGKS5cfW4JADccHwFDAGIbt7I5hOTP/Ewf+Zgulgrq65faPqFT5t7NhZu55R6gELXsmhmYGfP3BmyqPzY1xMr/jq/mjIK+DaXNcQ01nWio+iqi4BveP+sVc3LJNDyOKlXrTLYPOFx4et5QvK2DIMTfOCeoLoS3K4mSGLTiKhjpC5i4M3B7mXk1a/uv8YB/K+J7xXumkmYg8eNX4Q+4X3uAhYZn5rA/gPM4AjtWmxFMs+zLokNyddixhOG0uS4EmMkE9ylbkmNJHw4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lnAplNiSITt1rgBc0oYQsJdQ4nhP41ANlzdLbd4kY8E=;
 b=aMIXhPjudiu9RJCZzhDKB/sePbvXBMR9J7E2vIdACb5r2TLuyEzQRw7GA7bUrvpeZD+VKqBsJTgXVGGXO8iSqVAKrPW5dyLq4dxtYqXdc4S83vfoiMrJRPw4oXpg2LHiRQ5fCcqp7o68+L2ojjIqZZvsmnwBaYRsd1TCPLd5ZMI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:27c::13)
 by LO8P265MB7913.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:3a8::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 00:46:45 +0000
Received: from CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995]) by CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 ([fe80::6c9e:93c8:10db:e995%3]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 00:46:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 01:46:44 +0100
Message-Id: <DK6DXU51V88J.23CVF9ARSSGT2@garyguo.net>
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
Cc: <git@younes.io>, "Danilo Krummrich" <dakr@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Timur Tabi"
 <ttabi@nvidia.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: dma: return zero for Coherent reads past EOF
X-Mailer: aerc 0.21.0
References: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
 <DK6CCQDJHK8E.1DZHVZJDLS97P@garyguo.net>
 <DK6DC28Y2CZY.2IOLKS3T81VG8@nvidia.com>
In-Reply-To: <DK6DC28Y2CZY.2IOLKS3T81VG8@nvidia.com>
X-ClientProxiedBy: LO2P123CA0100.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:139::15) To CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:27c::13)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CW1P265MB8877:EE_|LO8P265MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 81ce9c12-7771-48d1-334b-08dee91d0941
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|376014|7416014|10070799003|366016|6133799003|10067099003|4143699003|5023799004|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	Pr9RlUfKn6WBSbO3lPCyBi5fWq9tXyoE2TTWTmF2H00swYpTHWvOVfMiQqIEnJIn32UPCVaH4pSnYhc4tkUi8VjFY2Qq4OO1xAg5bCyT99MI9tA6jkX/k6UaMLZOxAMtyFEwlR1cgQEHoNN+PUHI1Jxcl+nxSe0ICWEl2nWlBI0H4RYMrVBBpGbOSar/v4aDEqLOmXS6vO4ND4+58C0q5ttXv6VsZApaDcK7QYUuUeLI12MMTSLJgMKz6c9RJW6ZtZ5z52NFBNsEV356szG7W0I0peF2efXYS679VhuXmkvidsizagiENq46pgtAf6ocLyYo/DzCET+rWDVNlS5+tklJ8xKeuYeU3lm3NKJTUNbdjcnYKSaP+FwN1Aui0LVnYOPfy0EI5R2d9NsuOcwAD/gvrhTTSRGfH8H/YPTAvhXejQXe0KAcq1kvu8I1+8drfsIO1xzQrGpaqUJQCOsfW32COwTLj7WMoiaLuYujSUnZEbF9MqNJ9NINi4lJwQjZAPIy+SDzFYWMVUFcpCl4J/B+DT0kDz1Tc7pj/1Rb6qJc6Otnk69XqKEvLL0pOMoHYZuapFglrqcbpqJTfn7lRn0bOBIDEeq5Ki3t2IQ9wX4J8L9lYzk5Guva/QlY19X2dBMfrJkVwa2XX1iAji66pBMlAhrdG6c1GWJMX94KR7A=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(376014)(7416014)(10070799003)(366016)(6133799003)(10067099003)(4143699003)(5023799004)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aENBUmFGWGtia2VPQ1dWc3d4aXJISytLdUFTV3RUNWgrcnF0d2RQNHU2bnov?=
 =?utf-8?B?TUpFZ1dPTFRrNmRSamN2dDJ0UHhNWEY5dXgxNkcwZEkwRUVqOTNuTi9SblNi?=
 =?utf-8?B?NkZmd0VTR2YrSUhXcDdZemdvWjRLN056S1JYZWkwMGFKMEREcFFaNG1tR29l?=
 =?utf-8?B?WFdKNHcwYUlmbTY3TEZNY2pDRUd6VTE4Yy9CdDR2SzdLRVpGSVJOZlJaREls?=
 =?utf-8?B?S2QrRVhoZnBJQ3krZitxM1dQT0JVZ1RHeWlHQTB2WVYyZVdqRUVBZTdsdlVE?=
 =?utf-8?B?SW5Dd05jNDN4MWNLZ2JPZnNrSTVFLzdrRHBzN0M2b3pKcksrZ2F0NGxwSXVp?=
 =?utf-8?B?SkVXUkc4OHJ6Z1NvREV2QUZrS2c3b0o0U21jZnQ1NWtDbkhtaHRJN1RoN1Fo?=
 =?utf-8?B?d0xWbUtXTTJvUEhYcDI1R3U4V0I2T1VjcGRoOERZZk9nS3hPMGdhdUwzSkk3?=
 =?utf-8?B?ZlIxSWc5QjZOSUZ0ZURVenBhK3JlNVptMG12R09NNWdWZzQwVkFWQTArUmdO?=
 =?utf-8?B?RnUxbFpIVXlnOTBUaUtmVjc1dTJSb2t1M0YyZWUwNjUxaWVyaUg1cS9ra1dU?=
 =?utf-8?B?K2dDRFVWOCsweXdMV2FOaFU1R2NUVlpYYzJJYmQ5MHpLTWNlK0orZ0dzQUtD?=
 =?utf-8?B?UlZDMFpZVllUdlhiUmd1cmhObmdBZnVQYmJaZFdzYXVUemp4TDJ1d1VXaHp2?=
 =?utf-8?B?NVhkcjJjWEJDcC82MDluQ1JOeFNtcU50YTYveGFtK3dnbkhrRCsyd3VLNGlK?=
 =?utf-8?B?LzFvVHZpNHJncXNYa2lqYUMrS3AzWDE2QkJFTVNqM0NobHdHS1V0eXg0V2JK?=
 =?utf-8?B?NHcrbFp1SFNZRGIzS3hyOWlpekxPVy92VEJMN3d1NGhyRWRoZmF6dGFRaG92?=
 =?utf-8?B?TjlPS09UZW85Rit3YVpJSFhkdXR5TXZ4cElMZU9NbnJ1c3dzUWhyQWNCZUtn?=
 =?utf-8?B?WFo0SG1HWVdpY2puemlUbE5kdGVCUUhiZzVUZlRzNXd4UXViZG9MZ1FMV3l1?=
 =?utf-8?B?S1dRRGxidEZTM2xiekUwYldxNzY5RGxKdUlsclN2MEF1bWtwL2d1RGVEQ1VS?=
 =?utf-8?B?ZjZXeW5XZlFjR0JpTkU4Q2xycytOdEFkTUt4RWdQUG45RFBUTTJ6RjlJeTZH?=
 =?utf-8?B?cUZJL1pDeDEwYUMyRnJoY2VlVHlBTWZRNGJDZFZqYjRhZm1VUzM5UWZlaHd4?=
 =?utf-8?B?b0lYT0tJUjJZQjVQL2s0VUNUM2dLR01mMWU5YnMxc1pQMnVWajZQNUtpaC9K?=
 =?utf-8?B?MFF1OFdaWitpQk5WTkhEN29CclI1a3F0MitrYU92T2NweFg0SzJRWlREMXQ4?=
 =?utf-8?B?WlgvdWtGYy9xNTIrSDcwbEQ0eUlYaTFGZVFYaUVPV1hvL3VybXpYRnE3ZXJZ?=
 =?utf-8?B?b0VwT25xdElaMkZrMGVDRlBkTFFZejBSSExheE1OUlNBUHU2VXFCYVVuSDdM?=
 =?utf-8?B?WGpLYy82TGREbTVzV28raFl6Q2hzcnV5NXpTZndHVUdCcVk5Z2JPRnV6WWgv?=
 =?utf-8?B?SXhEdy81aGppd1RMcEV1THovb0kwc0ZGb2VGMGtHamdzNXVCM2ZnMHR6clVi?=
 =?utf-8?B?R0Y5UkRoS0swWnpXb29MMExIc0VQV3ZOL2xIb2VtYVNBL2xZK1ZBUGUwMnVG?=
 =?utf-8?B?R204N055bXdTU20zc1Zpd3RMdzNQcnQ1VEx1eFllWEE0SnpzRlp5bTZhMytj?=
 =?utf-8?B?azhTOE14d1BmWVF1TnFib2RXWmZLbCs2NHJYd25ubFNPTGFCQWxCc0c4YUx2?=
 =?utf-8?B?MlR5amgyTHVTVTRBcEQ3TEN0SThOcUtIUlVZNloyWktkckRzM3FrK2s4am5m?=
 =?utf-8?B?QXNRWk1DL0JuTEhWQnZtenBwMmwvYVFmeVpCdVBlc3pVSkRwdlNUUXp6eWQv?=
 =?utf-8?B?YjdGTHIrSDRhYzJoM1RQM29VSXZLVXRWTHcvRk16T2Z5ZEdvL3ovNUt3VXJm?=
 =?utf-8?B?ZXZCZHUwTzJOR2NzS3Y1b3Q2dzc2TmNZR1FZNFJXMDdLSnlFcVBTSlNCYXoy?=
 =?utf-8?B?anFOaFVpQjhkcmVUUUJ3RGNMQ3RKcC9rTm5wUHFQWkF0YnRheERlYjl6VVFa?=
 =?utf-8?B?MkE5TTQzWmZlTGlWOGhFT21IYUF5Snl2UytlbW5xdHFZbUl2WjZ1SktwWE42?=
 =?utf-8?B?MUVzUlExK2hyRHFhU2ZrSW5OY0FmNDAwb21wekZUUlFqc2ZWUUZYd1JXak8w?=
 =?utf-8?B?TmdCYWxvZTVTTTVGMmwzVUJQSmlDcGN3ZU5xRUZZV2xUSkZpd0JLc1R6N2hY?=
 =?utf-8?B?MzFTQ085ekZlVXZ6SHRsMTkzTHYrdnl6S01sNHpFQWdZZjR0ZEtKazlidHlI?=
 =?utf-8?B?VzhhaTNGTHpuaUwvcjI5OG0xcjU0VFlUdlZMbThUa2k0UEh2OXduUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 81ce9c12-7771-48d1-334b-08dee91d0941
X-MS-Exchange-CrossTenant-AuthSource: CW1P265MB8877.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 00:46:45.2791
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qr1v0URUfAtBCwfzdEjlvLpnf6YuTYVZ06eFf31044HaJfVtV4dITY1de26xqygUqLySJyK/9Ik9lJft4sT8Ow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO8P265MB7913

On Fri Jul 24, 2026 at 1:18 AM BST, Alexandre Courbot wrote:
> On Fri Jul 24, 2026 at 8:32 AM JST, Gary Guo wrote:
>> On Mon Jul 20, 2026 at 8:21 PM BST, Younes Akhouayri via B4 Relay wrote:
>>> From: Younes Akhouayri <git@younes.io>
>>>
>>> Coherent<T>::write_to_slice() calculates a zero-byte copy when the file
>>> offset is beyond the allocation, but still calls
>>> UserSliceWriter::write_dma(). The latter rejects offsets beyond the
>>> allocation even when the copy length is zero, so a debugfs read past EO=
F
>>> returns -ERANGE.
>>>
>>> Return before calling write_dma() when the offset is at or beyond the
>>> allocation, matching simple_read_from_buffer() EOF semantics.
>>>
>>> Fixes: 016818513936 ("rust: dma: implement BinaryWriter for Coherent<[u=
8]>")
>>> Signed-off-by: Younes Akhouayri <git@younes.io>
>>> ---
>>>  rust/kernel/dma.rs | 4 ++++
>>>  1 file changed, 4 insertions(+)
>>>
>>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>>> index 200def84fb69..36b72fb9ab46 100644
>>> --- a/rust/kernel/dma.rs
>>> +++ b/rust/kernel/dma.rs
>>> @@ -1005,6 +1005,10 @@ fn write_to_slice(
>>>              return Ok(0);
>>>          };
>>> =20
>>> +        if offset_val >=3D self.size() {
>>> +            return Ok(0);
>>> +        }
>>> +
>>>          let count =3D self.size().saturating_sub(offset_val).min(write=
r.len());
>>
>> This saturating_sub is redundant now and should just use -.
>
> Or even better, you could use `checked_sub` to perform the test and the
> subtraction in one go, while avoiding potentially panicking operands.

I think the code is clearer with separate EOF check length calc. This also =
needs
to return `Ok` so it's not like that you can use `?`.

Best,
Gary

