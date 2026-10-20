Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500776;
	b=qvb8yLFeWcfTIZkoMoIuz9bwh8GuD/epHIWC1JIZFDxmSQbl4na3RIU477Q+s0kBzLRi
	 3hb7JyDBPtZmj75SnoGfgOKXCO/gg41U7KhjrihV/vr/hWrG9S6XXKb0g8tmu7BqHwz9t
	 V2sBvEz/yz7/AmPc2+HVhIvF26G8ACy8CVYVS5Fk0XcIqnNpwek6PKO3ZR47Qw6i3f3po
	 kypL2YVkQNNHDhSWL2yCrpvfpq7MsdWETPmWTF5J1Iv22BUcj45TLRmeO6NdBXaiKkd67
	 edRI0qTY5kO1q8A53QbemZXE4TaIHOncFmWxBDByxoRsHaZVsJ6N5hRl0N3jAVUquEg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500776;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=wxmEz/CK+OAfk+vdzvHdXAndOrVUAuRsR691a5B0+lA=;
	b=AT0R+eDEaLy/s++jeQytvRaodGH7sjhr8a1yMCNKIjp26v6UPESi/mROUwy5FZqdw4vM
	 lvGsQbL4g4xGmTi6tlVm8Nyqp3IQMVJsFiyyJUqzA0ltWsdQ2IynGIwsPcSc2t9Dc6XCM
	 eFqx9EyPsvkVvaiDrr66PlfpMQLBsFvtkB6D1cOGAraDVmlXQhJSb5Fda8HnpIOltheSK
	 wRD4rZbI56iaSucSVoV5i4sVWqULxLSHXSFZp1/IqtfVbnvhiZqZurNx1qVjL0cjKiXWD
	 C8bTrVFiDd69Y2sHWGeAcww3O+kE8FnGY0fcNue3YrsAUnW4r6D+uRzeLJW4/dhce2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=oo9krx2I;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80669606A33D
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 12:52:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80669606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=oo9krx2I
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a16db51147so15366255e9.3
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 05:52:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792500774; x=1793105574; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wxmEz/CK+OAfk+vdzvHdXAndOrVUAuRsR691a5B0+lA=;
        b=oo9krx2IBN0IrvKigHkNmHfMh5g16Llg3xrcpaolx1Y0cMMC4C29Tz+ojhgziurDIb
         SS20Mg86JAu+GW4Mjeib+0rTRuf9rUDwbgNficJqQZKLeB2BLAC+dZ4z+jXlxOMOzak9
         mwMWg6pX1B1Mqc7tBpABm3BSL4ht8aQYv+XE9fBTB6nrDofMHbzvPZtAh/yoNhZh63Bz
         uWnw1zdYxTo6LZQj5fjifP1n2UfDCxWBjoWqrkF54PJYT8dSxPyHb+FXvq47k59j+iGg
         3FvtO4TiFpuhlX819h1SxloLqua/HQR4XEW/Wma1rU4HI9q5UajJU2iy1jkk1COkSTmj
         0OJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500774; x=1793105574;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wxmEz/CK+OAfk+vdzvHdXAndOrVUAuRsR691a5B0+lA=;
        b=Ptvmp9sOAXvjGDKHd4aQsIof8+MT2GODJqio52mtqT5jzJuGjpn/bdBorXC+6nv4gV
         6MLV5jQiYdak0D89C95CiCiE1dVOdLWheNV04Qpf14RcTPde9ZTtLqbtQmTD7Rmbmv2a
         Pu2/S0ZbSKXg8vyiFyH2p3yYiDkX6M11+OV+WTdzA5OohpWw+JAoJ6sDuqGvl2bLVJvP
         Ay5RncsvdEg09AonWi7CGL8XFP3zQj9Z/CSaDTGVA4qowaiyS6+RlIa8v1qDmXzwiNae
         Bq3bcAyCpQsE5hcWN6/y1A21V5465wFdEvYlm/EGjqJfaARBuMDxeefFfJSw0qKnnyYw
         l3gw==
