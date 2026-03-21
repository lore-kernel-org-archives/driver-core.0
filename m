Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021088.outbound.protection.outlook.com [52.101.100.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF3F391820
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 14:58:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774105128; cv=fail; b=M62N+lQqHp9pB1HbmcdHIuSzUSEvd4Pp/k01WD5vOla25kFVvK+WVzeMAtRNVKrsWPP2NUs8tf9sFCc2gr6b3Tl2bfQc3+yGCNZFovUWSH1gTHxIJTizIb4+SLO9x5ENDiit+HsU/TfxIwU4B7Aq4CmTZR+eVpq7HrGFm3cPhjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774105128; c=relaxed/simple;
	bh=V4mSE51FJx8zSqfhjKkTE/7GNnWv547s1ACZ4CrOhGo=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=Si/Z6KzN7kzFxyXue0nhvu3vZQUZF4rPHYhJ4SayGeePcf/aHNaVy1F616J/hNuekK3VEKxU+uLYlLGoUsoZiMtJXvYIevO3xQo6U+HQ/GrwYbGazDyiurtHUKHswP1t8L6vcgoJvA/Q8Ob2XBYDrFe6UDO5ecWs0JHXO8DxPlo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=J1Qb2qb2; arc=fail smtp.client-ip=52.101.100.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="J1Qb2qb2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BpJDxIQioHCxjMNmEgYNiitr+uWbUsZeC0B11dqQ1zFQlQxQkYglkcfhX+vw4eoTrrqoa3rZWst43wm62sabHMnhDaV9DWn5BzvgSNk4wzg3wH36oRpHtI0dbPftN4VEc7H8UqlAvgip9pj6P4JWVQuklnQS73YVxQnera/5wZQFxeYpLl6FRvwcb4cmDnVtlxFNlbs/HyzXX9dJsRAxhMEWghmTneMX/zyD7PEPQC422CIoURQobvuq0vwIxxJunjpBf1AqWxq58++Uv7tThONmJT1GP+o/LhuJDDER9aV2RDmFLak/BhtAg+6o0/49usxRvh9U4NdZjJhb3+UJmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hXRESge9Ii55QlipzicFRBcYeHZcoN0pkixBdIbCZks=;
 b=MvTLQ8N+CG7GxBcyvlrl7z89k9RrIxIYXcXRRVYAsGgX2hEVrIOCQJxT5wnrJCCxxXYgj/9ubZf0FLNtFkSyImMDBYf3j2zisJKInkPrLKbGv25woXEmQEXTnEba58cXpexstwWpMlBKcjD91GUViNbt/bE4Nu2PqOYl2jKyk2CcW5HrLhKdDC7XTUVopMCAvcz/UKVBig9kAZXQTPHwnmWjFcLuLDLSTG/WfSYas81PJ7kxF2+YDiNOgr5SHy3fnDBiARupIdPW4HLq54cfnlvKmeZPTHDGY8/v75GM8VaXyf0mXSRIjPOKyR+9nLPO1W81AYP2jyFnAeThlW/cbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hXRESge9Ii55QlipzicFRBcYeHZcoN0pkixBdIbCZks=;
 b=J1Qb2qb21QeEapd6CWNe2f4ZXkZSr/TyBFprUORRHLT/bGB0dhwJZoFYHvw+dNo1E9FRhFijA/2HB8oNgaOyeec9KVnFhTVR7KDUzUulg8kjgl/ADaL7WRCKM62ez1+28wMCk20z2/A3HpENzxWf5djERPbwijy5EiHHQ7milBw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LOVP265MB8950.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.25; Sat, 21 Mar
 2026 14:58:44 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9723.022; Sat, 21 Mar 2026
 14:58:44 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 14:58:43 +0000
Message-Id: <DH8JS2ASDOWQ.2VMYT7989OGXQ@garyguo.net>
Cc: "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/7] gpu: nova-core: firmware: riscv: use dma::Coherent
From: "Gary Guo" <gary@garyguo.net>
To: "Alexandre Courbot" <acourbot@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>
X-Mailer: aerc 0.21.0
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-2-5cf18a75ff64@nvidia.com>
In-Reply-To: <20260321-b4-nova-dma-removal-v1-2-5cf18a75ff64@nvidia.com>
X-ClientProxiedBy: LO4P123CA0111.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:192::8) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LOVP265MB8950:EE_
X-MS-Office365-Filtering-Correlation-Id: a7ba90bd-a59d-4432-8591-08de875a58c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|7053199007|22082099003|56012099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	EP4um6WUA9OQb5ZjOcGxOcq5QbgdgEdVwVas2xlf2P1Cru537GwdFeKHdSRXrEHqptCVR59UP3zqsS/40aG0BzSiFqL3VKT69QLZLFFfDmHxN4rXFGw/D8QjZKIM7Dk1M3Mm+dqqqElKYr6Q1t3DUriligOims4bKCxnfLL0oblcG3vE+cwGIMYoMokdDrdrAsLXRNIC1cTLfa9pnrmQsfffSZaZ2OWReV3rbnyhKOP0FsQpHgEePK+qDhMUyv6oNDL9hHzT+NotF139iIeYIqm2ELuKecDoEcSILXn2gVaIHURqrJF4YNgFD5U8oH0Nbxo4SF5OQPwmoYo7Jp83fdahvukQ9oPITeMRXaRRXM6UfDIUtinTYuK8F8LuI0GZJQq/Gy8rnZslO/gzinCjMtG6sJddqXQPIs3HlVRA+Kn+6jq1g7GCe7iXK1BUboPk82Q8QglJrcU4cXOkeqzRqwpWJHabdsay/3CVgtKktnEcY4/iuci6Hfft2VsFJO+uiLTGFJT5Bhp85S9yn5xor92Azeik0NBja+e3/qOsOjo9Uf0jsWPLf8zeH38YKg7icCSCOHUA1jUGCGl/ulLy9VHyoxo12b8xbvuciaP0z4uG9DTfIBpe3q7qxp2IbEpzgym3rB9ZacN7EDgf9epyyVFRhNx/SwxXRyKllUzJct1UZndo0dk740Qx4uWWs92zBgEQ8/26vz5vrAVemhHBSapJ8Y+Yo80QuBL4JbCxH5FKYCPEzUr64oD1Ou8pPWYtrejhYjS463QzgETUvTyK3A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(7053199007)(22082099003)(56012099003)(921020)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?czVneENLZHVob1FTWWduekw4YTdWM1hYM2M2a016SExFbDFsaXR3NkM4eGpt?=
 =?utf-8?B?QkF6TWFUc2tYenR0eDlKRkpBVjJKeXNvVVhCVng2US90RG5qazVFeUt0TXZs?=
 =?utf-8?B?Mko0M0JwOVVtYWl6L3BhdkJkZjhNRGxONzlYQ3YxTkVNRHJ5ZE5KUkx0UTg2?=
 =?utf-8?B?Ukl2NzFHb093eFpwZWJiUjlmS21EUHFsd2NNbnY2emN5c2xwN2tjRUcxVXpt?=
 =?utf-8?B?Vmg4bkM3WTlxL3Q1Mjgzc29qeUU1MEtGQkFZNm9zSnlvbHR4TTJhaUQ4czhO?=
 =?utf-8?B?QjArNURXcFVGU1p2RnpXYWlSU21odzZ0Wk5mWnpyd0FVV0Rac3R0bmpPNDVt?=
 =?utf-8?B?UUZwWkxyazBBUFYvL25KaVA2OXVVLzBMTnoxMUZWeU5zdjErQlFwN05ya243?=
 =?utf-8?B?SHRrS0hLbzV3MHJLa25MbVdoZXhyaWxaaXdXM2RSRjV5eHV6NURYVlE5OWtZ?=
 =?utf-8?B?UklRZDlKc21nUkM2U0kzQy9PcDdueDZiK0NPdHp4VGdteDhLYTFuQXNtSmMw?=
 =?utf-8?B?TXhpV1lWaFJHaExCWVZlRlNZYVFJSzhZUXdJWFFSM2w0NXN2NzZubnRKT3NL?=
 =?utf-8?B?N1BKV3ZRdWowQjk2eVhMZ21LRklRVmR5WC9OQlljSTlyb2lpV082U0xiREdt?=
 =?utf-8?B?YjJGR0JONFdDTlYzSmVObWl2RUd1T1ZQVUg3TG13TzFXSGZlTVFzK3duWFpU?=
 =?utf-8?B?dVRFUW1ERDZjcmFZQVh1NlVCTHVFazh5cDIxMDNyUzVLRURLa3pUanF1Q3BD?=
 =?utf-8?B?S1R3SG0yeVhlUGxHSG5rM2U5MnIzVTJLOWlDRnN1MEN2czNlR3dnTDRXZTdH?=
 =?utf-8?B?amR1UjcyOWpORFdaejRTOTlDQlR3TG8vWWNWbTdZU1BOTitoK00wMDl1V2oy?=
 =?utf-8?B?UzJ2UUVpeHpPbDVDSkdWYmNHSWlIOHhPNDNoeFMyZldGTUdwMW12dzNnVENa?=
 =?utf-8?B?Unl2VCtzdyttdnJjQTJESXN4MEwyL2I0SzRQOGwvb0RIcFFXUXRoUXdrR0o4?=
 =?utf-8?B?Nkg5bVlTbmE2SkFiQURPSGc3bXBINHBBQ3BVNUhQcEs4dFNSeVQxWkFqMDVt?=
 =?utf-8?B?ZUlKZFVxSnp4Y0FiY1dpRmZDeFFvdHpaNlBrd2NiUmVNWVJrekE1MWxtY000?=
 =?utf-8?B?ZldrWHlHN0hSbFRMVGZ3TGM3R004ak1lVFJqdTJBVUgwVlBIbHMzUkxCTkRZ?=
 =?utf-8?B?N2FqY2swTDlHRGxFM2xpOENCSGVRNzRpcTZ0SWZmNUZtMFB2MTNWWndoMUtw?=
 =?utf-8?B?bWpNanlQUmpIL2ZFdERjQkxNbS9LZDM5NWlTN2M2S0F1WUlUL2VXMmNVRllM?=
 =?utf-8?B?ZUd3dG9vWnZPb3Ixaml2ekdsVHRQNkw1eFMzOVIxNEJ5UCtsVU8yV2l2bHZ2?=
 =?utf-8?B?eFVRTmtSN0dTYXRlMlk3dDZPUWgyOU5IOVZOdFMrSVozR0tRTjY3RTg3WkZo?=
 =?utf-8?B?VXBEcks3SzFVYmovV0RadlR0QkZhMWQxVVoxTWNIaGo2SEhmZEN5WnVoS2RB?=
 =?utf-8?B?V2dvUXlGajFoOWJpZUxqd0ZTV0VtYkhIeWpvdnB2MElQMTlVMzJJV2MzQW4x?=
 =?utf-8?B?QVpjV2xoZEJXYkZISWtwRWN5aG5nOFhmaFltUFZyZnp4SjIyeCt0L2NzOERz?=
 =?utf-8?B?YnI4aE1seU4yMWN6MnZndDBEUXcxYzZBYWJlSDZjWUkwSkJyOUpZd253UXNV?=
 =?utf-8?B?Q1cvYmM2YmVzSkVrb3cydWpCYzc2UVRIL3pteFN3aWpqMHg5S3ZBUXdsYVJx?=
 =?utf-8?B?dUw1VkJYenhOUmpxN0dUYXphaUVWRkN5Ym5DOXppNThsZHdzcFRVRXFvclJ1?=
 =?utf-8?B?MWwrZ0pzVlVVenloTFREUG9uSTBid1lTSjZZcnVKbk5WQlZIQnA3WnBKYUFE?=
 =?utf-8?B?S0Q4S0IwdlBRMDUrMnZ5SSsyV2xoaE5EMitQL2lUbDJzTnRNb1JRS3ZES2FH?=
 =?utf-8?B?UWNuVnlnMDRXb0lXUU5jWm9WbWJEVEQ0eWdHcTFUOTdPdHpkZmt2eGxqeGNF?=
 =?utf-8?B?YnpDSkwwSHF6UjZWV1FNUkR1eGxRbVJRM0hPZWJLVTFWeWxPV0tMTmt2TDh3?=
 =?utf-8?B?UFpkQjNMamRTdGJlQkhHeFROMmFUQlJ3YVptcHpXTGc2ZUIzOER1OXpOclN4?=
 =?utf-8?B?dk1XWUpiNUxuRnNoRHl4ejBCdWVtWDZPY2ZkOG9wQkdBNmxXc0EyU2pCTHNV?=
 =?utf-8?B?U01VODVjWWYwWnVodlgzSEhoQ2k0cHdlTGlzeWtBRWpLRndKVUl5dmNjQmFB?=
 =?utf-8?B?SnVLZVF2ZDNLd0pUSzRIdWN0ejlXajR5N0lORWFQNEVqb1JrSFpXU1lOV29B?=
 =?utf-8?B?K3E5UHBhYXE5b0g3YUFhVzY0enZYNXoyTGcrTDJmZU9PdDRTOUwwQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: a7ba90bd-a59d-4432-8591-08de875a58c2
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 14:58:43.9857
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uGbjXpKW2qNUIcM930GS+bEvAMWAOAy0L88u20p5s9qE7ybSPXTKkcYyAxpKhmf8evqQFGVWj9K478mtThQ/mQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LOVP265MB8950

