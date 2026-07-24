Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010054.outbound.protection.outlook.com [52.101.193.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA567426D22;
	Fri, 24 Jul 2026 11:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784893050; cv=fail; b=gRcwSLuiQSuyIj0f0c8OYA51zE38cEMGjhQEwpzWBQI9e6oteUwGKPzyKFHVojCmANdR7ZQRNw3uopEN2CEaPlVQM5tB3hsuFG5n5JqWJQLRTq3JkbMngCpabA5iTK8kbIbf1iXi+GxR+Vqau2iTpxho9rsGmyS2sa94U2GUUKc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784893050; c=relaxed/simple;
	bh=o0F6QujPeOhVNgs2GYM40ClsnGnfI/wSNHM0TjAJRss=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=h+iq26wG34mtcJFUoyyQqVApfG1wMLScPXJ6zja64bss5NyYjEHdseZiffkePb42Jr6Mqx8VKaFUaz5fzY7ZNjmsNom2Zb2PsD9lq458IRFpTO2p4/jCfbU8LqMzdvDVy0SlzgC4CleWHDKWE6fpm0S4IgSlhY5OKSEC6zzJO7c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=WTKcliWR; arc=fail smtp.client-ip=52.101.193.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="WTKcliWR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hKAaMZ1Gq8fKxDiPB+wUD5D4smvOVTT6//dNtS8MAIK6sRdxFdM79xOVC1K1PwuyTb0ghz0IyVss+slx2e7Z88iscw9g9+FDl/6E/wAXyQgWRjguFQ1B/c6I3u7BCMoKhrLCbzAxUx5gwFB2+0M6JhcHrkC/OGRRw929GP3ZQ9DI4WxARWWf+PRRA/VA8wMTFGxIAQwm10Sk4GdvgK38tKePw/yZmzF/cXpNwpFoszhXpacb1kDHjvGbRchKCTRFsE1nO+H/RnUR4GYpiy5/fSgouBhna+O3GSvvfNZ8gq551dmHuL7aLMnUiZ1iytiFFDizbTzbC3hPmE5odctezA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lJAWkVXTn5K2QB31wACPmEB/qhX7I6JzKQAhVgOuREM=;
 b=cFA1mZGAgUt+yyrlLbJH9D1dbi2F0bqtWcIT+/l1x9ZIQgOUx7cso29DmWTgDZCd4WmwAfv/bHh7eszFmZuPudMzHWYLGslJOYRYH4LsHdhetjxtrjKm4sj2GgP3zaTb32vg9PtL/07xUeCyi2fOLIQvjlDL6t99hVwN7SPUG+Jv45QbR9XABXWku4n+jc8GWLSmebFNtS8O/bZ8OVORGtB01ilFmTzRoqleM3OlghydinhjfXeSXi2l9Y5+sQpGycTsVnzMV3K+pBfITu8++xmdamKNyL1FmCwx0pXcV9yK5xm/44eFF6Zcgo6HuDsa/lRG8qWdSVM9PPqUb3Ysgg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lJAWkVXTn5K2QB31wACPmEB/qhX7I6JzKQAhVgOuREM=;
 b=WTKcliWR308e+gWVMFLh0Iumk4l6y1SuYewp8LVILL7zRSUs7s03UobGPQvMCJ/uD5DFn3Wqf9+LrQK7d1HevFaOjtMriZvZBdwBkwftr+AdX/Kjxe/3h0ATlbFJFxztvA40iBHeQNv1GHDvWN8Q+Zkfc0iH4voLZmKMUGuTK4BBQq09hYmkWW6IOLu4ig5Nm0qabv+4vy7GJwvh9wTDjVxmujvaMX0WXd/9b39ByCxmOmt4eD8utruwBFLbzyUHYwt8oIeKmsiuZm8glr/Qx7NrNNyK1j9HYtrWs/Tvnkv6vsCFyE443Ljlitg39F01hhlDZoiRPG8D1COa/Gpo9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW4PR12MB6974.namprd12.prod.outlook.com (2603:10b6:303:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.11; Fri, 24 Jul
 2026 11:37:21 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0245.010; Fri, 24 Jul 2026
 11:37:21 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 24 Jul 2026 20:37:05 +0900
Subject: [PATCH v2 2/3] rust: io: register: remove unused rule arguments
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260724-registers_fix-v2-2-a0fb58b02185@nvidia.com>
References: <20260724-registers_fix-v2-0-a0fb58b02185@nvidia.com>
In-Reply-To: <20260724-registers_fix-v2-0-a0fb58b02185@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: John Hubbard <jhubbard@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4PR01CA0010.jpnprd01.prod.outlook.com
 (2603:1096:405:26e::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW4PR12MB6974:EE_
X-MS-Office365-Filtering-Correlation-Id: 1fc63207-83c7-4d92-5e41-08dee977ec85
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|23010399003|7416014|376014|1800799024|366016|11063799006|56012099006|10067099003|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	vsSBypPvnQ6DkGWpZ2yl+0cwdCp9gDFvgZG8V7EagiIT0cmPU2FBZCOPR4rPhOc17zLQqVHm9v0c/ZqILsPQmU5vDvZZpHO3qN/qwMVU2tL6Jt0EhCWU+X7bv9M+1DFbnxHPIfTg3axBbdqj0tLNSv4xlm7+uI8UP023MZD5kfXeYsJOp+VgZcWlEenJiUyyfHjioF0+eph3RzoEo0hW/9sjwou1khf9egbUDS4tcGgJukdsbEsEZ+dyIiF/4J0as32930fmINE3DG2/MBYIlfeZ/3HTWySsyi0kOwdx+eA3wCt8dkI9VOvBzCvo91UcAh3ToVEiAgJflXOzVMVyFk9i48pZP9azeHDStPUehTOZzRsJEO8wgPahsccvEZg8SQQ8nb7mW9v5I2x43Mj0WuoZSh/mveNFHhuulhmHGsFdd833J8Maq2mF0VsquhZZE7/1V4zMCQSapSdOjoDAWKYjL2SHea4k0xZLESU9W339x6g7v35tKCepcAfOpVMoYfUqvKaBYpdM4YFUSO01FyeYtjI0WlH1//iwa6vw8LnHcYFlmERuC9kTZkZh5gpJKNK4p5FI7v6I2Bex4q2W3/neiZGcR+QOAJm2ye7A2b8pngLLK7q2vYKQ7YNc95hHZOL8IKir5w03orKZaHqaBNnuoCOnj8C+URmnYEniTcpp2QuHR+ZOmS/vISJmcv9W86DaOb5covCLhgekTcXC2g==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(23010399003)(7416014)(376014)(1800799024)(366016)(11063799006)(56012099006)(10067099003)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YlZWUjBjTzM3aWRlRjhFekU4emU1UnFFN3JMYmhVUjA2UjkvT1pnLzkwT1Bo?=
 =?utf-8?B?c0JPY0ZTRDhCVDNneEl6bkFEMkprQm0zRmVRRkpXcUc4Y01BMERHU0FaenRo?=
 =?utf-8?B?WWtXNGRvNWVQeHFLaFN2TnMwd0lXejdWcHZwYmNwNWU5STJiTlQwSUhHKzds?=
 =?utf-8?B?WFpaV2ExM0VQNEgyVnlIbGJIZmZlUDU4bnBHQ2RZL2F5MWY2V2JnUS9MeFF1?=
 =?utf-8?B?VHh3OGJPMjNPU1FqWlVuWHBDNURxYThMVVlJQnVkSlIveW9ib0FUQTQ3MzNz?=
 =?utf-8?B?N1JCZHpmTlk5azQ5dU82UDZ2eHlTU1dyekptY1UyakZ5dzloZElpclZRSjdi?=
 =?utf-8?B?eUJiSkd2N0U1Z25rTjE2ZUZnTGRkWS9hTUVQLzdXQVlrc1N5dk4wckcyVzNr?=
 =?utf-8?B?VWVmT01jQ2pHaXVZbjZFZDZGYVlrQkdyQkR5ampDR3RTRXNsVmgrdGJHRysx?=
 =?utf-8?B?WnFaT1hTMExaazhpY2xzakt4TTFLS25hSGF2UkFOVWFjVVA0Z2UwcGxwS0VT?=
 =?utf-8?B?UkEwSlU3blp5bXF4L1RBb0F1ditsbnJyRHFUd0JqQXAzbHN2bkF4UmF3L1VQ?=
 =?utf-8?B?eGxkaFUvR0VCVnlSSGpHY2dkWDNHNTdnRDkvL2hGM1orZ2FUWEVvRG5lcGpV?=
 =?utf-8?B?Vk5VSE85Y21HQ21SUDRUU1p3VEdhOHJjOWZzY2dQYkJrUDVaWTVTOHh1Sjhw?=
 =?utf-8?B?V2V2dGFBL1B6dXpXRmpJbFlVV1h5UEVKNGx6NS96K0I2dUVQeE5BbzEvQkNR?=
 =?utf-8?B?SitWZGV5VC9lTWtwd3NNYXh3WWtTeUNRV0RhTG13V3ZycURVMk1OS2RicklN?=
 =?utf-8?B?a0o3a0NVQURtbmQrQnlVQ09XR0xNYmIzQ3pkOVFkU09XMkRVVFU0UFE3a2xj?=
 =?utf-8?B?Qm4rb1dRdDRiemozN3AzVEVHZ3pSZ3h6VTdwZHhLVXdhNWh5VjVISkRFS2or?=
 =?utf-8?B?Um4xT2JVRzZWSEF4UzUvb0dZRU52QmdnL0xkS3dubXVlM05zM0NYd3lFcVhX?=
 =?utf-8?B?TEVPcWtHcm0yU3NYZWtkM1dNSUcwZFM5U3lMYi94d2tmbEFlS0Jmdnh0elNJ?=
 =?utf-8?B?NDBmcC80SHFlaWs5b0h0NmNRaE45WkgrZGtmTEJkQmk5MUZUVzcwVnZxOVYw?=
 =?utf-8?B?Zlh4L1YxVVlxMEx2dkpMTU1LcGZvMWdLMmw0Mk5icGFHcE9RWW5lWGNPZXdZ?=
 =?utf-8?B?MkFyYkFvZjNhRDlnbHZjeUJYNTVNL2wvOTJwZVhzRGRFQ21WWWhsZ2JFVmVT?=
 =?utf-8?B?LzhGcHBYTG1WSmMrcU1FYWIwYmlBZnZFeDlXUi9WOVJvZGxWY1dQb3JDQlpI?=
 =?utf-8?B?eUs2YVhnQ2R5T3JtWTdkbzNaaldNZ2xRWk5ENnNUek5iZXZ5bUlWVGdmOUFq?=
 =?utf-8?B?NXlhWEdCaWJjYjRwYnNuV1cxWG1HaURSZFprT0d1dURuZy9jWkw5Mm1QNUhj?=
 =?utf-8?B?ek5YREdkSGdaTTNoUlhwYTFPbXVweUNUZ0hDMzlvQldRRDYvNEE1N25tTlBm?=
 =?utf-8?B?UXNUZXUzdGVVT25weTBvMzZib1dackQrU0xQa0daQk1rNVREMXpyZUE4eFBr?=
 =?utf-8?B?RDFvR1JVbkxob0hnZWxJaytWM0VPTTlYQVNkVDJxaDN1VXplZ3I3Qk9nUXZu?=
 =?utf-8?B?Z3QzLy9GNnF0b1ladUtRRUp1a2kveHdubzl5S0h6Z0FaUlBDelZLelA1U0pR?=
 =?utf-8?B?TktOSkFWVXFWTnRrZnpVV01tOTlUbXAvQlpBQlo1ZmtGc1d4QkpOc0xWdnFt?=
 =?utf-8?B?VGdIS01NOFJhWmdyZjhxTlpSUU9UYkhlS2FUMitqWDVkaFhTWjliK2RFcE05?=
 =?utf-8?B?SlB1U3R5SUEzdUpueXJIaDdWSlQzK3F2SGQvUVY5K1FLald1djZwLzdOYjRo?=
 =?utf-8?B?SlYxYkFFWXpVcWkzMnlRZ3h2bXhRdlhZSXF6aHNocnl1ZkVYMWFVVVdSVG5v?=
 =?utf-8?B?QUNzandrdlBoeE1GRVlGYUpseTY4cXRkZUNINUVnemM2cFJOTmJHSENWZXRm?=
 =?utf-8?B?ZVlFWU1KdUE4c09SZ3IrZTR5VkdvSS9YcFo2azFPN0pOWkJFVTF5NkFXdVdo?=
 =?utf-8?B?eG5vWlRTOStqak1ZUkFleGxVSmVuS0VBVDhiUG5oYmYxZkZIazdlUEVGWHN2?=
 =?utf-8?B?NmFLVWI3d2lKTlkyLzh5UnQ2bWo3dmx1N2RCZ05qVFB0UGRmOVlpNDhMeTZo?=
 =?utf-8?B?cG9MVEEzVzVJT01VVHdGWGhWcGd5MHUyeFNPSXlNcGIwU1YxSjNvSGZBcDlN?=
 =?utf-8?B?cUY1a28vSVVYb1dzRjlUTm9TU01FRnVrejgwcXlwUkFJTngvVkxkbmxmOE0w?=
 =?utf-8?B?alYxS2ExMm9OektpR083eGc1Q0JCbGxucHZrUTNvSy83U3dubWpoMzNZWldD?=
 =?utf-8?Q?yWGYG8WInMkFRtWbPT6IUWG0TH9Cv16rhyHQdvynTW1rW?=
X-MS-Exchange-AntiSpam-MessageData-1: ovcraVnsx77shA==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1fc63207-83c7-4d92-5e41-08dee977ec85
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jul 2026 11:37:21.3201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /MK5kpnCoQwv2trJwC8m/qDffxicikWh81xvuFXFT99fjsy9CGeQD/KJkWP3whnf/2dktB6Oktz5eV7XI520hg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6974

A few arguments passed to internal rules are never used and just add
unneeded complexity. Remove them to simplify the rules a bit.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/io/register.rs | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index e9ee8c2b60e7..32cab54aafff 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -832,7 +832,7 @@ macro_rules! register {
     ) => {
         $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
         $crate::register!(@io_base $name($storage) @ $offset);
-        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage));
+        $crate::register!(@io_fixed $(#[$attr])* $vis $name);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
@@ -845,7 +845,7 @@ macro_rules! register {
             @io_base $name($storage) @
             <$alias as $crate::io::register::Register>::OFFSET
         );
-        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage));
+        $crate::register!(@io_fixed $(#[$attr])* $vis $name);
     };
 
     // Creates a register at a relative offset from a base address provider.
@@ -855,7 +855,7 @@ macro_rules! register {
     ) => {
         $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
         $crate::register!(@io_base $name($storage) @ $offset);
-        $crate::register!(@io_relative $vis $name($storage) @ $base);
+        $crate::register!(@io_relative $name @ $base);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
@@ -867,7 +867,7 @@ macro_rules! register {
         $crate::register!(
             @io_base $name($storage) @ <$alias as $crate::io::register::Register>::OFFSET
         );
-        $crate::register!(@io_relative $vis $name($storage) @ $base);
+        $crate::register!(@io_relative $name @ $base);
     };
 
     // Creates an array of registers at a fixed offset of the MMIO space.
@@ -879,7 +879,7 @@ macro_rules! register {
 
         $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
         $crate::register!(@io_base $name($storage) @ $offset);
-        $crate::register!(@io_array $vis $name($storage) [ $size, stride = $stride ]);
+        $crate::register!(@io_array $name [ $size, stride = $stride ]);
     };
 
     // Shortcut for contiguous array of registers (stride == size of element).
@@ -909,7 +909,7 @@ macro_rules! register {
             <$alias as $crate::io::register::Register>::OFFSET
                 + $idx * <$alias as $crate::io::register::RegisterArray>::STRIDE
         );
-        $crate::register!(@io_fixed $(#[$attr])* $vis $name($storage));
+        $crate::register!(@io_fixed $(#[$attr])* $vis $name);
     };
 
     // Creates an array of registers at a relative offset from a base address provider.
@@ -922,9 +922,7 @@ macro_rules! register {
 
         $crate::register!(@bitfield $(#[$attr])* $vis struct $name($storage) { $($fields)* });
         $crate::register!(@io_base $name($storage) @ $offset);
-        $crate::register!(
-            @io_relative_array $vis $name($storage) [ $size, stride = $stride ] @ $base + $offset
-        );
+        $crate::register!(@io_relative_array $name [ $size, stride = $stride ] @ $base);
     };
 
     // Shortcut for contiguous array of relative registers (stride == size of element).
@@ -955,7 +953,7 @@ macro_rules! register {
                 <$alias as $crate::io::register::Register>::OFFSET +
                 $idx * <$alias as $crate::io::register::RegisterArray>::STRIDE
         );
-        $crate::register!(@io_relative $vis $name($storage) @ $base);
+        $crate::register!(@io_relative $name @ $base);
     };
 
     // Generates the bitfield for the register.
@@ -981,7 +979,7 @@ impl $crate::io::register::Register for $name {
     };
 
     // Implementations of fixed registers.
-    (@io_fixed $(#[$attr:meta])* $vis:vis $name:ident ($storage:ty)) => {
+    (@io_fixed $(#[$attr:meta])* $vis:vis $name:ident) => {
         impl $crate::io::register::FixedRegister for $name {}
 
         $(#[$attr])*
@@ -990,7 +988,7 @@ impl $crate::io::register::FixedRegister for $name {}
     };
 
     // Implementations of relative registers.
-    (@io_relative $vis:vis $name:ident ($storage:ty) @ $base:ident) => {
+    (@io_relative $name:ident @ $base:ident) => {
         impl $crate::io::register::WithBase for $name {
             type BaseFamily = $base;
         }
@@ -999,7 +997,7 @@ impl $crate::io::register::RelativeRegister for $name {}
     };
 
     // Implementations of register arrays.
-    (@io_array $vis:vis $name:ident ($storage:ty) [ $size:expr, stride = $stride:expr ]) => {
+    (@io_array $name:ident [ $size:expr, stride = $stride:expr ]) => {
         impl $crate::io::register::Array for $name {}
 
         impl $crate::io::register::RegisterArray for $name {
@@ -1010,8 +1008,7 @@ impl $crate::io::register::RegisterArray for $name {
 
     // Implementations of relative array registers.
     (
-        @io_relative_array $vis:vis $name:ident ($storage:ty) [ $size:expr, stride = $stride:expr ]
-            @ $base:ident + $offset:literal
+        @io_relative_array $name:ident [ $size:expr, stride = $stride:expr ] @ $base:ident
     ) => {
         impl $crate::io::register::WithBase for $name {
             type BaseFamily = $base;

-- 
2.55.0

