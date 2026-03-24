Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76D3028726A;
	Tue, 24 Mar 2026 13:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360009; cv=none; b=EGy9bN3mIcOeye1XAVGX2x1UkQZKUsBkfzvv0nyNWIVhKMhETmh3mKsntnSpfLASvKa1ZuqIE9NjPCFjVMcz9gIeb89eOvG5RLAQ5hwl/LDiPyXe/vkcX1ZqLqjkEkCjnkCcoWcSawMfDA0ksnSAy88WQpPLAdwNxsBfQRfPw7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360009; c=relaxed/simple;
	bh=h3w10dHofOpSr7tRLNN0/09dk5eHpyyKeNzs2he0Gmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fPJNXgEJYSHl5V7hal1YX03XVXDgCtaHD6trtUIHkzRYhmzu3/cjtNqXTUz/TAph/kwlVpEJH/U4MSNbVO9awgyYREwMaa8QcU1vbv+2T2RTchyU5hXgjQ7u0Cg4q4ZJHUa+LxEV3lBq9L1GeLfkAAjel2bbqCB+MnbagVrfv48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ATF2wMf5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ATF2wMf5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB1CC19424;
	Tue, 24 Mar 2026 13:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360008;
	bh=h3w10dHofOpSr7tRLNN0/09dk5eHpyyKeNzs2he0Gmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ATF2wMf50dDbIWHCverU2iPOzffb3JJrxs/lgJGCecZImGQb34PhZiA31p9lIeJVC
	 i9hXg04xBtlAx4AAYW1VohpXfzxfH5XawxxbsPzYqK8r2qngB9ZQanTsvWwxHloR2h
	 iiz835YB8lQg2RZEgaYBQpvYXqe48BbDSkHg2jTk7G/VqVvbMuHq9qelnL9O6zopxf
	 RhmNJr161RGgonvdVJ+0uepC8HmiuLzrNYidHaB13RjIQgTNCD20LYk2I9XkjhC19J
	 H8hqr9ZJzYlYURY/hLwIPIf40DKF3FqPB+YJ3RU86MsCBSedMNyUVPykZBbnG+mPbc
	 gn2vI+oUDaECA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 3/8] rust: dma: add zeroed constructor to `Coherent`
In-Reply-To: <20260320194626.36263-4-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <RoXOmlVAeY7nQoQ-P4KIO9I-vuJBV9oDG-LUg4B5naE3EzdNAtBZhVLoyX3yUAATLPx3OCT6r6_P_TVNEf4dvQ==@protonmail.internalid>
 <20260320194626.36263-4-dakr@kernel.org>
