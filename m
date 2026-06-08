Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012028.outbound.protection.outlook.com [40.107.200.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 589EB39A05D
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 08:15:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780906502; cv=fail; b=b7t1HZupGpQ1vc4ljvpa4xJ98Y9OjMKJm/IZ5jmoBRZqjpB6BD6PrTRMzqnZH4B8tHnM6EVN0s46wmG5xT6vxYZ711HZJjxjRZ68DYetYW1oSF2vjItfZWS83rw76hwFhugNRZ0OBrZr2g74ovryIAMAaSpYNdruccylFb82KnU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780906502; c=relaxed/simple;
	bh=S9uf8fJRo5wPNsS6U52J/s1nYmlrUTlSQZ6MQC6RTPs=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=IZukVtibEyza4+fDxC8H8iL/BLGStve7agTjLgstvQjO0OYqhnH15OtxNbiTnrlHKEa+z3g98/KsQEwbgI767q3w9mSDIodK/VqrayEyeZgQiR/LJCzBeYP/xwY+T0e69/orhEX/Jj6mNhs+qx6eu27jlSz/JOr3OvStqQ3EOus=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YMh96/+P; arc=fail smtp.client-ip=40.107.200.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YMh96/+P"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MP56QGO0Z4QivYayLWwS1N9myjwPUqs8kQrt2A+1TpLFkMHpY2we/8DB3bDqdi7S46frtQVabDJL9Bkp26I0uLbf5f4Wd+YpdttumPMLI1itdZVyR374tdrKw9+PByFVzXrJqbMP5tFYeivjDiLFpVhvOg3uFnqkENV8CS0kD4hNrn62SVdqu5RyKeLQxgqud9QeWw8UhfMIyV6YdD9UA+pl5sEoR5xXjdxlP2Fi0n0pFfAiDjkz1EIJrnfnLPwUsXp64zlz7afaEbiHgh9Lj6IKNgLMOL/OSt+PJwEt5qbi11cWLlEqmhaTlQgojJwG04Zp4qFxJ087YPX1kBEZNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WWCuZaSB3wNLYR0+1ZUIQUaGm0CaaxpdYegBeSLR/ng=;
 b=bRUftaNIUGeQEeEEgp9UuaaSJ5GvUj1+ThGBfKLivlglKm4vyzhYhxsabJ51Mme/SSC/TYThI+gneanZANX4PCzfPwIo9tKo7jx+2U/G0K3P+O/yq9twWm0ltQJx1uvkxUNwz54uovBHDa+WQGhBp0ggdXKgvnk/L8T7n6I8a0WoGPl4PEAEDiQh85Lm3R0haLXa05DMs/pxmaE9V4sOa84zSx52HSiNZ6b9bthJM8Eu58B1zqHQZNqfmVeN66zjKJRQ27h6g2AaYjAg+th25zuLN28Vp8+3l8yxqa3eJ3ECkP1ww0PXBrpG0o48CXu3mWQn1TY4hvV+VA1LNbibqw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WWCuZaSB3wNLYR0+1ZUIQUaGm0CaaxpdYegBeSLR/ng=;
 b=YMh96/+PymuoLb6qV25SKC9wN4//9L/EkxZxOjhLZHWQAu3zVLQIZHLZKC2DVtF9P44BZWHA0/bVoTFDYTr8t/duzYxlDc3QD9iVHEct1RHZE8YN4GmA1owiBE8Wkl5IPmWKn31hh2MOlF8HzUKMFkD3OwMDlEBqYZ1713BxntrCAOJfFJ6XpK/d8tzBFUme1NtPdDWeDiEMXE8giB01cXBwwydub8kT99uUkFk9NuAZjxUPBhf4BJO+qxkVbxC58LKXNF2O7w2rfu1rNT+I1CNHvAbrByn5rY6qu+v0XR1IpQ+vGv+9mw9eEZUWPJXPcaezgpnai3qqZeCpHT3Zig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9451.namprd12.prod.outlook.com (2603:10b6:408:206::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.92.13; Mon, 8 Jun 2026
 08:14:57 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%4]) with mapi id 15.21.0092.011; Mon, 8 Jun 2026
 08:14:57 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 08 Jun 2026 17:14:44 +0900
