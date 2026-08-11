Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022077.outbound.protection.outlook.com [52.101.96.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DF7B444708
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 12:26:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451176; cv=fail; b=iCyQ6/iBmXl18WvuAjvRGPCF2uJLYxT1Xe/DQ55AMofrs9WGOtxqgsnuQbNsOZwKHyNZBGxpFJjgdTpBzFCwW/VfEZkI1j5SjDuHumZHGCVoVCvmmL2vhO73J3K3qHiKszEOIWhHm1CXu10BxkyzzEFJ9ubb/TCzRTixVF86OWA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451176; c=relaxed/simple;
	bh=c7Vqsvcoc8OnSyvYMgKpVECJwsPIwEmR2UQewrFaEzI=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=BSxs7gRyeVqMijz0L49X1vimYBKR8uDzJtmCMGW/8O86ywQk2fnQWZ7VzHa3g88zgQli+J94bA5/ashBxewjhjwMVTM8Xe94n+NZ6bzh88iP+lcyufjQWbZokta5Yw1pjbyibjgQsBQEAbMPMizr55xFX1HOmFAwxkY5j4FRLk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=0Vj6Be36; arc=fail smtp.client-ip=52.101.96.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="0Vj6Be36"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdL8csXPISMmsmcHkGpAKmlnE/KbMul+ehfwOUrmHf2/qGbB9px5i/HT/yFtCWHdrjNDSGZ0K55IXy9+OcYycjAKgO3TSqOXDDByzp2DdoDr/blFos6X1QSWKBdbEuWJs8pwiwe+sViKfgG3l34YHdk7vqjxknUHK3WEnNgo3/SaIjj+GE/fTVx7uCSRU7nivBq3C6uQNwGdKRZiFVOS0cutA5ZtVzFwmbzcNt3ZsJPozFyMKo4io47FR9e3ZnSvP794pIDsLGjg0506kjVhWTKb4N2V2M0G8td4wJ+Xzyt5tR5BIHC40EDYFvocz7pAsPpixAhkoniDtJcJuQHO3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTNgZlD8grl5uIoPnLtbtWimYE/SM48DQQ9214qdvws=;
 b=fQSLs1pwEAX58n7BXIfRVBrgAyhV40DJtG+c2so0XPe5DzqMn1uDy2Z/TSEfOkdWD90JwOaRlT148zb9W3L/ZByLcCWZYJObenZSHTamwl9T+1oon2B/pPqGn1bTtRjsiDu475MtJFRR6U/QvebIdW7xHIGvnQ3epib4+HWynyX1/KuIqNt0417X53ywJTklT4hpJZ/l0Z0r99rPKiby63CKK/GhQA5VJQ0OZ8kdZUwbxu8SH38UOrrESn9Hq1TGa+kEKy8uVr2dHSJMfvFc7jr8VCuvTd4ULD0+4ogWa3rYz+KI3qad+gOWD6Q60I8spNOByuM6uyKZzJztzVVNxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTNgZlD8grl5uIoPnLtbtWimYE/SM48DQQ9214qdvws=;
 b=0Vj6Be36/+O5g/lHUQI6GwDE/clnITApcFf+U8InVEOc7OponHv2Jj30Nve3ZddmPDiEyzHA1G/Ga9cVXTf8EaSMbv0znBgtEqX6ZySokJLDOXkrOmcvwSMUpfvA+UHuuqq1gLHi/OQYkJADfUhnEuKk69hR9GCRaPL7nqynQ9w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB5094.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:282::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 12:26:01 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 12:26:01 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 11 Aug 2026 13:25:54 +0100
Subject: [PATCH 2/4] rust: build_assert: remove macro from crate root
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-macro_export_scoped-v1-2-e7782b102819@garyguo.net>
References: <20260811-macro_export_scoped-v1-0-e7782b102819@garyguo.net>
In-Reply-To: <20260811-macro_export_scoped-v1-0-e7782b102819@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Breno Leitao <leitao@debian.org>, Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Lyude Paul <lyude@redhat.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 driver-core@lists.linux.dev, Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786451159; l=5402;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=c7Vqsvcoc8OnSyvYMgKpVECJwsPIwEmR2UQewrFaEzI=;
 b=D6H8R10mgivbZYUTagHK3MJB2SJ8vbDovF10EQ3cEX9RcVvizNTvdf3tD79xr3Z00tayT4VNB
 Qona0oruVprBhkV4Xar5is1QbR+3pCafHponcM3dmLrQ6Xlo0hS1B0T
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO6P123CA0059.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:310::17) To LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:4ab::19)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB5094:EE_
X-MS-Office365-Filtering-Correlation-Id: 6702f3c8-9248-40df-963e-08def7a3b47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|10070799003|376014|23010399003|18002099003|22082099003|56012099006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	usCUW2bwW3Qf5zoLDM2D/mubbCI8Y1XqsjJcX38SlGybqPm9+SImwBKk3wzXmANSpUuUyubkAhV7KDBD7osyCs4u8BU7pavBIhKIzHNbK3bFtLb2Z2v2aS1ZltnawI4t+Ql1dak94VHON9mVHkfe95Kjml1zm3AJk+gvN1dAalPkd+dHbUM9KGMl+dwmRAFsfB0UA9zKheFo5hC2JmTorVa1bEOEB7EFlMbLGd1CIuzEI/N7EYSN+EBLs4LGVJpJAkEDwJEi0bAFSDqTnG67dR10isevsWsJvBV3Ji9Tijbs3hIral0Rt3wuHIMQvWMsLKKGhrpqEX3D4Q39ye1Tjo6sdepUtsgWfU59fG3be4Q3MoxQvllgpdk2n7kWU8Bfhu/P7hPc2U1ioGrJpnWl2FLOC3XiEScpeKwIq5TQTDSYErhszlVNLHvTiAxLiotUPt4xEf1R6wTonXPO3zGvF1V11Oy3DpK6Qoyo2PzbwP2a+XSh2OpJzP4Smf7oWQIA9ldKY6Kuk6OyJxT1cq9jf/lgGCftXzU3zLn+htGdIEaK61CJKk/Ga6Mo3ZhCNj6d+LGND21F201mq5RdqtISdKeQeNhKTS1ndNJLG5KLmwj/D71nvdNngSzczGbctWqSwlrc2S/mnjbdUWkQhRZm/zeSq973xgyX3oUIvapoSoTMf0PfsNxfe1alntdJRjeduEmYibJ3wW5DhDkRTuOSxw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?clUwcnQwN0dXOEVSUHNEWUpwdGkxNldRQWNpckw3RUk1K2phdjZLell2S2VV?=
 =?utf-8?B?M1dqYUhjdWR0ZG9zN1BjYmhXN2FpUC9UUVorcTRPYWxmL0pmd00raTdsNnZN?=
 =?utf-8?B?V2lLRTQrY1B5NWZUVGwxVGZEdmxxV2xsZG1vWGpqdytQZVowUVIrQTBWeHl1?=
 =?utf-8?B?QU90UzZnNTdmZEVETWVrS0VHcFZTMzdvN2g5eDVTL3NtUC92TjdPU2xodE0v?=
 =?utf-8?B?MmRyN2J5ZFlPQXBzdGNqZE05OW80ejFYQUpFZEh5ZnpwcnpEZ3pmd09UQUZp?=
 =?utf-8?B?bFkvT1V1aXZPSVlHSFBmWk84ZGo1elNrdCtFajJ6ZGxHYlJsdkU5aXZ3bGdE?=
 =?utf-8?B?aDR5bTRqSXRXNWJ2aU9VRy9SWFBaRFlvajViVUtLR3o5UHVFd1F0b1VvNGtm?=
 =?utf-8?B?RzlrK2Ezd1d1akZwZzhYc1BrUUtsbGdER3cwZm1rLzZrQVRRbGQyMUViSTBC?=
 =?utf-8?B?eUhjaDgwN0toRXpPNjZFdnJ2VW5GdytpcHg0aW9Wc25aWDBueEYrNUV6QlF0?=
 =?utf-8?B?bXJJdWFCTDZDeHlIUVdmNFJwUTROdXBUWHlraFFHVVFxdkdLcjJjM1ZjQlVn?=
 =?utf-8?B?UlFSK1VNN0pyeWtzajFSRFZaUjFtY2NqcTZ6ZTdJYTJXN0hQYUNJL3JtcUY2?=
 =?utf-8?B?T1kzYW8wVFRsNnN6SjN5RTdaSmIxS0JBc0NlRW15TzgzQ0pWYnVLSzh0cW15?=
 =?utf-8?B?U3lwS1kxQ0cveWpzYW8wVVpYRUNEY3I0T21mSHpLVnZWbnc1cjc3NWlvdWw5?=
 =?utf-8?B?UGxjZ1Q0YkFibm5IL3dkNUdqbUdXSE1aREFxV3hpM3VuQTVRY2lXK3JvNGRh?=
 =?utf-8?B?QThEcDc0NU11ZmpwK3Q4U1ZyRGF6b3hMNDkxdXhxZ2R0UmdtMGxseCtKVVdm?=
 =?utf-8?B?MEVRS2dyUlhIak9kZEZtVHV2QUgyZi9xSzRnV0dSWVdUdnhpc1M5TXlmV2tY?=
 =?utf-8?B?MGVCM1B0M3p5SlM4bjdaSFVJVFJtaThXeHFTYXlxb0Y4TXE4YlBRTXdySkRF?=
 =?utf-8?B?L3JiVzVZaUF0aytSOTlXb1NMdHB2d2E3OEdXZjJFRjdNajFHeTZZRm5YQXUr?=
 =?utf-8?B?elpEUUpNUmY3d25jZThpQ2hPWDYvcHJVVDNadXU2bFN0QWFNUzRQWDBINGRW?=
 =?utf-8?B?TFY5Y2lBSzdsUDNMTDNqV1kwRlB1MmtjdkRyUW1vUFZlUmk4YU1Ud2FWRDJI?=
 =?utf-8?B?eVR4eisrdmZFV1hiNHdSYm1WTHpkQlpBZDdBOHJ5Z3hJTzZVTzR6VTZRMkY0?=
 =?utf-8?B?UTVWa3dDdlB0RUVFVDFiK1BuZWJTSnhmZk9OajhrVis0bnZaSTFCMlFqY1o5?=
 =?utf-8?B?L2l5a1hab1R5dk5CQzhmc2NiaDNoS2F1M0ROL2J1Y1ZQS2pmbHhQYlZHTjJF?=
 =?utf-8?B?ckQxcFZHZEg4c3FzOHhYOGdWazhsVkJYa3lxZCtSUVJzRVFvbzhVRTV4SWcx?=
 =?utf-8?B?QmRpbERvZk1QM3hORHNPZ2g5RXpyV2R6ZTVvRTRoWlBOUkNsZnJsSXM0N2xT?=
 =?utf-8?B?MHQrb3dJWGJVL0pqak9nemtPU3RvNXJoVEg2QmZmTnJXNTBRQ25jSlNpZnEz?=
 =?utf-8?B?NVcrVFVGK0V4OC95ekxlUHJibFVBV3JMMFI5NmljT2hiQjBSNGhjbXNBVUJO?=
 =?utf-8?B?aFg2aUJEUTZlcTlsdko2bERuMmtybmJ2MGhaQnJLU2FlUmE4Y3BWZjVOZnN1?=
 =?utf-8?B?ODgyR3NBUFo1UDZPNjJOOGNMRUZkdDhneUxuUFFGcGlodzVLdW1Vb1kzeDFW?=
 =?utf-8?B?UEVLL3RJZVdST25HblZEK2FKYXZvdnJtb3AvdFc1TkJ5cmg0YVhrbTRiL3Zs?=
 =?utf-8?B?UlRHREd2a25XNEZHYWhZak1BWnJYOVk4VGhpNGpnaS85bUtQQUg3NURzVFZk?=
 =?utf-8?B?TW81Wmw3N2Y1a0ltM09MS0w5VVlJNDRSVEp5SFRGKzRCRC9UTGNSYXpkWHdN?=
 =?utf-8?B?MktDcGFTNzRqeG9mUG54UlN4UVRUQmorTVZoam50dFZEVHdMc1BiWmNjbWtw?=
 =?utf-8?B?RXRBN01PN3NZWDBRV21GVHNzU2x6MG1hd0tUVU9acFgyNFBrbHpIeGNYVXdY?=
 =?utf-8?B?UllRK1htSzhmOTNBZEJVaGpIc1JlYklwK3hNNlZlWXBWMGgvc29kMjRlOVA2?=
 =?utf-8?B?QlNjaFNTcUhEd0VPbkhNS3JxMUZJUTc5N0hqNmxjLzlNOFpLbDBHZUJDaDVW?=
 =?utf-8?B?am8vVVZ1NS9TaG5OeUgvT01sRnU2T3VNMkRmTVVvSERwNFpxQ1NyeWFyK3l3?=
 =?utf-8?B?Z0Y3bkdIcmV0cGtRK1Fpb0NPK1MwS1dTVTFDUHdxT0tlMVBGWHZ6dm5IUDk1?=
 =?utf-8?B?SGphUFZBZjNGaE45SlJPVFozQVhNUGhWS1E1cXJkU3ByWGxNWDZMQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 6702f3c8-9248-40df-963e-08def7a3b47b
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:26:01.5314
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BaT9A0pMYsgJvKG3bV+s8rvszo6gLOZmcKyQf89jzpIrjtLpCUShozMkNCfO7ju8tbz3itf15gAz30PrRhR33g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5094

