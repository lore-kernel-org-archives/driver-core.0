Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7026F2BE;
	Mon, 27 Apr 2026 22:10:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777327819; cv=none; b=WoqEqowZRhp5Rz53Fm4XLZUVEvGLmNxyueZrau/JnzGuCaooY0hm/HUDFBDPuAJIuOnRxOgjAvNxLZmcweGfvlBnii1aB4x723UsI69BqcrJoa7C5RBTz7WSPJk8fRf7yQkBsTBeX7xO4XsE4Hict/6RQohagkN6O9ZwnhpZOTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777327819; c=relaxed/simple;
	bh=/LVJj2hk5eOa1zpWC5tFVDlRCBJ9XrhN5UgxjHMykd4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PuJDtgEd59+oe6oiIftVk+pWFpgfwu6r2p1cHiKzunXgcKpmaP1fDPiaMZu9k3/TeMl4k79RMVnjEVkuGJL/+a/mMXYOspFFebHnTvjg5JNLpJ9FxYK9eVE3ixEzo5xBbmqLTy6G4QnO/8iWX7SV1YoF0cwNwIETDghX1a/xMiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=luplG3kO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="luplG3kO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB1CAC2BCC6;
	Mon, 27 Apr 2026 22:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777327818;
	bh=/LVJj2hk5eOa1zpWC5tFVDlRCBJ9XrhN5UgxjHMykd4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=luplG3kO09WLJMuaQ0L/0/Eg5XYFHXgHhkW1TLCD1u0sgU3mmQYRpy98KgzWYmMw/
	 86dPABK5TsUHkKGB8zR2T+Ig4h1a193kZc+ac5+b/KmI5fm/zipjU5pfOwAZ3CJogL
	 z1q0gTiBbUc7oPVPjIifzUxTXPLTeb1KGETtJlW2urku8krGEAKSPoed3MjvSb8vTf
	 sGohw/hQoqVZYowccpVQbxFoJReg6GvxdtubBItnNKWm+BVtxnCIfVYowE/803zTiR
	 g+x18ZBXyS9ONgSzUYN6cwnm7gYnjN8x5r2jkEqZxuv1lYPkT/cBzHGlxPPpZJlZKz
	 Vuq7PbrY6MPWA==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	acourbot@nvidia.com,
	aliceryhl@google.com,
	david.m.ertman@intel.com,
	ira.weiny@intel.com,
	leon@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/2] rust: driver core: remove drvdata() and driver_type
