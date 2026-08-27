Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9951E3F105D
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 21:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787866816; cv=pass; b=Dz6+wZ5fJo/ZIL+AaK7bD+9DS2g5+Fw4deZNPX7dLbh0hNX/lc2ZAixvBN0w7yAxsTYe49mDaopqyRCV36rQTy6ISThF5iRpKCOtMGzjyKptu41r/NN/DswG7S+ShMaidoDHKUm5omgNiSulEOn6EulKc0Do0At3UTYLaW7N298=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787866816; c=relaxed/simple;
	bh=wCOZgLmWDdBot6IK8CsDbvJ5Pq3VPyXZCQnnavsnt3I=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ntX0XmKrebRFkb3+HbJXEVgwRsRQ2KAjv8R6IpakxEkwJjyARFeYq49TkOUf4OOLXiYSk7B+DrLvdZDGRFKiqrLLmR+70w934XCeIYPZHJxdDbj8/rPQmqFXjQKmklKCDcFLW8jmQRHR1AbN0/muJWNSCcPxrbAMdnwfJlclRkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=gaTduDR0; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="gaTduDR0"
ARC-Seal: i=1; a=rsa-sha256; t=1787866801; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E0fHXY+UtvBcGAma5LOFFnP+TJjUdG0LXZ4CqgvfyR8GHUTaQOXWFgm9mRPhVdg3WrZrI0RU6G1w/Q/B7cKZBW2ahHiIrA+L6+2x+TDVXkvkjlMuWZ4ebCgi23oq/WMtELwFBiCjRPVDQYZJYoKJN8GH3rRgKHV7Dsx6lSh0jKA=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1787866801; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ouJ4pnIcjU5aisMBl2GcMf/o5PCWQtQIdfmg1FkijNY=; 
	b=j3p1qgFjfSNVkmMXPwR+NbDs1UujquF/bhxPBSJbgewC311TZ93jYVXfbz+A6FjZeVJOfGwFcpXEjQfLEKLZ1DZl96OSGJ/IdhFeax+yBZpWjukI9tayNiHZAlHOqfPNkfDUTzSqf6C1J78IgvfhzgsD+9qKY4vWUIA6b48g8RU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1787866801;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=ouJ4pnIcjU5aisMBl2GcMf/o5PCWQtQIdfmg1FkijNY=;
	b=gaTduDR06svGWN9xI5vSQ2MHNAUhSQp8EuCtclGdI8KY9jqaM4pbiuHd8jbApZ8C
	XFdK8lVq5d2bY4U/mAy6fj9OwaPW3FK7Cv5iehX4chqE0mXGkmV0nFRyA5uyflonL4A
	ztLb7yphzOnBgc+VM+iJLpmUidh4hLmUaccaGwmo=
Received: by mx.zohomail.com with SMTPS id 1787866799207937.3277570745092;
	Thu, 27 Aug 2026 14:39:59 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.700.81\))
Subject: Re: [PATCH v2 5/6] rust: workqueue: add ScopedQueue for lifetime
 bound items
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260807165252.3849875-6-dakr@kernel.org>
Date: Thu, 27 Aug 2026 18:39:40 -0300
Cc: tj@kernel.org,
 jiangshanlai@gmail.com,
 aliceryhl@google.com,
 ojeda@kernel.org,
 boqun@kernel.org,
 gary@garyguo.net,
 bjorn3_gh@protonmail.com,
 lossin@kernel.org,
 a.hindborg@kernel.org,
 tmgross@umich.edu,
 tamird@kernel.org,
 acourbot@nvidia.com,
 work@onurozkan.dev,
 jhubbard@nvidia.com,
 rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
Content-Transfer-Encoding: quoted-printable
Message-Id: <AC117B3B-1C56-4EB5-A6CB-61670614E12A@collabora.com>
References: <20260807165252.3849875-1-dakr@kernel.org>
 <20260807165252.3849875-6-dakr@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3826.700.81)
X-ZohoMailClient: External



