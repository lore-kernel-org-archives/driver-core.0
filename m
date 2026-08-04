Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EDE4854F8;
	Tue,  4 Aug 2026 19:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873216; cv=none; b=SQdqNph9SIlxvJh5Nu7cWPhnHZ+woYJVidraap7FxA7UgwbnJ1KXtseuZ/QuBc2kRcn0eBBcDIZhM8Hz9f8H1Q4+yaP3Qjc7qflTQnse428GDyx/fmG9irodYm5i5ech26bzQahu27EaLEAtSpGPE9ziIPkLGTEQvxyT+1V038U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873216; c=relaxed/simple;
	bh=saFGcA/IOUitefqNF3vJ3rxLlfNRxVOxpqAeEZdGio4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8poCAwXhpKB3L+rbx+Pl0GJdvaKnHcZ4KWcTFDEuPyYXAKwB+lw5GN6Kb4eoaeqnOnsJnH1lfQZCqxnTWAnTwWliuGpf6o9xaVomzY3YEC1byI03GrXBaOmG70H3gnJBG2GZN0UWa1/W50QVVx9dUJFCzASA1ZXhZySDLqgL0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVHa2mIj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVHa2mIj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77D721F00A3A;
	Tue,  4 Aug 2026 19:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785873214;
	bh=Y6vPxA08WuImsttgLjCe+Pyt9z/RPuUU3Pfcz/EgmVA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=WVHa2mIjnd3KP4pbou0g5duJ8uTfldF1py8QF2FiTsRGUP1WLkj8P9GUEJhw0NFAW
	 btb6A2FPna0zg66Dqh9YVk/xQvIiv7i+GWvOkiJZRmkCgQ9Ez5HtQVdK6lX1eQ7bWQ
	 fXJks/5tw+qYEzZseb8YHzk3Ug+PCc9P50AMYAw6+L3A8NwKTuxD2udnz0iETTIkHj
	 +yMC0+ghZ1EmMbAIBh1PaliFyEllCKQZc/pp0A8sG1inxgrfqbigBxQMMr4jlKwrgB
	 DEiLf8NWbz2Ihocz2pcsZMYf51g2xA7HvFQ1u5mNqGzHClOXkXyLyf8zxCM3I7HwXE
	 jfQNxtOVxK1sg==
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
Subject: [PATCH 7/7] rust: workqueue: add ScopedWork for non-'static work items
Date: Tue,  4 Aug 2026 21:52:09 +0200
Message-ID: <20260804195248.665636-8-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804195248.665636-1-dakr@kernel.org>
References: <20260804195248.665636-1-dakr@kernel.org>
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
NonNull<Self> as WorkItem::Pointer for the callback path, and implements
RawWorkItem for Pin<&ScopedWork<T>> for the enqueue path (requiring T:
Sync for cross-thread shared access safety).

Two enqueue paths are provided:
  - Queue::enqueue_scoped() / ScopedQueue::enqueue_scoped() (unsafe):
    the caller must ensure the work item is not forgotten.
  - ScopedQueue::enqueue() (safe): when the work item's lifetime
    satisfies the queue's 'scope bound.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/workqueue/mod.rs          |  43 +++-
 rust/kernel/workqueue/scoped_queue.rs |  37 +++-
 rust/kernel/workqueue/scoped_work.rs  | 290 ++++++++++++++++++++++++++
 3 files changed, 348 insertions(+), 22 deletions(-)
 create mode 100644 rust/kernel/workqueue/scoped_work.rs

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index 2b87f935712a..11477d42020b 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -215,6 +215,13 @@
 mod scoped_queue;
 pub use self::scoped_queue::ScopedQueue;
 
