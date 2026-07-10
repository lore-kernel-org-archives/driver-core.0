Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011053.outbound.protection.outlook.com [52.101.62.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAB823F927B;
	Fri, 10 Jul 2026 23:05:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724719; cv=fail; b=Reo5udFMkzlk1bsyacXl9io7fO5PZBbXALiIsxUcYiOG97Kl//bLZj2fq9LQiZOTYvexVbz9Pd0JpzlkFhBy2XFC5DC1h6eluLPYsF19QKkDxNozAnc42MRGOFcx5qGQO0JgptDKo0lSIO3vmi2h1HESefRZn4AgU4hqIo++vEE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724719; c=relaxed/simple;
	bh=yBwdhiaiofw+ZcPTG9caw/d09mNDmfNeMhEvJ4E3o38=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cJeMyYL/Ei8rIQ7l0qBpvYN3aW/JsP3Ex4MkhgmJybNATNcuvd05IUMNRli0DkuyPVYja7lpeWHo54yfmwgDvFgBwInY4JcgmikyJbxu/TS7ZCEFWN9aewPjiPTLbrDLPx1flfMN4R7UTX0g1BCfkEcVMAsYkmsRsvih7tgQKO0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Aq0y9OIc; arc=fail smtp.client-ip=52.101.62.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Aq0y9OIc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GVggPAGV//EzXdiNUDuwmuBqJMD2NNtAlJfhdcoAGgLc3xmazJ02dI833lN56vRXc/mwJWEB/qH+ohOd1flvrpZE5X+jPFNWBpukzKRWg6t+/SyPDNC2pqXd/8Y/xNiULGPB/JZXUzeh67n5jDOkxIGCG0WZcTpNGYW9Bic8kdMNpwvL6CScLqT6g/8GFuC9EWY1zKl9Dhyugb5jEaeaJTSP24b2a7sxt475mmCDZ0ujbQ3LWjoJE92nKeJlaJFnfgpmQg3MHaMkRmlNd3RPoqI8HzRMW8fcDqDmnuPgLhZci0FwyFT3HrpZb6uC5lHRwz6fGPrl/BNZrCZR3b7TjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8osvVTn1w0Cm+LkuvWVVQsC72ZVN/rrtkmRxNfYCsw=;
 b=xNitHmNm77w9OunzUznHNdUvVcQqIErK1SUBk1GjwWLy/mNmeVMLlsUK4eB5U4BqUl+JsBJzpOoWAR4pJUGx1Yu6cnBzrQxCgO6yfx5wauyOpSp1t9kZKqxQq4xxB5xQgvXoGNGQ7vaHvKgxHxWnmY4K456AOM/dMWDYkv5VMyGjWGoRXMetUtzj6qkYC1xeK3k1x2QrsFFqIlKBIe4Houq9RV84SbuJ0ORAb8Rt0KFuZ5mX53HhPxRcYHfv+UgP8BZjPIPIEPIpTXgdvienhbHj3H/dcTFVTAkGG3Uj0fPajt7An1QxV1P/nDhYaTwKRNdrfwWxCoh1fFKEK/8rAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8osvVTn1w0Cm+LkuvWVVQsC72ZVN/rrtkmRxNfYCsw=;
 b=Aq0y9OIc/7LcAm6AWbAtDQgWCSPMD8Xatdp478ELmEExeL9C/8Jd1qvK/gMkCggYCE5FqEWNQPGloo8E3dLwT+QNX5a1jQNGvNQdVq7s6JcFzjsFNm93cuat1nAsa6LUC0S6E8eXwFn+0Ux9keF4/LVEJ22/f3eGixWiTO8li6r+PF2cKQ+aRLsmB07rXoKThw6EaoXQg29XLYmxCxh0hScj3B0dIYZtC6/nOeRfsUzDM2HBGyCY1oSeFFCphAmDL4t8x23/G/mW2x3EncZ57nmv5cUhLarIIhab7JJBXofBZhAO+z2bx0W1YZyRuH7oL0Aq/xkZH3Sk+Kjs9LdWvw==
Received: from SA0PR11CA0061.namprd11.prod.outlook.com (2603:10b6:806:d2::6)
 by PH7PR12MB7332.namprd12.prod.outlook.com (2603:10b6:510:20f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Fri, 10 Jul
 2026 23:05:11 +0000
Received: from SN1PEPF00036F41.namprd05.prod.outlook.com
 (2603:10b6:806:d2:cafe::1d) by SA0PR11CA0061.outlook.office365.com
 (2603:10b6:806:d2::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.14 via Frontend Transport; Fri,
 10 Jul 2026 23:05:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00036F41.mail.protection.outlook.com (10.167.248.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 23:05:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:55 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:53 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	<rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>, Gary Guo
	<gary@garyguo.net>, <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v5 8/8] gpu: nova-core: update firmware module info for TLV images
Date: Fri, 10 Jul 2026 18:04:28 -0500
Message-ID: <20260710230428.865447-9-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F41:EE_|PH7PR12MB7332:EE_
X-MS-Office365-Filtering-Correlation-Id: 2558af26-9703-4e06-cf15-08deded7b1e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|376014|36860700016|82310400026|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	j7QQBvapOru0rvrODhTeb7lb9RwYtJHIn+EBbmZdRWpJ23w3MGlGTWsRNl7nyEXRCvwGe4FAQYEVc/0K30dYqkOVeZu5JsAre+JFduU13vn0eHGVXiwCCbPtO0Jc0du5jddJts/K7HQXiTTdaThtoK4g2lfKChHiNvXNUlky8dMBaynLMQvxu5f9N1Uu6gj6JVOjBx3v6zOHFU5F+eWNaYWcgnfg3er43Z9cT2oaSUSggBBcEum1IctpAzE9vfJ22VQYOZVs02J7v9zViI+j0B/l4Po4lKSZurdtibYYA0wGvaDmbZt+hmTD1OdWOQM3BcuUIjgnozwEjWOjyrzfAk7xSgPZ2oujFA7SDdNN58RuByR7CGZeep9i2eaQnf4qvF10y9nW6RIoCSN3yo2PvfMwF8fEGwyQIidLnEBUp07bRTyjS7/rTQzKRhs5T6t1M1hrxJia1NQpaHY4jNyq+nZ9F5jhIOVWEcYt+bzgRGjjgghtAaX3tkt3aZcjZ0H4BQdQGDSBlqQ+4ZNrz35r3O8h+CEuTp43IBGhwi7cVnDxoGpIJPOYBzIrqc/vKSStNkbXprQnm5dHwuw6mxABhFEXZVH1OQFQjIWQ8k9gtpXO6JqCUgWZ2EbjNbTTg2MjbqVigfFkww9AQQsOI4POCo0blTaHPzNnccHZ0zh1m2tmrgOu1eF/KkP7HQaOT4Q9NIK8LZFHgbN5zkq9ulsF+0ak9wrHAF+QYmE4DJHBXRRTSZ6M3dI5W1utQLGFaY4x
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(376014)(36860700016)(82310400026)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	UNPtlsWz3h2jX5SJ9fZrWZHCDWGfUzfB+7Zf2ii+TKwHjijtIZw/mi86hO0JNQqtfDPHG+3scM5M2bMXoUfhc2pK1X0ePr2YAkzkR5BWHXYuH66SF9jDRMH0tlWhV62bEse9KPlL1CmSJ48J/6WYkWqgLYv//3TThvt9JqzW5n7S2o/EDaeOMN33MVeapYfB8MenMawCFn416erQyZ8t5ap7Js2fDcss4CH2M82gRGXgaolQQUSVEcAc+ZUU1e2nm2Y8Z6GskVqUBXW2Xc62rEH8RDNMUCmH6XoFCtRFR/V+d7jdTCbZVngEYBL5BVBPcsn4oQPovMqc2rxNL9+wQjICa4AsTAr7IvvEnaPgeJQCDTr4TjlIy1wk2J+W+lhYm+Ex69sN8QMPkwWDLiN1LQ0cLsu78ZorE3B0YGNWEinHwdp7sBqSxtAySwziD0hf
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 23:05:11.5499
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2558af26-9703-4e06-cf15-08deded7b1e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F41.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7332

Now that nova-core loads the TLV firmware images, update the firmware
module info to specify those files.

Also remove FIRMWARE_VERSION as it is no longer used.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 20 ++++++++------------
 1 file changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 4ea9eef46354..2969f5a9f114 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -29,8 +29,6 @@
 pub(crate) mod riscv;
 pub(crate) mod tlv;
 
-pub(crate) const FIRMWARE_VERSION: &str = "570.144";
-
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone, FromBytes)]
@@ -338,10 +336,7 @@ const fn make_entry_file(self, chipset: &str, fw: &str) -> Self {
                 .push("nvidia/")
                 .push(chipset)
                 .push("/gsp/")
-                .push(fw)
-                .push("-")
-                .push(FIRMWARE_VERSION)
-                .push(".bin"),
+                .push(fw),
         )
     }
 
@@ -349,20 +344,21 @@ const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
         let name = chipset.name();
 
         let this = self
-            .make_entry_file(name, "bootloader")
-            .make_entry_file(name, "gsp");
+            .make_entry_file(name, "gsp_bootloader.tlv")
+            .make_entry_file(name, "gsp.tlv")
+            .make_entry_file(name, "gsp.bin");
 
         // FSP-based chipsets (Hopper, Blackwell and later) boot the GSP via the FMC image loaded by
         // FSP. Older chipsets use the SEC2 booter instead.
         let this = if chipset.uses_fsp() {
-            this.make_entry_file(name, "fmc")
+            this.make_entry_file(name, "fmc.tlv")
         } else {
-            this.make_entry_file(name, "booter_load")
-                .make_entry_file(name, "booter_unload")
+            this.make_entry_file(name, "booter_load.tlv")
+                .make_entry_file(name, "booter_unload.tlv")
         };
 
         if chipset.needs_fwsec_bootloader() {
-            this.make_entry_file(name, "gen_bootloader")
+            this.make_entry_file(name, "gen_bootloader.tlv")
         } else {
             this
         }
-- 
2.54.0

