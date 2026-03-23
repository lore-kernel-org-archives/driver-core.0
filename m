Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011029.outbound.protection.outlook.com [52.101.52.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7318399004
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 14:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774276440; cv=fail; b=c28CoZZmegEhxXiLk/dtqLvzvnXQFuS6GFOfDOiZrW2yj2NHM3Kq79MKXG6dOczUmFoeSoasbs/AadL/WLBBM4T5Ftg7U5E1pe16hhpC2PWs20EgBp3blxl8xL6cX8x5Lx/cibWTMXTvm4TO6bdBKuOZ4A1xu0I7jLZ+dCjrsKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774276440; c=relaxed/simple;
	bh=JjWqscpzs8UK5KKZAz0LDfpg3WQjdmR7mFIM6/6lF0s=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=hzn+MzbnebdXjtSiKuFwhcD7kniTLYbJ0w+EVYHmZ2lLAHRJNTjFh8ARslvYPoZSRx59MTD7bID4QkJ4SgEOG/8FSR0GEkNERKHiX41BCbIWUhpCL8l1qAtzqrE6ISNOdlRf3oEEMtmFgCrHuABLlL3K0h3IuzsNl4XzX+NbImA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=GUrY2EXz; arc=fail smtp.client-ip=52.101.52.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="GUrY2EXz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sNGDaioYo91uRpNYIlhwBXKVVRTve9IjPTnj6TkZp97b3HYbmEcUqe3J6iYMiIqr4XfihoB2FLYo1hYWCqTUntmss5o37hWpqGVnXTLFgjTdqLuIZgm4N/IVrxmojpxgI4CmeCMWlU3mnrjybCX/hhlxCFib1Vt6+zuNhh3yF14DRatT2o8/iM94OJsIsrmDOntH9GLgHkcXqfsCUiSGl6qmrqGmBIcs+tN6w19bjf1GtiEHql29fCbIiqfwgvYuu6WbPQEviCiMm6XLQQLu5HyO7NjfcCk+2WTl7pyREMPjjtluZHeKe/sd0ZISBrDwXspyg7zeuSan1MJYEZE6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8dhLBXapMuG/gyUqIVB9QMD2V2hjPUnSJScMTY1ACo=;
 b=uFNk2A3I2ThGdez7zYbU0Lp2gyOsnZIziWbuxA6ABdb77VKmeyCoX+iYNiO8znP18ntABSetLI980o7m6NIMJzc4d1kJe/TlV3EIhbLoP9NRpTL/vxXtHQVCt9HUJJWzd7V9TRexEhk3bHopEgpWi18mdrxSAfI82mubXbLxpTb/h+daQutWjGoT8A3pvYbTUopuTSAbwudXARPRdgU6qUw+O2+cqQV0qzO2SUDDtRLv5RnfnAcL6Eb1DQTEz0EG8B8iB27IemiY9380al3BAwAhnRYyfDGjvNpy43SvQZ7pfwKaocL5WA3ms+/ur69/0qTYTCoanaiWhZQjDRoeIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8dhLBXapMuG/gyUqIVB9QMD2V2hjPUnSJScMTY1ACo=;
 b=GUrY2EXzFC7JmwV9wsem+v8Wtriu7u4bkpCcF/rF1M1e9u1eObCdTIpbTYflvabxAX3UofSxMLY9Z1IeYqw7ZJzjI6fgemam/krA/GMwzKRIkHYiYB9XhZdoDDWBpKfl3UkPT0py/kNbhqp2A1uHd1QwT4DlT1PINOGxc7nfJAoqd91YmWfAFCWLncKNWQLjW8a4Z8hr4KIrS09jh7OD2lVnL0dXxyjh6IJI77gvloHcr21KNjpNTYgcyYDk3Gg6s6l3+95ULJU2lo6p3nyBO1fCMihZZBZA1oK1r00T1rzEb5kYKxNWJKSOeqHZVG3isrnNeFJR3Qyli+0cSAKK6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB6847.namprd12.prod.outlook.com (2603:10b6:806:25e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 14:33:52 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 14:33:52 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 23:33:48 +0900
Message-Id: <DHA8I2L0GJXM.3JFJQSOG3HP3D@nvidia.com>
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
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-2-5cf18a75ff64@nvidia.com>
 <DH8JS2ASDOWQ.2VMYT7989OGXQ@garyguo.net>
 <DH9XWWNM1GY4.1W6N89W6UCYDW@nvidia.com>
 <DHA6MEL4AXAQ.3ICB81V0D9FNX@garyguo.net>
In-Reply-To: <DHA6MEL4AXAQ.3ICB81V0D9FNX@garyguo.net>
X-ClientProxiedBy: TYCPR01CA0113.jpnprd01.prod.outlook.com
 (2603:1096:405:4::29) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB6847:EE_
X-MS-Office365-Filtering-Correlation-Id: 37c8cb04-b680-4da5-adfc-08de88e93402
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|376014|7416014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	QlEztoa8xejla2BUt++j01lb5OznTJM2kVL6g83x8Rz+GkmOMIsTKJO9l61RMNpd2T00MBRRC463SlAZ6mNE/du3Yvxvuf5J4MWoNJE/5v3UQx748qtBqJMVv32giQvdg4D3rXxJcqZyaSvFJsTuuq8uy1nxXtgtnZDy9AgfDNfPgjT7ho5T26FSHEQWW7oKzfNTFogJ/nyq0OLoQfsDSJW7fU+YBpZQXyOBBrG9U7/GBn3NU+Q+hDuADsGLAoq9ViieRL/k6+f6hbgB5ox1tbbDnPdFJS9NvBkCD1a0q4PFt4PuD1fhuiEzcc0Depd8MdfYwveNfLCkzdEstau7kbKWDl8ViH+XXD4wpyvkc2Sz2hfkKhGJF1I7mfbwyQIxBD49uhWWsoNUYAsL0vD+pLl4lJ1i8ymSOeXwTcBqQWk3gFX9fVUxzjZl/NJaWR/O0J0IiBpDQigyrWdHVBl2YEVtq1k2JY8FoPSyq5St8HGM/UuITy+nhLv0zBiFnQWlN4h7QZJnvxHIYw/pLVaKT/Bd+Q/r0mCa20e5D0YZMRhZSRTPnkrK6ZMD1KHuKKlcO7OkAmSyIaoA3E/PX7BLATuiZ/rCQ0CRnHMySBJ1gjygNHUiZmhbaCB0iDrxhryGZqH/n7elvHUxqHGc8IE54p1fJ9Z1ZCPpcmAD2d9GYQ2s4SfkauuwuYOiCK+NWLNOudbSTZY4QKoW3a7UJ7R2QQLBUj+lKBlsBHHyAsGPpDuodlYGTT2P1CJSuLMuCNhH
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SnJRbVpnMlMzcUVDUDQ3cHp1QStvVi92aTh4MGcyd0lFcVYyQjRRNTJha3Rt?=
 =?utf-8?B?R1dKM2tKeitscXZCVU9WaVVnSnBWV2FVeFVzVEMrNWRFSS93NTFGTi9zdmE3?=
 =?utf-8?B?RE5MdStBZ1piaHMza01ETEN3OE11UnphaWo2bHc0VWJKSjlQSkV1djY0SW4w?=
 =?utf-8?B?YW5ieWN3d1ArTDRGbVF0dWdQQzJmZDlMZlFEUWpGUTd6ekxOdXhJSTh2Tmtl?=
 =?utf-8?B?RFh3aUsxZGpCNDdjSXhKZ3pkM0tQU2tBTHl4RjlIOUxCT3N3ZDhqTjQ0bGtq?=
 =?utf-8?B?cE5KZkF2ZWZxeDlpeG92bHdvTjgwc05Rb2EyVm5KSS9BUk1jVjRyQmZlaDBZ?=
 =?utf-8?B?OHd4ODYxRGZRZ0NscDVkaHoydnJQeC9IcmFUS0FLZzZuQjlaZDJDeEdNR2xp?=
 =?utf-8?B?dEtlbGxYQWJsREpwNUhjUzNBLzVtUTN2Wmt5ZHZoNEZENGRsUGkvUWcrL3la?=
 =?utf-8?B?bmpWVDZscjFkbm5qZWpZMk9FUkM0MUcrcW5BYzdXdUJEQXh0RmtIemdHN1dr?=
 =?utf-8?B?dE5KRkhTdGdtZXpuZTlKVUxDY3N4dkZyeVFkL2VlZVZiYnF0TjVUNlRxbFpj?=
 =?utf-8?B?bWNCMDRaMWV3ZlNIQWQ5bE1SN0hSMitJN1k2bFhzbjliRmQyZlJIV3BZd0dv?=
 =?utf-8?B?M2hKQk5PYU1HK3RBcnRIaFk2OUxZRHNiU1M2WE1rZ3Rub29BYUNiVGMwZnhj?=
 =?utf-8?B?R21jQVdHeDhyQ2I3VjVlSzRJb2owUlcvQUxEaGhhRldwYzdUNm1Wd3VoREwv?=
 =?utf-8?B?WHpPNWc3Uk90amxUZ3hFcXpMaFdGcFZvT3dRSXBlZ0tSUXFNeXMxQ3VvNHJT?=
 =?utf-8?B?RSswd2w1aHN6ZTloK3VQbWpGTEhnSHNyckwrUmZJVEdKeGV0VmlYRVdZWGJB?=
 =?utf-8?B?ak1BR285ZEtGN3JqMGRCYSt4cmxycEZPU2pFMUZYMGtlUGh5RGMxZXNnZzRy?=
 =?utf-8?B?UzJyRHEySm1TNFk3V21CWEhXSzRKaXRtd1VDR0R2cXBWUjgxNmZnOEpxL0Ur?=
 =?utf-8?B?UitmMmZsd0JaT1RvNk9Oc1Y0bndMZmhPUkNsaXMveHZlaEowZUlET1ZZVUZi?=
 =?utf-8?B?UnJmTE4wUFFOU1NoOWV3dG9YZ2UvODczT2xnUDVjRXRPNHhoc2FHdzEyY3JB?=
 =?utf-8?B?c29vMWZ4U0FFcDRUNjFBWlZIUE5CMWYrZjZqN3djd0t6bkdoNmFmVFprb1ND?=
 =?utf-8?B?Zk5CMXpVUG9XSnJIT0JEVXFSUGxNOWlWSlNlK29DOVdZblpoL3ZwZnh3STZR?=
 =?utf-8?B?NktBV1JJckQ2N1NRTC9Ed0I3R01WckJZN0JTY0ZLWktrdVFGeEIrNHZYUXJj?=
 =?utf-8?B?ZmNyWUZ5Sjg4WWdvMFVPMXNZdldCYlVMZG1sODN2Q0R6YjdrVGo5WEJmeDlS?=
 =?utf-8?B?TlZxaHAzZFhQM1I5RTBCLzMrN3JGanNtdXFIWjA4YUYvNFFjY2ZMaXlrenc5?=
 =?utf-8?B?bnNuSVNBRjkyaUt5U1F4dWg0bkdFTUx2YkZLb0VYOEN5OHpyOTU1OHBiZTBa?=
 =?utf-8?B?UTFOSktNMHd2Y3RhZGQ1d1lyU0puWnRxV1pVTHNSVnlmeERUaGtyc1FuanJK?=
 =?utf-8?B?VmxSOU5XU3BZa1hkbkIrUDFFeVNRRE5GTDMzRGtvRWZlQmNGSWVkanZBeDlJ?=
 =?utf-8?B?THZONVRxajNpcitieW4rMC9pK3hYNnp0bk5BY3ZEeUl2Z1RUY2gwaHpSNStz?=
 =?utf-8?B?ZEZ4Rks3SEowNExYQ3ZxY3AxVDhUR2tMSjMvd3hUTjBOVHJRdmFnc1FEZWNO?=
 =?utf-8?B?WVJKTkFQSHpwTGhsaW1PYjdLbW83VXhOUDl5SjJWTWVpWStZbG85YlVFa0xE?=
 =?utf-8?B?T09WVEI4WnArWnBWcG9oeSswNWNXNDlGdEFWbkQyOTNCaGhGSmtkUHl1VGx1?=
 =?utf-8?B?dUdKRXhHM2VuZnhkRlVHUmwzSzZ5Q0JJS290WDZoMFBKTFNjK29ST3o2WFhu?=
 =?utf-8?B?SDZaZjdWc3hrWURPQmpmVHJ5dE12Z0xpbFpOT1JQS2g2OW5KVUlpVUtYUXY5?=
 =?utf-8?B?VVI3eEFYc1JLRm5zQ2VHUXkrNEVsVktGZjl1YzYrV2toa2EwOEIzakh4MExo?=
 =?utf-8?B?b294YmRuc2YrUm1waXNieU82NndKd0hlSTAwNzJaaHJOM2RwZkVRWHV2UzJX?=
 =?utf-8?B?YzNoYmNISHcrdU4xL0tqdTlSUHNVWjZhcyt3TGh3aFJqbFIrcHplTzkvRkln?=
 =?utf-8?B?RURudm11MUdRaUhQV3h4SmgrcE9tU1BYUWlWUG5pc3pJQkpiSU94ZUh4b0ZN?=
 =?utf-8?B?Z1FMdFJyMWRMWExuc1NHTGdVREpTZnpFTDl2VlIwNzdpdXdxZVkzLzdmSStZ?=
 =?utf-8?B?UzVDbnpaSURvZVdlN3hNdzFnODByWkpZSmJzenBIRVJUQ01WSm5HTFhPaHNE?=
 =?utf-8?Q?+5XoympK+IzRZk7CcmFWE7VJisE6qA9iAQBOfTPirOQY6?=
X-MS-Exchange-AntiSpam-MessageData-1: pP0Vy/PYROt4hA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37c8cb04-b680-4da5-adfc-08de88e93402
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 14:33:52.5386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bW5tn2X5TTUmnZzjD/n5e2ZKDCjxW8JexkHvFrIHL1PHtNAtbSvFBL6qgQ+3TwSz6aTIHOiJSW1uocpNoDwcEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6847

On Mon Mar 23, 2026 at 10:05 PM JST, Gary Guo wrote:
> On Mon Mar 23, 2026 at 6:15 AM GMT, Alexandre Courbot wrote:
>> On Sat Mar 21, 2026 at 11:58 PM JST, Gary Guo wrote:
>>> On Sat Mar 21, 2026 at 1:36 PM GMT, Alexandre Courbot wrote:
>>>> Replace the nova-core local `DmaObject` with a `Coherent` that can
>>>> fulfill the same role.
>>>>
>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>> ---
>>>>  drivers/gpu/nova-core/firmware/riscv.rs | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nov=
a-core/firmware/riscv.rs
>>>> index 14aad2f0ee8a..2afa7f36404e 100644
>>>> --- a/drivers/gpu/nova-core/firmware/riscv.rs
>>>> +++ b/drivers/gpu/nova-core/firmware/riscv.rs
>>>> @@ -5,13 +5,13 @@
>>>> =20
>>>>  use kernel::{
>>>>      device,
>>>> +    dma::Coherent,
>>>>      firmware::Firmware,
>>>>      prelude::*,
>>>>      transmute::FromBytes, //
>>>>  };
>>>> =20
>>>>  use crate::{
>>>> -    dma::DmaObject,
>>>>      firmware::BinFirmware,
>>>>      num::FromSafeCast, //
>>>>  };
>>>> @@ -66,7 +66,7 @@ pub(crate) struct RiscvFirmware {
>>>>      /// Application version.
>>>>      pub(crate) app_version: u32,
>>>>      /// Device-mapped firmware image.
>>>> -    pub(crate) ucode: DmaObject,
>>>> +    pub(crate) ucode: Coherent<[u8]>,
>>>>  }
>>>> =20
>>>>  impl RiscvFirmware {
>>>> @@ -81,7 +81,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound=
>, fw: &Firmware) -> Result<
>>>>              let len =3D usize::from_safe_cast(bin_fw.hdr.data_size);
>>>>              let end =3D start.checked_add(len).ok_or(EINVAL)?;
>>>> =20
>>>> -            DmaObject::from_data(dev, fw.data().get(start..end).ok_or=
(EINVAL)?)?
>>>> +            Coherent::from_slice(dev, fw.data().get(start..end).ok_or=
(EINVAL)?, GFP_KERNEL)?
>>>
>>> `DmaObject` rounds the data up to be page-sized, while this new API doe=
sn't.
>>>
>>> It has impact on alignment, as the allocator aligns things to the large=
st
>>> power-of-two exponent of the allocated size.
>>
>> Doesn't `dma_alloc_coherent` always allocate from the page pool and thus
>> returns page-aligned memory though?
>
> Oh you're right, this is not from DMA pool, so allocations are page-align=
ed
> indeed.
>
> I brought this up because I got bite by this size adjustment behaviour
> because in the `from_data` I initially put
>
>     unsafe { dma_obj.as_mut().copy_from_slice(data) };
>
> but that doesn't work due to the size being aligned up so dma_obj.len() !=
=3D
> data.len().
>
> But if this behaviour is not needed it does simplify things quite a bit.

I was contemplating hardening the `Coherent` allocations by padding the
structs when there are specific alignment needs (in nova-core it's only
a couple of types affected), but then thought this was quite restrictive
and should be handled by an alignment parameter on `Coherent` directly -
and `Coherent` doesn't have such a parameter because the underlying C
API doesn't either, and the page alignment seems to be a property of the
API itself.

Maybe that point is worth mentioning in the documentation of `Coherent`?

>
>> I'm not sure why `DmaObject` was doing that but it was redundant I think=
.
>
> A question for yourself I guess? :-)
>
> https://lore.kernel.org/all/20250619-nova-frts-v6-13-ecf41ef99252@nvidia.=
com/

Ha, I was precisely wondering who was the lesser engineer who wrote that. :=
)