X-Forwarded-Encrypted: i=1; AKwUvBw9dBbj/SqmIHBtyPtr1BmxgDk4NPE7QFvgftK/VmtpEfleHHxvWxkV3L2RQNAm8rj1JonKTzn1N1zEwA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJAHcgHLamaEydSuerE0BalZPw3wP7tLN9jXMtCTL3XsJZOQm7S
	rh5qLfGXFh1QCOTNpzfmfN5YnY43JKv0yDA4f8eP5JxLySVhrSFCNpyRgR+8OVCSVzhjCOdpUYr
	itZO2erZSmvYyfnS5uQ==
X-Received: from wroy18.prod.google.com ([2002:adf:f152:0:b0:48c:7ee7:2c6f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1da1:b0:4a1:ac66:6059 with SMTP id 5b1f17b1804b1-4a1d7614eefmr242597465e9.26.1792500773711;
 Tue, 20 Oct 2026 05:52:53 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:52:39 +0000
In-Reply-To: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=17149; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=oDrOybZ5GyeEV00KNLPrW81TDHW0BndIwgF6Sr82ykQ=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq12QeC6MGSF3kc+DxsiClC22vl0ytW1kgupgfH
 GWWGH6tSH2JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatdkHgAKCRAEWL7uWMY5
 Rq/xEACr5kuaCof+Q662nrAz6sm05Pj9zjPnF/uZOE5JL07RWzJsbcGsOFljs6QigNYEgUTIOkW
 SPsy3cONR/ZI8UQooEo0v040fho/oW67yHSO8IoFr0SCrp74sDe1Z1U2h3UQaO5ikKzget1Tcgf
 CQRqCjKJFHopsjlgSW+8CjCgczEzWKWezmxaxpMYf9iibdwbc8uV4+hWoUI9p/Tbnuhx3pODKi4
 7rabh6kT/P8EXHL1jVzWwjhqMlvPYRjXK7nw2+MGvrNKvueDNMOZRz0eZsPn7jQL+ZfjhBbmyST
 hVgPuAQ270MpIUkamAtQmAPo+KwDwfM6eibBhRo4YGIrt8nB5gTfLv2BhGY1GBtjTLpNDwwTm7N
 t7Xi6U4GMKTscyE6d3IBLEcXVcZBa12s5s8LxyGzk7FQn8OUmUV3/24fCGPedIjVOZ89SkWJ4td
 f8x83ZnAny3+itsp/t0s/dgyUXKRM0jwqOMtFQPf+EQ6sGrBjh4LAbo60VoxjlH3SNfv5PkP3rV
 KzZdipVqBlrRuvJPt5qXSvFu4DbbvO6GZ32s2Y5ddyeG2kj1FDLNpIewpXxioH0eOypU2Dzt5bs
 0GLNYSgD2qzexvafVV4USYk4QCR6unD9cKcryvDIlZyjpNbBQ+86sWpPDXDsQyqIFlD2xi6GmJP gBTgndqKY828LnQ==
X-Mailer: b4 0.14.3
Message-ID: <20261020-rust-workqueue-v3-4-ea7c74d02068@google.com>
Subject: [PATCH v3 4/4] rust: workqueue: add ScopedWork for non-'static work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Danilo Krummrich <dakr@kernel.org>

Add ScopedWork<T>, a work item wrapper whose destructor calls
cancel_work_sync(), allowing T to carry non-'static lifetimes. Ownership
of the data is not transferred to the workqueue; instead, the
synchronous cancellation on drop guarantees the work function is not
running when the data is freed.

Because that guarantee only holds if the destructor actually runs,
ScopedWork::new() (and thus new_scoped_work!) is unsafe and requires
that the resulting value is never forgotten. In return,
Queue::enqueue_scoped() is a safe method that accepts a &ScopedWork<T>
on any queue, including the system queues.

ScopedWork does not use the Work/WorkItem machinery: it embeds the
work_struct directly and registers its own C callback, which recovers
the &ScopedWork<T> via container_of!() and passes it to
ScopedWorkItem::run(). The work_struct and the user data live in a
private Inner<T> that is wrapped in Opaque as a whole, so that the &mut
Self held by the destructor while cancel_work_sync() waits does not
claim uniqueness over memory (including padding) that a worker thread
may still be reading through &ScopedWork<T>.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/workqueue/mod.rs    |  48 +++++-
 rust/kernel/workqueue/scoped.rs | 342 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 389 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index 78e6a7bb960a..73fa0bea4220 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -212,6 +212,13 @@
 mod builder;
 pub use self::builder::Builder;
 
+mod scoped;
+pub use self::scoped::{
+    new_scoped_work,
+    ScopedWork,
+    ScopedWorkItem, //
+};
+
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
 macro_rules! new_work {
@@ -283,11 +290,50 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::workqueue_struct) -> &'a Queue
     pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
     where
         W: RawWorkItem<ID> + Send + 'static,
+    {
+        // SAFETY: `W: 'static`, so everything borrowed by `W` remains valid forever.
+        unsafe { self.enqueue_raw(w) }
+    }
+
+    /// Enqueues a [`ScopedWork`] item.
+    ///
+    /// Unlike [`Queue::enqueue`], this does not require the work item to be `'static`. This is
+    /// sound because a [`ScopedWork`] cancels itself synchronously when it is dropped, and
+    /// [`ScopedWork::new`] requires that this destructor runs before any lifetime in `T` expires.
+    ///
+    /// This may fail if the work item is already enqueued in a workqueue.
+    ///
+    /// The work item will be submitted using `WORK_CPU_UNBOUND`.
+    #[inline]
+    pub fn enqueue_scoped<T>(&self, w: &ScopedWork<T>) -> bool
+    where
+        T: ScopedWorkItem + Sync,
+    {
+        // SAFETY: The `ScopedWork` destructor calls `cancel_work_sync()`, and `ScopedWork::new`
+        // guarantees that this destructor runs before any lifetime in `T` expires. Hence everything
+        // borrowed by `T` remains valid until the work item has run to completion or has been
+        // cancelled.
+        unsafe { self.enqueue_raw(w) }
+    }
+
+    /// Enqueues a work item without requiring it to be `'static`.
+    ///
+    /// # Safety
+    ///
+    /// Everything borrowed by `W` must remain valid until the work item has run to completion or
+    /// has been cancelled.
+    #[inline]
+    unsafe fn enqueue_raw<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
+    where
+        W: RawWorkItem<ID> + Send,
     {
         let queue_ptr = self.0.get();
 
         // SAFETY: We only return `false` if the `work_struct` is already in a workqueue. The other
-        // `__enqueue` requirements are not relevant since `W` is `Send` and static.
+        // `__enqueue` requirements are not relevant since `W` is `Send` and the caller guarantees
+        // that everything borrowed by `W` remains valid until the work item has run to completion
+        // or has been cancelled, so the function pointer is never called after a lifetime in `W`
+        // expires.
         //
         // The call to `bindings::queue_work_on` will dereference the provided raw pointer, which
         // is ok because `__enqueue` guarantees that the pointer is valid for the duration of this
diff --git a/rust/kernel/workqueue/scoped.rs b/rust/kernel/workqueue/scoped.rs
new file mode 100644
index 000000000000..e490ac752423
--- /dev/null
+++ b/rust/kernel/workqueue/scoped.rs
@@ -0,0 +1,342 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Scoped work items.
+//!
+//! Provides [`ScopedWork`] for work items that may borrow data with some non-`'static` lifetime.
+//!
+//! Unlike [`Work`]-based items, ownership of a [`ScopedWork`] is not transferred to
+//! the workqueue. Instead, its destructor calls `cancel_work_sync()`, which guarantees that the
+//! work function is not running (and will not run) once the destructor returns. This is what
+//! allows the inner data to carry non-`'static` lifetimes.
+//!
+//! Creating a [`ScopedWork`] is `unsafe`, because the above guarantee only holds if the destructor
+//! actually runs: the value must not be forgotten. Once created, a [`ScopedWork`] can be enqueued
+//! on any queue using the safe [`Queue::enqueue_scoped`].
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::workqueue::{
+//!     new_scoped_work,
+//!     Queue,
+//!     ScopedWork,
+//!     ScopedWorkItem,
+//! };
+//!
+//! struct MyWork {
+//!     value: u32,
+//! }
+//!
+//! impl ScopedWorkItem for MyWork {
+//!     fn run(work: &ScopedWork<Self>) {
+//!         pr_info!("value = {}\n", work.value);
+//!     }
+//! }
+//!
+//! let work = KBox::pin_init(
+//!     // SAFETY: `work` is not forgotten.
+//!     unsafe { new_scoped_work!("MyWork", MyWork { value: 42 }) },
+//!     GFP_KERNEL,
+//! )?;
+//!
+//! let queue = Queue::new_unbound().build(c"my-wq")?;
+//! queue.enqueue_scoped(&work);
+//!
+//! // Dropping `queue` first drains it, so the work item is guaranteed to have run by the time
+//! // `work` is dropped.
+//! drop(queue);
+//! # Ok::<(), Error>(())
+//! ```
+
+use crate::{
+    bindings,
+    container_of,
+    prelude::*,
+    sync::LockClassKey,
+    types::Opaque,
+    workqueue::RawWorkItem, //
+};
+
+#[cfg(doc)]
+use super::{
+    Queue,
+    Work, //
+};
+
+use pin_init::Wrapper;
+
+use core::ops::Deref;
+
+/// Trait for types that can be used as scoped work items.
+///
+/// Implementers define the work function that executes when the item is dequeued by a workqueue
+/// thread. The callback receives a reference to the containing [`ScopedWork`], which provides
+/// access to the inner data via [`Deref`] and can be passed to [`Queue::enqueue_scoped`] to
+/// re-enqueue the work item from within the work function.
+pub trait ScopedWorkItem: Sized {
+    /// Called when the work item is executed.
+    fn run(work: &ScopedWork<Self>);
+}
+
+/// The payload of a [`ScopedWork`].
+///
+/// # Invariants
+///
+/// `work` is an initialized `work_struct` whose work function is [`ScopedWork::<T>::run`]. An
+/// `Inner<T>` only ever exists inside a [`ScopedWork<T>`].
+#[pin_data]
+struct Inner<T: ScopedWorkItem> {
+    #[pin]
+    work: Opaque<bindings::work_struct>,
+    #[pin]
+    data: T,
+}
+
+/// A scoped work item that cancels synchronously on drop.
+///
+/// `ScopedWork<T>` contains a `work_struct` and the user data `T`. Its destructor calls
+/// `cancel_work_sync()`, guaranteeing the work function is not running when the data is dropped.
+///
+/// This allows `T` to carry non-`'static` lifetimes.
+///
+/// Construct via [`new_scoped_work!`], which returns an `impl PinInit` suitable for embedding
+/// in-place inside other pinned structs. Because the soundness of [`Queue::enqueue_scoped`]
+/// relies on the destructor running, [`ScopedWork::new`] is `unsafe` and requires that the
+/// resulting value is never forgotten.
+///
+/// # Examples
+///
+/// Self-re-enqueueing from within the work function:
+///
+/// ```
+/// # use kernel::sync::atomic::{Atomic, Relaxed};
+/// # use kernel::time::{Delta, delay::fsleep};
+/// use kernel::workqueue::{
+///     self,
+///     new_scoped_work,
+///     Queue,
+///     ScopedWork,
+///     ScopedWorkItem,
+/// };
+///
+/// struct RequeueWork<'a> {
+///     counter: Atomic<u32>,
+///     queue: &'a Queue,
+/// }
+///
+/// impl ScopedWorkItem for RequeueWork<'_> {
+///     fn run(work: &ScopedWork<Self>) {
+///         if work.counter.fetch_add(1u32, Relaxed) < 2 {
+///             work.queue.enqueue_scoped(work);
+///         }
+///     }
+/// }
+///
+/// let queue = Queue::new_ordered().build(c"requeue_wq")?;
+///
+/// let work = KBox::pin_init(
+///     // SAFETY: `work` is not forgotten.
+///     unsafe {
+///         new_scoped_work!(
+///             "RequeueWork",
+///             RequeueWork {
+///                 counter: Atomic::new(0u32),
+///                 queue: &queue,
+///             }
+///         )
+///     },
+///     GFP_KERNEL,
+/// )?;
+///
+/// queue.enqueue_scoped(&work);
+/// # fsleep(Delta::from_millis(300));
+///
+/// assert_eq!(work.counter.load(Relaxed), 3);
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data(PinnedDrop)]
+#[repr(transparent)]
+pub struct ScopedWork<T: ScopedWorkItem> {
+    /// The whole payload is wrapped in [`Opaque`] on purpose: while the destructor waits in
+    /// `cancel_work_sync()`, a worker thread may still be executing [`ScopedWorkItem::run`] with a
+    /// shared reference to this value, concurrently with the `&mut Self` held by `drop`. [`Opaque`]
+    /// opts out of the uniqueness guarantee of that `&mut`. Wrapping individual fields would not be
+    /// enough, since the `&mut Self` would still claim exclusive access to the padding bytes.
+    ///
+    /// # Invariants
+    ///
+    /// `inner` is always initialized.
+    #[pin]
+    inner: Opaque<Inner<T>>,
+}
+
+// SAFETY: A `&ScopedWork<T>` only hands out `&T` (via `Deref`) and a pointer to the `work_struct`,
+// which is only ever accessed through the C workqueue API. Hence sharing it is safe when `T: Sync`.
+unsafe impl<T: ScopedWorkItem + Sync> Sync for ScopedWork<T> {}
+
+// SAFETY: The `work_struct` is only ever accessed through the C workqueue API, which is safe to
+// use from any thread. Sending the contained `T` requires `T: Send`.
+unsafe impl<T: ScopedWorkItem + Send> Send for ScopedWork<T> {}
+
+impl<T: ScopedWorkItem> Deref for ScopedWork<T> {
+    type Target = T;
+
+    #[inline]
+    fn deref(&self) -> &T {
+        // SAFETY: `inner` is always initialized (type invariant), and `data` is only ever accessed
+        // through shared references.
+        unsafe { &(*self.inner.get()).data }
+    }
+}
+
+impl<T: ScopedWorkItem> ScopedWork<T> {
+    /// Creates a pin-initializer for a new scoped work item.
+    ///
+    /// Use [`new_scoped_work!`] to automatically provide the lock class key.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the destructor of the initialized `ScopedWork<T>` runs before
+    /// the memory it lives in is reused or any lifetime in `T` expires. In particular, the value
+    /// must not be leaked, e.g. via [`core::mem::forget`] or by leaking the allocation that
+    /// contains it.
+    #[inline]
+    pub unsafe fn new<E>(
+        name: &'static CStr,
+        key: Pin<&'static LockClassKey>,
+        init: impl PinInit<T, E>,
+    ) -> impl PinInit<Self, E> {
+        try_pin_init!(Self {
+            inner <- Opaque::pin_init(try_pin_init!(Inner::<T> {
+                work <- Opaque::try_ffi_init(|slot| {
+                    // SAFETY: `slot` is a valid pointer to uninitialized memory for a
+                    // `work_struct`, and `Self::run` is a valid work function for a `work_struct`
+                    // embedded in an `Inner<T>` that is embedded in a `ScopedWork<T>`.
+                    unsafe {
+                        bindings::init_work_with_key(
+                            slot,
+                            Some(Self::run),
+                            false,
+                            name.as_char_ptr(),
+                            key.as_ptr(),
+                        )
+                    };
+                    Ok::<(), E>(())
+                }),
+                data <- init,
+            }? E)),
+        }? E)
+    }
+
+    /// Returns a raw pointer to the `work_struct`.
+    #[inline]
+    fn raw_work(&self) -> *mut bindings::work_struct {
+        // SAFETY: `inner` is always initialized (type invariant).
+        unsafe { Opaque::cast_into(&raw const (*self.inner.get()).work) }
+    }
+
+    /// The work function registered with the C workqueue.
+    ///
+    /// # Safety
+    ///
+    /// `ptr` must point to the `work` field of the `Inner<T>` of a live `ScopedWork<T>`.
+    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+        // SAFETY: `Opaque<T>` is `#[repr(transparent)]`, and by the safety requirements `ptr`
+        // points to the `work` field of an `Inner<T>`.
+        let inner =
+            unsafe { container_of!(ptr.cast::<Opaque<bindings::work_struct>>(), Inner<T>, work) };
+
+        // SAFETY: `Inner<T>` only ever exists inside a `ScopedWork<T>` (type invariant), and both
+        // `Opaque` and `ScopedWork` are `#[repr(transparent)]`, so `inner` is also a valid pointer
+        // to the containing `ScopedWork<T>`. By the safety requirements it is live; its destructor
+        // calls `cancel_work_sync()` before the memory is released, so it stays live for the
+        // duration of this call.
+        T::run(unsafe { &*inner.cast::<Self>() });
+    }
+}
+
+// SAFETY: `&ScopedWork<T>` points to a `work_struct` whose work function is
+// `ScopedWork::<T>::run` (type invariant), so passing it to `queue_work_on` is sound. The pointer
+// stays valid until the work function has run or the item is cancelled, because the `ScopedWork`
+// destructor calls `cancel_work_sync()` and `ScopedWork::new` requires that destructor to run.
+unsafe impl<'a, T: ScopedWorkItem + Sync> RawWorkItem<0> for &'a ScopedWork<T> {
+    type EnqueueOutput = bool;
+
+    unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
+    where
+        F: FnOnce(*mut bindings::work_struct) -> bool,
+    {
+        queue_work_on(self.raw_work())
+    }
+}
+
+#[pinned_drop]
+impl<T: ScopedWorkItem> PinnedDrop for ScopedWork<T> {
+    #[inline]
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: `raw_work()` returns a valid `work_struct`. After `cancel_work_sync()` returns,
+        // the work function is guaranteed to not be running.
+        unsafe { bindings::cancel_work_sync(self.raw_work()) };
+
+        // SAFETY: `inner` is initialized (type invariant), no longer accessed by the work
+        // function, and never accessed again after this point. `Opaque` does not drop its
+        // contents, so we have to do it here.
+        unsafe { core::ptr::drop_in_place(self.inner.get()) };
+    }
+}
+
+/// Creates a [`ScopedWork`] pin-initializer with a new lock class.
+///
+/// This macro expands to a call to [`ScopedWork::new`], which is `unsafe`, so the invocation must
+/// be wrapped in an `unsafe` block.
+///
+/// # Safety
+///
+/// The caller must uphold the safety requirements of [`ScopedWork::new`]: the destructor of the
+/// initialized `ScopedWork` must run before the memory it lives in is reused or any lifetime in
+/// the inner type expires.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::workqueue::{
+///     new_scoped_work,
+///     ScopedWork,
+///     ScopedWorkItem,
+/// };
+///
+/// struct MyWork {
+///     value: u32,
+/// }
+///
+/// impl ScopedWorkItem for MyWork {
+///     fn run(work: &ScopedWork<Self>) {
+///         pr_info!("value = {}\n", work.value);
+///     }
+/// }
+///
+/// #[pin_data]
+/// struct MyData {
+///     #[pin]
+///     work: ScopedWork<MyWork>,
+/// }
+///
+/// fn init_data() -> impl PinInit<MyData> {
+///     pin_init!(MyData {
+///         // SAFETY: `MyData` is only ever pin-initialized, so its `work` field is dropped
+///         // whenever `MyData` is.
+///         work <- unsafe { new_scoped_work!("MyWork", MyWork { value: 7 }) },
+///     })
+/// }
+/// ```
+#[macro_export]
+macro_rules! new_scoped_work {
+    ($name:literal, $init:expr) => {
+        $crate::workqueue::ScopedWork::new(
+            $crate::c_str!($name),
+            $crate::static_lock_class!(),
+            $init,
+        )
+    };
+}
+pub use new_scoped_work;

-- 
2.56.0.212.g129ede20d9-goog

