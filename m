Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010065.outbound.protection.outlook.com [52.101.85.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E764322FF22;
	Sat,  6 Jun 2026 12:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780749811; cv=fail; b=DY7Rjr43GOZImln3OqGhIbapgTDWAPG4WYgcGvpLBbXB13ohh9ipFoEhScLhDTkwc4Z72OXs/s8pLTUu3Hb7I/gNibkbJQS2PlmV61ObBNJEr3qNHP5px9BEtoaSflbR/cwwbyClWaSkJxyxkhYSwWSzYWx0Y/iKTwgXKwiFpog=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780749811; c=relaxed/simple;
	bh=/B5dPsLNsNBDyYI9rPH2hWACa18Y1eQRhIzpZ/K+E4Y=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=CtAZedov5+N2ffx7vu2CC3s44a/vZYV302MEYZbx4B9Y2S/cR8Vid2gQLf8jU0ndYYiQ6pmD88YZhZN5u5G6TWRnYsj5Pl3GL0idCAxLpSrt6Bnnwz5MAnpxO7YR0fGIMnTP8RCx1EJUS0vgpv/woXYakyfxCfaSVTjRkCpqMgg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rc54VWbM; arc=fail smtp.client-ip=52.101.85.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rc54VWbM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qMGIlO4vgwOBqY0F16DNpzl5nWukMX7INVY2SCPLQAlxDjhnBEJ54Vgk2sM9GXdc840yQ9VXaxdqaqu+XaeufSAQ+ZZb/s97VirJrw+AS5S2BhPU62U8M6797RV4fTNN0BHCIOxx/ysIXyKrYiIw+eg349vb9b5irCMBbog+qaPcm8fCTArtGplwnTSNvtAWmubfTwYD9zEKb66YX1eWTwgYxMQqgJbJO3iSVhYNggwyV7ib8+mkzgrMzOIu92KcMiNeg0xrw5YUmzWyPLs9k13/xQqjw2b7ZBHfstgax9GCUqCEiXyVGjrYvVF3ix3/pnlby6OMZnX04asERwIdRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xsGpwbjo0lscqhknCCCN37hsjfVFAXBIc8Qii3NckEM=;
 b=DMRWP24/LrGReEQ86QaruDEI8Ux+aFWNaZ908PCdgDmjaQsEZUpK5mNDPlas34dZYZxZ5MX3DDq9trR8BbYfIW+OJ7C48UqANXu1NBcF/2rKtHaCAd2WcPLTHCYRMBoi0+14bORBmLOvxxoCNUqmhZA20JbFedYt7varA6O459/8fvRy45fJkh6nNNI8ZVkax2wwWM+YWrxDoF8nOU5h0juxaITeURSoTxW0++M6y1v0Sj6tI2U1jkKJoZNZAMxB4tEStdCcD8f51lJc/JrdyZax8Aiz11gZrrcgJLHwZoYqY0qnOab/5kJzbCx2dlZoQ8K5uu5cjn3vcW8T/ic/fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xsGpwbjo0lscqhknCCCN37hsjfVFAXBIc8Qii3NckEM=;
 b=rc54VWbMrtJ5k+5LTyhzlsagsd6EYI9nrF+f8NNN5BiLhsGP6AT6XuKoGR0YKcFcUU1yzjSAp53fJDyCkFXlV+dP6h2305PNUxnn6tUp75qvf4/MQ/jKpeYiRpL1G2Cl0zSw3XA3jj4vkxkYqleYweIkVg02KuMjnKuEdvNfuCoUtutEZ7GCKBbtrjW28DNmjUVblnvwSlN4crxRe8fFoScxWiPQny2OSDdUssj/3Mbv7yGC2G3pyfMNXKlr27X2x0aY0qne165gdggV6X6+WVGq6Rtb4O1+RcP5ATvMkx7us5mtajkG+WTnw0F3JamHZWdcOdcrurjbL5RLCjoMCA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.11; Sat, 6 Jun 2026
 12:43:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.007; Sat, 6 Jun 2026
 12:43:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sat, 06 Jun 2026 21:43:05 +0900
Subject: [PATCH v5 2/3] rust: bitfield: Add KUnit tests for bitfield
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260606-bitfield-v5-2-b92188820914@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TYCP286CA0268.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:455::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: 894cefe9-9677-4d98-2e6e-08dec3c93385
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|22082099003|18002099003|921020|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	BnPMw8cmlh+e65Q0W55ZEHvyGohRf+c2vmSBH53vLA7VA9nSbPbbgSehzmBN3Eo9I0+8Gt7jJL3sDWZXg4iw1zXSLtK93QQUBYWQ+TgNOdeGaklsSzIDIUS/PKY6/qUDvx3JYCj7BoSPWy++YaNJFdJXcr9x1dn3F7Y4GGTYGwmtLSskDPPSQzgWAmz4PNhvf0hgUPT23lvNZun5MFGDX/Zli8FAjPYT2K9t4C8dAGECZkIz4GKPPmJC3CEgwHF8HwYs4LGpogjIBwZaXnmRBMthbihqMMu0od5dky7i6MZ0ojwSmdrXlRRD5jUsi214g0PZxDURTM6n59RAKsLNw474xUs5W5SfsZvtfEMlsscTwgImgGdvrsOY6/IqhJr/M8DwHAneD1tYe/y2JSysdVVyzfeyb1UevRxe3qbAtxHNCSsBcV+ciFdbWVaFxjOvLmUD9IoQ5hFhY1es7MgpF4i4YsnF4ZXiBJ5gF52cgAo7WkEyMbKUiBkaRqHcHkI4NQbVsqNw1muzcTGcZdigUFbuN/tWTXFuHVHDz1FTb15zyjTo49eLovsFnDLR7KPoRYsuWCq67mYXXmCIy/CCGeAFwfD3K/jlcInGDOMXBhDOJC2Mt61USnY/ek1pSiWjTSu0IkUQZG8wXr23v/q613u4CE1LkafHRfUFJFn70dxJKx3gYdQwovQnsgG2HJ0Q6t+XgHRKHNdp0Uj/6wzfOr9iAsdrIU7lqzqF/mnBwIk=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(22082099003)(18002099003)(921020)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cytmM1NXb25xTzNwRWN6MHVEbVFqRXhzbFY4Y21RUzQzVGFudUtCTFBUZG9H?=
 =?utf-8?B?MFQ0Q25KOE83RUtkNlRPWGJ4RUplYXBudnkyZjlDdkQrZGVQbmZFd2Voc1VF?=
 =?utf-8?B?VnBCTWZIM0t1cG9iUzF1RjhsZXlwWS9EVkt6Ym9pYytzRkJxbXREc2VOVzlP?=
 =?utf-8?B?d2gvRGJhSUEydlZYbzBQK0l5M2JSeGE3TXFkQzZySjd0QWFXa3RJQlR5Vnp2?=
 =?utf-8?B?ayt2NHR2TVRFRXVjV3p6Uk04OFphSXU5U1o4R3FnT1V4VzhOQ29rZVNBQ2FG?=
 =?utf-8?B?NllrRVlXZ2luZmIvRUtrVDArU1ltYjl5THpmV3RZVWhDeUZnQUsrdWlPTEpT?=
 =?utf-8?B?RHZQWkRTY1dGS3RqNlJMZjBsY0lVY0FkdkY0R0dmOTR2WEVkNGUwVFhZOWM2?=
 =?utf-8?B?WlZsL2lGWDFQWTd0WWx1enN2YkF6Tk5Zckd5TnFvUlJyeWs5Sk1acnQzbmVt?=
 =?utf-8?B?UnpDakRhc0VRL0FWaE1vdlRJRGcvY2xkbE5pbWE5YkxWaWQzWWMzRndja1Qv?=
 =?utf-8?B?SVIvcnJIQ0xuMUpjTzBsaFRwRHZER2ZrTDJQSk95QTJmdmdXQ2hrSURzS1Zo?=
 =?utf-8?B?V3h3QmluK2dOZDdzZHlKNmhIVkxmL3RHNjVtQjhydmJrL1lEQ3ZQZ3ZoRGhT?=
 =?utf-8?B?RTJpN0pFc1JVNWhEbmp1dWFYajB1WXJwM3k2cWJVcWJkY0k2dUQ3bG9IVEgz?=
 =?utf-8?B?bnJuSlhLWGxxSi9mdzdrMzNnRFkxWnl0bk5tQXVVUnlGVk9aczVtcmhOTzVq?=
 =?utf-8?B?Zm1VRmpiOEE0TjdEWE5SOGVKMC9oU3NqTWMyVlpWTG5rMmRnOUxXWTBoMC9q?=
 =?utf-8?B?RFovNGxQYkNpaVl3YlVFMllmcnFxc2FTVENUTmFzTTNjWlRiU0g4M1pEWnZa?=
 =?utf-8?B?ejNIaEFlUkdFa0c1eXhKMENPdnhTMFU5aDEvaDZCSm0rZHl5YUFsNUwzeWdR?=
 =?utf-8?B?OXZjSkMyNFN6WXZMTHRGQmFySnJ5clFhdlJzbDUxeDZDcHlwdVlLUEliWmQy?=
 =?utf-8?B?aDdnT1hKdUN5SmFLQkg4SlFVakZTSnBCUVlyNkg4bVZSTjZpR0pobENPVHhT?=
 =?utf-8?B?ZTgwQ3QzN3dQSjZhMUZIekllTGprZGxqNEdhT3g4NDFSRWRQbi9kZ2dIL0VV?=
 =?utf-8?B?ZUt0Mmh6S2t4ZGVFOG5hVGRPL0dUTWZoS2pKUHM5MVhKVGtlUE1mMERYOSs1?=
 =?utf-8?B?eno2eVdEaG1BTjh3VEdsTXZsSUVEdXRLaXZjZTB0MWFlbnQyTmdQcVVKWTVw?=
 =?utf-8?B?dXhvQnVOQWhtYkZDYWlhKzV1SFF5OE83UjdNUVJCaFVsMk85TjA0YXNDVVBB?=
 =?utf-8?B?ZXVJeEFlT2x3MEtPLzZnaGU0SVBHVEovWU9sdVNZY09HTnBjcXpxQ3lVcEha?=
 =?utf-8?B?aVBmUkMyZzV0VHhWcFZjQUVPSDNDRkQ3aFhOVXppMWtDQTR1S3ZJakVHOTlr?=
 =?utf-8?B?d3JZMW5hdnNzdlZRZm5tTEh1SVBRbS9YMHRyVjNwV1lVL0gvdlhtQmVWR21z?=
 =?utf-8?B?a01zbVJnK0VmYkZUc1hJTGYxWkcyd2I2VGhDOGxXd2JjdHFGQmE5L29BaXpy?=
 =?utf-8?B?b0JPNE9UTzgxeW5DK1RBQ1FqY2ZaUVpJV3pIZjRBZW9GenUyTWVqdmFja1FM?=
 =?utf-8?B?aEZodS9GdFR2TGhHWmcrNVIzWUxBNFNsbFBqVHBaKzgrQ1NMNVI1cG5ia1lm?=
 =?utf-8?B?VVNTNGs0YW5FY2o0WmM0UGZwODQ3YWxFM1dsVXFicU9ZZk5WeHdFME1JbUpv?=
 =?utf-8?B?TE10TWJNSzRPK00wYjdBMUhXbGFXd2VKYUtKQS8yR0IvQXIwejlRb2t2bzhw?=
 =?utf-8?B?Ti9BamZlc0svYkJKNjF0c1ptU1Zua2c5UjVnb2RnRUtZSHdxc0gwYUg3TmUx?=
 =?utf-8?B?bmhjMVhodGdtNDBpS1lBNlk4NXFxT1A2ay92dmpJUElaUURSZTN1U0RZdVZx?=
 =?utf-8?B?MGN1ZEtyOWNqQlprNTFJczA3Vm1OcjcrT3VQUncrZ1labGFZZlBDTXVjUUl0?=
 =?utf-8?B?bldjU3ZvVzcwcTlhajFhY0doWlZvOTVSUWRxMVp2Z0FiZFJjVmpNRDIvbHhS?=
 =?utf-8?B?TUhBTXVIaHp3V1l0V0RqRGNJdmcvTi9lQ3JPNnpMUnJjUXhlS0FPU0dVcThy?=
 =?utf-8?B?dHFScXgwUEk5V0lKOFFORXBld1gwWEh0am5KZmViNGtHWWFTcS8xRkRxdnVP?=
 =?utf-8?B?WWIyMFUyVUVkWW1oMFh3Q0NqTGMzUGRrYjhSbHU2MVFVb2ViN2h3RmlCcjhX?=
 =?utf-8?B?Qkw0bXVubktVNzRFK2dYUHNidXo5VFdzamxyUFY1WFIram43Y0ZEdzRGNDMx?=
 =?utf-8?B?azdTaExxZ3lmKzduMVMyendEeWVqNWl1czZnV01iZ3N0SjVZMGdMT3BpaTVw?=
 =?utf-8?Q?VdKjWwMfCS12OF96eryh1dHWC4VS1JM+9+a5b3sn0Qk6E?=
X-MS-Exchange-AntiSpam-MessageData-1: mxebSRkx5iVDTA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 894cefe9-9677-4d98-2e6e-08dec3c93385
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jun 2026 12:43:25.7699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rBPcfGPe0oFsv80j4051BlZEXcCCvwqe7dBXf3vDYGf73MbWtzJ9PjUlkda595Cxc3mpBLs82MFlxZIsBpuPZw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730

From: Joel Fernandes <joelagnelf@nvidia.com>

Add KUnit tests to make sure the macro is working correctly. The unit
tests are put behind the new `RUST_BITFIELD_KUNIT_TEST` Kconfig option.

Acked-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
[acourbot:
- Use a consistent test axis where each test focuses on a single thing.
- Rename members to generic name including range for readability.
- Add test exercising `try_with`.
- Add test checking that unallocated bits are left untouched.
]
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/Kconfig.test |  10 ++
 rust/kernel/bitfield.rs  | 314 +++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 324 insertions(+)

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
index 2498107979dc..0e2f805c19ba 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -546,3 +546,317 @@ fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
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
+
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
+        struct TestU64(u64) {
+            63:63     field_63;
+            61:52     field_61_52;
+            51:16     field_51_16;
+            15:12     field_15_12 ?=> MemoryType;
+            11:9      field_11_9;
+            1:1       field_1;
+            0:0       field_0;
+        }
+    }
+
+    bitfield! {
+        struct TestU16(u16) {
+            15:8      field_15_8;
+            7:4       field_7_4; // Partial overlap with `field_5_4`.
+            5:4       field_5_4 => Priority;
+            3:1       field_3_1;
+            0:0       field_0;
+        }
+    }
+
+    bitfield! {
+        struct TestU8(u8) {
+            7:0       field_7_0; // Full byte overlap.
+            7:4       field_7_4;
+            3:2       field_3_2;
+            1:1       field_1;
+            0:0       field_0;
+        }
+    }
+
+    // Single and multi-bit fields basic access.
+    #[test]
+    fn test_basic_access() {
+        // TestU64
+        let mut val = TestU64::zeroed();
+        assert_eq!(val.into_raw(), 0x0);
+
+        val = val.with_field_0(true);
+        assert!(val.field_0().into_bool());
+        assert_eq!(val.into_raw(), 0x1);
+
+        val = val.with_field_1(true);
+        assert!(val.field_1().into_bool());
+        val = val.with_field_1(false);
+        assert!(!val.field_1().into_bool());
+        assert_eq!(val.into_raw(), 0x1);
+
+        val = val.with_const_field_11_9::<0x5>();
+        assert_eq!(val.field_11_9(), 0x5);
+        assert_eq!(val.into_raw(), 0xA01);
+
+        val = val.with_const_field_51_16::<0x123456>();
+        assert_eq!(val.field_51_16(), 0x123456);
+        assert_eq!(val.into_raw(), 0x0012_3456_0A01);
+
+        const MAX_FIELD_51_16: u64 = ::kernel::bits::genmask_u64(0..=35);
+        val = val.with_const_field_51_16::<{ MAX_FIELD_51_16 }>();
+        assert_eq!(val.field_51_16(), MAX_FIELD_51_16);
+
+        val = val.with_const_field_61_52::<0x3FF>();
+        assert_eq!(val.field_61_52(), 0x3FF);
+
+        val = val.with_field_63(true);
+        assert!(val.field_63().into_bool());
+
+        // TestU16
+        let mut val = TestU16::zeroed();
+        assert_eq!(val.into_raw(), 0x0);
+
+        val = val.with_field_0(true);
+        assert!(val.field_0().into_bool());
+        assert_eq!(val.into_raw(), 0x1);
+
+        val = val.with_const_field_3_1::<0x5>();
+        assert_eq!(val.field_3_1(), 0x5);
+        assert_eq!(val.into_raw(), 0xB);
+
+        val = val.with_const_field_7_4::<0xA>();
+        assert_eq!(val.field_7_4(), 0xA);
+        assert_eq!(val.into_raw(), 0xAB);
+
+        val = val.with_const_field_15_8::<0x42>();
+        assert_eq!(val.field_15_8(), 0x42);
+        assert_eq!(val.into_raw(), 0x42AB);
+
+        // TestU8
+        let mut val = TestU8::zeroed();
+        assert_eq!(val.into_raw(), 0x0);
+
+        val = val.with_field_0(true);
+        assert!(val.field_0().into_bool());
+        assert_eq!(val.into_raw(), 0x1);
+
+        val = val.with_field_1(true);
+        assert!(val.field_1().into_bool());
+        assert_eq!(val.into_raw(), 0x3);
+
+        val = val.with_const_field_3_2::<0x3>();
+        assert_eq!(val.field_3_2(), 0x3);
+        assert_eq!(val.into_raw(), 0xF);
+
+        val = val.with_const_field_7_4::<0xA>();
+        assert_eq!(val.field_7_4(), 0xA);
+        assert_eq!(val.into_raw(), 0xAF);
+    }
+
+    // => infallible conversion.
+    #[test]
+    fn test_infallible_conversion() {
+        let mut val = TestU16::zeroed();
+
+        val = val.with_field_5_4(Priority::Low);
+        assert_eq!(val.field_5_4(), Priority::Low);
+        assert_eq!(val.into_raw() & 0x30, 0x00);
+
+        val = val.with_field_5_4(Priority::Medium);
+        assert_eq!(val.field_5_4(), Priority::Medium);
+        assert_eq!(val.into_raw() & 0x30, 0x10);
+
+        val = val.with_field_5_4(Priority::High);
+        assert_eq!(val.field_5_4(), Priority::High);
+        assert_eq!(val.into_raw() & 0x30, 0x20);
+
+        val = val.with_field_5_4(Priority::Critical);
+        assert_eq!(val.field_5_4(), Priority::Critical);
+        assert_eq!(val.into_raw() & 0x30, 0x30);
+    }
+
+    // ?=> fallible conversion.
+    #[test]
+    fn test_fallible_conversion() {
+        let mut val = TestU64::zeroed();
+
+        val = val.with_field_15_12(MemoryType::Unmapped);
+        assert_eq!(val.field_15_12(), Ok(MemoryType::Unmapped));
+        val = val.with_field_15_12(MemoryType::Normal);
+        assert_eq!(val.field_15_12(), Ok(MemoryType::Normal));
+        val = val.with_field_15_12(MemoryType::Device);
+        assert_eq!(val.field_15_12(), Ok(MemoryType::Device));
+        val = val.with_field_15_12(MemoryType::Reserved);
+        assert_eq!(val.field_15_12(), Ok(MemoryType::Reserved));
+
+        // `field_15_12` is 4 bits wide (0-15); `MemoryType` only covers 0-3, so 4-15 return Err.
+        let raw = (val.into_raw() & !::kernel::bits::genmask_u64(12..=15)) | (0x7 << 12);
+        assert_eq!(TestU64::from_raw(raw).field_15_12(), Err(0x7));
+    }
+
+    // Test that setting an overlapping field affects the overlapped one as expected.
+    #[test]
+    fn test_overlapping_fields() {
+        let mut val = TestU16::zeroed();
+
+        val = val.with_field_5_4(Priority::High); // High == 2 == 0b10.
+        assert_eq!(val.field_5_4(), Priority::High);
+        assert_eq!(val.field_7_4(), 0x2); // bits 7:6 == 0, bits 5:4 == 0b10
+
+        val = val.with_const_field_7_4::<0xF>();
+        assert_eq!(val.field_7_4(), 0xF);
+        assert_eq!(val.field_5_4(), Priority::Critical); // bits 5:4 == 0b11
+
+        // `field_7_0` should encompass all other fields.
+        let mut val = TestU8::zeroed()
+            .with_field_0(true)
+            .with_field_1(true)
+            .with_const_field_3_2::<0x3>()
+            .with_const_field_7_4::<0xA>();
+        assert_eq!(val.into_raw(), 0xAF);
+
+        val = val.with_field_7_0(0x55);
+        assert_eq!(val.field_7_0(), 0x55);
+        assert!(val.field_0().into_bool());
+        assert!(!val.field_1().into_bool());
+        assert_eq!(val.field_3_2(), 0x1);
+        assert_eq!(val.field_7_4(), 0x5);
+    }
+
+    // Checks that bits not mapped to any field are left untouched.
+    #[test]
+    fn test_unallocated_bits() {
+        let gap_bits = (1u64 << 62) | 0x1FC;
+
+        let set_all_fields = |val: TestU64| {
+            val.with_field_63(true)
+                .with_const_field_61_52::<0x155>()
+                .with_const_field_51_16::<0x123456>()
+                .with_field_15_12(MemoryType::Device)
+                .with_const_field_11_9::<0x5>()
+                .with_field_1(true)
+                .with_field_0(true)
+        };
+
+        // Gap bits to 0.
+        let val = set_all_fields(TestU64::from_raw(0));
+        assert_eq!(val.into_raw() & gap_bits, 0);
+
+        // Gap bits to 1.
+        let val = set_all_fields(TestU64::from_raw(gap_bits));
+        assert_eq!(val.into_raw() & gap_bits, gap_bits);
+    }
+
+    #[test]
+    fn test_try_with() {
+        let val = TestU64::zeroed().try_with_field_51_16(0x123456).unwrap();
+        assert_eq!(val.field_51_16(), 0x123456);
+
+        let err = TestU64::zeroed().try_with_field_51_16(u64::MAX);
+        assert_eq!(err, Err(::kernel::error::code::EOVERFLOW));
+
+        let val = TestU64::zeroed()
+            .try_with_field_51_16(0xABCDEF)
+            .and_then(|p| p.try_with_field_0(1))
+            .unwrap();
+        assert_eq!(val.field_51_16(), 0xABCDEF);
+        assert!(val.field_0().into_bool());
+    }
+
+    // `from_raw`/`into_raw` and `From`/`Into` round-trips.
+    #[test]
+    fn test_raw() {
+        let raw: u64 = 0xBFF0_0000_3123_3E03;
+        let val = TestU64::from_raw(raw);
+        assert_eq!(u64::from(val), raw);
+        assert!(val.field_0().into_bool());
+        assert!(val.field_1().into_bool());
+        assert_eq!(val.field_11_9(), 0x7);
+        assert_eq!(val.field_51_16(), 0x3123);
+        assert_eq!(val.field_15_12(), Ok(MemoryType::Reserved));
+        assert_eq!(val.field_61_52(), 0x3FF);
+        assert!(val.field_63().into_bool());
+
+        let raw: u16 = 0x42AB;
+        let val = TestU16::from_raw(raw);
+        assert_eq!(u16::from(val), raw);
+        assert!(val.field_0().into_bool());
+        assert_eq!(val.field_3_1(), 0x5);
+        assert_eq!(val.field_7_4(), 0xA);
+        assert_eq!(val.field_15_8(), 0x42);
+
+        let raw: u8 = 0xAF;
+        let val = TestU8::from_raw(raw);
+        assert_eq!(u8::from(val), raw);
+        assert!(val.field_0().into_bool());
+        assert!(val.field_1().into_bool());
+        assert_eq!(val.field_3_2(), 0x3);
+        assert_eq!(val.field_7_4(), 0xA);
+        assert_eq!(val.field_7_0(), 0xAF);
+    }
+}

-- 
2.54.0

