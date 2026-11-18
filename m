Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017377;
	b=jHci6rEcKMo0A96ZLQYhZl/OsZpiD8Pek2qLmtNvtWe6NpIBj3WPQRtv4DMZScDAXv9P
	 VR+WlGlGJMoSIZFutTgnq8FPYLmN6hL7Rq8ZH45rp82GXpvBi3KdDelUaNOsXr1Z8gdlm
	 rWWMVnRGZqbQa7U3EluBrLS/z8B6bZ0CWx2hMLEUIu0W4uGpZQz2sQk8qqM1H/SDRdLuf
	 ChpgA15IMK4wUhPoLzzJ+T4rDehuBddUOMz/MOXuQ7ZbzYr45ng76KSh3TagFfbgHXThQ
	 8L2JClDTaGiU/ulwJabHjjoZABIpidMw1bxy6qTN9ropPWJ4qAj5NfAQ4zs90otCLkg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017377;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=3bQBfuPo4+GA4H58G8tofWZlnWMcm4hxNRzjXZBoZg0=;
	b=aylyPo7PTQg1E6dpJDiidcsofJMKqKfU2LEpczYOV8slyYqluF3pVYO+y/QQoBa6jPDq
	 ClHqfsXGPS5kcx0LyVGj051YDdtjNjiAz5IvRrlDQZCct6Z98apdhVkRQqow1jZtTqI6v
	 H1Soa5brxpumOw//1daLdKnezAtfCoUF2QCWcixqaNAONUIgB9jiiKdndhbv4KbM3zN3h
	 6B/+sOBjasTTZTEAsSx2mDs0KE2l2zPSR9Lsfy1XrWyBbf0J1Qcoo6KitQdCRtv8wRpze
	 H7RKW/6JNTPNoN7Wk41aSJf+e25NKTu43WeAlsG5Gv1EZxl5FY59QxtMedA2K3ah+yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=S0L7zwZd;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3D41606A333
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 15:56:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3D41606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=S0L7zwZd
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91ebf4cd218so4361896d6.3
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 07:56:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795017376; x=1795622176; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3bQBfuPo4+GA4H58G8tofWZlnWMcm4hxNRzjXZBoZg0=;
        b=S0L7zwZdM46cBby3vC0oSkUe01o+3A7Zjo9hrcc3sPHP1Dk6nYzSSPDcvDHOgPWXqF
         x2rl3PAohlJT1MGmvHh7Q5rIrblnqJ9NQt7h+zfFaWF4yJyqh+UGCsx+wIjtYjsJgW4l
         BvvUyPGmE4j88Qm8WpRZOWjS2I0MAV1goQUB+lt6RCoisOW/PDkOWELd1IZs03qF5A1a
         2IWtEV/raPy3c43l6t27Qblwl8fJUH9CC0mN+Ablt5W7xi3THK9DTbyfZADNNl5tA7hn
         t4q0U4H9PeC8r8KSmzudZaW8DockAjfQ6ZkTfC8HG2HS4ozHmiu1lG10zVoE1NxDeQiG
         QnEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017376; x=1795622176;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3bQBfuPo4+GA4H58G8tofWZlnWMcm4hxNRzjXZBoZg0=;
        b=fTPWxS3eDYFN3HgV9eh4JvshudzCBU55JQNC8uzgFx83Z5zorjR07pviHCuK7ix4+Q
         DSlS80MaCpeLKrE15+Giv9QR9bDwBSlr5odsS7NVdE1acRFUYDrD37AwgP74OmPhljAf
         4ZbGozRLCed+BuBepBiwzWK+bixmSr11GLTyoxE1+ynpxyZv3TLrm9D2B5uNzuj19nJ2
         Ygu1O+zMbn2HDz0iCbyOWNe403mcxTkAJwR5xSzskgBwy5Wt116v4iqDUsGfMR0kZoZw
         eFHW7Pg55j3JlgkIKX/iBza7qIUxI4ypg3iAXbPwXja2lafX84CoFDKWO+WgmgvNreZU
         7U9A==
