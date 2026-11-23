Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795421220;
	b=eAsthAED/QVRZm5cwqNDJmhsBj0Zt4RMKw3Wu+ikzSAqTag9WB81Y/doD/KJ/vm4zTCY
	 3fgvtNP0S0Pn/CPGPL9vK+a6U6GtWIHG4GwN1we0fyoaJIbKJx5YQNMBVayepcEST6SWv
	 2x/Um4jpqCWatyKxIcW6sYslLtqRptPu4nJ5+3Bl5Cef8anMEHdJUzULhD5L9VqmXYzo1
	 rnZFT60m2bJiP0Ccz+blVaD8RKU6iTZBdZjI5CkdqMHqbCgeyx/KJEaalYVQRiKFW3apF
	 BOaS1bp2E4d7ZojBmSpTKG8Mm/T9l7anTcZYYD2ZsA7gaiF6vC4e66YHEagckelNXrw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795421220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=GdWbto/GYuZDXyTvm+7T3nEGrjgUlN0uIoNMYNUd3jo=;
	b=utEPdqERCvXrlyrLlnkItDbdwGyF68sLUzXxWmO6UMl2OLPfkrYKqvAcIadDSMMD6FGR
	 2lCkLb0wOl902KiGO9/ZhuZ3vngsSE6i5BDye1rSBLHNcxAnfyUgOjWHNrprTyh6zvRpR
	 V12cBwgvFpbePDn6QGeUwGCZKwmL0MxT3YQrigkgfZs7llcHYS/Z5kPImBVeebv1HoyuG
	 ZY1d72qD3U8lcTykFo8lOF/dbHmGXhVVuBJQwRRuM5r8cdj1DX9s9hbn+/yp6+IIpoGTF
	 epTTFZbJDV7cIIjsgCx9K8uiXdGjb1UMP8sXrCgiG0KouTYfTOxaYVk1iuwD+6VDypA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ES8E77xy;
	arc=none smtp.remote-ip=209.85.222.177
Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CCB76071517
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 08:06:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CCB76071517
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ES8E77xy
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-93a40a9a01aso502446485a.0
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 00:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795421218; x=1796026018; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GdWbto/GYuZDXyTvm+7T3nEGrjgUlN0uIoNMYNUd3jo=;
        b=ES8E77xy5J1mjqu9PTHksdjWWzSIiFOs0ddnHmx5o2/LzXeSps8NRvVkRdhPVLrORs
         u5qVn3FIieSxsm306FgK/RwC8mAdOw1orpXMFh14uCNq9xP/17n82y83nmVw6SGPU7uP
         KaCJ2t95xolF1X9nHa9OmhYt9kzupzCTMTiYU/SxkQQB2uwTAoOdB/lsT8nU6cCTD9KH
         X3LLZCQXEtyUI4TQX1bjss/sd6scWd/PrsKTuniKZMdjWtqaLfmdt9Aj3BMoCgq+nbel
         pCI4cY2G3vb9l8BrvYh+WtZV1C7lHTmV2vHU7kZ/msMBk5VT5MeNIj9aBGZ9fW/1/4Ie
         3XaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795421218; x=1796026018;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GdWbto/GYuZDXyTvm+7T3nEGrjgUlN0uIoNMYNUd3jo=;
        b=Qbh4KCsmiwQFyeaZsLjvL0vRae1VixEdmrtwTTyjgAcFR+Agzix69JDGevMMNbThgl
         aa343yrKdWuCYcGvL6a5EpLUNqbR4USIHkOn3DURmsxTpp5cRKJfYcyAm23PoG6fRaVV
         SGntjO2xG4IFoVCcIu2xrhrE5XpJ064eIcE70160+XBCisP5B6owEJKaDmLBZdYt6SFK
         SFQV8/vTXc8SPgqRLncWtlYloH2qM3rpAnZkmT9ZT/1C0OzDloF3CjT9QN1tueuzFw3B
         3qPZfjswkFU5EO8oEXJZsafx6znhmPSeOadeiS6f3o4s5GczDRtq2LLLAqC41slYgQiv
         jjNQ==
X-Forwarded-Encrypted: i=1; AL+hErFXJfmecccQHt/JEgnG32GqEHWkRf3I5gCJMOUa22Ltn/vG6hzRmXtlJ+OL24eZ5jcruJJzsJkoyzWuNw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/bazhNhBn//AgsbsPs6eqmDXJwyK3U0KmGHYyrOc+8xKLL9b+D
	s32s9+1w3tZJsCM1mUXdvlUWnuxBswBKWPRtZRLsiTdfCwO2wlvs4m4c0C3Yslk/2/o=
