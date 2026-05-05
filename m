Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07F1E481FAF;
	Tue,  5 May 2026 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777994660; cv=none; b=K+FDbrZXP/B9x0sc82LGPb0iJzTOj4+/m7INLDsZLGcw3rzmHq5HZhR6msJuzsww+izxSbtSK16rtxjmqsiv04ISxqr90IaaZdc2HTb4vZEGTiwBwTo1U/EcD81pnD32SSFXcgfDfQQVgyTBWiqfo8iQRH7O/B2WnfYP0w2Zcos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777994660; c=relaxed/simple;
	bh=dC7AHxeF5HBFGmWhygEDRND5nAaKwuopbPHrGPWQa68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RN+cYSEJ6zASaif1aV+BnykwkX8YX0Ncg2CB7lbV6wul+a3sxGO5ZszO3dtV2p7knM0DOCZndKlZJrir741vApk5C8Minvgu4RwWShVTmRnU1AfihetcI4gqe/+HSXrOhvnJgtVD/p0pZ/es9MLuDiZXEVs/egoLY2Ds++YVXrs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dEUvZKHJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dEUvZKHJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB21CC2BCF4;
	Tue,  5 May 2026 15:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777994659;
	bh=dC7AHxeF5HBFGmWhygEDRND5nAaKwuopbPHrGPWQa68=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dEUvZKHJkYv36Vu8X9bDVLSXK2Bf79p4daOvLsDuQbiCBzpIa9oqYJvJDezD8t0B5
	 zBJskNfqg0dVPOfsE7xxi6ItfJfFWFcvCP0/7Amm60Pbgtx/fmemd8H3Y7thGGlgTJ
	 GXeDwEeWXPgbyY9s+8a6PbwZCVrNpLBo9kNfnXyTjgvj2BOwZ4xx0nPrufbUYHK4ak
	 138zZUPa++ZJfrfUMCDeCrYRC+YLff3VPlSf2GWMK9Z8TyfaBLDC/zmhyxLi7CpF0V
	 esjOANc+gHnFpDPSsZYd6NJEwR8GvjXGBTdXUb+3PTTlvFft1qw7Cz20s1uH0xi+WX
	 NdI//19YYUDfA==
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
Subject: [PATCH v2 3/3] rust: driver core: remove drvdata() and driver_type
Date: Tue,  5 May 2026 17:23:09 +0200
Message-ID: <20260505152400.3905096-4-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260505152400.3905096-1-dakr@kernel.org>
References: <20260505152400.3905096-1-dakr@kernel.org>
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

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/base.h   | 16 ------------
 rust/kernel/device.rs | 60 -------------------------------------------
 2 files changed, 76 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 0ed1e278b957..483b99b4fa3d 100644
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

