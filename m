Received: from PH7PR06CU001.outbound.protection.outlook.com (mail-westus3azon11010040.outbound.protection.outlook.com [52.101.201.40])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603E5343D7F;
	Tue, 30 Jun 2026 19:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.201.40
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782848925; cv=fail; b=I891sD8YBj1NAQ8SGIBxtpGRRV2sLClj3ggX10PKMZZu1UZ9pIwJS1CvmMGGIUbs3t9h8SAPZKnCLs94shDSbrPFSR9wxkKlQcjq72A7AgOeVo70IKtFZGx3CNUwopenmlx+Tg96JpJaYgsWCGzczVFUC0qxgf5rOXBgNjbneRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782848925; c=relaxed/simple;
	bh=yBwdhiaiofw+ZcPTG9caw/d09mNDmfNeMhEvJ4E3o38=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gwHohdtl1DQbTzlbqHY5OjczVvusqeHhMm9cSR8YIaqcN63SM/IP8buMwvZNFed2ZqI4BZejwCx0caA28Erwoa1NaL5zz2Q8vhwvVxS1iImZyG16uXRMsp6ExaI++ZrJg5Fidka0XFe6P4rM9ckwZ6T3KuKGR4i7QJjqivYMRe4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=fkwAbEui; arc=fail smtp.client-ip=52.101.201.40
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="fkwAbEui"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KM7fmZM9N3zZ5Pb4EnYwQR/Ol94xycRgEdnGADpM9IaeGZ7ucPGpjnYnbTaL4JITPK5KTEPHGCyQKUtMkSxoykWj2ejjA5WP8m07lxkA6WOIA1978CEFYawVeAW/uhHoFJgUPedrPb5kGvazJOtKqaYcpkJbmFW/S6VNvkmafevesogFtfgEexI7stHJINeis3DxSx9V0wNdpFcmpv5sAD591SYcfvKqHHHmutsQIrU6rFE6EuRWyLVKdmt+v33cba//7fZJkojIg1d06y0AEc3tgNzDCQZ2+4mqQ6QJS/ynVCpIu5eIdBayOgZQRPv+8RmkEwfJPc2HUSwcfCWqRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T8osvVTn1w0Cm+LkuvWVVQsC72ZVN/rrtkmRxNfYCsw=;
 b=v+q2YWHPwE8Owqlsz43nL/5vr/bMEpDY5xVtrIlEyVPaO6jWvGj13IxraiO9m8y1F+to+LNu6nfl0e555uHdQ+7o6TPBJJOnE5FJKftyrMyB6vFSn+TRZK8JJzY90KG5xVbx25F7lxWNJrog3FvA2Krhf+Jl7VP4uTcFSqZzSSZY/9UPVTK4OVGGiT1H3Ib/yjwPQt/xVqCUHX2udquGjBKqISCvJ4076UduMtWD2HNVi8lQJal4JGH7iLq0VXqv+/wQVd63AUf4Oj5eHg5BwKZtGo4miQNaxNpcbqT6N2hTtHny5tiHxv4VQeIYEF6ebX2m4PBNIPmkKS5uVoLYdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T8osvVTn1w0Cm+LkuvWVVQsC72ZVN/rrtkmRxNfYCsw=;
 b=fkwAbEuiYEVVF4eZahhsIvY3tXxqbg0vmuOId8D9rb22yXZDXN0jrfTWWWOMXnrfm5QCJ5KviIRQXYgrEB/NVaG7XCGlsEVGSpIZXm3HDPollJJB1ybeUCqXOOLpUo24Pj4eRdWf+VKgAq3PppP01ZXWTZI/y2sVE1fKxGbyejhYzmh2Qm8Uki5rdDn54uA3+3lv7zYXQtMR7iC4E7sZN82TukCmDjDkB3drAlGpo8VoWDQuO1WZhWhy79wMz0VgJxGeSkU29OSWs6zFQ6rx2PBuyLK1A+ZF0hHI0yxmgsmQ0xSPUiN/3PW+2T1/sN8XqhC53OtTs7HvqGfmWmTVMw==
