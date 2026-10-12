Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF39A3AAF49
	for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 14:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816349; cv=pass; b=EYtPzQAMMPnILbfHfLw0mx5HwzfcaTE5f+C0ce/iMRILxVz0MMYgj3OWAEV2PbYNcz+f+lav54GvLAL1TXCPHzgY5Dg+JAm13xIiha5O29CFgzH+OFEDHV4P+s+prfR+bCOwW9P94Dq95hZ55UA0r0unon/R/o3PYteWbhrvjBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816349; c=relaxed/simple;
	bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oRMO6sm+xKd7dQKdVtGz0M0uthWEWBpKJnEdiDncm1fnQtTS5cdEd92UvpI3tzdwRZi+kmelF2iq23E6C19ACMfwTpRoCkdivv0c7um036THcBRLitkTCGKaer8Gu5F/g3QFwTBAnRDBVQuwsPhWG+wRNYnM1NX3vnc/9PM3dE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=H8RwqdnT; arc=pass smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="H8RwqdnT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2d8fd7a3f38so69615ad.1
        for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 07:45:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791816348; cv=none;
        d=google.com; s=arc-20260327;
        b=ixbFiGl4ElFjgW3aGcDbkP2uRT6myjuKdtn3Yku870yxc2M3KCHecM2Q42BgeK68eM
         6pwXcpRmUlK5muw1hGnAUK02ilU2O5E8mQmf+S/Uy9QLUYO2dIBCNJLt38vKA5HHYVLN
         uq2IbOwFDq4T5yj5B/O3SdG+BGlcccmeuVqyHvdZ9TEK2Zc0VILvevo98J+76LZqxxk3
         87gf3WxDnwfSiNEkRkK6mOZpeovAT4pKBC6+ECU/YyI0fTuPOxWP4iSwTP/ZnJwymSsI
         4rDf/S4cxvESmR2ZuRIHQA3Fr70ejLfR0ArFY14F1409pHjVs2TKfgoy5CHB0y9wOVq1
         +dGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
        fh=ZsYgdyRAl/pRXTJc7vxTI/WMETG3usoWeSk69YROyJE=;
        b=KGX7+C2zzh+ElBfbb35SZupkSIn6REIg0D57+gIwrMPE47ldJ9X9pTatHZtsRx7Om8
         ZrSHOjURDP30sfC93/+9ACvSacIuFBe9cTQrEGcaBO0lFA6OcpXty3z7MJ9etJHddOeV
         5VO4rp+BzqH//lOeUgmbxCfxk1ETEYrKjCjwhtWJ+5dZKCRzfmY7dn6tUFiMWoEY6w2Y
         LNhCee+vMttbnARqC93hywUdaVe6gYwoBYt5Pg+cA2nZyRFSi6JAZYlVrTQvxXxaXhD7
         K6rIRyhA6h4uaJkAirPe7xIH3tbI6jxAqaFl+x2hXSPI8d/8xB/cTQ4EoqRxYnStHIQO
         CGkQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791816348; x=1792421148; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
        b=H8RwqdnTsfxvlFIu4bL6y2XzWHC9CMjoB5xbijUz+5dT/bsSWUhr2Xqf0/ZcHXD0Et
         fadxnXrCr3tpHbDBKxKunD+WlHmFpS/tC1rNeMfQ2tyQQlTRPFhMTg8EHgddqI1AXiHv
         /eysLyW/8+y818+h5ImIgUMIBb6mVDz3V6Ia9CYAyBMBJ/PG2PQ4VXL5x4eg2rGdQMyb
         Cn0kD/hCFhDJhoBklbUYP3QeBXKXc4LOGgU+RX0IkGLwOB+e2Rv7+qkORDyjckBGnCie
         xCLh3tOdXyudZn/VwuQ1IjVUlxtVenjaBw8g0PBjxoc/GZzOvRWymerS046Dg0a2Vf4j
         qf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816348; x=1792421148;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gGrNTBjii+g6uIsj6txOBfGumy2pNID11P1zmPmCOWs=;
        b=RmO3RmkCVODsDDGsxxLYBKCvPFHZBGAX6fcezIFnmMmJpL+WiR7dlaTRwP99jBKgZB
         LOzW63ggB1iXSeoW+9nA+EdeCf2Vv09VI9sLXWLAtMn89fIK6QprAk38K+UViwxW+1pH
         MUFZtd1Zo25GI1aaiNys14t2VSDMd4km2UdLBB1NDMPSSB3gp0aLa76zu7cafSfD4ULJ
         zk8COLkgtBnYIR5oO7spb3gUL1CZOUcwSzoMRx4uru1VaxXNHB9m6gtCxtqZkyIeTTGD
         382tndB9csdl2Oiq/2+UqlEP/iEesihB9JmrksLYSaDKl8GsbYrMW+OVvNHSi3iXWvCm
         QhKg==