X-Forwarded-Encrypted: i=1; AL+hErGVuohmakOSTJYYw9T8w03GRuY87A2BuFLP+6JO01LwojpW9S931AujY1zBzRwrmV9o9gKY9MlsfZ6j2g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/n2Ddi0M9yqz9PNeWe8MaPujGedWAeIB8TyqprPg6ZpCfJkrC0
	4AUiWqbxeJo1e4Z++0lCAmkharI0VJAmRaQdaCry9zspuerkft+BY9B05oWRh506obk=
X-Gm-Gg: AZFdTZde99L/LF3Oqx3f3u0NT0gB7n5yf3cDFIyoJowYYMtCtcrK5mb2NDJDd0kqMU7
	qrYfrgTcP5U+AoREiQJylr5pokBLICX+/9kHp5H4xI8N2SbhTjATQYPtImp8bnihv4xxz1LfM4o
	44W0KhtT+l7VRm94PRBk9Si6DpuZUmUZ4JAIbd7PDsLJB9M/Rj/Yx5VQe+O/zKTV8PdX1z106bP
	NpnrFafBq8MAtETygRvDFpmEGsF+5sHgVv2bDKD4eVa5X0enG5f56rk3R/ypH9AVlGWuD/3r/Z7
	YYXxqFELrlMUpHiUFULlKu4rGt3EAIgqHBAJIOatpGODHurVv2QruXLvYuJMHn23IsdtmL1wOiV
	kSgHowCGYzuriaULxLc+VFDZ8nRpPzZ0kiqKRH56/zExYDoMbuUTV04Zexry/fUZ3OUF0qxIsw5
	mOmP7fXdONp2jIAVowpjNBTokjv+KlPj7dyHEh+89UZ8KvlD2qLl7N6fwmxjUHRNer4UVTICoBo
	f01hmDa+uVDkZCvqgfxTogMxi3JGWGh1My/pkaeoQSAYA73kUwe7sRtOvYfMSt/hPLd7XkYWVUt
	j1mpBZWVUF49V1jRDsGxhr734MpopocspvKXU22mpOiR5YZkByKpim6BB1YwTGW+YQ3mcWy9rRr
	hMk4gDpHNOTRg/bpEQaioV7b/yaTk
X-Received: by 2002:a05:6214:8013:b0:921:1890:b77f with SMTP id 6a1803df08f44-9211890b87emr29798426d6.47.1795017375668;
        Wed, 18 Nov 2026 07:56:15 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d28215sm24719106d6.16.2026.11.18.07.56.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:56:15 -0800 (PST)
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
Subject: Re: [PATCH 05/22] mm/mempolicy: keep interleave and tmpfs mount
 policies on common memory
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
In-Reply-To: <av3EGWuHX2JDdlrx@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-6-gourry@gourry.net> <av3EGWuHX2JDdlrx@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:56:13 -0500
Message-Id: <179501737390.1206716.11014097946405277594.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 23:30 +0800, Richard Cheng wrote:
> On Sat, Nov 14, 2026 at 02:09:42AM +0800, Gregory Price (Meta) wrote:
> > -	for_each_online_node(nid) {
> > -		if (!node_state(nid, N_MEMORY))
> > -			continue;
> > -
> > +	for_each_node_state(nid, N_MEMORY_COMMON) {
> 
> Maybe I overlooked or somehow, but when do we have the assumption
> that common memory is definitely onlined ?
> 

For this particular case it's not particularly relevant.

This code only runs at init time, so it's either got memory or it
doesn't.  If the memory is present but offline, it still wants weights.

There isn't really a bug here, but the existing code could also just
check N_MEMORY and end up with the same result.  If the memory is
hotplugged later, it still gets weights accordingly.

-- 
~Gregory

