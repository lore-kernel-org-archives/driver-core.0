Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795782569;
	b=e3BSyCM/VfJEao6b+KTgZb3omrEW/lh7dF0euWyVvxiRfzuO7Ho2nkp0hn9BcnvHwQ5b
	 THYOiJilHj5Oqa0ysSXQLGs5Rvf9A0Wu/SyaWRtbhS/xhLAexI5H9Q0+pnZAGULdzCFen
	 KRAUr0cXpFyUH9loAwXwwrqRu6EJ4PTFPh759ez2o/tUyUCm47caat6zReV6V4OscXgCF
	 wSBOYSPOQX46B5fVWmd/x2Ubyoc9ow+xeAtp7tIsM1s9XIskDBZvi00maoo9xGyajkHXZ
	 AvhDj6iO+dfMolALUUplpC4H1PiatUr3ghXXjyg/jMx7ka7CQzqGsKxkmbaSvlowvLg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795782569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
	b=lALRw/VoS/6ej6mAVND9VMV9kvtmRWLGQs00hwzr7k1q6TmPOpJ8vL1OOTNDyog1qhxi
	 yyT7qnmOhEOxpuR8V8wUb4XuqxQcKAQ1EJJjiG3bRSlRVx2PX7Gw7DA1iS+CHG4e2i9Y5
	 Xvo2mDi47PrXYq0EV8whhUCIGyh9OHTeqrK0mwGJRvZvXyxvHhJg2oryJMGKFdQLYO2l6
	 QNPm6eJLcBk5gn/oBz8xAeb0eMM/F79n0Fjmf6efxllX+rhF1nLZ5q3fZBfPv5QTqcozJ
	 AOYGgapse9T5g7F9ajHLG+QDXyJsEycuaYHTTDMruFZde5kY4aLqNTyfz9RFTm+86mQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="T/zdGZc9";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.182
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63BAD606A329
	for <driver-core@lists.linux.dev>; Fri, 27 Nov 2026 12:29:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63BAD606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=T/zdGZc9
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-55be673e029so1832151cf.1
        for <driver-core@lists.linux.dev>; Fri, 27 Nov 2026 04:29:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795782568; cv=none;
        d=google.com; s=arc-20260327;
        b=CADvtwfAx/Ugxyw0za8m25+f3xto5Rhu25gJQ/gkcbss6Tyv9EgVP3rO86mckgUQ5A
         EVoLDea4SoaxD7jcrxBckTIyLTuAE1lhMAah10merTlsA3v2cXTfGD+Y7X8QHeQV2NZ3
         XKzLKphPisNYQzvCPNxy46tORNUIs+e3hixyMRtpJZ1D7H619mXFXkmw1PB09ktaGhIM
         0huPP6fStX/gxVp4hpzhERS9jR9zIhkbsqZPHQWvmklQ9MpDLAQRmT6hFUshAG80PJ7f
         fm6CYHh+RsPyjIBW172GEfROtj1V78vaIxMe9VmH2fk3I0NxmSR55n6dt1qyuwkS2p5n
         WWOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
        fh=016je1H+2YVLeVc1Sj7IQraQZrnW5RWD1BZ1FgrRTqs=;
        b=FnuLi5KU8KmeZ36yUK8nPytjgE2+4KWEnRTDwKtC62p7uHlfrRT+K+oJoe8Y2bXcgh
         jCiSpFD6OyEkQ+PW0GN8zQwhTzmpCwXlrhk29xb5fPF3bWCJCKOIgSmQTBGzFYcOJsDO
         hqh9DW+480bYNBQatFkZyWeRVTEtXLcaLbdolbQDGHXBYglzgcQ5yysIqtlysuJAWekZ
         ub73ube6t0bjT809Kb4KlAvXIYDoGKKhsr+qFFt8u66fa22cZSCnKduU8DI4RDsko5qt
         6Qw1nwroY8Ln/lbeodpALqGVsGPrBIQuvYjj0CuNPZHGfjUEXdFWOAtr9VQENJIe2XJs
         C6UA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795782568; x=1796387368; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
        b=T/zdGZc9aDnGY7kzcTkj0QT8OHgtKHeol0lhvlfLiLAoXJUXrSj8DIOBRsWOpO7Htz
         A86X0gzsTZXxq5xROKuw3YL08YGpJSeVS/uSYvEfaHQ7Co8wGpqwGPo/lm28Ha7hmifl
         hJubm7ZLAR5KtADQPuz0RstweYXGByzqmKqK4jk0h+JBINMVDMdyhfvX+VD6lhIt8Swj
         QWNe2u5rmXk0Sm53WE6WzXM3WZCR7pAkgHa2txkxbsLUpX52PpCJAbGwiqcXDW4vEGCy
         WBb+/yIDBS528nUmXZGbIbSD8SXQ0tAGXbZt98icKwAiDD3b1EUM0saFB7IUimljC1cI
         wm9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795782568; x=1796387368;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gXf5stEDIYuDZVQjUcNyW733hx6qDRKNZoyJXoBIROc=;
        b=DuztuufEVHPOUQU6lgUqjbvaL5kPK2LR88YDfC7Co0neIStnQfBrMCHpxw5YPN9O/Y
         ZVKJUJBsEvgNvda+kGFGlXEDOjNuravZTZ9D7lFQURL3zmjrLPyy46nD6ZAKDB+whQFS
         Rm86qLBZldDRLnY1NDDWSo+Jlru/jsw5ZmxV7ERVR6iCdTGYcW+IpNqEIPTo9vX8dDAJ
         2BDdzzn2qtw0fs+KOSQxQXvAFVaHggppH43PwzdLFCmHE3Yb/VfTHw3cZEqjIMTlT5cd
         +u+k8yDr9k/8pYnUHMzQWNblsY5hvEYrROgjRmwObYisVs9iOWCAo0wuZti0D1UoRS+6
         XVFw==
