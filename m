Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792705938;
	b=awLoawhuzvIZ/jopFPu+eeQ6Wh7UcE7APhTisVjpD3WEwtvHCQvvuAGnMmBpcce9zrNq
	 ccSlX0atsaIN/EYz8NYBvYdMjvxqi22jhMg5DUpUZSwSwQf6eFhJkVRFBR/bORbfbFoq0
	 MJslUqaq+vZ0J7l8RwxFh/4sQ13pKlisF2uw4WDUm0eqUE8qPZJx3F5x1cbav/o2dAOun
	 NhQ+b8UN3WkoNfS+vCMahAXAgXQ+USqIqRzFluDdirx5lQn7f5VYSoc8i8dGy1Ii6vD5q
	 zD5u48mCu5jpu9MxMJg5jmfcBJJpLOobyuW+h+24oZT+n9lbV2yRTNMtGbc1pM/eJHw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792705938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=enf2YbTyhYZro8noMVoZG0AyfViHUg43We1xb8wdUb4=;
	b=PUwVB4HK+cAvb3OIfyCv6JCdd49PsIVQ2bVolICiZzY81CrFFRnhu1vJUw6a+3/T0nyV
	 qax/1TIVu/1/cJ2OFRkwVg9p3y1lqc0Ga49aKoTOcMfx/CYfj4Knfor+6Utw3Wjqx2TK/
	 B+ETZ15OA+3wRP5quYEYUvkvSl3+HzboxE8u1DVFVlJbLtDrBmw3M865YKtCyH9LJP5ld
	 5K39zPm71cql51SbJDLm7fMWT6lCbJr5p6kb352S221yb2u//tXRxmmO4VV4O9OGwROyG
	 U70t1r1kblB6plC8qAz8UkVMl7rYQZhRL6Og/33Si9gtST2jIi/19wYl4riTCEFYyxw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DxisIW5E;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.174
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8169F60A2618
	for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 21:52:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8169F60A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=DxisIW5E
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e9f6a16afcso9715ad.1
        for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 14:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792705938; cv=none;
        d=google.com; s=arc-20260327;
        b=DzTW13yApkLqDO0ssPk/hyWfX3aG9mBSPBIgYet24EgtoQyT6rUZwIuWAicnk2j6yB
         7uNspIy7dqaZl+QGKOpWl75+3MJuvhRMdI+XINzl51TTEZhRTXI0WZ2C8YLNOYmmoMQi
         LaAd2kDVe1xNS+lY7HhPJq0PGi+O5btTYftJK8u1kB4AizFMZSqtbQp9nzXqATtwWvIv
         U59sCkCbkXP0TdZp7GXD4G4QHFCkxzmwLTqIVQDltikH3Z/4Qbwx7CUL2KEdsjHnUGlp
         YW10yX2GMAnSlR5RHIW8dOLZ15E4daRSgHs2fxPlafeFnomxQaJoVpN6fpSIZrrolCEy
         lhPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=enf2YbTyhYZro8noMVoZG0AyfViHUg43We1xb8wdUb4=;
        fh=Q69nU3HfQvLgJCwIwN3AwT/N0uSWKlEEXe8nLljT8B4=;
        b=HKzBcU2/c96jbmi0Hhi7jOkDjyJGNGEh+tGWCoWgSRMdIpYyCL9dqiohDyu5QR9CJc
         NR2zYktkfhqnvhPqXB0+IG6Qjlr2MfR++96gYJNAJgPwvyYFNC5UC9yonLSFgL1ytaYK
         7eyHLg65xpOOLvabdmw1UVJ1l0iWBxhegW2+3his09PzlpeH1Dmf5wnUjixbeUjlbyRk
         GSFKqwLVZmW64dNYuTYZfj2/IN6/1wPBiz2qGStmMQ76K9pe2caYh/eDdwNYPuwyW77s
         oXrAv3oTKlsS4bpTQH5XvB54a5sgkShuh+WBg7erDENvAk2zV0Cx77DJKDKnoor7YskL
         xnJw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792705938; x=1793310738; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=enf2YbTyhYZro8noMVoZG0AyfViHUg43We1xb8wdUb4=;
        b=DxisIW5EX9BnXdjvCgp1Lp3mluRfuGbHKMspSDFAFLy5z2Sskghhil+eioVSG27690
         p6I4ZpTDUhRqNzYNWNloeDhzdKoBzdh5h8ErHTsbx9KT7kmO7JUM4s3fs+hpDzq/wr3J
         eerAIZnt6ljzsrDWbggEW8Of6AH2lTYUSutKxFo96aRtMbSmx1uRt4so6+nZj0HflQYc
         jrfoinrsbAQTrUtmXS37+sGiK43YJ4SvHelBoVbtwqw8bpCNMQio958aMPfzb/YxUZiZ
         XZhLDN3jY4lSkKpKXmCzyICrb/eXbfzhNfRL63Q9b87TnWtZkARnH/Ah9Tm3VL7RiNwy
         PADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792705938; x=1793310738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=enf2YbTyhYZro8noMVoZG0AyfViHUg43We1xb8wdUb4=;
        b=W+veLkXsnesm/fq2lbLl3W8YJKP4Abq781Alb0umNUdn5FYy6RDg1ytN1tXv9lr7jn
         RtHCFmdQ9E8xs0rI1c2yo3NETURp9olqrqv63FTdlHSqUy5RlwUWeUNopJQtZUpRQk9o
         1VQ80ofjmzSdwIDaUFYB+9ZxGDTfM58qs/4omdpBTREcfqhXaq/+b5lTXORgXM9aRm0d
         fUcCI49QqIKHS/im4hq/x0Iqm/nK5FRgJtJ8qQbce3/SdZ28KjrR8jJgIwEY+2xmPZKV
         Olr4TrwZSLoc0GFSFI60lI3xoxTi20i+P3zkI51JmFny1+yIc9CshKy492Mu7n6bxGlW
         HISw==
