Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442547;
	b=113T/HNQGydx+V+Oz7mQYv2DUkOwWP9hufr9oEZrNcll8DBYges2JmqGapl+Zi5FUeRl
	 SjhfxoizMEG4VTMRT9COPKZg8mfrImKzvwtvH7ZFJrXc+KpxovCK4LiZGh2wJdjaFgF9B
	 L/x1kzDHiIwlGzMoTi2dJK7JrJkfwyDoOmE3w49uSqqpofn/xzRLbkMEyYuRACLuVeSgh
	 K7fITXGZj9BfLlusYOtRfZtz4c4OZzBwtgFCV22nwklTrrjuDfmARIfP5ODHF4AGTka9G
	 3Tf0j6moiIvYXpMydCbwhLCsLR3Z8Ww+TxW35dJZzIy7sfjxHKB3ucKrVLPmf9jVA3g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=K3PKiWxJL5rA78k4RAfL19Ict6G9pZhcXRFYMUNqZcE=;
	b=zghsEtAyuWHOGhx9hidZJGI1OgIwwS8KixS7Izk/q2ACqrrUHwAvVJgl8o1/yA+qgQQ3
	 XPfbbp/OFkz++SJEojPga/pQ9JIZsHINH3gt6uDjGCpG/vBQvRG3EPTm8Vc1+J+5zAf1f
	 ZsuiVJcnTUmCzFq5akHk0AAlbXXTo9cgHRVvAjyHFQk0sZFFJXdxXrEN1pdrvMhxT/Nrt
	 VJb1YadRuE7P8nOGPMQ8Mh2X2qPg403eY854mWhL3bg/wkGrpyELLqSZUSdEveRDKGwk2
	 RXt0Z1mIdO9fl2kYUXZJ3Znpi7Abos2WbgsqHh+4paQD1vVNl9MuZlKDQHdKTeSvDoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="LTaa/hni";
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D5C606A337
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 14:02:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82D5C606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=LTaa/hni
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67daffde88dso1852748d50.2
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 06:02:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795442545; x=1796047345; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K3PKiWxJL5rA78k4RAfL19Ict6G9pZhcXRFYMUNqZcE=;
        b=LTaa/hnicT888v9SHEA5tGVCKN/z1DRTPjA4PbYn57zK1mAzsI2Gp/XK9LEY2cQx6k
         A8x1nF3+Eph9f8AGeyK30xpdqpr9SNV6LmmMYuCVOff78QtrhGrhZU5VxFt2RjLjzxiq
         5VU9Iha6qt+/0sBtVNExIvm837Yaf6G+aaKsVWv81KNHvTLp73W7WUie58esc4AOQ6tt
         twHyATo9XXBvOO72zI3cIMMRPes2jiIetO9o108JWTZE+LLTMU0gUgWgEgfJo6IVK1H8
         RnMPgRZZh5riqVbkR/nss2W2/CMGKLROw6mtVCmrpNsLrFK7TZJv5RAPvlpL1xhdhywb
         OgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442545; x=1796047345;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K3PKiWxJL5rA78k4RAfL19Ict6G9pZhcXRFYMUNqZcE=;
        b=V6YY8B+KQESSzIMZM0o74yUXVlzDk8T6+1L0OJRM8nYJvWV4ZVVjOOyiFhRmSFcJZp
         gS7LMFcclKU8NZrqHxxTOH7m/jm5M3Q4H6vHQ0Z5sm/5pApX6uGEAwgjs5lP7mFjG+3I
         L+lGqNFaGbYqMgvi0IQvBZ7DmJVOG6XPs5LZVBBf+3P4zhCKuFkDc93WMcdn2b97vDaD
         yVgxK8SSoyc1uEm3BzsDduQg/8BcBprkchxFFr6kxuG+JXNL1jYpU7rAWligQ4aoiFxd
         O9Y+zd8zFavqMKtKFpkyO0e/OEvmM1qggKzymnhYA/fwW5+BZVL1HJDcSV7PUkGimuY8
         hxxg==
X-Forwarded-Encrypted: i=1; AL+hErGPz4/9eAG+r5Fc+Kk5N2JlhX/snPHheRiabD/XrulIffyTPTO9SD59dXU5prx799rDbNKds1/m5WVeEw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/u43w5kPsgAcEOFqUOEx/ILhddTU62rneObRZw2upGLaBLbayC
	i7cPdj86pPmZQLb2YkGuwJRGxNBEcxr5+1UvkbzoYC3RsJFuHF+4kNr6Hi2zIBkoAf0=
