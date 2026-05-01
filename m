Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012017.outbound.protection.outlook.com [40.107.200.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5AB934D4C9;
	Fri,  1 May 2026 06:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777615482; cv=fail; b=OLVYFCsD0+IWsSl5X5rL70wuCfDKfzEBFLWmwKQtRchbTnhsJ4dXzcGVL69jIlqvW/CkPcA4SPNC2dlHKciY4xoFr3V1J1d4SYu5U4d+FspoZD5ygFKbf7sSf3ZKvs8yBWT9vippQSrUlOaoGKJL2ZXDZm352t388Dkten+lQjk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777615482; c=relaxed/simple;
	bh=fjSJYEPYULh8RvSPD67pmBCbnp0blXYr8tR0yugCaWU=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=dRBztQ52QTaDJO4eXhSPDbSuTA3DdGth9oYEPMvBvOToECfUgfp0RRmCDaRUh+wBGNxqQp+tIHpvevO64ZhVtb8ivWl54va3L+zR6Hcxk7rVj9q74xantizJXaeSsFJvfeGnHZFPDcEGDkXiJv9wK5kscSpCPxMmrX6jdNK++y0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=dR3jjlU9; arc=fail smtp.client-ip=40.107.200.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="dR3jjlU9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L3j/Dg5kqrqBY9orszTCceaslM/2FR5YE7KxpSc7cGalsk/Bgz7f+MAVdNCrxWLM3hATvrGb1KfCZgGXGLbF17uDAJGm42zWGbk/VdwvjPXhM9/E+eyxSTrHrxmLYzXgcwKZDYZ9m5ugVZySqjD+ItwHjbkfVIdM55XGY2si5/e/vkkEPJGm1v0DwCvBb8x9d71dsTvdjZtCytPIagPetfcBRD0eITNx/LXfL5eY7w8Up+tI9a9+UYzw9bEIbzFGEtexJZTUeUEsi3zPrQAKWYsZlBnRV/ObaXR7A4Z2MDX1LJdBIWE7pTpZZm3Z5g45eZQCsgtKPWs6v/TgdAgqTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kaUwfN8D+p4cTRgcYePzP3koNrYATKjVPot5EVr+kaw=;
 b=FJ+n1xiXJBgULeVtw88pntcuXGb87PQ+l4SqQgiswsRElZ6fHCe4EJHLhKZw8WibxCVKq5bLHjUHf4LYNYGoeOhYSAfLkr5jtKglN0hu2XHAN5PH+ivZKIqXc5bL+n0FC9S0MI/SBnL92AIN9ac4cyJzrCUQwxrPiS68nR03L/yYOkcKD4+vbGVWD0RqBlRJZ4idgeNMdgRncH0f+IuHMFsEOiLZc1pWft21krefR06JES8SM0K2xzIlarYFHOxFNfmFmA8aKEjMiZW26OCGrquqdCN9yGDWQ5UdBcx9ETXKzl6vURyribPtg1Az99RTzv1RZ39IBckKRfGxg+NkfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kaUwfN8D+p4cTRgcYePzP3koNrYATKjVPot5EVr+kaw=;
 b=dR3jjlU9i/QZdqKkncp9olbIRNTfdGIJY7qUEGXJeGQ2sSkz5ObMi//qrvq/ozQPsjPmfKXxTfWLXPcet2NzvpDNIrN9MAnU4WzUMC/omqbu3COkxSSddnvUtLDG9nYcBCow0KgiGLOLLYZdwdAYT1wefhCwXfzvDVJs2L5HGyWo4Nla4Xah4uf0L8IsWW11t8xEBelZ//nOQ0P73IT4hZ0nCWFitDn4Ki8y2PG3KvHZJHFwtH9d7iFw/lA5m+Nwtb5XtW55WN1oE/JxLweg2DXCt9d6fR5BeGFdFCAgaNU1wbwEqvZRyials64yMERuINHgxYobG3c3M1KwB20/Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB8584.namprd12.prod.outlook.com (2603:10b6:610:164::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.22; Fri, 1 May
 2026 06:04:34 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.20.9870.013; Fri, 1 May 2026
 06:04:34 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 01 May 2026 15:03:22 +0900
Subject: [PATCH v3 5/5] gpu: nova-core: remove the driver-local `bitfield!`
 macro
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260501-bitfield-v3-5-aa1076c3337d@nvidia.com>
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
X-ClientProxiedBy: OSAPR01CA0232.jpnprd01.prod.outlook.com
 (2603:1096:604:28::28) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB8584:EE_
X-MS-Office365-Filtering-Correlation-Id: 12768989-a882-4d4e-bed0-08dea74784c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|7416014|376014|10070799003|18002099003|921020|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	9s9yJMtbhU2s8wVYwpriIyBOZT9Prar8zU1fGr1Dum2sI1ylQhPc5f9mAAmBLBn4JcqT/juaHq3SBNzYS/7RhatwNRJON/5iXIofkm1bqA5yE6D6yf+7gCvjGMUu1FGXdsSz2v1HcRU9777BJNawPvLBmF7MK1NZaDnFwVOdHP3hIsjNAyeVzJC8IGQOOLTibd2UloWZh0EiYYsZZvFbH2kXkzg5RsvomQZXvcbUp3+Hcp/S7pAJo2276qhMCSyBhw6obghlKkQrWHwEeLJJiXkOpRXWrVqZSJdCLGe54lIg635m/eAgyvKCie4Mz3H19LQyPJsi6VIs2i2mdBPuT5WHZlYI5249A4ckrBGWem6mRcJbC96KNRwmmtcOygusXJ6NnQ37QriPvI9J41wLlwnrPq2CYxAHd6Rn+teCABeb+/0mkLJdi5082kRd3rYqUwphIALNioqpIejIsKBIAoW6JOz66XNgehLRsJsWhCIDvZdjwmy/TVF/9OAB8ZN17EHmYjCNdLYGE9CCrD+xcS6FatUf4VZvdqO9h9XT3ziAq5V8gFaGPAsCjCdD85bQIMyX55icy9qYiagCRYGLJWL838TCjYR2BIj/93zefA8WE7yF0e1FjLwMtZOI2tcx90J9uFqryndjkP3FraFLBMTizbMbDXEVMTnaCozvsiKbb+QkSR/t48U+UqKvfiSDXR/G8zamKUerFVTFURhenSCvirErZmjpil6FndRA598=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(7416014)(376014)(10070799003)(18002099003)(921020)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NWJyd0hVVER6ZFZVUFN6UkNVUDVrTWl1NkozRHlFSGNjUWNoYVZvS3RDL0pI?=
 =?utf-8?B?ODlXNEF5WEhkYlhXRThyZVZ0NjFWNytaMkhpanNnTDdhOEkrQ3V4OGlIcDJu?=
 =?utf-8?B?azNwUnJKZDFyUGlXT0xoaktiOWwwRCtvSmw5dExLV1d3MHltbDlDM2dpZDNi?=
 =?utf-8?B?U2xZd2wrSjJuNWVmMTBOOHAxQk0zWUZBcWxhcUpaOWZJTWlJR0YzZ2VHRXFZ?=
 =?utf-8?B?TmlDbkUxTWlBUzhUVXpVU01EV2l4UThpVkYzVUFtU2toYytSMXJuRFd0NjdH?=
 =?utf-8?B?VW92dms3UTFVQmNVKzFBMHk3ZXF3bzgrV2VNU3ZxQnJPWHY3Z0U5MkF5YTR1?=
 =?utf-8?B?QVpXOWFVYSt1M28rUDFoN1dlY2Y5WlRwSGV6eWp6cEgxOUE5eStYYWZOOEVi?=
 =?utf-8?B?MEF4cDZrS0pNd3A1Y09ZelBkbXN6dWxWMk1FUG9DOEtkYy85YVlOaG5hVnJs?=
 =?utf-8?B?TWhCdG9JWEo1N1lJWU4wdzhQVWVmOW5KRFpkSGUxUG1GM00zQzhiRURYTjcz?=
 =?utf-8?B?ZEd1V1laWWhwV2loc2Y0clNBNU9OMWFBQkdDMFgzQVM1a2VBZlNJY2M5ZStq?=
 =?utf-8?B?VzI1WG8zbGVVWlgrN2o5NHEyM05FVXlUK041alExYkFTM09OUHJGbWZrVis4?=
 =?utf-8?B?bG8yNVJEemtOM1kwRC82M1BlM3BaTC9aeEFSUHdjdmZJVW5raHBNeFlVQURa?=
 =?utf-8?B?K241VUw2TnUyWkd0VWZFOUJBcE9wNmNJTDUvOW83VVlRc29tRFloQWtXbCs5?=
 =?utf-8?B?dXozRnYxOTZDMXpnTXFTaFFmUHdSaXI4eEw5WGl2YzZaU1hXUWRoaXVQWVBT?=
 =?utf-8?B?MUpnRXJrK25VSk1OdisrZDR6QTJWSzRlS3paL2VRaCtyeG5WcmgwU1lQNk5n?=
 =?utf-8?B?bmNnMUkyRXZIV3lsQmRUTUFvdFVSZ2xTcllxdXdJaDBTRmQ1L0JuakNFQmEx?=
 =?utf-8?B?SWE0UzZVZ1ZzWXgzbmJxbVhxdWEvZG9EK2Q4Z1BCOVRoWlNxbnpXZVdjU1BB?=
 =?utf-8?B?K3dlVkpRQVVaSGg1a0Y0RzFnck1TUVE4c3grNHJKcUZaR0tsSFh6SWdhdGxH?=
 =?utf-8?B?dnpXWkJ5SExTTVVyVnNiZVRPTWYzclo2SHZkRnFxK3dBUFBDVTR6eHF6RGZu?=
 =?utf-8?B?elc2NFJGOWM1bW8wc0JNNktWUHdXQ2FpZXNWdUd6b1VUM241NytORVh1TndH?=
 =?utf-8?B?SE5aY0sxK3NqUHdHS1kvK2svek9jbkFkSHY4Q0d0bzJnUVJRT2twRzZhS29n?=
 =?utf-8?B?b0RTcXJZdElFQUwvRjlRMGpPemNLd3R0Vmdpa0gvbjdOMEJvWUx1OHRhZGJ3?=
 =?utf-8?B?em1uaVFSWkF3MkJuZ0Fzd28zNExTZ0ZSQjl4VTBRTzVmZkkwb0NSK1g1Mk5z?=
 =?utf-8?B?aU4wZTI4N2Nia0F4UnA3YUZ4dFZlM2xXQnpkRkRmWkZKaWFWVkNyK01WT1Zr?=
 =?utf-8?B?cXoyUXpNc2thaW1BMlQvdTB6UkkxSlpydDFmcnovUnYvKzkvYkR6NmN5YVAy?=
 =?utf-8?B?MGcwZWRjVEM3RXVNcWhtV1pkVDhNdVAxOXVhM2RrRWY3Ym5WUFhlU21rNHJ3?=
 =?utf-8?B?ejdqeW5WSGU1b0RnUU8yRnlDMzJKSjRUSURHQS9zV1FHQnVEcy9iK28zVlc5?=
 =?utf-8?B?eTZ6MTVyR0FicnZTajlnTi8rM1ErS3dEUU1aTXMvTzA4cUZWNGFNTGNBalhP?=
 =?utf-8?B?alhkS2pqaVF6L1NmanY2U2xkeHBWV3JieFIrQW04SWJ5VEl3eDBUSGJyNzZC?=
 =?utf-8?B?NXkyRjZRSnI2RXpRMnQ1WVlTN09ST3VOWUZSWmlJdHhSOWZ2VU1ETVNUMFJq?=
 =?utf-8?B?TFlObU9vQzVuYXJ2NUtnQWo5eC9velUvMlVZbW0zeTlVUkJGbUw3alpTeDVG?=
 =?utf-8?B?c0xtR25nTER5QmZlajVRU2daRmR4Qm5Da1hjOENGQTc3a3l3aEdOVUtWLzcw?=
 =?utf-8?B?K1RpZndmdDNTTFpOR1RmTmozeGdNUWs3aUhrUXYvWjkyYXJIN1Y2NmZ2WjVp?=
 =?utf-8?B?UnpybEZvVlBjbmtJVnRTRzV3dVFJQmROZDdSUXUzOHB0ODdRamVINWhjNjQ4?=
 =?utf-8?B?QjZreFdob2dTU0dYaXdpTlB5NUsxNDMxOXd5ZTBmOEFMSzlDOVBOM2lISS9j?=
 =?utf-8?B?dnhYMS9LSEZGOTMrMUN5WnNDMzdYOU1qWlBJVk00RmJpb3BDRFdlTXlYUmxC?=
 =?utf-8?B?RmxoNVdzWUlQVng4RXcxSDJMRHJlRTdoQWdNMWg3dkgyOURIaVd3RnN1cTJ4?=
 =?utf-8?B?UVNQMzl0MDFsd21BRVI1QThtZWpWckxVb3p6SEQzTGErMTlGN3Z3ODVxdW5u?=
 =?utf-8?B?Ym9sNi91V2lwaXRUU1hvOHd2b3VYam5ZKzAwZk9JbmlOWFY4dUpLc0tsaVJ6?=
 =?utf-8?Q?vfXwE/j5ozWlEDyT3TIXnue4pzmcOq/qepJUFHbUOHvWB?=
X-MS-Exchange-AntiSpam-MessageData-1: +Ie3quflMwQqww==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12768989-a882-4d4e-bed0-08dea74784c4
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2026 06:04:34.8111
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yzdv+mipwRNqmqcdl0KqiMWsvX5TX2bHmdlr1JUIHECWshN4N3KpfUS0NOtrgdWHeTTO5xRuNvmJurQ5DebKyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8584

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

