Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1653EC6B9
	for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 10:29:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784284159; cv=none; b=LGP0wVZeDmJnnh/4gX8/eyPozKPv04P524uTNVBiwrfS/8esYmfDKx/mT+Q6OqpHDAoefY4He0I58k+VPdJaOicOlKn3WgDRvBR8a7+Um4IOXWeuG0SW6EloyniG6COw6K48Dn9lAwrR7hDL63S2YUTu9lYRNTp6OFLZX4LOxH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784284159; c=relaxed/simple;
	bh=O0sAyFSv0R0TuW350r1Uj6GyHmxXc7jE3KBXt+KR5N8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ekNbzdk9ExQFhnRgrQEKtmZb5kE8rijLxcrat8zbOnn74oq4MKzm18dHwJuKiNeNNzTmk1gogiSjg+FBXv5Hw4214qL2qIihx6FfF0AX2lcY7qMIWcYBBe5lI55s30tYLd/Ywq6TE/FjfFDZgbIK9WM9f97iFAyPulMEisHfFPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b=Kyrw8SNM; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg.org header.i=@cmpxchg.org header.b="Kyrw8SNM"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-493f75f7172so57504905e9.1
        for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 03:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg.org; s=google; t=1784284155; x=1784888955; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FPrP++RV8/J+qtkq7zlFYhPki2PjKuFSG10cWEhSMxc=;
        b=Kyrw8SNMJq6CjYnwJY5Ar/4ML5mXdUNED4se4G0DmsZLNs/PqmRba3cA+njsQ90QtF
         qqdEq6boV7jKcKkonV4ak3Qd9iIEjGg1nD3gQDuMk7SU6J1cENQlLrIejEnJdBy1LvFW
         bYM8TnYA8qli4hzu0ZDLCEiHUymVLljGq8Uw48D7WkK50M9ryc1sEGLZSmTXS5sFqOIk
         yw97CdE+UKiFOltGo1M65W9jSdjxWuCh7NR3Bg9NdkZA+XSBmMgvANnhNU2WuJ3IDaop
         Hrkjtwz0QpAsmq6vGHxX+w9/vc37y4Ea0KredkbRrjaVVI7ib3SLmn/yQMcmVUEdn2sH
         EZhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784284155; x=1784888955;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=FPrP++RV8/J+qtkq7zlFYhPki2PjKuFSG10cWEhSMxc=;
        b=O0mh3sY65vy3gZqw0pZAGn0JCuKoDZswXaB1d5x0+ptGHAPT1oSBDcPQjbbyvpV7HG
         8IYADvsuayHTDfiaSYiaoQSzbZUKgVmA4ncKxY+ddw6NFhjn28b0NksYeEuuinrQD7JU
         LXPjWIEpqO10G1PeV/UwhMpnPk5506kZSDyPacTPRDSlFpWxkly8hiNO7Lh9GJlcwrPK
         yJP4ClXJUA7dffBYiJGifIhgOdGru2ngZCbuH9f/yWzz53MW7g06PJWXfa2RrCnsis4C
         GPMHaDxBWzGczt8j/eDCKqnTagiEyDFvzLeSwb7zECFm74vnQt7aOlHs6lQN+isKd5M+
         CcFQ==
X-Forwarded-Encrypted: i=1; AHgh+Rro3KbKxNsrqmqvWWpgzmKuEcna16WMwQjv/lYEikCUryvRmhkcalahryxKup7eBUTJAxYoVdHpyq3RtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxR5P2YgKch8zIsooI3M0Yl/9kybV6FZHDGPoWsfgvIKoOzOOSM
	K6G2ruh7Cijl6KW4d3gAmKFnw7VmUFl1gtmNYRo0e5zwL//Rsw4GDGlpPrSSBZ/DnMo=
X-Gm-Gg: AfdE7cnvOTqdn/FHQAVUHznECP/mf05YCr6zyiV/maIxQ7RNcvBm1J/1ZirDed6J+HP
	goh3xiTfQV3ESgZDNLEEmhDXYy00v+RlDTuYkfMMkxZAL4y1fBGmpg9KTDHUwWZwAToxVG8fXEi
	MpAvRlOtFN7kqVzJFdQ2vAXHQqbFP3tP6Pe/PiPH7kJYUaQSBMv5kngtlsfYh1lGrOx9xM0D2+Z
	ia93QpcgjfpHnSixpn2epfQcBDu3Zb15qBfHb621oQRaRHbGB4n2ydr0shpnunPJQl/6rPzQjMS
	+k4lB0sMRcnJKiwaDOAZnXJ4ycmmfCSCQY3DObW7H3ZtBLANQaGY6NgAFdiJkjexmrM1upuu413
	V8wdSwd6QaP8zgpbFmluUDIIgBXOaEcqDUSyJn9roNHElnlXSQs6jBv2SIECFCA/YTzNm3inazV
	Y=
X-Received: by 2002:a05:600c:3b23:b0:492:4a56:690b with SMTP id 5b1f17b1804b1-4954a513283mr21911155e9.35.1784284154829;
        Fri, 17 Jul 2026 03:29:14 -0700 (PDT)
