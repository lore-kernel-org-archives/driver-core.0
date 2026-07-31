Received: from PH8PR06CU001.outbound.protection.outlook.com (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F9372ED6;
	Fri, 31 Jul 2026 20:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.209.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785528649; cv=fail; b=Tmq1ZZMtbho3DbdlWmMw4m4Ratz1DpXM8Q97aUs2ZVx1BzCOptLmkAfMGKSMcJXIxmEuMzffHr0AYdTA5y5TnW6H4Yfoj69jYtpoXV6Dp9u2WBG7Nl7ao0f/cYzy05ouMDARdVZ9XtYjPOnP/t29oeshbBXn443kGDPCXTHHV8o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785528649; c=relaxed/simple;
	bh=tJTs0TmEzrPlf6CBjFCob2zxqIXJo2bRBzPNuuKBG2Q=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GC7vMmbi2GMLAA7XBV9ZFNaqRlVJCLKTNzhaEHX/J+F8OAWPBAdD0T+iWPfadk6eS3L8grdS8PBDpa2ZjTk7itvQ+JsbFZeVCqr7nzUJ5gF/PXFrrHAc5kW8Zo8ftrGWs4kVMmhRhHhaO5LFcDOxBupSc5++VJhMHPVB59m8tnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=eldPwleb; arc=fail smtp.client-ip=40.107.209.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="eldPwleb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j1X3Nwa+8WPe9dcUSNgO+C3cy97QeWKn3iDt+L899h9JcA5bCnmvG8cmr/cvaY9/GEcPDjIGYEM3QhzYeeW5rADDPJxrueOKAGSbq2W6ee0VE5bNlmTtjDNE7ob5calI+fu8jXEl3IC2/eIcyDCjgQoc27b5xvOlOjng86H+yytlOBZa8VTJc9wTBvjzR8VOSriJ0kXjgHaHgjgiNh4rezFYtW9rYiephznfG6DXeBrzw9YwZmYuook+DuhCDexWgMywurjXYl+yJxReaCJtSzf4SXLeBrRpBraKo0VmXKlpn+0CxIwNhRTGE3AXMVA3V/R860WnUezLXC+RCA4Q1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TWq+WLGzVItDl9XrFkp36qPheMlUy2wb/a2+QAXtCTo=;
 b=c9weDXiUVGK8UPVPY7aW0/z9BrjpVu85229kF1+TJgoLj6DK3bXPcKPXx6vGP99fpLdUTC9iEIaqNO5z315ahs0wENWiSUhvCGf62PBSY8m6YfzCkixBio07fUjsviL5OTn8MrYayaWk0NbxsEyU4AGyw2RjTd9L2jqEdlAQGH2PTZDk74hA2gw26Gx9jqQkTAOdw0MBxgOhAbCf2+zxphmJ2PR9tkNd4sz2E4iwQ8ukN2vNIHwAJTd0dtOFmbQ+HMfthLprZ9yBP+S/RVoG9ps4F2eGKDMnnq9zMuQHDsDjK8EdpO3Fa8KGLjol7A6HarBwYiGdLXPkCDZhq22oxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TWq+WLGzVItDl9XrFkp36qPheMlUy2wb/a2+QAXtCTo=;
 b=eldPwleb/6YL+vjGyZlpAh6Z7t/xM8/aOxOtlnwYK/XiVIkytd4myK81yBdQbloNuVXY8ht9dQkjzN7hJcX7CZ0tLRm6i7ibv09x3e2Bmui+4Q/55K9IlUWK+oySs2NNSMm1wd9f63H072Io3LTc+iUnQAFGecWMva4sLMEsWI6ebgeOV5PpG/WI2nSTiKZH5n7an6Jn5baYTxhzLenXHFvH7j7oQn9jMo0A5jK3e85dq6WhsyuyowDl4RfOV/Epa6diSJv5zH0uuAwTt2XA4tBe5CWOSAX8BoVdSDCBAU4PZGRULQ2ECEroWzPNKOrkwNyEyEkY2QV7QLYxE74q7A==
Received: from DS7PR03CA0054.namprd03.prod.outlook.com (2603:10b6:5:3b5::29)
 by BY5PR12MB4228.namprd12.prod.outlook.com (2603:10b6:a03:20b::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.15; Fri, 31 Jul
 2026 20:10:44 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:5:3b5:cafe::9) by DS7PR03CA0054.outlook.office365.com
 (2603:10b6:5:3b5::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.270.16 via Frontend Transport; Fri,
 31 Jul 2026 20:10:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.292.8 via Frontend Transport; Fri, 31 Jul 2026 20:10:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:28 -0700
Received: from ttabi.nvidia.com (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 31 Jul
 2026 13:10:26 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, "Gary
 Guo" <gary@garyguo.net>, Alexandre Courbot <acourbot@nvidia.com>, "Eliot
 Courtney" <ecourtney@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
	<zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
	<driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>
Subject: [PATCH v7 2/8] rust: firmware: add request_into_buf()
Date: Fri, 31 Jul 2026 15:10:11 -0500
Message-ID: <20260731201017.2580713-3-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|BY5PR12MB4228:EE_
X-MS-Office365-Filtering-Correlation-Id: b9933986-8b1e-4d8e-227c-08deef3fccb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|23010399003|36860700016|376014|6133799003|22082099003|18002099003|10067099003|56012099006|11063799006|921020;
X-Microsoft-Antispam-Message-Info:
	/efJzf/h+XeQGW5ZmxRfVTuYmqPiolY2sT17juTbqK2OleQxIeLGcF+/6soZrpW6Z9fjZ5PM1rrFsRMDyPl/mrvexL9M+mss5/GyKzYtypdTlrmGvA8kZPv5BcJdzOLElEGXW9RRmVLcPZcx3je9vo3uiGCErV9Vsizh/AACcwi9oX84dAK/y6hqQNaIj9s3rSEAOPbO49+NUQrkE8ycmP7AMuJR4i+gcZ+nKWwabNCTSab5C38iKhfnr0+6bCl+ez3BRoDZBBbFwi5cjRGFOkKdSR1L5aGawKwx4BdhFCfg2i/evpBXXGaSUq5sZzntK/pl+aZBNoM9//5BAipRUwzO4LviX3CGMXTb8yNOq80Ax+AAAXTSX91hwO2UBu8VtNlbJLd0jVCPTKmJ+ipOrvwZaOS5QzbWDJgs+uIrCXx7c1qRTiKoSFsTIGXdmSrO7SNfK9FMr1iUzIrDRPLDl4iEOEotHPSkG+87qaNAlw7mm29HxitJ+2HIufptmbeRKz9CJ48yAhBt79xHyWUAnBkpQenF+0s3a7O8yEty1p5mhMuNOlRaKLidVbzuno1LCMK8BWTCTdFmOQ1mfPmSHdjkzj84zZ5LV4OjQUSTNhZg07v2XDBzFOmfWcttNlCKj7wffLBwStznq+KKA/uqF1DiwVyVugEDjOhb+gW1x0ibDTr3XvfxUk5QnfwpBdceniCrjRGBk+vbX+PK92gWw/eiMazAwClB701Fo2rxflBxcyTIg9yQg7aF52X3CRq0
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(23010399003)(36860700016)(376014)(6133799003)(22082099003)(18002099003)(10067099003)(56012099006)(11063799006)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Ds5dwU4ngxFCo5HaF1MSekwq2fmsBQBIbBnlIyUDZiMeZlPAMGtxfBMKiC3pw8MXLGIaQYt42V1a7D3MADNVs8eOysvMh/sHzuBnRLw8+pIp8eKF4IgDAZojBtTuH2WtnUANdB6SbY8sNxItmgBCCS++UcDNYKrNynf0dtDfr0UoPQtf2OKIIBjfhPXmFifNLGFAY3v6XWr+VfOqMgVC2jHlf47TLwWhTaNi8BqZIMCiw/54wVt6ft0OXsDOj9RwJYmhvUJJYo/g6LIcVWAAQpLSWx7QiMiDnlvfysHFsHSTsJncON9HnpTKN59X9Z49qYcEw9N1ciW1A+mLy53XreNSORs25o0qmbCSDNjo7+2essqTzsBZLLk2kj8+MB4p4mAUgQM+LeFA1RT8zHlnT55TtLCs8itVHslu8SDengaWartxo7Yz3ZcYqm6rCjFc
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 20:10:42.8138
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9933986-8b1e-4d8e-227c-08deef3fccb3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4228

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

