Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792765863;
	b=vG8LLrX4wQHRLjWdA7GmFTWs/1mdCO53YBYRfRFYUjAxKl+wzLrKxBBeCRLxJYcmBJ7I
	 zM6dIFu/ARcHKXywcBqt7J6yCTpOFsF0ddzANRCKlmkSkARQu5cAahA4W7uZyorhH8udM
	 NIlKLNylyUumEYLNnQL3mgkHwF/JxI82QQ4e9pr+/CPLb1zmz0n9Tj8JWGZiwa+eGQ2Rz
	 bVpuKl+l2/npYAFAUXL5N+D98tK8z1MtmijP3P9Yv6UCPwoQZJCm25FVJIFb/ztLTxamV
	 hryWZsQiGuadjqhm37a4/sOeTf9beIN3LvASI4j25aSfnVV6LXTH8izNazmptF8ALGg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792765863;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s3FkMl8OhjMqOhi3zpzbiZNiNsx48LLQzOlCjP1CveY=;
	b=gpZOM3aEtATVrnE3mJO3RfYU391dC8vqHKvQtWqLenK4sAHo48bndU0pwL1qVaEjBY+h
	 W4JVXDfmfzurvsJsGNUPwUbXTOH9wlRm/WJC0BTPD1omgcF9dtFSFMEjFmqA40hNyWGDn
	 K6Dx1m72ok4+I3h/z2InOxgUTiks9ImXcYbRUyN2ProC80764PjKy1ykyQMjoWxf5xbD3
	 QM2RM3TfKfKoccBBJYjWZR4je8CLdaWmP5t3Bh09LABBRYZWAn+KYHfU4mOcsHhKNG/jC
	 j0Khju7DT3/yr4BV43crOa6j5IXIh7RPWEJgWBCH2C/t6jkEvconf9Ud31CSy9LDWew==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pUhHw0SY;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.178
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 847A9606A326
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 14:31:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 847A9606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=pUhHw0SY
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2db33db4de9so70975ad.0
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 07:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792765863; cv=none;
        d=google.com; s=arc-20260327;
        b=RdLAp0z2X9YIeheEgD3B5SMgZjXT0XGmUoVnPaXbfWY95nogDdsMY2rbOmxFCuRNoq
         1UC17pLJ6FdW+ERcRJp4jlRmXjzmspLeCL7vkEZRVDxb46mkTMEblbL+a+21XWRBab3e
         TwofGKF/zCfo6d7WmCUx/pjxycGjjbizi9CnQXwMGFUz6SRinVP29OIz/dTTq6VFbXJZ
         qdiTksdYzQSKRSAt1RlFB1lpN0MuQ3A44PcT+C0s5bFb0vqGcBXJ4M0MqRddZ4nx5USs
         eS/6KMFzM1IWGpiCKuCgJR2ucbvpFevfrOlYZxXSce8FrDWD5CpgroMbSreqse5DWnYB
         mxlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s3FkMl8OhjMqOhi3zpzbiZNiNsx48LLQzOlCjP1CveY=;
        fh=tNr5QRY8IhYKCHB6DGI+IMrrGJ+SEhH/zWtkQicODTE=;
        b=U5N1nlPNWJcZJot3LxRbWjXAp2X9RFY8f9ukQx7+aBBRz85Uf/QysfZUuVvudy2gJT
         38OpXG9WV16a5AqD5DLOsCXzaWvGqlHnRBeZAFemDuDg1tfgmeDK5eih2Ra/dHxCxvvQ
         DDsOkXRaS24zXobgb2A6lw6yZwouZVjF+WZSc2ixjcOrjNDM5aQYfcCOddOx+/hMfAb9
         i+WXo3NaEMoTuzxSZ0+1uYw0koIOVeJ421m/eRhv1EyTEFkI7TOp3tXkXnj6QTqCzsO0
         DMx37uryGVxBgV/rpAk084VH+PUXMtHno9/ROj4s4SP68Bj+a5emNuZuEbfi/80ryQMU
         fGTg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792765863; x=1793370663; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s3FkMl8OhjMqOhi3zpzbiZNiNsx48LLQzOlCjP1CveY=;
        b=pUhHw0SY0+Byms+8Dlum6dLyL93HdB3zS3TTtUrVW/GIeiKli28x2K1qx9TABzFHhS
         7gSjYbQvGCYFX6g+7CY2F74rLKZCAnd2APFZTfdW0v4wH00LXh0ov5IYd6P7A0q5jmVj
         YILe6tB/LxJT8z9foItVL4QFi6gW2qz+WT+AaNH1SPQ+BDQDcQyMjKrXvoC6bBUleVLR
         JFi901tbevrzZ/jfkWUBkNfMuCl8s10C61WLh3yxtHX5nndzyj6umvnyG5yPoaj530in
         2T5LoFKdvhuMs3nXmcE9a1cXIT0iDOXjBvGm3vtNM2P7P73s4hC9otOLFRh8//SdwnFp
         QiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792765863; x=1793370663;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s3FkMl8OhjMqOhi3zpzbiZNiNsx48LLQzOlCjP1CveY=;
        b=mUEtYCDf2XF2OE3Y3x85r8+EXzm/3jlNtP0d1E3cZJl9+J1iBCFCDHYIxaj8WW9HH3
         A2BDGHFmWgryWWZY3k7nZZFkgIntWTBPzDNnJc0CtySQi/vKEbFCh/lmbZEybgHP9tTY
         KjSfiH8RX8Txm5jYjcPvGzVHs0rSoUKL9PGJdDK4RBrOUzPw1tWvbhR4B4xRGUuDIDA9
         ZyQDcLcFUOkNbYhTz2uUw1UPX0Z4TlFfOw0oFoS0THeiK+Lw7uFxi+xhQyhNzFunrlf1
         R8cgHFFtIZux8BaK6F4yaJ/za88AqsGT1j/3dzHhShBiKjU2sf+jeBISGWhf2QcG1C5r
         rABw==
