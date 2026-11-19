Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100114;
	b=d3JaltngN3P1Wwwk4AcvKtX6P2PD0dVS7OxdojBl9X+srxdf6SCmEwONqQ+/RE8VFRNT
	 CkzbrossbZaFG/LmzoygJm0TTwemMJZAkjj9beizPIpkBywbZTBWP45ochxDLAROGeAAs
	 pAf8+c00W8VtbuxT89IuZA4yEbhET9L+lf+xaGRBHsbPGpYDaVxhSCGjTiQDZJgEfO45L
	 eJagEMzwuHWZG7pOtCzBtO7/oVcozeOr5dQXoQkS6eRmNPneEufus21QMpdR2a3ItmETm
	 t2qAA6jwrKJ+kmcoVvtc2ej7PGyKOEcdqc0yAtOGDXc2nO5dK6EWjn1tznjbryt0fkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100114;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=G+3w7qcryJEhye/h2qafkqEU5e//COD+Oo6UYEV8BlY=;
	b=gJolzBB+eN7SDvixVCBZbgskAsasZ0Q2ky6ArEFJ0vFWVPSdPw7PdLzaHlvT7BhZ2cZx
	 Ib8VQrQ/Od9MkzcRDoTwVojYtSpfW34WKaxDYJerYwnrVYx2v/Qrvq/J+M9JNKBmAFKdl
	 EwTT7bNgtnSwn6DBOTKsWLc3kQUg+nsDkLFH80u9PTjbOM6coAWpc75XgQXvEyqhjRF9s
	 QbOb+lcOtolpuuTH+hxUE1JgJVc+2x7K/L59lT1SU3ewWtCdwa+Mc6U/cHRFf/nZAGw+q
	 a0pd0fHl+ndH/+4w77VzU0VUDWRxfBoSn+Ti5EehYkSJ/9Xt0Isx9+TxJQRlffcy+FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iVIv4Dit;
	arc=none smtp.remote-ip=209.85.208.41
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93908606A326
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 14:55:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93908606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iVIv4Dit
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6ba12b00c76so921746a12.0
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 06:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795100112; x=1795704912; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=G+3w7qcryJEhye/h2qafkqEU5e//COD+Oo6UYEV8BlY=;
        b=iVIv4DitBj+0cjHC+U4AryqiFVPRjNOkXwUKbZoCtAToILsRvaqD5Sm1nfPjI4chjw
         PUQMWtkisw3uPw0kxWmxFr/nFWBffbfiGCqCP+OjPBemOK2+A3KWRMZEiGEZYjONkY5A
         P+vN9zpbMWF6CVTQZ3pBqslUI9B6VgI3Nhyew6v9xj09rl1g/7NpBHHCzA6mEb91WwAj
         VpN2CUTJTeJUi+clJ8gpmuHplt5b5eWbesXnrjltpkymLdYSDZ26SmQRNKKov3Sao8qc
         MEANMZFyBFOkxbyy+SHRSIUveyPHUVjxOcb0bkmxNOdie3K9XD4S4oK5+shQinxmEawC
         PHXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100112; x=1795704912;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=G+3w7qcryJEhye/h2qafkqEU5e//COD+Oo6UYEV8BlY=;
        b=YBemBgnzu2Fe3gFHYMeM9kS7iWQABeIs8HE3vM5Gexh2srjUKGpXzLnnH4l2rr2xQe
         PgNENUJoaq8zEnC69Yrka6AH+Hhe96TXJ4nv4BAAivK/oAfYUP4D8H4owT8BOXOhZw+1
         wHHbFoLUJ1kFr9h83KYU3k4/pOEwMxUtyJuG/TPPLzdG+BvIYyH1jOlff1NfpM6w9V5l
         /wWlkCLR8W/Ri4zDsOsFK1G0YSbDVshD//XWGSNEMuB3V3xMaHE7L4ODJ6DjXlfU1Ma+
         acLtOu1b/WCTNRGWdIqL95vM4TnHGtI8Gfn3/Q5LYvnSClIIBpRpjUYxPdQJBLbO6IAG
         IKNw==
X-Forwarded-Encrypted: i=1; AL+hErEUIHdOj9zBbRpb7WpWeFzbQOHFeFu+cXxZC6QkSCmo0IawTFysLcWr7PfqUbg2Zd0cr5reHxhsL4E8Pw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9/m9l1N9OTMq1usS2okVLr9NJzyg96ofVOS7LNqz12CQiL1w2/
	BK8FtCpRB0sZn9ScxL12dVpYzabD/eQg2LOBaXqdMdYaEz/PiiMSrCajvFnwlLf8XlM=
