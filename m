Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3FCB46C826
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 16:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787589095; cv=pass; b=VkzHh5365w/e935IpdoIb7mr1L2fwLCw5/2gUXBahwI3jtip5Z03+qJatLcTSIkAh5emNvvm0PW6e2C0I6ug0YGOZ4YUUelOjXZaSxJc1iiWnOOYiJGK+2AXyUVqzWTZVhh1BaRuTOovI0FiLTV30I72QXL4kT4dsA8ELis9m0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787589095; c=relaxed/simple;
	bh=roisqT8iKq+LRB/VLs0WzYDy3i23i29fG7pAUt2iNuM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=emdbGrpdBs8uxFM4p4Ncs+CR3uL56Fq7ybcym9IQoOEKdvxrpyYi6wkvqiO58U4aGCtdzO+TBsNuEKeLAUMXVGH4ughvYWrZbcoqFZMZqDsRaf1TGeRdWG/kqw/7xjznk7VrEEMTi1Z2c74ARzs7SOlQPYkxqGLzEQ11oPT6XkQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MiWj5nDK; arc=pass smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MiWj5nDK"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d3b445a84fso171625ad.1
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 09:31:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787589093; cv=none;
        d=google.com; s=arc-20260327;
        b=mCGih95JFYtDEkScCm8FxJGn/TZ+rIj4XbZ34FWvp1ST1zdgPyi9LF81L/OJEG6rL9
         XGdplOmWYdE7OhbEAtw0fFW8qBgrUGeWgygvhBo1d851r+F20FtWQEar33Ohl1wdl0Vk
         yvdHTV7yswI/DcTRQ5ZW/GQ/N5dYvQJ92g/RW6WQN44FsE9IrWCPqoQTtQEhfn4cmbXT
         EgP+mMRWUdjzyLKuqXToYlwhRkNM/ttfuNQ5dYRpqhUZuSiLQdDP6D6iam7Wwo5HoVvI
         Iw9l2Hi967UC9y8BRQu6oMHuNSrdwB9FG5A051tEP5pV7ysU6WBh7uVE4vqHRptTe7+h
         Mk/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q6jDXnJz5bszG8pnLHnZK0KeQdaX8tcSfusG1JTMhO0=;
        fh=2EZ2JUgh6c5SZ/qNKKR9vaa1ZJxOSdYYpjJZrn2KuxA=;
        b=Zp5xu0NC7VYAXphUkLT0OXJS6fNSSfSUDpQKufvtieeZSMQvCK3XlSbmboXPKIj0GM
         RBtggSNKN7f5XKMHLkL/eZp/37f7xKqCwwtIOOHob9de10HT27EpythnMBGlvJgl6Eym
         8FPJs8SF1+V2JrVotyplA6zjhK4N58gTALUmdQpVl7UOG/Wayz+j67pww22bZi9dokze
         gYanobuhebW8zk2ovLIpWBDu8ipej59rrqoPHdbUQkfzJF8CeeQiCcQLq0kCcmPfkj7j
         UtVMvmcNXMUEH3DuqvrryAW11OE+Vu1e718TM0aUssitK7HwQq8DwXwspmCokui6rO+b
         DVqg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787589093; x=1788193893; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=q6jDXnJz5bszG8pnLHnZK0KeQdaX8tcSfusG1JTMhO0=;
        b=MiWj5nDK2fNgG+nHQo1YZx5lRyqVtxkSGj/oZ1NM2j4g/EzJlDCnZYaQphHcKzPnNN
         4SpPANrLNgBtiH2IEDMDfcjOVfy98l5k3OF8pFEBOhDzC8M+vjpQ5OA0VJfMbjuJ44rJ
         WRgHDUIojLftcwGGeiLS0uwh+gankI6LcK/KD2hTvPdER/rb6p+VpdnpFkuQSAHVV9ZC
         dII7/1Lzg5BYiOvF/DBNtcwVzxYXt/9ogrrhUSH7fUrtXq15GAmGp3Iv+E9ZKzPBLHYe
         dm66iQN0BqMCUBfAaH9Pk96f57aWmzPEMzpnkhAdgtLO0K5yWiCnj4tzoZlJXGuR4Dkv
         9S+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787589093; x=1788193893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=q6jDXnJz5bszG8pnLHnZK0KeQdaX8tcSfusG1JTMhO0=;
        b=gCU4wYIFOslupbXo9ha5jwHguttKw44sV89+lFxrImAqvNeAurrcgQfFT9RSCrWaEJ
         qAksbPx4ptY1dqdjZKs+9QW3+dOPKg3N+xG0yAKf7AAzQQLwvy6q1cGrHgKYnJXB/rK8
         Tb5d6+N22hKZ8KZMjvcs1gUaLqUWjh87t6kthSPEaQ2086QGqZvvtumILD67c3XLHWwR
         YC/9N0bvFGGKJvdaPq/L8LNhriSfdqK+ZdJt/GT7GymmZL2ofPNT4AFt2BRvfV1D26Gi
         B+MUkUwUun5rk7kuAY2VX0MuYDjbNndF1p5fosoKFivxou0lFwmW/2yBV+ERvIvDIUCH
         ZEUQ==
