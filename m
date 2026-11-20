Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795201148;
	b=2murEdwBwYbs6pRX6UOd4Bwj414QPFlUznKjjaI4XTAQjdRytueZ8cQHXAGnzZjLKoZZ
	 TZcSngnkmpp1+aYD7V9hssAEoKfiZG50ve7va0bd8dgZNpS6N/UT0nVO4tJUtzFv7bDwf
	 VQBF/rGyGMCgJX/qnd15oLExedvb1d07JJByP85WVeZPp+DLPvJ3yvDSQ45jdEQqFB77W
	 cENPY6KZ4fbC9aHh8D3pt0CC7AKAbm+xPW3sKCO+6pPENB1gy3BERN24NKZvCzzWCylCk
	 /4vE2atdqdZiJ8JUzHoGEsrxgSRYcncl8HEMgA0DFNVPlUEywMTME+BW1UXJrJ2cosA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201148;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
	b=4rRtsLcMichqJeERkz3a5apJ08S7XhVfVdh2U25nA9lMHRKR9yvAbsjv6NBQcytpHF8U
	 lfooTV3I1ExQsjU4rB+KNAnw4l1n7MbSoTnHJTkMgmLEAISxvuqaN0WOEljIibczp0i4M
	 s3LGuSfVFWUYR7R0sYBePNqGoTzVchBY/VykGcoGeF87zLa0UIFudqXPE4bt9510Mh0xP
	 zyDFgVLtmSS0jtcfyWt5n5XVlm9qspoExAMC84rWyKLkvurun0ng+4eRg6NNOxT7dnbIj
	 uWoWP7fNvMiMfc2EOdHpOROMnPewt4GDEBMRAOCD9F17pMSzmJDSlErYRy43Ec0GTlA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=QSB+ifTl;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0F0A60A261C
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 18:59:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C0F0A60A261C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=QSB+ifTl
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-53644b28706so19849541cf.3
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 10:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795201146; x=1795805946; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
        b=QSB+ifTl1rJjRm8Fm4z4DJKCqYBQcvNzHl1jAHry1Ys/rGn/dab6x27R79oaTdNkxQ
         U1cZpNe8gzrJSNHSWrxFh7Z9kxBCnjg0wgNfn3AuePe+JsDIB7Bm7qCQh142XZY/j6SV
         E4NjWA4BMdi5S0nuwMZhvTBreVpSLmTIZdKRRo8ytZz2JaPS8kxGAmifPTiVp7nxHeu2
         I2PH326j3ygUyyyTIH5dv265oi33aOkcwpeoxhT4o6g2evsYuT4JSv8zJb+5IQYsjagV
         A8WUvoRwdiDCJAvE5mO3zyKyBh2kV0rXrm0o0d11tuiiaWg7S+ZH2N1DKfhPX+bgVvSn
         kHhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201146; x=1795805946;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QpjWV7nVPK4jNL88HvKbtHJ/44FkOvQPFo/KHrxl1Aw=;
        b=L8oqlHqJZIXVKTrRhkHmyUu4Z341wTkeTGZMblTfA6vxhsioIFKtLT0R1s3VuEiNWx
         pQ6a3g+Qb9snnuhPedy0x0O40P3t3sC5CtoXBRjvC4P9ZuUfdaTa7lMIkDhIxFkgCQRs
         PyVdmKQMO+JLPfkUJE586mcqr8oXzp6YMgEcHtlyzERV0J4pwU1x0sP6r8QYckMsbkT8
         rYxn3bXQSYnk8omb27APGhVapK/rgVWCElhquQ/FNdZwWr2UY1Esb/A0f699RuOW+Qer
         HT3FbnM8fzDc7zK8oU8AOaATFKkzbwsCGq0X+9RrAvAWydfEq7lEzk9qPBLCnP6i8Emq
         o1NA==
