Received: from LO3P265CU004.outbound.protection.outlook.com (mail-uksouthazon11020075.outbound.protection.outlook.com [52.101.196.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA7CD2F690F
	for <driver-core@lists.linux.dev>; Sat, 14 Feb 2026 05:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.196.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771047301; cv=fail; b=E6Jw9QySUeKAuxwqHX56maIfAVmz/it9gIZlVbpRRTd0ByTimTwICaBXLfBJ6DE57zEtz8PuJpWAvc+tjiUOpCDtwSFOa3EOO0roHtp2b7G1psgVGirTB+RrQxJKXRdMyOQWdUIxSqWWhUbZfZCOC4lac44sJ1TjgxaHJ58O5co=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771047301; c=relaxed/simple;
	bh=NRFbRrCNbkdKfnpEAorGGNj05aotinRUh/lHNK88g20=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=BRtaJ+hqV8yrHQwgN5PNdHpQ9Fh00w1nYqxF/d43ahzWIC13FL4ib/CflkHXWcUre+7PGuFxSgu9S/G7a0nG04ADSRxJ0JtfcBsxxvjBBalueX7GC2VwIfBeE/k8THcqlzrayU1YkmY7U0Y0+6DC1xZmD02cmBCZMsnemQLtP3E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=N9ENsEaa; arc=fail smtp.client-ip=52.101.196.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="N9ENsEaa"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fM63RLMDLX2xzBp424knkQxNA1TIVcfwUOQYRqacnNtd4pS5avr6hbZzPdMcHqh5x2ltRYZKOIGJZ7sd8zrr36W0x3lYL3j4xoOgDpFK5/qt6D8aWyE0bVV2Zw0cSha5DV64rx98daqIYCnXi1Ap4ugUlM0Yp+TDZnbrDLnLsl3ElZMCOIbzNhKAjGoBeUfmrVGUC9r5trX1ZWEdf3Q9u6A8qlY8oDQw3Fn9KK9FY8nCuQsZA7mH34dKP4+SU8Dz+gl1imd0y/3OikSObv7hUFh9K39Yl+Eq2bOlLhhkzBMwHy8gVeq27jCTtbSxbWS5se6nJZTMMl/VE8/gSLMJ1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hYJERwcfLBYwoOqk8H5RfzM4hc765EEvtH/BAq0mpRM=;
 b=NbhtT3/TkE3yp00qGm4Kd2YT1So1mHBD9MppdUToANVYWdOyuUcGbiZmi9fua7aCwbFm6cT+tZrU49e1MWGQeP4cDjI5BHGKTYC0Q0IJzh+5rpMBnbCVzo13pj/GWJpTlBxnpHKE58C5oQ/giUfyxGMtD51XH9M1WO78yX7aIMTLyyCwwzuwd3uobzNSXCDMrjFGLt6mYNiK2+X4y65aFJDdQyqo0Cc0JbAEDJNV9bZjW7CfHUFbTQoEGiv5/Pgx3UD5uMvZED2viI06KYIcJfyFT4tl0ym2a3hZ33kFPkYmFfaC3AeyNMNfaRdb4Jxq6I6XUK8F0GOvMUBPEVSanQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hYJERwcfLBYwoOqk8H5RfzM4hc765EEvtH/BAq0mpRM=;
 b=N9ENsEaamaLxooCVtr7gkOAFDc0RNSoc24xwzYIWWqprJhSiao7SBFkvX2fYo9DGJv8Oxmacz/OTzAjMGJqOrLjR5l35xQocs8DPXjeaMPhaBceXMegmB/xnXoFK3lRRePjIwp/xyo9Ket53dLDt9CX6eyepD/DPvLZEX9E8YXo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:34::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sat, 14 Feb
 2026 05:34:56 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 05:34:56 +0000
From: Gary Guo <gary@garyguo.net>
To: Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] rust: dma: generalize `dma_{read,write}` macro
Date: Sat, 14 Feb 2026 13:33:39 +0800
Message-ID: <20260214053344.1994776-3-gary@garyguo.net>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260214053344.1994776-1-gary@garyguo.net>
References: <20260214053344.1994776-1-gary@garyguo.net>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0017.jpnprd01.prod.outlook.com
 (2603:1096:405:2bf::14) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|CWXP265MB1781:EE_
X-MS-Office365-Filtering-Correlation-Id: 771254e1-0e66-4e18-fe66-08de6b8ac910
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qLRg8G32nQUABKzTkRiCigkOImv+HAL8M1J4UR5DT4p1L9X9BAdxOGgGjGg4?=
 =?us-ascii?Q?G0UAgI4T1XbW0QBykYoEbxhZvUjbMJ098cQphkikpo/vIcI37u3RYt/8Rt5O?=
 =?us-ascii?Q?9KYxcpug2FQdIVgIpljL7j3dxfYsE02xkTBwh0ELLs7JDZO7pqi8HRiPTCpx?=
 =?us-ascii?Q?rXAl2kBrj4xJAgBx34evcTxoXeEyVWbrlvm4xEHqE6MRcqL0d5zIfrqBVMHZ?=
 =?us-ascii?Q?ttluGCcCCTP9xyTj8OMt/6dZdxUcxF1gsEGjn5TGfFz0ywAMXHKnu6OYi4GY?=
 =?us-ascii?Q?ASAHoevup2KJ24upJEAoWAxuqnJZ98zW3MC9rQ94Qurg0H9jfBcs3AY+pcWe?=
 =?us-ascii?Q?MfrvFz9lKgewvcKoqy8i4BzwuG07PzWYKwi2iVv9mDnrQWywz8Ea5/KXNTh/?=
 =?us-ascii?Q?vAbGNQMKNkDEYMuzsbhjoH6BKzC9Ksd4BWBZD0Imgjwk0dsKhh17naPko1O3?=
 =?us-ascii?Q?I49zlKndhV/G1rsFyKczAIkzUdgtQlyMZBti0byCrNojvbHE2ZIEgWnCSUVc?=
 =?us-ascii?Q?BopgFZ6eF/ufWuV3bpQvo11LyX4nHj5nKVbFVzkq9/ZCxEF4zTeG8KlFxnY8?=
 =?us-ascii?Q?XQUlVWmvf+k4wm4FUUs0LW+OYpBRZoCKoJ55bKiAnJoK170t99kPSm+20EYT?=
 =?us-ascii?Q?4LroUg0ujYX3Ptp1HuUmceILZuSxVBQ5/gQOqKlcJcA60bLb7zZ9XCLd0dZv?=
 =?us-ascii?Q?V+aY0tao4mQ0o+kXMZKEQ8sQrD+yBV1g8BcYsMZyqDL3Yc5KogVohz8/mFC9?=
 =?us-ascii?Q?zxgdtlUvESY/fHOYsZKIJpPtR27mkLyKkV4B8Y9rv11I+qPcdDwIFYnXyHST?=
 =?us-ascii?Q?otWP2HfnwlfElobEqozMB68THVs7z2MOy5OnIVaGZfsxcR24rw+R3ShuJO/A?=
 =?us-ascii?Q?f0iCp0uTYm5b5DkTh2+Ghv7XCrvNJSmYxWlZzFSmWoT0sSP1+Lo89onxWKlw?=
 =?us-ascii?Q?VSD8iQBMTlP9IV0M6ZlSdNM/oHBrepnZWGmvUGg6Mk143PFjAlHA/I1DdNsl?=
 =?us-ascii?Q?5ExkUO7Md0CLl3tKeB25Pd9tB3V/30hPOWkim9lXU2p6xFndjVTpCGmY70L+?=
 =?us-ascii?Q?XhShzCtjex5reZHS1GI906JKjqpDpoxqa2iK31z/wu5T3bVG8qYRfXRrvRxw?=
 =?us-ascii?Q?xY77Az28sZ9b3ygWZqAxSGVvYx74SgJh1GhOlWb1H7lvnZhKuBbd/ndfv0Lm?=
 =?us-ascii?Q?IMY9FFP239NUYV0p50kaP+fVSnrvR/9XGXmb9OWAmy6yctc2T/EDTt9BZAym?=
 =?us-ascii?Q?iEMLdSCr+6pk/s8wA5lsJGqqUeCRPV4R6vgPMMMh5tpt9ZHieFwj5Eg1rjNZ?=
 =?us-ascii?Q?bwKbtQ3WRZbAyWE6eumEXkJbhfeh681RG2cylZzTEh7ohNWFcfjcjVqKfsfX?=
 =?us-ascii?Q?FGfjmfeAQa+kC54AMvMi1sMsP1hOGdXWjopLLAwlbEhOsT5ZorQCRQpiIflK?=
 =?us-ascii?Q?HENnsUd4X1NAxWzsA5DAdwOGDcTTI13IAmB9JgFHQpp5PoJS9QinGi1uxX5t?=
 =?us-ascii?Q?dEZGpSZWW5u31Hf2HXUOxGk770vG+eXHTVSHg2REyKPzJn65gOolagnYcpM+?=
 =?us-ascii?Q?bd7Uvnte4D2TbBdOCCpumCKsFGHeY+vUmpwIwgrKsi78wGsAXCLszRXQ1pNK?=
 =?us-ascii?Q?ow=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?QgTn3CnZXoUtat9+WbCv1tU0xq+vafOr0JqSJs5suL4WRhoaCWNIgQe8bTul?=
 =?us-ascii?Q?GFQEjVfSWrD9ScmKRbUPFqrHhdqQJN70wQdki2VST+qA+QoAunm7sE9TJvT+?=
 =?us-ascii?Q?8tOJTuNgWpUJxLnU1/b1O9cU5xeDa6Hf/snItBGrPBKIz0ImmMtrdnaBQ/7a?=
 =?us-ascii?Q?W+XwdAT5h07vRi52YmlYDgbIhqa/9nk2BiP3CMMCzecP1p6sNKtAKMDvATPe?=
 =?us-ascii?Q?U3taoFgnVbXgawzMWAK3B6aNHw4XtMYTT/AaHfpscO6HE0V7oHLLpdS1pn9M?=
 =?us-ascii?Q?UdxTv610yAJJfG939LIVEOUeseNKEHfCZRZm3NfwtU76Eb26qtYZcQnJtF9E?=
 =?us-ascii?Q?dFkTz3O4hpOW4oz+Qm4hmdlVAaCbnt7GvC3eRmPSF35hJLxZQ2pfRiYaY3mx?=
 =?us-ascii?Q?WMagUiI3SasIeOgd5HRmGUQqZNNEpNn/uZeAZ3LARDmJFmSMQKdJJYglciOL?=
 =?us-ascii?Q?RdKf0jSVvYDE8yNEaeZDswdDkMtaChyrT7PMnqbVtejmuJlEKY11MGWoabLg?=
 =?us-ascii?Q?/UJUZWMYMwYvKbx3qVc0i1dBGlA3EBwYFo0t4nZOC3ookuTF9GHT8WxLTgHJ?=
 =?us-ascii?Q?fyKzuK374GCDmziulywjLLknvaJgu2f6DBChG3SH0L0i1gQx4++g3VBqt32U?=
 =?us-ascii?Q?rCyCxiNDK0cMrcbD4HRf8nHkmlV/u2W7Hga7IcIrFGnfBOQZdWGod1MQIjgZ?=
 =?us-ascii?Q?NUURugNfUMJor3RWmVZo/9KTFy5FexKLh5EZXINOFJOrZ7L4J35aK1xWs7Eh?=
 =?us-ascii?Q?ZFnfqStfVU515UramPYqzJ0g3tjVy1fXdvk1APwKjRTxL6hcTPp3Nyf1pilv?=
 =?us-ascii?Q?X7Ao1/SxO3yFsVhLWKi4SGxbiNPI2ArEn+wHz9cpffooxx2X6Ibz12Y0uOI6?=
 =?us-ascii?Q?5dQNH7T+/bfqgSganh2/ya/zAl7xHk810s3vL8oCuL27qvkYwjoZzkUVJSyi?=
 =?us-ascii?Q?b4tIl5FyP7RTInvOsFKIw2T6nNAk11VOzim2P+11qh8dLxWlXumJLZopobZ4?=
 =?us-ascii?Q?CS1+iq4pB9m0ORWkjFmAbu7R8iTSvCUSkhlL9vcWf2/aj+c2ignz/qB5RHPZ?=
 =?us-ascii?Q?ApOzvIChBD3N4gC340+iiTRbB4no9v3vYU3jM1mKyBbrGUqJIQompcWvlE10?=
 =?us-ascii?Q?QWm71mPaZuiIwsFW9iJvzFgDAnJAg4vz7F8gDr97ucEHP1ERxCzCs7nPxt2Y?=
 =?us-ascii?Q?z8YtnkfTvorxJw02lt5ZHMt0PgLIUAWeDdPx0Tk+xDUSToAlDcCEv06AUILo?=
 =?us-ascii?Q?w4sP2v+0JdkA9tiQrDDP0+2LsRzAzF3+DXBAXTaZIpWRarv7S9sAt4ZXv87D?=
 =?us-ascii?Q?Fy0TqPpB/Ct6aXV6ud2NYPjL4O8IEHyQ+48yUcVGN3UEvPyNaZTQ4MATeFJV?=
 =?us-ascii?Q?en2vruNvm7Trh1H6S9oQhKR2mYiWxEB2Re2YQzzIiJBvL0sO/UBENVcab5Xc?=
 =?us-ascii?Q?juPi/FB/hLgY+ShMxLn+d8XcgCnaoyNmI4DwdYqLy8vTgHntksDPqGDGoXsQ?=
 =?us-ascii?Q?o6RvhY6BHFXIQReJL6jgGKT8E/s6PKcyzqqQglELt03jiR9HKFIhS/3NCU+V?=
 =?us-ascii?Q?z9M60npLSrs9PMm4gCY6MlbToBzTZ8mnWnAuCyQLhlDlNTGCEd23r02QtzO9?=
 =?us-ascii?Q?snhqLFw18BGT7NIEmmv3Qnspkdz6rhHAWa4RhuGpZEHLj68+AaiuWB9DbA/y?=
 =?us-ascii?Q?TW3rHgzjOXde8ZSQLa+WUhZ5yhuThYr3o3oLk6jVigGUP+0sqZMLRdWeNRkE?=
 =?us-ascii?Q?yo23fwBpZR/y2vI6ZM10kgvt8H0nS/EWcNIPYywZxmkM8gzGiAHxeSFPT4Yi?=
X-MS-Exchange-AntiSpam-MessageData-1: A/QM6CFKmxcqpQ==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 771254e1-0e66-4e18-fe66-08de6b8ac910
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 05:34:56.2437
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8X1spuBCWOlC9E4DY4sSANnLr2ZySXENmH6HNIrCxtSFRlLcJXudV5Ees5d67MUZNEytXOU8HUjTEdZ5SCTWyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1781

The current macro have

    dma_read!(a.b.c[d].e.f)

to mean `a.b.c` is a DMA coherent allocation and it should project into it
with `[d].e.f` and do a read, which is confusing as it makes the indexing
operator integral to the macro (so it will break if you have an array of
`CoherentAllocation`, for example).

This also is problematic as we would like to generalize
`CoherentAllocation` from just slices to arbitrary types.

Make the macro expects `dma_read!(path.to.dma, .path.inside.dma)` as the
canonical syntax. The index operator is no longer special and is just one
type of projection (in additional to field projection). Similarly, make
`dma_write!(path.to.dma, .path.inside.dma, value)` become the canonical
syntax for writing.

Current `dma_read!`, `dma_write!` macros also use a custom
`addr_of!()`-based implementation for projecting pointers, which has
soundness issue as it relies on absence of `Deref` implementation on types.
This commit migrates them to use the general pointer projection
infrastructure, which handles these cases correctly.

Another issue of the current macro is that it is always fallible. This
makes sense with existing design of `CoherentAllocation`, but once we
support fixed size arrays with `CoherentAllocation`, it is desirable to
have the ability to perform infallible indexing as well, e.g. doing a `[0]`
index of `[Foo; 2]` is okay and can be checked at build-time, so forcing
falliblity is non-ideal. To capture this, the macro is changed to use
`[idx]` as infallible projection and `[idx]?` as fallible index projection
(those syntax are part of the general projection infra). A benefit of this
is that while individual indexing operation may fail, the overall
read/write operation is not fallible.

For migration, the old syntax is still kept for now.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/dma.rs       | 107 +++++++++++++++++++++++----------------
 samples/rust/rust_dma.rs |  18 +++----
 2 files changed, 73 insertions(+), 52 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 909d56fd5118..2338dc6b9374 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -461,6 +461,19 @@ pub fn size(&self) -> usize {
         self.count * core::mem::size_of::<T>()
     }
 
+    /// Returns the raw pointer to the allocated region in the CPU's virtual address space.
+    #[inline]
+    pub fn as_ptr(&self) -> *const [T] {
+        core::ptr::slice_from_raw_parts(self.cpu_addr.as_ptr(), self.count)
+    }
+
+    /// Returns the raw pointer to the allocated region in the CPU's virtual address space as
+    /// a mutable pointer.
+    #[inline]
+    pub fn as_mut_ptr(&self) -> *mut [T] {
+        core::ptr::slice_from_raw_parts_mut(self.cpu_addr.as_ptr(), self.count)
+    }
+
     /// Returns the base address to the allocated region in the CPU's virtual address space.
     pub fn start_ptr(&self) -> *const T {
         self.cpu_addr.as_ptr()
@@ -670,6 +683,9 @@ unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
 
 /// Reads a field of an item from an allocated region of structs.
 ///
+/// The syntax is of form `kernel::dma_read!(dma, proj)` where `dma` is an expression to an
+/// [`CoherentAllocation`] and `proj` is a [projection specification](kernel::project_pointer!).
+///
 /// # Examples
 ///
 /// ```
@@ -684,36 +700,40 @@ unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
 /// unsafe impl kernel::transmute::AsBytes for MyStruct{};
 ///
 /// # fn test(alloc: &kernel::dma::CoherentAllocation<MyStruct>) -> Result {
-/// let whole = kernel::dma_read!(alloc[2]);
-/// let field = kernel::dma_read!(alloc[1].field);
+/// let whole = kernel::dma_read!(alloc, [2]?);
+/// let field = kernel::dma_read!(alloc, [1]?.field);
 /// # Ok::<(), Error>(()) }
 /// ```
 #[macro_export]
 macro_rules! dma_read {
-    ($dma:expr, $idx: expr, $($field:tt)*) => {{
+    // Compatibility for old syntax.
+    ($dma:ident [ $idx:expr ] $($proj:tt)* ) => {
         (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-            // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
-            // dereferenced. The compiler also further validates the expression on whether `field`
-            // is a member of `item` when expanded by the macro.
-            unsafe {
-                let ptr_field = ::core::ptr::addr_of!((*item) $($field)*);
-                ::core::result::Result::Ok(
-                    $crate::dma::CoherentAllocation::field_read(&$dma, ptr_field)
-                )
-            }
-        })()
-    }};
-    ($dma:ident [ $idx:expr ] $($field:tt)* ) => {
-        $crate::dma_read!($dma, $idx, $($field)*)
+            ::core::result::Result::Ok($crate::dma_read!($dma, [$idx]? $($proj)*))
+        })
     };
-    ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {
-        $crate::dma_read!($($dma).*, $idx, $($field)*)
+    ($($dma:ident).* [ $idx:expr ] $($proj:tt)* ) => {
+        (|| -> ::core::result::Result<_, $crate::error::Error> {
+            ::core::result::Result::Ok($crate::dma_write!($($dma).*, [$idx]? $($proj)*))
+        })
     };
+
+    ($dma:expr, $($proj:tt)*) => {{
+        let ptr = $crate::project_pointer!(
+            $crate::dma::CoherentAllocation::as_ptr(&$dma), $($proj)*
+        );
+        // SAFETY: pointer created by projection is within DMA region.
+        unsafe { $crate::dma::CoherentAllocation::field_read(&$dma, ptr) }
+    }};
 }
 
 /// Writes to a field of an item from an allocated region of structs.
 ///
+/// The syntax is of form `kernel::dma_write!(dma, proj, val)` where `dma` is an expression to an
+/// [`CoherentAllocation`] and `proj` is a [projection specification](kernel::project_pointer!),
+/// and `val` is the value to be written to the projected location.
+///
+///
 /// # Examples
 ///
 /// ```
@@ -728,37 +748,38 @@ macro_rules! dma_read {
 /// unsafe impl kernel::transmute::AsBytes for MyStruct{};
 ///
 /// # fn test(alloc: &kernel::dma::CoherentAllocation<MyStruct>) -> Result {
-/// kernel::dma_write!(alloc[2].member = 0xf);
-/// kernel::dma_write!(alloc[1] = MyStruct { member: 0xf });
+/// kernel::dma_write!(alloc, [2]?.member, 0xf);
+/// kernel::dma_write!(alloc, [1]?, MyStruct { member: 0xf });
 /// # Ok::<(), Error>(()) }
 /// ```
 #[macro_export]
 macro_rules! dma_write {
-    ($dma:ident [ $idx:expr ] $($field:tt)*) => {{
-        $crate::dma_write!($dma, $idx, $($field)*)
-    }};
-    ($($dma:ident).* [ $idx:expr ] $($field:tt)* ) => {{
-        $crate::dma_write!($($dma).*, $idx, $($field)*)
-    }};
-    ($dma:expr, $idx: expr, = $val:expr) => {
+    // Compatibility for old syntax.
+    ($dma:ident [ $idx:expr ] $(.$field:ident)* = $val:expr) => {
         (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-            // SAFETY: `item_from_index` ensures that `item` is always a valid item.
-            unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, item, $val) }
+            $crate::dma_write!($dma, [$idx]? $(.$field)*, $val);
             ::core::result::Result::Ok(())
         })()
     };
-    ($dma:expr, $idx: expr, $(.$field:ident)* = $val:expr) => {
-        (|| -> ::core::result::Result<_, $crate::error::Error> {
-            let item = $crate::dma::CoherentAllocation::item_from_index(&$dma, $idx)?;
-            // SAFETY: `item_from_index` ensures that `item` is always a valid pointer and can be
-            // dereferenced. The compiler also further validates the expression on whether `field`
-            // is a member of `item` when expanded by the macro.
-            unsafe {
-                let ptr_field = ::core::ptr::addr_of_mut!((*item) $(.$field)*);
-                $crate::dma::CoherentAllocation::field_write(&$dma, ptr_field, $val)
-            }
-            ::core::result::Result::Ok(())
-        })()
+
+    (@parse [$dma:expr] [$($proj:tt)*] [, $val:expr]) => {
+        let ptr = $crate::project_pointer!(
+            mut $crate::dma::CoherentAllocation::as_mut_ptr(&$dma), $($proj)*
+        );
+        let val = $val;
+        // SAFETY: pointer created by projection is within DMA region.
+        unsafe { $crate::dma::CoherentAllocation::field_write(&$dma, ptr, val) }
+    };
+    (@parse [$dma:expr] [$($proj:tt)*] [.$field:tt $($rest:tt)*]) => {
+        $crate::dma_write!(@parse [$dma] [$($proj)* .$field] [$($rest)*])
+    };
+    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr]? $($rest:tt)*]) => {
+        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]?] [$($rest)*])
+    };
+    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr] $($rest:tt)*]) => {
+        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]] [$($rest)*])
+    };
+    ($dma:expr, $($rest:tt)*) => {
+        $crate::dma_write!(@parse [$dma] [] [$($rest)*])
     };
 }
