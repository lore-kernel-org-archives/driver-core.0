Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44AE3CCA02;
	Thu,  9 Jul 2026 21:40:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.46.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783633208; cv=fail; b=Tn5xYC34ET3OlXoZBaLmYdRkPOAuypdHZoytFpQFyoSawBpW1beyi3UdTexR9fRWQJP58sDfY0xU/e/N0tUvioQJTKzBoLiEwlWvh3Ek/yxhK3BIKP+v+FKW47464ohuxvG8869eXeGXZx6MeVF8Y2Gdsr35RLJhKfrRM2VXWR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783633208; c=relaxed/simple;
	bh=kpZicHTqKKK1NqWOnHlRmz4uVlMinwMiEws71v51Lbs=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=E6989lsMEqbGMNVHRz38dKtx6Hi0WcPxA8Ze6+XxZviUOtX4CKPugOpd/w/UnWjbawtl/mqAH9zXt05WJQEG8SCLW3gGPr4kNJSzCccTvDOwMuOQFDNOBfbPPSkybPHiKI+fS4YhxnsO9Fdzy91LmvBqFoh/UXZqzLfXQP01cVg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=ONslVSFP; arc=fail smtp.client-ip=52.101.46.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="ONslVSFP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=w2rLXuCIRJ6J0F0XFNZgGs78qWcOXEbpZf7RqCKgj1Pz6aK8KanKWwWcUyXY2cZSHggcN1q177I3enztkn8DkmPRRaBUrt53uLaxFWkc+6HrgZWPdRBNHhCCbLcPCx9XOztVqOT5RNGZOGKcQRaYJVUNMZfMx9ITP0ANi7lcvcYp5CLzg7nenkG1teihKJR3pX36ZZt8A4+OLKkWvipGd8EHX8h9xi0PsWyAQ7kj+xQDR4p5Bq0/BuZVUGdk6Pwb6ZMau1bC1jNN0IHdKL0l8seGhLHI0/sxBFqZxoYixEVhQbkZ/DSGyCLKutA85o9BZ5WX3P2DlmnvFRSCMJ+SDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rkVSvZNoLynPsbKSo5PyYA33mnnCuvuIH09hVn5Y4Q=;
 b=KFRbDMtTbQnqHPZneSqBj/uhC0XPuNvbg61Xwmcr/G2VGCu84vaSoNlO39ZVMfid0zvkZfbTvf6fiArN7hey82PhNYg70rIEXDZlbN6YDjaXUM6bjrt+895o6ofjTAHY+rLU+O6Y7v2LamUMhmgrNKN0oA2XhUH4k086jtgouGkEhEQnukaFSloDUhtSW8Kg9qH8D97YtHvotehCnyzOGMKWmBX9yjTcolEQQD6Fsu5FEuf+gB8Yk9Cn8uwN61beYzltGCARAwCmn/25JHQ0/TT9eBeQshEtjCZJj8mL/WgYdaYRbRfUgCGE315geD4ZBAfI1cgf3cg5ozgf6vAdQQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rkVSvZNoLynPsbKSo5PyYA33mnnCuvuIH09hVn5Y4Q=;
 b=ONslVSFPd/rNqimsK54ptAe5D7EOv5b65gfA5fHt9trgrSTdDQUQTdY4H4fg8TFWAmhfbM3kizUHb0PXcClCGVOi3VtIrLaWmTjz+YsP0bSY5udubQprRxXmurMf3CCug8XovD3iZRPJ+D3eiCi7Bk7174WSPfoEFKkL/mk063tctSOvOMmZ1+F6VanlD1JF0sJkpKn2HTCCtvMUU6nJAdzvLK6dmOS3fZirBzHAvYzJWA3O/tVjrVJQRdgfPS2CBvZUyW2LQgYNkFKAL8FSkyt2gfvtmdRFsOYTVf5xYCzTXCOxcrSa3aXJlAP+wM23nbfZPhLnFcA38Vstf07nvA==
