Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015527;
	b=b9ZkHzfn3sibc0UlrLNwYyI1m0hJsYSBHkc9oWqHpWfxf9HcmVQLA26SWKUEd94jMWnJ
	 +KTErlcLNut50KMe+havpDwvYCU4K3intimQWulNjuitkz513Vu1m2piWFP6E3ySmGKmE
	 J9B4CSkyoojQh3bVG4TFN9RNq2KwF4Ql+r0kBHE68CoeCmE2naKZHUOR0PfuNtjGdaTRK
	 9o0xL3I0zneOXOIVozMp6S+OOVSvW1/GhQlss5aQg51HwClXhn+I5++MMBI+0ZiWVbYxV
	 tQN4i0DZHXuUL7aeD5/4RRC0PnZbXGjrodJHwX/c3+ZNk+CEEpZtipm6sBiy9/+AYWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=MhtDXpbRWCIEhu50xIx6ItwVhQLsPfY15TO/C9JpkIY=;
	b=HIKOSguP8ieLMi+pIRhTIW3GlMiUqCCBlIMfYUENz3THbs6mnr2nzRZ6ZKMf7sGX/2hU
	 ZFYQZwWb0zH9Yf67RvcTwLmV4Gye5aRU1dGIpNchj0HCnVxIIp7yVyEuqN7XBZkrrHIg5
	 HTibIJ07wMdkIOS7lKdUeTgZbP+y6osePUlahCST1vctr8jXFzx17geTtjmWdU3SKSJ8V
	 tsWKKS/1Xj+mlSLqEPyXVqGWCas8zCptHpfE/YLBj9YjWuLHQhsU54YYD7I3l4KPTxqHJ
	 Tnldz5ZqZ/NHPM5W4ZWoB6H9TSTB3Qo2o8bbNu1kikwxGXUSnR5YA+0PuLttVygxA8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=dNREM1Nk;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B570660A3813
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 15:25:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B570660A3813
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=dNREM1Nk
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91f23ddf32fso7789446d6.0
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 07:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795015525; x=1795620325; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MhtDXpbRWCIEhu50xIx6ItwVhQLsPfY15TO/C9JpkIY=;
        b=dNREM1NkhaqiuaAkBJ/Vjtd/HxlzcnvfWUrA2PW4UYcgoy9jgbOqIzkXc/L0gLUCs/
         SjmlFbh6hNAeuDQz68bxDEnZzp2VHtMC3T6egltN9irKpTotDtirQzMsUsjQfGMRHxrJ
         odKTGp07NaFO1y7iNAu3yj+N3OA18K6zmzrJ5itixWJNpdHAe1LEXXRPgjW7YE4EJGhH
         lsypL+JyC/HwYF5/5KdEQD2Gn/15aXQerd0dys6sOWLiKAJE9QgoqqpnKCD/EidrL7wB
         nF6BQfPU40T8yReM2RvAweO7UkeCoMdDZsmPaNKU5GKTOrMwlJiiAcyKAiyRdVyxF1ee
         CRMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015526; x=1795620326;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MhtDXpbRWCIEhu50xIx6ItwVhQLsPfY15TO/C9JpkIY=;
        b=wGv6H0AGBLTmOx/cgyfBQZIi3o0WcbojWrwklDLhjQGZJOhHkW9P9BfgHqEc2frIFx
         91a4xJLTdWYMNZ1oFTmXCupl0jsKSco7IgqgEqTOEzcmXym56Z8OdLGnOvO6lzeQr7wg
         CrSpKYBQdu5s8Zgi8a7OrynzK8FL9g5MXE2v6WpNQ13YVQM8hHGHv6EI1nNUk1z/Kn1O
         A5pYRjKEZxSykw7YZaNHzxVft/KZkHLUSKL+QEjW9rK6EYEBRSihYpV/4f9wwzYls76i
         nN9XRY07abIkhE8hPYHDM3Q1QPWbYpBXk24kzoQVJn+YCgchHscOdLo4+JBtaQZnIpFU
         YTSg==
X-Forwarded-Encrypted: i=1; AL+hErHPG87/tfTqCRs+vwZFQe6qX7bVDm/Ta1Wh68t15+mn8HVrfOtjEZizspdz+1nMS2f3EaAiIIqZcKP2Zg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Cv9XhIZTVzeVnB0vXQBu1ETWgxOm47pX8ymr0PzQ64+w85XaP
	CYXB88D/4KDvIUkvx/S8Ca91UOo2ir2lCuZ6EdSCHLdwxaSYJGkRgzQ7vHc1g6D6EJI=
