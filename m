Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795031493;
	b=Yqwl/WRt/xFsBa1Jxr9urUCC3LL66jlggoDEqSXVYbVdB9DMWLGte31fbwt6FMsXvYbG
	 dSTFWnMIDm54P+E6df2GD2piOrBiUFt32CcbV07Ge5VENPzzGSHwvGwDQUndWiS6/MgAd
	 NXFRiufQZqZIwIeHdbUnYUifuezHagmDcSl9I/CxdbYc1pmutA4TR7X9sER53ca2Lj0ls
	 aPkIpB5uGZRBcopNzrUCslL4Bv8jFX6y/5VD+aHd+UCBgnIlZnI+sb4UqOZuPq6v/ozg1
	 MvB/2Fh2fhmeefxZ9kCahqb/9cQp+bdlvbLuulAI6POkURD+xUGVBKzIFvetYQP703g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795031493;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hFZIFuBcLJ0vIHcol0BdyKUl3oPu8AoNqdKHILyKuII=;
	b=pccdlJuHh20XpVwJzaU3Ayx6lX3Gl+xDYQ9OmzAz6C02zBskz4qiqMrtzd+O8HhbzHNy
	 nMGGFPL0AG0fI0w34Y4xfgsFvCPAkM5jHk9d7Q/yZhSNezel1EOvn3X/hLnzbRvh0DnOJ
	 rEE9pVFLz8UHJmUpbvoHVPEwc8fyUD+K3QKsJI1VZNQX9VJ/SqunCUJ4HQCEboL0V3UrY
	 Aka/FEG99imyzefPWmecVp2GlQQPUXnJjftldpsN8UnoqWqYH6iw2fH8lbDc5oNvocInx
	 4jSnWfhcoToZMliSejhAXXzNZTwaGEKRJRTG7DvZKpJHkjV8/b7cB+1Q7N4ur+IML4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iZUyw8R7;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D21B606A320
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 19:51:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D21B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iZUyw8R7
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55c48582654so13713931cf.0
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 11:51:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795031492; x=1795636292; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFZIFuBcLJ0vIHcol0BdyKUl3oPu8AoNqdKHILyKuII=;
        b=iZUyw8R7phULKbi0WNODuzP1wM6HLfsE2QcuQR1l7EwsSLcPHegqmMGHZJQMEt+nis
         s7AFec34U3H2jXCbac004U3tqqW/P3kMQfJezhOM5OwM4L4Ps0VEORAEM0FE4QrMVnt0
         tMeQLHO0riHjYjVPzfi9Dcsdk2eF/AL1OAsM36GjliG+3PJjGsrCUSdZdDu0r+PDgo6B
         2dqEqk1OStV8vJNQlNef4YC5dlzOZD7aOt9USeeW9ZvFkTaGskw3YlY8qHZQ3VwSyEs8
         YqnLUsmCXdalZH8idKrCq1EEvP6/rzJkILOe20COXVO837/ebpkxkMfwYmNSFD3SbhLU
         f+QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795031492; x=1795636292;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFZIFuBcLJ0vIHcol0BdyKUl3oPu8AoNqdKHILyKuII=;
        b=PWEZYR3JZ3U7TN0MgZlxs6LG972OLK5+fhWSXy7m262c7syUQCp5RU/IXczSH2j7rD
         et41eG0GVB2UeZ2pmiOONC4UNcyDnb9k0/lgz7wWdCOGYWaslIoKZ3KOaII71wgWGr9w
         qpcQs04bS0/GFdhylKsgxH4/EeXuLOqqPR4Z/Tld/R9up6YKxGFyw1G+1pwBVF12ApB4
         DHxtuvwQWGvtBKXhHn1wbVOaRpSU/8EURlGbAwl1I+tjccyyZefh8CRQmSI0uavC/oRh
         hIY+StRL8shDKHyVSadLbl5YMFef5nbpKHOrSwu48Bj+gneY/gbOgjzL8wRJr3gMVf4w
         Fsuw==
X-Forwarded-Encrypted: i=1; AL+hErE6KDHxgQ7UGI0i5DR0LeZr0lYcPH7w1pLmIyKKghnK0fPSYQsO8VLJgN8cYedDDEHW4thbRIV3C3Bk4w==@lists.linux.dev
X-Gm-Message-State: APuU4Z94MlZGcF05r17KhTmJi/3mt1Upsufx5YJPUVxqqFxPrKsRf6rW
	3jlLtypoikV/dHfyA/NfuRuyAdHqF2CS/ToFEqoa9uoZAH4F5gggrpfAYBJYC5d8Cps=
