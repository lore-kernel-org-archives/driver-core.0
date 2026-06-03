Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC34346AF1;
	Wed,  3 Jun 2026 01:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450104; cv=none; b=B8o2ynyNjOCCzdYz1uu3Akd//EgH9SnIKAaS+MKtLDwE1fPbo0PdepaoxQwlr4lQSP8MBmy1LKiEBvLEdlsnTxWPYd6pm/LRwYF+4saajnIVvRBv3riJMadz4iH2xw69LzBj+bsjm/w7DfuqmNXjD6jFVAo+d9rqk8ghcqccr/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450104; c=relaxed/simple;
	bh=ig/GeSYEA36vavfqXbKTP6Vij1DIY0FrbE111dI3JOM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wh0dGyCqPfm3nm/HHqY3Q3Zc21joVVTpMRIPchOTInIqFcWiqBwiSogR2UiwwzThsQnm+4O1rEZyABXdMr9e0nNwfydNl9Rr6r0bx827tl7cW010pMxIL51yD1+EtaicSGcJ+IBpC/tNF/vVMyXevG+CSn3ESxE1rn3jhgvFB9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QKA7bQlt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QKA7bQlt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7582E1F00893;
	Wed,  3 Jun 2026 01:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450103;
	bh=hRinYvXRXA4hFT5GQKiVH1LPW6fzeLKqdFLtLzEGSO8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=QKA7bQlti5voVN9YQMzeqRevAT3ae8HEvEdB6OpYEMd5lRZffFQtgxqaVXmZlf6RH
	 /zMa8zVzCAtcN5yTfss1IfA2zALnMH3jKwley4CAmirX57gkqp9hPkJ2xwOyKt0yYf
	 4pX7meXJZjBTcmgE/kfj/DpTb/4Od9oLVUtWGMRvOwzsANcO3o29Cun40aQZ8mAvCM
	 BXcVTgWKbbVA+q2YwIfibVzHkE+OIjot2j4+On3E34DDoPdt0cAhs+sYoTulZamVqU
	 dXo8r/5p6Ni4tzq9ujlrRqZb1NiPf3/wotxKme/BTN2jdlzN6VqXTf8q5Dh5VEI4Ay
	 vxchtgDRUX/MA==
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
Subject: [PATCH v2 6/7] rust: drm: Pass registration data to ioctl handlers
Date: Wed,  3 Jun 2026 03:15:48 +0200
Message-ID: <20260603011711.2077361-7-dakr@kernel.org>
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

Pass registration data to ioctl handlers via
UnbindGuard::registration_data_with(). The closure's HRTB ties the
lifetime to the closure scope, and ForLt::cast_ref_unchecked shortens it
from 'static internally. The reference is valid for the duration of the
drm_dev_enter/exit critical section held by UnbindGuard.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/gpu/drm/nova/file.rs |  3 +++
 drivers/gpu/drm/tyr/file.rs  |  1 +
 rust/kernel/drm/ioctl.rs     | 15 +++++++++++++--
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nova/file.rs b/drivers/gpu/drm/nova/file.rs
index d43f92ee181d..df9760947d58 100644
--- a/drivers/gpu/drm/nova/file.rs
+++ b/drivers/gpu/drm/nova/file.rs
@@ -27,6 +27,7 @@ impl File {
     pub(crate) fn get_param(
         dev: &NovaDevice,
         _adev: &auxiliary::Device<Bound>,
+        _reg_data: &(),
         getparam: &mut uapi::drm_nova_getparam,
         _file: &drm::File<File>,
     ) -> Result<u32> {
@@ -48,6 +49,7 @@ pub(crate) fn get_param(
     pub(crate) fn gem_create(
         dev: &NovaDevice,
         _adev: &auxiliary::Device<Bound>,
+        _reg_data: &(),
         req: &mut uapi::drm_nova_gem_create,
         file: &drm::File<File>,
     ) -> Result<u32> {
@@ -62,6 +64,7 @@ pub(crate) fn gem_create(
     pub(crate) fn gem_info(
         _dev: &NovaDevice,
         _adev: &auxiliary::Device<Bound>,
+        _reg_data: &(),
         req: &mut uapi::drm_nova_gem_info,
         file: &drm::File<File>,
     ) -> Result<u32> {
diff --git a/drivers/gpu/drm/tyr/file.rs b/drivers/gpu/drm/tyr/file.rs
index 181475f18c18..9f53da7633ab 100644
--- a/drivers/gpu/drm/tyr/file.rs
+++ b/drivers/gpu/drm/tyr/file.rs
@@ -32,6 +32,7 @@ impl TyrDrmFileData {
     pub(crate) fn dev_query(
         ddev: &TyrDrmDevice,
         _pdev: &platform::Device<device::Bound>,
+        _reg_data: &(),
         devquery: &mut uapi::drm_panthor_dev_query,
         _file: &TyrDrmFile,
     ) -> Result<u32> {
diff --git a/rust/kernel/drm/ioctl.rs b/rust/kernel/drm/ioctl.rs
index 2229dc55764b..773683da7d6a 100644
--- a/rust/kernel/drm/ioctl.rs
+++ b/rust/kernel/drm/ioctl.rs
@@ -84,6 +84,7 @@ pub mod internal {
 /// ```ignore
 /// fn foo(device: &kernel::drm::Device<Self>,
 ///        parent: &Self::ParentDevice<kernel::device::Bound>,
+///        reg_data: &<Self::RegistrationData as kernel::types::ForLt>::Of<'_>,
 ///        data: &mut uapi::argument_type,
 ///        file: &kernel::drm::File<Self::File>,
 /// ) -> Result<u32>
@@ -146,7 +147,15 @@ macro_rules! declare_drm_ioctls {
                             // type to `$func`'s first parameter, which the compiler cannot infer
                             // through method resolution and associated-type projections alone.
                             #[allow(unreachable_code)]
-                            let _ = || $func(dev, unreachable!(), unreachable!(), unreachable!());
+                            let _ = || {
+                                $func(
+                                    dev,
+                                    unreachable!(),
+                                    unreachable!(),
+                                    unreachable!(),
+                                    unreachable!(),
+                                )
+                            };
 
                             let Some(guard) = dev.unbind_guard() else {
                                 return $crate::error::code::ENODEV.to_errno();
@@ -163,7 +172,9 @@ macro_rules! declare_drm_ioctls {
                             // SAFETY: This is just the DRM file structure
                             let file = unsafe { $crate::drm::File::from_raw(raw_file) };
 
-                            match $func(dev, &*guard, data, file) {
+                            match guard.registration_data_with(|parent, reg_data| {
+                                $func(dev, parent, reg_data, data, file)
+                            }) {
                                 Err(e) => e.to_errno(),
                                 Ok(i) => i.try_into()
                                             .unwrap_or($crate::error::code::ERANGE.to_errno()),
-- 
2.54.0

