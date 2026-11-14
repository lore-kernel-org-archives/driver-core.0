Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640230;
	b=MgJ8qSrlgv24iDd6ji5kCQ4cDf7pc7UQkHtZCmsB32mO2ETXFQ8ofHGp5OCeH5xiSRhR
	 4z7jG/RExyIht1aLDEEoiJAQ7D+90hhV6DbkWnf7T1b7dW4QoS1XIh192DY9Fh8tuNvAJ
	 HzzI2tP6OrwMi7iyTer/liljWrTzHxYro+qOv3Sdap3rBPZaeXQQqRWdzD0+qwMYsspj2
	 5LoG+L8XpKq5Dr2Z0h89osPR1iikA1eKe3GpJixtsidTBC63fgOUUnxZIgyrqrmrQj2AS
	 9lhZWPttczYT6biAESMrbazltGIRB5A4v2zrxXsauhvjUWGYHsqTWZq7+1A04UwH6Aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640230;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=WCui+DSNeboB03hP2f7maV0wOWIxjAUtx4hYmP2Ak68=;
	b=FDEOx0vwYF/6IAzeAFBxJ9UwWB5fhkbtp91JcoDdsywm/ULANcW0AorlZ7MOwEMZ+wta
	 50FsIFDcyl744z7krapPUmTOq3gufdArDu4EdJjyFbFWKqxNqdYWDFpoeguMpWQ9jKrgm
	 1v54+mzaBF1IdG2hbr9il58tPMhdEEXoNAuVvxK9quCkPKWes7nm932koa7RmgXKJseMv
	 SFUBtnMPCQeLfc+ZXSKlV4Ws9vIKnh4XdQ0piRHKvarX8fBX5pkVzFu7q+5849qJqiCjE
	 EVsPs986uPir8XzR86vqsS7r2f09Il0rFou8YRwiEEdd1EL4Rf0bt89r4G0LIe+4ddw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=r96HC8+h;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A4660A6F61
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83A4660A6F61
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=r96HC8+h
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-949657a20d7so26130485a.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640229; x=1795245029; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCui+DSNeboB03hP2f7maV0wOWIxjAUtx4hYmP2Ak68=;
        b=r96HC8+hZdJqQGiMTPkKDYH8RsKClX8l3lVrUZvAf/mreC0VVSi5JpQcQ4aWCTj/ok
         x9hNBnDEjyKNzlkZcdlVaGd4WsakPhxeUChGRpbY7PtmMXkyM/BI02G5zEfx5w2cc65P
         QWXDCXVHmGmPPMK9IhV49jB5DX1QKFGD8DpdNCPb2APrtxZFYwlGtkf5PtY2ljeylb16
         Fr6N/Lne8Rt72540KUJ5sk31XlU0S8/czimqashsTwfRFfVgaZJ97HWn77o1hCg5NPE1
         HPz+lCgL4gdjrngQ6xer4AroQswwtrn0Z4jMlQ66sWHpyz+WN7C5s/HKconb4AUnFmJV
         2hBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640229; x=1795245029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCui+DSNeboB03hP2f7maV0wOWIxjAUtx4hYmP2Ak68=;
        b=dpymwUxS3Jc6hHAow0U2mMRq0BbuEy6HRP6lFNtz2RMrtCqTOITdWfQgBWTT8j+Z9n
         Za4ONDhN2i6hxNxldKCafMXozbWDKanPpTawejG+K1rBNClHjf803oBChwSyRbN0fWYu
         XF8M5fi/Zvn2bGr+zBPHb6OHyxgybuASfbr1TPANQWTB81jN6eT8utUMWkq21diUts3v
         KhlmETJd3tCg/ghvYkGrlrw7/U1oodFgsBU4TxUVxIcEA4gG+YL2dlUGFPe7VXnOF/p/
         30lMZQ3xG+Js7gp4qxbnOsF+UqyKywUBHLFUg1rpQAsAc5pVRdyB5+uV1FgPlwpiNwq3
         NzDg==
X-Forwarded-Encrypted: i=1; AL+hErGjsrolFT8slpngL1G75Ma1zRSR5Xfcme1i6eSmWZg5hwYzO8syPS8nb5QrK5FCc/6+3haMTIh7V1ReZA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9f/Y0uRBz9FRWNK6/EcTLX26kA6Vel1oSTyw6zveII7qOc5GtQ
	rmf4Tesy5GHMEVIc4M1IrXsYObSpJlaNAbqjVFp5F9uoeC2ZvUX68+tQUkBFGkhWMCY=
