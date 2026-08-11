Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022077.outbound.protection.outlook.com [52.101.96.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B993E43B49C
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 12:26:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786451167; cv=fail; b=lSK7J2/U55vIIw+5fzBrm+kCyNEkXrHxMzYgHx52H7VwMhPybohrlp8wMTUct7GiQQ14du0og16RIZDrsNK2PNHIBI3SkprpLbBjJacyGyLCPQ6vjQbcSQF5+kDeZWeRdwsXf4UnSlHjIWjzIbCckXFfIGhfG9KVkT4FSRcSgWs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786451167; c=relaxed/simple;
	bh=b/ozt+mfLqYj7T6lORqKJemeCq4z/nK9dYTS7Q1gL3g=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=GG4ogkUguAEda/uKYaRAKA7n5MbNyhXBtWcSvylhUkzQuB/ulo/xVEpgZPqt9lKjRU2Wd/a0xefhYtQZ8QSRQg9lAnDih6C1jD6xAMoIdl6WScKSZcxw7EXbMqcPwPstqGRav867FWCPHyYqinYgICm06l/nVXGGo30XlWNphZc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=HccJvI8c; arc=fail smtp.client-ip=52.101.96.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="HccJvI8c"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lrHiEf8r07jDBXgO5VqVVmGvxXssR/BSmeLdKl4USVtSDtpWyiM2OgJt44TxRxZbpPErXoMyJDNkpWT8zNSp8AwOecd3706dFB3uXNedUL3XGCujd0cmSJdYCTtv0Csq9kLhv9JS44beK8PjuCPZjnuZxnaYsvnECbtyiA4dAUA1bNmK/VBbNonFl7pgSKpQHcCzpJyehoJcwtK3XVAADMGbsjItNgCIcC8eyQLjgVazsOt1m25yEJsvMFjAAHLEBHFuTS+292W0KuBIKw4kV97K16zRp7CPS950rfFMDLAbMElgAFps+qn11wuoaFQuMHTQ41HoEfq4Lc/RYBQSYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iTUkhQ+kZ8QRV2epOtZMvO95moaOgf9QCqymwo8BxRA=;
 b=dNnfjHhZVHrml3YH1onJr0vxZvmbFLJZaqDS097YaWLuYwtoWtYD5QfwcGZX5JOmzwbIKSUTsnmaIMcA65zWmSicolBe2OcBVwpx2nFeWxQelIOXO3uJYOq+XY3oo5Ns/I7mbkpXMCTgT0sAt78qs9VkXBGaMKyTqxvvukcvZqtmTMBM2lW9XE067qu8jADBRElok8h1htIb5H+UpdO0kmmhw8JBvIE09x9KNXhIRKhnJeezsjp6KMj7WV/mFrTObe22oB+wSnfSIk+IKBwCYc5mWQe3r3VM4u/FkSEyU8ZhVg0n/s0VgNIjJRcl1PFxwownzeAf4A+jql57nh3mgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iTUkhQ+kZ8QRV2epOtZMvO95moaOgf9QCqymwo8BxRA=;
 b=HccJvI8crVPj6kOBoCEZ16WNbL792kavghVD1l5DOo5YGHwimX4yjLFyW5PDWJqftHyfMFL+9Eg69wKw0rRoQXIH/CvEqyU9XVENJlnnbzEAtiDY8BDoytyWGY0FLjKWuUyOtZ68kQxjIP61OlA2JyXpmE+MjFUm8Vx53m72RlA=
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
 12:25:59 +0000
From: Gary Guo <gary@garyguo.net>
Subject: [PATCH 0/4] rust: add `#[macro_export_scoped]` for scoped
 declarative macro
Date: Tue, 11 Aug 2026 13:25:52 +0100
Message-Id: <20260811-macro_export_scoped-v1-0-e7782b102819@garyguo.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANAUe2oC/yWM2wrCMBAFf6Xss8G20hL9FSkll9VGbBJ2UwmU/
 ruJPs7hzOzASA4Zbs0OhB/HLvgC3akBsyj/ROFsYejbfmxl14lVGQoz5hgozWxCRCsGgxepB6u
 vo4RiRsKHy7/qffozb/qFJtVUfWjFKDQpb5Y6vZ3fsvCY03lVnJDgOL5gGVSimwAAAA==
X-Change-ID: 20260811-macro_export_scoped-5ce38b5db968
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786451159; l=2438;
 i=gary@garyguo.net; s=20221204; h=from:subject:message-id;
 bh=b/ozt+mfLqYj7T6lORqKJemeCq4z/nK9dYTS7Q1gL3g=;
 b=opau12IBwbEVEXERK6XfrZknNgGbIQlO6lOkg855cNFiqTbY86WY6vad9nIyQbp4h9g4Ufmqv
 JHIoeS1NPPVDG1JMvyXnjGt3wcdDpCvn3bhN1Pbuh6JPgujnFLYhQRn
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
X-MS-Office365-Filtering-Correlation-Id: 8e186347-864b-4e5d-03fc-08def7a3b38b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|7416014|366016|10070799003|376014|23010399003|18002099003|56012099006|5023799004|10067099003|921020;
X-Microsoft-Antispam-Message-Info:
	CMAT3QqgPjlUjuscWcJP1ohnM9QVQdpIgTkoj4X7zK/6GdtJ0b5pRoWWTXDSyV+0VBB20mBKkhlkkgtd9jp90cf8IpdKae9bxUDJPZv/6EHCKJ6os5M0KYH4wyezUPSLpodJvugi8qAL9cvB+CE9iWkoWVw2l9t/vKPn1Gwvu1jHpfzRZX+14RP1YGM94erCXPZvoK5skNoo96yPFFd/kO9wiNwArEEXvaLn1wLUMqZthhVGKcpiVxgmnLO6fouUD3JluiIsAEZvwIKBb7Z5xCwyQ8yclGlXAluDKuHo2vrVvbOzcOMkoGLuI68KrssNuo5Tm8g9SkrVd2WTEGo33XYOXMyoAGIDnimGK/yPgPivUh8XrLYutRHEuKimkPvPTNRC1gC0fdkvrtmU/lhdJREVLtOG4+uzy2TZ3zABjJkSK1WJltKZl3JZPKZwRLxp1zk8sOmeTwuV81HAictN5Vw8uIolSoAUnFMfnFwH9X7OK65mobYs/CNV8aCgfbb5SUE28JGxnXLQwyUSezrmpnMEAK7tYczQCQn2d0mN4CuZrEReC/4NUz04MUahYys0MWIfrn17gSaKxyduYgft5qUB1gwEVw8JMBlCYyjVhl4GEazEltUA6E1sd/B+S0hnZQkSosabL9MKTS+usq0IBheiZB9wJwhpJ5D4KrFjSrKaI9XwmsUfD86lBsmALZyOinB/81xfu6ZZpmMpMF89MQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(10070799003)(376014)(23010399003)(18002099003)(56012099006)(5023799004)(10067099003)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NTV5UWlwWCs5clgxbm9xTm5GZmY5YkFJN09vd3cxZDJ6NWFjbjVqRXl1ZDZq?=
 =?utf-8?B?MktxeW1Tdytlb2MxRFhkbzBqS3ljUmxwdERwVTFjVlU5N01TWDlZekxGblZP?=
 =?utf-8?B?TitIVzdkaDArZThSSFlTMnlqeEVCQlZ4bVZMaGpIVVc2MithbmsvY0RYVmhm?=
 =?utf-8?B?VmNyN2xock9MUjkyRkdMRk9JcWRZTXZmaXFoRmZTQS83aktMTS9HMjJaUDd1?=
 =?utf-8?B?ZmtnM21mcUNEWUtwYnhkVVRTRUtGdWxHZkMxaEIvMFN4ZG9YWWM4eDZJMjdm?=
 =?utf-8?B?NDE1OFp4bFJlUzhWTWh2QTZTN1FWY2RETkxGd0c2VFU2VWNKOHZsMmZQSkZy?=
 =?utf-8?B?Mk5oZW01VFIzR1FVNTdsSnNjTG5pMi9TRy9PWXRjZUI1RnBQaEQwUndFendR?=
 =?utf-8?B?bStPZXUrSEJhSDhSVDJweFA2YURDL2h2TXZWdXVBY2R6bSttZ2llWTN3Wlg4?=
 =?utf-8?B?RnJUL3BLellLazBSZ0FyOUxZQU4zVEJmaldJSFNmZVNkRzZPSmk5dnhvdWZE?=
 =?utf-8?B?MmZ0S3BwYXk4dGVXQVFET2NDK2V5SGVXL3UyYWdRTEZ4eE5WVEgxdzAzMjhn?=
 =?utf-8?B?Z2ZZY1JUbmVCQzhXWGlPOU8wOVkzcmFJU2VTUWJyVTB3TUtKOE8vTWNJb0cx?=
 =?utf-8?B?eFlONVdHaERPOUhpZFcrR2tHbWJ5b3V0dnBOTDlPaWhUREF4QnVXNnZQZVdQ?=
 =?utf-8?B?SnlQTXY4R2o5M281b2pLRVJraEQxVTZqOGNkMjJ6Uk9wbGZ3azRLUjF3STQy?=
 =?utf-8?B?aUdYN2Q5N0hVOXJSdWxCa1QxRXlOY09nTUFDdkMzZmxIOUtHa3hUdWVFYlBG?=
 =?utf-8?B?VGpZZEM1M2JpUHN1blZuQVNDYXZXbFhxUXJaQjFaYUE4WGp4RkNmdDlTNzQy?=
 =?utf-8?B?RUpwdy9WT0ZmQWpoamhnL0dIdm5XbDVIaDNuK1AzTFdHM2k0eXFkZEtFQUs5?=
 =?utf-8?B?M0piT1I5bXJHQ0FTYlpqTUtMdzJIZXErQVlIZ3RjcGJpVzU4VEZYUTBVWUNw?=
 =?utf-8?B?QW14a3hoUlZEVHQ5WGxyUDdWSTZvVlNNY2pyL3NiMk1BUDdHK0hlYmtSNFEx?=
 =?utf-8?B?VGpjTHQzRFZVZHJHOGdKZzg5U3piZ1MrbTU2eGVHeDcvUEd0Wmx1clNCNmox?=
 =?utf-8?B?elJDTXFxbHFVeGh6Tk1PeDM5NHBURmNkcjJYTnQ2NGViZllOMCtLNXM5MFNW?=
 =?utf-8?B?ZkJIN09ZV2sxdGIzbHh0MGlteWhWcDhCS1pMU3R0YTFYWjlTU0N5S2I4RXFl?=
 =?utf-8?B?dHMzc2EzdnZLTjlpckJ1ZEgrSlIxN3BLTzd6Skt4czYwWHc1THBDckRWUFlY?=
 =?utf-8?B?U0J5aS92bUhBM0JpMGpYSG93N1lEcHN5bVdmd3g5VEtBZy80RlJvNkVHdmZM?=
 =?utf-8?B?N2pqbC9qbmlRUTM3WGlVaFBCTEtobE96MWhXdC8ybGhnRHk0Nm16amQvdWdh?=
 =?utf-8?B?TkFobDJVSUNqU2RCY2pOemNHSkpLczZvMjdGQW5ZS0lOWHdnUm43c0NpU3Az?=
 =?utf-8?B?dk10TGhzbmMvcEEwNFRNcGtJWmorbzRscDRxdHhTcHlOVm5KZ3RudFJZOTJl?=
 =?utf-8?B?M0lDWittT0g5QWFJQUpYUytYdThPTFBsSE9OWTAzWE5kazI0VDh0MFBIOFhR?=
 =?utf-8?B?Mk1JOW1jUkZ2bFRuRGUvN1A5bkJKTDhpV2FGeXlscnZkNjlLMGFiNWRTUmZv?=
 =?utf-8?B?WWRLU2VHTVZ5N2hKdkhnd0k2S0ZTVXBlQjR2V2dBUVpjR21YWC8yVjFNdXJN?=
 =?utf-8?B?OU5BWU55VmxEY3Y4ZkZmN0NUQ1B0MjQ5WGRSWnM5eHU2MXNITHZnRDZOR3E2?=
 =?utf-8?B?M1RMUHdpczNsWXN3WFNwc3EzRXBXdzVaSHVqbWlRamVMamdsVjBGdHpkWmpP?=
 =?utf-8?B?S1pqeUtkWGlsL1NvU2ZoVnhmdjl5ZmtpK24zWlJoZ3BCZmF4ZStQU2tORXRP?=
 =?utf-8?B?M2I1ZytTTFlKVkxoZWo5T2EwTjk5ZWg0anRvYklrTU0vRS9OdHlnU014KzUw?=
 =?utf-8?B?NnkrRFpHcm8rdndFMTRLTUNnTmUrYjhZM1NKNjJaYTg2QkVCOXJoVlgyNHRH?=
 =?utf-8?B?aUNTdlRvWXdrdHFaT3BLclg2YlM5ZXV4REc4OTBtL3FMZmhwMExUSVhwczdP?=
 =?utf-8?B?S2kwcEZqK3Q0RGFNOXNMblpFWWpzM0IrWGtxRlFabWRla3gwR0hnMVh4aDhB?=
 =?utf-8?B?eFF0UjQwQzJDdk51dUlTMFdPdlNVU0ZEWUh0R0laMXZSVDNwQTJDSjFrRjRR?=
 =?utf-8?B?OEgraGxua2cwOWphb2hkd1Ixa3I0Zi9mdFB6K09Ob09KY1poc1NpbUtHakJt?=
 =?utf-8?B?RkcwdU9pZEcyZVdpYWI2VExZUWQ0OTNqTlNUR0VtekswV2QzOUY1dz09?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 8e186347-864b-4e5d-03fc-08def7a3b38b
X-MS-Exchange-CrossTenant-AuthSource: LOAP265MB8560.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 12:25:59.8975
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BMqmEZoGU06uTFQhKtwA2NS/KbZ+S1rlJRipavUy/wWsTGxL4+78hJ+25W/9I9Fp+4MSnyHvRC9qWazibKWjJA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB5094

Rust's declarative macro scoping rule is confusing because it was
historically purely textual scoped and the path-based scoping is added as
an afterthought.

`#[macro_export]` will make the macro available for use outside the crate,
but it also adds the macro to the root of crate. This has the issue where
it prevents us from cleanly put things in modules where they belong. Macro
2.0 is supposed to address this issue, but currently it seems that we are
unlikely to get macro 2.0 any time soon.

There is a way to approximate the scoping -- hide the macro from the crate
root using `#[doc(hidden)]`, and then re-export the macro from where they
are supposed to appear, and undo the `#[doc(hidden)]` with
`#[doc(inline)]`. We have used this approach for a few macros already.
This is not fully bullet-proof; users can still reference the items from
crate root, as it is hidden from documentation but is still present in name
resolution.

Introduce a macro `#[macro_export_scoped]`, that implements the above
trick, so people can create new properly-scoped macros easily. Also, adopt
a solution where we assign the macros non-guessable names, and then just
re-export them under intended name. This removes the possibility of
using the macro from incorrect path unintentionally.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
Gary Guo (4):
      rust: macros: add `#[macro_export_scoped]`
      rust: build_assert: remove macro from crate root
      rust: list: convert to use `#[macro_export_scoped]`
      rust: io: convert to use `#[macro_export_scoped]`

 rust/kernel/build_assert.rs            | 24 +++++----------
 rust/kernel/configfs.rs                |  4 +--
 rust/kernel/firmware.rs                |  4 +--
 rust/kernel/io.rs                      | 27 +++++++----------
 rust/kernel/list/arc.rs                |  4 +--
 rust/kernel/list/arc_field.rs          |  4 +--
 rust/kernel/list/impl_list_item_mod.rs | 14 ++++-----
 rust/kernel/ptr.rs                     |  6 +---
 rust/kernel/sync/atomic.rs             |  2 +-
 rust/macros/lib.rs                     | 25 ++++++++++++++++
 rust/macros/macro_export_scoped.rs     | 53 ++++++++++++++++++++++++++++++++++
 11 files changed, 108 insertions(+), 59 deletions(-)
---
base-commit: 6b8c8af514d739d0335f5579b585e02babe8a727
change-id: 20260811-macro_export_scoped-5ce38b5db968

Best regards,
--  
Gary Guo <gary@garyguo.net>

