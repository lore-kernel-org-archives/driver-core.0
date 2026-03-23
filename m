Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020090.outbound.protection.outlook.com [52.101.196.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94FB91E2614
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 13:05:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.90
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774271130; cv=fail; b=GJGZYz2A5DUtR0rI8y2JSQ2JnRgHezVYjKBvv4Zc/8KXuWZrxm4BVPtZUuZr/hIjH/armoxZy2RE+AvOvlNdp6QkOdFYnrzd7l/xT3XriBog91za3RZsd5koD/Wf5+GjSs79VURoFjAJ7BSfmAUpT9L/KQG+dzvJHATdNmvesQ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774271130; c=relaxed/simple;
	bh=hr2f27dyGklUZj9B9v5e18BtNSDwByrltufgLqUY/x4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=E6UtiwzqG5d13ziiwxlT3fHd/ABjkmIC4QbKtQjsJcFfEVyRH5hljaPMpJu3877nbptbHuIRB40Y0cOTMEEUViuWjlKOqTSBI2vFu3TUhRGN1oUDL+vd1LDmoTjYLywA+FR6O9EPC0lhKM555DMzRaak1CHGGA08EyX9DpRAZi4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=f0Vq92fA; arc=fail smtp.client-ip=52.101.196.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="f0Vq92fA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uDSQ/DJu6hgFP+SCCMoAennBPqnGCx3UDWRK5zdpOjDaa4GmEW7bKB4R4EEzV2AJonpnRP6o6NVfDIVgwV2gHJmNvXDe3R/40uOY4/gNniEhpF1gmkuNaoYVg5DO2DcFpT9Pvnc0r8OLRUZg7NRfQ6poziCGPCxRO+hpluYE5Kx7D7N+PDHOZG2WUCsuGrzDggKj2u2wwzkV9X/7cT5T5Gl1x028S5YbHmNW6d99rlgSuLjfMEJRaD2UWqf/pxEj2mEtVxFd/B0lHiic3rli3zXANYzc5NaJ19JEL7b64k0Qo5ISp6Nw5SuS2VDqxeaeFa9I4PhV9Wrr3U74sSmIbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jr0HHb9eruuW6rQc6H0DYHWQ2V4QlGOh+tAeYBYAW0=;
 b=oF556sTAlj9m6nj9mcT8x9ElJsaGDocUEU7e3T7joGlCXzkdvjXVTGEDb/O4i2MGS+7ublr3uE+OASSOfbU7/Qqc3edkDDXWhSOEpNOpiVoFO040ku8LVD1vzv3e9qPqRg09potdOE9NWmtbmcTsrTh/83lErSxsLRfhiqyorKnjHenhWzvxtimvB4iQR9WHKGU/bavZo9YVZ/YtAkN5NYHzmOXgQQAEJ1z5FQhSlL1jD3NblLPZfLIyxWjjXUahoh4QYRid80yPzJXPyoibVSvz1bqP3yHuVMLvUKD575mwBeBbiXGqdO0hLjV5DQrVcA524LfWEvPpqQCKunefBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jr0HHb9eruuW6rQc6H0DYHWQ2V4QlGOh+tAeYBYAW0=;
 b=f0Vq92fAiModFzn5PyHrv6FYziCMinKF11JBRKaKFw0z2O91SbS9utvhHFXJ/9Fth4m8hIx5VF7XDoieh3+fxjpBu6FLaR8ArGXG5opwo6TzLXEsBUtWVEqfnwzFgJ7cVcTMu1oe6tNZ8S62it/Bg2yDshLVR5zaObzNvnEojk4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6804.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2e9::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.31; Mon, 23 Mar
 2026 13:05:26 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.030; Mon, 23 Mar 2026
 13:05:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 13:05:25 +0000
Message-Id: <DHA6MEL4AXAQ.3ICB81V0D9FNX@garyguo.net>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] gpu: nova-core: firmware: riscv: use dma::Coherent
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-2-5cf18a75ff64@nvidia.com>
 <DH8JS2ASDOWQ.2VMYT7989OGXQ@garyguo.net>
 <DH9XWWNM1GY4.1W6N89W6UCYDW@nvidia.com>