> On 7 Aug 2026, at 13:52, Danilo Krummrich <dakr@kernel.org> wrote:
>=20
> From: Onur =C3=96zkan <work@onurozkan.dev>
>=20
> Add a workqueue wrapper for work items that are not 'static.
>=20
> Tyr reset work is queued from a handle that owns a Controller<'bound>
> where the work item holds references tied to the lifetime of the bound
> device and its mapped IO state. The existing API only accepts 'static
> work items which cannot express that relationship.
>=20
> Introduce ScopedQueue for this case. It owns the underlying workqueue
> and ties enqueued work to the queue lifetime so borrowed state cannot
> outlive the queue that may still run it.
>=20
> Construction is unsafe because the queue must not be leaked.
>=20
> `compile_fail` doc-tests are ignored for now as KUnit doesn't support
> that. Enabling those tests as regular code block would raise this =
error:
>=20
>    ERROR:root:error[E0597]: `data` does not live long enough
> --> rust/doctests_kernel_generated.rs:22029:44
>  |
>    22027 |         let data =3D ();
>  |             ---- binding `data` declared here
>    22028 |         // SAFETY: Queue is not leaked.
>    22029 |         queue =3D unsafe { new_queue(&data)? };
>  |                                            ^^^^^ borrowed value =
does not live long enough
>    22030 |     }
>  |     - `data` dropped here while still borrowed
>    ...
>    22034 | }
>  | - borrow might be used here, when `queue` is dropped and runs the =
`Drop` code for type `ScopedQueue`
>  |
>  =3D note: values in a scope are dropped in the opposite order they =
are defined
>=20
> which is exactly the constraint ScopedQueue is meant to enforce.
>=20
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>
> [ Move from scoped_queue.rs to scoped.rs, which can be shared with
>  ScopedWork; add missing inline annotations. - Danilo ]
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
> rust/kernel/workqueue/mod.rs    |   3 +
> rust/kernel/workqueue/scoped.rs | 190 ++++++++++++++++++++++++++++++++
> 2 files changed, 193 insertions(+)
> create mode 100644 rust/kernel/workqueue/scoped.rs
>=20
> diff --git a/rust/kernel/workqueue/mod.rs =
b/rust/kernel/workqueue/mod.rs
> index 8eb2d037be83..551fa1401b85 100644
> --- a/rust/kernel/workqueue/mod.rs
> +++ b/rust/kernel/workqueue/mod.rs
> @@ -212,6 +212,9 @@
> mod builder;
> pub use self::builder::Builder;
>=20
> +mod scoped;
> +pub use self::scoped::ScopedQueue;
> +
> /// Creates a [`Work`] initialiser with the given name and a =
newly-created lock class.
> #[macro_export]
> macro_rules! new_work {
> diff --git a/rust/kernel/workqueue/scoped.rs =
b/rust/kernel/workqueue/scoped.rs
> new file mode 100644
> index 000000000000..18a4b6f6cf18
> --- /dev/null
> +++ b/rust/kernel/workqueue/scoped.rs
> @@ -0,0 +1,190 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! Lifetime-scoped workqueues.
> +//!
> +//! Provides [`ScopedQueue`] for work items that may borrow data with =
some
> +//! non-`'static` lifetime.
> +//!
> +//! Unlike [`Queue`] which only accepts `'static` work items, =
[`ScopedQueue`]
> +//! owns its underlying queue and relies on that queue being dropped =
to drain
> +//! pending and running work before borrowed data can go out of =
scope.
> +//!
> +//! TODO: Remove `ignore` once KUnit supports `compile_fail` on =
doc-tests.
> +//! ```compile_fail,ignore
> +//! use kernel::prelude::*;
> +//! use kernel::workqueue::ScopedQueue;
> +//!
> +//! /// # Safety
> +//! ///
> +//! /// Returned queue must not be leaked.
> +//! unsafe fn new_queue<'bound>(_: &'bound ()) -> =
Result<ScopedQueue<'bound>> {

nit: is it me, or =E2=80=9Cbound=E2=80=9D sounds out of place here? =
Perhaps =E2=80=99scope instead?

Same comment throughout the whole example.

> +//!     // SAFETY: Caller guarantees that the returned queue is not =
leaked.
> +//!     unsafe { ScopedQueue::new(c"scoped_queue") }
> +//! }
> +//!
> +//! fn queue_outlives_borrowed_data() -> Result {
> +//!     let queue;
> +//!
> +//!     {
> +//!         let data =3D ();
> +//!         // SAFETY: Queue is not leaked.
> +//!         queue =3D unsafe { new_queue(&data)? };
> +//!     }
> +//!     // Here the `compile_fail` is fulfilled as `queue` would be =
dropped
> +//!     // after `data`.
> +//!     Ok(())
> +//! }
> +//! ```
> +//!
> +//! TODO: Remove `ignore` once KUnit supports `compile_fail` on =
doc-tests.
> +//! ```compile_fail,ignore
> +//! use kernel::prelude::*;
> +//! use kernel::sync::Arc;
> +//! use kernel::workqueue::{
> +//!     impl_has_work,
> +//!     new_work,
> +//!     ScopedQueue,
> +//!     Work,
> +//!     WorkItem,
> +//! };
> +//!
> +//! #[pin_data]
> +//! struct BorrowedWork<'bound> {
> +//!     data: &'bound (),
> +//!     #[pin]
> +//!     work: Work<BorrowedWork<'bound>>,
> +//! }
> +//!
> +//! impl_has_work! {
> +//!     impl{'bound} HasWork<BorrowedWork<'bound>> for =
BorrowedWork<'bound> { self.work }
> +//! }
> +//!
> +//! impl<'bound> WorkItem for BorrowedWork<'bound> {
> +//!     type Pointer =3D Arc<Self>;
> +//!
> +//!     fn run(_this: Arc<Self>) {}
> +//! }
> +//!
> +//! impl<'bound> BorrowedWork<'bound> {
> +//!     fn new(data: &'bound ()) -> Result<Arc<Self>> {
> +//!         Arc::pin_init(
> +//!             pin_init!(Self {
> +//!                 data,
> +//!                 work <- new_work!("BorrowedWork::work"),
> +//!             }),
> +//!             GFP_KERNEL,
> +//!         )
> +//!     }
> +//! }
> +//!
> +//! struct Handle<'bound> {
> +//!     work: Arc<BorrowedWork<'bound>>,
> +//!     wq: ScopedQueue<'bound>,
> +//! }
> +//!
> +//! impl<'bound> Handle<'bound> {
> +//!     /// # Safety
> +//!     ///
> +//!     /// Returned handle must not be leaked.
> +//!     unsafe fn new(data: &'bound ()) -> Result<Self> {
> +//!         Ok(Self {
> +//!             work: BorrowedWork::new(data)?,
> +//!             // SAFETY: Caller guarantees that the returned handle =
is not leaked.
> +//!             wq: unsafe { ScopedQueue::new(c"handle_wq")? },
> +//!         })
> +//!     }
> +//! }
> +//!
> +//! fn handle_outlives_borrowed_data() -> Result {
> +//!     let handle;
> +//!
> +//!     {
> +//!         let data =3D ();
> +//!         // SAFETY: Handle is not leaked.
> +//!         handle =3D unsafe { Handle::new(&data)? };
> +//!
> +//!         let _ =3D handle.wq.enqueue(handle.work.clone());
> +//!     }
> +//!     // Here the `compile_fail` is fulfilled as `handle` would be =
dropped
> +//!     // after `data`.
> +//!     Ok(())
> +//! }
> +//! ```
> +
> +use super::{
> +    OwnedQueue,
> +    Queue,
> +    RawWorkItem, //
> +};
> +
> +use crate::{
> +    bindings,
> +    ffi,
> +    prelude::*, //
> +};
> +
> +use core::marker::PhantomData;
> +
> +/// An owned workqueue that can enqueue work items borrowing from =
`'scope`.
> +///
> +/// A `ScopedQueue` must not outlive data borrowed by its work items.
> +pub struct ScopedQueue<'scope> {
> +    inner: OwnedQueue,
> +    _scope: PhantomData<&'scope mut &'scope ()>,
> +}
> +
> +impl<'scope> ScopedQueue<'scope> {
> +    /// Creates an ordered scoped workqueue.
> +    ///
> +    /// # Safety
> +    ///
> +    /// The caller must not leak the returned queue or otherwise =
prevent its
> +    /// [`Drop`] implementation from running since dropping the queue =
drains
> +    /// pending and running work that may borrow from `'scope`.
> +    #[inline]
> +    pub unsafe fn new(name: &'static CStr) -> Result<Self> {

Does this really need to be =E2=80=99static?

> +        Ok(Self {
> +            inner: Queue::new_ordered().build(name)?,
> +            _scope: PhantomData,
> +        })
> +    }
> +
> +    /// Enqueues a work item on this scoped queue.
> +    #[inline]
> +    pub fn enqueue<W, const ID: u64>(&self, work: W) -> =
W::EnqueueOutput
> +    where
> +        W: RawWorkItem<ID> + Send + 'scope,
> +    {
> +        let queue_ptr =3D self.inner.0.get();
> +
> +        // SAFETY:
> +        // - Closure returns `false` only if `queue_work_on` returns =
`false`
> +        //   and that means `work_ptr` is already in a workqueue.
> +        //
> +        // - `W: 'scope` and dropck keep borrowed data alive until =
this queue is
> +        //   dropped. The constructor requires that the queue is not =
leaked and
> +        //   dropping `inner` drains pending and running work so the =
function
> +        //   pointer is not called after any lifetime in `W` expires.
> +        //
> +        // - The last requirement of `__enqueue` is not relevant here =
because `W`
> +        //   is `Send`.
> +        unsafe {
> +            work.__enqueue(move |work_ptr| {
> +                bindings::queue_work_on(
> +                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as =
ffi::c_int,
> +                    queue_ptr,
> +                    work_ptr,
> +                )
> +            })
> +        }
> +    }
> +}
> +
> +impl Drop for ScopedQueue<'_> {
> +    #[inline]
> +    fn drop(&mut self) {
> +        // This impl makes dropck require `'scope` to outlive =
`OwnedQueue`.
> +        // See: =
https://doc.rust-lang.org/nomicon/phantom-data.html#generic-parameters-and=
-drop-checking
> +        let _ =3D &self._scope;
> +    }
> +}
> --=20
> 2.55.0
>=20

Would a conversion from OwnedQueue to ScopedQueue
make sense in the future?

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=
