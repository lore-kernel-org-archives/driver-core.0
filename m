Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792623610;
	b=XZeSINGWCv6ZSbvKp+QfQa/eGmd2Ap+lGJZI//B1f3vCyTJmvJtVHAo/HdKZEuYQ3IYZ
	 YeMJy1Ap9W4/WdhI079oNHN1L2nA78Fjq/Tc2ozAEylIt8ZQ0CaORWKeG77aSvXix/lQp
	 EvpDxXtfe3CPAFGELHMKxm2Qx30cJLtG+/rEsL1NQEsi0E/9N2nBS3uy7wia0vQQAqi5w
	 nMHKed8YQw4LmNTcMbjo8lmROoE1/ksznHcFi73uIt4VzUO9J2+snDAFcZNAlzXZLUFmL
	 BrOqZ0NCR3BQqt6VcznsMr2Eh+I7VyuEybv6d8awjlK8vLEzM97P66rhLKEPcMR0T8A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792623610;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp;
	bh=o0uJl9SaCMTX22dhBn+kimrcYeaap+l2h4VH/HTX/Bw=;
	b=SK5MHfAm3cMcQdcIZKF7Kl+NS+/++1/lkv+PxBeJ3iQX4+kpwvDQpko6UcqIj5wb1wE0
	 mQFzZoTLpdG6SEqzGpflNyRM34Y8XEx4HkyvKk0BWJrCEqJCH1cVukZwkdX8DnDruL1IK
	 fE8wUWl7S7I/8aOVWEiiNdGEkahUq5+prfHwE5eSFH/Y8z6zBWcX8ZAZMzcL3ZzQrEJEj
	 e7+MXYE+DXemthPkKcwKd7BGHmvSNXsVCT85ok31tDDYQ+d6rBew4qe9/GryztWLRq4Ak
	 aTJQeeHJWtLAV2dkEBNV8Q9dg3OF2JAItq7/M1KxSpdzTXrDyU0iULhIoIJjPC8u1Ng==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=OfOoJvBW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14EB606A31B
	for <driver-core@lists.linux.dev>; Wed, 21 Oct 2026 23:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14EB606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=OfOoJvBW
ARC-Seal: i=1; a=rsa-sha256; t=1792623577; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YxVBf2r3nDwKMI/w4Cfj6wBPEhOJrYrOvgbHQuNF1ywKWQm7TKXl1BxN0MCzVhGnVPMmrOcH6Y7vwHRpSGH/RcyW4o/9bbNlAwDyJXiUXdg5ErkLkwoq1J2TXCQPoltJqCXeE7TykTIHOmTKyvOGdSm6I7BjWVq1/ZLJ0hXuUmw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1792623577; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=o0uJl9SaCMTX22dhBn+kimrcYeaap+l2h4VH/HTX/Bw=; 
	b=khUxgC7K6Dump7HNsU+T7sITG0K+jmATCHUoast6WPDxWHGGdTDBC0/QIMUIlIBg2Ki/G7lkO1OKQptby+w0tcfAj8SqJX6EGe78xbKaBP5tEaQXn0e3LAwEtnAJ4oJ2vyHWOXNz8bzWJ2c4vg/iUCx6qvZl2sHz8MuJup+spKc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1792623577;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=o0uJl9SaCMTX22dhBn+kimrcYeaap+l2h4VH/HTX/Bw=;
	b=OfOoJvBWtQLZeQ1qUOZGpKI9LGZH2kuAFdLAMNQV3geS/kzBnYy8rznRYzbMbVBM
	HFcT0dwlhYAlcWgqtInVd0oIjVSrKah+jST9FZrq3K24sTSH9+BXxBAmWKElb0bJ6GL
	HYDwBvjQDUlcmMPboCn0WDmQXXbUEACnRUzHCU1w=
Received: by smtp.zohomail.com with SMTPS id 1792623575793141.6930617524606;
	Wed, 21 Oct 2026 15:59:35 -0700 (PDT)