Received: from BN9PR03CA0678.namprd03.prod.outlook.com (2603:10b6:408:10e::23)
 by SA1PR12MB8698.namprd12.prod.outlook.com (2603:10b6:806:38b::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.16; Thu, 9 Jul
 2026 21:39:51 +0000
Received: from BN2PEPF0000449D.namprd02.prod.outlook.com
 (2603:10b6:408:10e:cafe::2e) by BN9PR03CA0678.outlook.office365.com
 (2603:10b6:408:10e::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.202.11 via Frontend Transport; Thu, 9
 Jul 2026 21:39:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449D.mail.protection.outlook.com (10.167.243.148) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 9 Jul 2026 21:39:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:24 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 9 Jul
 2026 14:39:23 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	<driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
	<nova-gpu@lists.linux.dev>, Gary Guo <gary@garyguo.net>, Alexandre Courbot
	<acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Subject: [PATCH v4 1/7] rust: firmware: add request_into_buf()
Date: Thu, 9 Jul 2026 16:39:09 -0500
Message-ID: <20260709213915.520109-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260709213915.520109-1-ttabi@nvidia.com>
References: <20260709213915.520109-1-ttabi@nvidia.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449D:EE_|SA1PR12MB8698:EE_
X-MS-Office365-Filtering-Correlation-Id: 235f6f60-3610-42ca-74dd-08dede029b82
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|82310400026|23010399003|36860700016|921020|22082099003|18002099003|6133799003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	hpOikVldxes8osUwV0qYS4pwfCmpzro9AKUkuKZnPHs5yuLjuBSAU/p2GUhKd68WjKzdwVYTVP9VVEh5fZI7vNptslcenIPFEXcFYrkK625Nd8CvYkR9/oUVPCDaw74KQIUIgH7mCMil34Wwujb/NEA2GDE7ZuYC2arElHkFiarlDeEjoQ8ZWYx5H2FUwOcpVhWa/eqQGdcG3c3FKCpW4Yuv69XOYswOTeRGt8121m4lLjNjW1SvKq2LNV1GxtUFI6SZhNZAp/sC+Y/1EjR0O71TMGlSnrbnA1Y3+xD4FqKQqwi52gBjf+AdB56hh0lUd+s/ekHlO7lDd16fAHCy6pqBZaYBib72w3b0/cUXidx+Ec6afIktxyWSM9Vft+3dtE7zfIIgjgifh74r3JjitMbBlJmAzkjJzLnPLlT8agVGtwb9GHmtxyHapd7dH6A7QEblTIq+tsrwGwvHpCK2cSiD1DXaQwritJtozfnOIShGywe4vnXNBz2A6r0GiB/fC5F7MBBVsY7sMearOeikRsu0KpBGUuteqSHhdK7FGh2EaBYLHBhmxnGznf3qR/UgVIUVUFOOxOH0EhEQpHt74GQE/w0aYKkqUZndbY3VewEC3IB2cYnca7F30iW4VEzo4H+ikvhpHjZaA9slR6G+fQhhlv39EBbSZ7yhhi3eYxCdC2cELAhCH0EkHpx+w+jB9iYFjain+sG2c/3RFfzdzyrE3pY065XLFpKiGhFdSOO4gaQCVHkP29EFIxvMbG2t
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(376014)(82310400026)(23010399003)(36860700016)(921020)(22082099003)(18002099003)(6133799003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	bSlHOrDeMP87+Yo5WU8iGuhSSWe6papX49z9aLiADx/Ee4AWF8h4gqePBq+6XcmVb2cXlzGOMVKfqMo/gUuJD+HfBt9ZPy85jZqa/ZtAHhFmvm4rebe82RtEkBxOQ/VydSoTjpUHkLHeTbuKNHTagqRbc18caRMQpv1cvk5iGnyR6hQTqGgJ/qECK88U5XI4mFmpQ4xHv5j1V/EIpfcCp4/JqJQZvhrHoJ2a9Eqq1PZHOWTtyl0Y82nH2VCUDty1gHW/60EwAsNecf1q8U3jOnL7dmJk1uIuvb89Ma1dcnPxAfBmCkx9wKDjNO5CHeWpR89GwBt4kE3XYm1dsLJjL5Dr+zRZJErALYocwOzd9BpIH0HxaWo9vtZ3e3CQv2UJ5tUzIAWTCfozslH074vJ01pcv92A4ulH17Ka9pxCagC162qOW40MRXXmOljW0Nga
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2026 21:39:51.1582
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 235f6f60-3610-42ca-74dd-08dede029b82
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN2PEPF0000449D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8698

Add request_into_buf(), a Rust wrapper around the
request_firmware_into_buf() function. This variant loads the firmware
image directly into a caller-provided buffer rather than a
kernel-allocated one.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/firmware.rs | 47 +++++++++++++++++++++++++++++++++++++++--
 1 file changed, 45 insertions(+), 2 deletions(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 71168d8004e2..d72db1fc77bb 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -7,8 +7,7 @@
 use crate::{
     bindings,
     device::Device,
-    error::Error,
-    error::Result,
+    error::*,
     ffi,
     str::{CStr, CStrExt as _},
 };
@@ -120,6 +119,50 @@ fn drop(&mut self) {
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
+        return Err(crate::error::code::EINVAL);
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

