Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793989074;
	b=ra6X3rB1I+Duy8tmdR2qOTQwdK5uMd4zVPRzeyi8Ep7zCPoD40VNWHKxM6pQ0NxqoMrE
	 cG88Kz//y4MfuSfS5qvRsFhThhbCk+ZE5aitOldCfiitQWS/MpvqorpKo8DcoHkMG6V3i
	 G/9KaRcR9tC9nnIvb08p2l9A7qzsuUisNz+/XfNSnzSApxot80EucrongD2hdMSaU3DRH
	 hQ5K8FkgoTBu5uj4C9qXfwac4VP77LVoHPsCDrqNcwfXnqoel8TnDtB1dfyyCGCPSIM6L
	 YtsGFJmm9BBjWV79jhh5ZMtP2zJfh6tBYKARgche+wzFl3FjqCYZ9htEMmOYGtyffgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793989074;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
	b=BXkXH1l6F2+0e4NzZwbSmzGS1QXb1KWI0fcD2jg1fD0qV4PYw7BX6MmzaoOqndskLxQY
	 N6mQprCOUqA9h6LhErsNcw0/NWQPwDdYg7nT0GBMPbd6xHSsVbxT/dXKOHt4OicrmDjz3
	 arucJxv4RY4mYmnolz1VwigckwLA3xcL/VPSJpj9ihqzc4DGz6NOWW4aebE6h7srM0v6q
	 CWxmi68+ZjFU+dKXgbGzjKd62atsjKaPOOSjUj6//MQE94tSxKplHqeQkFDAabguwmypI
	 j80enYBFlVC1uvA68d4cQHy7NLC/Gtam7Mdb25f7mZQNhmsEvvBhGehgFfxsnNLGPSQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BbBoR0rP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EA74606A33B
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 18:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9EA74606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=BbBoR0rP
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a018493d57so14135e9.0
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 10:17:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793989072; cv=none;
        d=google.com; s=arc-20260327;
        b=qOmK5FWNPOvWtPtPV5N2aXBrjEUdSAWktPueLo1OXl322ADjHWRU+gJhFUOlAe/IMQ
         dHkddRKRGhIy4VmqU+pnqksgyZmALMihkY6Vir3hR+uViR4LLv3p7oXzJBmFYKApf0gq
         aN8Vj/YDNwWPCIcAQbLjucR8KeBLvYQPIo8g1+YsqUOI97MFH/o8Ou1FDovChra5kIbn
         Bd+KRggBBF6UFc98xDMe+F56Z0AD/NX4slrzygv6VNbZfDAWhKvIaCLhMryXNmCKPMLO
         UoND4HprmthiTt3pxMiaKW7ptplMp7g+IeU9mF3g3cWA+jhP+FhFW2X1bxB2OEJTIRcl
         Br1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
        fh=2X1SkJqQoaZCJ42cGnVeOWmdWM6HmAyKyieu1zkxarc=;
        b=XRygiunS5/UrJB+BcFKfG4dvzPONkxnlcPEary8Htxb0fhV4r0EQ+Q7nwHwOvL2FHQ
         DkZdwgWN++TGJ4i+Uk6OT1631fRKVHa5TcOcJtA+HqaXhBXF9Lb4uYAQtiJZDXkRyD7c
         EjvQvGyjldAdOAfcRJV6Rgpf8Yf9CdCuHyIKS2H6qwZomp8wf0Xj1JlO9eGxoy5bQcfs
         KsqUjNwexTmf+8WRNcycyJM7mQizQ4jpR8nvWPXnk5QbKLuoyk6ZRWC96sGNhcHv2q4Y
         kPll31g5aaLngvmrSV6tWJMa0z2UntLiLAnO1t+8cxPj9gT9ZQWq7imRTlGGTkPCziOd
         SPtQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793989072; x=1794593872; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
        b=BbBoR0rPdz2orTRqTSO0MKEwBzUIkwhVOrmOQYe+tI2lVUjQT2QNFjMG2c9V8cPcU+
         f5YKj+6s/z43cB+XWxpu+kU2UvsGEZaagUNnrBcbmysudnEHq+yNVuUNWzQM5c/rGChs
         ajZNUjfOW0SnWfD82Sk4O29bF9gslOYEC/fNP09jhviTz1OQvSqkLpdCNbwUqsiszb7z
         /ZUOh7GJU3iYihHdfWVyQn5mwMLnw7mLf5177X4jVIT66JX3QyM13NpPfopNiyVtvHY+
         Cx2gHpyYfBfu5RBvm7uq7RB0XzKsU5l6delORrey8pi6+tMwPB6dzKUz8pWh3tpiZ9V4
         hpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793989072; x=1794593872;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BvW3kJ042sHlnHfK0H238m7dXO47goeCrBgoSLkn/eI=;
        b=fZW0VspK4MJ2smIcdJZUGESXZ6VeQBft4WooC2jLaJoDpkL11DX5C4k40w2AIgaEDJ
         e1zdakf1Zq1S5FpQR99cNJ7rZdZw0Q/fRUSjOvrliy+lnZSrXbIUPIPrlBU0hzdiFScy
         30k1co8oReZHsMeVgxpx/xE1vB494B/4w8uALS38PqpXgFWSdlkkPqpdL5OER9005wJX
         NvnFEPoy3LYNJFpddrWRWQfZG5WiKlwV4I/Almyq23pQ8f1YnGY/hGg0c4EtKnnoJUAy
         cXEJyD9iSmQqWv32cNDaHevPLaWTMAHh4LmIxOXI586GzCrT78UFmZHb+eGlCM7a4ogx
         HetA==
