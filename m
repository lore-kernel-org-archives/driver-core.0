Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05D2D3B5846
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 09:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781603356; cv=pass; b=GaEGhavP5e8wjvPbAEx4oXpVfEzfg4DAlB3wTsQLTF/v6giBQuEs+gpPH/Uwi2EhvvDA7OfA/fWqKoy5vDp3bqLRpCYMcCd/9poK/dwLbg20QyyaT/TEz5ZPriF8JByKy1jo/943ZblLa/nn5enYR5gCuU8QmgxfK+hv7J/Grsc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781603356; c=relaxed/simple;
	bh=QjEqLU00etgxuyHhjOjo1O1DD6A8WJ0GvFeC5XpYtfg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dpCG3tsrUo6GgnpvJV+qskHSq+yDZJQQ1z5eSoIWxAEFesMRn2g+wyfnLPm0pccSutHMlxNHDE9drEjHsrUVMGgA1a2mRA92Pt8Jko7ubCWxMYdqtjbAkUSb7L9IHMLu4XysU+5JuH01WwdZP5R9/0ig0Fpuh+1F6wVoXva/ETc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tUGtd67k; arc=pass smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tUGtd67k"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5177d1ff061so52741cf.1
        for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 02:49:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781603354; cv=none;
        d=google.com; s=arc-20240605;
        b=A3GM+bqv3nJ1tH1RtKdztxgIdmw1U+Nlb70Jrv1jr/qazMlMjdnWclwwaW9W7qLDu7
         YnGG9rX9ZXkacnorkXH7p8WRoFLFQjPk9ddRJ18xvhRXCIH9lafwoQVY+2DB8ExHzISR
         ZV81UHXfTuVGzTFHwKsEXGgcYuhb1xQdf77KfBEAgMFu+SE7zclORyTAX/EVQYl7+MJ2
         bKqDofB2QVR4W84Qp/EbDy/aqnhdriWRQW1ZnjMPGGjMMCewWIHFLUZiqV5UIDj18nQ6
         PJMn+mgSbv6MpdXhkbczzZgxZ1Ak+USN7GlVt+z4irquzvE32ORA8WDXGapk1cC3jo9b
         sTkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2/X+IQDU5vWc0Utt9YT+71W3AhmdLwN2v6pALPN9Aqg=;
        fh=CYwjFrIKxVguWNqJuJl8PwJietahoy2KYJgNfXnHd44=;
        b=f0CgKt7ev1ajI/q64GN60+Bzg3X6zc/gW+xlp4646ebeWaJ0nTNgiIgCMVCeBNJFr1
         5Vw1SJcyPpU14/UV2x5ECg2ieM9141rb1vWKi1D6nilvG9E6vR7+wZZDE4qFpTfDHxT0
         MRuoSgV3pGiOWy59Kw74qqQUTTWBsSSYE7O5ZGXOdXpnL2L28IFyGzEgvzRV7MJz1sJl
         m/J8Qlqu4Dzq2GidXCl+AYTszcWY0fGwfMffKBOsMbEZDwCtnjxtU+fflb6Lml+SZxAI
         Hu4fNOo0qMVDqRD26wNoEK5TAWE0ELVmEJCLC7ADBU/DMGh+na7PwLdSvI+kVFfjEIrP
         Dqcw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781603354; x=1782208154; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2/X+IQDU5vWc0Utt9YT+71W3AhmdLwN2v6pALPN9Aqg=;
        b=tUGtd67kqJ2cyUSjhkw93Ahu+/Tj8T8pHGJJO+o21fpPi3tOBkWR9hGsZZlv48UdId
         676OXb1B0lkUmL+pEDtal0I7TLfcZa9ClUkbysp2G6rJJm3WWTDZUovOOBs5oX6OoKGg
         +BCBUyeJo6FLKotAOxB3Gghme2BqT6ltQWsSY648lA92AG9iiJBst6uOnj4XbDTWTxWF
         sL0Z6jnfKxs5Y6az0dmXPZnBAoTCY3aTjClLccLMoyZ0KJ6BWJJdb3+8DeLMxP8tlGSY
         3FQn4ICOR/w0aqpnyTQkLtGjyzf+UPKBJ0FZ/yqUqWmGfBhuzhR0XYkQYLYE4pHZJzuH
         WR+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781603354; x=1782208154;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2/X+IQDU5vWc0Utt9YT+71W3AhmdLwN2v6pALPN9Aqg=;
        b=Rlv5/AUpCpHNYm5RV5unaOTiSkuwG8EtdLR6/w1pNVDn/5GcVsoYCtBhdVocym0mIz
         zqSu8hiA8Cj2m7ocZ/YhwvVxF1fIQykiasR+itKn8JnLAzolLfKSCNBRf63MIZszEmbU
         iE/tUa/OFb0acm0tsH6PKSCRvwfKR4TqHi+E9rAPXbUSFBMZfB+7OtrXddtPg5wSSxfk
         655t0rsMPr/3wep9xfCX1lUK9AWtdQGGnONM/0O9xlpZ5YGdtEZUxRbfZbUgXjVgInKe
         yJg0150mmeTjsl+w8AcA0jRqV6WXuJwPTmya6PW5ksTjvf34YRX/bZ4DzJRPzX98lovh
         JZAw==