X-Gm-Gg: AYBFou3gY40fBwjoqab9bNVk0/WrebkgH4vic7eQftX+12N5KAeOwK2HpiPnLSwpWy6
	dN/QqbHY2mSJfw0NLCmHJx4jJXWFi5Js0r98OPzl0FCIjekzpuA0O0kyK39Iwcw4QAAEsuwYeCu
	aOvO2EdtROmBEAh81pq9dAvcF78XrxkhbqGWf61RECBEiuQio5UyhxHh96tSDPACHi2v2UfPgff
	px73JLbtaFJSgBer6UnH5c3kYUYnMU/PQDxHvsyPkyJpFkF54oIA+QIngKDyL1967KSha1LpOpV
	QFwhzB4MjJoamY7fktIJgImExA4cTtU6jnRMlr1kIVu3vLWFNvaW0zuoeh8C3TtdPtQkNdsgFqp
	3H03btxH8wSBU1Yab9YtbwaJYndH3CtGDcx3hB4iUW9+FpC6geRMB33UlXTSxXX4xs3XfccDrWq
	EbKklIMgGGLbaz+fvVX4yiLROvlojIzfCsANSbD8oprV2HTwVuyRaogoPeZZQyhOQecKQCkPMtd
	P3g5IhyI/w+4zP7f0QX/+iLTF04KoArk1gL0wEaEFrwx1BM/fgAXMGEYx2mlpKkKnPRMOfCBNbh
	HDuRJA==
X-Received: by 2002:a05:622a:14c6:b0:535:24f8:fe3c with SMTP id d75a77b69052e-55d5a34dfa4mr59779801cf.5.1795031492124;
        Wed, 18 Nov 2026 11:51:32 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d98adbsm29661026d6.40.2026.11.18.11.51.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 11:51:31 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTlgo-0000000GIH6-327U;
	Wed, 18 Nov 2026 15:51:30 -0400
Date: Wed, 18 Nov 2026 15:51:30 -0400
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
Message-ID: <20261118195130.GE3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <ede3b421d419a35c115ed584e60e74bfd6b91dff.camel@collabora.com>
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
In-Reply-To: <ede3b421d419a35c115ed584e60e74bfd6b91dff.camel@collabora.com>

On Wed, Nov 18, 2026 at 02:31:28PM -0500, Nicolas Dufresne wrote:
> > > This seem to digress. All we want to do is use the iommu subsystem as intended
> > > for the case the iommu driver is not inside the DRM driver (which seems to have
> > > never been the case so far in DRM).
> > 
> > "As intended" means you use the DMA API and you do not touch
> > the paging domain.
> > 
> > "As intended" means you use iommufd if you want a domain full of user
> > controlled mappings.
> 
> As discussed at LPC, we believe its pointless for this type of device to give
> any direct page choices to userspace. Can you explain why you believe
> differently?

This is what was asked for a few messages back?

> I'm not sure how this applies to our work. But since they are all broken
> according to you, let me give example of cores/iommu mapping we are using, and
> perhaps you'll be able to explain us correctly? I've picked the Rockchip video
> decoder, which is upstream but expose through V4L2 stateless API, but from a
> hardware point of view is pretty much identical:
> 
> The DT (which I read you must be broken and in violation of everything, yet all
> reviewed by DT maintainers):
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/rockchip/rk3588-base.dtsi#n1400

You linked to a clocks line, I have no idea what I'm supposed to look
at in this file. Can you explain what parts of the DT apply to what
you are intersted in?

> The multi-core support proposal, its not doing process isolation, its not
> strictly needed in higher level abstraction (though could be better), but its
> using domains so that each core can actually see the same memory:
> https://lore.kernel.org/all/20260810-rkvdec-multicore-v2-0-986f89d22cdc@collabora.com/

IIRC This is the driver that had the weird not-quite-an-iommu issue and
there were many complaints about it doing things with the API that
make no sense because it's HW is bad.

                /*
                 * To rewrite mapping into the attached IOMMU core, attach a new empty domain that
                 * will program an empty table, then detach it to restore the default domain and
                 * all cached mappings.
                 * This is safely done in this interrupt handler to make sure no memory get mapped
                 * through the IOMMU while the empty domain is attached.
                 */

But that doesn't excuse this:

  As each core has its own IOMMU core, buffers must be mapped in each
  core's IOMMU so that any run() call can use any core without having to
  remap everything.

  To do that, we use rockchip iommu domain's iommu devices list.
  With that, one IOMMU domain can be mapped on multiple devices, meaning
  that each call to iommu_map() will flush the new mapping on all devices
  in the list.

We have DT for this already, you use iommus=[] and list all your
iommus and it sets everything up for you. Going around and changing
domains behind the scenes when the core already attached DMA API

Then WTF is this:

-                       ret = iommu_map(iommu_get_domain_for_dev(core->dev),
-                                       virt_addr, phys_addr,

Seriously? You cannot directly map to a DMA API owned domain. It is
fully illegal.

> The DMA abstraction that is used by the above driver:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/media/common/videobuf2/videobuf2-dma-contig.c

Thats DMA API so it looks OK?

Jason
