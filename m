Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011044.outbound.protection.outlook.com [52.101.62.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E35A34F484
	for <driver-core@lists.linux.dev>; Sat, 28 Mar 2026 13:03:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774703004; cv=fail; b=lfalEyQo4o4O8ca04jMsWpWQ61o8zm9JTXyH+uJ4/7pb+mqyvZWQBl74K2E4YU/wpZ40zIb5z/8p55lyzzO3JklAcr+xPMlZAtzKeFuCaJNYuNM6J0B7JkDnw8TC+9Nw61K7X2avouXR2pwynvLnFh0pGygle0IJ+ek6yUKLheE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774703004; c=relaxed/simple;
	bh=iIEOxyPGuoJizLwKGUFp6X4eVpj6YgluTM5CCPUIZ4U=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=kxpxhSnjmy/dkscLJo9jnLBV1wvVe2B7+KZ5PQa0V2mhs9boV8LALJCrFu0/aIgpNcH2/sSNVDvduA1GBxn9vo65+Sdr1oL4WaXSRWQ9MiE3ppShSi1qfKtfKafKVk0mVqHj98ivDuOnoT6YYxCIPZcyxAPq2lGKdRoHsPbWClY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=uBpIyFVp; arc=fail smtp.client-ip=52.101.62.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="uBpIyFVp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=natZy4cpyOnD04hapRk35wyLA9sipEsfsYM3sUa21g1/Fcqonmjr0lFJPtk48Gfyxw7tSTrulXBpqGxIaC/o3d6A7jLXxrETFpoExBzgNsQLuvgMOOCW/QE1/U041ang+x1X0LF1Rs+mTHYsGXz6rqj9ZL7kWZHMnNrz6y1IY9AY7uybrhRZ9Fo2eetuJmaLdoBrP14fV/ruB77PaM+4ZIWTz6qy+WSTVHfaWPgUsnr+qbv0KHRzzCoVTydrTCN9oLixgmzkYmoGIP+Fq3/MRMUc3P4YoBIjMph7RAXS2SkP9IMNwfm18zpeciLLKBTzJAhrbSTw4T44e9OeKTN6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJfChJ/OUEh7Ha6/pbsgoRfk6XF4Q3SbD15kS712JtE=;
 b=H+BQKELKdg3C3DSehxttsWtut1A2Ol89JTh1KRaL/KYjQe7g0uJZq++G3x7WlxI2dpEe1Q29bDgfJG6FS6Xxr9PGCYWIbM13pq3BvecR01DMjE4yNEbFhb0viqZpn8gJIA6Z4IQP1jjh53EU/kIKgCHgCG9m3sH3CsIvU6uxIby8dN/Vepo8LnaOVMe76J2bcqXC7pSDwTACnYOy+4eXL+jQo5ce0IZFKbTe2z3hcTCDBcZ7yIxmLTeTgvEBS/VJFsh3mqhgli0830G1aSh1Ec56vAojL8aXYpKR9FaBRCiEQ1OaeyUHiS/2l4kwxpJmfR9L60Lm7YK2PP8GiNf9mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJfChJ/OUEh7Ha6/pbsgoRfk6XF4Q3SbD15kS712JtE=;
 b=uBpIyFVpWb6qwQot7d5Y/Y2GJFoXpd+JM7BUzbBVOCA9n4AIAoYD3WPSQTaELbwd9E/Z5c8Hj9DGlrdef1XmneW8C+b9LfFKFNznvs/pdIy8S8A0UF0ZUT0ogNc5DA6wo3pikZoX/UGt8mBkxNWzZN0wW+oD5AAvkrl8wgCFV6PnY1WySQBJ92gpZDfy7DZm91ADvhhcPLWyYqzd1W6Hv3CZIBND3X7D5Y/k8Bj2eyHmwisJ7yNrfwovUCeqoa2OfnbpSIoa41m5kQtJ0ulu9PEHn1vDXx0mE0cjDaMqFVWkeDyIclZYwmiu0Gjm5EbfXxhiTmHqhAbHL4gcI5SFVQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LVUPR12MB999160.namprd12.prod.outlook.com (2603:10b6:408:3a4::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.11; Sat, 28 Mar
 2026 13:03:19 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Sat, 28 Mar 2026
 13:03:18 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Mar 2026 22:03:13 +0900
Message-Id: <DHEFPG4FA0PQ.1JJL8ZN4NO5C@nvidia.com>
Cc: "Eliot Courtney" <ecourtney@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] gpu: nova-core: falcon: use dma::Coherent
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Gary Guo" <gary@garyguo.net>
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-4-5cf18a75ff64@nvidia.com>
 <DHBI0S0S5II8.46GSKUPRD2X8@nvidia.com>
 <DHCT0W1KW2YP.32CR750RI9AMB@nvidia.com>
 <DHCTOSE1W9HC.T5EJ8R91LYAN@garyguo.net>
In-Reply-To: <DHCTOSE1W9HC.T5EJ8R91LYAN@garyguo.net>
X-ClientProxiedBy: TYCPR01CA0156.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LVUPR12MB999160:EE_
X-MS-Office365-Filtering-Correlation-Id: 8f6ae391-e1b5-4cb0-61b8-08de8cca613d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|376014|366016|10070799003|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	hXt7czsc8M4w0jiA8DEocQOPvC+6+L3HCVVN66V3PqGK/m3DOO568SxNYcwbp0CQ9FJDcmj5zRagAp8EVVIFkDO6Wn7gI+rJFU/OTLWZDIdGkIxw5VcOnoSLXfpaUP1Fo4CUCv1f1s5Sjt0b1I1ZN+7JmYO1A3PsCATcDfz5fEHNnP1t+pJbr5MfBMueBTcL+1U+vZYU79gR/VxnXqrTQcJMuumIMHkzrBI8R+Rps7wKQUhyFlx1pxxqG0MtRSdQXqKfCFRUd+f45otVHiN6ClJ6VPM000wES18JRky7ZIKPG8kyd0AYTmvVpJT/MwQ8g6xnlZaARC9ewmsqzY2FP296/ufToaKp9vj0ETTRo39hXwiyP2WN9o0o7KeY5LMOndhCXnbQp6ZgYuSoWvB70U3eCf408+UkPrtJ2bzaHnP5U+f3mnkDYIXJLD53S+0B1homt82OBOCmDBgXVzas4Ml+feRfCVC+VMiGmV82jaVWMgIAfluMqhY3MKd4yYVhyt7d6b3VoF5W/qVCAFgtoguvFv03QdN08bpfalduN8M6EFpDCi1troduCUCc4t/3fcEzjtYeCa25vmtFxW1904uNcOkxldL05Iaoe3P0rfBKYfhl5nz3aiDRYKB355BJw8SylbHNhWAqztDWhmu093XhhUZ1AYpYYy1zFEDn1M5RjV/t88oCehLSAHBMbt1oKHJ4FaKQBaRxoib49eNchI+ThX2xsdrZpgR+SzQMu5U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003)(56012099003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NGpjMU9wK2wxbEFIWHZrN1NJcXBXRE9RbzNkM2pZL3MzWjRzcXpRdEhhS3N1?=
 =?utf-8?B?TXhabmlsRXNMVVkyV2VUQ29wcDRJcFVkOFJIdEQ4Zmd2YzUwNldpQUhrZUZR?=
 =?utf-8?B?NG43dEdrWjU5YnV4YTcyRG5UdkxWMW50R2lkK0RUOGZRMmw0aGNYVlltdjVK?=
 =?utf-8?B?bW02V04zWmxVWHRDWGxJNk0zVWkwQVJYZ3dyTDhmd3hMbXY0OFFPMDQzeUM2?=
 =?utf-8?B?cFpFcWFFa1VZb2MxcUkzLy93UmtBalc0WUVzV0JnUWdDT1daWHo2TzZNNklk?=
 =?utf-8?B?OTZ6RklGQnp3NFNwTkFaa2VNTkhKY1hNRFFEaFh6eEwzMCtkVGZybzdJYTNR?=
 =?utf-8?B?WlErYmtBYXFQVHJDU3A2Z2xzb3VJN3NoMXdYallCN0JGZWhjK3BmWHhvelZk?=
 =?utf-8?B?cFNIeFJNeDl5TjlVcE1iR2FWeWEvbUxBY1BWZHBvZU1VakhmSURRb0xRKzFp?=
 =?utf-8?B?bkVQclNPdEw0N3FPa01hRlZkTGU4QzU2ZjZwMmxwTmFHTU5iais4UGp0TmFK?=
 =?utf-8?B?bkxkdkhRUUg2SjNLNW1mY3hkUmtYWk5IMXNKVGp4OU50c01NK1FPaTZSbTQz?=
 =?utf-8?B?WTVRdUxmWXpGNWZ0TnpzVE43dWpuYkRTZkl2UDc5OWlwUWNIVGFYYWR2V3Bs?=
 =?utf-8?B?L21zR09BbWtFT3kreWF2NmpxMHhxM2FlS2ZwRlJoeXdBemt1MTdwODlrRFZD?=
 =?utf-8?B?TGtrcnlwZHhUcXpXZitNK0s3UnlZb0dqNW5aU0dXSElkK29pYXEvYnZKeUxL?=
 =?utf-8?B?a3lHTDg0UUZ0UWFUVGlwUy9YTFRtMFFqWURwOVg0NWZQMURSa0paSGIvRlFX?=
 =?utf-8?B?M25nS2pjNnh1SWpNcit6VThIaTN5VWxVa2kzMDRvT09qV2hJWDgva05tUGxM?=
 =?utf-8?B?R1VSRE5yNWlIUnVVY3VuaHo0eVdDTEdlKzJsR3EvQzVpb2dTbWRrenROa25U?=
 =?utf-8?B?bXFXZkVscEg2ZWtheGZSL1ErS05uQk5FTDBjQmpvVk01aWl6NmVlTElhQWxY?=
 =?utf-8?B?VFQ0YjF5UC9NbndSeDIvNlBKOUlYRXdqYmVGOHJ3WXIrc29RK09lYWk3UHhS?=
 =?utf-8?B?Y2gwNi9EalcwdGw1bXZOdEtIdFY1ZnlyQzFWSWhpVGNyalJNSjB2MTV6WGxl?=
 =?utf-8?B?T2xGS0NkUnVBUXgvQWMrL1RzTHNIMjBTRlFXV2dIeDROYkpaSG50cDZwNGlT?=
 =?utf-8?B?WFRhUms5YXQrT1RWUWZ6OGh1NEVFblM4OGlaTVN4RjFkLzRDN29TdmxXZ0t1?=
 =?utf-8?B?Tll0YTRweE9EeWUxSHlJSFV5VVViQThMWlhqTlk3cnZOZVBSWmZxbVB1V1Nu?=
 =?utf-8?B?RW5tMjZ3RjR3eDJ1TlM2eSt6ekRvaUVIVW9aYytxYVUzRGtCdWQxbUdLWktD?=
 =?utf-8?B?OHYzWFVKbjRaSUdFaG9MbndBRnVraFFOUzB5OGxQelJ6bUxZdDM1VmRYZElF?=
 =?utf-8?B?R29KMnc5MHl5QTIzWmNwM1hoTENTWHFxenBPMUErT1JjUHZhaTBZY0w3a3BC?=
 =?utf-8?B?SE5mSUd0dVRNK3ZxN0F1d09OdVdWSWRXcTFGSFRiL0YxRkZWWTRqVDdFRTFx?=
 =?utf-8?B?a2lnV1A5TjRLdzU3UEgyUEIrR01XRWlZVURLazdORVlsMnJneUxlM3RGNzU4?=
 =?utf-8?B?eVJjaXFJeWkxZ2JoVFE3Sit1R01NK000YmFLd2hZVHovYW5xMWlvUmFqNG5n?=
 =?utf-8?B?Mlp6TGUzdHBwdGhjQUtVSURZRk9obVpUMHMvazN6VUozNGhhRHdNZHJxaEZo?=
 =?utf-8?B?bEtmNVhtUC9wUzV4RW1oclFmeU5QSnBrQTV1L1ozRm9GLytpd0g5aDdIcmU3?=
 =?utf-8?B?c3liTHlsSTI2VmpHVkFaUXp2aEs4WmR6Qy9zYWhtcGcyWFhSVE1ud1M2TFhH?=
 =?utf-8?B?cFc3RFZITXk4ZXhBbHZVbnNWR2dkekdBemFrK2tYOXEvekZnMnlEa0lyajlu?=
 =?utf-8?B?TVNjOTR0OHBnUzR5NmNBZ2x2ZGJSOFI2ZjJManMxbHlhb2M1ZFVDR3J1S2VS?=
 =?utf-8?B?R1hwa3hPZjIwSVFQcmNyRHJkRUNucmF0cnhXdDBjTmhZSytxb1FXeGczZXRs?=
 =?utf-8?B?K3dvNVBVbWFsTjd1L2hLNlFhUzJpdzZjRS8rQXB4UFYyeUh0bGI1WXNoSmhj?=
 =?utf-8?B?NjBFbG9uR0NTRzg2UnJCRCt0WDFSa2U2bDZRMXlwYlptWGV3TUxFU24waXRV?=
 =?utf-8?B?MWNtVUIrc0Z3MVVLSmxRanBUYXNjWHU2NTZZK3hlY0w2Q0RkYTlyMHlUQWQz?=
 =?utf-8?B?U3AyVDZTOXFCWGtTZy9FWEdSWjVoUGt2cEh5NWw4aWJ3WUhTNmVpcU9mb0FH?=
 =?utf-8?B?VFVzUUxWWHhPUWhrdktPdWR1Mk8xVkZkK0svNXhIeUZuZlFGVTY4YkltcXFX?=
 =?utf-8?Q?jCCkfZrwXMhOzx1SiyUpK/glZhZTL02ycp5elDqyBfFUD?=
X-MS-Exchange-AntiSpam-MessageData-1: rg69EKr5E3UjvQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8f6ae391-e1b5-4cb0-61b8-08de8cca613d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Mar 2026 13:03:17.9088
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 84CLVQp+T37jl+vG0EbYGzixGcNa4KZcjCBUGxH0Cmxuz6ZdzOofgZP3K3tmoJ6o/Qf7qtJ7mCS5y4xY0IijKA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LVUPR12MB999160

On Fri Mar 27, 2026 at 12:35 AM JST, Gary Guo wrote:
> On Thu Mar 26, 2026 at 3:04 PM GMT, Alexandre Courbot wrote:
>> On Wed Mar 25, 2026 at 11:14 AM JST, Eliot Courtney wrote:
>>> On Sat Mar 21, 2026 at 10:36 PM JST, Alexandre Courbot wrote:
>>>> Replace the nova-core local `DmaObject` with a `Coherent` that can
>>>> fulfill the same role.
>>>>
>>>> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
>>>> ---
>>>>  drivers/gpu/nova-core/falcon.rs | 6 +++---
>>>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/f=
alcon.rs
>>>> index 5bf8da8760bf..f6239c44dd80 100644
>>>> --- a/drivers/gpu/nova-core/falcon.rs
>>>> +++ b/drivers/gpu/nova-core/falcon.rs
>>>> @@ -10,6 +10,7 @@
>>>>          Device, //
>>>>      },
>>>>      dma::{
>>>> +        Coherent,
>>>>          DmaAddress,
>>>>          DmaMask, //
>>>>      },
>>>> @@ -20,7 +21,6 @@
>>>>  };
>>>> =20
>>>>  use crate::{
>>>> -    dma::DmaObject,
>>>>      driver::Bar0,
>>>>      falcon::hal::LoadMethod,
>>>>      gpu::Chipset,
>>>> @@ -636,7 +636,7 @@ pub(crate) fn pio_load<F: FalconFirmware<Target =
=3D E> + FalconPioLoadable>(
>>>>      fn dma_wr(
>>>>          &self,
>>>>          bar: &Bar0,
>>>> -        dma_obj: &DmaObject,
>>>> +        dma_obj: &Coherent<[u8]>,
>>>>          target_mem: FalconMem,
>>>>          load_offsets: FalconDmaLoadTarget,
>>>>      ) -> Result {
>>>> @@ -740,7 +740,7 @@ fn dma_load<F: FalconFirmware<Target =3D E> + Falc=
onDmaLoadable>(
>>>>          fw: &F,
>>>>      ) -> Result {
>>>>          // Create DMA object with firmware content as the source of t=
he DMA engine.
>>>> -        let dma_obj =3D DmaObject::from_data(dev, fw.as_slice())?;
>>>> +        let dma_obj =3D Coherent::from_slice(dev, fw.as_slice(), GFP_=
KERNEL)?;
>>>
>>> Is it guaranteed that fw.as_slice() is a multiple of 256 in size?
>>> In `dma_wr` it breaks this up into 256 byte transfers. Since this
>>> no longer pads out to a page boundary, it means that it could now error
>>> (around "DMA transfer goes beyond range of DMA object") if the Dmem=20
>>> section's size is not divisible by 256. But tbh, I find it odd that=20
>>> `dma_wr` doesn't check that FalconDmaLoadTarget's length is a
>>> multiple of 256 anyway, because it looks like it'll write a bunch of
>>> unrelated bytes (since it rounds up to the nearest 256 to copy).
>>>
>>> Maybe we should enforce that `FalconDmaLoadTarget` length is divisible
>>> by 256?
>>>
>>> For this series if for all firmwares it's divisible by 256 then I think
>>> it's fine to leave this as is for now, but I do find the lack of
>>> checking in `dma_wr` (or anywhere else for FalconDmaLoadTarget) a bit
>>> odd.
>>
>> All coherent allocations are page-aligned (and use full pages), so we
>> are safe in terms of overflows.
>
> Let's not rely on this behaviour. There is no guarantee on what's at the =
end
> of allocation whatsoever. There's no guarantee that it will be initialize=
d.
> Even with __GFP_ZERO only the size provided will be zeroed.
>
> If the GPU is going to read beyond ranges covered by `Coherent` (not just=
 rely
> on the alignment), let's align up the allocation.
>
>>
>> Also `dma_wr` uses `div_ceil(256)` which will skip the last data block
>> entirely if it is not a multiple of 256. It might be a bit more robust
>> to explicitly check that the size is a multiple of 256 and return an
>> error if that is not the case indeed.
>
> div_ceil will not skip the last block, it will over-read beyond the end.
> div_floor would have skipped the block.

Ooopsie yes, of course. Making `dma_wr` check that the data is a
multiple of 256 is the simplest, I'll send a patch for that (with maybe
some padding code as I think I remember Turing at least did not always
follow the 256-alignment requirement).
