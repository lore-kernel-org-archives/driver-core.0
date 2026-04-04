Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022073.outbound.protection.outlook.com [52.101.96.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B45833D6C7
	for <driver-core@lists.linux.dev>; Sat,  4 Apr 2026 20:13:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.73
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775333627; cv=fail; b=Qat9V79dMshsyUzWvD5S0VmQF/AyW2DZbzc7eYhjAEDYaejfV17Ao1qUfzJCSywSNVZk4E96t20fSBQQTCxhoVUytEV1r8EkvuogCdEvhAhbGtoUQvuAMbJa2lcqlK+F2BtqN221oTYtAexh6QftNvyCSK+Wt7zu/UYp5TwJqdY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775333627; c=relaxed/simple;
	bh=zwcja5fRde2A5uyOXkzX97IT3MNQYBffywOAnfgq7ZA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=ELJ5G2vFWCrmdKWRUkrhCYhJUHtH5TXaFoXNrLJyPC4NjObtFW/OlvX4s48bf98DUiMLzbzq3XRiIG/4YIMzXNGmiRKEDVNejLJYjkXdljLzuVhT/wyPWx8ZapPUiU5HZrHo2VEwT0kNGk31rsPYEYZPbs8vtoF5+yqQnaYITqk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=ws/+GpvP; arc=fail smtp.client-ip=52.101.96.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="ws/+GpvP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n52s0Ucj6ZIOGHzdBBTtQEdiz7wEcDne2W6ziWhbR8XeyhwSYcoYaKnBvKFVrGDdmkxcyeb8fnIIyDoGuQJ9fVmWxryPi47E4gyj6v5/hC3tP7Sy9OnTzL6jU7aJYF1lrb4d8uSbfDLkn6bWOaZbEfgMPe70GeimzR51ux7H9twZY4qsQMQs3344o2Q5GlZ2Kr9Rf9RyauRkN2RIZURvoXTWVKRBren22A77HQO2BpApyNllHt6Qhz5fs+gRDW376ZbNVdamRPj9Vm/EJEcJOQ//JG6Q3dEi+2ql0acfH9kpn0huKYPg/lF2fQMMI+zfCDHyK1Als5hRb9p1zaQfKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zwcja5fRde2A5uyOXkzX97IT3MNQYBffywOAnfgq7ZA=;
 b=LH0T1mjORBIByieUiWscsVyr2Xx6mGX149SQG9MlYihR7oQuTOnGmCASjzrB6eGRkENjFsuS2N31qCPVnsRN/t/kGQN6SIFEiL4Qw7rVoSiArsDF9C9FFMwaLnkdEU6cza3kl8VPX1ciTDcjNp/FnYnckw2tM3rnWVTOxwygWbfvZhSbWby5I5ky3LFORpS9wk1NqCGRLaoP/M0vB/WmCMwYGiS6DIq1XbTyu7ET5TKxys8KDoqYAq93rMDXWQhCKFk42q1A10a9X7DQSnrQh0rkSt5zaDDWtTe+PJYCeYd9BzOh+VhlPkCaoqJuNpcsxOlJ9QmucZ+t0NcFIL30bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zwcja5fRde2A5uyOXkzX97IT3MNQYBffywOAnfgq7ZA=;
 b=ws/+GpvPGR6Pxq9q+YJnzeltyc90THALSw4tqbvgeUmk+g2wsHOu244RxDEI29ooc0QlsmjlxehWInYpL2Yw/xUaY6QLUkvZBl1Tp78yNkwHI5ZS99mCG41CzLPCkJY5HI63dRN5Fb9maPjl+Y0YFENXkXYm6h9ciu3mNppCdIM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWLP265MB5140.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:1c8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.18; Sat, 4 Apr
 2026 20:13:42 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.016; Sat, 4 Apr 2026
 20:13:41 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 21:13:41 +0100
Message-Id: <DHKN8U9VHH45.1ONRTFLAVID9D@garyguo.net>
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <boqun@kernel.org>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: dma: return EOVERFLOW instead of ENOMEM on size
 overflow
From: "Gary Guo" <gary@garyguo.net>
To: "Aditya Rajan" <adi.dev.github@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, <dakr@kernel.org>, <ojeda@kernel.org>
X-Mailer: aerc 0.21.0
References: <20260403212822.294288-1-adi.dev.github@gmail.com>
 <DHKECN57N95Q.2DN7NG4GUA24F@garyguo.net>
 <DHKJNOFD1P03.15QMM3BFH0KLB@gmail.com>
In-Reply-To: <DHKJNOFD1P03.15QMM3BFH0KLB@gmail.com>
X-ClientProxiedBy: LO4P123CA0495.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:1ab::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWLP265MB5140:EE_
X-MS-Office365-Filtering-Correlation-Id: 44dbe95e-8358-4706-0f5d-08de9286aa84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|7416014|366016|376014|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	zaeAR8XFNkH6cCcOMJjj8b5dhBVsB0VjMAOTBca8fnAueOtoNRtTPcoYeKNj2hGMfuWFJ+jhizNb9Z3QmKN5fWDB6OFWfCwT8p3xl6Ck+vF8WUSz6Q2DQuaTFEfKuH08fzgO+O3x7kPE9xI6FgDY89BlQtvFHsQ3Wnkx5agYMcWCmF2TVqTtj3ZrowfZ+vgDB2YlW9IkRSWFnLzqEnFvxUihiOBezu8IZ/N74rrBq1eXJ43NaEwedSNpbfNtaVhZ2shWAcvknhFHxVh8jbShycBZGpID4GZWKtfEl6U0TROWmrIz8wUdnfOBqVGCe8esNakrwwAHhPlJIqExICvl5AndvJZ3KGWMzDwxXNA2aKPz7tQS6MR2y0/n7LlI6XVA2I3UQ3a8/nu/tGAfIQVvzLWFktbJRmkY3oSQ3oPc9QMLAn6pf7+bJ7BCPQBCHh3vUDPgyQi0HNWN7iZT+wwNgsKnya/SdMyOXraddZHL0J+Pqtxk/Xi5KR/Cd0kAWJxoz0xXudoK35CqyzqgaQEyEbi1iBBQPt0svvbtSqLMLKPtHZ9dan7Mpj4Q75FAZPbRIZ2HQ/RV+bJ0T1Oy1zaDBZhFT0/RC2BgxQBhHfT4eG0HEnzMh72r7NE3/vPdbvv4ypUcLNMNnMxAEwGCNZ+7mFlqVNKSlLeJIoctWL0vTCtPJPir3CZXE0MbxuVjyMKx+DuEOO3QBcYISxugrNuj2fQulNvxsxbYQBkDj2PMjRo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(7416014)(366016)(376014)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3lkRzdBUlZnUWZrUDJsYmVTaDRSaFlNMUlmVDRWMnF6d2RIYUZUWkF5elRQ?=
 =?utf-8?B?REMxVjBhcnpIdzIwM3paa01zUTlkenFUNk9CZEE4UzB6MWN2Q1hNNVRmcXN3?=
 =?utf-8?B?VW9zWUpLY2pqL3djUTU4NVNFVDQyUXVxL3V0M2cvazFQRk4xaVhVTHBRN3A5?=
 =?utf-8?B?ZE9UdlVVNWUyUGF0djZOZ0ZxMnV3SXVSSWFRZ053ZGdJbEY4UXN1Q2JrOFJB?=
 =?utf-8?B?c085Tjk5czRmMmQvMnBVbTBmeVlSN3VmQUdpR29ydGFVOGdvc0lyTEJyMk5v?=
 =?utf-8?B?dmtOWXQ0Q0RMR3hZdW84c1ZqbStIbGQ5ajFSZm1QMWpJdEN6eFdOdVB5cUp5?=
 =?utf-8?B?ZXQ3S25MRjY3M0RwVDNFYmtRdWwzRUFkSlM3eUNaRVBkaVR0NWdwdm8vWjB5?=
 =?utf-8?B?REZaZ1BpdjFjWERnRGZUaE1CWE1vUXJrMzFReDIzSlViU2RISVJXYUhkLzA4?=
 =?utf-8?B?aFluOHM1aXpKTCtZTzljRVBiUFRvd21XOVRSeWY2R2hQTWlEeldlKzA2empB?=
 =?utf-8?B?alhzTjFKZ0lERitlVmZYZG5FM1dWblI3dzlFU1l4T2J5QzVZTnNBSXRHQllO?=
 =?utf-8?B?OW5ZcnYxVTJPZkZiamhUNTROSUtLM3N5ZEJsOE1vZ0xjMjBTV2xYUUhyZUZk?=
 =?utf-8?B?ejc2Q2pjV0wyZTFyd2M1NC9XTFYybG5LcjZKTm5tQ3piVExkY0U2ODZOVW8y?=
 =?utf-8?B?WWxKMFZWQ2wybVVxeGp4bDJaQnE4RVZ4V01nUFhENUdSVVRCRW02TDhNbi80?=
 =?utf-8?B?TXoydEJEajlNcVhtVkh4elpGV3ZNb2xSL1FZbS8wRElKZ1d4Vk9FT3lacGpX?=
 =?utf-8?B?dGZZYjF4NEtaamhETUs4WmdHWjBPcERRVFVBcGpOV2xIcC9MeFpuYi9la1JY?=
 =?utf-8?B?dEc3WkhRNno5ZkY0ZngyeC8vb0J4elhleG9sTk1lNUEvUGx2MWNXb3QyVWgx?=
 =?utf-8?B?N28zTHpSYXNsWWkwNDFQcllWWndRbnBJMXZxeGtjZURMYnh0N1poSHEwUWll?=
 =?utf-8?B?NGRVUmczYmJhcDF1bmdSY0ZJZ0drV2IyakxaL2JkbkpDUHYrcXFseWRIV0VS?=
 =?utf-8?B?MkY1cGhOazFQY0NQRFlDZnJjL01wMU1kL2pWUmpvODZ2R1BaQTl2aXBkK05T?=
 =?utf-8?B?ZFFVWTVHYjhkajJGOUpxeEpoMkhSM0VRMjFxdm0vdGVwbkR3bytDUXoyZ1dF?=
 =?utf-8?B?bk9OVDdlMXpYcU0rTHF1Z3BEQ0ZsamxmcVJNcyt3cXJrcHhEa21SVnc0WkhQ?=
 =?utf-8?B?dDEzLzVXdEdsT1BLcE5Cdi9iMmkxMGsyK1FmVFFSNGFSRkJRcHVtTm1panpt?=
 =?utf-8?B?S0RYUVZRVjFMOExjbnhyM1ZucXZ1aHFKZVFEOEtmc0ZZZXkyNjFhTEUwYXJr?=
 =?utf-8?B?M1BSWmRrbm55QnZaTXREM0VyYTNwK0xtSEpYc1ZQeXVZcDRCMngvZ1F5RXhU?=
 =?utf-8?B?TXFOaGFwSzVKUkJwSEE1RGdXRXhFTEFKMG9pcURQaGQxQ2RKdTNaTDdQWWlI?=
 =?utf-8?B?dXE2SWQ4TFg4dkExYkZNdWdCUzJhN2RBeGkxWXRDYzNXaElmRHlDdjdES05J?=
 =?utf-8?B?bjZYeE9Od1I5UWJsQkk2am9OR081RDJvSVJNZll4czNIWjNjeExLc3FndUpB?=
 =?utf-8?B?Y0ZZTTk2RGZVdlQweE05SDViVkFFNDhRa2t6enZNMHJjY3ZuK2lRQVZRaHhi?=
 =?utf-8?B?VElybnlXVGFCejR0UWJIMDc2UU5wM1ZlUVEzQXpQeS9rREl1N0xDVjBIWU04?=
 =?utf-8?B?bFk3bmJEL0xuRjhwSEFXRHFmSjY5UWUxc2ZiUUpIVjNUdmlZcFBTeDMzR1U1?=
 =?utf-8?B?RzhiaXVxbTEybi9aeDlFcUtDMHd3c3ZPWXlia2tubGYvY2hESTU2Q0lMeDZ5?=
 =?utf-8?B?YWxwRkxCcndoalBLR0g1N2lCczBDVjFCNDhGcGZXN3lqQVNvbkdpT1pteVRX?=
 =?utf-8?B?aC9QTnd4bUdIQ1RGWDdsR3d1SDA1Y3lUVkM2Q0g1dmtLNS9ZRTBtYlA1MHRQ?=
 =?utf-8?B?QzVjZy8zdXVzQ2c1dXFxMlhYVWxUY25TYUZHNk43WWtJTkcyT2gxUUcxcVVu?=
 =?utf-8?B?Q2VHK0loR2IxMk1HVkt5ZERuNk10dUNsVnFSQXV1WlNpTkhRcFdXMEVsRFpq?=
 =?utf-8?B?ckl3UlhCcWUwN3h3YTBNU0NsOHlTYUVDeDdPQ0RPbFdmaXROc2R2bGtWblVQ?=
 =?utf-8?B?cXowNlBNUUhnYU5NVXBDMWdCVUFnWFl6Rkt3SEp4U0JVV1laNlRpM2RKajVp?=
 =?utf-8?B?Z2VyeUh1NStpeEFaQ1N4bXk4L3Q1RXVwVkpOV1ZtakpKbVhFdC9DaDFyV2Fx?=
 =?utf-8?B?MTdNK3A0a0lIU0xENGtBdU9BWUNsd1NhRmk5TndTNXVBWDRNcStKdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 44dbe95e-8358-4706-0f5d-08de9286aa84
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2026 20:13:41.8758
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A1mA40ZS4t7PmmujHOYiDnISaB5odKyElXCjhL3W0t7EAO5SRn2OnEsqR7XFm54aVUaLkpWL/Rzl2Q6i/HU1QQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWLP265MB5140

On Sat Apr 4, 2026 at 6:24 PM BST, Aditya Rajan wrote:
> On Sat Apr 4, 2026 at 6:15 AM PDT, Gary Guo wrote:
>
>> Thanks for the patch, but the behaviour here is intended.
>>
>> Neither our `KVec` implementation nor upstream Rust distinguishes betwee=
n
>> allocation error caused by array size exceeding address space or running=
 out of
>> memory to allocate (`AllocError` is returned and it converts to ENOMEM).
>>
>> `kmalloc_array` also just returns `NULL` when overflows, so arguably thi=
s
>> behaviour also aligns us with C side.
>>
>> Abstractly, the system is indeed running out memory because it cannot al=
locate
>> something larger than its address space.
>
> Hi Gary,
>
> Thanks for the reply, I saw at some similar places where EOVERFLOW is use=
d,
> that is why i thought we should change this error code:
>
> * In nouveau_drv.h, `u_memcpya()` does `check_mul_overflow(nmemb, size,
> &bytes)` and returns ERR_PTR(-EOVERFLOW), it is kind of same multiplicati=
on
> overflow on `nmemb*size` before an allocation. Similarly `mm/mmap.c` retu=
rns
> EOVERFLOW for arithmetic overflow in offset calculations, it also has a
> comment `/* offset overflow? */`.

I think these cases are all related to values ultimately controlled by
userspace, and the error conditions are propagated back to userspace, so it
makes more sense to distinguish errors.

On the other hand, for KVec/Coherent cases, it is less useful to distinguis=
h
between the cases. If we want to add EOVERFLOW, then we'd need to extend
AllocError to have two enums, which I wouldn't be against, but I think it's=
 not
worth having.

(I wanted Coherent to use AllocError as error too, but as it does not suppo=
rt
zero-size allocation, so I didn't change the error type. I guess one option=
 is
to handle zero-size case by using a dangling pointer similar to `KVec`.)

>
> * Also I saw existing Rust kernel code already follows similar convention=
, see
> `rust/kernel/uaccess.rs` it uses `offset.checked_add(count).ok_or(EOVERFL=
OW)?`
> for the same kind of arithmetic overflow check.
>
> * For `kmalloc_array` i think it conflates overflow with OOM because its
> return type (pointer) can't express distinct errors, maybe it should be
> improved as well ?. When the API can distinguish (like here, or in nouvea=
u),
> the kernel does use (or maybe should use?) `EOVERFLOW`.
>
> IMO two failures have different semantics for callers, ENOMEM is transien=
t
> (retry may succeed under less memory pressure), EOVERFLOW is deterministi=
c
> (the input will never work). Using ENOMEM for overflow could mislead a ca=
ller
> into retrying a request that can never succeed.

If I allocate `usize::MAX`, it'll never work but the error would still be
ENOMEM, and I see no reason to differentiate `usize::MAX` and `usize::MAX +=
 1`.

Best,
Gary
