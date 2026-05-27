Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011020.outbound.protection.outlook.com [40.107.208.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96501403EB7;
	Wed, 27 May 2026 12:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886363; cv=fail; b=sc5QZMO263BTAwp+1EztsHLbLnauk90fFkZX0XBZT/2EbyyK0uxKTTeAFXHhlJbLYe4rTNFRXGFRasznDXs6P7hsNBw1y926T6UAFkcPYCqBOZ0Karb1UmpN5tE/5EcTecetLvNFai5ze+BlfBBLeto3Ndl7KzskNNb3Pnax37E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886363; c=relaxed/simple;
	bh=mMB2ve461seUycEC5kXHuwYoekL87W3s7G6Q1Fzyk28=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=cNYD9J8FctGUoMNeKRWS4EBqidRu3UZ83hZD7jXxGFPgZdSeg45WnzlVYghThbHKMAGdNTWQhjavJ7KJU42mLFolrXXa99Oa3Xw0ww0EYw1DGajqif7LiHMBWY58H5LIIG95C2pFNVou+IKlXN00tzUFY3l+AfndeY6DQUbBxU8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ByBWt+ZQ; arc=fail smtp.client-ip=40.107.208.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ByBWt+ZQ"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n2wQtd0Irqp1n+9wOP1K37vI8wTRhW/2Q0S1Xs+dDi6W9pWjN8ohlU4XAj0eASWLY4iCDT9FswW8rx1aaq9Bz5lBuUTX7r0HOg/Jm5PFJM9J++ReBj2TUv+mk35QRqR+6kId/Gqd2i0lDrVqirfpK2WB1I0KpJ3DeNBBOC68N/e8Ar+MWPJ6RjphVbS0FmAuzkxbfg1NtxKMPvfgLyuzr/ocMjSHZ9nz/wTgX6BdvrsEQy/UMeHke0rP0dTB1Yt/m5jZisHKdmSykabBhoJC+VZXovR+Hs0QRe52MbfSWKeB/+DFF98qxUYDJMBtr5YrE/iGcEduJ5Ec5vD55Ud/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=It7irXMQ5P5EKW3MVIvgslFnt1nfia97y8Rt/q1c7f4=;
 b=PdbpM64BeZImv0WteLtg7fupihHZKtRBLFLPOPkEmE7AM5z7PX+LxCOCaE+HBZPoT2l1vD6lbveJXQfUPtQdW72kHazRsaWRNfatZIUe1Gn3s2j0C64rVfwUNwF/PvepdWvCaLJNQipH+rtT0mdim+rc2M49wEoYWXa86ue17FXp5PUpzgMhjCVa4XOw8jKtpq6RVXlho/8d7IGfizQamEkrqZtoI1DaI91gt98D+ae7bCCWb7t3MH7UnYSpsuo56Pl7qmGcH9XqacIuKuMlLDk0vDJa1jH6WOIZGYgv8AUn2K+BzcdVynFk3xYVuEcEsx6QoQjaekdWAr6iJok8YQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=It7irXMQ5P5EKW3MVIvgslFnt1nfia97y8Rt/q1c7f4=;
 b=ByBWt+ZQ8NV0z9i+sqiqhoClj8Wk+AYhJ0gvPfRtyIHykYb5dhgtDHnkyibNZhYxaRvABYxU17EIy7XMC38NxmQOkbPM2qG/Siy4K6KDKd3xgVbp5kqRkUE/nagXCbgF4gqUD42NlNl8l6ZtLq2+cvJrm/R42qoJrEbU5NkPm9gfwE8Jd7+xhh8Qp6yLtn3fE96womnSq5BswQDP2qus7wovWwQmGBjwfOkROj/DVtt5npIcbRp4Z/K4bT7k52HNe2T3ZP15DZLvbq8DvFl4YjxshbNvkmImMCOALOMtwE8uqe6S3sG3GY0d6f6l6vNXbL22T6yCGTloMmaHWTtGaw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 12:52:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 12:52:35 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 21:52:01 +0900
Subject: [PATCH v4 7/7] rust: bitfield: Add KUnit tests for bitfield
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-bitfield-v4-7-e8821d4efbde@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P301CA0062.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36a::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: a0099583-f649-480e-eef8-08debbeed351
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|11063799006|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	Bp+k0218amEjsH1tOnBZJQ0eojIlXCJiC/wqmdxmUhzdZcOceIJue8D7I+D20cmrJyHn10IfWjXBDM8KzWSLUm01y41DdHjw85ekOzAy8qGKytBiCmu9xswJBoa9K8FKhFoGN/a+QvraQNocMUUSIcWwPh6B+hoOlechv+eFhFATgiZQZX2aXpE1m7FzOPyj0wOpJL5Aw/Oz30uW/6lfrMH8V54siztCbHj8BQa7ftzlHNy5suUzeyFDYoMv6pvnnIQQVaIGLdYPB7PQMviCe7D9ryXAL11EBL0dS9fN5/BjM+oMN9ysqGFzTX+aJEmDgG2ThMykwyqO4EluXSDUMSLoJiYDnUdMOOvXObePxd/awzDpAPcbnq1TP48xWn8IhvtIwvftR0BUkOgRZCJcG6jYu2Ub3XAJ0ZRG6Gb8qsNM5Lfm+YNiJ1KgGsWNu5oN7pd4wvuBjkBHhXyQOqtPHA62zoxxPANB9IJlob4c6P3Hn7lQW3gCTfdnjZeCXDoejHMe4j5xd//9xG7+nmJAHzadcWfwtjD8rif+t0fx0+72jNVsaqbr3JeEizExyBgLoC6v9jtx24npe4KIzQmQStTak3nGbwWc1RMdaPzrO3zkoU+R/p97I2PAh9q+i4yEwUWQ59szWQaXkQo6ccoQAiz66ufjF6xCeEVWbFT1EWGSX3AXF66EDuBkMLlyjIsNKKLznXXCFWPYHO/ZBg4iPoWsP4Cuul538T7OBr9JniU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(11063799006)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZjVQYWpmVUVUZ1ZwMjlNbllXaHRlS093NG16dU84REFmbGhnVGVibytQYkth?=
 =?utf-8?B?TkQzempod3BIeUsvOUpjeWR1bVdkemU0TzNxT0xJa2VwREpTR25pUXp6dnBz?=
 =?utf-8?B?ZzdpV0hESmYyNkkyZnY0NG1RNzR3WWtEYituRk9NZE1KbFRIN1JkcGFMYlEv?=
 =?utf-8?B?Mzc3SU9CdHoya3Z2bXU0SGwra0k1U0lqNVJoZEpkTXhocERTYXBJZ0xlQXhp?=
 =?utf-8?B?RTJRbzJPM1hibFRLdVVxNjRNWnBCeEtybGxHU1dra25Rc3lBV2tNRXpEbWxK?=
 =?utf-8?B?Zk15dWRrYzBzdFduWTluSmc4ZWpPdEZxd2tnUStMdENZQU8yUHJLb2kxWGdJ?=
 =?utf-8?B?ejhXWVpKT0FTemFUWU5Hem01cVZmWm5NUG1XQnBGVC8vUXBsQTAvS01BdG45?=
 =?utf-8?B?MTY3dU5XUTR0RExEL0kxc2ZjRGZ0MmphcFRHc2tuVFpJL1dsT1NaczNpS1JG?=
 =?utf-8?B?TjBPSmtTcExONy9JVkxXNS9EOWd0c1hwaWtSTGwvUS8rT1dla2llY3kvNHBy?=
 =?utf-8?B?ZktBd3huT3VHQTEwTzZ4NU9WRjdRbEltcDNnQVl4QWRsQSt4OThXM2FUVEx1?=
 =?utf-8?B?NnloMFQySlNJUDM4cHB3Z2tpU3NFVThZRFdHWUg0NFprTzFvRXk5Tm0wZDZ4?=
 =?utf-8?B?TDV0WFRRWmJhdmwzanN1VXQ5TXpWTDMyRlNoUTRRUDlFVHNISTE5REliWEtJ?=
 =?utf-8?B?a3JSOGZKenpiS2xWLzZwOG1MY0VhWnNlVFlKTnlXWi9YZGJDMXIxNm5FbGY2?=
 =?utf-8?B?SEkvdTFQUzBvamN4QVBZaVE4bEg5NWQxcXFxNTZ4TktjTzlsYXh2MXNWb1cw?=
 =?utf-8?B?R1JGK0dIWnNEWUZJT3pFR0h0TzJ4TThZaktFUkVwMDlFR21CUTFlS2VobXFX?=
 =?utf-8?B?WHg4Z1VJRmxnMnQyN0VSWWFWaFBjeUcwMmh2Y0gzcmdlZmVrLytSYlBIRFJq?=
 =?utf-8?B?eDN2L1A1MlkvSjh0SWFkREVGQWRnK210Mko0UzhXYjArYW1XVzFDTVJzcnd2?=
 =?utf-8?B?THhoZG9uaWZTREZmMVY3cjU0bzdjWHVEVU1JUEcySm95ejNtaXlCWlFlZEJa?=
 =?utf-8?B?YkxwWHFjdzNhL2JMVkpjL3lCbjJ5UGtmQzVjbEFkUVhrUzhkdlVBSXU5Qi8x?=
 =?utf-8?B?MTg0eXlDanpjalhINDNhdlhqR3RFMmNGMzZEVWdBVEc4TWhYelZWNTR6OXg1?=
 =?utf-8?B?eC8ybHlzV0VodzRzVUdoSWxTRWQ3MjdsaHhSSjVSaDBLTG5WTER5QklvM3Jw?=
 =?utf-8?B?Y0NQQmF4WmpWamVNcm5mOUhMYkhnaGhTWDNxY3BlMUdOcHNWK1J5UkV4YTFN?=
 =?utf-8?B?M2U2QXB3ZHNDNVBUY0xBTk82VDAwY0I5R3lTY3d4ZHppSmJRTGFENkRYLzVn?=
 =?utf-8?B?aStkWGs2cFlwdGNIdlJ3R1ZRY2IwNVdBSlBYc2JlUmpxOEhsVlJzcEJtVkc0?=
 =?utf-8?B?WVJNdnMyU3ZvUzZLQXdsMTFZQ0RubFZrbUMvRDhScUdBSWM5eldQUXU1eXJt?=
 =?utf-8?B?VFpVY25HeVFuWTUrM1gzYWdobmFwanRacFNVTDBrWFg3T3EydXNCRUEyQUpx?=
 =?utf-8?B?ejk2bk1jSWltKzgrd1hmQUEyVUg5ZFRMQUdWQXQrbkFCaGZEQUdRTktFeGhG?=
 =?utf-8?B?NlpBQ2xIclVSSjIvdXFJSWJDanF5VzhCU2NDdVkreXp4a3l0aVlPaDQwOWRY?=
 =?utf-8?B?VUNzeFhYQWN0SmFUNkxYckNpcDhISUlBL093L1Z4ZVZPSFFrbEpac042QlRj?=
 =?utf-8?B?dXNaaXZmcUpsaitzck1kc3hsMzh2aXhmOVRqUXZVVWJyZkUyeXdORzgzQXZC?=
 =?utf-8?B?TXZ0VWQycm1lRGlHREt5Q0VHZG5DSWwwbElWNEVzQ3NKMElXTFRqWkg2VFY5?=
 =?utf-8?B?dDY1Ri9EbW1aRmg3a25QT2cyTjVNZ1dVSTBpNldpOEthU3BIYzVQRERTMElS?=
 =?utf-8?B?cWE0NWZDeTYxUWYzbGphU3E5ZzVqaERBWDBmbzRZWU1qdFNFcGszUXNwTkRu?=
 =?utf-8?B?ODZJdlNwc1ZJL3RPQUxGdWJ3Y3c1ZTFBaTRGdDdsSXdna3djQVUzOWNhaHl4?=
 =?utf-8?B?N25vTHFFSjZvQ29pdVNSY21VbGl3dlR5cnJhdHdlcGxyN2llUk1MbE5hd0VP?=
 =?utf-8?B?WDN1bVRObmpHVFE5TjdOVXBsd2N5bW1ZVWV2OG5sRXVrV1o0SUljUEN4aHUv?=
 =?utf-8?B?V1NoOU9oTkxmZEJ5QU52clhQWm0vaks3S3hjVTY1VmFPMVlEUW9KWW1UekFw?=
 =?utf-8?B?c3NPZTFOZWxJVkFUK3ZjV0o2c0FINWlGVDhaZXhFem14ZTNLdy9haTZ3RFFM?=
 =?utf-8?B?eG1iNmx2R1pNcnNqZ0FEa2swdkRqTFpmeXlXdERLeUtJOSs5Ukd3UWx0WUMr?=
 =?utf-8?Q?XpEEenRTeGJiO5xpemkjtew11KZ21M6UiSIxa25G3mNbg?=
X-MS-Exchange-AntiSpam-MessageData-1: M7ha2k/91CRiug==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a0099583-f649-480e-eef8-08debbeed351
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:52:35.7588
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ae/Fr6cR1uH5LRsiGfb9FfeN0rsvSHFEbtcHO2a013xyGTGHqI5jZiPKxBI6mEEmVqLmc3pGK3RUg845M4GAYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841

From: Joel Fernandes <joelagnelf@nvidia.com>

Add KUNIT tests to make sure the macro is working correctly. The unit
tests are put behind the new `RUST_BITFIELD_KUNIT_TEST` Kconfig option.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 rust/kernel/Kconfig.test |  10 ++
 rust/kernel/bitfield.rs  | 315 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 325 insertions(+)

diff --git a/rust/kernel/Kconfig.test b/rust/kernel/Kconfig.test
index fc47614e6ec9..4fc6dc978101 100644
--- a/rust/kernel/Kconfig.test
+++ b/rust/kernel/Kconfig.test
@@ -73,4 +73,14 @@ config RUST_ATOMICS_KUNIT_TEST
 
 	  If unsure, say N.
 
+config RUST_BITFIELD_KUNIT_TEST
+	bool "KUnit tests for the Rust `bitfield!` macro" if !KUNIT_ALL_TESTS
+	default KUNIT_ALL_TESTS
+	help
+	  This option enables KUnit tests for the Rust `bitfield!` macro.
+	  These are only for development and testing, not for regular
+	  kernel use cases.
+
+	  If unsure, say N.
+
 endif
diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 2498107979dc..4720cdd23c74 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -546,3 +546,318 @@ fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
         }
     };
 }
