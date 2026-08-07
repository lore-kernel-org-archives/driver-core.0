Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176C8313527;
	Fri,  7 Aug 2026 16:53:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786121602; cv=none; b=lplfAMVnhELrSbTBr95IGzkiA1pWisfEuooXnRPw6Vip9poxXjU6ALwZkuSDwTEk06in5gl6Y/gVDw/I8Du4fm4gzqBxRYP6k0MvMbg4GGoyD7img4kO1aHsWQXyxmVKGZ6nEinpBhPE1+6cTFv2DZQf3Q8MXoO9SbinHn/MtaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786121602; c=relaxed/simple;
	bh=VshsSwNDeXW1qvODIB3pbB+f7tAuM6dzpEdyNdHPnnU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LLOGLVG40AP5QMFTmUhisr+TT09My22Oh9MO+9UsuOHLGzeUdrmSUOUepeMIsGGJg+o3HjzTvRhsbEYTn4oeMWOm8Dnzj8Y2tdnmTjJqcOsg1sZn1YUq4TKjVf5vQXy/kaz2AiQlQYHKW6m70mOP/3oWbtREmuMyz+/VRcPQX8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NPCXLpk5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NPCXLpk5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B44571F000E9;
	Fri,  7 Aug 2026 16:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786121600;
	bh=dciya5lMnm+jiQ3SsM0SyBhI3w9EpgFJ7aqc0y/koVo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=NPCXLpk5KTFojUtG+jV4prBStqMatqdVhW65cStHCjj9kpRxNZy6Xx/aARraotjTc
	 7CmbvdIoFK6NIYGKaEtyNeV8w6/zUHYRdTN265S5myORUX8TTXG/jmjVQrqL7kr/v9
	 PWSrHqM3xb8adCKCINdTccW+aT1jHaJZg+YAyZ0DZ/LUDuc3ekzE3XmbukEABMyTG1
	 MNl+vPqBE+tNW0rJTHXoK9FZNxVAOYIjjX5lStFV+WE5JZ/8zeg1R4xwcAI48QEDMv
	 w4HfhpWUOyCqx+e/Aqiq7sybYxdsWs3uNNYNsG8s7YuOPLf8CyELxg4CzRvx8MEqQG
	 M4QzehDXqrlbw==
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
Subject: [PATCH v2 4/6] rust: workqueue: add creation of workqueues
Date: Fri,  7 Aug 2026 18:52:47 +0200
Message-ID: <20260807165252.3849875-5-dakr@kernel.org>
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

From: Alice Ryhl <aliceryhl@google.com>

Creating workqueues is needed by various GPU drivers. Not only does it
give you better control over execution, it also allows devices to ensure
that all tasks have exited before the device is unbound (or similar) by
running the workqueue destructor.

Signed-off-by: Alice Ryhl <aliceryhl@google.com>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
[ * Fix import formatting of ptr::{self, NonNull},
  * rename T to Kind,
  * new_ordered(): set max_active: 1,
  * new_power_efficient(): WQ_UNBOUND | WQ_POWER_EFFICIENT, add
    .percpu(),
  * new_bh(): WQ_PERCPU | WQ_BH, removed .percpu(),
  * move sysfs() to TypeNormal,
  * impl Send + Sync for OwnedQueue,
  * add missing inline annotations,
  * various doc improvements: new_percpu, max_active, cpu_intensive,
    freezable.

  - Danilo ]
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/helpers/workqueue.c         |   7 +
 rust/kernel/workqueue/builder.rs | 389 +++++++++++++++++++++++++++++++
 rust/kernel/workqueue/mod.rs     |  51 +++-
 3 files changed, 444 insertions(+), 3 deletions(-)
 create mode 100644 rust/kernel/workqueue/builder.rs

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index ce1c3a5b2150..e4b9d1b3d6bf 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -14,3 +14,10 @@ __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
 	INIT_LIST_HEAD(&work->entry);
 	work->func = func;
 }
