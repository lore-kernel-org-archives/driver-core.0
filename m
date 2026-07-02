Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010047.outbound.protection.outlook.com [52.101.85.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C60738D019;
	Thu,  2 Jul 2026 19:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783020564; cv=fail; b=aZbC2h9wC8E5Qd6xLxvo8VY+DiyKH79XSAv77OdbboC88UXwpwHKYxb9w8BAiSrtXJtIBEcSes5/twy3rICDieoDJrwcLvTwBTjsuMVaxUTWzhlgXk9gChxohFXXQ/Emme6fFkyZtg5OakmgDGDwPw+BKz+nQ5FKkfFp+6ldL6s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783020564; c=relaxed/simple;
	bh=DzT4SAOOvoJxdS+H9CCX7XTj46Sg/UrtjJL6SZ6VimA=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RaAAS62/ovLvM2vF2Pg2oQFz6z0/Tn4NiM73ByED/y7U3INadyjK6U7/Bc953+dd19yW6iN5BpwDbpxgYmlJnuFsF1hx4Kgzt3xjMYXj1zS2yZ2m1Y8TOv1H2h2bjEixlpiDhELR/8uxorUn02bZ+2JKpep7QKuyr2efsfSvUr8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=qB+ECiwR; arc=fail smtp.client-ip=52.101.85.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="qB+ECiwR"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QQn02BxgObDu4866zfpD3PiKStnd16KZ9GmobUmpZqtgN0JmsdziAbdeNPrphlKjoZpgKjJk7M4xNM6P20GRyyXeugLXa43O/liDlw8AAJvsOt8aImEuQ0k9p/wrF2iEY8H7/ds+r6fnFgkeyIatEYzZzZCT2tTbwbgQLzuCubSDh4Us/yKCCToVc4j6DcVQvDsX58b6GYvgS0w/h6dzqIf9opNQcoNjUu4eWu1U43HB5Ky7jgtbUshjkx07vBBwkUc0Nx7dLcPquw4uQY1KKMVWCr+HBdVEPzreqyEZGCiPbIEG3OfXIgH7GVnVn7ct7plfTH+tNpLKpgxOFtZmxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GT6Y43RU9vBnPnaCX6ddtZrDmdsPoJOKu31R8Y9KEfo=;
 b=u7ZnZNl4CTw3FAwSVgLb7QbNHD/wh4YqvbLm2uVhW/onO4qByviQxctPj9dzr6yoFV9243WvZJLRJc2fRZDNUqoSqIaWn2CL0UndtZViXm1tQ/BWU0frM61Wsg5PUArv8ByMtjdsUnElyjCmRP2ESgzByVFsQMOFExaE8BlycwsqoMRgYoY/ZkN7xbcDiB+MYSvsSSO4yaIode7uqkum4x5fN7raoA3+/mAVT3RcW3stRzOTAJXi6xnhPQVgnUa+ZV1w9/FjDi1/m5rWxgNQX5/SyI2S2TGgMC3mpi7IbfwSv5XKU0zbKo31aamBjXhtnnl0ewEsxMtI9D4Y/Dj8Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.linux.dev smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GT6Y43RU9vBnPnaCX6ddtZrDmdsPoJOKu31R8Y9KEfo=;
 b=qB+ECiwRiQyUPqzs+YLeArYYBNsFzzOsG/2COPtlLoKXauVDXzZtWClfYnZ/ztwYZaXkhn/ALAttJKU0olO+QjLwRbMdE4EYK8poFU664buTt7KkjezYuhUs4dPDh+vsTG7RQF0HwGgWpJKbOZAEzEGVX+50FPQ4NiEC04JsY2mCOOnnPllOxjLQiDJ21Q1rHq/ZoDaM7snwuKSCv55JrKFD7JzH9Jsae4/pi7vtpdSY3K66gscdrpVrMwcnMZzVZXFw/U80Klg9CfrNrwixX2oMOlU8cLWEZz1ARLjvv/bqvBDFiR/HFi9e0VirbFc9TSoMCUdY3Z2NNQds8rgOFw==
Received: from PH7P220CA0142.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:327::12)
 by PH7PR12MB9065.namprd12.prod.outlook.com (2603:10b6:510:1f7::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.9; Thu, 2 Jul 2026
 19:27:48 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:510:327:cafe::9a) by PH7P220CA0142.outlook.office365.com
 (2603:10b6:510:327::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.181.10 via Frontend Transport; Thu, 2
 Jul 2026 19:27:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.181.6 via Frontend Transport; Thu, 2 Jul 2026 19:27:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:28 -0700
Received: from ttabi.nvidia.com (10.126.231.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 2 Jul
 2026 12:27:27 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
	<rust-for-linux@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>, Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, "Luis
 Chamberlain" <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
	"Miguel Ojeda" <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Subject: [PATCH v3 1/7] rust: firmware: add request_into_buf()
Date: Thu, 2 Jul 2026 14:27:06 -0500
Message-ID: <20260702192712.3450652-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH7PR12MB9065:EE_
X-MS-Office365-Filtering-Correlation-Id: db889e05-3add-4eb6-f3ee-08ded86fffb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|1800799024|82310400026|23010399003|11063799006|56012099006|6133799003|22082099003|921020|18002099003;
X-Microsoft-Antispam-Message-Info:
	3HpFYSIBAYmH9YnQ+YNvygciNbyJ7o4NzecRWrqFcT2R6ZfAApQ91PzX5L0X/0kVWhg3Idkair38JC3TOrw3Qdz0No2xtpZl4vlW8KDusPUL0o/+Pie+jOoDCmwKKarZfMWWRZ649IQl2m1vHlI13SLvOHCCbvYKgApVI8e075ytz6xVjj5G46ckyo8XfvbSpXluFibidO3GLNd8Ds7rHQJkaqwPj4ncn/y1ZJVUPpCDNjM87VDHCemayiKgHK6Shq22S8Ow5B1YRZgl8/+RUF02qCRyjEF9/5Hv9IP8rWRaJh8bcjMtRNADI20gXVpCBdL6vMmPflS2d4oo96MZ3PoyL3cmIMcU49Hz20jVBi++sXTT99eCiq/sFKYJ+w9Wo5/X4IJZBlXbT2rtx5SLpQ7D07A7O4XilHTq8UNpHulqMl7yci97wx6fMaU55Rims3X6I5f6hdsDYG7U8qWHk3kh2fukKT5DYc3sdCC5bIEaxWX9yE50vgQqH/3EV1RDdv5iFX8+mZ0LJqnae6Pn1BMCbJa3AdFxD8xUfWazYmtMNUKWifDwkowDacGLtgHXJG0clXkeW6axw8AG60VmVmNqu930JkzvAN807CmuuHi4zSv7DVjz8QnWRQv8eh7umKzA95I3sOvgNL3Rg7GCQcUeCvx+jbIMDWcvt0pUpKhLkAy9NWecxapmnQKlQU8rPtMpXWjneUO8hH8nPjq48aIC1kqbl5snyrHbzRkESXV+tzOlynfoVU8q9dX28Pqj
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(1800799024)(82310400026)(23010399003)(11063799006)(56012099006)(6133799003)(22082099003)(921020)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GRGKRwX4zn6nbsUILEgm/flNh6GW/gnXr4xLCGpl8QAtgHRXG7zUTsZcX2QFWkRYCOrif6Z9+UdJzQqxykEk4ARLeXa5VRof8eBLuOzzdtLwuz9VHFYCRIE7KF8Nz+L7zie+RSHDTiNVwi1mVBCOpr1fXPbyi7rR8MJdhxK792jCgg7bufJJhIxER+rNrbCItj3HAnEtkEIOFsPD9oHeccdppvuTZrO8PvMn5de4I0K/6HrNAxMYYP9jsvoH6z8CZaUvyEjhBHkRKj/1rtgMRWDPiNUC7x4nPuUIYYw4VaDJsiqaPPyTkluvo3Gk8qOKRRsbk7MVRwuMB5+u+J3WwfgGkiW9Mib2xtL4v9FXOrbNCHTaV3DFiH/rYblnWPSOZKK+1qYmFNTCLBL7kQAh2B7gUcnknXhjJeR3fcN4Bc/XS3JMG7HPjga6s/iARvu9
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2026 19:27:47.4598
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db889e05-3add-4eb6-f3ee-08ded86fffb3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9065

Add request_into_buf(), a Rust wrapper around the
request_firmware_into_buf() function. This variant loads the firmware
image directly into a caller-provided buffer rather than a
kernel-allocated one.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 rust/kernel/firmware.rs | 47 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 71168d8004e2..4460fb2cd5d8 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -120,6 +120,53 @@ fn drop(&mut self) {
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

