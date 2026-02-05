Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201463346BB;
	Thu,  5 Feb 2026 22:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331688; cv=none; b=SPVvPBnSOXPHhJw1lXaRWJj6FkQwHL0ZTeUpMwXongc80qLVz5i1Ge3OT3ZtHCzFmoe6eIqpivwL4cs+j+uLv+eFDj/StL+fgunepoQtbWKats2FE1kfBJsCVXQy/6s1lI2rRhtbmXJtf+z20+6cPluijxP7KhwccjhFmNGGVLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331688; c=relaxed/simple;
	bh=/+nUu1fIuEPC3eN0fSi7JDz2gDsma6hdxXh3GVA9izk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hH+/pf5AXYzIHpb3hpCLCWUc0+nhjTMZwycWLGc1Q9r98WuWM54UJvEzTm6RVHIWVs1iSqe1m1v3ktygowICVdH+GE8QX/KbQiER0BMaykd83f9DFj9uT3WvTml/FhA8IHDeX/VnaJrq1/eMq7zIwZK3MhGW7aQPCE8qUceQSWQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LM5q94mr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LM5q94mr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0207C4CEF7;
	Thu,  5 Feb 2026 22:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770331687;
	bh=/+nUu1fIuEPC3eN0fSi7JDz2gDsma6hdxXh3GVA9izk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LM5q94mrj6UJVEVLoEIImdQU09mseqVv8OVHGvo9vdl7kLH9WYmJCI+L//MNZZZgP
	 dxrvSdb1Q/HrQ2YPRsJKtM9od4KFlXq2AIEGc/C6I66sJr1uupjEJT6k/ysaimo1kK
	 AHC6fZO/tRYokBLgKLTwiwsbI58qq5+3O0JyFsn4mlKWXedOe/jBoPZHhXDft2Z1mT
	 SaFtkWiybBgcy3O0aGF+U/9r2j01xeK0Gam6C0hKSB3nFl/LD248Bz+UcwBInCXTE3
	 HDb5RYFYC78KiWc3+H23l/ffvqcObHJfU/g3bStx/FaSeZb1joPzrMpBEOsHzNgmy2
	 +rthVIS7AOuyQ==
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
Subject: [PATCH 5/5] rust: devres: embed struct devres_node directly
Date: Thu,  5 Feb 2026 23:31:28 +0100
Message-ID: <20260205224706.91996-7-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205224706.91996-2-dakr@kernel.org>
References: <20260205224706.91996-2-dakr@kernel.org>
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
 rust/kernel/devres.rs | 123 ++++++++++++++++++++++++++----------------
 1 file changed, 78 insertions(+), 45 deletions(-)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index ff66f561740a..649e34962c38 100644
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
@@ -111,12 +124,7 @@
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
 }
 
 impl<T: Send> Devres<T> {
@@ -128,57 +136,82 @@ pub fn new<E>(dev: &Device<Bound>, data: impl PinInit<T, E>) -> Result<Self>
     where
         Error: From<E>,
     {
-        let callback = Self::devres_callback;
-        let data = Arc::pin_init(Revocable::new(data), GFP_KERNEL)?;
+        let inner = Arc::pin_init::<Error>(
+            try_pin_init!(Inner {
+                node <- Opaque::ffi_init(|node: *mut bindings::devres_node| {
+                    // SAFETY: `node` is a valid pointer to an uninitialized `struct devres_node`.
+                    unsafe {
+                        bindings::devres_node_init(
+                            node,
+                            Some(Self::devres_node_release),
+                            Some(Self::devres_node_free_node),
+                        )
+                    };
+
+                    // SAFETY: `node` is a valid pointer to an uninitialized `struct devres_node`.
+                    unsafe {
+                        bindings::devres_set_node_dbginfo(
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
+        // - `dev` is a valid pointer to a bound `struct device`.
+        // - `node` is a valid pointer to a `struct devres_node`.
+        // - `devres_node_add()` is guaranteed not to call `devres_node_release()` for the entire
+        //    lifetime of `dev`.
+        unsafe { bindings::devres_node_add(dev.as_raw(), inner.node.get()) };
 
-        // Take additional reference count for `devm_add_action()`.
-        core::mem::forget(data.clone());
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
 
-        data.revoke();
+        // SAFETY: `node` is in the same allocation as its container.
+        let inner = unsafe { kernel::container_of!(node, Inner<T>, node) };
+
+        // SAFETY: `inner` is a valid `Inner<T>` pointer.
+        let inner = unsafe { &*inner };
+
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
+        unsafe { bindings::devres_node_remove(self.device().as_raw(), self.inner.node.get()) }
     }
 
     /// Return a reference of the [`Device`] this [`Devres`] instance has been created with.
@@ -260,12 +293,12 @@ fn drop(&mut self) {
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
2.52.0

