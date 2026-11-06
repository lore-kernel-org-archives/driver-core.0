Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793988438;
	b=MDt1IIpd7KTs2FvatlD1IP8fAwYMVooWMHH86iE2VS5Zpk9jP/0amItY+19u1eNW6/Pz
	 UZHuzmG7XkvXcqyma1I/iwodGhzGrnBph3UZDx5upIL6MCrWKeH1604+MhXLFqvcFDxgT
	 84Y/Fb60943fFhFyAO9Cwhufox3nZSuxDMqb2hjTNlitcNijdYax1klcSk8qTvfsGuUUi
	 98QQmtI/90m3dkx1qC3tF6+nswbqXbcYytxlCBW7ScTfcN8RvxT854AGr5Yxur+W/haep
	 +ECvSHzYDqdZIBj6PJTkTWNZAdsgPQl5VZKMuomenie6TDLdkHH+TORdDq7TASdbwvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988438;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xsa9e6MH9/SVm3In7oNjUcANbgdM5Ae2hGRi/O5LwW0=;
	b=fzho9av9GGY8MkTwSHed9zUlHIhfB8kN+/rjZFiqgKbkYeH6l6PMsJjJGg+2gmcHE9NJ
	 byse9iiovpCMroh4JKNkDdj1DcNUStXTNREMwZuDAmmqXrVV7Z3bNbGfSq1Sde+KxufHk
	 f+79/H4ESX+DqSCk6UaWTts+7tOYfQjqNGE0Cb6bnYHWMtpCHHNpHDJ2xiZU9pPGuaDFK
	 3bLJ40x9z8/hsBab7EkHkG+7OtsDZjx5CXYarhl7cx4u0NuB+D8VlixK+DGWMqvOtp9RU
	 gJbhCSvs6mNZfpmQuCZyR02QwJNX/RgChPbkZydC5+sXa5fR1lPmXyStmb8HWdgAjNg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lr3KHa3o;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95AD8606A329
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 18:07:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 95AD8606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lr3KHa3o
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-537548b811aso6339741cf.3
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 10:07:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793988436; x=1794593236; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xsa9e6MH9/SVm3In7oNjUcANbgdM5Ae2hGRi/O5LwW0=;
        b=lr3KHa3opeOtbrZAvrtcBXeWbERmh/pJrLKq3d4uBRp9D+CeXa7iI4WTOX1G64hoLP
         pSXsPi1T2aa+d86E3HtRtIsFBucQSnYCEGkKs3CNRc0ELaJoXNQqtLnJtNYC5CM5chzT
         lyw4ht/Iyl42yDpFQVWxLBwSBumJh+eXyNxC3lg/pjNQUvE16F92t9VPie+UMqlwUmWC
         LYitW7XlyjB0+KFEyTwsTGglm52BOrf31FIjY/UQy7WExFYenJzxvyxhXYD7Hi/DWKjO
         KEhQJ73kguBEpztt9WfgFPUYv4Z/AsPEMTlXFtvTWNGf1cHewnn+Vqd0u5tubtSIPvPH
         7yPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988436; x=1794593236;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xsa9e6MH9/SVm3In7oNjUcANbgdM5Ae2hGRi/O5LwW0=;
        b=T1E3ey6oBlpq6eZQZilWesprCN/KuQMK84vUdy9nEfFdh45fpzGR7ahGB+rHtXX/0G
         FMoqgM8EFel94FPVn43WOBUxEqpTxBZrg13+IfKhYCl4/FiSrZ/r8YTxTU6ZhMEjaRhG
         OLLzyzk++dOziIADmQBQp+Wwime+lrIBRwqG9gCTAMg+H4rkFsbn0a16hiGAQ3LERfAH
         a8GxUpyCr3m0CNd0NEa31fBnoLuvs5vc3ugFXlp53szgxqv/P7xPc7BGkQwkkQw6F6WS
         U4UqcQun6GhWWTlM1rRiEbjpApQ0qtJXeHfsxCazTvFkMH3oR2CaCSYu9hulPfXQsEzC
         yUvw==
X-Forwarded-Encrypted: i=1; AKwUvBx9BmWRQ8lK+FHDikYFFV93zT6RcR9zrg1KtTjm3ceUIj+25+7FOAbyaYaCphd6EYzys3sglRvq75tlfg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8s9mwAXwTL/jLAdhtTpB9NK/mjctMbnRmKG4/3JTTKkMrThLGU
	AAai5Fb1VgubDzfFn4I8w6PqptK2CBmEvJY1pu8JoYEQ31DFq/VKG1oOAR8C5D0BilM=
