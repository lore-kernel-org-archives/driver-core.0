Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9800156855E
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 18:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792001721; cv=pass; b=UrBTVND63A7thY4q/jFkHnvYxqHcOOoMi4eGKSFW4b/NJlLRIsdFsMgDy9NKKRONnTJF8h4Nseap+955DazhC1aIBgwcw9GOUlZ/8+RIH1BmdOaHlwWgIFJ6DtnNZ6ZwTZR3eT11m++gcJ8MmzHeKR0vlWeui6hconfesTTgBSA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792001721; c=relaxed/simple;
	bh=ZDeZDQJcijxdIEcisFFhzJK1uUV77Ej4r8MxO3z/x0Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZaBmKT8Z469nXR+fPBmCK55D+Zx21+0zY4chbpGcGufGgFNC1VM1Cd3scnx6vzQtSRJUch3mK/eZjtxqezdDnhpGjG3+OtD3bZFw6mqjrlj7CblRnQIOXf8BCmLwLDvDo3mnHQRlRH0IHk4gjBSajeTUIYDSDH7lYE7I9YDphEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M7oLYk6e; arc=pass smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M7oLYk6e"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2e8623790f8so247785ad.0
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 11:15:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792001719; cv=none;
        d=google.com; s=arc-20260327;
        b=j7QG0Y4ucqZfeWxUGftoyt7y38YIE3UlC4Ezm2x5rTAAVlS1bJodcRFWkWmH6Avh2z
         vKNpgzqbL5ZL/H4/1ZGsboKXmwJCuFkU5XGwQPsrTv6GN8Ya07Y2mPMmZpYXaKnb9igQ
         3u/GS/GOs4jFdfK2AGz6Yxod11RRpY8vY51EEzDoAPpbWZoeW2NU3OFPn2iwHPCygies
         F1T9nVOlvtYYFmvzqxeyOtNWO1AifBz0wx5hBt/uZc5bRcf750YvfRQ8M1sKZELS2IZn
         xYRg7TG6BSpipBdD6PYpWGlDuEurEN1KNlCTo14GJ4ER8GxYVZhBnMHhnsDqnnkdpjWC
         fMmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ukWxxq7IJoiKFikFQrOXvwgn9jZTFnVv2R6ijBLFQBc=;
        fh=nqz0LAr9LiVyonKhOPp5J4yy/Bl+91p7XjhdXZ75iuo=;
        b=V0TOO+puMmJg1vZvuRnvmloloPQsjEm/qTUogBvSgeYAEyhCCaEw3+/bw+WmiAbi6u
         ks/CMq6+w38KI/nT+Nkrjpl8JI/WgHCB1j+/zzjeJ8lcgsXU//6viNzDQ63N2N1g4uVV
         swwzXIYgmdFKhuGKnDhpnr3w5Nw2zbeuLMaPfeZ3UsrKmEmBDsip7GYKB6bBz6KBBDZJ
         ZkPDf19SefNhax5OA8DgZqU68Cvrzvq/nhuU2mBzomopy3T0lijKMqKbjz9uh+p57i4Q
         j4kV1QixocQv+0gfIh8OAwYYjb153Vqcp1svX0u5IRjzas9XrQA1Sp6/q+cw8raIIgNu
         EwRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792001719; x=1792606519; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ukWxxq7IJoiKFikFQrOXvwgn9jZTFnVv2R6ijBLFQBc=;
        b=M7oLYk6eIJGZ5/iBSgm9STMoCE1bHjlRYRBi1vofgBwsASzFpRaEHa830Cocltc/gV
         F/qhAhdl/ukTyPuvfuWVN4iTipxysjhjSk7jaSwL8cmSwQyJBx7o+jhAdhwPzjBg1RRU
         1dC7W/YBH0ehTMIN8hMsuxVZ0KdNCn/epyJ2P/tbjNAh1XwLmd87scZH2xETxFLG27dB
         W5Cn4lQVQ0jKjf0FdEeP9Xnse4GIuimhjG5eGCy/5vkqEnKpFaaBLjDCBB8ZngBxVFkF
         Wgko2oEbFQjO6jRS4K3jfkK4KDXwKo8CyUkI96e8LLGo+QQe59Dwo2JhkdaEWuWICv0J
         qdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792001719; x=1792606519;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ukWxxq7IJoiKFikFQrOXvwgn9jZTFnVv2R6ijBLFQBc=;
        b=0zuCtVFBlc/lQiddw8WkGEeJeIB8+d7hLpSl3kj39cxZ1MCPsUX8Br5Ymr7lnKpS1Y
         9S+FLRA62rwVHZkevnyZo37c1wx/fPdX9lFS881Caf8uj1bh8IBZywR0+4NXnotmYAJq
         lXBZGmSDIjti49QHxdR3mbnDw+ffqOEncZFyk9hc/L31aAnjNgtw41NH1hqMaK3+usHE
         qcSIrxCGs9V7SG6fJ1cKbFq5c/N1A7QpD54UuprpefujUtE2O+aeas0hkw6z/igh3h+D
         0OJ4zS5W5ZpFFJSbKpup2fR5/P7WxQCA5RNmmExxBwwl3o6w0+P3TpgbJBvlTZ+4OPHb
         Oa+A==
