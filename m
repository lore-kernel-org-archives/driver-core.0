Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CCBB4DF4A2;
	Thu,  3 Sep 2026 15:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788448939; cv=none; b=XK0z0eQvdIfKC4lSOC2wnnpFPJgFp6zM1WZD4nx/59nAb8/deqjtWiXmyjDVHPcpF6+FuKmCuUrqqPmconznClABOO/L1vgDhRg0A3zXB6WkBpHHylpb4uc5VSI7T6mzRrfMzHiSnkTbfV51sH/s7WQXa09Sk40a5sthXxUKra0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788448939; c=relaxed/simple;
	bh=PcXxxwCTnzehzGMzQoqnWWgaMatnZIxaOQ2uYpkUAbE=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=hHmn3pwTUMCV8rQa93K1xQfb0F5uXfgZZLIr6NMtEQtICLuMadaHDgLTlWiklf8FGbuEE/JDsDLa/HeOnAQUvTfw9UZw7TD8eQ35sm8QDWWX1zi6aMMGW9uasvviRnFnYeViuiikIOstBMNyHFM620bEJHyumxVPAAN5xcsYv/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XBinxCR1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XBinxCR1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2942E1F00A3D;
	Thu,  3 Sep 2026 15:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788448936;
	bh=97e7qrSzX/ZtIU5zWdvsLVLhVR/0e5d9mRjt9LLxTdg=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=XBinxCR1UD+x0sekijLE69dkySTfSbrP3sWqa66IukpE32zQg1ga+2a6+C9/8JmZc
	 67hf0YLkfESvYO8IUlgSEvfOEqLmHRtnWk3Z98YpF0Ppg3FyzPEGDDfTarh+HziT33
	 LyIHYMcqz3ZtnLInmpQpvLLfOZ25ULoQDWRylgD3F3rZlLiyZ+u3YzuSaezGWKhfwT
	 MUSZc8wGmP6B+D3IMoAezVdZ2YQv0u1zGfVwoR/S1qmzzD3dgFVJyzRbnk9HmbpGO5
	 AY3TdHs1C7HEJk5DVFOH9xCj3EyoTrvTPzYWb9bIKuqbqtVdKoWBRCdaKIaRYWaYoT
	 NFDC+9eNm1qeA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 03 Sep 2026 17:22:10 +0200
Message-Id: <DL5S8GFKETAW.1UD50XK77ZPA6@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 4/4] rust: dma: tie Coherent and CoherentBox to the
 device's bound lifetime
Cc: <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>,
 <gregkh@linuxfoundation.org>, <rafael@kernel.org>, <aliceryhl@google.com>,
 <acourbot@nvidia.com>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <tmgross@umich.edu>,
 <tamird@kernel.org>, <work@onurozkan.dev>, <mmaurer@google.com>,
 <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
References: <20260830193824.471089-1-dakr@kernel.org>
 <20260830193824.471089-5-dakr@kernel.org>
 <DL5PMZZO1S7X.3BMZVKVUMYVM0@garyguo.net>
In-Reply-To: <DL5PMZZO1S7X.3BMZVKVUMYVM0@garyguo.net>

On Thu Sep 3, 2026 at 3:20 PM CEST, Gary Guo wrote:
> The rust/kernel code looks good to me. Haven't checked nova part in detai=
l, but
> it looks like a mechanical conversion, so would be fine if it builds.
>
> Reviewed-by: Gary Guo <gary@garyguo.net>
>
> Sashiko points out that the `Coherent` could be leaked -- what's the impl=
ication
> when that happens? I think it's not going to be as problematic like
> registrations because coherent allocation carries no callbacks, so we pro=
bably
> don't need this to be unsafe, but I do wonder how'd DMA subsystem handle =
this.

The implication if leaked is the same as if it is kept alive past driver un=
bind,
which is why I changed the TODO comment accordingly in the hunk below.

If you look for a specific example, there's [1] for instance. So, it is
problematic, which is why I added the TODO comment back then.

But, we did accept this soundness hole from the get-go for both, keeping a
coherent allocation alive beyond driver unbind and for leaking it.

With this patch it is now impossible to keep it alive beyond driver unbind,=
 so
switching to unsafe now would be a bit odd. :)

(The fact that we did accept this for coherent allocations is also one reas=
on
why I was recently arguing that we can also make the forget() issue an acce=
pted
soundness hole for registrations.)

[1] https://lore.kernel.org/all/6a7910da.9c11d2ce.289b96.00da.GAE@google.co=
m/

@@ -588,26 +587,20 @@ fn from(value: CoherentBox<T>) -> Self {
 ///   to an allocated region of coherent memory and `dma_addr` is the DMA =
address base of the
 ///   region.
 /// - The size in bytes of the allocation is equal to size information via=
 pointer.
-// TODO
 //
-// DMA allocations potentially carry device resources (e.g.IOMMU mappings)=
, hence for soundness
-// reasons DMA allocation would need to be embedded in a `Devres` containe=
r, in order to ensure
-// that device resources can never survive device unbind.
-//
-// However, it is neither desirable nor necessary to protect the allocated=
 memory of the DMA
-// allocation from surviving device unbind; it would require RCU read side=
 critical sections to
-// access the memory, which may require subsequent unnecessary copies.
-//
-// Hence, find a way to revoke the device resources of a `Coherent`, but n=
ot the
-// entire `Coherent` including the allocated memory itself.
-pub struct Coherent<T: KnownSize + ?Sized> {
-    dev: ARef<device::Device>,
+// The lifetime parameter ties DMA allocations to the device's bound scope=
, ensuring they are freed
+// before the device is unbound under normal circumstances. However, if a =
`Coherent` is leaked (e.g.
+// via `mem::forget`), device resources such as IOMMU mappings will not be=
 released.  Making all
+// constructors `unsafe` to prevent this is considered too restrictive for=
 the common case; this
+// soundness hole is accepted for now.
+pub struct Coherent<'a, T: KnownSize + ?Sized> {
+    dev: &'a device::Device<Bound>,
     dma_addr: DmaAddress,
     cpu_addr: NonNull<T>,
     dma_attrs: Attrs,
 }
