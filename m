Received: from CWXP265CU009.outbound.protection.outlook.com (mail-ukwestazon11021107.outbound.protection.outlook.com [52.101.100.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0877389473
	for <driver-core@lists.linux.dev>; Wed, 15 Apr 2026 19:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.100.107
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776283096; cv=fail; b=dmbNq5BAVFiB10n6xCuTMIrG2HpCqW+cF3FoTQmS2DJcVzdf2UgXmLi+BQbFAAFsE/8wcEhqMrLFtHl2kZa2VrvdOGJOmUL5ylaIpT9c4UDMAJ//tHIuthbPxaYQMkUzKcUqMOa7eIgvk+vSr/X2AXTlwhTNQzZk5/r7+U0Tkkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776283096; c=relaxed/simple;
	bh=4JZCp1592Qq/DiPLJXMDfuB2mMJRE26vhtXa21LF+1c=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=lAoPZ3iIOM1gGaPsIGaLa/UdctvuKNwIFc7yIoQeTTA4e2uw3jl07VuqUQHP2gHGq950cVP++NMCVgganzcJ1ollKkEqNPMMHYxI/MGpWSzBhZkMjwxPPaZZ7yopXMqOaxPwnQQtsX1YcYuPmROL8HE4esNjr30calwsAgipWc4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=O9y54B2U; arc=fail smtp.client-ip=52.101.100.107
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="O9y54B2U"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TvGLHvKBrVubAlhPuZvVckzdVEweeaayOXs44q0M6+Xi9fwyZ01WXdXAgqVp0tohT+iOcDW4PW4i8rd9nFbdBXSXkq1eKI8uayXan8PheZJJYtvWEEnIGcEf2EuJlI0xCZB5pl41z9mz+FYpJPrGXOVD7aZUhwz/QeZbzdkZCH2lIkpRoe99TdsPnAF97IYK8b0F9EqDSKP5Ci8zeXFKSg6KI14y9mnA04W8pOFz9LnINN+QlU5HuwTjaqTO+a80AzFJQguvSUqUfyaKrH0gSGlEGNw+jJSXuUCjPXLRtHNcgKIYvlFH8q3KCAtf18RIPRTwMPA66jBisbONmECk4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ND5nT6dl5gY9UacBk8WnuBoSBpJecjX7BcNWJzj0mig=;
 b=jtgWp4S1ti/iyNiJos8hX7UNNDNexsr3P8JG6j0CZyQgR+Hka0C6BYPynkeicVujy7YM2hHAkwMKqkmqH7gK02KdrZP9j9M5EbtxkW5ZAES6azlTKvmMaI9VcRY0scJN9304nmAeyxUhAudFuH5Lg6qrXHhHJzWeJwi9GgojQjrKhCA1c0PN3McfcXsSfpsgjPdguadFyypJpunv0gAiXL4J7O7iMa1n2IuzyaX9EokhRvBdXx4MZmOzSkpXqgudkTys9DU7h4ppcaeX/Ny/3L/Au/zKmDnU7Jvx4927kcLPe82BCoYeo3zh9xLlJoffaijqIL7jypKmYbMJ7O+A3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ND5nT6dl5gY9UacBk8WnuBoSBpJecjX7BcNWJzj0mig=;
 b=O9y54B2U88/bFklMbjrwdjZ62IRQnFhbhOcag6OD8idlOEMFRAtJCioyepxZeWfwMOBvsWKKKV7klotwztssDE1k5+8D6XfooMRSDzB+hNfPkOQKF5q27YHRYnSw5MsFMgKvzaL2QW8cHZ4ebZZXjQ9euYQxZkKQixBxt5YP2oY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1910.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:32::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9769.48; Wed, 15 Apr
 2026 19:58:07 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%4]) with mapi id 15.20.9769.046; Wed, 15 Apr 2026
 19:58:07 +0000
