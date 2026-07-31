Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010008.outbound.protection.outlook.com [52.101.201.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4459F36F8E7;
	Fri, 31 Jul 2026 20:10:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528648; cv=fail; b=cwggWbmbjmqT3jTf27Gw4T5ZSkzDk25i3FqPIm2AT9mOqQ/xwApbukM2PBqtrnxPsXyJLnJ6rj6DqDkmZOX7V6eqbJHOZWv5BfQ9rD+nQWMUh/Yn1QAZPnNNuu3VCNuIUlF7FOWgOKBYELjbOPteJkzbUlwy+aNAIk74nyo8yw8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528648; c=relaxed/simple;
	bh=KSU499FpS2ensEdzMHwQrj3Kk9JswOnllbpWCSBH1oo=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VKOX7I78vel7x+OnaQH9nqKAA0eqwE5IAW9A8VF4E1NLxev6OH4i0bTGEFw9qVoTunUfnWVwuakylf4j+LUGRMDGvCq53D2vtaRY9CT4o352EbjBBk2KyF1rnBPDkiX/VTUMK3tnoD+Dv2slHPKtisCJuaK5t5ub3u94v3CuRGk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=nveG4mhK; arc=fail smtp.client-ip=52.101.201.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="nveG4mhK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qxDiCpyckCW1fQ9nf/qkDD6yzl7UWxYAmdCoCeu4zrY6XkvaWR6bk7Fb/v1HNSPjiF1+SaCviLfWnH9PZwQx+Q2vMf1EoFkS/dmUb8G348egS+j3CIYBvnYS3+mqIWgl9kKUTGqEXogkds9UXhzWghceNb7FwKjjNVykvrqtUQl7Cd3WpaztUb39gcXiKFSsqNqWb8LM+MGWSBzE6JUBcaqUX3OyuYtxH8ieOFyN/kUcLlgiH7crn9Jid637X4XnNV02lRw9qK/nYJQCp+UV6TtkHR0zNuF8p8HLuAOduFWDMsSmBmJ6T9lzrayWPuXB7rxZQsiJUUQLB1aXharnOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vU+7PXj57ge8O0m81INIgG9BWvB6BggCz3nlkmTaDhg=;
 b=WuKBaV8G5ApWm9H+YWECxv5TdOhLiwvnweh0GUW0uuSUYjX6weqj4lpqfq1Gkyd1e7rgCm5YW0rFH1Y9kUkUHigYEs3ppoYsTU4gN3w19fObgllhQmglLZyuBhC+LF8H3+L4tZOOdFC66pfvLRgELhABxjLMxH0IWCdP7h3UVxhqKgYMmoFc9MFHl5cHcV2g5GAmyTlgmpLSFY1DKRWd8+K6HCb0mAWvxqi3bBOIOEI0NPInafogX8O+eHMwiK1sLwa0Fz4/xEdDaEwQ6bIE770RhFTDN+6V8S3A1gzeU0TNb2FKVg5I7H0Bp6HouW1QJO6JNWMBvw3rXnzB7R6AgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vU+7PXj57ge8O0m81INIgG9BWvB6BggCz3nlkmTaDhg=;
 b=nveG4mhKYLhrBw4n905CaAaI7hfNLBZ1urrzkkQci0zcyUMflJ1HD3TWtzd6p7qrYhnyBCoeqZvfsIJ60hTI9BBZXkRr7iFo/Q62WH2YMToC4QteGFDdpQl80Zo97ihP5ZVLgLFwuuW0vcyFdVerXDFmfxnddRVu9EMfIPmbkzp2jup2a2P+7tLObJh3R5SEeux/b5+Szc8yBUcYCnKbUJoePUpgMWc8a/KGwUt8VBgkj7jiE3baoFbRJAdcNOsF/jdhpU3hKcTaiP4LKYNah5dJ5bE6pyRjcoIqEjJErRB1ATHFs0NufS2iK8KC91j3c87nXgoi0iRjW0L/zkY5og==
Received: from DS7P220CA0011.NAMP220.PROD.OUTLOOK.COM (2603:10b6:8:1ca::16) by
 MN0PR12MB6152.namprd12.prod.outlook.com (2603:10b6:208:3c4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Fri, 31 Jul
 2026 20:10:42 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:8:1ca:cafe::83) by DS7P220CA0011.outlook.office365.com
 (2603:10b6:8:1ca::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 20:10:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 20:10:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:27 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:25 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v7 1/8] rust: alloc: add Vec::zeroed method
Date: Fri, 31 Jul 2026 15:10:10 -0500
Message-ID: <20260731201017.2580713-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260731201017.2580713-1-ttabi@nvidia.com>
References: <20260731201017.2580713-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|MN0PR12MB6152:EE_
X-MS-Office365-Filtering-Correlation-Id: 42716746-416d-4614-a782-08deef3fcc0d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|376014|23010399003|82310400026|18002099003|22082099003|11063799006|56012099006|10067099003|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	e5Dwgprt1vcUAzqXe6IabyffWjMBHPjnrD0QWvYt1TfJ1WFg+nZ3GQJmyfwD1Ok1QMZeA/bWoQK14flnDLrdjbNsxFXy5/hM7Lkf6Vha0lGknbunzIZloBPtWExsMYgRQULBMK3/QSO3+RVnw8AR17SYX8jjF+so3zYOWRF+NIle0Pt6L4DEPhiEi7thbYVsmnZR7wjVzVYXRXswGVpY3objTfI/m15u3ie6C7UaegunnzPWeenHefwCdAFxVaRtAJ4YevoNkBhtu9JGpHYpOMSOkmcibv9ZKrLUJaTCA4XXXBfei11E51mmnS/xeCbX/W5fHJVTXx0z8rqo6HUuVDrfmkSjxaoWjA9/x9X95TRJLWPF0TDMLOtIz9TTzFS3Fdw+T+iON9GxqkVZfgWD+WlX/4AGDGdTbaHzrMizf16OqS3cjn5t/ZgJjRy0/T/72HNV7RDX0atX73jO/z4mVI6NbjQDBQ1sQdbbWeFDq228Wu04z7OTCWMUD/aZfQpKT9Z3/PPLokAZRk814qHLzOAkS877puMxpZbgMZP6p9CRGuVdQlqIWvVicnDAb2P0r0GHcyJulj0Wo3vO32dENBgrbMK554qFu52j/JWKgoZ3DD+nyPxur828gSJQlGA3Y+whk8gSubsE899aFi+xPbnow4BYZWmMUD7Yv+jCgcyjEZtdb0uQ+Up8nfiMRHOwjT98YPXXGD0Hwmmfe3YZJqsLQxjiZ25YuUXpy3rT1c+Q5CNYQCbrvhCsT5X9FYvy
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(376014)(23010399003)(82310400026)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003)(921020)(6133799003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ufbVLeUSRepZ8uKkbs011LzGIZIHkSiFz1Rw2hOEHHQA3KjgIkQ2r6rkgJRKE5HAPsCfVUEX+yOZ8hJ9cSw9AFGObWD+B1XZTg/7MmSiAs9mboDKCwg/RJ6tdq2a2Et/jxWRB8pke3EWLxiztCKz14cDupUZglX0MvDwFTTJEP7r9dnXfZVNpAEeJ9xihCa2v5dUV/xV6c0rvmCkNCx5QWW/7JpeimmiE+e+E86+OgpDoxLu+xF6/vSDsGQqQ5XyFu0ZR3cmd5XyBlMN9d9QSXqEYiLNggXLwvSJytiJDMVSGcxiRgTGfNd2X8T4kHYzABjt3TwetDQ+xZNNxnDc+Z3t8crDd7LMoDlhpBCV61fUmGVRx0dnB3Np+QignGtgX7aCQYgZ2iJSq3sYAEn4928kjBTu+4FftOsvMxYnhWhKv6wBQ3uwps5Gy17T2wFu
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 20:10:41.7643
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42716746-416d-4614-a782-08deef3fcc0d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6152

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

