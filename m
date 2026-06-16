Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5A143C3C16
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 04:17:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781583471; cv=pass; b=QqrvMk9OFy6XrX9c7/VvuAxJZ85O24Np7HVIaQPp2Er/wzoSwRGbzREc9Bx5nXO4hX44FsL1GYxov2NpdoA1Wp9zDFnGZXrwCD2lDRBWH8dt5IfktxVDMpuHU6Tc7x0nLE6CbM0VKKizZeUY5uDgl47ZyZIAiIYoOtINImRPrBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781583471; c=relaxed/simple;
	bh=UDM9Y2Thjnqa8K+lbXnfW8bZvgfvx5z0YeGl85VJOIs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lzIqb/KdATNu7/MbGMRWpSKd7jb1821BPw6/XK1iB0OmCHzMaoh+DpgvunAP44SEDWI6v3wX5m6YKAr0KtxaeEgpOz0J0WwZKMHWWAylyu+0TsIyEnxNo6bvtLmiANhVx4Yil59LmnGRoGoPfoe9fZts027uItW+4cL6h3c9gdw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=saXQfeRV; arc=pass smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="saXQfeRV"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-915b5ce94c7so451497285a.2
        for <driver-core@lists.linux.dev>; Mon, 15 Jun 2026 21:17:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781583469; cv=none;
        d=google.com; s=arc-20240605;
        b=Pr4xrKDe8nYaJH+uykjK1ZoRvzZvAB+lyjwjqfgovhk3HYtIn0kIY30+yxIBDqvosU
         rLAqLc5z9fhqcdOKR7uSFGo0Ey2IgzbzsIVuUkk9SsLKK63xD+Geg4hrFcVUz4u4XZVf
         Ro8JMyFFNeTVQOfaoNM9n1jlYMMTbDby3j7Bfbq+Ojp1DmIm7BBJDdtbqRdynmi2VBMi
         JlNgZFInuk/iMvn0FwCCrJA4VMNkLiTzNrHwLNInvnfBWhpQHGs0F8GV7t0ADC3kZX4n
         0KmbX0b7yfahEYpaHL286cyfu+Kb0T/xt7amioWvKy/JmZhxrzGhUAtr5Pj9j0GyLqPI
         vuAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c46bC46uTOFVqkvQFgPWAgxQbVfvX2mDmBYTQGj7PhI=;
        fh=ohTasx4AD7CN9OqFCFNCrLmUnJscQPNZjXRCQUnW9K8=;
        b=Nbq/d3uky+2O0dEvCQLvQzWzzKHHI0F8I0Z9hBm+HWcqwKgtHkZ9cXCT30BO0RceMt
         l3vJM2sL+XACblCgjPcl4O5BDHPtq2qDt8RrAW728loaRu/7ysiw4fpZanjhbJm1zFJB
         m6AZRJKbUc6WZ3zkD6JH9VahL+nnEBt5JD8KuzvtMMQBbxZ9E2YDKevm/WHxdp8tzZXN
         NrivM3el2N3Qx1XrdX0y+6qhE1Z4LqYW3QOJccS+j0F6YQSA1OflJZtt3Gr+993xwgTG
         KxJ5Rzt5tnUfMJCRQy/dWEFoM12Zu3/V2kK45kcFXmV749/Dwn/kG7OJew1bJN/TZdRJ
         KhKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781583469; x=1782188269; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c46bC46uTOFVqkvQFgPWAgxQbVfvX2mDmBYTQGj7PhI=;
        b=saXQfeRVS7WnbakhwNLF/FPEHLpX6WOMs2//W0rATqr7k94c6LxvdsSBMBei6XGnzn
         25mKNfekV8zGgSYnRXz7ver1OGWAfS/0Wh3ejzeqjgGZTZO7PvCxITFv/Hp8t/b74qSm
         tUYOJPYfH0OgbqH9HS70ubgwf43QY3aNnopNduv2a/FFn883vsm0cWufngwfNk61ZSMf
         RKQQI8GEAfAXp1G4n13FZT2vgt73taldIbj5GWd4w/at5QOalOujmen8KRHrO/6wiyEL
         c2SSpOy01/LRN0smRiU7oiE/p0Np7Dun/nsTDq+CiCeW/E3Czpb4lJIjMkb5OvbJs87w
         sgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781583469; x=1782188269;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=c46bC46uTOFVqkvQFgPWAgxQbVfvX2mDmBYTQGj7PhI=;
        b=fXVtanjtulHbS/nNCLCSAq+hNlW5lPQ28cyDyn2g5pO7ELQYpwgZ7magRWN6RSl1ZG
         rORW4PQbZX/U2QDGXiicygSduBZ+dM2cE4lY4SK8CWQbiXM34LteQ9KE5Xp6WzQOtStq
         lOPSmoTOPbfW2ODYQE2GDcxa1UuKaY2TJIxjaJS4BrUn3VJiSis4gTkxyFachi3Bbimv
         MKRqR3PBva+M2/1ei567Hmm3YjHRyoHfgsHw0NEDB+Awnwz9aKaGL0rJfg44m6YGzG1u
         6IaXnfcmhd8aX1Hnt37FA+usTTeFHfAc4uusly3v4qKGmjl+hM+j5gC8v+9pjActUSMz
         Gqew==