X-Forwarded-Encrypted: i=1; AL+hErFJcGPrb0ye3R/00jE9iZCv/7hOp9MLU3owEuLT9iFLs1b0lKECy8fUnGUNsLeIS+Oiv1T0yfL/QDqoCw==@lists.linux.dev
X-Gm-Message-State: APuU4Z++nLdLZfUvkJa1oBCgwXPTu2kX/YhSPKJM8BViYRLUM83W7H0e
	dr59M92rxQ4OIPzY1QWh2H3S7IUJnuInDZONRXCp2TSwTM7Ho1JQggk984CnDAAj1FDiz6Evyor
	8NS0mLhPcLxVkVpcq5tLRxM0quZQ9B+sgOqMyVftX
X-Gm-Gg: AZFdTZcj8Ehpz5U+xDNntZy+2UUEVJAtg1FFkHiF5OlngRsTx/UmNQZoixsd7nUH4At
	PKuFsSVXt9yVGhKFI95MV73TLxFyML+JMNSVJEbAGzs/Yhz+LjY98vxiC4RzHBQSY+MMieQ0oQO
	woPtRLQtUgKoDc//fHYmdavzYqgv2ulpOZcOE+SMdk9cYI4r1Ue3SpDc4/DLSCxFNhsoT9CVZdG
	7VYq0sKsHmRRt43KMfWnI2RDD4M/Flu/1laPkJA2RdhZA72/9Tyyq/y2GjAvRTuxlC5taZRdnrg
	Kt0oSQoQEs0iCU6B9irTgoXFWV3FPESAfaVzgg8HQPa2iz8Wt053WzaDHghaiJwHfWf3iPzpDCJ
	A2UbhxF7P/tWYqFIJnQuFm1Gq8R5YlK3jRb32+Q==
X-Received: by 2002:a05:622a:a14:b0:536:6ae9:f55f with SMTP id
 d75a77b69052e-55d8900bdcfmr34062041cf.7.1795782567558; Fri, 27 Nov 2026
 04:29:27 -0800 (PST)
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
 <20261120135013.GO3115493@ziepe.ca> <CAMOZA0LmZ9PFzxLcc1SuS8piFyZu6P=vX_qR2jy-3QRUoNCUKA@mail.gmail.com>
 <1f10002ea9ee16a17087bd06e4a1685a973fdf6e.camel@linux.ibm.com>
 <CAMP57yVZx=s-JXHfQfd_ouv2jV6MMsJXpxVLkQQHG=7qfFVJfA@mail.gmail.com> <d42bd9452d00a0b2a5b7d6652d556c9fc8d2c830.camel@linux.ibm.com>
