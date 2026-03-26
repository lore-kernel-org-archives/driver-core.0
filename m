Received: from CY3PR05CU001.outbound.protection.outlook.com (mail-westcentralusazon11013046.outbound.protection.outlook.com [40.93.201.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3B6186E58
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:00:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.201.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774537255; cv=fail; b=hWzo25lVh2q7NWZ5OTKwsU2PeAmVg++4lMKGLt/E6MYGjiuXI9hXJcxnZlurow8Kzzf7brm0EqygKEbnbQ3I+JgVe90iSLyHv6Qcjt8I50ZgaOpAOlrfSzEBQM5GnvOc9J11vBzbBdYSxV5UdsLmEP5Bw+MXNcWho0i4zWBf1ZE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774537255; c=relaxed/simple;
	bh=MfX/6gm2A+YaTBNnd46OPAbGImE4DOfnGRvHCAuexjE=;
	h=Content-Type:Date:Message-Id:Subject:From:To:Cc:References:
	 In-Reply-To:MIME-Version; b=vFM5CDa0Gd5h99tWIm5337nNLyrEinys9K196HIb21Kbq8j/PqsR4gKHXIf/JROC8lRtnblF9dBv8fUiDe3Qe3IFAr5dg8msJTQ5cLQDFQP8rNJNGVwpSUsJP+Uy4PF0qJTF8X5Gb2cxRtAKri3vkvRicF/QIMyI+IIYqam2fn4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Mei2ZgJ8; arc=fail smtp.client-ip=40.93.201.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Mei2ZgJ8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZyPP7LCzTmtWOgG+IERfZTRNGBKGOesVKtzbbtrG6Qu8jwjLtZ1kOMXP+QDXnlL2vCtRlBRn8H2lmaqe/N5/Jd6xsj50BKEN7W5+0exowfdxGm2goTD7Re8HIhvCOAozkNs2l3binLlgLSLDutNHlSbCXVhJvzM26wS0mpp1a1DLiGi3itZznL83znCOUZZQQk/Rb5AXG/GwqwLqILI1sefH/b7Tl5TGSo49QjlqmXzg9yVf8S30/xsnTNfKKIeNC18aC4C+PR1ZTkhhe28CmN4y+ZVR/+8KAL2jZToUb7xgmSrTL+QnqVE4oOhKcqoQG6Qeb1sTypDs0Wx0IU3TeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vXeOeQJucTYf89rpK8FRWsXWFYSUSemaPzs+hYQpRzE=;
 b=MzP8ZIxwPj/fb0L8aux7xxRsBVDYClhM4rWPdN+dyZkhGXMNXbDYMMySxhahN7NUiefuRdw+NR6UrQo4JrGkJL3StWMdA1lAVLERlRKK4XNatsvawmMV9rd659F6N4UFcFrsbmgysQZUOsjbJVWHCVYpP7x71g1ibmaRnFZBZ4XwuoceZy5yrMrCz9bMw1Vc5TcICUpdo4kIYoYwI26yWGQSajivVo6htsGtY9P7vNp2y2sXtiEn4pjuApijkS0Ywx5VrFJmiCjBAQ0GkNgsMrt1aj6CfjebSvAvx340tewGqZ+0/Ma7asHaoj0JX3wuxcCJ872ko7fxplJMGmhQ6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vXeOeQJucTYf89rpK8FRWsXWFYSUSemaPzs+hYQpRzE=;
 b=Mei2ZgJ8aNPC67LQC40KGjnN/6cbD3daAujcQJFAg0TI9ak/xrw2lQVwVddAW3tv9ndwsD/zkivdDUxBb6zQBDZi1bVOFFKsJXYi5EbZ0rSZQnF8w5oNx2vdvgoVBI8fTNzz3qqmev73fv33PdgVZiToYrStahC/T+jasZ30wswZUugLq28J9ycEPR/WdMqPXMpC66R1xzZLB1TdstJa9A+RL3eM0B5FXTVnxupajpz2Mwc5hgwjtoGCJXGVsDXN7+AgIJid6XV8+uYtirHwb5EAnB7f20hg6w3PANGm6TEh/7Yb77VXtTpCNCCVfwPX+kWCeXw7P1w+/weZHYiDzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB9045.namprd12.prod.outlook.com (2603:10b6:208:406::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.8; Thu, 26 Mar
 2026 14:59:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 14:59:32 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 26 Mar 2026 23:59:29 +0900
Message-Id: <DHCSXDEMMPZ9.FPPFUV6AMU4P@nvidia.com>
Subject: Re: [PATCH 1/7] rust: dma: add from-slice constructors for Coherent
 and CoherentBox
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
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
Content-Transfer-Encoding: quoted-printable
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-1-5cf18a75ff64@nvidia.com>
 <DHABINRM1861.3HQ3J4IZ150F4@garyguo.net>
In-Reply-To: <DHABINRM1861.3HQ3J4IZ150F4@garyguo.net>
X-ClientProxiedBy: TYCPR01CA0136.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB9045:EE_
X-MS-Office365-Filtering-Correlation-Id: d11e2884-eee8-414a-8eb9-08de8b4849bc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|366016|10070799003|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	TbxmGYgXinb70r+NAuxXxb18UbgYK47rsvbD/TK1Wz0Co3dtjBGfI1XXBCfRy6Ii4mObM9dsCRrWIQOfOpQA+pS7AOy3Xeyua4IDz352PIr9wEJsKFviieTNpa9Jfqyshhss/mrySzF9KtaxAeIqIq2yg41SImi89ePfNQ/doaGxFVSBU7fokoU16D0rxru+rRIuSOBkjDU8Jal0sZkiZUz9eQmb93Kve5ZbhAPcioaD9UQJmpT/hcBXdTGJajCyRK4lJ+GLOT+SXmU8Vljtu0T4jOCvskfC6OIpBCqM0gSiAuQzHm1d/slLi8EUQPIeuleYXIFSnZWHBs5EVchFWiznSTaFarQZnAZ+D15d+ac6hstrLP40Hq303W46KZRw/LVboN7mHtkcNFdKsEG9FNkwOTDxlnDBmxdnAJhF9wzgZawpcLHqwmAEkowUyMw4xQ3FrRXttiay+ajLSZ683qMiT3Ay0RFTgL6tGHlLKF3CJTx2RH4/Y8HvJt1463Py6B+6GPZoQ+JUwKorZF9g+Hm2RnAd0XyFV89/J+D/asxKDhTfCSgdjEAZqmbhg33YbYp/JrIng9xW3+Rju4+Z9Oy2P3VY7Ja4hAVDvu6hZmOIMQdYpGq95tIR0PIFnGir9y/bzBLzR9ua1EA4Rf3SpQcN3+EQDStIebS74kPCkPC0iH310xZdjSB3Y10VwL9cpS3A35BsmPbAjLoLiXFUaDQcBlFA6GZQwjDEeTYFuzA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(10070799003)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MCs2bWY5MHVGYkJ5MCtvQnV5ai8yYWtvL1NTS2lGMzB0OHhzdHBpMDZycHpp?=
 =?utf-8?B?OFF5WlNtd0JXNTdiSWpjUkdMdjIxZXgwVHBlcFNIcXQ0K3kzOHI2UHpjZU9r?=
 =?utf-8?B?TkhZU0dHbXR6dWFPdUtlakc2dXh2QnJiZTQ5WkR0aGpvU3QxUzFldXdnWGwy?=
 =?utf-8?B?V0FITFpka1VtdmpJQzFOOXlCWDlrY3c4bVJldTFYOUpBU3pFSE40RTlsd0kz?=
 =?utf-8?B?Tk00QmtEb0dMMUVJMG5PMjczdi9XVTVmZ3IwNTFHL3BoUkhPblhLMjJWa3pl?=
 =?utf-8?B?RXpMSG9HR3lpbjFNMUh3ZlFIKzRPT2dmcTloWXluS3VTVGJ1NHVlR1I2cjhF?=
 =?utf-8?B?T281aFhqZjY5OU1XQ0dEMm9sZTdKZENmUHMwOU50bkZVNzVDdUk3aDEwYkxq?=
 =?utf-8?B?NHhhY3N1RUo2dklTaDR1dkRsUGJKQnEvMzJTempDeEpBMlFkTWN2VzZXL3Rq?=
 =?utf-8?B?OTFaY2k2WS9EbzdRZG5LRjY5Q3NnUWlsdE0vK2dqUzdkWWNvTEdIMVJWbmpB?=
 =?utf-8?B?emhCUi9sWFR3TzNMUVZSMGRqL3BFOCszb01EZ0hoWDNESXc4MWU1bFJkOWFp?=
 =?utf-8?B?NmJBOVdwSWR0Q1dHYjlqSWlsd3IwZmw0NWR4QUFRQ05JelZTWndra1Z4a0Zy?=
 =?utf-8?B?WElpZnI0VzVjaXA0WDVPZHJ4WmpqTm5SN2JiQmtSTVNOUTZqRlVDUTNSQ3J0?=
 =?utf-8?B?ZVEzdGoyT1psNklqaE1BMzlxa1pRdVpBZmkwTzJJMUU0NkdWS1lhNStyK01q?=
 =?utf-8?B?NllkdUNOR2orK3RUYy82aDVOZE5rNEJkNHUxNXBZQkZ3SGdHWFFwc2FtZDBD?=
 =?utf-8?B?bkVwTHZZcXQxeVBnckVLTWd2UTN6ZlA5d2tKVzVGV01GN0hsOUpIY2dFUCtR?=
 =?utf-8?B?c0hjV1BVaUJ3Z2hVbTRXdkdRZnE0Q0VXRkwvZ0I2eWI5OFN4bm1PbFgzUEQ5?=
 =?utf-8?B?QStQQWIwbDlqQXBNT2E4VU44TndQbjJyemFtNkxZdllib1FvV2Y4alZWN0M1?=
 =?utf-8?B?Z24zYkR0Ykl2WW0reDlZZFc4aHcvaENJekpOa0ZOUFBUUU00U0lEWkJHQXo5?=
 =?utf-8?B?eDZSMFgwVWZNOEVCcXVtbUlDZTdyU0NzVlk5RWoydEZLQ3J1U1RpRVJaUzg1?=
 =?utf-8?B?U3VhMVVnOGRVWHVxcDVueWZkaTdjOW5DbWw2Vk4xTmgrMitLTndMU2VCUjBm?=
 =?utf-8?B?Tk9sZ0pkRitUd3FuYkZUZFFDRXQyNmRPUjZGV2hSMlYxeTVGWGVOTzZ6MXEy?=
 =?utf-8?B?L3lKRnhpM2VJd1Q5Wno3STZxREh3NlQ3d2hHZzRXcGFua0RvN1dIWFJkRlpP?=
 =?utf-8?B?aks4Mzh4NHVzUGFEWGk0L2w2eGErcEFrcFhMU05MSVQycGdpNHB5cGtrckpP?=
 =?utf-8?B?TG9uWTBFWC96OGFLMiswM09xRGVhR0dqMTRUMys2UzE2Uk0xL2t3QW1jTzFV?=
 =?utf-8?B?MHl6SmowOHhJeDdjVEFaMVhCWVhGWENhNmZQQXBjbHpnOW5XNHhxN1NsK0Fu?=
 =?utf-8?B?SHNzeTlvZnRIandyTHdDS2laZmdyN0ZTVFg3OUNSbFRuNUxqdnZvUWNvdWR5?=
 =?utf-8?B?RXNWUEt2eGNyNEVzNjZKRHlGbWxtMFE0alk4elo1QUpDRXIxOUtFQkVJbXFa?=
 =?utf-8?B?bDVqaUIxYjJTRmRpVTFtRUVXUWtzV0dQR3ZkTnNmMC9lck1Oc25vclIyd251?=
 =?utf-8?B?UjI1OVJlSjF5WlpjRnA5L1JxTXRyeURkZThKZ2s2TjNKVmsyVEV1VElEOEYy?=
 =?utf-8?B?Z3d1YUZ5R05wd044MFZRQ2hCVDQyWklhSDBtcEdTMnpGQlNWVTNPVDV2L0Yw?=
 =?utf-8?B?MjlLZHViM0VwM0Y5b0NzLzlkZ3RNSjBsTjVDWGMyU2psQ0ZzTEFrS3pwVWJi?=
 =?utf-8?B?YlBqNzJIdmJUVlNlME9ZSjNnRUExMEJyQS9jT1VoR1NiK3hudDR4NXdyWDBq?=
 =?utf-8?B?WGNHNDg2RFlCT3luaE85S2tFSjcrU2hHZHRlMVQvYzM3bWk0bjdpaXhVUDhi?=
 =?utf-8?B?dDJtYUlEVXZtVXRkME1aNGRrR044OHBIZ0lJQ3JaZ0RZbUpreFMyQnJRaEZi?=
 =?utf-8?B?b2NqcHZ0bkZEZVBsTGROTmY1WktqUnd4WTJLc2wwT2R1aGFFeEp4bThzWGVh?=
 =?utf-8?B?dGdaMTYzMEsydUVXTkZhT0ttM0hSTU4zaUJkQ3RMaVBHNEZyOGV3LzFPQ3li?=
 =?utf-8?B?d24wTjZUZ1VveUZpelV3cC9jeDRGajNhM1ladDZQSmlRZjFpbThBYWtGV1BE?=
 =?utf-8?B?d2pxMEU2U0VoQkpzVFVDNHRGa3NmM3YvbWVvUlhWQ05JMWlqWktmTy9udUNK?=
 =?utf-8?B?UlhQZWNwd1loSE5mcy9WaCszRUtLNlo5L1l3cjllVTFUdXAwai9kbjFWVjJp?=
 =?utf-8?Q?Tykcr11RPlNPJCqvxmrVFVP9n2BaLlo4fWmd5BNWuBWX8?=
X-MS-Exchange-AntiSpam-MessageData-1: 8mHI+qxmxdP/fQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d11e2884-eee8-414a-8eb9-08de8b4849bc
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 14:59:32.7386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuB9eyFRdQl+lJTQ+T7NctrOgFpDBqXxMu5vAdclM0myVV+468IuAaZj4eMDPa1P8RkJL8l10qeiM7qDJGUhpg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB9045

On Tue Mar 24, 2026 at 1:55 AM JST, Gary Guo wrote:
> On Sat Mar 21, 2026 at 1:36 PM GMT, Alexandre Courbot wrote:
>> A very common pattern is to create a block of coherent memory with the
>> content of an already-existing slice of bytes (e.g. a loaded firmware
>> blob).
>>
>> `CoherentBox` makes this easier, but still implies a potentially
>> panicking operation with `copy_from_slice` that requires a `PANIC`
>> comment.
>>
>> Add `from_slice_with_attrs` and `from_slice` methods to both `Coherent`
>> and `CoherentBox` to turn this into a trivial one-step operation.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  rust/kernel/dma.rs | 102 ++++++++++++++++++++++++++++++++++++++++++++++=
+++++++
>>  1 file changed, 102 insertions(+)
>>
>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>> index 6d2bec52806b..a5cc993c919e 100644
>> --- a/rust/kernel/dma.rs
>> +++ b/rust/kernel/dma.rs
>> @@ -453,6 +453,62 @@ pub fn init_at<E>(&mut self, i: usize, init: impl I=
nit<T, E>) -> Result
>> =20
>>          Ok(())
>>      }
>> +
>> +    /// Allocates a region of coherent memory of the same size as `data=
` and initializes it with a
>> +    /// copy of its contents.
>> +    ///
>> +    /// This is the [`CoherentBox`] variant of [`Coherent::from_slice_w=
ith_attrs`].
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use core::ops::Deref;
>> +    ///
>> +    /// # use kernel::device::{Bound, Device};
>> +    /// use kernel::dma::{
>> +    ///     attrs::*,
>> +    ///     CoherentBox
>> +    /// };
>> +    ///
>> +    /// # fn test(dev: &Device<Bound>) -> Result {
>> +    /// let data =3D [0u8, 1u8, 2u8, 3u8];
>> +    /// let c: CoherentBox<[u8]> =3D
>> +    ///     CoherentBox::from_slice_with_attrs(dev, &data, GFP_KERNEL, =
DMA_ATTR_NO_WARN)?;
>> +    ///
>> +    /// assert_eq!(c.deref(), &data);
>> +    /// # Ok::<(), Error>(()) }
>> +    /// ```
>> +    pub fn from_slice_with_attrs(
>> +        dev: &device::Device<Bound>,
>> +        data: &[T],
>> +        gfp_flags: kernel::alloc::Flags,
>> +        dma_attrs: Attrs,
>> +    ) -> Result<Self>
>> +    where
>> +        T: Copy,
>> +    {
>> +        Coherent::<T>::alloc_slice_with_attrs(dev, data.len(), gfp_flag=
s, dma_attrs)
>> +            .map(Self)
>
> I'd rather just use `?` and not use map.

Then it looks like this:

    let mut slice =3D Self(Coherent::<T>::alloc_slice_with_attrs(
        dev,
        data.len(),
        gfp_flags,
        dma_attrs,
    )?);

    // PANIC: `slice` was created with length `data.len()`.
    slice.copy_from_slice(data);

    Ok(slice)

FWIW I find using `map` more elegant, but I've made the change for v2
nonetheless.

>
>> +            .map(|mut slice| {
>> +                // PANIC: `slice` was created with length `data.len()`.
>> +                slice.copy_from_slice(data);
>> +                slice
>> +            })
>> +    }
>> +
>> +    /// Performs the same functionality as [`CoherentBox::from_slice_wi=
th_attrs`], except the
>> +    /// `dma_attrs` is 0 by default.
>> +    #[inline]
>> +    pub fn from_slice(
>> +        dev: &device::Device<Bound>,
>> +        data: &[T],
>> +        gfp_flags: kernel::alloc::Flags,
>> +    ) -> Result<Self>
>> +    where
>> +        T: Copy,
>> +    {
>> +        Self::from_slice_with_attrs(dev, data, gfp_flags, Attrs(0))
>> +    }
>>  }
>> =20
>>  impl<T: AsBytes + FromBytes> CoherentBox<T> {
>> @@ -827,6 +883,52 @@ pub fn zeroed_slice(
>>      ) -> Result<Coherent<[T]>> {
>>          Self::zeroed_slice_with_attrs(dev, len, gfp_flags, Attrs(0))
>>      }
>> +
>> +    /// Allocates a region of coherent memory of the same size as `data=
` and initializes it with a
>> +    /// copy of its contents.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// # use kernel::device::{Bound, Device};
>> +    /// use kernel::dma::{
>> +    ///     attrs::*,
>> +    ///     Coherent
>> +    /// };
>> +    ///
>> +    /// # fn test(dev: &Device<Bound>) -> Result {
>> +    /// let data =3D [0u8, 1u8, 2u8, 3u8];
>> +    /// // `c` has the same content as `data`.
>> +    /// let c: Coherent<[u8]> =3D
>> +    ///     Coherent::from_slice_with_attrs(dev, &data, GFP_KERNEL, DMA=
_ATTR_NO_WARN)?;
>> +    ///
>> +    /// # Ok::<(), Error>(()) }
>> +    /// ```
>> +    pub fn from_slice_with_attrs(
>> +        dev: &device::Device<Bound>,
>> +        data: &[T],
>> +        gfp_flags: kernel::alloc::Flags,
>> +        dma_attrs: Attrs,
>> +    ) -> Result<Coherent<[T]>>
>> +    where
>> +        T: Copy,
>> +    {
>> +        CoherentBox::from_slice_with_attrs(dev, data, gfp_flags, dma_at=
trs).map(Into::into)
>
> This function can be inline as it's just wrapping another.

Indeed, thanks!
