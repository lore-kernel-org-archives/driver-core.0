Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BE2B39EF1C;
	Fri,  7 Aug 2026 16:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121608; cv=none; b=Mw8vyUFStqZQxFpxfCV7aBY555EXjH33KlXqhfWqVAbHJ4llxP2n7YSGxIdHgsil6WgSrlwj766LPsV+E3CubuqceELUlzrV2iJmw1F8VcDZwZ4cI1bR1kRpliwwojk21UsXUcoVHlagqiNygquoViyJTo2ZPCeyLQW1zpu5rsk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121608; c=relaxed/simple;
	bh=MeyJSyi4gNjiMX9oh3a84EhMG9idgmhZucxZZguxoPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sCnFnfcS1A4gV2xgAI6RUoB5uAVvK/GZEPqSQu7ki6S283p09OcYUesGBqJOcMEG8Ux4PeMVf9Yu7GGJ3vQ6q6GDsggUm+dTeE8OJVt3szjZtma6LJiqHhShfamSxKrklRezY4ap/J+SLbTnqw02h6mR/M2hu1hPH4cF0VKlG04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PZsbqvC7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PZsbqvC7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DCE71F00A3A;
	Fri,  7 Aug 2026 16:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786121606;
	bh=v5rO7Pt9TZyJwWtTgJ+3okuK8bq+zJs8wct93yfdHpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PZsbqvC7e+qLpU2aSUQ7kn+VaVpVxD30TKDxFPuwD457ZRAnQ8riV8iKUfqyyZskr
	 L6vc2hGEJz4AlRAfhqEBRG59zqrPunftKRAYNLncAVjOhyhcyUPozvjD0LTL26s5nn
	 trXW+/bdS1gO1b774bOyazxnG6XteO8ntjkkVtXwAxW1F2VXUGKuGD7MTVo13Mwprt
	 3TBuMAi3L40e7WqcarGDd2HTjJ/Fcq5DyqHKaViAG5VgcDMzuUQnCmhwVZmNBXfQZz
	 exR4yV5UNdO2R1mV5YpnfJakQCI7pVZEE3n0JP4daKk/bQE5JS9JszdAvMyDU7t6Ls
	 YullI4FVhQfVw==
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
Subject: [PATCH v2 5/6] rust: workqueue: add ScopedQueue for lifetime bound items
Date: Fri,  7 Aug 2026 18:52:48 +0200
Message-ID: <20260807165252.3849875-6-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260807165252.3849875-1-dakr@kernel.org>
References: <20260807165252.3849875-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Onur Özkan <work@onurozkan.dev>

Add a workqueue wrapper for work items that are not 'static.

Tyr reset work is queued from a handle that owns a Controller<'bound>
where the work item holds references tied to the lifetime of the bound
device and its mapped IO state. The existing API only accepts 'static
work items which cannot express that relationship.

Introduce ScopedQueue for this case. It owns the underlying workqueue
and ties enqueued work to the queue lifetime so borrowed state cannot
outlive the queue that may still run it.

Construction is unsafe because the queue must not be leaked.

`compile_fail` doc-tests are ignored for now as KUnit doesn't support
that. Enabling those tests as regular code block would raise this error:

    ERROR:root:error[E0597]: `data` does not live long enough
	 --> rust/doctests_kernel_generated.rs:22029:44
	  |
    22027 |         let data = ();
	  |             ---- binding `data` declared here
    22028 |         // SAFETY: Queue is not leaked.
    22029 |         queue = unsafe { new_queue(&data)? };
	  |                                            ^^^^^ borrowed value does not live long enough
    22030 |     }
	  |     - `data` dropped here while still borrowed
    ...
    22034 | }
	  | - borrow might be used here, when `queue` is dropped and runs the `Drop` code for type `ScopedQueue`
	  |
	  = note: values in a scope are dropped in the opposite order they are defined

which is exactly the constraint ScopedQueue is meant to enforce.

Suggested-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Onur Özkan <work@onurozkan.dev>
[ Move from scoped_queue.rs to scoped.rs, which can be shared with
  ScopedWork; add missing inline annotations. - Danilo ]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/workqueue/mod.rs    |   3 +
 rust/kernel/workqueue/scoped.rs | 190 ++++++++++++++++++++++++++++++++
 2 files changed, 193 insertions(+)
 create mode 100644 rust/kernel/workqueue/scoped.rs

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index 8eb2d037be83..551fa1401b85 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -212,6 +212,9 @@
 mod builder;
 pub use self::builder::Builder;
 
