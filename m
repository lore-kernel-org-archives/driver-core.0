Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E917C1429D;
	Wed,  3 Jun 2026 01:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780450088; cv=none; b=JirA1Bbl43zC4uH0XpP2qViKBxz3sSwTRZXVyrK8H4VBxrmkxNrc/+yedy94c+e6JDfFqfTJ4a77HTjyzAVWoCuCtSGR0XXUUF16DAJ0vnhQxMVl3B9Ad5m6qm1N32HJkUjrpRXYGJb4RCz9iqGdv1DnqBQlgYqLUlXGJ4VCgpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780450088; c=relaxed/simple;
	bh=M98zjOm8FgChp1mgBvKMZ8vq/VhelKkwLB7c1sJh2jM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lHTihvEJPZR9BWLU3WAztz1ITAS4groLAhRscCdH08MPxiBmVM7Zh3M6rt5V8AUciAQ1yAtdn3am6tCY6eFdep4Mt/Ge+r5YTRcgMv40GiCqMMq9NxNRbfmY7ofi5FpNqdHK30G+vFEmb+FZ7P04qGLWiP1iR2geNgKYZ/uWkQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C70Hmhxu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C70Hmhxu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1DDE1F00893;
	Wed,  3 Jun 2026 01:28:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780450086;
	bh=m2h4Z6OkkbbInzIbrprZlhpoCefuLJi9rVqO8HTD32Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C70Hmhxuy1lVEOh9LhZZUJf/tt0EN7qh7Zo5cog9AD2L8MZxMqmreaoSZYWVG9I3y
	 R+uF9r8HVocj6dmLwfnKn2RBNG3hRjkyc5SoZ8M93qJ7fIyG7xFh4NHfEsSI3h6iRB
	 CDt8IbyhablZ37BexlWC6RwTzVGibXgsYIyqqEVXCtMRfms/i4ZPAkz5B8tFYaP+zk
	 jtpi2qlTyJW2Z5DIJ747joullX0N8bd6vzH2/nnVyKox4mrL2mJzMwoNZdHJG6XdR0
	 xovJ25DpCTbR76gF6pyteZiV8i91Gcz8BzJII8Om1ZZet+Cbaq5uCbIk30pIWR347+
	 A6KyPQuAIHnQw==
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
Subject: [PATCH v2 2/7] rust: drm: Add UnbindGuard for drm_dev_enter/exit critical sections
Date: Wed,  3 Jun 2026 03:15:44 +0200
Message-ID: <20260603011711.2077361-3-dakr@kernel.org>
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

DRM ioctls do not guarantee that the parent bus device is still bound.
However, since DRM device registration is managed through Devres, using
drm_dev_unplug() on unregistration ensures that between drm_dev_enter()
and drm_dev_exit() the parent device must be bound.

Add UnbindGuard, a guard object representing a drm_dev_enter/exit SRCU
critical section that dereferences to &Device<Bound> of the parent bus
device. The guard is only available on Device<T, Registered>, ensuring
it cannot be used on unregistered devices.

Also add with_unbind_guard() as a convenience helper that executes a
closure with the bound device reference.

Switch Registration::drop from drm_dev_unregister() to drm_dev_unplug()
to provide the SRCU barrier that UnbindGuard's safety argument relies on.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs | 82 ++++++++++++++++++++++++++++++++++++++-
 rust/kernel/drm/driver.rs | 10 ++++-
 2 files changed, 89 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 858272fc2164..828618ae19af 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -7,7 +7,10 @@
 use crate::{
     alloc::allocator::Kmalloc,
     bindings,
-    device,
+    device::{
+        self,
+        AsBusDevice as _, //
+    },
     drm::{
         self,
         driver::AllocImpl,
@@ -355,6 +358,83 @@ pub(crate) unsafe fn assume_ctx<NewCtx: DeviceContext>(&self) -> &Device<T, NewC
     }
 }
 