X-Gm-Gg: AYBFou08SnZfqL5LwxvvAmZaT3JiWc8acPNxPJQOc7QTi7g64+MjTqA6p3QHhXSyvTz
	7cueUDXexLcEFKhJqemi/6abZrfzm+0MiPW81uGUUmNh7C1nR8YNxcwl4b5ZGAZcvaop6lv/3My
	SlkenP7rKO6i1qNV6F+snSbcqimfX9yXsevkbLui8pNJgUq6ePsU+OnyxaokovrLBpLFmJHl3ut
	R9P6mLkNZucIKoB4zb/CRvOvKg3DuR7ABybqQavvrDEaBBwlo2X82WE+IoDaDHPVjem+spTCvj5
	/vrn8PVB3o5ts9HeBh4VpeO8wPiwKSduYcO7cpsxnYkNvoqsRztAECXqgA+gArwXnDWv9jzjxXL
	KmXGpkoa25pt6DKhudtV40IxAFs8mXO/gGWLXsq225SBvT+5dnufroSu3lSsJML3foKw0jmeFlW
	msQZiC02EI+KwZ4+tgPoyMZKWH2N2Xcbef+FIxkUrADSdvMflu3Q378PNyaG4E4odFesPmezRYK
	37WIsgrYAAEvo+y+X93cvogPK22pYLS6ucPD+kCvmJMF8EetI2Ja8cKp8E2VTu37Tz54jgILFKJ
	j3eUIw==
X-Received: by 2002:a17:907:ea94:b0:c50:aa10:d888 with SMTP id a640c23a62f3a-c513acab9d6mr6638766b.40.1795100111790;
        Thu, 19 Nov 2026 06:55:11 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c513ae8f70fsm2503566b.40.2026.11.19.06.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:55:11 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3XZ-00000000vhT-1zwc;
	Thu, 19 Nov 2026 10:55:09 -0400
Date: Thu, 19 Nov 2026 10:55:09 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
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
Message-ID: <20261119145509.GJ3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <615C3DA2-4C02-4A8B-AEC4-70D498672559@collabora.com>
 <20261118193521.GD3115493@ziepe.ca>
 <457fe01cc1fbc5b6e2d7b5c9c167012b56fe86b2.camel@collabora.com>
 <20261118210626.GF3115493@ziepe.ca>
 <06d4eead-b765-44b9-94a8-6ec2d71d172a@arm.com>
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
In-Reply-To: <06d4eead-b765-44b9-94a8-6ec2d71d172a@arm.com>

On Thu, Nov 19, 2026 at 01:03:52PM +0000, Robin Murphy wrote:
> On 18/11/2026 9:06 pm, Jason Gunthorpe wrote:
> > On Wed, Nov 18, 2026 at 02:41:32PM -0500, Nicolas Dufresne wrote:
> > > Jason,
> > > 
> > > Le mercredi 18 novembre 2026 à 15:35 -0400, Jason Gunthorpe a écrit :
> > > > > No, not OK :/ We want to use GEM shmem, which calls into the DMA API internally
> > > > > through drm_gem_shmem_get_pages_sgt() -> dma_map_sgtable().
> > > > 
> > > > You cannot continue to use DMA API once you start touching a paging
> > > > domain directly. It is why driver_managed exist.
> > > 
> > > You are building a strong argument around something that is not what we intent
> > > this binding to be used for. If you had cared about the context you'd know we
> > > don't want to touch paging from userspace in this type of drivers.
> > 
> > Go re-read Daniel's answer and perhaps you can understand my confusion:
> > 
> > https://lore.kernel.org/all/3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com/
> > 
> > If you want to
> > 
> >     "We plan to alloc a paging domain when a video encoder session is created. Then
> >      we call iommu_attach_device() before a job runs"
> > You cannot use the DMA API.
> > 
> > You absolutely CANNOT attach a brand new driver controlled domain, use
> > the DMA API to populate it, and then detach it.
> > 
> > Then we have the issue that the rust bindings expose iommu_map, which
> > cannot even be used on any non-coherent arch due to lack of cache
> > flushing.
> > 
> > Further, from a Rust binding perspective all these unsafe things I
> > talked about have to be blocked by the Rust compiler:
> >   1) You cannot attach a domain to a driver_managed_dma=false device
> >   2) You cannot call DMA API functions on a driver_managed_dma=true device
> >   3) I object to exposing iommu_get_domain_for_dev()/etc to Rust
> >      due to how unsafe it is, but if you were to do it then the
> >      returned pointer must never be used with attach or iommu_map/unmap
> >      functions.
> >   4) Since there is no cache flushing a non-coherent arch must never be
> >      allowed to call iommu_map(), since it is unsafe to create memory
> >      incoherence.
> > 
> > Thus, what exactly is the plan here? Do you see my concern?
> 
> Yes, your concern is a restriction that you largely made up :)
> 
> This is very much *not* driver_managed_dma, which TBH is poorly named since
> it really means either "no DMA at all and thus fine to nominally hotplug
> into live domains" or "userspace-managed DMA with no chance of ever
> inserting DMA API calls at the right points".

Now you are making things up :) When we invented driver_managed_dma it
was explicitly for the driver to take control of the domain attachment
away from the DMA API. For whatever reason the driver might have to do
that.

I wanted to convert all the places calling attach to this model but it
was too difficult with no way to test on all the embedded hardware,
but I still think that is the right thing to do.

Jason
