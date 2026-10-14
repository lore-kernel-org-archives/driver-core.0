Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9825328BF
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 18:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792002526; cv=pass; b=u8qFQwROTYXB3AXlxJ0oJRTm8TyC8ZuYU5SfZ1A1RrY/tyz64tlXCTxY4Pg7G5iUR+WBVQe8439lejDoeELrp7WozDGh8gjRdtsmLXSOKbJRrTal/pjX72ka4TXgIFBwTbfhKqhjQMU51xnKNe3Y/f98cnAEZCLJ2gQA5IwJ67M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792002526; c=relaxed/simple;
	bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sFBv2XNsECXT+XrDWUFLGyWAz/uqoDbmin3yJUgv7g9VWu7KLHMkptQ1/UzPmTcmXaHyJnzJw1CQxTJ/gKc67UkiSnQLdp0S4Lh1/aQbBImzszCJ+e2hxJt+2Quo+FyNQ/soNdjV5Sp8eCvR+SIgJJ+0RVEB40cEXUtkNqygEfc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LK80hokk; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LK80hokk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2e8d6fcbba0so237225ad.1
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 11:28:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792002523; cv=none;
        d=google.com; s=arc-20260327;
        b=Nxa+B/OrFgeXR+yOsfGQfHT8P4xxJVSwbX22mTKmnCW/OAER+TCQCZqJ8GPviLj/fk
         slR8x8KgaqCwHM25hc6dmZa5Qiior4tLZ9+RcgIRTpO9hmUZdD5qKD8cMMTw6ERaSy+0
         MhhJEp0fWcKHtSSxnWxu41BAGxaW4JP8hUuYdVKvzTwfo6uVrUgnWV5e5/BQMyK0ccdl
         zispB9kDmgD8nBgzQc6bgKBPMeVKb5T6Ju+g48u1EwO0Ur6Wt/of5JfCmgw5kW7G3vbE
         G86xBdZr64mbDk+fH9cKLN3PRMMcxrj6sNyPkhtGneZF03w8rZZJvUn8E5xVf+uoQ5xy
         O93A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
        fh=spNzl2yIDK9uZbA6nkFS+jlchIapg5/3S/bOtdgEqqE=;
        b=FbdEWHfk/SFY8XXQF4yOFGgOf6JPz2R6TnnNLy/yVI60MUXNTQWK16cDLY/85Px+oj
         FZSHan2zIG7DnWpRNrB2RMps6k/KEzFfMTOFl2c6sm7sbitS9WDb2POKr5wEWp75cTMQ
         K3SpzvkF9gAUwIWiTBOIV1YOZ9K8LnodVL1uVYC/ZLXrfTci9cEggUrQ2r49qcGw0frW
         uYPwa5Hx55I1Vs1B5FBKCI3w+nLlEjo19ixOJs88wHLFX2W2GnUkriUWNlUBYIG3BH8E
         ECth6U5GdvFZdPPSOJePpRbsaJ+Ct31nOJBtY/LV2+Ubt1xZbEwNj3m6FXxs5bR+6Lgc
         5epg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792002523; x=1792607323; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
        b=LK80hokkwFtjBL4EmwDtKjHNi51vnKH18AxD/LvwNFw69B2ejVxf5aqUUwf/F5qJo2
         riEOtFR3MKtLpay2S5R6ovrhdJZhCvoCA/M6NAQBx+2ETqqrQ6tgAI1JWrwWOBu+koXv
         Bl/+SD67q5HGvGO4AGCxDon6DBk7ihJDyI/18lMMA8l/IH+iy+fXUlgCKUdYkZK/U1Gf
         dygT4/4Fo0q7LT5U7dIEhd7wbNUA/8d0jMGeYr3Xp6rB9XuXZQqKkabOW6xDGXjqWm+h
         yKgXPKGatAPhS+cYXGeyGvEe3/rkQ8Nzlgx4CrR/2Ub8mOMgceEDvxaQLS6WOzgSwlvm
         tMGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792002523; x=1792607323;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0+JRXvl/R9u5pNiuiBxqdsVIx1pGWTS2oCduhPjMn+0=;
        b=0qxsFMVDhUZSrd0dWZdgM67Vt7fRsG7ZUbO0h3au1IBrgRNNByoRXIWZp68lSKAtGY
         7+DFyYJ0topnfjCeS1pt3yXP9GmlJNuHlPDPSHlGzpr2keUz6VNzl1DoizL1g+xzIbiU
         OMcR8BRi/gz5QDPb2czcaERG1b2T/mzH7W7n3oSz13QFxu+Mxoj+sAIi6h8tyRLHVEQA
         1o1lnhfoKzllH7V0j8A/C0h4KiJtmgH8ZfLR3S3vQvrWxpLZd4DcmJ3W7ybAlFUg/clV
         vBKTXZZ8vc/8twZxtET4+mRnNhfndO9zR1j0ulRzI1bkqnsgC7M051ZDiolqVHHgjhX/
         rJIg==
