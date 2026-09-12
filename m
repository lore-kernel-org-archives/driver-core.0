Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EB6837F313
	for <driver-core@lists.linux.dev>; Sat, 12 Sep 2026 07:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789199961; cv=none; b=ecc2+ImD4hVbNIN3wTV36Hv/ErHFKqDDp0pgaTdNWuqw+mtBz3CSGXz3v+TwKSBLrHrS9Clh/cAAUOWOSsCDBRLYKdaJCFTFNEEmTIOMFOLXEJeNtkOVGXBiSn7Ilg9NV0E4SoEoX9EPX1xHbTAogZgV/55dMI3bmgHQvXdK+6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789199961; c=relaxed/simple;
	bh=pDQrQguQSlaPhR+a0oxdJHKngZ+uGL7wsuc4ncPR0KY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ZmMuTiemKlX1PO3DqI/01LrSRCxUmAUccGin2+MvNNNeTixaAObA69zwyaMrXG7FQsJbuTC3Mf6dq6mHXoAMwyyLo5I1ybcqJVVOCxcXiIReqE6RjcvflKIT+Y3BhvGVY1+grxLqS82mJIWL7ujU9LCQ88uu0AtnyNrgUtyJxMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=CHikJR92; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="CHikJR92"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1789199955; x=1789459155;
	bh=oPqvRqdTw4PjG0YO3a1qkc3sLfEWCvuKueebkOVWgxQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=CHikJR92tHudH0L2HQSny8+msMDoZyIC8im5L+ZfQkQZ0vZ2YsaUfuCLL0dV6B80E
	 OVxycRTuwk14NQuvU0kIlRtWm52LhEkGlA/Mx3rWaedqTf0l2OT/pP9Ivj5AyYsfi/
	 fN2QkULwjwWPO+DhTEYjUYUUxnxIgJ5hI+ms83cNk6RQMDOH84owsRgqJHpB82LbPk
	 0MSZjjmkDRW3fv5txwtWaJECndGtXmpbe6f1Qe3dcOhgtMUP9XkBlsztSvSuEzYx8O
	 aaO5TTlkhDQqf/rl4KskQLdJWyWfT0AG20dRPoFZrtqXHycAaj4XX6hhB0uNOshxvg
	 F/+iRmEfUgSkQ==
X-Pm-Submission-Id: 4hhkML6jFbz2ScN7
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	tj@kernel.org,
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
	jhubbard@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v2 5/6] rust: workqueue: add ScopedQueue for lifetime bound items
Date: Sat, 12 Sep 2026 10:58:55 +0300
Message-ID: <20260912075909.72005-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <AC117B3B-1C56-4EB5-A6CB-61670614E12A@collabora.com>
References: <20260807165252.3849875-1-dakr@kernel.org> <20260807165252.3849875-6-dakr@kernel.org> <AC117B3B-1C56-4EB5-A6CB-61670614E12A@collabora.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 27 Aug 2026 18:39:40 -0300=0D
Daniel Almeida <daniel.almeida@collabora.com> wrote:=0D
=0D
> =0D
> =0D
> > On 7 Aug 2026, at 13:52, Danilo Krummrich <dakr@kernel.org> wrote:=0D
> > =0D
> > From: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > =0D
> > Add a workqueue wrapper for work items that are not 'static.=0D
> > =0D
> > Tyr reset work is queued from a handle that owns a Controller<'bound>=0D
> > where the work item holds references tied to the lifetime of the bound=
=0D
> > device and its mapped IO state. The existing API only accepts 'static=0D
> > work items which cannot express that relationship.=0D
> > =0D
> > Introduce ScopedQueue for this case. It owns the underlying workqueue=0D
> > and ties enqueued work to the queue lifetime so borrowed state cannot=0D
> > outlive the queue that may still run it.=0D
> > =0D
> > Construction is unsafe because the queue must not be leaked.=0D
> > =0D
> > `compile_fail` doc-tests are ignored for now as KUnit doesn't support=0D
> > that. Enabling those tests as regular code block would raise this error=
:=0D
> > =0D
> >    ERROR:root:error[E0597]: `data` does not live long enough=0D
> > --> rust/doctests_kernel_generated.rs:22029:44=0D
> >  |=0D
> >    22027 |         let data =3D ();=0D
> >  |             ---- binding `data` declared here=0D
> >    22028 |         // SAFETY: Queue is not leaked.=0D
> >    22029 |         queue =3D unsafe { new_queue(&data)? };=0D
> >  |                                            ^^^^^ borrowed value does=
 not live long enough=0D