Convert `build_assert` to use `#[macro_export_scoped]`. This removes the
macros from crate root of `kernel`. A few remaining mentions of the macros
from crate root are removed.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/build_assert.rs | 24 +++++++-----------------
 rust/kernel/configfs.rs     |  4 ++--
 rust/kernel/firmware.rs     |  4 ++--
 rust/kernel/ptr.rs          |  6 +-----
 rust/kernel/sync/atomic.rs  |  2 +-
 5 files changed, 13 insertions(+), 27 deletions(-)

diff --git a/rust/kernel/build_assert.rs b/rust/kernel/build_assert.rs
index c3acb9b68a65..4774c7fb6976 100644
--- a/rust/kernel/build_assert.rs
+++ b/rust/kernel/build_assert.rs
@@ -61,17 +61,11 @@
 //! undefined symbols and linker errors, it is not developer friendly to debug, so it is recommended
 //! to avoid it and prefer other two assertions where possible.
 
-#[doc(inline)]
-pub use crate::{
-    build_assert_macro as build_assert,
-    build_error,
-    const_assert,
-    static_assert, //
-};
-
 #[doc(hidden)]
 pub use build_error::build_error as build_error_fn;
 
+use macros::macro_export_scoped;
+
 /// Static assert (i.e. compile-time assert).
 ///
 /// Similar to C11 [`_Static_assert`] and C++11 [`static_assert`].