X-Forwarded-Encrypted: i=1; AKwUvBycLZ8jHuBwvu3POtIn8e/wdY5lsxUguhi8TpUrwZBd6SFKy7tcG5xPZNyaySTn81F33wZb+Hv4SSMRZw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIpCcCh2/D1SkpIN11ZRqTNPrJqmPdZeGinJV7VP6FzgwkiTscP
	5Wt892C+S7Wxe6uyYNJj9DuOf6Po0zuxVwb7hRAqdOvO9O7SadClQxgXMm8UMeFk03rlDXYf2r+
	V2d4L8sAjVzz+QZY6BJ6NjqB1PLi2qiyTdoUKQhNP
X-Gm-Gg: AYBFou3IWA+iJJT8pqb2cNVvvPPObcbbVkccgmlS/vqaJbVOSohPOmOMbvX+fmGjbjL
	dyd5LPkUsdToDUonIrYv6Q8UnBcczVGZqKyvrOdicwQR0ODBpAilUkA4OLPSOQu1SdBQii2S8iu
	RqOwgV3Pgmokq7H+Vf0S6Nmy1MusfFJoRyfpXPga84RSqcZAoq0eyXY8LS4vPrvVZTFsQFEq88H
	HQyU/aIEyr6mq5drIBbItyJtQKHsc4hP80XeM2rp7vHusUwwn43V6+xbB/lwiiP3eys3z595ayq
	Yx8hfxsLeu9fv/bH72eYc4LI6IzDBn1rSvbQ1RRcenUy3VZIJNIU9kfM
X-Received: by 2002:a17:902:e944:b0:2e5:4604:c37a with SMTP id
 d9443c01a7336-2e87e303708mr18554105ad.18.1792002521805; Wed, 14 Oct 2026
 11:28:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <20261003212241.3432303-20-lrizzo@google.com>
 <52a702a4-14eb-4617-bd29-e3140fd36780@nvidia.com> <afff5a1f-000a-4216-b4df-dd3d0406047c@nvidia.com>
In-Reply-To: <afff5a1f-000a-4216-b4df-dd3d0406047c@nvidia.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Wed, 14 Oct 2026 20:28:05 +0200
X-Gm-Features: AclHuK-6TbXuD5dQp6Q_-RxWjRRPPqkpIpvGcrKlslQ4aEjsOkMcO7VIrHzh1iI
Message-ID: <CAMOZA0K4ZV53pE41AKoKz1g2wz3YENBz=HVoXng=RZbGyN3ssg@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 19/22] net/mlx5e: Use DMA_PMD memory for tx header
 bounce buffers
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

On Wed, Oct 14, 2026 at 7:51=E2=80=AFPM Dragos Tatulea <dtatulea@nvidia.com=
> wrote:
>

> > On 03.10.26 23:22, Luigi Rizzo wrote:

> > Why are only headers considered for bouncing? Because they have the
> > highest mapping overhead?
>
> I meant to say headers and small packets.

Headers have a high cost for the map/unmap (especially in strict iommu mode=
),
and also cause significant IOTLB thrashing, because they come from skb_head
that is not pre-mapped. The impact of IOTLB thrashing depends on
the hardware and load but they consume one IOTLB entry per packet with
almost non-existent recycling.

In the following version I have modified the slub and skb allocator to
feed skb head from DMA_PMD memory, which removes the need
for header bounce buffers. It is a compromise (the skb head includes
skb_shinfo, which we may not always want to expose to the device),
but gives an option to those who want it, and in that case drivers
that use pagepool can get all the benefits of DMA_PMD with zero
modifications.

> > Note that TSO/GSO packets will copy the header inline in the WQE
> > already. But not for small packets.

Yes additional bounce buffers are not needed on hardware that are
essentially using the WQE as a bounce buffer. I'll double check the patch
(mechanically generated).

Small packets should not be too problematic, as long as they come from
fragments allocated during the copy_from_user.

cheers
luigi
