Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010005.outbound.protection.outlook.com [52.101.85.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA601EFFA1
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 06:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774246569; cv=fail; b=cRP2bhgT9c+n4T8u/XPZAE1OCHMIrn3NtTEACbMsXbgdkrbc22EVgwAL9O0z/mBcUmw8ImikXHFjmAm5W1QbVm+y+jw+58NLlohlV+D3mQq97WHBXsatKK/tYMVQxW4Ll8v9zLuCkCKYdqxmf6oxvcWuyr0xdzu85WWd2WBnFJM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774246569; c=relaxed/simple;
	bh=nlz1KMeH7sblLESY06OIjpsQpd9flIsBpLT1u/QlRX4=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=h8M8oTJnHkk2YRIqUU/7qTqqDb2UVY9WLokji4b3hohm6b+ckWgI9Jc/vsZ5kU1OWzzCzJzsPrYTLjBtRdcw75OMoEEr+r3/kLHz0WkaMshwo7Nv/w9a0Obm4YxXhyFe+xkB4b+aGhG+srwVVGtZde6lf518+Qk/zcNgER/BZMQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=e+2XzRMW; arc=fail smtp.client-ip=52.101.85.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="e+2XzRMW"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVkEwQqlRXeKaGDhISQ0n4sux7gWhqdDbZIBvJM3gZQu/hZxLJfFpvbqBRO8bfNN/qBpv5LIskA+n4VcSU+8G6vMcv3TRWrDFUBpQgF7HHALHRV6vBpE/rKBy3cXQ9aACr11GY8iZJedCt038/CYsZYksepYyEzaDtO81sHwssLSdb5HKhC9pcJ3/KF3Km0vCV0z5wdsaUSM1LuignqnUJ+IwDGrJoNM019Yci+NCX5RUXeaLX/tRALpcGq1JmWX91Jhtzdo/1dmf5uPq7WL/CoBLoSrv1QbYSK9/j+z9jgbJ5MuZusSLIH2j7f72jkm4ZeTUXOCe9Z8UrrWDdJZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7ZJHlY/Ud18yHkflhoIR2XLWoW0r3SjwbcC77LksIc0=;
 b=W5Zw9gsqvM5ynwS4NpcIrJcMm0G0SRWbXHvkHfqL0WbBqEKZYLEYz2t+ODOALWLTLK9zBjXkAkdBMkiQdhmIXYJBRC5d+aLavQ2LnpFxA1ZzNDWPaI8qnSw0NgvM3QsHiOxiv7TDyV6y5uDom6SvPzxodFevX1Ta62HSbZTUUSBsrHYMcGbtOW2hgnbZ+8UyKCCZAXIe5kh07EnhwwdAekmMP0R+YQPQvqgpYb0ir8UvDIYTHg2sk7Av1bhlH3JKjXtTKx34ZDHq3xhu/btNmwn+iHQkRfvoVka301crQAu6h3LJa+3fg8n1Jnsvru8Vprh/M4I6BLQk/tGLPd6ggQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7ZJHlY/Ud18yHkflhoIR2XLWoW0r3SjwbcC77LksIc0=;
 b=e+2XzRMW7AwRXb5u0fMLA7bCfzGBDIJBrxC7MMcGkBXf/Bd7QdupbD+B0nYKRZUZYJdaxeLhtHvEcCOUf+IrwkflYU/Hf+RUcguJnCgFQv7rP41xPZjVcOEGcnbPYXeNp6EakGAR80uUVF/EVzyzkFi4oRBhznuL5qG65Wbcmv65a0gwnS6I4RAlJHUqta71FBaI1Okddv+I4CrByOhfJGK4lTmGVCzhzzq3DS+KhOi6bA+ZZWbBy4umWW5ii/1H3luZDttCyRcx7vgSlEsrme2VFKiCCp0kIwy2TwTD7msOdwldk7Gjo1J2QU10TgqckXRTTxJTXtkZkNc3kQjJYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BY5PR12MB4194.namprd12.prod.outlook.com (2603:10b6:a03:210::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Mon, 23 Mar
 2026 06:16:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Mon, 23 Mar 2026
 06:16:01 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 23 Mar 2026 15:15:58 +0900
Message-Id: <DH9XWWNM1GY4.1W6N89W6UCYDW@nvidia.com>
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
In-Reply-To: <DH8JS2ASDOWQ.2VMYT7989OGXQ@garyguo.net>
X-ClientProxiedBy: TYWPR01CA0001.jpnprd01.prod.outlook.com
 (2603:1096:400:a9::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BY5PR12MB4194:EE_
X-MS-Office365-Filtering-Correlation-Id: a1599a99-c388-4af8-62df-08de88a3a7ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|366016|1800799024|7416014|376014|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	qL92a9wWxodQ+MKx0JkEGNF5Iun+CW9Ru34D0fk12mCGnYJfjOikUJHpzpwL9Gm8+isOv2vuIJgzggh5om5GMCg+88XTvaec9+PwVTW/7tS7Iv8a9zzoKxF05B4THNrgE+hsQ0A5BcDWD7t84RSrPSTUGzy6uS7DAQ+XWpydGQ3I+VoCVsijwl5v30BOe5jPr/1DSOXdYEWRQfIXz4daJ47uw33SKylBlyXMFrtLuh+WJ+P7a80RnijyhLuYFJmrqCkyfjk+FQbPne9+NvacpAGIC0/r+m3rQAK6+cGxbkYpPijbrpfFsu364kavk5J9XEsUD1iEaqxIoSN99zXsYWlS49NeGQg42CN6S77tHm24HfLNzLqMRMEXNrOaPu7UvosmOIjhingA/lIDE1rsz2zWGDqNc2szTyX1zYKEGejZ3iepykktvvk3hjt+3c4X53rUOBpcoEI7cOW5uyIRzsiFZ3UyCdiO/hbeW8aHLPnfqJO6uFVvQ1XUdlnnLvYXRPQu6UbumPzCrHAwUyK5UPIPjRBbbd/nYGcdBlFcn8vr3AbrS5h2gcAOXGyoStjVemjyiqccQXLuPJcEKUHe1ZfZAcSwGMaqPpgSqKwgctAIqfXz1BOS5ugz97v8bxouaInhggGQfMZncItomo1iDvX1dBTXu54eLCQ6/03GIRq6/DPrZFlmcfv5SQga7GGchFelOLvm16M8r8vMKcgYe1VJKhBvHJPTydOgGXv+ejM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R0VYbjB6NGNWWUlJYmxhWVdFWWFISkpmeUYrY204bHhVK01pbG1JMmZEbmQw?=
 =?utf-8?B?emFaY2ZZOVlHYXZuRmNWK3kzeDJWZ0VoQUZ3T2F0d2h1TXNsOTNNTVJzS2Zu?=
 =?utf-8?B?OHlDU00yV2piZ1YraG1LT0lWM2ZuREZkc3FqaHlOTmpPWWd5MEYzZzV3RTJ0?=
 =?utf-8?B?bVlNeGZiVjQ0N3VPRWFXQ0JmV0YzcjJaVGIxSmJtNUhNczFCWk9ZWXZ6MkMv?=
 =?utf-8?B?NERlSzZDUnNFeHk5bEV4ZlU0VTBhM01sd0dINjhsRE5ZSCtSZEExa3pwT1lG?=
 =?utf-8?B?VGtVNEl2MzVVZmFXMHlNbVlLMUpmWXdpVmtPQU1IUXdjTE5zVUlpSmlUbW9u?=
 =?utf-8?B?MnBJT2V2SXpKYTZ6TUhIRExSSk5SdmE0RFNWaFZ3ZmpTVGhWeFNiS1RtQUN4?=
 =?utf-8?B?ZHBWN1plUkR1R2JNbDUrR2FSNWY3R1Q4TWRsdVFvemtwRENKRk9DMmtSMllS?=
 =?utf-8?B?dk0xVmRLNEswUE1sYlQweUIrWVdOWjlIa0o4a0ZxdmgwQkJTNzZuY1FxRGxD?=
 =?utf-8?B?SnBZOGZZc2cyMkZyOFZjVzFEOTBjL094dlg5SENka0JKcXRlSWRRczhGcWo1?=
 =?utf-8?B?alNzd2JXMmk5UVdiNUNuZGpGcCtHRVgvbVFVR2U4eWpQUStLWHZEajVTanB6?=
 =?utf-8?B?OFdxWFhRQWtTdWNJUzliM1RqRXJMRGMzOUZDMVRLKzlydHVvWDVJKzIvSUdO?=
 =?utf-8?B?TVFiOXlScHByZEI2dmJMUDR5VzQxN205SzFWR2tVcnJDSmNKLzBiSURPRFlx?=
 =?utf-8?B?U3RmK3Nxblpad2tWYmFNdDhaR2JUUmRTUnZMTnFSNWlJWDRBUTRKczVZSTF3?=
 =?utf-8?B?WW5ZS1lmb2tlb1FtaGdpT1Y0RHFYTlg3MTMrVjVXT1NUTjRML3pvaXVpVVVw?=
 =?utf-8?B?WWt0bmtnZTlrUEdRL3YxWE5yYVF6Q0hxS0FKVGhGby82Y2dBN3VycENjN0ox?=
 =?utf-8?B?bTR6dlRzV0QxWWVMaFNUOXk3TEtoSEw5d2w5US9Ed3B3T1lTT3JTSFlMdEYz?=
 =?utf-8?B?M21PRFFSSDJhcCtoQWhqSm1QeWVSODE2WUZoZWJZYnpkeEtCMXZ5UGRxNkda?=
 =?utf-8?B?Z1hFTUUvV1RyNzNjUENnYUkzT1c1SDM5Q05zeXlhUnVxZHBONkVkZ3BEUlZH?=
 =?utf-8?B?dGhVZDFIUEdKSSsvVTliZUdncElDbUpaUHd4VTRxcWkrZGhPZG0relpTWEZh?=
 =?utf-8?B?bDBPNlZ5ZUV3eW9vSGk3MmNUM1hrTWhhMlJPc3NiTWJFMVNnbDZtdU9veHFx?=
 =?utf-8?B?VmQyVVREckluWkU2aW9DcFFzVFM5aGVjcnkwZ1ZUVXJuVXg4dDhPdkR6dXk3?=
 =?utf-8?B?amY1OWcxYlRNRXRaSkhPM2l3K0lzZUV0Z0NBRXdsTzhjK05TbmVjNU9lekNJ?=
 =?utf-8?B?OHprUDNBYnF3MjI2RDQ5bU1NUWovWEFvcFlnTFAxSmtkS0ZjNzlPZm02RTdQ?=
 =?utf-8?B?bFV4RzVodlZWT1ZuTHBlMmVNY0g3ZVZ6L1ZOU0dEOVpVeThGeFlYb1pLbmZu?=
 =?utf-8?B?SkFLR3Urb3F1SlRuTmpGb2JNZ21aWitUR2s2WDZYbDJPOEtPMEhnTEorUm9n?=
 =?utf-8?B?M1RNQUpCWnh0MUxHdDBGdjMzYVBWNDFwVFJhYUphdU9JSVBoRU5MelEvL0gy?=
 =?utf-8?B?b1lzNks0aFpxaEhRcFEvS2hWT0VLV2FRU1RyT1dZVEJkYklwV3hYRExJZURB?=
 =?utf-8?B?WHNCNitqRHRJRDRSU0xUV090KzlxZWFTNXU0SzBYaWpJTXcyNnNMTlFnWnlR?=
 =?utf-8?B?Mk5BSm92aFgxTGhzbUFTZU16ditucXpWYkJYSGZHSlh0WHBIWDEyYWxpdms3?=
 =?utf-8?B?bjQ0STZ2eWNmL2c5MUVraXRPRFBIaTZaamhiY2JMcUVFQjlqTTZreGVpc1Bk?=
 =?utf-8?B?QmsrdFF5TFJUcUR4eHJkVXFub0RVdENEUHdld2FnOFlWRkpMWVhPMFFSajdJ?=
 =?utf-8?B?MjkvY3lIS0xvOUl6MlFsanBkeG9zdXQ1aVltTkRoQkdNL2pMODg5TVR0RGZI?=
 =?utf-8?B?L0EvUTgzK2ExeDhrWGdCWnJTRnJuLzZpeFhRbThCVDk1UzJvREVaSkxDZ1J0?=
 =?utf-8?B?Z2liMXdoamwvZU5PbEFwei9FTkhaeHBZd2xmSUtGQXlwK3NqeVZJOHVDRnBQ?=
 =?utf-8?B?UURSeG9EQXhWRmU0S094TnZ2UmZJYlJtOHhRcXJhdHgvTitsMlhvWFBVRGl4?=
 =?utf-8?B?QkVKWjlpNmVYMzNJWEpIWm1KYTZsaWVkVVF6UldXWnoxOTl1UWkrQWp6UXNT?=
 =?utf-8?B?U2hLbVlqS1Y5Y3ptVkpaai9yY1B2eWs4YXJEcmlSQ2xXeEk0TFhYVmJscDc1?=
 =?utf-8?B?L3lzWUo0N2NBZ0IwVFpuVnJxTzI1QjF4a0lCcG53QVZKTmFqQjQxVVJacWY5?=
 =?utf-8?Q?LEoX6jOZFkxlmvqQEqL7UqnO3qTkPm9NTNamRVCDpNGKJ?=
X-MS-Exchange-AntiSpam-MessageData-1: 2LUDwH+qGVUvag==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a1599a99-c388-4af8-62df-08de88a3a7ff
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2026 06:16:01.6896
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CDVMXMALqPtltGqvyYn9tUqketFVaJYN7qvc/nCfrEI9QKkgxCylT8K5obfshvmRzRri+nvQtj+DIsgL7UlyIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4194

On Sat Mar 21, 2026 at 11:58 PM JST, Gary Guo wrote:
> On Sat Mar 21, 2026 at 1:36 PM GMT, Alexandre Courbot wrote:
>> Replace the nova-core local `DmaObject` with a `Coherent` that can
>> fulfill the same role.
>>
>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/firmware/riscv.rs | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-=
core/firmware/riscv.rs
>> index 14aad2f0ee8a..2afa7f36404e 100644
>> --- a/drivers/gpu/nova-core/firmware/riscv.rs
>> +++ b/drivers/gpu/nova-core/firmware/riscv.rs
>> @@ -5,13 +5,13 @@
>> =20
>>  use kernel::{
>>      device,
>> +    dma::Coherent,
>>      firmware::Firmware,
>>      prelude::*,
>>      transmute::FromBytes, //
>>  };
>> =20
>>  use crate::{
>> -    dma::DmaObject,
>>      firmware::BinFirmware,
>>      num::FromSafeCast, //
>>  };
>> @@ -66,7 +66,7 @@ pub(crate) struct RiscvFirmware {
>>      /// Application version.
>>      pub(crate) app_version: u32,
>>      /// Device-mapped firmware image.
>> -    pub(crate) ucode: DmaObject,
>> +    pub(crate) ucode: Coherent<[u8]>,
>>  }
>> =20
>>  impl RiscvFirmware {
>> @@ -81,7 +81,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>,=
 fw: &Firmware) -> Result<
>>              let len =3D usize::from_safe_cast(bin_fw.hdr.data_size);
>>              let end =3D start.checked_add(len).ok_or(EINVAL)?;
>> =20
>> -            DmaObject::from_data(dev, fw.data().get(start..end).ok_or(E=
INVAL)?)?
>> +            Coherent::from_slice(dev, fw.data().get(start..end).ok_or(E=
INVAL)?, GFP_KERNEL)?
>
> `DmaObject` rounds the data up to be page-sized, while this new API doesn=
't.
>
> It has impact on alignment, as the allocator aligns things to the largest
> power-of-two exponent of the allocated size.

Doesn't `dma_alloc_coherent` always allocate from the page pool and thus
returns page-aligned memory though? I'm not sure why `DmaObject` was
doing that but it was redundant I think.
