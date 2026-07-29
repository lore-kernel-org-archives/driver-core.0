Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11010035.outbound.protection.outlook.com [40.93.198.35])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62B503D5228;
	Wed, 29 Jul 2026 22:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.35
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785365787; cv=fail; b=oTcE6CX7mUKf1txofH/3CducQo0ngaCUUWbdU1RTdYXLRq/f6aBx6e9Jt/9+eDuKPceSHLT2XqplkFj/u2DiqmOneLKgtbp/AJS1mh347VTXcIihwdTZg9l42X7jlyVLtS2bzQsDc5oFJh6JufhnQfdA2DiPV0O7RplE9ys0f5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785365787; c=relaxed/simple;
	bh=KQty2OembYnKx1yIkt3Go721I2vYoQy+KpvdIBg9vXE=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nPGjMBrNmk6bMQc1isQTqfIXM1qjqrcNwh7ezKA30yOu9kQDUUwAzXCz/90yzXyBBwHRdAZyYn5ksEKBH3zSSrCxf0H1oFAFiwIinpFQ0KobmDG+/CEQeWwXPjyb+AcM9ecaAXTQEMSzGpt/I5+vgRZZz251vellfqVhKcpGgIA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=TgVS+pEy; arc=fail smtp.client-ip=40.93.198.35
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="TgVS+pEy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K3Kq5aXmFgWQQqeB8cZyaOTUBdbYhdcz9kgBmw4GXOuA1Is45jBZ0NQxl90hGIHmZVH5cOWPBn6jNdEqmkIS3wVuF6L24h3oxEnboCCraEnDou+sI+OHsCFjfUJ5w4yb+IjxSHVvDf5+CzoAdVv6gqxSlNDtcI0jL1J8cGfpgC6DRi0mjsFSe4ZiYsk8xdbZoeL984j0XdSHMnYseQJo3fGY8F75CmQMD55ikfqGogeDJTdTCt+3zBTKrG7mMOLloS4OdHb73ObstoubDqkrBdgqJdaHkJUlN1jctnIo+bVe7QolOET2+xlUHjTeXjt6BWT5WzX8/dcKrVR1obPpkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OMDGvci/QVJqeV/4l4km77juhH8rcfhYskyFFhbfIA4=;
 b=teSCiKm86dZFH5H2R9pqmMReeAu4FFIwSG4O1GJE5YS3hg0PX/IBTJNrzOb3imyHhsGSjzKtC5DDas5BVjl9bVzWordJ43+gTQ7m5lEiI+QR9JM7HIqYUNbaNo9fSIX8OgmSXuQHtzmLQ3Wv9pqjwOO7arr7+tTOyGzXvIFs17sSfjky2LQzphBTIEA1l6txxB2LQAfUCTNrwWciAcr4kM0QY2uQ+diOIfB5upF8h/IM5+wtdIgC0Q2aREDv5bJoQAf2KV7+glKsO+UhHdRY04kzOg38xN5j3Hz/nAWXS9fBp7lDzD54R3tFzei35DWPL9UUWropAtW1+zzNid9bzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OMDGvci/QVJqeV/4l4km77juhH8rcfhYskyFFhbfIA4=;
 b=TgVS+pEyg1NKZZf1n7djKj4HewNSKYjrYT+7z0qfFvRYx3KnEkQ9Eq6HU+/Hyr3Ny8LMj8M3tOirm6YGWf8bLATG5aqZpAzjyXvgVlAHq3ruITQJPC3HsIS5Jv3fJ5yr0XUr0FiWsVty6Ctf83QlIlYFGEKvyHvauqBz7YEfXBABRrwYLjjZPD3HuZgh1hQDfvWhcJ0o3gH7661ex5bLJFtZWdb2U15sCaZJFFR01QXkGwJ+0iFZOd8+nrSXzVzzKIVRi+7f5qytNnD4Zfl4dxqlejXdpQpR4jD5pBihEnZ4uTtPW86+KLATy32be6c4PvJL0i+KgIk4FmSFAxuTYA==
Received: from SA0PR11CA0084.namprd11.prod.outlook.com (2603:10b6:806:d2::29)
 by DM4PR12MB6301.namprd12.prod.outlook.com (2603:10b6:8:a5::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 22:56:20 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:806:d2:cafe::8a) by SA0PR11CA0084.outlook.office365.com
 (2603:10b6:806:d2::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.12 via Frontend Transport; Wed,
 29 Jul 2026 22:56:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.270.5 via Frontend Transport; Wed, 29 Jul 2026 22:56:20 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 15:56:00 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 15:55:58 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v6 8/8] gpu: nova-core: update firmware module info for TLV images
