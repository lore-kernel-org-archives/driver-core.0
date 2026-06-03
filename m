Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6027A346E43;
	Wed,  3 Jun 2026 01:28:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450100; cv=none; b=o7T0PmOhk+6dJWjzmIGTOhwhQJd1KnaCSekPNBuHz7tu/jTUGnRBtQvd02WY6iSVCdOosq63+E4fHVTfdL5DXh1a8E1kW5DBZdwS4x/m1/Le+Sy/VuCZ1uE2xlr1+rvz/YkU2EYd1xDNYwf2pi677Ye2oY/87GEiCRqq1IQX6F8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450100; c=relaxed/simple;
	bh=i5GTZxEctkY7IFccePqtgsLYiKeLgI4WeT92PZLcmSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q4euW2mn30VreMIayuQBewVq/cYu37rJFS/cAKjBfnke7j+qJ3ea8RrfIE8bQB+0OLwLgBcAch+1vyVlJf1LVP0wKNj9rZypQDMZ1ZjgEWcgqpyXA8p6RTci2GRJbq/7uEFTHlQwiDhtbT0i4HGdG5ehRTZtYZ/7RS+fI4BGerg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SW/52M1l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SW/52M1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CBC31F00899;
	Wed,  3 Jun 2026 01:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450099;
	bh=i/Xu79MDZXE/lVp1UAv6q2C76h6/tfquFPa2pKXMBS8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SW/52M1lbbWDx0nWNsKuk/j0GQZFrSD56491taB/kEW84QyXSWv7Ym03tn81yXqaU
	 5nMJVDESKfYaVtfutxNh9JZQfy8vhUNP7X6BlBBAneZ5Tpx1RMac1jVm6hRfcYnvma
	 pbcGcWZYTOzDE27hUJpCLxlISxg4lwf2paQl7JZahfDnPyz8azr4Dqp3nSkpB6caj3
	 Z9zOerwCDmwf1qoXXJezhy5Sl12Y6NQFfB/VNhx6BOtFbwUlCWfOL3DeMqhmy0Bq55
	 bykRoJXIuXlGB3pH3WNgzWGhFXCoHpUFZB4FgQCPyFPE0i+JPb2ycvtAvmjByijTJY
	 LmkijhYlhuAEg==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
	ecourtney@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	deborah.brouwer@collabora.com,
	boris.brezillon@collabora.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v2 5/7] rust: drm: Pass bound parent device to ioctl handlers
Date: Wed,  3 Jun 2026 03:15:47 +0200
Message-ID: <20260603011711.2077361-6-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260603011711.2077361-1-dakr@kernel.org>
References: <20260603011711.2077361-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass &Self::ParentDevice<Bound> as the second argument to ioctl
handlers. This gives ioctl handlers direct access to the bound parent
bus device.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/file.rs | 5 +++++
 drivers/gpu/drm/tyr/file.rs  | 3 +++
 rust/kernel/drm/ioctl.rs     | 7 ++++---
 3 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index a3b7bd36792c..d43f92ee181d 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -4,6 +4,8 @@
 use crate::gem::NovaObject;
 use kernel::{
     alloc::flags::*,
+    auxiliary,
+    device::Bound,
     drm::{self, gem::BaseObject},
     pci,
     prelude::*,
@@ -24,6 +26,7 @@ impl File {
     /// IOCTL: get_param: Query GPU / driver metadata.
     pub(crate) fn get_param(
         dev: &NovaDevice,
+        _adev: &auxiliary::Device<Bound>,
         getparam: &mut uapi::drm_nova_getparam,
         _file: &drm::File<File>,
     ) -> Result<u32> {
@@ -44,6 +47,7 @@ pub(crate) fn get_param(
     /// IOCTL: gem_create: Create a new DRM GEM object.
     pub(crate) fn gem_create(
         dev: &NovaDevice,
+        _adev: &auxiliary::Device<Bound>,
         req: &mut uapi::drm_nova_gem_create,
         file: &drm::File<File>,
     ) -> Result<u32> {
@@ -57,6 +61,7 @@ pub(crate) fn gem_create(
     /// IOCTL: gem_info: Query GEM metadata.
     pub(crate) fn gem_info(
         _dev: &NovaDevice,
+        _adev: &auxiliary::Device<Bound>,
         req: &mut uapi::drm_nova_gem_info,
         file: &drm::File<File>,
     ) -> Result<u32> {
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 31411da203c5..181475f18c18 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -1,7 +1,9 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
 use kernel::{
+    device,
     drm,
+    platform,
     prelude::*,
     uaccess::UserSlice,
     uapi, //
@@ -29,6 +31,7 @@ fn open(_dev: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>> {
 impl TyrDrmFileData {
     pub(crate) fn dev_query(
         ddev: &TyrDrmDevice,
+        _pdev: &platform::Device<device::Bound>,
         devquery: &mut uapi::drm_panthor_dev_query,
         _file: &TyrDrmFile,
     ) -> Result<u32> {
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 8ee6e8ea0ff6..2229dc55764b 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -83,6 +83,7 @@ pub mod internal {
 ///
 /// ```ignore
 /// fn foo(device: &kernel::drm::Device<Self>,
+///        parent: &Self::ParentDevice<kernel::device::Bound>,
 ///        data: &mut uapi::argument_type,
 ///        file: &kernel::drm::File<Self::File>,
 /// ) -> Result<u32>
@@ -145,9 +146,9 @@ macro_rules! declare_drm_ioctls {
                             // type to `$func`'s first parameter, which the compiler cannot infer
                             // through method resolution and associated-type projections alone.
                             #[allow(unreachable_code)]
-                            let _ = || $func(dev, unreachable!(), unreachable!());
+                            let _ = || $func(dev, unreachable!(), unreachable!(), unreachable!());
 
-                            let Some(_guard) = dev.unbind_guard() else {
+                            let Some(guard) = dev.unbind_guard() else {
                                 return $crate::error::code::ENODEV.to_errno();
                             };
                             // SAFETY: The ioctl argument has size `_IOC_SIZE(cmd)`, which we
@@ -162,7 +163,7 @@ macro_rules! declare_drm_ioctls {
                             // SAFETY: This is just the DRM file structure
                             let file = unsafe { $crate::drm::File::from_raw(raw_file) };
 
-                            match $func(dev, data, file) {
+                            match $func(dev, &*guard, data, file) {
                                 Err(e) => e.to_errno(),
                                 Ok(i) => i.try_into()
                                             .unwrap_or($crate::error::code::ERANGE.to_errno()),
-- 
2.54.0

