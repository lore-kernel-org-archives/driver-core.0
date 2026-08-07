Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492F2392C34;
	Fri,  7 Aug 2026 16:53:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121613; cv=none; b=KN0wAUTTNiLV7OzthqySQsc0GxVkLyVuQ/pUzaEufxyyBV5xvAJ/MOE2xIRph6hritoySliDpBGe3Z7iJhFwtdXWqKUExr6V6YHyI0yXrLhtG/ktreirKkGmbUddpChTFyHqnYUufP2TQ6ZXzDYnOqbg6dNLxxARYyxAo87w3Jk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121613; c=relaxed/simple;
	bh=sPV84w4SX+U/1LZWuC3bVnh4+DTDuSfP+duYQoCrcQw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tfeWldZG+S1MPXCnTuiF4tRdJKwgo0XGT2TamhjAu4q/QcdQYkpZFg8Db/Qa153mlGJKTmM6umM5f22UUP+XXjyMqEoOy14BLGzsd7weJLFO1+aFuLla7GeTtSR6jr9pD/rjB5PWFdewOVzRjU/88z5HH8SaGBrD83lO1YnR91c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ERpZdC21; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ERpZdC21"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9682E1F000E9;
	Fri,  7 Aug 2026 16:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786121610;
	bh=XLbEWJSeXDkTQHNGYVl4uqwESecA9mbAlTlzm692Aik=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ERpZdC21r1/NhV+iFxVokt8aeqMZE/f91/eU+39aFi5LrJwi7AdYPNOBbV5XhL0GK
	 UUx9Rsp5JMru7fTEQUD5y4rYJFcxiKMpcVxpH7sPXGKwh+1lLC9Y+5MSQ4KxcMz+gW
	 WSqg3GRXSA+XZk8/AEvK6Hdy2z46Hj/Um6LlswpkVSU1CjfUkqCs2a7ndIXp7olkLV
	 DDd+WUWY9a85jZc6OOLYeaCbPLizxbrnYLFdPp8zZiVRhETodz0V8BW5le9CGM8CLT
	 ihyHuWToj6VjEbwbpJAA2Rj9ZHRzsiJcVnzM9bB3xCmo4+YvzDYhExj2x2GuFQgqfM
	 /EeqznHTn9TaQ==
From: Danilo Krummrich <dakr@kernel.org>
To: tj@kernel.org,
	jiangshanlai@gmail.com,
	aliceryhl@google.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	daniel.almeida@collabora.com,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	jhubbard@nvidia.com
Cc: rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 6/6] rust: workqueue: add ScopedWork for non-'static work items
Date: Fri,  7 Aug 2026 18:52:49 +0200
Message-ID: <20260807165252.3849875-7-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807165252.3849875-1-dakr@kernel.org>
References: <20260807165252.3849875-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add ScopedWork<T>, a work item wrapper whose destructor calls
cancel_work_sync(), allowing T to carry non-'static lifetimes. Ownership
of the data is not transferred to the workqueue; instead, the
synchronous cancellation on drop guarantees the work function is not
running when the data is freed.

ScopedWork uses the existing Work/HasWork/WorkItem infrastructure with
NonNull<ScopedWorkRef<T>> as WorkItem::Pointer for the callback path,
and implements RawWorkItem for &ScopedWork<T> and &ScopedWorkRef<T> for
the enqueue path (requiring T: Sync for cross-thread shared access
safety).

Two enqueue paths are provided:
  - Queue::enqueue_scoped() (unsafe): the caller must ensure the work
    item is not forgotten.
  - ScopedQueue::enqueue() (safe): when the work item's lifetime
    satisfies the queue's 'scope bound.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/workqueue/mod.rs    |  46 +++-
 rust/kernel/workqueue/scoped.rs | 442 +++++++++++++++++++++++++++++---
 2 files changed, 444 insertions(+), 44 deletions(-)

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index 551fa1401b85..be5bfb4cfc30 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -213,7 +213,13 @@
 pub use self::builder::Builder;
 
 mod scoped;