Date: Tue, 28 Apr 2026 00:09:41 +0200
Message-ID: <20260427221002.2143861-3-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260427221002.2143861-1-dakr@kernel.org>
References: <20260427221002.2143861-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When drvdata() was introduced in commit 6f61a2637abe ("rust: device:
introduce Device::drvdata()"), its commit message already noted that a
direct accessor to the driver's bus device private data is not commonly
required -- bus callbacks provide access through &self, and other entry
points (IRQs, workqueues, IOCTLs, etc.) carry their own private data.

The sole motivation for drvdata() was inter-driver interaction -- an
auxiliary driver deriving the parent's bus device private data from the
parent device.

However, drvdata() exposes the driver's bus device private data beyond
the driver's own scope. This creates ordering constraints; for instance
drvdata may not be set yet when the first caller of drvdata() can
appear. It also forces the driver's bus device private data to outlive
all registrations that access it, which causes unnecessary
complications.

Private data should be private to the entity that issues it, i.e. bus
device private data belongs to bus callbacks, class device private data
to class callbacks, IRQ private data to the IRQ handler, etc.

With registration-private data now available through the auxiliary bus,
there is no remaining user of drvdata(), thus remove it.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/base.h   | 16 ------------
 rust/kernel/device.rs | 60 -------------------------------------------
 2 files changed, 76 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 30b416588617..a19f4cda2c83 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -86,18 +86,6 @@ struct driver_private {
 };
 #define to_driver(obj) container_of(obj, struct driver_private, kobj)
 
-#ifdef CONFIG_RUST
-/**
- * struct driver_type - Representation of a Rust driver type.
- */
-struct driver_type {
-	/**
-	 * @id: Representation of core::any::TypeId.
-	 */
-	u8 id[16];
-} __packed;
-#endif
-
 /**
  * struct device_private - structure to hold the private to the driver core
  *			   portions of the device structure.
@@ -115,7 +103,6 @@ struct driver_type {
  *			   dev_err_probe() for later retrieval via debugfs
  * @device: pointer back to the struct device that this structure is
  *	    associated with.
- * @driver_type: The type of the bound Rust driver.
  * @dead: This device is currently either in the process of or has been
  *	  removed from the system. Any asynchronous events scheduled for this
  *	  device should exit without taking any action.
@@ -132,9 +119,6 @@ struct device_private {
 	const struct device_driver *async_driver;
 	char *deferred_probe_reason;
 	struct device *device;
-#ifdef CONFIG_RUST
-	struct driver_type driver_type;
-#endif
 	u8 dead:1;
 };
 #define to_device_private_parent(obj)	\
diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 6d5396a43ebe..fd50399aadea 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -15,16 +15,12 @@
     }, //
 };
 use core::{
-    any::TypeId,
     marker::PhantomData,
     ptr, //
 };
 
 pub mod property;
 
-// Assert that we can `read()` / `write()` a `TypeId` instance from / into `struct driver_type`.
-static_assert!(core::mem::size_of::<bindings::driver_type>() >= core::mem::size_of::<TypeId>());
-
 /// The core representation of a device in the kernel's driver model.
 ///
 /// This structure represents the Rust abstraction for a C `struct device`. A [`Device`] can either
@@ -206,29 +202,12 @@ pub unsafe fn as_bound(&self) -> &Device<Bound> {
 }
 
 impl Device<CoreInternal> {
-    fn set_type_id<T: 'static>(&self) {
-        // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
-        let private = unsafe { (*self.as_raw()).p };
-
-        // SAFETY: For a bound device (implied by the `CoreInternal` device context), `private` is
-        // guaranteed to be a valid pointer to a `struct device_private`.
-        let driver_type = unsafe { &raw mut (*private).driver_type };
-
-        // SAFETY: `driver_type` is valid for (unaligned) writes of a `TypeId`.
-        unsafe {
-            driver_type
-                .cast::<TypeId>()
-                .write_unaligned(TypeId::of::<T>())
-        };
-    }
-
     /// Store a pointer to the bound driver's private data.
     pub fn set_drvdata<T: 'static>(&self, data: impl PinInit<T, Error>) -> Result {
         let data = KBox::pin_init(data, GFP_KERNEL)?;
 
         // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
         unsafe { bindings::dev_set_drvdata(self.as_raw(), data.into_foreign().cast()) };
-        self.set_type_id::<T>();
 
         Ok(())
     }
@@ -292,45 +271,6 @@ unsafe fn drvdata_unchecked<T: 'static>(&self) -> Pin<&T> {
         //   in `into_foreign()`.
         unsafe { Pin::<KBox<T>>::borrow(ptr.cast()) }
     }
-
-    fn match_type_id<T: 'static>(&self) -> Result {
-        // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
-        let private = unsafe { (*self.as_raw()).p };
-
-        // SAFETY: For a bound device, `private` is guaranteed to be a valid pointer to a
-        // `struct device_private`.
-        let driver_type = unsafe { &raw mut (*private).driver_type };
-
-        // SAFETY:
-        // - `driver_type` is valid for (unaligned) reads of a `TypeId`.
-        // - A bound device guarantees that `driver_type` contains a valid `TypeId` value.
-        let type_id = unsafe { driver_type.cast::<TypeId>().read_unaligned() };
-
-        if type_id != TypeId::of::<T>() {
-            return Err(EINVAL);
-        }
-
-        Ok(())
-    }
-
-    /// Access a driver's private data.
-    ///
-    /// Returns a pinned reference to the driver's private data or [`EINVAL`] if it doesn't match
-    /// the asserted type `T`.
-    pub fn drvdata<T: 'static>(&self) -> Result<Pin<&T>> {
-        // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
-        if unsafe { bindings::dev_get_drvdata(self.as_raw()) }.is_null() {
-            return Err(ENOENT);
-        }
-
-        self.match_type_id::<T>()?;
-
-        // SAFETY:
-        // - The above check of `dev_get_drvdata()` guarantees that we are called after
-        //   `set_drvdata()`.
-        // - We've just checked that the type of the driver's private data is in fact `T`.
-        Ok(unsafe { self.drvdata_unchecked() })
-    }
 }
 
 impl<Ctx: DeviceContext> Device<Ctx> {
-- 
2.54.0

