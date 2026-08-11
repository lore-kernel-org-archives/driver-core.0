Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022077.outbound.protection.outlook.com [52.101.96.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F57443E36
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 12:26:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451171; cv=fail; b=ReSxwVuAKJ1Fn2VneuwPohzS3MMNAsTDOcZFC1Qkn38iEMyjciDpRBNFi0Lk8dfngegUVcgaIJ6h2PZ/Uj6eLWWxss74s2BLnsJkgCshEvPXoh2M6ogPDUMLJu2LaU+mHnzxfIgXwBtekMCJtqi478eRZt2VQ5gszuB9A/1/zoQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451171; c=relaxed/simple;
	bh=twVmf1gqdSItYVB8lMaKXevqTsaZig2JJM8Oz3yKbjU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=OLAyeGHklut7RD8rlj5DaGKvXfV6/QVBKWUaqfLSCQksICIvE+bZrsbuSJrY4Rwqyt72j8QLiTyuY2dDLH1qv7fYCLcDs7Zd8mJYROjndfBvmm/kwkPsxJnSpuTLNiAPEzk9UU/2L60FHpqphy/HGaZBIuuUj1Dj/JzrD0KK2pc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=IJ4Xb21u; arc=fail smtp.client-ip=52.101.96.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="IJ4Xb21u"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IY6QM8NwI7CWCsKm5O9DqXmF37pSV8+X5Gqfd1WBb1k/TylVbVI/7TiKCzcYg9zQqDL53vduYUH9BXXIdt/J/XSwDX/FCwglpHLaXBT+3qySAvOIEl3zFHBh/EaL0VNrghSbvO8UNQ0cpzzQYhcI7qqjmBf43R8e1d8WcZCZZW1ny3d4Opj3ybVq8TfR7juGDnhz9TkNwKK7FHpwDmT+6H873iLWCO29FbVepkf9htsNiY7kJREYAbGyuLC9Um5xqSlDG4+WGe3sx8FzwmgJSiXMCxi+OOBgJ+hrm+euyjbceThTLwa9pmxDgsK7YyUnRzaXKPGPtY76lPXgbTDSiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=afEaqejI+jxmciuw2HHxAJx0YuTzGwiLZIx+jMcSG4o=;
 b=HOjL/IdDizX7TT6/S6D2N+KBAn6lJj0yVIEJ+UtV/S8NKOILv4Lmbn5iy/bmBnN1i6Knf6PRPtE4XsXR9KVQPWcCGKHmmoHsVq9uxVRrSsIwEuWHExsrc/ThVW2AaX4fyeDHhJYSx+KywydT/riH7WYxeX8iJutzdjKFqp3AZzQ4GfbRmXz9kv8VJRcwG70LOD0tEMPcbYhhdU0GuC5o6Gdr5Gd6PGVtMJhWJXmKWdeP3+oTqRnfIBUtuB2qyxIx8iIPsmuow6Y8JnOH2a1fBPDDyPDjpRmUtS8plr2L8Gy3oQf8gvr/kfTYl123oFMIW+bnxKPt7tYFmyt9HKS+NA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=afEaqejI+jxmciuw2HHxAJx0YuTzGwiLZIx+jMcSG4o=;
 b=IJ4Xb21uQKfyMd2mTph+BZCaXeTf4s809BzHMTFteN/UyC1sh49bGvq1wH3hcfsvJSVqrjOgkm8OuKJ4q1gbJCGea8SfbLg49tPOtZyK3nQ+p/t443AVoGpgCvMVCfQSWjifg+DzSMyP4OYCEYSPlPoe/7EIW/dcm40J7R11HH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:4ab::19)
 by LO0P265MB5094.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:282::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 12:26:02 +0000
