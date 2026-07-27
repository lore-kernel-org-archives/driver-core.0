Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011032.outbound.protection.outlook.com [40.107.208.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BEA3DE43D;
	Mon, 27 Jul 2026 08:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785139579; cv=fail; b=NeJTlqtdGwaHsqVyJCliBX4yALul8uTxWzdC/X6c9Y7kSKcju2fG4TaJHAnMbWg0OGLy4LlQlBTLPNmYiIGbU/t9MgnvYj6aLp3SejOkMPShm3bOeSIQOYo0PptXwBRgHjFScR5weCFe70gmKqem6d2gDyb6TUxFNewOP6uhN08=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785139579; c=relaxed/simple;
	bh=LKsAQMFlfxFeR9kRf91CK3lcPdmZ8o5DOjOULObMvJU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=cgW/+47U7z9T3fKgyz+vgO5y2x1Ih5yTebzLDXgFzcNX1rXtO7K9RvQc8PxD+Vlz/437yqgAzx2PGAik5BZIzkxcFSJ4xUyc7z6X7rNCozdx843Hkbd9rTov/jrfoh5oB03JyQrlu2LGuUH/Bzjqwj6qHiOHBmBTGkT+d7WTlZA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NWoGMM3v; arc=fail smtp.client-ip=40.107.208.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NWoGMM3v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=R3xCe6Skzq730zcpvQdM1DIIRUVgoxXIaUe7UJ+JbaaMyyTqZjYTqTFMJjhRsp8iY1ilSTEqIMPvHIN8Tgq41LhHNQ1yosIOkD2fccYRXJ7x3DhqPXf7ZRvCH5oV8/TBMwg6mDTHjZ6nCLfMHygqdUnShD6WJlDbs1zePndL449lE7ZPCi4WdGPFP38n7ed4xrD4i852c7KYmnr/zlu1lmdw59Kt5fxoPehjATLxktI1Q1iF9cYxt/WM0PJa3+02zeWmYnn5IGTOKgUcuHgHSJpcb3HaIg874I8bFIi1crBKo5Fz/DJ61R/8/eowOsMdXczrPubnAf6slikA4FF6yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EnB8w++H96CPI4fAYOdPiWjUCsBMmODjHN5FA4ulp8A=;
 b=Pvw55kCeIkgRyxzh1XSx5lFqx5Cb18aCA13B0BIPwPayG38or2zy9gM++C7xbGewIGeRffdQPIMQPjBnHBPWppvfxAmUAI2tUobg/u4j5pmhkplOKTbxqzr1j3v8jBklgYv6igFG10ohGkc7QQqAxLf6B6ITsYu3Mkukm7u/lePgsXcOS9YPHTBBxNZxjA77q7sLvC677Tpq3+4ESaAMnv/y2VUIxb2tWM3CUNna0X6HVOIVsqd6MrCFn/zNccfNGTbK31DItgj5fXybLYZQ9KKZCumyxIfv0E5i41M4O6xAZmHBtF8l/c5m1Dy9u6HEaQrEIW/mbzYrEFhRjJq8Fg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EnB8w++H96CPI4fAYOdPiWjUCsBMmODjHN5FA4ulp8A=;
 b=NWoGMM3vonYHHz9dtG4g2vLpiLL53SfO7iyeyUVsWwVb3JTxJAKmwV/po6Ze5eIJNJUflqCQ2BQTyx6Q+WmvHM/WF1kBCDdMoao2wyc10ODbIMqGOJgIof13qDs5rN/YVmpiK2TFZjacM5Yf3d1yE3UeDCQhUW44ewvktqEDbZ95rGY1nYG5/mr03A9ZEZ3f0xIu2ZBBuBu+4jxcNCjmno8L7cgPCdJbnIz3BVo1j+zSxoX0x7Gl5Hgv1cu7Ts8orKerjYlHbzrr/rYbm+zgMrxTzxx6THZTqm33IdaxDtLF2LMYljGnIVFX6zQS4dhyzcN3r2XjQlZCQO8tAizhvw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9172.namprd12.prod.outlook.com (2603:10b6:610:198::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.12; Mon, 27 Jul
 2026 08:06:12 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 08:06:12 +0000
Content-Type: text/plain; charset=UTF-8
Date: Mon, 27 Jul 2026 17:06:08 +0900
Message-Id: <DK975WCPTEKC.PL6U1OJHUMXD@nvidia.com>
Cc: "Danilo Krummrich" <dakr@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, "Gary Guo" <gary@garyguo.net>,
 <nova-gpu@lists.linux.dev>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>
Subject: Re: [PATCH v5 1/8] rust: alloc: add Vec::zeroed method
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Timur Tabi" <ttabi@nvidia.com>
Content-Transfer-Encoding: quoted-printable
References: <20260710230428.865447-1-ttabi@nvidia.com>
 <20260710230428.865447-2-ttabi@nvidia.com>
In-Reply-To: <20260710230428.865447-2-ttabi@nvidia.com>
X-ClientProxiedBy: TY4PR01CA0108.jpnprd01.prod.outlook.com
 (2603:1096:405:378::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9172:EE_
X-MS-Office365-Filtering-Correlation-Id: 4de2176d-2b1e-426a-109a-08deebb5ec21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|1800799024|10070799003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	n2nNLNdRNmzra89tESqeXiekj34WMet3awoJ6GvW3IcuqXl6Elk0Pz1v/iudUyU+EHhVgt7CdZJpTfv7uOcy/GVJ/qVFBz6ZMx5GeNvyZ1rbgi5uRG4u5xGcGHfZut+be0WQTYLvBfgMrVtdqwCB/u81ScBDYN+mqkd7w8RHGIjNxarquBj2pmmx9x+gAf9FN24BXB/aGUrHTqOhv8pyJvbTDGCzMPE6opgXt0wj5YHWJ6QnbklO4DKWNPTRcWS5EvVSE3bqXtF0hRxO2DFi8GkPVi5ICazUZ6jNTCSYO0yiWe/tWIefHCxtpqZQ8Gx8rLVV4IWsBSLwvMMd/akMa8YXJMPVzUvlhyDPZx+al6sxeyKhElZXhWlZ3ms8eG3/V4j3u7YUlyt3RqOcmhq51Zvzsa+S/awPlbWSBsMiE2viXPFCBfDknJ8RA2+gvuxJXNyzHfa80Ovh0zAhJGman2bT5ILnBvZ5ewBHFGlmRX0r+L8XKfPNVq4ItBThql/UjKDxiF4FxYxv737KilSMJD/JWUd4dquxLhe8EmkSGAdJ+TxgRZjzNCXhnoM35USpM0hU4kYzNucF47dr9aJXb8KlOGLP2LuG7/f4ixubwTRTPTxV21ebrmzK8kRQ48mCzRBbXcmeJvJmTJX5ZX7+wGVgg5otuv052XIawLGGnAE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(1800799024)(10070799003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aTNSWVFHWW9FZmxUelc2a0JmY2lmMjZha09DRlo3djducFA0cWZXVFdEM0Vx?=
 =?utf-8?B?NjhyTzRzVXQ5RFIvOElEVUd6bWdVbVJjTlg2bnNsUVVrWUxFZmcxUXNXV3lP?=
 =?utf-8?B?V01qN3J4dWxneXF5QkNmeTh0Qi9CWXdCZjh0b3E1dEVKcWl1eG1iVW9TQStI?=
 =?utf-8?B?Zjc0L0hUbHRKMFMwcnhFaGsxZVF3MncvZXVLSDhCcHY3eTFJVTRKOEpmUHl3?=
 =?utf-8?B?SE55UG1OV2wrMzA5U0hqTEFXbDJMSzg5TUZNc1ZrQ1lwc0RlVzRwZTAyakhS?=
 =?utf-8?B?VW56bVZzWTIreWdJZVcvL3RZSzR3dkNjalhNYmFBcmZ2d2Njc0NFR01vSG5q?=
 =?utf-8?B?Z3hGbThxQ1FucW1yMW5rMndjMUZaZkxvZklSQy9OMjFuUTJHdmpPRTJRa2JR?=
 =?utf-8?B?UjBLVnRHZVBRMzBXVHN1RDA0TkZrUU5oUU9FRVlta045MW1RY3N2cm1OMEZB?=
 =?utf-8?B?ZDFzUlJPNUJaNHUxT1ZSRTdqcCttTmpJZEpidHdUQ1ZISXEwME4wSnVvekZR?=
 =?utf-8?B?K1U3a1JET2JMK0hqZU5tZFJvVTcyYlRLVENLV1NmR014Q2V4V1pPZGJkbHJy?=
 =?utf-8?B?ajY5ZVR1QmxLcDIyMjZuMGkzSlJHSjdHaXIveklDRTlkcFJpcnJUa04zNkhN?=
 =?utf-8?B?OTlqdXh5ZVF4WTJkNW03MHVubGFYSktLQ1Iwb1p1UUg1TlYyOXBTbHVHcXgv?=
 =?utf-8?B?QktTbXhyY1p2TStCUWhHcXd5TTZ5dlJoOUhIUituMHlJdk5pc1g0WUZ4RFdM?=
 =?utf-8?B?b2tuYlRCS0NkR21Ld01qdndVNVFIdG1NR21QQTJyRE1QR05WRzd2amdoZCtD?=
 =?utf-8?B?SThjVVk4eHVOT2FERmhvMmhMV2c3VHQ3ZU9MM05NbVlzL2kvZFhNajBJUUhh?=
 =?utf-8?B?UkdQUHBUTEMvcWpTMmpJSHdhSC9Ka1EvRXNyR01vN0Jyb2FTSlhxaVd5K0Jl?=
 =?utf-8?B?bXB5aEtxeVNIY3gzd3pVN1BEdnBTajVDc1F5NkxJenU4U2tLUnlZazZFcmtL?=
 =?utf-8?B?M3V6OFAxUEJtK1VvTEtEVGM1Yi9XSWFyZmZDY1VKelRFaEVXZGtISGFPK1JK?=
 =?utf-8?B?UHhRR0NhWjBqR0x1YWloUkpSUXFsSmRxU1pIa2ZuWFBqMkFVL2Y5U0UzNjhS?=
 =?utf-8?B?YWszNGJNVHVsdUUwRGxoWWhrZjN6MDZBeTdHSkx1bFZrUnBkZFYyRVdzS244?=
 =?utf-8?B?ZVZCZVp1dHR1WUc4WGVjam9WTXBMWEJHV0U2RUJTZXIrK0ZlRlZ3S0hFRXIv?=
 =?utf-8?B?SjVmNER0ZU9aWFlVaXNEYUx5MHpxTjFPWWdycUJTbnMyVjduMU5JdUxHOHZ5?=
 =?utf-8?B?N3phbGk3NDJDZG5pOUFmUmNQTGxiRmdVbXZGd293bWF2RmxUc25XdW1xeVlm?=
 =?utf-8?B?L3JkZmVlb2Y0OWd4V2pmNjJpN01jS1BVbVhJUHBuVmZsRkhycTlHR2Z0T3hD?=
 =?utf-8?B?RGlra0w1WFNIdzJYR25DMXJiNEZBYTlMNFJuVVZBQUxxVGFjNjN6a2Zic3ha?=
 =?utf-8?B?dWtqZmhVSE1xS3BLWGVRcTJ5R2R5NHE1WEJaTkFVak5hRExTa25OYTlzKzdJ?=
 =?utf-8?B?YW0zVjIzOTIyV1lxMkFueFcva2dybGZWdlA1ODk2WGNDcmxQdW82bnI1a2hS?=
 =?utf-8?B?bnZ6eDkzYTJ0eElTYlRESlVUQ05YSld0QmxSaFBFUVNjMWIxSVoyMTlhQ3pp?=
 =?utf-8?B?blN5Sm1vcS9UQTIzUE5xUHlTbHhzSzZOTm1WUW1hdVZORGtmcitpaGFkNEhl?=
 =?utf-8?B?RndCdUxMZ2NZTnRvL21BTC92V2dmczRWdXErb3FhaWVXbktVbXFWYjk5bzBk?=
 =?utf-8?B?LytXVDhoL1JyWWcwajFvVGFwUjQ5SlgxK2pYd1JwWXlIQ0pxNE5BZ3NCaURw?=
 =?utf-8?B?YWZrZXBxYWliSjVNK2hFQzNhYmZIUE1kYUZTNHlqRGRpdTBkbVNNNmJ5STZF?=
 =?utf-8?B?dzVvejA4M3hMSG9xZCt5aCtHblROV05KSUJRdXN5ak5PekhiTW9Td1Q5ZXJu?=
 =?utf-8?B?ZEE0R3ZaNHV2dUoxWjhNNnFTR2JBUkIrYUd4WjJ5RjJSSEJRLzNRY0o3ODNN?=
 =?utf-8?B?dmxEQ0xnVnF1OEUvUDRWd01LQyt6ZFJHUVdHOVBObnBQTE5hWVVYQ0hBelF6?=
 =?utf-8?B?VTlXOVhkRDRUQVhLeHhhd1U1a1g5OERNT2kxbVQ0Z2NwMHoybWtEdXZGZC9l?=
 =?utf-8?B?dldXaHg3REcwOUZqamRrU29hRkRHZlVZdmc5NS96Qm9JRzc5TmRVU0FQdUsz?=
 =?utf-8?B?L2RnMmZPTVZpZ3Q3VTBCMmhaaURnZnZ5YlBoNXlsdk56OFVGU2lDc0gzdzhL?=
 =?utf-8?B?RWFUSlFMZkkvS2RTcGg1VDNkdnRsdlZSRGxhNmpYeFhJbUJZdWZYNnF2dnVo?=
 =?utf-8?Q?VaLhuUe1Sks5EKeygqZ7OJFjl+6ovzg2xVF/0e/MfwV1p?=
X-MS-Exchange-AntiSpam-MessageData-1: JI8X0Twx1GreKg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4de2176d-2b1e-426a-109a-08deebb5ec21
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 08:06:11.9723
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v6BxlHo8/nloAJvWfAqhUHPxHJBC3Ww02gf3YlL7i8+tvdjmbBYuZUtii0vIvXvAstCeStHT+22ptTHHS5sZJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9172

On Sat Jul 11, 2026 at 8:04 AM JST, Timur Tabi wrote:
> Add a constructor for kernel Vec that allocates a vector of a given lengt=
h
> with all elements zero-initialized. Memory is allocated with the __GFP_ZE=
RO
> flag, matching the existing KBox::zeroed() pattern.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  rust/kernel/alloc/kvec.rs | 20 ++++++++++++++++++++
>  1 file changed, 20 insertions(+)
>
> diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> index f7af62835aa8..4ca589919c1c 100644
> --- a/rust/kernel/alloc/kvec.rs
> +++ b/rust/kernel/alloc/kvec.rs
> @@ -9,6 +9,7 @@
>          Vmalloc,
>          VmallocPageIter, //
>      },
> +    flags::__GFP_ZERO,
>      layout::ArrayLayout,
>      AllocError,
>      Allocator,
> @@ -51,6 +52,8 @@
>      }, //
>  };
> =20
> +use pin_init::Zeroable;
> +
>  mod errors;
>  pub use self::errors::{InsertError, PushError, RemoveError};
> =20
> @@ -532,6 +535,23 @@ pub fn with_capacity(capacity: usize, flags: Flags) =
-> Result<Self, AllocError>
>          Ok(v)
>      }
> =20
> +    /// Creates a new [`Vec`] with `n` zero-initialized elements.
> +    ///
> +    /// New memory is allocated with `A` and the [`__GFP_ZERO`] flag.

Every other method I've looked at has an `# Examples` paragraph in its
doccomment, can you add a short example to this one as well?

With this, and Miguel's comment taken into account:

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