X-Gm-Gg: AZFdTZeUlKxjOfrhCGdNqg9MnATyW9LllZprpZ1b9QfzraOc7h90S4cMceN/9RM5m5G
	dTLioVrT7w3IGRFipxjB3Lf3xNh+9NkSpu+PdlcH5pvLRXQNiV20P0spDfFtHgVagxaJZAEj/vQ
	K7MMrvQMT0yS7VvCakGvoiS8pzn/YQfSSS9QXms+PwpCzgT2GEx3uTOW58TugoQmuwSKH9nH3A6
	UXA1WfI9W60Qf9c7XKiwNfR1J3xJWTBLBWrHi5ySj2fq3jBmZCz+OfMQS1Ph8UzyaDfC+dLKXvW
	SClOHcCw7ZqTyfhNARaFT406OSQbF0ENd3dPQMa8miGutmytDaWiLap1FX++6xnDE0Uti7NgeV8
	ck+cPYftEMbpVfieDEXcl4LTK6N2aRbTTraL48+zKMifoJM3soyQNp9bCIQf6dmqQydgClQg7ww
	ws/tGhK48Gr9JzsbYnPnXfd3lRW1HEYPtJiMSNZ2/azva2H7Ruxkj7nAsU1qV4A2lctq42Gmoew
	UAeifrXk4GuNxvLF9fcijbD+PLmGlzAIzMf0MnNs+utA2U1wPzJByDNpSazcslBb6pqjJOvzbNL
	zLKy9B4NncSx8SvUsPxmT29W+CmyEYh+sbicGZKttYMMYjAF4nMcoiZWIgHy/CBcnufSVyWroHd
	M6tZ/y5c=
X-Received: by 2002:a05:6214:240d:b0:91f:12a4:27f2 with SMTP id 6a1803df08f44-92114c4e8f8mr45557396d6.6.1795015525386;
        Wed, 18 Nov 2026 07:25:25 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921149f9c36sm24415306d6.5.2026.11.18.07.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:25:24 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 13/22] mm/hugetlb: restrict pool growth to common
 memory
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Richard Cheng <icheng@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 linux-doc@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, 
 damon@lists.linux.dev, linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
 david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, mhocko@suse.com, corbet@lwn.net, 
 skhan@linuxfoundation.org, rdunlap@infradead.org, 
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 johan@kernel.org, jirislaby@kernel.org, kasong@tencent.com, 
 qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
 baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, yury.norov@gmail.com, 
 linux@rasmusvillemoes.dk, pavel@kernel.org, lenb@kernel.org, 
 hannes@cmpxchg.org, brendan.jackman@linux.dev, ziy@nvidia.com, 
 sj@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
 xu.xin@linux.dev, chengming.zhou@linux.dev, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, rientjes@google.com
In-Reply-To: <av1PyBvUVJcy_Psd@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-14-gourry@gourry.net>
 <av1PyBvUVJcy_Psd@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:25:22 -0500
Message-Id: <179501552287.1206716.17381960047395782233.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 15:32 +0800, Richard Cheng wrote:
> > @@ -3802,23 +3801,21 @@ static int set_max_huge_pages(struct hstate *h, unsigned long count, int nid,
> >  	unsigned long allocated;
> >  	struct folio *folio;
> >  	LIST_HEAD(page_list);
> > -	NODEMASK_ALLOC(nodemask_t, node_alloc_noretry, GFP_KERNEL);
> > +	NODEMASK_ALLOC(struct nodemask_scratch, scratch, GFP_KERNEL);
> >  
> > -	/*
> > -	 * Bit mask controlling how hard we retry per-node allocations.
> > -	 * If we can not allocate the bit mask, do not attempt to allocate
> > -	 * the requested huge pages.
> > -	 */
> > -	if (node_alloc_noretry)
> > -		nodes_clear(*node_alloc_noretry);
> > -	else
> > +	/* Scratch masks for allocation eligibility and per-node retries. */
> > +	if (!scratch)
> >  		return -ENOMEM;
> > +	nodes_clear(scratch->mask2);
> >  
> >  	/*
> >  	 * resize_lock mutex prevents concurrent adjustments to number of
> >  	 * pages in hstate via the proc/sysfs interfaces.
> >  	 */
> >  	mutex_lock(&h->resize_lock);
> > +
> > +	/* Fresh pool pages come from the ordinary allocation domain. */
> > +	nodes_and(scratch->mask1, *nodes_allowed, node_states[N_MEMORY_COMMON]);
> 
> For a global request the caller passes &node_states[N_MEMORY], so before this patch
> the grow loop read the live mask on every alloc_pool_huge_folio().
> Now the mask is sampled once, before the loop.
> 
> The loop drops hugetlb_lock and can run for a long time. If a node gets its first
> memoroy in that window, the old code would start using it. The new code won't, until
> the next write to nr_hugepages.
> 
> So the pool can end up uneven, or smaller than requested if the other nodes are full.
> 
> I think the nodes_and() should be placed inside the loop to keep the old behavior ?

I can make the adjustment, but the concern is that previously we'd
start spreading the distribution of hugepages differently when there's a
race between hugetlb allocation and memory hotplug?

That seems like a pretty innocuous corner case to be worried about.

I can see about retaining the old behavior, but i'm not sure what you're
describing is reliable behavior already.

-- 
~Gregory

