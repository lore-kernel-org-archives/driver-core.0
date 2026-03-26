Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022097.outbound.protection.outlook.com [52.101.96.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1597D3FE663
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.97
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774539324; cv=fail; b=uJ7zuG8F0YNr+o27Ttw2l1NW+8L7VcIXk969BBcnMzPOsHsonUxBWImMe+PcyYfkd2KVRiMEEcwPvGvKk2ZLgZZZjmClSPjOM3ZLySpTN2tlQNSuxCr21Bldnjb94vJS8tDf6S+qWD81XG8Kl8mwVPPC0yQL2SbkJwZU9Eyw+tk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774539324; c=relaxed/simple;
	bh=au81zVUWKQBwGGpkPI0w1u0MAgiLT9CmSDKeY8eHeD8=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=TQaBtOuEc55Ecmzgvx5omC7jHOScPM1HbK3aqH0AjMEjo06mNq69ZTF4I+abxOlyVA9Y44LRVBpOHWaUhiVKA9t3J8pMYzcPZ4WMVA36/6j9qx8DiaH5g0OmxT3OGjc314stJsiH3YYK3H3yyEszrGnYlRNOneHNBTRHbFrAG6Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=JZ9VYqm2; arc=fail smtp.client-ip=52.101.96.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="JZ9VYqm2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jAod/ZNLHcMd7zB1cfWwYquAqRfvJq2YJF00dA0bGOZS3dfC3TCqn6/yjixoK5iDpNfKAHTp+ZqhogX/o/gFbZxqEQ4ftzEikXtmr5+LO5LGIX2XMgKlEtNxEOvuF9KCjrNNbxr+KjRKLoy/IkXdnK/g7PvrYEdQAjOfgDPi5zl/SIzFNUjsW5Hlcb6EeZ1rjOLJqtQNZS8NcFcTEa924y/klZKlm44W5clUhfp+1qsbOQTvyBSShUT9VSgteQGXdWS9kh7nX/lSfvxldSK5H6HSb+2XBRin52H1a3plcFf4sW8C/8pzDpZRI+cBnKjxN9lX06/NYaYe4OCEaWGFpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHZ5LdIPXcS1XizhazSVJWsxOK1Hito49T1wVC+Wc24=;
 b=KOijSV9NMVP7HbKirPhUUZEfENWEMwWC1q+rWJ3AMsr5hH3DOMMbgY6VA1BIfZGBggAaelQf0CfBM18t8opc6s2FXWJ2G+UuPzonbkYeDeG/yb7u5r5VuRhtzfhwIiSbI9s7Oaeje6PcnVG+gln6MW+i9BB+r70D1RXp/4AeGQd908f8uViI2P0LbLcm6G9c0f1vp/j7+L9vCwen4FiZCkcux3jqzc4B8NGb/3WdBJmlswjrO50AUEGkKFaY+w5yfeCCm4lKC16cS+UqfWKcAxLArirZpH0odYGE/SchMsZHEm8UBOdWgAsftjARk/G3klLdVcjxXuKiORCqXOQlxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHZ5LdIPXcS1XizhazSVJWsxOK1Hito49T1wVC+Wc24=;
 b=JZ9VYqm2dKsD3uYR6UOVa4Ds4OragNJGy/hquwq6by6vpAnZfq8aabMpf/+fBz18pBkfjALfr/14OuUlmarNZHXxFe8BEgooPDUUMNSh/4X0bQ+M72dRpDUedK4ngkW+5x82cF5tv/3jPW2qg+skaVxNjPjec5L2egZaQiIbzA0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOAP265MB9142.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:491::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.22; Thu, 26 Mar
 2026 15:35:18 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9745.022; Thu, 26 Mar 2026
 15:35:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 15:35:17 +0000
Message-Id: <DHCTOSE1W9HC.T5EJ8R91LYAN@garyguo.net>
Subject: Re: [PATCH 4/7] gpu: nova-core: falcon: use dma::Coherent
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Abdiel Janulgue"
 <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "John
 Hubbard" <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>,
 "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-4-5cf18a75ff64@nvidia.com>
 <DHBI0S0S5II8.46GSKUPRD2X8@nvidia.com>
 <DHCT0W1KW2YP.32CR750RI9AMB@nvidia.com>
In-Reply-To: <DHCT0W1KW2YP.32CR750RI9AMB@nvidia.com>
X-ClientProxiedBy: LO4P265CA0204.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:318::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOAP265MB9142:EE_
X-MS-Office365-Filtering-Correlation-Id: a2b15728-13ce-4d8e-8757-08de8b4d48d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	QDU0orBFWteUopIyLqet9M57ROLml4REPe5bi1iuCc5i1cT551/6lr3q7RoEHIngRbj96f9aScO/FOnzwwE+VYpKeQAoVuSWEEqhxt1EINuog0zX81XvKwDg1rj4YYLkSDTBFUxT5o0Bctsn5SDS5MIt6tfmruieQS8IQDKlzY1UAmE2pLeZY3AireAru1mMJCwkkgPC8v3SP9SobpPV92NR8HgL0rb3IDckROv/uN+0UpbPHcC6CNi1dOD9O3i9ygdVBLqIqi/UEAHH84Uumr42cs1A8108PaJ4IDgO442atztZSWbnjGoDWDsorN8JAHj1Ig98e8JQdAFp0bc8UGL/yA31U2wYkaaMCFM30bZLTu0RKqcHp4f2r9NpaF3WNNUxAyb9XhOe+vkJxhd+xQNucnrdVVdsuPXyTeOZsvv5ZvJHwYcp9p3aGI4GLRRTH08xk86G3f3bIvTacyQXdvKGIeMXLOlJd5UFBYaBqQSxn2N1wm4NaTNsHVr+hBjXwk9t+6VqAqvFIsCN2g9fr5AG3Pf3Tto6MDgDRP4Od93CTBSHxi2I/JjaD+kdbXOfr9dGo3dUqfjpz/EXmpgpINjUxNjC7CIJCMrRqa1ZK7AL4SbkYLTcNPsUMJuVJOUg93RXlvB80SENmIPhwWPEpa4Ro/50k7Q9W6eBKQMQUhmHOGuwEh0a7N8Ma1Os0w7wcH8Va1bsoafuMwkffFK/p8te6iRJiNuduOEqn+I7Xn8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(22082099003)(18002099003)(56012099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?b2ZySnBwdmxuRjYrSTkzcnA0Wk1XT1F6YTFucHduUEZwUXNVSVNkaEwwZWZU?=
 =?utf-8?B?K2NKNE9DM2VGWGtMdzlJMzBBUGtvNm1qL1NzU2RxSUgya3ZpNERoL1RQM0J0?=
 =?utf-8?B?SnpvU0ZZT3I1Q1NWcmZtbXBZUGEzTzlGVUZSdVlyV1FFV09lWnV3YnczbzJG?=
 =?utf-8?B?NjZMT2dsWUpPbzZqTUxBL1VyOFJseU13c0dxZGNPOThyT0lUQUd5NE1aVGJw?=
 =?utf-8?B?eEwvbG9wM0NrV3h5bFVPUzRkMGZUTERyY0pCOFNWUW9hc3lUTWw1cnVmbWFG?=
 =?utf-8?B?ME4yUkdtbmdOS1hSam9ESzFkaFdxbmxNK0VlcWNhRXBmSnhpVzg2Y0taQXEr?=
 =?utf-8?B?ZWRkZGJyZ3F3cThHT2RRcnF2K2xtbnovU1RHUisrUDR4VFBSRWxWTGhoYXJn?=
 =?utf-8?B?V2E2bThLNjA0U3lTcEZMc05Ud2xKRHcvblBiTm52bkZWNjJNWnpFUE5MQVB4?=
 =?utf-8?B?MWdEdTFQL2x2YUgzM2NxMUZmQlExWGc3SmNseEE1cThpWkdyNTNCUW1XRkxQ?=
 =?utf-8?B?NkpjenZVT2tzeUJYcCsvOEFxSXBMclVtU0NrYTJHSkYxTXZqSWtxSXlsdVhI?=
 =?utf-8?B?Y0p5a0tXNzErRkQwTGI1Ylg0UmxSYllxbllMamlOd3ptUmRtZUNtK3pvNnRx?=
 =?utf-8?B?YlhFeDRoVHRZZ0QrbUcyaUJwaks1c040NUNRd2QwbHlUWUJucEV6c1oxVlN1?=
 =?utf-8?B?cTJoQml5TnJUd0l1bHVoNThFU0dFNWdaVGt2eFdWRW1aZ0xRS3pOWllEOHdp?=
 =?utf-8?B?L1V0c2xnYXBjSHVpMW1CWktqelE2TFg1UVpDblZLbW9CM1VUVjg1TXBMSXcr?=
 =?utf-8?B?U2l4Q01hZFdmcmRGeEo1VFJKTXNsNlA5UUxMQzlNQm8rTlFoUUJBN2JsWkUw?=
 =?utf-8?B?NGNZQmJrQ0xWRGRUOXB1L2krN2hYRk02aUpSWHlZemtpcjlMSmtrN1pKKzN1?=
 =?utf-8?B?NEZSSWxlMEh1V1JoWUgzNExQR3JyY3o0Sm1kL01ZeStxM0x1ZHdlUVVEVy96?=
 =?utf-8?B?WVFJZ2h4YnBKaTBBTDlTbFI3VlhZc3k1dVdKSW5tQlJLak12U3Bsd1l0S3NH?=
 =?utf-8?B?dUJ2b29XOTk0N0xRQjd3Q0N1UDF6UUZhQUFvZ2tjNDhZVFhaR0pkTDJUNzA0?=
 =?utf-8?B?VzFSbFd1REk0NzYyb0lHUDNEbzl4eFNQQ3h2U00xVENGaFJLdmsyREw4NUF6?=
 =?utf-8?B?WjRtdHQ0a3pKNktpZmdSVjNiN3Z2NmpaVjNRQ0hlbXJXRU4zTng3c2EvTEdP?=
 =?utf-8?B?MG83anBmNzcxcnRJZ2M5YkVTNWF5a3h6QVRQY0NTV2ZEVk8xaVBlNHpGQklV?=
 =?utf-8?B?VWVPYlMvSHZka045VTFWTkhPaUk3cDE2U1RPbzkxU0Q4NUEwWGM4aXV0d1NK?=
 =?utf-8?B?dlhpeWJBeVV5YktnbzFjRDFBd292dDlnaUZPU0EvT3B3ay9YMFhTU2h2V1JN?=
 =?utf-8?B?cUlQRHN4UDJYRnRldzBrdmtlTjFDU1lFYWxabVN1VUFxN2g3WUI4RVVFV3dB?=
 =?utf-8?B?WDFDTGNpbUlRdUtxT0wzcllZMVY4OUpoT0NhdUpCR3BONEdvZHhZbTZCcmxY?=
 =?utf-8?B?MkpzYXJHNS9iQjhCLy81U1FWOXRrOGpmUTZLWWpXS2ljaU5aN2c0MSswcmhq?=
 =?utf-8?B?em5jZ2twZTRmVW5pbDFYVldHZWZZUHRsaUtUY1UwK1JwOCtrSmlTY0FMajhj?=
 =?utf-8?B?dFJ2WnlOSmFDbHg4eDdxMmJ2QzdvUjRxdGtJalVYZVRidjRuMkVXOTZVbUM0?=
 =?utf-8?B?V01kcFdLOHlTcG9ublFjTUtTNk8wS1gzcWVZWmJEOGVlRmFIMWN1VEQwSXVi?=
 =?utf-8?B?bzRUZHlvRG1tSGc1cUgwOWRRbE1pT0RsSHZ1YTA2WFR1dVNrcjRlV1JkbW9p?=
 =?utf-8?B?ekQ4QXdKdXVTd3BKQWxxTXhTQko1VFJYaWJSQit6cmJhSkIxN2NpaDlGQ1BS?=
 =?utf-8?B?YTFlV0I2ZjZXMEYwMkIvWkNIbmlEYk05WDdUU3UyN0MwY1N2OWRuQ1FzUldD?=
 =?utf-8?B?WjVsQVNOdjFtZ09PWGRSSHFlRVcwaWUxZHN6SmMvcFZONW0zd0c1TlhSQVhB?=
 =?utf-8?B?QlAzL0R4MDBicWsxR1JXM3BvWXdRWnFDKzBhbnpFakIrS0locHdQdkVlTTdu?=
 =?utf-8?B?dEo3OWtVcVFWQkNZZUU0Qm8vbkp4MkJKV013NnE5VzFiZE5wQ0tiRVBXTDg2?=
 =?utf-8?B?VXFCWS91SmNTa0IrRkUwMm53VzlZb0lXNXE5VDNIVkFjSnE4a1UxZkUwczlS?=
 =?utf-8?B?YVBKOTMwOWl1L1NUZWlHZEUyd3VqUXBZM3dtVWgwSVJSWit1YkZBQ1REcWdx?=
 =?utf-8?B?NC9nUDUyWVN5Vk91eXJ2cXNlS213L0ptSkNGRmU0UVlEWjFRcW1CZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a2b15728-13ce-4d8e-8757-08de8b4d48d3
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:35:18.4464
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wnzfDcJAGMCmNAGRyYMjtLKdOg63L8IrvH1uJxqhNViBUjXBSbduVZiXKx+4VshZgXjyN4YbUHC7vsUn6nIjQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOAP265MB9142

On Thu Mar 26, 2026 at 3:04 PM GMT, Alexandre Courbot wrote:
> On Wed Mar 25, 2026 at 11:14 AM JST, Eliot Courtney wrote:
>> On Sat Mar 21, 2026 at 10:36 PM JST, Alexandre Courbot wrote:
>>> Replace the nova-core local `DmaObject` with a `Coherent` that can
>>> fulfill the same role.
>>>
>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>> ---
>>>  drivers/gpu/nova-core/falcon.rs | 6 +++---
>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fa=
lcon.rs
>>> index 5bf8da8760bf..f6239c44dd80 100644
>>> --- a/drivers/gpu/nova-core/falcon.rs
>>> +++ b/drivers/gpu/nova-core/falcon.rs
>>> @@ -10,6 +10,7 @@
>>>          Device, //
>>>      },
>>>      dma::{
>>> +        Coherent,
>>>          DmaAddress,
>>>          DmaMask, //
>>>      },
>>> @@ -20,7 +21,6 @@
>>>  };
>>> =20
>>>  use crate::{
>>> -    dma::DmaObject,
>>>      driver::Bar0,
>>>      falcon::hal::LoadMethod,
>>>      gpu::Chipset,
>>> @@ -636,7 +636,7 @@ pub(crate) fn pio_load<F: FalconFirmware<Target =3D=
 E> + FalconPioLoadable>(
>>>      fn dma_wr(
>>>          &self,
>>>          bar: &Bar0,
>>> -        dma_obj: &DmaObject,
>>> +        dma_obj: &Coherent<[u8]>,
>>>          target_mem: FalconMem,
>>>          load_offsets: FalconDmaLoadTarget,
>>>      ) -> Result {
>>> @@ -740,7 +740,7 @@ fn dma_load<F: FalconFirmware<Target =3D E> + Falco=
nDmaLoadable>(
>>>          fw: &F,
>>>      ) -> Result {
>>>          // Create DMA object with firmware content as the source of th=
e DMA engine.
>>> -        let dma_obj =3D DmaObject::from_data(dev, fw.as_slice())?;
>>> +        let dma_obj =3D Coherent::from_slice(dev, fw.as_slice(), GFP_K=
ERNEL)?;
>>
>> Is it guaranteed that fw.as_slice() is a multiple of 256 in size?
>> In `dma_wr` it breaks this up into 256 byte transfers. Since this
>> no longer pads out to a page boundary, it means that it could now error
>> (around "DMA transfer goes beyond range of DMA object") if the Dmem=20
>> section's size is not divisible by 256. But tbh, I find it odd that=20
>> `dma_wr` doesn't check that FalconDmaLoadTarget's length is a
>> multiple of 256 anyway, because it looks like it'll write a bunch of
>> unrelated bytes (since it rounds up to the nearest 256 to copy).
>>
>> Maybe we should enforce that `FalconDmaLoadTarget` length is divisible
>> by 256?
>>
>> For this series if for all firmwares it's divisible by 256 then I think
>> it's fine to leave this as is for now, but I do find the lack of
>> checking in `dma_wr` (or anywhere else for FalconDmaLoadTarget) a bit
>> odd.
>
> All coherent allocations are page-aligned (and use full pages), so we
> are safe in terms of overflows.

Let's not rely on this behaviour. There is no guarantee on what's at the en=
d
of allocation whatsoever. There's no guarantee that it will be initialized.
Even with __GFP_ZERO only the size provided will be zeroed.

If the GPU is going to read beyond ranges covered by `Coherent` (not just r=
ely
on the alignment), let's align up the allocation.

>
> Also `dma_wr` uses `div_ceil(256)` which will skip the last data block
> entirely if it is not a multiple of 256. It might be a bit more robust
> to explicitly check that the size is a multiple of 256 and return an
> error if that is not the case indeed.

div_ceil will not skip the last block, it will over-read beyond the end.
div_floor would have skipped the block.

Best,
Gary