Subject: [PATCH] rust: io: require proper alignment in the safety contracts
 of `IoCapable`
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260608-iocapable-align-v1-1-4d4b5ad2b1f4@nvidia.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQqAIBBA0avErBPMRUlXiRajjTUhFloRRHfPa
 vkW/1+QKDIlaIsLIh2ceAkZVVmAnTCMJHjIBiVVLWvZCF4srmg8CfQ8BuFQG1ehbZTUkKs1kuP
 zO3b977Sbmez2buC+H0fBT+hzAAAA
X-Change-ID: 20260607-iocapable-align-fa8bf1ac7208
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.15.2
X-ClientProxiedBy: OS7PR01CA0145.jpnprd01.prod.outlook.com
 (2603:1096:604:25c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9451:EE_
X-MS-Office365-Filtering-Correlation-Id: 24fd71da-f4d0-4584-c492-08dec53606d8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|10070799003|6133799003|18002099003|921020|56012099006|11063799006|5023799004;
X-Microsoft-Antispam-Message-Info:
	EeAnAHembMIbvJBzzkmevVgEGnqjMJXot+Gdl3+9JD9c37fiX5bzSR3aLQDQGW6FBsfE20sDkGC5Y38bxzqJwXeyPM9KzE+uJ8bN/WI0bYhausutGi8KY2P1XULHCZ5sQAPq+o/7/WoE64M/YSR9MJzqsUFIpaQbkQJLnSvW2orc6utO8/F9QtjuIFUvXdSCvn/BmyjCCcfQ+xQ3dykc1vL/FEH06lPbCWpRk2W5O2deeP/sYbXz8PRG6gVvLhhLJYb4NVCB9pL9Y8SqR0jfPxrt/DKdDrVG4Sz6DQ8OcBqUIW9qghNvi78AZglVZbj7mzdMjWGpoFv9YCVE+v9gL3E5HWXoPesaF7z5GRfVHo4tXb1QI8ITR3pYxfjn1xWmFXM2lZnDY6RKpRWJ4pdTKLsS/X1+ERWZAbipnKs1Ot28PHuFXhght/gYEbo7wVVwXvm3m2SpIA01QMBGiz36/TPq8NMLlSVGfppvDcggNgl9qcveK5ihZmwbAq1ITlcY58tIQFDNQ0zbEfETCoF5pHeV/jKp09VlpJ77Ma4kl6RRwUYzYjiaJNbVxrsRGr7jo8HjITU3Tcsxi4kvXJG2yZr3IK003O1AbEBF0fQKk7CslgoUvxL17Q7lDG9akx395jlYdvvVvguApqp5r2vqVSXln73f0lTV499a76spPHL5Bhfnd7f1mXnZMhkE3OtLLASHdBnW/POLEiJ44Vkzzauikk95XCndAp5uwmazJ94=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB3990.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003)(6133799003)(18002099003)(921020)(56012099006)(11063799006)(5023799004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZDQzblljZ0JjaWJzeVdWc01YSEdYTFM3NlFlRmlWNHc2WTJHMmo1N3RLYkU4?=
 =?utf-8?B?OElzcUFRUWFrYjlTMTZINVdQWWIvbG1vUHBVd2hDdm4wZVJMT2hrdDFTTXVk?=
 =?utf-8?B?bEV2L0p6MnI0VksySGFqZVVyMlRrTXc1OStPTWthUTZ2OWpqbVV3dDdhK0to?=
 =?utf-8?B?ejRuMHFIMlhpbk9mTjdsV0xLc0Y2cldyVGFRSHZVNlh3UHBjVDJnbWhpQWR4?=
 =?utf-8?B?eXJvVTlQYU1MaDJYZVlTVS83aGxWblRXaTFKdm9HRm5EYmRaRldmMlowOTQ3?=
 =?utf-8?B?ZG1GRFVEMTJsdHNDWExDeStIY1A5dWJUeThaejE4UTk5NG04NjE3MkEzOStv?=
 =?utf-8?B?aTBwT3JWbXI2amk2NFNyOFlWeDZ1Y2UxVTBOU2xHc1VnMXIvcTVJSFNNTHhr?=
 =?utf-8?B?am1KR1NZb3RiNTVMdG4zZlY2VHIxK2w0Y042RnUxTVZST05aS21LdzVhakN1?=
 =?utf-8?B?dWZWUzlkZU5na2k0S3dmbTRtUGpjLzMxWXFHWDY0ek5zV2RwNE1KNmczVTdu?=
 =?utf-8?B?R0Y4WWZETmloRFpqT2FaZ3VqL09xVDdCanQ4K0ZJUEVUUjdDSXQzZVBVUDhI?=
 =?utf-8?B?c1hDU2I3a2JveVlGRmJqRXdaTDN5UzJReVlMb0FCd2dVZG1OVjZNNS9iMjRE?=
 =?utf-8?B?c2YvaDdaZGVLVDY4VUlIaVI5L1J3VFNsZmdGMkx2cGtxb3ZVNmtRYjVVT0wx?=
 =?utf-8?B?N0xrUnczSGZuakc0Y00raW9qdWVRcUgzcjFQeTY2YW9JdzAwNDhPcm9tYUg4?=
 =?utf-8?B?UjNGdFEwU1g3RHlGL2NtbkE4RXZBaHRlbnBwU3psQ2VvVkpLT1lyRERKMUVC?=
 =?utf-8?B?V1IwNlBaVGgvT2RGRmt1bU0rQTZkZ2lqRFBRYUNNbEc5MFdyWXJWVENpTFBI?=
 =?utf-8?B?RDM5TFZROGx3RVU3NzNxWEk1bUlPbytsM3V2MEVmMHViQ3ZIK0cvSUZrZEw5?=
 =?utf-8?B?WWNWVmFucUhRSFBqTnVBakdmOUFySU1QVXcyTzEvdThzZWVxUmdCZXJGK3hW?=
 =?utf-8?B?dEhJMTU2N3d3bGF3bFQveDdaK3pERjVvcXlGcWZTYXJKRy9PTjBlRjUycXMr?=
 =?utf-8?B?SmZDeWl2LzVWRm1SdkpnYTZXMFhIWlFjVlBOdEpKc2E4WWVBeFVEa0lCekcy?=
 =?utf-8?B?bGlPVzBWSFZsalNXMnFuV1p2UEJtYTJic3NlaXFuczQ1bTBkQjVOd1NuSGlQ?=
 =?utf-8?B?bFN0UEdjZFBibEg5QnJwUTN4UWtEdHZOVEdPTnZOemxpKzRmOGVRVUFxNDA3?=
 =?utf-8?B?QkgyK0hsVVBndk9LVkRXNFJPUm93Rng2TGMzcCt6RDJEUW5WdFdFSXJNUTI0?=
 =?utf-8?B?d0pBaUJvUlVOQXlKcVlIeUdKMFVKeEJDNGJsOTQ3SWVNWFR1bUo1NHAxaFZX?=
 =?utf-8?B?VG51S1Z6RWlBYm9KTU84Q25DdVUzNDJWRGVpdlI3TEN5ZlVFaTlBVHoyOUZK?=
 =?utf-8?B?OGV2M0NsM0VpY2lpcFByTWdtZGlvYS9wUVM5a1B6bnY4Wms3K3o0RHZzdFVS?=
 =?utf-8?B?R3l2aDlaZmZrVGlzWk5hcGFOUml2Z0piTkJyREpneGJ2UnJFbjZGTDlYaTJR?=
 =?utf-8?B?SzJOK1R4UTlZdmRVdlVFQkxPcUpKemR6VEV3elpSRU52TzMxdWxTbzhkWEc1?=
 =?utf-8?B?TzlJTUhGRCtnVm1tSUIwamxEdlhKT1B4aTAxeEZGZlBUUGd5RldXTDE0UDU2?=
 =?utf-8?B?TnkrL3BlUGp6S2psWFpadWladWduWkhUU1ZocWVEd0dVTVVMTzdRakNDUU5D?=
 =?utf-8?B?QzNEM0UxS0tRdVRVbWxVdjVFQzVQdVdiYkI2bkpRYlVoYk1mbkF6MlNNVnVD?=
 =?utf-8?B?Y3Y3aWYvOERQejJ0ditrOVpHdUE5ak9qTXZxemxwZDNNUXZvRWhFUGFnWmkw?=
 =?utf-8?B?SHBML1FDNW9GcEFUcExLMS82UVRzUVBFbm5kMmtzRWFFK1A1Ymo4eGs1STdj?=
 =?utf-8?B?TDYxd3F2UGZmZGRxekFHVHRBckJPUjVQZW5jK3E1eXIydWlQVjcxTVJIVzNC?=
 =?utf-8?B?dXJDL2lrWkN1NG5aNGljN1Jvc3hFUjNiYllaNVhkQkNuK2FwOEVOLzJDQng2?=
 =?utf-8?B?bUlWS2MwWVZ2bWJ6QzFkVWtYcUV5Y2Jpb0tTUXNvdUFTSEJaWlZ2ZWdTYzVi?=
 =?utf-8?B?ZEhmQ2hBbCtkT0twRHU3TElDZUk1dDl5M3pScTUvY3R5eUErUlJWN1VNOTl2?=
 =?utf-8?B?NkExcXgvWWVaL2tveU5ocUwxRHBaaXArNmZNSFNjWnZVT0JvQzdreDlRUS8y?=
 =?utf-8?B?SEpUWHNQa1lZdmRwYWZFWG1JT2cxaXRSZjhjV0Z2Z2hLMTFFRU1DYVhQbEdw?=
 =?utf-8?B?OHN3V0VFNDFPNm9VWHNhbFBLZDhuTXJLNGp5S0NtbUd3SkpuSlJmQXl4UWxz?=
 =?utf-8?Q?ms9VYhGLvlCCGNb/voSdCG9do9RZSeG9VE7mIgzhf5Gu5?=
X-MS-Exchange-AntiSpam-MessageData-1: mh6FSyXnAXM3hQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24fd71da-f4d0-4584-c492-08dec53606d8
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jun 2026 08:14:57.1138
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dJ0/4yrF5GitYoDHRruoutcMTpGce/aDUAZxht/jWMoHiaxtdcXYieByXq/jHe+t7vZIaGthAzF/CK3aTYJySQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9451

The addresses passed to `io_read` and `io_write` must be properly
aligned, but the safety contract only mentions a valid range as a
requirement.

Add alignment to the requirements. The existing call sites already
obtain the address through `io_addr()` or `io_addr_assert(),` which
both check alignment, so no code changes are needed to them.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
I noticed this when reviewing the GEM SHMEM series; it is probably better to
explicitly mention this requirement.
---
 rust/kernel/io.rs | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index fcc7678fd9e3..854932d1cb72 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -166,14 +166,16 @@ pub trait IoCapable<T> {
     ///
     /// # Safety
     ///
-    /// The range `[address..address + size_of::<T>()]` must be within the bounds of `Self`.
+    /// - The range `[address..address + size_of::<T>()]` must be within the bounds of `Self`.
+    /// - `address` must be properly aligned for `T`.
     unsafe fn io_read(&self, address: usize) -> T;
 
     /// Performs an I/O write of `value` at `address`.
     ///
     /// # Safety
     ///
-    /// The range `[address..address + size_of::<T>()]` must be within the bounds of `Self`.
+    /// - The range `[address..address + size_of::<T>()]` must be within the bounds of `Self`.
+    /// - `address` must be properly aligned for `T`.
     unsafe fn io_write(&self, value: T, address: usize);
 }
 

---
base-commit: 46def663dd34da36464ba059f7cfeacf29d98e5e
change-id: 20260607-iocapable-align-fa8bf1ac7208

Best regards,
--  
Alexandre Courbot <acourbot@nvidia.com>

