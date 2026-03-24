Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F5A12BDC3F;
	Tue, 24 Mar 2026 14:00:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360849; cv=none; b=jDuKFheHqC5sHFT2wlJAylv3kIzNM4bGptXCRltsvYBAvdwaQ9j8H76nZNVUfMa9nYQSbMWbZ2BONTnwxqPh5vmnCyYfhFujCsGETxPCb1gOY1iat2EvCQpAbNkRH8N5dsOB9hadTeTESiqQcXH8DLYf6HlKvNqQmZals4rmroM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360849; c=relaxed/simple;
	bh=c9NFAllBfGAlx/FFc3N9mnr4Kiv07CkCPahF9j8WHzw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bM5wTg+RTwRzRCkXBBN7gR4dJlZ9aeq5eD37pEYGk30gsvfs+F3WXxHqyqv8t9ahwvQzOb90jRd+V1K+fH0uJVLONCZ8XyJt7DacYALdVqdi2xgVu+brYEUpmsaeUz7Xz20gDjK1lS6ov2XE8P3VQn/ZCUDvggYGONKcWcRdOwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OlxVR12o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OlxVR12o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD2CC19424;
	Tue, 24 Mar 2026 14:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360848;
	bh=c9NFAllBfGAlx/FFc3N9mnr4Kiv07CkCPahF9j8WHzw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OlxVR12oL/BTtAOUzCP9vu1WlUnqcDXriXSDyGTfV4n87zTnVvAExFtGIIvowDd/m
	 zOEW5egUKzOahJ7/5wCpP6j88bE6760LMadtlzD/d8hnjU25KldG9nlYM+xO+a3Ykf
	 ywyzVhtyJWNTlEE/uLCnC2XFN9umt5d356KuUfXl5jrXjRg9uB9w9s8njzpcC7l3zg
	 z5Cy9vb4FutpeMYS65wWUriqKLaEYgh36dPFB+NYlvLXcwwoVhTiuhSF6sDCrVK1Vh
	 9MwnAOMySimEIbS6CayPYAljjpevcCZVq6lVuoF3+JW2D3N1jARYzm50iJQ+qyTZrD
	 1P3mmQylNIUUA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 4/8] rust: dma: introduce dma::CoherentBox for memory
 initialization
In-Reply-To: <20260320194626.36263-5-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <gL6L6Fep9fLly-cba79GEM8HZOGIkSWwerKYzGDnU_XryvpxJul4kyB2Hq8UaEi8PflcO7i_p7UMi7NCY26DGA==@protonmail.internalid>
 <20260320194626.36263-5-dakr@kernel.org>
Date: Tue, 24 Mar 2026 14:57:56 +0100
Message-ID: <871ph9qqhn.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> Currently, dma::Coherent cannot safely provide (mutable) access to its
> underlying memory because the memory might be concurrently accessed by a
> DMA device. This makes it difficult to safely initialize the memory
> before handing it over to the hardware.
>
> Introduce dma::CoherentBox, a type that encapsulates a dma::Coherent
> before its DMA address is exposed to the device. dma::CoherentBox can
> guarantee exclusive access to the inner dma::Coherent and implement
> Deref and DerefMut.
>
> Once the memory is properly initialized, dma::CoherentBox can be
> converted into a regular dma::Coherent.
>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---
>  rust/kernel/dma.rs | 154 ++++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 153 insertions(+), 1 deletion(-)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index db645b01bdd0..cefb54f0424a 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -20,7 +20,13 @@
>          FromBytes, //
>      }, //
>  };
> -use core::ptr::NonNull;
> +use core::{
> +    ops::{
> +        Deref,
> +        DerefMut, //
> +    },
> +    ptr::NonNull, //
> +};
>
>  /// DMA address type.
>  ///
> @@ -352,6 +358,152 @@ fn from(direction: DataDirection) -> Self {
>      }
>  }
>
> +/// CPU-owned DMA allocation that can be converted into a device-shared [`Coherent`] object.
> +///
> +/// Unlike [`Coherent`], a [`CoherentBox`] is guaranteed to be fully owned by the CPU -- its DMA
> +/// address is not exposed and it cannot be accessed by a device. This means it can safely be used
> +/// like a normal boxed allocation (e.g. direct reads, writes, and mutable slices are all safe).
> +///
> +/// A typical use is to allocate a [`CoherentBox`], populate it with normal CPU access, and then
> +/// convert it into a [`Coherent`] object to share it with the device.
> +///
> +/// # Examples
> +///
> +/// `CoherentBox<T>`:
> +///
> +/// ```
> +/// # use kernel::device::{
> +/// #     Bound,
> +/// #     Device,
> +/// # };
> +/// use kernel::dma::{attrs::*,
> +///     Coherent,
> +///     CoherentBox,
> +/// };
> +///
> +/// # fn test(dev: &Device<Bound>) -> Result {
> +/// let mut dmem: CoherentBox<u64> = CoherentBox::zeroed(dev, GFP_KERNEL)?;
> +/// *dmem = 42;
> +/// let dmem: Coherent<u64> = dmem.into();
> +/// # Ok::<(), Error>(()) }
> +/// ```
> +///
> +/// `CoherentBox<[T]>`:
> +///
> +///
> +/// ```
> +/// # use kernel::device::{
> +/// #     Bound,
> +/// #     Device,
> +/// # };
> +/// use kernel::dma::{attrs::*,
> +///     Coherent,
> +///     CoherentBox,
> +/// };
> +///
> +/// # fn test(dev: &Device<Bound>) -> Result {
> +/// let mut dmem: CoherentBox<[u64]> = CoherentBox::zeroed_slice(dev, 4, GFP_KERNEL)?;
> +/// dmem.fill(42);
> +/// let dmem: Coherent<[u64]> = dmem.into();
> +/// # Ok::<(), Error>(()) }
> +/// ```
> +pub struct CoherentBox<T: AsBytes + FromBytes + KnownSize + ?Sized>(Coherent<T>);
> +
> +impl<T: AsBytes + FromBytes> CoherentBox<[T]> {
> +    /// [`CoherentBox`] variant of [`Coherent::zeroed_slice_with_attrs`].
> +    #[inline]
> +    pub fn zeroed_slice_with_attrs(
> +        dev: &device::Device<Bound>,
> +        count: usize,
> +        gfp_flags: kernel::alloc::Flags,
> +        dma_attrs: Attrs,
> +    ) -> Result<Self> {
> +        Coherent::zeroed_slice_with_attrs(dev, count, gfp_flags, dma_attrs).map(Self)
> +    }
> +
> +    /// Same as [CoherentBox::zeroed_slice_with_attrs], but with `dma::Attrs(0)`.
> +    #[inline]
> +    pub fn zeroed_slice(
> +        dev: &device::Device<Bound>,
> +        count: usize,
> +        gfp_flags: kernel::alloc::Flags,
> +    ) -> Result<Self> {
> +        Self::zeroed_slice_with_attrs(dev, count, gfp_flags, Attrs(0))
> +    }
> +
> +    /// Initializes the element at `i` using the given initializer.
> +    ///
> +    /// Returns `EINVAL` if `i` is out of bounds.

Could you add an example for this function?


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



