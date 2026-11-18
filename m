Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795018152;
	b=Wk5Y+QcjKpkvU+XKieetFuDC07+f5T8NVE9uEZ8mPYOabWfyzZ7iXrgTBZLunZu7k5Av
	 dbPLHex0EWW+tj9UdR2ktzRUbRtF7uNZckaI7hlBI75jrWgfkQg+XVV239I0w765d3k+q
	 8FL3wwt1wo3cWtFDX4TXx/xrfVJURq7bcAggDBzATkhnhkITuNLL404YrKlWSZ0w5Bolp
	 UlFHZRs8RRpZoMMYC7zUtO0CULAvXyvju4JtGrWlFTtcTKEEiyXdk9LYJ/9g6G12uqZJq
	 YFdGLExaOR3tN/t1YdTrkToH6y/BvrkCWmlP5PAEJWGDi+5pOAwJBbChmDQ+GlwgjUQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795018152;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=gSW8M0rgpdj9ZidqbA7F4jvYRgDNFzs19pLdYBcG6XI=;
	b=eY3WlGHOCvN5W+4eFu9ftuNgmwJ38sHbO6F/6or/DBjgTGAN0nJfBZmVv2zjB5SDzDGH
	 SKoqKvDdFiVvxlERMPs4QGaWrillT/tcEGx3SdEXlFl2IQ5C2RzYYZsc7KckvQv6qwPqg
	 djx5y4hiO8VbYTjLBVDsJMwR+0fz6lAW4achhJP5pgFO8IqYh8hcr8cBn961UMwN6jVN7
	 FbJlfkCGrkfm/FhyAu+RiSncP6s5sAIzDsd+bXlHmBWOD27VIEbloEP+uz/+N95UYL8Ny
	 rK8OCwfKNEL7usuSs7mUPFOu5XaAkLfUrCXvgsZnMpluqMXu+VQnzpLdNsk94xJCkjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XoeDfZCO;
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59FA3606A325
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 16:09:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59FA3606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XoeDfZCO
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91f0c4f7a8fso9507966d6.2
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 08:09:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795018151; x=1795622951; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=gSW8M0rgpdj9ZidqbA7F4jvYRgDNFzs19pLdYBcG6XI=;
        b=XoeDfZCOgySL+MQJ4yvi4ZYvFsvL3TWb6BI19wJBbVwHCwARgjZt7EhgMqDA16jQZK
         khU54fJbhkyTYy1I4WTfIdyI/EIt/i5dE7fNd0wAaTMHG9cUgfe2/0fVIg+5s4x6QuuU
         oIlLEQdRtlXgTmi/ANMvLPlyp/ncRDSU8n77gNdWywkrD+bX4wrjHTv+0y1YmDwp8u+f
         sdyG6WGmkZjLIEy0RQFZLT0AZNp3nJLpvQtvPF+Cu0ZZ5w8+Cq21Ty1bwFs8tCV+7MPr
         Y1lDAtv1gow0LuxkgyRMDWxpqiFE60mMeqdePdtu7GK0FnVIn112deXRCGNQRqZVH1oE
         /Nbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795018151; x=1795622951;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gSW8M0rgpdj9ZidqbA7F4jvYRgDNFzs19pLdYBcG6XI=;
        b=M2nwfYSX5jpepL42ezgppkPOnCeSyzjYFY9wgXb46fW5UwmDiVtlkmZ4YXWvq1z8ah
         ibnbRiJTkxhUaHWuiVp4XqYJQ+HakcMHUq6Uqph7wy32JR0u0hbd76ZI1SOm7hHWHu9C
         XYUfk42L9OCAOmscna19z9KyOwmkfhHib7YL0VgtbMMcW+AJpvQvw5qWPBi56FLLWJtd
         30uKVa7yNFOM+7rQi9o0byofTSMR9rnK7lsEL3dQ0ex+kQ27oAqVjEcAGJmfpBtccOYb
         qxD2xgVd0xRzz/HYWbDFkHMx8HYGIoVa8jZqo6foL2+lSTq9eWT1WpPzZbOtoI9eaAc2
         OgAQ==
X-Forwarded-Encrypted: i=1; AL+hErF0OmAPZAmQhiK4wV+O0SrIAb29JL82QnKb+RGbEen+YzLP6ojM9YK0dPtKgip4IcVy78H3v4zZVAfxFg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8To6VgGoZPOsv9sbmlHqfmQuH8lrmPynAe7b97i5IkjnKogpBz
	L1Y610JI6mBkZmJp4b0KXg/r/Z0Gv74WMg/YbBcW5U+9xOkFWIVeZOWJNjEIy7NlQxQ=