-pub use self::scoped::ScopedQueue;
+pub use self::scoped::{
+    new_scoped_work,
+    ScopedQueue,
+    ScopedWork,
+    ScopedWorkItem,
+    ScopedWorkRef, //
+};
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
@@ -283,23 +289,39 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::workqueue_struct) -> &'a Queue
     /// This may fail if the work item is already enqueued in a workqueue.
     ///
     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
+    #[inline]
     pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
     where
         W: RawWorkItem<ID> + Send + 'static,
+    {
+        // SAFETY: `W: 'static` guarantees the work item remains valid indefinitely,
+        // so the `enqueue_scoped` requirement that the work item stays valid until
+        // the work function runs (or is cancelled) is trivially satisfied.
+        unsafe { self.enqueue_scoped(w) }
+    }
+
+    /// Enqueues a work item that may not be `'static`.
+    ///
+    /// Unlike [`Queue::enqueue`], this does not require the work item to be `'static`.
+    ///
+    /// The work item will be submitted using `WORK_CPU_UNBOUND`.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the work item's destructor runs before any
+    /// lifetime it captures expires (i.e., the work item must not be forgotten).
+    #[inline]
+    pub unsafe fn enqueue_scoped<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
+    where
+        W: RawWorkItem<ID> + Send,
     {
         let queue_ptr = self.0.get();
 
-        // SAFETY: We only return `false` if the `work_struct` is already in a workqueue. The other
-        // `__enqueue` requirements are not relevant since `W` is `Send` and static.
-        //
-        // The call to `bindings::queue_work_on` will dereference the provided raw pointer, which
-        // is ok because `__enqueue` guarantees that the pointer is valid for the duration of this
-        // closure.
-        //
-        // Furthermore, if the C workqueue code accesses the pointer after this call to
-        // `__enqueue`, then the work item was successfully enqueued, and `bindings::queue_work_on`
-        // will have returned true. In this case, `__enqueue` promises that the raw pointer will
-        // stay valid until we call the function pointer in the `work_struct`, so the access is ok.
+        // SAFETY: We only return `false` if the `work_struct` is already in a workqueue. The
+        // caller guarantees the work item remains valid until the work function runs or the item
+        // is cancelled, satisfying the `__enqueue` requirement that the pointer stays valid until
+        // the function pointer in the `work_struct` is called. `W: Send` satisfies the
+        // cross-thread safety requirement.
         unsafe {
             w.__enqueue(move |work_ptr| {
                 bindings::queue_work_on(
diff --git a/rust/kernel/workqueue/scoped.rs b/rust/kernel/workqueue/scoped.rs
index 18a4b6f6cf18..1adf96f7eccd 100644
--- a/rust/kernel/workqueue/scoped.rs
+++ b/rust/kernel/workqueue/scoped.rs
@@ -1,13 +1,95 @@
 // SPDX-License-Identifier: GPL-2.0
 
-//! Lifetime-scoped workqueues.
+//! Lifetime-scoped workqueues and work items.
 //!
-//! Provides [`ScopedQueue`] for work items that may borrow data with some
-//! non-`'static` lifetime.
+//! Provides [`ScopedQueue`] and [`ScopedWork`] for work items that may borrow
+//! data with some non-`'static` lifetime.
 //!
-//! Unlike [`Queue`] which only accepts `'static` work items, [`ScopedQueue`]
-//! owns its underlying queue and relies on that queue being dropped to drain
-//! pending and running work before borrowed data can go out of scope.
+//! [`ScopedQueue`] owns its underlying queue and relies on that queue being
+//! dropped to drain pending and running work before borrowed data can go out
+//! of scope.
+//!
+//! [`ScopedWork`] wraps a work item whose destructor calls `cancel_work_sync()`,
+//! so ownership of the data is not transferred to the workqueue. This allows the
+//! inner data to carry non-`'static` lifetimes.
+//!
+//! Drivers should prefer [`ScopedWork`] with either a [`ScopedQueue`] or a
+//! system queue over [`Work`]-based items. When used with a [`ScopedQueue`],
+//! the work item must already outlive the queue, making [`Work`]'s separate
+//! allocation and reference count unnecessary.
+//!
+//! # Examples
+//!
+//! Enqueue on the system workqueue (unsafe, caller must not forget the work):
+//!
+//! ```
+//! # use kernel::time::{Delta, delay::fsleep};
+//! use kernel::workqueue::{
+//!     self,
+//!     new_scoped_work,
+//!     ScopedWork,
+//!     ScopedWorkItem,
+//!     ScopedWorkRef,
+//! };
+//!
+//! struct MyWork {
+//!     value: u32,
+//! }
+//!
+//! impl ScopedWorkItem for MyWork {
+//!     fn run(work: &ScopedWorkRef<Self>) {
+//!         pr_info!("value = {}\n", work.value);
+//!     }
+//! }
+//!
+//! let work = KBox::pin_init(
+//!     new_scoped_work!("MyWork", MyWork { value: 42 }),
+//!     GFP_KERNEL,
+//! )?;
+//!
+//! // SAFETY: `work` is not forgotten.
+//! unsafe { workqueue::system_dfl().enqueue_scoped(&*work) };
+//! # fsleep(Delta::from_millis(100));
+//! # Ok::<(), Error>(())
+//! ```
+//!
+//! Enqueue on a [`ScopedQueue`] using the safe path (work outlives the queue):
+//!
+//! ```
+//! use kernel::workqueue::{
+//!     new_scoped_work,
+//!     ScopedQueue,
+//!     ScopedWork,
+//!     ScopedWorkItem,
+//!     ScopedWorkRef,
+//! };
+//!
+//! struct MyWork {
+//!     value: u32,
+//! }
+//!
+//! impl ScopedWorkItem for MyWork {
+//!     fn run(work: &ScopedWorkRef<Self>) {
+//!         pr_info!("value = {}\n", work.value);
+//!     }
+//! }
+//!
+//! let work = KBox::pin_init(
+//!     new_scoped_work!("MyWork", MyWork { value: 42 }),
+//!     GFP_KERNEL,
+//! )?;
+//!
+//! // SAFETY: The queue is not forgotten.
+//! let queue = unsafe { ScopedQueue::new(c"example_wq")? };
+//!
+//! // Safe since `work` outlives `queue`.
+//! queue.enqueue(&*work);
+//! # Ok::<(), Error>(())
+//! ```
+//!
+//! [`ScopedQueue`] can also be used with regular [`Work`]-based items. The
+//! following `compile_fail` examples demonstrate the lifetime enforcement that
+//! [`ScopedQueue`] provides in that case.
 //!
 //! TODO: Remove `ignore` once KUnit supports `compile_fail` on doc-tests.
 //! ```compile_fail,ignore
@@ -112,18 +194,30 @@
 //! ```
 
 use super::{
+    impl_has_work,
+    HasWork,
     OwnedQueue,
     Queue,
-    RawWorkItem, //
+    RawWorkItem,
+    Work,
+    WorkItem,
+    WorkItemPointer, //
 };
 
 use crate::{
     bindings,
-    ffi,
-    prelude::*, //
+    prelude::*,
+    sync::LockClassKey,
+    types::Opaque, //
 };
 
-use core::marker::PhantomData;
+use pin_init::Wrapper;
+
+use core::{
+    marker::PhantomData,
+    ops::Deref,
+    ptr::NonNull, //
+};
 
 /// An owned workqueue that can enqueue work items borrowing from `'scope`.
 ///
@@ -133,6 +227,15 @@ pub struct ScopedQueue<'scope> {
     _scope: PhantomData<&'scope mut &'scope ()>,
 }
 
+impl Deref for ScopedQueue<'_> {
+    type Target = Queue;
+
+    #[inline]
+    fn deref(&self) -> &Queue {
+        &self.inner
+    }
+}
+
 impl<'scope> ScopedQueue<'scope> {
     /// Creates an ordered scoped workqueue.
     ///
@@ -155,28 +258,11 @@ pub fn enqueue<W, const ID: u64>(&self, work: W) -> W::EnqueueOutput
     where
         W: RawWorkItem<ID> + Send + 'scope,
     {
-        let queue_ptr = self.inner.0.get();
-
-        // SAFETY:
-        // - Closure returns `false` only if `queue_work_on` returns `false`
-        //   and that means `work_ptr` is already in a workqueue.
-        //
-        // - `W: 'scope` and dropck keep borrowed data alive until this queue is
-        //   dropped. The constructor requires that the queue is not leaked and
-        //   dropping `inner` drains pending and running work so the function
-        //   pointer is not called after any lifetime in `W` expires.
-        //
-        // - The last requirement of `__enqueue` is not relevant here because `W`
-        //   is `Send`.
-        unsafe {
-            work.__enqueue(move |work_ptr| {
-                bindings::queue_work_on(
-                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_int,
-                    queue_ptr,
-                    work_ptr,
-                )
-            })
-        }
+        // SAFETY: `W: 'scope` and dropck keep borrowed data alive until this queue
+        // is dropped. The constructor requires that the queue is not leaked and
+        // dropping `inner` drains pending and running work, so the function pointer
+        // is not called after any lifetime in `W` expires.
+        unsafe { self.enqueue_scoped(work) }
     }
 }
 
@@ -188,3 +274,295 @@ fn drop(&mut self) {
         let _ = &self._scope;
     }
 }
+
+/// Trait for types that can be used as scoped work items.
+///
+/// Implementers define the work function that executes when the item is dequeued by a workqueue
+/// thread. The callback receives a reference to the containing [`ScopedWorkRef`], which provides
+/// access to the inner data via [`Deref`] and can be used to re-enqueue the work item.
+pub trait ScopedWorkItem: Sized {
+    /// Called when the work item is executed.
+    fn run(work: &ScopedWorkRef<Self>);
+}
+
+/// The work function's view of a [`ScopedWork`] item.
+///
+/// The work function callback receives `&ScopedWorkRef<T>`, which [`Deref`]s to `&T` and can be
+/// passed to queue enqueue methods for re-enqueueing from within the work function.
+#[pin_data]
+pub struct ScopedWorkRef<T: ScopedWorkItem> {
+    #[pin]
+    work: Work<Self>,
+    #[pin]
+    data: T,
+}
+
+impl_has_work! {
+    impl{T: ScopedWorkItem} HasWork<ScopedWorkRef<T>> for ScopedWorkRef<T> { self.work }
+}
+
+impl<T: ScopedWorkItem> Deref for ScopedWorkRef<T> {
+    type Target = T;
+
+    #[inline]
+    fn deref(&self) -> &T {
+        &self.data
+    }
+}
+
+impl<T: ScopedWorkItem> WorkItem for ScopedWorkRef<T> {
+    type Pointer = NonNull<Self>;
+
+    #[inline]
+    fn run(this: NonNull<Self>) {
+        // SAFETY: `this` points to a valid, pinned `ScopedWorkRef`. `cancel_work_sync()` in
+        // `ScopedWork`'s `PinnedDrop` prevents use-after-drop.
+        let work = unsafe { &*this.as_ptr() };
+
+        T::run(work);
+    }
+}
+
+// SAFETY: The `run` callback uses the `work_struct` pointer to recover a pointer to
+// `ScopedWorkRef<T>` via `HasWork`, wraps it in `NonNull`, and calls `WorkItem::run`.
+unsafe impl<T: ScopedWorkItem, const ID: u64> WorkItemPointer<ID> for NonNull<ScopedWorkRef<T>>
+where
+    ScopedWorkRef<T>: WorkItem<ID, Pointer = Self>,
+    ScopedWorkRef<T>: HasWork<ScopedWorkRef<T>, ID>,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+        let ptr = ptr.cast::<Work<ScopedWorkRef<T>, ID>>();
+
+        // SAFETY: The `work_struct` is embedded in `ScopedWorkRef<T>` via `HasWork`.
+        let ptr =
+            unsafe { <ScopedWorkRef<T> as HasWork<ScopedWorkRef<T>, ID>>::work_container_of(ptr) };
+
+        // SAFETY: `work_container_of` returns a valid, non-null pointer.
+        let nn = unsafe { NonNull::new_unchecked(ptr) };
+
+        <ScopedWorkRef<T> as WorkItem<ID>>::run(nn);
+    }
+}
+
+// Required because `WorkItemPointer<ID>: RawWorkItem<ID>` is a supertrait bound. This `__enqueue`
+// is never called; the enqueue path goes through the `RawWorkItem` impl for `&ScopedWork<T>` or
+// `&ScopedWorkRef<T>` instead.
+//
+// SAFETY: `__enqueue` is unreachable.
+unsafe impl<T: ScopedWorkItem, const ID: u64> RawWorkItem<ID> for NonNull<ScopedWorkRef<T>>
+where
+    ScopedWorkRef<T>: HasWork<ScopedWorkRef<T>, ID>,
+{
+    type EnqueueOutput = bool;
+
+    unsafe fn __enqueue<F>(self, _queue_work_on: F) -> Self::EnqueueOutput
+    where
+        F: FnOnce(*mut bindings::work_struct) -> bool,
+    {
+        unreachable!()
+    }
+}
+
+// SAFETY: `&ScopedWorkRef<T>` points to a valid `ScopedWorkRef` with a valid `work_struct`.
+// The pointer remains valid until `cancel_work_sync()` completes in `ScopedWork`'s drop.
+unsafe impl<'a, T: ScopedWorkItem + Sync, const ID: u64> RawWorkItem<ID> for &'a ScopedWorkRef<T>
+where
+    ScopedWorkRef<T>: HasWork<ScopedWorkRef<T>, ID>,
+{
+    type EnqueueOutput = bool;
+
+    unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
+    where
+        F: FnOnce(*mut bindings::work_struct) -> bool,
+    {
+        let self_ptr = core::ptr::from_ref(self);
+
+        // SAFETY: `self_ptr` points to a valid `ScopedWorkRef` with a `Work` field.
+        let work_ptr = unsafe {
+            <ScopedWorkRef<T> as HasWork<ScopedWorkRef<T>, ID>>::raw_get_work(self_ptr.cast_mut())
+        };
+
+        // SAFETY: `work_ptr` points to a valid `Work`.
+        let work_ptr = unsafe { Work::raw_get(work_ptr) };
+
+        queue_work_on(work_ptr)
+    }
+}
+
+// SAFETY: `&ScopedWork<T>` accesses the inner `ScopedWorkRef` through `Opaque::get()`.
+// The pointer remains valid until `cancel_work_sync()` completes in `ScopedWork`'s drop.
+unsafe impl<'a, T: ScopedWorkItem + Sync, const ID: u64> RawWorkItem<ID> for &'a ScopedWork<T>
+where
+    ScopedWorkRef<T>: HasWork<ScopedWorkRef<T>, ID>,
+{
+    type EnqueueOutput = bool;
+
+    unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
+    where
+        F: FnOnce(*mut bindings::work_struct) -> bool,
+    {
+        // SAFETY: The inner ScopedWorkRef is valid and initialized.
+        let inner: &ScopedWorkRef<T> = unsafe { &*self.inner.get() };
+
+        // SAFETY: Delegates to the `&ScopedWorkRef<T>` impl.
+        unsafe { inner.__enqueue(queue_work_on) }
+    }
+}
+
+/// A scoped work item that cancels synchronously on drop.
+///
+/// `ScopedWork<T>` contains a `work_struct` and the user data `T`. Its destructor calls
+/// `cancel_work_sync()`, guaranteeing the work function is not running when the data is dropped.
+///
+/// This allows `T` to carry non-`'static` lifetimes.
+///
+/// Construct via [`new_scoped_work!`] which returns an `impl PinInit` suitable for embedding
+/// in-place inside other pinned structs.
+///
+/// # Examples
+///
+/// Self-re-enqueueing from within the work function:
+///
+/// ```
+/// # use kernel::sync::atomic::{Atomic, Relaxed};
+/// # use kernel::time::{Delta, delay::fsleep};
+/// use kernel::workqueue::{
+///     new_scoped_work,
+///     Queue,
+///     ScopedQueue,
+///     ScopedWork,
+///     ScopedWorkItem,
+///     ScopedWorkRef,
+/// };
+///
+/// struct RequeueWork<'a> {
+///     counter: Atomic<u32>,
+///     queue: &'a Queue,
+/// }
+///
+/// impl ScopedWorkItem for RequeueWork<'_> {
+///     fn run(work: &ScopedWorkRef<Self>) {
+///         if work.counter.fetch_add(1u32, Relaxed) < 2 {
+///             // SAFETY: The `ScopedWork` is not forgotten.
+///             unsafe { work.queue.enqueue_scoped(work) };
+///         }
+///     }
+/// }
+///
+/// // SAFETY: The queue is not forgotten.
+/// let queue = unsafe { ScopedQueue::new(c"requeue_wq")? };
+///
+/// let work = KBox::pin_init(
+///     new_scoped_work!("RequeueWork", RequeueWork { counter: Atomic::new(0u32), queue: &queue }),
+///     GFP_KERNEL,
+/// )?;
+///
+/// // SAFETY: `work` is not forgotten.
+/// unsafe { queue.enqueue_scoped(&*work) };
+/// # fsleep(Delta::from_millis(300));
+///
+/// assert_eq!(work.counter.load(Relaxed), 3);
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data(PinnedDrop)]
+pub struct ScopedWork<T: ScopedWorkItem> {
+    #[pin]
+    inner: Opaque<ScopedWorkRef<T>>,
+}
+
+// SAFETY: `&ScopedWork<T>` only provides `&ScopedWorkRef<T>` (via `Deref`), which is safe to share
+// when `T: Sync`.
+unsafe impl<T: ScopedWorkItem + Sync> Sync for ScopedWork<T> {}
+
+// SAFETY: ScopedWork can be sent to another thread when T: Send.
+unsafe impl<T: ScopedWorkItem + Send> Send for ScopedWork<T> {}
+
+impl<T: ScopedWorkItem> Deref for ScopedWork<T> {
+    type Target = ScopedWorkRef<T>;
+
+    #[inline]
+    fn deref(&self) -> &ScopedWorkRef<T> {
+        // SAFETY: The inner `ScopedWorkRef` is always valid and initialized.
+        unsafe { &*self.inner.get() }
+    }
+}
+
+impl<T: ScopedWorkItem> ScopedWork<T> {
+    /// Creates a pin-initializer for a new scoped work item.
+    ///
+    /// Use [`new_scoped_work!`] to automatically provide the lock class key.
+    #[inline]
+    pub fn new<E>(
+        name: &'static CStr,
+        key: Pin<&'static LockClassKey>,
+        init: impl PinInit<T, E>,
+    ) -> impl PinInit<Self, Error>
+    where
+        Error: From<E>,
+    {
+        try_pin_init!(Self {
+            inner <- Opaque::pin_init(try_pin_init!(ScopedWorkRef::<T> {
+                work <- Work::new(name, key),
+                data <- init,
+            })),
+        })
+    }
+}
+
+#[pinned_drop]
+impl<T: ScopedWorkItem> PinnedDrop for ScopedWork<T> {
+    #[inline]
+    fn drop(self: Pin<&mut Self>) {
+        let inner = self.inner.get();
+
+        // SAFETY: `inner` points to a valid `ScopedWorkRef`. After `cancel_work_sync()` returns,
+        // the work function is guaranteed to not be running.
+        unsafe { bindings::cancel_work_sync(Work::raw_get(&raw const (*inner).work)) };
+    }
+}
+
+/// Creates a [`ScopedWork`] pin-initializer with a new lock class.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::workqueue::{
+///     new_scoped_work,
+///     ScopedWork,
+///     ScopedWorkItem,
+///     ScopedWorkRef,
+/// };
+///
+/// struct MyWork {
+///     value: u32,
+/// }
+///
+/// impl ScopedWorkItem for MyWork {
+///     fn run(work: &ScopedWorkRef<Self>) {
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
+/// fn init_data() -> impl PinInit<MyData, Error> {
+///     try_pin_init!(MyData {
+///         work <- new_scoped_work!("MyWork", MyWork { value: 7 }),
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
2.55.0

