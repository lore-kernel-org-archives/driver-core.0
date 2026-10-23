Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792787001;
	b=HeOq4MBbgg3QfeVAk82GB9WoNndk2WKDrqJD+Ro94FR+aa9+77P/H96BtVDtmuGpHu5u
	 WCH3Gf7FhFMVfXceoqQ29SHqb/mOmHewXtoPiWCwvSJGfAKlL7CmSkJHSKNXYAnnzVaUf
	 Xc06mUKWMkjKc0MifqM4ivXMwoeMiYrq2lp9oiFu8JmBwenazlRsNzBnIeraUgriLt+4K
	 ucl5Zd0qBQuRjRWzjCTBLVk3s/CHOSd7qJMJB85Ong7dogDPhuEk7vyKbTARrniEmUffQ
	 X75zClmohOyAPO2VqC9ip06DWlxf8GNpQSkXQSJs43ZrxH65lxUbW2u4z4Bq6Qa1EBA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792787001;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=eVhNp0GGNRD3+5V43/lt1UQnV2SdTxNQyX5GFb3QiFw=;
	b=T9LORETcZV6y9MHDr+MUN1doxndBffSfqxRzGx6nCgBkWb0wlarHKH1OW4ZvaDrA1gpu
	 ZablkcGOG6Z9RA7EgkS0vEZu1nwdmbavO4/I8w2rEM0RhBy7eUgfFoci0XNZbPUY5KQUi
	 m4HjwlMcNaWzVhHK8pUqa2HnoXvHguWP4/MpFzaMxrFWCTvxdGFsYFqsxu1zOJQ3eQ9YH
	 WWNQh7SJ2l9dSBg1qYFmXGVSwuxK03PDona8afhPcS2p0B51vteBMPVQd39kkf6Nc3dWt
	 p5hGtfkgmM4rR6VQyVF/t8oc0pclnfUNRp5D4NLCpImNj9l7MAXC7Sirst87mw4/NOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LK2oSsZV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 825E2606A31B
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 20:23:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 825E2606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=LK2oSsZV
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2db33db4de9so14515ad.0
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 13:23:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792786996; cv=none;
        d=google.com; s=arc-20260327;
        b=iQ9AGo3rZRU940VqjM0DGWRPkequbeaNuT63446K30u6oru5Dwvj9hHNqSr6zFVM8W
         /lrc8MYmRXqd7FoMvE/p2SS9wCnvXsVpgLyIy2na761w+Ikf0IYAAsF1RfWkLHfgm3iq
         Hf7uxM04MXcnZqdoBhAQbTL0lU6EBJT/jVFIzNtmQ5sle/VlPfD7UNH27MD8HpWOybkl
         Zsjl/mcfSprZM2xOia6Lw16cgtf0hPvMBHNLCu/UFCc8Ke7e69X1v3kZ5bnG2yfPhsOh
         lUj9PqySNagcJjP+PgpI/uHapqLCkCF+QD0Tzb19PP8RYJCwZMi1tknX1pk8YQNGOCsl
         4IRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eVhNp0GGNRD3+5V43/lt1UQnV2SdTxNQyX5GFb3QiFw=;
        fh=x9naz778LLgpzB6Z5wDArsg8wof0V6i/NfaSH727GZ4=;
        b=fGJZtBC9tY0LdQDFAxJnnig/MhYwBzrWvoLWty4KyS5zZXC41iH9Z6SWJwgsxIuAJe
         O1yvs5gvB4ZWt+tYYqE2GnwQSUh3Oizcnok8c2XlFsVvrgt1RvstVQzO8HD5rV082Zey
         DNEx611o0LLUXUXRdf+pid2yDNwZzg08M/AP+8iuOtajQw0opqZ13WEaHqRLDXMp17XL
         rIgUDYctEgdj2Gi+HY3ytfIw0ZQK2XPR/snVoIOPXWfaW4UE1LYRJZ+rRcToDUxveTIv
         Y2t+eBm3+RAnJFqIm83Q9VI+AIL5pGUwh31Z0+9w9DyMbg01LsQJth9utRUZDYkQJJ48
         hkxQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792786996; x=1793391796; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eVhNp0GGNRD3+5V43/lt1UQnV2SdTxNQyX5GFb3QiFw=;
        b=LK2oSsZV27a8k1q7bbaS69Lx0+57B8QGtpuBD7WgbJ8Kri0hMoEg+Eq3sDokNOssvK
         9a+i8cYMU+2WXJ7ZIpvozB8LdCUr5AwAZCdEG00vztWPkzEUic+IQxcruHkzA/r5W5YB
         c+Gqu/K6A9inPMLv2L6gtKaZP7BcxWqsYNo+vdtECDbjZWSy6A5bIizv233oNe49jc4C
         DIMQdfIiGJmST1hhFmTnZ8OBzutvobd1yC6ZbWCTzXwIcHRExv/gnZrjuXyLjsmq+gy5
         KfoVC7F3v+cY0NdUYD4YPH/s60GnYU6j4IeHDI95EcGHULd0VGaF/lyVjHDQRn3+ggqe
         pxEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792786996; x=1793391796;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eVhNp0GGNRD3+5V43/lt1UQnV2SdTxNQyX5GFb3QiFw=;
        b=uQKTf8xBpXH4rQCAPqOmNVYVUNAHi4MMz8zJebuIwPtctTmBNUjcbBaFdJsBJ0NXQq
         iL6ExjRUFQL4UMpQDtjIYGHy64jm/sDiRxdqDoNuaUOjK+tC5URYSeD+onp9OYqoZZC7
         ZHxVzFuhnomZDw1ZJrgnXMLX0duQcgbQgxzz8WAW9fugTpYgofFvFxjRcJlDGLls3XAF
         bp8B24CW/da07xh9cnDo5h3s3EpbESE0iP796qFukI+TtivMGOVkqqRrLvgDaQEgU/Yf
         0bcSu3C4Uu+4uoSFFSKiNgTClRfgSVXt/rUCT6SLLrmWvE58XqN48KnfBj82QLJ7D+EY
         e+yg==
