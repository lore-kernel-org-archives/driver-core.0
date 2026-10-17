Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 826A23B83E1
	for <driver-core@lists.linux.dev>; Sat, 17 Oct 2026 17:12:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792257127; cv=pass; b=ikIivBRm2WHi1t67X8FPvKIrANZEok/6UIyTrU2upa2pBMCa7PuNJ7JMaO6Dxeq6df+yd/Yj2AZ+6s75Hm8CqXbj7D9hCfuJEn4PvXq4ZfFYsTQLWKwbz+VlwEliyo8pa5TF2wseVMFf/SKAY8SrBhJyz4hM8jGGXw9aqF8Y5KU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792257127; c=relaxed/simple;
	bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Jf3IIQ2irDVm3RJpWgeBLdZACO0g3lqDDzwXSNAIzPXGSm70SdkLvZracX1Eet1UYH6MFNSICRat0D8nqyi3Cm5Zo1W82+Ie+VmVs/RRhJPaJZGlndr0mg2bT298KLNMqllP+zcgbUG38SrCE72oz1FGPmo3UlxXAWDnJ4qc/N4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Eg1oAbsN; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Eg1oAbsN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so24895ad.1
        for <driver-core@lists.linux.dev>; Sat, 17 Oct 2026 10:12:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792257126; cv=none;
        d=google.com; s=arc-20260327;
        b=ZUb2yDGW53n2LYfinNAoTksNecZi/DaZQ1/pOwpoael36QRzEl9+X61YzH8ab1L0Zb
         K4ml8Rs7BGClG/47T0l18Nt8WpLaxqZo1LLaB1Xe1pA21DdPbxXgwOYMOkgIuojp35wF
         eLnEKVo+YPWpiBAR5JkvEmernyzuwhBmNzgspWZZUsRB0R09QN9MpJv4jPiSQ7jswsh8
         onegrYcTCCJHacV6u8NXAu1WvQ9vv9Xr85xKw4+/g7KkneoHKlhrWBJcJRznkdsYgGBD
         ldyiIBvWdMO4CgG9zO2mKEDg/5smVaj72aFSbGUotnRA1dYVk6E/2kPrhHwptaUdj2YN
         lc+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
        fh=9jndsytls2/rWJ/uBxCeMux1ikAwPhdPZkTsZG3I8KI=;
        b=GIdN5m6roCfSxHfivqOQe/88wW6IiO0u9DOUpmphjeDdgIeBYpYOyYU4uQjKT2rziA
         XXeXriEJAWp4ApyHDdjSUXo6HnVGVtaNw+T3kv0O9wKWjfOvNSFNi/CsuZGFKYPnALLP
         Xb3MtdpiuXCmPl55CLVuc3BZ9YTfYUwp1SjhDd9+fvzUXfWEZ8hIsDCmhcQzYeirJQBU
         yO+nfYrdrJ8fh1qomJ550LxHsJ3/iom0zES5+4idU7FXbh3032myh5eRacr3rySl07dl
         rnI69Q4thKLBvvdm4XvzergnRM46j5X5P/akD5UjnZW20Lngi/F/17FFt0ipxiBemW28
         gDqA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792257126; x=1792861926; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
        b=Eg1oAbsNn/23y7i4HD2noIjZgYIp/iufp1BmNnNruGEfIVddJYte0K23l2fZ4Gq+51
         JwGgwxJBwE7+KG3pjeeAaTWd18ergMx1bzR5sJBWBL4otsRrl30T3U7n9v6N5pyquV2f
         3Y1WGQjSe5y5RmQrfXJeR4ikdW6QL+99Fwn/aMHOX5NLef6vxUfQkZ0VCEXHHIbVjhKo
         HDtEqh+BYGbr4X296Cs4jQR+BUFhsQB0xJncqTWJe9lKaYBA7zhI1rCS9zfxF+Rs4gG5
         y8cuWktyoyHNOgX9F7PV+aBwILTNPgUR/qeDbyFzwQpXUJmm6/H/xWJYbyRfXCVTEO5t
         +R3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792257126; x=1792861926;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TQ0S3+GvPqkyCnzw3WaiERWE0gQzxysyRgtfYYbHNSY=;
        b=YOGwbmCdyevg5pr9o4P7EUdTysJL5a/o9kEs8GFLhYIawDHDTW6YtE6OlsTF3fwb+d
         eNVB1L98gDy08dhl6tjrw83aOVbq4vvJjh50isS57T5Etd+xEwrUjUzT0Z5RJH7+1Gb1
         c55mOLi8NdUwx50Qx92IPCi/ohNd8v33HHlIDafnybJkiFqrcsIoMfdGTE+lH0Y8D1k9
         BOyVKFj8ZWAM6c4B5/P22KUkNAX9QJzK5zKMe/nI51pyCa7eKuCbuvfg5LCN8ehkr0Py
         EpCfhpGayet01JkdKCuSkA/2wh5euFLSNGL9gm8cPUiAsplau89Ezca7rW+DoiloQjcU
         oLHQ==