X-Forwarded-Encrypted: i=1; AKwUvByKARtQKZv/L4IIpnqx4nUuIswm7E/WFQFj87aMy/S/T81yGLFZZw2ZqdDgod2+TjPlJOwePAcmGJxjKw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLjqxPv+THpov0/AML3/+2C4AZTDEzNr7X33k1xiiKFzrTn9iP6
	I1zwviuZhflrPgapa6nhqdR6TKHRklwqHqQqvBZ9YsqKPHg0+1wjViZ2cxhWi7GJXRqI+FSqGwU
	O9fmUOY8mBFO3KjyTD+RqZWjQl0ilgzvSHA8jzZtH
X-Gm-Gg: AYBFou2Wcvl8AAfUMaBHaZvFQi621ZBD4i7eDQSh8REMLsjY2K+70nIoeu0IzrWoWKZ
	lPi2DlF6U474QvbCVnwoY40GC+kdl6wNjlfPVo9td5jSUijzH7+IvUGZoP9zMTsJ4QHpCYf+cNJ
	xtI8kuAAEp7BXYSp6qb4T8c7x0LzaTGEoX/icnUTC+KYRZTQyOgmZEon9U4WpLNv3KMXgwgrwPe
	EnoSWhhwuZC0wD+pIxISlfldfmfF1ZQ+S7r0tqwI2s4icCko+t2BD2ZtIZWZhWNoxywQxbCHkkc
	PQMTgYnC/0Wki+Z6VGyA08N9WZzG8yv15j1+9l7HUkQw0vCCrWl5EUmFOq32fPW576s36xjmFMa
	rFnh1xl5a1r3Ebe1UlyK9ViDIbM7P/No3KNXksrwDvd4s+y21HYyJkkI4S44=
X-Received: by 2002:a17:902:f683:b0:2ea:7180:3abf with SMTP id
 d9443c01a7336-2ea7f512f16mr4025665ad.15.1792765862249; Fri, 23 Oct 2026
 07:31:02 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca>
In-Reply-To: <20261023140107.GC3977851@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 23 Oct 2026 16:30:25 +0200
X-Gm-Features: AclHuK9d7tFq_s1fhJmYPVN1-JncgZCOvwLUHaeunw-YOxbh9iZtFoxmVAkcY88
Message-ID: <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
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

On Fri, Oct 23, 2026 at 4:01=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Thu, Oct 22, 2026 at 11:51:40PM +0200, Luigi Rizzo wrote:
> > On Thu, Oct 22, 2026 at 10:12=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca>=
 wrote:
...
> > > Can someone explain what outside netdev would use this? And why you
> > > couldn't do this in the netdev page pool?
> >
> > I can try.
> >
> > Regarding users, the next target is disks (not included in this series)
>
> Disks don't use a memory pool, they do IO to folios allocated by the
> page cache.

I know. As I said I have a separate patch to cover those IO buffers

 block/bio.c                  |  21 +++++
 block/blk-mq-dma.c           |   4 +-
 drivers/iommu/dma-pmd-node.c |   3 +-
 drivers/iommu/dma-pmd-pool.c |  14 ++-
 drivers/iommu/dma-pmd-priv.h |   7 +-
 drivers/iommu/dma-pmd-user.c | 390
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++-----=
---
 include/linux/dma-pmd.h      |  53 +++++++++++
 mm/filemap.c                 |  27 +++++-
 mm/page-writeback.c          |  13 +++
 mm/readahead.c               |   9 +-


Disk I/O is still potentially affected by the same problems
(cost if io mapping/unmapping, iotlb thrashing, bounce buffers
in confidential computing...)

>
> The only other candiates I know of besides page pool would be the
> existing dma pool users. I don't think they are so performance
> sensitive as netdev.
>
> IOW I think this entire series is only useful to netdev.

Well, the series provide mechanisms to address disk I/O as well.


>
> > > It is not a common workload to have the DMA allocator be the one that
> > > allocates the memory. Usually we are DMA'ing from memory that was
> > > allocated someplace else.
> >
> > Aside from the fact that dma_alloc_attr()/dma_alloc_coherent()
> > does memory allocation + iova allocation/mapping,
> > this is not what happens here.
> > Maybe the confusion comes from one function name
> > (dma_map_alloc_pages()), but it doesn't map any thing.
>
> > My code (in this version, and more in the upcoming release)
> > mainly implements a specialized memory allocator with an
> > API equivalent to alloc_pages() and variants, but ensures that
> > the order-N blocks come from contiguous 2MB blocks reserved on the fly.
> >
> > The physical addresses of these blocks are recognized by the
> > "dma allocator" (I suppose you meant the entity that allocates the IOVA=
 range)
> > so that it can apply specialized IOMMU mappings backed by 2MB IOMMU lea=
ves.
>
> Why? This seems completely divergent from how anything else works in
> DMA mapping, and I don't see a reason for it to be anything like
> this. Other than it makes page pool work a bit easier
>
> Frankly this looks like you had AI to transpose a bunch netdev page
> pool into iommu.

(yes, AI assisted, heavily human-guided).
Frankly, it's very orthogonal to pagepool, given that it uses pagepool
for what it does well, and it provides functionality that pagepool
does not have.

Anyways, reading your next comments, are you suggesting that all
these functionalities should be implemented as pagepool extensions?
(2MB mappings and iommu backing, proper allocator of fragments out of large=
r
pages, device-less pagepools, multi-domain mappings, pagepool
as memory provider for skb heads, pagepool as memory provider for descripto=
r
rings ?)

cheers
luigi
