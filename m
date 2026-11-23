Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795456255;
	b=Tjwj44Fc+TCumQXEHbwcD2ncTDB43EZi7R5AIU1kTdA/LUgIAunJPjGYfa7GR3QJbFWs
	 GrxTKKO/QQSGOD7nFfK6ftn76GNmGISXa0ILT2MLndpeV08lCi8WQkD/pbhTrJiScgHa7
	 BnL7XDj6UBB1JqPv8EQHncyQk0qWyQUto34kvKn7HcKp5ZftK9xT6hPf2z+cJM3jG22jr
	 BsDsOUmTpSuta1GbE4s/gVdNN7xm6eyHZFtgBTFQ8F0gzm7mptx0L9KvCcmBtY5n+cAQa
	 hmq8aexUABEhrOJCsm/eNKdDkRI98wUataqMbiZOvP61mSJ9UZbqZDQqLgIL25PDtjg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
	b=wYuVUJ60YJyAruJA1zRz85pj0k8sF+I1eYykNTdwPW37YuvpOZidSKgkwRZQkNiTbtPc
	 Ie3J+e4qOF/GfSc5OPxrxRvWekq9zf4COYOH4Yu0A+QYfJV3w4bnF5lfGbqcCdhnptgbG
	 k6hsSaOn11Y/gZbJqhwEpuNx0+gxDLh9rmud8lclm+dj3JhRqZbHueRa8iYwzIEgJY6BM
	 5k3l81j71dsaGqcQ9ZSZ+Kp3N5UwvJHUt3DOQMPEo3Usah3KTB6lJyxx51d6YKhjBLGxg
	 aEwazUAn2YR4q7652UmFofCZjth6JFYMLVj/X4OBj/BpgA+6M5xVvjRu7ozVj4LWQsg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=esh33WJX;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9C6606A32C
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 17:50:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C9C6606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=esh33WJX
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so102505e9.1
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 09:50:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795456254; cv=none;
        d=google.com; s=arc-20260327;
        b=RuX2auPVbOExAQaiai7qF2BgS5hg8h3rvFcDX2LzdXDTInpPg5Tj72IpLvxeYjqozH
         xKckLQxoYHKfLA8S8RB5CYPbkqYXux39NGZXAR/NjjI19SO0lSexEIszvRdpN+e0UJtJ
         OC8iljpSelq9C7m+5zk/o2qDdhYHP48NkLVgnzIe6SkXNOXetYGHEZbzVd8kBQ9f3slg
         9khb2H3PPQc9Dv/3kB8jWZ5dsXrUSCaKKP0kJV2N3qZP5SvGGaBlxhsyG1dkgHhP4AXg
         aOhMqkm0M8BXfOUqKNWvJ/0Jw0pTnlG0uL6frHEczfeSJ5GmkwRjbRky+VP7TDmNyASK
         xhxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
        fh=CyLCWe+AtqBuakZdMWGWSOFn1Tk4ulBdunbsFjIZh9w=;
        b=fd310H+Zq2qRik/fEAPCrOLn3PSTm1b55shWlClgH2Ueusvn8x4QlJK2JHKuUrWz8T
         FLGHFeOv7uZ+6EVB+aQcZSsTRasMIgnKKASLc4pgClosrThIU4ub906+89bg5zkRLgc2
         MRBv6qt/plF9kI8nM7wxeWmsUu/Mu27Gc/kVdmCWGvqTCUmtYoq6JFhRrtewuBIpkY/x
         IZgdHJZ3wH8NnAgJN0txIMcY0mMEITxkU/UFUKpswwwhdX61gs6+sEzx9l70OWFJ6YZH
         d4jUo2nYDIrwcdTz7/3rY/OV4rv179VY27YEIqDMNTbX3yuRn9NPcMcXXcWscE/rR4CN
         ydUg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795456254; x=1796061054; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
        b=esh33WJXLAO44u8Ttcac5VQ+NzvLrEKGO86qH4VVHl5ZzaY+NBJi4bQ6U/NseUjzpf
         3Niv9fNBBQcoWCJ1p+ER8fSbdwfVQLMuhsF7v9xOye2RG5YG7ZaIaPSGKz4grhBfUd3p
         g7nxg+GvvHLOlUJgjaZl5uZM+SPu3e+sEthmyc81ZHKWnu59g96xY8Fm3+YrY2fxga/G
         BW3AYrR6tDD9lIUKhvCjZp53W5Ydhpfj4IneMdgQR+kq3PAToiqDbrPpEE/tGCX0jOWx
         BhZlQYt+CXBwwvWh47L4ryVRlRsxqhPXzLzHWTiCaUMp1HVzsnTs6475CehaOY9aPU8q
         t55w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456254; x=1796061054;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ezlDWRMj9kmxxJBJDvLQDaV+rNJm+P/qJAKPI2Vbze4=;
        b=xponjOw+GyVBTlXTvwigXUKtGa7CCewMfm+AWyUJ5SpERPyOOmkDdrAUfiEfiYCeH9
         wUr80MEWGBO47xVtdSSbf00sTV9guu/EDbbvGVmcQK54nxLYmMnO8NpXZllDwDix5AdS
         5lxZfafN8ohhAKN8U4kyeKSNWP+MpeQQtfqukmbnqLoGyzV3Z8PHzMcZJGARmq4X0Q4y
         KsOyqU6skN2+jJwzIYWOHBboYrpa0wYOkfMJcsvshHomVTr9rwUcR7+ziGI9IzhW2XFc
         mwXipp5Akc46ZPIYI9bkGuxKKLFBdnUtr1ArFB/Clzb7DVb3SqLrOMItsBGFwAqCnJr0
         MUvQ==