Date: Wed, 29 Jul 2026 17:55:34 -0500
Message-ID: <20260729225534.2046933-9-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|DM4PR12MB6301:EE_
X-MS-Office365-Filtering-Correlation-Id: 02513c5b-0ce0-4737-88b4-08deedc49b2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|23010399003|82310400026|36860700016|921020|18002099003|22082099003|11063799006|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	61GurC8VOcIFSUsjNbKCOQKnCNg38TWqT0682HmEjcRr0/EP2jTbYmsmCZxkA9aYkR9pEgk4JKu6Jh9FNtfKBPjTQwMzm1G8UDCahmb1EBeDUfTPKuek0LUYiprFRG7jKML4SzfRrsOXhZjiGw5tGipmZHBCY6gkV+ytLPb8Lk3TYbRlr3fLVWVdpbbIkGorgwafuAYwwpmN6M4f5Fn4HVyMo/HrzJjQvBlwLS0wq+rR7S0VsPcGpKy29x7kUh68TnhHZcGrQYocjx9PXAWrWOQorLTnyVJ2DUOy6cfitN+CylrneqAVU7ZfO1+JdIxWgERVom7FBqFLKXfXTqULPQ4kUpt/mDB2uPH8F7rQ0bVAkWA6Wx+u6HQz7XxnwM/uSBwEAMk/+wQRPLHynCZnpnA4dt8KU8Eu3NKUJm3gctBfaLrQVQOnsX5HtR1Z+2GSPIjIgYbqtVuSnzrJtdtbguJY1V1WxKbmOMrzKqWg5TnpkG12Tts50o/EI5Z+zSmCqJeECD5u8K2DgYfX4sNyhM2YhLf6FX72ik9wuFQeT01kvrHhh+Yk4JJSenWlZ0BkHAeCpoAoG+RtJGFE4bgDVxXb5E4Z5yCYAgfjx39u5s0MjvGJ76ilKO0viU4gI4hC+j0kfysL6LjaYVJhQ4up+s7RAS4/eyrKqi7cyqc6NYzVp8ab23hb4To1zzCepipGGvQiVOwdzDJG3Y7I1gi35/TH9eBIb9Olm+f+ngGs0KhFmdrdrcLHzsQcUJLDiehD
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(23010399003)(82310400026)(36860700016)(921020)(18002099003)(22082099003)(11063799006)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2eYo+G/bsIA+oiujfIdg5p/Haj7glT8xaryqpqeBky9K9FovTGlIdSLJc8q7F5LgInPl0LtL77ZfwiN5VKV7zHgXpb+HtiF3/7kffToRQi59N5aRKJck0bmKnL6zNlgjSEou0GEMxve38IJiHzTtLwL0QJPKZliCSslIUCcUNW7y6CoHuYIYQSs/hQvD3K0gYtK8mbFIY0wuiKbdD/eesVk5Sl8WompOcmJWk0H4xRORuwflkgPTTkMz63IAxlebGUp8Kda3lrpC4gjWnElhINjokjymWcKom5SsMOb6WCmcaOcgrEL4Sn+AGBSlUeZWZjxbAQZO4JrGveJzeMOqz0mHOGGthpJe/l2sk+iH0kz3L+kVDKwz1nxHdewsySjatQijMhb5l7zXt7T4WetmEbyqMm9oES51StrHZFtX74z0O5ZEQruS8bEzynM6OIX2
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:56:20.4513
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 02513c5b-0ce0-4737-88b4-08deedc49b2c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6301

Now that nova-core loads the TLV firmware images, update the firmware
module info to specify those files.

Also remove FIRMWARE_VERSION as it is no longer used.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 12 ++++--------
 drivers/gpu/nova-core/gsp/hal.rs  |  8 ++++----
 2 files changed, 8 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index d58a3d5770d5..b49613a90bf0 100644
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
 
@@ -350,8 +345,9 @@ const fn make_entry_chipset(self, chipset: gpu::Chipset) -> Self {
 
         // GSP firmware files are always present.
         let mut this = self
-            .make_entry_file(name, "bootloader")
-            .make_entry_file(name, "gsp");
+            .make_entry_file(name, "gsp_bootloader.tlv")
+            .make_entry_file(name, "gsp.tlv")
+            .make_entry_file(name, "gsp.bin");
 
         // Add the firmware files specific to the GSP boot method of `chipset`.
         let boot_files = boot_firmware_files(chipset);
diff --git a/drivers/gpu/nova-core/gsp/hal.rs b/drivers/gpu/nova-core/gsp/hal.rs
index 34b4bb82a999..2177ea17dee6 100644
--- a/drivers/gpu/nova-core/gsp/hal.rs
+++ b/drivers/gpu/nova-core/gsp/hal.rs
@@ -67,16 +67,16 @@ fn post_boot(
 pub(crate) const fn boot_firmware_files(chipset: Chipset) -> &'static [&'static str] {
     match chipset.arch() {
         // Turing chipsets boot the GSP via the SEC2 Booter, and require the FWSEC bootloader.
-        Architecture::Turing => &["booter_load", "booter_unload", "gen_bootloader"],
+        Architecture::Turing => &["booter_load.tlv", "booter_unload.tlv", "gen_bootloader.tlv"],
         // GA100 also requires the FWSEC bootloader.
         Architecture::Ampere if matches!(chipset, Chipset::GA100) => {
-            &["booter_load", "booter_unload", "gen_bootloader"]
+            &["booter_load.tlv", "booter_unload.tlv", "gen_bootloader.tlv"]
         }
         // Other Ampere chipsets, as well as Ada chipsets, run FWSEC directly.
-        Architecture::Ampere | Architecture::Ada => &["booter_load", "booter_unload"],
+        Architecture::Ampere | Architecture::Ada => &["booter_load.tlv", "booter_unload.tlv"],
         // Hopper and later chipsets boot the GSP via the FMC image loaded by FSP.
         Architecture::Hopper | Architecture::BlackwellGB10x | Architecture::BlackwellGB20x => {
-            &["fmc"]
+            &["fmc.tlv"]
         }
     }
 }
-- 
2.54.0

