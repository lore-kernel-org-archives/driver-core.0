Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 800663F5BFA;
	Wed,  7 Oct 2026 06:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791354531; cv=none; b=QzcIo+ApPVfbDbdyz99amToQD0iwIkBYUEx8BiopE3XDvn1vBU1HfsZvqo6fIhC6h8T3z227867Y92V1JmvTX+EDC68Ww52lveIaQX3k9ie51UKcayV1GJeAXhxQrX7Z4IWkqqxagmV1ggfLyeKBqSmzVr+tJbuGJbLQHo2SrMY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791354531; c=relaxed/simple;
	bh=ZB3xKjEyEnz0zeAVXezukzD8+ZqBZYsmH7fHkYnmxbw=;
	h=Subject:To:Cc:From:Date:In-Reply-To:Message-ID:MIME-Version:
	 Content-Type; b=YWU/72s0YXZ/eKje5kvyZcZx6cU97myF6i8f8GAcv/do4Va8wcroYn1K7Z1HO45ginZ1FaFHkJanLo6H25edzGtglcoydJ79F7MblLUW1NDzJdZTdN9rJQqVN/ftUrdzrVStwOgIbISzcUNPAANhuaeBSxOBvkqYjb/vEm+BOm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ywyJ+0jd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ywyJ+0jd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 939E21F0089B;
	Wed,  7 Oct 2026 06:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791354530;
	bh=/lGAXf3kREgTlIrsjb4nOBsS6lkRb/9Fv7/81qWW1us=;
	h=Subject:To:Cc:From:Date:In-Reply-To;
	b=ywyJ+0jddLy/4IdudVnjq4GQOGRMAEHqm/MSZWS7TMqTt5jFNcszspU6H+qZ5bBBy
	 fNcUgkOm7TclrYu6BsbxgcQx596vbTaSppjXHNGeNR/9UIWKJizt5shhKRVZBCdOwQ
	 WUr+kvOVWZAyIO8/4L5EjTA38Dx3DWuiV531u4oA=
Subject: Patch "rust: irq: pass RegistrationInner as cookie to request_irq" has been added to the 7.2-stable tree
To: a.hindborg@kernel.org,acourbot@nvidia.com,aliceryhl@google.com,bjorn3_gh@protonmail.com,boqun@kernel.org,boris.brezillon@collabora.com,dakr@kernel.org,daniel.almeida@collabora.com,driver-core@lists.linux.dev,ecourtney@nvidia.com,gary@garyguo.net,gregkh@linuxfoundation.org,lossin@kernel.org,markus.probst@posteo.de,ojeda@kernel.org,rafael@kernel.org,sashal@kernel.org,tamird@kernel.org,tmgross@umich.edu,work@onurozkan.dev
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 07 Oct 2026 08:28:20 +0200
In-Reply-To: <20261007-irq-7-2-backport-v1-1-183f514f2aac@google.com>
Message-ID: <2026100720-octagon-chaplain-7185@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore


This is a note to let you know that I've just added the patch titled

    rust: irq: pass RegistrationInner as cookie to request_irq

to the 7.2-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     rust-irq-pass-registrationinner-as-cookie-to-request_irq.patch
and it can be found in the queue-7.2 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From aliceryhl@google.com  Wed Oct  7 08:24:34 2026
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 07 Oct 2026 06:01:58 +0000
Subject: rust: irq: pass RegistrationInner as cookie to request_irq
To: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Sasha Levin <sashal@kernel.org>, Danilo Krummrich <dakr@kernel.org>,  Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Benno Lossin" <lossin@kernel.org>, "Björn Roy Baron" <bjorn3_gh@protonmail.com>, "Boqun Feng" <boqun@kernel.org>, "Boris Brezillon" <boris.brezillon@collabora.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Gary Guo" <gary@garyguo.net>, "Markus Probst" <markus.probst@posteo.de>, "Miguel Ojeda" <ojeda@kernel.org>, "Onur Özkan" <work@onurozkan.dev>, "Rafael J. Wysocki" <rafael@kernel.org>, "Tamir Duberstein" <tamird@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, "Alice Ryhl" <aliceryhl@google.com>
Message-ID: <20261007-irq-7-2-backport-v1-1-183f514f2aac@google.com>

From: Alice Ryhl <aliceryhl@google.com>