Date: Wed, 21 Oct 2026 15:59:34 -0700
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Ke Sun <sunke@kylinos.cn>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org,
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Subject: Re: [PATCH v4 04/11] drm/tyr: add per-file VM pool
Message-ID: <atlD1jzWqQhKE3w5@um790>
References: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
 <20261020-tyr-ioctls-v4-4-704de77da223@kylinos.cn>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-tyr-ioctls-v4-4-704de77da223@kylinos.cn>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/292.612.36

On Tue, Oct 20, 2026 at 04:25:21PM +0800, Ke Sun wrote:
> From: Alvin Sun <alvin.sun@linux.dev>
> 
> Userspace needs multiple independent GPU address spaces per file,
> addressed by ID through the VM ioctls as in panthor. Store them in an
> IdPool (capped at 32 for panthor parity) plus an XArray. On a failed
> insertion the caller tears the VM down through the returned error, so
> an aborted creation never leaks a VM. The pool kills every VM still
> stored when the file closes.
> 
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  drivers/gpu/drm/tyr/vm.rs | 138 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 137 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
> index c5e307b1e2416..6935e4db667b9 100644
> --- a/drivers/gpu/drm/tyr/vm.rs
> +++ b/drivers/gpu/drm/tyr/vm.rs
> @@ -33,6 +33,7 @@
>          }, //
>      },
>      fmt,
> +    id_pool::IdPool,
>      impl_flags,
>      io::PhysAddr,
>      iommu::pgtable::{
> @@ -53,7 +54,11 @@
>          ArcBorrow,
>          Mutex, //
>      },
> -    uapi, //
> +    uapi,
> +    xarray::{
> +        AllocKind,
> +        XArray, //
> +    }, //
>  };
>  
>  use crate::{
> @@ -948,3 +953,134 @@ fn pt_unmap(dev: &Device, pt: &IoPageTable<'_, ARM64LPAES1>, range: Range<u64>)
>  
>      Ok(())
>  }
> +
> +/// Maximum number of VMs a single file may hold, matching panthor's
> +/// `PANTHOR_MAX_VMS_PER_FILE`.
> +const MAX_VMS_PER_FILE: usize = 32;
> +
> +/// Per-open-file pool of VMs.
> +#[pin_data(PinnedDrop)]
> +pub(crate) struct VmPool<'drm> {
> +    /// Parent device, for error reporting.
> +    dev: &'drm Device<Bound>,
> +    #[pin]
> +    ids: Mutex<IdPool>,
> +    #[pin]
> +    vms: XArray<Arc<Vm<'drm>>>,
> +}
> +
> +/// Error returned when a VM cannot be added to the pool. The caller
> +/// owns the teardown of the VM in [`AddError::vm`].
> +pub(crate) struct AddError<'drm> {
> +    pub(crate) error: Error,
> +    pub(crate) vm: Arc<Vm<'drm>>,
> +}

When I try to compile just this patch i get an error about
this being unused so better annotate it with #[expect(dead_code)]
like the others.

