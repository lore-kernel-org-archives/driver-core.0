Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795182618;
	b=g3F/JHeDM53cMYGxcmrk1Lcg4k5NEnNkPO4jSnvFJj+/UGMU3qO2lKov9dpwJdfx7uFq
	 3pW+expFb+sBCoP5VP7ce6qIlTVB98yfBrx9gXJ2F1Pmy2GKrPUlGZuZcSRKz6k2W3+/b
	 ewmpGPRIOJikET68+cp1m7UScrqZTReYopELc8K3n9Ib6bW8bbi8UO60c9yYlk6AiyBCE
	 M2Xk3QbopR7bV0J+iMMLZsVmKCjUUcpJvPEpKUuq4O6nlwgyJSpruXCmmPIGNUb7hXUqf
	 Y7v2sjvvc4gNojV4jcCaRbzP+xarHSq2IMl1xf62OMRni2laB/T6rlY9827GaKGpEBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795182618;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=uU+g78pFe3woDmujMNPfhZ/0Qi8mHsxDvK4Ws3nTpkw=;
	b=J4i1phITMP3AzKuD09Sqst2UmXvO4THHENukTDSt4GQ7KkMVzuPMuMJjjQdV7r44mc3H
	 KtW+P/E3CEmE6qSjMy7XEyE1f0T4hjepjxOTGSFL+62cObcAamayV9fA1C9CFYJ11fzyX
	 sc+UAlYjQFZMHJf54G/DSpI6Oa71J569ODCOUaVSk4nlRd4BzLUmXqzf2DAz6+UscLxpj
	 subkRn8xwyduAkUa09MmKrATYeg8dxldha/lmGde5ufihrAD/4FpAjMTD0LTVhZ33RJs+
	 WO6WGHlI2i4g9NCruPfqsqf9Q12ZDdXM+Rb/0d+h5JwrRme1KO+acZJppg90HA+sjMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lkJrv0d3;
	arc=none smtp.remote-ip=209.85.219.50
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E683606A334
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 13:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E683606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=lkJrv0d3
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-92125687442so5602926d6.2
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 05:50:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795182616; x=1795787416; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uU+g78pFe3woDmujMNPfhZ/0Qi8mHsxDvK4Ws3nTpkw=;
        b=lkJrv0d39cIPbPG1GPtPJ4hIBEb2p+iAP2YiSRUTHHMcFyFCRoYVjfqdoWNPLCex37
         QtqxNFu+1DZBoRFjGxdF7qPG262ykBqUiqN0nrqCtPWtTedPXXXy9DoCDdsQ8DU4CXZX
         LgPpsLL3VH0i47KlGw7/viilrIIIK5JklcA1c882l6tcpT3fzzyVp39i+UfOFMY1qF+k
         px6jADzT+3yyA4fYCnh51NeX34/xhG3I9MWtbam1/R2yML7CL8hW6f44PF1DxLllSSAq
         nC6eI4J6YoCAfcSWYoRTlbZm/inMDo8o71Xn1Ldev76kRI2ehox33YEFVk0VwzZGamt1
         lbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795182616; x=1795787416;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uU+g78pFe3woDmujMNPfhZ/0Qi8mHsxDvK4Ws3nTpkw=;
        b=ARHJstPoCsfspoGBSNQtQ/z9lmNj/URjjJneJPal1CRKQ99ZBGdpziBFwC/oXhq6/T
         aAeQJtiwQtQu2wq+xUOrkLuSxOHpJxVlv704bd84x/aykFZgafKROSbk5w71Zr2vVKax
         Iu9p1vWgmPUi9bXnyH9D+bmP3vCBSWq6l9dnjo/Vppz+xHIO5LvDVRR8kO+770S0y9SP
         3GISVhZyxCHWT4gKvgXPRub85oMgwOCq8QNR0BpUcGnrmsOvKs9xjki8CV833udg23S9
         kctGxCrGWcNNO6zBt9p5DdX/LihhaLW+K1OZdnLrNsIz+M6bCs6GcsRtNl4r0c8kVd3i
         nr0A==
