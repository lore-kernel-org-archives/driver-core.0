Received: from mail-43170.protonmail.ch (mail-43170.protonmail.ch [185.70.43.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 969A72D8382
	for <driver-core@lists.linux.dev>; Sat, 12 Sep 2026 07:55:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789199727; cv=none; b=X0x7JYN2yt11NauygLUsgNfZDWJKXlfBp6t1quF6BmoVhZ+CV5TeSKCjnYXOE6C7MtcSaVykROHZ74+c0ZKxinPCVHOsBYV4BoXwyIw1k4K7oA0dMKdr3YJVOi0cm3F0VjbJVN1y/ThCV56gT3Znt9wCRCGmilyUnIRKgGOH14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789199727; c=relaxed/simple;
	bh=KD4QiSI0HX2frZKgY1bL3VQtH86/CXOzShOKXocO/Yk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ec2WRtCTQnvmCmU6CNSZPtotgimA1q+BpjeJgn2BKxhZ5f7/2Hy2xcVy2Ejxt6DWaXR7itCQqbtMSvgI4IFsbrQiXVhhibT+YPfTk9eWz64RIe5NOmSi/CPpVnXTXduQUHkFfGh3KWLfhGVjsKWgSQbZsIC3t/Wm7KwK9Df5ufY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=FnlgvXu5; arc=none smtp.client-ip=185.70.43.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="FnlgvXu5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1789199720; x=1789458920;
	bh=Nhjin6tMRCiwQViCTXHCJ3Nu7Cr9PpgLWgcVZJJQHgM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=FnlgvXu5RkTBRIQNkTH8kLYWwokAXaokQ2sCyECPFcoXvWY+LD0mUlSJ4bGM2IqOe
	 SNVrNzDvLsS+2XCfKi3F02pUw5fBJZGFXis8hLbH+mVD+YgMVKSOdlqVttgnEiLxKr
	 MhgC1WPRyoognF+FA7AxoRbi1xptLvpDKv8mFoLX7L+wSer6ztZvRw1ZNMunHkfdBT
	 UYW8KyFZnkBIOCbXMQd5XTHi5msMpD8wDOqe4L0KS/HkI6Yx+M+jWkBtlihPBKF52J
	 0IJ+2frlO6NtExc5mg/JgluaJZ3ksV11IHbwDRrSyZCIiQW+MJ/geG1wRdpVJ4VzWA
	 aayKFCVDL1kOw==
X-Pm-Submission-Id: 4hhkGs3mfxz1DFFJ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	tj@kernel.org,
	jiangshanlai@gmail.com,
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
	jhubbard@nvidia.com,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v2 5/6] rust: workqueue: add ScopedQueue for lifetime bound items
Date: Sat, 12 Sep 2026 10:54:59 +0300
Message-ID: <20260912075516.66479-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <apg1c4GdVrhYDK1P@google.com>
References: <20260807165252.3849875-1-dakr@kernel.org> <20260807165252.3849875-6-dakr@kernel.org> <apg1c4GdVrhYDK1P@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 02 Sep 2026 14:40:51 +0000=0D
Alice Ryhl <aliceryhl@google.com> wrote:=0D
=0D
> On Fri, Aug 07, 2026 at 06:52:48PM +0200, Danilo Krummrich wrote:=0D
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
> >     ERROR:root:error[E0597]: `data` does not live long enough=0D
> > 	 --> rust/doctests_kernel_generated.rs:22029:44=0D
> > 	  |=0D
> >     22027 |         let data =3D ();=0D
> > 	  |             ---- binding `data` declared here=0D
> >     22028 |         // SAFETY: Queue is not leaked.=0D
> >     22029 |         queue =3D unsafe { new_queue(&data)? };=0D
> > 	  |                                            ^^^^^ borrowed value do=
es not live long enough=0D
> >     22030 |     }=0D
> > 	  |     - `data` dropped here while still borrowed=0D
> >     ...=0D
> >     22034 | }=0D
> > 	  | - borrow might be used here, when `queue` is dropped and runs the =
`Drop` code for type `ScopedQueue`=0D
> > 	  |=0D
> > 	  =3D note: values in a scope are dropped in the opposite order they a=
re defined=0D
> =0D
> The '^^^^^' on the warning doesn't quite point at the right location.=0D
> =0D
> > =0D
> > which is exactly the constraint ScopedQueue is meant to enforce.=0D
> > =0D
> > Suggested-by: Danilo Krummrich <dakr@kernel.org>=0D
> > Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
> > [ Move from scoped_queue.rs to scoped.rs, which can be shared with=0D
> >   ScopedWork; add missing inline annotations. - Danilo ]=0D
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>=0D
> > ---=0D
> >  rust/kernel/workqueue/mod.rs    |   3 +=0D
> >  rust/kernel/workqueue/scoped.rs | 190 ++++++++++++++++++++++++++++++++=
=0D
> >  2 files changed, 193 insertions(+)=0D
> >  create mode 100644 rust/kernel/workqueue/scoped.rs=0D
> > =0D
> > diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.r=
s=0D
> > index 8eb2d037be83..551fa1401b85 100644=0D
> > --- a/rust/kernel/workqueue/mod.rs=0D
> > +++ b/rust/kernel/workqueue/mod.rs=0D
> > @@ -212,6 +212,9 @@=0D
> >  mod builder;=0D
> >  pub use self::builder::Builder;=0D
> >  =0D
> > +mod scoped;=0D
> > +pub use self::scoped::ScopedQueue;=0D
> > +=0D
> >  /// Creates a [`Work`] initialiser with the given name and a newly-cre=
ated lock class.=0D
> >  #[macro_export]=0D
> >  macro_rules! new_work {=0D
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
> =0D
> A Queue is the same as a ScopedQueue<'static>, so we don't necessarily=0D
> need a new type if we add a lifetime to Queue and add two constructors:=0D
> =0D
> 	fn new() -> Queue<'static>;=0D
> 	unsafe fn new_scoped() -> Queue<'a>;=0D
=0D
Sounds reasonable. Should I pull this series and do that approach directly =
on=0D
it, or send another version for [1]?=0D
=0D
[1]: https://lore.kernel.org/all/20260617144645.253444-1-work@onurozkan.dev=
=0D
=0D
	Onur=0D
=0D
> =0D
> Alice=0D
