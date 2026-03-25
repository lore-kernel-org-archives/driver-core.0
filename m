Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012001.outbound.protection.outlook.com [52.101.48.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 951FE8F7D
	for <driver-core@lists.linux.dev>; Wed, 25 Mar 2026 02:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774404852; cv=fail; b=OV3Zh1m89qL/WIOUDQEDj+lTSlgGctLHUzzt4QQY4iai5zX6Vuc6YKV2Gg3GfihmrfuNvxjfpKUIHsd9D8hja1fpND4Fg24bzEbpQS3+7S4N5AqEqcd3Y4ZAlmYt59D/9hpLZF0yWJx8Zf5Pqqw6nZ1vLTEWf2xIomFtI8yr+6M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774404852; c=relaxed/simple;
	bh=T64cbcJvJFtvhZvzAO+nWMAa5a6dCh9SbKK7a6JHXCc=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=iRnStp/itixu1LPK+mSkQ7QLLZKlyrMxyTq7Sxa5m83vlsmKnTDMOej9a7XnLFhldMlmhLj1VXHK/1qUTZKq+BX52FlIlSUxkewi2KCVQLnjr24JHTCmNyBUVfvPDFaia8QDux/G9tJc3Xfk/hkquAl+Ndtt/J+Dwz70mvQcR+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QjovBNPJ; arc=fail smtp.client-ip=52.101.48.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QjovBNPJ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tgpn7V46P7tEmBoUd4dGrJNNMeMidqHbe4xqpLuMmks+GEEVrJM95el480+YtkDklbxpcJGxPROVB/n7hgwmpSG81IJjkekaIWTLTG/7ji6j5Ku0dTRqyYybztTR+sxxFiKhB518oAMgRC2nMQ9SQUkpdQGAQUC0YsPySMQnjX73Ot+xTDiZ1EpxvDHdung3+mtaX0Y7mGdnfYL10c75awVvy9Ou2gHm4YBEBTbdFGeunbejCVh0ylAeJt7eLdh2kmlMEPy8zj7wZaaMY4djb1qoU7ryTb6WB4Gt9xmrCmE95hFLpY1yzNRRZ5zmX5x8/HDjP3AVS0KiTY0e8cUZyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aqgA7WtanoscJkkZi1c/bbVNcZhQ4XWBzC2XqOAqW50=;
 b=YEYmsqAVPKawbI/nGr5p8lslCT+hAoGuUUc+LAoOlwGcJ5oMnsoEyJzSUy6gpsLjxyRsokwkt90vi1dTlWnduHuZjjg1yvZz3q3EZ8NI3Tpk8ANpeyNNGwOQE6CSfJjL+betlGEcLRpw/O2Uwpqnn1xJqWGcA2l9bggRV5WTAiO8YqS6F3KSudsZrlrQTzDegVJZ0aQENaXChFb47qojOHG7VzvnKBgB8JdKNz6FJazt5guC+Rgn2gF1RpK2zCdgPIt+3BAYU0fsjFyy6rN7L6uUqtKX0BqoVnfdKRH/G4Gv+KsX5xg4yWVhYGIsGKIAJuPQlWTrMc8bvAu1mA7IZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aqgA7WtanoscJkkZi1c/bbVNcZhQ4XWBzC2XqOAqW50=;
 b=QjovBNPJQzVewfS/1wcx6IBhCYRJOkdxqvE0Kl5lRvwPg1j0vj+R9xc5hmb5CaIK+cZQizOVQJPGfor8HYtlGdZ5erDs8nnuy8wonCJIJQ1g0uzltzuwv1cx0l1wh2pjmie4oxKZ/28SHHK2qVUTyxOkfAUqDNezzPo9rijivlo0BqRt2NURldv7yNYr9Bw44fTIbYuRglLOYviIufPQk0d9GIY2E2st1soSBfK7cdbk5cITqpM5dd9s40NTGnE9gXSS79f74tK6nkLPbdw3RbDc6rGRDooXsiL3pboBsD207xd/y4+y9XBsS3sPuFilGz1wTCsUv2tMRNiul+fGcQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SA3PR12MB8437.namprd12.prod.outlook.com (2603:10b6:806:2f5::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.20; Wed, 25 Mar
 2026 02:14:08 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9745.012; Wed, 25 Mar 2026
 02:14:08 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 11:14:03 +0900
Message-Id: <DHBI0S0S5II8.46GSKUPRD2X8@nvidia.com>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 4/7] gpu: nova-core: falcon: use dma::Coherent
From: "Eliot Courtney" <ecourtney@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-4-5cf18a75ff64@nvidia.com>
In-Reply-To: <20260321-b4-nova-dma-removal-v1-4-5cf18a75ff64@nvidia.com>
X-ClientProxiedBy: TYCPR01CA0140.jpnprd01.prod.outlook.com
 (2603:1096:400:2b7::10) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SA3PR12MB8437:EE_
X-MS-Office365-Filtering-Correlation-Id: 38ad4a4d-cd8c-4dcf-db7c-08de8a143214
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|10070799003|7416014|376014|22082099003|18002099003|56012099003|921020;
X-Microsoft-Antispam-Message-Info:
	kqtlIGH7HI+U3bDFmO1C81SxIXwWHaqaOhvgaY1Rf7p7Z3Wb53Zb/TnX6CDOEk8GEQeJbQ7CxB98Wy0JFglQmvqJs6z3hVyi7PJcfNsU+HPs/WWScKuJpjdcyZe70AW9UvpCzpfLzQLtCBJLxCR4+eeWvwBgo4AhHisgSm3puAlLqKMi2SGO2cro6iy/yBea4ALocGqpu4pTdij8bVlVgqtvCEd4BydpxJwDWAbWRO2LhPx1gDa6ejmgPYRkl16+MLBpuFdd6ak92VaqSjRA3aOVx6mYc/JuF4Uxlp2DZ8AHCxI3uL/Pub01JBiM7U/CQnG0Dq8v1530i/8zVfSp60vOU+eR10vB/Y0ukfgNs90e/ggYtFXtjLraFUFwTuuLLkZuqD2KUwsRzRXDaOnBr/cX1pd1zqZQKGou3n2I9UeCdxN7FNMbQ9gFcc2T8zvDRgIwTxD1UuLOccIroiiR/KaSxLcsMIvPRy7/2TZtq2d0/m5VyMlB2oa8TTsuil7DZgCF67EWDdx8K/ifB05rzUORr6eHyTN3Wxrvk4l/aFgzPHZ3W6t75tahJ+XE0mhxyEOoBmwXSlPZnGlpf1eMr4UcgPH2RTWzUMqRy99qmkUicPpgVttnlNPs0d45eBNf6RzUAJBiaWkAwR4ck+gTjfzKtXzQ0xZx7NSoMFFX3BDsHwN4Ead7JrIneqP1NGNuOy/jVAXY8rwkndAUz9xmgg2Dl4aokYH9uNRfK6XojqwVkn5sL9pi2bUND8ydhgwR2Ll33FfsLNhgdFxSVx2TdA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR12MB2353.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014)(22082099003)(18002099003)(56012099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWdQTVA1Nyt5SjRBcGRFb1ZrY1g1cHZ5ak04UHBJcnVBKzJlVEtrMHo3ZDhq?=
 =?utf-8?B?Rmw3amtKU3k2ekE2Z0lFcWh5OXc1ZlN4bUNzZEFTakMvNWNEeUdIZ0svQ3RC?=
 =?utf-8?B?RkxzWWRVQUhKa2xrUDRqWTNYNlVwWTRiUlFqS1VmeVBTOVdvOXJ4U2tCaVdI?=
 =?utf-8?B?RTJBbm50VlArN081cFNsaW43WXZzZkxKbWNNOXpyeXRqK3hjRk1kc3g1amtQ?=
 =?utf-8?B?NWVpWjNFZ0lJaGx3dUU0T3FpRHhtWjhhakVYbTQ3RmpTR29jMU9jd3p1cVNI?=
 =?utf-8?B?S25nOXNXb1lYSHJVYnJmbDdNNFNHM1Jybnd1WlA3Mmd6MGVralN0ZGM2WFdj?=
 =?utf-8?B?OUpDT3hTZVp6UHYxM29XSDN0REtJQ2RKa2hMcG5sT3FnMG1kOWs4cTA4NlZY?=
 =?utf-8?B?TE9mU0pMMHVwWjNOY0NWclM4NURjQ2V0dXFGWWQ0RlVzTXp5eHVaMG1DNThy?=
 =?utf-8?B?WlFDck9DK3NBMm9QczQrQmU1SURBTFNYUzI5c3ZpdlRQQ0JGQ1A1YlorcGpw?=
 =?utf-8?B?ZXFHVHdRUFhQa1JoRFphTU9Ia2JzYk9kNEZJVGgvS21SV2RIOHNpVzNyZ0Q3?=
 =?utf-8?B?Q25wRlE2MEw2NVZnMXRvcnVtQXZyWWNjOTdsUDcrV0ZjcmU0WHpqYkdmN2NB?=
 =?utf-8?B?RnkxdDRnbzVjakpPeC9DOW94ZGd6K2wyNzZDNjRqbTdoUC8wVElWY05KNDRM?=
 =?utf-8?B?d3NZQkM5dDdjZXNkSVV6em9YVGRvcWltQ21ydHZvZko1L3lrUk9JZm45d21Q?=
 =?utf-8?B?ZWVQK3JVeGF3d2NRU2JMckJMM2xpRjNsRkYyTGtZek9jQUFGV1g5Y2xXSE9m?=
 =?utf-8?B?MVhjRkFLeEMyK1JWWjZpYllUZHJmU25hbVNiTGVzdWFFWGN3eGVwUkFtRG9P?=
 =?utf-8?B?b3hRNWZEOVJBZkJoazI2SkRJYUk3R2hhZzlISnNDd00zN0ViUCtIaGhoUldT?=
 =?utf-8?B?dVpOcFdmTVE1c1JNT0w3Tjh2TkhNUzVhZWxleU4zbzMrRWQ3VXIvQmVKeHFT?=
 =?utf-8?B?eFg1bTg5cTVJeVB2WDJLRVB2NnE4dSt6d2ZIV3hRbVFlaTBFREw1UnlLWE8r?=
 =?utf-8?B?dEtJaFNWWHdOdTM0QVBhVWdzVlBqUVdNbEJiWDdKcHMwLzlySVhsSnJkS3Zv?=
 =?utf-8?B?UVA3M056dDV3MVpQSDhtN2RCK2pldXJpdm9hVFY4OFhZRkFSYzRxeE5oVzlU?=
 =?utf-8?B?RUhvalV4eVVJcWF1SUJseVpCYWRFcHgxNzE4emw4S3JkNTA0WUp6OWxNRG5C?=
 =?utf-8?B?MFp2WXpFMnd6ODIrZjkzcThFKzF1SFdWZy8zQTBkUTNvVkxJeUIwLzVSTG9k?=
 =?utf-8?B?dXd2RElxYnJxNEswZTZVQXV4Q3BHNm5mNlZwaW1sMHNUZzJUdzAzeDVIQzNE?=
 =?utf-8?B?R0FvV3JkaGZNNmZ1OStENzY0Y2YrejZRVzE2NGVFTnVzZFJUUS9UVlJENXhX?=
 =?utf-8?B?c00xdUsxNzZ4eHhETnhjVk5wYVMrT0swNkgyY0hFa21VSzBoL1ZwVXpmVllH?=
 =?utf-8?B?aEl3MkMzTjZxMzQ3OUoyeFJRU0d0dmduNlhpajZmQUI5R1hnODF0REs5Z0ls?=
 =?utf-8?B?cUxBZ3BHNEU3UU5kL2liTDdTOG5NbDhpcm90eG50cUlzUlBzbmhNNU1FWFlJ?=
 =?utf-8?B?ZCtSbXhRWm15RFkxOFFwRlhvaXdybGdUWk5WVVZrTXg3Y2FlMVdCekg0WTdw?=
 =?utf-8?B?N211VEdsa0RpRXgyUUdEOUxLMFI5VVV1b0tnQmZtNHIxenhoNkRDemQrZzYx?=
 =?utf-8?B?eGl4N1FreXVkQjJidm9iazk1UG9JaE11QWNmOFp3QXR6ZDErdHJadE9FaGND?=
 =?utf-8?B?ZXV1cFVURVM2cVRlekRvRXZzTTlPenhGZmRlZDExVml5UlpBdGNJRDJaV3pL?=
 =?utf-8?B?eGlEckk5VHNQV205SGZoK0p2YlhKZFJnTXFBSHVvV1JvcHJUREs5SEFRWllG?=
 =?utf-8?B?Tko4WWNNUmpCUnNVczh0cDJhVy92eUEvNkE1K1hCUE1Cc0U4VjcxY2YxTTJM?=
 =?utf-8?B?YWFpOFdReGxiT0gvMXRMZnJCbGorcmpBbVVtRnNGb0IrMERheTU2MW9KTHh0?=
 =?utf-8?B?VEFwUXh4Z1EvTFFRUVROU21LSTFIbmJtaGxCZ3BhaFhSL05QaTE2eFhkMDdp?=
 =?utf-8?B?c2xxcEd5RHhvTzJVREFQclVQblZyRHRRY3JIaWxqa1Z5TGx4Qk8rQ3JTdE5K?=
 =?utf-8?B?VW1jU2VCbFV5aUdsSWQ3dmpJQ284YmRtR0pPWXd1NWdjanhrTzdPNlphaE83?=
 =?utf-8?B?WVRKZXd6c3JCSjR2S0liNWkvdDF2OFhSNitGZEF1SHRzdG85OS9oWW9ka2tM?=
 =?utf-8?B?dkJURHVxVW1sUk9QL1Y2SDM3VGdZQ2lkMnVlN1BoelRjWldpLzRpamR6RkV0?=
 =?utf-8?Q?TTrH8dwG/nR859QdYi6AU4w1TRaz4XIeGAXwM6Y1amWxH?=
X-MS-Exchange-AntiSpam-MessageData-1: dJAqjBSTknrPYg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 38ad4a4d-cd8c-4dcf-db7c-08de8a143214
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 02:14:07.9234
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Tm8MbGE47D/2No5hnLmcpYanVa7ECVAzLvDTDC2wqW7GTfJxyopxr4fvsGSGUD8eqOF7Z6E1e/y1WcOM3Uftdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8437

On Sat Mar 21, 2026 at 10:36 PM JST, Alexandre Courbot wrote:
> Replace the nova-core local `DmaObject` with a `Coherent` that can
> fulfill the same role.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/falcon.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falc=
on.rs
> index 5bf8da8760bf..f6239c44dd80 100644
> --- a/drivers/gpu/nova-core/falcon.rs
> +++ b/drivers/gpu/nova-core/falcon.rs
> @@ -10,6 +10,7 @@
>          Device, //
>      },
>      dma::{
> +        Coherent,
>          DmaAddress,
>          DmaMask, //
>      },
> @@ -20,7 +21,6 @@
>  };
> =20
>  use crate::{
> -    dma::DmaObject,
>      driver::Bar0,
>      falcon::hal::LoadMethod,
>      gpu::Chipset,
> @@ -636,7 +636,7 @@ pub(crate) fn pio_load<F: FalconFirmware<Target =3D E=
> + FalconPioLoadable>(
>      fn dma_wr(
>          &self,
>          bar: &Bar0,
> -        dma_obj: &DmaObject,
> +        dma_obj: &Coherent<[u8]>,
>          target_mem: FalconMem,
>          load_offsets: FalconDmaLoadTarget,
>      ) -> Result {
> @@ -740,7 +740,7 @@ fn dma_load<F: FalconFirmware<Target =3D E> + FalconD=
maLoadable>(
>          fw: &F,
>      ) -> Result {
>          // Create DMA object with firmware content as the source of the =
DMA engine.
> -        let dma_obj =3D DmaObject::from_data(dev, fw.as_slice())?;
> +        let dma_obj =3D Coherent::from_slice(dev, fw.as_slice(), GFP_KER=
NEL)?;

Is it guaranteed that fw.as_slice() is a multiple of 256 in size?
In `dma_wr` it breaks this up into 256 byte transfers. Since this
no longer pads out to a page boundary, it means that it could now error
(around "DMA transfer goes beyond range of DMA object") if the Dmem=20
section's size is not divisible by 256. But tbh, I find it odd that=20
`dma_wr` doesn't check that FalconDmaLoadTarget's length is a
multiple of 256 anyway, because it looks like it'll write a bunch of
unrelated bytes (since it rounds up to the nearest 256 to copy).

Maybe we should enforce that `FalconDmaLoadTarget` length is divisible
by 256?

For this series if for all firmwares it's divisible by 256 then I think
it's fine to leave this as is for now, but I do find the lack of
checking in `dma_wr` (or anywhere else for FalconDmaLoadTarget) a bit
odd.

> =20
>          self.dma_reset(bar);
>          regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 0, |v| {

