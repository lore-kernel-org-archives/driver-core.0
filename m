Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0B594D8DB5
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 06:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790059790; cv=none; b=eKRXppl/LnBjb+bZUpvvULD5mnww6F/jX0ZCGcFOQdG55z+YrqGb6pcYpHYHPzGjq+fcEA9lL6zcvxejWzBLV/46HtpSDnpdYHLYRX3ztYtoIu1fcfOnYEXIzQDNfyzxotdM6Ri9LmPWkjobyWhkajC9Ote8Y57b/LCSKekhDGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790059790; c=relaxed/simple;
	bh=B3wosUAQJBLDFLILxBPX0SZDChxcSn3whe2zVQE5GLc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hs674LHW0u2GZL3JPF+hXqz+6qCZTeV0FVTu7oHTmfEBx/8Hg8DJX3RCHvUXjCTbQqMCCLihCyQszr7xZT7hRd6EIxQHsZsfTTLu3+uk04IzpRi4HOS/ozK8PXy/3bVZek7jUcHPv0M2YhDuPpiVLwIc8Y3pWzF3u1RfNBIuHdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr; spf=pass smtp.mailfrom=snu.ac.kr; dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b=cUJx3unO; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=snu.ac.kr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=snu.ac.kr header.i=@snu.ac.kr header.b="cUJx3unO"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396cccbba92so3375147a91.0
        for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 23:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1790059784; x=1790664584; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dt+xEJCMHk3Wb3Te/EW5gGwA4SLsGhrrMq07tSq9fOs=;
        b=cUJx3unObu2LWfYgYmBDYZDHqG2gRQIOQRS3GZWoEZaeQB1ntppbIadSxCw0us0ike
         6pXEH2FA+9vvK/hFzIoWRMMQwopplEdyvtexhmJ1+oEVPfUexxFDhAxdMauYA36Not7H
         73z1nG1xMiD8eJfJcGyjarlcFukhb7M0v5pCE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790059784; x=1790664584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dt+xEJCMHk3Wb3Te/EW5gGwA4SLsGhrrMq07tSq9fOs=;
        b=2djciI4snGzcaPJopmmRy/tqEOethOPEeExAz/ky3IukDbMO5J3Xka/XnEEbYbHZKu
         jkVxTZMZBhJ8XuNXG2DWruKCpRRyMW6yA59spu1ORj8ef/t7uvB23AGvMrMQtffyb47I
         /pygkVXjmCn5gKfdbnrW/nGlCqcu8UFyzh10BCbMu+Q2tvOj2jAzsi+SE0zmMAEl7zta
         yrgrZ+kzY/vqOR0c3LU1ISdCSoG+YttTx/5Eg7Bn218QgJdBJBXf+UW2TQtmkah0Y3Tl
         OCPwOD2UjgFT00g4vpyCT/+MZnHip1/ALMq13RuXhLtYwXCCREerEhTHPpRT/STHqPCR
         RSTg==
X-Forwarded-Encrypted: i=1; AKwUvBy+cLWwiR0d7JYxPqb4PpUsrvAww0PM53XW+SMWqgLUzEemzM93EJ6fR39cQTKylsZq2MYkvhRCIq6PBQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lkGuzKiyBv+yn/soMFVuYHhOqcGnjj6zIdc3305SLpG3R4Essm
	vARO4tii7ZXTOH4Go1nkSGLnfco9EXiShcKIlQM2p+iNw2Ebr6+jil3VYxNsxZrmSBo=
X-Gm-Gg: AYBFou0r+OusUrgxzPHtellQ31pjLj/dxZvtVg029u+WSo7nETIkwtfqunLcY8grbVW
	371JvkM5LLhGLvKYSM0k0r/LqwIv2PA6Qg7pZA2vEAsDba1WjQ8ndu4CVWqOUrVH+ikEwwuMQf7
	Cz6dpimXhmiA7Td+i/L3FE51agywEz1brsf14mJ5FpAAWKP2UIJqjDpKashz1a5JXpCws3A0q52
	5o4IQOAudMP5tVVWLb3WK8CD7iih1R3CPa6L0tvQ28M8e6VTkQK7S6WCVkD+bxD+Kxf2i2Hgt6Y
	ANBZraSnerNRjSnypEJH3DcCeWjFdxeupp5mBoAeHHmFboJEYpMzyCWJBy6xfWayLUG4J9cgJqT
	35SACdMAZDm2oQKuJ/dIu9od6bLkiyPAz8GnQmbxi4mSr9Jn1R6x+dwUAezqgD/EKDtndi0hWXQ
	K5V0y9BYBf5JbbUbtlLgT+M+Kt+9+DC1XG6zB4FWcjZhMMMlgpfcxlz43h3V36Hlae
