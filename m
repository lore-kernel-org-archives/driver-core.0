Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020087.outbound.protection.outlook.com [52.101.196.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAC4443E5D
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 12:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451169; cv=fail; b=dEPv53vv84UFr8XZV5YTudEM0EOOFGHJg34Orfk/BkFOK+1zyGubHiOW3Of/ABr0ZmSSVR+KwlWfQ9fuTyjyEImD8gixS8QyJu6O8lDBeMn7XHYcWueEUd3fJrn8O45ICQRh65JuouCwPQV8cnKbb7y7eic3nyzkSh188BLIk1k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451169; c=relaxed/simple;
	bh=fKFOnxn9mkkggVQGQaR/veYiv80tVTzsKdheZZi86MU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=YTxVPNMQ7JQG9QTDDHm7anVHHJ8vroialiGj9foQEdmsKLZBWAdar6kquIjK3NTd6vxMweg2MkzoLHuwnEAbSF0b7oBYWWGwNpEMLLliI9zkDSTLvQ23/Qbk5t8d2c23dgw0pScpL+daQbiXQjyFD38K3aG7L7kEOLuV9IozeNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=VVI5H8y+; arc=fail smtp.client-ip=52.101.196.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="VVI5H8y+"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r7RbvF5xQhVLvF1t7RRCKJcB0X24zzoc+QpFivk3t38Xkx+XA12SN8P4QFtANoT//rmCOehKenYo89uLujw1X3TYwXp9kNbw8D1r926MnLDdN/Tk++uWPF2fiqpxPcdj9JkOsbdQUC3zcwtLXVZn4doxmemo9PU7751uJIqbCFCt9E/91B5plqFWNXKHik0fHahr+/ljlbzyTsKSGQeM14Bq1vob/44A+zXUz10JqH3HYkf9lw9NDfM6iDUtNoUscGpshH2nAj+9vmbJocC9kxwJPtN/fEScAjUvUwCDHXFAtn/rkLOidcivx6Yhg2n0oK0FRzD8Sutgaf8LOqJl7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LwhLqrH55STleNard3NJsgxxJJQAeVghmSaAGGwIMM=;
 b=NyPdVAuJFTGSq4S1Da9fsvQCOvTA956xhVQsHvzl4RzWDgP460lLXYs45gY9nMEylz4+KXAilxOY/PnJwxhweec0z1A6LNFpc0Lg81pisKFQglvo22xbXLYCGVmFE1JxGqMwTu39o5lt5vNtMmbseVhm1SdCYywzpPfmdPrvpvl7WDNiwZrpdn0W1UgBY48jrE6TnWLxf5Oekp240/PYKvf2xFAYmwSDdWn6QfiOLXj5PR3aLCnD762OSwQ95CULKzxviBqfQfDKP6Exvv9mXPWkanO+2FGEDEQ9a1B47N33Jb8uhXfEClzaqzsn9dwGHEJn/TFs5GNEWIdB+/U5pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LwhLqrH55STleNard3NJsgxxJJQAeVghmSaAGGwIMM=;
 b=VVI5H8y+9laY0sluchEgtfE5fQqxnaL3MHWBXDEto27KnG9klmu+82CFxSXjv3o55ihBVGuptyyiAgLBxjI2J8BT2BJ7QosVl3JYyECt1bACl5PS6eSS37zMTLVwtLnIetKW5GkVnX8tlXLyHK0oaZalpRmOQW6cewGbRE6SgUg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB2891.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:183::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 12:26:03 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 12:26:03 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 11 Aug 2026 13:25:56 +0100
Subject: [PATCH 4/4] rust: io: convert to use `#[macro_export_scoped]`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-macro_export_scoped-v1-4-e7782b102819@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786451159; l=2784;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=fKFOnxn9mkkggVQGQaR/veYiv80tVTzsKdheZZi86MU=;
 b=T/GRomljQhLZxfVHgWKDfWcjN9R/SqT4CaePTNb+/IM86lZU4rtw+WHQY5mjNAO8/n4SFyAxB
 /ZNBgnxoSphAc3+mqXUJ2NcW3SDBOJFDXAgElTvHaP7YDL8CxYE/M0n
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
X-MS-TrafficTypeDiagnostic: LOAP265MB8560:EE_|LO0P265MB2891:EE_
X-MS-Office365-Filtering-Correlation-Id: 043ba8f0-89fa-4f6c-92fe-08def7a3b59a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|7416014|10070799003|1800799024|56012099006|5023799004|10067099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	xgKTxVhLTOiYXjqFwnfkkMFtS1MwVUtoZR0/WsddyHs52tIsqhJFyIV1mWqAHhn9y0OLMuU6hBIn6cwXxpRuuID2GIlP5UrhjS6CRTNw+b70lp1P2fZdk+8A2mdlBbVEmtrX1Kx6Z2Ci3ss9vTI3H8cZDy1v+LBgxzZgGtXYvz+BeRNpC6f3ofyishByVuBSiaslrb5oCsOlpRfwb7bcUT0ZtuoeKi22Am2x8y6OqgvOv4XrYtA0pzu3BSoGxCEGnNce5DBWsxV8GruSiADPVqY8T+H/hyEW/nX20z3ZDbmpMv5ukHAvQNCtTdDGX+5WBzrBuoj55VFsF+oFMQv70KyHkr6m5+xpsMuvFYvUdl6buPLeRQ5OUim8vHEsH2JtQIuS3RdAEHKmSZQP9iXpHqQtUlNezB8KkO3fnKLto4h3UHnN2wbAzv2/O0sTXm9foomYFevuBbA72C8mvAVingPGizsfXKdqDODHfLznAyL0ubNd36SneFZatZs2g09x0RdOFAyzEgbfWwgaii7C33LUkf+3Gem5ZEK8uIkGXgBE2PavFZLT6g0ZiD+QI1kiYvpgzdTa/ILc/1BCVdEdfvvHrOh7x1qSjOwsFCDqCJmvNDoz5OzcJjqcCAK7CGQgEclQvBQWTxgEYzKpeJH68tLy7oWF3+cyYgSooPFn1e7TlFWYrJkQDw8w3Fw0Rb96+vS6/OKdKDkopStYgs9TvA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(7416014)(10070799003)(1800799024)(56012099006)(5023799004)(10067099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YUYrWStqMWw5dXlkeVo1S2Ziekg0R1ZFVFE2RTVuOWpDaWFjMXhUYW9rVFJs?=
 =?utf-8?B?cVkxTmZwS2FlNDJPWVZITzJhMU9hYjdMOEFJV2NnUWNqMi8wLy8yK3h1ZUd4?=
 =?utf-8?B?ODNycVJKTWpQT0o2S1Z2YXhVdkxhUFk5cDV3RmtoNXRaMGN2MncxNjVNbjlD?=
 =?utf-8?B?WFIzTEVteVlDZVluZjBuYkE1bk0zWnIzK1RoZDFtdWV0TUF2Rld6cmxmaktR?=
 =?utf-8?B?bGJiMmErWFZ0clJhUEJmdXZKNENZZnNNY2w2VVVsVUIzMkI1UVZvQlMydzhp?=
 =?utf-8?B?MEdRTklrTFdnOTJqRytQUHBuRlBUcWhzdjJvZkxLV1YyRzFNVW1tYjZ0Uml0?=
 =?utf-8?B?ZURNcW1OSFZNSmxOQkJtOXl0OExoNDRBaDNzT0xtcmJtNU1uSGd0RmxZUUlH?=
 =?utf-8?B?WFZBYlZXT3M0b2VWam5kS3EyaTZVOHZxNElrNTRDcTI0aXlPb3JXRk54TFVB?=
 =?utf-8?B?YWVmYlNvbGhFMm02bGJoZkFpRUlsbldjcW05VzR3M1lycUd1TlFMYXRKaW5k?=
 =?utf-8?B?TzJ5cTdGbWl5dzNWNkoyaGJ0VWJDRlJBdXBaQlZsWSsrSmltZUtBNkcrdzR4?=
 =?utf-8?B?MXJzTHdma3prS04zT2xndEp3SDFqVG5Xczh6WElJNTRERWJFMXpLaEhNdDA0?=
 =?utf-8?B?Ny9tQkdXUWp3eElpWSt3dy9leHB0OS9BOHhHbWg2SGxMTVVnVS92N1o4MjdY?=
 =?utf-8?B?c05qbm1pcHV6NEFGYUNiUjFCRG5aYmdWR25uNWVrN0lnS2tZdmFyMEprS2lT?=
 =?utf-8?B?M2dnUGdNcmJPOUdmYU5mSTNYTnZ4SXJpL2ovM0xFelFtcHYzeTlORUtaekpm?=
 =?utf-8?B?V1EzNXRFUy9JNzZQcWpsTk5kRWR5RVhvTktvZVd0WW1EeUV5YzVZVTJNZ0pl?=
 =?utf-8?B?RDZyVjVMSDFkbkhLLytTTEJEV2lkVm5MNmwrZk5qcytuTXE3UmM3cFdYai8y?=
 =?utf-8?B?M1Rxa3lVMzF0ckFwUUZMZDFhNVlvdWhTZTBMY3lKMEhoakFwSi93MVVueXhZ?=
 =?utf-8?B?bzJPQXRaOXBHeUF2a3doODhmcFI0Rk5ZMkQybVZsbzhlampmaTVQd1d3MGxy?=
 =?utf-8?B?MmxJSTJCbEo3dVVhWmRHSDZsSW5RRFRaRzhDL0JBQmowb0VRYTZrMUZMcEUv?=
 =?utf-8?B?QUxjNXRZdWMvZmdDL3JNS0VndzR3aGc1d2I5UkFHbEpuYUMvMllNbk00K0g4?=
 =?utf-8?B?RFI5cVBTcWJXMTFKTUpLcnVlNWgxM3dEaFNFRGRZeFZyRSs3WVdoNktVdzI4?=
 =?utf-8?B?ZE82Wk9pSTBSNW9zRllxWlpGM2k5eVphZ0trWGt1bk16ek4vVFQrdVU5ekRK?=
 =?utf-8?B?UUVYUDRSRk9LSHV6QmZGVHg2TlB4dGgyL3VGSVpjWWhQRGkzZnh3L2Y3aEs2?=
 =?utf-8?B?NXEzekNNRWV5NUdteGF0cWR4TVU5N05DdDFyUWU3M3RZY1JiT0E3MzBCSktT?=
 =?utf-8?B?akF6U3UzMFdYSHlYeFlxd3o1RWRGNWlTUVhrWGpWUkxWTElaeXVPWXNXaVVF?=
 =?utf-8?B?RTNXdlZtWlNGQldOeFlsRUdXSXVIcVFZQTRhbTZSbkFVbEpvVEZINTBQOUJW?=
 =?utf-8?B?N0dHQ3dhZG9veE1VS1hIMTJwdmF6VXFNczlSNmI5bEhnUmlkSjFSV0UvWml3?=
 =?utf-8?B?RUhRZHB5b1F4MEJIK0N5Tkw4OHQ5V3FacnAyS0Y0NExrcUFGbTk3MjNuS0FF?=
 =?utf-8?B?d0Q5azR1MVR0R2VtcHdhTDd4NzJkWlFOTmVGRlZhVitBTUNnUFdDKy9Td1ps?=
 =?utf-8?B?akhyM3ltaWN6SS9YWjRRQTVSYVd1U3AyaURKRW10SnhZK1pJVmZqSm9OZm41?=
 =?utf-8?B?bGtYL3FaY3RtbUJ1U3U1Wml6aVo3M25HSFRHUUZXN1Q2eTEzWmxiUW9oOGRh?=
 =?utf-8?B?RXVLMDlSdlcxSHZMalRYM3RYYlhqM1dLL0o2cm9KdzI2Wk45TWwrSU43L2hW?=
 =?utf-8?B?NzQ1T0doT05qcm5MeFZWWlZqWmVwRHViV0thdTlNWEgwanZmSEVIZUFSTFFS?=
 =?utf-8?B?TER3azBxdVNVM0VLK3dDK3c4aUdzTk9kWTZ3Y3p0MDlSWk8zUzd1WnhvU2g2?=
 =?utf-8?B?MmxOVEhGQmY4aXpHY1NIcE5WTURkU3M5SHc2bVkzMEhQM3dIMzlCMk5kbkZP?=
 =?utf-8?B?RVhBTENxbi95ZTkvWXo0NzltV1IxbThuWktMOHM5N0JmbXJWWXRaM3ljbWxH?=
 =?utf-8?B?YXlXYi9kbi9vbUlXcGd4cERGVlQweXEwYWNBTHpad0tpR1lqbDR4UmdzUjNy?=
 =?utf-8?B?ZmdDMkVUcUc5ZWZHWEkwcVVpUDQxNHVZaTM4TDlTVThxSjc2SUVwWmVOTVAv?=
 =?utf-8?B?YjAzVlpqNk0xYlNUZmtqZ2Q2UTVTWUgzcXpXeFNjdDlvN2pGeGJLUT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 043ba8f0-89fa-4f6c-92fe-08def7a3b59a
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:26:03.3479
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VUSptJ4Ihc4U8TNY5bRG4w51tYUBpNqJQqFL6SZvWhAEpvTRl4rgFEm559eop2Zf8H+IPnFbh/qX4ExpFQNCMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB2891

Convert I/O macros that use `#[macro_export]` + `#[doc(hidden)]` trick to
use the `#[macro_export_scoped]` macro.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/io.rs | 27 ++++++++++-----------------
 1 file changed, 10 insertions(+), 17 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 5ce9fd129068..891a27fe59b6 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -9,6 +9,8 @@
     mem::MaybeUninit, //
 };
 
+use macros::macro_export_scoped;
+
 use crate::{
     bindings,
     prelude::*,
@@ -1673,8 +1675,7 @@ pub unsafe fn project_view<U: ?Sized + KnownSize>(
 /// let nested: Mmio<'_, u32> = io_project!(whole, .field);
 /// # Ok::<(), Error>(()) }
 /// ```
-#[macro_export]
-#[doc(hidden)]
+#[macro_export_scoped]
 macro_rules! io_project {
     ($io:expr, $($proj:tt)*) => {{
         #[allow(unused)]
@@ -1688,8 +1689,6 @@ macro_rules! io_project {
         unsafe { view.project_view(ptr) }
     }};
 }
-#[doc(inline)]
-pub use crate::io_project;
 
 /// Read from I/O memory.
 ///
@@ -1707,15 +1706,12 @@ macro_rules! io_project {
 /// let field: u32 = kernel::io::io_read!(mmio, [try: 2].field);
 /// # Ok::<(), Error>(()) }
 /// ```
-#[macro_export]
-#[doc(hidden)]
+#[macro_export_scoped]
 macro_rules! io_read {
     ($io:expr, $($proj:tt)*) => {
-        $crate::io::Io::read_val($crate::io_project!($io, $($proj)*))
+        $crate::io::Io::read_val($crate::io::io_project!($io, $($proj)*))
     };
 }
-#[doc(inline)]
-pub use crate::io_read;
 
 /// Writes to I/O memory.
 ///
@@ -1734,21 +1730,18 @@ macro_rules! io_read {
 /// kernel::io::io_write!(mmio, [try: 2].field, 10);
 /// # Ok::<(), Error>(()) }
 /// ```
-#[macro_export]
-#[doc(hidden)]
+#[macro_export_scoped]
 macro_rules! io_write {
     (@parse [$io:expr] [$($proj:tt)*] [, $val:expr]) => {
-        $crate::io::Io::write_val($crate::io_project!($io, $($proj)*), $val)
+        $crate::io::Io::write_val($crate::io::io_project!($io, $($proj)*), $val)
     };
     (@parse [$io:expr] [$($proj:tt)*] [.$field:tt $($rest:tt)*]) => {
-        $crate::io_write!(@parse [$io] [$($proj)* .$field] [$($rest)*])
+        $crate::io::io_write!(@parse [$io] [$($proj)* .$field] [$($rest)*])
     };
     (@parse [$io:expr] [$($proj:tt)*] [[$flavor:ident: $index:expr] $($rest:tt)*]) => {
-        $crate::io_write!(@parse [$io] [$($proj)* [$flavor: $index]] [$($rest)*])
+        $crate::io::io_write!(@parse [$io] [$($proj)* [$flavor: $index]] [$($rest)*])
     };
     ($io:expr, $($rest:tt)*) => {
-        $crate::io_write!(@parse [$io] [] [$($rest)*])
+        $crate::io::io_write!(@parse [$io] [] [$($rest)*])
     };
 }
-#[doc(inline)]
-pub use crate::io_write;

-- 
2.54.0

