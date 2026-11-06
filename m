Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990629;
	b=oHCjeGe7OCEqL+uUwScSxLXWYd+5LIuRXzKPvup+Lc64kI62axA6N91BU4n9glHBp7Wx
	 rDmKNH/bdvzYmqBT8KxPf65zHYuI/jrFvbjmhzYQegBvQydSnb7azfDereRn89lW7rdAJ
	 gFVbyvIxFWNtYvUPGhSYWrzJjfnVvcXL3lrg3MKZN2gZ8GWadt0vgU/babAqPWlhBeKnJ
	 ZaWmsI8nGIpz+X/fM9d3kPpmShJOda0a9cHgQprITZJwuCP2O3RB3uFulofRNPm3H285A
	 XMVg5DOLJU3rAsHquSdrr+vBz0YUin0c2Yweu9QcMPBrXSmVUeo9yxjfGJ3q0jQ4zGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=b7Y85ZMNTmnO5vyHoGmhNUdpyQ1xa3t2s3wZRjsJimY=;
	b=kAX/+ubHqH+Iw2GfHZUsjgwxr06y9UD/EgurejongNIvwe96rSAzptk/w87I7EduL0Vm
	 pa+eiyxXbquDnN6bVIodSvalGEbeCbABBXZMtqfybCL37L4MouKSSIpuSuIc/FixCagh1
	 5TTkLDZrLdCTTezu21NM19jIENUTfIiiDBQezTWt/Aqf3wKS4fUZSdgRxOB2HU/tAQevl
	 5l0xvSwxkO3iTwq1K9UV8vzLZ0ywo/+H3I1FRBqkRrl3gPoYuEaw0USAKVxscJTOYn6Qv
	 f3iNvJGqSMLFAbUezh9Cz1o53kf+2SPhfHOZu7dAD8MxepVG0F4DWFGAnAVtogT/ysA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=STDm0Ns6;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E53C2606D82A
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 18:43:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E53C2606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=STDm0Ns6
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91eb7d1478cso3147696d6.0
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 10:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793990628; x=1794595428; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=b7Y85ZMNTmnO5vyHoGmhNUdpyQ1xa3t2s3wZRjsJimY=;
        b=STDm0Ns6/45sn2GRqprHpdF/TMkQ19axHR3n5cyc181ziPFbHYTRRicsRris+v5cZR
         rUmYTy0rLtZNDUseeeDlvHQpKzXW3Y3AEWt+Z+bytjfs3p9qkggzEAWc+TzdsR7nURl2
         R9ctDLjI8qsRR2Qe6yLo/cMXvjfapPD6InEEebX6QJu8UHz0jHJ/wQLIihRgpkeVcMvv
         LuYUeGZPFkScEPmnPoRyZ2ToUo0i9fo1Irda1Qkj4nLCljVgpNRiOWMhPqi77dsSTtej
         V1sIBLyiax5uQYbfmQ6/pmMCsKi1UVKqptiwW1xEWkaaX8cFzTDzeqLVeyHP+4JVEFPa
         gKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990628; x=1794595428;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=b7Y85ZMNTmnO5vyHoGmhNUdpyQ1xa3t2s3wZRjsJimY=;
        b=sjv5RihUkSHLaFgAJ1XA7Kz0GpmTX8KvJnNFeIYvU0RCc71h8plgXsb6s9/rdnfl7B
         nSqeGRpCGatUgm0XQ2Xla5eTqqwUSLIhsLKu6VPAqxMITsXHela9VmfD0+JFKSwzR8Sh
         JKSApNR55Pm7vx1t9su1D9ncdr9MBnH1mzjpvx/rXjWdGFNeep6k1cAYaTcENHeVfSPC
         j7fqDkW8uHmFsaTcfEM9Q/PAkYiqva9JAfAdK95OVkrRSz7Se5JKTpQJyk+6fznyWv+5
         OD+PErQRV7kJwXPxxgg/P3ygj2QpKV15qbXRzWb3CazFnn5DaOSuAI1YXaptpkF1pYRF
         a2gA==
X-Forwarded-Encrypted: i=1; AKwUvBwBkl9hNhj9v4/A6fsUbsDzCs2q058GCczj1zGysalLNHMtrJAdmD0gscRwjnFZ33B+1uKw2dbp7zLJZA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8KInlAQRXDei4OPFcPbYoCgMa/Yc2XMeKWRhIwahshkyv9mRzR
	APKE4VH2bIqnnOGVKwDPdzBqZF17M+mYWmTHigpaub5YUweyu05ojOtQ/9k9zCTB4Es=