+mod scoped;
+pub use self::scoped::ScopedQueue;
+
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
 macro_rules! new_work {
diff --git a/rust/kernel/workqueue/scoped.rs b/rust/kernel/workqueue/scoped.rs
new file mode 100644
index 000000000000..18a4b6f6cf18
--- /dev/null
+++ b/rust/kernel/workqueue/scoped.rs
@@ -0,0 +1,190 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Lifetime-scoped workqueues.
+//!
+//! Provides [`ScopedQueue`] for work items that may borrow data with some
+//! non-`'static` lifetime.
+//!
+//! Unlike [`Queue`] which only accepts `'static` work items, [`ScopedQueue`]
+//! owns its underlying queue and relies on that queue being dropped to drain
+//! pending and running work before borrowed data can go out of scope.
+//!
+//! TODO: Remove `ignore` once KUnit supports `compile_fail` on doc-tests.
+//! ```compile_fail,ignore
+//! use kernel::prelude::*;
+//! use kernel::workqueue::ScopedQueue;
+//!
+//! /// # Safety
+//! ///
+//! /// Returned queue must not be leaked.
+//! unsafe fn new_queue<'bound>(_: &'bound ()) -> Result<ScopedQueue<'bound>> {
+//!     // SAFETY: Caller guarantees that the returned queue is not leaked.
+//!     unsafe { ScopedQueue::new(c"scoped_queue") }
+//! }
+//!
+//! fn queue_outlives_borrowed_data() -> Result {
+//!     let queue;
+//!
+//!     {
+//!         let data = ();
+//!         // SAFETY: Queue is not leaked.
+//!         queue = unsafe { new_queue(&data)? };
+//!     }
+//!     // Here the `compile_fail` is fulfilled as `queue` would be dropped
+//!     // after `data`.
+//!     Ok(())
+//! }
+//! ```
+//!
+//! TODO: Remove `ignore` once KUnit supports `compile_fail` on doc-tests.
+//! ```compile_fail,ignore
+//! use kernel::prelude::*;
+//! use kernel::sync::Arc;
+//! use kernel::workqueue::{
+//!     impl_has_work,
+//!     new_work,
+//!     ScopedQueue,
+//!     Work,
+//!     WorkItem,
+//! };
+//!
+//! #[pin_data]
+//! struct BorrowedWork<'bound> {
+//!     data: &'bound (),
+//!     #[pin]
+//!     work: Work<BorrowedWork<'bound>>,
+//! }
+//!
+//! impl_has_work! {
+//!     impl{'bound} HasWork<BorrowedWork<'bound>> for BorrowedWork<'bound> { self.work }
+//! }
+//!
+//! impl<'bound> WorkItem for BorrowedWork<'bound> {
+//!     type Pointer = Arc<Self>;
+//!
+//!     fn run(_this: Arc<Self>) {}
+//! }
+//!
+//! impl<'bound> BorrowedWork<'bound> {
+//!     fn new(data: &'bound ()) -> Result<Arc<Self>> {
+//!         Arc::pin_init(
+//!             pin_init!(Self {
+//!                 data,
+//!                 work <- new_work!("BorrowedWork::work"),
+//!             }),
+//!             GFP_KERNEL,
+//!         )
+//!     }
+//! }
+//!
+//! struct Handle<'bound> {
+//!     work: Arc<BorrowedWork<'bound>>,
+//!     wq: ScopedQueue<'bound>,
+//! }
+//!
+//! impl<'bound> Handle<'bound> {
+//!     /// # Safety
+//!     ///
+//!     /// Returned handle must not be leaked.
+//!     unsafe fn new(data: &'bound ()) -> Result<Self> {
+//!         Ok(Self {
+//!             work: BorrowedWork::new(data)?,
+//!             // SAFETY: Caller guarantees that the returned handle is not leaked.
+//!             wq: unsafe { ScopedQueue::new(c"handle_wq")? },
+//!         })
+//!     }
+//! }
+//!
+//! fn handle_outlives_borrowed_data() -> Result {
+//!     let handle;
+//!
+//!     {
+//!         let data = ();
+//!         // SAFETY: Handle is not leaked.
+//!         handle = unsafe { Handle::new(&data)? };
+//!
+//!         let _ = handle.wq.enqueue(handle.work.clone());
+//!     }
+//!     // Here the `compile_fail` is fulfilled as `handle` would be dropped
+//!     // after `data`.
+//!     Ok(())
+//! }
+//! ```
+
+use super::{
+    OwnedQueue,
+    Queue,
+    RawWorkItem, //
+};
+
+use crate::{
+    bindings,
+    ffi,
+    prelude::*, //
+};
+
+use core::marker::PhantomData;
+
+/// An owned workqueue that can enqueue work items borrowing from `'scope`.
+///
+/// A `ScopedQueue` must not outlive data borrowed by its work items.
+pub struct ScopedQueue<'scope> {
+    inner: OwnedQueue,
+    _scope: PhantomData<&'scope mut &'scope ()>,
+}
+
+impl<'scope> ScopedQueue<'scope> {
+    /// Creates an ordered scoped workqueue.
+    ///
+    /// # Safety
+    ///
+    /// The caller must not leak the returned queue or otherwise prevent its
+    /// [`Drop`] implementation from running since dropping the queue drains
+    /// pending and running work that may borrow from `'scope`.
+    #[inline]
+    pub unsafe fn new(name: &'static CStr) -> Result<Self> {
+        Ok(Self {
+            inner: Queue::new_ordered().build(name)?,
+            _scope: PhantomData,
+        })
+    }
+
+    /// Enqueues a work item on this scoped queue.
+    #[inline]
+    pub fn enqueue<W, const ID: u64>(&self, work: W) -> W::EnqueueOutput
+    where
+        W: RawWorkItem<ID> + Send + 'scope,
+    {
+        let queue_ptr = self.inner.0.get();
+
+        // SAFETY:
+        // - Closure returns `false` only if `queue_work_on` returns `false`
+        //   and that means `work_ptr` is already in a workqueue.
+        //
+        // - `W: 'scope` and dropck keep borrowed data alive until this queue is
+        //   dropped. The constructor requires that the queue is not leaked and
+        //   dropping `inner` drains pending and running work so the function
+        //   pointer is not called after any lifetime in `W` expires.
+        //
+        // - The last requirement of `__enqueue` is not relevant here because `W`
+        //   is `Send`.
+        unsafe {
+            work.__enqueue(move |work_ptr| {
+                bindings::queue_work_on(
+                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_int,
+                    queue_ptr,
+                    work_ptr,
+                )
+            })
+        }
+    }
+}
+
+impl Drop for ScopedQueue<'_> {
+    #[inline]
+    fn drop(&mut self) {
+        // This impl makes dropck require `'scope` to outlive `OwnedQueue`.
+        // See: https://doc.rust-lang.org/nomicon/phantom-data.html#generic-parameters-and-drop-checking
+        let _ = &self._scope;
+    }
+}
-- 
2.55.0

