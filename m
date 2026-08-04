Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FF84A2E17;
	Tue,  4 Aug 2026 19:53:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785873207; cv=none; b=CXL5AMIEYuP95Keirt/1N5mZO+OUKl5mYevKBtC3ZGI6637bCNtngDhzw08qKShaYrzZoG3ZvQlEd9W/vNt7Qh/6m3PGiV7JH58+90J4nk2xQU5DTaQ0R7mbLyR4pTtMqorwd8C8hfmkwq/CZ+Xb6vWFAnqSC1cR++M8UnkJNxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785873207; c=relaxed/simple;
	bh=KjV/UhbXT8SkuXyCgAPAaoKNH4LjxL9nJppPoEVvjoU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=T+Mgxp1AX2wmnzNoFaStyTe2Cj/S1FATlnXHY0KiB2urABPFc+/8toF4e2xLBVapAhDriEkMp2SwtCJBg7cKvPFRwbNwTMrhcq4+GoUEZf3KKiK+WtvHWjy3FSwJX58S6Xh3X1iVoU1uDeyYRwcH8s4v24dggqFU0i72058A9Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DmcIkMRy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DmcIkMRy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DBA41F00A3A;
	Tue,  4 Aug 2026 19:53:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785873205;
	bh=j5DJ5j+tKigtV9e6VXIh+W8a7Fdw3bcHU09apW/ukYw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DmcIkMRyJnUVOK3tTmNinJnFBG14xonZ4wZn3m2otEQsBrmDnJnRQw0YOPJt6rDGJ
	 WCT/aMbKLeKkcuM1VYcKKzh5YDUwJFGPMEaU0Lqcks24Qk8gNna4Vf9XALzZYKAbAv
	 oMwYKiIol3ACGGxkkLgm+RLFUdTa/wOGSYQ5sTbpTJXTmYdWSAYkOvPxWpyqE2fAnh
	 z+JDr6L93DNSiR06Rw+HwfRsN56/2xM7ph9KkvixhARxpj3z7bWpzuSSMwZ8RnUTuJ
	 Vyt6kKmA0McgN07kJygV7FHuzcr6wKcZRI00rcXU1CQF0MaEB7OLe8lhgaqt8EgIAv
	 kJucjljcGpIbg==
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
Subject: [PATCH 5/7] rust: workqueue: add ScopedQueue for lifetime bound items
Date: Tue,  4 Aug 2026 21:52:07 +0200
Message-ID: <20260804195248.665636-6-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260804195248.665636-1-dakr@kernel.org>
References: <20260804195248.665636-1-dakr@kernel.org>
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
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/workqueue/mod.rs          |   3 +
 rust/kernel/workqueue/scoped_queue.rs | 187 ++++++++++++++++++++++++++
 2 files changed, 190 insertions(+)
 create mode 100644 rust/kernel/workqueue/scoped_queue.rs

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index 747fea980aa2..5de88c59b2e5 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -212,6 +212,9 @@
 mod builder;
 pub use self::builder::Builder;
 
+mod scoped_queue;
+pub use self::scoped_queue::ScopedQueue;
+
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
 macro_rules! new_work {
diff --git a/rust/kernel/workqueue/scoped_queue.rs b/rust/kernel/workqueue/scoped_queue.rs
new file mode 100644
index 000000000000..d4b9a03fd93c
--- /dev/null
+++ b/rust/kernel/workqueue/scoped_queue.rs
@@ -0,0 +1,187 @@
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
+    pub unsafe fn new(name: &'static CStr) -> Result<Self> {
+        Ok(Self {
+            inner: Queue::new_ordered().build(name)?,
+            _scope: PhantomData,
+        })
+    }
+
+    /// Enqueues a work item on this scoped queue.
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
+    fn drop(&mut self) {
+        // This impl makes dropck require `'scope` to outlive `OwnedQueue`.
+        // See: https://doc.rust-lang.org/nomicon/phantom-data.html#generic-parameters-and-drop-checking
+        let _ = &self._scope;
+    }
+}
-- 
2.55.0

