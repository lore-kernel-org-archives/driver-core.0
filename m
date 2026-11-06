Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793985686;
	b=UJc4buxPkkz+ZHijU0/7reh4U1e16ew9mMJkhtNEyO4nCexSG1VCewm16tiP4MGX4Zd6
	 hxKG3kLdptLZyKtTsRo9D9gV1yqdGT6OupMWQDFgJpkiuK25XydBTOSc+/AW2SfjgbbQw
	 OjWbv4VyQka58n9+KEcx0BNYBFOff9eDKr5OqtSfe91QVv3Gy/WZuzKXsUlKAlaP+NtQH
	 s6MrUTqTh92Fr/WDG43tqr/k5uZpHzTspjCQw71E6O+hBnGqM4CoH1qjCWRvdMLi86fHW
	 il4GVRlMUv4Sdakh9WzgjNUaRGPfxNVn/aLz8Kl3549jhSomOONuVJEvHlq4VksykUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793985686;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
	b=XAaqSjH2im6ZDD5EmUAfj8UHinC0EJRWal8SzzvBbU8XW4E/cvjfCW/Iip76YdyNL4VR
	 iHlJHkyYKrA3qfPucbvsxBzt7TgU1Bn+DCiAcTAbxdLK+g9C1lHEtw/jw257J5XQjyd+7
	 U71RZ8HVl4R3FZsCa5gDruC3AiLrqwhgzvIXJRrlVQ1SQYxfQKe69FczUYacJLxSluXgF
	 ZNN8SGsy7aDszs+0B/u2n3sek6229ZvZilMATWetQ3AOAq5APbRNjoTrJE7SO6KVnxeGv
	 aT40hp/tSvpDY9ZEpMoZTbXhquUxCMDsEZwt0U5Dut3/xJxa9kAaCjgrbEnNw/ROFuQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="jd/ABCi2";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCF89606D80A
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 17:21:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCF89606D80A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=jd/ABCi2
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4b76c15ae36so985e9.1
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 09:21:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793985684; cv=none;
        d=google.com; s=arc-20260327;
        b=NQAcp7BdCqPKaThf8cflu9csvy7QOKsQFc9oSZchBCwdKdnWaCgcV6a35YcQiOakSd
         JdcGQfc33kujIy64QqUuhvtM8LkXKKfWBPy8AX+cb5AM55gXJfJRKUAt4Qg5B2pAbXMq
         rnz1N0cbl4EfxUgxMLyOPgKrKfeIxT1Z0SX8T2HlF8KQA37sH6tfKlnHMFivhPT5t2Us
         ka3XoC7JSxZ2uZLjdOcJTaDM35JFXaQZZB5DYnnTaYiov5o6YSyh5OkOvosgjn2HYBt6
         ljH8r0AjBlA1dJTBIwaX39gqLi7jGy31bYyzJ9jRPS2O7XJyzwIMfnirG7e7IkaD4zDc
         4uuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
        fh=HYERMZlUk1zJiY/ploI2n82wibN7scArQFlzROtkdBw=;
        b=jVoBROhJx4RP9VlJMViYHGhe7t4jZDOxGb7gmCFEbI3yuUuRdMeULcm317A4PduAMF
         lKrGUQVDzZV7tYFUMSV1hV1r0qhg1Qu4NdwI5xgvUXQg9740/LngM9ywhHja9uuFeZhv
         k4MaH93I2J4N3L3hnr8rGPDllt2XSDQFBV6EdIqM+4Vv1stfJ/9GOWoqS+cBuyEzkPxR
         dTeHmZRtwZuWE2K5CCcfoSh5vDn7WfhMY67B6xW29GcmbQSGvTIH7UAW1llzW0H1sku2
         EsvvaAvijNNNvMBu5uHbNVE8wGFz85uYADVzifVLuxzV0JFNw9AFFgtBGIURNOsQF0BF
         8Yiw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793985684; x=1794590484; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
        b=jd/ABCi2UOl5Qg51+OhCFzxnOtKDueOhrUEbS5/S20Tzj8cG8PVM+LGlr9mkdMIJtp
         W2avG3LheoWbCXrq+ZYnSWa5EAZaFdBKsr5wFr4/l3EQIUzAmpmnMJeA2xD0kfI2a+tz
         UMkI1O1+VynqbYI4bM7JYloQv7SAd2RDuFTQSc9VX15t/y8VFq7XWIY7NAJx9ByPw/ph
         0KfKsSirs/PBc57fpalmhWobqgXj2oDQij/s2L42SunhSdVf01csUS9sRtDc4fjIPT4D
         /YPMQv1Z6GnLoUiy0zipNx0Jgn6gSyZvUvTZb5oyElSW5OW7fSeJYw0E3dZ7BJHaTx4f
         pM9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793985684; x=1794590484;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3RKt6UkQZGhVMeIsFX1m9xEh639vUr0Dxv9GzpFuH2Y=;
        b=ichdWvvNJCCqvupnvcF+OJ7NzXD7Yt11NIFJ4mDxgAiqMohA+d91VH5PfF2xAj1GH3
         oSA0Yay4CPIjqcSpdyD3dYRTp+gaf9HJLvHxn33d99aMzA1kJY+pdgBp62gNfrv6bsbF
         rkbnjm4T2Y7zmK98YZSn3dOmVclWSHWiutGqefdL5iRX7Miu8WmEHFnjQdm/dXnIvIlE
         5Ouf7ka6RC60SUcoRgDFAvF5kqoY8Hu1gsiXgTF2z9BWvyba65SDxCem0042b3apVGDh
         eMnAviyjQYEsxO7bvzlybwXNB6YkU2ReuRCO0v0zOjmBpXHuH8/2ktCl9Tsgch0dWxnB
         9EQg==
