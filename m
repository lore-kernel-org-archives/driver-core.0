Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011063.outbound.protection.outlook.com [40.93.194.63])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D91FC41F7D4;
	Wed, 29 Jul 2026 22:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.63
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785365778; cv=fail; b=mhMLoXej3nGSZwxhL/DtK2oBiskZTEq9H2YuTNKTiVfS1/5FA/+Gu5OfrTWNsy0InGNVcuaycfhdsmzRicHaCsTr3q35xv7VrhF3QSB+NXcqOEt7q42KdaT5CJ8EFuqdlHG6IZrk1J1+Kqi0qLQnUILdIuMwgNaL9EHtsM48XGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785365778; c=relaxed/simple;
	bh=tJTs0TmEzrPlf6CBjFCob2zxqIXJo2bRBzPNuuKBG2Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=hB6qjlHUVio/7aTlsUZugLEem05m/pLIh66BPbfIh2GzROV0OHLepAZrpQkgyxT71+Uz7NIadCWqR+dzHsv0lXbgcw6wHqgJ8eZmdaPKrHk75fo+H/PiJoN0dPioGlFZLsXHS+YeI3x/sJBtMzouE3bvISwFNPF+EpQr+gHjoOY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=AeIRzIDA; arc=fail smtp.client-ip=40.93.194.63
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="AeIRzIDA"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=W+iosmpjKRj4uAMUd/d6As4W/0wrsYWRGD1wwhN/obQcSik+kWtOKmc++Y8j746EzF4b6oIlBEcR91nInAAF6tmtUl1/MuDYWHrISgqJINR3MCoe1L4HTjAvtedDV7PxnbHbpcgyYVYfcUYIyUNM6jIOI4fwFQPjL2sgHZVlQPhZsTcK9xBk8rPUzqCVICwTtcGF0iaI59aN3umOk70alouTPiWm1gVGEClCPtD4uue1zPcHcsW/2Juw2fCtWL4oJOuim5Wg4BN7olq2SD3xnyivmzO1BVNrNFQTM5OaiL2CVrh0SzKT1HoecFrtHd2tTn/cNT41eCFntgrHWUw9+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWq+WLGzVItDl9XrFkp36qPheMlUy2wb/a2+QAXtCTo=;
 b=BfsNpANdjNOEpnOXx9rF/o3wov5MYjMKrLOxmE/5+NTV3XPLzMPdrUfxPQ3VqQayjrO6ghSJixF6dEl8g2m26AgveCgEGXkjyHhDp+wEWHB7fuaKigNEf0z9QWzzkCtDeb79N7wwaidNNFq8ere/JbSSB07u2DWD2cj+IjudP3dXyLv9nio/WAEI9lJ6yDm6uckiIxEbr1V8islRMIhNZefG2EwA+RwDgrD2hQVfpg0WMUcrqhiPJHupWQUZI/SOJ3Aj4K/PhbTGqPom32B1u8QlpoT9XNeMJtPZLEGC/ohXQs95Q4hhmUOs9Y/xYm9Sg5pbKjCElrfBCl0fwc3jxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWq+WLGzVItDl9XrFkp36qPheMlUy2wb/a2+QAXtCTo=;
 b=AeIRzIDAJBpbctQm4U4y9VLgMdm7fyf9BI9V/++TMphqy9FzCrOCOC9emviZDu2c7qc0MtJ0/rDqC9NLh3Oj4J3wskUflMhcAK2xSm/NOI74XgzlwxdfurxUvIzrihjS4vbwRi5juQcCxR0cE/wADshPHpeqNfJ+a/kgvICg5cPXgphkcYDNP3IOp90S7QXaHZqmGGDPeXpwOx5ESLUEre/FG04t44bLTrpVjwcmfKXUJMQH/apd38x5mkMInICnC+ASjzxMc0/2pOg8dWKIHnrTg9bvGgNhngBPaFUoThAgNnK2BiG93cVzOnr/Z8pTCRZebaprja6XVWH/qVsWzQ==
