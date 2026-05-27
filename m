Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012031.outbound.protection.outlook.com [40.107.209.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 458F93F5BE5;
	Wed, 27 May 2026 12:52:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886338; cv=fail; b=e4MPMKZnSqhQsYnnlF+HKIF+Uu5xSF04mpKWDrHKsjF2fu5PgSUgqi9vqVffgJXvey3VlfA5tREqyWigQ3FVhK6kb85cNIwWBXj6/RHmX/ma3WDf3hf0cheYn4R8y3lHxZk0OkcSp1oxGRYvOK70BRjYJCEEp14dWBTr2HinHI4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886338; c=relaxed/simple;
	bh=oojxiCCfm502lvUIqGCEIxu5OgAVa/UCBZtWaL8PHI0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=UQPfCTI93bV6uNRzFTVpHzQqjGmtmOlZCYPjmleuvpYfUKByZmnzSCIQjxqj7/I7mTDIMPjek1B/Yfaime57NgUHq9P+Bqvs4JKcS/cArga2rwnMo6XBtm2i2saBLcEPYQlP5ODrwT7F/OaLC0+EbXjx/qFLt+UQnhku5zrNJg8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=DQLyNrKI; arc=fail smtp.client-ip=40.107.209.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="DQLyNrKI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xMa9nGF0X44wyW/e65hfwqSzzIDhFkQVJuPf5Nl1jByIpWiVvhb/spEBKMkDybbqArzzqFOqI+HzqiKZu6R1u/ua1B6aNLuWPekdMTEfAZEUbz+x9iJkcQlZzAtwxeZEudMp58SpT9fZLhcW9NTDYeHbdWeMqkesf8Ee7VpCcPLZ8vpmU5HNgmMUWEuEpH47iWnshUoAV1gunX6ERAVGo/lQXiQRpmzUsgXaFAh6E92y7TSI3ltaJCnHbg3ybvRh+Ts5y+ON1iZa19IBlvA2cOTJatlplxzk6ZcbleEwJwr9CMKjFyf7B6z0hrfCmwZG2LjbqxJv60reuRHpXGBUTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7Pi6FMwv3xPdY3Z7Hognb23EzXbhALeANerdXj72mV8=;
 b=qZ4BxtJ4QK90mxzt0/3KTAwtNIMzv1XpZNYy8ji4iqHm3NSqHf2LODaU7FeDHAoKaCK/hq+3UYfSpPZBy9MR+CLHOEsK/Sl7bjM+cUjA4I0GitDcRcavV5LhfrZU/YEgsDNC67GJPZZZJitMhQtIHd89Llqz3qOuxzeiQUZ7+pHSfuVf/9DWHBvKE6YMZvA5q4uP62m+11dRziVT4i8vnFaoNJWbMFAkopjHn+ZaWc/HraaVGtZ0fqoGlBKoar0Bs/bMV7jIjORJpYmBqdxHIrzOHhssk7bNhv4HqGUOQ33BP+J7wPr/K0Mi3jBP/CmcaphwRIMHqdWrcaisKn+WFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7Pi6FMwv3xPdY3Z7Hognb23EzXbhALeANerdXj72mV8=;
 b=DQLyNrKIwGc4I0nOCBQ1w9vkMWEYZLitskIavjnsj2LRm9zeCVOYuG3+VVivYU6MjUUZaltWcvy3LjtAPISooSi4THKPb+CZ0xGI0Q3YL8fOrawTkQrdAhdfDXcdjlsUZ4DEJRu1V+aRy2NDeTcg7pKlHOp7VBlwKytVy69FwqezKsxr9uDaXSU6ICyZmn9v6VfUjHmlXgjDk+ze1qig2OhpB0D7dR8oq/PIlSE5rZodKL201cgNAVzxxk7y4h7GLUEuwmFXIXyorrg6MrXMTdwfVh1xI7kMSQuHqEuCj7vNXFo1ZzfQ2YE1kOE/ei2+THX4WugiGhE+KoCA9xfG1Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 12:52:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 12:52:10 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 21:51:55 +0900
Subject: [PATCH v4 1/7] rust: extract `bitfield!` macro from `register!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-bitfield-v4-1-e8821d4efbde@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <ynorov@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4PR01CA0036.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::6) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 4545efa8-55f0-4bd4-c0f4-08debbeec34b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|5023799004|11063799006|56012099006|6133799003|22082099003|18002099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
	pJxkzUUisKbXhFZyuGnTcBiL8rQ8UlL3JQIWfyf8ACzeajZUaDFvVhDNRfNGEbjBNvK4szdfghb8SRq7FMPt5BW4obL5dqVz6NldDr0etdjaK8TLf/sm2fUQ326RVXtAYwUwboeOohSSt/yBZTbyhUs5CmBLCrQLvAEOqWpf3nilNE0d5+uGBuTdf7aIVvTatk5vcYeH7yKW4jdjd2bKxoiRChKPzzFFO5s17muw8KhDstrRNw36DubUtEju8s+NqOcAXt1qTDLEE4uzyDHnEFWiVOKMJmjqMIfkifZ+rE2FP6ytRwEGCeyubL5LEiC0h7LbmyEPfe2UwDQkCqAXZYXYLGoFbaXR3dMB6J9RDccnf+pjA+ukg92vEw/C9ZExr3KJbA3SBYxIufkXtyjyL4Wa8NGMd4kEiDro6DdIohoHxToNGVfdsmwBP2dji9/3d0j9IJy4pnzV2TJ57wHWkJ3VMLFjSlKNz6JADoYNPpCuUCw2iOyaKhFKPe7oGpCL4YCOyJEZGZtnJC3DkFnOQQabuz39pm+vfZAekV9IaSlW9Aroj63SrbXujgqqCaPe/FazedGpmThfluvgaqUpBPIguUuZRSZwTsx4HA5ARcTRWAglDEM6F6FYRSAIpJpOYADJNOkor/Keg/AHwb/UJ1I+RLR2BVsmXNsl3a69cVg7dybr+NNIJEGz27P2YD1mu/gHUEAkpA5I63/OqzAtWO99/ITnEpua0rZ544oaMMuH47mjp3pl+NKNd1rQ19QJ
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(5023799004)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZEJvMXBtVndBNHMwR2U5Tzc5RmRBaG5jNktDUW5DY0JXRThRZ1NDc0FEZy9k?=
 =?utf-8?B?cFZzbDYxNDJzMGlJa2I3OGVOUERUTzJMMEV0bmpUZHRsZC80bEVmRmZMSnkv?=
 =?utf-8?B?bG1PNHNJS0Z0UXJicjZIZHN4M0tnR0hIS0w2d28veGtDQWk5eXJ3OFRhc2JS?=
 =?utf-8?B?WnNTZWpoSi90NDRPL2VTbE5weStaWjdINUpTZHFSdmp2ZGxNWmtDMjV4Y3NY?=
 =?utf-8?B?b2lxOXhqdjZ4ME9xVElVT3pPMU9HOHoyMmpyUk9XNjUvNjdsM0VQY2FxTlFa?=
 =?utf-8?B?OGxmb0ozTGlFRlNNbit2ek5zNHlnRVZ1L1EzNnIwVXcvaUpFRS9CcDJEOTRL?=
 =?utf-8?B?Q2s5RjdUREp4Nmg5bVA1MldhWDdXZXFhNENDQmNEZk5kNlFvaVp1dTFHZVFk?=
 =?utf-8?B?WlM4MWxPRmNBRHhWQWxKSmRSMkxoSHNiWVkyUkdWSGlPc0E2YllWbUpCTzFs?=
 =?utf-8?B?OVRPbzFyY3IrRndJbWtIU1luMzFraDBWOEJGNWhINTFXd2UxRzR6N0pYZnlN?=
 =?utf-8?B?cFJKTUdod2ZpTWpLOU5abWlRSnNJd1J4S2VPQWNxRGtSRCs2MmpnNFJ3bDIr?=
 =?utf-8?B?UXUvOVNweVVoUXZoazcyVTNQcEcvSHI2R3k0NE1hZ0pLeGQ1VVRQUDFUWnVH?=
 =?utf-8?B?NU8wTlBLcG9XOFlaTDFzYkFrM3NIL1p5OVFFU1hUUlk5enUyNHlyL2NaY0xz?=
 =?utf-8?B?VTVpaS9sR2JIZmY1YzVKekR4SXk0VmRMaHNvNGJHT2RDVi9FWk5keWl4QlhU?=
 =?utf-8?B?MVo1WFJtelFKaWJOZU1maTZVUDBYdHp6OFRUQkZzNndOWEdvQmViWnZEaHlW?=
 =?utf-8?B?Ui9vQU4weTlDK3NUaGFqK3lIZnBteTFPZ1d4YndjT0RGTmlBNTVzWXRqTnho?=
 =?utf-8?B?Q1R6MFJxcXpab0s3VXpJRkZrY3dqRXphK0NwMFpXOWxhVFRROHJHZXNxYnJI?=
 =?utf-8?B?cmxWZ3cwRnpVa05FWVIxMCszeGRNNWc4UDJwR1dOME1QQW5tamJFYXQ4UUR0?=
 =?utf-8?B?MUh1allOVnVuaXhRMmREUnJEcmFsM0tpWkkyQllSS0VNTUs3ZU1KU043NS9w?=
 =?utf-8?B?czRFYjFRTlVNMnRETGdyRCtXdUpEQ2xWK2lnc1R5QnBaaTdRTnpXU2RHZEJh?=
 =?utf-8?B?U1pFdlpGejA2OTFycEVvV3gwL0dXT0pZK2E0bGRadDhqb0RGcjh6aFp4NktI?=
 =?utf-8?B?eDRwSWQvWk83WHBIWnpybjdINHdDNVFHUGxvVVhNQmFZQlpQWnRkREE0WkVW?=
 =?utf-8?B?TnBLcGlEWUFzZGJjN1hWNjk1MVJhYUVSODZ6K1ZIdU9jUUt3RzNwcnArb1I2?=
 =?utf-8?B?YkZmdGlIUmVJR282OHdZNWZjSDBRd3Q3MmZHa3M0Tm5Hb2wzTUlhTUh3VFQ4?=
 =?utf-8?B?S0F4OG5HV0xaQlJFeDh2TmxOUVo1SFBiVUY2Vi9EWkkzRVRwTERjLzBoaFFu?=
 =?utf-8?B?bUxUdUtnL05LR0xwcytGdG9YVXlheStiNVd3NkVSbkg4dVVRQ1RERWVwVktG?=
 =?utf-8?B?ZlBYTFV3bTJZYXMxSXBLTDVNSXByTWhueFBvc0V4UUpHWnVhVnhFaGJrb01U?=
 =?utf-8?B?R1p5Wm1pMk54K1RlVTFKa2E2TWZSOXBicFE4bVNUMTVtVFdZWkwxRmNuRUtx?=
 =?utf-8?B?MFRvODZPMjFkMWVqQXNRMTZoM0FQNFZna2owUnJBMzFZZ2FzdEwwRUxtaEpZ?=
 =?utf-8?B?QzlVTkJjS2dWZFFtRjIyY1FobXpiV2FqNnltYjZUb0hEQTNSUUFJVnRFdjVl?=
 =?utf-8?B?ZWZIUUczVDR0REpkT0dBc3FlcEdWcGQ3Q01hdkszYXYwMmRvTi9GR3FZMkF3?=
 =?utf-8?B?Z2RKS2tlMWduQnN0R1Z0dHQ5TGcwTE5kTjVkMkFkbjd6SXZ5TE1VRWxVUm52?=
 =?utf-8?B?SGg4aEMwZmtXdUVRYytMRG5yM1BSeElqWkJ3cjhPcDF0R0pDWXR6aVY0OGJN?=
 =?utf-8?B?OXh6MnNSZ2VHNGNsdHZFRDhrU2VnVjVHZGFuSUtNOW1zQWZlaUNXR3Jsa3pP?=
 =?utf-8?B?cDE1Sk9SUllVR0lmSFZMRWczMmQyaVZEQnlacnhncGJibTE0MHRxcjRKN0RO?=
 =?utf-8?B?OGpzWk91NzdMQWR1Y0svODkrWkpYeGc3cDF2T1M0R2lScXRHaW83TlZpZnQy?=
 =?utf-8?B?TXZjT1R6Z085YWlFZXF0cUdZUGM2ZGt1VzJCNndiZlk2MFpyOTVFS1V3VDlh?=
 =?utf-8?B?U3NOWjVOdUJqSVZsRng3eDFiUTk5OVViQkNqSjdHN1c1VENLM29vUTdwUE9X?=
 =?utf-8?B?UGZKV25UUURtRTlKQmhQeFRTaC9ja0xkWTYvZkpCM2tjZ3lINVhZSDEvN1Bl?=
 =?utf-8?B?MVZmZ083V0RpdUFXT1J0RlFiRGdDZHhLQU1OTlVrS1Z5UHJsenpzSnFHS2pL?=
 =?utf-8?Q?r8bOj6JNym/HCPcuOmqOIkrBVS+Yd/4SOp+YP5l7/6bF7?=
X-MS-Exchange-AntiSpam-MessageData-1: nV0TrjKCtwBIrA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4545efa8-55f0-4bd4-c0f4-08debbeec34b
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:52:09.4833
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /sla6VOC0YnMrSone2twfslf0We6ichM/5mKhvmNNLY9Czu1UeWomPl6MOP+tdhEnSEx+dZIW8cgSvIJdACWmw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841

Extract the bitfield-defining part of the `register!` macro into an
independent macro used to define bitfield types with bounds-checked
accessors.

Each field is represented as a `Bounded` of the appropriate bit width,
ensuring field values are never silently truncated.

Fields can optionally be converted to/from custom types, either fallibly
or infallibly.

Appropriate documentation is also added, and a MAINTAINERS entry created
for the new module.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Yury Norov <ynorov@nvidia.com>
---
 MAINTAINERS             |   7 +
 rust/kernel/bitfield.rs | 546 ++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs      |   1 +
 3 files changed, 554 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index c2c6d79275c6..d40e0c606893 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23422,6 +23422,13 @@ T:	git https://github.com/Rust-for-Linux/linux.git alloc-next
 F:	rust/kernel/alloc.rs
 F:	rust/kernel/alloc/
 
+RUST [BITFIELD]
+M:	Alexandre Courbot <acourbot@nvidia.com>
+R:	Yury Norov <yury.norov@gmail.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/kernel/bitfield.rs
+
 RUST [INTEROP]
 M:	Joel Fernandes <joelagnelf@nvidia.com>
 M:	Alexandre Courbot <acourbot@nvidia.com>
diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
new file mode 100644
index 000000000000..4083e7b7a307
--- /dev/null
+++ b/rust/kernel/bitfield.rs
@@ -0,0 +1,546 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Support for defining bitfields as Rust structures.
+//!
+//! The [`bitfield!`](kernel::bitfield!) macro declares integer types that are split into distinct
+//! bit fields of arbitrary length. Each field is typed using [`Bounded`](kernel::num::Bounded) to
+//! ensure values are properly validated and to avoid implicit data loss.
+//!
+//! # Example
+//!
+//! ```rust
+//! use kernel::bitfield;
+//! use kernel::num::Bounded;
+//!
+//! bitfield! {
+//!     pub struct Rgb(u16) {
+//!         15:11 blue;
+//!         10:5 green;
+//!         4:0 red;
+//!     }
+//! }
+//!
+//! // Valid value for the `blue` field.
+//! let blue = Bounded::<u16, 5>::new::<0x18>();
+//!
+//! // Setters can be chained. Values ranges are checked at compile-time.
+//! let color = Rgb::zeroed()
+//!     // Compile-time bounds check of constant value.
+//!     .with_const_red::<0x10>()
+//!     .with_const_green::<0x1f>()
+//!     // A `Bounded` can also be passed.
+//!     .with_blue(blue);
+//!
+//! assert_eq!(color.red(), 0x10);
+//! assert_eq!(color.green(), 0x1f);
+//! assert_eq!(color.blue(), 0x18);
+//! assert_eq!(
+//!     color.into_raw(),
+//!     (0x18 << Rgb::BLUE_SHIFT) + (0x1f << Rgb::GREEN_SHIFT) + 0x10,
+//! );
+//!
+//! // Convert to/from the backing storage type.
+//! let raw: u16 = color.into();
+//! assert_eq!(Rgb::from(raw), color);
+//! ```
+//!
+//! # Syntax
+//!
+//! ```text
+//! bitfield! {
+//!     #[attributes]
+//!     // Documentation for `Name`.
+//!     pub struct Name(storage_type) {
+//!         // `field_1` documentation.
+//!         hi:lo field_1;
+//!         // `field_2` documentation.
+//!         hi:lo field_2 => ConvertedType;
+//!         // `field_3` documentation.
+//!         hi:lo field_3 ?=> ConvertedType;
+//!         ...
+//!     }
+//! }
+//! ```
+//!
+//! - `storage_type`: The underlying unsigned integer type (`u8`, `u16`, `u32`, `u64`).
+//!   Signed integer storage types are not supported.
+//! - `hi:lo`: Bit range (inclusive), where `hi >= lo`.
+//! - `=> Type`: Optional infallible conversion (see [below](#infallible-conversion-)).
+//! - `?=> Type`: Optional fallible conversion (see [below](#fallible-conversion-)).
+//! - Documentation strings and attributes are optional.
+//!
+//! # Generated code
+//!
+//! Each field is internally represented as a [`Bounded`] parameterized by its bit width. Field
+//! values can either be set/retrieved directly, or converted from/to another type.
+//!
+//! The use of `Bounded` for each field enforces bounds-checking (at build time or runtime) of every
+//! value assigned to a field. This ensures that data is never accidentally truncated.
+//!
+//! The macro generates the bitfield type, [`From`] and [`Into`] implementations for its storage
+//! type, as well as [`Debug`] and [`Zeroable`](pin_init::Zeroable) implementations.
+//!
+//! For each field, it also generates:
+//!
+//! - `field()`: Getter method for the field value.
+//! - `with_field(value)`: Infallible setter; the argument type must fit within the field's width.
+//! - `with_const_field::<VALUE>()`: `const` setter; the value is validated at compile time.
+//!   Usually shorter to use than `with_field` for constant values as it doesn't require
+//!   constructing a [`Bounded`].
+//! - `try_with_field(value)`: Fallible setter. Returns an error if the value is out of range.
+//! - `FIELD_MASK`, `FIELD_SHIFT`, `FIELD_RANGE`: Constants for manual bit manipulation.
+//!
+//! # Reserved names for field identifiers
+//!
+//! Field identifiers are used to generate methods and associated constants on the bitfield type.
+//! For a field named `field`, the macro may generate methods named `field`, `with_field`,
+//! `with_const_field`, `try_with_field`, `__field` and `__with_field`, as well as constants named
+//! `FIELD_MASK`, `FIELD_SHIFT` and `FIELD_RANGE`.
+//!
+//! Therefore, field identifiers must not use names that would collide with generated items for
+//! any field in the same bitfield. The following prefixes are thus reserved for field identifiers:
+//!
+//! - `with_`
+//! - `const_`
+//! - `try_with_`
+//! - `__`
+//!
+//! The field identifiers `from_raw`, `into_raw`, and `into` are also reserved.
+//!
+//! In addition, field identifiers should follow Rust `snake_case` conventions, since the associated
+//! constants are generated by uppercasing the field name.
+//!
+//! # Implicit conversions
+//!
+//! Types that fit entirely within a field's bit width can be used directly with setters. For
+//! example, `bool` works with single-bit fields, and `u8` works with 8-bit fields:
+//!
+//! ```rust
+//! use kernel::bitfield;
+//!
+//! bitfield! {
+//!     pub struct Flags(u32) {
+//!         15:8 byte_field;
+//!         0:0 flag;
+//!     }
+//! }
+//!
+//! let flags = Flags::zeroed()
+//!     .with_byte_field(0x42_u8)
+//!     .with_flag(true);
+//!
+//! assert_eq!(flags.into_raw(), (0x42 << Flags::BYTE_FIELD_SHIFT) | 1);
+//! ```
+//!
+//! # Runtime bounds checking
+//!
+//! When a value is not known at compile time, use `try_with_field()` to check bounds at runtime:
+//!
+//! ```rust
+//! use kernel::bitfield;
+//!
+//! bitfield! {
+//!     pub struct Config(u8) {
+//!         3:0 nibble;
+//!     }
+//! }
+//!
+//! fn set_nibble(config: Config, value: u8) -> Result<Config, Error> {
+//!     // Returns `EOVERFLOW` if `value > 0xf`.
+//!     config.try_with_nibble(value)
+//! }
+//! # Ok::<(), Error>(())
+//! ```
+//!
+//! # Type conversion
+//!
+//! Fields can be automatically converted to/from a custom type using `=>` (infallible) or `?=>`
+//! (fallible). The custom type must implement the appropriate `From` or `TryFrom` traits with
+//! `Bounded`.
+//!
+//! ## Infallible conversion (`=>`)
+//!
+//! Use this when all possible bit patterns of a field map to valid values:
+//!
+//! ```rust
+//! use kernel::bitfield;
+//! use kernel::num::Bounded;
+//!
+//! #[derive(Debug, Clone, Copy, PartialEq)]
+//! enum Power {
+//!     Off,
+//!     On,
+//! }
+//!
+//! impl From<Bounded<u32, 1>> for Power {
+//!     fn from(v: Bounded<u32, 1>) -> Self {
+//!         match *v {
+//!             0 => Power::Off,
+//!             _ => Power::On,
+//!         }
+//!     }
+//! }
+//!
+//! impl From<Power> for Bounded<u32, 1> {
+//!     fn from(p: Power) -> Self {
+//!         (p as u32 != 0).into()
+//!     }
+//! }
+//!
+//! bitfield! {
+//!     pub struct Control(u32) {
+//!         0:0 power => Power;
+//!     }
+//! }
+//!
+//! let ctrl = Control::zeroed().with_power(Power::On);
+//! assert_eq!(ctrl.power(), Power::On);
+//! ```
+//!
+//! ## Fallible conversion (`?=>`)
+//!
+//! Use this when some bit patterns of a field are invalid. The getter returns a [`Result`]:
+//!
+//! ```rust
+//! use kernel::bitfield;
+//! use kernel::num::Bounded;
+//!
+//! #[derive(Debug, Clone, Copy, PartialEq)]
+//! enum Mode {
+//!     Low = 0,
+//!     High = 1,
+//!     Auto = 2,
+//!     // 3 is invalid
+//! }
+//!
+//! impl TryFrom<Bounded<u32, 2>> for Mode {
+//!     type Error = u32;
+//!
+//!     fn try_from(v: Bounded<u32, 2>) -> Result<Self, u32> {
+//!         match *v {
+//!             0 => Ok(Mode::Low),
+//!             1 => Ok(Mode::High),
+//!             2 => Ok(Mode::Auto),
+//!             n => Err(n),
+//!         }
+//!     }
+//! }
+//!
+//! impl From<Mode> for Bounded<u32, 2> {
+//!     fn from(m: Mode) -> Self {
+//!         match m {
+//!             Mode::Low => Bounded::<u32, _>::new::<0>(),
+//!             Mode::High => Bounded::<u32, _>::new::<1>(),
+//!             Mode::Auto => Bounded::<u32, _>::new::<2>(),
+//!         }
+//!     }
+//! }
+//!
+//! bitfield! {
+//!     pub struct Config(u32) {
+//!         1:0 mode ?=> Mode;
+//!     }
+//! }
+//!
+//! let cfg = Config::zeroed().with_mode(Mode::Auto);
+//! assert_eq!(cfg.mode(), Ok(Mode::Auto));
+//!
+//! // Invalid bit pattern returns an error.
+//! assert_eq!(Config::from(0b11).mode(), Err(3));
+//! ```
+//!
+//! # Bits outside of declared fields
+//!
+//! Bits of the storage type that are not part of any declared field are preserved by the setter
+//! methods, and can only be modified through `from_raw` or the [`From`] implementation from the
+//! storage type.
+//!
+//! ```rust
+//! use kernel::bitfield;
+//!
+//! bitfield! {
+//!     pub struct Sparse(u8) {
+//!         7:6 high;
+//!         // Bits 5:1 are not covered by any field.
+//!         0:0 low;
+//!     }
+//! }
+//!
+//! // Set the gap bits via `from_raw`, then mutate the declared fields.
+//! let val = Sparse::from_raw(0b0010_1010)
+//!     .with_const_high::<0b11>()
+//!     .with_low(true);
+//!
+//! // Bits 5:1 are unchanged.
+//! assert_eq!(val.into_raw(), 0b1110_1011);
+//! ```
+//!
+//! # Signed field values
+//!
+//! Bitfield storage types are unsigned. Since field getter methods return a [`Bounded`] of the
+//! storage type, fields are also unsigned by default.
+//!
+//! If a field needs to encode a signed value, use a custom conversion type with `=>` or `?=>` to
+//! perform the sign interpretation explicitly.
+//!
+//! [`Bounded`]: kernel::num::Bounded
+
+/// Defines a bitfield struct with bounds-checked accessors for individual bit ranges.
+///
+/// See the [`mod@kernel::bitfield`] module for full documentation and examples.
+#[macro_export]
+macro_rules! bitfield {
+    // Entry point defining the bitfield struct, its implementations and its field accessors.
+    (
+        $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty) { $($fields:tt)* }
+    ) => {
+        $crate::bitfield!(@core
+            #[allow(non_camel_case_types)]
+            $(#[$attr])* $vis $name $storage
+        );
+        $crate::bitfield!(@fields $vis $name $storage { $($fields)* });
+    };
+
+    // All rules below are helpers.
+
+    // Defines the wrapper `$name` type and its conversions from/to the storage type.
+    (@core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) => {
+        $(#[$attr])*
+        #[repr(transparent)]
+        #[derive(Clone, Copy, PartialEq, Eq)]
+        $vis struct $name {
+            inner: $storage,
+        }
+
+        #[allow(dead_code)]
+        impl $name {
+            /// Creates a bitfield from a raw value.
+            #[inline(always)]
+            $vis const fn from_raw(value: $storage) -> Self {
+                Self{ inner: value }
+            }
+
+            /// Turns this bitfield into its raw value.
+            ///
+            /// This is similar to the [`From`] implementation, but is shorter to invoke in
+            /// most cases.
+            #[inline(always)]
+            $vis const fn into_raw(self) -> $storage {
+                self.inner
+            }
+        }
+
+        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
+        unsafe impl ::pin_init::Zeroable for $name {}
+
+        impl ::core::convert::From<$name> for $storage {
+            #[inline(always)]
+            fn from(val: $name) -> $storage {
+                val.into_raw()
+            }
+        }
+
+        impl ::core::convert::From<$storage> for $name {
+            #[inline(always)]
+            fn from(val: $storage) -> $name {
+                Self::from_raw(val)
+            }
+        }
+    };
+
+    // Definitions requiring knowledge of individual fields: private and public field accessors,
+    // and `Debug` implementation.
+    (@fields $vis:vis $name:ident $storage:ty {
+        $($(#[doc = $doc:expr])* $hi:literal:$lo:literal $field:ident
+            $(?=> $try_into_type:ty)?
+            $(=> $into_type:ty)?
+        ;
+        )*
+    }
+    ) => {
+        #[allow(dead_code)]
+        impl $name {
+        $(
+        $crate::bitfield!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
+        $crate::bitfield!(
+            @public_field_accessors $(#[doc = $doc])* $vis $name $storage : $hi:$lo $field
+            $(?=> $try_into_type)?
+            $(=> $into_type)?
+        );
+        )*
+        }
+
+        $crate::bitfield!(@debug $name { $($field;)* });
+    };
+
+    // Private field accessors working with the exact `Bounded` type for the field.
+    (
+        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+        $vis const [<$field:upper _MASK>]: $storage =
+            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
+        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
+        );
+
+        ::kernel::macros::paste!(
+        fn [<__ $field>](self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
+            // Left shift to align the field's MSB with the storage MSB.
+            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
+            // Right shift to move the top-aligned field to bit 0 of the storage.
+            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
+
+            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
+            // output type.
+            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
+                self.inner << ALIGN_TOP
+            );
+            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
+        }
+
+        const fn [<__with_ $field>](
+            mut self,
+            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
+        ) -> Self
+        {
+            const MASK: $storage = <$name>::[<$field:upper _MASK>];
+            const SHIFT: u32 = <$name>::[<$field:upper _SHIFT>];
+
+            let value = value.get() << SHIFT;
+            self.inner = (self.inner & !MASK) | value;
+
+            self
+        }
+        );
+    };
+
+    // Public accessors for fields infallibly (`=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:literal:$lo:literal $field:ident => $into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) -> $into_type
+        {
+            self.[<__ $field>]().into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>](self, value: $into_type) -> Self
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields fallibly (`?=>`) converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident ?=> $try_into_type:ty
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<
+                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+                >>::Error
+            >
+        {
+            self.[<__ $field>]().try_into()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>](self, value: $try_into_type) -> Self
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        );
+    };
+
+    // Public accessors for fields not converted to a type.
+    (
+        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
+            $hi:tt:$lo:tt $field:ident
+    ) => {
+        ::kernel::macros::paste!(
+
+        $(#[doc = $doc])*
+        #[doc = "Returns the value of this field."]
+        #[inline(always)]
+        $vis fn $field(self) ->
+            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
+        {
+            self.[<__ $field>]()
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the compile-time constant `VALUE`."]
+        #[inline(always)]
+        $vis const fn [<with_const_ $field>]<const VALUE: $storage>(self) -> Self {
+            self.[<__with_ $field>](
+                ::kernel::num::Bounded::<$storage, { $hi + 1 - $lo }>::new::<VALUE>()
+            )
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Sets this field to the given `value`."]
+        #[inline(always)]
+        $vis fn [<with_ $field>]<T>(
+            self,
+            value: T,
+        ) -> Self
+            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
+        {
+            self.[<__with_ $field>](value.into())
+        }
+
+        $(#[doc = $doc])*
+        #[doc = "Tries to set this field to `value`, returning an error if it is out of range."]
+        #[inline(always)]
+        $vis fn [<try_with_ $field>]<T>(
+            self,
+            value: T,
+        ) -> ::kernel::error::Result<Self>
+            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 - $lo }>,
+        {
+            Ok(
+                self.[<__with_ $field>](
+                    value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
+                )
+            )
+        }
+
+        );
+    };
+
+    // `Debug` implementation.
+    (@debug $name:ident { $($field:ident;)* }) => {
+        impl ::kernel::fmt::Debug for $name {
+            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
+                f.debug_struct(stringify!($name))
+                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", self.inner))
+                $(
+                    .field(stringify!($field), &self.$field())
+                )*
+                    .finish()
+            }
+        }
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index b72b2fbe046d..9512af7156df 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -44,6 +44,7 @@
 pub mod alloc;
 #[cfg(CONFIG_AUXILIARY_BUS)]
 pub mod auxiliary;
+pub mod bitfield;
 pub mod bitmap;
 pub mod bits;
 #[cfg(CONFIG_BLOCK)]

-- 
2.54.0

