Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0765C3B38AE;
	Sun, 28 Jun 2026 14:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658532; cv=none; b=IhLoArl371SEiV7OObagTn9pGh+3IztRJEWtFbjg+fx3Gtbyx9pDht79yaSi7G2pOHstpymPOU7kQ44aWFaavzIwtCyqywY4lzk8/b4AZtw0GkLp4GNV9fgsgLisO1gu93HpEP+6IZfgNJgjEe6LIYxvGfPgpfnhPo2SPAaWFW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658532; c=relaxed/simple;
	bh=vqzDu/iUX1GBpwyJFlir3vbUYzHYwSiNfM3pYUxj6Tc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=amnluvpkqkjoZa1UUV3vhb4SPhcDCbRs9MxgXQ9j/x/EKSStmru4Pf3Ocd0bPEmOj/bXnfFJrEhrDCCSYUoXgSJkoHT0Hf2CO0GJWt68pAirQSpHcfv8rrT8YpwzDPgQwoSRjabJtlAJK338gAId9/JWtTkInpQbCUobZ/QjRFc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c47Xqfu+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c47Xqfu+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C27F1F00A3A;
	Sun, 28 Jun 2026 14:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658530;
	bh=fjg9k12LLTs5vTfgo/GQS8Y+N5IolDssj7B7dIPVRfY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=c47Xqfu+8pcAZDP4Vapm/giHVCC7PvMg3Usiurdjcy3ttnOy9YN3zJHk9oJ2e6Khk
	 jnSYcbG59GSP+LJMbZ1taCpO6JjndaKH0GKfj3As5Nn1Gnush1NoPrJJ4VVROPFYYL
	 E6P1OankMUaSN2udlTznAIS+0sKktnikh+LteTuce3OaCjOD45Oind5qN74sp2sFGP
	 mcgCYRWdUsAcS6NyaJd9Y5qHvRgBA2xkUcpe3wYtZphDpn483yR3ZnW/QjYNBP7bl/
	 +60FmXGAJGHNA4dEsJg9VcDqNfTcVrFRnmpCRXXbKjDf0MWRLVzphhoyAJcABk/w91
	 KKPj5njEbVyWA==
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
Subject: [PATCH v5 18/19] rust: drm: Pass registration data to ioctl handlers
Date: Sun, 28 Jun 2026 16:53:38 +0200
Message-ID: <20260628145406.2107056-19-dakr@kernel.org>
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

Pass registration data to ioctl handlers via
drm::Device<Registered>::registration_data_with(). The closure's HRTB
ties the lifetime to the closure scope, and the pointer cast shortens it
from 'static internally. The reference is valid for the duration of the
drm_dev_enter/exit critical section held by RegistrationGuard.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/file.rs | 3 +++
 drivers/gpu/drm/tyr/file.rs  | 1 +
 rust/kernel/drm/ioctl.rs     | 8 ++++++--
 3 files changed, 10 insertions(+), 2 deletions(-)

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
index f24cf7b146a8..9b45b741db1b 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -95,6 +95,7 @@ pub const fn __dev_ctx_cast<T: crate::drm::Driver>(
 ///
 /// ```ignore
 /// fn foo(device: &kernel::drm::Device<Self, kernel::drm::Registered>,
+///        reg_data: &Self::RegistrationData<'_>,
 ///        data: &mut uapi::argument_type,
 ///        file: &kernel::drm::File<Self::File>,
 /// ) -> Result<u32>
@@ -169,13 +170,14 @@ macro_rules! declare_drm_ioctls {
                                     unsafe { &*__ptr },
                                     unreachable!(),
                                     unreachable!(),
+                                    unreachable!(),
                                 )
                             };
 
                             // Enforce that the handler accepts higher-ranked
                             // lifetimes, preventing it from requiring 'static
                             // references that could escape this scope.
-                            let _: for<'a> fn(&'a _, &'a mut _, &'a _) -> _ = $func;
+                            let _: for<'a> fn(&'a _, &'a _, &'a mut _, &'a _) -> _ = $func;
 
                             let Some(guard) = dev.registration_guard() else {
                                 return $crate::error::code::ENODEV.to_errno();
@@ -193,7 +195,9 @@ macro_rules! declare_drm_ioctls {
                             // SAFETY: This is just the DRM file structure
                             let file = unsafe { $crate::drm::File::from_raw(raw_file) };
 
-                            match $func(&*guard, data, file) {
+                            match guard.registration_data_with(|reg_data| {
+                                $func(&*guard, reg_data, data, file)
+                            }) {
                                 Err(e) => e.to_errno(),
                                 Ok(i) => i.try_into()
                                             .unwrap_or($crate::error::code::ERANGE.to_errno()),
-- 
2.54.0