X-Forwarded-Encrypted: i=1; AKwUvByELO0JMES5jyzd/oFfPkyPYF6HNze94UIiAVyFHTgLejSSZLrIAARe7KdgKjSfX9qWWJ2HvvU+LionVQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLv2p1YXuAaAkfl0HnJFzkIWk3OqMaFKqUcFojEmX7MWoFTzRXB
	dxuaNx5mveN+wUdikRr8eD/wmiJYuExbjkJfcqDXNzuy+d4nEK2XuWXSH+/UFYpZS/fqjB5Vg2l
	BDZsOLUfn+49fcrMZrxyQh3zATxi7GLLBFxWEe+B2
X-Gm-Gg: AYBFou3E/fxaBF7Hskb3rnHhfYXcOR0hqx14OSxuGFL9bXBAaxwjBMhLWdmLTQ3WCKq
	4A0ckffQTVEo5TfDzebHZdNQLSO/DxQXKqxZtqGUvvQyr/3lrJb4m4x89piaEoYUXImHrXeXFYl
	qk0bqQFVHXuTkym8dabnHTo/pCF9YpX0Qgo+cO1U2r5BjswCV2U0ADzQ9xNEWhXjQz4GEk4mOrN
	dhSkFCKZ1b305rfgpTRZxbTqAbK0BxngeueyXYpvtua9SUbQd5cI8bYpA3cZiwkubq9H+nO9vUA
	QR+H64OWPv4u/7UDGdzdalYOoGN4vDxfjDezEh2WJmlWgGg+dOUmEWs/
X-Received: by 2002:a17:902:ebc6:b0:2e2:d665:6ad8 with SMTP id
 d9443c01a7336-2e87bc2190fmr6225715ad.4.1791816347416; Mon, 12 Oct 2026
 07:45:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
In-Reply-To: <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
From: Luigi Rizzo <lrizzo@google.com>
Date: Mon, 12 Oct 2026 16:45:11 +0200
X-Gm-Features: AclHuK-i8fHHmdGq1sG19E58z4J25P_7xaX9lSE-RrDdVmPDw1ep2a8coGIVdbw
Message-ID: <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
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

On Mon, Oct 12, 2026 at 3:51=E2=80=AFPM David Hildenbrand (Arm)
<david@kernel.org> wrote:
>
> On 10/3/26 23:22, Luigi Rizzo wrote:
> > Here is a subsystem called DMA_PMD on which I would like feedback on
> > architecture, possible enhancements, or kernel components that could be
> > reused to avoid duplication.
>
> Here is a feedback to a subsystem called DMA_PMD ;)
>
> Why is basing this on PMDs (and embedding it in the name) the right appro=
ach?
>
> On architctures with large PMDs (512 MiB on arm64 with 64k), would we rea=
lly
> want to use 512 MiB pages, or rather something smaller (e.g., 2 MiB) that=
 might
> possibly also have TLB benefits (cont-pte)?

I had to call it something... an earlier prototype used the name IOMMU_2M,
but I didn't want to suggest that the design was limited to 2M (it is not).

Aside from the name, the _current_ prototype restricts to 2M allocations,
exactly because too large units are expensive and wasteful.

In the code, decoupling the allocation size from the PMD size is trivial.

To enjoy the reduced IOTLB pressure the architecture needs to support
IOMMU leaves with the correct size. Looks like ARM supports a
"Contiguous" hint, but I am not sure how to tell if the hint is honored
(ie the IOTLB actually uses one entry for the full contiguous range)
other than measuring.

cheers
luigi