X-Forwarded-Encrypted: i=1; AL+hErHGtE/XZhG/iq6+t1UrljpNknpHxAXUgIK23gU9LYf+O2gbrpAY8nnp0afMHpsoMeK/5u05G+Vg11o0ww==@lists.linux.dev
X-Gm-Message-State: APuU4Z8/gE1IEOI2W53gDMOVH8Q4Fpuc54WgPl07L+20L49QWOmhP1Q9
	qyLN/goBvnaL4U5RIE4wSajR2u/VjtXsO2aM8eT8o7WuABXg1UaMLAxu3tVZ7bHjxm3M02QVLxx
	r0wLX7rz0emQdgYCGbhWumELszEoGTfDr8TNzn3eA
X-Gm-Gg: AZFdTZeupfcpm5mC4sazGH0VNamRZCG3W00Ri3cNuFSYeJ6adX+bwrRWjXObG5X//Xs
	EDnXNCkkZt9n+IopUyeHjlHnHumIKrpId3fixI0dkvxQXLxScR4bVoRQ6CqtTIU4+rhnZALfSQy
	VnQTRcjJ8b1wH7cjc66cr9Uyz0GRCX5J0NXLOHQignI/GytkXdhPzOJUOwgM4fxX2cxfUPAyla6
	/Q8x2QxSurSwwEgARNVPAAemY3QJ2xqkialhjkBz/BZJCrAyOHxeGYk+zXsbXee14FC1LZlPRhO
	I37fGKZF5dYXNe0yHNCputO5jrQMH4Q3v+6p7hgfCxSqZLhHchZIA6jWvTbH6dQbhvVvvp6gpEb
	iU+U6NJkLVPTneJmFYbpkZFu8vmDmsZDzGtY/r8rKlfxY+Rq1/1nwcD/TAuK1ut0v5u4=
X-Received: by 2002:a05:600c:287:b0:4a1:e368:cbf7 with SMTP id
 5b1f17b1804b1-4bb909d0619mr1867585e9.0.1795456253076; Mon, 23 Nov 2026
 09:50:53 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261109182533.3594984-1-lrizzo@google.com> <20261120010655.467825-1-lrizzo@google.com>
 <20261120135013.GO3115493@ziepe.ca> <CAMOZA0LmZ9PFzxLcc1SuS8piFyZu6P=vX_qR2jy-3QRUoNCUKA@mail.gmail.com>
 <1f10002ea9ee16a17087bd06e4a1685a973fdf6e.camel@linux.ibm.com>
In-Reply-To: <1f10002ea9ee16a17087bd06e4a1685a973fdf6e.camel@linux.ibm.com>
From: Naman Gulati <namangulati@google.com>
Date: Mon, 23 Nov 2026 09:50:40 -0800
X-Gm-Features: Aa3M54qK7IY8ZMBupflhQ8_7jK3YPX7yjpTGqvTp5f5henwr9osR6FHQsicVdiQ
Message-ID: <CAMP57yVZx=s-JXHfQfd_ouv2jV6MMsJXpxVLkQQHG=7qfFVJfA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Luigi Rizzo <lrizzo@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hao Li <hao.li@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Christoph Hellwig <hch@lst.de>, Dragos Tatulea <dtatulea@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, netdev@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 2:10=E2=80=AFAM Niklas Schnelle <schnelle@linux.ibm=
.com> wrote:
>
> On Fri, 2026-11-20 at 15:19 +0100, Luigi Rizzo wrote:
> > On Fri, Nov 20, 2026 at 2:50=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> =
wrote:
> > >
> > > On Fri, Nov 20, 2026 at 01:06:30AM +0000, Luigi Rizzo wrote:
> > > > This is v3 of the RFC previously posted as DMA_PMD [0], now renamed=
 PISA