X-Gm-Gg: AZFdTZc/qzy1zdcEYQ6gaR2iITrEQboxb1O1FmcnMvUGgYEFuc5v8NXiKspqQ39aCxP
	pVmbHIlZIsoMpheH44QH1qdI5Dhuos1KHWlgJRVSJi3zj8sy8FnEmGwKgPf8XVHhT10tuyHMDJX
	GEEuy+AYKTIX966wbwUbim2cVml2Z5xaeMawpzinkgASWTIFrXuyHWXHpQq6MXAUvUJp4Cxg3HD
	TvFZPl9OE7XrAkSxCj2ZXzrahmwWhmeh6vgMtrXWiAY+2OlSfUuJH++dea7Hs37RtPph8pX7/6l
	HeuWYfdZXzLHDrsREJ0cFSpIUn92r20jXCl2H7K/aweSJ4HoNMzrYjO9NNkIptUlGJFB05Cq/L/
	xDbHpyKdU20wf9ykRCfVyBnN0twkwcmPC2KE9/DmIhpGQUXbZn4nINTnxysoJEdG/2NzmcS6pj7
	YrDBMMo/0F0k0s1TKi2+fWdAkabpV0PzpR9PqFdiMSNLBuKB5YFmA1Ear1mw+bTbYjyofhJp8zN
	fBafb3Hk7QG9GRHrSl7zRUfdWUTsC8RII9el6LHDY4uG8rIt9cFNO/9kkU4Tz9fwo7oHEo/7yC3
	BpbnVIweeOPJFvB9r7BfYSIHS4DDPYHeS9pDjd5R9Dv3Wtt3I6FRkCBlZaGRGHWW5nOnHsj/PEg
	j741+LjQdSIyCABZGbpiHuxGAz5OY
X-Received: by 2002:a05:620a:4481:b0:93f:2571:bb6d with SMTP id af79cd13be357-949bab32ff9mr1727268685a.39.1795421218145;
        Mon, 23 Nov 2026 00:06:58 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb349db3sm745619285a.7.2026.11.23.00.06.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 00:06:57 -0800 (PST)
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
Subject: Re: [PATCH 00/60] Private NUMA nodes
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Yury Norov <ynorov@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, 
 Yury Norov <yury.norov@gmail.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
 David Hildenbrand <david@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, 
 Mike Rapoport <rppt@kernel.org>, Michal Hocko <mhocko@suse.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Oscar Salvador <osalvador@suse.de>, Johannes Weiner <hannes@cmpxchg.org>, 
 Suren Baghdasaryan <surenb@google.com>, 
 Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Joshua Hahn <joshua.hahnjy@gmail.com>, 
 Rakie Kim <rakie.kim@sk.com>, Ying Huang <ying.huang@linux.alibaba.com>, 
 Matthew Brost <matthew.brost@intel.com>, Byungchul Park <byungchul@sk.com>, 
 Alistair Popple <apopple@nvidia.com>, SJ Park <sj@kernel.org>, 
 Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 K Prateek Nayak <kprateek.nayak@amd.com>, Kees Cook <kees@kernel.org>, 
 Kairui Song <kasong@tencent.com>, Barry Song <baohua@kernel.org>, 
 Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
 Axel Rasmussen <axelrasmussen@google.com>, Yuanchu Xie <yuanchu@google.com>, 
 Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Michal Hocko <mhocko@kernel.org>, David Rientjes <rientjes@google.com>, 
 Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
 Nico Pache <nico.pache@linux.dev>, Ryan Roberts <ryan.roberts@arm.com>, 
 Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>, 
 Usama Arif <usama.arif@linux.dev>, Kiryl Shutsemau <kas@kernel.org>, 
 Xu Xin <xu.xin@linux.dev>, Chengming Zhou <chengming.zhou@linux.dev>, 
 Lorenzo Stoakes <ljs@kernel.org>, Pedro Falcato <pfalcato@suse.de>, 
 Jann Horn <jannh@google.com>, Chris Li <chrisl@kernel.org>, 
 Kemeng Shi <shikemeng@huaweicloud.com>, Nhat Pham <nphamcs@gmail.com>, 
 Youngjun Park <youngjun.park@lge.com>, 
 "Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, 
 Waiman Long <longman@redhat.com>, Ridong Chen <ridong.chen@linux.dev>, 
 Tejun Heo <tj@kernel.org>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Dan Williams <djbw@kernel.org>, Vishal Verma <vishal.l.verma@intel.com>, 
 Dave Jiang <dave.jiang@intel.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Shuah Khan <shuah@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-cxl@vger.kernel.org, linux-doc@vger.kernel.org, 
 driver-core@lists.linux.dev, damon@lists.linux.dev, 
 linux-pm@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 cgroups@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux-kselftest@vger.kernel.org
