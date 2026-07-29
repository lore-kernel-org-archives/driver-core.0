Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011013.outbound.protection.outlook.com [52.101.62.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 993183FBEC2;
	Wed, 29 Jul 2026 22:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785365776; cv=fail; b=UhMzG/FsG7R/yyq4PMSkm3z8Tw1+rAVWjM0+rn5pI7FQwJ/bJqfWGROtBlWfb0uzMZMefbY6VM2wcsk29OKBpZycWrTu9c4yqLI0/c1BUuZ6NGyn4bBg2PNQAhOciTyDSJcWrQj7Toes5OJ+AdLU1T04vdKZn2OSV7aZ+OuV3YM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785365776; c=relaxed/simple;
	bh=KSU499FpS2ensEdzMHwQrj3Kk9JswOnllbpWCSBH1oo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jsfI4M5jPqT/zvrcI/SFHTowqGUkI3PJnf8PDaWEbrLTjjFIaUMJFpnqZw+DXFtevS5ojOfDJ6aDJOgY1vzSpJZO2HQcYAX4e8834FUHK+TfDuljv/U9p7Ju/+od2nkaEXJVKH4NPnqmiZCxpD8VbOLeXFrT6Q9RFiQOzLgWcSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Qm6BwGWp; arc=fail smtp.client-ip=52.101.62.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qm6BwGWp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CiBoWT3DGYpuhtG0sVmIeYvwPcPT1L2rU/fW+s5QS1ZV5jp0aRmI7OGhqC9McBJg/YypMZAihL9VuoTLvhGH9M7SKXv27SCfphoEeI2u9393LzJYJyrMlOeDjeAizNMvh5Nzey+15OqdNPvHdzv3jlG+77Z8EqM9GuqqyRVXd1ba7dhVifdnhU3LhccKFnMh41Uut++iUdtLu7BAIGqoaBh3Ocuv2Rx3bXzr26TJrUA9Y7o0MvruTV80AKVgX+LFCpRdAkowOG1xbpPM0SO0nRDZlcShOSGNpy6REqJcbrtJwlTFUdgAurbAQ9KfNPunILLG7fk3d7aGncAvgM3uhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU+7PXj57ge8O0m81INIgG9BWvB6BggCz3nlkmTaDhg=;
 b=qypNvvym+hi4R/B+taRbLnipoYkeyCYJ84EsW5bu2LxrlblIs3rAzrLBZDvcQyc3CGXAjyJkqpnSZMFhhbaWV4pqxzz/XM127syllQ+OCArTE6XLkqcoT0Q4qkf4QpxkvgKvIkW68FFN4lB39/PKa2jObwjIyiaGgGER1KwGg/s2yPFrwEWruhgwGFr8nchNzeBRM9322NKcjbp6ohWfqQCRNRfR26OR4I0qEURUYYblMxsULObNJXAoUxUqNGuA8wUMzUC7cQThioQmmZ0zVSLaeWLqr21qyF/4iLadkPxKtGs8YGNQx/wpE3SBnm3+RXRy6zwe3wAifLd8/2DJ6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU+7PXj57ge8O0m81INIgG9BWvB6BggCz3nlkmTaDhg=;
 b=Qm6BwGWpW2QQ64eqOqjbVFkExoo6XV/YGI2xqNbKxyot+kfmLYVikwW2w/smx/cXL53LZJoI94Youznm94aUgtRlYmdetMQ+gEmQeCHCP1713IV/uMXvWy0JUis5OxAnsbQ1GZulTol75Mf4avX+83T7X45IuS4+s2m+5/oZaqFOv4bX7kl0j90kdbSE2Fxgf7EGXPPhqYF+L0hMKV/KbIAEb6hyf+x1omhU7KIG/z/nvNr3jFLNFsV86MiINn2rb80/3x++Po0WtBQsvH8hicGbS+A2pbtEOMR0a6c7cPCIoLyX8dQ2dl61xZS9Wt8PRhUvMErUTO0y9CiCrsG/6w==
Received: from CH0PR03CA0032.namprd03.prod.outlook.com (2603:10b6:610:b3::7)
 by SA1PR12MB7152.namprd12.prod.outlook.com (2603:10b6:806:2b2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 22:56:09 +0000
Received: from CH3PEPF0000000C.namprd04.prod.outlook.com
 (2603:10b6:610:b3:cafe::34) by CH0PR03CA0032.outlook.office365.com
 (2603:10b6:610:b3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.13 via Frontend Transport; Wed,
 29 Jul 2026 22:56:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF0000000C.mail.protection.outlook.com (10.167.244.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 22:56:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 29 Jul
 2026 15:55:51 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 15:55:50 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v6 1/8] rust: alloc: add Vec::zeroed method
Date: Wed, 29 Jul 2026 17:55:27 -0500
Message-ID: <20260729225534.2046933-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260729225534.2046933-1-ttabi@nvidia.com>
References: <20260729225534.2046933-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PEPF0000000C:EE_|SA1PR12MB7152:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f83b57e-de94-42f3-9aaf-08deedc49479
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|23010399003|1800799024|376014|82310400026|11063799006|56012099006|10067099003|6133799003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lEQUCdy+/HzNb3euaPPM8Oi8YAeM+ULgWibglrW/KGPi1NJ6B9SBe8LX26M5hhkPnlfP5w5jt7Ltqu7R2OK1m+NUQhWbXO9jbSkuE/L+wmioNa+2qtdTsTOKyUBDerzOQ+yZgff2U2wxQ8BcOfOlkrBY7imZ3hCmfcyhSgurgNka7WvU9sUJf+V6UswxkyE5lBfk1N3tbXHlpNgB361/U6V2oXVuEA5LLwmdzGdM5uENh3uAin70PEaAM+I7N9nzuUOnbs6UB55mT/mXyoSLCcREBcUgGdPc7uTmh4Vk8+CFag8OF2/wFffoF7Ec/MXycJsUWrAF4hEahmI8dggtOO6Jbl6g7DtD1h5e76LmsgGDnkeRVbwEVPr/epjvorN7I7HaY8bKZ9p6r7i/DPse/2rB39wKT6zFbBLPED/eJRdbEKpTl61+WZn3TQ1DSTBr3b6Y4PyEjwDMkH7WeE6stql1pbvd3jBAfCqkV2n3hhkXM7v2ARvwhebiaclk+d4LG0akRudbYRKutfW1pBKtfAxZn/awxBEE3sUAWwEf4qtMEvvyRDAkDrWCMbZ4aAFc5fK1khPI2X9n1bwBAXwzeIDEH4jmYWmHuYFXzOnUihO5WKIOmBvhuf4GRjVMkxVWbfY1jdYW9efXDppSgVEW6tU86JnqFhoWVhf2ynWAGcdAoplib4imbtHORsRas5ROepJaA1A0xWF8/12T8/Gil0dG9Hc6nL0SuAs9pkY4vduMISUN+Gm8H0xQl1QYGBk2
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(23010399003)(1800799024)(376014)(82310400026)(11063799006)(56012099006)(10067099003)(6133799003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	qWBVqfOLaZUJosQURAzTZRjQ6Gzdc1QfDLY/in/Vg/WUv/8BRDR301YbCBfptoGN7Q68u+sAj91DRvXEqSn04Nn3JBzzcEX4loLISYpvrfDHk7Lsv7cOTO9lExSNLrkk/gQknF858f7LqIzaRFSEjEipH/nqa6il7OjW4E0lk4dTC/399RoqYIyaFnt7U/fs5bOPf848zd7BNPXCZ544N1Ek5bzUAYwIobei3QP5d+gO4l3xKDEV1wR8p1ZTsdRN5pYj+AHjCsSn07H5RQ5IJqMLM8OJiI6rYkJmfRHZJ5LQAJi8axXXVqNoSH+qVM0VyIQzW6m01hbVPpm9ty1UdqS3zbpQjflqC1Hq+NlnmvSohqLg4bc0wVibYiKlgpdoY0bevwLK3sio7smv2/Yyg+BdN6OsBGmB9wi2JNPpi99Uepm/gSCv6ikhmrNfE+t/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:56:09.2069
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f83b57e-de94-42f3-9aaf-08deedc49479
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH3PEPF0000000C.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7152

Add a constructor for kernel Vec that allocates a vector of a given length
with all elements zero-initialized. Memory is allocated with the __GFP_ZERO
flag, matching the existing KBox::zeroed() pattern.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/alloc/kvec.rs | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
index f7af62835aa8..c7546b9da4fa 100644
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
 
@@ -532,6 +535,30 @@ pub fn with_capacity(capacity: usize, flags: Flags) -> Result<Self, AllocError>
         Ok(v)
     }
 
+    /// Creates a new [`Vec`] with `n` zero-initialized elements.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// let v = KVec::<u32>::zeroed(20, GFP_KERNEL)?;
+    ///
+    /// assert!(v.iter().all(|&x| x == 0));
+    /// # Ok::<(), Error>(())
+    /// ```
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

