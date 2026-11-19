Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097586;
	b=rrY3njW7oPVJlDaHsZ3z6OzUkXSLF6fp7W2fLv4HfaiYjDvsPROm8uteaq7nRfptLODl
	 1NJwWO8mG0XCj9kQzcTOWTaOkgYsFVu2AAROETX6d0P1gCh3RoejiP1T2+F8247u8JV7Q
	 XbcH7ObisBdmkBKam4wMZjOGjUVdQrtjozcPqzmAjLXom6jUze9ROhhb1HWnj3yCdYkKr
	 5dbC4tXfyF+zBBmcpOremqw747Bkkph+CtY8VIjxgN3KFzjLOM6Rs0CrPw/3P/eOM4Sxy
	 PRFhxFKeikeZFoVcquChbODhrfGdrPtS7c0f7KNLUvVpe12w7dY1i7/msoST41U/BxQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097586;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=Mcl3KXtE5p6+YLN1bJl/hHTVhr8IkoxQ8CN8y4gi+vc=;
	b=LbQjSnuXFVWnsWUWLdC+5iHN23vYdzemyNIcatNMYRydwteQRq5ybnRV1lS6L8sgh8Jk
	 +E9GCFcJJXkbYsT09Z0smF05LOwB4cz0tHAOgfnp7NjoWFAjKwaUBYb9SH0Es5Rm/pa7y
	 ZUre7W72tUUMXvcHj5SrR/c2j5p++7fCRbFXAbyfKqCqeBvSDba+6D0O4JNwsJsaGF0YI
	 LqK6rsqOfmu6wEZlrIrFlwFz7Y8vE/RCzQITsrGJtUIQEIbvuNxc5EPTt8ZNKdkPic+kD
	 yJsiuVYbE1H+gLqKWdScI0giX9nysb6nqLC6p9P9xS/S96ISP5TetevK4GpABma0p1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U8wISKpE;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B50606A333
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 14:13:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B50606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=U8wISKpE
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4ba01393800so14975785e9.1
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 06:13:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795097585; x=1795702385; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mcl3KXtE5p6+YLN1bJl/hHTVhr8IkoxQ8CN8y4gi+vc=;
        b=U8wISKpEfumTeKrIS0Gth0DvZcdbYGRRk5zIvJQdH9VveHcNL90hvwrzkdnNKgGPAZ
         J6hqJGz/1UZ0I+C/SnncExbH2njfMzzmRDUN3+GEDoOHOSmKH5/gpVnIZRIA99HlWWCQ
         2h+uN9lzSb9QdTgLrptIZvDEbr1Ndw42MdQINZVSQoKkoQ69exNAi1vKUP6DfCj2mR6T
         vhL2dqyuYl0UDS6o1Q0SlRWnA1ixCVP0lTKH/3NSZy530ddseoDVCkCoJpZbdFYROdsL
         zMIh35iABDfwGphlI2Q0w9YgcMA2r9PceM5wfALlUaEOCzmXFVk5hqZGL+h/qrXDplQL
         RaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097585; x=1795702385;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Mcl3KXtE5p6+YLN1bJl/hHTVhr8IkoxQ8CN8y4gi+vc=;
        b=0OOGYUrW1cc982yGqvoPw57kfhv4nwJR8BlhSbPWxT6BHPHJcKAOP9U60JBWvaDWiA
         nbFYSyfRnU1MB8+bh3DoErhroJqmOVSV0Of9gft9fCixDr6zzcjMHl2n6cmlsqdTd2+u
         kPU6ij8mYI6mip4UZIpsg4XGnWLeThxKOOrQNq0+a9fw7jGq6BKhQNSxXZsq5jobdMjw
         RyxL2v+lZjU5VvxDNb0fyaOYL9VuMVsG9f2zU66e8TDOJov0+6Qt2aMpduDjviteC2GY
         DS+rQOduFB6M83buhjRdwOvpTTNWJA0+g+zX4/eJNGGuptUEpwekGYupWZjSGVwWckS2
         SmZg==
