Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794615909;
	b=cQCBSVPLGJvSp9p6482iAAonNM8TAb5EQyzPAmw+eL7hoOQqnFBelmD+bFQou8pv9vPe
	 uuSP/P8mAC9Fs/Px6NAMb6+9LUi6RYIw67wivFVWLLJ9mxXkUehlo5vYKlz7SRq8gwnku
	 zsN56djfdf6Kw8n68DuA+k5KqbaJ9mPBpiDocxauqbtkVVtVOJPQiPIuQL/1xVqbajyuL
	 Fyjy86CTz6uv2v8Or2zj9kKNPR9S1Woq/KUW0+HHHgfkhwG0v417IojotCg1uWJ+VPFYg
	 vUoWbEOltunR/4PwVezoYfnXXsulqIe0cqBIYqkcmHnbbH1PDjzIYvbtadubV1OwuIQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794615909;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Zoho-Virus-Status:X-Zoho-AV-Stamp;
	bh=GLRFTDzxRyeQfwZZCq6+6NeHw4TtrfIXoOaRpqzJ94A=;
	b=xGkciPOGFZRYSPYW9KbTdxbplTtkzgGXQxnO+b3cJ4V+2DbQDHbmTzGMkUY14DSVf+o2
	 DifuyEUFMSzqHZPwsMB4Kreniw7QJgSKDYfUPvz/3PC8Vb8f/RIsvzberH7HoUvTnWKJm
	 Njn11t/nAg+LRmYK4HPCPBxHxYS/k20kiB3MDI+m2pdacep5mTKjkc15W7l45/e7l8x46
	 sKjq+aw6XeVcd3BkNydRFE78blmwATDEuHVKYrOVXEHxIerBOZvi68XM6Cm/pfRQls+mq
	 aNG7cAeQJCNRTGxG8OKE71Y4o2FXt+kvDy2XkowVXY2e4a09HBo9ja4U2ynlSWwm+hw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=WjUVSxKR;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.180.11
Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0AEB606A327
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 00:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B0AEB606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=WjUVSxKR
ARC-Seal: i=1; a=rsa-sha256; t=1794615882; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CjsGhtoz7vRz51JU7oUpxDlLPDo579v8vyHkIwdxPZ3dx8Ooxe6LSUwlxU5j5N8mWJcHLdq0pbvYD/xThObP+foKISM2c/Ch6E5lHf++BiOn0uq1HLjiB8oJSBXdGhT4bkZarBYQWeBL23FGx3O7WuQmPLNrqa2AKODrG/H8TwI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794615882; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GLRFTDzxRyeQfwZZCq6+6NeHw4TtrfIXoOaRpqzJ94A=; 
	b=YOCI5am8Q+wMRFnksUJbi9FESBpj5XzDdGKRjgtDPtfZcfbtiNrgnZ0Gu91JEglVYraYr9x9VoHolfs5cVaXjakAJuGk0Mk3uVsiPqhRnQjGxQU5fMWi+B5Qy/V1kwvrhLj6dqkidOUrJ9P8EI8Mf9FwKtsFueJd+ubb5bbgjtM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: a=rsa-sha256; b=WjUVSxKRJNmFPhRWUJ8nGe62v3kD2R4ydbk4BZvGdr9hZR4oTosnal7ufmA/d87psXll347aTrED/R/5hZD5ioqSoHmBP4KK6Dl72W03pDo/1Be6bav7GGQlldc9DHaAkCtIi/di94K4fob65h+JVNl7Qh+8/82euarvWhH/lBA=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=GLRFTDzxRyeQfwZZCq6+6NeHw4TtrfIXoOaRpqzJ94A=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794615881376890.9053062662451;
	Fri, 13 Nov 2026 16:24:41 -0800 (PST)
Date: Fri, 13 Nov 2026 17:24:40 -0700
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
	Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
	driver-core@lists.linux.dev, Alvin Sun <alvin.sun@linux.dev>
Subject: Re: [PATCH v6 04/10] drm/tyr: add per-file VM pool
Message-ID: <aveqSHOLD8J0CjsO@um790>
References: <20261109-tyr-ioctls-v6-0-b2896bf2b3c9@kylinos.cn>
 <20261109-tyr-ioctls-v6-4-b2896bf2b3c9@kylinos.cn>
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
In-Reply-To: <20261109-tyr-ioctls-v6-4-b2896bf2b3c9@kylinos.cn>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/294.590.96

