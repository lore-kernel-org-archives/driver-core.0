Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE6D3B1006;
	Sun, 28 Jun 2026 14:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782658501; cv=none; b=d2bYpmGagXUXpMDrHIXDEAoEMhdzvnLcG86rwDAb3eTnmqIBnT5APt92UYTUGMud8PTGSrrmFTUhLo4GJt6NCpl9Tm5flzVegdr0U51zbtt1eBm8z55IeFZ7D2+ISWz7Gl8NaVDbAB1SZWTKWFhppM7PQ+HEJYFW3FXyO3pYShU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782658501; c=relaxed/simple;
	bh=QlJ6E2Y/8lHJmbsdXNP7Dd/c4qztAoBxRXv88swAwjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WYlyZxTUBs7QmPeYCc5Q90pys77dHJyuIrAjmRL4Ox4+S6DLKVQkC4Ax7rNzCAWJjzI8Hj3G6IuWSKn9oM58k2AuQMkHsTB2ITskXJCbW9A8a9pLL1LK0znduRscQQBA90fLZUfz8vy7Gurcdsel1h8e2YFYlM7uIvGAv+YkB4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D0I3w/se; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D0I3w/se"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 618D31F000E9;
	Sun, 28 Jun 2026 14:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782658500;
	bh=LH65PRUHsPjhD39K61P9g7SH8nVErNkhMDJ0PXVoylk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=D0I3w/seh2fFh1sAqJEKuMSXl9y2RqmLLQvzF1byGlaqTSXn1v8/6uzoVZJcaPz2G
	 ltyIf4j0/RevhtnjbXnIbTGMA1DzESdwxUI0CI7qUeZvc/xiZ1qqcRmeT8A4eYuoUD
	 zdlyR/eaG6nkDNKBAy7vG4d80Fuufe3Fzj8wHdMNB4TlPR0NPVmQd8uXyi37Qts5h6
	 VZTxuI3FpNUFitUr4LI3HYUyW6z6uSirssXM/gxXdwAF27KZ1tnjdjCgJ2Y3iMpzok
	 ZijwhS5Vnq203C7hZo2OsaMwtXWElgrWOdHBPxNckZWErp/aebtUuVOHcx6qVcjZ7g
	 +fv7/PjZ9mfvA==
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
Subject: [PATCH v5 11/19] rust: drm: add Ioctl device context typestate
Date: Sun, 28 Jun 2026 16:53:31 +0200
Message-ID: <20260628145406.2107056-12-dakr@kernel.org>
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

Add the Ioctl DeviceContext for DRM devices that have been registered
with userspace previously.

A Device<T, Ioctl> has been registered at some point, but may be
concurrently unregistering or already unregistered. drm_dev_enter() can
guard against this, ensuring the device remains registered for the
duration of the critical section.

This typestate will be used in ioctl dispatch context where registration
is guaranteed by the DRM core, and RegistrationGuard can safely be
acquired.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/drm/device.rs | 34 +++++++++++++++++++++++++++++++---
 rust/kernel/drm/mod.rs    |  1 +
 2 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/drm/device.rs b/rust/kernel/drm/device.rs
index 86a7fca1d33f..d429b4655449 100644
--- a/rust/kernel/drm/device.rs
+++ b/rust/kernel/drm/device.rs
@@ -74,14 +74,16 @@ macro_rules! drm_legacy_fields {
 
 /// A trait implemented by all possible contexts a [`Device`] can be used in.
 ///
-/// A [`Device`] can be in one of two contexts:
+/// A [`Device`] can be in one of the following contexts:
 ///
 /// - [`Normal`]: The general-purpose, reference-counted context. A [`Device`] in this context may
 ///   or may not be registered with userspace.
+/// - [`Ioctl`]: The device has been registered with userspace at some point; used in ioctl
+///   dispatch context.
 /// - [`Registered`]: The device has been registered with userspace at some point.
 ///
-/// `Device<T, Registered>` dereferences to `Device<T>` ([`Normal`]), so any method available on a
-/// [`Normal`] device is also available on a [`Registered`] one.
+/// Both `Device<T, Ioctl>` and `Device<T, Registered>` dereference to `Device<T>` ([`Normal`]),
+/// so any method available on a [`Normal`] device is also available in the other contexts.
 pub trait DeviceContext: Sealed + Send + Sync {}
 
 /// The general-purpose, reference-counted [`DeviceContext`].
@@ -113,6 +115,21 @@ impl DeviceContext for Normal {}
 impl Sealed for Registered {}
 impl DeviceContext for Registered {}
 
+/// The [`DeviceContext`] of a [`Device`] that has been registered with userspace previously.
+///
+/// A [`Device`] in this context has been registered at some point, but may be concurrently
+/// unregistering or already unregistered. `drm_dev_enter()` can guard against this, ensuring the
+/// device remains registered for the duration of the critical section.
+///
+/// # Invariants
+///
+/// A [`Device`] in this context has been registered with userspace via `drm_dev_register()` at
+/// some point.
+pub struct Ioctl;
+
+impl Sealed for Ioctl {}
+impl DeviceContext for Ioctl {}
+
 /// A [`Device`] which is known at compile-time to be unregistered with userspace.
 ///
 /// This type allows performing operations which are only safe to do before userspace registration,
@@ -342,6 +359,17 @@ fn deref(&self) -> &Self::Target {
     }
 }
 
+impl<T: drm::Driver> Deref for Device<T, Ioctl> {
+    type Target = Device<T>;
+
+    #[inline]
+    fn deref(&self) -> &Self::Target {
+        // SAFETY: The caller holds a `Device<T, Ioctl>`, which guarantees all invariants
+        // of the weaker `Normal` context.
+        unsafe { self.assume_ctx() }
+    }
+}
+
 // SAFETY: DRM device objects are always reference counted and the get/put functions
 // satisfy the requirements.
 unsafe impl<T: drm::Driver> AlwaysRefCounted for Device<T> {
diff --git a/rust/kernel/drm/mod.rs b/rust/kernel/drm/mod.rs
index e5bfaf130342..a6693d2b84b8 100644
--- a/rust/kernel/drm/mod.rs
+++ b/rust/kernel/drm/mod.rs
@@ -11,6 +11,7 @@
 
 pub use self::device::Device;
 pub use self::device::DeviceContext;
+pub use self::device::Ioctl;
 pub use self::device::Normal;
 pub use self::device::Registered;
 pub use self::device::UnregisteredDevice;
-- 
2.54.0

