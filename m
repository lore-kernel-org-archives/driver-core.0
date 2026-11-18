Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015260;
	b=ZaLuAjE2vPiQwe0Bk/7P3g7XynBBltQE6aEmRmFxzUKWS88XiQB5xF7WiH89C1075c8q
	 IoCaAaXyxHeocF2DNycVgY5MH4Z+xCS81vfryhU2GugA61aq4G13NXguQKfvy8pVLJZ0j
	 5obRlODu9g2RMMedq1YULbnlvifLMlazLi3OFii9XeGLC2JtzFJzLim/wPT3bHYmEaM+A
	 2KPnVUSj6hZ0Z0Iff63NOrUXHGq1SgtIvoDQPn9gwmw3REW2sN15MRkrtBYSNOnqvVraM
	 q+Ib/CwzV4JPqeo2RL0pgj/n6KkZl/C5FiZyKpePAyP+E5YPNeld93j/wyN21LmEVAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015260;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=2f1/3qPELFtVfaXBFluo86ffYBKVD1HppO+tx/i4yJA=;
	b=bbZ5mHWfw7QH0s/GzwTIFANRWfsLjmbiQQYPlzR+yrQWwh6z4pXGi6/on1Yij5idt083
	 V2O9HspanRpN8VlR1KCzCCHfkGXgTlKYgI8/msSPTFtMgxdvzVCg8swYtejxC+EkKLbYF
	 P3uXBnKskKJjyKpPwY9E3UWRsRImGAHsI/n5jDZxmzHRhISLn4hIcMvwMTOPVb1IuyXwx
	 Vzd8v0zNZ4MgWh6sDEyA9zkX3WGzgKeb4b3/q6u3XYXYU9MG8uY2vtP0/r2bibl8QqNGb
	 PfjGk6p5aUMP6NcYPm8GAicaMw+trL4VOjj6ajpOPaVlRKHRRTlziJyfpA5yLDvxVpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=KuPzvaM4;
	arc=none smtp.remote-ip=209.85.160.178
Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD20460A2605
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 15:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD20460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=KuPzvaM4
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-5495d549924so12040571cf.1
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 07:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795015259; x=1795620059; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2f1/3qPELFtVfaXBFluo86ffYBKVD1HppO+tx/i4yJA=;
        b=KuPzvaM4MzLXN8hnKaKXCzxpPkoYSIzSJxAOrCHnBsmtx0X3qnvrYypyZdiIaMiVPZ
         aDxZZJazedE+rry6iXrbL8QAKlSsTWb5B0UlZBrUfhFnp9fi8CPL5aEu26L3bSOfggDK
         qFNDC0A15Iaf3kHwmghqPrhDPkup3M5JWy1yu6LHpyd09SX9m/8O5J/CdP5kCvyPtKaA
         ydYRUyDPnJJqgDNY9TzgcpRKAZDtyZl3IMI3PwiLb0hOJeK3cRAiz7vbMplr0ADPBPe2
         DvgjzJJWOGhTE/wenupqcJp05McD62imL+ff/TlxW0rYvftVRYXsVdGvmpxjiU/f2yrY
         vzAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015259; x=1795620059;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2f1/3qPELFtVfaXBFluo86ffYBKVD1HppO+tx/i4yJA=;
        b=R4QpwK1LBdgHeYVTkLiQn1Y3gDuAobG4J5IO0udgu/0hCAiMc9j8RAbefSsw/BZ56I
         1UxuQVPvdXft2YW1Z1aQrmAwWp3e6dduKonNvryScDAMZZH7Y1WvBbhvw3vQWd4sk+mW
         Amh2hHVWqmThZ/OKoGtVH1OD7vtcPp3wlckPO2UAe6tqhNRGObBXsBEsazM5sl/ScxjK
         yB/P9VWzYLPSebZ2NRX/pmU6V0PAsqL946RxNUsoINEsTaZegLBtokj4nBP1axJgrsha
         lbnX31BaL8fhYbd0NbNjsOV5Zq6OAsT6KMIwftKrF+a7f0ShMbAo7DIrTBtY4EWV8bgq
         Eg2Q==
