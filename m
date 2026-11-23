Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442719;
	b=rRIfCrWsMfHDCWEn/FY+UgSdOZg9ct4kEbPUBynaNtC6pqnckC4hFnpxZwHhCzKTo6Ra
	 OA3HsJIG9ugtOlmOyrKRTkW0ha+2TF+M031Hk+SxTR4PR9TPss9lTjCyALazeMaGzH/4b
	 vYT/39h+Bo0KYQxylgysQC4nscQS24aM38dKerH+Fb+1EBhQNwDaswCVZB4HCB865U2zT
	 4OGhOiYm5GlVWw7Pp5pqt2VI5ThtX/ZdabKKviUKpq2N3FpO85ayGjow8elEopC4NXiRS
	 O21Z85zfbdosReXvekekXkpSqe/V4XqWA/+Nm1SO56krBgwZ1xpnVFBYrJGiP+utcSA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442719;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=njozbmbCn9bcbYemCFYN4fFcerXn8LRoys/sYPRNDos=;
	b=ervPRoSfKzeA4ub4nFMy1ZlWea+MaolHcf7Qcgp/Xpxdv1C8C+4g600vcoPNL2oMGevm
	 Mm0X8gLYko9IyjTlu+1wVU9l74OTYfyY7RXncuBRCPVgUO4xOC6NtOKkPUYwhF4InOCJz
	 TBOO39xsp40SG863rBlTtHvAODwRS2QNyhtOK4HfohLLME0F34lthv3H691IsPYRh2NKt
	 3lx57tWEuteJH9T/W4J5vxyInhS7oK3qs6GUXHPcQ+mZYXEXZ/GdoaK2ee7XZscH3N2O5
	 4IK7gn4d16ontG1DfA2pW5XtvZWidHeOTEfBwGz5JyNlIy1H0dI15StK8dLYoSPdmtw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=IfpE9Edl;
	arc=none smtp.remote-ip=74.125.224.47
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F994606A31A
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 14:05:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F994606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=IfpE9Edl
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-67db89857abso3354824d50.0
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 06:05:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795442717; x=1796047517; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=njozbmbCn9bcbYemCFYN4fFcerXn8LRoys/sYPRNDos=;
        b=IfpE9EdlC+qOjn84TuiXvygKCUuW8B5d5ubxNiowN4CxXnsCI7nj1OGDKGpmq7FNKl
         +3HG7s8ebWmTTtGVLkonigU5PBK++9I0JAwUK9Xzv2Bk6ZNWH/8YAZlYUQVJR8JBRoN/
         TRk7HYw5vKBE7veXbRbF+1JInwy0zAdccxhVsNym7kF2ItGCpyLwnP3C2kwPQRd5v9oO
         hZE4nJRDtPD1KZ6cxhfYuuPR/DRzwAHaYN61qUXHujqvfbVNoc9aDskrVxaIY9Fc/4T3
         ZwKRe97qO95nx/udBngEPcj1+l4/98RZLKYga8hg77HBmJEGky9t5VOQjsAiajaAPjb/
         AXww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442717; x=1796047517;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=njozbmbCn9bcbYemCFYN4fFcerXn8LRoys/sYPRNDos=;
        b=Gx+TygXQ6I1oy3rHktdLtfPgcaJCq7Rj30rJWoZt6kOCrilmVnNh8eX96LD/KmoEHG
         VDxz5qtm40wcf30Y3DkTS3U/igAorqsyk3MY1BfIu1kH8V6b1NOug1f+yOU6HlpyZ/QN
         l4ev50qf0/KytKvoabVrl/sCRmvEfD6LUmu9tCKEPUJh02Kd45ZS8o4zhdfflwDpMqJz
         lBM0NlS0AqA9Ejlj2ZaJty/rgx/f46HPTrztamEwsw/XpH7MTG6OSNSZbNwH8bPQiyW1
         tKHXMzTADRkWHEIDudT/ujcvmVD3QumQYzCP6/e+7x3KdSJOJm26UuEFYQaon+oXWtS+
         kMPA==
X-Forwarded-Encrypted: i=1; AL+hErFQjE5ZuTYq7qpLSXRUKo96aKFi1cWqAx9C5tsBB4czDnjQoYs2j8AzDHdFrGSIDW6yTH4ievWb9cNZkw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/xDVooUgmNIFxp+GHqWTxXAaUAKXwcy6tvVZo46VlI3AK1XO1i
	fbT2AUe+HEtoRfLoJYdTdHzsUUYJM+pJrZhvSAuTDmjPFAUkgGbInmK0LP9/soUsl88=