Received: from LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1]) by LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
 ([fe80::f60b:1537:68d7:4fc1%4]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 12:26:02 +0000
From: Gary Guo <gary@garyguo.net>
Date: Tue, 11 Aug 2026 13:25:55 +0100
Subject: [PATCH 3/4] rust: list: convert to use `#[macro_export_scoped]`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-macro_export_scoped-v1-3-e7782b102819@garyguo.net>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786451159; l=4119;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=twVmf1gqdSItYVB8lMaKXevqTsaZig2JJM8Oz3yKbjU=;
 b=HZQGhBYbPdkzqGhLgOsfEeKvQB0Lg20RqSKbpHFf+0f8b3vvrh3K++y54OgN0mNiWn4pnivzI
 SHsa/LoXuVlALuMEzWzBrBKCz4lQn0TZy0SR0TNGhGw79jqW6QeXsnl
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
X-MS-Office365-Filtering-Correlation-Id: 2a8fd98c-0389-4bd8-af9c-08def7a3b513
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|10070799003|376014|23010399003|18002099003|22082099003|56012099006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	Frv8bS26xAozldgheS0UVgpfSQ5RFdMfzOPd1IcVZwI3vxTbHrhNJxqwKM0iQyxyOoB4BphV7ENPLJr6w0el3xuPdtgLrONU3VazK6yrwdXqUR/k6xT5ueqWUunBAUeqy5d3Qnr2gQO74LnyLAeZUCcviLVSbsfWBNoizesMsSZoSh4BvhUdXv+2RGq39SdLMp5Yh2R2eXY5BFe3LtUSE+Xxru0d1f4224XT55t0RUdmEXzi7mjf3wy1VDxosogXE5ffxw93bHs/6x8DGhzKvwhKNLPnCUj/weL2q2HZC66tb+CibeZs//XPpWYxTjyu97NDATNx2e23ppTnY1Vmu23wyQJkL4ccrl/ExMZj1siuIE+LoKrmpyqIrWXUkIcygEdDq5KTVpME5SNZOfQH+P1xpVFcmFydn4iaZd+z/tq1vYLp8iZEHq+RTLp0s4hJ+1p34DLJ+V+aN0RDNWfHukCkDohDMd5TOnTfFxwopTmsOxFuzWSNtlVLV+wHxmP3mMrIj8Kt+2UJ8Z4UyX2vHkNBQ4altAmYX/8o8c5OLjl802SvCSIz1N5ZfkhEAaJI3dyoV3V544LiOqr3n8nf6sON8pCplixub+MkO7WuarmiTB2pDXGaFNtyt2c4n6jzBbAFeMf7l/Uhvh/uMTjqYd7gDN1mY+ariakWnVtPs5UjZRFXDsD+b1cJT0LvsSCCbuGfiwpbOHAE7YyPysQ5FQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(10070799003)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WGg3cHhCa2dzMElQYUI3V0RGRVdFNjJUWTlrMUlTblNTWUdYTXVnMzh1cTFt?=
 =?utf-8?B?Vnp5aytQKzhnbUJ5VTRQLzFtanFEaVkrUHoxQ2NCRDlTNDBaVzIzZ0FCTGly?=
 =?utf-8?B?OE5qcVZHR2hIZkM1dzdKTHRMc3RXem1jM1FnYU94UmUvVDhuQlpEUFl5eW0v?=
 =?utf-8?B?OW4rOEo0U0plNXh5SXQ4Mk14OFpPRDE5TU1XRWZ1ck5xcktqc2xocHZ6WWpH?=
 =?utf-8?B?R240azBCWFdsSU42SFpyVmV5dzRRNDdvQzRVOFF3UWEwWWNnMTdDTXBjSWt1?=
 =?utf-8?B?a3UycFE5Qkh5WXU5NXpjbWh4YS9qQUMyV3F6UEVPQ2hqVHQvRnc2cWhxT2JD?=
 =?utf-8?B?ZkVRa2Z2MDRMd2FPdGlDUG0yQXRYZU13RCttUHYxODIzeHR6N2thZzkrbmtM?=
 =?utf-8?B?RUppR3l2aGVVaWFQYStocFk4eHVuc0VGV3podWZjUCtISVpjUmcrbDJOM3lQ?=
 =?utf-8?B?MjFHTmh4RWhRa2o2UEIyTlhQb2I3ZVdZb3V4YzhseVloNCtjemhiSm9neUd6?=
 =?utf-8?B?QmFZbWp6QklnVFNuSzAwTWJ5SndTRldXcWIyTnBXUWczNm0rdkVEY0FZcWY1?=
 =?utf-8?B?a0NHL09nMFZjSDRSUDV5T1BKOUhxT0Q1aTRCUCt4Y1dabkpIcE54UTVWb2Nn?=
 =?utf-8?B?bjVpMXR3cjFmUjJaNVVld2Z5Qk1ia0lyODBWaUxGbDI3ZEVoQUVrVnBmUit1?=
 =?utf-8?B?SEVnU0ZEVWFVMXRwNC82bEErdTViOFl3SHVZakxzYmsvQjNBR3VNaUtPRG5H?=
 =?utf-8?B?dEFRMkpDY1BSYVdmWEpsZzlUc21ZdjluYkdtT2Z4WWs5aWxNSGdGQmFjOStG?=
 =?utf-8?B?TlIwRElxMEFFOExFK0o2YkpGK3F2YUxpb1FYdjl1dHU0ZUxzS1pRc2pNQjV5?=
 =?utf-8?B?NTYrbGROb0lrL2N5VUV6V2NhbWxjVUU0dVdUaWUxeDhMVitwRkRENytKWE9M?=
 =?utf-8?B?WjhXcUlSUmVrR2NjSnpwOFV3SmMwcmM5cS9LUSs4WGV2SjFNbHUxTFZyR0Za?=
 =?utf-8?B?dDYrYm43eEVxM0ZYN0pCUjlhRDJtMS9uUVVvWVhjWmZsTmc1STNPM0Zzb21n?=
 =?utf-8?B?TDhWUzF2Q3BSUFRHMVR1TFBMVU1SS3c0N0ZzejVidlJyalBIOXR2K3dWL2VU?=
 =?utf-8?B?MVFTWWwyMjdtSVF2MXJFVlpCYytsMVVQY3E4M0dYRWF3WmZEOGFCQjdjdkQ5?=
 =?utf-8?B?MFJWSDZBYXpwR0JCRFBwUlpOSjRIY1phUFJXeUluQ1VObVczTDJVVkhvMHpY?=
 =?utf-8?B?d0d0anM1K1MzRWNsRUFoRVcyVVhtVm9yUnVwd3JKTTl6RXM2ZGxjSzBYL3k0?=
 =?utf-8?B?bWhmNjgvRkJYaDVlckw0U0psNFlBUWZwVk5RLzJTc1B1UFJLYks1YWYxV29q?=
 =?utf-8?B?TGFzL0FVK1h0d0VlVVRiTG13Wi9DdlZQZjlqUVoxNVZjVkxVdGYwRjFQV2Zy?=
 =?utf-8?B?MkhDL1hVQ2lhb1UwelZoeXh6RlpMdVFTeUdYYW5rbnBWYVZzbUtsQXk5aHJl?=
 =?utf-8?B?d1R5Q0FOcldTYkJVdWZ6eXJOdlZIN0hId1NXVmUzMUlGWFVGL3BtVDlRT213?=
 =?utf-8?B?ZzNFOWdGQkdWbHQ0d2dzYU9rcTVVMGpqOFVRWmx2MzVKZzBKL1lMWXlOUWFu?=
 =?utf-8?B?dWlVWjA4ZlhzZjhTVm5NWE9xL3FVNWVQaHBnU3FLTVdxQ2ROMEFsTExUVG14?=
 =?utf-8?B?amlyYVR3Tmx4aHVod01KbjVPNVN3b2lnT2NUWTZXTjFKSTVFK3lVUndFWnBQ?=
 =?utf-8?B?NXRGdU52SldlaVYvR1FGdzZaVHVrRkhad214Y0pHeFgya3RyczRKT2pGQWs1?=
 =?utf-8?B?ajRBZzNiR25ob0dLUDN5S2UrQ0dLSXhzMzZyd0hQbUdzWnB3Y3l5bGwxblAy?=
 =?utf-8?B?VmM0amdtOHlaVHR4QUU2ZUpWMXJ6V0JoYUs4QnhmemlKcG80MjZzbEpHZHlk?=
 =?utf-8?B?emhFY3VXckJsdDJJcG84SFNMVjFEcHFvM3UvdnczNlNkYlJIUHdZUFpvZHhQ?=
 =?utf-8?B?alVqTWdqYStSdFo2emNnSDY1c0hGK25NUDdlNXRPdERqWm9CZkprUTlkZVYr?=
 =?utf-8?B?QkZrdUVYSDdtZ1VGRXBGZzVkQVI0R2dNZnJaVlJHenVGSzNBL3hJajZjSkVX?=
 =?utf-8?B?VnJjZ2hER2ErNzRXb2lrbDFLN3g1elpkbk5nNlJwN1J5bm1LUGIzWXQxelha?=
 =?utf-8?B?SmRNL1dOaVBTQW44b1krZFIrTllPSW1kcFdwSHE3U3ZsM2VxZHNXRE16YXVr?=
 =?utf-8?B?aUNzV1VwY0o1aGtqUW1hVU52WW1WbVdPb0RaM2ZrL2tKODVFdXp2VTRpK3h0?=
 =?utf-8?B?SDRSdWI2QUFNdkRnZS9TS3JuQ1Z2NUdPRGJsb1g0di9ORGFKNDdLZz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a8fd98c-0389-4bd8-af9c-08def7a3b513
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:26:02.5161
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W8Wh8cHq4Hxrd84jQVR5OssdLf/TG/b6BEKmS56JDQ66IpkxkLdvH/1GSoSxKY8a7xpd+QtF2SFsurPqsnnGmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5094

Convert list macros that use `#[macro_export]` + `#[doc(hidden)]` trick to
use the `#[macro_export_scoped]` macro.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/list/arc.rs                |  4 +---
 rust/kernel/list/arc_field.rs          |  4 +---
 rust/kernel/list/impl_list_item_mod.rs | 14 +++++---------
 3 files changed, 7 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/list/arc.rs b/rust/kernel/list/arc.rs
index 209b1173c826..9bb6d2e8104d 100644
--- a/rust/kernel/list/arc.rs
+++ b/rust/kernel/list/arc.rs
@@ -81,8 +81,7 @@ pub unsafe trait TryNewListArc<const ID: u64 = 0>: ListArcSafe<ID> {
 /// The `tracked_by` strategy is usually used by deferring to a field of type
 /// [`AtomicTracker`]. However, it is also possible to defer the tracking to another struct
 /// using also using this macro.
-#[macro_export]
-#[doc(hidden)]
+#[macros::macro_export_scoped]
 macro_rules! impl_list_arc_safe {
     (impl$({$($generics:tt)*})? ListArcSafe<$num:tt> for $t:ty { untracked; } $($rest:tt)*) => {
         impl$(<$($generics)*>)? $crate::list::ListArcSafe<$num> for $t {
@@ -127,7 +126,6 @@ fn try_new_list_arc(&self) -> bool {
 
     () => {};
 }
-pub use impl_list_arc_safe;
 
 /// A wrapper around [`Arc`] that's guaranteed unique for the given id.
 ///
diff --git a/rust/kernel/list/arc_field.rs b/rust/kernel/list/arc_field.rs
index 2ad8aea55993..b59e61e90fe1 100644
--- a/rust/kernel/list/arc_field.rs
+++ b/rust/kernel/list/arc_field.rs
@@ -65,8 +65,7 @@ pub unsafe fn assert_mut(&self) -> &mut T {
 }
 
 /// Defines getters for a [`ListArcField`].
-#[macro_export]
-#[doc(hidden)]
+#[macros::macro_export_scoped]
 macro_rules! define_list_arc_field_getter {
     ($pub:vis fn $name:ident(&self $(<$id:tt>)?) -> &$typ:ty { $field:ident }
      $($rest:tt)*
@@ -94,4 +93,3 @@ macro_rules! define_list_arc_field_getter {
 
     () => {};
 }
-pub use define_list_arc_field_getter;
diff --git a/rust/kernel/list/impl_list_item_mod.rs b/rust/kernel/list/impl_list_item_mod.rs
index 5a3eac9f3cf0..e3ec79089696 100644
--- a/rust/kernel/list/impl_list_item_mod.rs
+++ b/rust/kernel/list/impl_list_item_mod.rs
@@ -4,6 +4,8 @@
 
 //! Helpers for implementing list traits safely.
 
+use macros::macro_export_scoped;
+
 /// Declares that this type has a [`ListLinks<ID>`] field.
 ///
 /// This trait is only used to help implement [`ListItem`] safely. If [`ListItem`] is implemented
@@ -28,8 +30,7 @@ pub unsafe trait HasListLinks<const ID: u64 = 0> {
 }
 
 /// Implements the [`HasListLinks`] trait for the given type.
-#[macro_export]
-#[doc(hidden)]
+#[macro_export_scoped]
 macro_rules! impl_has_list_links {
     ($(impl$({$($generics:tt)*})?
        HasListLinks$(<$id:tt>)?
@@ -55,7 +56,6 @@ unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$
         }
     )*};
 }
-pub use impl_has_list_links;
 
 /// Declares that the [`ListLinks<ID>`] field in this struct is inside a
 /// [`ListLinksSelfPtr<T, ID>`].
@@ -74,8 +74,7 @@ pub unsafe trait HasSelfPtr<T: ?Sized, const ID: u64 = 0>
 }
 
 /// Implements the [`HasListLinks`] and [`HasSelfPtr`] traits for the given type.
-#[macro_export]
-#[doc(hidden)]
+#[macro_export_scoped]
 macro_rules! impl_has_list_links_self_ptr {
     ($(impl$({$($generics:tt)*})?
        HasSelfPtr<$item_type:ty $(, $id:tt)?>
@@ -98,7 +97,6 @@ unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$
         }
     )*};
 }
-pub use impl_has_list_links_self_ptr;
 
 /// Implements the [`ListItem`] trait for the given type.
 ///
@@ -182,8 +180,7 @@ unsafe fn raw_get_list_links(ptr: *mut Self) -> *mut $crate::list::ListLinks$(<$
 ///     }
 /// }
 /// ```
-#[macro_export]
-#[doc(hidden)]
+#[macro_export_scoped]
 macro_rules! impl_list_item {
     (
         $(impl$({$($generics:tt)*})? ListItem<$num:tt> for $self:ty {
@@ -358,4 +355,3 @@ unsafe fn post_remove(me: *mut $crate::list::ListLinks<$num>) -> *const Self {
         }
     )*};
 }
-pub use impl_list_item;

-- 
2.54.0