From: Gary Guo <gary@garyguo.net>
Date: Wed, 15 Apr 2026 20:57:16 +0100
Subject: [PATCH 5/5] rust: ptr: remove implicit index projection syntax
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260415-projection-syntax-rework-v1-5-450723cb3727@garyguo.net>
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
In-Reply-To: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
To: Danilo Krummrich <dakr@kernel.org>, 
 Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Gary Guo <gary@garyguo.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776283085; l=1883;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=4JZCp1592Qq/DiPLJXMDfuB2mMJRE26vhtXa21LF+1c=;
 b=r4ROZkN/1djeNpdSK2EVhgcDyWIqbMySzhYpGGECK3qOrUdLICA+WyaTFG4QRSkN7L16BpwYN
 X8D/8wLliUoDNzekoyCTBQGfpNBkJQq4X69T9PXaLl0IbAPy7HenjmB
X-Developer-Key: i=gary@garyguo.net; a=ed25519;
 pk=vB3uIX95SM4eVrIqo1DWNWKDKD2xzB+yLLLr0yOPYMo=
X-ClientProxiedBy: LO4P123CA0276.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::11) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1910:EE_
X-MS-Office365-Filtering-Correlation-Id: 128b75cf-1fdf-44f9-091e-08de9b295061
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|1800799024|366016|7416014|376014|22082099003|921020|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	xKq/qmER+jlhJGMCh6OS6w6k+PlCS6lKKibBvyqcviXOWl6Hy1rtQ1IpFZYc9isD9B33Xow8ncwKRgA8/AGjzcARMw8+qdSe/FPPljq0iFxmVYP0immoZV16gLeeC0SnC1FJj9uITK5GNmrAPcMV6sc7mUvIMv48srloT9/CbWq3d8noNkGrxcv6JuLW+Yq30+/7ARvSr29AKG/Ua6jHTx7wJTvHJrdZV+Aa9klm41t0b95c024lva//B+8vsdNXZ6d+k66RfX5bA/kLmxJj9pxqhv8M+OQc92Z26kutuMTIZ9ZNrKb5zeGHlNynHFMNR+gGEslByA3iGjCGhgKg1/ReRZ2BwHFWeUSp1pR2/goJRNholE7F19EauvqmimDRcaY2XBPqYGDnkr24h73HP1zMYDW/GrYmvVbe8NKTwUAPejOOC3aG+UbjbQW86YBM6IZeTVMPLqjuhEM5lCJUvn+RT1oTbhb2vSKpdjxcXbw9A2hq5J3JGkirTey10CJDfNe3Dj1EaQY+pl58V/A9wh3YslMe2BbTR6ToUNF0wmhG0gn1ax5n/0N8i/Riol9YeWz+iGgjf03CMFHFY5pFj8b3H0C5ea1nhRZBPi3mDpER2i7QoGu3FdW2TXbM0pUUWEPp9wHliAcHYE+/5zf1Z3yawsk+ePcqfcHBykNc7s0dYIYgBPfxA0VuwKTm+fua6v2Sl4sryh4QZtSWaw4NoC10jxfU3oBdbzr3zNllXG+/2oOZnlGI9lzRD79XOioJn2gSnztAAvqVcF8afwTZkg==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(1800799024)(366016)(7416014)(376014)(22082099003)(921020)(56012099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzcwNll0R2w4WTB6bjlta2t5TWtFZ0YySFlPbjVEVzZ1TU9TOU8vM0dnNGgw?=
 =?utf-8?B?WnNmQ3l4eVZLNmZ4VERiSTdua0FUaWY4YWVlT1dlcjVEdTJ0QW5CUFpOQWJB?=
 =?utf-8?B?blFRTEgvVG9WbFBTcUFSTHJHZ25LNE02bXFFYnM0UC9SSzVsSzZ4QjB0b2NL?=
 =?utf-8?B?TnYxUlVOU3hSMmdadzNGUFNLSndWd2NaOHlZS3dIOFlteVZicjFTb2htaHlS?=
 =?utf-8?B?dkdFM3BsUGVKbTNsMkg5SUpVaUVFcVZTVkV0RVh6Mmc1T2l6THZ2YXI2LzUy?=
 =?utf-8?B?Umg0aityZk9US0diT01jYURuVEkwTE1YdlV4aVNrR0pXVmxZVCtRS0xvZzJX?=
 =?utf-8?B?eC9ma0I4U295eG5naitXNG5oYXBpUTQvSUVVZHRlRThGK293aGxwWjJQZGFC?=
 =?utf-8?B?S1l4NS8wOURtYW1IMGNrSVg1WjZ4aXRyZnpBenhaQWdYamNMUlpXS0QrTmYy?=
 =?utf-8?B?Y2FlNmYxNnR6cUtsNktFQkF0SWdTYlRqTnQ0L1VVbUJWM1c2Ui9aaGRKb3hY?=
 =?utf-8?B?TFQ2dHJ4ZzB1cjlmdTdnUVB3M0R0cHRUcjkzcnBYNmJ1M0FjOWNoT1ZqTUFT?=
 =?utf-8?B?N01hVFVLMFBXZHZEZjJteXBnbTVKWHdkQmcra2RCNXpKSzlaUXhJVjJDUlJt?=
 =?utf-8?B?NTdNUUdSdHpQMWRvWk1mOHQ4dGs0WUhmbmc0ZkFidEpRbEhxRFNTdHJQUWta?=
 =?utf-8?B?U1FaWHNHQWtqVjJhMWY5V0VsQnI1WFgwaXF1OElONXVEbUFDK0xWWkZCYllp?=
 =?utf-8?B?STZLV3cvcnFORmRCV0dUMnY0dVV0M1pySE1ZZVJCeWltejVMYTJkVzgwSUVL?=
 =?utf-8?B?S21VUCthbEl6c2YvYkRJV09lQ2JaaUxuQ21qdmdUTUFuYndyYlYwZ2dZZDY1?=
 =?utf-8?B?UFNGclM5MitqMEp4bEx2WEdpcUFJMEtSS2dzb0ZnYlBLN25EQTRibWpiaU9i?=
 =?utf-8?B?Y2dHRkZKZjUyVHRPR3JySTVuRENUanpLNHYwNTk3ZitWQXRkQnZNYTArWndu?=
 =?utf-8?B?NUhIMWlQWmFVK0xNNWhGd2tkMmFhYmhzTnV6WFZDR0M3L052QlFoQnJGQ1Q2?=
 =?utf-8?B?anlCRHFIRUlaZlozSXJ0Q1pBMGh1VExmVmxvV0VhNVhvRGlDeE1wTHRrTVFr?=
 =?utf-8?B?RFJWblF2T1dhclE1MENjdWx0UWVTN0FZVUFHK29sYTB0K1F3dHMxbitiOXRI?=
 =?utf-8?B?T0VtTTZPZ2UzbFhRMkJCSkE4WWRHYjA2a3lhYi9iUXRZVElZN1BmaGlVa1RE?=
 =?utf-8?B?TDdmQXNhMGhwQy9GYmxtb3dxV1NscVcrV2ZlV2drYjQrdUtNekpMelJFNUJI?=
 =?utf-8?B?b2ZHbFMrdmZzM2RFeFllekoyTWFuLzNtdmEvMSt0OVdkNCt1TTBaMTdmWXRp?=
 =?utf-8?B?UHludUtBTEpxRlJOaTJZYlpMbFA2SDlsVDNBdXFxN0ZiaXkwMTBSWnhvYmJB?=
 =?utf-8?B?ZXB2QnR1VUpqM3NuSnRUaEI4VGFlTk1TUmdtSDBORU5DWTZBcFZyYTFVWG5O?=
 =?utf-8?B?VTIvb1UrcW9QTjNmbEhocGtsY05maXpaWmJwOGhjdG1aK3dYc0ozZ3d2SDVa?=
 =?utf-8?B?N2N0MW1oNHhtcytTeHk1TS9xWFI2d0g1cFU1clZlMTgwelRQSndCc1hVVTlN?=
 =?utf-8?B?RjRSRTBhL0hXVDdVM0pwblM5ZXBRSmdoaWEyNVpmNFF2aXlGeHlpa09Gb081?=
 =?utf-8?B?emQ5TkxaNG5pbEZOMjVCZCtSb1pEQmlZd1gxMy82Y3dtODhQK2RtcmJLZHlW?=
 =?utf-8?B?VkJld0trWWZ1ZTIwYlI4WEdMd0dVeVMxa0tRZWp1WW1WTW5zeFBGSm84c1JV?=
 =?utf-8?B?Zm1XbFFYbGh2S0l4d1g3SHhOU1JiMlBlcktKQUx3TEQ3M0xRWXo4REIwa3NK?=
 =?utf-8?B?VUhjYzUvb1NOQ1N4aU9RaHlpUXJJaE03aWRqZlJlU2V3enBVUUZpc2Joc2RN?=
 =?utf-8?B?WmlYWmNlbUdxZUdJVFdTSFNnc2pFSXVFNUduUjM4blJTcjYzOUxXcnViTHkr?=
 =?utf-8?B?TUVPVnVvU1ZkdytTdDIrbEVobkdvMXBjL3VPSlE5MzZweEJ2cXI3Z3VzTUdv?=
 =?utf-8?B?Zk9vV1hMKzFjaUducmsydnBvYTZ1M0ZqcDJ5RjdlYkRBelVCcUpYcWUxeDht?=
 =?utf-8?B?WHlKbzJtbVpLWWQ3MlJQOTNEYWFUTnhyeXVlaUhaNG1wWmZLN0ZZZ2daTkwr?=
 =?utf-8?B?Nkl5NWhOaUYvZkhIVW11SU5pYjVzcUJzaXhPMmxZdFpuTFJHcWU1QzM3R3A5?=
 =?utf-8?B?OE56T0ZvM2ZScHFONjBaQXl6VjJQWml0cmcrSFBCZDI5RjFkN1phaVViWExF?=
 =?utf-8?B?cWEzY0lyQnpHeEg3Wjd2UkR1dzBaRDZiQ21UUGR3Q08zblc2T29iZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 128b75cf-1fdf-44f9-091e-08de9b295061
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2026 19:58:07.8343
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: khPydXBXGRD86edbYbqHoKnpaQSu0/2luhBKzlylMO5GeUxWmOJXGcFi9CLVGyp8izGdLdGYd5kdFoNwksUkGw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1910