On Sat Mar 21, 2026 at 1:36 PM GMT, Alexandre Courbot wrote:
> Replace the nova-core local `DmaObject` with a `Coherent` that can
> fulfill the same role.
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  drivers/gpu/nova-core/firmware/riscv.rs | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-c=
ore/firmware/riscv.rs
> index 14aad2f0ee8a..2afa7f36404e 100644
> --- a/drivers/gpu/nova-core/firmware/riscv.rs
> +++ b/drivers/gpu/nova-core/firmware/riscv.rs
> @@ -5,13 +5,13 @@
> =20
>  use kernel::{
>      device,
> +    dma::Coherent,
>      firmware::Firmware,
>      prelude::*,
>      transmute::FromBytes, //
>  };
> =20
>  use crate::{
> -    dma::DmaObject,
>      firmware::BinFirmware,
>      num::FromSafeCast, //
>  };
> @@ -66,7 +66,7 @@ pub(crate) struct RiscvFirmware {
>      /// Application version.
>      pub(crate) app_version: u32,
>      /// Device-mapped firmware image.
> -    pub(crate) ucode: DmaObject,
> +    pub(crate) ucode: Coherent<[u8]>,
>  }
> =20
>  impl RiscvFirmware {
> @@ -81,7 +81,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, =
fw: &Firmware) -> Result<
>              let len =3D usize::from_safe_cast(bin_fw.hdr.data_size);
>              let end =3D start.checked_add(len).ok_or(EINVAL)?;
> =20
> -            DmaObject::from_data(dev, fw.data().get(start..end).ok_or(EI=
NVAL)?)?
> +            Coherent::from_slice(dev, fw.data().get(start..end).ok_or(EI=
NVAL)?, GFP_KERNEL)?

`DmaObject` rounds the data up to be page-sized, while this new API doesn't=
.

It has impact on alignment, as the allocator aligns things to the largest
power-of-two exponent of the allocated size.

Best,
Gary

>          };
> =20
>          Ok(Self {

