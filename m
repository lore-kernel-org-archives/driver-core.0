Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D2603B4EA0;
	Wed,  6 May 2026 22:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778105461; cv=none; b=qfojYTYaTqOuWZx2AUy6cOKYYOH8RWRedevhb60AJpQLQ5jeEhYBdsKl37Cy6uJi2rPgwCLn79PAUwTZHctFFqyrdxI+6l3DlwUktwM+44446D/edDmtg5no762QTr6A+LNdzvawEEE+NsO5j/0RBIEuklAimQxjUrlXLct3f2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778105461; c=relaxed/simple;
	bh=4gpeNkYznkS5u18sTwi1hOTl/D8Z4CKRgi4PFia4sX8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YLb/oaTcdsk7qt0mYa88l9nQqHBBxM8dPcI9xIks1Rzc1kyjAuQPycfiqj+40KWypOVUe3M77c0k/sKiOVlvMEqR2I10N7e1CmeMZ9wo1wmzAI5gdBTIlIuG7WHdHWeEKkAeEY2wsG+oFQ/0M2lfZyH0c36L/aCs1lugspcaCns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s36YLkep; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s36YLkep"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AFC0C2BCB0;
	Wed,  6 May 2026 22:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778105461;
	bh=4gpeNkYznkS5u18sTwi1hOTl/D8Z4CKRgi4PFia4sX8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s36YLkep2+aju+NWosG/+wea1gVKc2iTCHedYgx8H38jG7/upiSSM9xpw106qi5Ai
	 G+B842X4hep/2hkZMB0F+ckFnOaSUWLRF+v8XIYxv6Chv+5IEzdjcNnbNFdllZ2wA6
	 eGe0xde8ksohDCHfUVzEwXr4ZxEiJMp4AmVnB4LQ6GYgWEUrL7ENgzTCZtglmmxJC1
	 9aEv5eg5fnHMkWEfill6/0AnCS3hZKMuwNhVbbC90iEJxWeUJDPcvGT7LjSNdiOfN8
	 00jKV/5OTFIbNfoRnitTYYdkNkDxwsO8vSbGGn9ZVYKBMpV5DS0wIU4tJH0JdgN3ag
	 VIncg6kBrfJDA==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	airlied@gmail.com,
	simona@ffwll.ch,
	daniel.almeida@collabora.com,
	acourbot@nvidia.com,
	apopple@nvidia.com,
	ecourtney@nvidia.com,
	deborah.brouwer@collabora.com,
	lyude@redhat.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu
Cc: driver-core@lists.linux.dev,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 5/6] rust: drm: Pass registration data to ioctl handlers
Date: Thu,  7 May 2026 00:06:03 +0200
Message-ID: <20260506221027.858481-6-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260506221027.858481-1-dakr@kernel.org>
References: <20260506221027.858481-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass &<Self::RegistrationData as ForLt>::Of<'_> after the device
argument to ioctl handlers. The lifetime is shortened from 'static via
ForLt::cast_ref; the reference is valid for the duration of the
drm_dev_enter/exit critical section held by UnbindGuard.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/file.rs | 3 +++
 drivers/gpu/drm/tyr/file.rs  | 1 +
 rust/kernel/drm/ioctl.rs     | 5 +++--
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index a3b7bd36792c..4c9fa409a8be 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -24,6 +24,7 @@ impl File {
     /// IOCTL: get_param: Query GPU / driver metadata.
     pub(crate) fn get_param(
         dev: &NovaDevice,
+        _reg_data: &(),
         getparam: &mut uapi::drm_nova_getparam,
         _file: &drm::File<File>,
     ) -> Result<u32> {
@@ -44,6 +45,7 @@ pub(crate) fn get_param(
     /// IOCTL: gem_create: Create a new DRM GEM object.
     pub(crate) fn gem_create(
         dev: &NovaDevice,
+        _reg_data: &(),
         req: &mut uapi::drm_nova_gem_create,
         file: &drm::File<File>,
     ) -> Result<u32> {
@@ -57,6 +59,7 @@ pub(crate) fn gem_create(
     /// IOCTL: gem_info: Query GEM metadata.
     pub(crate) fn gem_info(
         _dev: &NovaDevice,
+        _reg_data: &(),
         req: &mut uapi::drm_nova_gem_info,
         file: &drm::File<File>,
     ) -> Result<u32> {
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 31411da203c5..6262114c6a8d 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -29,6 +29,7 @@ fn open(_dev: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>> {
 impl TyrDrmFileData {
     pub(crate) fn dev_query(
         ddev: &TyrDrmDevice,
+        _reg_data: &(),
         devquery: &mut uapi::drm_panthor_dev_query,
         _file: &TyrDrmFile,
     ) -> Result<u32> {
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index aa72b44f645d..dd177bc399b2 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -83,6 +83,7 @@ pub mod internal {
 ///
 /// ```ignore
 /// fn foo(device: &kernel::drm::Device<Self>,
+///        reg_data: &<Self::RegistrationData as kernel::types::ForLt>::Of<'_>,
 ///        data: &mut uapi::argument_type,
 ///        file: &kernel::drm::File<Self::File>,
 /// ) -> Result<u32>
@@ -140,7 +141,7 @@ macro_rules! declare_drm_ioctls {
                             let dev = unsafe {
                                 $crate::drm::device::Device::from_raw(raw_dev)
                             };
-                            let _guard = match $crate::drm::device::unbind_guard(dev) {
+                            let guard = match $crate::drm::device::unbind_guard(dev) {
                                 Some(g) => g,
                                 None => return $crate::error::code::ENODEV.to_errno(),
                             };
@@ -156,7 +157,7 @@ macro_rules! declare_drm_ioctls {
                             // SAFETY: This is just the DRM file structure
                             let file = unsafe { $crate::drm::File::from_raw(raw_file) };
 
-                            match $func(dev, data, file) {
+                            match $func(dev, guard.registration_data(), data, file) {
                                 Err(e) => e.to_errno(),
                                 Ok(i) => i.try_into()
                                             .unwrap_or($crate::error::code::ERANGE.to_errno()),
-- 
2.54.0

