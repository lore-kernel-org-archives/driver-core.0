Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793992308;
	b=5f2aeISHYWx67mtMDNwxT+iif9s3eNAualuI+K9hYSguf6DDu99MnPZUbYbFzW9l1j3Q
	 L2fGLa+6Xl34nfIcnRQlP3aw/itbqNSjkDNvfZGP8ehZ92kS/5FEArQ1RKv2xswATJH9D
	 PsgY/VFfRdpXaQVs+qyIAYgqAKgR6Ofa5p2slpyXmvawmFdQ3lrjk0zOCrGeNrzAQZFDn
	 Phte2Yi6bTsmBvjepd/2LLEcTCLlAKV7n7SllbWrw41n4U8TZvitSJcSCyZnEPCFbAwqu
	 MCq5D0PNYc0RC5u+guq8FQe2HkyXLXUFSLP+Yly0uP9H5DSHSsp70sslEQbxLppdRGw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793992308;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=h2A6aCl8kyfujglJb3VkwVgvWA7M4CaDd0+96AnNPHA=;
	b=Zc/KBM/pRlUgtaGWcbpODFTyfUXzV73gmdHPVgTRoOrD7NaXtBuLDlBvvgIX0YD3lXYL
	 3qPWiWukCJ2kYjeakBf1uwWK62vPAeAs/5QbeB7aHXv3B1aOQip909pD2O7UYbZ/0iEwI
	 g6sm8mMV7mFfw74hYEw5yNAMVHQ9Nqlo/83cg76m+g24P+ta2PFrJ4Wxfatuokx+96iO5
	 q86npReZu1sUrIjIvocYJhwo2OJnPvRcGfuLwD+lVjXZIYDiqA0FqgefINqY1jsaDPsiI
	 NaK1n/+q0qBr0+bkNC4Xa7d5LhxVn6CMsL6O9821HjdZ+xKmwD6uhgf8B3Tpv1U3GGg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SvInCMNW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B19C3606A339
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 19:11:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B19C3606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SvInCMNW
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-54492d8a988so1011cf.0
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 11:11:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793992307; cv=none;
        d=google.com; s=arc-20260327;
        b=C79nCuiz9RhORD82A2+bpwkid+H6gfGG9h9ujdmdbJ34zQZgZk+InuKzEIK8GyQYYO
         ugnCI4S8expFei3NNds5/NEBwY7BByh00pXolOzmWQAUjT07GV2MJe07Vjukp+1A3pc+
         yc+dxQRwx25DU8R9Z/RwmCrjVXb29sYfoz9wG3SVV3XpZ5J2k3vwvJ+wxHuP3R2+bVc1
         hj0JxASukxGGklOU0KB56cmo1u6Nd15EnBUnzqSG/mebKCTwaWWm3T/vubIuDviWlRQj
         WkQuzO9iz4heP8bxaNEueglAGCZm8xSxMBR4bszOenn1Y0aJDYmTPpyM5Oe9KFkqtspo
         fToA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=h2A6aCl8kyfujglJb3VkwVgvWA7M4CaDd0+96AnNPHA=;
        fh=RpZR2HDnJh+Tq6xvSfQWiMWV6zoE96+vpz0ffVIwiaQ=;
        b=U25guQkmy4mKJ8yTd2ZKynC/tFFfyr3xv5p9FZ4J82jrjySfZp6TUTQ6shV9N5hE6O
         J1fP/OJf8xrUKFXdMwDUq42J8oIwBXbYRAF8AlkJRM/xggjKjyowj/dkcb2dka6I5Y1W
         D8cGsQ2J0XnfU78LA/fIrdb0hvUNCiWD6CZ+iNA/KtGu33pqHyESx011+Ah1Ypr9xOzH
         mzcVcAx6yqqjKSBO4vYBohKc9lL6qsVd+I3j89piFv4j8ATG5/tFCWdKIKFMuugo/Jpq
         IOU2STy7A1JnGdF/7gXfpI3aWS59TSwwyX6Yl3I3dGoN5/sNrySkjOeyBu/YiI/IVDzf
         +yDw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793992307; x=1794597107; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h2A6aCl8kyfujglJb3VkwVgvWA7M4CaDd0+96AnNPHA=;
        b=SvInCMNWcTK+HmxzhRxdnH57JD9T+T08f+eQ2F0RE2hFKaQFRgByqOcMWqrKDIsfRi
         +Bpl69RIyhYd/R60epRoJoCv3onpurS0WPHlTr8KzpAd2LGjPbrs1VjhJ4TIOcIDtAgA
         ukDy9x3hVQysf73XMCt/fJkDy/a46hndO5El6cYjgTqU7okhvhZQ0fHP6+NQmuRKVDDU
         +cgAJ770LYq4fQ79gMSJTpwjoxFoXtVWdjwpehLXBqkGZ1uAMv4RcoKnhXVZqq7Qu4DQ
         /M7OV5hngOpgsL8Rw8dhGLOFUwnl84k4BK2A34xdNRR+XB5nkxIxlV/aGechgbrOGk1z
         C4dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793992307; x=1794597107;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h2A6aCl8kyfujglJb3VkwVgvWA7M4CaDd0+96AnNPHA=;
        b=WBops9x1wv3NOSUZuVzd0VJjQnqXH5O5a3fCHg/2doZAz8tyQUtYJiPGEvt/3gegke
         ry1p0uIZ9Q4lyEGOFqw9qKyCOZT+szD3SwurfO6SbzEj36/T9/WKSEV0pxKX4+fUVF8B
         AAUMKhrSbj8cMeyZRz6uSobObwKO3BKLU3HjrK5BE6LcXVUs5odt/gsrzn/Kdl1tjTWI
         E8lwbtHVc/pz+jZE5F6fKWHNdSXmnVUyObRGnS9vSglYlejG4hDbq2cMWp15sfiy8bgl
         29av+tT1azA34c1z/PAbJMvtMzg7Q6m2zS42iAokYrLjaZBgQBZTA1FLjk8L8u6s8NCO
         Joxg==
