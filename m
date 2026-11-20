Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795184413;
	b=31OGq1GJ1SdcnCC4W+4s6G4xh/vAppBp+5cd5zVvPd6lcYubWBJQb92Q4MgJO3VfCvdJ
	 1KlvihRRmaeEpKx7Kdss/qpKreL927cZvpS4YiQBootuejYpgdk5uoSIk/6jbFjVff/Fn
	 4W2ERha2K0MdbImZYvlPmfP2SUBIpvepY0hr2KBWsKtBkmy1a53sWwjFWOSs+lH+GfmbO
	 FJZytA334SVBtfoFUh3WadfaKUWuJfLkdleWdil8Ag8TkVqS4LycW+YicI6gwnB/FVAu0
	 HXgNOVeLFkLpJTwDuEYoyFxcXwwFR3Le6YJI1lf2h1sXvQW29gQhw2cztxr8EynVEfA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795184413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
	b=in6JpLrs/zXgREJRs+nEmJgChNxiH77Ds2qCtJU8a27l0yK9zd4FjkCWQFDHRxi6/PpL
	 aXRmHMLoKaSSGr6Yybqd3thKl/UeAVUAsi89SPhD6hFRcFrsj/rpih76p4oIsoOYj4xvu
	 z+7GJlvI4f0MVykpyU8405/vQI58qCeKKOBjLLGyr84VMI3sr0UXhzwa2dIJek6MT/6e9
	 aYEV2GJKnVhUMOHHawcztorEt0ligL2ibHbNSfngNBGYXGdpjm7iJZRhf1OTCUzU/F+ms
	 WMyJV47bPeKOJQ1rKvmWe14LESGCU0LX0SlcsqN+G8E3cnxQcZDwB7P27D9DB06XfTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Uc6DCpzc;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FA3606A331
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 14:20:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 77FA3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=Uc6DCpzc
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-55c7445cf85so244871cf.1
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 06:20:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795184412; cv=none;
        d=google.com; s=arc-20260327;
        b=E119yotdv5eMtWwDmQfWDGukWxPIFmDnt8oVl2oEBiUVE5WHGCTod0AbIau4+BV7ZF
         t5zyR7tjYIhDvdH8JhYdJfCydgKX2uF4L/u7yhdT4RrJqN+5s2LL6Qd5Bxz1sJ/aysTa
         WKYL+JQ3ELGESbh26W6aTwcfGlExT10bGRNQpQtF+I+rdmmwkWUWfjP7YabfOneq3lxb
         7RddrZeTQj9tRDsNdLMdUrrnYZt2kpnFTB9km59a1eAd6H7rcV83r1fBgn+q2wAsrmW5
         MlUioYEwHD9isVJYWHUqJ4Ks7s1Y9bxauBQsSDfkp0OqBGhddzZ+9jYf2yjs9bgCJooM
         8FBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
        fh=MzjadtF032cSWVLWDNtV1ImuiR9xpitqHmers7yiDfs=;
        b=sJyflxDVMgiNzsQFSnUE19PHUE2ZncRXk2DA547cqP4Hgv7vc7mVjuoAQuePXmmVLv
         0y4/82Z1bRP/uCe79e89lE5V8Npw295pBE+Fw7Lr+kEX6gss3atPtqlkPrNLisHY8Dxu
         S2AquqHNtZQvvXW0FXt5Zw1hX+svbMpHG9XFOVqn26RRLXB5hx0kGHZ+NzE8jrFtP6Nw
         b+Gvfh7WBd6v577XoZdQ+u6tIIfxeEVmE+Xbe3ksvWUmk2apCJeJLrI9Xy9nVatYahct
         cvoiySeXdI6ILczj9VCljgaDwCe0tkX3JWbpKF5ynGvC8U5Dq3FvgcKz+SrqXXgepkaR
         vPbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795184412; x=1795789212; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
        b=Uc6DCpzcrV4kRBt6hkEcs87KtJcntyiMDCf3U1qct9Vqe179yErxokjTEAVzs7XxP+
         uGhxMBFSPxmMyDw5VMhdm4NK0NCQbPxahZBSdfFmkHyMIIxwn38gxiT7x9AU0U6KXflr
         /LdMOJ/pM0xsEUJctcfpH7xa7NsbFV/o36ZDQqQqELCF5LIuC25z1feIOl503F3Xp+cP
         W/6Nr9dgOh87pY9LA1XNn2vemiPh2Fk5bo9exUKXykMDJGmwN25Gm4UutA7iMRUOHLjn
         /bQtGAxqxIkvd3Zbrsmp6HZ3CDUBJpKJrv3YaZcfgA8WboZriQGGYC94jrvO91zOaKQC
         k2dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795184412; x=1795789212;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZZKnDY3fzlC6VsJ3+sJIUV4LE2tQFmEUFN5SVkPY8Lk=;
        b=IkihTnJ4bRgaZod5tcDIPhvv27ytqZIMUw39qQ7XvVw0Mak/i7SaOcD3HTG9rKV8Wn
         JemGaB0DzeGUogJ5Vq3XDBGpFtvJnJ7V6WokoSvqsJ31DEuuReWMI0XSiLaoecNOf9s3
         bXbpHV2JqEgF0slP1RMkkJ2MeDGhrTyHNYkG8y48YelZR4vsDBvIy5oMZ+Q1m4huXRpA
         rAx/RAz9H8Rli36b2WAmExr2ldzXT9rWufn9FAQ8hSXss4hKVkhcEA4sDhnLj/Bze5G8
         cvhcSXx3WDYoN34g616+u+G0GWxkODcLMNBuchTTpTO/3jvrY08YA2DTWpXZoULPyg+/
         4+ww==
