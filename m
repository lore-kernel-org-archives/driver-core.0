Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 62B663EF64A
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 11:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786015431; cv=none; b=kfOWOeZbOmOQYyrAdWzE53eOLzTKzGBUK9XBwV0n2rOuwueEChQ9+r3d49m885kMddyJ0A/kLDTRPgbTwH3JstWdBFsvE2gg9F5knBRe0fpHzExnp+KiuNmPfWsftyDzeyqM8Q86yZf+vfgxt0rqwHzLPgoc8A8Sgav1dgkiMtY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786015431; c=relaxed/simple;
	bh=c2Gipq472dZI6V9ZDKpSMkoj+IqRzm9wm1cHn3mUero=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E5uHumrp55KcDewz5T3wjfC84A+yonNwlupXXwgm42CzKAd6t/guiiRwgPc8zct2IQp8oJuwO2Kj2F6Xz2HvQexoZgybWd/p5jsfexBvidfjUnhZdUpdupP2+6BiNgeqz6aXIySahTZng7qgfcgFEkdtgCsPDbxUYEixaNl+lB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=NhZkcbGy; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="NhZkcbGy"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 753BF16F2;
	Thu,  6 Aug 2026 04:23:41 -0700 (PDT)
Received: from [10.57.42.103] (unknown [10.57.42.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D08093F66F;
	Thu,  6 Aug 2026 04:23:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786015425; bh=c2Gipq472dZI6V9ZDKpSMkoj+IqRzm9wm1cHn3mUero=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NhZkcbGyQ71yn3t2AAGo0omBfU0NeJlv8oO83g80xqPMh9oJCroHiZo2hxXbkXLtT
	 x4oUcVTKLCU4h8srSplWJt65L5IFfzQYcy2idzuzIa4T4hAaBhqPttWL4yGCj/eKkR
	 MRjFTETLO/3ZvK3OI0EkN7rPdbgITYQDOU2u7i6Q=
Message-ID: <cc71c517-8097-48c4-80b3-77ad9f6d4759@arm.com>
Date: Thu, 6 Aug 2026 12:23:32 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: dma: add `Range` type
To: Vasileios Almpanis <vasilisalmpanis@gmail.com>,
 Danilo Krummrich <dakr@kernel.org>,
 Abdiel Janulgue <abdiel.janulgue@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?=
 <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260806-dma-v1-1-e8a39327c7f5@gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260806-dma-v1-1-e8a39327c7f5@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-08-06 8:46 am, Vasileios Almpanis wrote:
> The base dma address of `Coherent` and `CoherentHandle` is a bare
> `DmaAddress` integer so any arithmetic, a driver does on it is unchecked
> and can potentially go past the end of the allocation or overflow.
> 
> Add a `dma::Range` type that couples a base `DmaAddress` with a length
> and only hands out addresses and sub-ranges within `[start, start + len)`
> with all arithmetics checked against both the length and the overflow of
> of the underlying `dma_addr_t`. Let `Coherent` and `CoherentHandle`
> provide the `Range` covering their allocation.
> 
> Suggested-by: Danilo Krummrich <dakr@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1248
> Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>
> ---
> This is one of my first rust-for-linux patches, so any suggestions are
> extremely welcome. Some words about the decisions taken:
> 
> - I chose lengths offsets to be `DmaAddress` instead of usize since the
>    bus space can be 64-bit on 32-bit CPUS.

The base address may be 64-bit, but the underlying dma_alloc_*/dma_map_* 
APIs all express lengths in size_t, so we shouldn't need to accommodate 
anything larger in Rust either. Sizes-as-address-types always seem a bit 
weird and clunky (lookin' at you, resource_size_t...), so probably 
better avoided if not absolutely necessary, IMO.

Thanks,
Robin.

> - The constructor returns EOVERFLOW for `dma_addr_t` overflow, while
>    out-of-bounds requests return EINVAL; happy to use a single error
>    code if preferred.
> 
> - `dma_range()` is added to both `Coherent` and `CoherentHandle` so the
>    type has users from the start. I could split it into a follow-up if
>    that is preferred.
> 
> Tested with `make rustdoc`, `make rustfmtcheck`, `CLIPPY=1`, and the
> KUnit doctests `rust_doctests_kernel`.
> ---
>   rust/kernel/dma.rs | 174 +++++++++++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 174 insertions(+)
> 
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index 200def84fb69e006bca0b1c578bac9f1dc8da708..e65e99ae4d915ac2e385df8b72fc518c07e4c82d 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -41,6 +41,142 @@
>   /// Note that this may be `u64` even on 32-bit architectures.
>   pub type DmaAddress = bindings::dma_addr_t;
>   
> +/// A range of DMA addresses.
> +///
> +/// Couples a base [`DmaAddress`] with the length in bytes of the region it belongs to,
> +/// representing the half-open range `[start, start + len)` of DMA addresses.
> +///
> +/// Unlike a bare [`DmaAddress`], a [`Range`] only hands out addresses and sub-ranges that are
> +/// guaranteed to lie within `[start, start + len)`; all arithmetic is checked against both the
> +/// length of the range and overflow of the underlying [`DmaAddress`].
> +///
> +/// # Invariants
> +///
> +/// `start + len` does not overflow [`DmaAddress`].
> +#[derive(Clone, Copy, Debug, PartialEq, Eq)]
> +pub struct Range {
> +    start: DmaAddress,
> +    len: DmaAddress,
> +}
> +
> +impl Range {
> +    /// Creates a new [`Range`] of `len` bytes, starting at `start`.
> +    ///
> +    /// Returns [`EOVERFLOW`] if `start + len` overflows [`DmaAddress`].
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::dma::{DmaAddress, Range};
> +    ///
> +    /// let range = Range::new(0x1000, 0x200)?;
> +    /// assert_eq!(range.start(), 0x1000);
> +    /// assert_eq!(range.end(), 0x1200);
> +    /// assert_eq!(range.len(), 0x200);
> +    ///
> +    /// assert!(Range::new(DmaAddress::MAX, 1).is_err());
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    pub const fn new(start: DmaAddress, len: DmaAddress) -> Result<Self> {
> +        if start.checked_add(len).is_none() {
> +            return Err(EOVERFLOW);
> +        }
> +
> +        // INVARIANT: We just checked that `start + len` does not overflow `DmaAddress`.
> +        Ok(Self { start, len })
> +    }
> +
> +    /// Returns the first address of the range.
> +    #[inline]
> +    pub const fn start(&self) -> DmaAddress {
> +        self.start
> +    }
> +
> +    /// Returns the first address after the end of the range.
> +    #[inline]
> +    pub const fn end(&self) -> DmaAddress {
> +        // By the type invariant, `start + len` does not overflow `DmaAddress`.
> +        self.start + self.len
> +    }
> +
> +    /// Returns the length of the range in bytes.
> +    #[inline]
> +    pub const fn len(&self) -> DmaAddress {
> +        self.len
> +    }
> +
> +    /// Returns `true` if the range is empty.
> +    #[inline]
> +    pub const fn is_empty(&self) -> bool {
> +        self.len == 0
> +    }
> +
> +    /// Returns the address at `offset` bytes into the range.
> +    ///
> +    /// The returned address is guaranteed to lie within the range; returns [`EINVAL`] if `offset`
> +    /// is not smaller than the length of the range.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::dma::Range;
> +    ///
> +    /// let range = Range::new(0x1000, 0x200)?;
> +    ///
> +    /// assert_eq!(range.address(0)?, 0x1000);
> +    /// assert_eq!(range.address(0x1ff)?, 0x11ff);
> +    /// assert!(range.address(0x200).is_err());
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    pub const fn address(&self, offset: DmaAddress) -> Result<DmaAddress> {
> +        if offset >= self.len {
> +            return Err(EINVAL);
> +        }
> +
> +        // By the type invariant, `start + offset < start + len` does not overflow `DmaAddress`.
> +        Ok(self.start + offset)
> +    }
> +
> +    /// Returns the sub-range of `len` bytes, starting `offset` bytes into the range.
> +    ///
> +    /// The returned range is guaranteed to lie within the range; returns [`EINVAL`] if
> +    /// `offset + len` overflows [`DmaAddress`] or exceeds the length of the range.
> +    ///
> +    /// # Examples
> +    ///
> +    /// ```
> +    /// use kernel::dma::Range;
> +    ///
> +    /// let range = Range::new(0x1000, 0x200)?;
> +    ///
> +    /// let sub = range.subrange(0x100, 0x80)?;
> +    /// assert_eq!(sub.start(), 0x1100);
> +    /// assert_eq!(sub.end(), 0x1180);
> +    ///
> +    /// assert!(range.subrange(0x100, 0x101).is_err());
> +    /// # Ok::<(), Error>(())
> +    /// ```
> +    #[inline]
> +    pub const fn subrange(&self, offset: DmaAddress, len: DmaAddress) -> Result<Self> {
> +        let Some(end) = offset.checked_add(len) else {
> +            return Err(EINVAL);
> +        };
> +
> +        if end > self.len {
> +            return Err(EINVAL);
> +        }
> +
> +        // INVARIANT: `start + offset + len <= start + self.len`, which by the type invariant of
> +        // `self` does not overflow `DmaAddress`.
> +        Ok(Self {
> +            start: self.start + offset,
> +            len,
> +        })
> +    }
> +}
> +
>   /// Trait to be implemented by DMA capable bus devices.
>   ///
>   /// The [`dma::Device`](Device) trait should be implemented by bus specific device representations,
> @@ -626,6 +762,25 @@ pub fn dma_handle(&self) -> DmaAddress {
>           self.dma_handle
>       }
>   
> +    /// Returns the [`Range`] of DMA addresses covering this allocation.
> +    ///
> +    /// Unlike [`Self::dma_handle`], which hands out the base address as a bare integer, the
> +    /// returned [`Range`] couples the base address with the size of the allocation, such that
> +    /// any offset arithmetic performed on it is checked.
> +    #[inline]
> +    pub fn dma_range(&self) -> Range {
> +        // INVARIANT: By the type invariants of `Self`, `dma_handle` is the DMA address base of an
> +        // allocated region of `self.size()` bytes; the DMA API guarantees that a mapped region
> +        // never wraps the DMA address space, hence `dma_handle + size` does not overflow
> +        // `DmaAddress`.
> +        Range {
> +            start: self.dma_handle,
> +            // CAST: `usize` always fits in `DmaAddress`, which is at least 32 bits wide and
> +            // always 64 bits wide on 64-bit architectures.
> +            len: self.size() as DmaAddress,
> +        }
> +    }
> +
>       /// Returns a reference to the data in the region.
>       ///
>       /// # Safety
> @@ -1101,6 +1256,25 @@ pub fn dma_handle(&self) -> DmaAddress {
>           self.dma_handle
>       }
>   
> +    /// Returns the [`Range`] of DMA addresses covering this allocation.
> +    ///
> +    /// Unlike [`Self::dma_handle`], which hands out the base address as a bare integer, the
> +    /// returned [`Range`] couples the base address with the size of the allocation, such that
> +    /// any offset arithmetic performed on it is checked.
> +    #[inline]
> +    pub fn dma_range(&self) -> Range {
> +        // INVARIANT: By the type invariants of `Self`, `dma_handle` is the DMA address base of an
> +        // allocated region of `self.size` bytes; the DMA API guarantees that a mapped region
> +        // never wraps the DMA address space, hence `dma_handle + size` does not overflow
> +        // `DmaAddress`.
> +        Range {
> +            start: self.dma_handle,
> +            // CAST: `usize` always fits in `DmaAddress`, which is at least 32 bits wide and
> +            // always 64 bits wide on 64-bit architectures.
> +            len: self.size as DmaAddress,
> +        }
> +    }
> +
>       /// Returns the size in bytes of this allocation.
>       #[inline]
>       pub fn size(&self) -> usize {
> 
> ---
> base-commit: dc01dfb37b34beeefcfe1c3055364d41a4070c7e
> change-id: 20260805-dma-7c5330baadb6
> 
> Best regards,

