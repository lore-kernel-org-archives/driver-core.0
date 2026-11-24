Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526204;
	b=f4QC8Pv1U+mmB1+c9t27ztcjpxpbGNjJc0wcWu6BU2MeHnPgmMmFicfkDpmLHXHFNwNQ
	 GcS+WFrzochURZkAkeffPytyDMzDpqeiFsLDw0HVT6ngY/9guJju/3ewsh988MgiuHaSr
	 hJW8XMeQhzzcsxSA60RCBdIDuO6DwxmmfYvfZC8jcfEoX1PDkIj84sK4mJeqZmhBCp99z
	 +6W+6n2aJPvPQ/GqA3EUEcXVYbVfFi2D9iGMmT+M/NqcvtWh6j4MguRW//rpqBxH1Z7ps
	 kNs+KAg2lB1wRXogDX+ey24gvddCu1hx8PqrrmjOR76/r8sXgTgXNg6SavmGtdp35+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526204;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0prXWPyKnaONv+XVyeK4p1EFWEfFGuwvhH1CWWabhJE=;
	b=uSHsy/qHJSZleHXx+XIcdKWJnEQrEbAGwFa9mAU2z6ZIqMJ4ySbMV0b6DunJ+olFgFty
	 rKRop1XUf6WmnOUx8Dkhm1iTIDQGtiWxIcQwcbcuub1FSgpYemI0PT8roKKLNSDFRLRzt
	 SjfXvamHD5c8j5WS07NB4g6TwSRiAnejgySzdm/bM6Ro+gwoVUnksbm2Nr8tXAklYCaA1
	 ayVsr5IfvnX6NxZjGiUBxbjIUnGfKZG1qPhfNEjk5zAP+5Ui0CMAW/3lAuCcW7iDa0tiE
	 sGeh2slGkjJDi58M08vqUTLoqUi926qh2n7OG280WHzxII3KBqguG0MIxvvZ1EU1JAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=J4uJFFk0;
	arc=none smtp.remote-ip=74.125.224.52
Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32C64606A31E
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 13:16:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32C64606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=J4uJFFk0
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-67df3b1ca06so4998572d50.2
        for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795526203; x=1796131003; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0prXWPyKnaONv+XVyeK4p1EFWEfFGuwvhH1CWWabhJE=;
        b=J4uJFFk0mntqXD0jfAznYbPniXa8DWEftiyUdzaBg0Qcljpc4/bQBLckmTm/jWh+RS
         W6rBbFYOuw12GhmMihNykU/Bn0iCP0bUf9qTJ6jTjiGfpHITrGR9BdA4zESfMp1lpdmM
         wIsa/Pg1EMjeOydb/vXNTnud6urcnZpQOsRaAmQTXFTSZ/EjWJDIUyI5cafz9HAgj4h6
         9XEdZ87gLYsQTdHeMiBDtIV/LX59mzcoAMEGVGy5ihAlq4dkXF49imXFVOj6+HDk5Vv8
         HAMVhl9PZoYyKRtObPqht0mtagh6/dtcbL6HQ1szljyOcarCixfNW8hL30S7GmaKiWKX
         NZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526203; x=1796131003;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0prXWPyKnaONv+XVyeK4p1EFWEfFGuwvhH1CWWabhJE=;
        b=xBS7KALe1hgL/1pyLlOprhxfXqKxC8kTKdCwElWTBdcgvgnapQSQnylH8c1o08x15S
         +Pvegc/Q1shfy3RTJVxnldoE/2D2a/5lYUZWm1hxdb3g5ozXJNj5rCNfQbnf7kKz6KXM
         +BFCxhrbxwxK0Zxk1GLKbLYhenijXe79MX2ggKx29HduLLNe5A/Qkl1WB5PaIOOyqDkd
         +LYGaque4vqezJxZgT0Az4zDeQWaiweq9eH9SR7Kg1j1bhmRo/qhyRlyuYCmhHjjb4SD
         mdZHw6igC6NF27hlzvdRfBM3EBdcvNw7hTWegOebHtfPXgdOA73wKmOfphnRJf+arPfS
         SDlg==
X-Forwarded-Encrypted: i=1; AL+hErHFdCldB8HVEr1tyizWwgTATr/kDmYFTmnUtvKfeycaZW6N92Suf043lEjm3vDuQv47IoKZ7kaPtpwq4g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9EY876Uvf6cDON5JaIH/Gu0WwPaUk57SezbNepRZule4c9vAIg
	LtupW+XJYoRSINTR8StDxkHdm2zEHL3vZva7x8LJ4/8iv4Nk0wb/AVIjSO81VkSLyVc=
