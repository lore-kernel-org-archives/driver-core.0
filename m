Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C812E040D;
	Tue, 24 Mar 2026 13:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774359778; cv=none; b=qVu6oSouGdBSeohO3a2jeMgdvSDQPEfAVAa3S8A+EyUFB1/+0ztv9gTK0hQ0tOOxzng2KRhSfaI1rda1yB0Yw3QRPe+zvrpiYm3/pDGef5jNwJYsm8c/GwxvXSRg8eVoXr5KFEGdCw9kKmSLH2sF7RVv7hs5F/UO31WIqyHoQBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774359778; c=relaxed/simple;
	bh=OvDuZRlA8lX3OgnIYZ5zfo9yqlfCI0psjub7CA9MPdY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=W3yu8+w9HowFP5nvL+D1XMmNk2349jhWna7yLtqpdbigMNgQ4k3xkZu7Z7G/n8cG0rIko5mdgly4GwewzZ0+B1TBWgq1F/TJkIIKVEPo8jSIvJar3VhBFuOmDYFsV9S+eGV02Drl5ErhJVj2SsrOkgfDiEjU5isCNN95OxzMdGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n+sl0Ycs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n+sl0Ycs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C236CC19424;
	Tue, 24 Mar 2026 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774359778;
	bh=OvDuZRlA8lX3OgnIYZ5zfo9yqlfCI0psjub7CA9MPdY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=n+sl0YcsSr+ymtXSkUfUzzH0E5KqOTnm3b4nSPacdXDppB0l3D1tLx3O89m544BNd
	 8Y7e8j92h4zywpcs6rf0oO0qS+9RF7rwsetAwSXC0cGHinGNFcIes+98H+PoKpm/zy
	 8aHPQcQ5kJkQFieUFrDzNmyy8aFMmdCoLHEC6aaX1dG7iFdfdRmT//8Fu1Ym/8Nk2a
	 CUcstPSAEZaYPCi7pb6be0Rw7DQvtWxDR+J5sywVvPmt9ihhScjOzX/hfI8VU2R/hr
	 ycOT8tTl2ew0nruZqQ6Fmu/uUjkpxLhyWiun65wRZrZCDOanFQHbRu5JkcIrpW8e8s
	 bPoopH6wx8hbQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 2/8] rust: dma: add generalized container for types
 other than slices
In-Reply-To: <20260320194626.36263-3-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <8WwJUXIwwCnCTXlAJw77hgSFS-jjhGgfJQoyIaVPdDf99QqTFd1uHhEj56PCo9Ihv-koAQP7826Vpx8HZkKE5A==@protonmail.internalid>
 <20260320194626.36263-3-dakr@kernel.org>
