Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011007.outbound.protection.outlook.com [52.101.57.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 478F63FF8B5;
	Wed, 27 May 2026 12:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886356; cv=fail; b=h55nOlo9Jb2EXo+sq1TYb38pKx9SifwGabodm4UXuZRRToTc6VjNI3AqLMz3O7Pa8dF4l7pKK/XCC08gFOxWq30n4vDWGdmI+yWgLU/pPUM+tZIaCeqb5Ppc0r8WCVjMTQnVmWoWDB45BRhJvObw2k+vRCdKT9Djh6MhLYO03Fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886356; c=relaxed/simple;
	bh=8x9okYaVHopE+Wjy3M752aOu3+fAsudWFYy2V8YGIJs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=Y+5tLTmuht/NuiyvEegcmtiYBVQEdo9+0uzsT/rc4bE8ZDYsS+rAc31FTZDZ/wUgKEAsl4AdOe6F29E/EE646uN/eQLv5cry+Y7fD6TdF4lLiGPMz46Mwuf2HJ5MEFNNBXOtZ2BfNqdfL5J9zVOuwNd8lMIJRFhSFaQplFtfob4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Len0bq03; arc=fail smtp.client-ip=52.101.57.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Len0bq03"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnDa1VQbgaAMiv19th8AjrRMEUS3UcE/UknZdIgLJEsHXdNmttjLuZm6HMOxFCZXXDPvrJs1QwvoIM+SRKQCrPOMUh5n6u/2cF1o2c6UQ8FByge9lArr1sQrM8ExUPmiIbZ62e/sUSG2eEjsilnSzzElYtLtqbVqfheRtII2127hQljOd+x0lo1WHVEENHCWu/7XamUW5DMX+2hXnxGO1cxKcpMmOgVny1mJtVaWG9p/SaBO22BXBdJmyHjXuZDmfy1nHkWxkZsCuFfXa8rSm9HMz7bGXg9m87cK44zhCaIkY7AgM7BSBJnYfyXekNv7vQcCPf5tJG0suKXEF0SjTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYiYsK5tHRDNs6gpnUFafZw04n3r0z4GvEPFr0uhMbY=;
 b=tXa/ksl6LGBGIe0fHCabdinjW+sONVz1jL0oYp457kxSSDKexV1YAyRLPrT3WMIf/XIR0TspToKPnSJyvYRg/1udd8YImEXzjkHFprhW9h5Fv9Juu8picJJsX4M5MWmVqj4DIpoNJFiha6/8pzkxem1FVzlr2btdHqhiKri7HPHgzPabJe4BleDAqeCkfSQLiZ2CQU5xK/LyTckPgLSRI2kO7C0sxhrXo9F7RwMpR1+yaTe9NPhVhZ6OEmMW5khT8NZ5wB4CeU3qrmMuQbzxYCB0NKPiD/3L7ElaYHFxRj0TitObN7f5VlvPZYidFFoDzvMBkPE209q6gxdd3eXuwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYiYsK5tHRDNs6gpnUFafZw04n3r0z4GvEPFr0uhMbY=;
 b=Len0bq032ID46LU+5bynCPNC9h8NJWjD0YFZcmO2Qpyazxkx7bpU85STiyG1s1rKbJdzvM2dzUUlX7KyUDFF1ISQEUBzakFi5lSZUEbMZAHS4DwdmepxsN8jvwv3kxI/JIeDAaa4eKpr7Zm+YVeRsRwYZaF9WhQR8WAMfSx/Z0E662+AcM/OH0pRaHYhTc1Y2GB2gM9r0Fzk28uiQr22AOR5x2frc2lSJOAEGrRO+LmJ2tOPHocAHKNOdZ+2VxgXGHfooAnLR7W6axWqrgDvhwPL8Xzura5UCNzbigwM4l5P2ynL5QUtlvwOFLu1M83nCzRvxZVI+KzUz0taA0Nc4Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 12:52:27 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 12:52:27 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 21:51:59 +0900
Subject: [PATCH v4 5/7] gpu: nova-core: switch to kernel bitfield macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-bitfield-v4-5-e8821d4efbde@nvidia.com>
References: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com>
In-Reply-To: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com>
To: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Zhi Wang <zhiw@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nova-gpu@lists.linux.dev, driver-core@lists.linux.dev, 
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7P286CA0029.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:26d::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ccd2cf8-9d06-4dac-377c-08debbeece09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|11063799006|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	dqBQ1mOo+/IpR547KNZXFd1N3jR2dZ7yS99nthhM4M6P/2eLmc8X/kN4v5FWaBS3PryjsrnMEpphBycbhHdE/06sFEP5l7VNHl/0RyblFpl81QFFvu7EHy9SA6hywQOJkcU+IFDTzYInTwrv3yXH/IOud9ayEKhxYh9iIHhCI2wFmqIc5BnZpgj71WDL/Kr5WHEvK4Zo52Cc4JpKY19UvvaB9yL/x0Ibf9H2B7EpD5ROF5XJvxf50buJdhEYCqjk/Chx/ubZXXIzQVBBzhSwVapK+V9XSmQ7BBaloSD7Wy0wTYQ+XTTY4SZeuEhTsdj1nGiPrx2zZn4JQUQbAm9BE8dexq1S2Vztno5dtFRTbINPzc25QDL/EjuBE2MTaRUj2y5MhIapO5YQ2I3BnhRVyYxZIV1F01GMiqfuFR2xR2sO0sCBsdFwmUfbChNL/fuSmuwlYtLLN70VSp9YD480CCPgqcx/uU8noN1sKajfGfb+WMkwuL9yVi3aZ81bK018YLCkhtYQ0FJDk1yQ5618QdOS75271+BP+IETMosEd/MR7HVimCVfB91OrTkKASyaeTijdoCHzZ1dGsE6yUIEmA7SWxIK2XngPj9RnrHUIC2HxV9wbcQAMkvRBgFi4WnNqAhnNngxSLWmuqRdIjrGYx66CcAYOhM7tIzOBDqYHDyG7uHrX0rC/COykQOOCpnn9D2zlfgpy+b+Bts57DugoPrUCUIXh1pyPOcHl2s6/3U=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(11063799006)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cjE3U3BnOFlhbGhNQ2Q0aHhWTEg1ZU90VHlqY3hXTElXSTFvODdjdFp4b08y?=
 =?utf-8?B?dXcvbGdjN2dqWExpWmkxWCtIelhOdWZnN0draUxlUW01UEVwcDhHam8rdGIr?=
 =?utf-8?B?aURkbkxvZWozVDVGUWJ6T1hVdFdIek5FdEdGbElnYXlXNXNSb281Tm5tTWlw?=
 =?utf-8?B?ZHZnc0ZUa21OTFU4TDZSRFBhQWI1eHlTd0krZUUyNXZyN3hMOTlyS3h6TzFO?=
 =?utf-8?B?N2VTQmJ1NEhxTUlwNjllT3pOaWd2QlRtamFYalVhT3BCZzZyeklSMU1tdExa?=
 =?utf-8?B?QnNIYU80U0U5SnBrQkM3V014VTVBWkdsZHEvMVBKTTN2WEFMRDBMQzZFK0VK?=
 =?utf-8?B?Ukdxcmp5c3ZmU2d0ZW96YU5GSEthZk03SzMxSkpSdGQrd1ArRlhnUHI1cm9O?=
 =?utf-8?B?WDZMQUhxRGhjOHdQUUs4aVFuY3RacDNKa0tZYkR4YkVKQVNUd1pTUXlBd0FZ?=
 =?utf-8?B?czVJWE0ybFdwL3BqMHg4WmpPN3VZR29JbXhpNjFmN3FNZWk0N3hoTEFpbnNo?=
 =?utf-8?B?MFArVU5QeU9kemc3Rlk5VTFFTS8xN0o5RUUwRkZjaGIrS3pjK1FHY0RIWUZ2?=
 =?utf-8?B?eDk4eEsrcnN5U2FxdlFNMFNKZ0RHajNHWjFvemlSWHc4dWNhNVdDUG1UUm9D?=
 =?utf-8?B?cmVHbzd6dlFwakZNbzlBZVQyZy9Wb0l5SE5McHBWNnJVU1l2d2tNZEJBcHFv?=
 =?utf-8?B?dGxOSnQ4UWhldzdsNjRmTi81NHZZS3BzZldHdG9zeG5DOTQ3Y2xDVnlmRnZI?=
 =?utf-8?B?enhUMkxuUmVQUFV6NzdEMzBEaWp0Q29LOXRkQUE2aU1HTW5NaFp6L0R2RWlS?=
 =?utf-8?B?SEdJdTBQRms2SVZTQjNZdnoxcnJSM3BQL2VHRTNuWTZVRkxRdHpqT3A4Z0Q3?=
 =?utf-8?B?enRoYWdxaHNoT2QzL2JiRHcwS2RxM3JqOE03Z1lBVkxBZzZRTW45WjRRTDRI?=
 =?utf-8?B?djQzMWZQZld2SWs0ek1VbHJXaU1wTnJha0hvZHlFN2N4MXVnUEhXVVRHL091?=
 =?utf-8?B?dmtYNldaRU1mN3BaYUxRa0ZxdEJBNUkvTm5SellUeUF4YVlzckRjOGxiZEVt?=
 =?utf-8?B?WW9RNnhobm5ISWY0WVVEMVRQa1NnYmY5U3VZRmZZZjBFRVZ3TUhZSEg1N2Ux?=
 =?utf-8?B?MjczMzZYQkFScERDOUxqU0pVZ00yUmNvQ1czSDVSbUQ2dmRDZHhEaGt2c3Ro?=
 =?utf-8?B?MXdqRkR5Y2QwZDYwdmNza0t3eldvM3JvZk1qcGJxdlJ2OEordHFSbVQxVUJk?=
 =?utf-8?B?eXVrQ2tkcmNtN1l0b3lLOVNIWUhJYVcxSDhwZTdnelE1SkUwRmE3b0x6QnA1?=
 =?utf-8?B?U2dQSEVrZTR4RXBJbHlkSjZJcmNYSVJ4dTdDSG51Z3dMQitINWNETy9GNUFC?=
 =?utf-8?B?WkRzeDY3OVZLQk1CQWl3Vmc3MXdCZmFIbUhwYzVydnlqL0I5TUN2WjJ1NGZO?=
 =?utf-8?B?eUFoT1JQclY4dmgxN0tTZFBheFlOcWh0bDBTS3l1RVg0amNXYkR6RUtLWHJO?=
 =?utf-8?B?T3prZlNBMmJLS1VEYnQ4VXp0OS9pVmloYysvZmYxSUVKNzZBZ3RJditpZ3dk?=
 =?utf-8?B?VS9LOUR6eHFybFM4UFFsNFA2UU8rN3B3ZzZrQ1lRdUxNdi9OaVNOM2hJUHdK?=
 =?utf-8?B?ejM4UVFWVW1XQnJVUW55TWQ2cEhWVCs0N1U2UU1YelUzeHoySHJxMkNjZWYw?=
 =?utf-8?B?YjJvOG1maFpMYUovbisrUFBZamRKclp2b1VubC9tZS9HUUUraGEvWUFPMTh1?=
 =?utf-8?B?cmhEWmpxV0xmV3ZNcUEySDFWNUdZM0Z6Qy9VczNBbFBqSERNeVd1SElHNURm?=
 =?utf-8?B?Qk5ZcWRkdlVIcVlSVDBmWXRxenlRN1FVL1FNSE5zcU1RczBJV1YxRmJ4bTh1?=
 =?utf-8?B?aTVoYnBsdHRzZ2R0R0o5L3JHZDJNdWtmNXVtRkZMZmRlNzJuWmhOQU9NUGFn?=
 =?utf-8?B?YW9SMDJmK0NWZFdEWHZQMXpvK3kwTWphREpOWm14OFZSeTlRb3NkK3UzbVB0?=
 =?utf-8?B?Y1FHZm1HWmp1bWpkclFvVXo2UVM0M05CZnc3Q2Z0UlUwbnJCSncwR3JuSjgr?=
 =?utf-8?B?YStOS0JzNGdVWVh1T0N2Tmd6N2U4NWdla1BMS3pHV2QwZ2VoTGlFWmpSYlVl?=
 =?utf-8?B?cnBOZEdMUnB2SzFkWHF5SkdkNit4eXN5SnpXbEM0ZFE2WEQzcGRRYWp3cCt2?=
 =?utf-8?B?M0hCYlZLVFgwcXBnQ0cxNzZmKy92WjVkQUxMQzNRY0NkUUFIK0R4aVl3SVRK?=
 =?utf-8?B?QjNrRlMrcWtpR0VWZGZtN256TVphUUUwdUVjVlFEck8zQ2pIN2FSSldhQXRG?=
 =?utf-8?B?RDF3U25jdWFZb1c1cXZudE0xS1ZlSFJJdkhGK3NQK1BFbzVUOUZNL1NVU2Er?=
 =?utf-8?Q?1X2BlRoNlowYl7QeXn2FPe6tRvIvuEX7l/8uDhcBVr8nh?=
X-MS-Exchange-AntiSpam-MessageData-1: yLxXN7HVoYMxpw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ccd2cf8-9d06-4dac-377c-08debbeece09
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:52:26.9811
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oa7CeQ6hhhCT0WjQsPrBbf/Nuvi0+Mh0PnjKvlZbDYI7cvfRLUwpQ3m1lIZBbNAKG9F70rf4CKvRY+ucjFPw4Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841

Replace uses of the Nova-internal `bitfield!` macro with the kernel one.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs    | 11 ++++++-----
 drivers/gpu/nova-core/nova_core.rs |  3 ---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0c8a74f0e8ac..d54688904740 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -9,6 +9,7 @@
 use core::ops::Range;
 
 use kernel::{
+    bitfield,
     dma::Coherent,
     prelude::*,
     ptr::{
@@ -728,8 +729,8 @@ unsafe impl AsBytes for MsgqRxHeader {}
 
 bitfield! {
     struct MsgHeaderVersion(u32) {
-        31:24 major as u8;
-        23:16 minor as u8;
+        31:24 major;
+        23:16 minor;
     }
 }
 
@@ -738,9 +739,9 @@ impl MsgHeaderVersion {
     const MINOR_TOT: u8 = 0;
 
     fn new() -> Self {
-        Self::default()
-            .set_major(Self::MAJOR_TOT)
-            .set_minor(Self::MINOR_TOT)
+        Self::zeroed()
+            .with_major(Self::MAJOR_TOT)
+            .with_minor(Self::MINOR_TOT)
     }
 }
 
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 04a1fa6b25f8..3a0c45481a92 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,9 +10,6 @@
     InPlaceModule, //
 };
 
-#[macro_use]
-mod bitfield;
-
 mod driver;
 mod falcon;
 mod fb;

-- 
2.54.0