diff --git a/samples/rust/rust_dma.rs b/samples/rust/rust_dma.rs
index 9c45851c876e..b772ada2c65c 100644
--- a/samples/rust/rust_dma.rs
+++ b/samples/rust/rust_dma.rs
@@ -68,7 +68,7 @@ fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, E
                 CoherentAllocation::alloc_coherent(pdev.as_ref(), TEST_VALUES.len(), GFP_KERNEL)?;
 
             for (i, value) in TEST_VALUES.into_iter().enumerate() {
-                kernel::dma_write!(ca[i] = MyStruct::new(value.0, value.1))?;
+                kernel::dma_write!(ca, [i]?, MyStruct::new(value.0, value.1));
             }
 
             let size = 4 * page::PAGE_SIZE;
@@ -91,17 +91,17 @@ fn drop(self: Pin<&mut Self>) {
         dev_info!(self.pdev, "Unload DMA test driver.\n");
 
         for (i, value) in TEST_VALUES.into_iter().enumerate() {
-            let val0 = kernel::dma_read!(self.ca[i].h);
-            let val1 = kernel::dma_read!(self.ca[i].b);
-            assert!(val0.is_ok());
-            assert!(val1.is_ok());
+            let result = (|| -> Result<_> {
+                let val0 = kernel::dma_read!(self.ca, [i]?.h);
+                let val1 = kernel::dma_read!(self.ca, [i]?.b);
 
-            if let Ok(val0) = val0 {
                 assert_eq!(val0, value.0);
-            }
-            if let Ok(val1) = val1 {
                 assert_eq!(val1, value.1);
-            }
+
+                Ok(())
+            })();
+
+            assert!(result.is_ok());
         }
 
         for (i, entry) in self.sgt.iter().enumerate() {
-- 
2.51.2

