Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795030524;
	b=Lkqs7596F28TZlB3OUzRPxs4kphrQ2SV3eOgeZJdWVEs1H9Iz/1BzPtEq1PGXHyTggML
	 qUAmSOFYEBYf1OaCFyIKru4+V7dQEVjqCafQJ6P3NVPiRGMeBA7FHX00Ju6DL3CsNMunM
	 f0k4+al9JiyLrPxoHQnTdvWR8qRWSJk6W3FD2jQUDJquihKtYMlzJyQRjmwzjFL7jzL5Y
	 mJTb+xontPgKBpbho61LjXEbt/nsCf74mQPKRT87G+X4ImuDFgVUHMlJYsY7fOzzXmbJx
	 bHvr0CM5l4tbFgZKazh71Bw2kABbVJAuc/Pn7dAl8DYy0R0C7EkWcOCK190VgQj1Kag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795030524;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=svDhZvS2nvuMtlSX/aJAYIzvYs1mM+RCPAdRdKGv9lw=;
	b=zg1C3XTID0fdEWcx0w1GhWW3EJmu5tn2bX8UY5/ubn5ufERm0xEE+uSn4TqNeCzepMXv
	 Kb+wWB0M3+ugVcNYl5lmQF5c44YAedCwDwjsDH1ZV/eijsGRIxG/dCHRB+utZzzk5GtSh
	 C5k8c7WVrndvVXhi/1403aypKparDalvbXvxj5qu+bh77D0TzpgThxti6pswZ8MKx2oj3
	 Wx59meCaMvneLNunFdqFz6ZvESVF7TdPaJ2LFwRzC3VMlqVDa1HkWiqdoUJM0zl+57DvZ
	 TXk80XcbRwF+wqbjESxOR6Qgubs3l8GfYYpPoGpu5Q1B47lGY2pjw20RD+bMVffIzug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HMaPEjds;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F9D8606C416
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 19:35:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F9D8606C416
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=HMaPEjds
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53669f7b518so14002491cf.2
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 11:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795030523; x=1795635323; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=svDhZvS2nvuMtlSX/aJAYIzvYs1mM+RCPAdRdKGv9lw=;
        b=HMaPEjdst1d34xKSSi9QgwAv2oJbaNL7vefx1tABgF/L1UUjpF6PRbHsei3Uj8i81P
         rC28CaGajDRnYyuJ1q0+R/4Zwyono1tJUGFBpTmjxBR1HKXQu8NYIY/WSMWAgOCdFaJ/
         e0054edpsBlS6h9ayTGsQ7SgRB5VYInXAls2hmSCJrswSXReysBg3sZc0Jr+lTTC4dZ7
         GO4Fh9k+ct3IR7GOANFc1Du2XOjdnTcN/RhtlNW6uGMsXbpfcSDOZbJEoterYgjzPt3a
         F6b6yu+N4tUFlOdoeG8Kr4Admwo9YcGVj2G6xSuShx75EeR0U/x9atrXmJBXgG8gR72k
         XBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795030523; x=1795635323;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svDhZvS2nvuMtlSX/aJAYIzvYs1mM+RCPAdRdKGv9lw=;
        b=1C7xNZljB0VYZo4rilQEVEfvW1cB7pbWDIDl+HTEk3Cow+SdA6Yx2tGpYmtp2GcR3M
         OrEOOfjNFjwyP+tztS8+59+OtM5m08YFjNb6ntCSjcn6joKgY9a/hJVUcgZpKLyO0T/3
         P+e7fFd0A5w9Eqq+DrJtrh0L/x/oAU089maSKQDSXHUw+NPjs2gw0wgOcFPSTOAKnyML
         DBDl0bx00v/v4UZ7Yg+Y1+NaW8vUp7JViH8FS5agtugzZxM4cp08q7nFfgeXGnROymWe
         QrmjOuOAUy/DKYD7mfbjHysanCq3DBsfX5iuVxf+d17Jlti9BQrFAQ7+qnmK1/mwRaXZ
         nWtw==
X-Forwarded-Encrypted: i=1; AL+hErHRTSxmiYYed6QptU98xct8xspkFMowGD/CjoCYFjeREB5sby9XkxCF3KLFjpJAIshC35kjgTxwB0XR0g==@lists.linux.dev
X-Gm-Message-State: APuU4Z83ry7Nxe9dPzKE5EnBaQp7m/iqKEOslT7RvTIqw46DmDIwgbXK
	OdMUqsE28psvS4qxr7SQYUB/7hKm/dMvGlIWZlq2oD6rQ4706ZUOsl6e/CyycSUXePE=
X-Gm-Gg: AYBFou2W6j2A4Va5Jy3XefDMrbQdA/biS2BZIftIN8h4mCrd6q2aSKg9G1CHr4DIuFx
	n7KZj4OhsUoOvg9qE6xKprw11srE9rBgsL+woI43fpCIGqSAGi439ptp4CuhbpfUuav/Fww3ZiP
	D8cnI2V1C/w1D58MS9UzraZberbp0bgXnxZsqHmttWGYWEGdgtyCUjX73TRUppmWOeD3UYVaw1V
	sAliIJrvfWqtcByxe9CLS4wDlPZN69qjjYsDng6dI76btwToE6xM8xnzUpw6/DKZqdfG6aoUpl/
	hR4XYliZi9OyaXTicOPeaAnsc9SyvjzkbKVcFIt3FHrhoY63CQjZUa+pOZdvlgh/YO0NczszBHq
	puczSzGk+prXOBhHMhhYe2C2L8upDtvgc5VWfgGv8PIYJYBcjkG8powX0db5faXJaI43LXjYO63
	fiIQ1hP48DhXzMTRU4Nxw25LCm3dBHVVcLyBA+j2Nn3+U/BJ1ooZtF/PA5tVVrnvA+U0OjEVaOK
	+t+Li7hmCXgPP0O2lAWyRHpi/StClKDqk/H2bPaMmE6E19fswmcnTZfytVFeFdroTL5k3Bm1Q4P
	6WpuzA==