Received: from localhost ([2a02:8071:6401:180:d892:bf43:a0b4:83b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4954834fd05sm50766995e9.0.2026.07.17.03.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 03:29:13 -0700 (PDT)
Date: Fri, 17 Jul 2026 12:29:09 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: liuye <liuye@kylinos.cn>
Cc: Ye Liu <ye.liu@linux.dev>, "Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kairui Song <kasong@tencent.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Barry Song <baohua@kernel.org>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>, Wei Xu <weixugc@google.com>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Lance Yang <lance.yang@linux.dev>,
	Usama Arif <usama.arif@linux.dev>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH] mm/thp: expose deferred split folio memory usage in
 meminfo
Message-ID: <20260717102909.GA6843@cmpxchg.org>
References: <20260717063025.168436-1-ye.liu@linux.dev>
 <alngSdkM6iEGpETe@lucifer>
 <102bada7-66ae-415d-abc8-12d5939b7ebb@linux.dev>
 <70294b26-86e1-4de0-832f-d5cb488cdb3e@kylinos.cn>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70294b26-86e1-4de0-832f-d5cb488cdb3e@kylinos.cn>

Hello,

On Fri, Jul 17, 2026 at 05:38:10PM +0800, liuye wrote:
> 
> 在 2026/7/17 17:24, Ye Liu 写道:
> >
> > 在 2026/7/17 16:08, Lorenzo Stoakes (ARM) 写道:
> >> +cc Johannes
> >>
> >> On Fri, Jul 17, 2026 at 02:30:22PM +0800, Ye Liu wrote:
> >>> From: Ye Liu <liuye@kylinos.cn>
> >>>
> >>> Folios on the deferred split list hold physical memory that is
> >>> invisible in meminfo. When a THP becomes partially mapped, the
> >>> unmapped pages are removed from AnonPages but remain physically
> >>> allocated until the shrinker splits the folio. This creates a
> >>> memory accounting gap where used memory cannot be attributed to
> >>> any meminfo field.
> >> Is this really that much of an issue? You're not giving any use cases here.
> >>
> >> What real-world use case motivated this?
> >>
> > I have indeed encountered this situation in a customer environment,                           

We have run into this before as well. It's not super
rare. Applications do partial unmaps or protection changes with no
awareness for THPs. The issue is likely to stick around with legacy
software for some time.

Do note that all information is there if you know how to look for
it. But it is cumbersome and somewhat inconsistent, so I'm not opposed
to fixing it:

> > but the environment is complex, and I cannot clearly explain why this memory                  
> > black hole occurs in that scenario.                                                           
> > However, I will provide an example to reproduce it below.                                     
> > Use case: The system has 100GB of memory. A user-space program requests 80GB of memory.       
> > For each 2MB block, only one page is retained, and the mapping of all other pages is unmapped,
> > while the process continues to run.                                                           
> > You'll find that in meminfo, MemFree: only 12GB remains,                                      
> > but the process actually uses very little memory.                                             
> > This creates a memory black hole situation.                                                   
> > Below is the test program I used, from AI.                                                    
> >
> 
> ps -p $(pgrep -d, test) -o pid,comm,%mem,rss,vsz
>     PID COMMAND         %MEM   RSS    VSZ
>    9358 test             0.1 165220 166032
> 
> 
> MemTotal:       101606276 kB
> MemFree:        13172092 kB
> MemAvailable:   13569668 kB
> Buffers:            5352 kB
> Cached:          1169520 kB
> SwapCached:            0 kB
> Active:         84730404 kB
> Inactive:        1129792 kB
> Active(anon):   84730404 kB

This shows actually allocated anon+shmem.

> Inactive(anon):        0 kB
> Active(file):          0 kB
> Inactive(file):  1129792 kB
> Unevictable:        6192 kB
> Mlocked:              32 kB
> SwapTotal:       4194300 kB
> SwapFree:        4194300 kB
> Zswap:                 0 kB
> Zswapped:              0 kB
> Dirty:                24 kB
> Writeback:             0 kB
> AnonPages:        969280 kB

This shows anon *mapped*.

> Mapped:           308848 kB
> Shmem:             45076 kB

This shows that your (in)active anon *isn't* driven by shmem.

> KReclaimable:      96144 kB
> Slab:             269540 kB
> SReclaimable:      96144 kB
> SUnreclaim:       173396 kB
> KernelStack:       27584 kB
> PageTables:       187408 kB
> SecPageTables:         0 kB
> NFS_Unstable:          0 kB
> Bounce:                0 kB
> WritebackTmp:          0 kB
> CommitLimit:    54997436 kB
> Committed_AS:    6628776 kB
> VmallocTotal:   261087232 kB
> VmallocUsed:       38696 kB
> VmallocChunk:          0 kB
> Percpu:            42800 kB
> HardwareCorrupted:     0 kB
> AnonHugePages:    413696 kB

This shows anon pmd-mapped.

> ShmemHugePages:        0 kB
> ShmemPmdMapped:        0 kB
> FileHugePages:    172032 kB
> FilePmdMapped:     28672 kB

This shows both allocated huge pages and the pmd-mapped portion.

So you *can* work it out by looking at the LRU ((in)active) and
cross-checking the shmem position. But it is awkward, granted.

IMO if there is a case to be made, it's doing the same split we do for
file and shmem - AnonHugePages (allocated) and AnonPmdMapped.