X-Forwarded-Encrypted: i=1; AFNElJ8gwrbG4RWT2TpsZnu/alLo4a5M4czLpc3A5X6GU39njG0iUMp8s5nge5hWJ0a50Rno0bFjsjhsODXatw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyv3M0AdHhe4ozCOi9/UBCfsdvY3D8mj4Bx5OhUOrn0UGBEUfCJ
	AfJ4V/W8kXRmvbZ5sg12IhNn6fh6ToXbKpeUh4eA491pY4nIhggZRV9ilLy/99KgNb7jy3oc3ia
	UPHH6kng1HVmwwmafnfS7Nn96YMCr0CAbkYyWMdDz
X-Gm-Gg: Acq92OE7EXxyTOgY4OfqPcc7LhIsHwyihGRIl1+jpIwSyd2i2k01O6yhLea7dK+LScz
	8JnH8Gp2rk/5/Ejj+fRRsDb6XhNKCg9DmnT6cYWf1WySixnEVDZ8moYdO7ssjBKyuj/4aX2hmo8
	7NOB1tiFbDS8a4gAfuHafWt397HVuEw6awNmpaenDUtoGkRNwWjUsPKgzIiJyd1IvraHsDjRQPB
	ecT5DJpbsf/eRbIsF/2Ad1MoM/1kgFJhcY6MsXnsTkfEwIKM/S61O1BW/xHthYeqdQgzHL+7wjR
	ucpgT3nby6NLUM89sdmdssRDsviMIIjvd3net63/XYEHtHGKYUZZTZz5ESw4iP/fMmoS7ml9zII
	PhJRagLzsZOPbqujAzNezcf39JeBt
X-Received: by 2002:a05:620a:1a07:b0:914:e3dd:17ea with SMTP id
 af79cd13be357-917ee4d8a24mr2288565585a.12.1781583467792; Mon, 15 Jun 2026
 21:17:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615234220.3946885-1-lrizzo@google.com>
In-Reply-To: <20260615234220.3946885-1-lrizzo@google.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 15 Jun 2026 21:17:36 -0700
X-Gm-Features: AVVi8CfmRRXK2sLRb18EI2J6HVHIs23OmkonKcsJiFmkB68hhvaCXbcTPeeXIKM
Message-ID: <CANn89iJabdK5rDpZ8NEXY=_hF87dpjqksh4SRruGnZ=pReKTiA@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: avoid double copy with swiotlb on tx socket
To: Luigi Rizzo <lrizzo@google.com>
Cc: rizzo.unipi@gmail.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	willemb@google.com, kuniyu@google.com, davem@davemloft.net, kuba@kernel.org, 
	pabeni@redhat.com, gregkh@linuxfoundation.org, rafael@kernel.org, 
	akpm@linux-foundation.org, david@kernel.org, netdev@vger.kernel.org, 
	linux-mm@kvack.org, iommu@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 4:42=E2=80=AFPM Luigi Rizzo <lrizzo@google.com> wro=
te:
>
> The use of swiotlb causes an extra data copy on I/O.  For tx sockets,
> especially with greedy senders, this has a high chance of happening in
> the softirq handler for tx network interrupts, creating a significant
> performance bottleneck.
>
> Allow tx sockets to allocate socket buffers directly from the bounce
> buffers. This avoids the second copy and removes the above bottleneck.
> The fraction of swiotlb buffers allowed for this feature is set with
>    /sys/module/swiotlb/parameters/zerocopy_tx_percent

Strange name, because your patch targets the regular tcp sendmsg()
path (with a user -> kernel copy).

Typical high performance RPC libraries use TCP TX zerocopy these days.
They won't benefit from this idea.
Perhaps you should state this in your changelog or documentation.

Also, what is the typical size of the bounce buffers in your guests?

With standard tcp_wmem settings, each TCP flow can consume 4 MB.


> (0 means disabled, 90 is the maximum, to avoid persistent I/O failures).
>
> Implementation:
> - define a new page type to unambiguously identify bounce buffers used
>   as backing storage for socket buffers
> - modify skb_page_frag_refill to perform the modified allocation
> - modify the destructors __free_frozen_pages(), free_unref_folio() to
>   handle those pages and return them to the pool.
>
> The savings are especially visible with fewer queues. In synthetic
> benchmarks, senders with 1-2 queues would cap around 50Gbps with
> conventional swiotlb, and reach over 170Gbps with the feature enabled.

This patch is too large; please split it into smaller functional
units, so that each domain experts
can focus on their part.

I see you test SOCK_ZEROCOPY, but some applications setting this flag
can mix tcp sendmsg() with or without zero-copy.

I also see your patch missed CONFIG_PREEMPT_RT case.
