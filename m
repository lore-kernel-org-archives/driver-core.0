Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012048.outbound.protection.outlook.com [52.101.48.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329123FFAD4
	for <driver-core@lists.linux.dev>; Thu, 26 Mar 2026 15:22:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774538549; cv=fail; b=XqtwZTf4pd9EuSIKCRzbsCpF6Otgu3DYy1j7mj+6HMT3SglfRulNQMK3GoSZknnEfsz3MMxwRvgn+9gx2dAPMjpPN+uAeUM7kJbMkSXndkHzcbMS1wgBQqGBLAeQbDgbPwAB4r3QpkQww4kEgjz8xhQxkmTyRhAXmDEyh/0oIf8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774538549; c=relaxed/simple;
	bh=UCqwgzGLsktbM1fNSW1Qvfj68yX8dBMNhJS0izODVS0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cBaIm+uceYOVuzOCfmo5owVGLNUGOggEmlnJyFYDMQmKYUxRNMDi/96b5xxM/d/LUZlVUUOaums/MEZgcmn/RodSxFnHTwsdBKSfKLXTaC2XviN6crDETlimVhV0kYo5WaMwLX7Ttas54KDBPgjg+PvbPIKIWXp/rKaapBbQhzA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=BI1HKmoy; arc=fail smtp.client-ip=52.101.48.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="BI1HKmoy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fxNKIAAN8eQ/nK+qrBeGGehpZBmceuL2R8dr02Y2WxEBq8whYEt0zl6xS7RuDPa0rer0n8qYuV2TPVdMPiW2zxGDf3gHeCptiL8r3YCZB37kdsGc+SOd/eUuec2HcvCar5SPPzGA+8TmXxOKjN5advyB5e1LqzopjxzT7xHdveotg+LlYw5CahRH5VA1bzNs0QWev7WqK2+S+mzWn5vk/EayeEsd61XIlz+eWHNoqUv2lN2GlESLT9VtL+fTOFCafibavwxRM9+yTkwG/ZTeaM7mxd1bnwo1KVPqR2paziPUZHpRe2WReO+PO8RRzy9lj/fFit83Yvdz/XT9EmGV/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OvqAAfSnkluAzxkdNzNjFzAZuyomYtNnybrGrjIAVUg=;
 b=yEpQF9oG5YTsG7aRvpoOeALAORRwVmvOqCZ3BLU2elXfNgGyby9tnCJQWXHixErPt1hzjp5zeZEC3K5jMezuOf9Ru/4r7tlkicN6132/FYR1x6ydEH0XrpykP1vyfyE7XoKTb3NQD/4B8eWJZ05aNWj/W43nVl0SQjE3mFE3zCDHX3+4wTutaFFuXurtQJ/SHz7HAtVNkgY0LIltG3zNNrNK51AbeKqtnpT/dPbSWd6spOXCLk2A8a3ssvu2BP0yiHRc+Z2a7Rsc5j0so01D6tM+M2DL1QWk0wpcZGpCxqssNYDqjSZD/cnDJIkViUvNmTN4CjA2D6ad8nQ2lU9HUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OvqAAfSnkluAzxkdNzNjFzAZuyomYtNnybrGrjIAVUg=;
 b=BI1HKmoyuJ1QsDWx/eUQFdmOA4nT8IGu5vznSb/jv/BSrSPcDJoOr4NZ9uLn6zkvSF1yF/p9NypF5MXpjfAnfMTd60BoRpFQh4xlIjK6yysbQ13IlVYyeNG4PpovV2pimNHdcXjM9aXzdSiSNCm15w/CAh/evq2UM/HWKyWxMCtYy1S7u59sBHIYV0CrqQoo5rFWjMM33DxLVS6ndwjiDhpNKoN9p/Fdw1uIYUwJ0K8If67eBUPgv0fqX1QEOBlV0FTyunlc4pwS2Vsk1Bn7UQb+SrVYJA7+JTcE9GTj9wfQ0GZXB293nA5o2GlcjpzS+tE015pUlFcO7faO604GPw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB8219.namprd12.prod.outlook.com (2603:10b6:8:de::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.7; Thu, 26 Mar
 2026 15:22:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9769.004; Thu, 26 Mar 2026
 15:22:23 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 27 Mar 2026 00:22:08 +0900
Subject: [PATCH v2 2/7] gpu: nova-core: firmware: riscv: use dma::Coherent
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260327-b4-nova-dma-removal-v2-2-616e1d0b5cb3@nvidia.com>
References: <20260327-b4-nova-dma-removal-v2-0-616e1d0b5cb3@nvidia.com>
In-Reply-To: <20260327-b4-nova-dma-removal-v2-0-616e1d0b5cb3@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.0
X-ClientProxiedBy: TY4P286CA0090.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB8219:EE_
X-MS-Office365-Filtering-Correlation-Id: 724ec2a7-56cc-44cf-c790-08de8b4b7ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|376014|7416014|921020|56012099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sZE5a67huUtCkCAxAvGENE8au4tvIb41Ylaum30PEncy3cwb4FAInRt4woqbEkAsHogHk8jKpWxfyNpYSmcAg6X/QeH2dXxzUyIZdB6JLTQhp+rk/e2KlHd0eyxfEpwNlGtBgopBCcB2PdlkYldBVzESK0RLFJ/6ZM8/4cAqVH2nr1VjtDFTTNq9XqDh4goaROKCqjPbbxsY0Jb5hYYNBj2PAD3HkmIJ3HeiGgoSGJsYTfbnm4TlBYZNTeatRBeqIsAR9w+6UUvVT6rfLkw+I48xfnDBFVJH5rJcriE2jXtaBfJbfN7scuNmO5JF2+2E2utUGgddOviDXcCCuEo5ImVyuNRjOuc9UVJuLuAa7VNk8VQPFUzCh7oTzaJdT65tbnnCF4smgv2FPAf+/zx0jH6B6BuNfyvKNZnxJq9SbBfJqK3/mkqB7ewJ3MBujdjO3qWDVXCGfn3LFnW6epvyyJmWmEyccRRqcv4OFjw2NTyAPBxTCGD9rFYJIyZMQZpUxruA2PODLPsWfscNXlUCXwv2D20XtFnSS0BJAx+DUdDQntxPOmWJdxtk+Ipb4xkzaM5KwW9eh3Hy3c4L/qKr2sC/3y8Ho058rNyQIOGokEAYQVIrQeKR2jDmW/C3zLFGbOtRBpNOgUYsyDFXGN21qXF1u+IAP78fUZRrJuvVqWs9SdAVxFfEB+gf4HEE7kxQeVBOhQWHIlkb/EMhkGV7stuGiHpBEDMynTshnX9WUUXWsi3R2Mas/klsGU1CTqm4uuloEYJcO9zbzPxq/yO4BA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(376014)(7416014)(921020)(56012099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUUrR1lnSVlrcjdIK1MzNmVhYUkwT3oyL2o4NmFyUU5rY28rMlhNT0hhNXlx?=
 =?utf-8?B?NE1NcFNEQXh5TTI3U1cvdnBYYVJnYXk1M3JnQlNQQkFQZVhWVWVNNXV1YVBj?=
 =?utf-8?B?cTNPaXdtMjhMak9iQlJkSlZ5U0l6MGx3SXRRZEtpZE9ZcFNsZUFSZWUwb0xB?=
 =?utf-8?B?cU4yNjc5UmQ3ZlpBQVNHR1J6VnRGU1kwK20rcU8zSVhCR3RzWmpBWVVvR2xH?=
 =?utf-8?B?Uml0UHQvcVUzcGt2ZW8ySWRJa2ppWTE4aGk0RGV0N1haM004ZVZZeU1CVTZ5?=
 =?utf-8?B?M0VWWHV4a0xiS2hmTWZQekdSOXBSSUNJenhhSXBHSkQ5SFZrV2N3a1V6eFJC?=
 =?utf-8?B?WUJoTlVOTEFpejVRUlpBVzl0V1NmaUN0UWhEb29zYUVGZzl4THp4aURLeSs0?=
 =?utf-8?B?U0xJTHRrUkh5VVh1NlZEU3JkOGdHMFd5NW52VkVyM1FCbFFtbUU2VmcvaTlL?=
 =?utf-8?B?cThWYjQwNVk5cWFKTGZsWlc2OVltZ2dSamlERXl5UDJka2Rvb0xPY2hYNEhP?=
 =?utf-8?B?QkdnQkxEemtGbnNtd0syeWt6bi8vMzU4TFpOQ3NSSjBTbVJ1L0xGd2YxNm5O?=
 =?utf-8?B?RUlqZVhpWDZnZDNGR0dabFRIN0xIWkZNZSs1VExFYmxrLzNNaGViVEM1blZw?=
 =?utf-8?B?djFGcXFNYmFPSkQxd29aVGRlREkyb2tVVG5welNDMXZPSDJlYU9kaWEzNGpi?=
 =?utf-8?B?RmhocmdQdXVIZkV2MWZGaVhJd3k3T0RJd3pMeFNyM0gvUm93dzUyNnd0Q0F5?=
 =?utf-8?B?dGtXV2FiNmlmSHA5SzJ3QTFzR2w5K2hQeTluTFFvSGF5RU1oai9VbXpTTFBy?=
 =?utf-8?B?aUhtUU9pY2Y1RjEyb1hnaHA3cmpQNEd2YVRMTXJ4YitONllEdW8velducUJ4?=
 =?utf-8?B?ZWZUOTJKUjFKOWViR25kVFR2NGdKRS9nQ3h6Sm5ZME5XY25GTUluWnFIMkVB?=
 =?utf-8?B?MXdFQkxiV0gzanZsMmRXMVJnWHBKbWJDcVVuRHVUNUFzU0g1aUFzNGluSGg3?=
 =?utf-8?B?VGFkdjJYUDJxZmRkQWVRRkZlaGdBc3RUT1V2b2t1cldlUUJGMU91amhTTlFt?=
 =?utf-8?B?YWpLUHRsNDZsSWlWZXA5MXYwUUwyL2lZV1d5SUR5TGNTZ0dkei80UWM2NC9M?=
 =?utf-8?B?ZUVJTW13R0ttMmJZNEZ2bS94LzhKNDdSNHYvR3EyTkZhTldHK04yaHcwcENV?=
 =?utf-8?B?SW1IdUJaU1gxWUE1QUtQY1RKaUh1WFRHK0lnOXhkNHVUb2VzeVFJV1hCQ0tT?=
 =?utf-8?B?RER3Z3A3MU9PWHhtdXM4d2xHQjl2YWdtQTE3eS81bzJVQkRiTDVKOXRVd0t5?=
 =?utf-8?B?cXpsNTlmV3Z3UVphMUYyN2wzcjJIbWo3ckt6ZW14WFJDaFJNRGZ0TmpucVd0?=
 =?utf-8?B?eG9HdWNqVnpDeGVrZ3EzRWpvVTlCd3NhLzNTb2lhR1ZGRnRrdTFqQTFQUVRa?=
 =?utf-8?B?TVNrbFM2Q0NSOFYxeDZwc3FTcFdiN3VreHJhREo3OWFkc3k3ZEFFRWIvQVdG?=
 =?utf-8?B?VGliclhQY1ZTRXdLZEtHZnRTQTNRZUYyenBPZ1k1bWNxMkRnWmZnUEUrZ2xq?=
 =?utf-8?B?SXRDbTFaamJOZmlUeXMyaCttbWNxWUhCUmVIVzZJMThrNXYxZEFXQWJEemFq?=
 =?utf-8?B?YlFDZEpCaGFrcUxBTUszMWpnVzMxS04rWGkySEpYNVY3SXVCU0g1K3FiK2VW?=
 =?utf-8?B?RUIwM25lQmJTZkRrTEVmbVhoYWJUZnZhaDVEVjlrN2ptRnNCakc2eVdvQTh2?=
 =?utf-8?B?bmFNd1JGRVF0d29EMmlsa2dDNTIvZ0ZrZDl1VVBxVlMvUE1aYW9mTnFGQkd2?=
 =?utf-8?B?UGN6Nk41Vzd2UUJYaDM4TDFEbG8rUmtISW50RTZlQWRNd2t5UVAzcFdscTRP?=
 =?utf-8?B?cHNOb3Y1U0JWWUlqcmI4TmVyaW11NGYrL0Q3SjQvZHMwSzVUNzBxWWhlVURk?=
 =?utf-8?B?aUNlSm5IejV1TGpoYzlHcmk5NUxWODNVVVFPZmN1dVA4QmZVQ2tRTmtqUlhs?=
 =?utf-8?B?SklnNnovN05sOXY3b2FzbWlvT3NKYTJ4QkJwZnc2ZDJVSVltSDZOWVpmU1RH?=
 =?utf-8?B?Si9mVUpRbXdlaG9iSWplOUdMa0pYU0xKbWpFTmdpc0Rwc2FWSENrU2RzRkVS?=
 =?utf-8?B?LzVLTjBxaldnVUt6eGQzRWpCZkN3VzFVTVFhZHQ1QUhibHhoblN6MEk4N1hF?=
 =?utf-8?B?T0l2Zld6QWdEbkNQZ0I5WTgrVyt4akNsdDhnd1JUQ3RmMjM5RHI4Z3lwRmVV?=
 =?utf-8?B?aVB0MkhtSFZMSzY4Z21YN09SWVA5TE1VSjRWRS9VV1o2RW5KREMrZ1dtRTZr?=
 =?utf-8?B?TjUvbnFJTmhlSnduWUUyTFNUQURHL05HWFY1OUhNR28rNTByenB5WisvbVVO?=
 =?utf-8?Q?CI/x7cRHwYwn+mbORQMCbuv6txO3TuVdmoCL2VdY4gh32?=
X-MS-Exchange-AntiSpam-MessageData-1: RwZsSoRklvWUSA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 724ec2a7-56cc-44cf-c790-08de8b4b7ab7
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Mar 2026 15:22:23.4277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yiyow4bkaxd8So5C8AunteddYwhCagQ49tBLHE/tubUBmTZ9zkQh2xECAFlIFo8naTX0e0GGt1o1zvM4p6EE0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8219

Replace the nova-core local `DmaObject` with a `Coherent` that can
fulfill the same role.

Reviewed-by: Gary Guo <gary@garyguo.net>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/firmware/riscv.rs | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 14aad2f0ee8a..2afa7f36404e 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -5,13 +5,13 @@
 
 use kernel::{
     device,
+    dma::Coherent,
     firmware::Firmware,
     prelude::*,
     transmute::FromBytes, //
 };
 
 use crate::{
-    dma::DmaObject,
     firmware::BinFirmware,
     num::FromSafeCast, //
 };
@@ -66,7 +66,7 @@ pub(crate) struct RiscvFirmware {
     /// Application version.
     pub(crate) app_version: u32,
     /// Device-mapped firmware image.
-    pub(crate) ucode: DmaObject,
+    pub(crate) ucode: Coherent<[u8]>,
 }
 
 impl RiscvFirmware {
@@ -81,7 +81,7 @@ pub(crate) fn new(dev: &device::Device<device::Bound>, fw: &Firmware) -> Result<
             let len = usize::from_safe_cast(bin_fw.hdr.data_size);
             let end = start.checked_add(len).ok_or(EINVAL)?;
 
-            DmaObject::from_data(dev, fw.data().get(start..end).ok_or(EINVAL)?)?
+            Coherent::from_slice(dev, fw.data().get(start..end).ok_or(EINVAL)?, GFP_KERNEL)?
         };
 
         Ok(Self {

-- 
2.53.0