> +
> +impl<'drm> VmPool<'drm> {
> +    /// Creates a new [`VmPool`].
> +    #[expect(dead_code)]
> +    pub(crate) fn new(dev: &'drm Device<Bound>) -> impl PinInit<Self> {
> +        let ids = IdPool::new();
> +        pin_init!(Self {
> +            dev,
> +            ids <- new_mutex!(ids),
> +            vms <- XArray::new(AllocKind::Alloc),
> +        })
> +    }
> +
> +    /// Stores the VM and returns the allocated ID.
> +    ///
> +    /// On failure - ID space exhausted or a store failure - the VM is
> +    /// returned in an [`AddError`] so the caller owns the teardown.
> +    // TODO: allocate IDs with the XArray directly (once it grows range
> +    // allocation, the equivalent of C's `XA_LIMIT`) and drop the IdPool.
> +    #[expect(dead_code)]
> +    pub(crate) fn add(&self, vm: Arc<Vm<'drm>>) -> Result<u32, AddError<'drm>> {
> +        let id = (|| {
> +            let mut ids = self.ids.lock();
> +            let unused = ids.find_unused_id(1).ok_or(ENOSPC)?;
> +            if unused.as_usize() > MAX_VMS_PER_FILE {
> +                return Err(ENOSPC);
> +            }
> +            Ok(unused.acquire())
> +        })();
> +        let id = match id {
> +            Ok(id) => id,
> +            Err(error) => return Err(AddError { error, vm }),
> +        };
> +
> +        let mut vms = self.vms.lock();
> +        match vms.store(id, vm, GFP_KERNEL) {
> +            Ok(prev_vm) => {
> +                if let Some(prev_vm) = prev_vm {
> +                    // An existing VM at the freshly allocated slot means the
> +                    // IdPool and the XArray are out of sync: the stored VM is
> +                    // a pool entry, so the pool kills it and the caller's VM
> +                    // is handed back for the caller to kill.
> +                    let stored = vms.remove(id);
> +                    drop(vms);
> +                    prev_vm.kill();
> +                    self.ids.lock().release_id(id);
> +                    dev_err!(
> +                        self.dev,
> +                        "IdPool/XArray out of sync at VM pool id {id} (stored VM conflict)"
> +                    );
> +                    return Err(AddError {
> +                        error: EBUSY,
> +                        vm: stored.expect("VM was just stored"),

Since the rust for linux coding guidlines say:
    panicking should be very rare and used only with a good reason.
    In almost all cases, a fallible approach should be used, typically returning a Result.

I'm wondering if there is a way to avoid this expect().
For example, you could store a vm.clone() in the xarray and keep the vm
that was passed to this function so that it can be returned on error.
And on success, the vm would just drop so the overall ref count wouldn't
be incremented.

> +                    });
> +                }
> +                Ok(id as u32)
> +            }
> +            Err(err) => {
> +                // Drop the XArray spinlock before acquiring the `ids` mutex.
> +                drop(vms);
> +                // Release the pooled id; the VM never entered the pool, so it
> +                // is returned to the caller for teardown.
> +                self.ids.lock().release_id(id);
> +                Err(AddError { error: err.error, vm: err.value })

When i run rustfmt on this patch it reformats this line, can you double
check you ran rustfmt?


> +            }
> +        }
> +    }
> +
> +    /// Removes and kills the VM with the given ID.
> +    #[expect(dead_code)]
> +    pub(crate) fn remove(&self, id: u32) -> Result<()> {
> +        let mut vms = self.vms.lock();
> +        let vm = match vms.remove(id as usize) {
> +            Some(vm) => vm,
> +            None => return Err(EINVAL),
> +        };
> +        // Drop the XArray spinlock before killing, since `kill()` may sleep.
> +        drop(vms);
> +        // Kill the VM before handing the id back to the pool, so a VM is
> +        // never reusable while still alive.
> +        vm.kill();
> +        self.ids.lock().release_id(id as usize);

Since i just learned about this myself, I should mention that you can
now use num::casts::FromSafeCast and then write
usize::from_safe_cast(id).

> +        Ok(())
> +    }
> +
> +    /// Gets a shared reference to the VM with the given ID.
> +    #[expect(dead_code)]
> +    pub(crate) fn get(&self, id: u32) -> Option<Arc<Vm<'drm>>> {
> +        let vms = self.vms.lock();
> +        let borrow = vms.get(id as usize)?;
> +        Some(Arc::from(borrow))
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for VmPool<'_> {
> +    fn drop(self: Pin<&mut Self>) {
> +        let this = self.project();

I don't think you need to project the VmPool here because we only
need a shared ref to the pool, and the vms guard gives us the interior
mutability we need to modify the xarray anyway.

> +        // Kill every VM left in the pool. The ID range is bounded by
> +        // `MAX_VMS_PER_FILE`, so this loop is cheap and runs at file close.
> +        for id in 1..=MAX_VMS_PER_FILE {
> +            // Release the XArray lock guard before killing: `kill()` may sleep.
> +            let vm = this.vms.lock().remove(id);
> +            if let Some(vm) = vm {
> +                vm.kill();
> +            }
> +        }
> +    }
> +}
> 
> -- 
> 2.43.0
> 