+
+__rust_helper
+struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
+						     int max_active, const void *data)
+{
+	return alloc_workqueue(fmt, flags, max_active, data);
+}
diff --git a/rust/kernel/workqueue/builder.rs b/rust/kernel/workqueue/builder.rs
new file mode 100644
index 000000000000..673b121483ec
--- /dev/null
+++ b/rust/kernel/workqueue/builder.rs
@@ -0,0 +1,389 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Workqueue builders.
+
+use kernel::{
+    alloc::AllocError,
+    prelude::*,
+    workqueue::{
+        OwnedQueue, //
+        Queue,
+    }, //
+};
+
+use core::{
+    marker::PhantomData,
+    ptr::{
+        self,
+        NonNull, //
+    },
+};
+
+/// Workqueue builder.
+///
+/// A valid combination of workqueue flags contains one of the base flags (`WQ_UNBOUND`, `WQ_BH`,
+/// or `WQ_PERCPU`) and a combination of modifier flags that are compatible with the selected base
+/// flag.
+///
+/// For details, please refer to `Documentation/core-api/workqueue.rst`.
+pub struct Builder<Kind> {
+    flags: bindings::wq_flags,
+    max_active: i32,
+    _kind: PhantomData<Kind>,
+}
+
+pub enum TypeUnbound {}
+pub enum TypePercpu {}
+pub enum TypePowerEfficient {}
+pub enum TypeBH {}
+pub enum TypeOrdered {}
+
+/// Entry-points to the builder API.
+impl Queue {
+    /// Build a workqueue whose work may execute on any cpu.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from unbound wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_UNBOUND")]
+    pub fn new_unbound() -> Builder<TypeUnbound> {
+        Builder {
+            flags: bindings::wq_flags_WQ_UNBOUND,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a workqueue whose work items are bound to the CPU they are queued on.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_percpu().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from percpu wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_PERCPU")]
+    pub fn new_percpu() -> Builder<TypePercpu> {
+        Builder {
+            flags: bindings::wq_flags_WQ_PERCPU,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a power-efficient workqueue.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_power_efficient().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from power-efficient wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_POWER_EFFICIENT")]
+    pub fn new_power_efficient() -> Builder<TypePowerEfficient> {
+        Builder {
+            flags: bindings::wq_flags_WQ_UNBOUND | bindings::wq_flags_WQ_POWER_EFFICIENT,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a single-threaded workqueue that executes jobs in order.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_ordered().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from ordered wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "alloc_ordered_workqueue")]
+    #[doc(alias = "__WQ_ORDERED")]
+    pub fn new_ordered() -> Builder<TypeOrdered> {
+        Builder {
+            flags: bindings::wq_flags_WQ_UNBOUND | bindings::wq_flags___WQ_ORDERED,
+            max_active: 1,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a workqueue that executes in bottom-half (softirq) context.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_bh().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from BH wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_BH")]
+    pub fn new_bh() -> Builder<TypeBH> {
+        Builder {
+            flags: bindings::wq_flags_WQ_PERCPU | bindings::wq_flags_WQ_BH,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+}
+
+/// Options that may be used with all workqueue types.
+impl<Kind> Builder<Kind> {
+    /// Mark this workqueue high priority.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().highpri().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from highpri wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_HIGHPRI")]
+    pub fn highpri(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_HIGHPRI;
+        self
+    }
+
+    /// Creates the workqueue.
+    ///
+    /// The provided name is used verbatim as the workqueue name.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// // create an unbound workqueue registered with sysfs
+    /// let wq = Queue::new_unbound().sysfs().build(c"my-wq")?;
+    ///
+    /// // spawn a work item on it
+    /// wq.try_spawn(
+    ///     GFP_KERNEL,
+    ///     || pr_warn!("Printing from my-wq"),
+    /// )?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "alloc_workqueue")]
+    pub fn build(self, name: &CStr) -> Result<OwnedQueue, AllocError> {
+        // SAFETY:
+        // * c"%s" is compatible with passing the name as a c-string.
+        // * the builder only permits valid flag combinations
+        let ptr = unsafe {
+            bindings::alloc_workqueue(
+                c"%s".as_char_ptr(),
+                self.flags,
+                self.max_active,
+                name.as_char_ptr().cast::<c_void>(),
+            )
+        };
+
+        // INVARIANT: We successfully created the workqueue, so we can return ownership to the
+        // caller.
+        Ok(OwnedQueue {
+            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
+        })
+    }
+
+    /// Creates the workqueue.
+    ///
+    /// # Examples
+    ///
+    /// This example shows how to pass a Rust string formatter to the workqueue name, creating
+    /// workqueues with names such as `my-wq-1` and `my-wq-2`.
+    ///
+    /// ```
+    /// use kernel::workqueue::{Queue, OwnedQueue};
+    ///
+    /// fn my_wq(num: u32) -> Result<OwnedQueue> {
+    ///     // create a percpu workqueue called my-wq-{num}
+    ///     let wq = Queue::new_percpu().build_fmt(fmt!("my-wq-{num}"))?;
+    ///     Ok(wq)
+    /// }
+    /// ```
+    #[inline]
+    pub fn build_fmt(self, name: kernel::fmt::Arguments<'_>) -> Result<OwnedQueue, AllocError> {
+        // SAFETY:
+        // * c"%pA" is compatible with passing an `Arguments` pointer.
+        // * the builder only permits valid flag combinations
+        let ptr = unsafe {
+            bindings::alloc_workqueue(
+                c"%pA".as_char_ptr(),
+                self.flags,
+                self.max_active,
+                ptr::from_ref(&name).cast::<c_void>(),
+            )
+        };
+
+        // INVARIANT: We successfully created the workqueue, so we can return ownership to the
+        // caller.
+        Ok(OwnedQueue {
+            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
+        })
+    }
+}
+
+/// Indicates that this workqueue is threaded.
+pub trait TypeThreaded {}
+impl TypeThreaded for TypeUnbound {}
+impl TypeThreaded for TypePercpu {}
+impl TypeThreaded for TypePowerEfficient {}
+
+/// Options that are not available on BH or ordered workqueues.
+impl<Kind: TypeThreaded> Builder<Kind> {
+    /// Set the maximum number of concurrently executing work items.
+    ///
+    /// For percpu workqueues this is per-CPU. If not set, a default value of
+    /// `WQ_DFL_ACTIVE` is used. The maximum value is `WQ_MAX_ACTIVE`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().max_active(16).build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from wq with max_active=16"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub fn max_active(mut self, max_active: u32) -> Self {
+        // If provided `max_active` is greater than `i32::MAX`, then we need to trigger the C-side
+        // comparison with `WQ_MAX_ACTIVE`, which we can do by clamping to `i32::MAX`.
+        self.max_active = i32::try_from(max_active).unwrap_or(i32::MAX);
+        self
+    }
+
+    /// Mark this workqueue as cpu intensive.
+    ///
+    /// Work items will not contribute to the concurrency level, preventing
+    /// them from stalling other work items in the same per-CPU worker pool.
+    /// This is meaningless for unbound workqueues.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().cpu_intensive().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from cpu-intensive wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_CPU_INTENSIVE")]
+    pub fn cpu_intensive(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_CPU_INTENSIVE;
+        self
+    }
+}
+
+/// Indicates that this workqueue runs in a normal context (as opposed to softirq context).
+pub trait TypeNormal {}
+impl TypeNormal for TypeUnbound {}
+impl TypeNormal for TypePercpu {}
+impl TypeNormal for TypePowerEfficient {}
+impl TypeNormal for TypeOrdered {}
+
+/// Options that are not available on BH workqueues.
+impl<Kind: TypeNormal> Builder<Kind> {
+    /// Make this workqueue visible in sysfs.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().sysfs().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from sysfs wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_SYSFS")]
+    pub fn sysfs(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_SYSFS;
+        self
+    }
+
+    /// Allow this workqueue to be frozen during suspend.
+    ///
+    /// Work items on the workqueue are drained and no new work items start
+    /// execution until thawed.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().freezable().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from freezable wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_FREEZABLE")]
+    pub fn freezable(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_FREEZABLE;
+        self
+    }
+
+    /// This workqueue may be used during memory reclaim.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().mem_reclaim().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from mem_reclaim wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_MEM_RECLAIM")]
+    pub fn mem_reclaim(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_MEM_RECLAIM;
+        self
+    }
+}
+
+/// Options only available on a power-efficient workqueue.
+impl Builder<TypePowerEfficient> {
+    /// Configure this power-efficient workqueue to be percpu.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_power_efficient().percpu().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from percpu power-efficient wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_PERCPU")]
+    pub fn percpu(mut self) -> Self {
+        self.flags &= !bindings::wq_flags_WQ_UNBOUND;
+        self.flags |= bindings::wq_flags_WQ_PERCPU;
+        self
+    }
+}
diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index 399d2ed24135..8eb2d037be83 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -186,7 +186,10 @@
 //! C header: [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
 
 use crate::{
-    alloc::{AllocError, Flags},
+    alloc::{
+        self,
+        AllocError, //
+    },
     container_of,
     prelude::*,
     sync::{
@@ -200,7 +203,14 @@
     time::Jiffies,
     types::Opaque,
 };
-use core::{marker::PhantomData, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    ops::Deref,
+    ptr::NonNull, //
+};
+
+mod builder;
+pub use self::builder::Builder;
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
@@ -346,7 +356,7 @@ pub fn enqueue_delayed<W, const ID: u64>(
     /// This method can fail because it allocates memory to store the work item.
     pub fn try_spawn<T: 'static + Send + FnOnce()>(
         &self,
-        flags: Flags,
+        flags: alloc::Flags,
         func: T,
     ) -> Result<(), AllocError> {
         let init = pin_init!(ClosureWork {
@@ -359,6 +369,41 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
     }
 }
 
+/// An owned kernel work queue.
+///
+/// Dropping a workqueue blocks on all pending work.
+///
+/// # Invariants
+///
+/// `queue` points at a valid workqueue that is owned by this `OwnedQueue`.
+pub struct OwnedQueue {
+    queue: NonNull<Queue>,
+}
+
+// SAFETY: `OwnedQueue` uniquely owns a valid `Queue`, which is `Send + Sync`.
+unsafe impl Send for OwnedQueue {}
+// SAFETY: `&OwnedQueue` only provides `&Queue` (via `Deref`), which is safe to share.
+unsafe impl Sync for OwnedQueue {}
+
+impl Deref for OwnedQueue {
+    type Target = Queue;
+    #[inline]
+    fn deref(&self) -> &Queue {
+        // SAFETY: By the type invariants, this pointer references a valid queue.
+        unsafe { &*self.queue.as_ptr() }
+    }
+}
+
+impl Drop for OwnedQueue {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: This `OwnedQueue` owns a valid workqueue, so we can destroy it. There is no
+        // delayed work scheduled on this queue that may attempt to use it after this call, as
+        // scheduling delayed work requires a 'static reference.
+        unsafe { bindings::destroy_workqueue(self.queue.as_ptr().cast()) }
+    }
+}
+
 /// A helper type used in [`try_spawn`].
 ///
 /// [`try_spawn`]: Queue::try_spawn
-- 
2.55.0

