Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68F5B3A59A3;
	Sun, 28 Jun 2026 14:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658510; cv=none; b=dRLT8EsN8+szb6cphQxS6nt1n2xNnVC8J9HYwXeXjnmqnEjCW8w6zydpwRmHmmweii+k1cuedVLeDKbe59UqS+q22i3UGqcaPzuTWxix1fC8JIY3QSitewFiyp8GSZKj+zdjYUVwvP56J+OpWnDBbjtUWTnw0pzxuF+vWT5dK/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658510; c=relaxed/simple;
	bh=wedmX3aatzqEnTdA/kbB4JK9C4ZwMTfJbZtiYE1KdLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=P4UhtJ3Lm0IcQ8k9Z9tF1yPG65+yI7NLEJY+D2t9eRVfl9qDRDlMyMmOHdy5oeA95db6iCPHeHajLFggfvtnu3kfSIDZ1VkrCsYctW0+9zp/Whq7DSm2VmH0YfwQMdDAl6WVj03Bxd5flag3Es3trZ5Vif5gusEPfV3Px3DigRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bsbsAgpv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bsbsAgpv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EE2A1F000E9;
	Sun, 28 Jun 2026 14:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658508;
	bh=dJxKjz4hAMGNptiQmXGK4LUFTx72RzyMTqJXCJrZfug=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bsbsAgpvuMeKiZwcwQl5tkUvEGs4NyhZr4RIfgZvEFNzaUpqeA3d+EllbzpBlUXsc
	 19Bn4nmRC7cw8t7GXUTvOmaXX8vDPDi6IBPJQhgX2yyX8GHRutTIHSR0bipPt5xH06
	 9i8jbNkIkjV1ZVy/rNh/1nsi3m/bY91m8lRLGLvAHewQrz2fQ9wToeTtE8ORXt8KRH
	 v875Md6nAt9eYCsLOM55IrzknjBVczwk5UVFc6xEyE+tggAcd8zPIEsNjL0IAvGlQC
	 oPfUc12eYAHykBemqOCdsRNLk6+HVesFgT9vRW75xwB8OqKr6s4BbbUEbdFm/YVjz3
	 lAxhrgMDkG8hA==
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
Subject: [PATCH v5 13/19] rust: drm: Wrap ioctl dispatch in RegistrationGuard
Date: Sun, 28 Jun 2026 16:53:33 +0200
Message-ID: <20260628145406.2107056-14-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260628145406.2107056-1-dakr@kernel.org>
References: <20260628145406.2107056-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Ioctl handlers now receive a &Device<T, Registered> reference, proving
at the type level that the device is registered and its parent bus
device is bound.

This is achieved by calling registration_guard() on the Device<T, Ioctl>
obtained in ioctl dispatch context. If the device has been unplugged,
the ioctl returns -ENODEV without calling the handler.