X-Forwarded-Encrypted: i=1; AKwUvByrpjHWwvGdLa18tGO3Re0yOSReWNlygF0PaaTpEV8zufHAxbUEnRGDca54teizge0U0o6W7si8MjVFxA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLFvVpf3JvsPCJpufN/DH4LzTQE8ykxnv4o30H1qIzOzMLmambW
	D5Zg/251E/aWbNyoh0P3FfPySN2baYJuuFW6Np32zephaUc4evifdVgWaP1Jjc4t0z7PoeVeBkB
	I7dbXUTHYAoDdAB/kAfWsudrpXu3j8F2Cneh4lFeQ
X-Gm-Gg: AYBFou0x8MsYmXkWLsasJbFx+jjSEPsgrLnS7lmbVWlE9qjyG3Vg5jaT6WRkDVfFTZe
	ipFgW5KuTP26sSAVPHTS7w4ddaaS8vlenlWqe6Eb/yY2/VobEzktRehKpjFRMsZCA14NnBvSd97
	IZkZz6GgFDmBdES0hM4IK3Ogbs0KUYhDzWrUZv/UivobUYIOOI/t+3sMcvEBAeS5+aJ55I7VL+i
	0j16eENUfmDyQh1JICuM72qG1lqzNcAl1waDy5N7JHtkIMip9E5PbvAAL+HfrJKnvKEoQfNaAEt
	conSzYbdEIfLJtVpNt5QB8DseNf4tIKJBlKnYZ9rlHJsdamfKwpugy9DzYCiYJC8dBVaQQRvLVF
	TdwPVLqzfrSiiP2zmxI2LgHzW50zc+E9oGD1zycZ5ev5GjETMQHNzQsX579A=
X-Received: by 2002:a17:902:e881:b0:2e6:1917:fa with SMTP id
 d9443c01a7336-2ea7ed0feb4mr728955ad.7.1792705937217; Thu, 22 Oct 2026
 14:52:17 -0700 (PDT)
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
 <20261022201229.GH3381610@ziepe.ca>
In-Reply-To: <20261022201229.GH3381610@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Thu, 22 Oct 2026 23:51:40 +0200
X-Gm-Features: AclHuK-9aqzBfV-60_dzPgAjNzAFJyPZLZoLZFY0CUqnWbJGyVX0XJhPkps5rLY
Message-ID: <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
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

On Thu, Oct 22, 2026 at 10:12=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wro=
te:
>
> On Sat, Oct 17, 2026 at 07:11:28PM +0200, Luigi Rizzo wrote:
> > > We should probably just find a way to describe that this is a POOL th=
at focuses
> > > on physical contiguity in some configured granularity.
> >
> > Before embarking in a global renaming, I would like to get opinions on
> > acceptable alternative names (possibly with a short prefix usable for
> > identifiers in the code). I could think of the following
> >
> > DMA_PMAP (for PreMapped or Persistent Mapped)
> > or, ahemm...
> > DMA_PISA (Pooled IOMMU Superpage Allocator)
> > both using dmap_ for internal name prefixes
>
> Can someone explain what outside netdev would use this? And why you
> couldn't do this in the netdev page pool?