X-Forwarded-Encrypted: i=1; AL+hErHyB9zYTH5vs7CZs2oLad5S1jkb7KjRRpYHnb1TJGAh9T6WhyfEcRHFaDm7R3jmBzuQgRX6OV9PEh9OKA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/cRvsklSm1VpdinwSwLoORH9rcba9Q9KL0vTmK5DP0pQTDLjGL
	aozVKMJqFzzgexJjXM4anWTySLqUjECQmtAaymc5nkZDm9RgaKUmYmjQkEJ7T92Gq9A=
X-Gm-Gg: AYBFou3uVbaA3HMrAqmGA7md9Vs7bKxmDId7+odvg8PpG3oOZTabLB6PubeycpKdkCE
	5pE4nO0VpmXpuDmQNedfm5jRI9reeP81A+VTDp99WvzpZ7onpVzFfRx2nsgTjuh4OLMkOQFXVNX
	zdeLlzVGrxZL8PG6VF1QdfltZu0lZrBHz4KhETNbG4Hj+cxaeu0efRmkRzC3VTYBpFidKOWfCpo
	PQMZkkQdQRR1Pcd+0GbEZglcpHCVUZMkxTh3QgyYplx6sQu/4nA+NT3hBTwOrHKunPQwPpqGJGk
	kvjdy4dm1nVQw31+9VwC5dpL1ekIqfWF5q8rV95A+PL56oZCQnZp+e8empmVk5ZJFlz8Q7Qpbn6
	MxFgQD+USbvJLHKpFVAyaj9vCq72XJTCVHT0jSVxMHzOlBkFO66Ogb+xagrOqBLyvx9ihnyCOy0
	EH45YhhtXpYAdEpH4HZRSeWpmgvmtKapM+6Z5CbJuTVMyYrHHKMHnSxBEEocC5l0S5H1Q+6aF1g
	BsZHHQdwo91E3DVx9pcL0psyANnHCP4HoouqddUyc4ysoqnkjILnuV+Wgh8dILTLnL9CXLxI0aE
	Z6L0ZQ==
X-Received: by 2002:a05:620a:4111:b0:939:5cd5:e243 with SMTP id af79cd13be357-949ba80f8acmr491343985a.6.1795182615989;
        Fri, 20 Nov 2026 05:50:15 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3f7cf3sm190597085a.31.2026.11.20.05.50.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 05:50:15 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xUP0H-00000003hHG-3ovL;
	Fri, 20 Nov 2026 09:50:13 -0400
Date: Fri, 20 Nov 2026 09:50:13 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Luigi Rizzo <lrizzo@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Vlastimil Babka <vbabka@kernel.org>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jens Axboe <axboe@kernel.dk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Luigi Rizzo <rizzo.unipi@gmail.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Hao Li <hao.li@linux.dev>, Matthew Wilcox <willy@infradead.org>,
	Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>, Simon Horman <horms@kernel.org>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Willem de Bruijn <willemb@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Christoph Hellwig <hch@lst.de>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Naman Gulati <namangulati@google.com>,
	Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	iommu@lists.linux.dev, netdev@vger.kernel.org,
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-api@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v3 00/25] PISA: Pre-mapped IOVA Superpage Allocator
 for DMA and CoCo
Message-ID: <20261120135013.GO3115493@ziepe.ca>
References: <20261109182533.3594984-1-lrizzo@google.com>
 <20261120010655.467825-1-lrizzo@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261120010655.467825-1-lrizzo@google.com>

On Fri, Nov 20, 2026 at 01:06:30AM +0000, Luigi Rizzo wrote:
> This is v3 of the RFC previously posted as DMA_PMD [0], now renamed PISA
> ("Pre-mapped IOVA Superpage Allocator"). The text below follows
> Documentation/core-api/pisa.rst (patch 25/25), which has the details.

I thought the conclusion was to just do this stuff in netdev pagepool,
now you come with an enormous AI series spread across the entire
kernel?

> - Needs bounce buffers: in Confidential Computing VMs, PISA allocators
>   pre-decrypt 2MB pages in place, avoiding swiotlb bounce-buffer copies.

It seems this was ignored too. We want the bounce buffers in CC. They
serve a security purpose. You cannot loose control of the shared
memory buffers have have them leak into SKBs, user mappings and so
on. It is not secure.

I don't see how any of this is valuable or necessary for CC,
especially when we really don't even expect to have an vIOMMU for CC
very often..

Jason