On Mon, Nov 09, 2026 at 08:36:47AM +0800, Ke Sun wrote:
> From: Alvin Sun <alvin.sun@linux.dev>
> 
> Userspace needs multiple independent GPU address spaces per file,
> addressed by ID through the VM ioctls as in panthor. Store them in an
> IdPool (capped at 32 for panthor parity) plus an XArray. On failure
> the caller receives the VM for teardown through the returned error,
> whether the un-stored clone or the original on an ID conflict, so an
> aborted creation never leaks a VM. The pool kills every VM still
> stored when the file closes.
> 
> Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
> ---
>  drivers/gpu/drm/tyr/vm.rs | 140 +++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 139 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
> index 1dd11b2b12532..6f5518652a03f 100644
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
> @@ -41,6 +42,7 @@
>          ARM64LPAES1, //
>      },
>      new_mutex,
> +    num::casts::FromSafeCast,
>      prelude::*,
>      sizes::{
>          SZ_1G,
> @@ -53,7 +55,11 @@
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
> @@ -947,3 +953,135 @@ fn pt_unmap(dev: &Device, pt: &IoPageTable<'_, ARM64LPAES1>, range: Range<u64>)
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
> +    #[expect(dead_code)]
> +    pub(crate) error: Error,
> +    #[expect(dead_code)]
> +    pub(crate) vm: Arc<Vm<'drm>>,
> +}
> +
> +impl<'drm> VmPool<'drm> {
> +    /// Creates a new [`VmPool`].
> +    #[expect(dead_code)]
> +    pub(crate) fn new(dev: &'drm Device<Bound>) -> impl PinInit<Self> {
> +        let ids = IdPool::new();

I sent a reply to sashiko-review lists but i meant it to go to the whole
thread. Basically, just wanted to suggest using IdPool::with_capacity()
to make sure we can create 32 vms on 32 bit builds.

https://lore.kernel.org/dri-devel/avZlPvHqlxmu2hNO@um790/



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

Turns out since panthor uses xa_alloc() it will return
" * -EBUSY if there are no free entries in @limit." so we better do
the same here.

> +            }
> +            Ok(unused.acquire())
> +        })();
> +        let id = match id {
> +            Ok(id) => id,
> +            Err(error) => return Err(AddError { error, vm }),
> +        };
> +
> +        let mut vms = self.vms.lock();
> +        match vms.store(id, vm.clone(), GFP_KERNEL) {
> +            Ok(prev_vm) => {
> +                if let Some(prev_vm) = prev_vm {
> +                    // An existing VM at the freshly allocated slot means the
> +                    // IdPool and the XArray are out of sync: the stored VM is
> +                    // a pool entry, so the pool kills it and the caller's VM
> +                    // is returned for teardown.
> +                    drop(vms.remove(id));
> +                    drop(vms);
> +                    prev_vm.kill();
> +                    self.ids.lock().release_id(id);
> +                    dev_err!(
> +                        self.dev,
> +                        "IdPool/XArray out of sync at VM pool id {id} (stored VM conflict)"
> +                    );
> +                    return Err(AddError { error: EBUSY, vm });
> +                }
> +                Ok(id as u32)
> +            }
> +            Err(err) => {
> +                // Drop the XArray spinlock before acquiring the `ids` mutex.
> +                drop(vms);
> +                // Release the pooled id; the VM never entered the pool, so it
> +                // is returned to the caller for teardown.
> +                self.ids.lock().release_id(id);
> +                Err(AddError {
> +                    error: err.error,
> +                    vm: err.value,
> +                })
> +            }
> +        }
> +    }
> +
> +    /// Removes and kills the VM with the given ID.
> +    #[expect(dead_code)]
> +    pub(crate) fn remove(&self, id: u32) -> Result<()> {
> +        let mut vms = self.vms.lock();
> +        let vm = match vms.remove(usize::from_safe_cast(id)) {
> +            Some(vm) => vm,
> +            None => return Err(EINVAL),
> +        };
> +        // Drop the XArray spinlock before killing, since `kill()` may sleep.
> +        drop(vms);
> +        // Kill the VM before handing the id back to the pool, so a VM is
> +        // never reusable while still alive.
> +        vm.kill();
> +        self.ids.lock().release_id(usize::from_safe_cast(id));
> +        Ok(())
> +    }
> +
> +    /// Gets a shared reference to the VM with the given ID.
> +    #[expect(dead_code)]
> +    pub(crate) fn get(&self, id: u32) -> Option<Arc<Vm<'drm>>> {
> +        let vms = self.vms.lock();
> +        let borrow = vms.get(usize::from_safe_cast(id))?;
> +        Some(Arc::from(borrow))
> +    }
> +}
> +
> +#[pinned_drop]
> +impl PinnedDrop for VmPool<'_> {
> +    fn drop(self: Pin<&mut Self>) {
> +        // Kill every VM left in the pool. The ID range is bounded by
> +        // `MAX_VMS_PER_FILE`, so this loop is cheap and runs at file close.
> +        for id in 1..=MAX_VMS_PER_FILE {
> +            // Release the XArray lock guard before killing: `kill()` may sleep.
> +            let vm = self.vms.lock().remove(id);
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
