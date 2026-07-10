Received: from CH5PR02CU005.outbound.protection.outlook.com (mail-northcentralusazon11012006.outbound.protection.outlook.com [40.107.200.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C672C3257;
	Fri, 10 Jul 2026 23:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.200.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783724711; cv=fail; b=Cwa1BzUWZYVSe1P+YFu2K7qrraxgX0gmhkZphL02TR2G8eS6OykiJGbNMmTuW+HE8vJmXGfX6YZNA3zLlvFZ4trbLdY0HpZ9eYwsl13CQpLjs85nUhrtAMUPa+FZ38rg1TDpjgTIXgE59hx4H0ZAGT1w0n/7z8HGd74IszmJW0Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783724711; c=relaxed/simple;
	bh=Yf/PegTZiNCgQrDeDc9uL+3LUmSUcmQy8gasnkZKxQw=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nTfhWbWZyeSFXkk8D71TAcMQPXitujJAE/KFyS4DIRnsY8vhlFOnJXMsEsal3RjNeAWdA73jftvgExehtnqhBdGsDIbXDI1k9JysjOe/ZnaE+IRJ6/XH9IpXwoK3rl8kfhTeqiRHgQzDuPxFz+zen/dKoyv7nDJGPE0zpDq9NIU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=JAVqwmQ6; arc=fail smtp.client-ip=40.107.200.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="JAVqwmQ6"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wifjebMckOtYRonneTErnFZOHn080ygli3aFnfjYgbjUpdZQkVQvQ9PKHjkwFPKU6AImpzs7l1XKNmgh6Zu90QBgJ0zYs6n3CexUC5HPARUewNz+VUULy/qGjl05hd48dwBDjDqcjgv5rCCX8YK0og36HJV+qamxr1eDyeS3RTrNTGnpezRBORthCm6hN+iuaSG7mCUZvGqsn0ZkhLK2IiEoB6hlyf72w8DXmTXdh/ViPya5KZMsiwiDe/D5hr0vRoBEHO4Jpr+P55tz2vGAjh/e3cnVByrVRyDtysoR5tAi+hraP5KMP1AH7+hLU7utmW03h/BecSec85iadRKVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HAzt/aV5h9qQJsB6z+cJcqJtgdoZSyGHmXchuZwni70=;
 b=l1I+B1pae3o165c3JqZ3hNqlW5OQLMSi/VJ31Jqaff1TPzKF4fhBy4IVVBRKoYhy1MFN/ysYArMEkfNSCcR9TYnIPnlYssDVCmSaMWKVqjpKpjYinuFe4T34u9nv6526Rxgb72Zq43ie++dVX61iX7qi/6XTV5m6o8DK9uPoGmXSZOUNTM+l2AmD1EIfwIZXbt7aud/wp1WEKzOzwCqdW518yNmrkrkmKrNmKFDSJGRqFRXEsoHT4fEqNSV3iwiz4o0GcbSYqf9oLwCM8Ld1Sc89eApErAFmOH54lYqID2thnEaMjm5wEuHNU5wbJtseCPKbbblMP+RfRev5aQYSXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HAzt/aV5h9qQJsB6z+cJcqJtgdoZSyGHmXchuZwni70=;
 b=JAVqwmQ6/d9JS8f+vQu/KYSzoYG7gtZoVxW2eOvTDupBRj0IFKTqEzaeoSegpTn/+bYIqJ6eAgIWYPbiW/xuMyPqJy+vJFzkdGSb3xKJufg4VQbESQeOOimnm3u7/+fMgEKIF8UqsjWcXhaEsCJhIV7XsGzp91cmXQOJtp+nKL323ZQFyDMY8iyW2pPrbfSomRpKW8vMeaiFMaXVGT+EMgoQjzj4thybCOLOA78TjWYn7ewIEa5xUnSudwWsfkjFTUklP750v4TnH4pdaTjnloocKrAJMjkQA6FddyrZDOCXS0n28XwLG/NwO777p8H3znMI8KlJROJ79rU33EXO/A==
Received: from BN9PR03CA0239.namprd03.prod.outlook.com (2603:10b6:408:f8::34)
 by SA3PR12MB8439.namprd12.prod.outlook.com (2603:10b6:806:2f7::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.17; Fri, 10 Jul
 2026 23:05:00 +0000
Received: from BN1PEPF00006001.namprd05.prod.outlook.com
 (2603:10b6:408:f8:cafe::2c) by BN9PR03CA0239.outlook.office365.com
 (2603:10b6:408:f8::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Fri,
 10 Jul 2026 23:05:00 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN1PEPF00006001.mail.protection.outlook.com (10.167.243.233) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Fri, 10 Jul 2026 23:05:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:43 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 10 Jul
 2026 16:04:41 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	<rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>, Gary Guo
	<gary@garyguo.net>, <nova-gpu@lists.linux.dev>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v5 2/8] rust: firmware: add request_into_buf()
Date: Fri, 10 Jul 2026 18:04:22 -0500
Message-ID: <20260710230428.865447-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN1PEPF00006001:EE_|SA3PR12MB8439:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c63c4c1-c9db-4a71-d3bc-08deded7ab2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|23010399003|82310400026|36860700016|1800799024|22082099003|18002099003|11063799006|6133799003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	WTmMMn5xG5ugih4WY/b+JX83Cr+lK6ckDtK4W1LHzc4DkFlRgCre8M8Zuu7pL2+KclBez5QEc5TTRJGGtV+PXX2ztE5QAc4EOVS6FCZLSOa7PX4Vudz0FV4ZD97lsiR/6IkO+MrVINoA4t/qii6fX3u0LUY0JuegCR4qtmnavtQ0/bwzr7dT7DE/40cUu0trlJ+VhS5jAO3Tvr6yTEry272oOOIbM4KIn2qx7TESPMdX9tsYZd3joRkp13qdtJqbh4FPAqSxxqzPpXHE9NCrYunB0z/s1vZ7WJouk15mce8uShyif5M6Ji3fRsfvx1GGrBaAE0oq35919UV5DiPN8dYiKbJGTZ8+6/KOsFEpVoN2WAwCgv2DyCnYZSrQ6DVpM37RNGb7PEyg5kbbjC+5Z/yu2ktJzZ25jw6zFf3B3LGHWiMRPVhqQp3ikf9kI7uUf3iLJDaBfC8oaiplvvdbbP/PYf/IyP4wJP3ur/CJ8nemlt+jDKRMDT1EjYFcmNJI/EhksEy+nokHS/lkgFCeQKlLkLLArbqPcb9RInqQB0YXYBNjD9GIM3Kh+GztbrCE8TWCsaq2spJ5TpMUe4mbLDraoqFaEiu8hJRgI1KzdOOGBNnpiy1wuu42Edqx5/yz/UCXMdR/5cDSX698AyjAfPs+V2x2tX3srl/2Dku9AwfvkZHmTxGatAJQ8oHkA7EJIrhXaL9Abo9wmzArQFR8qcuzASHgvIsvpXApekVzAMs+7Me/hLGdKmRPA/cj8mJF
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(23010399003)(82310400026)(36860700016)(1800799024)(22082099003)(18002099003)(11063799006)(6133799003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	n63lpp6M+fS8RPfMNUT6DTEkpyo7PfHC5vuiRv74/+Pf/HPxRaxtaAzPLygxkslQ4WC8HfzIjwWvgEaiNTbyd0PrUUw9vvbPLErqltKdNzwMDDdpdX0yYrm35eZNdMHnKWayj0ZrLk8x5nJBlO2/NeJv4AVJxt1Vns+2y1EUA++MMCO/6LYgUAJRQnoKBSMb5xVMmavTnD45JFSi8tBvr8tbxwEgcSKngefpekfscBB+7K3yJbf+sQ1lvkR+4E+VT+PWm6S8On+i54lpqe9vdfHhu4p5P7iVBlihBT+OenqfAwh0lTgNQ1mJaugcCLez8TzxlSu+wLOTA4lrN1Oz6YVvvZeBBGJuvfsoY26X3NkNp9UwffBbek9a2lUlzzyivvsamVaTJVRHdml559XYDApxSuoED6dySVWeafggTQXnO++tnt86jXsunKSTVUsy
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2026 23:05:00.2454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c63c4c1-c9db-4a71-d3bc-08deded7ab2c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00006001.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB8439

Add request_into_buf(), a Rust wrapper around the
request_firmware_into_buf() function. This variant loads the firmware
image directly into a caller-provided buffer rather than a
kernel-allocated one.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/firmware.rs | 49 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 47 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 71168d8004e2..84b499ca822f 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -7,13 +7,14 @@
 use crate::{
     bindings,
     device::Device,
-    error::Error,
-    error::Result,
+    error::to_result,
     ffi,
     str::{CStr, CStrExt as _},
 };
 use core::ptr::NonNull;
 
+use kernel::prelude::*;
+
 /// # Invariants
 ///
 /// One of the following: `bindings::request_firmware`, `bindings::firmware_request_nowarn`,
@@ -120,6 +121,50 @@ fn drop(&mut self) {
     }
 }
 
+/// Load firmware directly into the caller-provided `buf`.
+///
+/// On success the firmware image has been copied into `buf`; the caller accesses the data
+/// through `buf` itself.
+///
+/// This is intentionally a stand-alone function rather than a `Firmware` constructor. For
+/// the `into_buf` path, the firmware data lives in the caller's `buf`, not in a
+/// kernel-owned buffer, so returning a `Firmware` would expose `Firmware::data()` as a
+/// second handle aliasing `buf` (and `release_firmware()` does not free `buf` anyway).
+pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> Result {
+    // `as_mut_ptr()` on an empty slice returns a non-NULL pointer to
+    // memory which the loader does not own. Passing that pointer with `size == 0`
+    // makes the loader believe that it is buffer it allocated itself, so when
+    // `release_firmware()` is called, it will vfree the pointer and trigger a
+    // bug. Reject empty slices to avoid this situation.
+    if buf.is_empty() {
+        return Err(EINVAL);
+    }
+
+    let mut fw: *mut bindings::firmware = core::ptr::null_mut();
+    let pfw: *mut *mut bindings::firmware = &mut fw;
+    let pfw: *mut *const bindings::firmware = pfw.cast();
+
+    // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
+    // `name` and `dev` are valid as by their type invariants. `buf` is a valid writable
+    // buffer of `buf.len()` bytes.\
+    to_result(unsafe {
+        bindings::request_firmware_into_buf(
+            pfw,
+            name.as_char_ptr(),
+            dev.as_raw(),
+            buf.as_mut_ptr().cast(),
+            buf.len(),
+        )
+    })?;
+
+    // The firmware bytes are now in `buf`, which the caller owns, so we don't need
+    // the kernel to hang on to it any more.
+    // SAFETY: `fw` is a valid pointer returned by `request_firmware_into_buf`.
+    unsafe { bindings::release_firmware(fw) };
+
+    Ok(())
+}
+
 // SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, which is safe to be used from
 // any thread.
 unsafe impl Send for Firmware {}
-- 
2.54.0

