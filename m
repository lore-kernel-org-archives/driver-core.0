Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4754303A01;
	Fri, 13 Feb 2026 22:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771020462; cv=none; b=FY1Mt1zgTqOz4OROToRaIQkGKjaBJYMSmh/b6SCmwFiW3FrcaNLplF1TtEG9JmfMDmOIb8oYWGN6xgJ+VG6kaAPgVTPqON7V7Fyz7Hj9cIxlQlaLVMeyXYD0mkdwylDrbKWTWU8lck71VbiPfEFvPDekq+7FlzY7AAhL/g2hsuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771020462; c=relaxed/simple;
	bh=v6pYErK32CTDUWUPlbCOsjcpr4M6bc3WqnIvsYorakM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bXml8EdoEBr8TMlZWPyrKG1s6Vu8o1+bHwoZ+K/yt2SFBW2GgfMTc/9CVyKxn07ptA7JToC4bZ9TppRIIY6HcIVczylQ4ZtyL3iHse7JIHT5e+Q0PNk7oEdU/257HDvkTOCdeB3Wfg1022flwZVYtFeM5PV9nANtrhBYZVYWLQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kzNPP7OU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kzNPP7OU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A6291C116C6;
	Fri, 13 Feb 2026 22:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771020461;
	bh=v6pYErK32CTDUWUPlbCOsjcpr4M6bc3WqnIvsYorakM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kzNPP7OUXUfex6xFGKrwB0Jt69w++sRmwHxwYcqU0wm13nRV2rEfT4Q4ATS/FYCiM
	 jpfknroj6hdVN9QHNa48sINlgviXSbKPQ0t0253/Lwl1mkwTVpiLFWa43/dGHS9PNJ
	 lYAIOY8oX1udaX2hldQ7+bfz3RLPcKX9v8N1BlHu3DrnrClzNZlL2dRPBxWWrhnwlT
	 DK34tnSaRyxaSmfp2+Ufhg0tLiDjXPCrp6Yerxbo2wj2S6XJP9LsC3IHWDbYrG4mdM
	 +OER+zLfmaDxmIo52QuSPjqeKdn5rI1r91wI7fBgkv19KQ43ehW1yDYJNBJ376ng/g
	 urM6ESOo5avJA==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 5/5] rust: devres: embed struct devres_node directly
Date: Fri, 13 Feb 2026 23:07:15 +0100
Message-ID: <20260213220718.82835-6-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213220718.82835-1-dakr@kernel.org>
References: <20260213220718.82835-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the Devres<T> container uses devm_add_action() to register a
devres callback.

devm_add_action() allocates a struct action_devres, which on top of
struct devres_node, just keeps a data pointer and release function
pointer.

This is an unnecessary indirection, given that analogous to struct
devres, the Devres<T> container can just embed a struct devres_node
directly without an additional allocation.

In contrast to struct devres, we don't need to force an alignment of
ARCH_DMA_MINALIGN (as struct devres does to account for the worst case)
since we have generics in Rust. I.e. the compiler already ensures
correct alignment of the embedded T in Devres<T>.

Thus, get rid of devm_add_action() and instead embed a struct
devres_node directly.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/devres.rs | 182 +++++++++++++++++++++++++++++++-----------
 1 file changed, 135 insertions(+), 47 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 6afe196be42c..4c1efad758c7 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -23,9 +23,22 @@
         rcu,
         Arc, //
     },
-    types::ForeignOwnable,
+    types::{
+        ForeignOwnable,
+        Opaque, //
+    },
 };
 
+/// Inner type that embeds a `struct devres_node` and the `Revocable<T>`.
+#[repr(C)]
+#[pin_data]
+struct Inner<T> {
+    #[pin]
+    node: Opaque<bindings::devres_node>,
+    #[pin]
+    data: Revocable<T>,
+}
+
 /// This abstraction is meant to be used by subsystems to containerize [`Device`] bound resources to
 /// manage their lifetime.
 ///