In-Reply-To: <DH9XWWNM1GY4.1W6N89W6UCYDW@nvidia.com>
X-ClientProxiedBy: LO4P123CA0416.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:18b::7) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6804:EE_
X-MS-Office365-Filtering-Correlation-Id: 49d0855d-0b3b-40d8-b715-08de88dcd9b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|7416014|376014|1800799024|22082099003|56012099003|18002099003|7053199007;
X-Microsoft-Antispam-Message-Info:
	ciwp52BZDTXoZXtNwQn04mk60a/7MvmNSPTZbPDaP/6Ec9pfXPG6fAmkjW7LsnRbF/6ED2gSt1IJiMIuKYcLYDH2HXQFgdLsvBLSx8XsfDfJzbynpTnjcUedS8rceTnXOui0a4bu50QAiw9AnrawoQknm3Fy4gNzs75azGV1apMGybVaz2djwHTKAgiabj/j6DB9yYuG56VXlge6MHslDoPsMmKQSai3nUV8G8C0eUPPxudDqinaLROlvOd2oXDeDjzIq4K1ersPvABYlnLy0q0dKGt+MXA/4e663DMTLzZt2t+ziK6Bqw0rW/Oip6K3MRyA2cgsVPHFk8IOQF2HcCzHAX9MEbgczJYFcGQg+DYr0hP6oXhm9t8peGgMvzTaBa6NNyRmIF0keRRFGLgxgjuF6p6hwqxLUAo6RVkzjTbRsYcGA2zA8kgAswKs6lISkOZYk/CDV1EVwTGRdJvBo2vt9cQdy4lzYB7kaMnDksRKdGkyUNLwWSTk4B/Ag0+zjpo1CfNHjmDqm6aulPoPPclL4mOxIWHBbVM5+QpjKRgIl0voTU/SM4oN3b2oUB9cbspzHNbCILtmxamqp9oMQ3120xDgNZrh5I0u8G5tDU7lj04NeNSo92Ohnb2w6f6quywL+3rfjVnRqqtD3rq0dSaE0UPkIEZa5ppHQPsyYYqKVzfBwtetU7JhE7yFf6Ja6gQxKzNCX8ehQnV23ITRcib6FYT3TStXJ4/PVCNh5ZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(7416014)(376014)(1800799024)(22082099003)(56012099003)(18002099003)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MlQrekU0cWNKNnpFdm5Bb255TnFyVTZwYkZjZFcyaVRrMU44SW9zZ3NtYWw2?=
 =?utf-8?B?Ymxob1lqMWd6TWJtNzA4TEpBSHBFQXpkNytLbFl5a3lXb0crMktsaDFyRHoz?=
 =?utf-8?B?cENrdlRuc0RON3VGdjhaVHNFSEc0VTRkOGJQb1NQNkRyWnRrYTVscUViT3Y0?=
 =?utf-8?B?SEx0dDFJRXpLb3NpN2tWSGNNRXRySkxER1VLNE9VZFhSYmNBY2hNeG9yWU1l?=
 =?utf-8?B?NVZ4bzJqT2ZVQlBRWm1wTTkrTFFsbEZOWE9wQ2QwdWVBeHZ0RXloODBXRW15?=
 =?utf-8?B?UlBRQXQwV3dubE9zTjlTUFNla1R3RmJnZ1FwWTgwTWZNenNBRVhpU0VJWXRG?=
 =?utf-8?B?K05pWS8waDBkZ0h4bFgwanJwYk5tdmEzY0pEMEpxbFBHa2xOVFg2SFFiMUlo?=
 =?utf-8?B?MjR1OWp4YXFjTDAxVERLczlRaTZsWWFEakRULzVQUHJYVjUxTFYzTGlwcGwy?=
 =?utf-8?B?dHVIaEtSVEEwWERxR1RtWkVOWHUwNW56eFhoZmszbkhUNGl3SlFlbzVyK1dM?=
 =?utf-8?B?V2pseGF3S3AwK0Q4U3VEYWR4QWQ5SXJlaTNGQ0RKcDhGZ3JUTzJha0E3aHNE?=
 =?utf-8?B?VnJtblAzcldHYUZQOURRSWFBOFBhTDBrdDYrS1VXc0xOWElwMXBKUU9WRXhx?=
 =?utf-8?B?bkhpM2NBaGdNdlMyQnpNMnhmOTl4UUZVOFlNWDJBZTg5QjhpOHVhMzV6M0Zs?=
 =?utf-8?B?Zmtpa3dXWHo5K2FaS2FqZzM5VUl6YS9GNEJrWnpiV3JmbkpJV1BpY2tlcGs3?=
 =?utf-8?B?bXg1R0NrbXl1aDZ5T0h4V1ZpY0hiQ21oY2F3TnZOdXAxSTduV2RCVWZLcEFh?=
 =?utf-8?B?ZXlaUFkrODJtWjYyaC9ISUk2ZUNtdVRqZ2VqeDhnNVkxQU0zNnRBc0dydzVZ?=
 =?utf-8?B?Y3FmN21HNkloOWxUSEc3anZvdGZ6YytuY2FwdXg2NnVmaWdES1hTd1pjR0ts?=
 =?utf-8?B?YVlVNXp4cThybTRMdXlVbVpyd01yVzJoVTJyVzM0SVNsWGx0Rk5nT3FtZWtL?=
 =?utf-8?B?Y2J2WFhHN1IxVnF6ekExaCt6RUpnUjR4Y2RuMUhhWWx4d0Znd1pETnVCc2Vv?=
 =?utf-8?B?c0NBR3B3MWh0RG9ZMkwrdVNDM25yQmhCblpvUVRqT21oOFBFclNHUFFuTU5T?=
 =?utf-8?B?QjdjZWJCaHJXdVFheFFudUovYS9ZZ0hMRzBSTkxERVMzUURwR1FyRTQ0NmhQ?=
 =?utf-8?B?RmpmaUVzYW1ab0xiNkQzQ3V5MEJKOWR6N0hScS8yRjNBVmU3MjE2V0NnUVV1?=
 =?utf-8?B?SnozbSs2RVU0WGdPam40bEdKVDJPQ1Qyc3UyazI1OFE3OC9lcHg5Y1FYTWJ1?=
 =?utf-8?B?azVzcWFzNU5jRndOalZWOGZVdU95dERYcFFtMDFhL0lLRG9GTk9aYjFFdVMy?=
 =?utf-8?B?QkoyRmduWEg1Z0MxaURBeWNwRUlHUWtKTHhFUXhwR3lJNHUrTnVER2oyQ1N6?=
 =?utf-8?B?OWpnVE01bEFsS1N0dnl4VHRmbEdkcml5elBRVzMzRzM4TUo5OUFVSFpKamNK?=
 =?utf-8?B?bFNmdjNmZTVwb1E0VW9Cd2J3WGFUQ2RvaHVVNExZZkEwd21pallwSmJXenpj?=
 =?utf-8?B?dm02WkMvWTkvbjBjY3hxdjJ3dk9nQWdnS21yZTdiMTlYV2pDWnFSN1kxWlRq?=
 =?utf-8?B?YnhuL0d5ckh6SkZzZXBidjRFS1B3UmdmcVZXdmhRZ3hwQTdSaE80QWtUamRl?=
 =?utf-8?B?MmNnRmhGeEFZTExFR2Y2MDhmbE9tL3A2NkZrL3FWN2Vpajk3VmlhbFZhb0ZB?=
 =?utf-8?B?aE45Y3BnczdINVhNRnlxckFONWl3aGVsc2RQRFpZQjFwV09laFVianQ4YlFH?=
 =?utf-8?B?YWtrU2dzQzc0aThFaDBBOVpjYk5vR2xQNDRIT2NLandiWjRVT0lZQ2RJRko0?=
 =?utf-8?B?WUM4ZUlaNWlaTDdkOVNTNlhnQkdYejAybTJIWm1FZ2VBV1VrdHNGM0VKNVc3?=
 =?utf-8?B?Y29pSmZuNVRVYWhzU05TazMxa3l5YWJjWmJBc1N5UlgxNVh1WS84MnhDNnVB?=
 =?utf-8?B?cmVBakQrTldQVkdwSUNlTHI1UG81RTVvbE11L1RJOE0yOTdVWnc1UkhXZEdP?=
 =?utf-8?B?di9Ic0xMNVBqb1YzR3I4WGJkamVQVEI0TEMxRXIydHpFL0MxQ1dMTU1JanZn?=
 =?utf-8?B?Qi9XbVBSOHFNYlVuVXRFd3o5bStlMEQzVDJuYVlMUzdZcUNGSXlCL1hzOGxD?=
 =?utf-8?B?aXJWb3VHODYvV2wxTkRIUitBTWNTQ2hUR2VmMkRQTnlqZEc0OE9LN003NDlT?=
 =?utf-8?B?RDNiekw2YlQ1eTd4cGs2THJiaDFCeVJud3RncjU2Nm00VGJvY0R4cjhTQk1Y?=
 =?utf-8?B?L3QvRjhOOG11KzR2TVg3d2ozS1RZbVNKdnNwcWd3UFdhcG93NERJdz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 49d0855d-0b3b-40d8-b715-08de88dcd9b1
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 13:05:26.0369
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aXFET0ymBAJcU8geL5RMKIFdm7MRCbnhHY/GPTC+U6CbB61AR2G9tlPRcjgKSTWY913bV5P+RV6X69POynHhgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6804

