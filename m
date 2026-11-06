Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793988052;
	b=A5Z5ExMnXPblu2xinNTCS6qTzMM0HnXIHFc0ei+Gd6/itQzS/KYU3NOmQaTYs+EmLAke
	 o5du7FCSBD4rt4jCAYB/YW8iLOhKpJHb+SRUDW9qEvMArXBDpL9LAE3h+/kkqgM3A2nd4
	 Els3KqEf8naj/ew43CfZRkWVz11DEYUnsByp4Afnrqb62z7lal20JvXVMUbkFm5Ia3MWt
	 OfCDSjJeMzHUZbENw35d92qG0KIjOdFSOTjaOu1pXQ9QiNMBzQZQZAHEb6aBWLZpBOCPt
	 5W6yGYFhUxxsGiPihK6qY9U3k6F8hY5hT4ePjwZNzlogSxEoK/mI7u6A4aSDesX4Z3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793988052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
	b=Q8nrjaf27Agv3q4JvbKx9w0JPLRXNdYmUXlH/C8gqx9DTaCjckS+rV2mKEfO41RKJGTI
	 jEL+Js+AKhHPM1YfJcczB5gK2mmc3C/PWeHjFgnWVHa0hxGo8cfXmd4/+fs10WQ1qOhYF
	 qxdXAR1wv79s++6xzIIdP2PKCXwe5AUnxTOlrp5zFv/Wp41FCt82v2H6xYwyO5lkO+M2M
	 tBjAhAIOVd00auHMDw2a6cpL43OhnuQekzj6H5uvDgHuo4QGCI3AJPHeMU34lDTrzE9J2
	 w6BLNRNiTfpTdgllJ/zU/LtyNVxiuE32xUCOP9QlBlFrVDZjImLmQM0fwUx8kRdGvgA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="FKwM3S/R";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5591D606A32C
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 18:00:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5591D606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=FKwM3S/R
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4b6266b5bc4so3305e9.1
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 10:00:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793988050; cv=none;
        d=google.com; s=arc-20260327;
        b=Q1ehejojWemt/h5vPRyc1tqRjV3++NyMqpwIGwtlGJvguwq8vBeL5cry19aBsbyGlZ
         qwBtnsasf6iRf3QshqmDZvWLplC2xSaC7NvUVhCecIUHw5rOCAIG3+1E6ckNPuExYxrB
         ku/fb+R053zIdSAaxaFRDz3NzNBoGLvCLPayQyTNYo25Gc8kpZwoNmTahl1epuCCZd8j
         8jsfSOaNOOWcRgv543YDLo5uCGH88p0BB9l9t4zcarCC2fGP3zeCV0YHDlMdMLiS0wPO
         DPOQTqU1zDHxrpxDIpYvBPySDJ0BCIRf9YHiUQ2H0ugzbxB5Fcrftof9mrPSrDFo6VyD
         +tfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
        fh=GtJ/PxA4CO6eEPkXC9Bo3aW0sA9Vb5h/ihFF4Y06Q/M=;
        b=ascXRINHesWYXzV87K+HdPvN73D9pW5NL1QAJCDu6Y0u6FgSPzOi8VHmIEF5Q+FW56
         mwyxlA75U/+GCWkH3tKFInl2L30tfNJBrMOxkmqVye0+XgPUFN0P1i/cTS2QbfMjzCbI
         ajM8ImEpQH6GGZFDm54r4OwxEM4TFfWavL/QgySHW2CLlG1SyceXiLm79WCGXjMYvu9H
         UljF4q776+hIaCtlIWExicAdpYoHdhj/HUKLqjXy1JJqGheSJxprDeevUlbhRJqLDYBP
         WZ1b6uSuPSJiYjIPKzOI6VwDz2LQNqJAKyg2jsAp5wGH79PLWdLQ92Dtba3Lt8kWXRwq
         +gNg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793988050; x=1794592850; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
        b=FKwM3S/R7hV0DCiyLA37Ai/gJ2L+cws67+Wy68EXQ22vjvrV4DyBtLq9NJ1vbVrGu6
         bKRq2ZWqOkJ+vfLLuJWNYkRqa4NA4NDGP7wrtG0EVgDjYgm+HrZMaMDC+iOjmvMm66Za
         YuR1X70xAmWn0EEJvA9C7mxdngEHAvcQPZO1cBTZAsV639Qm6QmFjj+wRDiD/AxqTqAP
         yE0mJiDr8kqz7CPJv32gYejYxi2SaErm++3eXYcSHgAHG1riETsCVImsvF/NMJtQmYwE
         cM9V9XEKcRiNBcIMBeZjetAK98rFvCvf8Et6cgyGYk3OVbaW+Vpx0FIZl1/ftX8E4lZO
         nYFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793988050; x=1794592850;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YnPe9jMocBvynbA9CNTJ1Pl6eniz/8su5Gj2vJyxmpg=;
        b=Px00sN4bKnzd5FsauUYlNyrm/tAyGsZK3SsZdvyDCDbg+07eFoFSJkQCvHOOPaNeVm
         0OMOjQS0NWbxsoLgDeN38DtcYdrnUffjX5AV7Pgs/+Wz2VwQ517BBx9DfpB/1nVSeMdv
         jKRtl9LePyBcFl2UlQzl1Nha8/WcZzBuECQ+jtKnVB6qURwCSgPbjDsnqosE7gUgZYet
         aWrp+ao7se4XpKX8uuDqu4a4gHdtLb9NEDxJ+CCdeLLlJwgDZ+H4xAr6cEf5Y8GYHjJC
         i/J8yvVvBWnIQ9KfLpCaIkytP44Zm/Dl1PAmFaMPRYHYUtu/NIOK6XSXqDyVX5s0N9N6
         FTiQ==
