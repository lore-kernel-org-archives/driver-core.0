Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B564CDDD5
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 16:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790009309; cv=none; b=VNSy2U8kuVF6ytxoSet+AojZTcZe+lb+mEptRv9TAsQOY61QGNa6Um7oFFWr8p/PCzClljKz3Vsw8vzungmT6pkAeg3t5k15JXmpqo7VXCq60GI4ZIKSFI9I1G5napTd83Kon41hPR9mm223hWz07k/eo8WR4m+Wya3FX7YEtOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790009309; c=relaxed/simple;
	bh=Y281zkM/Qmo9OSGui1K8yVeXfs0hDkEf9zNmUTSMONA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nP8cVOJLlrBsJofg5tXNXJp5sh+Xt0uWwFIHM4yYSATNLppf6jfgCITyJinvJJvzIdECOF3g193pGSTniqZoJiKH4y+NBYfnLm9e7JDPAprvnSc4VmmrmTZVDQdjheEiHYKxYlcyoUKZG/nmGds47g+lo600sz5LrHcIyJFDC9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=q5cK1PjY; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="q5cK1PjY"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so2789011a91.2
        for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 09:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1790009304; x=1790614104; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PmR+gFnwjwx9HRJSW244xTdy4CpVHKmXxMQ0vpvGnEg=;
        b=q5cK1PjYXehvItkpte5k04tZ6VDlXURg5eQuS5aMrtn3NLv+GifVVFOMCkp73R7rXg
         f4il7HD5/o1sPWPstlPmP7COVQDf+bq3XkAJRUhgbuj/Ev5jNCIc9r6Q9rrYk3TuAXxH
         FKchUKVRGTFdgy6+/NlZzgGl7gn1lezJppjOU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790009304; x=1790614104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PmR+gFnwjwx9HRJSW244xTdy4CpVHKmXxMQ0vpvGnEg=;
        b=CjlkobPPeKr++o0aHpuTtKi7z1kDxmhbWXVZbk1QRm+MiZ0L08O/Pfbii7O6N3DEml
         nKS+vimHi8S6WSHOkMISPhbkp10r5Cxq1gZqOSZ5obEjvLOTzVlqkI12KEN7ivLsg+A4
         2kghIpf0CrpDFJkohmx4HivM2M/2viveyRzG1tBvHom0RoIAz6MUj8NbyOHC5h8yKPqe
         N8NfZ/loQrL8ujJJRsfRdzd1UGMWaDEaaENbQkU9i3CUHO0uy5ClDhU2IuHKjR+flk9Z
         4BrJs2GvWDceUlayuju/2YId0OA6UbltxYnpUdqaYZOE3nXuWs43SoBt2/nGo925PEUU
         GhYA==
X-Forwarded-Encrypted: i=1; AKwUvBwijvHndhUwhMmlBSsKTthuMO5APnRo9/5CF3heYXNJ5dims5YqWv3Rx6q1J2+t2Zbw2VLNo67EzB/M+w==@lists.linux.dev
X-Gm-Message-State: AFuF++lve2oOFYvUjt6xd2usklkzwsOlb7Y9rM4uWa1NANOHsXJLliR5
	kKYNsji8uc926Gr8GeeMWcf63INITDALAsbZkXUYyHwZQo8vqcsiXpNPXSGVm/MJ5Fg=
X-Gm-Gg: AYBFou1Qn8lpuN8mmPIyKfqictKe8SJJimA+Gmd92jC9TL7I0dinkXY2OgpyRzLe13B
	iqdue3QhUO3qJ3ebnOazVJDRC9B08PkcSGSctg4uMHZM6LPsQU4RqfRAQtkvsGoUF/GHf7yUPEv
	dt2qB3Hpz8L6fDoEbiBiu2Rrdtis4JcVwlRq+EuxBAimT3HYc8/03fz36xCaWYbmetr8B25hQ5c
	LlrQfSxdHvt2ORqI6/KuRFqVnoYQhl87ghp/zJWo01yplkF8paD/tApNkCKox8E2k8sqpRnIkQB
	zDJwBtA0DsWHexlUXp/guMiJbHkSLIUTKVuL3RBy4Gyx848rRTpYUP7AfiGicz+jEI4P3bm5czm
	fYbRMnE5gBh5dgIGdw/5Gyn32VAhJbiA+emhoDpqaTawBPk6nAEgJLyznTmfgnzewL0HK3r+SKF
	StTBcpGsEyuoWJCoPbTnSa4IuRan0/gBhhn1JhH2/2XlvZJbzvkjHlSS3LcTn4pCKGmA==