X-Forwarded-Encrypted: i=1; AL+hErGjlw3cn/QEHmb093OByy3SzJgeRqN8Iu8fzrHzVWI8IXJLWFkTpnVbiWK0kH2iD4SIQSA2aUk0UIVuPQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9P8A0NTxxCuX4Tvsq7KNV+OCBqXwS7NaJKXMNb2wRwTfEmZ3IN
	Rw+WBn6NwuP9GIp7ufVePlD9o5gIGLA4vKaE2YS8saGWzQzZaqEdxKHHE2G4IcN6DmU=
X-Gm-Gg: AYBFou3q/K7plkvvNxhOqDA8sm80ARcUwvUIQ9WxtvaUPfDj3dxG3YKuR33ImE2e7GE
	TX1UI2FLVbOOLKHM2ELL6pb/vcpOcq2Ar7CjC3rpeZ4jx7ZdlTtpnadJZhGnTsc1XMIes3rQefJ
	GDbBLCR538bvkqV2nX0n2Q+AtBlbltYrmTaxIFs3jzyffWhRLObDI0bVnV/lMjF7mLsqFwv+lG0
	8AJyaf1Dl/uB9UsdoXDrlp9VLQdWWQdLl6xw2BlTXy4zyvTMIo43iA+LqDmIwjcNy7OiNDWnHSw
	RJdd/pzHpPrUyIvcynMvhYCNnT50cECvu4/WkS7r4ET8NZZkqSKp9pxdRLkBw5wBsWFfhyA744V
	vN1EvjnJPyJmHiloMy5gyn2FFfV8OXjCnQTOeY3iWIg6SQ+p2dAiUtjHTZ18p5FwmGSfH6e1Oxr
	P1jPkYaywtyDIYraHQo5xEBsoZn32km0QxHBEDfvO0LwaQjQad/EDMRq9G7r93ioHv4LvuUXA58
	FqVVRxW5dWhHak/L/WsPDeOfqtLDXuRmD3PMaMsX5UctS3Jf4PRBOlNpMQ6KwfDxsCwf6pnaszT
	vDqm/3rUFHJ/GMFWl2D4qv5zJsiU42V+iRSjiNCzHWsLi0twUk7LebKLCNZBFT6AKJKdUiCsqi1
	Uhe5TEvU=
X-Received: by 2002:a05:622a:1a89:b0:55d:2c9a:3776 with SMTP id d75a77b69052e-55d76a811c8mr74428711cf.65.1795201145651;
        Fri, 20 Nov 2026 10:59:05 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d7884d01csm30305771cf.21.2026.11.20.10.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 10:59:05 -0800 (PST)
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
To: "Gregory Price (Meta)" <gourry@gourry.net>
Cc: Yury Norov <yury.norov@gmail.com>, 
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
In-Reply-To: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
Date: Fri, 20 Nov 2026 13:59:03 -0500
Message-Id: <179520114342.412063.6068641130948664600.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-20 13:08 -0500, Gregory Price (Meta) wrote:
> This is v6 of the Private NUMA node series. The series falls into four
> parts, each building on the one before:
> 
>    1-18  mm: introduce N_MEMORY_COMMON
>   19-26  restrict folio-walking MM services to common memory
>   27-44  N_MEMORY_PRIVATE, kept out of cpusets, mempolicy, accounting
>          and the page allocator's ordinary paths
>   45-61  private node features, memory hotplug of private memory,
>          dax/kmem private mode, selftests and documentation
> 
> Patches 1-26 change no behavior on any system and can be reviewed and
> merged on their own. Without private nodes, every path in patches 27-61
> behaves as before.
> 
> The full stack is also available at:
> https://github.com/gourryinverse/linux/tree/scratch/gourry/managed_nodes/private_nodes_v6
>

Apologies - my b4 prep dropped a commit from the stack because I made
the mistake of filtering on author (myself) and it stripped out this
commit:

https://lore.kernel.org/linux-mm/20260923211041.3127588-4-gourry@gourry.net/

The commit is one the branch listed above, and should be otherwise
indepedent of the series (can be pulled in ahead of everything else).

Sorry for the noise / compilation error, won't happen again.

-- 
~Gregory

