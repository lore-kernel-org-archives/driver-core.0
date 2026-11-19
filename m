Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098715;
	b=4R+PANwRNWGA0/AAFrXYvklMSdgo+Wo4YvxnWXVqCKEHejIIf284dViu+mhn++KNyj18
	 bLt1HVmGq34RPH68FakTR0qiXDgpJ4oOsyFOcfaTuYzbo+f6tBigwyyeKeimY/bK4lpIt
	 wpoemenJVIfMMyojEL5RK+vcKODabZlB/qKvpI3ERM80MIVpCKFH2jtEl4z87gOB5+0Uq
	 4tRbkB0Ji9ONyFZ4cjzzlgY3j1xPnjEl+qFy71QkBXuPQ3VFO7rfj5lVLL+iWldh/DsGy
	 YRILXrwe+gtiqCdN1WlARFnKeC/ZA81KPupAb8+qZh9cnofhrvUm1j33XDiUjX5km4w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098715;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=hL7cJlK2xvTgQa7LLQ9HzeCYEg5UwEM/V8Y7DTV8aIk=;
	b=QU4vFz6/2gp+eS8y/TfDO3lmopywDPOPQtGjPaffNbkNOD0MO0TPi/nHEgwEbGbmcpPS
	 4/DgN7cmHw36ltCW5WvCFv0vRFcdf8ELyHxpW8Ki7RmQib1R8saLcfmkq66INDmtTJIPE
	 hZeyD+EdRwGlslzmGuxY+ej7ftXJ6UeIbGpHrXLMR0LTEwsFGugoxpICWH3+BL7DqhrA2
	 h19WJkAcEwmXOiwp22gfruLf2CxdWNd27U7gGGKDh/ZbIYPUDbt6eewT0+PdL88c5h+XV
	 j0Y+gFqM3VlcGuvTOFyI/SQs+yrvt2s9vZPYqewRb6VUjrh5mm6oZG4Q7SGMiwhMaNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nznQCtVR;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97BCD606A325
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 14:31:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97BCD606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nznQCtVR
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91e8938fd01so21346966d6.3
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 06:31:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795098713; x=1795703513; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hL7cJlK2xvTgQa7LLQ9HzeCYEg5UwEM/V8Y7DTV8aIk=;
        b=nznQCtVRMoFh1Pj3c8VAcXUpJXJVN6KLWqbiwGDYsJe2q6x+BivkM7PCa1f7UwkLJS
         PjYMFLRKEwRmn5c3Vat34GJlLJby1/2TgDU9r7IF7Tj8pcpYThD1LEWIU3jrXS94xN8v
         e54lkdkOWOaOqh8spt6Us9VhoWiAFj903eu3nyc8o98BYLetGKpOveoaufSMPGN0NHin
         oJGIGoskZjfnrFqdkIEOT3x4lNCsJnDWu8OHYrysFHhgUlFB3sHRbS66kDUpHZ1MlhTk
         JryRvA9kV6IEvZg10aSIEALXi2WsTCXWZ8nDyztVxp1ZTIfYndpc4mxMPU8MVALbNEAl
         v9iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098713; x=1795703513;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL7cJlK2xvTgQa7LLQ9HzeCYEg5UwEM/V8Y7DTV8aIk=;
        b=cQsKz2uqbV6kC/acbCS32sEpdfmedpHz3PoK8C2hH5T3ka8jysRwO5kREx6W8KVodL
         R71shMwjx7qkyxfz9RE36oQJ+yReODTTImPtlKV9cn6BXkeLxz/IXk9UTA/jqtlUj1hM
         9KhpFmNzPclVEdhgfJt5k/tIk+eX94j3Kcn95+55EdQk5+QcrGeUlxYeJEi630KPA3Yh
         AxRixALdaags+4pdtGlyA2QEiIgy5T7zQsd6SSaayXGcd8Of0ENa9P3Nl1mrHlmVyFJV
         W5A9QvJQjKEO4n0HZbzBb3UNBEn59Nq1MotLpeu7/WChyAWPnpb6RUxAww3+Szfe/LO4
         W4GA==
X-Forwarded-Encrypted: i=1; AL+hErHZshlXU5bVZSLaUesQLPiu/C7lrPu3MN90Ze23LAk4N7TcOPZBkDPxOjqOjXqiphzvMti56OpLB0qEoA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9j7rOKTOBP9K9d+Q+1Qjs9OY/8FjnlmOW9Nb8UqDu0TTDdc6PB
	LjXLounTsTD+09fzdIhwJ+FpYh/i8u74h77bF+x67IAJHQpCKY7u874Tu4u1u2qIQLI=
