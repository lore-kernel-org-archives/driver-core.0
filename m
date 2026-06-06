Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010064.outbound.protection.outlook.com [52.101.85.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64C403AE194;
	Sat,  6 Jun 2026 12:43:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749816; cv=fail; b=C3z/k/Hms6tFSNGm6ojoLfiodlobZ6pS/9yyUeT12qUFpyf2YOkJNMPz7CzAEpHcNGVxe0v8BTpHt1b/uFPWe5OxsY3hCcNbDsWJxoLdmu2yCKPOYWqBaa80XvJRDWK6wHXOX5Yk9Xg6RI/tVG3XULq7ucfiQ20E9qlJDStLIx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749816; c=relaxed/simple;
	bh=+N7MwY8L8OeAcDzWRXVEtu4vzkFzWQhVfBq67eJfWC4=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=N/UdkhR1LiFuWK3OmnmiqD4wOPEWt6CV5pmItYWLeiJU7kvsAcNZWfsUJFvn9jvUl9FCRZ6KsRpF2aj3BqPMgOcOggVZ3nTMZBsO6NnWxrAte24lEAx0pjmdWpJHmi+xYr3G3/H7wyeKs2D/Q07EHdI5DCQS/7aDX3KFLEo26l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=UYy86QQf; arc=fail smtp.client-ip=52.101.85.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="UYy86QQf"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uavby9VccOLhv4M2AN/M0v8iozm6YLQiuN9rPNznO866rdxyhoWCtiIAqOi0N2cvAeX3jt0ug3xzjeu1YoJiEK8ABldk4Hi+7ORa3DDD5h1l57mXTLKPwoxOZqQ0MJ28xlDka89ChG2UJd7Ejf4ImetDiOUv0jZrHq6Yzx0e2g67j8gXwLWnLX5r2d6BTPRLSBqAV/luaH+MzU4BMla37YtSK7naDJbG5j+xYtBKb6/YpWUouO6mx6NC8uHhuMpvWRgN4Q0IzpGbWHtmSNjLkjMzmm8JQn9OkNzq12Je0npo+HmlFbAChq9lJgYVT6dEF0bpLZCgmy483X7HD00k9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a3MZzwtoGJMQd0XhMtqUl4I/37/qDHLRJC6TFKgxmr4=;
 b=um4QPujw9Nd4roEJ9zPYB7RI/IXvxaY0DI1n/RH5LW4Z58HLzKpNKgUVqEHEnACH3JEt/dtLsbqgiypN30hVDT5LfzlGzo1tNyTvRMdRcgSBZKEubYaQfJJWuA32aDQQfpN+tq2NBZukXwvqXUltz6iGMIDwGM2T5VaSoo60bWUhtD6npr+1Jm8wo2f1YCJ4Tp/sfvWf2axBYLMbu5eiPkKWUIyOCuT8fk56hPZlyJZdruXvXDpjNEkfp6mehecEiHPG0yARTCOaysBZmb717FwJNf2qiwstvXo7Q8uXEEnb5LlP53hzOKAvFsFrp8uwChyyBViSP0JosZXm6L4kcQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a3MZzwtoGJMQd0XhMtqUl4I/37/qDHLRJC6TFKgxmr4=;
 b=UYy86QQfxxvlK6FXipHpUK66CHndzk8Z/OTCEUPyjSxHM8A2R53czCQX/DDzGCHLYneR8OKATasFHchxxibKuu6eRLmZ9bnU08if68MWbWzpIF/umBsZ+AEAC9XZHgrWT23Q0qXrjg/tA9VIkqI5xpVeCtSrCuf4rOHHnJf4ERv4UQGFMQm616savVH4+JVvbAiYhrajyHqccX4NR3n9KlinyG2KwIBt97cUk3n2LOexWd9KpY5dqCFARdL9IKOTjB5ovxkGYwO3ZEp2+GPIoAQi1Yx2ii/PqKX/hm3km+1AQdqRG3NWqwVVBrGvf73TH7olwsQ8JVM+k95Vt3skkg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sat, 6 Jun 2026
 12:43:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 12:43:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 06 Jun 2026 21:43:06 +0900
Subject: [PATCH v5 3/3] rust: io: use the `bitfield!` macro in `register!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-bitfield-v5-3-b92188820914@nvidia.com>
References: <20260606-bitfield-v5-0-b92188820914@nvidia.com>
In-Reply-To: <20260606-bitfield-v5-0-b92188820914@nvidia.com>
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
X-ClientProxiedBy: TY4PR01CA0018.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::7) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: 41c61df8-4a84-4a1f-4c36-08dec3c9365a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|22082099003|18002099003|6133799003|921020|5023799004|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	WIubFTEq1c/HyzCnruFr7aMnogE0m+JHPP/0Q2jt+a20pU5xvy1UUICkvpyPnvMUZDN3NdMSWynXN71rLlCMWvgI/8Ld+9Nc17w4pDZIVqMOsNq1Yf8NEbEBI7Gtr57pVm1/oVmrSyQDIJIiVvKnzAyUxPCz8UT25Xs38sLcZ9yg7j7fTKMwTly7NBl44rA00vtjWZLfzcUlbC3NdW2g6SDSu0pXntPbQXDeGIhgGqShNoxr6vzR5k6Xkz9NysCLgZC45PvE2RhWIJ8D0n+spWNNNvb7v8gTc3rJ/v1VOZPGsoVYPc5WGHldRpXZVaFyIanOt3YaLSQmzK7wBYOhPzlvV5PHSuzheGfvFlVafLwijEGqiF/VMVdoeJCoKGpFAwS6gJQ0YIrMwcN5gzNnwBoQRgyI8WkLgBTXxqTPX2y0SpZaOSdnEUT1fNwmtUcEtrqZ9AnJVtVN00/lIZOsH0FyTsndLT0yoClRKOSKhvzf+vycOIBzlVSuul+OhCRi7c1vqa2Si8VzlQhBNY+6Lzxg1EA3MtqpGAjjNMEqHngLfY3WgotTMlcE6qbZPs9zrpV5Q7mKgH6ytjcMNrq4Kr63tjxYLkUFMAxH0fS/8ZsheFQ+o91W9duqACn1OMOdBZUP3Vp/tlBrmR1HG4ksd5t/V7nKIL7i1kysoOJvylb2d47lLU9h5qVaPFzjpXN+Jm/S8aEcrlVFpMZVlKNMGsHH2236MpBPoOXqCaK+I98=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(22082099003)(18002099003)(6133799003)(921020)(5023799004)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VVZjaHdUbDV1VnI4QkVOTERsakRlVlRPZy9JSHcyNkJIM1EvNXg4MU9KVGJD?=
 =?utf-8?B?dXZWdjNFU0N0a1lEbHhRT0hyMG5NeTFreEZHQ1pZTFptVFhVNG9JYVBkUStR?=
 =?utf-8?B?NzRKbDZuMGd6cTljRlAzSzhBT3ZnaGRGTjUxcHl4dThtRFNiRmd0eG1qd3lD?=
 =?utf-8?B?eEw3WElqV0hnTnhiK0xVNUR2UWpLci9qS29YTEJHekRoK2c3RThsSkJpRjBn?=
 =?utf-8?B?T01oSjlCYUd6VTFBZTJEeGRYNkFPOTFNUGZkOFJLeldUaFN3UlBWZ2lXTkZ2?=
 =?utf-8?B?SDVDSVdicU0vcEo1NnQ0MWhMR3k4c3FMbmVTR25XVG8wSXh6UXZLV0hhYm1m?=
 =?utf-8?B?bEFpdXE0SGl5eTIxVFh3RHNUN2RJbzE1Wm1WL2xLVlo3S1VET3hFcFFxZTdX?=
 =?utf-8?B?RXpQSXlwTjdEZ3JwNTB4dUFjdUdmWStzY2w5Q21kTWNPL0F4OFdKYU1Gd2wy?=
 =?utf-8?B?eTJCMGZTc0VvWkZnMUJFek5zOUsxSmVkTGx3NUFVMUc3VFVsR0piT3E0RDJI?=
 =?utf-8?B?ZzFtSDh4U1EwREowMis2TmY1WHpXVUg4OTBpeDN6cDVHdkxpMFcrRUdjWG1r?=
 =?utf-8?B?KzIwL1kzT1orUG4wYkxRajhKRmtBMmh2eEVaMDlJZFV5eFBCekRXSDc5RlIy?=
 =?utf-8?B?UVhqakRZeUxCZ1ZnZ0ZsQlJBcGJ6dmJxWFpUUEdIdmFHTkdLQjBkS09EeURn?=
 =?utf-8?B?d1cwNnE2bGIrQ2hqSUNRMHpiM1NTKzI5eWZweGFJU2RlYUlaYm42SjArNkRL?=
 =?utf-8?B?NWxZNC9aK21PSE1iL2M2cEdQUWlTd09GM3hWU2ttbXFwU3Via0oxQjJ5WGVU?=
 =?utf-8?B?NThEMzJoVnNwWk82MVFZZ1BYbXVGZkpxelNhREowR1pEOGc5d3NWaVptVlJW?=
 =?utf-8?B?SUNtN2tyWFlWUG9JNlJqa0NiR01jRFVVTXNoWk12VStEREJKZ3JMcEF2TTRF?=
 =?utf-8?B?Y2VyWjBBU3p6bkVjOUlOVEJqZkgvRlFxb28zTGtMQVZ1N25wOUlzOEZrZnpM?=
 =?utf-8?B?NEwwTmp1RGlVcGZGOEFVa2NEUmhyd1V2bkZFcEJ0YzduNDhXekZONTFTYWl4?=
 =?utf-8?B?T0JxZ2czbnlCTWxmTFNwUDVsU012OUlEeHdlcVNLR2MvTWJNU0ZwTWptYTQw?=
 =?utf-8?B?QkMvbEl4TjVaZFdXVmFiRk9DbzFRMEQ2VUFhU2lsRUJuY0M2Q1JnTGNGcjda?=
 =?utf-8?B?bktuaFArZGlQRWMrbXNSR3dneGFFTU5oc0NTd2tUSVN4bFFaeW5RWjVmZXJL?=
 =?utf-8?B?NEdrck9MbmJMclJFMmNOZzdvWGRLNUxZWTdqbWwxMGlQbVE3UWd4M0ZEKzFu?=
 =?utf-8?B?VFhXVTVEWTZXOVpKcDNyTzdER092VXV3bis1bjFRcXhrV1FRTXptVUZZaG5z?=
 =?utf-8?B?N0x6VzlELzZ3VEowWEpzUE5ObmdoWEQxZUxIclpSelZ6Q0lZVFBQYUxSOFlp?=
 =?utf-8?B?WDZWeTFLcVplMU9paTFjQ1dpZG9RcmtGNjVyNVhsNmd2anFDcCt5THpZc25H?=
 =?utf-8?B?S1RtRHlPL1kwSW4zclk3UUpVdDlSd0xYcEZYTGVmSXc4K3ViUi91OWNEU0xT?=
 =?utf-8?B?eCt2bHlGOUZwcm1lVzkxYlBPdEhYY2dhS2d1SUxxWTJvNGd1bHJpZm5lemZ1?=
 =?utf-8?B?MkJBN0VhOVlDY0lkQUY5WURwTG1zbkNySFI2RFlENWFSYk1ybEozQWpRT1VG?=
 =?utf-8?B?ekg4a1U5L3A4dUtWdWdhU2VnQ21RZktxb1NweW04NWxzRlhROC9iTFRTY2hB?=
 =?utf-8?B?VkVReWZkbVdXbFhEWkx1K3dpc2dXaHlBWEowZndPNGVPL09hWUU5bmQ3OGha?=
 =?utf-8?B?V0xrd0FOaU4wSFR3MWpUSUJ6azl5QkNpMHozYjhkVHIrYXZwcXBuanh6dWNz?=
 =?utf-8?B?K2p6a1BhdWEzR2FpanYwZ25lcFgra3NwYlgxRmRPdTh1MlRUY21zdFlqWmVS?=
 =?utf-8?B?a3RLbmVENlNYcFVmYmx0c3k2OE1Ec09vczU0QVJHT1VNUS80TU92aGlzWGhx?=
 =?utf-8?B?RjlBWjUvakV0NjJGT04yVFhYSWZrUVJ6OGR1V1ZzZm1iL1FkRUt1TlRHRzBu?=
 =?utf-8?B?UmcvTDRwVnczVW1vSmcyUVg5YnlhZm5oT1dyd2RVWk1pUGwxVXUxbHdvNjNZ?=
 =?utf-8?B?MlU2NXVHN1RJQ25sd1ZTNWlhSE1aUFJaU1dCb09VTE1NK1pWYXVkQm1vdWF4?=
 =?utf-8?B?K0dnNGlLbWlFNUoybzNaUWNsSXRQT2YxMVJIZVNKeGpWcUdIVnhCajg5Vkk5?=
 =?utf-8?B?WXc0cXIxMW9nNm5BcmtpUVNxY1BCOGtJWFRZWndnbjJEallENWFHVHVXTXE5?=
 =?utf-8?B?ZkJIdTQ4STc1RWZiR1dRTkxBSytqUVRFeE5YdnNSczhBKzVBcUJreGkrU2k3?=
 =?utf-8?Q?OljuJ4E06bQo2oR5Xz8UzqlfBEkNaQ9JujZIplbP3SaLq?=
X-MS-Exchange-AntiSpam-MessageData-1: MvWLOBOFhYeHAw==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41c61df8-4a84-4a1f-4c36-08dec3c9365a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 12:43:30.8961
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 15XiS2yzmXL4ay82c2WdQhlTliTtEvjMpKbTKqNXDDJTa8SwTmqewSvAurZ3FepdbZ2Cwt6kXja0F0a9CiljOA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730

Replace the local bitfield rules by the equivalent invocation of the
`bitfield!` macro.

No functional change should be introduced as the `bitfield!` macro has
been extracted from the rules of `register!`.

Acked-by: Yury Norov <yury.norov@gmail.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io/register.rs | 246 +--------------------------------------------
 1 file changed, 2 insertions(+), 244 deletions(-)

diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index abc49926abfe..388647f28292 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -956,11 +956,10 @@ macro_rules! register {
     (
         @bitfield $(#[$attr:meta])* $vis:vis struct $name:ident($storage:ty) { $($fields:tt)* }
     ) => {
-        $crate::register!(@bitfield_core
+        $crate::bitfield!(
             #[allow(non_camel_case_types)]
-            $(#[$attr])* $vis $name $storage
+            $(#[$attr])* $vis struct $name($storage) { $($fields)* }
         );
-        $crate::register!(@bitfield_fields $vis $name $storage { $($fields)* });
     };
 
     // Implementations shared by all registers types.
@@ -1016,245 +1015,4 @@ impl $crate::io::register::RegisterArray for $name {
 
         impl $crate::io::register::RelativeRegisterArray for $name {}
     };
-
-    // Defines the wrapper `$name` type and its conversions from/to the storage type.
-    (@bitfield_core $(#[$attr:meta])* $vis:vis $name:ident $storage:ty) => {
-        $(#[$attr])*
-        #[repr(transparent)]
-        #[derive(Clone, Copy, PartialEq, Eq)]
-        $vis struct $name {
-            inner: $storage,
-        }
-
-        #[allow(dead_code)]
-        impl $name {
-            /// Creates a bitfield from a raw value.
-            #[inline(always)]
-            $vis const fn from_raw(value: $storage) -> Self {
-                Self{ inner: value }
-            }
-
-            /// Turns this bitfield into its raw value.
-            ///
-            /// This is similar to the [`From`] implementation, but is shorter to invoke in
-            /// most cases.
-            #[inline(always)]
-            $vis const fn into_raw(self) -> $storage {
-                self.inner
-            }
-        }
-
-        // SAFETY: `$storage` is `Zeroable` and `$name` is transparent.
-        unsafe impl ::pin_init::Zeroable for $name {}
-
-        impl ::core::convert::From<$name> for $storage {
-            #[inline(always)]
-            fn from(val: $name) -> $storage {
-                val.into_raw()
-            }
-        }
-
-        impl ::core::convert::From<$storage> for $name {
-            #[inline(always)]
-            fn from(val: $storage) -> $name {
-                Self::from_raw(val)
-            }
-        }
-    };
-
-    // Definitions requiring knowledge of individual fields: private and public field accessors,
-    // and `Debug` implementation.
-    (@bitfield_fields $vis:vis $name:ident $storage:ty {
-        $($(#[doc = $doc:expr])* $hi:literal:$lo:literal $field:ident
-            $(?=> $try_into_type:ty)?
-            $(=> $into_type:ty)?
-        ;
-        )*
-    }
-    ) => {
-        #[allow(dead_code)]
-        impl $name {
-        $(
-        $crate::register!(@private_field_accessors $vis $name $storage : $hi:$lo $field);
-        $crate::register!(
-            @public_field_accessors $(#[doc = $doc])* $vis $name $storage : $hi:$lo $field
-            $(?=> $try_into_type)?
-            $(=> $into_type)?
-        );
-        )*
-        }
-
-        $crate::register!(@debug $name { $($field;)* });
-    };
-
-    // Private field accessors working with the exact `Bounded` type for the field.
-    (
-        @private_field_accessors $vis:vis $name:ident $storage:ty : $hi:tt:$lo:tt $field:ident
-    ) => {
-        ::kernel::macros::paste!(
-        $vis const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
-        $vis const [<$field:upper _MASK>]: $storage =
-            ((((1 << $hi) - 1) << 1) + 1) - ((1 << $lo) - 1);
-        $vis const [<$field:upper _SHIFT>]: u32 = $lo;
-        );
-
-        ::kernel::macros::paste!(
-        fn [<__ $field>](self) ->
-            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }> {
-            // Left shift to align the field's MSB with the storage MSB.
-            const ALIGN_TOP: u32 = $storage::BITS - ($hi + 1);
-            // Right shift to move the top-aligned field to bit 0 of the storage.
-            const ALIGN_BOTTOM: u32 = ALIGN_TOP + $lo;
-
-            // Extract the field using two shifts. `Bounded::shr` produces the correctly-sized
-            // output type.
-            let val = ::kernel::num::Bounded::<$storage, { $storage::BITS }>::from(
-                self.inner << ALIGN_TOP
-            );
-            val.shr::<ALIGN_BOTTOM, { $hi + 1 - $lo } >()
-        }
-
-        const fn [<__with_ $field>](
-            mut self,
-            value: ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>,
-        ) -> Self
-        {
-            const MASK: $storage = <$name>::[<$field:upper _MASK>];
-            const SHIFT: u32 = <$name>::[<$field:upper _SHIFT>];
-
-            let value = value.get() << SHIFT;
-            self.inner = (self.inner & !MASK) | value;
-
-            self
-        }
-        );
-    };
-
-    // Public accessors for fields infallibly (`=>`) converted to a type.
-    (
-        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
-            $hi:literal:$lo:literal $field:ident => $into_type:ty
-    ) => {
-        ::kernel::macros::paste!(
-
-        $(#[doc = $doc])*
-        #[doc = "Returns the value of this field."]
-        #[inline(always)]
-        $vis fn $field(self) -> $into_type
-        {
-            self.[<__ $field>]().into()
-        }
-
-        $(#[doc = $doc])*
-        #[doc = "Sets this field to the given `value`."]
-        #[inline(always)]
-        $vis fn [<with_ $field>](self, value: $into_type) -> Self
-        {
-            self.[<__with_ $field>](value.into())
-        }
-
-        );
-    };
-
-    // Public accessors for fields fallibly (`?=>`) converted to a type.
-    (
-        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
-            $hi:tt:$lo:tt $field:ident ?=> $try_into_type:ty
-    ) => {
-        ::kernel::macros::paste!(
-
-        $(#[doc = $doc])*
-        #[doc = "Returns the value of this field."]
-        #[inline(always)]
-        $vis fn $field(self) ->
-            Result<
-                $try_into_type,
-                <$try_into_type as ::core::convert::TryFrom<
-                    ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
-                >>::Error
-            >
-        {
-            self.[<__ $field>]().try_into()
-        }
-
-        $(#[doc = $doc])*
-        #[doc = "Sets this field to the given `value`."]
-        #[inline(always)]
-        $vis fn [<with_ $field>](self, value: $try_into_type) -> Self
-        {
-            self.[<__with_ $field>](value.into())
-        }
-
-        );
-    };
-
-    // Public accessors for fields not converted to a type.
-    (
-        @public_field_accessors $(#[doc = $doc:expr])* $vis:vis $name:ident $storage:ty :
-            $hi:tt:$lo:tt $field:ident
-    ) => {
-        ::kernel::macros::paste!(
-
-        $(#[doc = $doc])*
-        #[doc = "Returns the value of this field."]
-        #[inline(always)]
-        $vis fn $field(self) ->
-            ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
-        {
-            self.[<__ $field>]()
-        }
-
-        $(#[doc = $doc])*
-        #[doc = "Sets this field to the compile-time constant `VALUE`."]
-        #[inline(always)]
-        $vis const fn [<with_const_ $field>]<const VALUE: $storage>(self) -> Self {
-            self.[<__with_ $field>](
-                ::kernel::num::Bounded::<$storage, { $hi + 1 - $lo }>::new::<VALUE>()
-            )
-        }
-
-        $(#[doc = $doc])*
-        #[doc = "Sets this field to the given `value`."]
-        #[inline(always)]
-        $vis fn [<with_ $field>]<T>(
-            self,
-            value: T,
-        ) -> Self
-            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
-        {
-            self.[<__with_ $field>](value.into())
-        }
-
-        $(#[doc = $doc])*
-        #[doc = "Tries to set this field to `value`, returning an error if it is out of range."]
-        #[inline(always)]
-        $vis fn [<try_with_ $field>]<T>(
-            self,
-            value: T,
-        ) -> ::kernel::error::Result<Self>
-            where T: ::kernel::num::TryIntoBounded<$storage, { $hi + 1 - $lo }>,
-        {
-            Ok(
-                self.[<__with_ $field>](
-                    value.try_into_bounded().ok_or(::kernel::error::code::EOVERFLOW)?
-                )
-            )
-        }
-
-        );
-    };
-
-    // `Debug` implementation.
-    (@debug $name:ident { $($field:ident;)* }) => {
-        impl ::kernel::fmt::Debug for $name {
-            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
-                f.debug_struct(stringify!($name))
-                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", self.inner))
-                $(
-                    .field(stringify!($field), &self.$field())
-                )*
-                    .finish()
-            }
-        }
-    };
 }

-- 
2.54.0