On Mon Mar 23, 2026 at 6:15 AM GMT, Alexandre Courbot wrote:
> On Sat Mar 21, 2026 at 11:58 PM JST, Gary Guo wrote:
>> On Sat Mar 21, 2026 at 1:36 PM GMT, Alexandre Courbot wrote:
>>> Replace the nova-core local `DmaObject` with a `Coherent` that can
>>> fulfill the same role.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/firmware/riscv.rs | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova=
-core/firmware/riscv.rs
>>> index 14aad2f0ee8a..2afa7f36404e 100644
>>> --- a/drivers/gpu/nova-core/firmware/riscv.rs
>>> +++ b/drivers/gpu/nova-core/firmware/riscv.rs
>>> @@ -5,13 +5,13 @@
>>> =20
>>>  use kernel::{
>>>      device,
>>> +    dma::Coherent,
>>>      firmware::Firmware,
>>>      prelude::*,
>>>      transmute::FromBytes, //
>>>  };
>>> =20
>>>  use crate::{
>>> -    dma::DmaObject,
>>>      firmware::BinFirmware,
>>>      num::FromSafeCast, //
>>>  };
>>> @@ -66,7 +66,7 @@ pub(crate) struct RiscvFirmware {
>>>      /// Application version.
>>>      pub(crate) app_version: u32,
>>>      /// Device-mapped firmware image.
>>> -    pub(crate) ucode: DmaObject,
>>> +    pub(crate) ucode: Coherent<[u8]>,
>>>  }
>>> =20
>>>  impl RiscvFirmware {
>>> @@ -81,7 +81,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>=
, fw: &Firmware) -> Result<
>>>              let len =3D usize::from_safe_cast(bin_fw.hdr.data_size);
>>>              let end =3D start.checked_add(len).ok_or(EINVAL)?;
>>> =20
>>> -            DmaObject::from_data(dev, fw.data().get(start..end).ok_or(=
EINVAL)?)?
>>> +            Coherent::from_slice(dev, fw.data().get(start..end).ok_or(=
EINVAL)?, GFP_KERNEL)?
>>
>> `DmaObject` rounds the data up to be page-sized, while this new API does=
n't.
>>
>> It has impact on alignment, as the allocator aligns things to the larges=
t
>> power-of-two exponent of the allocated size.
>
> Doesn't `dma_alloc_coherent` always allocate from the page pool and thus
> returns page-aligned memory though?

Oh you're right, this is not from DMA pool, so allocations are page-aligned
indeed.

I brought this up because I got bite by this size adjustment behaviour
because in the `from_data` I initially put

    unsafe { dma_obj.as_mut().copy_from_slice(data) };

but that doesn't work due to the size being aligned up so dma_obj.len() !=
=3D
data.len().

But if this behaviour is not needed it does simplify things quite a bit.

> I'm not sure why `DmaObject` was doing that but it was redundant I think.

A question for yourself I guess? :-)

https://lore.kernel.org/all/20250619-nova-frts-v6-13-ecf41ef99252@nvidia.co=
m/

Best,
Gary
