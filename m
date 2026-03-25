Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022140.outbound.protection.outlook.com [52.101.96.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6B6838AC7D
	for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 13:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774444200; cv=fail; b=MeNmUyxAqthQYEfOaxiA3igWezeX65GXloTPH2406ML+Bcz0aNAlwuyXflwER2n/VuDwg0yEg0DL6g6RedPxSLd+ROySjAxiew2Nc9/oevFDXhxZP3qyUMeZTinfxesqYl6wpY2VycJuygzB5nWPMPyEajTCmumYfpbI0dFfEB8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774444200; c=relaxed/simple;
	bh=t2nRKO9imPyF76jSUKrZR5uQiATTmB/iVVCEDDzZ7jA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=IKoiIX7KGaGM6iYYU3iCxEy2s0kpqxQWwueyXxcdCNa1NtaCw3Kc28/ohqcfDa+bpVbxBvvGChvjXG+mLLwWS0gW3w5v1gzuvXBikSLOSnTMJR013IUXQbFdv9e043x9iTAha2tp0CoEodRBTDIUmzRbqEzLzVvu1l2kvb4MmqY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=DaEsBkXi; arc=fail smtp.client-ip=52.101.96.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="DaEsBkXi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iTOmn+qvcRr28yFt0Zcue+Z8XnsurNbsuNE9v/yfKjlMMVbF8DQ794lOOC0RbPI6d6nWOxT7NtumL9q9+ju8aV6ZFYEHnt+cA0kH2pEbgcm5wLfxB8W34YEjEsfHb/0HGYnBxjQZ8ohSrvKZkQSotFFVB4x5I1nQpzQ7lCQL9hH3ewvqss3+QMTBiHGR9juF8isWLp+b70YWYThzRnxbAxmaBLF5zm2K1Gml5YFZ+1vcX61GZJY3VfuULApbDkicQK/qzP8oGRG3gghvepTgNvhGm0cOmz1g0a5CxlMPmmh/b/0YdWvW6xA2yzYLQyeomxFO1hdpNoX9RiK58KFHiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qpwEhKW5AJ5AAS6UdAIlO/QMvE7Sb2fIukQOETOiQsQ=;
 b=wYKCVlKNOhhQezX5onEtlObUFMDp/Q4nzGHP91FaYQpncH+Eq7fNjqQsXvTMQfisl6OsgLWOpeo7JIFzdu1KcyWjouh9U/wzWi6kc5/7P/1KrFJrbF8rvoFmkIT1NjDTB/iA0+mD4ChZvPAkhP3O1i3/4tdTE9Aczq8PTr8NLYPCX/L92C6K8B9jROdmiXjisFgGOKbeAh+F1CFmdY+5OZinxam4ot4G+ZzIIyMzCyi7VIKFpqPNIJzC6TGzIQrLLpzpi3o++dAnpuL5xE6S28uGgp25zsvpSfbokS3pl+/svA4D2K1EzyrDd3EQyg2XoueAMyz2qh0ybYQYEjfteA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qpwEhKW5AJ5AAS6UdAIlO/QMvE7Sb2fIukQOETOiQsQ=;
 b=DaEsBkXi6mUeRczAv0g/IgNF4yk+hfssgrKImd9dY8Iv9o+kTq6OFeKTQljtlPiETyLz7bIZ+cTLsijJDh01LCfegSgpKBlm7CnE0lokVi2RLtjzw+bHPqOK/jFrudDoqFcSrWVN2tjYnTggPyrx8a2RLmK+y2EWZAMUUAN+NNc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO6P265MB6125.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2b9::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Wed, 25 Mar
 2026 13:09:51 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.019; Wed, 25 Mar 2026
 13:09:51 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 13:09:51 +0000
Message-Id: <DHBVYVW7ZTDA.23N0Z3YOC5735@garyguo.net>
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/2] rust: dma: add CoherentHandle for DMA allocations
 without kernel mapping
From: "Gary Guo" <gary@garyguo.net>
To: "Danilo Krummrich" <dakr@kernel.org>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260321172749.592387-1-dakr@kernel.org>
 <20260321172749.592387-2-dakr@kernel.org>
 <DHBAADML4BXP.131CD8C26BELH@garyguo.net>
 <DHBD2BO4R5BM.3OS7AHYN9A7DZ@kernel.org>