I can try.

Regarding users, the next target is disks (not included in this series)

Regarding why not just pagepool, see below.

FWIW when I started this (after the previous work on swiotlb copy elision
https://lore.kernel.org/all/20260824152932.1583506-1-lrizzo@google.com/ )
I thought this would take only some simple tweaks to pagepool and
skb_page_frag_refill, a couple of days with some agents tops.
But the agents did point out that there were a ton of corner
cases to handle (device detach, reconfiguration, memory
reclaiming, reducing locking contention...).

As a reminder my goals are the following:
- reduce DMA map/unmap costs in strict iommu mode without the DMA-FQ
  compromise on security
- address the IOTLB thrashing problem when using 4K mappings
  (very serious even with DMA-FQ)
- help reduce bounce buffer usage in confidential computing and
overcommitted VMs.

With that in mind:

> It is not a common workload to have the DMA allocator be the one that
> allocates the memory. Usually we are DMA'ing from memory that was
> allocated someplace else.

Aside from the fact that dma_alloc_attr()/dma_alloc_coherent()
does memory allocation + iova allocation/mapping,
this is not what happens here.
Maybe the confusion comes from one function name
(dma_map_alloc_pages()), but it doesn't map any thing.

My code (in this version, and more in the upcoming release)
mainly implements a specialized memory allocator with an
API equivalent to alloc_pages() and variants, but ensures that
the order-N blocks come from contiguous 2MB blocks reserved on the fly.

The physical addresses of these blocks are recognized by the
"dma allocator" (I suppose you meant the entity that allocates the IOVA ran=
ge)
so that it can apply specialized IOMMU mappings backed by 2MB IOMMU leaves.

And finally, it hooks into existing kernel subsystem (pagepool,
the skb transmit buffer allocation, dma_alloc_*(), dma_map_*()
so that devices can opt-in to use it without any driver code change.

Regarding pagepool:
For the receive path, I do use my allocator to feed pagepool
(in the next version I have wrapped it into a proper memory provider
interface. Non-pagepool NICs can either use a few trivial changes
to call dma_map_alloc_pages() when filling their rings,
or convert to pagepool (slightly bigger change; anyways
there are options).

Note that just feeding the pagepool with 2MB pages is not efficient because
the fragmentation in pagepool is done with a bump
allocator, so recycling blocks from a 2MB page is difficult
(it has to wait until all 512 blocks to become idle). My code
has a bitmap to track usage, so it naturally recycles at the block level.

Then there is the transmit path.

For skb heads, one simple solution is to use tx head bounce buffers
some of the patches in the series show that option (the next version
implements a proper tx-copybreak).

Otherwise we need to populate skb heads with pre-mapped
memory. In the next version I have a simple modification to
the slub code to accept an opt-in alternative to alloc_pages().
I considered using the pagepool, but the changes would be
similar and the layering seemed really odd, with a cache on top
of a cache.

For transmit, there is a bit of impedance mismatch as well:
skb_page_frag_refill() does not know which device
we want to use (in fact, it is a per-task so there may be
many netdevs used by a task). We could tweak the pagepool
to be device-agnostic, but that would be a bit more
intrusive (more architecturally than in terms of code);
also we need to make sure dma_map() on those pages does the right thing
without trying to map/unmap the individual 4K fragments,
and we need to make sure the skb_free() etc does
not leak those pages into free_pages().

>
> I think Robin is right, this is just a special case of the dma pool,
> and it certainly shouldn't be something as grandiose as a subsystem..
>

dma_pool() could be tweaked to allocate 2MB and return order-N fragments,
so maybe that could be a provider for pagepool, but it has some caveats:
- when fragmenting, the freelist is constructed in-band, ie using
  memory exposed to the IO device. That is really a no-go if we use the IOM=
MU
  because we don't trust the device, so we would also need to
  allocate extra memory for the freelist (no big deal, but
  that is basically what my dma_pmd_meta supports)
- memory is never released until the pool is destroyed,
  so there is a problem of stranded idle memory.

Trying to use dma_pool for the transmit path has all the problems
listed above: lack of device, inefficient release of memory,
coarse grained locking...

In summary: of course we could tweak existing subsystems, trying
to reuse them in ways that were probably not anticipated
(see the above partial list of missing features).

I think that once one addresses the functional and performance
problems, the changes would become quite intrusive and the risk
of penalizing the currently supported code path might become significant.

cheers
luigi
