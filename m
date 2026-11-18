Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795035989;
	b=SZkLcZFybMTDI6T7qWc02pSCH4/kAX0LF9p7L5N/TisseJkJCAsUGwPr8dW305AaLlZ0
	 85ITZ4NcnoPGk+NZCEBNogZswO9ytjPzm4IYMu/VCyzjTq0dFma0uoJiP66AM5ExMEwZ8
	 Rek0ingf+c9QCkCthbHJM8aoMSFdRLbm8jQBjsTXYYnOHWmKeCIe26ZXJQYrOm2laM1zq
	 XLWTZ7YHtak9jzGLvh+ZYrOiS7VoWjKbKgp2tkbqSFrU1qECraoHDygy4bonJyYCjmZyj
	 VHqMb4IkmENbSIncpxugH1MPanVzKtzcghl0sL3xtroSFwln5FyIJRpxPRU9UlPqW6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795035989;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=pZ3JtacZcjsrcECbYipQCJ4gvP+CBNK95VHZ3UWM6ww=;
	b=uQbqCzDa2Eurv6PPA70LVyIO4BRLZSNpF6501ENa67nl70VnNe1QYhUgh1TaKtmRSZJq
	 1FykY59WllV8nYlp6sHMUXOWcxQ7hJj0hPqMTjn2Oxtme9Gva25kPT9OUavWwpA2v+NFf
	 /1/oYu2KuHH53OfVUSBkaeuKhJcjZtuXnXnxWO2ja928rhw2T62GlaLeuljWRgBn5f0Vt
	 huAVHw0oxzG4ftKgJBhQqFW+HE9TbgM3ITibZQZibLhtAn7HIEjU+sHytjSDLITTN1b3W
	 VvQbUdZJc1ssN29dHNPxiTzu2Pv7WpmkgLgRzJwmb9paZ4zZ/95eKR3ascba/kF6x/A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SDeNQrCR;
	arc=none smtp.remote-ip=209.85.222.180
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 512F8606A32A
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 21:06:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 512F8606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=SDeNQrCR
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-949680e6d83so151719585a.3
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 13:06:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795035988; x=1795640788; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pZ3JtacZcjsrcECbYipQCJ4gvP+CBNK95VHZ3UWM6ww=;
        b=SDeNQrCRna9AR1VBjeQJYkkWxa+pmn5iKdupNKJHm6DdWeUW4FXqvbJalHujSMUyZU
         6IMVdXy6NG5y9qpdchzEefMWcV98Ctmt8oXVFiR38kNdwKvChW0C8I70q12DvXZ36rEB
         PkECHjemMww104SXFvX2M3E5gPb4548Kr80xxAWW6dwwIjzEk3bEqIZ9Uwx2F1UWYNpU
         nwtgCnuGMv3ovXe881UvLxEjKWJcAgxQ0L9NCtOtw7VyUZMsB6kBAceftR3dBTZ4KIYB
         eqYudpF5GcuqehBXRRrKJ41a68ocKT7EDmM43eSd0vzfKc8WnWBdpwcUdFooxo+KyBi7
         bPfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795035988; x=1795640788;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=pZ3JtacZcjsrcECbYipQCJ4gvP+CBNK95VHZ3UWM6ww=;
        b=GrZEvb1ljj+FtxWlkT2SyJAIEPAVZAyVP/U+dRgLwIf/nS8d/EN8HUQ82CzEKEcJHN
         AeWfkNFWjEQb7cjH8zQk69b1MYsGUyKWJWgaSI+emMvxu3Aq/krnl4E10wC+P/Ts+FHX
         GLLwjblMKU20R233pvYbpy7rCTudtEc0ha3Z1AvIOS5WvFOB2mklZP9z+I1lneZjCUu8
         FAjaRIqnwfwj+yLeSGN5GX0+o6FXj5YJlcCRhHdWANbl9MF69cSyzNUmsAs7em4itNyX
         YBqdC26Mp9HfByxbHesuXD2N4k4xIg82okwpRTd16G8Q1nQfZB4Y9Z2ukwIFhqrR2d8h
         +N3A==
X-Forwarded-Encrypted: i=1; AL+hErEklftZzhCHu281NTi2hvxp/Wxq4CqWPvHn4fhAkydhPtvsEjKcz3RHJx0ynthqqQ/in92BJO//0N2nVA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+szjoNwUeOoEVzzyhsjM8/js0mvBzDdj/gPjFx1ggAZeXJWBfp
	hrY2rzaCxSouszC3VZj0WDaJjxD+dWQQ3Tpn0HHrrYgl7B7b6orXq2/XqUiAS9Cb2Au4oYh9qm8
	++moL