X-Forwarded-Encrypted: i=1; AKwUvBwq8UFzf25LvnXbCCJZzv7/WwmqGC3RZCxAdHql4vHwu7lCvTpfc8YreOF2tqHKgOge5pxtvsHSPCiYjw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/OFxoDo1sX8k33r0zXcIcjXLQkgQl0lyDmTupSymCv56EcnVzI
	kux81PTRsnbjvryB79GLhcy4lGtaOxNmxbgGl4C+0y4tkCz5GdJAbbjLGw0sEsV+SwQooi9Qu6b
	gdtye1bPkjkvxz2v95n/8juUbmwCOhROF5rA/d7iZ
X-Gm-Gg: AYBFou21YN1/yMMbLfCQWmuMY/ZgstRV+ofkOuFsDa3ps9XPd0PpQ8lgbZDMD+VCmL8
	EkNI/Z7huq1VzU9vIfa7P/0H8/1Y0dtfkAMYM7A7zgSsIHKHME0hKLOQ80pwUnCvZ2ssR6SymF0
	PbWdYw90s6WTjeMvTuGzVqXz4Sk260niJEoDT/tEKbVjkRSIXZMQQ7VE3DKzAjNl5/ZolFECSvk
	T8nedoUpeHPolLAfHe126Wf0vDnbOzLhvSNOP59QL+yNu87Qrg8A4+IV/ubtJNWQZhwYZ+hyFF6
	+ttaFT+kNI5lF4MTa3AQO1gakE9fqEGQTru5IrJ0jXHKss2BfFnjelVR7uhkufVJyLCtIZPrkya
	k5h0v9NZX+2h8D3ulSe8zvPMMMgdb4kJUD6iAOw3SemOCOWgxyNXkFJFJjxaIP5KOvvvIng==
X-Received: by 2002:a05:622a:2297:b0:532:eff9:ca08 with SMTP id
 d75a77b69052e-54f82d870e1mr1932401cf.12.1793992305834; Fri, 06 Nov 2026
 11:11:45 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca> <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
 <20261106173054.GH663069@ziepe.ca> <CAMP57yU-VhZWXijvwAXcN9=zZ+eWXZ6J1bkHuCJw3ocRaFaV=Q@mail.gmail.com>
 <20261106180714.GI663069@ziepe.ca> <CAMP57yW6Y4g-xM9YTB+MpgxPN7RFeEWhAPWvqrfOoMDEuL8HZA@mail.gmail.com>
 <20261106184346.GJ663069@ziepe.ca>
