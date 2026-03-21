Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010011.outbound.protection.outlook.com [52.101.46.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 213F038C42E
	for <driver-core@lists.linux.dev>; Sat, 21 Mar 2026 13:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774100199; cv=fail; b=kflvukWZUQohSHtdU4hEmXvLxo/1Z8yzBfEzaWKaI1/RRF61bPNwW+Bjg46PSmmxXzXt3wS2vFp00wIWNlhivRy1IQWyCN44NV2lkwHeGQ8e331N9eehWtjFlkKDgjfaHVDY3UwqXdW2MJhkTnKG042EzdJECrMJl60Z5lZbMmo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774100199; c=relaxed/simple;
	bh=mOgktagoDiyvshl32K5gA9/I+v9wXBJbbFG54PuckfE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Lt+GP/feOrJM8StHQH07I8k9e2QfmHzPkgp2VtHM0Gm5KQYIKxSvSaluKxnu6IBaahWoL5Mu1urraR2g2l2EOsMUk8SSOzcQFIjYs2X079Yq9IRJuPSauk6fGPlcOVr6jbH+0TAfmGoV6DjTkZLcM4Q6lmfnKiXxmJddIwv7MA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=NsHQxXf2; arc=fail smtp.client-ip=52.101.46.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="NsHQxXf2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n9fSW6p2v4CamFrCW14hSdUHB8y7PxLPWcjBwXk+vYWblpUvXNCsskmeYUSK37hWPHc3hQDcT6gmXnuiR2MbK5IImNvrTfvy3tnMWS9Q/H+VoB6jr4w96IC6e9eSrDgjlHV7OCV+wmQuMJcztQpcx2LiAiXsRl2oe3HwM3qg4Gz1DD9zXK+sZUnNU0z43aAdbV3zTEDxa4o6VMclgsDAeBzy9Etb03VkGVlcOzqoj8Lu8gUq0iRUfeFUqFiyOk3oKfW15gcu9HrI0Ce7w7yhYtlwk4/MLTVNhNnHMXT2S5tHhBPSzr0inRHp8Jiv7e2cvOwrXfyawLhtQsX/i3tP6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2vAoHCVP2EbUZAwnfD0jxx2ZxZcXMsi9Rru26co2rfA=;
 b=lDJZiQwF8e5j6nb9mYEdzc+GEF/8s9o59MGvPkPuCR6H2V1Qz4bAlhui2+MuUvLQFe5royBbIIPVgwIDonyQLifnseSkMd6YnDHzghIl1EP10552JvqLFPFVzV6uIDz3+ybDkvp3sjwH69/KN60FrZwzQnKHhrJon6WGSAW9o0uOkn0UBUTt04lOxao1cKtDGii5c5zUy4AQkSK932YIaCwj2UY9JvYCOEUek1/UU+/zVefXsL2y7tdjtWeUUYGbDWxjyyqTkq5e9LXy2qRxkkX1ydv8mO2BZUg66yDGoLb4Xcez/34bXVPwOf7cZsEA0idpp1dlghVJvuEMbG1uzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2vAoHCVP2EbUZAwnfD0jxx2ZxZcXMsi9Rru26co2rfA=;
 b=NsHQxXf2bRoCQNuf0fncgyfHQLLL3W6IT0pFj4NyjkdzMgVGxEMjz8CKAvIJiaOyHdCrieUC9mOyXaZPeEaTTOSP0ysf+e7xn/im7/9WyEG2963SGMDd4YuJIxpsapIWlnfNS0TmLxQCvjqULeAPds/xsE2fTXfldEpCUjq+POjQQ3Duwp+wY9eL5YG3RfaEdARoBeGD6BP4h/GOKXRXK2KDtrHOkZSKAhM2TktZqQXRA6/MzQ3OJhv8V95eoTsI0eB9V/5KT/9YtxBzdX0NbWhEc4Y/3SSKDQVVzlTldKpl8CdWseIyoeffMM4m732haMra8Cn/EhXAaMVUUdrSCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9133.namprd12.prod.outlook.com (2603:10b6:408:188::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9745.15; Sat, 21 Mar
 2026 13:36:33 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9745.007; Sat, 21 Mar 2026
 13:36:33 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 21 Mar 2026 22:36:20 +0900
Subject: [PATCH 2/7] gpu: nova-core: firmware: riscv: use dma::Coherent
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260321-b4-nova-dma-removal-v1-2-5cf18a75ff64@nvidia.com>
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
In-Reply-To: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
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
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4PR01CA0044.jpnprd01.prod.outlook.com
 (2603:1096:405:372::17) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9133:EE_
X-MS-Office365-Filtering-Correlation-Id: bf29bb14-419f-4fc5-9822-08de874edd9c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|7416014|10070799003|18002099003|22082099003|921020|56012099003;
X-Microsoft-Antispam-Message-Info:
	1jPYRFFClWT6v4YK5JuyDul2ubPlef0idu6V/ZIijxpwxZMxg2Xss2c5TceXua88iYoRUroooUSmn1ayuDHXVbrg+2PY8+Of9+qmNvAjt2f9mKkaIjZzwmj6FvEby5n3vKcQDBnRYmfqxSbBoi4YBFn48iJm+722m0TUe9fEOHfpbZXJAVL34JS7Dpd7kN2RgFH0PC2ZNIQjlTeTVEYQcgf++UxveCnCcVYXsbOxtbbjv1XabTqGPwfLYxYbS0WpE0QGrHxiI8WL0/Aq5D1Mbvc1HYmCRmE26ONICI3tsrSkA5bkbI+aaLp/7a333YD0/qNfLt4o1K+KvV6TV24ifFBbtdMvdnm1hhnfK9xSUU/BkxpAZdABaPgsXJyW7+Zwy0nv1KGmFB5my6axUh1YjmMxQoeMaT0HhE7m4YFGKRLTvP7AULs2jSsLx/fBNnO+WbvFpOYGiPhgt9Iy3Y1N9N/X9/b26uC118NzEqnoKPbddC2suua6BWF9gaUI+sq3GcQrOYo9kk4p+ns700VTGJm3SN7+smtwg04cTfDBRAOYSsw8MTxGRilQVbJQwTOkXJwcmH23xOqD/czjDHvMvPvWc/v9vYVCnIiD/+yrdCy4fZaegDM/qEEai05xamC5bIGNFgPB+JyEHMXlZaOBNlMXKu+mLm/nJXS+d6qx7tLCfG0yzRIV9hCKRdIFHm/ZFQQHaAWV53cs2MGJsu5jDXRXfLGXdLvMTThAAXsLV9hfuspJgOo3ehQzkMpUATUI7w/og3qGd17XRXSBcrTloA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7416014)(10070799003)(18002099003)(22082099003)(921020)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGRseElLUDJVME0zYVFyOVRlcXZWZGZPRmo5UFpVQUtRZEh4NUdHc1VQaFla?=
 =?utf-8?B?T3ZEanVSa1ZEVTVyOTB3WksrUDFFYmxMVlZiQTlkSjhXdFdXV3BlalNlWG1j?=
 =?utf-8?B?UzU2bTBMNEt2RUlKVWFwTlhuZHNSWlc4azhLY0xsUjlUK21Ha0pRNGVoc3NH?=
 =?utf-8?B?eEc4cDVENXNZZ2hkWWNERjNBR2RiM01JZVFtM0NWWGdKRWUwMXlTd2MzZ1c3?=
 =?utf-8?B?QkpzUEh5T0pRQkdGbGlObGpkNU9hQWxUL2dEQU43Nm1PMjBuQWs1U0lndyta?=
 =?utf-8?B?KzlGakUyMkQwb0tkbVRsYm9BVnZsWVd4M2dYd2RmUitwNnZrczRhbnlKSDc3?=
 =?utf-8?B?U2pDRHFHZmVIQ0ZyM29nbkJkOFU2ZS9pOSs1MUNzbjZhSDhCRGVTSWxYdFF3?=
 =?utf-8?B?dmRrTFZLUVhFWHRCUzlaVDBTalAxZmpPbnlYNHh2VnJhK2FKMUV2TVFPVTZL?=
 =?utf-8?B?NkJiR3hTOUJQMFVpWUNrc3lnVXd5U1lCUkRQdFlCenpxZ1FhbEYvcGJ5d0h3?=
 =?utf-8?B?eDRHS1dldFZMUTl5dGRjRS9nNEsrNTZIZTRYLzQ5MEw2WTRCcmg1YkJTSHpq?=
 =?utf-8?B?cHpjS0pxeHN0bEgzU3pTUFNwUGFLb2REekhTSjNNWGlHQmZNeUtKclFsQzIw?=
 =?utf-8?B?d0lWUUFVZkhxNkpJaEhsNW1pekNuaDMvWXUzaWprZCs5Yms1MStDbVRjU2pH?=
 =?utf-8?B?WjY3Q1VkNEZaOVI3RG5sWGkxS0hzdVZvZXhlZHJhMkV2dDdvRmc1bVRTdkZw?=
 =?utf-8?B?SlZXekFQc2ZKYUt4NlZTTkZ0RWZxcVR3aDJuZERrNHoxR1NlV2tzNzZmemE3?=
 =?utf-8?B?VHdBQkZ0Wk5ZUWxUaFF2bGY5QkMwQTYxTU1jZkVycDRaUEVzOXlkME42YWxP?=
 =?utf-8?B?NTdOb2NIMG0wZkljaUNkYSt4S29ZZEk5MTV2ZDBlbVVmck9vbkdpbU5odHJl?=
 =?utf-8?B?OU13Z2FQSWQ4ZWI2SXF6R3dBN0NsM0hKdXJyRFJkUHcvdFJBWmpEa1F2U2Jn?=
 =?utf-8?B?TzRiNDZkdjNacldYRWVVK1oycmsyS2lJM1R2VWhMeXF2ZzN4anZZNE42ZEpO?=
 =?utf-8?B?SlZCbHJFNjFwT3VVTHRXZGU3aFpDQ1dMVnZqZUJtT0YwbTAyb0dXYU4wcGNZ?=
 =?utf-8?B?SmhFRTd1UlN1c0dBN3Z1NG4zOXdSc3NyWktCeC9PTUVZT2lPSjQrQitYdThW?=
 =?utf-8?B?eW0zNkFlQ1hRbHpGSk5vZ0dEUm5NWWRkMWZ4NHg2MnlOZVFSd1VXd2d5Q25m?=
 =?utf-8?B?bExhQjVNNzh0VHc2YWt6V25oWVVKMnZqM1piTm8zQ21PVG42aTBYM0hpb2tP?=
 =?utf-8?B?Rk1OYXRndWNkeGc1TGV3dk1PZG4zdk1ibnFFcy9HUFpEM0xqWW5SVWJYcEkv?=
 =?utf-8?B?NGtMUWFhZks5dWIrY2ltSnhKUmp6TG5jTGN5a1h0bldIQkcyNGpES1RIQW03?=
 =?utf-8?B?MFkyV2dyWk05N21WZjJjMUdKWll2bXZZQTFOdzJTdUVJTG1QWnZrSDZkN0Va?=
 =?utf-8?B?YmdNdDRLRDk2LzVQeHk5dFUwc0ZYaFVZZldVWXdhT251TGNyMVhiVVMzYlpv?=
 =?utf-8?B?Y2x4Wk5vZXovR0JnSzBCcXFWMEVLLzdJa0h5cURPR3pJWUIrTTVvWEtuVGd5?=
 =?utf-8?B?Yi9ma3craWd4QytEaTlsUTk3UXdIK1p0bWFGMmd4OHlmN25UMjRNMzl6cjFu?=
 =?utf-8?B?U1gvczlDR0hzdE56M1RVU0p2VFZLL1NVc1h5bUJOSkgxcjVGaWdhZnBvZjJv?=
 =?utf-8?B?b0dyTzBiZnI0eDE2ZjVXUVMyeWxkMEU4WFU4V3pmaHdxbVlMWmczMXVNUEpj?=
 =?utf-8?B?Rk9rMXYrM0dJTXFPa1kvK3BybFphQ2tOWVh3T1Z3SFFsOGdTQ0RSRzJ4OXor?=
 =?utf-8?B?VE5PVmNFUUZKWWRZMlB6WVh0cFZ6OGVqOHFXY1cwRjY2WUtKcEthOTlMbTFa?=
 =?utf-8?B?UDVObm1HWU1KRDNsSlYvY1RPeGEwb2Rsdmd0S3dOVXZrRnhOdFVEaTB6SFNS?=
 =?utf-8?B?VlN1bUNJL3RyUjgyWVFJQ3FYcHI3L0p6V0NiUFRCdUt3K3VOSEpTMmNXRzMx?=
 =?utf-8?B?UEtkS1JSQTV6K1ArbWZDVk9UaUkwVXpWU3V1OEN2MENzeGZuZUNvY3RPMUFx?=
 =?utf-8?B?YXEzdFA4d2s3UThYU1ZvT3dSVkdMT2xqRXNlUlozY2ZOMEJZYjZacGVoRUFY?=
 =?utf-8?B?MGMzZTIxSGRJa3hoZEdVblZCTXkrWnNpbldISnl0RDJub3o4dmdYSVRXSVZE?=
 =?utf-8?B?VmVTTnR1TWZZK3pBKzE4azA0WEdSU0dzUVdGbi9VTUtqL0VRSkgvWkpTNmRS?=
 =?utf-8?B?aXBGRDBGeGZLRG1wUUVFUUsxNGZCN3Q0bHBncFlUWjJodTlSbWtZV05xb2Zt?=
 =?utf-8?Q?5SGB1dNLkAY8OzA9QKmoG5qThFiopTWMo8dLdnGBLFGsi?=
X-MS-Exchange-AntiSpam-MessageData-1: XwV/8GxBKb/CVQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf29bb14-419f-4fc5-9822-08de874edd9c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2026 13:36:32.9780
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SRxFAEhUC0rvCkpOJjsj9beIaNRDZxs736xNbjRREuzrNaZu4tqic6bYLOKjFgNNGPpeh+s5O64/Xgezayl+IA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9133

Replace the nova-core local `DmaObject` with a `Coherent` that can
fulfill the same role.

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