X-Gm-Gg: AZFdTZfXjjkbFy4pm19PUv+IMpiYK42xF5H9S1OTG+lZv647U6EErIPn+QIdSYzPtJ+
	TDvpc+qj/UvjAu9L/bccrejGugxdROuQzptR9FxYJSK3nOFvmpChS1TMnr+/4gUysCEqezr5aqR
	1n9DozColGo35jp+lZRUJPnhb6ITfu4EvneFJqJLC3CSwZyt60tCvEYxXilOUyp/wq96lD7Kg3M
	qSHON/3FfZ28JyfkqeUlrvoP4urQDVKf0j03MCigHTF2jT9maDjGpVa98IY5V4/2DNz/5ixhpRg
	FNA2kyiHr6DVVxbAlU24WpXkHmgKFc1iFW5JzDc+cTkwDTlWwjXBtK6eBkR1i212lnslvhkXMSt
	YrZCWT5xGpeS7w7GceDrS/KYm+Cb3WDrFiZctR9+b1v3BI0GVCnMUdPn8PNfqiBxN2HMqY+39Pc
	/ZM4l9JJ65Met7Pu1cTR9gZ2QKNtfsyCRQiGKYoiyJMYcxNWmflpZLvNiKyeJPNEAkG/gi8ge3t
	2poTvbsPsRN+EFK2RqzubvyRKtP0GhoFS8V5WQFJ0gXq7+vIKOPus/WcmdINdeFiPdIsLckG3m6
	/rg0V16HtpqvT52+eFl3z2iPJko=
X-Received: by 2002:a05:6214:5787:b0:920:fd27:87df with SMTP id 6a1803df08f44-92114f78ab5mr44895066d6.48.1795018151035;
        Wed, 18 Nov 2026 08:09:11 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114db5db5sm24976746d6.43.2026.11.18.08.09.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 08:09:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTiDd-0000000Fn0o-1uSd;
	Wed, 18 Nov 2026 12:09:09 -0400
Date: Wed, 18 Nov 2026 12:09:09 -0400
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
Message-ID: <20261118160909.GC3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
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
In-Reply-To: <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>

On Wed, Nov 18, 2026 at 10:25:58AM -0500, Nicolas Dufresne wrote:
> Hi,
> 
> Le mardi 17 novembre 2026 à 16:20 -0400, Jason Gunthorpe a écrit :
> > On Tue, Nov 17, 2026 at 05:09:11PM -0300, Daniel Almeida wrote:
> > > Hi Jason,
> > > 
> > > > On 16 Nov 2026, at 16:38, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > > 
> > > > On Thu, Nov 12, 2026 at 02:00:07PM -0300, Daniel Almeida wrote:
> > > > > This series adds a Rust abstraction for IOMMU paging domains. A driver
> > > > > can allocate a domain, attach it to its device, map pages into it, and
> > > > > install a handler for its faults.
> > > > > 
> > > > > This will be used by the upcoming rkvenc driver that my colleagues
> > > > > Detlev Casanova, Nicolas Dufresne and I are working on. More details on
> > > > > this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> > > > > [0].
> > > > > 
> > > > > As part of the security model, each client will have its own IOMMU
> > > > > domain. This is needed as the submission model will let userspace set
> > > > > most of the encoder's registers directly, so the kernel cannot check
> > > > > every memory access that a job makes the encoder do. With a single
> > > > > domain, one client could make the encoder read or write the memory of
> > > > > another client.
> > > > 
> > > > How do you plan to get the paging domain in the first place?
> > > 
> > > We plan to alloc a paging domain when a video encoder session is created. Then
> > > we call iommu_attach_device() before a job runs, and detach back to the default
> > > domain after it finishes so the next job can attach its own session's domain.
> > > This is so each session is isolated from each other.
> > 
> > If you do that you can't use the DMA API at all in your driver as you
> > have to set 'driver_managed = true'. Is it OK? If it is why not just
> > use VFIO?
> > 
> > Or are you planning DT horrors to get yourself a DT created "DMA
> > struct" ?
> 
> This seem to digress. All we want to do is use the iommu subsystem as intended
> for the case the iommu driver is not inside the DRM driver (which seems to have
> never been the case so far in DRM).

"As intended" means you use the DMA API and you do not touch
the paging domain.

"As intended" means you use iommufd if you want a domain full of user
controlled mappings.

> The existing infra for that (in C) is pretty abstract an simple in
> my opinion, and built into the DMA API if you manage which domain to
> attach to your device at the right time.

What does this even mean? The DMA API owns the domain, not the
driver.

All the cases using these APIs in DRM and media are troubled in one
way or another.

For example the recent revelation they have always been using DMABUF entirely wrong:

https://lore.kernel.org/all/20261009125338.GB13920@nvidia.com/

Tegra desires to undo their abuses.

It was never intended for things to work like this, there is missing
infrastructure.

> To me, it fits CODEC HW driver which are also simple. The DT horrors
> you refer to seems totally unfounded, you just describe the iommu
> and the iommu subsystem will manage it for your device.

"unfounded? You are not following along, I've written about this now
many times to many different people. Follow the links and discussion
from here:

https://lore.kernel.org/all/20260917144804.GI3196566@ziepe.ca/

If you use DT correctly there is no place to attach an iommu_domain to
and you can't even use these APIs. You get DMA API only and that's it.

You have to do something "wrong" in DT to create fake HW devices to
even give you a struct device to even attach something to.

Or you have to entirely give up DMA API and attach to your only struct
device.

Jason