In-Reply-To: <20261106184346.GJ663069@ziepe.ca>
From: Naman Gulati <namangulati@google.com>
Date: Fri, 6 Nov 2026 11:11:28 -0800
X-Gm-Features: AclHuK9JPUckmOeUyc8sSIbL-A7oi1CB3RcBM1vHWdycPuPf0ms-UPAYg2zqwxM
Message-ID: <CAMP57yU7RoWXkvOfx3ksX8kaO+0h8WPefpjnY2DH9WR_TYGJog@mail.gmail.com>
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

On Fri, Nov 6, 2026 at 10:43=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Nov 06, 2026 at 10:17:38AM -0800, Naman Gulati wrote:
> > On Fri, Nov 6, 2026 at 10:07=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> =
wrote:
> > >
> > > On Fri, Nov 06, 2026 at 10:00:35AM -0800, Naman Gulati wrote:
> > > > On Fri, Nov 6, 2026 at 9:31=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.c=
a> wrote:
> > > > >
> > > > > On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> > > > > > I drafted an implementation [1] for premapped TX and RX buffers=
 on top
> > > > > > of the existing networking page_pool. It is implemented entirel=
y in
> > > > > > the networking layer and extends page_pool as the default RX
> > > > > > allocator, to the TX path. There are no hooks in the IOMMU, DMA=
 or
> > > > > > page allocator code. I wanted to understand if this implementat=
ion
> > > > > > correctly captured the feedback on this thread. Key components =
of this
> > > > > > design:
> > > > > >
> > > > > > - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, b=
ut each
> > > > > > chunk is mapped once per opted-in device through the DMA API an=
d
> > > > > > records its IOVA for each device, rather than using a shared IO=
VA
> > > > > > window.
> > > > > >
> > > > > > - TX: page_pool accepts a memory provider for pools that are no=
t bound
> > > > > > to an RX queue. Per-CPU page_pools take 32 KiB pages from the c=
hunks
> > > > > > of their NUMA node; TCP copies sendmsg() data into them through=
 the
> > > > > > task page_frag and allocates its skb heads from them.
> > > > > >
> > > > > > - RX: an instance of the same memory provider, sharing the chun=
k code,
> > > > > > backs RX queue page_pools. RX chunks of order-0 pages belong to=
 one
> > > > > > device and NUMA node, and are shared by that device's queues on=
 the
> > > > > > node.
> > > > > >
> > > > > > [1] https://github.com/torvalds/linux/compare/master...NamanGul=
ati:linux:netdev_dma_pool
> > > > >
> > > > > IMHO the netstack should never read from shared/decrypted memory.=
 If
> > > > > you put it in a SKB you have to be sure the only touch after that
> > > > > point will be a DMA read from an untrusted device on the TX side
> > > > > (sending it to a trusted device would be a fail) and the final co=
py to
> > > > > userspace on the RX side.
> > > >
> > > > That's likely a fair callout. TBH I'm not very familiar with CoCo a=
nd
> > > > will spend some time understanding the constraints. I kept CoCo out=
 of
> > > > my implementation as I approached this solution from the overcommit=
ted
> > > > VM problem where we are trying to overcommit memory in VMs and use
> > > > these pre-mapped pages to avoid using bounce buffers.
> > >
> > > Why does overcomitted VM use bounce buffers? Do you mean this is
> > > about getting better memory clustering in page pool since the VM
> > > paging granule is 2M?
> >
> > Not exactly, we are trying to use VFIO passthrough NICs in
> > overcommitted VMs. Since the guest memory is overcommitted we can't
> > dma-map the entire guest address space (as non-overcommitted VMs do).
>
> ?? I understood you could and this was implemented under the
> virtio-iommu by pinning the memory under active DMA?
>
> Where in upstream does the DMA API force bounce buffering for this
> case?

Sorry, should have been clearer: the DMA API does not enforce this,
bounce buffering is typically implemented by the drivers in this case.
Such as QPL mode in the GVE driver.

>
> > So overcommitted VMs can use bounce buffers to have a set of
> > pre-mapped buffers to bounce traffic in and out. We're trying to use
> > this solution to map pages dynamically with virtio-iommu and recycle
> > them via page-pool to avoid traps on each TX/RX and avoid the copy
> > cost of bounce buffers.
> >
> > This problem extends to generally reducing IOMMU overhead in
> > networking - taking the dma map/unmap cost out of the hot-path and
> > avoiding IOTLB thrashing.
>
> Sure, that makes sense, but just having a pool of entirely normal
> pre-dma-mapped memory is quite a different problem from what launched
> this thread...
>
> Jason