X-Forwarded-Encrypted: i=1; AKwUvBwnJxc8TxeAKLf+cVs3te0SMJLfzDQuWo6YCrJeVymsN5wqtwJBOyg8MeoopDfLv9tQcuGha1KmFkeJXw==@lists.linux.dev
X-Gm-Message-State: AFq9FYK4THaH9rZ4iBJWVA/K8ru3gPec7nW/KjNgn3uBZg2R1X1/IgQ3
	N99Cuh+RfTuhB5DfriheEQllKLUeoTqROEMYLGRTxdjqUMCLjb3Wcv+4lM9B/SOprTzgCIYNwsh
	fR+9/kwmzUeyD4IIJjTtg8LUI4zEAEyJc4K4j2tai
X-Gm-Gg: AYBFou17Zx0ojW/v7uDyQoHHWudswd3N3D3cPde1FH1Ysq7F82mJkou4Yg5K7hhARbp
	MykUL9yza9WaNGfXbjgkPVmI7b8J7Anp+ekG727J9b7Lds/ledGxeJclUQEwEznZLipQxn6h9yh
	1us84eRMDql9Qfzt+nZ2CDHAlXfMARwnMRrzcRyu1C9oqtWqW7dYuwuNrLz/qJDuZ2Pe2veQZXs
	17Ai4OUxXKVrrnuUkQb6g71g+bTJBc9QeUDErhE7Hp0A7wPcobMWWCPj+TL+P9NLFY1dh207gLD
	v9A8aaG7yT6B8gbwWTAeyFX59f45dqZA+V9vhSkvYspLTXUubD3fj1Hr
X-Received: by 2002:a17:903:144e:b0:2e3:981:4cc4 with SMTP id
 d9443c01a7336-2e9b3252cdbmr3330175ad.9.1792257125060; Sat, 17 Oct 2026
 10:12:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com> <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
In-Reply-To: <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Sat, 17 Oct 2026 19:11:28 +0200
X-Gm-Features: AclHuK8222c3YwWa2EndazmJS8Umg9HTADwML-hsKq06OdSigMokkN9A-iBy5wE
Message-ID: <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
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

On Mon, Oct 12, 2026 at 9:44=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/12/26 16:45, Luigi Rizzo wrote:
> > On Mon, Oct 12, 2026 at 3:51=E2=80=AFPM David Hildenbrand (Arm)
> > <david@kernel.org> wrote:
> >>
> >> On 10/3/26 23:22, Luigi Rizzo wrote:
> >>> Here is a subsystem called DMA_PMD on which I would like feedback on
> >>> architecture, possible enhancements, or kernel components that could =
be
> >>> reused to avoid duplication.
> >>
> >> Here is a feedback to a subsystem called DMA_PMD ;)
> >>
> >> Why is basing this on PMDs (and embedding it in the name) the right ap=
proach?
> >>
> >> On architctures with large PMDs (512 MiB on arm64 with 64k), would we =
really
> >> want to use 512 MiB pages, or rather something smaller (e.g., 2 MiB) t=
hat might
> >> possibly also have TLB benefits (cont-pte)?
> >
> > I had to call it something... an earlier prototype used the name IOMMU_=
2M,
> > but I didn't want to suggest that the design was limited to 2M (it is n=
ot).
> >
> > Aside from the name, the _current_ prototype restricts to 2M allocation=
s,
> > exactly because too large units are expensive and wasteful.
> >
> > In the code, decoupling the allocation size from the PMD size is trivia=
l.
>
> Yeah, we should do that.
>
> We should probably just find a way to describe that this is a POOL that f=
ocuses
> on physical contiguity in some configured granularity.

Before embarking in a global renaming, I would like to get opinions on
acceptable alternative names (possibly with a short prefix usable for
identifiers in the code). I could think of the following

DMA_PMAP (for PreMapped or Persistent Mapped)
or, ahemm...
DMA_PISA (Pooled IOMMU Superpage Allocator)
both using dmap_ for internal name prefixes

Other suggestions ?

cheers
luigi