X-Gm-Gg: AZFdTZeivtTq0TpNDNDhGneX6UyGUK5JvgHPUacZo6T5IzqazQ8JCvrVTSOwkZWduLO
	HO1xbtfFbZaPKav2Jt1uUTKTx470zZh3tCG/glQhmb0E/LhCs1x4brBAJVjdh3cnpNp8dmO1BiW
	EQlzh9LUb8PUU/GErzLwVvcmHZHrKFIC3d65Glt/v1iSWXYs7e472KpGV+8uh2QWlL/TmoQKY7S
	c8ru+5VLEOt3t3wEg0EiEaCrrJJA1jS6HhgqZEM+xsltvjENT8DuNgIt4VRDsh7moTmmY9Sqp4a
	E9epWFJFP8hseyVkZ0gfMWlaGDEjUp3wmdW+WKwMikbJUytJWh+41L184KDJZHkSFZr738vHR6C
	vS//rzm1HygopJQTiBTzfQq4OuVB2ns155TXATybnBxwDrvrTmQT5eVSYfXulqIo+AFZaSdS2g/
	V1WldeyCJRXJDzevR5hetceggChEhJ8+WEBmN6gyLo/u3k/AOPKDi+6oBFGS20zbeg+jwAUqzeF
	7J4doMg76se7ttYCnJkFRK5KeEgCuwxpe4BobpAGZ0TsBlr8WEpU0Q6+5kuQbiiKVHZNqhm2z5x
	DCKPCMiTstc0rBY8pa6MZrBGHkrO92XmliN/kHzXDekPnE9wB26C7pAjlg/XdtI9J68YjfRCd8V
	Jk6hQ1os=
X-Received: by 2002:a05:690e:1449:b0:67c:b95:6753 with SMTP id 956f58d0204a3-67df451a476mr4209002d50.146.1795442545280;
        Mon, 23 Nov 2026 06:02:25 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9213515f467sm104854846d6.41.2026.11.23.06.02.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:02:24 -0800 (PST)
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
Subject: Re: [PATCH 18/60] mm/khugepaged: base the recommended
 min_free_kbytes on common memory
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Yury Norov <ynorov@nvidia.com>
Cc: gourry@gourry.net, Yury Norov <yury.norov@gmail.com>, 
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
In-Reply-To: <awMbTMt2M876rTy9@yury>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
 <20261120-private_nodes_v6-v1-18-74f5f9a115c2@gourry.net>
 <awMbTMt2M876rTy9@yury>
Date: Mon, 23 Nov 2026 09:02:22 -0500
Message-Id: <179544254257.412063.6102711886866280853.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 11:41 -0500, Yury Norov wrote:
> On Fri, Nov 20, 2026 at 01:09:09PM -0500, Gregory Price via B4 Relay wrote:
> > From: "Gregory Price (Meta)" <gourry@gourry.net>
> > 
> > set_recommended_min_free_kbytes() reserves two pageblocks per populated
> > zone to help THP allocations avoid fragmentation. The reserve serves
> > ordinary allocations, which use only common memory, so count only the
> > zones on N_MEMORY_COMMON nodes.
> > 
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> > ---
> >  mm/khugepaged.c | 3 +++
> >  1 file changed, 3 insertions(+)
> > 
> > diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> > index 2dc4245814df..a930d99f89da 100644
> > --- a/mm/khugepaged.c
> > +++ b/mm/khugepaged.c
> > @@ -3151,6 +3151,9 @@ void set_recommended_min_free_kbytes(void)
> >  	}
> >  
> >  	for_each_populated_zone(zone) {
> > +		if (!node_state(zone_to_nid(zone), N_MEMORY_COMMON))
> > +			continue;
> 
> This is the 2nd time you add this check. Maybe fold it into the
> for_each()? Assuming, you keep N_MEMORY meaning unchanged, that would
> look like:
> 
>  #define for_each_populated_zone_state(zone, state)            \
>          for (zone = (first_online_pgdat())->node_zones;       \
>               zone;                                            \
>               zone = next_zone(zone))                          \
>                  if (!populated_zone(zone) ||                  \
>                      !node_state(zone_to_nid(zone), state))    \
>                          ; /* do nothing */                    \
>                  else 
>  
>  #define for_each_populated_n_memory_zone(zone)                \
>             for_each_populated_zone_state(zone, N_MEMORY)
> 
> 

thats reasonable, thanks!

-- 
~Gregory

