Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69505360EC5
	for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 03:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784777125; cv=none; b=Raup21alVidLVzozalgXxo4tOQz0B7/bUA6rQkqFeVxIwbxBBuQtXTaZrjSTWMpZifh4HRG3+MzOMWcW7o3e6pDwHMKRD8nTgd8buFRtqqBiOzU4qRsKmw0rf4UVqfSynCS4IARE47om5MbctwXARkgG5gk8pJuFLBk6nvUflpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784777125; c=relaxed/simple;
	bh=gfT0G2h32Mgahppc0W5ji5WK8maIODJ9zFl+mqtZVuU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aBLmhHtTdGqyFhWTwTF63TWSso+9RLUzo/VVkBJUE/ElVPs+16owzEmf7J+B2XH0VnCjV/+0IugtzzGsIGOBPvVWcH0jNa+Ax58quo0/hoXHR3dpRDBhZBpU3XUoBPwVQTawUfheIwJ0DHCkyWgzp4/r9llLTY8kppVujlKUe5Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=urddzN90; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="urddzN90"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92ed19f4d60so334385a.0
        for <driver-core@lists.linux.dev>; Wed, 22 Jul 2026 20:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784777122; x=1785381922; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kd13UizLWaDa1rNXvY/PJ0N43yZ3Vd9IZn7XTlTXtfM=;
        b=urddzN905/IWI1PR54GJNttpdzyt/qVu75GRLHSLu3E6f9ahaWcKntCA/dZ9IFQAvI
         W5l9yLIBtRxshxRsFVUcxP8qiPkycPLerojMjIuypVeAyrxVzE4aR8ipGSbES7/bgcmZ
         NMBpfIbMv/cVvjUGJ+IbVeSIgFDFsNYzDiNkYa0mu6Gr3iah9pkQ3jw8Zc7RKqFdjNl1
         tpikJ5+I07OXxrJBStivc0w4vldXUCYXA6QrDpV84E7yrOmdVbtD5kVPr/86poczAXyX
         gyK8lzMSPUPrBgLvHyXNcu98y38exQqDtt/fGRUWTgiBt5l8nnEa5RoCOpr8OL6cSquL
         Drgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784777122; x=1785381922;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kd13UizLWaDa1rNXvY/PJ0N43yZ3Vd9IZn7XTlTXtfM=;
        b=l5LbztXu9CzHhzLAD0fPY7t5+lC/AankrRL/6T9nm525e3NnOU4GMxzQfbxWskSR7y
         KIgINV6WiT5xjgcHO13d5+QGSg7TJfTIz2uM1+zKnaAOj3ERsQ7lYPdScB2tZt4YeZKx
         KVgISR7vf/cgclR0mqJ1K2muGUKQDpZMVQVt/8WDH1Ggrq3mdrJxe8QHOmUaTNFxR66X
         HXWx0ePpl4q0tXV8Nb9h+/ecVvqeHtnzdrbnZksN75A8BbUKwKgPIiLkZd81AxZKlnMs
         VktuPPpItNOrjmH8/tbLlWgjSAd5aFj4DVZGtSYWE36b8/FDOsHz2wM8+tt257olgqjt
         3BPQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKHetVt4c4s9a5MEi+pex64i+j11MmEf3B18H6shtoitXDFH3yyHDaFECEjwgPI1cDUQa7PrmsH6KKgw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxoXpPbo7Qzn+UnAE37NYPPVMxwS/+BGWbTknAn9WxJJCeTqmwD
	KzrA486HMTswEa1lhoTmZSHENRian/mdTKNoNaRgYCTBellw+cL+zSElLgWD8s1jwmE=
X-Gm-Gg: AR+sD12JvzT0Gc8CKy1ZAQWLPylXZp9fRbOmM0fQKxByMmQZU8VhBy5gEA5Z5Z91tOu
	PWuU/KACgkdB072jfaoYU/1famoYeTsdaOqFAMUe4v5gsIGix+cStUugOYHn4+30UAXkbNl6Zdo
	poD0yhgYpTYpboE9D6PjJ1r3iuqIJO/cCIFf1yeL6T61ZxoNmn8mNimUBWzyxfACypwkUVOZ9OI
	SpJg+s9l8RpHOwb5N4vio3WVUZfsP2cy8WDovMFD9s2JgJsYhROeF74RGU20fASNp6Qofq3Tf+6
	dL+PdwOYZCVTslKu1yzcfGx/uXsLM+hDCdMwu01ckqOvoxFDJJaIxdQrqp8t2YZz1gdSagEp504
	lH7G1byNW0BrCXo2vFnSqUxW79K5grE2Aq7YQEkRGwaQ5ZFuji5QM3crBGHffZJ8bOKpRnj8W9P
	eqyLWD5LjFVHROkopflxw+RGaN9xUEWYscD9pSC0QGFlpu6h9mO0tZpS5rKDoIvFU2pWO0
