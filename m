Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011024.outbound.protection.outlook.com [40.107.208.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC283AD525;
	Sat,  6 Jun 2026 12:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749808; cv=fail; b=LlkOYUW4SiNnVNzqD+zxCvzxZaSTYy5HiY1bW4Mjqy4H9NJGzavJxerXTz3FpcyNY9NR9K2OZHVL5TJU4W4kJ3DO20QcoK+eA3jt8sTagyIcquQPbgUbKiwsMjITJn/+lB91MWWwECzgv3/3UP08gnonyubLskxwH5JmzrROr7A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749808; c=relaxed/simple;
	bh=c6CySw4phJ8kviRpnCviFmghEDJjplf6ZlzBtm0+txU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ugzC4C7ohIJH6I51r0Ucg6K7he6kGz1sV1+IEUJlrqB5a94PLphrjbQ/irImpXnCwz5UZINYLe/Db2kiqE0QbRZdsH7GFXPqLtzD7RFsm4Vx3YcrUlw1MKF+SB9O439xUaEmDGjVPTzHqELyjfCyBuHv5m/lRPMSkzc9/rRB/NE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=tU0pVJw2; arc=fail smtp.client-ip=40.107.208.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="tU0pVJw2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txnTvJlVhXmJ3BXT+107zNofbsN85MRx8UaofwZrMBrzH8orBJchvyeAU4DlVUkSp2PRaSB+7fTerQOcwU+bNMa36ce4zNK6f6tRxYDTDN2HSEqPjWCyBitpCo3KOe9Pt6uBwXIZAmyyROvx6pxoPeh+BgHYjAR854TP3oe5vgsWJvLv5t2dMBzibI0KPP8vTeGnbN7T426OEhNM2B0EyLErcZJywZOwrWxJ59G3wT+nlp0S9QHA3oFcSY6LrhP3N7qlbVafcmvwUG2W4dR4Y0rncYpaKxUOeOBtuK0ZrDMAj65742+LR8SzKOHPJCBKk3MQW3SJByHbjcVtbnpkqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HPoMPigwcVH4Gn1SRjHmXpIIDDoxHPSnXRma1NHqt3c=;
 b=fHNjvDR4i7ypLfud7U3IWYtZnNZJEFSwSfwbVgEhniOuSM4zdCFLvApiMHm7McFOT2VXo9TIwLGzRfsEn4GRDHqHX1bhh/SmluwhEqCiONjIof6ho3I2gj5x7OegdomUH8qfTtM9khWCH5U1fSMt0Zoss5QFYRS4V6q23UcePeKgnyWy7tMXOIv/Vb9VxMjgx2dkSUql0HbvtDe1VqLPOiwELb8Mujdp5QgJlSwez3/rVVMnpe4gJ5K9W+Qgp/l2Q7tEhpELgHUBnpY9OP4FR7oBTCsYmUxosZEnKYKQRuD2v8Dvd47HvBPxh0YWIjHDQjY1uZ2d8+Scq5Lz5zZO4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HPoMPigwcVH4Gn1SRjHmXpIIDDoxHPSnXRma1NHqt3c=;
 b=tU0pVJw2h3LXHWIAGimmpUxAMLCPaFM/P3qMhK9Y27ue0p84524GthsgTvP+tVY6Z9NJ5rX17x3DsEJ27gi76lLsnRmHu9mTUXySvyhpYJ94fyJhDfxLna6ob/Jj41ulT/GqRjtz9VhaSfQoTOzxqY2F4rU/zUnt39kOfc4X+uYu9tR7pA8iUIRpMtUOBjczcHWYPcZouTMcukFzpSXCYX97pvvYMW7UvHCsPTDIRjfymygjvIYz43Ldfo5TWSgHqdo3Xw0oPm1SVrftTFG4asqjCLvLJwoUDAgGRl3ZEiZKeBUt40Mu7CnwH3jt/svwA5VFsx+ghx4yVqyZ6fdfZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sat, 6 Jun 2026
 12:43:20 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 12:43:19 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 06 Jun 2026 21:43:04 +0900
Subject: [PATCH v5 1/3] rust: extract `bitfield!` macro from `register!`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-bitfield-v5-1-b92188820914@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <ynorov@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4PR01CA0121.jpnprd01.prod.outlook.com
 (2603:1096:405:379::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: dea625ea-8a57-45d8-aaf2-08dec3c92fd4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|22082099003|18002099003|6133799003|921020|5023799004|11063799006|56012099006|3023799007;
X-Microsoft-Antispam-Message-Info:
	ii2/0uRJ8NkV1tdxnGSTZKXwCp+r8yhSwk+FgwfQ0ou3iOrZ3B93BEkf7rJO93Xg/em0fyOzM/HNPVgtQFGaplfWWjK5ZT4lfbt4xLmr+0rkOi4hPwuYdZ/aou88FBmPaqhk7pELnDf9vqLkyiYPFXwGKNU4XgQHXdMSjA0eYsCCQu5MydYs1zjvM0MF5gb9jh+tkzc8iiap8ulrYAzZ1U3p382dRWgbA/2xqHMCNdaq7wBrYlGQbZ2OrL8DNRqK7ZZ6rdm/yOO8gDW4fGUpTLnHKdY/4waRAo9XMvcknw0tbamdOo5pXolsFTIYB5pEKMgyJIqerwAdoyZ7Co3S6MlqG5iREQJQgWnbq22jWbAxPUd03A7KqyTzWFkOTxrNO7TtsVYw2FUUPyWMngk160tO+UgwBg465gs8w0l/OnY1VUo1n5JqkBFeTWACu80WwLdDTXOoCeyGq7soqShsSuRKSLdWno8TUbPcLJl8DLtPmo1zsl0S0a2AHlNLBGrTLz32OG6Y1YFmRWYaXWMEk1jJIOIsPNmb6KxlAehd2nDgRfVgbR5SYQN57uusE+ohsgsQJbEizJYFJuBiiJB0YRHGdV7BVtvw9rBy9wCGdpExgEV1UUDCVFptVBRN93JIUP1uEzS5Fgiu+WSwPxnFNpdVeBb72+2NrcjvY6BGB5KURytfyWqRBJiiSRU299zeK8Cvhs0DVZB1/v/r7dv2cmoRNNLky30fVcqrHUtNbtA0BMD9C8KZcPnJmfCABJ+S
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(22082099003)(18002099003)(6133799003)(921020)(5023799004)(11063799006)(56012099006)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ME5NYzBkKzFuaUxNS1lrU09IaS9NTXl1MWp5NnFTRkhzUFNWUFFhc2xBWWY3?=
 =?utf-8?B?cGJWU3RaZUJTOThPQ0VWdzFtUVBSZSsxQkdiZStSb3FqQVZGMHZCRnFTaEIy?=
 =?utf-8?B?WHB0SEhhV01xZmcxc0Vma1ZaTnFGSG4vYlFMUk1kNmRKSmRtUjc4bERoWW9z?=
 =?utf-8?B?QUJwNmh4QzlCVW16N2oyTGMrY1VkdVlXSWZCSEU0UXFhUjBTK3Z0ZFhvVStP?=
 =?utf-8?B?eDRsdzlqSjVzSTBYb3dsQWM2eEZvVzFURHJqQWo0cHBTY2RZYzNGcFpHbkVR?=
 =?utf-8?B?NzlDbnBBTTlFSnM4cXN3bnR2WThpckt6MzRBQU9MeXh3ckg5UFFiTkxTbEY2?=
 =?utf-8?B?MW1DTXhUQzdVUGJyS1p4SXJGV1hCUjhYYzJPaEpPTXRHNnM5ZnpHdEx6Q0RY?=
 =?utf-8?B?eDkxSnkyZzNISFRFOXlFTHkyakZpeWRST1R1RTRXVjhzRkR5QWRBcnUrcDNi?=
 =?utf-8?B?U2JxSWxhUmt0cWt0QUc2NkxTSnk4ZnJmSWRVK0F1RHoweHlObWxqblZiYlBZ?=
 =?utf-8?B?Z09uZVNON1p2d04zN2dZUlpXcm8yWVQ1WnA3Vkx0dE9hS29VR3k0TnMyMUg5?=
 =?utf-8?B?UE9vdDMxNGVieHFNOGM5MmlvbUtTTDBVZ0hLM29EWTdsSS9FdkJKMnUzUTl4?=
 =?utf-8?B?cjV5SDYzZFdvR21jVnE0YXlZcWg1RFlCMkFGQzlCeGoyU2xEKzVuNUFLNjc0?=
 =?utf-8?B?RldnUVVwbEx1U25EZVpxQjhqVW1SbFhvdHhOTkxRTzZnSjIxdmFuQ3BzTmJw?=
 =?utf-8?B?U3dvcGRESjlTYVJxbWw0a0lWQy9ER2JvODd4MTFTcDJWa0duMXh5L3Mrdm4v?=
 =?utf-8?B?M3lrOEQxTnhLbXZrdTF2U0V6emlKeFl4SzdSNWM3L0xkVDhJMzl6ZTAwV1hj?=
 =?utf-8?B?NmdhY09YNzJFVFdZYlZYUkE5NFBTNVRNYjBwMFczdmIwUzR2ZlhRYzNIdklw?=
 =?utf-8?B?a0tXcGt4eU5PWEZqTE1oKzY3RitNN1YxcFQ5VFZCaXU0ZkZpTURBLzJYeitC?=
 =?utf-8?B?blpkV3pKUWRtVU5BdDNVc0hDUVFyRWljNFRwT1gzRlBZa2F0MkxYYVUzeEU5?=
 =?utf-8?B?WmhKekFEYW1qakdaYU5kVWgvMHNLME5FZTk1WTFKK2wrdEE2V3liN0grL0hR?=
 =?utf-8?B?L3VOZUZyRUErK0tXR0p1ZjNUMno1SlhueFdLMm9BOTBrWVp3TGlUWjZyZERU?=
 =?utf-8?B?WTdzbWxDQTh1alQyRWJ1VFFyeVZGTTdmUE11U20zMFZneWFKUy9LVEkvcFNo?=
 =?utf-8?B?Z2NwTUZpVGFmbnphUjNISmdObnQva1hPVjExYW83MjZaT0xIcmJoQWxIWENt?=
 =?utf-8?B?aUpiV0xLd0tVd2RjVzVyd2pxVVI3K3hWcnRyeXJob00rR1B5S09ZTlgrem1R?=
 =?utf-8?B?OE5LV3IydHp1L3JaL0hMNTZTVnhZWEVzQjVpSnRPNUhyczdCMTUxbHZLdjZU?=
 =?utf-8?B?RTF5Z1RGYi9Da0cyTGg4WnA3UUkxckJYcHlGVy9HdTNvcDFUOXlnZSttOElE?=
 =?utf-8?B?U3ZiL1dpdU0zTStzTlU4Q2JyV0JmS0Rpc005L2MrSWhzUzdreHBUWE5WazNi?=
 =?utf-8?B?LzMra1ZMeXZ6bS8yay9MR2RKYXFGRG9wZndlMDZsWlNPQWNuY0tsWEwyY3FY?=
 =?utf-8?B?QWN2UGFQZ0VQOW1RWktHSmkyYUN1ZzdlbUl4MElWZEFjODUvV0lYcWU4bmJz?=
 =?utf-8?B?ZytPNlk4WmVlMWpzS0Vodld0T1VFZUtkV3NXUFEycW94cXNWdldxbHZnOHJC?=
 =?utf-8?B?U0ZJMGg0bVVmYm9TWnJUZjgvMjJhY3pBYWZiVTZ1b3pUQytBbTJnQVlZcVc2?=
 =?utf-8?B?ZERwM0pFUTg5My9ocHpLNTl2Qi9heTBwZi9Xazkxby9ra3lJd0IvajNQM0ds?=
 =?utf-8?B?UC8rSDg4cytROTdvSklrbXB1VGphb21EUFV5WW1hYnhDTEhjWnFZbnhQeXlC?=
 =?utf-8?B?VEhhbml3aWswSTRBNEMvMFNGZ1pXbjNXT2dLOG91WENGb0p4Ynpobld3bmlE?=
 =?utf-8?B?MzREdU9CYkdLR2RMcEJvS3pyM2dRNFVHQnphajJIODlkdXNsSXM0VnpHWjV1?=
 =?utf-8?B?VjlvSkx6SDdzclllbFAyZlN5aHYvZVJLZ3Bwb0JmRFg5K1ZFNjd6dGRPRmIz?=
 =?utf-8?B?MUVuNXM3dGh1ajcxMGlpcHhRdEdPb21kc3dWdmp2OTM1WW13a3ZlYmF1RGFV?=
 =?utf-8?B?S2M2K0lSR1lNcUN3K09yNmxmY2hYZ3FkTE9Hc2EvL3JNY0F3cCtYZUlIbGg1?=
 =?utf-8?B?akYybWk1RHBpZ21qMG5LZXdXdUpZRFpVNWxxNnE5TXE5bmRoQzNhc2tqV1dM?=
 =?utf-8?B?c3FQS0lMektycGJWVFEyYTA1d1ZuWnF0S1VLaWUxSTZCVE9UdmlJSDdBZEdv?=
 =?utf-8?Q?mt4eeNFEZjU8S//J9DarIAvb8fmQrjx1eYvRtojH7c4Cl?=
X-MS-Exchange-AntiSpam-MessageData-1: jtkBwVQDQqci1g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dea625ea-8a57-45d8-aaf2-08dec3c92fd4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 12:43:19.8468
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V/EiHMWD8ZvFQRLihmoUp4qqS5HsGqnMEwLG6jndLEZIyQtfV3P+PHjUfEVz17cuTlh0lr5ParpXK0WJQSFsOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730

Extract the bitfield-defining part of the `register!` macro into an
independent macro used to define bitfield types with bounds-checked
accessors.

Each field is represented as a `Bounded` of the appropriate bit width,
ensuring field values are never silently truncated.

Fields can optionally be converted to/from custom types, either fallibly
or infallibly.

Appropriate documentation is also added, and a MAINTAINERS entry created
for the new module.

Two minor fixups are also applied: the private accessors are inlined,
and a couple of missing fully qualified types in the macro are fixed.

Acked-by: Yury Norov <ynorov@nvidia.com>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 MAINTAINERS             |   7 +
 rust/kernel/bitfield.rs | 548 ++++++++++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs      |   1 +
 3 files changed, 556 insertions(+)

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
index 000000000000..2498107979dc
--- /dev/null
+++ b/rust/kernel/bitfield.rs
@@ -0,0 +1,548 @@
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
+        #[inline(always)]
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
+        #[inline(always)]
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
+            ::core::result::Result<
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
+            where T: ::core::convert::Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
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