To resolve the driver type parameter T for type inference, which the
compiler cannot propagate through method resolution and associated-type
projections alone, a dead-code closure and a helper function are used as
a type-inference anchor.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/file.rs | 12 ++++++----
 drivers/gpu/drm/tyr/file.rs  |  7 ++++--
 rust/kernel/drm/ioctl.rs     | 45 +++++++++++++++++++++++++++++++++---
 3 files changed, 55 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index a3b7bd36792c..19fb89b28984 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -4,7 +4,11 @@
 use crate::gem::NovaObject;
 use kernel::{
     alloc::flags::*,
-    drm::{self, gem::BaseObject},
+    drm::{
+        self,
+        gem::BaseObject,
+        Registered, //
+    },
     pci,
     prelude::*,
     uapi,
@@ -23,7 +27,7 @@ fn open(_dev: &NovaDevice) -> Result<Pin<KBox<Self>>> {
 impl File {
     /// IOCTL: get_param: Query GPU / driver metadata.
     pub(crate) fn get_param(
-        dev: &NovaDevice,
+        dev: &NovaDevice<Registered>,
         getparam: &mut uapi::drm_nova_getparam,
         _file: &drm::File<File>,
     ) -> Result<u32> {
@@ -43,7 +47,7 @@ pub(crate) fn get_param(
 
     /// IOCTL: gem_create: Create a new DRM GEM object.
     pub(crate) fn gem_create(
-        dev: &NovaDevice,
+        dev: &NovaDevice<Registered>,
         req: &mut uapi::drm_nova_gem_create,
         file: &drm::File<File>,
     ) -> Result<u32> {
@@ -56,7 +60,7 @@ pub(crate) fn gem_create(
 
     /// IOCTL: gem_info: Query GEM metadata.
     pub(crate) fn gem_info(
-        _dev: &NovaDevice,
+        _dev: &NovaDevice<Registered>,
         req: &mut uapi::drm_nova_gem_info,
         file: &drm::File<File>,
     ) -> Result<u32> {
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 31411da203c5..fb9233eae01c 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -1,7 +1,10 @@
 // SPDX-License-Identifier: GPL-2.0 or MIT
 
 use kernel::{
-    drm,
+    drm::{
+        self,
+        Registered, //
+    },
     prelude::*,
     uaccess::UserSlice,
     uapi, //
@@ -28,7 +31,7 @@ fn open(_dev: &drm::Device<Self::Driver>) -> Result<Pin<KBox<Self>>> {
 
 impl TyrDrmFileData {
     pub(crate) fn dev_query(
-        ddev: &TyrDrmDevice,
+        ddev: &TyrDrmDevice<Registered>,
         devquery: &mut uapi::drm_panthor_dev_query,
         _file: &TyrDrmFile,
     ) -> Result<u32> {
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 6f5a9877bdae..f24cf7b146a8 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -70,6 +70,18 @@ pub mod internal {
     pub use bindings::drm_device;
     pub use bindings::drm_file;
     pub use bindings::drm_ioctl_desc;
+
+    /// Reinterpret a pointer to a DRM device with a different [`DeviceContext`], preserving the
+    /// driver type parameter `T`.
+    ///
+    /// Used by [`declare_drm_ioctls!`] to anchor type inference.
+    #[doc(hidden)]
+    #[inline]
+    pub const fn __dev_ctx_cast<T: crate::drm::Driver>(
+        ptr: *const crate::drm::Device<T, crate::drm::Ioctl>,
+    ) -> *const crate::drm::Device<T, crate::drm::Registered> {
+        ptr.cast()
+    }
 }
 
 /// Declare the DRM ioctls for a driver.
@@ -82,7 +94,7 @@ pub mod internal {
 /// `user_callback` should have the following prototype:
 ///
 /// ```ignore
-/// fn foo(device: &kernel::drm::Device<Self>,
+/// fn foo(device: &kernel::drm::Device<Self, kernel::drm::Registered>,
 ///        data: &mut uapi::argument_type,
 ///        file: &kernel::drm::File<Self::File>,
 /// ) -> Result<u32>
@@ -131,17 +143,44 @@ macro_rules! declare_drm_ioctls {
                             // - The DRM device must have been registered when we're called through
                             //   an IOCTL.
                             //
+                            // INVARIANT: The `Ioctl` context requires that the device has been
+                            // registered via `drm_dev_register()` at some point; the DRM core
+                            // guarantees this for ioctl dispatch callbacks.
+                            //
                             // FIXME: Currently there is nothing enforcing that the types of the
                             // dev/file match the current driver these ioctls are being declared
                             // for, and it's not clear how to enforce this within the type system.
-                            let dev: &$crate::drm::device::Device<_, $crate::drm::Normal> =
+                            let dev: &$crate::drm::device::Device<_, $crate::drm::Ioctl> =
                                 $crate::drm::device::Device::from_raw(raw_dev);
 
+                            // Type-inference anchor: the closure is never called but ties `dev`'s
+                            // type to `$func`'s first parameter, which the compiler cannot infer
+                            // through method resolution and associated-type projections alone.
+                            #[allow(unreachable_code)]
+                            let _ = || {
+                                let __ptr = $crate::drm::ioctl::internal::__dev_ctx_cast(
+                                    ::core::ptr::from_ref(dev),
+                                );
+
+                                $func(
+                                    // SAFETY: This closure is never executed; the dereference
+                                    // exists purely to unify the type parameter with `$func`.
+                                    // The pointer is valid regardless.
+                                    unsafe { &*__ptr },
+                                    unreachable!(),
+                                    unreachable!(),
+                                )
+                            };
+
                             // Enforce that the handler accepts higher-ranked
                             // lifetimes, preventing it from requiring 'static
                             // references that could escape this scope.
                             let _: for<'a> fn(&'a _, &'a mut _, &'a _) -> _ = $func;
 
+                            let Some(guard) = dev.registration_guard() else {
+                                return $crate::error::code::ENODEV.to_errno();
+                            };
+
                             // SAFETY: The ioctl argument has size `_IOC_SIZE(cmd)`, which we
                             // asserted above matches the size of this type, and all bit patterns of
                             // UAPI structs must be valid.
@@ -154,7 +193,7 @@ macro_rules! declare_drm_ioctls {
                             // SAFETY: This is just the DRM file structure
                             let file = unsafe { $crate::drm::File::from_raw(raw_file) };
 
-                            match $func(dev, data, file) {
+                            match $func(&*guard, data, file) {
                                 Err(e) => e.to_errno(),
                                 Ok(i) => i.try_into()
                                             .unwrap_or($crate::error::code::ERANGE.to_errno()),
-- 
2.54.0