Received: from PH0PR07CA0087.namprd07.prod.outlook.com (2603:10b6:510:f::32)
 by LV3PR12MB9188.namprd12.prod.outlook.com (2603:10b6:408:19b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.15; Tue, 30 Jun
 2026 19:48:38 +0000
Received: from SA2PEPF0000150B.namprd04.prod.outlook.com
 (2603:10b6:510:f:cafe::1a) by PH0PR07CA0087.outlook.office365.com
 (2603:10b6:510:f::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 19:48:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF0000150B.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 19:48:37 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 12:48:15 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 12:48:14 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 7/7] gpu: nova-core: update firmware module info for TLV images
Date: Tue, 30 Jun 2026 14:47:49 -0500
Message-ID: <20260630194749.1209490-8-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630194749.1209490-1-ttabi@nvidia.com>
References: <20260630194749.1209490-1-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150B:EE_|LV3PR12MB9188:EE_
X-MS-Office365-Filtering-Correlation-Id: 5eb284d3-2fda-466f-b575-08ded6e093fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|82310400026|23010399003|376014|1800799024|921020|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	tiPBYK7MfsiGzI5s+q+UjwOV6lK+BM8/GN2a14LdM3pQadI8kAUQdFIzmcjmAz5JdzbbnFN5BrnvF8vDe6ldQeFHjITPiZlMCO3+vlPJ1nw9+2D2TDHa75IONxOAjUWgX6DBAAGL5oVfNwyFVCWn0q/4v+vM/TMuyxV8VX/xKKx0X+uFskAJ+fGnkqcPLIWnrTsQTN1bK7lvCePxglfuviF+bbBkmnMfu+HNQoq5Jd7zCJmN0LjIQ5OHUlz9mJlX4eIcZcYuml0+eDrNWDCtyXQZ994wCvOqokZTgpsh7pCU7rVrbUXMuA3R7jhi7cKhCjETfjdDKL8RaqrIuXIBhnOIlytCTUmXkKV3ourFKvn39bSm/M9T80msIVa+/I9aAUtHPO0+fqMffBtkvfLFLpr19Um8T5oQXPMXvdYlX2UdJ4YHFy3hJ5tvEMhY1u2sC6OEPnfYJanunRtEbj/MxJAGuqDVDaIR1lCZe9aeLui7L/FmKxMvPJpt/dSa8Z7Nxg2raAy+zR7lLYlmxoOmRMpUUokfPenBBcFOsA8ZYEB0YwD0rluMYMtzStwYy+osAbJSQLQ8g//E9hY70R/lsyPnE6+PuSnxQZ6dutrl85t1pSIdJuwIlDB46jRwDpbMZRFSNctQctz1xzBQfo+oBkbH79mULhS6BY2TYfgu1MfkKf/pRf0KHxYgUKX0tgLe0uSqU88AqgpGVunafzGd36YMwTVdACLzUdu8B10pzOPt7nj+IH1FHT+t10usH61S
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(82310400026)(23010399003)(376014)(1800799024)(921020)(18002099003)(22082099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TqlOZd+8QA1WUD+G8oiiHYv/9jCtv983x2xsPK/gbNaycdZFi15FduaJN6JvMvUhtdtQuPu3LQjq4o+58WN9imljhkcLD/Z88HSsMCoOIvwq3/+hJUr4GAodYJZIdxDw9+46xl23CeTlO78zn0jFL3cP/zbO5ZLpwW7OT53VAdAHI5NJH1OV7HpMmYyHkgdnnAA4Ra+dy+l+InMyCQR1alIPNAGQouMkaNLexhd1yAZDwzi6b+xfL9sYuiwekELEtQB3WorDel2Ba9H1dl1lnFR0ehtVEOxTzhHxIvcqM+oBeQKpvRNC41m5hLPyQ2E9a83Kbsei2B7S/C+8FllgtjYuN8UxiIoZaM1sFL0O6LRilfRT2uRFqlo14AWFavJxY78EjF1Nr+vwhcKOaNJFgRJJyp0aEwPFxLJ3qyU3dG1o9S6Y4vg6YgMvwFrYs/es
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:48:37.4667
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5eb284d3-2fda-466f-b575-08ded6e093fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150B.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9188

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