X-Forwarded-Encrypted: i=1; AKwUvBw+owG4tNpPtnoQ/fXobzrjRdy6DQAAXhh4bTHeM8qPvrYkMa156DVb/Zo1ymT2uPTbVXM1rd/gOx47KA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLxbdNRl8pTSyCC+/+G4Fh0NR0kaEfZNmmzs5hO+Vt+PEKJAZvd
	k8SUaPyIEbbkQt9+wd++4j4fOXuEYlJYr68USUCTh5DGKJpcImrEaGlczl6P0ZW/YZfzX/B7Y/P
	/dFNmzZXBw9VszzxNRKwzpe9Ne5aDUsdwvkDvidhZ
X-Gm-Gg: AYBFou217Wwj+Oq7LllMC+fga+IirB3lStNdPxs2hlPJ7ar3s+l+r6spgbjBmRK1/Bw
	vXAG2PdHl1cn0EHOA93CvlsCs97+bvbuwuLshvi2rHbuX3W22RpUOTqU6rJyHlVRyLp7dhWdyr4
	0y5223GUZwRRe51Bk2xkdAKQRs+pvToWsyGH8WDTPQNr8339OaWDJBFMQko/sIjCnok8F0lsqVa
	v6ld/AbLj11BSxAxXZpZAoaaKUimL/kDvEoxjaU5hCRwKnEquWhE796rwtJ1EKLgDQIArvY6FjZ
	HmXaW9Z3mFWadPnGZeZu5sDRG877PhMy+ozprQqr8KHNG/go22ZaLB6o
X-Received: by 2002:a17:902:ec86:b0:2e6:1013:ad57 with SMTP id
 d9443c01a7336-2e939d090a3mr4279565ad.12.1792001718105; Wed, 14 Oct 2026
 11:15:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <8584c31e-fd93-4f1a-9929-e71c5d9ccd0f@nvidia.com>
In-Reply-To: <8584c31e-fd93-4f1a-9929-e71c5d9ccd0f@nvidia.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Wed, 14 Oct 2026 20:14:41 +0200
X-Gm-Features: AclHuK9G3FSCwwu9o-cWYwZA7nUn_K71LEEmvdGinw_0nCstr-Fs63NFljz-hj0
Message-ID: <CAMOZA0JiGhVmc0PXajBzha3cBY-sdc3pz8eLCCbt6=hmsEh65Q@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Dragos Tatulea <dtatulea@nvidia.com>
Cc: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
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

On Wed, Oct 14, 2026 at 7:28=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>
> Hi Luigi,
>
> On 03.10.26 23:22, Luigi Rizzo wrote:
> > Here is a subsystem called DMA_PMD on which I would like feedback on
...
>
> Thanks for the RFC. Here are my notes (some points rephrase what was alre=
ady
> said):
>
> - On CoCo VMs it seems that the only way to opt in the IOMMU optimization=
 is to
>   also opt in the copy avoidance which is not always desirable.
>
> - Having the pool generic opens up more visibility from the untrusted hos=
t
>   side. Having device based pools at least isolates one device's memory f=
rom
>   the rest of the system.
>
> - Also, device driver could help with provisioning just the right amount =
of
>   memory that is needed. And per device control also means that probably
>   you don't need to map everything RW to the IOMMU.

Yes on all three. I am looking into providing more knobs for different leve=
ls
of opt-in and isolation, so users may adjust them according to the
threat models and performance goals.

I am not especially worried about provisioning because the system is
already reasonably adaptive, and leveraging existing caches, the waste
the waste due to allocating 2MB units can be kept relatively small.

As an example, the update I am working on has the following:
- a lean per-cpu cache that can be attached on top of a dma_pmd_pool,
  similar to the one used by the buddy allocator. The dma_pmd_pool will hol=
d
  the 2MB pages, and the caches can buffer smaller sets, reducing the waste=
.
  Useful on the tx side.
- on the receive side, one dma_pmd_pool per device will feed all
  pagepools for that device (typically one per queue).
  The pagepool is already a pretty good cache that does not
  access the allocator often, so once again the waste due to
  partially used pages is minimized.

cheers
luigi