@@ -105,8 +99,7 @@
 /// static_assert!(f(40) == 42);
 /// static_assert!(f(40) == 42, "f(x) must add 2 to the given input.");
 /// ```
-#[macro_export]
-#[doc(hidden)]
+#[macro_export_scoped]
 macro_rules! static_assert {
     ($condition:expr $(,$arg:literal)?) => {
         const _: () = ::core::assert!($condition $(,$arg)?);
@@ -134,8 +127,7 @@ macro_rules! static_assert {
 ///     const_assert!(size_of::<T>() > 0, "T cannot be ZST");
 /// }
 /// ```
-#[macro_export]
-#[doc(hidden)]
+#[macro_export_scoped]
 macro_rules! const_assert {
     ($condition:expr $(,$arg:literal)?) => {
         const { ::core::assert!($condition $(,$arg)?) };
@@ -159,8 +151,7 @@ macro_rules! const_assert {
 /// assert_eq!(foo(usize::MAX - 1), usize::MAX); // OK.
 /// // foo(usize::MAX); // Fails to compile.
 /// ```
-#[macro_export]
-#[doc(hidden)]
+#[macro_export_scoped]
 macro_rules! build_error {
     () => {{
         $crate::build_assert::build_error_fn("")
@@ -203,9 +194,8 @@ macro_rules! build_error {
 ///
 /// const _: () = const_bar(2);
 /// ```
-#[macro_export]
-#[doc(hidden)]
-macro_rules! build_assert_macro {
+#[macros::macro_export_scoped]
+macro_rules! build_assert {
     ($cond:expr $(,)?) => {{
         if !$cond {
             $crate::build_assert::build_error_fn(concat!("assertion failed: ", stringify!($cond)));
diff --git a/rust/kernel/configfs.rs b/rust/kernel/configfs.rs
index 2339c6467325..8660ce01d97f 100644
--- a/rust/kernel/configfs.rs
+++ b/rust/kernel/configfs.rs
@@ -511,7 +511,7 @@ pub trait GroupOperations {
     /// NOTE: "drop" in the name of this function is not related to the Rust drop term. Rather, the
     /// name is inherited from the callback name in the underlying C code.
     fn drop_item(&self, _child: ArcBorrow<'_, Group<Self::Child>>) {
-        kernel::build_error!(kernel::error::VTABLE_DEFAULT_ERROR)
+        build_error!(kernel::error::VTABLE_DEFAULT_ERROR)
     }
 }
 
@@ -660,7 +660,7 @@ pub trait AttributeOperations<const ID: u64 = 0> {
     /// Implementations should parse the value from `page` and update internal
     /// state to reflect the parsed value.
     fn store(_data: &Self::Data, _page: &[u8]) -> Result {
-        kernel::build_error!(kernel::error::VTABLE_DEFAULT_ERROR)
+        build_error!(kernel::error::VTABLE_DEFAULT_ERROR)
     }
 }
 
diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index a18f8b84f3e3..1abc66b84ef2 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -325,7 +325,7 @@ const fn push_internal(mut self, bytes: &[u8]) -> Self {
     pub const fn push(self, s: &str) -> Self {
         // Check whether there has been an initial call to `next_entry()`.
         if N != 0 && self.n == 0 {
-            crate::build_error!("Must call next_entry() before push().");
+            build_error!("Must call next_entry() before push().");
         }
 
         self.push_internal(s.as_bytes())
@@ -369,7 +369,7 @@ pub const fn new_entry(self) -> Self {
         if this.n == N {
             this.buf
         } else {
-            crate::build_error!("Length mismatch.");
+            build_error!("Length mismatch.");
         }
     }
 }
diff --git a/rust/kernel/ptr.rs b/rust/kernel/ptr.rs
index 82acb531b17b..b6fb802c2e21 100644
--- a/rust/kernel/ptr.rs
+++ b/rust/kernel/ptr.rs
@@ -5,13 +5,9 @@
 pub mod projection;
 pub use crate::project_pointer as project;
 
-use core::mem::{
-    align_of,
-    size_of, //
-};
 use core::num::NonZero;
 
-use crate::const_assert;
+use crate::prelude::*;
 
 /// Type representing an alignment, which is always a power of two.
 ///
diff --git a/rust/kernel/sync/atomic.rs b/rust/kernel/sync/atomic.rs
index 9cd009d57e35..c62cb46798ff 100644
--- a/rust/kernel/sync/atomic.rs
+++ b/rust/kernel/sync/atomic.rs
@@ -25,7 +25,7 @@
 
 pub(crate) use internal::{AtomicArithmeticOps, AtomicBasicOps, AtomicExchangeOps};
 
-use crate::build_error;
+use crate::build_assert::build_error;
 use internal::AtomicRepr;
 use ordering::OrderingType;
 

-- 
2.54.0

