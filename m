Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011024.outbound.protection.outlook.com [52.101.57.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A977D405C4F;
	Wed, 27 May 2026 12:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886351; cv=fail; b=CjxyljKpacKh0qTfoz4uYpk/MD26Hkexlz7WeVVM0Z6aPP2O6TdpQ1W7XfwSh+SwqoeoO2rVYZLV3CAOJBa3eH5EkGKuKXPwr7xC4oYJgo1IXDl/dKzDukz8uNCJo9Udmd9dI4ELvLPkyneftIlcwfL7q8F3OKY5cA7cqTxnW8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886351; c=relaxed/simple;
	bh=GZQC9BijEtkhfFeoAU+yGeWWze+MavUSuyNwJCYl4rE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ezDzoCApxSJB3OnqeXh/Rzm+7aAJ7Q/45e8p4fY0QCbMeNCThUZf5xRN3mye5FWM1E8wuFD9H9Njqb+IY4tr3yhZQfe8V3zz225HqZzqDfH35OKDKBNM7S7XxvYjdaMXM8TQAcxrePQv61oRBvkP28p0nadGgiCHfb3oZ032jbU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=IkOlCqDR; arc=fail smtp.client-ip=52.101.57.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="IkOlCqDR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y79XZxXBrORj73/TutzusAjpw2t+HHBgL95UmjBvzoXzygY8QyNzf1CLCm117hgdyNm2A0VA9Blc5BAfuuhTEpgU4Si1MXx4Rq6M/Kq2palUrMgnTmM1Nl27owzowlvt+Bq0aeeat8i5DusYWqY0QZXJpForEHqfv6fE3qzIK5L9eE7aDz0prmNxG+/khkl51ij0xN1zAbohBDHmcU2GN/v8vWRb/zDwwZ8eYGEM6VJrEB6KIyDK+GnNoPCgYgOoso8EunOVItNCG6o04SmXeZw8G3+G3HbOCkUeTtQNZ8gpOKkbRKU4gmwFhlp/GSSKBO0fpoSftaK9NYL65+ojCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=amEDLuwKtFZOk/fHmbcfIN49kJ+5yadhZytH2Bm9Oak=;
 b=ClyFjL+8+fvjV/DIOKJs8lrMzZto2hegcbl/ZU0Dh6v+viRAqw2d8FsxdnnLmHfiRgQzzBBkTfKMIhWqxvMtvFV9/4vRwgH+yH9uKjgxOwXBXz66gt8jmZ0U0t4cKOmuRLBKO3RbTYHNCekUt1mdy9Y2MwK7iURivyGzs8NcshevqADzjAsit4QBa4I1Ec8FFDssEUgJfyXlTHEwyj8pcrX71gx+qBy058PdehUfdQWnPvyIIwElrgMJvyzGeFCINAr5bHDmoAtVdHsH/kSNl/MBQU7epQ2KE1tYI7+nx7mOGW2W2DpAr5moLNr1EI9Jv8gsYb4RqslU50viITLC5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=amEDLuwKtFZOk/fHmbcfIN49kJ+5yadhZytH2Bm9Oak=;
 b=IkOlCqDRycXQywsPdSTBFTyfHnyzKPZ7gaNOcvbLBeGcXUWIOMRJfU8QwZZLioGMbb/XBOZzWOetv3PPoXQ2XUwGO/VaKhvMUXjKvPO4oayCuxUPpBchp5FZKDnxwplmgZ59+rwD/Z7nKKcQ/m3mpDECSaVZjP8RHcbdq8w3v6egLMHCzuCNa0o07DyP15SDmItPha9Mcvv5iqyL9wHAY1QlqFAzVmu3soHIdcVP8SZTL6M73QUzfc1XOsq8gLSB/6j/T63yKq5vpKJ//4qoqvIAbx5oWZiPHdyxq+2PX1N3xgCtPB62of+pIfhGj8n7gpRdonQl9RTBIZVcT2fM0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 12:52:22 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 12:52:22 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 21:51:58 +0900
Subject: [PATCH v4 4/7] rust: io: use the `bitfield!` macro in `register!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-bitfield-v4-4-e8821d4efbde@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0229.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c7::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ddf564f-8f3e-412b-8d19-08debbeecb53
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|5023799004|11063799006|56012099006|6133799003|22082099003|18002099003|3023799007|921020;
X-Microsoft-Antispam-Message-Info:
	DZ2I7kB5UnpZXn36wwP8hHh3HCJkfg/RUaWYSK2eQUenYJBRpOXKT6cBzfyXYoCMshQYzBe7CuzFLOz81DDpnTOEZpKq9+852u2q+SYRwlWlFr5cFGJAEhFcWjCurmcZUkN/o84iLRzk3TTuoR6ozktOF+QnJpekpUmacZdqb28ldcqd01643AOFA1HM6+OlYKnp9HRqVCB/oCfupMJwbTt3MR/aTfJZwZ7CxEBbMXNMxIPHS9ekKsFCA7LkLWvDypFYQnyDwonAK7OtPXwGItvE/R55QOqO+Nye0t0njmo3y9j+PPVwkqtJoovRZb1ld0SR2/4PUabQ9PKl4pJYO6o34Oc9WQnb4sguGOumjjkveKPFz4YAM6r2/eClVGe+i+6loN5S3k8YFv8pyJxOUSUXQtPxWx8vk7tE7//fxQDhzIUVJvrR2488Tlyc0FCvmXoVHqTUlVi8macfG0fK9M/+bghPjEPWTHpbcvhpTKj3Hbu+R3jghmjA8JS3WOlmo+HOY6Zgq2kFCQSS13i9l0aLcTbbFtPNpao5ErIHzJGvxFGfX453f8vXNQdYpxtPyN8qYZsFw1626P5kA6yDa0CW240Wi9ag5+AYuYrM9b0gQgwaDff+SDe1mD5SJvhyZzynx2Dhjcoj2QSVQ4oBeMOWiZaBujsnOi4YEdJvZ+YAVEoQPOKDUpzH94qcy+yUoU9P2Jfcoe33jcZmE3q5aEAqOWdx+ueb0WUsz5CxkD8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(5023799004)(11063799006)(56012099006)(6133799003)(22082099003)(18002099003)(3023799007)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RnJsdEkyU3JvWmNhd29Ed0xLZ0F6VXFWbEQ1UzdSUFEwWUxmYmxuMC84cXYy?=
 =?utf-8?B?OGNobzQyN2ozVHZIYk9xZ2owYTh3R1lEUEVRNS9tNW9HNW5DSGlJK2Q4Zmlh?=
 =?utf-8?B?bHNYMnZQd3JpZlFSaktlRDR3ZFo5Sk9Uamd2NzRzdXJkU0JuNVk4K0NVVzFN?=
 =?utf-8?B?TGl0cmtmQ2F5UUdxOWhjUSt3ekxNL2YvMUFNaldtR3FSdTc4MDlob3FZVmVs?=
 =?utf-8?B?QWwzbis5WWF5ZG9POVRoS0wvTnk1ZWhhVS9GbDg2RXFEdkR5RVRvSlREZDY4?=
 =?utf-8?B?SGZtRVJDYWRuMUFMNWpOaXVMNGZKTnJmYU9FTytDVXp5V1dTS3NERzgwci9E?=
 =?utf-8?B?NTBHQVJlRk5IWXlQVkJHY0NkWlF1eXlTQ1lvQXo1bWtodWhaRXlxWC8vMExa?=
 =?utf-8?B?eGVvRHNXWU9LQmF0NGlPUjBVL3RYdmpTbytoWC8wRmQrS1JnS3NSWkN0c096?=
 =?utf-8?B?SFBRdHA1REVNSTM4c2wvaTRWeGd4S0ZKalRJdzJSajVPaUFqVlphRE5XT3l6?=
 =?utf-8?B?VkwrdDY1TU1rdVNTaCtHWHZmZTJLRFVkVXovSUl6VkQ3MnFWZDJMNVFETXRp?=
 =?utf-8?B?NnRqYTJXWUZqSjJWdFYzc1I5VWExNGl5UWZhT0VmcUF3TExVcHRBemVWRWsz?=
 =?utf-8?B?ZUdzVXZ2ZlE3QkplSTdTV2hTbFViWmsvS0FSTFJ6bW9NbkMzMDFCODkrVVFZ?=
 =?utf-8?B?NVdZbzUxeG9IeE1XMjhZTlF4eHFzY2xsTHpVQzF0YzdPcjJ4bGJ6SVg5cDly?=
 =?utf-8?B?aDNyb2NNaVJNTmpwU1pvcGhzL0tuOStMWEhERGJpL0FucjJGSDQ2cjFQOXM4?=
 =?utf-8?B?Rk41NzdZVzJPbGM5MEp2RmY2UnJGVmRsampqM21DVDN1eXZiWkJWdjJpaGZo?=
 =?utf-8?B?ZVhKUGJXN3IxZUJtZWs5TVU1WjcvdWpjWFBCRTFCemI1eGhRZnR6cTNZK3pJ?=
 =?utf-8?B?NUhrZkVoUFJaQTFiY3drNUZ5cW5JNHppb3lVTFhwYVYzWTgzV0h5WkVlN2lw?=
 =?utf-8?B?TkZ3S1ZtYlFvMnJocXlMbElaVnBNUzdQYTNmUW5vSHNCdHRMdUVLMEdqQVJi?=
 =?utf-8?B?czRtMzdjVTFTUmhUbWJNRVkrQlBDLzRqV1dzQTF1anRWbEFETnZpdk1zVXlU?=
 =?utf-8?B?NFdlSWJ4VnZQdzlGZ0lENE9tZkl3UjZWNGpacldtR1k3NEZRdVpOaGpvd1Fn?=
 =?utf-8?B?bjg1bjg3T0NZaGZCU25jQTRmSXB4cGRycG1wT2w2dmVlMVNZVmFuVkloREV6?=
 =?utf-8?B?TG1ObTR2U2cyVGNvVTZHN2VlVFlNaXA0ZG5xa01hZWYxVmsxN2dORnV4U0Ur?=
 =?utf-8?B?VWNDbURtL01KNHoxUG0rUDJISXIvTE5PbUJNYmpIWmd1TkJkQlpNV1I2c1VL?=
 =?utf-8?B?Y25wUVlDMW5Dck9xeHdNc3NpYUhDSDEyeTZCWHJGam9lSURlcmZvZjd3UzAw?=
 =?utf-8?B?Sm9yR2RnTVNiR2xZczQzREp6Z3J5ODBkY01BTXBMOTNBVUR3cGhrRlBQbkFC?=
 =?utf-8?B?cEJPbkFrM2RSTlVMNkExNmNuTlM3YjhvMWxnQ2Zxa0xsaDlub0w0M2VQVVZa?=
 =?utf-8?B?WFJrcjVWLzhIejFFMGVUWlpQRnB3L1d2Z05XR3Z1UDdpREtCbFAyVnA0eFM1?=
 =?utf-8?B?aXBuRmJzTVE4c1h0b0I5blFhZkhyVDdMQ0hVTFRpaHV5eWc1dzE4VE5XUklr?=
 =?utf-8?B?aUpwdEQvcjJnY2p5amxibVJJOFBqQWpjYnE1RTZCYlRqWXpNZUwyKzhYS0Vo?=
 =?utf-8?B?SmpIVUpZT1pXOVAydTRlamtHWkoySGlSQ1ZKRGJRdWcySzhZVW1iYzhJV3Ru?=
 =?utf-8?B?Vy9yZWo3VFUzQ3lFUWIrblhhSGgzTzF0dDJiMWxWN29aL3FGb2VUT1hBcEZ5?=
 =?utf-8?B?dktnTW1YRTZFME9YMlhHMjdWbVFMMmtlUHJ1K05oVzd3WjUzMDIxZWNBV2M4?=
 =?utf-8?B?TkxqajRvVWYrVlNEV3RzK3JBZGxSSzJqWEIzeUJvY2tLanNkMDY2MnJoT1Bt?=
 =?utf-8?B?eHpiRURCVVBEcWdPN09JK1F6RDZNVHdQMDQ0cThwVW5tZE44S2VqbzdpNHMx?=
 =?utf-8?B?czFqeHB4N3dCRzRPL25xVklPWEJ0bW9rd25xZlVlTm9KMWsvejhuNnF4Qk1l?=
 =?utf-8?B?TDFLamdvL21sdlVLanF4SGozTGUxcW53c1JlaGtnUk1HOW8veEQyaHMybjZK?=
 =?utf-8?B?TWQ0aXRjMWsrRldxd1NHYjRiRXljc0tWT3FwSzhnYVdMSnU5WjJMTThzbEZs?=
 =?utf-8?B?U2ZsOU5FYUV0WWl1a3R0My9PRlRpTk1aNUxOOWZmajE2U3J6dm1mYkU0QXN4?=
 =?utf-8?B?VG50UHppbUMyWGI3RTFpcGZBTFByWnVPaWdzMGRoTkxNa2Q4d3RlY05ETzJY?=
 =?utf-8?Q?HTzAKZyl+fHF7UkZ4breDtIP/eTGV+VE8K1FCEcKkiDuP?=
X-MS-Exchange-AntiSpam-MessageData-1: Y4EUJDhQlZ3idQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ddf564f-8f3e-412b-8d19-08debbeecb53
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:52:22.3328
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mjPilqFfRBzrDk0x7irTgiFZlhuD1aiLcRrmx8MMFg6Fkp9DnpZ4UgCtGydQ/0xeZjgLbWuQrxffXMStRFFC+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841

Replace the local bitfield rules by the equivalent invocation of the
`bitfield!` macro.

No functional change should be introduced as the `bitfield!` macro has
been extracted from the rules of `register!`.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Acked-by: Yury Norov <yury.norov@gmail.com>
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

