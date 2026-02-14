Received: from LO0P265CU003.outbound.protection.outlook.com (mail-uksouthazon11022100.outbound.protection.outlook.com [52.101.96.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9FE327B32B
	for <driver-core@lists.linux.dev>; Sat, 14 Feb 2026 05:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.96.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771047318; cv=fail; b=Tg5MNz0Xs+AsNdghzbzejzJXtwpJZTP+QR4QtHRUZCr9EcWQnjHBmTztwI00Yr//nEwPz/RT7ME6nl+VpI8nIJjZQ3IiMXcj3FH0BDGdN5eoFtoKy+fKQMnIJTYx69KixJJTdwowZiVvjUS9PN7P9tw55j3mdM6QRaiA7rcmj3c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771047318; c=relaxed/simple;
	bh=yjFWtdCD0obdcWXukpNC+UHO548WwMu5kFzEwFOgTO8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=evt436Tmf8kTefhJrWdMsZXsmDm1gzmzh5nlGqszjLgtbQvxdJzTB9zw4IjW3q4HPGkm8aCux4JivTF2O3NTn3UNQtIfDdzu3HqSwznLUWo2jkZEmTqPMzz4TzO/rK8jyu4OAWCTc2Pullu3b1jCnCUGzH3tVi9M56z28n836Xs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net; spf=pass smtp.mailfrom=garyguo.net; dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b=mJi7HByR; arc=fail smtp.client-ip=52.101.96.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=garyguo.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=garyguo.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=garyguo.net header.i=@garyguo.net header.b="mJi7HByR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fIc8XC01L9tjPLMdzhTnVrFiKNn94MXgDtK4ZNxxs04JADGanam7WQWdyABean5tPH0617ysyDsJ3oCGlewWLLZbrRFhZ456xETb84Uy05U/UtpXEIBHUW2uBtrhbQPhwlzWGhvRGYxnpFAKgKUlIsAnpnaU5iHyf44KlEnD3MPd8iqwSgQFr+1y/Xj7N9MpRtj4jRzdY7KzvtsYEXjgt/w7yhHiEdXUiTBRgngIXTxeBQfuJOPzmfyT2HeFQBUe0evPPCatVMYjfGVxvTO536YvV9zD6fkHPD8/LAJYifKMmwoSYl8qnpOyf37CYF+wdZmVyJfqUZ7vJSg/Iv4Tmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0SQYRwVhPj3ApzaMCIbnmQEudLYqR8epCg3gT/a8YEE=;
 b=tzvSquB2xIC7PdKQdoM26PlU5Pbgg2E7FbjGnwyJR8tyFkSRipWmwpIELGkDPx62qehgIqYoyqOAu75PImMXo6Dg2Nyv2gn1nMP3AT1c3PJrZ+efOvP09rv0IAu3a/U8IC/03Q7ueDXqkx/w5TJzUzAe7k6AFyKy60v2Kon2GaFAWt1myA0V1atjqFhzzk2uQPDs+NNjggt2QB8uQgB8sZoyXRk/VG5esK/EwlvpiGsTa+l7d2wRyTJ+fRZ+hRt+IglsPiblG9cJJ3X/8wNsWm4ly7ussDjffjX7rDWIcft0D0PqVGuE4upQ3DTWFXJ/JhNhyT1P5ItXlWB7zoMYEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0SQYRwVhPj3ApzaMCIbnmQEudLYqR8epCg3gT/a8YEE=;
 b=mJi7HByRqqEV9h1G7l2XkAEZHfx/llseXz8sofOW7OOX4nDgEpwJcHp75MgGGpaezNucWRocaewS3WA494zwO4a/ec6FDINwsiwOqPon/cJkhC5CgoSyuK8Ow/RvZRuiUDL0phk/pr0GtGCZf201oMJad/ittOB5Yltc/Pa0xSE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by CWXP265MB1781.GBRP265.PROD.OUTLOOK.COM (2603:10a6:400:34::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Sat, 14 Feb
 2026 05:35:14 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9611.013; Sat, 14 Feb 2026
 05:35:14 +0000
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
Subject: [PATCH 4/4] rust: dma: remove old dma_{read,write} macro compatibility syntax
Date: Sat, 14 Feb 2026 13:33:41 +0800
Message-ID: <20260214053344.1994776-5-gary@garyguo.net>
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
X-MS-Office365-Filtering-Correlation-Id: 742d17a9-f4bf-4982-0fed-08de6b8ad44c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|10070799003|366016|7416014|376014|921020;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?0roYF/YCW4GkFOyuyQBj8p+aBrl+Cn05HLTCg7dS0eJAEONtjPRBPj/laJsd?=
 =?us-ascii?Q?ELc5cpz/rxBHvZV2S/qW1MyWhj+Hw065XbTBUP1AP0vuURuGWIv+oOqEiqhO?=
 =?us-ascii?Q?sZ7WfrBRyH41PkJGNgH+leThw8Cvx47S3Gvjlax17FHfuPCbQkuylP/X+ud5?=
 =?us-ascii?Q?1mjZNFfDhHBiioxoFFWH8bLXX6/pR4oHAM8x4T3RJOvGOrPwihQBs702WbWW?=
 =?us-ascii?Q?koHIraEBQxK5eCK80u6iI7ZvolP7el7NQDRQvf3Thrg0vAF3Yd1v4SoCAtgV?=
 =?us-ascii?Q?CRD0XMKDtS3F0zzOaTurA8Ct3fkafHmoNO7pzcIl6Rh3Si1l1L7AM0uts5fA?=
 =?us-ascii?Q?lIq6BU2UMaIUTwPEWnpPSIALluhj0FAex1fjcTx7wwyLC7Iv6Jo6fJ7Y7UKX?=
 =?us-ascii?Q?Nq3tQrDJ14IweNCuQeDuRgVnynj68lnAZU+l52tyAfFv1ueTYDFak61SXvA+?=
 =?us-ascii?Q?qXEGkVLBdFDmdCFjJPurjKSjQfXQslfl9vySh1LqVbUfv2r5Is+zLeWZJ7YR?=
 =?us-ascii?Q?OTstN83iRr3mlYQT3/qDfoTybz4K5LeTB10igcpNzmEREY9wi9/hcPK+qp8B?=
 =?us-ascii?Q?tknMO25CtLLNwiYi9a0QkcyEfNZKpk3GMRZjHtZDiahDt37TeTXg0OZpDjUT?=
 =?us-ascii?Q?RDXnSphMmeroxZlrbbBjAnUdRzw4DkdL51EcW38yqgIsdj6cionYogovq09U?=
 =?us-ascii?Q?506mjS6BOCqgmRNruJ5t1Bw+4C1mUD2+5HfenEt9BWK+hYh30VF4zozkFZ7e?=
 =?us-ascii?Q?jSMXrWh3dLZskfjI5EpLsLLGSlQ0EL/eXZOj9CO7xnWf8oj5llOW5MvLeklE?=
 =?us-ascii?Q?yyfE22v7SHLO21+l+4hZwEWvz+5pkj1/M8G+uN8UpRY3j/Q1VlGRPpIfojIe?=
 =?us-ascii?Q?CuPrXjTl1XAZ3LZTrIq9lj7fXuhLx5ohZuusmXdK18O8RUcHdXaImcaiuphY?=
 =?us-ascii?Q?UMHeGq0dlSKtjeDFOqvu3jAVG1X/AxAGzbx1OQVO/g8lxZuVcGPO/RVsWvzG?=
 =?us-ascii?Q?kg7o9U+L2Taf+VnUmjj6SFc0XwOqp/F4Mqk9OnXbPAx1bpPVVy1ZV/tF0Na9?=
 =?us-ascii?Q?DFhEw+Et9Y1JEyU2q0jPOyY5lTQEW8hFcnm3Ek1Cj1vgUqUqZ1+v0js8ow/t?=
 =?us-ascii?Q?r+ahfsO1eVcOL1O7r2feSKMqtlEAOIZGMAQMmF4YvgQYcnCrYK5P8/g5aJwM?=
 =?us-ascii?Q?udb2pHYnYOgU+LCcAvVOoVHkBoeLpyNpF9BqdNg7AolT+fgJhuYRZvMXBVY9?=
 =?us-ascii?Q?973HpmNAD+0MoUXAWTLHEVe+8IbBKRTfN1cXQiuHEAQ20gZaxljZ2iRZhlSZ?=
 =?us-ascii?Q?T92whUZrjrqIEDmKAP6QWAggNDwZcgsckUgNyt4uDxx3SDjQ2JI4EnZS96o9?=
 =?us-ascii?Q?ifUN7Nn1G1XxWz/aWvAn9sxCIymnvxT1P4XB8roKPKdrAH1h3IvFJKLpu0o5?=
 =?us-ascii?Q?unVTgQnRNy/I1us1iBeTMzoeF+K5QqTsHCNAcitSAEuaC8v8iB/JKnsGiqNa?=
 =?us-ascii?Q?YV0ASAkdZsoLkVCnzcXIfhBo86k4Yp53h2RxY5IOHKlMU++5IEmcsXkYyuil?=
 =?us-ascii?Q?RCJVJZUS5hOvIsYjAi+1Qe/9JPtWZCG4Ot8HRM0bFdMcCfmB/jCUhZM1i2BC?=
 =?us-ascii?Q?UQ=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(10070799003)(366016)(7416014)(376014)(921020);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?fNAySMlfdFMBflD2r+A8LiXv3XeUDpYcGO+l7sGWgaeeQsNilLBs9KRpw4hR?=
 =?us-ascii?Q?P1rU2pq4TcMjPfy7pz+AiWDrO3BINLBtvwyTubwcTkVzoyEu0NkETIiodCDQ?=
 =?us-ascii?Q?LWwdqPHXQexrWE6YvRm4ozQ7JnNQArwN/9yxYRHP3MTsL/bVnpmRVx+Ypojd?=
 =?us-ascii?Q?OLrlOzsoIenSn9J15P5DteZeAs5L5aLIEVedMyLspmPE0kQoVPfuHnDxHQOD?=
 =?us-ascii?Q?7SGfnImrOPgbcc+EaDdB7dcrme0Ph3CS8OEotutxxma1ONGzuKjPNcs8jkay?=
 =?us-ascii?Q?yPBusXL4qlIiocliCfANkeT8DzKN9/bo+zOiCayDILjULw1c1cB7yTcz1oED?=
 =?us-ascii?Q?lG/LQkl1s604RSbPiHvhvtNkmlepFVd2TwUMq8Tc0NcG2fSj+1caZt+0BPQI?=
 =?us-ascii?Q?2f97ziDzaGVo1INw4uUpTthnN5O4CHnaI+pC4EuJy34qfOuC341TG4X9KNc0?=
 =?us-ascii?Q?YbunXw910QXPPSsNfRQQSonQUIShF+LJorUwMvgg6KKdnUuaE1rYETKk5fDt?=
 =?us-ascii?Q?WC/ufkrUMDQSwER8+2ezia3DxIzgWkZymvXsDxQy0e62GrUjCC1DKjXlrqLM?=
 =?us-ascii?Q?K1lKiIk7xjiz2zrj64HV+X6BGFdX42QOYW54VFhm4N20AlYPOT+7GQmpqa9Q?=
 =?us-ascii?Q?VstNOqqCnSSnmGdXw/fEhk+p64NYjuk6nClU3qzeksAfHteqZPF2QaCyzl7S?=
 =?us-ascii?Q?NPHUe1rEpkJ2L6A2/fTeAmguLgceW8IaBkx8UF2te+iIzbElNTgdwo9o6QxF?=
 =?us-ascii?Q?HXRy2AQ+kWJevUg+eCkBa/trZwTeUzthjPPE62tjyixAtqC2JvIwi29iafeE?=
 =?us-ascii?Q?HD1rqH9DOWqu2mO5VNJsFZUa876KF/ADkIa9A9RgQCNU2Fou6afn3BRJ4tLY?=
 =?us-ascii?Q?OupdYeksWraEVOEu39Fsiurb67RmclHDJbqvWX4VfDpa/Sk/ISP0gVINqcTH?=
 =?us-ascii?Q?5dyaHmlD7hiV5S/xWipXz5v7YXqGQZ2vMmwENyhuW1sR9jud65zjXLlRuTbg?=
 =?us-ascii?Q?oA6/VAkGD9/L1nnQzELiuIeNfzIqBLmWdalQY9MvGcIJnrGoc/g0pAgCEv12?=
 =?us-ascii?Q?+me2gaLKkkm7UfIg+d/U/r1IBTSmRr0LHTdpSe5SmIis+bY1PBKPgITHwVir?=
 =?us-ascii?Q?VpFCuRfYRZ/5H9Sh5DpyrkeoSBQkGCm0iCHzt/BfW2i2DD7gnl728gwrySOl?=
 =?us-ascii?Q?k6HP9xNROp0hrufwc8fcv63rdWdqzw77dm/6p9kqK7JlpI/RIYLavjImy/oO?=
 =?us-ascii?Q?ErPRysoFxqmYlbw8mUScp9Li9GS5aqWXJq/2GPeM+dFT8CLJvfhbNqABpFt1?=
 =?us-ascii?Q?DzAuuAWjXja0Dh8kdqNtbjzOTkz69LytJm+n3lzPeP7vfXmt+vYlk3ttYXu7?=
 =?us-ascii?Q?aXYciaKYpkrYvnW9d/TlSGqVxTB4InwU6LJnRfhhJnziKtP7yrJnfI/traAZ?=
 =?us-ascii?Q?+BdyucYvhtq4oQzXqhO+u6aCPfFRQ/e8K6ka9ZKqqfBPINUbKIZrvHoTl8MH?=
 =?us-ascii?Q?z5Y8enzt+D1iBvN27oiZbv0X3vqg3r4CxXmuX6ukE2t1lpoLvb7GhAdbxsHr?=
 =?us-ascii?Q?h8cM0k2d8xkFVcV5T9ZPc5cSif3fMDyg7KwVlpaTbEEr4weS5+QsZBwEZMYV?=
 =?us-ascii?Q?N4xfqC5loWluk5KiS6lsHLc45/3iQhKrWtPXz1KspGBS1V0H9fVfTIChNOZw?=
 =?us-ascii?Q?lF1ExaaUsEtsposkbVgxZApuhVzMIcfSYnhtrzoG06nY7fNAg2LtLA0T6s9g?=
 =?us-ascii?Q?yFUslyAN0oO5G8bVGlZgNg27zDECeeCYLv5Fhr5qi83K6PbEDlhMpNxiEJ32?=
X-MS-Exchange-AntiSpam-MessageData-1: HAW1gjWKovu4Zw==
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 742d17a9-f4bf-4982-0fed-08de6b8ad44c
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Feb 2026 05:35:14.6415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yKmguznZQO//SbW765nKtV0c5zMEVywBFq2M/7Sztq+u07gr8WqgCQ1AwHio2K+yHEgwX1WekDYUWrhg69JgWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CWXP265MB1781

With users converted, the old compatibility syntax can be removed.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/dma.rs | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 2338dc6b9374..f55033264849 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -706,18 +706,6 @@ unsafe impl<T: AsBytes + FromBytes + Send> Send for CoherentAllocation<T> {}
 /// ```
 #[macro_export]
 macro_rules! dma_read {
-    // Compatibility for old syntax.
-    ($dma:ident [ $idx:expr ] $($proj:tt)* ) => {
-        (|| -> ::core::result::Result<_, $crate::error::Error> {
-            ::core::result::Result::Ok($crate::dma_read!($dma, [$idx]? $($proj)*))
-        })
-    };
-    ($($dma:ident).* [ $idx:expr ] $($proj:tt)* ) => {
-        (|| -> ::core::result::Result<_, $crate::error::Error> {
-            ::core::result::Result::Ok($crate::dma_write!($($dma).*, [$idx]? $($proj)*))
-        })
-    };
-
     ($dma:expr, $($proj:tt)*) => {{
         let ptr = $crate::project_pointer!(
             $crate::dma::CoherentAllocation::as_ptr(&$dma), $($proj)*
@@ -754,14 +742,6 @@ macro_rules! dma_read {
 /// ```
 #[macro_export]
 macro_rules! dma_write {
-    // Compatibility for old syntax.
-    ($dma:ident [ $idx:expr ] $(.$field:ident)* = $val:expr) => {
-        (|| -> ::core::result::Result<_, $crate::error::Error> {
-            $crate::dma_write!($dma, [$idx]? $(.$field)*, $val);
-            ::core::result::Result::Ok(())
-        })()
-    };
-
     (@parse [$dma:expr] [$($proj:tt)*] [, $val:expr]) => {
         let ptr = $crate::project_pointer!(
             mut $crate::dma::CoherentAllocation::as_mut_ptr(&$dma), $($proj)*
-- 
2.51.2