Date: Tue, 24 Mar 2026 14:42:48 +0100
Message-ID: <877br1qr6v.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> From: Gary Guo <gary@garyguo.net>
>
> Currently, `CoherentAllocation` is concecptually a DMA coherent container
> of a slice of `[T]` of runtime-checked length. Generalize it by creating
> `dma::Coherent<T>` which can hold any value of `T`.
> `Coherent::alloc_with_attrs` is implemented but not yet exposed, as I
> believe we should not expose the way to obtain an uninitialized coherent
> region.
>
> `Coherent<[T]>` provides a `len` method instead of the previous `count()`
> method to be consistent with methods on slices.
>
> The existing type is re-defined as a type alias of `Coherent<[T]>` to ease
> transition. Methods in use are not yet removed.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/device.rs |   4 +-
>  rust/kernel/dma.rs    | 361 ++++++++++++++++++++++++++----------------
>  2 files changed, 226 insertions(+), 139 deletions(-)
>
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index 94e0548e7687..379058eca2ed 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -575,7 +575,7 @@ pub trait DeviceContext: private::Sealed {}
>  /// The bound context indicates that for the entire duration of the lifetime of a [`Device<Bound>`]
>  /// reference, the [`Device`] is guaranteed to be bound to a driver.
>  ///
> -/// Some APIs, such as [`dma::CoherentAllocation`] or [`Devres`] rely on the [`Device`] to be bound,
> +/// Some APIs, such as [`dma::Coherent`] or [`Devres`] rely on the [`Device`] to be bound,
>  /// which can be proven with the [`Bound`] device context.
>  ///
>  /// Any abstraction that can guarantee a scope where the corresponding bus device is bound, should
> @@ -584,7 +584,7 @@ pub trait DeviceContext: private::Sealed {}
>  ///
>  /// [`Devres`]: kernel::devres::Devres
>  /// [`Devres::access`]: kernel::devres::Devres::access
> -/// [`dma::CoherentAllocation`]: kernel::dma::CoherentAllocation
> +/// [`dma::Coherent`]: kernel::dma::Coherent
>  pub struct Bound;
>
>  mod private {
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 2eea7e2f8f04..ff3e147f1a23 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -6,7 +6,6 @@
>
>  use crate::{
>      bindings,
> -    build_assert,
>      device::{
>          self,
>          Bound,
> @@ -14,6 +13,7 @@
>      },
>      error::to_result,
>      prelude::*,
> +    ptr::KnownSize,
>      sync::aref::ARef,
>      transmute::{
>          AsBytes,
> @@ -357,18 +357,17 @@ fn from(direction: DataDirection) -> Self {
>  /// This is an abstraction around the `dma_alloc_coherent` API which is used to allocate and map
>  /// large coherent DMA regions.
>  ///
> -/// A [`CoherentAllocation`] instance contains a pointer to the allocated region (in the
> +/// A [`Coherent`] instance contains a pointer to the allocated region (in the
>  /// processor's virtual address space) and the device address which can be given to the device
> -/// as the DMA address base of the region. The region is released once [`CoherentAllocation`]
> +/// as the DMA address base of the region. The region is released once [`Coherent`]
>  /// is dropped.
>  ///
>  /// # Invariants
>  ///
> -/// - For the lifetime of an instance of [`CoherentAllocation`], the `cpu_addr` is a valid pointer
> +/// - For the lifetime of an instance of [`Coherent`], the `cpu_addr` is a valid pointer
>  ///   to an allocated region of coherent memory and `dma_handle` is the DMA address base of the
>  ///   region.
> -/// - The size in bytes of the allocation is equal to `size_of::<T> * count`.
> -/// - `size_of::<T> * count` fits into a `usize`.
> +/// - The size in bytes of the allocation is equal to size information via pointer.

Should this be "equal to the size reported by `KnownSize::size`". I
don't follow the current wording "via pointer".

>  // TODO
>  //
>  // DMA allocations potentially carry device resources (e.g.IOMMU mappings), hence for soundness
> @@ -379,124 +378,260 @@ fn from(direction: DataDirection) -> Self {
>  // allocation from surviving device unbind; it would require RCU read side critical sections to
>  // access the memory, which may require subsequent unnecessary copies.
>  //
> -// Hence, find a way to revoke the device resources of a `CoherentAllocation`, but not the
> -// entire `CoherentAllocation` including the allocated memory itself.
> -pub struct CoherentAllocation<T: AsBytes + FromBytes> {
> +// Hence, find a way to revoke the device resources of a `Coherent`, but not the
> +// entire `Coherent` including the allocated memory itself.
> +pub struct Coherent<T: KnownSize + ?Sized> {
>      dev: ARef<device::Device>,
>      dma_handle: DmaAddress,
> -    count: usize,
>      cpu_addr: NonNull<T>,
>      dma_attrs: Attrs,
>  }
>
> -impl<T: AsBytes + FromBytes> CoherentAllocation<T> {
> -    /// Allocates a region of `size_of::<T> * count` of coherent memory.
> +impl<T: KnownSize + ?Sized> Coherent<T> {
> +    /// Returns the size in bytes of this allocation.
> +    #[inline]
> +    pub fn size(&self) -> usize {
> +        T::size(self.cpu_addr.as_ptr())
> +    }
> +
> +    /// Returns the raw pointer to the allocated region in the CPU's virtual address space.
> +    #[inline]
> +    pub fn as_ptr(&self) -> *const T {
> +        self.cpu_addr.as_ptr()
> +    }
> +
> +    /// Returns the raw pointer to the allocated region in the CPU's virtual address space as
> +    /// a mutable pointer.
> +    #[inline]
> +    pub fn as_mut_ptr(&self) -> *mut T {
> +        self.cpu_addr.as_ptr()
> +    }
> +
> +    /// Returns a DMA handle which may be given to the device as the DMA address base of
> +    /// the region.
> +    #[inline]
> +    pub fn dma_handle(&self) -> DmaAddress {
> +        self.dma_handle
> +    }
> +
> +    /// Returns a reference to the data in the region.
>      ///
> -    /// # Examples
> +    /// # Safety
>      ///
> -    /// ```
> -    /// # use kernel::device::{Bound, Device};
> -    /// use kernel::dma::{attrs::*, CoherentAllocation};
> +    /// * Callers must ensure that the device does not read/write to/from memory while the returned
> +    ///   slice is live.
> +    /// * Callers must ensure that this call does not race with a write to the same region while
> +    ///   the returned slice is live.
> +    #[inline]
> +    pub unsafe fn as_ref(&self) -> &T {
> +        // SAFETY: per safety requirement.

Is this enough? Don't you need to assert a valid bit pattern? I assume
you get this from `FromBytes`, but that bound is not on `T` in this impl
block.

> +        unsafe { &*self.as_ptr() }
> +    }
> +
> +    /// Returns a mutable reference to the data in the region.
>      ///
> -    /// # fn test(dev: &Device<Bound>) -> Result {
> -    /// let c: CoherentAllocation<u64> =
> -    ///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
> -    /// # Ok::<(), Error>(()) }
> -    /// ```
> -    pub fn alloc_attrs(
> +    /// # Safety
> +    ///
> +    /// * Callers must ensure that the device does not read/write to/from memory while the returned
> +    ///   slice is live.
> +    /// * Callers must ensure that this call does not race with a read or write to the same region
> +    ///   while the returned slice is live.
> +    #[expect(clippy::mut_from_ref, reason = "unsafe to use API")]
> +    #[inline]
> +    pub unsafe fn as_mut(&self) -> &mut T {
> +        // SAFETY: per safety requirement.

Same.

> +        unsafe { &mut *self.as_mut_ptr() }
> +    }
> +
> +    /// Reads the value of `field` and ensures that its type is [`FromBytes`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// This must be called from the [`dma_read`] macro which ensures that the `field` pointer is
> +    /// validated beforehand.
> +    ///
> +    /// Public but hidden since it should only be used from [`dma_read`] macro.
> +    #[doc(hidden)]
> +    pub unsafe fn field_read<F: FromBytes>(&self, field: *const F) -> F {
> +        // SAFETY:
> +        // - By the safety requirements field is valid.
> +        // - Using read_volatile() here is not sound as per the usual rules, the usage here is
> +        // a special exception with the following notes in place. When dealing with a potential
> +        // race from a hardware or code outside kernel (e.g. user-space program), we need that
> +        // read on a valid memory is not UB. Currently read_volatile() is used for this, and the
> +        // rationale behind is that it should generate the same code as READ_ONCE() which the
> +        // kernel already relies on to avoid UB on data races. Note that the usage of
> +        // read_volatile() is limited to this particular case, it cannot be used to prevent
> +        // the UB caused by racing between two kernel functions nor do they provide atomicity.
> +        unsafe { field.read_volatile() }
> +    }
> +
> +    /// Writes a value to `field` and ensures that its type is [`AsBytes`].
> +    ///
> +    /// # Safety
> +    ///
> +    /// This must be called from the [`dma_write`] macro which ensures that the `field` pointer is
> +    /// validated beforehand.
> +    ///
> +    /// Public but hidden since it should only be used from [`dma_write`] macro.
> +    #[doc(hidden)]
> +    pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
> +        // SAFETY:
> +        // - By the safety requirements field is valid.
> +        // - Using write_volatile() here is not sound as per the usual rules, the usage here is
> +        // a special exception with the following notes in place. When dealing with a potential
> +        // race from a hardware or code outside kernel (e.g. user-space program), we need that
> +        // write on a valid memory is not UB. Currently write_volatile() is used for this, and the
> +        // rationale behind is that it should generate the same code as WRITE_ONCE() which the
> +        // kernel already relies on to avoid UB on data races. Note that the usage of
> +        // write_volatile() is limited to this particular case, it cannot be used to prevent
> +        // the UB caused by racing between two kernel functions nor do they provide atomicity.
> +        unsafe { field.write_volatile(val) }
> +    }
> +}
> +
> +impl<T: AsBytes + FromBytes> Coherent<T> {
> +    /// Allocates a region of `T` of coherent memory.
> +    #[expect(unused)]
> +    fn alloc_with_attrs(
>          dev: &device::Device<Bound>,
> -        count: usize,
>          gfp_flags: kernel::alloc::Flags,
>          dma_attrs: Attrs,
> -    ) -> Result<CoherentAllocation<T>> {
> -        build_assert!(
> -            core::mem::size_of::<T>() > 0,
> -            "It doesn't make sense for the allocated type to be a ZST"
> -        );
> +    ) -> Result<Self> {
> +        const {
> +            assert!(
> +                core::mem::size_of::<T>() > 0,
> +                "It doesn't make sense for the allocated type to be a ZST"
> +            );
> +        }
>
> -        let size = count
> -            .checked_mul(core::mem::size_of::<T>())
> -            .ok_or(EOVERFLOW)?;
>          let mut dma_handle = 0;
>          // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
>          let addr = unsafe {
>              bindings::dma_alloc_attrs(
>                  dev.as_raw(),
> -                size,
> +                core::mem::size_of::<T>(),
>                  &mut dma_handle,
>                  gfp_flags.as_raw(),
>                  dma_attrs.as_raw(),
>              )
>          };
> -        let addr = NonNull::new(addr).ok_or(ENOMEM)?;
> +        let cpu_addr = NonNull::new(addr.cast()).ok_or(ENOMEM)?;
>          // INVARIANT:
> -        // - We just successfully allocated a coherent region which is accessible for
> -        //   `count` elements, hence the cpu address is valid. We also hold a refcounted reference
> -        //   to the device.
> -        // - The allocated `size` is equal to `size_of::<T> * count`.
> -        // - The allocated `size` fits into a `usize`.
> +        // - We just successfully allocated a coherent region which is adequately sized for `T`,
> +        //   hence the cpu address is valid.

The invariant says "valid for the lifetime", do you need to argue for
the duration of the validity?

> +        // - We also hold a refcounted reference to the device.

This does not relate to the second invariant of `Self`.

>          Ok(Self {
>              dev: dev.into(),
>              dma_handle,
> -            count,
> -            cpu_addr: addr.cast(),
> +            cpu_addr,
>              dma_attrs,
>          })
>      }
>
> -    /// Performs the same functionality as [`CoherentAllocation::alloc_attrs`], except the
> -    /// `dma_attrs` is 0 by default.
> -    pub fn alloc_coherent(
> +    /// Allocates a region of `[T; len]` of coherent memory.
> +    fn alloc_slice_with_attrs(
>          dev: &device::Device<Bound>,
> -        count: usize,
> +        len: usize,
>          gfp_flags: kernel::alloc::Flags,
> -    ) -> Result<CoherentAllocation<T>> {
> -        CoherentAllocation::alloc_attrs(dev, count, gfp_flags, Attrs(0))
> +        dma_attrs: Attrs,
> +    ) -> Result<Coherent<[T]>> {
> +        const {
> +            assert!(
> +                core::mem::size_of::<T>() > 0,
> +                "It doesn't make sense for the allocated type to be a ZST"
> +            );
> +        }
> +
> +        // `dma_alloc_attrs` cannot handle zero-length allocation, bail early.
> +        if len == 0 {
> +            Err(EINVAL)?;
> +        }
> +
> +        let size = core::mem::size_of::<T>().checked_mul(len).ok_or(ENOMEM)?;
> +        let mut dma_handle = 0;
> +        // SAFETY: Device pointer is guaranteed as valid by the type invariant on `Device`.
> +        let addr = unsafe {
> +            bindings::dma_alloc_attrs(
> +                dev.as_raw(),
> +                size,
> +                &mut dma_handle,
> +                gfp_flags.as_raw(),
> +                dma_attrs.as_raw(),
> +            )
> +        };
> +        let cpu_addr = NonNull::slice_from_raw_parts(NonNull::new(addr.cast()).ok_or(ENOMEM)?, len);
> +        // INVARIANT:
> +        // - We just successfully allocated a coherent region which is adequately sized for
> +        //   `[T; len]`, hence the cpu address is valid.
> +        // - We also hold a refcounted reference to the device.

Same.


Best regards,
Andreas Hindborg