X-Forwarded-Encrypted: i=1; AKwUvBzLJS3ov2dZ2sn2EZ3bSh21O8ssaUkMyCrLsECEvPyuoTLa9Skc21uOXQlEv1YwCIgLDllYHtPL44oEFA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+20tPhcl7U55zY6/q96VAg8hJaL4BKB2VWThnOu0v3josy3Ihp
	bQb2uuiTpSLt5Jt/A1uI/hzH4I+XkeiLgPcsuaID4wiav50g3M60a1SGoQWU61wtA65AGuoLkcA
	fgE13qAgxwwhAbOwNaOXD36YT4obeZkWLFz/8UziR
X-Gm-Gg: AYBFou3sh+pSSmwxrKzjGbRt7ddhetkEWvEioRSuLChunfsSatRZgaKUQ3tBr1EEpe0
	5fr+TLeX4bE1hSvTTXHOZwhJJ8KJfjMZPuHoX89MPKkOSQAJKMFh/2WiHGXJgC3ylzPygkfyrPr
	mxow3RYShYNhEByj/FstT+ryhEixanxQdz8dfgVbiUEqrKaNMuCrqUz2DfmwCwe8XiqwA/3KeuR
	SuOef/iqirzUt9FPpkwvQfnYJMb6H7Y8xZyZQFZ8K7HqOcDXR6YxGKLpMdzWRc3EQ/3s/uttOPO
	qp15yZbykPVY3VS7a+ca0Ev4nmGa5uPqSXYYrohrh7dP6zkpNnJnuoebmttBrr6TaoWYQ33ZCku
	EwNsKg+BWXDeYw4cmrxddSLQ/CxrzJu+kP3bktXt/A7LsJL7cGw9R81B/TJwcILmUtvSEeQ==
X-Received: by 2002:a7b:c8d7:0:b0:4a1:eb02:37c with SMTP id
 5b1f17b1804b1-4b76cdf14e3mr150235e9.6.1793985683858; Fri, 06 Nov 2026
 09:21:23 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de> <20261103151021.GK3889730@ziepe.ca>
In-Reply-To: <20261103151021.GK3889730@ziepe.ca>
From: Naman Gulati <namangulati@google.com>
Date: Fri, 6 Nov 2026 09:21:08 -0800
X-Gm-Features: AclHuK9QrDyTYpPe0hyDJDnSB0d1jRnWKMXKMwxckIvbaQIWb85nKJEtPirUyxs
Message-ID: <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
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

I drafted an implementation [1] for premapped TX and RX buffers on top
of the existing networking page_pool. It is implemented entirely in
the networking layer and extends page_pool as the default RX
allocator, to the TX path. There are no hooks in the IOMMU, DMA or
page allocator code. I wanted to understand if this implementation
correctly captured the feedback on this thread. Key components of this
design:

- Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
chunk is mapped once per opted-in device through the DMA API and
records its IOVA for each device, rather than using a shared IOVA
window.

- TX: page_pool accepts a memory provider for pools that are not bound
to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
of their NUMA node; TCP copies sendmsg() data into them through the
task page_frag and allocates its skb heads from them.

- RX: an instance of the same memory provider, sharing the chunk code,
backs RX queue page_pools. RX chunks of order-0 pages belong to one
device and NUMA node, and are shared by that device's queues on the
node.

[1] https://github.com/torvalds/linux/compare/master...NamanGulati:linux:ne=
tdev_dma_pool



On Tue, Nov 3, 2026 at 8:24=E2=80=AFAM Jason Gunthorpe <jgg@ziepe.ca> wrote=
:
>
> On Tue, Nov 03, 2026 at 09:09:33AM +0100, Christoph Hellwig wrote:
> > On Fri, Oct 23, 2026 at 11:50:23AM -0300, Jason Gunthorpe wrote:
> > > > Disk I/O is still potentially affected by the same problems
> > > > (cost if io mapping/unmapping, iotlb thrashing, bounce buffers
> > > > in confidential computing...)
> > >
> > > The disk folks already have a proposal to address all of this using
> > > io_uring and preallocated buffers. I really doubt yet another version
> > > is going to be interesting there.
> >
> > Huh?  If you mean the dma-buf I/O it doesn't really have anything
> > to do with disks, except that this is the first user.
>
> Yeah
>
> > The dma-buf iovec can work for every ->read_iter/->write_iter
> > consumer, and should be adopted more broadly.  Including by
> > networking instead of their own totally weird different world.
>
> I'm not holding my breath on that one..
>
> Jason
>