X-Forwarded-Encrypted: i=1; AFNElJ9TKfMg1vG9SC/DZ4esYATV7tgR1qmQnQg5eeISGXM+tfDMVdTB8hanIiQRcuwN2w0/XjGa4imO13GXfw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzSHHFULRhTFt6QfGLKkkDaTEVbka1bYCLWnw0pf0NS1RcnKfZL
	mYSbfc885RlYSqsz8cQ1bahX+E58mJElO64n8nB0qoWdyybYBvEo4a9YQzDWHhDM4DS9ejZeGBj
	rZyj5qWaet9mD2Vk3OrAHkzXEUuUoaotc7nyuu+LW
X-Gm-Gg: Acq92OGWrQTX+EzX8n+VQX8X/NbBgoewkzpNiHkjxdnfc/ARtHcnMwOTeMAemHwn+9U
	Ekq8zXDs/nw71agxLO3SU1fpDi1LwBxtnxNPgpbMPkyu9lFJs81fIg9yOG6kPl6cngYT7rLGjCZ
	mk2YDfOJ7bMwg5mAlcM0n+zwvHtUzMQi+cHizCU4XuHe08xnVDyyWg8XhHdYnT+IcWzM1CK/YZn
	x6gBXfOH8+rooBqg5l7b7sBWu0rSHfhkEx0yVTNgptdDPcRl6DVDRdEufvDUCHlkxr83F4RateL
	kOT5caQ4
X-Received: by 2002:ac8:7f83:0:b0:510:f9b:fb5f with SMTP id
 d75a77b69052e-519904708a9mr8164151cf.16.1781603353313; Tue, 16 Jun 2026
 02:49:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260615234220.3946885-1-lrizzo@google.com> <ajESl4osXP7roz5q@pedro-suse.lan>
In-Reply-To: <ajESl4osXP7roz5q@pedro-suse.lan>
From: Luigi Rizzo <lrizzo@google.com>
Date: Tue, 16 Jun 2026 11:48:36 +0200
X-Gm-Features: AVVi8CcHZ3OPXbKC4trSPNuaSPbYaO79J7ToG8S7bAu191E2DonWT9FNgV4gu7M
Message-ID: <CAMOZA0+L2+=FEQ5ORvv07JaJix0R+6Q6u01CyMKCbd842To9nA@mail.gmail.com>
Subject: Re: [PATCH] swiotlb: avoid double copy with swiotlb on tx socket
To: Pedro Falcato <pfalcato@suse.de>
Cc: rizzo.unipi@gmail.com, m.szyprowski@samsung.com, robin.murphy@arm.com, 
	willemb@google.com, kuniyu@google.com, davem@davemloft.net, 
	edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, akpm@linux-foundation.org, 
	david@kernel.org, netdev@vger.kernel.org, linux-mm@kvack.org, 
	iommu@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 16, 2026 at 11:20=E2=80=AFAM Pedro Falcato <pfalcato@suse.de> w=
rote:
>
> (+cc page pool maintainers)
> On Mon, Jun 15, 2026 at 11:42:20PM +0000, Luigi Rizzo wrote:
> > The use of swiotlb causes an extra data copy on I/O.  For tx sockets,
> > especially with greedy senders, this has a high chance of happening in
> > the softirq handler for tx network interrupts, creating a significant
> > performance bottleneck.
> >
> > Allow tx sockets to allocate socket buffers directly from the bounce
> > buffers. This avoids the second copy and removes the above bottleneck.
> > The fraction of swiotlb buffers allowed for this feature is set with
> >    /sys/module/swiotlb/parameters/zerocopy_tx_percent
> > (0 means disabled, 90 is the maximum, to avoid persistent I/O failures)=
.
> >
> > Implementation:
> > - define a new page type to unambiguously identify bounce buffers used
> >   as backing storage for socket buffers
> > - modify skb_page_frag_refill to perform the modified allocation
> > - modify the destructors __free_frozen_pages(), free_unref_folio() to
> >   handle those pages and return them to the pool.
> >
> > The savings are especially visible with fewer queues. In synthetic
> > benchmarks, senders with 1-2 queues would cap around 50Gbps with
> > conventional swiotlb, and reach over 170Gbps with the feature enabled.
>
> I could be wrong, but I genuinely think that the way to go about this is
> using page_pool for regular TX as well. page_pool pages are all dma-mappe=
d
> (so whatever swiotlb optimization you want can be done there), and the ne=
t
> stack already has awareness of these special pages and special skbs, so i=
t
> won't Just Return Them back to the page allocator.

I am not sure I follow your comment above, can you expand/clarify?

The problem I am dealing with is that the copy from the socket buffer
to the bounce buffer is done in the device xmit function. Under high
it is almost always done by the tx softirq.
This means that even if we move the copy outside the HARD_TX_LOCK(),
it would still be almost completely serialized.
Hence the proposed method to make skb_page_frag_refill() allocate
directly a bounce buffer (under specific conditions) so there is a single c=
opy
done directly to the dma-able buffer, and ii is done  in the user threads/C=
PUs
and is not seriallized in the softirq thread.

I am not sure how page_pool on tx could help here.

cheers
luigi