X-Received: by 2002:a05:622a:4c08:b0:55d:2dd1:48c8 with SMTP id d75a77b69052e-55d5a80a719mr59797531cf.67.1795030523112;
        Wed, 18 Nov 2026 11:35:23 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66b24f4dsm7057611cf.5.2026.11.18.11.35.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:35:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTlRB-0000000GGIL-2q4J;
	Wed, 18 Nov 2026 15:35:21 -0400
Date: Wed, 18 Nov 2026 15:35:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261118193521.GD3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>
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
In-Reply-To: <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>

On Wed, Nov 18, 2026 at 04:11:40PM -0300, Daniel Almeida wrote:
> 
> > On 17 Nov 2026, at 17:20, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > 
> > On Tue, Nov 17, 2026 at 05:09:11PM -0300, Daniel Almeida wrote:
> >> Hi Jason,
> >> 
> >>> On 16 Nov 2026, at 16:38, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >>> 
> >>> On Thu, Nov 12, 2026 at 02:00:07PM -0300, Daniel Almeida wrote:
> >>>> This series adds a Rust abstraction for IOMMU paging domains. A driver
> >>>> can allocate a domain, attach it to its device, map pages into it, and
> >>>> install a handler for its faults.
> >>>> 
> >>>> This will be used by the upcoming rkvenc driver that my colleagues
> >>>> Detlev Casanova, Nicolas Dufresne and I are working on. More details on
> >>>> this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> >>>> [0].
> >>>> 
> >>>> As part of the security model, each client will have its own IOMMU
> >>>> domain. This is needed as the submission model will let userspace set
> >>>> most of the encoder's registers directly, so the kernel cannot check
> >>>> every memory access that a job makes the encoder do. With a single
> >>>> domain, one client could make the encoder read or write the memory of
> >>>> another client.
> >>> 
> >>> How do you plan to get the paging domain in the first place?
> >> 
> >> We plan to alloc a paging domain when a video encoder session is created. Then
> >> we call iommu_attach_device() before a job runs, and detach back to the default
> >> domain after it finishes so the next job can attach its own session's domain.
> >> This is so each session is isolated from each other.
> > 
> > If you do that you can't use the DMA API at all in your driver as you
> > have to set 'driver_managed = true'. Is it OK? If it is why not just
> > use VFIO?
> 
> No, not OK :/ We want to use GEM shmem, which calls into the DMA API internally
> through drm_gem_shmem_get_pages_sgt() -> dma_map_sgtable().

You cannot continue to use DMA API once you start touching a paging
domain directly. It is why driver_managed exist.

If you want to use the DMA API you need two struct devices and now you
are into DT abuse land.

So what exactly are you planning on doing

And why do you need the paging domain at all if you are using the DMA
API?

> The CPU mappings are write-combined, so the only cache maintenance is the clean
> of newly allocated pages, which dma_map_sgtable() does in
> drm_gem_shmem_get_pages_sgt(). 

Yes, this is why you should be using the DMA API, that doesn't explain
how any direct use of a paging domain will work.

> The mappings themselves are chosen by the kernel driver. We don't
> care about what the actual IOVA is. All we care about is that a
> given GEM object is mapped to a given domain, and that we have some
> IOVA representing the start of the allocation, such that we can pass
> that to the device.

Wonderful, what is the paging domain for?

> > Are you sure you shouldn't be using iommufd for this, tied into your
> > driver? It was intended for exactly this use case, to allow drivers to
> > delegate their translation to userspace. Though that doesn't relly
> > solve the questions about what it is even being attached to..
> 
> I had a cursory look at iommufd, but it seems like:
> 
> a) it requires IOMMU_CAP_CACHE_COHERENCY, which is not offered by the rk_iommu
> backing the RK3588 SoC we are currently targeting. In fact, IIUC, this does not
> seem to be possible, since the encoder is not cache coherent with the CPU?
> I.e., does iommufd expect hardware cache coherency/snooping?

*Linux* expects coherency, if you are DMAing direcly to user cachable
memory and you aren't coherent there are issues, and minimally your
driver would have to do the cache flushing.

Which we have deliberately made it so drivers cannot do to force them
to use the DMA API.

This is one of the unresolved problems if a driver tries to use a
paging domain directly.

> b) there is no way to do what I said above about GEM, i.e.: there is no
> connection between iommufd and GEM.

Right, because you started out saying you wanted userspace to control
the mapping and put user memory into it. Kernel controlled GEM
mappings is something entirely different.

> You seem to be saying that what I'm proposing here has a few pitfalls that have
> come up over the years. Perhaps we can massage iommufd to make our use case
> work? I can volunteer to do whatever work is needed, of course.

I am very confused about what you are even doing. Can you explain more
clearly please? What does you DT look like? What do your attach calls
do? How many struct devices do you have? Who is calling the DMA API?
Who is mapping the paging domain? And who handles cache flushing
issues for your incoherent architecture?

Jason