X-Received: by 2002:a17:90a:d888:b0:39e:4c7f:8b16 with SMTP id 98e67ed59e1d1-39e54cf8bdbmr17750548a91.27.1790009297592;
        Mon, 21 Sep 2026 09:48:17 -0700 (PDT)
Received: from 1c1aead48890 ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0673209b7sm148455a91.16.2026.09.21.09.48.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 09:48:16 -0700 (PDT)
Date: Mon, 21 Sep 2026 16:48:10 +0000
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Oscar Salvador <osalvador@suse.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-cxl@vger.kernel.org, driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH 09/12] mm/sparse: remove SECTION_MARKED_PRESENT
Message-ID: <vpz5zqg5nwbpolxbkip45vxxdt3lni7j2haal7q42skc3b57tu@uh4cec4x32dq>
References: <20260909-b4-sparsemem_cleanups-v1-0-008fc8d579fe@kernel.org>
 <20260909-b4-sparsemem_cleanups-v1-9-008fc8d579fe@kernel.org>
 <aqK9S1hBpPnujgz9@gremlin>
 <eb5b465b-c256-4454-84de-517aefcd6d59@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <eb5b465b-c256-4454-84de-517aefcd6d59@kernel.org>

Hi David,

I'm sorry for the delayed response.

On Thu, Sep 10, 2026 at 05:11:36PM +0200, David Hildenbrand (Arm) wrote:
> >> +++ b/scripts/gdb/linux/mm.py
> >> @@ -76,7 +76,7 @@ class x86_page_ops():
> >>              self.SECTION_IS_EARLY = 1 << int(gdb.parse_and_eval('SECTION_IS_EARLY_BIT'))
> >>          except:
> >>              self.SECTION_HAS_MEM_MAP = 1 << 0
> >> -            self.SECTION_IS_EARLY = 1 << 3
> >> +            self.SECTION_IS_EARLY = 1 << 2
> > 
> > Seems a bit strage given the code is:
> > 
> >         try:
> >             self.SECTION_HAS_MEM_MAP = 1 << int(gdb.parse_and_eval('SECTION_HAS_MEM_MAP_BIT'))
> >             self.SECTION_IS_EARLY = 1 << int(gdb.parse_and_eval('SECTION_IS_EARLY_BIT'))
> >         except:
> >             self.SECTION_HAS_MEM_MAP = 1 << 0
> >             self.SECTION_IS_EARLY = 1 << 2
> > 
> > Whereas other variables must be available with no try, e.g.:
> > 
> >         self.PAGE_OFFSET = int(gdb.parse_and_eval("page_offset_base"))
> >         self.VMEMMAP_START = int(gdb.parse_and_eval("vmemmap_base"))
> >         self.PHYS_BASE = int(gdb.parse_and_eval("(unsigned long) phys_base"))
> > 
> > etc.
> > 
> > Is there some weirdness with gdb? Or is it maybe because there are some configs
> > without these symbols maybe?
> 
> TBH, I have absolutely no idea and I was asking myself the same thing (but
> decided that I couldn't care less about a python gdb script).
> 
> This code was added in February:
> 
> commit 55f8b4518d14b7436f70defe27faba4eca0cd4e1
> Author: Seongjun Hong <hsj0512@snu.ac.kr>
> Date:   Mon Feb 2 12:42:41 2026 +0900
> 
>     scripts/gdb: implement x86_page_ops in mm.py
> 
>     Implement all member functions of x86_page_ops strictly following the
>     logic of aarch64_page_ops.
> 
>     This includes full support for SPARSEMEM and standard page translation
>     functions.
> 
>     This fixes compatibility with 'lx-' commands on x86_64, preventing
>     AttributeErrors when using lx-pfn_to_page and others.
> 
> @Seongjun, why are these conditional and the others not? Trying to support older
> kernels?

No. TBH I didn't look at the gdb script carefully at that time and just 
wanted to avoid a symbol lookup failure. 

It would be better if we remove the try statement.

Thanks! :)

--
Best regards,
Seongjun Hong
