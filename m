Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012020.outbound.protection.outlook.com [52.101.48.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C8842C3257;
	Fri, 10 Jul 2026 23:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724703; cv=fail; b=KdZ5wG7mUWq9IstosK26b5a7sKcNHRb2JYwBxiw8AyBcxOFCpipz2s4MJMRHg5e/4AB895Fzwyd7/U4AxEwZJmSJkUjaEQGX6WGBKMhkjJGoPpBG3DgDD2KkvAvUdRd7gk4rZV6xaGwqYXQ9UlQdOg2ghWT3OdlLk/HMhQiFbAo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724703; c=relaxed/simple;
	bh=qJx9E1iTvJ7BiYnX/zBPtAAglja43J40FMcEAJMUfLc=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R3ptSpjPCD9bwy9vF2EU3R7b7kKOWdFrcA01cipTkE6yjqnZDLo9nQzIBuul09tZyjSO4dwoJo5ow7W9cOBZwVXIRtEP/BMDiI0Qi2zYaBhaw9d+x/MJ/oDRQxYL0yur3l5VLh4SITe3amSorg20SXW/yL3espimUQu8kOrk7es=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=XS4muzgq; arc=fail smtp.client-ip=52.101.48.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="XS4muzgq"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aBdtU8hF2t5+IFckdR6KkFyWmPB6Z9ALA5s0X4E82S2dSirWNtxI0sizZ4ePmkz824bWmXRLGv2qJH19FLHuukf4D1E5gIox9nzCkiaoca08kXNjcKJtB4DFtfH6gTQep/PM+vPiVuQpC9z1n5C5+CfxKM6qxb3cSPICxP8T7j+p3sKfWO9xJWaLNH8IlRTUNRN+KP7sw0GcrJSoHbZlzfG3XWO6ip9rshPntR2J0u9oXz/3wLoDyLMekzVxYYDRkI4mJyP1P7ce/FR3lcHrcw9huLBsnmSI9goM+Jo9C7xx2ndRrnnW3/DsYr/ZunrVxtopLJahJs6VndpYHuNntA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JXfpNBd3KdJQ+oxR+LxEHLYzW1CRf6frzwQ0c4ea+cU=;
 b=o5XTVVjkf508AnCjvvosBsCDJiK/EmnPlIsYbY9yW6FnXj2zpdo7dYFsvmbc+2ZjbyhPBmfqGnwO+5M7R4E1qmPJzYJi/3txkDhv1gOAVjyAv94NdQ0TMEyoPMlMODeiwMT2PKYwSpfJQxoHIwv+K7qpGtAAclv9nu4P66/RET574DIA99f5sdo9YLqqGW4Ts95eyM96974AJK4gVsIivcGYmjh12sDOKql3mQnzY2UJvh48XA9VrsrhToMhdXQiwDX+4hiMNQwm5dhMx7XFAFf8Um+mGj58uEfVAFTVwaxNAcugHehTanCdLMcSxWPRTaHWSmTHiR4RzblmaEHf2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JXfpNBd3KdJQ+oxR+LxEHLYzW1CRf6frzwQ0c4ea+cU=;
 b=XS4muzgqXw2aL1qeSkcz+2+eO/ErCqddVQ+8oCXh716E2GcQqVQSV079WBiVpSXRwDikRT2/VxoLEuDVL1VohuuKs6M/CmcXlttQL72niZFPJFfPNQ1v1CXSOrPpFdx+ojlK17SXs4xtyZ+1hsFuWWwF3BfnA5TWIeRqA1gf8BJYjhKXlbLgmDNuh77w6vbI7C9Zr91cV53CF00DxCQtbhdPxfFLzqlAulbOV9xSm7pAciFI7RsmyLGHQQN9e9/+QQAUyoRufeIhdSrr8/Zr8qr2FTpg1WeqqUjodK2JA2/1sJuO5BmUoFs624hrRMcTFxpy7tbxsAEWsgYtSesNEQ==
Received: from SA0PR11CA0075.namprd11.prod.outlook.com (2603:10b6:806:d2::20)
 by IA0PR12MB8253.namprd12.prod.outlook.com (2603:10b6:208:402::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.18; Fri, 10 Jul
 2026 23:04:56 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:d2:cafe::84) by SA0PR11CA0075.outlook.office365.com
 (2603:10b6:806:d2::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.13 via Frontend Transport; Fri,
 10 Jul 2026 23:04:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 23:04:56 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:41 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:39 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	<rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>, Gary Guo
	<gary@garyguo.net>, <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v5 1/8] rust: alloc: add Vec::zeroed method
Date: Fri, 10 Jul 2026 18:04:21 -0500
Message-ID: <20260710230428.865447-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260710230428.865447-1-ttabi@nvidia.com>
References: <20260710230428.865447-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|IA0PR12MB8253:EE_
X-MS-Office365-Filtering-Correlation-Id: ea62a528-10a0-43cd-8f6f-08deded7a8fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|1800799024|23010399003|82310400026|36860700016|921020|22082099003|18002099003|6133799003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info:
	IDX1DJYkTiZiijOjas3iORWs5IcNwEb2qQDNRCIayI+VZAgD3lpuMB94as95lgU6g1iMlDAQGo6kPwjkKcaWupQYl3rMfxO/brfvNtOQI+RFyiZ1w+eKO/qwZMljTUSmBtBuWPNycp1Isw/CCm8aO8yWII1wBoR5RxZDi7qUq2ecWmvtkYVecqwxnd1QPEDGAoY5S+Y+REkL7D/KQsEbOX0ow4TQMCA45WdSF2MlybQceON/To8d3AAl+nGX3t7sW8LnkYN72tAzrGTWtiD7iXNsauzaKXn4ZKlKnfyMUhFeIM8leSYhRA3OjOi93Foq9IhRyixpuuneds/j7ZAk7T0+G907euJV8UdP50PjR4F4PAy2H4OjuiEnc35uBDZ2JZcT+abEWXHQU3t4IeSiwZ9Bl6Ec5eMN6F9fwBFalna7pUCTqWMfYFXdX9in4JYXFYSnlT6BVC+VhX4gfQQM8bTIBitQdlqX4oQz7yjtxN2s191vujQXcEo/O+J5odxckgVTiB00Hjz9s2xbHm6loc8e0NY3TmHw4FnwMHVm51MFXyWS2ImyctLw/0SgVggHRanRT0BOTW0mrwc9imNscsDjGmkBN9KpgLvyAc1BbO72BFGtlgVcx7TtN6eEbFO+YtmQg58nyYzxXicGc6wsGU/gf5okYpFYLzyEFlVb/wm63Jt5oMWhVFQGkLO7hny5ec1L8Bm0Zh53BLPL+LqC9GlY0WEfyAFg4cFUNeRvLofs3YhJFvK5KL6uiPK9pOs+
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(1800799024)(23010399003)(82310400026)(36860700016)(921020)(22082099003)(18002099003)(6133799003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	D54neEH1gHzCH65+BQJZ1rxP0X9qAIKBrb6Ni3nH0FUu2/D/g5tpSY9GMZJ4RL+tmeXOjsKpnKEB2/jyrJ8nV6ovFdds2Ky/jdeNMDGVzUY78GdNPxbMYoNzpYxfi/mRha+Egi5tMr7Xn4Kx7xxMHoi4NfRQDjx+jZYK4y0YDggrJ74/0IabM9tZ+fAiWkFsR3bAn6I9CYGq6ky3jwDPVVtH3lI0DtJFrUgbOEMWiJoGuoQaLaOYlq5wzGSjuFBCIDfXLMf+glioXfjdl/n66Rs3jumYrb2SDZqsp5CqQC1CdCBQPbY/Z/fT0w86NGKScVRe72AiC1vw6pYA6NLQE9rlAGT0Zs2KP7me7S+8yGa20Lvk0jQh5F7ZqXcpKNslJE6DKPWJ2/pToJKnES1rBTdVwOcG1JSgjFleXWlq9AoJElw5brUPT9leUJcpfv8S
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 23:04:56.6049
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ea62a528-10a0-43cd-8f6f-08deded7a8fb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8253

Add a constructor for kernel Vec that allocates a vector of a given length
with all elements zero-initialized. Memory is allocated with the __GFP_ZERO
flag, matching the existing KBox::zeroed() pattern.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/alloc/kvec.rs | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index f7af62835aa8..4ca589919c1c 100644
--- a/rust/kernel/alloc/kvec.rs
+++ b/rust/kernel/alloc/kvec.rs
@@ -9,6 +9,7 @@
         Vmalloc,
         VmallocPageIter, //
     },
+    flags::__GFP_ZERO,
     layout::ArrayLayout,
     AllocError,
     Allocator,
@@ -51,6 +52,8 @@
     }, //
 };
 
+use pin_init::Zeroable;
+
 mod errors;
 pub use self::errors::{InsertError, PushError, RemoveError};
 
@@ -532,6 +535,23 @@ pub fn with_capacity(capacity: usize, flags: Flags) -> Result<Self, AllocError>
         Ok(v)
     }
 
+    /// Creates a new [`Vec`] with `n` zero-initialized elements.
+    ///
+    /// New memory is allocated with `A` and the [`__GFP_ZERO`] flag.
+    pub fn zeroed(n: usize, flags: Flags) -> Result<Self, AllocError>
+    where
+        T: Zeroable,
+    {
+        let mut v = Self::with_capacity(n, flags | __GFP_ZERO)?;
+
+        // SAFETY:
+        // - `n <= capacity - len`: `with_capacity(n)` guarantees capacity >= n, len is 0.
+        // - All elements in `[0, n)` are initialized: `__GFP_ZERO` zeroes the allocation,
+        //   and `T: Zeroable` guarantees all-zeroes is a valid bit pattern.
+        unsafe { v.inc_len(n) };
+        Ok(v)
+    }
+
     /// Creates a `Vec<T, A>` from a pointer, a length and a capacity using the allocator `A`.
     ///
     /// # Examples
-- 
2.54.0