X-Gm-Gg: AZFdTZebQUaNi026m35HtHrSv4crAASRY5r5BP+p6azF1meYazvXbsDBOgg8zuYXE72
	1/ywfkgMSFLYgYKB0acaqh2CBVgD+yCPsERdbneCmETCFJofPWyqkHTOR9KcP2RyNa5MG/KPHUZ
	zyiuqbGKS5qi6Llw35YbjqSFVNxF4ou46q8EiRRpN4xCujULejTLKCkTois3ISNZv+WhpFursfy
	2pxIpXw4QwAEEsbsJiEE0cBhBOyeh/1RnHUmiqSHM371NsWTsSDm2b8nwrDqWgvDn1rA8MPCpLN
	Ko+NDK1zEW1czHWwLEUielhyW2xRNMLd93UsNm5U3B65kEPoCz0e8UWwiMYotsx0HTcYehH/kxT
	EfH9mqVW4DVuI7qM2tVuWuVdu7AWyXtf6KIlJvcb1Ogpt/plKrNUvHTlC0r37IuR2PXuDQTLMOa
	bPwgo+YjP+l9gTPMj6zZEEuVJ7Ur9zD7ihzJFtcZaqURHyUKn1+OpR/+NgfnedppP4rIJTpi9o3
	rNhEqYTeiX0mxxysSs8FVZpawnKLnCncJdDmBoQmfwK7Q+0f/QrGt1ZN2XaxtBiJUEmu9HHg0gD
	oSkQmg==
X-Received: by 2002:a05:6214:2482:b0:921:2e91:eb51 with SMTP id 6a1803df08f44-9212e91ebc4mr18407586d6.57.1795098713268;
        Thu, 19 Nov 2026 06:31:53 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134042c21sm194846d6.35.2026.11.19.06.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:31:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3B1-00000000ssw-0FAP;
	Thu, 19 Nov 2026 10:31:51 -0400
Date: Thu, 19 Nov 2026 10:31:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
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
Message-ID: <20261119143151.GH3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
 <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>
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
In-Reply-To: <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>

On Thu, Nov 19, 2026 at 10:25:24AM -0300, Daniel Almeida wrote:
> > 
> > I can't speak for the actual intent of the Rust drivers, but
> > giving them the benefit of the doubt, none of that fearmongering
> > should apply: the valid use-case is just simple time-division
> > multiplexing.

To be clear, I think the use case is a reasonable thing to ask for,
but since when is this flow valid? Does something already do this???

And why didn't you disclose this immediately after my first question
"how do you intend to use this"? It would have saved alot of time.

Below is exactly something I think drivers should not be doing:
 
> > A = iommu_paging_domain_alloc(dev);
> > B = iommu_paging_domain_alloc(dev);
> > iommu_attach(dev, A);
> > iommu_map(A, iova_x, virt_to_phys(X));
> > dma_map(dev, X) //still needed for the underlying memory
> > ... //tell dev to do the work for context A using iova_x
> > dma_unmap(dev, X);
> > dma_map(dev, Y);
> > iommu_map(B, iova_y, virt_to_phys(Y));
> > iommu_detach(dev, A);
> > iommu_attach(dev, B);
> > ... //do some work in context B
> 
> Yeah, this is basically exactly what we want to do..yet Jason has been
> repeateadly saying you cannot call the dma api at all once you allocate paging
> domains. So now, I am confused.

Especially from Rust where we are supposed to be enforcing strong
safety invariants. This is not safe, and it is not following the
meaning of driver_managed_dma, it is not good if there are multi
device groups, cannot work DMABUF, and is exactly the sort of weird
stuff we keep breaking down the road :\

Sure with a lot of care this doesn't immediately explode today, but I
don't think we should be setting this as an API direction, especially
for safe rust.

All of this is very related to the PASID discussions from a while
back. The goal there was to allow the kernel to DMA map to a PASID
paging domain. IIRC the direction was to wrap the PASID in a struct
device, maybe a "fake/limited" struct device, so that the DMA API can
be used, dma-iommu.c manages the paging domain directly, and things
have a sensible driver API.

More like this:

 dma_dev = iommu_alloc_paging_dma_dev(dev)
 iommu_attach_pasid_paging_dma_dev(dev, dma_dev, pasid);
 dma_map(dma_dev, X)
 dma_umap(dma_dev)

With the additional twist that alot of embedded HW has apparently
choosen to not implement SSID but instead has a pool of SIDs that one
device can use, functionally similar to SSID.

We'd need also API support for unbundling the DT iommus=[] SID list
into something that the SIDs can be attached more like a PASID.  That
need, I think, has become clear with all the DT tricks and fake busses
to try to work around this issue. :|

Jason
