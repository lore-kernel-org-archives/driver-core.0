Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012006.outbound.protection.outlook.com [52.101.48.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998CB3D525F
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 10:12:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783419162; cv=fail; b=UCtAecGX1hZ/zUKYpfRls1bOvhvvsxbhsoCfMtut7yb+APDrHQzRZ/QsL/mL2erHDlbsxBHmZUZtApV/657+VUF+IE/nTtjNNhg8DsqKPTSUXhbDLUMfMDtKBhlqichHZNC+dKwgsNo1h3hqvfRfaYQZ9m5aHc+6ZjNiysl7VNI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783419162; c=relaxed/simple;
	bh=FureBNQKZJ7HYXGZ9KGBTaa3/mB1GdHy7KTOM5EynG0=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=HencifsZkFzpGuZxIER9+JCTnDQBkPYNDYhSEWTOzc3xQ0tsaeufQcHfYkIvO1DpcphmP3ZGy7LLKmrSgJFrE46t036Z0kyg8cRTB4eFAqJVTVtiYMajW42abMseDy3VfYFqH99HMNhJ/quNoQc0uGp2yLlvRXg9prH7yVYECu8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=FBdDi+Bb; arc=fail smtp.client-ip=52.101.48.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="FBdDi+Bb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=zWvSIM7XTzfJ6R+FAAmly5E8CewUpjl2tcM7UIP9a1q79JhCL6fa9h54xeHUkPjIK8KUH0YSQusDcYfgAEC+p23IbCVMQN1Z29Ewp1vAldEF1dyxxOyiK132Qbjb3lLP52vlH9amlv2hWJA+vriHj3brUcxSFT0fWO1WKm+9VzFp14C21mpUp21PZ//xrMOtWMK1XEK44XvzUZbs2QgzlWftB4zJuSt+D1R0iLo1IVR+aZKD3DtSMBY139p3F+icYPJOrjlH0n15ruMtHKqarw7HAG0zQtdEnGhHgmWtnAcUMXEomupXSOcnnA1mvCMg3rUVBlWUZtbZEpnXJnZVUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YatcjrAXxJ2w+JeGe0eF4Pd5pgAFQ2aIDqC10otUgrw=;
 b=TLpKuXB49eYd84xjN68wedbtz2GwbWmA0C35Wbd50zAWrp/L2jY/lsWSo2zKVAI5agvTjw3qP9JxdfhVo+3jj5GqD7665BuHttmtHDnqvkqspOlfKpu80MeBB0x3cZXVDrIRHb69AnwRG8ZMXX3Una1q4PnN4X6bmxvBLemuiQE88CJvlWoZ2yE2o49OQrGgE671jEXcQCq9I1v9Gb8kPKUir7BVpo9Atti/fNIHhoLqF6Fas0ySlkBnFDoFHfF87PWwxlJyCx1EaDsYbClPa9apHtP0QYTwXyleXaP0EtPTxwOGBoiVEf3noVu6sjiFGIdhOt6TECXI+J8dhuv+7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YatcjrAXxJ2w+JeGe0eF4Pd5pgAFQ2aIDqC10otUgrw=;
 b=FBdDi+BbJ8bDQ411vdNlh+94mBWvuiAGyM8LhWR8FoR+H31aoqy5ABAdVwpPoSl1yTArC1s4az5X2lPYsTt8cwJa9KEPo+3ms1zeyBJYoxGxsX1fPJ/eZmp2jz1q7gVBM3c/IVEp/tOyv66LlN/aWjElU6Zf720jdLqnGRE2/eU2DcifRbbx/fOBKi5jkwwMNAm3Os2xtSEgbri5EFYiL2RSmR29KmhK/fPCVB/INjnU1cY7UdKszYSIxL4m4U8BEuVz5PPWvZbLuSazpNPyQpEmCz6rbipGzp66/LiB/t7Kx405rIzHnvmVn5MBC8oJhHY/a5qUHNudJRtVPr+gYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ2PR12MB8830.namprd12.prod.outlook.com (2603:10b6:a03:4d0::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.8; Tue, 7 Jul 2026
 10:12:35 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0181.012; Tue, 7 Jul 2026
 10:12:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Tue, 07 Jul 2026 19:12:21 +0900
Subject: [PATCH] rust: soc: silence clippy warning with rustc >= 1.88
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcwNz3eL85PjSvPKixIL4/CLd1BRj81Qzc5NEc1NLJaCegqLUtMwKsHn
 RsRB+cWlSVmpyCcgQpdpaALo2S7ZxAAAA
X-Change-ID: 20260707-soc_unwrap_or-ed37e674a759
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Matthew Maurer <mmaurer@google.com>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: TY4P286CA0120.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:37c::9) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ2PR12MB8830:EE_
X-MS-Office365-Filtering-Correlation-Id: 9cddb78c-10de-41f9-be29-08dedc1043a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|10070799003|1800799024|23010399003|6133799003|56012099006|3023799007|18002099003|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	KpVrGIeoZY556HyJUiD6oEcPw3y0ELneUZ/TFeCFa3mcjA+sKWhaNIxFIp3NQdBcg63j+hxbAjOcDmT6ROQuKdKLqDwGsdMLTqD9JsGAdLbJudcp0uMlG6iiElnf9v66uvLIkf0IcG+WbvTIlVg5q/GZ95GG5sX8kqUFDZxYQd7YHSTt1yMwSGoZ2sfhsxUD9V3cc+yg2n7+wUNB+sDsj3BebkDZRRLDBkIcZaS27IlEu6IxSTA43Apb+38HNwC+BZIk2QNkXArYKf8LnQhFS5n4w/BaIr610dTZFo7NZAHFASsBpBHhKxqdpCukElrD0m6Sxt/Fx/C+Hbc+61+HXLIOSYj8UvY6Ldkp6HSUvg3UlJwvnBnr8C+kLeF+/0q3WVnfRHD5XQ8YUYh9q47NuukSVQR2ZWmkR4chFPDlH817zO2AEhx2CVBc4wyqE+XeXrDUarUgieOBTqYMwgBw3URwOGrizmj5vvPt8IEZk4nRXhLdICMuzXqXhEZOboNevR/fm5Kd2Kmemwx9Mczhcr/23/P0APadRVDAX+mPJMHN6lNra0KCOJ639VWtye92bn+cDWuUpaL8w43GMj05BMNBaAIGc6QsnyipRy/TOi++s+uuYK1z+I1Wy+G+mMTyI7Fxu8yKC8zDoFt6kbXKqRFVN1POJ3GdNmd993WCjECvXslz/TPBMOl09WSn6C7hsHZlSJTglJEXTW6clBmBqw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(23010399003)(6133799003)(56012099006)(3023799007)(18002099003)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?dVRHVDNNRHRyVThlUTBGSkt4TUtCclVLMUNqYzEwL0djSDlpUzJnVDVScExC?=
 =?utf-8?B?bkxUQ2M2cjRRcjE4aWJKaElnclp6elZZSEJYQ2luSU1SUFgrMU01S05mTHZt?=
 =?utf-8?B?YlFTQ0N4UVVVNGxtRkNzalRtR2gxc3RkbzFuL1M0NFVMMGxzcjRsVldGdmFW?=
 =?utf-8?B?bGU4aUYyaHQ0R2djd29aZFlKOFVSVXE5MDEzalNqYVl2Q3ZaWnd3NGxDemRG?=
 =?utf-8?B?dE1DUUFnOXdyOExCY2VxOEhvazN0QXlIODJWc3loVGxYalVRb1J6cE80UTdS?=
 =?utf-8?B?ZWx3c252MDhlN3lZMW0rRG1CSUNSTzlPZ0h0NEZQVjJDSi93cFZDTCs5eWpC?=
 =?utf-8?B?UTdnRmFRczVGRVFTci80UmsrclJvdGFkQ1dnZEh0MmNnd3FQMWRIRi9VZ0pa?=
 =?utf-8?B?NmVnTGdoSjVueU1ndWk3VVZodjBHdlB1RTk3U2cwU0oyMTJrU2V5Wjl2dFVE?=
 =?utf-8?B?bEM0Q1Z1RjNsbWxvTFZMU3c1Mnl1VkNKM1V5R0p3bm52Nnl2aHl4MjdueE9s?=
 =?utf-8?B?S1JmRmVmWExybHl1UVkzNklibjRqS2hIcHZwcmp4aDB6SmJZSTNTNDNuN2Mz?=
 =?utf-8?B?UHp3c3JkcncvaUdlU1djQndLR2lWdEZOV3ZDUHNST2t2OXBlNFdUMTlVMFdR?=
 =?utf-8?B?RkU4WnhnMlJSbFd0cG9ROEVzT09VVkFpTjVDUDJEYTJmd1RrWnErdXVIVHFB?=
 =?utf-8?B?TVVFTmtISTd5MURRS3l3K3crVDEvbmliMm9jVHhHeWFDS2VSbytmYmhEdStw?=
 =?utf-8?B?RjAwVkxqRDVhWW16SDNBekN5VTlJM2p2cmJObFNxQVMwNmZabWgwRDFpajlV?=
 =?utf-8?B?V1grVkNjWVFTWVV4RllJTm5NY2grZlJmZ3RPemg1d1FaUzkvWFIrdldhbW15?=
 =?utf-8?B?Y3lpN0NFenVFUElWamtvUUwxa2F5MGY5bXhiR0RFSDVwendxK3ZqRkJYSllO?=
 =?utf-8?B?ZXdKSEZrWmJmRWRURkNQNlRHakFqbkFvZlhrMmNCbGNySTFxTXpYSThLRmhD?=
 =?utf-8?B?QnNzRUdlV0xBZ3JsRUNaRU0vNnFLOGF5NURYTG9lREl6M0lvbjdTcWkyU3Mw?=
 =?utf-8?B?L3Q1Z1BEcG5GQTZGTmluZVVpbmtVWHFxbThiT3k0YWlQOWtYekxFK3RGN0F1?=
 =?utf-8?B?YVNQYk1HbDc5Wnh0N0VpbUkyVWROSUJPc3VlMlZ5eUVIUTczbExPY1lGWHpH?=
 =?utf-8?B?TTI1WS80aC9GelIyUUFJNyt6Zmw0dm04WWdEUDgyNEQ4VGRIRWE0eENIcmJR?=
 =?utf-8?B?Q1NtdnkwRHVaUk1qcjhYY1lnakdSc0hEUUpqZjlQU2s1NjRHZ1BIV0pENUVG?=
 =?utf-8?B?WEVFMVh6cDA5RFAvZ3IvemVEMEE0Y2I3Zy96K1YwRzZhOGcxaXM2akRRTWN0?=
 =?utf-8?B?RGllODlibTc5MVNQZDQ0elBMSUh6NUZlc3VSVjMyaWxZYStjRXZBOHBaMWkx?=
 =?utf-8?B?ZTlOUlBrbzl5bzVXRlFFSGhUdWJpWFVjMDg1YTAwL29VQnlreWQ5Zk8yb0xC?=
 =?utf-8?B?TmlMV1BSU3lUNVc4UG1RL0d0cmNlUzR4L3E1QVZMRE15UU1uM3ZFK0RQQjBx?=
 =?utf-8?B?MXRtcDZTeVpkSUE2ZStMbExTTE8xM1pmRy9pelIwYk1MTzVjdWZ3MDJ2VEUz?=
 =?utf-8?B?ZjdoRjluOWx0WGVMaXpJcEk2dWUxN2lJYUp6aE92Q1ArWkNkR3VTSXlkVkho?=
 =?utf-8?B?M3kraEQ1L0J3QTE2WUtCZDMxZ255THRZVy9VRDBqUU9vWHB1SVEwKzVVSDhI?=
 =?utf-8?B?VDkvaS92Z2U1YlZUZ1hqTDBRd29WNllvamFrZkdVRHlkbUF2OVQwUmU4NUND?=
 =?utf-8?B?Z2tpeUpKRFloY25ZT1ZZMFRWcUIrV2ltYjVoTmp3N1JyaDJST1NuUEhCUHJF?=
 =?utf-8?B?R0xaa3RHRVplY0JtN2sydzFjVzhVQW5yZkliVm51MEU4NE1XQzQ3U0tHK01q?=
 =?utf-8?B?Znc0SDFMZDUvU1lSb3czRHJVNzE3d1VlZjU0ZHlwZ1hiYVAzeHJoS2d3WWlz?=
 =?utf-8?B?ZzNvaUp6TDhtQ2I4QXNMOEdBVjJpck44elFWY0htWjkxcUp1M1dGZnFtcjhD?=
 =?utf-8?B?Ym9wSFhxREYwWGZRRlNYcU5Zcm1rNVEvVVlZdkExQ0hwRnpFM1lMRFo4RXNK?=
 =?utf-8?B?eWg5S2ZpSllxTC90SFVqREFEdTZlaUliZUF1anA4ek9jK3M5SXg1RmFNSDFz?=
 =?utf-8?B?V2RpdERMbFJQWExBZUJicGlZdjVhN1VSeE10QnNWWVMwRTNGMTBvUzlJSTBp?=
 =?utf-8?B?M3VSY1U1SUI4SDdLeSszZDYvMHAxb3ZRdmVhTUZsY3BEOWc0cVBGQytQalAz?=
 =?utf-8?B?eHUxekN4dUU4Q0tuaHFSTkczcjhoWnIzVE84ZzdCYVdIeWFhQWNwYlpFc0ty?=
 =?utf-8?Q?llBf9vTwc9enHXf1uoOOZ2WOjgRSORx1+xecRrNOaPX9U?=
X-MS-Exchange-AntiSpam-MessageData-1: 9IqJ4LDy66YDfg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9cddb78c-10de-41f9-be29-08dedc1043a4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jul 2026 10:12:34.7281
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8762IhBAX6hIxXzy12m2tl1tIBrBOjrhn9mEaXm1TZkA8VJFqbAIffYzBvbmMzDf6E6kcX55cBjRvsoHN8dwYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8830

The `clippy::unwrap_or_default` warning triggers on
`rust/kernel/soc.rs` since rustc 1.88:

    warning: use of `unwrap_or` to construct default value
      --> ../rust/kernel/soc.rs:66:10
      |
   66 |         .unwrap_or(core::ptr::null())
      |          ^^^^^^^^^^^^^^^^^^^^^^^^^^^^ help: try: `unwrap_or_default()`
      |
      = help: for further information visit https://rust-lang.github.io/rust-clippy/rust-1.96.0/index.html#unwrap_or_default
      = note: `-W clippy::unwrap-or-default` implied by `-W clippy::all`
      = help: to override `-W clippy::all` add `#[allow(clippy::unwrap_or_default)]`

Since our current MSRV is 1.85, we cannot fix the warning as
recommended, so allow the lint on the `cstring_to_c` function instead.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/soc.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/soc.rs b/rust/kernel/soc.rs
index 0d6a36c83cb6..7998962560f8 100644
--- a/rust/kernel/soc.rs
+++ b/rust/kernel/soc.rs
@@ -60,6 +60,9 @@ struct BuiltAttributes {
     inner: Opaque<bindings::soc_device_attribute>,
 }
 
+// `unwrap_or_default()` on a raw pointer requires `Default for *const T`, which is stable since
+// Rust 1.88. Remove when the MSRV allows it.
+#[allow(clippy::unwrap_or_default)]
 fn cstring_to_c(mcs: &Option<CString>) -> *const kernel::ffi::c_char {
     mcs.as_ref()
         .map(|cs| cs.as_char_ptr())

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260707-soc_unwrap_or-ed37e674a759

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

