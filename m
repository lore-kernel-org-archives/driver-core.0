Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022077.outbound.protection.outlook.com [52.101.96.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D54BB443E53
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 12:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451169; cv=fail; b=kmEZFwHWFmvQ3+IcWVKvWlIpFJRtmuIxtUBgiAaZweW2bMEGBpW3kMAmtIWAuIWQ6muda4LBZANKWZ9NBx+VGHWjYVneSUkbEXUbMr5aRXRycvezPC83k+Q4Tm7oPndFJgjBHw2267B1NXdxWnzdunHOCaF21hLNa4Sf/D+btqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451169; c=relaxed/simple;
	bh=v2UMKMHfSJEXuVgNPjWQ3u38FxUfCwt+vLZTqmbuOTE=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=h4ZoSIdajcxJ2Egp7s4yLOyN7w1I10QzPdUGYT5GqGI333LyFvTHhNQ1fPbtVGTMJjsbB8iglxqSuNEvjgC1JR6NfEFfg5/QX710GYRvIEDxWyY+GJPYT5qhiVDllIjWsRPdhkwIXE7uijiaxn1A+iUvNfFLuuE0N0du4lAlTak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=O8FvfuTd; arc=fail smtp.client-ip=52.101.96.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="O8FvfuTd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SIYY6d+LCUghQ4f/gVjQK++HA1g7Gsw3m2hXbADJKf5a+/hG9+B9+bTv6GEsCNJh9MQ4YrufN8Xy0FWElSKE2e9mivaWwMKvtY8UNUD4liF1CzbS+S2NXJU+16Cz8Z8sDYKU1pXirMMDpg1KyHHnSyprKH/qebhu/5bF+CbitK06G9zSuzq0ewe0qsI6PbR8zjBCoKbQPxyciEkYTByOU07pQGlqlOruvmlwPoOmJstcbZOvvYbRuxFGtbTBXhpc/XENDA1uunNzOlRgqkgpSumJkmqWmFUP5agrTy8kvEcHjSpLtoCF2OgPllW7awAw9UPZXeVGey0ysZCiusyCbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sgvLZ6xDFD1RJ3xRe9d0EaAnwnNocm7mK4OHTnRC8/0=;
 b=fcJwP7Kb+n7V3Th2A6OXvMMfk6IAFULQRwg4aFRVKK30r2yAvNFQNfSE5f6IYWz66XsRO9jVCF9Pk19OS72cG1ZHnZQbxy9H5sWZF0Ng5tfkIWdZjR6YGx0kuUfmDRlG7OZdshQSbss7eLqOydwazrB4aeY7rosVU0lGScgMv6yV8WTQbu1d2topzQ6fqE1nahhe1iD5KhYtpV6pYC9HbEXiQ1tlphMwbO645X0EMokSppy1U+KCb/n2ihIchm+XnkuobTr3vl67ZZH7O3hz9dtVPFN91h60hmDTgxF4zTi+/zLzL149qIrKg1TrOMNn5aowgS8PEn08teMKRZVzcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sgvLZ6xDFD1RJ3xRe9d0EaAnwnNocm7mK4OHTnRC8/0=;
 b=O8FvfuTdVekqOXDYs/5+UVcbHvtLnJoZobc2b4r2AtD80dbKKvJZOivIQsPftgz/Ae8V8bw3rlaWiRD9wcmbD5bqREmmpiT5sP1lFcNSrk1aYxHjk7p+pkwfaJTWvXYeaiYEwufDWYxjod49UiTdfUWitWHzTkdfw3BWx3o6QYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB5094.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:282::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 12:26:00 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 12:26:00 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 11 Aug 2026 13:25:53 +0100
Subject: [PATCH 1/4] rust: macros: add `#[macro_export_scoped]`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-macro_export_scoped-v1-1-e7782b102819@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786451159; l=3645;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=v2UMKMHfSJEXuVgNPjWQ3u38FxUfCwt+vLZTqmbuOTE=;
 b=pPvL+PBkatQMQk9gvOG0RLuZBfSjRz5vS0dPo0QpYaJNx5b1CXLkERGCngLnWVeXyV9bFP69O
 Wm7r5w5wX0GAYw6w1vL5bV829J4ahM86KEzRERQtPTeCY9Gs6/XJQQ0
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
X-MS-Office365-Filtering-Correlation-Id: 728d64c3-bf98-43c6-3241-08def7a3b3ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|10070799003|376014|23010399003|18002099003|22082099003|56012099006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	nJ0uaG2WHIrxtfFyGKm4CrGBSZ8GPRjZP5EGBOEE3FYE1i2+IVgqxoiaZS27ZuRrifCyge2T2vi3Ye7spfBSEDeeeE4w1SRbhDVmwf8Z2DvmCH884Ep0whExArDP02NC0JL1XBYsNY1wYd6wgDwSUXXtc8XeZA+t7hPoSDIuaCacavni0P5mpg9slsc/hKGso0/VfVgXcfpIVJBGlIw2w7TazwZALJGjz39JS22rvurmKfbMRvhB5Qemw2GFIuRO31KVfyaAITcFxVY1PydudAQgYtZ+8hfcx9z/HieRuO0shLdlP6mE3IC1AdozXXOekueev+IbTHHQGKlau2CsjtuZtAipieZagmfSTHuf2jBEzVLqU3wb6EHtKHwxo3TyiP/8dnPOcZnsNdg8CJQ0/bgnhlh5n21HGEMPJUDnHPRw0QATTRDsCtNuWnsyusBJkyyXcU2rZFd/APN5Lsm+kJrS3bmIVANeisyNdaIVXofuqLjFS+0J8K1oREclyayEyhDh0StLoOMxZuznoaVulIyCdJuOrUcEVFxLHrxCYZa001zW+wv4ym/e/4d5mbUL5yyw/THiDh7jiTHLauXz6bDVYSZKlB1ZSgnEWLYp5WhxJNBTZ6Unh63MO2E/nBp7EQYMmMVYqxc24yJtg2yRVy+nxZQWVSu0iyMASMgMVMfKbVLMwiN1ULHX/XMZX1qTyTUGVa/v+UbvTARk6Rm/9g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d0s3SURaK2RwN0JVZ1NZVEpybzZzdUg5MlltRlUwcFZrc1BqNWVvNUIvTWVk?=
 =?utf-8?B?MldnNTlycWpFTHZxT2NPaUpYSXRGRFNlaGllZloxR2xTVkRCMWNmaG9jQk9m?=
 =?utf-8?B?bkdaQ2RHTWJFTE1zTUphTHd6cmZNcnoxeG0vVVZBTWtEUlRlbkNwRnBJcmND?=
 =?utf-8?B?VTluengvbjdoKy9XRGJlU2VCbFlMY3hmcmdLZGh0RHRrYjlwcHFjSEtJc0RY?=
 =?utf-8?B?d21XRDVIQi9vaGNQajNWejdZWUgvL0dhWlNjS3prU2wvOUdJcURXZGVVb3dC?=
 =?utf-8?B?c1ovZjJZT1Y0ekpiU21ycDhYMlFFN2RVZkM4Qlh5UmZyRGZkbVI0VnJDanB5?=
 =?utf-8?B?ZEhhQnlIbFpRMVFrWGFvQnBINkt6VjZSUXVuMlYzVFpjeEFkOUdFZjhsLzla?=
 =?utf-8?B?TkxNKzdBaWhhVnRnUnBJWjQzNkhNc29oTEdlNmJsMDVDUkpIYllDYkJjd0Ra?=
 =?utf-8?B?alNzUzBKN2V0S0g5ZkJWMXI0Uzc3ZDJ3bXZqL3pGalVaeFZOSHRmTHl0RDky?=
 =?utf-8?B?RFhtUTRnUVhndWVNbW1PRFN2VE9HTW9WK3J1bUFUVjVTTHNwVXZQa0xZV3Vu?=
 =?utf-8?B?Rm5pZnEzbThtVUpMcDV3RktybXRzYk9ZSUkxR3Q0S2ZOTy9TN1VaMVRwbk9z?=
 =?utf-8?B?RDVTNEhDbVo4dXEzNDZ3SnVsdmI0WmpCYyt6Z1RXbFk2dnVoZEZVaG5HWHhN?=
 =?utf-8?B?V1hRNmlqQ0R4Qm41c0N2VE9lalpTalZZQlY0TFFMajhSOEZ1Q1ZqMldzS25s?=
 =?utf-8?B?cXgrSHVuZzd6NW4wdElNNlRUZHlIQjEyZ2pMTlRsWFVtbGViTUdLZldrYXFw?=
 =?utf-8?B?MElSb0UvZXE1ekU4dFdTbEhOU0RLcG5uOHBhdzBQdDZOVW5MWjlyU1RCV2tn?=
 =?utf-8?B?OVFyV1BuaUJYYmNlUkxDVTdsSjBlNDZWdldTcG51c3JFcGhLSjhrazlTbnVO?=
 =?utf-8?B?NXY2OW1TWi9oLzd2OE9tRlJDbDBnK2c4eURhT2o3aGRXbGZhaktIeDB5NlB0?=
 =?utf-8?B?QmxjNjRrTTVrMjA3SkxOeXo3N01UbWZSNVQ3aEt2M09YNytNUU9HMGt6cDF0?=
 =?utf-8?B?RThqRWQzSU1SUEJaQmlXTTZuZzFnYUhiNDEySDN6elo1LzlQRFlGdXVMSGxq?=
 =?utf-8?B?SGtlOS9uSEFYbENRemN0U0dSK3k0YjBxazlLZ2ZsZlpSbldPK1VVTHc5NFZK?=
 =?utf-8?B?NFFMaDZVQjZEb00rWlM0dVBjWFpQdHNDNWErc3J3K09JTng2WGFucEtDQ2Yw?=
 =?utf-8?B?UDFsSW9oU2V1Tk1pMTQ0RGozWlNIRUszek45VWhwMnhuZ0lWTHVHOVp0dDlL?=
 =?utf-8?B?TXp1WHZGRDZ6blRja09wQVNTM2ozME5RQXJCa2NudEV6WUdqYWg0SlN4KzJP?=
 =?utf-8?B?RjJVNFJnZ2h5dnNGSmNDanE4M2NWZlpYRlRtNXdEVUw3aUM2d04rTWk4R3dG?=
 =?utf-8?B?V0QwSC9CVnhZaHFhOW1zNXVpVys0SGxWWW1pOWhCMXJyUWlLaVVyZWVuVklh?=
 =?utf-8?B?amlCdGVSY09udTRUcTlzM2I2bktzcVhUQVF6VkhCUTZjdFZJS1ZwNEh3ZWlG?=
 =?utf-8?B?eGVXazVZRis5TVlUZGhzcUZjZzhTVlR5b04wUFlEbVkzZ1pJYlhjV0JvdldK?=
 =?utf-8?B?UHVzU1VsZmNUK3AwWmx4QTllSlJLVGlGNWtLK1NJZ3ZqYjVZMlJNTHRleHhZ?=
 =?utf-8?B?WGxLakdkS1UybzVpbGNhaW9qZitnVzhxdDNPdzY5RE5IaHd1QVZ0YWhES29M?=
 =?utf-8?B?VVVnYUVnY1lkMWhsNlB6NFZ2ZVk0dmtEZHhvM05iTWhKZ1l4QkhlVmtKMlpy?=
 =?utf-8?B?REFBYjNoaEpHYVFqSFE0SVoraERLU2NSQkM0c0p4RVlrMVp5Vjk2R01hVUVQ?=
 =?utf-8?B?dGZxTEV2dXZtazFMbkdHRXlSYVA0YjFidGpKREJhWDBuNjk0ajAxdXZSRkc4?=
 =?utf-8?B?L08xZ0wxNmc0VFBmUUkyZ2lSdzdrNlh5RXlHdGZLU2svQUpsb1J4NytEcXpR?=
 =?utf-8?B?MkNXVkJiL1U0N0VzNVAzOTE0ODhDODkwRWVOTzhjUi9iMXdTR1NzTkZmcFpR?=
 =?utf-8?B?ajUrbysvbTFFNjZMOUYrS01BdUt0bW1qR2tnbjl5bTd1SDl2OGNTeEZtZ3RI?=
 =?utf-8?B?L0ZxUi9XMVF2NVc1MGF6aTdWQmR1S0RsM1dOeGo4SFpWcWhJQVZXTVlNSFh3?=
 =?utf-8?B?YXlCcGxqSHptMHJ4MmJrMUErWkpiTlpYVnRmMHhQdkZ6T2dvcEZ3c2RQMTh1?=
 =?utf-8?B?VURNRjFRRTNuNTJiY3hoK0ZwQllkaTQrajl4aEZzbGs0bjA2eHFFWm5MWHlS?=
 =?utf-8?B?T3FHMWpoeHFYYVdQVjdXSGZTTllDdm9idWFaZHNicmw1bzgrRGdzQT09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 728d64c3-bf98-43c6-3241-08def7a3b3ff
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:26:00.6912
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2sneAazSp/Ir+kksJYNjDdi82fk/rOQd4ykQ5rMl4Ub++YATan0iZ2amopcQh38jYjlkFaIF3bQW/pB9Nq5EcA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5094

Due to Rust macro scoping rules, macros that are exported with
`#[macro_export_scoped]` gets added to the crate root, and this causes the
crate root to get crowded with various macros.

We used a trick of `#[doc(hidden)]` + `#[doc(inline)] pub use` to make
these macros to appear to be only defined in the documentation, but this
does not actually prevent them from being referenced from crate root.

Create a macro `#[macro_export_scoped]`, that automates these definition
and re-export and also give these macro unique and non-guessable names.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/macros/lib.rs                 | 25 ++++++++++++++++++
 rust/macros/macro_export_scoped.rs | 53 ++++++++++++++++++++++++++++++++++++++
 2 files changed, 78 insertions(+)

diff --git a/rust/macros/lib.rs b/rust/macros/lib.rs
index 0514fc7c0a55..6f8ef9043255 100644
--- a/rust/macros/lib.rs
+++ b/rust/macros/lib.rs
@@ -20,6 +20,7 @@
 mod for_lt;
 mod helpers;
 mod kunit;
+mod macro_export_scoped;
 mod module;
 mod paste;
 mod vtable;
@@ -320,6 +321,30 @@ pub fn concat_idents(input: TokenStream) -> TokenStream {
     concat_idents::concat_idents(parse_macro_input!(input)).into()
 }
 
+/// Export a macro publicly, but from the current module instead of crate root.
+///
+/// # Examples
+///
+/// ```
+/// mod foo {
+///     #[kernel::macros::macro_export_scoped]
+///     macro_rules! my_macro {
+///         () => {}
+///     }
+/// }
+///
+/// foo::my_macro!();
+/// ```
+#[doc(hidden)]
+#[proc_macro_attribute]
+#[allow(non_snake_case)]
+pub fn macro_export_scoped(attr: TokenStream, input: TokenStream) -> TokenStream {
+    parse_macro_input!(attr as syn::parse::Nothing);
+    macro_export_scoped::macro_export_scoped(parse_macro_input!(input))
+        .unwrap_or_else(|e| e.into_compile_error())
+        .into()
+}
+
 /// Paste identifiers together.
 ///
 /// Within the `paste!` macro, identifiers inside `[<` and `>]` are concatenated together to form a
diff --git a/rust/macros/macro_export_scoped.rs b/rust/macros/macro_export_scoped.rs
new file mode 100644
index 000000000000..a14ee51d2d93
--- /dev/null
+++ b/rust/macros/macro_export_scoped.rs
@@ -0,0 +1,53 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use std::hash::{
+    DefaultHasher,
+    Hash,
+    Hasher, //
+};
+
+use proc_macro2::TokenStream;
+use quote::{
+    format_ident,
+    quote, //
+};
+use syn::{
+    Error,
+    ItemMacro,
+    Result, //
+};
+
+pub(crate) fn macro_export_scoped(mut input: ItemMacro) -> Result<TokenStream> {
+    if !input.mac.path.is_ident("macro_rules") {
+        return Err(Error::new_spanned(
+            input,
+            "#[macro_export_scoped] can only be used on `macro_rules!`",
+        ));
+    }
+
+    let Some(name) = input.ident else {
+        Err(Error::new_spanned(
+            input,
+            "`macro_rules!` definition missing an identifier",
+        ))?
+    };
+
+    // Hash together file name and macro name to create a hash that is likely to be unique. Use
+    // `DefaultHasher::new` which is free from RNG so the build is still reproducible.
+    let mut hasher = DefaultHasher::new();
+    crate::helpers::file().hash(&mut hasher);
+    name.hash(&mut hasher);
+    let hash = hasher.finish();
+
+    let unique_name = format_ident!("macro_{name}_{hash:x}");
+    input.ident = Some(unique_name.clone());
+
+    Ok(quote!(
+        #[doc(hidden)]
+        #[macro_export]
+        #input
+
+        #[doc(inline)]
+        pub use #unique_name as #name;
+    ))
+}

-- 
2.54.0

