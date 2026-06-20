Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719BE36998F;
	Sat, 20 Jun 2026 18:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781981445; cv=none; b=kpsgwA90MmFoTTcbJ7h/TqC20ic0jkBEntEwAXZg5CxxXSr//MV+rwji4qBgX2Fhf6X3I2GF68gKK2TJggMqrc4tU/oK1D0WT4rGn1bFxDZ9mAiDNOgVMXDxLOSDryVyu7oVuF/Hzoc6zd2t53F8vS61OUkZcBCpsHL3hUpUu70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781981445; c=relaxed/simple;
	bh=F3Zq2fhysdIEDtuwL1LZusg/NazePoGWB+2xKx6PSM8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HlOUl7K0yUx0VS2m4J1bVd4dg+8rfK4hCzkYwHwY7i5MkdBCQx1eWCOZgoP/BLLw9hpiZY4XQeyOzZi1KTszrgIgPHa8U550faqVPs4lwV1bhqNOeWBRn5JPiOzbccf1Pizm00MBHGXsJumWh1Mm00dPjwvMBeKSU/KoEiU04hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ohfpkoZ6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ohfpkoZ6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E9AA1F00A3A;
	Sat, 20 Jun 2026 18:50:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781981444;
	bh=aaXmoUFQqAQVEUONqOAcm1M88Ap7dKsaPasKLZH+dXc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ohfpkoZ6MDl0IdtvslLxcTqO6qQ2ilXDmenez6pxW5KpXO9k+BqIsKdTnyjWtmI2h
	 /qnBi9FHCuieoKcdZ1Dq1zKVsXsyIAjRSvNoi9FLHJRb0hVgaFnsm3JlxJbNJQMl25
	 1ncDeqpRf6toGbwneyj5pJLAkj1zLkAu58aWFcF8p4MaCF1d8sbIDQOE7xwaBIhMuj
	 6lUob3Rz+mubm95iOhpoOyKEa32Whensh6aOjkCD1sDFRKOQO3Njyge+1lOvlyECzY
	 JzstEdETwd7YAQN2WJkkWs7QT+huTafHooVOI/EMCnnV4GafeOjjRTKcSw1xzcR9PV
	 eKGsKzGxMVLjA==
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
	boris.brezillon@collabora.com,
	lyude@redhat.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH v4 15/16] rust: drm: Pass registration data to ioctl handlers
Date: Sat, 20 Jun 2026 20:48:08 +0200
Message-ID: <20260620184924.2247517-16-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260620184924.2247517-1-dakr@kernel.org>
References: <20260620184924.2247517-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Pass registration data to ioctl handlers via
drm::Device<Registered>::registration_data_with(). The closure's HRTB
ties the lifetime to the closure scope, and the pointer cast shortens it
from 'static internally. The reference is valid for the duration of the
drm_dev_enter/exit critical section held by RegistrationGuard.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/file.rs |  3 +++
 drivers/gpu/drm/tyr/file.rs  |  1 +
 rust/kernel/drm/ioctl.rs     | 31 ++++++++++++++++++-------------
 3 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index 19fb89b28984..208be4e38188 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -28,6 +28,7 @@ impl File {
     /// IOCTL: get_param: Query GPU / driver metadata.
     pub(crate) fn get_param(
         dev: &NovaDevice<Registered>,
+        _reg_data: &(),
         getparam: &mut uapi::drm_nova_getparam,
         _file: &drm::File<File>,
     ) -> Result<u32> {
@@ -48,6 +49,7 @@ pub(crate) fn get_param(
     /// IOCTL: gem_create: Create a new DRM GEM object.
     pub(crate) fn gem_create(
         dev: &NovaDevice<Registered>,
+        _reg_data: &(),
         req: &mut uapi::drm_nova_gem_create,
         file: &drm::File<File>,
     ) -> Result<u32> {
@@ -61,6 +63,7 @@ pub(crate) fn gem_create(
     /// IOCTL: gem_info: Query GEM metadata.
     pub(crate) fn gem_info(
         _dev: &NovaDevice<Registered>,
+        _reg_data: &(),
         req: &mut uapi::drm_nova_gem_info,
         file: &drm::File<File>,
     ) -> Result<u32> {
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index fb9233eae01c..b686041d5d6b 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -32,6 +32,7 @@ fn open(_dev: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>> {
 impl TyrDrmFileData {
     pub(crate) fn dev_query(
         ddev: &TyrDrmDevice<Registered>,
+        _reg_data: &(),
         devquery: &mut uapi::drm_panthor_dev_query,
         _file: &TyrDrmFile,
     ) -> Result<u32> {
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 6cefd26b31f9..75944e72d7af 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -97,12 +97,13 @@ pub const fn __dev_ctx_cast<T: super::super::Driver>(
     #[inline(always)]
     pub unsafe fn __call_ioctl<
         'a,
+        Anchor,
         Dev: 'a,
         Data: 'a,
         F: super::super::file::DriverFile + 'a,
         Ret,
     >(
-        _anchor: &'a (),
+        _anchor: &'a Anchor,
         dev: &'a Dev,
         raw_data: *mut ::core::ffi::c_void,
         raw_file: *mut drm_file,
@@ -128,6 +129,7 @@ pub unsafe fn __call_ioctl<
 ///
 /// ```ignore
 /// fn foo(device: &kernel::drm::Device<Self, kernel::drm::Registered>,
+///        reg_data: &<Self::RegistrationData as kernel::types::ForLt>::Of<'_>,
 ///        data: &mut uapi::argument_type,
 ///        file: &kernel::drm::File<Self::File>,
 /// ) -> Result<u32>
@@ -202,25 +204,28 @@ macro_rules! declare_drm_ioctls {
                                     unsafe { &*__ptr },
                                     unreachable!(),
                                     unreachable!(),
+                                    unreachable!(),
                                 )
                             };
 
                             let Some(guard) = dev.registration_guard() else {
                                 return $crate::error::code::ENODEV.to_errno();
                             };
-                            let __anchor = ();
 
-                            // SAFETY:
-                            // - The ioctl argument has size `_IOC_SIZE(cmd)`, which we asserted
-                            //   above matches the size of this type, and all bit patterns of UAPI
-                            //   structs must be valid. The argument is exclusively owned by this
-                            //   handler, guaranteed by `drm_ioctl()` to remain valid for the
-                            //   duration of the call.
-                            // - `raw_file` is a valid `struct drm_file` pointer provided by the
-                            //   DRM core.
-                            match unsafe { $crate::drm::ioctl::internal::__call_ioctl(
-                                &__anchor, &*guard, raw_data, raw_file, $func,
-                            ) } {
+                            match guard.registration_data_with(|reg_data| {
+                                // SAFETY:
+                                // - The ioctl argument has size `_IOC_SIZE(cmd)`, which we asserted
+                                //   above matches the size of this type, and all bit patterns of
+                                //   UAPI structs must be valid. The argument is exclusively owned
+                                //   by this handler, guaranteed by `drm_ioctl()` to remain valid
+                                //   for the duration of the call.
+                                // - `raw_file` is a valid `struct drm_file` pointer provided by
+                                //   the DRM core.
+                                unsafe { $crate::drm::ioctl::internal::__call_ioctl(
+                                    reg_data, &*guard, raw_data, raw_file,
+                                    |dev, data, file| $func(dev, reg_data, data, file),
+                                ) }
+                            }) {
                                 Err(e) => e.to_errno(),
                                 Ok(i) => i.try_into()
                                             .unwrap_or($crate::error::code::ERANGE.to_errno()),
-- 
2.54.0