X-Forwarded-Encrypted: i=1; AL+hErEG/ORvR+Cx0TQIzaeNujuYPWbaBS97Lci61em1cCAYeWQxHep5LbT2xPwEqDYivhOvYzAefuCje5lBVw==@lists.linux.dev
X-Gm-Message-State: APuU4Z93bEcQhJpvZKUrIhz0ZoRgDKrTI39Gm1fthfwVoyDA2Cl7UOaP
	GmXRjskzcb0ZuwStGO851pvfWIlUGxpbwWBJw3ZxrSeGGXj6rP4IUiCjjwYO+dD0TAE=
X-Gm-Gg: AYBFou2G5HJe3t3/NI/hu73bF/nwYJe17PmhmzyQ2BFyCCnUDZPIh3dYfDx79NFSequ
	BORud82qrneTZUX+6v2YRLv4S0tYYBErPdmiC+d4Bc0KsElhEJfJGpSWQQRrW2Hg+jHKnw10FxL
	P4Va8DgBwlEVxEJbbMUWhttnMDUCKgTg42/t9kYvVB+gLxTbtyfh66EYXMbZasC1tLQZCKRU3Te
	esqM/uoCnADTM4HKehvwfbVSLmRFqBHWgfQZYAvdDvSHL+YMzj4GShetXbdhu11laNyo39vIzNv
	6EX6vAZ1wApEi6sWLalmekgcyFoqU6UzuEusEOMEZzyJX5uCQMd2cegXdXIPIY82jwZfEHFAvAY
	JycWPym8v7xBqOBoloJmhx0FobuXLulZvS/2NkGm45CNC50SQKnaiZLoP6kChROaxF8eIrBE9EF
	FmubVXSTHeweR43uFWJgyQXnHr5mXO7Rhz8Vbj/OeiWM+820bo6KqWaIE/2FfnAvw+ywjWcWg14
	V2FlpvYb4dkCmBcuznfnHS9JGYLpQ6urEoaJIW5vTwWiTOiz7PxK8Pm+Vq/Ortvvjz8xfxc8pOv
	K5hcFft/RJ8YF04VItDwnvc+Dec1pEQob3DsF3l2PHBOo9ZulmpzoxRPuG40Gn6xpHAYNfpnWCB
	3m0EjeHw=
X-Received: by 2002:a05:622a:a0a:b0:55c:66f0:5bf0 with SMTP id d75a77b69052e-55d5a656766mr42047121cf.39.1795015258621;
        Wed, 18 Nov 2026 07:20:58 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921167f4725sm19632976d6.44.2026.11.18.07.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:20:58 -0800 (PST)
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
Subject: Re: [PATCH 02/22] mm: publish and clear node memory states via
 helpers
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
In-Reply-To: <av1ZBTpLpJC6DJqA@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-3-gourry@gourry.net> <av1ZBTpLpJC6DJqA@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:20:56 -0500
Message-Id: <179501525661.1206716.17622543796948053737.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 15:53 +0800, Richard Cheng wrote:
> >  	/*
> > -	 * Check whether we are adding normal memory to the node for the first
> > -	 * time.
> > +	 * Publish this node's memory states, including any newly-normal zone.
> > +	 * Hotplug never adds highmem.
> >  	 */
> > -	if (!node_state(nid, N_NORMAL_MEMORY) && zone_idx(zone) <= ZONE_NORMAL)
> > -		node_set_state(nid, N_NORMAL_MEMORY);
> > +	node_set_memory_state(nid, false, zone_idx(zone) <= ZONE_NORMAL);
> > 
> 
> Um, so I am not sure how much cache pressure this will add, I assume it's small ?
> 
> Just want to point out that the old code only wrote these bits for a node's first
> memory. THis now does up to 3 set_bit() calls on node_states[] for every onlined block.
> The result is the same, but node_states[] is __read_mostly. A test-before-set in the helper
> would keep the old behavior, or if you would like to keep it, please address in commit message.
>

Hotplug isn't on a particular hot path, but I can test N_MEMORY before
setting any new state and just early-out.  That would keep the behavior.

-- 
~Gregory