X-Gm-Gg: AYBFou3iKTUqKrlGvysOHogqjjO+DrDSo4PI6MzxYRafR+rpYFJKMU/w18+QQxrcz4+
	0XvOpRWnbSDn3UttBEUqWTWgGH7J+oGVclxkB270wH5yb2gqgEk06Mxthj9inXAdfirj9u3S9L/
	H3A4KMTr39txkamTA4KWEHcA5D/KNj9V8njC7W3XNeIrIqDis1XtLa2zf+G7xk4nzgViIB8X29m
	AzstTLY0yF/a+d/dDR3g2zpYbS8mN79ZJNos4wRWGpjhdfVsWY+sb+EYqadWLeOw5FHR2wgSQmv
	RfDJSeIAqKp7emZitd9j1NP4jFOy0L5ZJqcDGowkg5u8wVxuPNtyQFFgFS7j45G52/nu8Ac+uFk
	dY2eWztMJewcfCJCMp4DMuwBGZ6P0fI3PP5eYV63Lr5dL6sUyGxtPuUT0mbpnGBaPxwgozAW0Cg
	Aw9FXE5MASDDNh8tINjumIncEfLAEMnA/6qMB3ZigCty3LTFwBoVM6Gt1T+ljnZ9xXkbrIT1IGA
	sphwH5YC3/Yk7u1pCyqcqAw/o8XbGxZ2iaLO99HehpUVSxAc1lW/Nqgz9iEqI6ghJO04CelMPV4
	DZ6Q6Wj4AMSApE544lleQB6ZB7+mi++yPKEmRfCm7ZL2xoi0J4OjzYnxHe9d99aYRiOy2MRtPdv
	Kg6DMdTM9Sw==
X-Received: by 2002:a05:622a:480c:b0:535:a5fa:edff with SMTP id d75a77b69052e-54e15b63c63mr47814391cf.63.1793988436090;
        Fri, 06 Nov 2026 10:07:16 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e231d0710sm26555871cf.2.2026.11.06.10.07.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:07:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xPOLK-00000007CW0-3s9S;
	Fri, 06 Nov 2026 14:07:14 -0400
Date: Fri, 6 Nov 2026 14:07:14 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Naman Gulati <namangulati@google.com>
Cc: Christoph Hellwig <hch@lst.de>, Luigi Rizzo <lrizzo@google.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Willem de Bruijn <willemb@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev,
	netdev@vger.kernel.org, linux-mm@kvack.org,
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
Message-ID: <20261106180714.GI663069@ziepe.ca>
References: <20261022201229.GH3381610@ziepe.ca>
 <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca>
 <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
 <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca>
 <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca>
 <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
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
In-Reply-To: <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>

On Fri, Nov 06, 2026 at 10:00:35AM -0800, Naman Gulati wrote:
> On Fri, Nov 6, 2026 at 9:31 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > > I drafted an implementation [1] for premapped TX and RX buffers on top
> > > of the existing networking page_pool. It is implemented entirely in
> > > the networking layer and extends page_pool as the default RX
> > > allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> > > page allocator code. I wanted to understand if this implementation
> > > correctly captured the feedback on this thread. Key components of this
> > > design:
> > >
> > > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
> > > chunk is mapped once per opted-in device through the DMA API and
> > > records its IOVA for each device, rather than using a shared IOVA
> > > window.
> > >
> > > - TX: page_pool accepts a memory provider for pools that are not bound
> > > to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
> > > of their NUMA node; TCP copies sendmsg() data into them through the
> > > task page_frag and allocates its skb heads from them.
> > >
> > > - RX: an instance of the same memory provider, sharing the chunk code,
> > > backs RX queue page_pools. RX chunks of order-0 pages belong to one
> > > device and NUMA node, and are shared by that device's queues on the
> > > node.
> > >
> > > [1] https://github.com/torvalds/linux/compare/master...NamanGulati:linux:netdev_dma_pool
> >
> > IMHO the netstack should never read from shared/decrypted memory. If
> > you put it in a SKB you have to be sure the only touch after that
> > point will be a DMA read from an untrusted device on the TX side
> > (sending it to a trusted device would be a fail) and the final copy to
> > userspace on the RX side.
> 
> That's likely a fair callout. TBH I'm not very familiar with CoCo and
> will spend some time understanding the constraints. I kept CoCo out of
> my implementation as I approached this solution from the overcommitted
> VM problem where we are trying to overcommit memory in VMs and use
> these pre-mapped pages to avoid using bounce buffers.

Why does overcomitted VM use bounce buffers? Do you mean this is
about getting better memory clustering in page pool since the VM
paging granule is 2M?

Jason