+
+#[cfg(CONFIG_RUST_BITFIELD_KUNIT_TEST)]
+#[::kernel::macros::kunit_tests(kernel_bitfield)]
+mod tests {
+    use core::convert::TryFrom;
+
+    use pin_init::Zeroable;
+
+    use kernel::num::Bounded;
+
+    // Enum types for testing => and ?=> conversions
+    #[derive(Debug, Clone, Copy, PartialEq)]
+    enum MemoryType {
+        Unmapped = 0,
+        Normal = 1,
+        Device = 2,
+        Reserved = 3,
+    }
+
+    impl TryFrom<Bounded<u64, 4>> for MemoryType {
+        type Error = u64;
+        fn try_from(value: Bounded<u64, 4>) -> Result<Self, Self::Error> {
+            match value.get() {
+                0 => Ok(MemoryType::Unmapped),
+                1 => Ok(MemoryType::Normal),
+                2 => Ok(MemoryType::Device),
+                3 => Ok(MemoryType::Reserved),
+                _ => Err(value.get()),
+            }
+        }
+    }
+
+    impl From<MemoryType> for Bounded<u64, 4> {
+        fn from(mt: MemoryType) -> Bounded<u64, 4> {
+            Bounded::from_expr(mt as u64)
+        }
+    }
+
+    #[derive(Debug, Clone, Copy, PartialEq)]
+    enum Priority {
+        Low = 0,
+        Medium = 1,
+        High = 2,
+        Critical = 3,
+    }
+
+    impl From<Bounded<u16, 2>> for Priority {
+        fn from(value: Bounded<u16, 2>) -> Self {
+            match value & 0x3 {
+                0 => Priority::Low,
+                1 => Priority::Medium,
+                2 => Priority::High,
+                _ => Priority::Critical,
+            }
+        }
+    }
+
+    impl From<Priority> for Bounded<u16, 2> {
+        fn from(p: Priority) -> Bounded<u16, 2> {
+            Bounded::from_expr(p as u16)
+        }
+    }
+
+    bitfield! {
+        struct TestPageTableEntry(u64) {
+            61:52     available2;
+            51:16     pfn;
+            15:12     mem_type ?=> MemoryType;
+            11:9      available;
+            1:1       writable;
+            0:0       present;
+        }
+    }
+
+    bitfield! {
+        struct TestControlRegister(u16) {
+            15:8      channel;
+            7:4       priority_nibble;
+            5:4       priority => Priority;
+            3:1       mode;
+            0:0       enable;
+        }
+    }
+
+    bitfield! {
+        struct TestStatusRegister(u8) {
+            7:0       full_byte;  // For entire register
+            7:4       reserved;
+            3:2       state;
+            1:1       error;
+            0:0       ready;
+        }
+    }
+
+    #[test]
+    fn test_single_bits() {
+        let mut pte = TestPageTableEntry::zeroed();
+
+        assert!(!pte.present().into_bool());
+        assert!(!pte.writable().into_bool());
+        assert_eq!(u64::from(pte), 0x0);
+
+        pte = pte.with_present(true);
+        assert!(pte.present().into_bool());
+        assert_eq!(u64::from(pte), 0x1);
+
+        pte = pte.with_writable(true);
+        assert!(pte.writable().into_bool());
+        assert_eq!(u64::from(pte), 0x3);
+
+        pte = pte.with_writable(false);
+        assert!(!pte.writable().into_bool());
+        assert_eq!(u64::from(pte), 0x1);
+
+        assert_eq!(pte.available(), 0);
+        pte = pte.with_const_available::<0x5>();
+        assert_eq!(pte.available(), 0x5);
+        assert_eq!(u64::from(pte), 0xA01);
+    }
+
+    #[test]
+    fn test_range_fields() {
+        let mut pte = TestPageTableEntry::zeroed();
+        assert_eq!(u64::from(pte), 0x0);
+
+        pte = pte.with_const_pfn::<0x123456>();
+        assert_eq!(pte.pfn(), 0x123456);
+        assert_eq!(u64::from(pte), 0x1234560000);
+
+        pte = pte.with_const_available::<0x7>();
+        assert_eq!(pte.available(), 0x7);
+        assert_eq!(u64::from(pte), 0x1234560E00);
+
+        pte = pte.with_const_available2::<0x3FF>();
+        assert_eq!(pte.available2(), 0x3FF);
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_0E00u64);
+
+        // Test TryFrom with ?=> for MemoryType
+        pte = pte.with_mem_type(MemoryType::Device);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Device));
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_2E00u64);
+
+        pte = pte.with_mem_type(MemoryType::Normal);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Normal));
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_1E00u64);
+
+        // Test all valid values for mem_type
+        pte = pte.with_mem_type(MemoryType::Reserved);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_3E00u64);
+
+        // Test failure case using mem_type field which has 4 bits (0-15)
+        // MemoryType only handles 0-3, so values 4-15 should return Err
+        let mut raw = pte.into_raw();
+        // Set bits 15:12 to 7 (invalid for MemoryType)
+        raw = (raw & !::kernel::bits::genmask_u64(12..=15)) | (0x7 << 12);
+        let invalid_pte = TestPageTableEntry::from_raw(raw);
+        // Should return Err with the invalid value
+        assert_eq!(invalid_pte.mem_type(), Err(0x7));
+
+        // Test a valid value after testing invalid to ensure both cases work
+        // Set bits 15:12 to 2 (valid: Device)
+        raw = (raw & !::kernel::bits::genmask_u64(12..=15)) | (0x2 << 12);
+        let valid_pte = TestPageTableEntry::from_raw(raw);
+        assert_eq!(valid_pte.mem_type(), Ok(MemoryType::Device));
+
+        const MAX_PFN: u64 = ::kernel::bits::genmask_u64(0..=35);
+        pte = pte.with_const_pfn::<{ MAX_PFN }>();
+        assert_eq!(pte.pfn(), MAX_PFN);
+    }
+
+    #[test]
+    fn test_builder_pattern() {
+        let pte = TestPageTableEntry::zeroed()
+            .with_present(true)
+            .with_writable(true)
+            .with_const_available::<0x7>()
+            .with_const_pfn::<0xABCDEF>()
+            .with_mem_type(MemoryType::Reserved)
+            .with_const_available2::<0x3FF>();
+
+        assert!(pte.present().into_bool());
+        assert!(pte.writable().into_bool());
+        assert_eq!(pte.available(), 0x7);
+        assert_eq!(pte.pfn(), 0xABCDEF);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(pte.available2(), 0x3FF);
+    }
+
+    #[test]
+    fn test_raw_operations() {
+        let raw_value = 0x3FF0000031233E03u64;
+
+        let pte = TestPageTableEntry::from_raw(raw_value);
+        assert_eq!(u64::from(pte), raw_value);
+
+        assert!(pte.present().into_bool());
+        assert!(pte.writable().into_bool());
+        assert_eq!(pte.available(), 0x7);
+        assert_eq!(pte.pfn(), 0x3123);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(pte.available2(), 0x3FF);
+    }
+
+    #[test]
+    fn test_u16_bitfield() {
+        let mut ctrl = TestControlRegister::zeroed();
+
+        assert!(!ctrl.enable().into_bool());
+        assert_eq!(ctrl.mode(), 0);
+        assert_eq!(ctrl.priority(), Priority::Low);
+        assert_eq!(ctrl.priority_nibble(), 0);
+        assert_eq!(ctrl.channel(), 0);
+
+        ctrl = ctrl.with_enable(true);
+        assert!(ctrl.enable().into_bool());
+
+        ctrl = ctrl.with_const_mode::<0x5>();
+        assert_eq!(ctrl.mode(), 0x5);
+
+        // Test From conversion with =>
+        ctrl = ctrl.with_priority(Priority::High);
+        assert_eq!(ctrl.priority(), Priority::High);
+        assert_eq!(ctrl.priority_nibble(), 0x2); // High = 2 in bits 5:4
+
+        ctrl = ctrl.with_channel(0xAB);
+        assert_eq!(ctrl.channel(), 0xAB);
+
+        // Test overlapping fields
+        ctrl = ctrl.with_const_priority_nibble::<0xF>();
+        assert_eq!(ctrl.priority_nibble(), 0xF);
+        assert_eq!(ctrl.priority(), Priority::Critical); // bits 5:4 = 0x3
+
+        let ctrl2 = TestControlRegister::zeroed()
+            .with_enable(true)
+            .with_const_mode::<0x3>()
+            .with_priority(Priority::Medium)
+            .with_channel(0x42);
+
+        assert!(ctrl2.enable().into_bool());
+        assert_eq!(ctrl2.mode(), 0x3);
+        assert_eq!(ctrl2.priority(), Priority::Medium);
+        assert_eq!(ctrl2.channel(), 0x42);
+
+        let raw_value: u16 = 0x4217;
+        let ctrl3 = TestControlRegister::from_raw(raw_value);
+        assert_eq!(u16::from(ctrl3), raw_value);
+        assert!(ctrl3.enable().into_bool());
+        assert_eq!(ctrl3.priority(), Priority::Medium);
+        assert_eq!(ctrl3.priority_nibble(), 0x1);
+        assert_eq!(ctrl3.channel(), 0x42);
+    }
+
+    #[test]
+    fn test_u8_bitfield() {
+        let mut status = TestStatusRegister::zeroed();
+
+        assert!(!status.ready().into_bool());
+        assert!(!status.error().into_bool());
+        assert_eq!(status.state(), 0);
+        assert_eq!(status.reserved(), 0);
+        assert_eq!(status.full_byte(), 0);
+
+        status = status.with_ready(true);
+        assert!(status.ready().into_bool());
+        assert_eq!(status.full_byte(), 0x01);
+
+        status = status.with_error(true);
+        assert!(status.error().into_bool());
+        assert_eq!(status.full_byte(), 0x03);
+
+        status = status.with_const_state::<0x3>();
+        assert_eq!(status.state(), 0x3);
+        assert_eq!(status.full_byte(), 0x0F);
+
+        status = status.with_const_reserved::<0xA>();
+        assert_eq!(status.reserved(), 0xA);
+        assert_eq!(status.full_byte(), 0xAF);
+
+        // Test overlapping field
+        status = status.with_full_byte(0x55);
+        assert_eq!(status.full_byte(), 0x55);
+        assert!(status.ready().into_bool());
+        assert!(!status.error().into_bool());
+        assert_eq!(status.state(), 0x1);
+        assert_eq!(status.reserved(), 0x5);
+
+        let status2 = TestStatusRegister::zeroed()
+            .with_ready(true)
+            .with_const_state::<0x2>()
+            .with_const_reserved::<0x5>();
+
+        assert!(status2.ready().into_bool());
+        assert!(!status2.error().into_bool());
+        assert_eq!(status2.state(), 0x2);
+        assert_eq!(status2.reserved(), 0x5);
+        assert_eq!(status2.full_byte(), 0x59);
+
+        let raw_value: u8 = 0x59;
+        let status3 = TestStatusRegister::from_raw(raw_value);
+        assert_eq!(u8::from(status3), raw_value);
+        assert!(status3.ready().into_bool());
+        assert!(!status3.error().into_bool());
+        assert_eq!(status3.state(), 0x2);
+        assert_eq!(status3.reserved(), 0x5);
+        assert_eq!(status3.full_byte(), 0x59);
+
+        let status4 = TestStatusRegister::from_raw(0xFF);
+        assert!(status4.ready().into_bool());
+        assert!(status4.error().into_bool());
+        assert_eq!(status4.state(), 0x3);
+        assert_eq!(status4.reserved(), 0xF);
+        assert_eq!(status4.full_byte(), 0xFF);
+    }
+}

-- 
2.54.0

