Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012017.outbound.protection.outlook.com [40.107.200.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 819583D1CDB;
	Wed, 27 May 2026 12:52:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779886360; cv=fail; b=nXHBbh1ZgiSuIDAlQrCz5fxuplH6b6wtdzc6Lod0GqEe+cHdmyh7Dyok5W0iKohNeghnnzXmPq5kUCswPuq8wryonjVJFPtnSKt9wqyYJbw4WLG4Kh3hNeWkcdhFo6J3kCCFviDghEczD9SS0/zASqON7zzTZ7e9zXP0K/r8w40=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779886360; c=relaxed/simple;
	bh=fjSJYEPYULh8RvSPD67pmBCbnp0blXYr8tR0yugCaWU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=PpANK0/M2h/Cr27jIgt66AcHVtTqMQiATzr5qn0DAXj+lMuLILnFczziChkZg7o9gFhro3Lm56QNOUFTWXy9JTdXTNE+5j2ZeZm/qJ5WnNHlmhL+FtPf02d67Zb8TQFn4obanYYZRNwszxqOsF/SCp3IFQ3PT6vUnff/5Mc3kwc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YnJZ+dSK; arc=fail smtp.client-ip=40.107.200.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YnJZ+dSK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vlhtQ3rCy+YzjEfpr0N5uZeCmrtzs9jRAPB8TFj5Evno1Ahf7HytTQNO3TgXM/xgZdoJpO+uw654uZP4epIVlJpzE+CAV/4MBxkvQ5KbMjABCeXrRAEbrE47xojb8Bvkk1B2YSB/0coJe8pEWJ9vWso0EiVRvxMphzsAa1EuJGVt58ZZNNyJ+/9WTG21x19oZyv1v15K/3DBKExY0uZ+CYEj29Gz/OkmN5ruU9U/q1FNO1TuAJLv+HiSdVPEFxawncgCZwf8GlxhRvUsMsV8oEsaNwLi1PMwwLRQTlrjNDDeYA/pFDg6vLCwXkBZz5WEcyRLqbNtrZm+lDMEMq2Wfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaUwfN8D+p4cTRgcYePzP3koNrYATKjVPot5EVr+kaw=;
 b=rSdwAutqFSyZmCYD5SIVngvK/2FJQ4QcG+6nOLT8Zd/4cRzPkBsLRnutDRABGMmXilia3BPedpxQBU0sPEh4drTKUuM54tTnyv0ZOxOGdDRI9seNqwJtUv6P+JiyO2AUaG2DvObV6xSUy6OxrSKge524c1Znsm9jEh0P4pf9jI8kZpWt9+0s9ELAIaau4B1kX9gAnoq2EEWEu1kLOTUOPHHgtzZw7MC4ZqE+cxnXfTD2kL+1EmtPMlYBY52jX3OBwPQMD3D/xhno6xPLx/rnEzwWIUXjxi+y1gkCXr6gHUvELvAnspwdGMbER3YHH8hULGy7E+iwbPC4ci/qfIsDJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaUwfN8D+p4cTRgcYePzP3koNrYATKjVPot5EVr+kaw=;
 b=YnJZ+dSKqHCniLdrBACr6qgDaCQ8itVnEYJjMWiQh66y4K2BUC82Jy7+wOhOIQb+ydEirQAB9FvHWzEcFGwcopnTmU2/3vOv8XWIda/aFZXNfoHAnCNlQ3t/6k0AdVJr+byBIItH9DjgfEZERhEQFQSWIv5XN9QKFleAXpoaRW03PfSKNk5ix9jimcLfDQsX80avtzil1YrY4xhydKhs9bxd+gZ+u7d1M9FonEEKXOrL1Oow7c2xuf1Avi2Wb/xOxGEMbnrHedguaI+dL3QHGcKbr04prwcoyslRDBiGH9wZCiseRdHFWV+L+b5XbIWLAtFuSzKqZcqJbIVhv7Fzmw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB7841.namprd12.prod.outlook.com (2603:10b6:510:273::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Wed, 27 May
 2026 12:52:31 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0071.010; Wed, 27 May 2026
 12:52:31 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Wed, 27 May 2026 21:52:00 +0900
Subject: [PATCH v4 6/7] gpu: nova-core: remove the driver-local `bitfield!`
 macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260527-bitfield-v4-6-e8821d4efbde@nvidia.com>
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
X-ClientProxiedBy: TYCPR01CA0163.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB7841:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cbf58ee-ebd8-43fa-1391-08debbeed099
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|376014|7416014|1800799024|10070799003|11063799006|56012099006|22082099003|18002099003|921020;
X-Microsoft-Antispam-Message-Info:
	GDjygMeKQQFB72UuH5omo2lGUOBXZB9/h0/eVsEW+8lQB600KcCWxfSAnLpKOdWQrNva81uqYPiaQo4zg/2e8ZOzwFJzUduMYDgnXD0Hm71R3BzXz+dyIVFUlnb+3d34TnSTdszLs+44rfr/koKIqtnNhdv5zE8uAX53FK+LqEIjNsda8wUBfm14lsh4hgFdmZaqs6ucmkWfKD9EgwE+EjnTE7SpyBXvplaQkW4L2sGo9qJ6LN65rmxas0AWDG6x/ZMf0QioSZs9Co2P0CARQM260Bu0SVa0+Vcz4LlSfaZn7DazZ2tse0R+KOXg/ZJB5KvB53REEbCaosXcQtOhx9MepPJgjtvZhIYGqLOnMDFlv8Aq5n1vKuhtkLODtTq73XwUJavit1pSTTjHm92nMccp7hf+z/ZnMssF1HLAOIoYU90i1PMYwVJSM15GVEjQGA3GLgTRvgDKilst6xIOmf4ZBdC2D4JrGWVYscp36qZt3yhVxqxBCt+xJys9T4eJmLf3l64Q+CLfFcDOrMU6lnRwdw9ki4VLUueR/l/Fyh72BRbG1HlBJOOz7PAGSO8/+DR/McYvWNYCET4Nqe9+uwt/L2nuWcycDZ5khv5x7j5ii9bo+3Bx2Z6M18h7po4hcyyt9hDvt7HciexNTiP3bWqDDQnp15NLSj7dS2u1BFI7GVCIPqfvZI/BSaLX9WLRiTQMDsXwxMNCGTxCPKmoGLpOi+PrRM1B8+hPJFDd8O8=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(10070799003)(11063799006)(56012099006)(22082099003)(18002099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?K3hKQ1M2N2dhY2hzcUNjNjZaMXc2NENlZjVwT0lONUdnVHY5NVJvSkVHblB0?=
 =?utf-8?B?MGlnbWlmamhKZ1NDQzNGNDMzN21BUzVYaXlYRmRSUWtuY21weHFjNk93OFM5?=
 =?utf-8?B?SFVHc1RmRkhKMmVwbUM2VEdjRFJhMmNDcklpSjVjOXFVYXFFc0hIU2RhOXlB?=
 =?utf-8?B?dGdQbjNMbHJZQjBURVVDWnRiQktZQlRkaE0rYUNTN2VzbVhLUTZ2N0dwdWNP?=
 =?utf-8?B?WlJFSlpZMUtubnI4TjNTaUh2RnExbUdSQzJLYW5GUGhhUXRHdDVKZnczcU5x?=
 =?utf-8?B?aDNuTjVqV2lMMkRtR1hyYW81UmhDYmFXMFhQN1J0ckJ3OElEb2FGRStmdmtM?=
 =?utf-8?B?QmNraFpBUlcxd1d4ZCtYL0w1eXlGdEQ5cFd2SUtMdDlSR1VyMlVENjBOUFVY?=
 =?utf-8?B?UmgzRmZKTndLWTk0c3h3VGdGTUdUS2N4UFJOaS82djZlRU1aenlUVnkxQ1ZQ?=
 =?utf-8?B?VlR3RFdmUVdoUW1OdlF4MkNzbERydkh0ZkFoTWw3b1pJd2kyZ3hPRFFSTFE5?=
 =?utf-8?B?Myt5TjM4RE9abkRQYUtxcGdXTzFJWUZ4QnlMY3lUVm93MmpwZ01CTUQycGxV?=
 =?utf-8?B?NVRrcmQyOEoyaHNtcDhWYTlrWjRFR2crNVF3eDNQcExYNWwrbXRoS3VwNFJ6?=
 =?utf-8?B?dGh6emFKMVk5TDQ5ajBvcmRxd2RWM2VxVWNQbjRmQ3ZmRktmWFFMNmhqY2ND?=
 =?utf-8?B?bWJwR0FFOWFFZnJxajhLcHZvMWRVakUzejZBZmM2YWpwRUlzd1JrdllrOUlO?=
 =?utf-8?B?VnpYa1hzdWxrTUhLRldsclhFRWw5VzJ6V1EwN1F5dTVZRDBmNC9SaFYzVVRX?=
 =?utf-8?B?bzY2SkxXZFBJNWRUanVJNWRQWlB5VEl6NW9UU3Jua1lUTVdKM2E2UW54MjFW?=
 =?utf-8?B?QVMyWmd4VlBxVTNVNUcveThOaHRvNURtN1RZK1V1VnJ5aUdYWHFKUmcrak1I?=
 =?utf-8?B?bEcvL0x2UzB1V3RHNFltWVprUUxRK0x2MnRiMGw2RyswTno4dWlVb0FxWHl6?=
 =?utf-8?B?anAzQkdzS3drb3F4VEx3SzZHYmlPNWtwKzlGeE5mRmMvR0ZaYzMwait6amlH?=
 =?utf-8?B?aHJ0OUJoSmZ5cTNIM2FyQXhScUZPWUxVU1kwTTVyOGUvUFl2TUpFNzhheDZw?=
 =?utf-8?B?cUVXQ2k0Ny9uQVVXVlRTcHRQYUc2WENPc2pFUThZSEpxdDFjMUJYUTAyUHYr?=
 =?utf-8?B?U3JxSUlZam5kaFhSelUxcS94WDNOYm1WMk0xNkJFYlFWWWZqQkZIV1lGcjdS?=
 =?utf-8?B?SlMwZ1U5clR2eXhXMGJtRXVNbVdLRWplSU5Sa3RZcjVJS0xyeEVNUlI3dEdm?=
 =?utf-8?B?aUU0MnV1WGNzMHUreTVmbFhGdTNGamdXWUJ5aVpNSTZjY2NIVFp4OFd3OGdT?=
 =?utf-8?B?bm5WQVduY1BFNGR4TEd0RHpwQmhMOFY4NGROV3dETGFmRVQ5K05WSGhqUmVG?=
 =?utf-8?B?TUJjU0QyT0NtNjl1dExoNkNrYUZJY1lSamR5M0FkYUJaeXZwYzAyN2g4eVNR?=
 =?utf-8?B?S3hsNVcwUmZjaVY4V0xnYWtrTm1XcnRLOExlVnZhMmwzMFRwYWxzQkpzUVo4?=
 =?utf-8?B?dTVGYnVoNE5abUZXa0NWTW9yb2NHVzdDMzJsSmRnVFZJMjNtMWF0MlVXeml5?=
 =?utf-8?B?QTR1bkd3b3FoN2h6OWRyWEFLVHdtWHJRcCtmZ2VYemxNVHU2MFlza20yYnpE?=
 =?utf-8?B?ZzZMRHBqQ0JmYjJDOERXNjV1Y2Q4ZVlRTkRyWGN2cExtK2V2QisyL2lXd1NX?=
 =?utf-8?B?SVphYVZQbnVhdHhKdUhydHdxUXpjZkJzVlhZUVNVY29JTjdtcmVSUjhOWXBy?=
 =?utf-8?B?aUIvQWpNVjJJQUNQcHMxOUxRU0J1d0ZRd1hNdkk4WUh1RlBabVE3NXc1T0RC?=
 =?utf-8?B?MlpWdDViNzdHcWNhSzRwRElSNDRuNDJuUmxmZWc4MFJBRzdsbW9pcXZjS2I0?=
 =?utf-8?B?amoyc0IzQ2g5WFUwUXhWUEtkMVpRZzl3SHpvTkxaQlUzZFN5TG1ESk94ZUFq?=
 =?utf-8?B?YmkvbmJwRE9uOXNsbzBDTC9CTDdsQ0FMNmRiMitvb3doVnJ1VHJ1aGRzTG12?=
 =?utf-8?B?LzRRY2xNVHR4UENUYUlRVWFoNzNXYnZiVVJ0WktGdFV5ZmNMY0xyN1NFOGlh?=
 =?utf-8?B?VmtpMGJmWkUzOXBycWkwajM1K0ZsWEVPMWl4Uiswa0RZSEdleFlVU1czS3lK?=
 =?utf-8?B?eHhhWDVWZzZFT3pHbFk0ZUZpNE1rbklnZ2NVcnh3Yjd2Um1xRitmWkZNVVg3?=
 =?utf-8?B?NzJ2aGFvMWNIODJXSTl4dWJnK2c5Ui8rL1plelVEVUVlN3MzSVFWTkgwcDRz?=
 =?utf-8?B?SzhqS3BwWTdwc2x3TWpPTTM3eXJpZy9QUmp6OTQvYjlXUDVaMEJwcnpTV2FG?=
 =?utf-8?Q?x049ZfREM82CkPFJ29+AX2MQfPx1bOZsDODW5WE8tltqY?=
X-MS-Exchange-AntiSpam-MessageData-1: ladFG7Qz3cu7FQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cbf58ee-ebd8-43fa-1391-08debbeed099
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2026 12:52:31.5755
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pWNlmF7DHqcFKnkb48ygOc92tjS1Xn3Jg3hATOsyPtvst+PMoB1ZEVJwXg+sspD6YH6c+hvRVm6/1Io1cazNag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7841

This module is now orphaned code replaced by a kernel-global
implementation, so remove it.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs | 329 --------------------------------------
 1 file changed, 329 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
deleted file mode 100644
index 02efdcf78d89..000000000000
--- a/drivers/gpu/nova-core/bitfield.rs
+++ /dev/null
@@ -1,329 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-
-//! Bitfield library for Rust structures
-//!
-//! Support for defining bitfields in Rust structures. Also used by the [`register!`] macro.
-
-/// Defines a struct with accessors to access bits within an inner unsigned integer.
-///
-/// # Syntax
-///
-/// ```rust
-/// use nova_core::bitfield;
-///
-/// #[derive(Debug, Clone, Copy, Default)]
-/// enum Mode {
-///     #[default]
-///     Low = 0,
-///     High = 1,
-///     Auto = 2,
-/// }
-///
-/// impl TryFrom<u8> for Mode {
-///     type Error = u8;
-///     fn try_from(value: u8) -> Result<Self, Self::Error> {
-///         match value {
-///             0 => Ok(Mode::Low),
-///             1 => Ok(Mode::High),
-///             2 => Ok(Mode::Auto),
-///             _ => Err(value),
-///         }
-///     }
-/// }
-///
-/// impl From<Mode> for u8 {
-///     fn from(mode: Mode) -> u8 {
-///         mode as u8
-///     }
-/// }
-///
-/// #[derive(Debug, Clone, Copy, Default)]
-/// enum State {
-///     #[default]
-///     Inactive = 0,
-///     Active = 1,
-/// }
-///
-/// impl From<bool> for State {
-///     fn from(value: bool) -> Self {
-///         if value { State::Active } else { State::Inactive }
-///     }
-/// }
-///
-/// impl From<State> for bool {
-///     fn from(state: State) -> bool {
-///         match state {
-///             State::Inactive => false,
-///             State::Active => true,
-///         }
-///     }
-/// }
-///
-/// bitfield! {
-///     pub struct ControlReg(u32) {
-///         7:7 state as bool => State;
-///         3:0 mode as u8 ?=> Mode;
-///     }
-/// }
-/// ```
-///
-/// This generates a struct with:
-/// - Field accessors: `mode()`, `state()`, etc.
-/// - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
-///   Note that the compiler will error out if the size of the setter's arg exceeds the
-///   struct's storage size.
-/// - Debug and Default implementations.
-///
-/// Note: Field accessors and setters inherit the same visibility as the struct itself.
-/// In the example above, both `mode()` and `set_mode()` methods will be `pub`.
-///
-/// Fields are defined as follows:
-///
-/// - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
-///   `bool`. Note that `bool` fields must have a range of 1 bit.
-/// - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
-///   the result.
-/// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
-///   and returns the result. This is useful with fields for which not all values are valid.
-macro_rules! bitfield {
-    // Main entry point - defines the bitfield struct with fields
-    ($vis:vis struct $name:ident($storage:ty) $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(@core $vis $name $storage $(, $comment)? { $($fields)* });
-    };
-
-    // All rules below are helpers.
-
-    // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
-    // `Default`, and conversion to the value type) and field accessor methods.
-    (@core $vis:vis $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
-        $(
-        #[doc=$comment]
-        )?
-        #[repr(transparent)]
-        #[derive(Clone, Copy)]
-        $vis struct $name($storage);
-
-        impl ::core::convert::From<$name> for $storage {
-            fn from(val: $name) -> $storage {
-                val.0
-            }
-        }
-
-        bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
-    };
-
-    // Captures the fields and passes them to all the implementers that require field information.
-    //
-    // Used to simplify the matching rules for implementers, so they don't need to match the entire
-    // complex fields rule even though they only make use of part of it.
-    (@fields_dispatcher $vis:vis $name:ident $storage:ty {
-        $($hi:tt:$lo:tt $field:ident as $type:tt
-            $(?=> $try_into_type:ty)?
-            $(=> $into_type:ty)?
-            $(, $comment:literal)?
-        ;
-        )*
-    }
-    ) => {
-        bitfield!(@field_accessors $vis $name $storage {
-            $(
-                $hi:$lo $field as $type
-                $(?=> $try_into_type)?
-                $(=> $into_type)?
-                $(, $comment)?
-            ;
-            )*
-        });
-        bitfield!(@debug $name { $($field;)* });
-        bitfield!(@default $name { $($field;)* });
-    };
-
-    // Defines all the field getter/setter methods for `$name`.
-    (
-        @field_accessors $vis:vis $name:ident $storage:ty {
-        $($hi:tt:$lo:tt $field:ident as $type:tt
-            $(?=> $try_into_type:ty)?
-            $(=> $into_type:ty)?
-            $(, $comment:literal)?
-        ;
-        )*
-        }
-    ) => {
-        $(
-            bitfield!(@check_field_bounds $hi:$lo $field as $type);
-        )*
-
-        #[allow(dead_code)]
-        impl $name {
-            $(
-            bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
-                $(?=> $try_into_type)?
-                $(=> $into_type)?
-                $(, $comment)?
-                ;
-            );
-            )*
-        }
-    };
-
-    // Boolean fields must have `$hi == $lo`.
-    (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
-        #[allow(clippy::eq_op)]
-        const _: () = {
-            ::kernel::build_assert!(
-                $hi == $lo,
-                concat!("boolean field `", stringify!($field), "` covers more than one bit")
-            );
-        };
-    };
-
-    // Non-boolean fields must have `$hi >= $lo`.
-    (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
-        #[allow(clippy::eq_op)]
-        const _: () = {
-            ::kernel::build_assert!(
-                $hi >= $lo,
-                concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
-            );
-        };
-    };
-
-    // Catches fields defined as `bool` and convert them into a boolean value.
-    (
-        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool
-            => $into_type:ty $(, $comment:literal)?;
-    ) => {
-        bitfield!(
-            @leaf_accessor $vis $name $storage, $hi:$lo $field
-            { |f| <$into_type>::from(f != 0) }
-            bool $into_type => $into_type $(, $comment)?;
-        );
-    };
-
-    // Shortcut for fields defined as `bool` without the `=>` syntax.
-    (
-        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool
-            $(, $comment:literal)?;
-    ) => {
-        bitfield!(
-            @field_accessor $vis $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;
-        );
-    };
-
-    // Catches the `?=>` syntax for non-boolean fields.
-    (
-        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
-            ?=> $try_into_type:ty $(, $comment:literal)?;
-    ) => {
-        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
-            { |f| <$try_into_type>::try_from(f as $type) } $type $try_into_type =>
-            ::core::result::Result<
-                $try_into_type,
-                <$try_into_type as ::core::convert::TryFrom<$type>>::Error
-            >
-            $(, $comment)?;);
-    };
-
-    // Catches the `=>` syntax for non-boolean fields.
-    (
-        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
-            => $into_type:ty $(, $comment:literal)?;
-    ) => {
-        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
-            { |f| <$into_type>::from(f as $type) } $type $into_type => $into_type $(, $comment)?;);
-    };
-
-    // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
-    (
-        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
-            $(, $comment:literal)?;
-    ) => {
-        bitfield!(
-            @field_accessor $vis $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;
-        );
-    };
-
-    // Generates the accessor methods for a single field.
-    (
-        @leaf_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident
-            { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
-    ) => {
-        ::kernel::macros::paste!(
-        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
-        const [<$field:upper _MASK>]: $storage = {
-            // Generate mask for shifting
-            match ::core::mem::size_of::<$storage>() {
-                1 => ::kernel::bits::genmask_u8($lo..=$hi) as $storage,
-                2 => ::kernel::bits::genmask_u16($lo..=$hi) as $storage,
-                4 => ::kernel::bits::genmask_u32($lo..=$hi) as $storage,
-                8 => ::kernel::bits::genmask_u64($lo..=$hi) as $storage,
-                _ => ::kernel::build_error!("Unsupported storage type size")
-            }
-        };
-        const [<$field:upper _SHIFT>]: u32 = $lo;
-        );
-
-        $(
-        #[doc="Returns the value of this field:"]
-        #[doc=$comment]
-        )?
-        #[inline(always)]
-        $vis fn $field(self) -> $res_type {
-            ::kernel::macros::paste!(
-            const MASK: $storage = $name::[<$field:upper _MASK>];
-            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            );
-            let field = ((self.0 & MASK) >> SHIFT);
-
-            $process(field)
-        }
-
-        ::kernel::macros::paste!(
-        $(
-        #[doc="Sets the value of this field:"]
-        #[doc=$comment]
-        )?
-        #[inline(always)]
-        $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
-            const MASK: $storage = $name::[<$field:upper _MASK>];
-            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = ($storage::from($prim_type::from(value)) << SHIFT) & MASK;
-            self.0 = (self.0 & !MASK) | value;
-
-            self
-        }
-        );
-    };
-
-    // Generates the `Debug` implementation for `$name`.
-    (@debug $name:ident { $($field:ident;)* }) => {
-        impl ::kernel::fmt::Debug for $name {
-            fn fmt(&self, f: &mut ::kernel::fmt::Formatter<'_>) -> ::kernel::fmt::Result {
-                f.debug_struct(stringify!($name))
-                    .field("<raw>", &::kernel::prelude::fmt!("{:#x}", &self.0))
-                $(
-                    .field(stringify!($field), &self.$field())
-                )*
-                    .finish()
-            }
-        }
-    };
-
-    // Generates the `Default` implementation for `$name`.
-    (@default $name:ident { $($field:ident;)* }) => {
-        /// Returns a value for the bitfield where all fields are set to their default value.
-        impl ::core::default::Default for $name {
-            fn default() -> Self {
-                let value = Self(Default::default());
-
-                ::kernel::macros::paste!(
-                $(
-                let value = value.[<set_ $field>](Default::default());
-                )*
-                );
-
-                value
-            }
-        }
-    };
-}

-- 
2.54.0