In-Reply-To: <d42bd9452d00a0b2a5b7d6652d556c9fc8d2c830.camel@linux.ibm.com>
From: Luigi Rizzo <lrizzo@google.com>
Date: Fri, 27 Nov 2026 13:28:50 +0100
X-Gm-Features: Aa3M54o01jhZM9dCQYVFb8_-yMQWCkVYamRB04RwDLjyCo_Cf-5r3I24fRo_Jr4
Message-ID: <CAMOZA0JMZ8wUrV08YznFUH7AkmyqXcNdzfd26KsoTtzqt69SVA@mail.gmail.com>
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: Naman Gulati <namangulati@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
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
	Christoph Hellwig <hch@lst.de>, Dragos Tatulea <dtatulea@nvidia.com>, Pranjal Shrivastava <praan@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, netdev@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Catching up on a few comments:

On Thu, Nov 26, 2026 at 9:46=E2=80=AFPM Niklas Schnelle <schnelle@linux.ibm=
.com> wrote:
>
> On Mon, 2026-11-23 at 09:50 -0800, Naman Gulati wrote:
> > On Mon, Nov 23, 2026 at 2:10=E2=80=AFAM Niklas Schnelle <schnelle@linux=
.ibm.com> wrote:
...
> > > I think that approach would also align with Jason's idea to keep thin=
gs
> > > within the network stack and to work with the tools we have until the=
ir
> > > limits become very clear.
> >
> > Hi Niklas,
> >
> > I have been working on this idea exactly - extending the network
> > page-pool with a memory provider that allocates large pages, splitting
> > them into N smaller pages that all share a single IOMMU entry. I
> > breifly shared my approach in the v1 PMD series [1]. I'm readying a
> > short RFC to share shortly, would appreciate your feedback.
> >
> >
> > [1] https://lore.kernel.org/netdev/CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69t=
rmw+BJRVYf3JB1g@mail.gmail.com/
> >
>
> Hi Naman,
>
> This does look more contained, but I'd say you should still go simpler
> and fewer steps per series. Some thoughts:
...
> - This is still a LOT of churn, my gut says much of the benefit should
> be possible with much less churn. It's really too much to follow but a
> cursory look makes me feel like there is duplication between rx and tx,
> which is weird since for the pre-mapping they should be quite similar.
> There also seems to be very little integration with the existing page
> pool, rather it seems to set up a parallel mechanism for the pre-mapped
> buffers. Really in a first step I think we "just" want to use a more
> efficient DMA mapping and contiguous memory chunks for the page pool
> and also keep the page pool API unchanged as much as possible.

The implementations seem large because they expose limitations
in the current kernel code (or our understanding of it;
but the proof is in the pudding). Networking for one, since you
mention it: the tx path allocates memory in many places without any
hint on how the memory will be used (loopback or device with IOMMU ?
cleartext or encrypted?).

If we limit to the easy parts (e.g. just network RX) we may avoid
some churn but we will not resolve the problems arising
from reasonably strict IOMMU deployments on large systems:
- IOTLB thrashing (network traffic uses separate PTEs for
  rx buffers, rx headers, tx_buffers, tx headers). Rx buffers
  are only 25..50% of the total. See [1] for some data.
- per-buffer VM exits on overcommitted VMs (same problem as above)
- IOMMU unmap serialization (with strict DMA, I measured over 10us under lo=
ad)
- swiotlb copy cost (on tx and a backlogged queue, most of the copies
  happen on the TX softirq handler).

Also we will not be able to see what is lacking in the current kernel
code to address all the above.

What I wanted to do with my series (Request-For-Comment, for a reason)
was to identify the components we presumably need (meaning: implement,
or figure out where they already exist and actually do what we need)
and get an idea of how intrusive the changes would be.

Then it is completely fair to say that the goal is not worth the effort
and should not be pursued, or to take the low-hanging fruits out of it.

cheers
luigi

[1] Here is an experiment with a system using bidirectional TCP
traffic on multiple NICs, where IOTLB thrashing becomes a bottleneck.
Below is how total throughput (TCP payload TX+RX across all NICs)
changes using 2MB mappings for different regions.
We really need to cover them all to recover the performance
of identity mode

Use of 2MB mappings         total TCP throughput Gbps
-----------------------------------------------------
none                                  440
rings                                 572
rx_buf rings                          577
rx_buf tx_hdr                         572
rx_buf tx_buf                         649
rx_buf rx_hdr                         674
rx_buf rx_hdr tx_buf                  716
rx_buf tx_buf tx_hdr                  734
rx_buf rx_hdr tx_buf tx_hdr rings     744
identity mode                         744
------------------------------------------------------