X-Received: by 2002:a05:620a:808c:b0:92b:67e6:4b79 with SMTP id af79cd13be357-931048880c8mr90170685a.35.1784777122066;
        Wed, 22 Jul 2026 20:25:22 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-931062c4ea8sm34465885a.28.2026.07.22.20.25.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 20:25:21 -0700 (PDT)
Date: Wed, 22 Jul 2026 23:25:15 -0400
From: Gregory Price <gourry@gourry.net>
To: SJ Park <sj@kernel.org>
Cc: arun.george@samsung.com, balbirs@nvidia.com, brendan.jackman@linux.dev, 
	yuzenghui@huawei.com, apopple@nvidia.com, alucerop@amd.com, matthew.brost@intel.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org, vishal.l.verma@intel.com, 
	dave.jiang@intel.com, alison.schofield@intel.com, osandov@osandov.com, 
	jannh@google.com, pfalcato@suse.de, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, pbonzini@redhat.com, osalvador@suse.de, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com, 
	linux@rasmusvillemoes.dk, longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org, 
	mkoutny@suse.com, jgg@ziepe.ca, jhubbard@nvidia.com, peterx@redhat.com, 
	baolin.wang@linux.alibaba.com, npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	lance.yang@linux.dev, usama.arif@linux.dev, xu.xin16@zte.com.cn, 
	chengming.zhou@linux.dev, roman.gushchin@linux.dev, muchun.song@linux.dev, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, driver-core@lists.linux.dev, 
	nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, linux-debuggers@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 14/36] mm/damon: skip private node memory in DAMON
 migration and pageout
Message-ID: <amGHuputMNCFZ9CV@gourry-fedora-PF4VCD3F>
References: <amCzmkdOr6AFv_kQ@gourry-fedora-PF4VCD3F>
 <20260723001943.95854-1-sj@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723001943.95854-1-sj@kernel.org>

On Wed, Jul 22, 2026 at 05:19:42PM -0700, SJ Park wrote:
> On Wed, 22 Jul 2026 08:16:56 -0400 Gregory Price <gourry@gourry.net> wrote:
> 
> > > "by default".  Does that mean it could be reclaimable in some situations?  If
> > > so, could we check if it is reclaimable?
> > > 
> > 
> > See the damon changes in:
> > 
> > https://lore.kernel.org/linux-mm/al-pkvmgIxGu3LzM@gourry-fedora-PF4VCD3F/T/#mfb99303c85dd9d4c3f58832dc28fc55583a7217a
> 
> Summarizing what you want to say, quoting something from the patch, or at least
> calling it "26th patch of this series" would have made reviewing much easier.
> Cc-ing damon@ for only patches that toucing DAMON source files and the cover
> letter of the series could also be helpful.  Please consider doing some of
> these for future replies.
> 

I have been very much discouraged from this kind of trimming because it
removes the context of the series from the individual patches - making it
even more confusing.

But I understand, I will try to remember to do this for you.

> So, I understand later patches will make it optionally reclaimable and update
> this restriction by the 26th patch?  That sounds fair.  But, could we drop "by
> default" from the above comment for reducing the confusion?

Yes, but you bring up a good point - I think this two-step process is
actually poor form and that I need to redo it.

Maybe this can be redone as node states (features?) such as:

   N_MEMORY_RECLAIMABLE
   N_MEMORY_DEMOTABLE
   N_MEMORY_TIERABLE

so these damon changes will forego this confusing intermediate step of:

   if (folio_is_private_node(folio))

and go straight to

   if (node_is_reclaimable(folio_nid(folio)))

In the first patch - without ever having to revisit damon again.

> > 
> > Technically there is nothing in migration core to prevent migration
> > operations, it's done on a service basis - hotunplug, reclaim/demotion,
> > user numa (mbind, migrate/move_pages) etc.
> > 
> > Operations on private nodes/private node folioes are refused if the
> > capability bit is not set.
> 
> I haven't had a chance to read the entire series, sorry about that.  So, do you
> mean the above blocking is not really needed, or that will conditionally be
> allowed by another later patch?
> 

I will reduce this all to a single patch in v6, I see where things can
be improved now based on a few pieces of feedback.

Thanks SJ!
~Gregory