X-Received: by 2002:a17:90b:574e:b0:39e:4c81:6c61 with SMTP id 98e67ed59e1d1-3a073119e14mr213705a91.28.1790059784299;
        Mon, 21 Sep 2026 23:49:44 -0700 (PDT)
Received: from 1c1aead48890 ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a067409854sm2985765a91.7.2026.09.21.23.49.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 23:49:43 -0700 (PDT)
Date: Tue, 22 Sep 2026 06:49:36 +0000
From: Seongjun Hong <hsj0512@snu.ac.kr>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>, 
	Qi Zheng <qi.zheng@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Barry Song <baohua@kernel.org>, Axel Rasmussen <axelrasmussen@google.com>, 
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>, Baoquan He <baoquan.he@linux.dev>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Brendan Jackman <brendan.jackman@linux.dev>, 
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Kieran Bingham <kbingham@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-cxl@vger.kernel.org, driver-core@lists.linux.dev, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 09/13] scripts/gdb: mm.py: remove fallbacks for
 SECTION_HAS_MEM_MAP and SECTION_IS_EARLY
Message-ID: <54itd5fvuuqpwzc7nr4cvygcpfqh5tfizrt3oudnwjth7nwbs7@lk7pjhgoxmwc>
References: <20260921-b4-sparsemem_cleanups-v2-0-54d81d65e125@kernel.org>
 <20260921-b4-sparsemem_cleanups-v2-9-54d81d65e125@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-b4-sparsemem_cleanups-v2-9-54d81d65e125@kernel.org>

On Mon, Sep 21, 2026 at 09:59:01PM +0200, David Hildenbrand (Arm) wrote:
> There is no reason to handle the absence of the corresponding BIT
> values. So let's remove the fallbacks.
> 
> Link: https://lore.kernel.org/r/vpz5zqg5nwbpolxbkip45vxxdt3lni7j2haal7q42skc3b57tu@uh4cec4x32dq
> Cc: Seongjun Hong <hsj0512@snu.ac.kr>
> Signed-off-by: David Hildenbrand (Arm) <david@kernel.org>
> ---
>  scripts/gdb/linux/mm.py | 8 ++------
>  1 file changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/scripts/gdb/linux/mm.py b/scripts/gdb/linux/mm.py
> index 193a88d763abf..7398105ff3f67 100644
> --- a/scripts/gdb/linux/mm.py
> +++ b/scripts/gdb/linux/mm.py
> @@ -71,12 +71,8 @@ class x86_page_ops():
>  
>          self.NR_SECTION_ROOTS = DIV_ROUND_UP(self.NR_MEM_SECTIONS, self.SECTIONS_PER_ROOT)
>  
> -        try:
> -            self.SECTION_HAS_MEM_MAP = 1 << int(gdb.parse_and_eval('SECTION_HAS_MEM_MAP_BIT'))
> -            self.SECTION_IS_EARLY = 1 << int(gdb.parse_and_eval('SECTION_IS_EARLY_BIT'))
> -        except:
> -            self.SECTION_HAS_MEM_MAP = 1 << 0
> -            self.SECTION_IS_EARLY = 1 << 3
> +        self.SECTION_HAS_MEM_MAP = 1 << int(gdb.parse_and_eval('SECTION_HAS_MEM_MAP_BIT'))
> +        self.SECTION_IS_EARLY = 1 << int(gdb.parse_and_eval('SECTION_IS_EARLY_BIT'))
>  
>          self.SUBSECTION_SHIFT = 21
>          self.PAGES_PER_SUBSECTION = 1 << (self.SUBSECTION_SHIFT - self.PAGE_SHIFT)
> 
> -- 
> 2.43.0

It looks nice.
Thanks! :)

-- 
Best regards,
Seongjun Hong