X-Gm-Gg: AYBFou0+FxUXfCluvET/VgrBoEqFtr2SCFo13LGGctepr7j9iJ2iplkPAbQyVmMCg9y
	hWtjnC2Czo0LsouhVTWoJuNYWIqW5qr4IYdgSH2U80F0K7iYu2uCAtoERp8Y1u7SZho2zsxs0Mr
	TxVl7I/Wd3T4XA9BlyuU3F79Tx4WyDNfZTz1LagVY1Dj/h+IcLHMVfWJ+0Gi6h+OXU6LQiR/Q9G
	lv9QBoLweu5ya9G166+hFhAmwYxHM/mpgw3hrkWhraCqzRuNZe5nAZNXvoOlFitWrhIr/og+ek7
	lImAM4tc9W/MCrMhQ+AdgDTfi9NFRjYVbTrn5gJ87cBeqGiivwpWGuojJUDVt5tAldyo0YvjYWc
	tYyebaIZQuN44/xRa5HlzQxKSyFtC6dYD4S3oGcVg7nV11c98lhDaqsYXH9zNYZgNHRXgxaz0vk
	Ikh0oYXa/VS2q44NwregU2aFBychz13TkA/jm0DB/K5u2WcxjcrNSHxWVCzpLeS8J4r0bV8xTCc
	JjK2gvbabsiRJY9YnYudaQTcd/Mr/3r1uhggJ+umL+A1Zf9Y1/wAZ3uUrlM+QNMjkeRO/tiKdLV
	HyZkA/oBsEHRsdBCyktC+TmoH/EOgEPdJ02fQiS13NKqPcvhcij1azV5ymyrbX2ocMvuQRs8r8d
	Iz98l3Vko5A==
X-Received: by 2002:a05:622a:47cd:b0:536:764e:1527 with SMTP id d75a77b69052e-54e14a6c486mr53004081cf.44.1793990627606;
        Fri, 06 Nov 2026 10:43:47 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e25785f14sm26823821cf.5.2026.11.06.10.43.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 10:43:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xPOug-00000007JdL-0xGY;
	Fri, 06 Nov 2026 14:43:46 -0400
Date: Fri, 6 Nov 2026 14:43:46 -0400
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
Message-ID: <20261106184346.GJ663069@ziepe.ca>
References: <20261023140107.GC3977851@ziepe.ca>
 <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
 <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca>
 <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca>
 <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
 <20261106180714.GI663069@ziepe.ca>
 <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>
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
In-Reply-To: <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>

On Fri, Nov 06, 2026 at 10:17:38AM -0800, Naman Gulati wrote:
> On Fri, Nov 6, 2026 at 10:07 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Fri, Nov 06, 2026 at 10:00:35AM -0800, Naman Gulati wrote:
> > > On Fri, Nov 6, 2026 at 9:31 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > > >
> > > > On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > > > > I drafted an implementation [1] for premapped TX and RX buffers on top
> > > > > of the existing networking page_pool. It is implemented entirely in
> > > > > the networking layer and extends page_pool as the default RX
> > > > > allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> > > > > page allocator code. I wanted to understand if this implementation
> > > > > correctly captured the feedback on this thread. Key components of this
> > > > > design:
> > > > >
> > > > > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
> > > > > chunk is mapped once per opted-in device through the DMA API and
> > > > > records its IOVA for each device, rather than using a shared IOVA
> > > > > window.
> > > > >
> > > > > - TX: page_pool accepts a memory provider for pools that are not bound
> > > > > to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
> > > > > of their NUMA node; TCP copies sendmsg() data into them through the
> > > > > task page_frag and allocates its skb heads from them.
> > > > >
> > > > > - RX: an instance of the same memory provider, sharing the chunk code,
> > > > > backs RX queue page_pools. RX chunks of order-0 pages belong to one
> > > > > device and NUMA node, and are shared by that device's queues on the
> > > > > node.
> > > > >
> > > > > [1] https://github.com/torvalds/linux/compare/master...NamanGulati:linux:netdev_dma_pool
> > > >
> > > > IMHO the netstack should never read from shared/decrypted memory. If
> > > > you put it in a SKB you have to be sure the only touch after that
> > > > point will be a DMA read from an untrusted device on the TX side
> > > > (sending it to a trusted device would be a fail) and the final copy to
> > > > userspace on the RX side.
> > >
> > > That's likely a fair callout. TBH I'm not very familiar with CoCo and
> > > will spend some time understanding the constraints. I kept CoCo out of
> > > my implementation as I approached this solution from the overcommitted
> > > VM problem where we are trying to overcommit memory in VMs and use
> > > these pre-mapped pages to avoid using bounce buffers.
> >
> > Why does overcomitted VM use bounce buffers? Do you mean this is
> > about getting better memory clustering in page pool since the VM
> > paging granule is 2M?
> 
> Not exactly, we are trying to use VFIO passthrough NICs in
> overcommitted VMs. Since the guest memory is overcommitted we can't
> dma-map the entire guest address space (as non-overcommitted VMs do).

?? I understood you could and this was implemented under the
virtio-iommu by pinning the memory under active DMA?

Where in upstream does the DMA API force bounce buffering for this
case?

> So overcommitted VMs can use bounce buffers to have a set of
> pre-mapped buffers to bounce traffic in and out. We're trying to use
> this solution to map pages dynamically with virtio-iommu and recycle
> them via page-pool to avoid traps on each TX/RX and avoid the copy
> cost of bounce buffers.
> 
> This problem extends to generally reducing IOMMU overhead in
> networking - taking the dma map/unmap cost out of the hot-path and
> avoiding IOTLB thrashing.

Sure, that makes sense, but just having a pool of entirely normal
pre-dma-mapped memory is quite a different problem from what launched
this thread...

Jason