In-Reply-To: <DHBD2BO4R5BM.3OS7AHYN9A7DZ@kernel.org>
X-ClientProxiedBy: LO4P123CA0218.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1a6::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO6P265MB6125:EE_
X-MS-Office365-Filtering-Correlation-Id: ec3a5536-78aa-4410-8312-08de8a6fccea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|366016|376014|10070799003|7416014|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	+51rdAY/iCM8iPEOwUx7kY4p294xBI6gK3fDmBgB1wq34yV/ruKAh6s3BLMX4Anqk/lPskOjFWgv6U6m5OlaLqQEzCstcc6EY0O1V/SP5oFULnMcqZ79p0EsuDtOO4p/YBK+Fufjqg/NUp1FzmIkTlszedo6ke02rhuXYn0obDut31Zp5gXOXVnfbI+mRwExfuGPROG41N1oVrdD3Z8Bx/Q/c/9c5wz9qVPH899KM8f6yQOj0skD4y+WNOIkUAtR4oUQFLA/nvVIK3QXi23Kt3znsJ3z5K0vji25/vSx+37GHKta5v2KlW5TAcdOwIn7Qtww5QE7EgUAPwp64roZaAZWtqqQ0hGXDHksUXuYcD841w8784PzItk3OCvBSle3dtmc+JH9cEhF6742fC9xjUP5wef1hbF5zH4NFdjAyiUqN0BGTXqINhfB3wqcypRxT3fX+Rosv9nzxbU0YYaAi7Zbk+2c6PgsNc422XZqLGVDEjOUfyl+U6vRfcz8nKPm0/MNpDGf3Ts5qLRZGEq91zo9ZurdzubsWmlNyfyRIbO97adZBReybuSUWdYunDX1UynaL9tgKI3uow/Cz4OiYIdHB1K/8Yowgp5xZYJigviWHfYKnoor/myce4n4I4v5DgWluY3T/2MpsnheZoOlj95bOFtBhDCLpQR2c/gNLIIjz9XooqymveJxTS6fMtt24OSAWLHrvlu3s8elmCi4uJYUtxg3E4+PzjBV7ZQ/wwM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003)(7416014)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZlNjS3hMalV1WGRLNlBnWW1oTFFOYXE5RzlwUEFvVzNpTlM2VG9PazNxNmtr?=
 =?utf-8?B?VVFCeHZsU1VrekxNMWgzUHMwQUxGYTJKUFgxT2MyY3ArbkVFNWZIN2Q3emVu?=
 =?utf-8?B?czJqS3ZFcUlOZGNKVTZHSGxLWUQ1eXNOb3FMRk1PaEM0RmM0blduVG1lckRx?=
 =?utf-8?B?L2JIL3ZVMjhGdGxLODhqOUVaNzczNHQrN1NZQTlCS1VWc0kvYjZQK2JocTMz?=
 =?utf-8?B?OTJoVW5mbnQzeFVhR1R6dFdoaFVCb0h3cG1QOFRzeXhoQ0c0OG9CU0ZIbnV3?=
 =?utf-8?B?a3VPNEJlaDRYY2ozQUtDZmx3Qmgzb2gwK25vVWFoYUxISVpESDBtaWd5S1hT?=
 =?utf-8?B?ZTdNODFYNVBsbDhjQ3ZiOElJblVSYnpWNnFmVDBDeFlBeldiR1JWakhNejBj?=
 =?utf-8?B?dVNySlpPNm1zWmdseHZjNkhrSDRIdTNjbHh2MFZEc0JhUC84b2ZLTFI0b0pT?=
 =?utf-8?B?NUVpM2VIVG9RMitQakJuUzJRUHNUbm9aS3J1dWptWmJGaGY0Zlp3aEFUbHp2?=
 =?utf-8?B?K21tRXpwRWV5cUM0OWY4Vk9VTkcxODhLbjZMYVBKZEdGVHZQaEZFZVYyeUhi?=
 =?utf-8?B?UVhWaTIyV2ZNTENzSEt5cy82VlNjVkRQVWVVZlFmN1N3Rm5wcGZlMlJBSm9m?=
 =?utf-8?B?WnhlSjVoU1JqVTgrcm5JOUYyNThuOFVUS0xObmdjMWFTSUtVYzlMYm1YMlcv?=
 =?utf-8?B?Skc5cEtEdFRJbjFLRitzVVBHVG1ZTUhQMXR4bmJDcDJFeHp0eWhyTGdwNFB4?=
 =?utf-8?B?bnhrdXV3UXlEUUtzODJnbThJZlo4Y1kxWng4VG9xbnJwZ0JudkViRFZnK25H?=
 =?utf-8?B?SWsraytwdGNhY0FkVTNOSS96QW9CbWxVeHhGTVY1Wk8vdllUeDcybk5tSWNX?=
 =?utf-8?B?ODRrVkdhZmVIbEdjYnFPbC9zSzIzYko2ZEJyR3RXYUtLUXZ4ODhUN1FXT0tJ?=
 =?utf-8?B?Vnd4YlArNFg4NFlDWERockFQclJlR0tDWkFVWDdVT2pXcC9hYjVabkIxOFhM?=
 =?utf-8?B?SlE0QTd2emtMd3huU1E1RFZBL0N1TGVyVzlnRXR3M0pnWGVhSW5FNHlhcG01?=
 =?utf-8?B?MmdtdGIyUFU4dFYyYUVJaTJFUi83VmxQdGd3MFFqTkpxT2FrL3BKWWpXZEZH?=
 =?utf-8?B?dlFIS0c1dFArVXBpK2NZeGZCc1p4cFVybSs1VitTQW1rSUJpTlBQekV1Skxv?=
 =?utf-8?B?OW1GQU9DQmVXckMyMzNHRjdoa3lLOHlESGRkakViYkJJNGFrR1RmQk4relB6?=
 =?utf-8?B?eXBJUWl5UEJJajQ4ZnROS3BrYWpNb2NReVd3cWY1ZTl2Vk9JMnNlUVZKakFs?=
 =?utf-8?B?dEtlNGZHRGJVWlowakdjUEVRTkRtRHFXZVlRYjRvY1kzcmN1OXY1bWQybW1k?=
 =?utf-8?B?Q29Ma2FiL0tlVjBaK1hjeUJsMi83YmV6UWRjRDJ4Z1FycWJnTy93UTNuTUFz?=
 =?utf-8?B?MGVuNmdORGlyQkR6dlJCYnJ1NDZDak5VKzBId1JyRHRhQlRBSm4rV05PMWNV?=
 =?utf-8?B?b3JzRHM4NytFMGV4ZjlPYXBQVG83czdXVE14OUViTCtzeGN3azM2c1YyYnJ0?=
 =?utf-8?B?YUpwRzR5b29ZRVhpeGpXYXNkcklsVDhBb0JCM0NzTms5ZmxhNjc5Z0pHV1d0?=
 =?utf-8?B?TERWNnlITncvM2xlMEU1S1l1Q3EzVUVtMmRjdGMxc2xaOURQWGFORlZiUVNj?=
 =?utf-8?B?UkMrZVRJTjV6aEpLL1RCdHFTUXA4NGw2R29aR25iRHFhR25TaHZPMFVYczE1?=
 =?utf-8?B?UDh3b0FQQ21jd3A4REtzdDA5K2RYR3lmT2pnSmxscTBBbSszYVNKdjR1Z3ht?=
 =?utf-8?B?ZnNNSHZDUjhaTy81QWk4SXZ3SzVXKzhieXI2YTl5OVF5VE1XL0ZxU29WMlZN?=
 =?utf-8?B?UTVVbm94Z3piVWVZRnEwN2Z3THVOOHRqZnFJdVpWaVpqVFMrM1NIOFlwZ0xx?=
 =?utf-8?B?dFU1S1g4VTVZS3JPWHQvclVjSm9kdEw3NStDaysvOHh0NTd2VVBPaXlyTkk4?=
 =?utf-8?B?Q2kxeXhBdkhnYmJ1NjQ0TUpYUjRCTWdiTk9kYzNnamFMSXpqejdTTDNDbXZs?=
 =?utf-8?B?LzhLbmYweW5pSEZEMkR3RHBEYys4d2JmeWhuQ3RmTnA0QmtNNkE0UW8vTUla?=
 =?utf-8?B?a3czTk9lSEc2QnUwYkNtK05BbnBPejNxUUlEekZwcVJpWDY0aWd0QTU0dVUw?=
 =?utf-8?B?UkFNay9SYjRXQ0xodEVGZ0o3djB2MnI0dWh4UXN5L0tkUDRhbVJST2FJTzF2?=
 =?utf-8?B?ZlFIMDh1Vm4xR0tOWHhnSk1aeStyczBXOXZIUWxsa1ZjbENiSXFLQTU0djRB?=
 =?utf-8?B?RWVIcGMxMmVKVkhOc0F4VmducDJXK3NZSm5UNGt1SEVZc3hzVXB6Zz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: ec3a5536-78aa-4410-8312-08de8a6fccea
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 13:09:51.8065
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GwutlwkuY2lpeUMMCx3FPI4x5BxbfhZTYvogKHzhpMie1v6PLr7bRpE3VO21OLSLovgrwS31zjVL8o+Uz/XilA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO6P265MB6125