All users have been converted to use keyworded index projection syntax to
explicitly state their intention when doing index projection.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/dma.rs            | 6 ------
 rust/kernel/ptr/projection.rs | 8 --------
 2 files changed, 14 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index d6382904a90d..642ccff465c8 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -1210,12 +1210,6 @@ macro_rules! dma_write {
     (@parse [$dma:expr] [$($proj:tt)*] [[$flavor:ident: $index:expr] $($rest:tt)*]) => {
         $crate::dma_write!(@parse [$dma] [$($proj)* [$flavor: $index]] [$($rest)*])
     };
-    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr]? $($rest:tt)*]) => {
-        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]?] [$($rest)*])
-    };
-    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr] $($rest:tt)*]) => {
-        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]] [$($rest)*])
-    };
     ($dma:expr, $($rest:tt)*) => {
         $crate::dma_write!(@parse [$dma] [] [$($rest)*])
     };
diff --git a/rust/kernel/ptr/projection.rs b/rust/kernel/ptr/projection.rs
index 845811795393..fde565c836fc 100644
--- a/rust/kernel/ptr/projection.rs
+++ b/rust/kernel/ptr/projection.rs
@@ -346,14 +346,6 @@ macro_rules! project_pointer {
         $crate::ptr::project!(@gen $ptr, $($rest)*)
     };
 
-    // For compatibility
-    (@gen $ptr:ident, [$index:expr]? $($rest:tt)*) => {
-        $crate::ptr::project!(@gen $ptr, [try: $index] $($rest)*)
-    };
-    (@gen $ptr:ident, [$index:expr] $($rest:tt)*) => {
-        $crate::ptr::project!(@gen $ptr, [build: $index] $($rest)*)
-    };
-
     (mut $ptr:expr, $($proj:tt)*) => {{
         let ptr: *mut _ = $ptr;
         $crate::ptr::project!(@gen ptr, $($proj)*);

-- 
2.51.2

