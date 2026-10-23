Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792767027;
	b=oGWcoFP/wdZIHUIe8mlj44SZipepZ8FSh4eoirflO4aoK6iCQ+xc/pHrShbiXVEEcdW6
	 +Ydan/0gRLUTrXVSrISfr+cFbAQid4fgHHh+DXKH/cxGi2hSKbGzXCitdSAVVZh17ZAPU
	 1tg//UTInCU2Z7iEePjlMUUf/2Un9nZe4TJkTx8zqkQOVl8sYblGGE6LmMPlcNgwEVanp
	 GJHjHVPjDTWatzhULqHlKq8WheAZZmQTqVKTzpHffGN31808+isg26Uu19/d0yF0RAz2i
	 7EGUFCt3KtmG3mXNrXSPSBuxvLQAFMiobmtd56HqrOSB/YUSL99TeAW3+vOi6EE9PYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792767027;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=sGl5cqr0Sn8jKPodNx0zyYTo2AHNV4DEHX4rmbHeM6s=;
	b=F/CIgSnnSf6ABZL/l8oms6Pc5mKeusyVe3KwfcBf3KVOgqBJEsgj+uFkGCg9wrXihu6E
	 9YnAoA8UyTiWVNJ7u++3N++wC30Ci+NOx8a9st6JhHAiFxdoypczS5RI/wgnyOzSL5d2g
	 bSnKSuyXMz74xZGmee9BAx28EqeV9d5eC+ODY/kViFGsJfnjTlozNmaTLS38axGxQ8WmR
	 zPrbME+zTmddtAHZ6NuuWR9bPjvyM+MTmByWa5bad6fzyImiMNRpok9thdh+KKyo44gUa
	 Fj4M1JXn8Y/r/vBDc+g/hUDdwOvds8h6wn7CnM5tTYEWRPXYv7otQV3LzF0W7nmBH/w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=T5be2Fnt;
	arc=none smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02DC5606A31D
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 14:50:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02DC5606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=T5be2Fnt
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5365b48238dso6867401cf.0
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 07:50:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792767025; x=1793371825; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sGl5cqr0Sn8jKPodNx0zyYTo2AHNV4DEHX4rmbHeM6s=;
        b=T5be2Fnt/rklVx0TL/h8cjblkdqasMG3lUYtqFXFvtGrnk0pJBVcP/VnK4ECjVQz35
         9XEle/XtrCCv1/TRliZxc5dwRbKQ9wJEqzJk4jI4abjmhV1Ri+dZ62sZXnbpu/CHAu1R
         mh6nTxVGUhg4DuvP0ZIcvxxKJSJ927V3solbOsbyzgamEep1BGjDQZSXiDnQbw7TSbKu
         DsrrA6CGQDrSRsBVkavdrtyQsXSPHWaOfrANtoQfrLsAia5eQVTb7Ef5/sefGBq5Mnwz
         TS2yF1TEOxkWuxp3Le5Jk2bDNoZxTybFeyJ2CBWHm0LsYLAQRJmtf9/n9RtP3YFG8M3m
         aE8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792767025; x=1793371825;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sGl5cqr0Sn8jKPodNx0zyYTo2AHNV4DEHX4rmbHeM6s=;
        b=ezqlKhCGYZ/qk46NI/X0J1RtrEk4n4x/Je6s6P3lh/RCzT77bkttlx9KVgJSmHKbQF
         1fDRKxPOAu4BUghKCwgtJZhYiUL20oIFUgCmoiJEXYBma9V6zN30Val0g0JS/AaliLYn
         o81CGm7KJmEHp7YKPmk6q0EyZ3yZspmkox3wiBvy+VHSYR1tLp7NCDAy/9XxyD+LFi1B
         3OtTv+RNprV2N719ziLqOKGxk9BcvE2gLIcf1F0yfzQSO+UeVsnIU1R9KTy3XF7wXJ43
         Qxf7sdHXH03yMd1UOE2Iv0rZ54Nf/3krRgXgpODitCWBdYWGLaaD4DbUS2yKRdcvBERv
         DvGw==
X-Forwarded-Encrypted: i=1; AKwUvBwoFPvIvEuA4NHq2+IR9DJNDKGpnd2RqfBK8GCbytJm93QvgFf1kCyyo9xC7HWqd37Qm2U0CHVYofHwdQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJHIct8reO9J5AIfG9kA9GgPUQvbzZabqZS/hPGsHkJxCgSR0i+
	eMfc/r54lC7oi7iG2PcOoJcyVO5bk4c2GaL6aK5JoeGCSAPG/HNke/gtsQy2sboyAek=