Received: from SA9PR13CA0063.namprd13.prod.outlook.com (2603:10b6:806:23::8)
 by MN0PR12MB5954.namprd12.prod.outlook.com (2603:10b6:208:37d::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 22:56:09 +0000
Received: from SN1PEPF00026368.namprd02.prod.outlook.com
 (2603:10b6:806:23:cafe::59) by SA9PR13CA0063.outlook.office365.com
 (2603:10b6:806:23::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.292.7 via Frontend Transport; Wed, 29
 Jul 2026 22:56:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00026368.mail.protection.outlook.com (10.167.241.133) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Wed, 29 Jul 2026 22:56:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 15:55:52 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 29 Jul
 2026 15:55:51 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v6 2/8] rust: firmware: add request_into_buf()
Date: Wed, 29 Jul 2026 17:55:28 -0500
Message-ID: <20260729225534.2046933-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026368:EE_|MN0PR12MB5954:EE_
X-MS-Office365-Filtering-Correlation-Id: daa65496-818e-4be9-8c4a-08deedc49465
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|36860700016|376014|1800799024|82310400026|6133799003|56012099006|10067099003|11063799006|18002099003|22082099003|921020;
X-Microsoft-Antispam-Message-Info:
	/MjQvzi+UjVna3KfDm2vy6ZS6YG8/1O4qPkv68v+vfcISpXbjaeK/VBM7w82WvOa0UlkZDhhDdPDLDvHeEkZPKDTDIvOgDPm7T6a/kVXkdBudtKMrZdsQOQ4gCU355i3a7EFs39E7EFR9omdq2iE/SCCqFUv9KrY2ABN9desiXzmC9t3gni1ohb429dCS+Tr7PGNTiKH0Ez+uGXwHxUGymHY5NulJChlqAHwxM+h8yGXHSYvs9OG6QuQ/9Q/AswlRNtqxvG8DMKF0MwarmHonrKnnqArTuRcNht6F70bLFRa6YFk/GmRBPwe3G0wxokw58BPQH3DfImkahyvHli04+LGGelh3big6CA/+cIWntwd2d0cUl7qoz2meUWY8cC59JcIat40XHVQqNK3jC9AMcdEWuHtscYuIzklJEj6e8aI/S8mAV/e3QPZDUPUOR3z+iF7PrFHR+YIivimCg4dgdLGDyzhSFLXoBXGVq2zdVJ9UwM5zuzbG2U2N17I5pOACqgFw76ok90DRhuQ0O5ZGBTzyQfhKYMhMdb2VuuRIMfSPIfNMSNCTTfvJyLOvdlOUET2GlMDPERq61cLrgST7qEkMUSvNC4GPjMFv689Mhvgj1xRfVTIAMRUYfx7hUZTzWVR5es2mq7FiYukovqrI0weGtZo3SxzTGMqKWeUHNjPCdqjN8h39ypR04WJa4wmOM4sBpXHZiLe4GhTtTkTyNpJ0F+s2z0Ooa2o12aOT5Yv8czCD03zMCwdZuVnyTxn
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(23010399003)(36860700016)(376014)(1800799024)(82310400026)(6133799003)(56012099006)(10067099003)(11063799006)(18002099003)(22082099003)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QmaK8ElJn9XzlxwcqKgoHF2wtOicxGZJKRKn8ootxgc3hiyyML+gKv5DXzJ2nd00ZCT5JlA3EFx6vRhI5bAdDLwq/ZVnHIfxPoy07gw2vhWaYVrX47LiW/230GwcFDSpmuiuO/irwhzS+TX8LDSYCniW4eJ2Ob23NnApiMWQeBAywxpua8t/8o3it6KB0OVl78ngrsoLphZJ25DU1rJKNL6044ld/JVHBDFa3rF2PMDaReZfpiRNqhQpySDNusNhANPyIdn2CU15DCEgTQ0tIta8VdSI2iQNK3CSy/n2PeZQpIolwo91V5arsPPCuZ+LpdFYyCaSd2k6spkPlAbHZfg/tt2rhoOoQrylmPrGRNYulilsFsf6NdnEXMWqGCkgLwlBx+yEm+/EgeYQoKKQZExUTzpW/iG28Xg8NryDiMFQ04KVOc92BdDafJ+r09uL
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 22:56:09.0792
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: daa65496-818e-4be9-8c4a-08deedc49465
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00026368.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5954

Add request_into_buf(), a Rust wrapper around the
request_firmware_into_buf() function. This variant loads the firmware
image directly into a caller-provided buffer rather than a
kernel-allocated one.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/firmware.rs | 48 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 46 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 71168d8004e2..5b336bd1f09c 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -7,9 +7,9 @@
 use crate::{
     bindings,
     device::Device,
-    error::Error,
-    error::Result,
+    error::to_result,
     ffi,
+    prelude::*,
     str::{CStr, CStrExt as _},
 };
 use core::ptr::NonNull;
@@ -120,6 +120,50 @@ fn drop(&mut self) {
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
+    // buffer of `buf.len()` bytes.
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

