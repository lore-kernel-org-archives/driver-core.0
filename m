Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012051.outbound.protection.outlook.com [40.107.209.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B974434B410;
	Fri,  1 May 2026 06:04:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777615469; cv=fail; b=Do0oA1c0KcA1kFagwl3uo7Mt8JowDSXGF7+WNbHTsZeAqqlKuIryFJG9yKCVEi7uQL8xJH2vh29A9+KrN/wqA0ig76+JidYcSXOp42mffUnps/WJfRw5Xxdsy+xSijQbps8a0cIT/cTklDsOEzfERu1XloCar7HP9YYYvtqJwDI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777615469; c=relaxed/simple;
	bh=3YZJjm3Cf45diHV7cv+Eh7Pe+VhW1QWp+Qov68ZU/0g=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=m7lcXufdTsw722aOItpGgNaY4LMV6cp7HkSXBBg84VS1nAnkypu2xL2//kqClozYo/eefoi3d02UChoMqD+lML/oEoEyAJu8wfzNGBNFLtUp4hT1Yt38KfDoRkqVPyUGONOQRiQOuZ8SWt81BBzk9NplqEa4rnCVXctWoexHk44=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SBY6sK1i; arc=fail smtp.client-ip=40.107.209.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SBY6sK1i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ucr1RXJRgBEuoDQsCylvCVHlq0RLOcZ8gcpyFNEJIxTZ1HUNizycbtHACsg4myLJ6s6cGwFzyMwxFVQSAXdKWeL+a+6KeOcSEi2G7+wbIw87aFBRydctRP6R08QotIB1iygRlrwAR2NkjK2l0R19CbD7h6ujVFCbZ1LYK9b/0EYTqisrsO4QHclgzu2LlFX66yodEJQpLhfYFtpank42ejT4b53BTCTPDbILM7BLOy7x3H2N+oncC4l+UYUVGb7EGiRLmrNyFX8Vsa7BknMy77Bjd2rif20aDkPusd2OJn1HA9LC4sF3NtuQHNP/8u96EIzqQS+lR3Bibm4tym0Jtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XjCYBrCqA31WEFNVLPNt1+SphBEc0iS5+z7lPgsoFc8=;
 b=Yqqyw9tdPB1ECcrKc97Q83z2+cCicy3M84KIKj06el2OdzGmLiCtjnXAmtbJqFfXfqC+CYqujgaJFSWASzEGbw+oksT3TJ49gH4nAZuhxDBNMQkcEcgOo51fe4Bp46HF4Ty5okeeCEo8zlkyq0ID8rkwg8AkGarHOqF/No4vP8s1+Ii0EIaL11A9rR8UGILNbG+LuQjT1jStZ+atAd3FpVawkkjqYSkNk6JZhaACs1c+7CEC1eRqF0S7STHB8pz+LAKSkLWmt7WVdiraIZeNU0nCjkwEg6BToiPQNg3sqYo9K6+y/aYQcXnb7ZadBF2VftbNaEOhTR9e3iJGEd4aGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XjCYBrCqA31WEFNVLPNt1+SphBEc0iS5+z7lPgsoFc8=;
 b=SBY6sK1iyIY3kbHT1uWj1rOwn1fRhU6ENQzQEkjaxPGtayN3RCuJzFMW1svu06kWvuq89yuS4z3sQd7UWSIB6UiPqrl5IPbtqR38l7GkXyyjPtRsX/7rztWlkXpgTUztUG3rUnRyQdzIsgn47IPgepbKw5Zv3ETIEDJ7nyoX+bPM/WUsTvPL8axutDPt34L2uoHqYeUe/3nGIeD67Xiv9PX4JeS9WnwAqQQdQbhIyOfP6SonHTxdkHfvd3m+yH3JxFFO7uFyAuAHL3IuhvSwcrqRTsHWd5qm5sWkLzIEt8Y3rYIFt96GtlfVEXOFmueSS14w1qYNj5ksCBXsSk3JEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 06:04:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Fri, 1 May 2026
 06:04:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 01 May 2026 15:03:19 +0900
Subject: [PATCH v3 2/5] rust: bitfield: Add KUnit tests for bitfield
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-bitfield-v3-2-aa1076c3337d@nvidia.com>
References: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
In-Reply-To: <20260501-bitfield-v3-0-aa1076c3337d@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>, 
 Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
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
X-ClientProxiedBy: TYCP286CA0364.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:79::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 00b8bc49-6f77-42d2-912b-08dea7477ce1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|18002099003|921020|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	Fg6JQLtaQWiWczYv5OQqfxQgCPUbdo0Dzn0D0Uhu2TGqH1eAIV1Y/U0FOv4HrkycbWb75APcFh7K48FhN6SKj6Fi5x73dvZQtB0KghJxABsuD3YISifKO4A4k0BF6kP7lRIK3Ar/oxfzJmx3RtNxhczR5JriHjt5PGyUnnSeS/vchwb+P46fPKWCH4EWZmc+hR2cCpSSr3uK+e8l4oZk7bk62Ct/t90Q1SAl7Ha+ZvcUY93+gKkAZ7fW5p/2B+54fOQmaWEM+gLp0zVy8Ppx0ODr1ohyE1FSvdcsVWv6GN8vLd6B7CPeHcSTdtXAih2swFXHOnzKUTVW0OqlxRgaJnsOQ423/haGMas8NkgmQkhyLmAjwreC3UF1O/HyJtXy1WR7WDCg7MAHApSjhLjCjjqKAmomFBOXjLSbMF4qTDsjYjBAtmNWuAtnq3JGeFq0KQ/0SR052Rnf2an699a+jYjzNEXRJE1C/Z6vsK32mFOQKilXRj0CeLbNgh2+j2ttowKOo3CfrH8SdK9mspvaU9xFIUV5el2q+6HHu8+7a4WJwA0hr5xJBHp/I+53HQ+Q9n5fErYaDwxuybHW4BZhOKL1rZ3myrtU5upbuw/N/oq9m5oUQitvtDhX+Luer01JSOnualazXHqafR4c67NEiVWmgoJvahuPkhcdsRduBG7yfvi1wPgIKRn0ocDcSJvZyouBY2O54cfaVEJWEnWQ3XQhuHvY5PlUu/Y3hcDgNTE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(18002099003)(921020)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z1dWemlQeHgvVEpzVWVQdU5KL1R6T0pDYjVqQlpwL0F6ZWF6b2F4MFcwekUr?=
 =?utf-8?B?RWVEUmw1cU1IeVlDMGRYRVlLV0NOdERrcGJGdnRiZHo4MitRSmtHL002cTEx?=
 =?utf-8?B?SkpEbUxMZEUxem95aVpCRjVHakF0VGU0UnZxU05vc0ROUXJJOUJ1L1ZNdjQ2?=
 =?utf-8?B?ckdXVyt6NXFnc2Qyampsd3lzeWtTVU9INVNkZEFTK3pEWGVHSXpVc1B5WUhM?=
 =?utf-8?B?L0MrZWhiWWhTTHRkKzNiMGdmMTJOQ1E4d3ZvZHROR0lva2xCbjJ5TDdISVRC?=
 =?utf-8?B?aE4zbjBnNkJWS3ZhSFh6MTl6MWY0OEx0dXgySU5PeWRhbE9jcHIzejJ4cHRT?=
 =?utf-8?B?emg5Zmt6UDF1cFZiNzI1YUtmUHdoYmRXQzFhaU5NWGM1bE5wcm45MVN6KzZa?=
 =?utf-8?B?bE5ManRpd2htTkhXMmNPc3lRM0N5R3ZoRWZiSzVVL3dDR0RCL2ozNzlVOEpQ?=
 =?utf-8?B?MGdDdnJ6M0ZqTVdUaXc3VU9aTFRhRkw1aGQ4WWtnYzdwMEZLdnNiQ1E3a0w3?=
 =?utf-8?B?QXVQTC80eGR1YUR4ZXZiMVhhRkVNZExHYjZHdUhSVEZ3elRHU2FDYS9mbCto?=
 =?utf-8?B?ODc4TTIzbkdNN0twZjdwSlY0THlOSDZ4NjZmMFgyc1VxM1FEU1FxUUllWXY3?=
 =?utf-8?B?bzF1QUFUbkltbWNJKzJ3TXVMWGtpc0UvVjdENVlydjlURGJOWjhpQktEZSt6?=
 =?utf-8?B?MzRYb3FlMzNtK3F3aVJVWEFSS0ZBV1NvWnY1Yi96VlgyUHhaSVQ2UHpON0FK?=
 =?utf-8?B?Y3Vob0FVNG83dTRSNkpTRm10eENSM2hwV0M5b1FFTzJNdjVWelAzWjdlQ2oy?=
 =?utf-8?B?dHB5TkZuOFZwV3ZTNk52M3d1ZWR5VVFJblZNWXp3SzE1N042SHJxdTVsMStT?=
 =?utf-8?B?eUZiMnhGRUZwcmpON3F0Rlg4bS93VnJRZS9DaS82SjZGcXhaMHJFSUdxcXkw?=
 =?utf-8?B?Zy9sMWlIZmFpTGdUaUJCTnFZdkxJVStvbjhWNG02Vk1nZWwvQXlNZ1c2TFdn?=
 =?utf-8?B?cmhkQkFPWFl2dldINWdnd3pZNXBkdEhPRjBUbmd2bDRXWVE0dzFDYlJCRXR6?=
 =?utf-8?B?YzZuQ3lRUngvNW4rN2VPdzRISXAwZm4xcFk5NFJ6eUc2UXdGekQ4TUlmK0Fr?=
 =?utf-8?B?V2o4S0k3djVtTWl3aGNzb1pWQUc3Q2RTK1Vvem1ibXMwMUVkWGRobE55NG81?=
 =?utf-8?B?RFFleTZnMmpGQkRaNVpQMGFzWHZRNHRpMFpZNE1tUWtudXN5dloxUldud2w5?=
 =?utf-8?B?Rzc2ZE9xZTVCblhUbWxrUmFBOHVyWmlhdFVpY3BGZ1h2S01GNFpYREY3YlBO?=
 =?utf-8?B?UEJpOU5ZbXRCTEV3dWRjMnkxaVo4Rk1iVEJRUVRHbzluMTVmN2hPUUNZUy9L?=
 =?utf-8?B?RW1pUFJWWEtFd3BCTm9XaGcyYTZWZWRZbWxrTHdrQTZzdStNK3NmMXFiaUow?=
 =?utf-8?B?RU1PZlFHbnhuUzlERzN5Wms2S1hLaktqKzQ3YmFDZmxycTMvWlJoVm8zMlB5?=
 =?utf-8?B?Y05QUG9UdzF0ZjJWSXVRY2ZkZkIwQUtNbFNhTjB2c0c4SURpRmtLQytKK0xB?=
 =?utf-8?B?YUVEVXJua1grRm9jY0VlNzR6S0d5WXpOTkZEQTlZbkR0elRtM0xjR1AxNEJF?=
 =?utf-8?B?Q1o4NHdWNHRjMWZlNDg3bHZlRGxIUVpvellIZnVMSVFMRHNYaUdFeUVPbDVh?=
 =?utf-8?B?VnI1MlRyWUdkYzVNMlYzZ2JQdmFoSWo4Vm5hUS82OGNsbzQ1T0RMNGFVbHZP?=
 =?utf-8?B?NFo2NHAvQ2NpZ0laR2ZLTXBOeEV6UGZKWXFZUnN4WUZVTW9YVlg0aTl3UFll?=
 =?utf-8?B?RG42bjlMaXZkVzZmNUhMa3ltSWJIWklKWDNveUJjL1g5UXg0elpkcW02R2Y2?=
 =?utf-8?B?U3VCY2YwTW15QlpOdjdzVzI0VmRVYnRMSmY1dEdJUytsTWhPVFhyeHdOQlR4?=
 =?utf-8?B?MkpoY1VmZU8wSUt3OEIrS1ppRndvbkpySGhyTGpGTGJ4NHMvTmZVaUJKK2Q0?=
 =?utf-8?B?YUhVUVdqcnZ1My9ablBDaHdVeEc5bGF5YVdKRXoybU5FdURDMzFoZERZU05i?=
 =?utf-8?B?U0VUM1lWWTAxNUdTOW5hUC9WTVhRRlNGaHFBQXpVQjk0VHZHRjN6amk5Q1pl?=
 =?utf-8?B?S3lnMlBIcDM0dUY2MjUrRnNEWTNhREpHUjFrakdPeXlHQmRjd2dCdDJRMnBY?=
 =?utf-8?B?RXJ3SE9WRlN0VjFhb1hsOWorak9rWFl3dlFhNmZCOTk4YWVaalhZMkJCNEQ2?=
 =?utf-8?B?MU10bEhjZHMyYWNSVmdlOVAvTWlYc2FhUDFmL2JmVk95Qmh1Snk1ekhwVUE2?=
 =?utf-8?B?aFlXRmZWRG10S1ZuNjkvcUc4Mk50ck1QbWtyNnJOTy83QXY0QmVjWXp0ZFFo?=
 =?utf-8?Q?IPm1f8DmeRbbIprcTqeW+OGW6m1R94a8/RdJE8OWq/WV4?=
X-MS-Exchange-AntiSpam-MessageData-1: PX8HnTHSKWOTIA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 00b8bc49-6f77-42d2-912b-08dea7477ce1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 06:04:21.4308
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BNF+gnbRDROVDo+RvIubwFsgZlJfCaPMvAvuL1PGcM9OKQprD4Nj1ziIzBIpY4dA3+v6ivo+dzt0xP+5Qp26tQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584

From: Joel Fernandes <joelagnelf@nvidia.com>

Add KUNIT tests to make sure the macro is working correctly. The unit
tests are put behind the new `RUST_KERNEL_BITFIELD_KUNIT_TEST` Kconfig
option.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 lib/Kconfig.debug       |  12 ++
 rust/kernel/bitfield.rs | 319 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 331 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 8ff5adcfe1e0..916bf066c016 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -3608,6 +3608,18 @@ config RUST_KERNEL_DOCTESTS
 
 	  If unsure, say N.
 
+config RUST_KERNEL_BITFIELD_KUNIT_TEST
+	bool "KUnit tests for the Rust `bitfield!` macro" if !KUNIT_ALL_TESTS
+	depends on RUST && KUNIT=y
+	default KUNIT_ALL_TESTS
+	help
+	  This builds the KUnit tests for the Rust `bitfield!` macro.
+
+	  For more information on KUnit and unit tests in general please refer
+	  to the KUnit documentation in Documentation/dev-tools/kunit/.
+
+	  If unsure, say N.
+
 config RUST_INLINE_HELPERS
 	bool "Inline C helpers into Rust code (EXPERIMENTAL)"
 	depends on RUST && RUSTC_CLANG_LLVM_COMPATIBLE
diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 4083e7b7a307..66358e6371f1 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -544,3 +544,322 @@ fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
         }
     };
 }
+
+#[cfg(CONFIG_RUST_KERNEL_BITFIELD_KUNIT_TEST)]
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
+
+        // Test using direct constructor syntax TestStruct(value)
+        let pte2 = TestPageTableEntry::from_raw(raw_value);
+        assert_eq!(u64::from(pte2), raw_value);
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