On Tue Mar 24, 2026 at 10:20 PM GMT, Danilo Krummrich wrote:
> On Tue Mar 24, 2026 at 9:10 PM CET, Gary Guo wrote:
>> On Sat Mar 21, 2026 at 5:27 PM GMT, Danilo Krummrich wrote:
>>> Add CoherentHandle, an opaque DMA allocation type for buffers that are
>>> only ever accessed by hardware. Unlike Coherent<T>, it does not provide
>>> CPU access to the allocated memory.
>>>
>>> CoherentHandle implicitly sets DMA_ATTR_NO_KERNEL_MAPPING and stores th=
e
>>> value returned by dma_alloc_attrs() as an opaque handle
>>> (NonNull<c_void>) rather than a typed pointer, since with this flag the
>>> C API returns an opaque cookie (e.g. struct page *), not a CPU pointer
>>> to the allocated memory.
>>>
>>> Only the DMA bus address is exposed to drivers; the opaque handle is
>>> used solely to free the allocation on drop.
>>>
>>> This commit is for reference only; there is currently no in-tree user.
>>
>> Thinking about this a bit more, instead of creating new separate types, =
we can
>> probably just have multiple flavour/kind of `Coherent`, and we default t=
o the
>> most common one.
>>
>> Something like
>>
>> pub struct Normal;
>> pub struct NoMapping;
>>
>> struct Coherent<T: KnonwSize + ?Sized, Kind =3D Normal> {
>>     ...
>> }
>>
>> Where for the common functions, they're implemented on `Coherent<T, Kind=
>` while
>> the ones that require CPU mapping have `impl Coherent<T>`.
>>
>> The benefit is that there's no code duplication.
>
> This was my first thought as well.
>
> But I found it a bit odd that users would still have to define T, then I =
thought
> we could have a type alias, e.g.
>
> 	type CoherentHandle =3D Coherent<[u8], NoMapping>;
>
> In this case the constructor would be CoherentHandle::zeroed_slice(), whi=
ch I
> find a bit odd as well.
>
> Alternatively, we could have a const SIZE generic on CoherentHandle wrapp=
ing
> Coherent<[u8; SIZE], NoMapping>.
>
> Then we'd get CoherentHandle::<SIZE>::zeroed() (which I find much better)=
, but
> we would still have Coherent<T, NoMapping> publically available, which I =
still
> find a bit odd.

This only gives you fixed size, though. If you want the same type that supp=
orts
both a fixed size and dynamic size, then a generic that is either array/sli=
ce is
the way to go.

>
> And then I thought, it's probably not worth the additional complexity and=
 a
> separate CoherentHandle type is probably good enough.
>
>> Also, you could also implement `Io` but leave out all `IoCapable` impls,=
 so
>> you may do I/O projections on these and be able to get offseted DMA addr=
esses
>> without having to do manual computation.
>
> This is a reason for having Coherent<T, NoMapping>, but I'm not sure it i=
s an
> improvement in the first place.
>
> If the memory is not mapped on the CPU side it is probably just an opaque
> buffer. And I'm not sure there is a huge advantage in defining a structur=
e
> representing any relevant offsets and then do an I/O projection compared =
to just
> having constants or an enum defining those offsets.
>
> I also think there's not a huge difference in terms of robustness. In the=
 former
> case, if you mess up the offsets, the buffer size will be wrong (unless m=
ultiple
> offsets are wrong and compensate each other) and the device will not prop=
erly
> work on runtime.
>
> In the latter case, you either also pass a wrong offset to the device, or=
 you
> get a compile-time error if the offset is out of bounds (which is probabl=
y even
> better).
>
> Also, consider the case where the offset into the opaque buffer is dynami=
c, then
> a type and I/O projections won't help either.

You still can use `io_project!(handle, [start..end]?)` to do the bounds
checking. But as you said, the benefit might be minimal.

Best,
Gary