X-Gm-Gg: AYBFou2N7vlMj4hOcxgDVPm2/qDNPJmvNWvQJu7u1gnM0LQmaZ5lO47HfIFMwyj7B7B
	/s+4spIfDlISJqLMI9DTxULgqEDfeILOJoVr2rB+E4Kw2Ev/ACClpzA3XJ2it4/pEdqH2jcWlng
	Ra7PTsL4NjF81leqeknsTgN+bSjey+MVjOj67ZK484PDT45ikyBlLUwdac4VF5dR3igSvWqRuV7
	hubThcEBjtUPGUPhJYzVKjriPsNILHBdZ0ZmmUXooD9K1E+pM1Gf19R0hRPviDaPa0mQQ4BlZCd
	q2C47sZVbB+ghxm62UgXHJZjWR+tJOh+q9tqXy/H4J7aefyDQiDbe1mkFBvDOId4TIVmWINUC+A
	Ar/gYehrJmAlfQ/C5UHuN7O5zf2ISevj5gfCKdva1kUBcIGQpVjVCRyb6I38IX8ouPsLf+XV5hZ
	UW8+K2e3SJYYpQyHecWQ9E+k16w8biugdLPZ5nI2mglqMRq9r6iBLD8TDno+n6RA01dtm+vjiiN
	1ODjeMbx2tIXzmkynuhv0XrYh6mqNMItH4m0dIXRgBqYQLmtOcjuMt/7cvD+/cClGaL6647v7Ha
	vFzG1fRHQ6avdJzDUMkReDS5xoBmppf0D5Njs4+t/GSxm1oxLfupCtW8nq/j52ohZ87OBK5ibBP
	H7twQsby2rRWr4YU=
X-Received: by 2002:a05:620a:4005:b0:940:e34a:aead with SMTP id af79cd13be357-9494b9488f8mr838653885a.5.1794640229507;
        Fri, 13 Nov 2026 23:10:29 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:29 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 12/22] mm/damon: restrict DAMON-native folio operations to common memory
Date: Sat, 14 Nov 2026 02:09:49 -0500
Message-ID: <20261114070959.3490008-13-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

DAMON acquires folios to age them, check their accesses, and apply LRU
operations and migration. Treat these as general-purpose MM services
and restrict them to N_MEMORY_COMMON.

Memory outside N_MEMORY_COMMON can still hold ordinary LRU folios, so
it would pass the checks that keep ZONE_DEVICE memory out of these
operations.

Treat these folios like ZONE_DEVICE memory.

DAMON cannot acquire such a folio, so it never ages one and virtual
address monitoring reports it as accessed, and DAMOS cannot isolate
one for migration.

Reject migration destinations outside N_MEMORY_COMMON.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/damon/ops-common.c | 7 ++++---
 mm/damon/vaddr.c      | 2 +-
 2 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/mm/damon/ops-common.c b/mm/damon/ops-common.c
index b9571f53e538c..51b4b5d572e77 100644
--- a/mm/damon/ops-common.c
+++ b/mm/damon/ops-common.c
@@ -17,8 +17,9 @@
 
 static bool damon_folio_acceptable(struct folio *folio, bool monitor)
 {
-	return folio_test_lru(folio) ||
-		(monitor && folio_test_hugetlb(folio));
+	return folio_is_common_memory(folio) &&
+		(folio_test_lru(folio) ||
+		 (monitor && folio_test_hugetlb(folio)));
 }
 
 /*
@@ -498,7 +499,7 @@ unsigned long damon_migrate_pages(struct list_head *folio_list, int target_nid)
 		return nr_migrated;
 
 	if (target_nid < 0 || target_nid >= MAX_NUMNODES ||
-			!node_state(target_nid, N_MEMORY)) {
+			!node_state(target_nid, N_MEMORY_COMMON)) {
 		damon_putback_folio_list(folio_list);
 		return nr_migrated;
 	}
diff --git a/mm/damon/vaddr.c b/mm/damon/vaddr.c
index 1e65e7651cd98..338876559140b 100644
--- a/mm/damon/vaddr.c
+++ b/mm/damon/vaddr.c
@@ -830,7 +830,7 @@ static void damos_va_migrate_dests_add(struct folio *folio,
 	if (folio_nid(folio) == nid)
 		return;
 
-	if (!folio_isolate_lru(folio))
+	if (!folio_is_common_memory(folio) || !folio_isolate_lru(folio))
 		return;
 	node_stat_add_folio(folio, NR_ISOLATED_ANON +
 			folio_is_file_lru(folio));
-- 
2.53.1-Meta