X-Forwarded-Encrypted: i=1; AL+hErGqtr2UnFx/OmtlPJgVS+wAg7U2PVkmDqLJakm6aQ89HjUJLoPpoYXKsb4L6rq6+bjtjsh50R5QdE22Ug==@lists.linux.dev
X-Gm-Message-State: APuU4Z9s8Alkx3RHafZeiKQt7cq9MTGoO5baBaj04w2AjcmuFeqWBwQb
	RTjHCzRG+m2B7PgHVDiLAITkeh4omqSomNTi6BqZEvr4JGXf5AcxSRb0VljGqoa3dITo3IQcTbJ
	KQLDF85VsBd4+ZDwVoghRYUSqKnGZS4QK5xCRQPUI
X-Gm-Gg: AYBFou0GeVLmt8a9LqSaMouas32Oag3SZkVFyghqSrLSung4WAyF8QJebAk71NO6rKX
	cWF++vjmtJvDcW8QiKK9WK5PuDX/uQT3XvP2YnxEDb3p0p3aHWVekGMfJo8F8BGAmcf0W3F4+wR
	4aqqP/r2w1rG1eFuysCaQDLXEyDt86D1oT6sm+JaSgSnjvC9pK6NNVDDn6kU3ICJgpeFUjQhZ38
	71yDSDQeOJY2lnbT5NspSfR0r3OSW7hb5WsEUVspKo9iIRoc69Ud0+uRVVaE3DF/fLVo7Gr+a8+
	raI9kXsKwuz5lJjrYGw8NehlwaDrjY+d2geVBSAhssxcLH4qro4vJ6bsn0jjlwM4LteGwCOGcES
	3f5Lrun8WoBVqkeMxQVuxxz+v+In6LqZEA4xnCQ==
X-Received: by 2002:a05:622a:8c8:b0:55b:ce7e:e65 with SMTP id
 d75a77b69052e-55d7a37902amr16973301cf.12.1795184411359; Fri, 20 Nov 2026
 06:20:11 -0800 (PST)
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
 <20261120135013.GO3115493@ziepe.ca>
In-Reply-To: <20261120135013.GO3115493@ziepe.ca>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 20 Nov 2026 15:19:34 +0100
X-Gm-Features: Aa3M54r79-wonm4abHk_49DjjJPxLMhPkMzG33LcM6yDH6fwirGgzaIY398cqTc
Message-ID: <CAMOZA0LmZ9PFzxLcc1SuS8piFyZu6P=vX_qR2jy-3QRUoNCUKA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
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
	Christoph Hellwig <hch@lst.de>, Dragos Tatulea <dtatulea@nvidia.com>, Naman Gulati <namangulati@google.com>, 
	Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, iommu@lists.linux.dev, 
	netdev@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 2:50=E2=80=AFPM Jason Gunthorpe <jgg@ziepe.ca> wrot=
e:
>
> On Fri, Nov 20, 2026 at 01:06:30AM +0000, Luigi Rizzo wrote:
> > This is v3 of the RFC previously posted as DMA_PMD [0], now renamed PIS=
A
> > ("Pre-mapped IOVA Superpage Allocator"). The text below follows
> > Documentation/core-api/pisa.rst (patch 25/25), which has the details.
>
> I thought the conclusion was to just do this stuff in netdev pagepool,
> now you come with an enormous AI series spread across the entire
> kernel?

There were surely comments claiming nothing outside net/ cares or needs thi=
s.

I respectfully disagree, witness is the fact that e.g. there was already an
io_uring proposal which is smaller, but does not address applications
that want to use the standard disk I/O paths (libaio, buffer cache etc)

Nothing has changed from the initial series in terms of size, use cases or
subsystems involved. Large files are placed where they should,
the series covers the same three use cases (disk, network, CoCo), and
touches three parts which it has to touch: mm (most of it; it is a
memory allocator
extension after all), dma (it hooks into map and unmap, not a large change)
and net (the pagepool change is a couple of lines; the tx path needs to
touch more places because the current stack assumes all paths have
the same I/O requirements).

For CoCo, there are very fine grained controls so the bounce buffers
can be enabled only when they don't pose a risk, which in turn
depends on the threat model.

Specifically, for network tx buffers or disk writes, the user-to-kernel cop=
y
is basically a bounce buffer provided it is used correctly and not leaked
elsewhere (which is the design; of course the implementation
needs to be verified and possibly fixed so that it matches the design).

cheers
luigi

> > - Needs bounce buffers: in Confidential Computing VMs, PISA allocators
> >   pre-decrypt 2MB pages in place, avoiding swiotlb bounce-buffer copies=
.
>
> It seems this was ignored too. We want the bounce buffers in CC. They
> serve a security purpose. You cannot loose control of the shared
> memory buffers have have them leak into SKBs, user mappings and so
> on. It is not secure.
>
> I don't see how any of this is valuable or necessary for CC,
> especially when we really don't even expect to have an vIOMMU for CC
> very often..
>
> Jason