X-Gm-Gg: AYBFou1i37Mx7f837pZ5/xU3auxP0AgQQBpI8gELMaR9QUExl18jNUKRUxCstRqbfko
	xlwj8Ds06LtDF2OCBCRnrQUDDqgtSsFBok7IZJuqBEjoSSTh8VNstBmIWfwEH2KC+H/jihnQrty
	keNbh7cTktt203B8G8nfHNLg81v5zBSAhsHYuDZUPpWM2rBQd2dlJr/NtF4Io6B12QC2bc/bYqI
	eBYoUg7kq+8zQ/RyIzOziMKrwJQ+yf3ys27YX7KDR6WwImrBDQ6bmjH2Mpr4dMMzNPf1lpDIddg
	R61ciBjZ3yNoKufdMY27/hvn9WEVY5qz1xYtg9GykNO/nU/9SJ9AW3LKRWGUoV7UTDj2Ck5GWij
	SW/kUOT18/vF9C1FiOI44hIhjmTPYKA7Zi0RW2Mikarf3XB6VVaPepMfoj1L22PokG5/WjIweJu
	psOmEcyDZXdPvBSN0h6SsRsRjxP+bF+R0XAZb9vwBZ+qwJmrFPNsSzYD5/1aIQNzCPoLOs+gpKE
	mAooTxoctnE29zOaYfvglvifs+ZwyLXnqFOBDDzV6wdJGT15WWIbGZV5UBJn76P4DSMHAz1+aDJ
	DhKUoqp9jrxsnzk/0EqDPlVKWfc=
X-Received: by 2002:a05:620a:4556:b0:93e:c12c:f121 with SMTP id af79cd13be357-9499964526bmr691694185a.77.1795035988208;
        Wed, 18 Nov 2026 13:06:28 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b8182dbsm271138185a.41.2026.11.18.13.06.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:06:27 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTmrK-0000000GRJU-0IJL;
	Wed, 18 Nov 2026 17:06:26 -0400
Date: Wed, 18 Nov 2026 17:06:26 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261118210626.GF3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>
 <20261118193521.GD3115493@ziepe.ca>
 <457fe01cc1fbc5b6e2d7b5c9c167012b56fe86b2.camel@collabora.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <457fe01cc1fbc5b6e2d7b5c9c167012b56fe86b2.camel@collabora.com>

On Wed, Nov 18, 2026 at 02:41:32PM -0500, Nicolas Dufresne wrote:
> Jason,
> 
> Le mercredi 18 novembre 2026 à 15:35 -0400, Jason Gunthorpe a écrit :
> > > No, not OK :/ We want to use GEM shmem, which calls into the DMA API internally
> > > through drm_gem_shmem_get_pages_sgt() -> dma_map_sgtable().
> > 
> > You cannot continue to use DMA API once you start touching a paging
> > domain directly. It is why driver_managed exist.
> 
> You are building a strong argument around something that is not what we intent
> this binding to be used for. If you had cared about the context you'd know we
> don't want to touch paging from userspace in this type of drivers. 

Go re-read Daniel's answer and perhaps you can understand my confusion:

https://lore.kernel.org/all/3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com/

If you want to

   "We plan to alloc a paging domain when a video encoder session is created. Then
    we call iommu_attach_device() before a job runs"
 
You cannot use the DMA API.

You absolutely CANNOT attach a brand new driver controlled domain, use
the DMA API to populate it, and then detach it.

Then we have the issue that the rust bindings expose iommu_map, which
cannot even be used on any non-coherent arch due to lack of cache
flushing.

Further, from a Rust binding perspective all these unsafe things I
talked about have to be blocked by the Rust compiler:
 1) You cannot attach a domain to a driver_managed_dma=false device
 2) You cannot call DMA API functions on a driver_managed_dma=true device
 3) I object to exposing iommu_get_domain_for_dev()/etc to Rust
    due to how unsafe it is, but if you were to do it then the
    returned pointer must never be used with attach or iommu_map/unmap
    functions.
 4) Since there is no cache flushing a non-coherent arch must never be
    allowed to call iommu_map(), since it is unsafe to create memory
    incoherence.

Thus, what exactly is the plan here? Do you see my concern?

Jason