> > > > ("Pre-mapped IOVA Superpage Allocator"). The text below follows
> > > > Documentation/core-api/pisa.rst (patch 25/25), which has the detail=
s.
> > >
> > > I thought the conclusion was to just do this stuff in netdev pagepool=
,
> > > now you come with an enormous AI series spread across the entire
> > > kernel?
> >
> > There were surely comments claiming nothing outside net/ cares or needs=
 this.
> >
> > I respectfully disagree, witness is the fact that e.g. there was alread=
y an
> > io_uring proposal which is smaller, but does not address applications
> > that want to use the standard disk I/O paths (libaio, buffer cache etc)
> >
> > Nothing has changed from the initial series in terms of size, use cases=
 or
> > subsystems involved. Large files are placed where they should,
> > the series covers the same three use cases (disk, network, CoCo), and
> > touches three parts which it has to touch: mm (most of it; it is a
> > memory allocator
> > extension after all), dma (it hooks into map and unmap, not a large cha=
nge)
> > and net (the pagepool change is a couple of lines; the tx path needs to
> > touch more places because the current stack assumes all paths have
> > the same I/O requirements).
> >
> > For CoCo, there are very fine grained controls so the bounce buffers
> > can be enabled only when they don't pose a risk, which in turn
> > depends on the threat model.
> >
> > Specifically, for network tx buffers or disk writes, the user-to-kernel=
 copy
> > is basically a bounce buffer provided it is used correctly and not leak=
ed
> > elsewhere (which is the design; of course the implementation
> > needs to be verified and possibly fixed so that it matches the design).
> >
> > cheers
> > luigi
>
> Hi Luigi, Hi Jason,
>
> I've been lurking but following this series since the start. I am torn.
> On s390 where the IOMMU is always enabled on our closest equivalent to
> bare metal (non paging LPAR hypervisor), and where we also default to
> an emulated IOMMU in KVM guests, the underlying problem is a real pain.
> We're also in the process of enabling large IOMMU mappings via the
> generic_pt API which are 1M and 2G on s390. So, the idea of making
> better use of larger mappings is very attractive to us and I applaud
> you for trying to tackle this very real issue.
>
> That said I do have to agree with the critique. This series is too
> invasive, too unclear in its layering, and most importantly it feels
> like you're trying to do everything in a big swoop ignoring advice from
> the maintainers just because it would limit the scope of a first step.
>
> I also don't think Jason's point is that nothing outside net/ cares, I
> think, it's rather that the IOMMU and DMA layers already offer the
> tools and each subsystem needs to use the right combination for its
> specific requirements. And if a tool is missing this needs to be stated
> very precisely including how the addition keeps layering intact.
>
> I don't claim to have a simple solution to offer, if I did I would have
> sent patches already, but let me state my thoughts. First I think this
> really needs an iterative approach with much smaller self contained
> steps and focus on specific issues. With that, I think this should
> focus on the network stack, while the io_uring specific proposal can go
> after the block layer. Also in my experience networking is where this
> hurts most.
>
> Now, I wonder if we can't start with something simple. What if the page
> pool could start by allocating in batches of PMD sized and aligned
> folios of contiguous pages that can share a single large IOMMU
> translation. The page pool can then still hand out pages from that
> batch without having to do sub-page allocation but would already use
> much fewer IOTLB entries and the locality might even help non IOMMU
> workloads. So, I'd even hope this could be enabled by default and this
> is actually something I don't like about this series, I really don't
> like having a tunable when we know that larger IOMMU mappings are
> strictly better when you have an IOMMU that supports them.
>
> I think that approach would also align with Jason's idea to keep things
> within the network stack and to work with the tools we have until their
> limits become very clear.

Hi Niklas,

I have been working on this idea exactly - extending the network
page-pool with a memory provider that allocates large pages, splitting
them into N smaller pages that all share a single IOMMU entry. I
breifly shared my approach in the v1 PMD series [1]. I'm readying a
short RFC to share shortly, would appreciate your feedback.


[1] https://lore.kernel.org/netdev/CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+=
BJRVYf3JB1g@mail.gmail.com/

>
> Thanks,
> Niklas
> > >
