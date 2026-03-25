Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9704D3F99E6;
	Wed, 25 Mar 2026 17:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774459093; cv=none; b=k8Bqe9T0s23E0f9xXajYOucaJiNFO5FevnKzK6lRkXNh6WuMQdzTUy/rUJLwr8C2/TBCuKCye8nTl8Pol/s7BQbGzH6XL9nbaE4DVK5tZwf1VI3gxaF+kR/QToejOl47JPE0gtcqjJhIv+eD+YxbBeHBoZ8jh3dDUYMMiMMI3f4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774459093; c=relaxed/simple;
	bh=0fBfWeIIFkvFpJ/w6Gv7D1h3sk9JhSOecX0AjOrLVkU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=sCl3VXvBbsDkht8ZGZOD9MW8IM+KeCTTQ7ME3a0Bn88nVvBnzj5S/J6PG4Lt4ycYJrIaXDegP3VT+Qj5VST2y8QJr2+Jif1RgZasJbACyknCJIzu1ww1DNFtYV2ZMSd5097XhXMwbmDnCK47kNuEcDdbuAoF8egnF4AY4YK2A4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zah/GRkY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zah/GRkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8079FC19423;
	Wed, 25 Mar 2026 17:18:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774459093;
	bh=0fBfWeIIFkvFpJ/w6Gv7D1h3sk9JhSOecX0AjOrLVkU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=Zah/GRkYWhvdGgUd3jh/lxFfWPnYkLwpdy/sjEK94pJsF1VBgrWXwExxlhH/YMcPw
	 eo6dTshTWUmU0QeyKiUI0hOuK/SlYWbxkvMuiFcXQvFeCBbvkOrdeocDK5oN7lLFeL
	 hQDGXqoSlwIDZOpo6+QyDk4pLRhcFr/+nWkW3lj2GyMtPB55pW36exxiQHgBrzKBre
	 5WuQgs1z1I837yKh8cHzcsyh+1fZBeiaZOfy+pNx/Lvnfb/M0J3WxkHoutgMSUOoub
	 j8X2z/SDphONA6/GEm6lAPhOVVDEmWZVGmedojMgNcnrEoEQ940R+h5Gi3eofGJRzR
	 5ImUbQT2b+Mqw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 25 Mar 2026 18:18:08 +0100
Message-Id: <DHC18ZPBO3X4.1P6GJKSE0IMK8@kernel.org>
Subject: Re: [PATCH 2/2] rust: dma: add CoherentHandle for DMA allocations
 without kernel mapping
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <aliceryhl@google.com>, <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260321172749.592387-1-dakr@kernel.org>
 <20260321172749.592387-2-dakr@kernel.org>
 <DHBAADML4BXP.131CD8C26BELH@garyguo.net>
 <DHBD2BO4R5BM.3OS7AHYN9A7DZ@kernel.org>
 <DHBVYVW7ZTDA.23N0Z3YOC5735@garyguo.net>
In-Reply-To: <DHBVYVW7ZTDA.23N0Z3YOC5735@garyguo.net>

On Wed Mar 25, 2026 at 2:09 PM CET, Gary Guo wrote:
> This only gives you fixed size, though. If you want the same type that su=
pports
> both a fixed size and dynamic size, then a generic that is either array/s=
lice is
> the way to go.

[...]

> You still can use `io_project!(handle, [start..end]?)` to do the bounds
> checking. But as you said, the benefit might be minimal.

I think we shouldn't overengineer this for now, and wait for actual use-cas=
es
that require any of that.

The only thing we need right now in practice is an API that takes the size =
and
returns a handle to the buffer of this size exposing the DMA address that i=
s
subsequently passed to the device without further modification.

So, if we want to re-use dma::Coherent<T>, we can just do this

	pub struct CoherentHandle(Coherent<[u8]>);
=09
	impl CoherentHandle {
	    pub fn alloc_with_attrs(
	        dev: &device::Device<Bound>,
	        size: usize,
	        gfp_flags: kernel::alloc::Flags,
	        dma_attrs: Attrs,
	    ) -> Result<Self> {
	        let dma_attrs =3D dma_attrs | Attrs(bindings::DMA_ATTR_NO_KERNEL_M=
APPING);
	        Coherent::<u8>::alloc_slice_with_attrs(dev, size, gfp_flags, dma_a=
ttrs).map(Self)
	    }
=09
	    #[inline]
	    pub fn alloc(
	        dev: &device::Device<Bound>,
	        size: usize,
	        gfp_flags: kernel::alloc::Flags,
	    ) -> Result<Self> {
	        Self::alloc_with_attrs(dev, size, gfp_flags, Attrs(0))
	    }
=09
	    #[inline]
	    pub fn dma_handle(&self) -> DmaAddress {
	        self.0.dma_handle()
	    }
=09
	    #[inline]
	    pub fn size(&self) -> usize {
	        self.0.size()
	    }
	}

and add a guarantee that Coherent::alloc_with_attrs() and Coherent::drop() =
never
touch the cpu_ptr.