X-Gm-Gg: AZFdTZc88r0Glg3RLcm+u9DPwpyF5GSKNk58fZyecy7YCTvt3Xxnrx7Pap/EiAjRvAr
	BcKQ3hTUPh4rIbUAYcfiKmdTv4hhyo9uKHUbxuTycrA1paNUAVEHjx9QbZ8aNZin7AuYw6ujHeA
	H0s4iZjKfQgqQ8AX6fqBHrNZflIswdkHwRZjIj8kRlc5Xdit3wllAPpsWcqsYW8vBVdfLXykvtg
	mA6AaW+RH7wGN1FxIn1ZV4rF2WcVgXQUVSBFhlhqpieIhbobnKvvHwh6bffk2sONfa7MVIkrKro
	QlcW4O1CxorpfdDoXP0DrPAyACkOukiPNDUufXpLG5slUO76obGdscYMWZzZZkASCp2p6JS9c+I
	plhv6c6HPw73o23D9ueRsN9jzLGB01enpjGteAVfX5KmUn0U9aRI4XNGWTSnpn2SAMh6fYWO/9a
	nHEwKUcRVr0ufhH3DqqYfV3ao6LmQbqNUiZS38hZT00Q0sZCQVkDHZ+LVHIirccNRGkJEVhm84g
	5anZNIsoxZsz0nVzRx+n1UZZHNeTua2MX5z5X0aOYz/vkZBfY5Z7K2Gq98/Q5XvcodsbVS5IFub
	h8U4nA==
X-Received: by 2002:a05:690e:813:10b0:67c:11c9:2d10 with SMTP id 956f58d0204a3-67df449142amr3986970d50.89.1795526203028;
        Tue, 24 Nov 2026 05:16:43 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb38322csm1037775085a.17.2026.11.24.05.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:16:42 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqO1-00000000P3N-3lUT;
	Tue, 24 Nov 2026 09:16:41 -0400
Date: Tue, 24 Nov 2026 09:16:41 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Nicolin Chen <nicolinc@nvidia.com>, linux-coco@lists.linux.dev,
	Dan Williams <djbw@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 00/10] PCI/TSM: Support guest TSM drivers
Message-ID: <20261124131641.GE9566@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <2026112325-emit-squeezing-5d96@gregkh>
 <20261123090623.GK14811@unreal>
 <yq5a7bi3riha.fsf@kernel.org>
 <20261123115803.GN14811@unreal>
 <yq5awlq3pto0.fsf@kernel.org>
 <20261123135638.GO14811@unreal>
 <20261123152533.GE179082@ziepe.ca>
 <yq5aik1n4iz3.fsf@kernel.org>
 <2026112429-expansion-wilder-a0c2@gregkh>
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
In-Reply-To: <2026112429-expansion-wilder-a0c2@gregkh>

On Tue, Nov 24, 2026 at 07:44:03AM +0100, Greg Kroah-Hartman wrote:
> > @@ -617,6 +619,7 @@ enum struct_device_flags {
> >  	DEV_FLAG_OF_NODE_REUSED = 7,
> >  	DEV_FLAG_OFFLINE_DISABLED = 8,
> >  	DEV_FLAG_OFFLINE = 9,
> > +	DEV_FLAG_DMA_CC_PRIVATE = 10,
> 
> Again, NO!  No "cc" nonsense for device states please.  That's an insane
> policy decision that will be driven by userspace crazyness, NOT
> in-kernel stuff.  The kernel will give userspace the tools to enforce
> this type of policy if someone so desires.

This may be the wrong place to put it, but this is not a *policy*.

This is a "DMA property" like dma_mask, coherent_dma_mask,
bus_dma_limit, dma_range_map, dma_params and so on.

The name mirrors the DMA API name for a related idea:
DMA_ATTR_CC_SHARED

Unlike the other DMA properties this one is changable dynamically
depending on how the HW is configured. The TSM is in control of this
HW block.

The userspace policy input is how to configure the HW, but once
changed the DMA API switches to following the new HW parameters.

Nicolin, can you put this in its own patch with a good commit message
so we can have a discussion where it should live?

Jason