X-Forwarded-Encrypted: i=1; AL+hErEInByxBNga8dU+DsaMX4b0A+zuckPCe08LMzKO3WW3tB4dxFB1Czotvw4Y5zuchBFdudQtb5WsDyP8Vg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8zof/bU/59l6yD+fu9N4DeMQVuNLRuExiNEMEfq3LfCwZ3SWVC
	Eyd1NBVtK2VeK2hcAqEyblhOSFkP8ZBzAjTO4brA5ZtQw9/UONe8oUxhCjDXSY+mpP6mn4Q+JID
	a3nOWgwrQnZffJYQdUg==
X-Received: from wmdd13.prod.google.com ([2002:a05:600c:a20d:b0:4a1:fd4d:ad4e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3e07:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4bb7da447d2mr119732175e9.29.1795097584113;
 Thu, 19 Nov 2026 06:13:04 -0800 (PST)
Date: Thu, 19 Nov 2026 14:12:46 +0000
In-Reply-To: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=19692; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=iCLaeyrsucNMg94e9uNsawFrcIJhz8Y2cVxKFScyD2M=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/wPjjF7qstiLlnhqC2xPwx1+kSxZCGeKzAcFk
 qeMy22p+kOJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav8D4wAKCRAEWL7uWMY5
 RrvEEACNFUOIPtrB9jjX88Lxp31uII/pIk8T5+INuBsan03C+UYpp8TtscOfbxY7PKX/YqfyQ6+
 a8Uo2wrnAhweh/NsVXIUkI+obOvcmJz2hSzIKMJO433l4BXDm4kKsuDNC1Ov2xyyddLqvi4qei9
 nPONiWLNmniyxYe9jI7ifK805lHLp9JGLrGYqX4MewBcE2TPug9uP9gsaNTqzkKwB7KmScPSnY2
 cqhY1DwBxARP6bagyJTZeJv98yf81Eynunkxx+ENMEqxJiGK9U+p9SDSEGxbMHX+gvLj1XQ56rG
 D8zVeIkzkUb1E0h83jeRaoR7VX+pYa0sodtZLqjxXM/UH3KlcLZ5iOLv8oQZVM9mNBrbs7aUiLp
 A5DnJXnE6rEBiiUaZUIddhZRzpcbq83zQcE5/XOY5wUruTIbdlqx7FJNPGmeLLywR/kLbxiRyWO
 9KxNyqNxH0cQLpvqncDOTcZVZYgL8mcS+Ul2TsrQj9IpjTl1ys6tZKq4WaloexHm+oABuTf9S1K
 yRapzuHr2fqUn+zXsiEZC1YQN41Ntg3Eh3gpOhUKg5xAkvuuaAtVv7nDQJsFmowdLyxT7mwP+w3
 cn2RJkpTqZbnzAT0wMrXtLTmeDysq8clXlpiKaX/73U1SyneNobwp757ODq1Wkn9XU2S8lxwoRc IengUYHDqNMd5sQ==
X-Mailer: b4 0.14.3
Message-ID: <20261119-rust-workqueue-v4-5-707c68994940@google.com>
Subject: [PATCH v4 5/5] rust: workqueue: add ScopedWork for non-'static work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

From: Danilo Krummrich <dakr@kernel.org>

Add ScopedWork<'wq, T>, a work item wrapper bound to a specific
&'wq Queue whose destructor calls cancel_work_sync(), allowing T to
carry non-'static lifetimes. Ownership of the data is not transferred to
the workqueue; instead, the synchronous cancellation on drop guarantees
the work function is not running when the data is freed.

Each ScopedWork<'wq, T> is bound to a single Queue at construction and
enqueued via ScopedWork::enqueue() to uphold the non-reentrance
conditions documented in Documentation/core-api/workqueue.rst: queuing
an in-flight work item onto a different workqueue violates those
conditions, in which case cancel_work_sync() only waits for execution on
the last queued workqueue and may return while an earlier execution is
still running.

Because the cancellation guarantee only holds if the destructor runs
before the bound Queue or any lifetime in T expires, ScopedWork::new()
(and thus new_scoped_work!) is unsafe and requires that the resulting
value is never forgotten and is dropped before 'wq or T's lifetimes end.
In return, ScopedWork::enqueue() is a safe method.

ScopedWork does not use the Work/WorkItem machinery: it embeds the
work_struct directly and registers its own C callback, which recovers
the &ScopedWork<'_, T> via container_of!() and passes it to
ScopedWorkItem::run(). The work_struct, queue pointer, and user data
live in a private Inner<T> that is wrapped in Opaque as a whole, so that
the &mut Self held by the destructor while cancel_work_sync() waits does
not claim uniqueness over memory (including padding) that a worker
thread may still be reading through &ScopedWork<'_, T>.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Co-developed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/workqueue/mod.rs    |  13 ++
 rust/kernel/workqueue/scoped.rs | 410 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 423 insertions(+)

diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index 4f334dbf256a..d80fced7f333 100644
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
@@ -275,6 +282,12 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::workqueue_struct) -> &'a Queue
         unsafe { &*ptr.cast::<Queue>() }
     }
 