With commit ba268514ea14 ("rust: devres: fix race condition due to
nesting"), Devres::new() returns Result<Self> by value instead of
initializing in-place via PinInit. Because request_irq() is called
inside Devres::new(), registration.inner is still uninitialized when the
IRQ is enabled, so accessing registration.inner.device() in the IRQ
callback can read uninitialized memory.

Fix this by storing the Device and handler pointer in RegistrationInner
and passing RegistrationInner as the IRQ cookie after its fields are
initialized.

This is not needed in mainline because commit 98c63ce4d760 ("rust: irq:
make Registration compatible with lifetime-bound drivers") removed
Devres from irq::Registration and moved request_irq() after all fields
are initialized.

Fixes: 29e16fcd67ee ("rust: irq: add &Device<Bound> argument to irq callbacks")
Fixes: ba268514ea14 ("rust: devres: fix race condition due to nesting")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 rust/kernel/irq/request.rs |   89 +++++++++++++++++++++++++++------------------
 1 file changed, 54 insertions(+), 35 deletions(-)

--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -14,7 +14,7 @@ use crate::error::to_result;
 use crate::irq::flags::Flags;
 use crate::prelude::*;
 use crate::str::CStr;
-use crate::sync::Arc;
+use crate::sync::{aref::ARef, Arc};
 
 /// The value that can be returned from a [`Handler`] or a [`ThreadedHandler`].
 #[repr(u32)]
@@ -54,13 +54,18 @@ impl<T: ?Sized + Handler, A: Allocator +
 /// # Invariants
 ///
 /// - `self.irq` is the same as the one passed to `request_{threaded}_irq`.
-/// - `cookie` was passed to `request_{threaded}_irq` as the cookie. It is guaranteed to be unique
+/// - `&self` was passed to `request_{threaded}_irq` as the cookie. It is guaranteed to be unique
 ///   by the type system, since each call to `new` will return a different instance of
 ///   `Registration`.
+/// - `self.handler` points to a valid instance of the handler `T` that lives at least until
+///   `Self::drop` completes.
 #[pin_data(PinnedDrop)]
 struct RegistrationInner {
     irq: u32,
-    cookie: *mut c_void,
+    dev: ARef<Device>,
+    handler: *const c_void,
+    #[pin]
+    _pin: PhantomPinned,
 }
 
 impl RegistrationInner {
@@ -77,18 +82,22 @@ impl PinnedDrop for RegistrationInner {
         //
         // Safe as per the invariants of `RegistrationInner` and:
         //
-        // - The containing struct is `!Unpin` and was initialized using
+        // - `RegistrationInner` is `!Unpin` and was initialized using
         // pin-init, so it occupied the same memory location for the entirety of
         // its lifetime.
         //
         // Notice that this will block until all handlers finish executing,
         // i.e.: at no point will &self be invalid while the handler is running.
-        unsafe { bindings::free_irq(self.irq, self.cookie) };
+        unsafe {
+            bindings::free_irq(
+                self.irq,
+                core::ptr::from_mut::<Self>(self.get_unchecked_mut()).cast::<c_void>(),
+            )
+        };
     }
 }
 
-// SAFETY: We only use `inner` on drop, which called at most once with no
-// concurrent access.
+// SAFETY: `RegistrationInner` has no interior mutability and `handler` points to a `Sync` handler.
 unsafe impl Sync for RegistrationInner {}
 
 // SAFETY: It is safe to send `RegistrationInner` across threads.
@@ -179,7 +188,7 @@ impl<'a> IrqRequest<'a> {
 ///
 /// # Invariants
 ///
-/// * We own an irq handler whose cookie is a pointer to `Self`.
+/// * We own an irq handler whose cookie is a pointer to `Self::inner`.
 #[pin_data]
 pub struct Registration<T: Handler> {
     #[pin]
@@ -206,10 +215,13 @@ impl<T: Handler> Registration<T> {
             handler <- handler,
             inner <- Devres::new(
                 request.dev,
-                try_pin_init!(RegistrationInner {
-                    // INVARIANT: `this` is a valid pointer to the `Registration` instance
-                    cookie: this.as_ptr().cast::<c_void>(),
-                    irq: {
+                try_pin_init!(&inner_this in RegistrationInner {
+                    irq: request.irq,
+                    dev: request.dev.into(),
+                    // SAFETY: `this` is a valid pointer to the `Registration` instance.
+                    handler: unsafe { &raw const (*this.as_ptr()).handler }.cast(),
+                    _pin: PhantomPinned,
+                    _: {
                         // SAFETY:
                         // - The callbacks are valid for use with request_irq.
                         // - If this succeeds, the slot is guaranteed to be valid until the
@@ -224,11 +236,10 @@ impl<T: Handler> Registration<T> {
                                 Some(handle_irq_callback::<T>),
                                 flags.into_inner(),
                                 name.as_char_ptr(),
-                                this.as_ptr().cast::<c_void>(),
+                                inner_this.as_ptr().cast::<c_void>(),
                             )
                         })?;
-                        request.irq
-                    }
+                    },
                 })
             ),
             _pin: PhantomPinned,
@@ -261,13 +272,15 @@ impl<T: Handler> Registration<T> {
 ///
 /// This function should be only used as the callback in `request_irq`.
 unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, ptr: *mut c_void) -> c_uint {
-    // SAFETY: `ptr` is a pointer to `Registration<T>` set in `Registration::new`
-    let registration = unsafe { &*(ptr as *const Registration<T>) };
+    // SAFETY: `ptr` is a pointer to `RegistrationInner` set in `Registration::new`
+    let inner = unsafe { &*(ptr as *const RegistrationInner) };
+    // SAFETY: `inner.handler` is a pointer to `T` set in `Registration::new`
+    let handler = unsafe { &*inner.handler.cast::<T>() };
     // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq
     // callback is running implies that the device has not yet been unbound.
-    let device = unsafe { registration.inner.device().as_bound() };
+    let device = unsafe { inner.dev.as_bound() };
 
-    T::handle(&registration.handler, device) as c_uint
+    T::handle(handler, device) as c_uint
 }
 
 /// The value that can be returned from [`ThreadedHandler::handle`].
@@ -396,7 +409,7 @@ impl<T: ?Sized + ThreadedHandler, A: All
 ///
 /// # Invariants
 ///
-/// * We own an irq handler whose cookie is a pointer to `Self`.
+/// * We own an irq handler whose cookie is a pointer to `Self::inner`.
 #[pin_data]
 pub struct ThreadedRegistration<T: ThreadedHandler> {
     #[pin]
@@ -423,10 +436,13 @@ impl<T: ThreadedHandler> ThreadedRegistr
             handler <- handler,
             inner <- Devres::new(
                 request.dev,
-                try_pin_init!(RegistrationInner {
-                    // INVARIANT: `this` is a valid pointer to the `ThreadedRegistration` instance.
-                    cookie: this.as_ptr().cast::<c_void>(),
-                    irq: {
+                try_pin_init!(&inner_this in RegistrationInner {
+                    irq: request.irq,
+                    dev: request.dev.into(),
+                    // SAFETY: `this` is a valid pointer to the `ThreadedRegistration` instance.
+                    handler: unsafe { &raw const (*this.as_ptr()).handler }.cast(),
+                    _pin: PhantomPinned,
+                    _: {
                         // SAFETY:
                         // - The callbacks are valid for use with request_threaded_irq.
                         // - If this succeeds, the slot is guaranteed to be valid until the
@@ -442,11 +458,10 @@ impl<T: ThreadedHandler> ThreadedRegistr
                                 Some(thread_fn_callback::<T>),
                                 flags.into_inner(),
                                 name.as_char_ptr(),
-                                this.as_ptr().cast::<c_void>(),
+                                inner_this.as_ptr().cast::<c_void>(),
                             )
                         })?;
-                        request.irq
-                    }
+                    },
                 })
             ),
             _pin: PhantomPinned,
@@ -482,24 +497,28 @@ unsafe extern "C" fn handle_threaded_irq
     _irq: i32,
     ptr: *mut c_void,
 ) -> c_uint {
-    // SAFETY: `ptr` is a pointer to `ThreadedRegistration<T>` set in `ThreadedRegistration::new`
-    let registration = unsafe { &*(ptr as *const ThreadedRegistration<T>) };
+    // SAFETY: `ptr` is a pointer to `RegistrationInner` set in `ThreadedRegistration::new`
+    let inner = unsafe { &*(ptr as *const RegistrationInner) };
+    // SAFETY: `inner.handler` is a pointer to `T` set in `ThreadedRegistration::new`
+    let handler = unsafe { &*inner.handler.cast::<T>() };
     // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq
     // callback is running implies that the device has not yet been unbound.
-    let device = unsafe { registration.inner.device().as_bound() };
+    let device = unsafe { inner.dev.as_bound() };
 
-    T::handle(&registration.handler, device) as c_uint
+    T::handle(handler, device) as c_uint
 }
 
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
 unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(_irq: i32, ptr: *mut c_void) -> c_uint {
-    // SAFETY: `ptr` is a pointer to `ThreadedRegistration<T>` set in `ThreadedRegistration::new`
-    let registration = unsafe { &*(ptr as *const ThreadedRegistration<T>) };
+    // SAFETY: `ptr` is a pointer to `RegistrationInner` set in `ThreadedRegistration::new`
+    let inner = unsafe { &*(ptr as *const RegistrationInner) };
+    // SAFETY: `inner.handler` is a pointer to `T` set in `ThreadedRegistration::new`
+    let handler = unsafe { &*inner.handler.cast::<T>() };
     // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq
     // callback is running implies that the device has not yet been unbound.
-    let device = unsafe { registration.inner.device().as_bound() };
+    let device = unsafe { inner.dev.as_bound() };
 
-    T::handle_threaded(&registration.handler, device) as c_uint
+    T::handle_threaded(handler, device) as c_uint
 }


Patches currently in stable-queue which might be from aliceryhl@google.com are

queue-7.2/rust_binder-cancel-deferred-work-items-in-thread-exit.patch
queue-7.2/rust-irq-pass-registrationinner-as-cookie-to-request_irq.patch
queue-7.2/rust_binder-reschedule-node-refcount-update-on-thread-exit.patch
queue-7.2/binder-fix-leaked-fd-fixups-on-tf_update_txn-supersede.patch