X-Forwarded-Encrypted: i=1; AKwUvBxoCjff06a3YVEKmj0QqEJRQ5sexosVlUPuV5gStcucxa/21jBzY6e0aJRBEhJJ5rGilXy5wUThbl36qA==@lists.linux.dev
X-Gm-Message-State: AFq9FYKejCK0iPtJqJ6mAUtvXbCoNDkLENrCdDaTolcGVRa4jTgIdZHE
	AlXow0+e3Lg3TrSKqcrSlmei6Ax35CkKHmKsgrmx8BnJTCqX4cejuf62cJJTR1XTQnvdB4JaVsX
	tWzgYSHn7F1yjjwAy0ulBZhjL9waZv1xG3epqZDv2
X-Gm-Gg: AYBFou3R+NWNWhDzWaU9i04zMWpia6NV441a/Qd0PW9N4nN7oN6I9nV7J3IAruawlW+
	ygS3utHzZOx2OYdA1Sk7Mf5ZZeqPQGfyvElNnkPSqYWyr9Rhj/iSrzeCtLr8BxtbsTyvgXtHNM+
	D9L1xTj89TSBRdBovlei9y9BwGd1EePP9l65thLJPvaYZbw4yJqpqkNm0gQ0hE0Bu/DqhCge2JG
	zne18BN84H8zFTcEYS0eY2T5uXSb3DQ40ybILZ419tXTRHFb8KtHcSNTpA6Ti6j3CdqItU6vZH1
	dpVb6CAwzatHG6P7Xdg/cOEefiaw47jATiaHxCSNdrVF6dv4kGd1aZ+U8iCDrcEDYDE3c+a3qoB
	/9CLkKdGtU7wpG5nTqEfM+OvGp+wPdVs71Rwk3A==
X-Received: by 2002:a17:903:3c6f:b0:2e5:4604:c37a with SMTP id
 d9443c01a7336-2ea9c34d519mr322665ad.18.1792786995276; Fri, 23 Oct 2026
 13:23:15 -0700 (PDT)
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
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261023102756.201315d7@kernel.org>
In-Reply-To: <20261023102756.201315d7@kernel.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 23 Oct 2026 22:22:38 +0200
X-Gm-Features: AclHuK8d6JZsEGtM0KlZDv9ie7EsPXi4sNCVttMkACFig7Laogxgi1nYEIBjAsw
Message-ID: <CAMOZA0KZi1EkJaAFKfwOm8jo1ydyGh=W1RE0iMfte-ZQkOx9AA@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Christoph Hellwig <hch@lst.de>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
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

On Fri, Oct 23, 2026 at 7:27=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Fri, 23 Oct 2026 11:50:23 -0300 Jason Gunthorpe wrote:
> > > Anyways, reading your next comments, are you suggesting that all
> > > these functionalities should be implemented as pagepool extensions?
> > > (2MB mappings and iommu backing, proper allocator of fragments out of=
 larger
> > > pages, device-less pagepools, multi-domain mappings, pagepool
> > > as memory provider for skb heads, pagepool as memory provider for des=
criptor
> > > rings ?)
> >
> > netdev shouldn't be touching iommu, it can get a 2M page and map it
> > using the normal DMA API. AFAIK there is not such a big reason to need
> > any of these layering violations. They just make it easier on page
> > pool..
>
> FWIW we're entirely happy on the netdev side to add this to page pool.
> In fact the initial RFC I posted for "page pool memory providers"
> was addressing this exact use case. I didn't push it forward due
> to low time and suspicion that IOMMU folks would prefer a more generic
> solution. Since then memory providers were pushed forward and merged
> for dmabuf, and we have netlink APIs to configure things. So adding
> large mappings should be SMOC.

Maybe technicalities, maybe not...

Getting a 2MB contiguous and aligned page is only the first step, and
the easy one.

Next we need to split it into 4K fragments that can be recycled
without waiting for the entire 512 of them to be returned.
This is not rocket science, but requires much more state
that what fits in the struct page, so that's another layer that needs
to be added to quickly access the state from the pfn.
Essentially my dma_pmd_meta (because I could not/did not want to/ use
fields in struct page to access ).
Doing it in pagepool could reuse some fields in
struct page to point to the metadata and simplify the implementation,
but maybe leave people unhappy because now something may
require an extra indirection.

Then there is a question of resource management: when 512 fragments
come out of a much larger page, deciding which one to recycle matters a lot=
.
Without a strategy, there is a significant risk of stranding a
lot of lightly used 2M pages that cannot be returned because some
fragments are in use.
Again no rocket science but that takes some compromises (sorting
based on usage ? periodically drain old pages ? etc) between
effectiveness, code complexity and runtime cost.

And then of course adapting to zero or many devices...

cheers
luigi