Date: Tue, 24 Mar 2026 14:46:39 +0100
Message-ID: <874im5qr0g.fsf@kernel.org>
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
> These constructors create a coherent container of a single object
> instead of slice. They are named `zeroed` and `zeroed_with_attrs` to
> emphasis that they are created initialized zeroed. It is intended that
> there'll be new constructors that take `PinInit` instead of zeroing.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/dma.rs       | 81 ++++++++++++++++++++++++++++++++++++----
>  samples/rust/rust_dma.rs |  8 ++--
>  2 files changed, 77 insertions(+), 12 deletions(-)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index ff3e147f1a23..db645b01bdd0 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -47,7 +47,7 @@ pub trait Device: AsRef<device::Device<Core>> {
>      /// # Safety
>      ///
>      /// This method must not be called concurrently with any DMA allocation or mapping primitives,
> -    /// such as [`CoherentAllocation::alloc_attrs`].
> +    /// such as [`Coherent::zeroed`].
>      unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
>          // SAFETY:
>          // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
> @@ -64,7 +64,7 @@ unsafe fn dma_set_mask(&self, mask: DmaMask) -> Result {
>      /// # Safety
>      ///
>      /// This method must not be called concurrently with any DMA allocation or mapping primitives,
> -    /// such as [`CoherentAllocation::alloc_attrs`].
> +    /// such as [`Coherent::zeroed`].
>      unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
>          // SAFETY:
>          // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
> @@ -83,7 +83,7 @@ unsafe fn dma_set_coherent_mask(&self, mask: DmaMask) -> Result {
>      /// # Safety
>      ///
>      /// This method must not be called concurrently with any DMA allocation or mapping primitives,
> -    /// such as [`CoherentAllocation::alloc_attrs`].
> +    /// such as [`Coherent::zeroed`].
>      unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
>          // SAFETY:
>          // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
> @@ -102,7 +102,7 @@ unsafe fn dma_set_mask_and_coherent(&self, mask: DmaMask) -> Result {
>      /// # Safety
>      ///
>      /// This method must not be called concurrently with any DMA allocation or mapping primitives,
> -    /// such as [`CoherentAllocation::alloc_attrs`].
> +    /// such as [`Coherent::zeroed`].
>      unsafe fn dma_set_max_seg_size(&self, size: u32) {
>          // SAFETY:
>          // - By the type invariant of `device::Device`, `self.as_ref().as_raw()` is valid.
> @@ -202,12 +202,12 @@ pub const fn value(&self) -> u64 {
>  ///
>  /// ```
>  /// # use kernel::device::{Bound, Device};
> -/// use kernel::dma::{attrs::*, CoherentAllocation};
> +/// use kernel::dma::{attrs::*, Coherent};
>  ///
>  /// # fn test(dev: &Device<Bound>) -> Result {
>  /// let attribs = DMA_ATTR_FORCE_CONTIGUOUS | DMA_ATTR_NO_WARN;
> -/// let c: CoherentAllocation<u64> =
> -///     CoherentAllocation::alloc_attrs(dev, 4, GFP_KERNEL, attribs)?;
> +/// let c: Coherent<[u64]> =
> +///     Coherent::zeroed_slice_with_attrs(dev, 4, GFP_KERNEL, attribs)?;
>  /// # Ok::<(), Error>(()) }
>  /// ```
>  #[derive(Clone, Copy, PartialEq)]
> @@ -492,7 +492,6 @@ pub unsafe fn field_write<F: AsBytes>(&self, field: *mut F, val: F) {
>
>  impl<T: AsBytes + FromBytes> Coherent<T> {
>      /// Allocates a region of `T` of coherent memory.
> -    #[expect(unused)]
>      fn alloc_with_attrs(
>          dev: &device::Device<Bound>,
>          gfp_flags: kernel::alloc::Flags,
> @@ -529,6 +528,35 @@ fn alloc_with_attrs(
>          })
>      }
>
> +    /// Allocates a region of type `T` of coherent memory.

For consistency "Allocates a ZEROED region...".

> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// # use kernel::device::{Bound, Device};
> +    /// use kernel::dma::{attrs::*, Coherent};
> +    ///
> +    /// # fn test(dev: &Device<Bound>) -> Result {
> +    /// let c: Coherent<[u64; 4]> =
> +    ///     Coherent::zeroed_with_attrs(dev, GFP_KERNEL, DMA_ATTR_NO_WARN)?;
> +    /// # Ok::<(), Error>(()) }
> +    /// ```
> +    #[inline]
> +    pub fn zeroed_with_attrs(
> +        dev: &device::Device<Bound>,
> +        gfp_flags: kernel::alloc::Flags,
> +        dma_attrs: Attrs,
> +    ) -> Result<Self> {
> +        Self::alloc_with_attrs(dev, gfp_flags | __GFP_ZERO, dma_attrs)
> +    }
> +
> +    /// Performs the same functionality as [`Coherent::zeroed_with_attrs`], except the
> +    /// `dma_attrs` is 0 by default.
> +    #[inline]
> +    pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> Result<Self> {
> +        Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
> +    }
> +
>      /// Allocates a region of `[T; len]` of coherent memory.
>      fn alloc_slice_with_attrs(
>          dev: &device::Device<Bound>,
> @@ -572,6 +600,43 @@ fn alloc_slice_with_attrs(
>              dma_attrs,
>          })
>      }
> +
> +    /// Allocates a zeroed region of type `T` of coherent memory.

Should it be "of type `[T]`"?


Best regards,
Andreas Hindborg