X-Forwarded-Encrypted: i=1; AHgh+RoRqIpvCMnIPjTCgCX1N5CrzJOzuhuCPazNJIX5cEjAs9wjD0UyfCtGWdpjbnzX6ELPIfJl+X7jiRalDg==@lists.linux.dev
X-Gm-Message-State: AFuF++mPgKsx2m/3FF+OgN6mTfwhpF1pJSXMTgGpzCk6w4Uy/81yG05+
	fXqu4tLC74UOsxhsWhmmDWuUaj7VMx4yBQP2+uohAeoxBK0eEjL5NxJb6QJhxx+qO0EkTKQPvA5
	kzajb0E0io/6x1hCObyP7gLXWwbXmkA0xfVHUnUArb+DDNFiGxm0ckw2Q214uRw==
X-Gm-Gg: AR+sD10EJqFTGuVk54iRLPBKmLxQ5gECuGhigxse5vn1PO+9hojY1kO19Vr3NlDRjNe
	3BGICW06T3rkt4lspfXbo2f/iVf+AEpPMpLKIfpMcxtbcedsCQNpMC4hXR5AKGupg7jliqBZX2w
	UPQ4Ra0Nuf8DfKKxtMJ6d7xcPWr2Gj9Wyh56TJWmqZ2XbZZk9WnPQeWY8GoBJIxjk75BRPPztoJ
	vzCtVXlyraC9aMvVzFZIyIk91jl76EcUKB/oYPWrXIRJqdI0fUr2y55emwr3/jJcFL5z9u55jSM
	jYR86+UCUNUD0TWKb43ZbLvAPu0+gGpUXXmuklG0Ggdkiw==
X-Received: by 2002:a17:903:3c4b:b0:2d5:db3d:1a45 with SMTP id
 d9443c01a7336-2d66ffd7057mr11511785ad.18.1787589091990; Mon, 24 Aug 2026
 09:31:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615234220.3946885-1-lrizzo@google.com> <20260824152932.1583506-1-lrizzo@google.com>
 <20260824152932.1583506-3-lrizzo@google.com> <a826c7cb-5e77-4c21-a649-d40a9f0ef564@arm.com>
In-Reply-To: <a826c7cb-5e77-4c21-a649-d40a9f0ef564@arm.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Mon, 24 Aug 2026 18:30:55 +0200
X-Gm-Features: AcwNN1XmT87hJkoGkp9jcEKvjnY9kL9lu9ePxKQtYVAUZgS8n1wQenRujPZyI_4
Message-ID: <CAMOZA0JstwiwoWFuFjpoC1W12ir2b=SrWPO9i9tto1rOksKGgQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/5] swiotlb/mm: Implement SWIOTLB nocopy page allocator
To: Robin Murphy <robin.murphy@arm.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Luigi Rizzo <rizzo.unipi@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dragos Tatulea <dtatulea@nvidia.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, netdev@vger.kernel.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2026 at 6:06=E2=80=AFPM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> On 2026-08-24 4:29 pm, Luigi Rizzo wrote:
> > Introduce swiotlb_alloc_pages() and swiotlb_free_pages() to allocate
> > and release compound pages directly from the default SWIOTLB pool.
>
> Huh? The sole intended purpose of SWIOTLB is for bounce-buffering data
> which already exists in some other memory that is unsuitable for DMA for
> whatever reason. If you want to allocate directly from some kind of
> pre-shared DMA page pool to avoid bounce-buffering, set up some kind of
> pre-shared DMA page pool and allocate from that in a manner which can
> avoid bouncing entirely (see DMA_ATTR_CC_SHARED). The idea of getting as
> far as calling swiotlb_bounce() to then have a special case saying "haha
> not really" seems entirely absurd. Don't hack stuff into the SWIOTLB
> code which has no business being there.

Ah I see DMA_ATTR_CC_SHARED did not exist when I implemented the
swiotlb allocator. Cool, one less piece, it should be possible to replace
this chunk witth the DMA_ATTR_CC_SHARED.

The other pieces are still relevant though ?

- use these dma-able pages for page pool allocations (small)
- [PATCH v2 3/5] net/swiotlb: Track bounce device per socket
  or one would have to unconditionally allocate from that pool,
  even for e.g. local sockets
- divert socket allocations for eligible sockets to a DMA-able pool

cheers
Luigi