+    /// Obtain the raw `struct workqueue_struct` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::workqueue_struct {
+        self.0.get()
+    }
+
     /// Enqueues a work item.
     ///
     /// This may fail if the work item is already enqueued in a workqueue.
diff --git a/rust/kernel/workqueue/scoped.rs b/rust/kernel/workqueue/scoped.rs
new file mode 100644
index 000000000000..1f8c060241d6
--- /dev/null
+++ b/rust/kernel/workqueue/scoped.rs
@@ -0,0 +1,410 @@
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
+//! actually runs: the value must not be forgotten, and must be dropped before the bound [`Queue`]
+//! or any lifetime in the inner data expires. Once created, a [`ScopedWork`] can be enqueued onto
+//! its bound workqueue using the safe [`ScopedWork::enqueue`].
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
+//! struct MyWork<'a> {
+//!     value: &'a u32,
+//! }
+//!
+//! impl ScopedWorkItem for MyWork<'_> {
+//!     fn run(work: &ScopedWork<'_, Self>) {
+//!         pr_info!("value = {}\n", work.value);
+//!     }
+//! }
+//!
+//! let queue = Queue::new_unbound().build(c"my-wq")?;
+//! let value = 42;
+//!
+//! // Define `my_work` outside the `unsafe` block.
+//! let my_work = MyWork { value: &value };
+//! let work = KBox::pin_init(
+//!     // SAFETY: `work` is not forgotten and is dropped before `queue` and `value`.
+//!     unsafe { new_scoped_work!(&queue, "MyWork", my_work) },
+//!     GFP_KERNEL,
+//! )?;
+//!
+//! work.enqueue();
+//!
+//! // Dropping `work` calls `cancel_work_sync()`, ensuring the work item has finished or been
+//! // cancelled before `value` and `queue` are dropped.
+//! drop(work);
+//! # Ok::<(), Error>(())
+//! ```
+
+use crate::{
+    bindings,
+    container_of,
+    prelude::*,
+    sync::LockClassKey,
+    types::Opaque, //
+};
+
+use super::Queue;
+#[cfg(doc)]
+use super::Work;
+
+use pin_init::Wrapper;
+
+use core::{
+    marker::PhantomData,
+    ops::Deref,
+    ptr::NonNull, //
+};
+
+/// Trait for types that can be used as scoped work items.
+///
+/// Implementers define the work function that executes when the item is dequeued by a workqueue
+/// thread. Because `&Self` is shared with the workqueue worker thread while the work item is
+/// executing, implementers must be [`Sync`].
+///
+/// The callback receives a reference to the containing [`ScopedWork`], which provides access to
+/// the inner data via [`Deref`] and can be re-enqueued from within the work function using
+/// [`ScopedWork::enqueue`].
+pub trait ScopedWorkItem: Sized + Sync {
+    /// Called when the work item is executed.
+    fn run(work: &ScopedWork<'_, Self>);
+}
+
+/// The payload of a [`ScopedWork`].
+///
+/// # Invariants
+///
+/// - `queue` points to the valid [`Queue`] bound to the enclosing [`ScopedWork`].
+/// - `work` is an initialized `work_struct` whose work function is [`ScopedWork::run`] and is only
+///   ever enqueued onto `queue`.
+/// - An `Inner<T>` only ever exists inside a [`ScopedWork<'_, T>`].
+#[pin_data]
+struct Inner<T: ScopedWorkItem> {
+    queue: NonNull<Queue>,
+    #[pin]
+    work: Opaque<bindings::work_struct>,
+    #[pin]
+    data: T,
+}
+
+/// A scoped work item that cancels synchronously on drop.
+///
+/// `ScopedWork<'wq, T>` is bound to a single [`Queue`] with lifetime `'wq` and contains a
+/// `work_struct` and the user data `T`. Its destructor calls `cancel_work_sync()`, guaranteeing
+/// the work function is not running when the data is dropped.
+///
+/// This allows `T` to carry non-`'static` lifetimes.
+///
+/// Construct via [`new_scoped_work!`], which returns an `impl PinInit` suitable for embedding
+/// in-place inside other pinned structs. Because the soundness of [`ScopedWork::enqueue`] relies
+/// on the destructor running before the memory is reused or `'wq` or any lifetime in `T` expires,
+/// [`ScopedWork::new`] is `unsafe`.
+///
+/// # Examples
+///
+/// Self-re-enqueueing from within the work function:
+///
+/// ```
+/// use kernel::sync::atomic::{Atomic, Relaxed};
+/// use kernel::sync::Completion;
+/// use kernel::workqueue::{new_scoped_work, Queue, ScopedWork, ScopedWorkItem};
+///
+/// #[pin_data]
+/// struct RequeueWork<'a> {
+///     counter: &'a Atomic<u32>,
+///     #[pin]
+///     done: Completion,
+/// }
+///
+/// impl ScopedWorkItem for RequeueWork<'_> {
+///     fn run(work: &ScopedWork<'_, Self>) {
+///         if work.counter.fetch_add(1, Relaxed) < 2 {
+///             work.enqueue();
+///         } else {
+///             work.done.complete_all();
+///         }
+///     }
+/// }
+///
+/// let queue = Queue::new_ordered().build(c"requeue_wq")?;
+/// let counter = Atomic::new(0u32);
+/// let counter_ref = &counter;
+///
+/// // Define `requeue` outside the `unsafe` block.
+/// let requeue = pin_init!(RequeueWork {
+///     counter: counter_ref,
+///     done <- Completion::new(),
+/// });
+/// let work = KBox::pin_init(
+///     // SAFETY: `work` is not forgotten and is dropped before `queue` and `counter`.
+///     unsafe { new_scoped_work!(&queue, "RequeueWork", requeue) },
+///     GFP_KERNEL,
+/// )?;
+///
+/// work.enqueue();
+/// work.done.wait_for_completion();
+/// drop(work);
+///
+/// assert_eq!(counter.load(Relaxed), 3);
+/// # Ok::<(), Error>(())
+/// ```
+#[pin_data(PinnedDrop)]
+#[repr(transparent)]
+pub struct ScopedWork<'wq, T: ScopedWorkItem> {
+    /// The whole payload is wrapped in [`Opaque`] on purpose: while the destructor waits in
+    /// `cancel_work_sync()`, a worker thread may still be executing [`ScopedWorkItem::run`] with a
+    /// shared reference to this value (and e.g. calling [`ScopedWork::enqueue`]), concurrently with
+    /// the `&mut Self` held by `drop`. [`Opaque`] opts out of the uniqueness guarantee of that
+    /// `&mut`. Wrapping individual fields would not be enough, since the `&mut Self` would still
+    /// claim exclusive access to `queue` and the padding bytes.
+    ///
+    /// # Invariants
+    ///
+    /// - `inner` is always initialized.
+    /// - The `queue` field inside `inner` points to the [`Queue`] bound to this `ScopedWork`,
+    ///   which remains valid for `'wq`.
+    #[pin]
+    inner: Opaque<Inner<T>>,
+    _wq: PhantomData<&'wq Queue>,
+}
+
+// SAFETY: A `&ScopedWork<'_, T>` only hands out `&T` (via `Deref`, where `T: Sync` via
+// `ScopedWorkItem`), `&Queue` (via `queue()`, where `Queue: Sync`), and accesses the
+// `work_struct` only through the thread-safe C workqueue API.
+unsafe impl<T: ScopedWorkItem> Sync for ScopedWork<'_, T> {}
+
+// SAFETY: `Queue: Sync`, and the `work_struct` is only ever accessed through the
+// thread-safe C workqueue API. Moving `ScopedWork` transfers ownership of `T` (so `T` may
+// be dropped on the destination thread), which requires `T: Send`, while a worker thread
+// may concurrently access `&T` in `ScopedWork::run`, which is sound because
+// `T: ScopedWorkItem` implies `T: Sync`.
+unsafe impl<T: ScopedWorkItem + Send> Send for ScopedWork<'_, T> {}
+
+impl<T: ScopedWorkItem> Deref for ScopedWork<'_, T> {
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
+impl<'wq, T: ScopedWorkItem> ScopedWork<'wq, T> {
+    /// Creates a pin-initializer for a new scoped work item bound to `queue`.
+    ///
+    /// Use [`new_scoped_work!`] to automatically provide the lock class key.
+    ///
+    /// # Safety
+    ///
+    /// The caller must ensure that the destructor of the initialized `ScopedWork<'wq, T>` runs
+    /// before the memory it lives in is reused and before `'wq` or any lifetime in `T` expires.
+    /// In particular, the value must not be leaked, e.g. via [`core::mem::forget`] or by leaking
+    /// the allocation that contains it.
+    #[inline]
+    pub unsafe fn new<E>(
+        queue: &'wq Queue,
+        name: &'static CStr,
+        key: Pin<&'static LockClassKey>,
+        init: impl PinInit<T, E>,
+    ) -> impl PinInit<Self, E> {
+        // INVARIANT: `inner` is initialized with a legal value of type `Inner<T>`, whose `queue`
+        // points to `queue: &'wq Queue` (valid for `'wq`).
+        try_pin_init!(Self {
+            // INVARIANT:
+            // - `queue` points to the valid `Queue` bound to this `ScopedWork`.
+            // - `work` is initialized via `init_work_with_key` with `Self::run` as the work
+            //   function and is only ever enqueued onto `queue`.
+            // - This `Inner<T>` is constructed directly inside `ScopedWork<'wq, T>`.
+            inner <- Opaque::pin_init(try_pin_init!(Inner::<T> {
+                queue: NonNull::from(queue),
+                // Initialize `data` first so that `init_work_with_key` is not called if `init`
+                // fails.
+                data <- init,
+                work <- Opaque::try_ffi_init(|slot| {
+                    // SAFETY: `slot` is a valid pointer to uninitialized memory for a
+                    // `work_struct`, and `Self::run` is a valid work function for a `work_struct`
+                    // embedded in an `Inner<T>` that is embedded in a `ScopedWork<'wq, T>`.
+                    unsafe {
+                        bindings::init_work_with_key(
+                            slot,
+                            Some(Self::run),
+                            name.as_char_ptr(),
+                            key.as_ptr(),
+                        )
+                    };
+                    Ok::<(), E>(())
+                }),
+            }? E)),
+            _wq: PhantomData,
+        }? E)
+    }
+
+    /// Returns the workqueue this work item is bound to.
+    #[inline]
+    pub fn queue(&self) -> &'wq Queue {
+        // SAFETY: `inner` is always initialized (type invariant), `queue` is never mutated
+        // after initialization, and the safety contract of `ScopedWork::new` ensures `'wq` has
+        // not expired while `self` is alive.
+        unsafe { (*self.inner.get()).queue.as_ref() }
+    }
+
+    /// Enqueues this work item on its bound workqueue.
+    ///
+    /// Returns `false` if the work item is already pending on the workqueue.
+    ///
+    /// The work item will be submitted using `WORK_CPU_UNBOUND`.
+    #[inline]
+    pub fn enqueue(&self) -> bool {
+        // SAFETY:
+        // - `self.queue().as_raw()` is a valid `workqueue_struct` pointer because `'wq` has
+        //   not expired (by the safety contract of `ScopedWork::new`).
+        // - `self.raw_work()` is a valid `work_struct` initialized with `Self::run` (type
+        //   invariant).
+        // - Because `self` is only ever enqueued onto `self.queue()` and never migrated across
+        //   workqueues, `cancel_work_sync()` in `PinnedDrop::drop` is guaranteed to wait for
+        //   any running execution of `Self::run` to complete before `drop` returns; and
+        //   `ScopedWork::new` guarantees `drop` runs before the backing memory is reused or
+        //   `'wq` or any lifetime in `T` expires.
+        // - `T: ScopedWorkItem` guarantees `T: Sync`, so sharing `&T` with the worker thread is
+        //   sound.
+        unsafe {
+            bindings::queue_work_on(
+                bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::c_int,
+                self.queue().as_raw(),
+                self.raw_work(),
+            )
+        }
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
+    /// `ptr` must point to the `work` field of the `Inner<T>` of a live `ScopedWork<'wq, T>`.
+    unsafe extern "C" fn run(ptr: *mut bindings::work_struct) {
+        // SAFETY: `Opaque<T>` is `#[repr(transparent)]`, and by the safety requirements `ptr`
+        // points to the `work` field of an `Inner<T>`.
+        let inner =
+            unsafe { container_of!(ptr.cast::<Opaque<bindings::work_struct>>(), Inner<T>, work) };
+
+        // SAFETY: `Inner<T>` only ever exists inside a `ScopedWork<'wq, T>` (type invariant), and
+        // both `Opaque` and `ScopedWork` are `#[repr(transparent)]`, so `inner` is also a valid
+        // pointer to the containing `ScopedWork<'wq, T>`. By the safety requirements it is live;
+        // its destructor calls `cancel_work_sync()` before the memory is released, so it stays
+        // live for the duration of this call. Moreover, `Self: Sync` (from `T: ScopedWorkItem` and
+        // `Queue: Sync`), so passing `&Self` on the worker thread is sound.
+        T::run(unsafe { &*inner.cast::<Self>() });
+    }
+}
+
+#[pinned_drop]
+impl<T: ScopedWorkItem> PinnedDrop for ScopedWork<'_, T> {
+    #[inline]
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: `raw_work()` returns a valid `work_struct`. Because `work` is only ever
+        // enqueued onto its single bound `queue` (type invariant), `cancel_work_sync()` is
+        // guaranteed to wait for any running execution of `Self::run` to complete before returning.
+        unsafe { bindings::cancel_work_sync(self.raw_work()) };
+
+        // SAFETY: `raw_work()` returns a valid `work_struct` that has been cancelled and will not
+        // be used again.
+        unsafe { bindings::destroy_work_on_stack(self.raw_work()) };
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
+/// initialized `ScopedWork` must run before the memory it lives in is reused and before the bound
+/// [`Queue`]'s lifetime or any lifetime in the inner type expires.
+///
+/// # Examples
+///
+/// ```
+/// use kernel::workqueue::{
+///     new_scoped_work,
+///     OwnedQueue,
+///     Queue,
+///     ScopedWork,
+///     ScopedWorkItem,
+/// };
+///
+/// struct MyWork {
+///     value: u32,
+/// }
+///
+/// impl ScopedWorkItem for MyWork {
+///     fn run(work: &ScopedWork<'_, Self>) {
+///         pr_info!("value = {}\n", work.value);
+///     }
+/// }
+///
+/// #[pin_data]
+/// struct MyData {
+///     #[pin]
+///     work: ScopedWork<'wq, MyWork>,
+///     wq: OwnedQueue,
+/// }
+///
+/// fn init_data() -> impl PinInit<MyData, Error> {
+///     // Define `my_work` outside the `unsafe` block.
+///     let my_work = MyWork { value: 7 };
+///     try_pin_init!(MyData {
+///         wq: Queue::new_unbound().build(c"my-wq")?,
+///         // SAFETY: `MyData` is only ever pin-initialized, and `work` is declared before `wq`,
+///         // so `work` is dropped before `wq`.
+///         work <- unsafe { new_scoped_work!(wq, "MyWork", my_work) },
+///     })
+/// }
+/// # pin_init::stack_try_pin_init!(let data =? init_data());
+/// # data.work().enqueue();
+/// # Ok::<(), Error>(())
+/// ```
+#[macro_export]
+macro_rules! new_scoped_work {
+    ($queue:expr, $name:literal, $init:expr $(,)?) => {
+        $crate::workqueue::ScopedWork::new(
+            $queue,
+            $crate::c_str!($name),
+            $crate::static_lock_class!(),
+            $init,
+        )
+    };
+}
+pub use new_scoped_work;

-- 
2.56.1.708.g77570a6a1d-goog