X-Forwarded-Encrypted: i=1; AKwUvBxyabtpCzw89PhPcbsx4leYvCtAQVDPv1CHtBlLKIkhEN/+0FGS3kJgmI7HD2HSn7fbG4QigJ3c2RYSGw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9f+BQIwCXl4h2cHsTGXCus0FCMYALLtCUDJ2WvN4ze9/U2BWeF
	CCDJSi39BaIt9bHCBKncZxbet8rvz3uuLk9Pb5bBRB7FJcyj9FW1y5wklCF9dJAPNaLRoVku/Yd
	A8iBZAjmy88edyUOkaaJ6vUjac4Poc1zGkIGaAWfQ
X-Gm-Gg: AYBFou05AJ8DoTiNO5+CebByq26/24209ud3ZEeETIaAjxFjZfCO1vHDRn46KaT3Esi
	l7rmWirP/8QcmxNSK+gPrTuQERyeLOQqV5qsP8U7HFT8j/lv+apNNdmElLj9REM/6SrdZRYBAtH
	uL7SGdPINDKNRZzlldml8opQv/UaSeHFTX8SapAHc4Q26uXcuO6ApLk58QuCS22i/Mkqt72Gi3y
	pn+dtEXliPCVT/bMnzTFFgsxPNNHmYz8h8LqOU+Go/b02AKe5aZT677sFD5dUgTYvl3wLutSmiy
	VwLG0DQ6hg1B/mygO6bxbLi6/t7ra/OSK2MOuGrih5qtM5mhyzOKfzD+UzM7lBTrcrYRpDObp3U
	jrAnBnq+gqwbK/8qJ0BwZWO7XS36+VW8pSHQw9V0XgPjK84L9auEDvGNXKYQvyd/bWbnTZQ==
X-Received: by 2002:a05:600c:c3db:20b0:4a1:fb0b:1c9c with SMTP id
 5b1f17b1804b1-4b78a30d10emr50205e9.10.1793988049366; Fri, 06 Nov 2026
 10:00:49 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca> <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca>
In-Reply-To: <20261106173054.GH663069@ziepe.ca>
From: Naman Gulati <namangulati@google.com>
Date: Fri, 6 Nov 2026 10:00:35 -0800
X-Gm-Features: AclHuK8x57W7AnFw360PBbTWaHMwGgtNX68cpPd5ipqmMu4tcyLJQyWTDt3UxIA
Message-ID: <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
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

On Fri, Nov 6, 2026 at 9:31=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > I drafted an implementation [1] for premapped TX and RX buffers on top
> > of the existing networking page_pool. It is implemented entirely in
> > the networking layer and extends page_pool as the default RX
> > allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> > page allocator code. I wanted to understand if this implementation
> > correctly captured the feedback on this thread. Key components of this
> > design:
> >
> > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
> > chunk is mapped once per opted-in device through the DMA API and
> > records its IOVA for each device, rather than using a shared IOVA
> > window.
> >
> > - TX: page_pool accepts a memory provider for pools that are not bound
> > to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
> > of their NUMA node; TCP copies sendmsg() data into them through the
> > task page_frag and allocates its skb heads from them.
> >
> > - RX: an instance of the same memory provider, sharing the chunk code,
> > backs RX queue page_pools. RX chunks of order-0 pages belong to one
> > device and NUMA node, and are shared by that device's queues on the
> > node.
> >
> > [1] https://github.com/torvalds/linux/compare/master...NamanGulati:linu=
x:netdev_dma_pool
>
> IMHO the netstack should never read from shared/decrypted memory. If
> you put it in a SKB you have to be sure the only touch after that
> point will be a DMA read from an untrusted device on the TX side
> (sending it to a trusted device would be a fail) and the final copy to
> userspace on the RX side.

That's likely a fair callout. TBH I'm not very familiar with CoCo and
will spend some time understanding the constraints. I kept CoCo out of
my implementation as I approached this solution from the overcommitted
VM problem where we are trying to overcommit memory in VMs and use
these pre-mapped pages to avoid using bounce buffers.

>
> Everything else is very security questionable.
>
> It is unclear to me how any of these page pool proposals meet that
> requirement since page pool typically provides memory that ends up
> widely used in the netstack.
>
> Jason