X-Forwarded-Encrypted: i=1; AKwUvByRogsY5mVXb0tcWwl3GWpTlR1/mPGCsUTb6lud63WglkAn+6ayCDeJGMpVDl+1r5caEfwD6HrTNo/mVQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9pr6jUvB8/R4lpYxq7kqze/vrKsZyiVJByEja6UFZxrgWjiv/m
	QYnoyOqEAuOQ+ZNMtgLcY8XyGAFcoxqDBFCckh9molg1/uUe95Mmrz0qLpxPjXQ6hxNqxkvxWTI
	ELvJWgMw2tx6DWbUfYyW0uqnHJX2hsLi0t2wZ0a+V
X-Gm-Gg: AYBFou0AZqW3ZA+cAonUFNrrvkwa1pgpBuXQMqoIQPN5j2s1AL0Me9+7uNmujc6m21D
	Mu4Tz56An9hh4kNVitIx3pmaG4kLwvkZsWvnXsbBQsIoQShPakHmfBIK0gMtuSF0CbrX/RVbDZo
	hf5p0//kBZgHvCfohe7wOs8rXzKpQjAaCkeLr3EdkY6mq7APb0Z49fD83mbpYqZRDbyH73FKyUf
	3BayqZsCaagTZf4zVQGUWxZkiv7eluCR7gpIGaIjJ7ed7Jsm00EWx6eqGIJpGuUJ1vrBMVHFGku
	vjeL0KzpwEj0mPYu3Sy7GjI7qIrnnNhZESKEE097hJZQumUH00zKtpCAs+X5BslpU51tU3PnZnG
	0eja2mAI6FBGh08pxBVr5UOxv065A2RHl2bdjS0kvV+HWXG6uG7x6oQRbHyUfO9WFKnBHfg==
X-Received: by 2002:a05:600c:8b12:b0:4b6:24ca:8848 with SMTP id
 5b1f17b1804b1-4b78a30d377mr98115e9.11.1793989071681; Fri, 06 Nov 2026
 10:17:51 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca> <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca> <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
 <20261106180714.GI663069@ziepe.ca>
In-Reply-To: <20261106180714.GI663069@ziepe.ca>
From: Naman Gulati <namangulati@google.com>
Date: Fri, 6 Nov 2026 10:17:38 -0800
X-Gm-Features: AclHuK-83DU2Twv76ErkJhEGQxs5tivwJ4EGd2AJl7A0D8r5G3Ha6ydUc43L3ns
Message-ID: <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Christoph Hellwig <hch@lst.de>, Luigi Rizzo <lrizzo@google.com>, 
	"David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 6, 2026 at 10:07=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Nov 06, 2026 at 10:00:35AM -0800, Naman Gulati wrote:
> > On Fri, Nov 6, 2026 at 9:31=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> w=
rote:
> > >
> > > On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > > > I drafted an implementation [1] for premapped TX and RX buffers on =
top
> > > > of the existing networking page_pool. It is implemented entirely in
> > > > the networking layer and extends page_pool as the default RX
> > > > allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> > > > page allocator code. I wanted to understand if this implementation
> > > > correctly captured the feedback on this thread. Key components of t=
his
> > > > design:
> > > >
> > > > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but e=
ach
> > > > chunk is mapped once per opted-in device through the DMA API and
> > > > records its IOVA for each device, rather than using a shared IOVA
> > > > window.
> > > >
> > > > - TX: page_pool accepts a memory provider for pools that are not bo=
und
> > > > to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunk=
s
> > > > of their NUMA node; TCP copies sendmsg() data into them through the
> > > > task page_frag and allocates its skb heads from them.
> > > >
> > > > - RX: an instance of the same memory provider, sharing the chunk co=
de,
> > > > backs RX queue page_pools. RX chunks of order-0 pages belong to one
> > > > device and NUMA node, and are shared by that device's queues on the
> > > > node.
> > > >
> > > > [1] https://github.com/torvalds/linux/compare/master...NamanGulati:=
linux:netdev_dma_pool
> > >
> > > IMHO the netstack should never read from shared/decrypted memory. If
> > > you put it in a SKB you have to be sure the only touch after that
> > > point will be a DMA read from an untrusted device on the TX side
> > > (sending it to a trusted device would be a fail) and the final copy t=
o
> > > userspace on the RX side.
> >
> > That's likely a fair callout. TBH I'm not very familiar with CoCo and
> > will spend some time understanding the constraints. I kept CoCo out of
> > my implementation as I approached this solution from the overcommitted
> > VM problem where we are trying to overcommit memory in VMs and use
> > these pre-mapped pages to avoid using bounce buffers.
>
> Why does overcomitted VM use bounce buffers? Do you mean this is
> about getting better memory clustering in page pool since the VM
> paging granule is 2M?

Not exactly, we are trying to use VFIO passthrough NICs in
overcommitted VMs. Since the guest memory is overcommitted we can't
dma-map the entire guest address space (as non-overcommitted VMs do).
So overcommitted VMs can use bounce buffers to have a set of
pre-mapped buffers to bounce traffic in and out. We're trying to use
this solution to map pages dynamically with virtio-iommu and recycle
them via page-pool to avoid traps on each TX/RX and avoid the copy
cost of bounce buffers.

This problem extends to generally reducing IOMMU overhead in
networking - taking the dma map/unmap cost out of the hot-path and
avoiding IOTLB thrashing.

>
> Jason