In-Reply-To: <awNavE8dAGr-amfQ@yury>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
 <awMdeK8O-5mffg2m@yury>
 <179537469194.412063.13456998694958645706.b4-reply@b4>
 <awNavE8dAGr-amfQ@yury>
Date: Mon, 23 Nov 2026 03:06:55 -0500
Message-Id: <179542121527.412063.3452837736734095837.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 16:12 -0500, Yury Norov wrote:
> On Sun, Nov 22, 2026 at 02:11:31PM -0500, Gregory Price (Meta) wrote:
> > On 2026-11-22 11:51 -0500, Yury Norov wrote:
> > > On Fri, Nov 20, 2026 at 01:08:51PM -0500, Gregory Price via B4 Relay wrote:
> > > > This is v6 of the Private NUMA node series. The series falls into four
> > > > parts, each building on the one before:
> > > > 
> > > >    1-18  mm: introduce N_MEMORY_COMMON
> > > 
> > > I walked through this part, mostly. It looks like you can substantially
> > > decrease the patch count if you keep N_MEMORY meaning unchanged, and
> > > add another type, like N_MEMORY_NOALLOC.
> > > 
> > 
> > I don't see how this would reduce the patch count substatially, you
> > still need to convert existing N_MEMORY users and need to differentiate
> > between general purpose memory nodes and private memory nodes.
> 
> Please check this quick attempt with my codex. The patch count is reduced
> to 52:
> 
> https://github.com/norov/linux/tree/private-nodes-v6-n-memory-folded
> 
... snip ...

Patch count is not what we want to be optimizing for here.

Your branch carries the same code (+3 lines net actually).

The patch reduction comes from squashing the per-subsystem conversions
into one 16-file commit.

It also broke get_mempolicy(MPOL_F_MEMS_ALLOWED) - it now returns
memoryless nodes even if the system doesn't have a private node.

> The more important thing is that N_MEMORY and the proposed N_MEMORY_NOALLOC
> is a disjoint, contrary to N_MEMORY and N_MEMORY_COMMON.

The proposal here is not novel - version 5 was also disjoint:
https://lore.kernel.org/linux-mm/20260720193431.3841992-5-gourry@gourry.net/

   N_MEMORY and N_MEMORY_PRIVATE are mutually exclusive states.

I moved away from that because it changes the definition of N_MEMORY.

The subset model is easy to understand

N_MEMORY               - a node has memory
 -> N_HIGH_MEMORY      - subset of N_MEMORY
 -> N_NORMAL_MEMORY    - subset of N_MEMORY
 -> N_MEMORY_COMMON    - subset of N_MEMORY
 -> N_MEMORY_PRIVATE   - subset of N_MEMORY
                         (COMMON and PRIVATE partition N_MEMORY)
 -> N_MEMORY_<FEATURE> - subset of N_MEMORY
                         all N_MEMORY_COMMON
			 some N_MEMORY_PRIVATE

It's additive. Users pick the set of nodes they want for their purpose
and don't have to cobble sets together or remember special helpers.
Users don't even need to know about private nodes most of the time
(mempolicy being the one major exception here).

In the disjoint model, N_MEMORY no longer means "has memory". Recovering
that set requires new helpers, and the meaning changes silently for
every in-tree and out-of-tree user. Anything that wanted "has memory"
quietly misses private nodes.

Either way you have to audit each N_MEMORY reference and decide whether
it wants that state or a feature variant (N_MEMORY_RECLAIM, COMPACTION).

The difference is how a missed site fails. In the joint model the
zonelist and the common-memory folio checks backstop allocation and
access, so a missed placement site costs some additional work.

In the disjoint model a missed site silently drops a node from stats
and accounting - or worse fails to allocate per-node meta data.

So no, I do not think we should go back to the disjoint model.

> > And N_MEMORY_NOALLOC is not a good name.
> 
> Sure, I'm not attached to any particular name. Although,
> N_MEMORY_COMMON nothing better to me. It answers the question
> 'what for this thing' even worse.
> 

happy to wordsmith the names here.

N_MEMORY_GENERAL? _DEFAULT?  _COMMON felt intuitive but I am happy
to rename it whatever.

-- 
~Gregory