> >    22030 |     }=0D
> >  |     - `data` dropped here while still borrowed=0D
> >    ...=0D
> >    22034 | }=0D
> >  | - borrow might be used here, when `queue` is dropped and runs the `D=
rop` code for type `ScopedQueue`=0D
> >  |=0D
> >  =3D note: values in a scope are dropped in the opposite order they are=
 defined=0D
> > =0D
> > which is exactly the constraint ScopedQueue is meant to enforce.=0D
> > =0D
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>=0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > [ Move from scoped_queue.rs to scoped.rs, which can be shared with=0D
> >  ScopedWork; add missing inline annotations. - Danilo ]=0D
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>=0D
> > ---=0D
> > rust/kernel/workqueue/mod.rs    |   3 +=0D
> > rust/kernel/workqueue/scoped.rs | 190 ++++++++++++++++++++++++++++++++=
=0D
> > 2 files changed, 193 insertions(+)=0D
> > create mode 100644 rust/kernel/workqueue/scoped.rs=0D
> > =0D
> > diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.r=
s=0D
> > index 8eb2d037be83..551fa1401b85 100644=0D
> > --- a/rust/kernel/workqueue/mod.rs=0D
> > +++ b/rust/kernel/workqueue/mod.rs=0D
> > @@ -212,6 +212,9 @@=0D
> > mod builder;=0D
> > pub use self::builder::Builder;=0D
> > =0D
> > +mod scoped;=0D
> > +pub use self::scoped::ScopedQueue;=0D
> > +=0D
> > /// Creates a [`Work`] initialiser with the given name and a newly-crea=
ted lock class.=0D
> > #[macro_export]=0D
> > macro_rules! new_work {=0D
> > diff --git a/rust/kernel/workqueue/scoped.rs b/rust/kernel/workqueue/sc=
oped.rs=0D
> > new file mode 100644=0D
> > index 000000000000..18a4b6f6cf18=0D
> > --- /dev/null=0D
> > +++ b/rust/kernel/workqueue/scoped.rs=0D
> > @@ -0,0 +1,190 @@=0D
> > +// SPDX-License-Identifier: GPL-2.0=0D
> > +=0D
> > +//! Lifetime-scoped workqueues.=0D
> > +//!=0D
> > +//! Provides [`ScopedQueue`] for work items that may borrow data with =
some=0D
> > +//! non-`'static` lifetime.=0D
> > +//!=0D
> > +//! Unlike [`Queue`] which only accepts `'static` work items, [`Scoped=
Queue`]=0D
> > +//! owns its underlying queue and relies on that queue being dropped t=
o drain=0D
> > +//! pending and running work before borrowed data can go out of scope.=
=0D
> > +//!=0D
> > +//! TODO: Remove `ignore` once KUnit supports `compile_fail` on doc-te=
sts.=0D
> > +//! ```compile_fail,ignore=0D
> > +//! use kernel::prelude::*;=0D
> > +//! use kernel::workqueue::ScopedQueue;=0D
> > +//!=0D
> > +//! /// # Safety=0D
> > +//! ///=0D
> > +//! /// Returned queue must not be leaked.=0D
> > +//! unsafe fn new_queue<'bound>(_: &'bound ()) -> Result<ScopedQueue<'=
bound>> {=0D
> =0D
> nit: is it me, or =E2=80=9Cbound=E2=80=9D sounds out of place here? Perha=
ps =E2=80=99scope instead?=0D
> =0D
> Same comment throughout the whole example.=0D
=0D
We shouldn't use "bound" lifetime in this implementation. I will fix them i=
n the=0D
next version.=0D
=0D
> =0D
> > +//!     // SAFETY: Caller guarantees that the returned queue is not le=
aked.=0D
> > +//!     unsafe { ScopedQueue::new(c"scoped_queue") }=0D
> > +//! }=0D
> > +//!=0D
> > +//! fn queue_outlives_borrowed_data() -> Result {=0D
> > +//!     let queue;=0D
> > +//!=0D
> > +//!     {=0D
> > +//!         let data =3D ();=0D
> > +//!         // SAFETY: Queue is not leaked.=0D
> > +//!         queue =3D unsafe { new_queue(&data)? };=0D
> > +//!     }=0D
> > +//!     // Here the `compile_fail` is fulfilled as `queue` would be dr=
opped=0D
> > +//!     // after `data`.=0D
> > +//!     Ok(())=0D
> > +//! }=0D
> > +//! ```=0D
> > +//!=0D
> > +//! TODO: Remove `ignore` once KUnit supports `compile_fail` on doc-te=
sts.=0D
> > +//! ```compile_fail,ignore=0D
> > +//! use kernel::prelude::*;=0D
> > +//! use kernel::sync::Arc;=0D
> > +//! use kernel::workqueue::{=0D
> > +//!     impl_has_work,=0D
> > +//!     new_work,=0D
> > +//!     ScopedQueue,=0D
> > +//!     Work,=0D
> > +//!     WorkItem,=0D
> > +//! };=0D
> > +//!=0D
> > +//! #[pin_data]=0D
> > +//! struct BorrowedWork<'bound> {=0D
> > +//!     data: &'bound (),=0D
> > +//!     #[pin]=0D
> > +//!     work: Work<BorrowedWork<'bound>>,=0D
> > +//! }=0D
> > +//!=0D
> > +//! impl_has_work! {=0D
> > +//!     impl{'bound} HasWork<BorrowedWork<'bound>> for BorrowedWork<'b=
ound> { self.work }=0D
> > +//! }=0D
> > +//!=0D
> > +//! impl<'bound> WorkItem for BorrowedWork<'bound> {=0D
> > +//!     type Pointer =3D Arc<Self>;=0D
> > +//!=0D
> > +//!     fn run(_this: Arc<Self>) {}=0D
> > +//! }=0D
> > +//!=0D
> > +//! impl<'bound> BorrowedWork<'bound> {=0D
> > +//!     fn new(data: &'bound ()) -> Result<Arc<Self>> {=0D
> > +//!         Arc::pin_init(=0D
> > +//!             pin_init!(Self {=0D
> > +//!                 data,=0D
> > +//!                 work <- new_work!("BorrowedWork::work"),=0D
> > +//!             }),=0D
> > +//!             GFP_KERNEL,=0D
> > +//!         )=0D
> > +//!     }=0D
> > +//! }=0D
> > +//!=0D
> > +//! struct Handle<'bound> {=0D
> > +//!     work: Arc<BorrowedWork<'bound>>,=0D
> > +//!     wq: ScopedQueue<'bound>,=0D
> > +//! }=0D
> > +//!=0D
> > +//! impl<'bound> Handle<'bound> {=0D
> > +//!     /// # Safety=0D
> > +//!     ///=0D
> > +//!     /// Returned handle must not be leaked.=0D
> > +//!     unsafe fn new(data: &'bound ()) -> Result<Self> {=0D
> > +//!         Ok(Self {=0D
> > +//!             work: BorrowedWork::new(data)?,=0D
> > +//!             // SAFETY: Caller guarantees that the returned handle =
is not leaked.=0D
> > +//!             wq: unsafe { ScopedQueue::new(c"handle_wq")? },=0D
> > +//!         })=0D
> > +//!     }=0D
> > +//! }=0D
> > +//!=0D
> > +//! fn handle_outlives_borrowed_data() -> Result {=0D
> > +//!     let handle;=0D
> > +//!=0D
> > +//!     {=0D
> > +//!         let data =3D ();=0D
> > +//!         // SAFETY: Handle is not leaked.=0D
> > +//!         handle =3D unsafe { Handle::new(&data)? };=0D
> > +//!=0D
> > +//!         let _ =3D handle.wq.enqueue(handle.work.clone());=0D
> > +//!     }=0D
> > +//!     // Here the `compile_fail` is fulfilled as `handle` would be d=
ropped=0D
> > +//!     // after `data`.=0D
> > +//!     Ok(())=0D
> > +//! }=0D
> > +//! ```=0D
> > +=0D
> > +use super::{=0D
> > +    OwnedQueue,=0D
> > +    Queue,=0D
> > +    RawWorkItem, //=0D
> > +};=0D
> > +=0D
> > +use crate::{=0D
> > +    bindings,=0D
> > +    ffi,=0D
> > +    prelude::*, //=0D
> > +};=0D
> > +=0D
> > +use core::marker::PhantomData;=0D
> > +=0D
> > +/// An owned workqueue that can enqueue work items borrowing from `'sc=
ope`.=0D
> > +///=0D
> > +/// A `ScopedQueue` must not outlive data borrowed by its work items.=
=0D
> > +pub struct ScopedQueue<'scope> {=0D
> > +    inner: OwnedQueue,=0D
> > +    _scope: PhantomData<&'scope mut &'scope ()>,=0D
> > +}=0D
> > +=0D
> > +impl<'scope> ScopedQueue<'scope> {=0D
> > +    /// Creates an ordered scoped workqueue.=0D
> > +    ///=0D
> > +    /// # Safety=0D
> > +    ///=0D
> > +    /// The caller must not leak the returned queue or otherwise preve=
nt its=0D
> > +    /// [`Drop`] implementation from running since dropping the queue =
drains=0D
> > +    /// pending and running work that may borrow from `'scope`.=0D
> > +    #[inline]=0D
> > +    pub unsafe fn new(name: &'static CStr) -> Result<Self> {=0D
> =0D
> Does this really need to be =E2=80=99static?=0D
=0D
It doesn't, will fix it in the next version.=0D
=0D
> =0D
> > +        Ok(Self {=0D
> > +            inner: Queue::new_ordered().build(name)?,=0D
> > +            _scope: PhantomData,=0D
> > +        })=0D
> > +    }=0D
> > +=0D
> > +    /// Enqueues a work item on this scoped queue.=0D
> > +    #[inline]=0D
> > +    pub fn enqueue<W, const ID: u64>(&self, work: W) -> W::EnqueueOutp=
ut=0D
> > +    where=0D
> > +        W: RawWorkItem<ID> + Send + 'scope,=0D
> > +    {=0D
> > +        let queue_ptr =3D self.inner.0.get();=0D
> > +=0D
> > +        // SAFETY:=0D
> > +        // - Closure returns `false` only if `queue_work_on` returns `=
false`=0D
> > +        //   and that means `work_ptr` is already in a workqueue.=0D
> > +        //=0D
> > +        // - `W: 'scope` and dropck keep borrowed data alive until thi=
s queue is=0D
> > +        //   dropped. The constructor requires that the queue is not l=
eaked and=0D
> > +        //   dropping `inner` drains pending and running work so the f=
unction=0D
> > +        //   pointer is not called after any lifetime in `W` expires.=
=0D
> > +        //=0D
> > +        // - The last requirement of `__enqueue` is not relevant here =
because `W`=0D
> > +        //   is `Send`.=0D
> > +        unsafe {=0D
> > +            work.__enqueue(move |work_ptr| {=0D
> > +                bindings::queue_work_on(=0D
> > +                    bindings::wq_misc_consts_WORK_CPU_UNBOUND as ffi::=
c_int,=0D
> > +                    queue_ptr,=0D
> > +                    work_ptr,=0D
> > +                )=0D
> > +            })=0D
> > +        }=0D
> > +    }=0D
> > +}=0D
> > +=0D
> > +impl Drop for ScopedQueue<'_> {=0D
> > +    #[inline]=0D
> > +    fn drop(&mut self) {=0D
> > +        // This impl makes dropck require `'scope` to outlive `OwnedQu=
eue`.=0D
> > +        // See: https://doc.rust-lang.org/nomicon/phantom-data.html#ge=
neric-parameters-and-drop-checking=0D
> > +        let _ =3D &self._scope;=0D
> > +    }=0D
> > +}=0D
> > -- =0D
> > 2.55.0=0D
> > =0D
> =0D
> Would a conversion from OwnedQueue to ScopedQueue=0D
> make sense in the future?=0D
=0D
With Alice's suggestion [1], this wouldn't be needed.=0D
=0D
[1]: https://lore.kernel.org/all/apg1c4GdVrhYDK1P@google.com=0D
=0D
	Onur=0D
=0D
> =0D
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>=0D
