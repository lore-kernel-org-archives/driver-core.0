Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012031.outbound.protection.outlook.com [40.107.200.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B106D34B69C;
	Fri,  1 May 2026 06:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.31
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777615475; cv=fail; b=nyxOTltNxHK3PPEXU9ZkWlsOa1T6bvUHd8aXXwRxXYBDhefLzxUZFkR60Lp9XyqCfLgNRUubEagedag7aODjauiD4JXAXJy9g5lNSSqcCdOpodsxART3SUAk5oNh/PedH8AJRmxMyzK9kbop89mT3uadzHiOcCRyD2vTRuyawCM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777615475; c=relaxed/simple;
	bh=8x9okYaVHopE+Wjy3M752aOu3+fAsudWFYy2V8YGIJs=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=uy9X8C73frh93S28YvDDv9g7f5LC2TFkEwdMuW/5b50DrpLeOcYQSa15uoPWxvJBIb+XNK8cIwxY4MNBmyUw+pjb5jL9hx4ovS0clM9QU+rkrr4j6dfVq6XerGiRnlou9vxs2bSMJhjfOo5X1ifa5ORyGxmqzD+TtIRZbZgQfi8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=p55pQuyq; arc=fail smtp.client-ip=40.107.200.31
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="p55pQuyq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GqoIB8MJemfVhntjyTBmh+Bn7peUxakN9WtiwcQXPz3pqcD1UjjeR8PEGO5ampq4gQmTk9bumTX1LaIgP+VHxFAAC0hJi92JDGl9n+GpuWuIJIYuvZlyJbbIo0E2Ci2RhYjkyTSnsHVwM0pZVUuvZa+bKf3MkV3hI2sHwzrudTxkWcO6K22Gw3sOL/9fx9zc2e4pXr7i3oPNZrNfWBngNYmK4n/ZNVrVgnTNLf32LHY8ZUShhVhL/yCXgFcVZ9ZQh23TcjTX7rjTlmlaOZjdpPhxDDt7pVrHM4p8STlXvgCOH5NA6aGdL+kmIPcc8hKjD9ziURrH8Bxv0Ky0lYuICA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tYiYsK5tHRDNs6gpnUFafZw04n3r0z4GvEPFr0uhMbY=;
 b=XVSeo0Q8Lnsf3PR9NjZ7FbGpQStzjCT0RjR0qcxir7dsrS6CAMu+SW/GlP9ycA4KZcEJlRFMNvqhgnaOdZTKWd9agdB1ATyCPjtHz/i3fjPdB7u8+8fvXpcnwRNA7PYsTXVFC0UciKwreIlvetqEPi7VUpmeiawVv2JbAhFBIccI6fUclPgU+0fX67YGTXQngGUkE7vsfNoe1EyNeMprPZXsWbuADqpf/zm2qXSOK+9smiaNboGzwQw02A8wfyk6Ap3+5Hxb4dE0+mGNvtYgu7UongSKTun8uNkoWKGctk/gNi3pjXGpELFNNXFkHSDEd6xg2p3kkoYaY+tf1aqnvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tYiYsK5tHRDNs6gpnUFafZw04n3r0z4GvEPFr0uhMbY=;
 b=p55pQuyqlTjoUWbTYsep5I84Q3A+3qpUuxWLuFfsWnrZp3OyZoYwzlEchr1xksvWRRK4miF6UpezCJD7/CjU7kUilekBlE1Nh/XcYqOjrzkqU+lbK+77+G8KvJAuV0QRFkYBDph3IxokUKYIQP3QQZ6v8ssU2fdKNYBUJMUwAuFFcxBJ9aIIUvgf0ZDieVygDclQ3XXI/APF4aQnY6nan2i4pF+jNijz90Y9VTPHsfZqXQovBORukhSPNrh4XbxPJ2rq+M3YVv6E016q+5bHxXSF4amaoRCrKALadapqv70+FBhGg6MoOl4zftxJqIEMoaZxSWHUqy5OsvycNkaXcw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 06:04:29 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Fri, 1 May 2026
 06:04:29 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 01 May 2026 15:03:21 +0900
Subject: [PATCH v3 4/5] gpu: nova-core: switch to kernel bitfield macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-bitfield-v3-4-aa1076c3337d@nvidia.com>
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
X-ClientProxiedBy: TYCP286CA0138.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: d13048c1-84ef-4c56-a9ee-08dea74781a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|18002099003|921020|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	FsG6WRwXgQPbQD2vRy55uz3cHjsE/TtQzVzeT4A2Pf4kcpGGVRv1L6DZUupw5UD+iFQ9R2XzkzjR0+5oyZev6bBbDqm0vQ5903HqzclGLOJN2jzpSLKA2ez95G1nCRd/9xUQNq/6w07ITr4xvrWa+N1jiR35IvodgrLCZJb0lLkYEb3DPLcBfaG+g+H8D90pWXQ60VHwzt264soyzmNAHAZpBwMx9CGlSGeAN5oRR0dPPGMEIz5PqqXSLfGwdLDhgAb5bSJPWNsn2xeYIiMErkaSAdG53Kc++rl0odU1DYSsEgBMi1/Nbxu+a0podQSHm3rrrEs/8fA+qKxenErYNXCks/rl9W6vo2f6zw3Gd+iK8f3ITyPQNSZlG7f8EubNddCdOSVbwkQYUWbfNi5bK3VKRo/tIW2zyQF0mdDQR1TyCH5o8eLvMZ9XhL/J06RoJ12XF9N1YqulIlVtrVQi2ft1IS4vyU4jGx5tBUbSXbKZbm5STJnwcJxU2xaX6Ijsy+yiCe9CLcmwXZ0dcsatYtOZB4M8h8CVhufcF6kefA5Tu50J8J+Ivv/MD/0vJcPykKl4KmhqO2C/dhj98EqaXw/x657Z6iEkySDDzuVHK/kJRSBEm8rcRQqvAmvvOdCusq6tAYjfnajm4mfwjalqgLjVZQKlIogZnCPIpbbKBFbKoqy4LTnSolMYHaoPHpLsrs8cSLmEXKlYu2oDXuuo9BllYa1QgxREOxASa6adgsc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(18002099003)(921020)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHJoMzZ0QmxBODBrb1NHUW5VUDl2UllwNHF3UmttZmVwZ1BpY1RtTlowRWk4?=
 =?utf-8?B?bmdGMjJYdFNlVDl1TStFQW1OMTdNcDV1My9DdWZkRldzdkV0enA0M05QOWNz?=
 =?utf-8?B?WVVpOXc0di9yMDRNTHFTWnJ4YlYvQmd5WWhIRnpuYnVucVhlVFB0eWZFVG15?=
 =?utf-8?B?ckd1Nll4MGhnOVFLN0VJSi8rZ0sySzR0QjV3dncwN3dOR0R6NmFhMWhFUVhz?=
 =?utf-8?B?TFYvdHJXQTB2OCtYQ2xvSzZEUXpZVWZNOEh0Um9QSUJDTXMyUUZQMXZDcE9P?=
 =?utf-8?B?cWZFcXp1N3BDc2tUNDNzS2xBMnRFV1Y3SGduQmd4UEdVNEd4L2lHMFdsZVpN?=
 =?utf-8?B?TEhQTFRRa2pwQ2NvVTA4enNYNkFxZXZ1c2l1ZnhsMUpHRlAvNFhwejBqU0tR?=
 =?utf-8?B?K21SNmlaOGZlY2Erd2kybXJsbHArMXc1RWxTVHEvNDJUN0IxcXlTbElUSTl5?=
 =?utf-8?B?ZzYyMmw0VlJ5VkF3TWJJSHZuS3FYTVRXV0V4OElEWFMwZkIrWEE0U3Z0RVNW?=
 =?utf-8?B?amNhR0k2L1VKS3k0am15Qk1iWUFFUFZSb3BDKzROa1RKQVJRRXQyUVkrUEpU?=
 =?utf-8?B?Wmx3MnU4ZGVlY21jM0pGTVpPcWgvL0VYbHRhOFZLTS96REJ3S1lUc0pQZy9W?=
 =?utf-8?B?dUViYk1Ha0VoL1IxaTRhZndSdFdRM2NPMzFNeFB0OFE3ZXRpMnFFQ1lNNHNF?=
 =?utf-8?B?TlhhRVE1SEJjRytzQkFGL1locStwdXdWUDUwUUJqRGh6RGluM2dObUJDZU5B?=
 =?utf-8?B?VlVFU0VKaFF2Z0JyRzVCTHJtemhUWlgzUHNidWdWRHBvY3I0Vi9QQUc0VmhZ?=
 =?utf-8?B?RDJ6Y0xCUzYyZlBMNnNFVFRZUk92UlYvbUwwZG04ZEh5U0NDZ2ZWSnpMNlR6?=
 =?utf-8?B?V0ExVmJhbldyaXRKYjF0YUdlZVFOQmtpYy9Db1MvRlp5NHZ2SmF0eHZqN0ZE?=
 =?utf-8?B?T1NoOFJaenA0UG5pQy90cGhnc2gvK1UvSGFvNkNLK2FrYkY1TEZQZEMrb2hX?=
 =?utf-8?B?R1VGUjZlbXFWNmxTVThOQldtR0d4OWZXRzNGWk5QNXdKNWtvTkZTVTYvOFJx?=
 =?utf-8?B?VDVLS244OFhSZzNWNlZseFc0Ly82OXk1ZkNlam5FVnppeWJGTXJWczQybFN3?=
 =?utf-8?B?QkxONk1Dd0VDSmw5VU5kc3pwd2twN0R6S2JyQTZPNzJkbXZ4em0vci9teHlH?=
 =?utf-8?B?eFpIem5sVW5tMmxJSnR1dmpqb1lsRU1aU2dUeVVaTExyUWg2cFFGZWc2eFpC?=
 =?utf-8?B?MTQ4dzRCTjMrUE9JQ1hHUzFxbjVmQjd3M1Q3NnJOcHNMZzlLdUJja0crZUdj?=
 =?utf-8?B?dDNHbUprYnBRZzgyT0d2eHZoWXBvMmZzOFBlczJNVzVxRkVsZ09FeGU0clRS?=
 =?utf-8?B?M3J4UmVDM0RJNHowcDhUMElqVjBCZFMzSUhiN3hXM3Q3RGh0ajQzcUFnTVpo?=
 =?utf-8?B?OWNaMlZ5L2xFTm1rRG1PRytXbzdCZXJSV1dDdTRlcE13QW1mT1RSUEU1UFFY?=
 =?utf-8?B?bUQ4dGdXZlhkL21sOVBVeFJkcjZxRTBOV21JV0xsV0JWMWxYRFM2aG85OEs5?=
 =?utf-8?B?emUwZUdGcCtSb0xhcU9UdGg4Mm40T1ZxWWVyaVo1QStpWjlVQnZFb1VydVZz?=
 =?utf-8?B?UUFnZHdtbW1ac3Rub0plUWFnMVY0SHR6TkRUZmc0SkF1NmhyUlNySzNjdzlS?=
 =?utf-8?B?SUdLQlFUUFErbGgrMWJVVlp5SGp0bDl2OWcyYjY5RkFZU0g0VE1ReHdMZ2FC?=
 =?utf-8?B?dXlIWTFvMXJYTXFJYlNMNndKVC9ra0xoYWcxMHk3YmhtcnA3dFVjMStmREp3?=
 =?utf-8?B?Nmx0QWg1d0FxOEdYK280Y2ZwZ2xueUxpU1BFbFE3dzBSWlkwMGMycVFYOFh6?=
 =?utf-8?B?a05yZVpudnRKV3h4RUVKUWxtWkVYcGx3SnRvL0xUbXZucG44a0RkVnZpYk5G?=
 =?utf-8?B?OE84RXF3dzJQM2ZJOTRGY29VNW5GcTE5Z2RqTUJrNUJuMlI0VG85UmZ4SWZK?=
 =?utf-8?B?cWxCcEVqQXg3WE9lazRRUFk3OHpIM2RpK0NmMTN1SnYwTmI1c0lsdmR4M3hs?=
 =?utf-8?B?QVZzaG1vekpES1QxY2YvSlA5UVF6Tm9nWDJVWkFrSXJUcktGNm9QZkNueDZ6?=
 =?utf-8?B?VDA0ejZpMThkVm5vRlJxb0VPazZOalpVZ29MVTMyMTdmL3ZscFVpMit2RDda?=
 =?utf-8?B?bWdqWGw0bEdHTTNyZm5sUk1sKzEwYkRHMlNDZmZ1Mk8rOU9NeWV1WnV5S3BY?=
 =?utf-8?B?OTRGbXAxRUJHZHFhMGQ2bVp1MXlhcGxIeFQ3d1hURVgzcjhqWVV6Vk9xNFFp?=
 =?utf-8?B?T3hLRDJCOHVjNWF0TVpuNEw5MnZjS0VYSEZWVmxYaHZPZnZ5KytpMmdLVkxh?=
 =?utf-8?Q?SIIIeRyeMAYaTP2BdkexSttTaaJeSVVvCpDh+pC1K9IIi?=
X-MS-Exchange-AntiSpam-MessageData-1: 0MtJkg9sHY4Dvg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d13048c1-84ef-4c56-a9ee-08dea74781a1
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 06:04:29.5627
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G1awz24PvL91PGrlW6QD+enMJFr2XsRIslV+Oayl2B1O0VOdf6mEXGWWpO0EgECZCJne698v/ms6TSuYgQbUyQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584

Replace uses of the Nova-internal `bitfield!` macro with the kernel one.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs    | 11 ++++++-----
 drivers/gpu/nova-core/nova_core.rs |  3 ---
 2 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 0c8a74f0e8ac..d54688904740 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -9,6 +9,7 @@
 use core::ops::Range;
 
 use kernel::{
+    bitfield,
     dma::Coherent,
     prelude::*,
     ptr::{
@@ -728,8 +729,8 @@ unsafe impl AsBytes for MsgqRxHeader {}
 
 bitfield! {
     struct MsgHeaderVersion(u32) {
-        31:24 major as u8;
-        23:16 minor as u8;
+        31:24 major;
+        23:16 minor;
     }
 }
 
@@ -738,9 +739,9 @@ impl MsgHeaderVersion {
     const MINOR_TOT: u8 = 0;
 
     fn new() -> Self {
-        Self::default()
-            .set_major(Self::MAJOR_TOT)
-            .set_minor(Self::MINOR_TOT)
+        Self::zeroed()
+            .with_major(Self::MAJOR_TOT)
+            .with_minor(Self::MINOR_TOT)
     }
 }
 
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index 04a1fa6b25f8..3a0c45481a92 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -10,9 +10,6 @@
     InPlaceModule, //
 };
 
-#[macro_use]
-mod bitfield;
-
 mod driver;
 mod falcon;
 mod fb;

-- 
2.54.0