X-Gm-Gg: AYBFou3NFn6jaktvsRKtWco1Rpt8RBinSvwVTamMpGHjsxpRWLrWQnBVq8hE4DG13UD
	WZ7wLIyh4XYg200BewVyXbgMhiooyH+CqiKQph3JV+z3DSp+H1Skk6gve7keVewIsiVaabI6hEe
	+/0gD6wpncH2OD2i6suiwb8IxpWZXhs5uBAIaO0m63GQIjHp/HzvbyZDzwloR46HQ5ZLfihkXNM
	ZQO+qFQC+JWr/lqzdwVoUG/FYMnJ145tW/AvpUw16rV5RYRcULEu98S0RrwgUG88GBRmAr3L6Zb
	ETHGWFDnksEgYmTa2Wsd4wBpfR0ZlVAh9I9rb1dQigcKH4FpudwsJ1PIaZ/a5ekAAHlIgzsYaro
	DXYdgAm5a2zXTcaFHouarAiNdm5STmL4zIaeAKfpP1Pc6QeMSE13m3rxV2L8RJllaEYVO7iW0f1
	xgi5YWnTtp5WeD7G9RpzoEtv2lG6X7MG2h0icA4cDvZrYIKY4geOyby0f496UGPDNbMdbj7pcRY
	iYQYDY6Z4pS6e4yl+HisJXSh92TlHix17IWpfT/VSnhkLIloDLZjsdJChJlBB3t38kspIJTH6Od
	zIqWu37r54KeNWfS7Io3iLBjEKHcrnL9rEc0cw==
X-Received: by 2002:a05:622a:3cc:b0:536:7669:7eed with SMTP id d75a77b69052e-536c2837232mr34025651cf.21.1792767024875;
        Fri, 23 Oct 2026 07:50:24 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c1846ff0sm18130901cf.19.2026.10.23.07.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 07:50:24 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xKGb9-0000000GkTD-2sYP;
	Fri, 23 Oct 2026 11:50:23 -0300
Date: Fri, 23 Oct 2026 11:50:23 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Luigi Rizzo <lrizzo@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>,
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
Message-ID: <20261023145023.GH3977851@ziepe.ca>
References: <20261003212241.3432303-1-lrizzo@google.com>
 <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca>
 <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca>
 <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
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
In-Reply-To: <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>

On Fri, Oct 23, 2026 at 04:30:25PM +0200, Luigi Rizzo wrote:
> On Fri, Oct 23, 2026 at 4:01 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> >
> > On Thu, Oct 22, 2026 at 11:51:40PM +0200, Luigi Rizzo wrote:
> > > On Thu, Oct 22, 2026 at 10:12 PM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> ...
> > > > Can someone explain what outside netdev would use this? And why you
> > > > couldn't do this in the netdev page pool?
> > >
> > > I can try.
> > >
> > > Regarding users, the next target is disks (not included in this series)
> >
> > Disks don't use a memory pool, they do IO to folios allocated by the
> > page cache.
> 
> I know. As I said I have a separate patch to cover those IO buffers
> 
>  block/bio.c                  |  21 +++++
>  block/blk-mq-dma.c           |   4 +-
>  drivers/iommu/dma-pmd-node.c |   3 +-
>  drivers/iommu/dma-pmd-pool.c |  14 ++-
>  drivers/iommu/dma-pmd-priv.h |   7 +-
>  drivers/iommu/dma-pmd-user.c | 390
> ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------
>  include/linux/dma-pmd.h      |  53 +++++++++++
>  mm/filemap.c                 |  27 +++++-
>  mm/page-writeback.c          |  13 +++
>  mm/readahead.c               |   9 +-
> 
> 
> Disk I/O is still potentially affected by the same problems
> (cost if io mapping/unmapping, iotlb thrashing, bounce buffers
> in confidential computing...)

The disk folks already have a proposal to address all of this using
io_uring and preallocated buffers. I really doubt yet another version
is going to be interesting there.

> Anyways, reading your next comments, are you suggesting that all
> these functionalities should be implemented as pagepool extensions?
> (2MB mappings and iommu backing, proper allocator of fragments out of larger
> pages, device-less pagepools, multi-domain mappings, pagepool
> as memory provider for skb heads, pagepool as memory provider for descriptor
> rings ?)

netdev shouldn't be touching iommu, it can get a 2M page and map it
using the normal DMA API. AFAIK there is not such a big reason to need
any of these layering violations. They just make it easier on page
pool..

"multi-domain mappings" is that just for page pool because it can't
easially keep track of IOVAs for all the devices mapping the same PMD?
I admit hacking in a special IOVA range so every netdev has the same
IOVA is certainly a creative way to ignore all layering and solve
it. :\

But you could just figure out a way to keep track of the per-device
per-PMD iova mapping..

That said, if you came with some much narrower series to request some
kind of 'globally shared iova' during dma allocation that might be
something dma-api folks could agree with.. It seems like the only
actual DMA API request here anyhow?

That's a bit tricky since it is impossible as a general concept, but
maybe you can come up with some way to narrow it..

I'm still not convinced this is even right for netdev, especially
compared to what Dragos has been working on. The CC stuff seems
actively dangerous. Unconditionally always using CC shared memory for
skbs is completely security wrong. What I have traffic flowing inside
my VM between containers or something? Does this end up putting those
skbs in shared memory even if they never hit a physical NIC?  Same
with a TDISP capable NIC, does this unconditionally degrade its
security?

Jason
