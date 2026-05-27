Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011024.outbound.protection.outlook.com [52.101.57.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B95B404893;
	Wed, 27 May 2026 12:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886347; cv=fail; b=dSe+tzA21sv5ZkbK3wm9QiJbH6nPUpy2ftapOl4d66vtPWqf7OP2fgMK1jxYcFH1YLGTtCfJq4e3Mz38zoBf86FTL/seSxhC0k98CeHw0ZwHjEgGg17/GsGfINPwzxxHUXQwKN37SywlcbFPrVwB7mOo3ZWGNSRqwNyFewI5Rj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886347; c=relaxed/simple;
	bh=BYSz6PK/WtLF5Nxhs1/Kjv7MZmSmpaipGBucRTHC2EY=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=XOqlsvksSJ0jXsmZBQ7F5LBVsiBJjfLgq13qxAYMgCSzB6gSMDwYJRFW9t5Av8bv5HbKXOjRTReMDlTvE6VwPn+Qsq4YMlfzK4AFSCpMnuUFKo+Hz9JLZTNDnuzLRlj+/fQ7L9XoTi5ZKaIMZIJWUZmYsk9T41ELwlqHNPNggE0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Nnopslpq; arc=fail smtp.client-ip=52.101.57.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Nnopslpq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riu+qWaSo8kyAaC7mkewm7uYDTjVtaEOSXXxWmUnX6R2PZyD24YCTvPtLZJk1BL8udLbtA6mbVJOGdSeeuTErB9WNKBFv0jwgJel7/hJNCyGdCol2CFjRk3VHc5Vh62QbD3LQvq0B88K6TgbU9ajpTkLB4FgrfmbLmt74UQyCOeVjKFE2KVTqItw07FMh4GRhwcIhJaKhmu+MiXZQr/STdISukIowGTC5WndB6jH0MsK1GK8o21cjyiovQ5kPwOcOkvCFL6ItIYP+Kkb5Uynsz6tHBsB5zDxjVS8QL1XWTA4K5lfLwXXas5n7OYfLqLULZuEGyR76cYDhcdDOgdKBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QONApSvRuIUE6+OYVViTmpj2A00BUVh/xSHPRZ3a8Vw=;
 b=Gg9VGXmWZK25q9to37u73czx/rjHTqsuqCqnfGv/d7ENGLdNyzHpfLpGZNIkXlmvFrhqkvLGOcfNvLgnigxe0USZOQQKrgAdfbMOxEDpumup4X7clpfG97ALzP26JSM1eJr4kYw61AIL54tUqCEdMevMQL5LkEREos08kcg2jAwiPBtIkP/GNuKFh2CKi5ukiCbl47h2oW4QvfqrQ7f5/9amTUkxTtzROglRPJQ1bQFl/sAzOg95rsg/nIHu/XdUxm/NM21qh+/JxSgYkONzu0w5DJNYkdwMfkEFK5He0PPUDHqfAB/BW1/A2MDOKSlrS+AjyIlyQzidO9dHWc+h/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QONApSvRuIUE6+OYVViTmpj2A00BUVh/xSHPRZ3a8Vw=;
 b=Nnopslpq8oz4i3fPucHPaM1yJ77eXYEsuzZUc7C/BZwAuR2wrDcoIdZN3TNr0QdhhVMqE3OcAWc8OYzRjbK32gqEB3VdjMIB2QCvPnPGP15D6mKYYQn+0f6xDzo/dRL0dY7TWTN6SZt0HEUV9j4IRkuu0blNz/faemGdnk3xvD1L3XCRwS9ZCeeZj+Ku16JlDDS4MQ4DN+iKqeIYBK1HIwv8TWEw2yccYQe/TarMORx18p1sW0XX1dKzp1h11oZxDSjNCkm4hQX19V0PJISuSu9NWubue2wvW1RB2Y2ijQy1L4aI+2vbLqp6oy6rPGBwG1y22L1e0O+z6om9GK0NJQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 12:52:18 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 12:52:18 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 21:51:57 +0900
Subject: [PATCH v4 3/7] rust: bitfield: fully qualify types in macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-bitfield-v4-3-e8821d4efbde@nvidia.com>
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
 Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY6P286CA0017.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b9::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 27c395b0-962f-4d21-2ab6-08debbeec905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|11063799006|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	WMKJ5sxVCM705IhM63rtK8Lc2L0sqcgj/mvfW0TTBoY82p9apiWu+P+nhny83ShMS86977LbKbGMCXfkc7Cc8cotjCjq7zG1LbQ/gsm/xRj9E+90/v9nF/IfNh9cazHQhMBqJSDm2bwpHSHClty2Sxrn58fLd0Vnh0JuqReHE2d0xo5fsEU+D8cua2ENXp7aAaIgmHFEuMbufdSZue59gjiESknPo5MryNkfb6Evypyl33xAMit1Fjx3Bdlm1KpNk/HGNbpbBXBUDM33As7RJxiKIsDPrg+Nz+AfbdDj9cbAQm6N6rLmJqmsLC4QOAEkSkFqb8ZJGnkWDYVRQn+QAO28gqmdFbm1ETgUQjU9kxBGGtlpse9vkmU+VNp3ddPvtRNyvGMdWUoZhHsqjM1l2Ceg6RWG9OTNHj6wJq0HxIO+nruiVj3AiE11hgE4P3VIRD+Gnpj4NVumNpD+q5PURsBQ9osl6YGJankxfp7kkeU6FgMVTKcyklwsW1YFTeYF4oIy6Ex0J92dM0jDgqT+0VI4dJjOd1eNVfEJ3gHUAI3VB12QZQqSB0XN/4+ajmTxuIhnVBIhiYTuhVSRGb7D+a++9JUcsOAASWTayumLJzMb0uXcFVad0uP2EyRWreYcboi2he2oPk0mUcMI+fkL1X8Iulr+gxbbK8pGNZV2K6wKBYApU6nq3t4nM8uodFyM1y5q2YnCH9vjNPdSlxUax9VGC1I1Ogf8Yn/AurvclWw=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(11063799006)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S3djRnlGV255REdlc2l3SWZyUnQ2UzB6aFlVaEVhWTI5MGdna3hnOEV4dzBL?=
 =?utf-8?B?UVhVeWhlSTNUSzNqWDlPVlZEK3VyaitsQi94V25oSlNaZW9kNTdCSnpDUWV6?=
 =?utf-8?B?MDdVN0tEZG5VdUZQMlBlaVNIVStycVBGRnpGdXpGczh0bmYySTZOLzZkbnNu?=
 =?utf-8?B?aTkyTkpybGVHd0d4azBuQnFiWmN4bjZ0bklVOXlpaVlvQm92U0M4YzRZR1VO?=
 =?utf-8?B?amY3a3RSbWlOZXlueFkyUU1VdHNRZmVEbXZ4dzVJZm1PaDNJcHl5SjBHNW80?=
 =?utf-8?B?S3Axd3NZTjUzaWpXUkFhOWZYbzNyd1Y5d0dMOUVPNTdMVHVqblpHaTBYemFm?=
 =?utf-8?B?UE5UUEwrZmRZRmxGV0pkVmFrT0srVFZXL1lDMlVYZVVtbG5kNEhUSmJOait2?=
 =?utf-8?B?dCtwbHE2Wnh1WkJXbEVMc1A2MG50RExheVFOdmpPTGM4aklnS1JjamgxUWVi?=
 =?utf-8?B?ZEVFczhVRVNZS0R5Ujk1NFl6cU44MHl1bFdLZTUxTTB1RmFKL04yMm1zSnlS?=
 =?utf-8?B?dXVrV1pGVGR6NmtYS1pPNHk2elkyeE95bXYzTWpVc25ZS290UE5QRXB3bGtG?=
 =?utf-8?B?c3pKYmlhVGZObFF0a2ZQWmZ6cU5sQ2l4Vkh3OTRDV2ZWK0R0dkI2SFZIQXBW?=
 =?utf-8?B?UjVGdFN6QXpoNVl1aitaVmJXd0dMZ05rbWU1OGlMeW8xcDZiL2tjQ0tBYkJq?=
 =?utf-8?B?LzNkcldSd0NxUUU1SElwSjRIWHBuY2xPYzl3THkvUVVrVVR3REFFS2ZxMnht?=
 =?utf-8?B?WFZJYk51SXYvL000T3U4T0dUanVxTjFhdDQ2THIwNkFzOG51MkNPeFFIUU5z?=
 =?utf-8?B?dGxwNytSSEYzZ1ozRzl4Vkp4UElaMENhYzFjbS9Jam5wN2RaZnFVdzYvd3JW?=
 =?utf-8?B?RHluTktSQUF2ZkFGYlRDRWhJSUtZTURaVStIdUVQaXVlR0xXMTRLbnlnaERr?=
 =?utf-8?B?eU9qczY5dWlVdW4wQklFSmdCZXlBS1lmci9iYnlwRmZ6bWFnUXVueEN6azlU?=
 =?utf-8?B?NVVFYUc3bzRDZ2owYTFQNGJBZnRuTTVGQTkwS3Q5cVVlcTlPV1JYVTFYTm1P?=
 =?utf-8?B?SDB5V1E3NDkvMjBnT3BhL0JtTUlzaXROU21RR21rRHlhaHRkcUp2OXd1WEdz?=
 =?utf-8?B?UGtIcThNcDQ4dDhKSE1vU2UxdmRlVmF6dm5LaGhwWXhUekM5aE1qMWJOa2J5?=
 =?utf-8?B?VkpZSU9rRGZ3QTJ1SUdjRnJhc0F2ZEI3SVFia1VoNGFvbmlhUUJqd2lQZ0V0?=
 =?utf-8?B?cUNIN29OUTh5SlRTNTBQWVdSb1pWeVFMVnVlK0ZJc0JEQ1hYbHZGVVpXQ21x?=
 =?utf-8?B?WEdmOFNtcDdqQTVwM1RlbW8veEZhNks4Zy9qRmZReFJwVTk3YTdDNWQzS29n?=
 =?utf-8?B?UXJvYzdYOUtGQkdkdFlCaUoySHJ0Wm1vOXNpeWJpZ1RVK2FDYjZyQVBZQXBx?=
 =?utf-8?B?MVAvcGRSeXQ4cTNQZ3YySE8wNm1nQ3Q5TzdKMWxHRE1mTFJsSUFJeU40Nndr?=
 =?utf-8?B?ZVBEV0hQR3htMDRMbnFDR0tQaEtSNzNTQ0ExNEVRRTFCVm9mQ2JUeUpMeE9j?=
 =?utf-8?B?Y0d6SlZkMWpPaDVMYi9nZlBlaWVkRHlsTUVPRmZySmdGWHZsOVFsY3dJM3p1?=
 =?utf-8?B?bjd0U2xyVXFUUWZVUktwUE04eW9XbFoxSHkzaXdFTFJIWitWamJZaEZmdWNv?=
 =?utf-8?B?Y3lBVU0zMWpuaGtzR3ZCOUw4bFJCQm4vRWtFQlQ5WkRCS0hnYm56aDNyczB0?=
 =?utf-8?B?ZGhzRnl1WlRWUHNuemQyS0o1Und0R1YrOTA4MjVNaGtkU3BSMnk5U3FUdGlu?=
 =?utf-8?B?Q1VJTXd1VFFzMjBSaXRNM0N5UDZNMmNEOHBTdHoyWkVXbGd3VWxqU1MvM3Vy?=
 =?utf-8?B?TEJZdXJMVWJ5MmtQQ2JVMjd0cG9FZ3dWWlRjKzVkbFkrMWoxckIyZnhJazlM?=
 =?utf-8?B?K1p5eDVJSEwvTE1VbmdjVEJnZkFkYzVIM2x6NmMyQVUzd20wMExoWURxZ0ZC?=
 =?utf-8?B?S3NKbkUxVnBxRHl6QVBMeC80RVZ3Y3JlQmxsR2pGbWZTRkF6Z1NsMGlxMU9t?=
 =?utf-8?B?a0g2azJCeU1TaDRIcVRxVS9kZHZEQzNNSTBtZU1kdGZKV3M1KzUvcWg3Z1du?=
 =?utf-8?B?OHlaSHNKbFpFTjhJbmkyZG9VckFmN1RNN0k1bVZVMkFTTlkwdmU1M2VnWmxJ?=
 =?utf-8?B?Y0VOMTZ2cXFoZXdFRCtESy9MMTI1OWREbDZ2Z1FxLzdELzlEV0tocXJUTU1t?=
 =?utf-8?B?ajlKZXFOTHQwZVBPdWM3c0FGOVZid25pMDE1VCt0TFRnZytXMDVMVlBZKzFm?=
 =?utf-8?B?ZUpETmZTMGwrbExzNWw2UW41djlFUWlVbDBUZWg2L1ltZXhsZ1Z6VysrZU9z?=
 =?utf-8?Q?3cSzDyfXyJMdA9DPhvfcIsQAZb8wwR38Q++TvDCkN5Aua?=
X-MS-Exchange-AntiSpam-MessageData-1: yWTRQmIoPIcK5g==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c395b0-962f-4d21-2ab6-08debbeec905
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:52:18.4989
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6yhk0l8QwAaRj4Ato5wxyPPVswDLyvvNlprDAoVn3RLx6hI+mXo72vsNuEYy/WMCtRMZbrVVF0fdGpf7K/Rryw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841

These types were not fully qualified, which could cause issues if the
local module shadows them.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/bitfield.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index b3ad5fdbfb23..2498107979dc 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -455,7 +455,7 @@ const fn [<__with_ $field>](
         #[doc = "Returns the value of this field."]
         #[inline(always)]
         $vis fn $field(self) ->
-            Result<
+            ::core::result::Result<
                 $try_into_type,
                 <$try_into_type as ::core::convert::TryFrom<
                     ::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>
@@ -508,7 +508,7 @@ const fn [<__with_ $field>](
             self,
             value: T,
         ) -> Self
-            where T: Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
+            where T: ::core::convert::Into<::kernel::num::Bounded<$storage, { $hi + 1 - $lo }>>,
         {
             self.[<__with_ $field>](value.into())
         }

-- 
2.54.0