@@ -111,12 +124,63 @@
 /// ```
 pub struct Devres<T: Send> {
     dev: ARef<Device>,
-    /// Pointer to [`Self::devres_callback`].
-    ///
-    /// Has to be stored, since Rust does not guarantee to always return the same address for a
-    /// function. However, the C API uses the address as a key.
-    callback: unsafe extern "C" fn(*mut c_void),
-    data: Arc<Revocable<T>>,
+    inner: Arc<Inner<T>>,
+}
+
+// Calling the FFI functions from the `base` module directly from the `Devres<T>` impl may result in
+// them being called directly from driver modules. This happens since the Rust compiler will use
+// monomorphisation, so it might happen that functions are instantiated within the calling driver
+// module. For now, work around this with `#[inline(never)]` helpers.
+//
+// TODO: Remove once a more generic solution has been implemented. For instance, we may be able to
+// leverage `bindgen` to take care of this depending on whether a symbol is (already) exported.
+mod base {
+    use kernel::{
+        bindings,
+        prelude::*, //
+    };
+
+    #[inline(never)]
+    #[allow(clippy::missing_safety_doc)]
+    pub(super) unsafe fn devres_node_init(
+        node: *mut bindings::devres_node,
+        release: bindings::dr_node_release_t,
+        free: bindings::dr_node_free_t,
+    ) {
+        // SAFETY: Safety requirements are the same as `bindings::devres_node_init`.
+        unsafe { bindings::devres_node_init(node, release, free) }
+    }
+
+    #[inline(never)]
+    #[allow(clippy::missing_safety_doc)]
+    pub(super) unsafe fn devres_set_node_dbginfo(
+        node: *mut bindings::devres_node,
+        name: *const c_char,
+        size: usize,
+    ) {
+        // SAFETY: Safety requirements are the same as `bindings::devres_set_node_dbginfo`.
+        unsafe { bindings::devres_set_node_dbginfo(node, name, size) }
+    }
+
+    #[inline(never)]
+    #[allow(clippy::missing_safety_doc)]
+    pub(super) unsafe fn devres_node_add(
+        dev: *mut bindings::device,
+        node: *mut bindings::devres_node,
+    ) {
+        // SAFETY: Safety requirements are the same as `bindings::devres_node_add`.
+        unsafe { bindings::devres_node_add(dev, node) }
+    }
+
+    #[inline(never)]
+    #[allow(clippy::missing_safety_doc)]
+    pub(super) unsafe fn devres_node_remove(
+        dev: *mut bindings::device,
+        node: *mut bindings::devres_node,
+    ) -> bool {
+        // SAFETY: Safety requirements are the same as `bindings::devres_node_remove`.
+        unsafe { bindings::devres_node_remove(dev, node) }
+    }
 }
 
 impl<T: Send> Devres<T> {
@@ -128,58 +192,82 @@ pub fn new<E>(dev: &Device<Bound>, data: impl PinInit<T, E>) -> Result<Self>
     where
         Error: From<E>,
     {
-        let callback = Self::devres_callback;
-        let data = Arc::pin_init(Revocable::new(data), GFP_KERNEL)?;
-        let devres_data = data.clone();
+        let inner = Arc::pin_init::<Error>(
+            try_pin_init!(Inner {
+                node <- Opaque::ffi_init(|node: *mut bindings::devres_node| {
+                    // SAFETY: `node` is a valid pointer to an uninitialized `struct devres_node`.
+                    unsafe {
+                        base::devres_node_init(
+                            node,
+                            Some(Self::devres_node_release),
+                            Some(Self::devres_node_free_node),
+                        )
+                    };
+
+                    // SAFETY: `node` is a valid pointer to an uninitialized `struct devres_node`.
+                    unsafe {
+                        base::devres_set_node_dbginfo(
+                            node,
+                            // TODO: Use `core::any::type_name::<T>()` once we are able to convert
+                            // the `&str` to a NULL terminated `&CStr` without additional
+                            // allocation.
+                            c"Devres<T>".as_char_ptr(),
+                            core::mem::size_of::<Revocable<T>>(),
+                        )
+                    };
+                }),
+                data <- Revocable::new(data),
+            }),
+            GFP_KERNEL,
+        )?;
 
         // SAFETY:
-        // - `dev.as_raw()` is a pointer to a valid bound device.
-        // - `data` is guaranteed to be a valid for the duration of the lifetime of `Self`.
-        // - `devm_add_action()` is guaranteed not to call `callback` for the entire lifetime of
-        //   `dev`.
-        to_result(unsafe {
-            bindings::devm_add_action(
-                dev.as_raw(),
-                Some(callback),
-                Arc::as_ptr(&data).cast_mut().cast(),
-            )
-        })?;
-
-        // `devm_add_action()` was successful and has consumed the reference count.
-        core::mem::forget(devres_data);
+        // - `dev` is a valid pointer to a bound `struct device`.
+        // - `node` is a valid pointer to a `struct devres_node`.
+        // - `devres_node_add()` is guaranteed not to call `devres_node_release()` for the entire
+        //    lifetime of `dev`.
+        unsafe { base::devres_node_add(dev.as_raw(), inner.node.get()) };
+
+        // Take additional reference count for `devres_node_add()`.
+        core::mem::forget(inner.clone());
 
         Ok(Self {
             dev: dev.into(),
-            callback,
-            data,
+            inner,
         })
     }
 
     fn data(&self) -> &Revocable<T> {
-        &self.data
+        &self.inner.data
     }
 
     #[allow(clippy::missing_safety_doc)]
-    unsafe extern "C" fn devres_callback(ptr: *mut kernel::ffi::c_void) {
-        // SAFETY: In `Self::new` we've passed a valid pointer of `Revocable<T>` to
-        // `devm_add_action()`, hence `ptr` must be a valid pointer to `Revocable<T>`.
-        let data = unsafe { Arc::from_raw(ptr.cast::<Revocable<T>>()) };
+    unsafe extern "C" fn devres_node_release(
+        _dev: *mut bindings::device,
+        node: *mut bindings::devres_node,
+    ) {
+        let node = Opaque::cast_from(node);
+
+        // SAFETY: `node` is in the same allocation as its container.
+        let inner = unsafe { kernel::container_of!(node, Inner<T>, node) };
+
+        // SAFETY: `inner` is a valid `Inner<T>` pointer.
+        let inner = unsafe { &*inner };
 
-        data.revoke();
+        inner.data.revoke();
+    }
+
+    #[allow(clippy::missing_safety_doc)]
+    unsafe extern "C" fn devres_node_free_node(node: *mut bindings::devres_node) {
+        // SAFETY: `node` points to the entire `Inner<T>` allocation.
+        drop(unsafe { Arc::from_raw(node.cast::<Inner<T>>()) });
     }
 
-    fn remove_action(&self) -> bool {
+    fn remove_node(&self) -> bool {
         // SAFETY:
-        // - `self.dev` is a valid `Device`,
-        // - the `action` and `data` pointers are the exact same ones as given to
-        //   `devm_add_action()` previously,
-        (unsafe {
-            bindings::devm_remove_action_nowarn(
-                self.dev.as_raw(),
-                Some(self.callback),
-                core::ptr::from_ref(self.data()).cast_mut().cast(),
-            )
-        } == 0)
+        // - `self.device().as_raw()` is a valid pointer to a bound `struct device`.
+        // - `self.inner.node.get()` is a valid pointer to a `struct devres_node`.
+        unsafe { base::devres_node_remove(self.device().as_raw(), self.inner.node.get()) }
     }
 
     /// Return a reference of the [`Device`] this [`Devres`] instance has been created with.
@@ -261,12 +349,12 @@ fn drop(&mut self) {
         // SAFETY: When `drop` runs, it is guaranteed that nobody is accessing the revocable data
         // anymore, hence it is safe not to wait for the grace period to finish.
         if unsafe { self.data().revoke_nosync() } {
-            // We revoked `self.data` before the devres action did, hence try to remove it.
-            if self.remove_action() {
+            // We revoked `self.data` before devres did, hence try to remove it.
+            if self.remove_node() {
                 // SAFETY: In `Self::new` we have taken an additional reference count of `self.data`
-                // for `devm_add_action()`. Since `remove_action()` was successful, we have to drop
+                // for `devres_node_add()`. Since `remove_node()` was successful, we have to drop
                 // this additional reference count.
-                drop(unsafe { Arc::from_raw(Arc::as_ptr(&self.data)) });
+                drop(unsafe { Arc::from_raw(Arc::as_ptr(&self.inner)) });
             }
         }
     }
-- 
2.53.0

