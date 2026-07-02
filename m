Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011014.outbound.protection.outlook.com [40.107.208.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A1238D3ED;
	Thu,  2 Jul 2026 19:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020487; cv=fail; b=QAppMD7BQT8yiz20ENNB7L6ohrmm7cA+h9mM4haEHzaTjYgFtFJbvSOM5CqMcVAgRtWnoegGlGKwojM0OzzzI7CM9Pq9wgIcOeJojoldKuJGB9dlrqWhY7dDPcAhQvznHVxf2mK2OGU2OgGX7VTpNTF41c4zgmAPcI70PCrbw3s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020487; c=relaxed/simple;
	bh=yBwdhiaiofw+ZcPTG9caw/d09mNDmfNeMhEvJ4E3o38=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hcf2/GJ3fdqJHajA971xG3IhCk/d6BIy+HB1FQgFijRmrL3xZzFByPcRHdeLgsy62/ubDa9CcfZhOcUh3UjaSVBrVB6mkvl2JYvkFIOFUzw24NZxKD+YymrTyaOIhRJ30P7qwWS2JKOwTH1lXLGVXpoXzYCe0e387LyglSOe/t0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=I+qWg4A7; arc=fail smtp.client-ip=40.107.208.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="I+qWg4A7"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WPBKHjCEGiOvqPTRVGV3WFcAUJOAKrLCvPGYcBIJMvbo9HtnCKpWVHKp4wzb7+MPbno9YWPZBiQp/86CJYYAr2HgMiQqeaM1c+Jfq4RWtQv58vOhahB7surWhJoMQDKk0DkpU+0EqUGMrn9blj8AksNdd2+O9LpEjAbi+4CFQuNF6buleun+4yJepZQLaLdoL4SfPb+twMbZy0NDV7TX07X9ZJNM1eSQNczXlIa1Q2lGAF9MSXw/IpFNwjUI4zJbkmqlrHgaYSch319PMcpgafhev2rmEikAU6MqGl6y4x+VaPwpidVHTSubymrE/BcJM1+YIKOY8Ha8hfoDcaJg3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8osvVTn1w0Cm+LkuvWVVQsC72ZVN/rrtkmRxNfYCsw=;
 b=oDmzfUv+om69B3q/cLFiz42awQCSVylPJrleE1EIWZStnP6OeyNG+I8vEwTZ/IifEaBRqC8pdUEMjKFfcEALuzMJopSxYblD9P7dMNmP8FWeK6qZNM1zF82h51eAyw7zssAmEms/cdxJtPZBEEWEjQH3Cah4W7ymuXcm6yxUJnkonodIdsgIyXvwL6pfLJWODDCX0jLhVmX6gvQySgcFQlkvdiYTFbFOPJayEj6tzpExXHWD+K+hAWZggjbfhcwV9BIw8B1wpEp9ggPVJfzF9dJqlDhUnMEPECS0aa2OtBXnY33IKIv00AhhFrGSojKbv4Z6kPq33Uj7OV5H1FFv3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8osvVTn1w0Cm+LkuvWVVQsC72ZVN/rrtkmRxNfYCsw=;
 b=I+qWg4A79SsI0qIGvzUawDJcDhXhOaXLPr+rjOT6jSY57e3wb6Q/bjG9xmrfzQBXNLzwPD2S8ZwyK0CqidJC9y2DFSAulz+7v7RJ6NZlvv5J3agBYI3bRS+RFruaqQ5ht6FJeebpV02lJqkrhBJNXGJjPdo2/pzugqr6v+XutP8rW+Zf1sV9WtIwHixquufdSmsqYF6xDBcO6Unyn8qUHhbM0jO8UYKVDLrWS19C+RkGkqRYpOtZs/vSqax2nT7n2BZU8XucGA9UVjlAdj4U0lu1Ggzs9W8d/5ooaFi7RG3K45qRZy1aOx1oPByONccBylQ84I8+j/0h5PvuIE9pPA==
Received: from SA9PR13CA0058.namprd13.prod.outlook.com (2603:10b6:806:22::33)
 by PH8PR12MB6700.namprd12.prod.outlook.com (2603:10b6:510:1cf::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Thu, 2 Jul
 2026 19:27:57 +0000
Received: from SN1PEPF0002529E.namprd05.prod.outlook.com
 (2603:10b6:806:22:cafe::c) by SA9PR13CA0058.outlook.office365.com
 (2603:10b6:806:22::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Thu, 2
 Jul 2026 19:27:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002529E.mail.protection.outlook.com (10.167.242.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 19:27:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:34 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:33 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [PATCH v3 7/7] gpu: nova-core: update firmware module info for TLV images
Date: Thu, 2 Jul 2026 14:27:12 -0500
Message-ID: <20260702192712.3450652-8-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260702192712.3450652-1-ttabi@nvidia.com>
References: <20260702192712.3450652-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002529E:EE_|PH8PR12MB6700:EE_
X-MS-Office365-Filtering-Correlation-Id: 13013f35-5125-4a56-c16e-08ded8700568
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|1800799024|82310400026|376014|23010399003|18002099003|22082099003|11063799006|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	0hpOMFAD8Nmrl7HRbBVQKG6vqiNoXpXsRRdnaFCfU/q6VPv6E8UAyEmACuLlUziD1LTWEnMMQqhOOCrl9t6h5QlyllE9w9r8PiKFFbPYY8u5lQmhEtSD9DKYJer6OIGz2fJQyq0rCn7OmGGCSq7xRpR3kV8GVcuxKEMHBx12iSooECzsCAoTlI/viBhbd6H6hauZN+6uNOEPtCLwj//YwQ4x5bQGMzfvjuZeCUZ4m+c5Pgo+NO1IMilvir37oXGJsr+9TmF6+08h23qNONjEHk3WU+JHn7NkKubQjxjBeF8pxBpARmdMFRDdNWx8VnLBFxH15zf6+/c28iImrzoBSk+cRzl5vWItCEy2FAmlKJMDhEXWS8PbyUNc84Z/M8baeV1dicQ8pn0GvJHdV9c/myA2761ZdGQaJug5mXl/sOsf4nUHT+DuUC+Yz6J3oXAmBu5NW1LX6uWs+KZXYRyIaizmHgKk7cw0zFN7vIv6QRHFKOTaeI8tsr85aPa2M50Q7cAHBr+RlRqoDW1j2kLkV47mLIXnomHO6Z+2wSZcdKymVuHuOjdyQrVrsX7iNJPVQCGmw7o87pbKpZoe5ntefqeKbwiC2Iayg0lthdqkkESedUeg/9v7EtaliQOOWg2PcFQh6+0YLRgdXB6ya0OgAbHcGd3F44VY+XfqporP3zv/XnnjkoWqlRFQc0U+YH8FzsXOIfl3rn1u1XmjwimZnQsz5JQOhHRTAetNxfs3Jee4jpzRZe0gmbJuYeVu95wG
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(1800799024)(82310400026)(376014)(23010399003)(18002099003)(22082099003)(11063799006)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	PBYJG5LJaLXD+XC0KNbDDAgZ19WVqcbZwGSz0GD/fww+mph5OXyWMEB/R8TIxjPG+IzGFNPoY1Ru4JzPaohqXdPNt7J8YdSYT9XFPGzHVlZfAEDf5SQAugnp4A9D1ZhHjVBJxiiQl5rWda91v9mUQnt41LOfNnB46AuMUuzusYXWu/+ElHqgssn90lthb2xOOPCNMEAsyZGW/8h6pJhmgQxm1LFzIwZGqEViAezACb9Uearrc3ilLyfujm0rajVOiigUT98hLsKYv17SEVCToYgXXVacTj72AKyGUDiLuclyBQwY5PiX7mwbYyl6fA+um/m6SraTFDiaeChIB6JvFQdc2ZJVYX6H1fnx9nMQemmES3dvtLWtW6zO6Ejz4ALfhwuKJcu8svoxhE9hSjt1RE0Lklx/WaqZBWoneHgGoVRTPF31p7Vtic6I5313YuDH
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:27:57.0426
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 13013f35-5125-4a56-c16e-08ded8700568
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002529E.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6700

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

