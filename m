Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011026.outbound.protection.outlook.com [52.101.57.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70058343D7F;
	Tue, 30 Jun 2026 19:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782848910; cv=fail; b=g6Wv0rYhxVDXNsLBrpBuA7PYhU+S3oVuW58g02151NRwKmZq+KcQPGqSzt4OQOp9bhkgEw646pjjw9pMqSVusAYD1IuWx84mcxToe1EVtKSUtrH4TIBFwpgsTdN88DdcLzeTNSr+YXF4L1VqkWzNWQhNfNnxSxe8ERpHqF4k4Rc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782848910; c=relaxed/simple;
	bh=1zV7DAsAlXJsdgZmSLl+6BcFXfIqGXD7YtMpNsA14DU=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dwMtTinOl/tnU8GmDoe+RPB0/pEltmLTgAIs9WqV76hg9f/gDA7/Ekd543mU54ESWBA58O5w8+ne9/iy+wx6+2s8kUlOyAS/PA7q9Ood5USsM50wFnfvBYTpFRAOlP9m8ffcu8gkFd79LFB4QuhCQo+PBWXPAR/J6sQbd1td3h8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=MzcCWOhM; arc=fail smtp.client-ip=52.101.57.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="MzcCWOhM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vGGI0PV6yxx044TVRByA4iwMKOQHGxz565fSNsmXaQ2nMB2ZYVHV817YIyLwpr3FyA7v+dBln7DfLWqdSn9BwURQ3s825sXHYPOUz6UcDkUZ65V57WHonbSN9cp0Z9tv/DpjjV0PTMOUNAOJ5gPU8r/oo6KB0pjjfqD3bbFFM7l5g76FEe8K9vEX1lIrioy6pfqWgJu7sY/SP+SFWMREUr4z8wzEZO9maDnHDQ43esc2WOcgu5Dy1L8/DioSlKkt15BmsCFrTEkoftrOOKxvUlrzhgle3Uv32ngysNW0KHq8DXw7evmXOOc2ZdwZ0pQXyy435+c1eaqiURsiEao6Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/2L+RCeNYqRVS/jqFy/a/UJGffI/6tIssGhCxPQ8gY4=;
 b=gfBCF9kViatXvYOuyONzM9auAhSaulDxrKDe5jIgeKKIjjNcixs9tXkF8C18qT2YvxwC5LdydR5b/fRj24h+7EjSA+IIvubXE5ngI+8ah57woQ4dkFF954SkOWd8qnlcrGdhaDnFzbT7X1Yf1RmauDS6eu5UCn1xJ4HcxmsuK5LNs+qWJkyp7A/HL2TMLG7SyNyur65clXKd4BYlD62zZWlK+yjpKWvOaTnMU1yrJFrYNrGwRp9P+aybpYI8SVm5T7BSY6GlVhgwZGHEpOORUg750WLJ+rnHoxoJ67AeE22aWgSEwRcEGWmdM0RJq31LSZ6bTwoSzO6oOFZgWz2bjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/2L+RCeNYqRVS/jqFy/a/UJGffI/6tIssGhCxPQ8gY4=;
 b=MzcCWOhM/0VahziuBs/xJ0qJpOrVRG6rXVqdMrUpU35rRy5nB7TGPJ7Ueyc56b/biQy+MJibAOA2hDdfCslLMYVRROy+bqjO4t70xpDXR9tZtUze650up1VyPOc/73GQUtoiCIWphJbpGRiS76RHhp9O6Tvksgrck2xenINPqdnt0OVVAsdIRnerYFGUKKE8aZAuj1tC1VUCfmloVRWTa97zPpopDXU4RDVFROXmYBTPULWMyOIrBDHSO+6vAbz3pU/AbI6DcCZsKT99joMlRBmw/iQcCijYnWdC7NnKha30DeLinHrxjx8o43UiQr6EXqDayIS5CBtOPURAj9YnlQ==
Received: from SJ0PR13CA0236.namprd13.prod.outlook.com (2603:10b6:a03:2c1::31)
 by CH1PPFC596BECF8.namprd12.prod.outlook.com (2603:10b6:61f:fc00::621) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Tue, 30 Jun
 2026 19:48:22 +0000
Received: from SJ5PEPF000001CD.namprd05.prod.outlook.com
 (2603:10b6:a03:2c1:cafe::a5) by SJ0PR13CA0236.outlook.office365.com
 (2603:10b6:a03:2c1::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.8 via Frontend Transport; Tue, 30
 Jun 2026 19:48:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001CD.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Tue, 30 Jun 2026 19:48:22 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 12:48:06 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 30 Jun
 2026 12:48:05 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [PATCH v2 1/7] rust: firmware: add request_into_buf()
Date: Tue, 30 Jun 2026 14:47:43 -0500
Message-ID: <20260630194749.1209490-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001CD:EE_|CH1PPFC596BECF8:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee01803-ec1a-47d5-9400-08ded6e08ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|376014|23010399003|6133799003|18002099003|11063799006|22082099003|56012099006|921020;
X-Microsoft-Antispam-Message-Info:
	G2wHrDoKJasjZHdZB98v+xPBm2+3jlYK9EYmNhnZ1hbXdY1RB5nM3MhEXN2g3GDLv62xEBMTJG6tyKdJpob+FuS30KoS2h8jZ1KbB2Gsn7nLJnCZNZYNX9if/X3u+kXL6mHSV2Eztr4rjMFdebhmvqewnym3SMM3ZLHFQD5fhHqeGZ3REuHQ1F/s5iHBGQWArCAv24wrRajSQ1RkUXeEKCrp0kkElJNtylYkwEJl6Gj+PiNUgdFfjl9fvxIMcy/UJNuofde4ZxU33SYLJTFyY8+i3vIN3e0+tZv3HABWPecyl+9w5dHEAsDJYhU9R6uI/1arMY9wqiRGXPti6rCTj6coHxN2+eLrnZAnfiflcTPhnV6bBGJID4tjcsBu0gISCrB4YipNvUYZ9FuLUWq0XIEJa6jP2td+KCpytbxzel9CYiC96wYt34ZI1o7ZUmC2s7aWuKneCtBxK8AbbFAhWihWbC7GgTqToRkL+WUviEmHIRnnVPHQy4QRyM1lvrA8zBAMb8+ipxzyOzh28VdIAc+wctxEoqZyWNbBFPHSrJlF0NT99rLYwvh56v4VczXI1bcwZXw+mA3gpZRkrGCuYFS6Y/hYlJDM2plLrh+46QVAyK0ofprGZW6/zUfPwXYUOxp5sxn1z+wfUZHnyMi0PYmn0zNdXllh8bl9s0HNiSMBRXDo7rs3uGSOWCSv66PO5cfF0j8xMJogeophSYw6dV+eOa0o/p/40Suela2s/ohhfjuHUL6IgZzHrj0bqFP5
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(376014)(23010399003)(6133799003)(18002099003)(11063799006)(22082099003)(56012099006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	iSKD7Lm4DBWIi7pfdH5YWATnLEkc/7sS+2r1fljOY+zm8aXerivsKVAdaaiPN2gJs7yIcFq2rACW7532Zgfl79q1yYywb+bBXlsVOg1QPRC1Bcg/4msEf56kOPeR6CwE29g6c+zjLsGyR3aa1w/Fwy6CqnXfB7ppvlLOj5AMbOtCJ7dh4MhdAPcZzNT/VvNd3hGdAik/d05l1owu714jCIi1uGSkeCmv1qQXfhM2HBbL6u2HxcbCUvmbywLJHh/PhUcFTJB57QXCjcHdt8o18McrtOeh8WSwY0LCpjnkWJwAt2/y0k43SMnboyrvqXp1ng0V9/B0r1acaTu48TAburC0vHXIHmsqJOnirYOU7CoQ95au8ybI+prhEXasCckn5BkSnEd6bchS5zuJ/l6ixpV/AmWWOQYlBxhvrJ2EuV5pPHaKuuBoVz493WAbFJjX
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2026 19:48:22.1199
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee01803-ec1a-47d5-9400-08ded6e08ab8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ5PEPF000001CD.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPFC596BECF8

Add request_into_buf(), a Rust wrapper around the
request_firmware_into_buf() function. This variant loads the firmware
image directly into a caller-provided buffer rather than a
kernel-allocated one.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/firmware.rs | 39 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 71168d8004e2..14934605ad98 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -120,6 +120,45 @@ fn drop(&mut self) {
     }
 }
 
+/// Load firmware directly into the caller-provided `buf`.
+///
+/// On success the firmware image has been copied into `buf`; the caller accesses the data
+/// through `buf` itself.
+/// See also `bindings::request_firmware_into_buf`.
+///
+/// This is intentionally a stand-alone function rather than a `Firmware` constructor. For
+/// the `into_buf` path, the firmware data lives in the caller's `buf`, not in a
+/// kernel-owned buffer, so returning a `Firmware` would expose `Firmware::data()` as a
+/// second handle aliasing `buf` (and `release_firmware()` does not free `buf` anyway).
+pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> Result {
+    let mut fw: *mut bindings::firmware = core::ptr::null_mut();
+    let pfw: *mut *mut bindings::firmware = &mut fw;
+    let pfw: *mut *const bindings::firmware = pfw.cast();
+
+    // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
+    // `name` and `dev` are valid as by their type invariants. `buf` is a valid writable
+    // buffer of `buf.len()` bytes.
+    let ret = unsafe {
+        bindings::request_firmware_into_buf(
+            pfw,
+            name.as_char_ptr(),
+            dev.as_raw(),
+            buf.as_mut_ptr().cast(),
+            buf.len(),
+        )
+    };
+    if ret != 0 {
+        return Err(Error::from_errno(ret));
+    }
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