+mod scoped_work;
+pub use self::scoped_work::{
+    new_scoped_work,
+    ScopedWork,
+    ScopedWorkItem, //
+};
+
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
 macro_rules! new_work {
@@ -286,20 +293,34 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::workqueue_struct) -> &'a Queue
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
diff --git a/rust/kernel/workqueue/scoped_queue.rs b/rust/kernel/workqueue/scoped_queue.rs
index d4b9a03fd93c..21928d60a63b 100644
--- a/rust/kernel/workqueue/scoped_queue.rs
+++ b/rust/kernel/workqueue/scoped_queue.rs
@@ -152,20 +152,35 @@ pub unsafe fn new(name: &'static CStr) -> Result<Self> {
     pub fn enqueue<W, const ID: u64>(&self, work: W) -> W::EnqueueOutput
     where
         W: RawWorkItem<ID> + Send + 'scope,
+    {
+        // SAFETY: `W: 'scope` and dropck keep borrowed data alive until this queue
+        // is dropped. The constructor requires that the queue is not leaked and
+        // dropping `inner` drains pending and running work, so the function pointer
+        // is not called after any lifetime in `W` expires.
+        unsafe { self.enqueue_scoped(work) }
+    }
+
+    /// Enqueues a work item without the `'scope` lifetime bound.
+    ///
+    /// Unlike [`ScopedQueue::enqueue`], this does not require `W: 'scope`.
+    ///
+    /// Prefer [`ScopedQueue::enqueue`] when the work item's lifetime satisfies
+    /// `'scope`.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the work item's destructor runs before any
+    /// lifetime it captures expires (i.e., the work item must not be forgotten).
+    pub unsafe fn enqueue_scoped<W, const ID: u64>(&self, work: W) -> W::EnqueueOutput
+    where
+        W: RawWorkItem<ID> + Send,
     {
         let queue_ptr = self.inner.0.get();
 
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
+        // SAFETY: The caller guarantees the work item remains valid until the work
+        // function runs or the item is cancelled. `W: Send` satisfies the
+        // cross-thread safety requirement. The closure only returns `false` if the
+        // `work_struct` is already in a workqueue.
         unsafe {
             work.__enqueue(move |work_ptr| {
                 bindings::queue_work_on(
diff --git a/rust/kernel/workqueue/scoped_work.rs b/rust/kernel/workqueue/scoped_work.rs
new file mode 100644
index 000000000000..bdc834a9a08d
--- /dev/null
+++ b/rust/kernel/workqueue/scoped_work.rs
@@ -0,0 +1,290 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Scoped work items.
+//!
+//! Provides [`ScopedWork`] for work items whose inner data may carry non-`'static` lifetimes.
+//!
+//! Unlike [`Work`]-based work items, [`ScopedWork`] cancels work synchronously on drop via
+//! `cancel_work_sync()`, so ownership of the data is not transferred to the workqueue.
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
+//! };
+//!
+//! struct MyWork {
+//!     value: u32,
+//! }
+//!
+//! impl ScopedWorkItem for MyWork {
+//!     fn run(self: Pin<&Self>) {
+//!         pr_info!("value = {}\n", self.value);
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
+//! # // Allow the worker thread to pick up and execute the work.
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
+//! };
+//!
+//! struct MyWork {
+//!     value: u32,
+//! }
+//!
+//! impl ScopedWorkItem for MyWork {
+//!     fn run(self: Pin<&Self>) {
+//!         pr_info!("value = {}\n", self.value);
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
+
+use super::{
+    impl_has_work,
+    HasWork,
+    RawWorkItem,
+    Work,
+    WorkItem,
+    WorkItemPointer, //
+};
+
+use crate::{
+    bindings,
+    prelude::*,
+    sync::LockClassKey, //
+};
+
+use core::{
+    ops::Deref,
+    ptr::NonNull, //
+};
+
+/// Trait for types that can be used as scoped work items.
+///
+/// Implementers define the work function that executes when the item is dequeued by a workqueue
+/// thread. The callback receives a shared pinned reference; mutation should use interior mutability
+/// (e.g., [`Mutex`](crate::sync::Mutex)).
+pub trait ScopedWorkItem {
+    /// Called when the work item is executed.
+    fn run(self: Pin<&Self>);
+}
+
+// SAFETY: The `run` callback uses the `work_struct` pointer to recover a pointer to `ScopedWork<T>`
+// via `HasWork`, wraps it in `NonNull`, and calls `WorkItem::run`.
+unsafe impl<T: ScopedWorkItem, const ID: u64> WorkItemPointer<ID> for NonNull<ScopedWork<T>>
+where
+    ScopedWork<T>: WorkItem<ID, Pointer = Self>,
+    ScopedWork<T>: HasWork<ScopedWork<T>, ID>,
+{
+    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+        let ptr = ptr.cast::<Work<ScopedWork<T>, ID>>();
+
+        // SAFETY: The `work_struct` is embedded in `ScopedWork<T>` via `HasWork`.
+        let ptr = unsafe { <ScopedWork<T> as HasWork<ScopedWork<T>, ID>>::work_container_of(ptr) };
+
+        // SAFETY: `work_container_of` returns a valid, non-null pointer.
+        let nn = unsafe { NonNull::new_unchecked(ptr) };
+
+        <ScopedWork<T> as WorkItem<ID>>::run(nn);
+    }
+}
+
+// Required because `WorkItemPointer<ID>: RawWorkItem<ID>` is a supertrait bound. This `__enqueue`
+// is never called; the enqueue path goes through the `RawWorkItem` impl for `&ScopedWork<T>`
+// instead.
+//
+// SAFETY: `__enqueue` is unreachable.
+unsafe impl<T: ScopedWorkItem, const ID: u64> RawWorkItem<ID> for NonNull<ScopedWork<T>>
+where
+    ScopedWork<T>: HasWork<ScopedWork<T>, ID>,
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
+// SAFETY: `&ScopedWork<T>` points to a valid, pinned `ScopedWork` with a valid `work_struct`.
+// The pointer remains valid until `cancel_work_sync()` completes.
+unsafe impl<'a, T: ScopedWorkItem + Sync, const ID: u64> RawWorkItem<ID> for &'a ScopedWork<T>
+where
+    ScopedWork<T>: HasWork<ScopedWork<T>, ID>,
+{
+    type EnqueueOutput = bool;
+
+    unsafe fn __enqueue<F>(self, queue_work_on: F) -> Self::EnqueueOutput
+    where
+        F: FnOnce(*mut bindings::work_struct) -> bool,
+    {
+        let self_ptr = core::ptr::from_ref(self);
+
+        // SAFETY: `self_ptr` points to a valid `ScopedWork` with a `Work` field.
+        let work_ptr = unsafe {
+            <ScopedWork<T> as HasWork<ScopedWork<T>, ID>>::raw_get_work(self_ptr.cast_mut())
+        };
+
+        // SAFETY: `work_ptr` points to a valid `Work`.
+        let work_ptr = unsafe { Work::raw_get(work_ptr) };
+
+        queue_work_on(work_ptr)
+    }
+}
+
+/// A scoped work item that cancels synchronously on drop.
+///
+/// `ScopedWork<T>` contains both a `work_struct` and the user data `T`. Its destructor calls
+/// `cancel_work_sync()`, guaranteeing the work function is not running when the data is dropped.
+///
+/// This allows `T` to carry non-`'static` lifetimes.
+///
+/// Construct via [`new_scoped_work!`] which returns an `impl PinInit` suitable for embedding
+/// in-place inside other pinned structs.
+#[pin_data(PinnedDrop)]
+pub struct ScopedWork<T: ScopedWorkItem> {
+    #[pin]
+    work: Work<Self>,
+    #[pin]
+    data: T,
+}
+
+impl_has_work! {
+    impl{T: ScopedWorkItem} HasWork<ScopedWork<T>> for ScopedWork<T> { self.work }
+}
+
+impl<T: ScopedWorkItem> WorkItem for ScopedWork<T> {
+    type Pointer = NonNull<Self>;
+
+    fn run(this: NonNull<Self>) {
+        // SAFETY: `this` points to a valid, pinned `ScopedWork`. `cancel_work_sync()` in
+        // `PinnedDrop` prevents use-after-drop.
+        let data = unsafe { Pin::new_unchecked(&(*this.as_ptr()).data) };
+
+        T::run(data);
+    }
+}
+
+impl<T: ScopedWorkItem> Deref for ScopedWork<T> {
+    type Target = T;
+
+    fn deref(&self) -> &T {
+        &self.data
+    }
+}
+
+impl<T: ScopedWorkItem> ScopedWork<T> {
+    /// Creates a pin-initializer for a new scoped work item.
+    ///
+    /// Use [`new_scoped_work!`] to automatically provide the lock class key.
+    pub fn new<E>(
+        name: &'static CStr,
+        key: Pin<&'static LockClassKey>,
+        init: impl PinInit<T, E>,
+    ) -> impl PinInit<Self, Error>
+    where
+        Error: From<E>,
+    {
+        try_pin_init!(Self {
+            work <- Work::new(name, key),
+            data <- init,
+        })
+    }
+
+    /// Synchronously cancels pending work and waits for any running work function to complete.
+    ///
+    /// Returns `true` if the work was pending, `false` otherwise.
+    pub fn cancel_work_sync(&self) -> bool {
+        self.work.cancel_work_sync()
+    }
+}
+
+#[pinned_drop]
+impl<T: ScopedWorkItem> PinnedDrop for ScopedWork<T> {
+    fn drop(self: Pin<&mut Self>) {
+        self.cancel_work_sync();
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
+/// };
+///
+/// struct MyWork {
+///     value: u32,
+/// }
+///
+/// impl ScopedWorkItem for MyWork {
+///     fn run(self: Pin<&Self>) {
+///         pr_info!("value = {}\n", self.value);
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