X-Gm-Gg: AZFdTZdcV0LEZBTkNLc5NKx1fZUY6ePM36CytdBxImfjoo7MeJ+zAaS7CjU4bzttdWM
	B2NJZu70x+lGZmEq1dPWr6yDIrRxPx57D7gdAO3I4K+vglBOHILZnXciQAxbMZGrtnhLJ0WbNCn
	XwGw0KhHtl9177wEyrLq6H1Rkf7NSHu3RgjM6f5z9NGOn/yonwl8uBch962OdI8WIyH5ERJ9/IE
	QA/YNXDGgkX9RoVG9s8LK44L4CnRd836yOjzPPbLU1pbQRlB7e5ZBaezSRbpagU5D9yz3oIlq5p
	wIRJJD7ie4kjIFxef2wKD5avRp/EG+wVN2gbRL0FuzU5Cfa8ftf0fpeyrZDibq+Lb8BXCwrfuls
	zIZWk2PoToVC7nKbTSpTP++LlK0KXoO9C6ceigIx16XlO0g79BiV0Pa8QMJXmmj47r2J+k1nASC
	psDqLnoRGL1dGihOK8RoqdCyeMrEihDdeTSz+4vwn59kbvcqyfEamVvdAQtEZYIu3zDQ60T/rfu
	Q+kxAsCIX6s4rdsfDGAvtUuPRPIkAagI5isw6wChlJbLwB9P8/L6+Vdtk6kFXJd6higIFjBn549
	sKqNgYuoMnNXull3X879WbLuX/cn56hpsIMDg4N9wK7R3i3FqlReFx1VFVckbr/BUHSw1S3tV2C
	OI117kc+fh52SoyDuxTFNOGGztd0B
X-Received: by 2002:a05:690e:4881:10b0:67c:efb:636c with SMTP id 956f58d0204a3-67df4425656mr2221811d50.51.1795442717363;
        Mon, 23 Nov 2026 06:05:17 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92134a08552sm106091806d6.34.2026.11.23.06.05.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 06:05:16 -0800 (PST)
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
Subject: Re: [PATCH 23/60] mm/damon: restrict DAMON-native folio operations
 to common memory
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
In-Reply-To: <awMcsTqyCgQ0dISw@yury>
References: <20261120-private_nodes_v6-v1-0-74f5f9a115c2@gourry.net>
 <20261120-private_nodes_v6-v1-23-74f5f9a115c2@gourry.net>
 <awMcsTqyCgQ0dISw@yury>
Date: Mon, 23 Nov 2026 09:05:14 -0500
Message-Id: <179544271490.412063.3555696768623975197.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-22 11:47 -0500, Yury Norov wrote:
> On Fri, Nov 20, 2026 at 01:09:14PM -0500, Gregory Price via B4 Relay wrote:
> > From: "Gregory Price (Meta)" <gourry@gourry.net>
> > 
> > DAMON acquires folios to age them, check their accesses, and apply LRU
> > operations and migration. Treat these as general-purpose MM services
> > and restrict them to N_MEMORY_COMMON.
> > 
> > Memory outside N_MEMORY_COMMON can still hold ordinary LRU folios, so
> > it would pass the checks that keep ZONE_DEVICE memory out of these
> > operations.
> > 
> > Treat these folios like ZONE_DEVICE memory.
> > 
> > DAMON cannot acquire such a folio, so it never ages one and virtual
> > address monitoring reports it as accessed, and DAMOS cannot isolate
> > one for migration.
> > 
> > Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
> > ---
> >  mm/damon/ops-common.c | 5 +++--
> >  mm/damon/vaddr.c      | 2 +-
> >  2 files changed, 4 insertions(+), 3 deletions(-)
> > 
> > diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
> > index 15cabc79613b..57201a0c5e3a 100644
> > --- a/mm/damon/ops-common.c
> > +++ b/mm/damon/ops-common.c
> > @@ -17,8 +17,9 @@
> >  
> >  static bool damon_folio_acceptable(struct folio *folio, bool monitor)
> >  {
> > -	return folio_test_lru(folio) ||
> > -		(monitor && folio_test_hugetlb(folio));
> > +	return folio_is_common_memory(folio) &&
> > +		(folio_test_lru(folio) ||
> > +		 (monitor && folio_test_hugetlb(folio)));
> 
> Can you minimize the diff? That would also improve on readability IMO:
> 
>         if (!folio_is_common_memory())
>                 return false;
> 
> 	return folio_test_lru(folio) ||
> 		(monitor && folio_test_hugetlb(folio));

that's reasonable, thanks!

-- 
~Gregory