+impl<T: drm::Driver> Device<T, Registered> {
+    /// Guard against the parent bus device being unbound.
+    ///
+    /// Returns an [`UnbindGuard`] if the device has not been unplugged, [`None`] otherwise.
+    ///
+    /// The returned guard dereferences to the parent bus device in the [`device::Bound`] context
+    /// (see [`Driver::ParentDevice`](drm::Driver::ParentDevice)).
+    ///
+    /// While [`UnbindGuard`] is held the parent device is guaranteed to be bound.
+    #[must_use]
+    pub fn unbind_guard(&self) -> Option<UnbindGuard<'_, T>> {
+        let mut idx: i32 = 0;
+        // SAFETY: `self.as_raw()` is a valid pointer to a `struct drm_device` by the type
+        // invariants of `Device<T, Registered>`.
+        if unsafe { bindings::drm_dev_enter(self.as_raw(), &mut idx) } {
+            Some(UnbindGuard { dev: self, idx })
+        } else {
+            None
+        }
+    }
+
+    /// Execute a closure while the parent bus device is guaranteed to be bound.
+    ///
+    /// Acquires the [`UnbindGuard`] and, if the device has not been unplugged, calls `f` with the
+    /// parent bus device. Returns `None` if the device has been unplugged.
+    pub fn with_unbind_guard<R>(
+        &self,
+        f: impl FnOnce(&T::ParentDevice<device::Bound>) -> R,
+    ) -> Option<R> {
+        let guard = self.unbind_guard()?;
+        Some(f(&guard))
+    }
+}
+
+/// A guard preventing the parent bus device from being unbound.
+///
+/// The guard dereferences to [`Driver::ParentDevice<Bound>`](drm::Driver::ParentDevice), providing
+/// access to the parent bus device with the guarantee that it is bound for the entire duration of
+/// the critical section.
+///
+/// Internally this is backed by a `drm_dev_enter()` / `drm_dev_exit()` SRCU critical section.
+///
+/// See [`Device::unbind_guard`] for details on the safety argument.
+///
+/// # Invariants
+///
+/// - `idx` is the SRCU read lock index returned by a successful `drm_dev_enter()` call.
+/// - The parent bus device of `dev` is bound for the lifetime of this guard.
+#[must_use]
+pub struct UnbindGuard<'a, T: drm::Driver> {
+    dev: &'a Device<T, Registered>,
+    idx: i32,
+}
+
+impl<T: drm::Driver> Deref for UnbindGuard<'_, T> {
+    type Target = T::ParentDevice<device::Bound>;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        // SAFETY:
+        // - The parent `struct device` is embedded in a `T::ParentDevice`, as guaranteed by
+        //   `UnregisteredDevice::new` taking a `&T::ParentDevice<device::Bound>`.
+        // - By the type invariants of `UnbindGuard`, the parent device is bound for the lifetime
+        //   of this guard.
+        unsafe { T::ParentDevice::from_device(self.dev.as_ref().as_bound()) }
+    }
+}
+
+impl<T: drm::Driver> Drop for UnbindGuard<'_, T> {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: `self.idx` was returned by a successful `drm_dev_enter()` call, as guaranteed
+        // by the type invariants of `UnbindGuard`.
+        unsafe { bindings::drm_dev_exit(self.idx) };
+    }
+}
+
 impl<T: drm::Driver, C: DeviceContext> Deref for Device<T, C> {
     type Target = T::Data;
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index 802e7fc13e30..f68a17d8939d 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -199,8 +199,14 @@ unsafe impl<T: Driver> Send for Registration<T> {}
 
 impl<T: Driver> Drop for Registration<T> {
     fn drop(&mut self) {
+        // Use `drm_dev_unplug` rather than `drm_dev_unregister` to ensure that existing
+        // `drm_dev_enter()` critical sections complete before unregistration proceeds. This
+        // is required for the safety of `UnbindGuard`, which relies on the SRCU barrier in
+        // `drm_dev_unplug()` to guarantee that the parent device is still bound within the
+        // critical section.
+        //
         // SAFETY: Safe by the invariant of `ARef<drm::Device<T>>`. The existence of this
-        // `Registration` also guarantees the this `drm::Device` is actually registered.
-        unsafe { bindings::drm_dev_unregister(self.0.as_raw()) };
+        // `Registration` also guarantees that this `drm::Device` is actually registered.
+        unsafe { bindings::drm_dev_unplug(self.0.as_raw()) };
     }
 }
-- 
2.54.0

