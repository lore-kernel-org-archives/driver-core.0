Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640244;
	b=FdqOfVWvX+dw5eh9Aooj7sefImsmrJz5dFxnf8k0NshzNGCYtGK1rFm9pcH8EdHls1ma
	 pQaK6jYsadurWfYLBro/OR6SwLVvcgliVQYQ9T/ughJrV+wWXlG6b2MZAqoPEhcp2ofeX
	 NO47eZ+ggy88nLfivjTt4jyv5pw7+tF1WhtUJ3YZuo7q8zGuWHszNZYEvVqISqukGo38E
	 YQyUOqQbOI2QctEPn34WdiTwEUFZZc+WpmyB2eoaVoiokVQ/ebqc9m7r8Yihs62FA5wVI
	 QBorMgKeAwAvErf72vi2gsJdjt1s1xeHd9V06tFGDPf03pl14in2+OqbibrOoBYXvrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QgwyyRUkaLESkoMsTNOOlPxwzMonfztNgfKNstfbYo8=;
	b=wws/VLg6HplFJKaO0jaZts9RvDAW7fBfSz2Enkg1ME3RPlnHfXFpZqVNCXos15SQ+ebN
	 XHH9vVoMGRyhoaANuDr0RLXQKw/uJ948gcFS75IlsLyocyc8gW6/dOSA1unwZpIYSed2Y
	 oJZHIeT4R6doZNoVYRQwtEZHVokr93r7A/2lrBtPl86ePR2s5ClK30P9fITjxj3I7KR09
	 9vCmr88qmIRyAbfM44QGELx+V76YP9dcgUjOA0BGQPKbevH+kf6hMb7KXxJWrksNfdY6O
	 oiy5Lo3MRKqTc8rwnm+7NVncnLe6ukdziUITM7+MslYd96EW5LcmNTu5DNcvLAulZgw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=gSe0itWm;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3ABE606C0DD
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C3ABE606C0DD
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=gSe0itWm
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ebf4cd218so27851486d6.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640243; x=1795245043; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QgwyyRUkaLESkoMsTNOOlPxwzMonfztNgfKNstfbYo8=;
        b=gSe0itWmu/LljWYBbYMFUr6nR9G5DmXBDrZKM0A/QdzraFhebTIqSCkrz9fFkG1xDS
         K+5ykrf+FrXjVgkLC3INgxKr1HJioBJB/DCqQnWEq6xaWjB7sWToQogksoblgF23sm6N
         WzxeVAh3y5rMJehgUUh6FIXQju27nxPrCez7MUngWCEnr/DdJ52sL8KLYHokHIAz16IO
         TAYI6pGM9SpPfU/hBReGrVV1gOP2VKiSpo1/5BYD4zp/enArS1I2m7rHAdtMD8WU82wy
         QtlBg7OXNv23B/r4KmYAdzaZ2+rWyG5gSGSn+bScQUiZ9rzcS6883+K3/cyDzTEXtoCW
         XH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640243; x=1795245043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QgwyyRUkaLESkoMsTNOOlPxwzMonfztNgfKNstfbYo8=;
        b=rp2n4xLCFRqingL0+0hlyTsXTNJa1UjfwLrXGL+FzGxqiFGlPbDj7ZOEmigEIjl78p
         Bj+dWTrzJhQRuDWW1A5zmQaNkp26nn9EQuDtgO+F0nqM32W9cLRghUey429eV73/OUPu
         EYJZNKxku3nZtBtGeMOUV7tomZGkAoQCUv/wFFjrNMkOPXbCQhrQZWLciDSM1DwExdwx
         I9nsweJckML/aLCDIZCkHkD23TwqqEePUtaBNNm6FTqZvF1JgiKh65En74T1lv9DsmSN
         nSQ6Qwq7WgTFjPV/mQBYufAWr1R7ctrZKsMSl1MuJ77JU7FyDWCd4CAbzJ5GLNyoPh8k
         Dcxw==
X-Forwarded-Encrypted: i=1; AL+hErHoVz6SVUQI5jKyAbVeCftz9ngNw7RMaZ3NSzgZgXgX5oUdEQjG4JtcRcnviovTo//Ml2CUhYBT/5ALHw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8XAPnu0SLcuDQRS5CPxr5WVzvXOi/rhoS31Y2Ri7yWDngzrwqg
	eCpExYkmFiN8XHfAmlwNnVSSvoqDV29uThXc/a5s8KG3zgjxs4weeRUiWUt6kkTq+RI=
X-Gm-Gg: AYBFou1IltJaayA6UPL8JhnT4CT1fU/GPkICz2MsOiEZa3cOmnl59W/VmWQKyZSKxM+
	QInqvsqMyhX4Kvnj6QlMQWNqbfOqYG9G2/NfQuCPj9ZzF8Tdgcg5En1lGG8FnAzeMiWSEWxzEen
	Sp+l93Jv5s2kRfLxMu/2qpxgiYd3EuQjlMG40D8siEnfkrVCNa3mP5zPgmIEd4TL0pzUFYbVwWU
	QdDt3MMI/PT3vTiAQWJMMJYIvLVIQEXYgL1M2bEAVRH8dGAqSaSx10FTw3em7sxExaPl84PgXv5
	+9+AFsU90xRkS0FHqPwN+dMgq2X7J2zXY63IV8/PBlKDqNbT1EgVXyRvbfWCYMIz5eP8Far+vcC
	2NHIAb1GFExqXmdgsdJ0xXuYSPHWPfTNZkKa5ZK1Xzd6qOMjNpJ8UXctnVVfCIxUzR6janD9DZ5
	LUUpRpDXmaklFZcZhOUeLB2Llj//mS+loOM2YXwMnaBTn2lrmSxlwjdrzr32oVhkpwH7MeaKNyz
	uUmzPy64Vj6CKSzEYh577/w7qlIIlsYElJ5Q4bT0tFbymxMRGxghWps+Bz5z4fe4oaf98zYUfgx
	BaU0eOyFoxTlCowXetjBSnmJ/5EF5NgpKZJKB32x4PDMF8Y4s0BDJ22MHpP5jqAbe+NZLp6Dxp3
	nfdMepCFNtbgaILc=
X-Received: by 2002:a05:6214:8503:20b0:91f:1498:4e2b with SMTP id 6a1803df08f44-91f24194a18mr55953066d6.9.1794640242842;
        Fri, 13 Nov 2026 23:10:42 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:42 -0800 (PST)
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
Subject: [PATCH 18/22] mm/compaction: restrict compaction to common memory
Date: Sat, 14 Nov 2026 02:09:55 -0500
Message-ID: <20261114070959.3490008-19-gourry@gourry.net>
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

Compaction serves the ordinary allocation domain.

Restrict it to N_MEMORY_COMMON:
  - start kcompactd only on common nodes, at boot and hotplug.
  - walk only common zones in direct compaction and when deciding
    whether more reclaim could let compaction succeed.
  - compact only common nodes for /proc/sys/vm/compact_memory,
    and trigger proactive compaction only on common nodes.

The fallback zonelists hold only common memory, and all memory is common
at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/compaction.c     | 14 +++++++-------
 mm/memory_hotplug.c |  3 ++-
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/mm/compaction.c b/mm/compaction.c
index 426563acf7acf..6a40e1a9ba78c 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2496,8 +2496,8 @@ bool compaction_zonelist_suitable(struct alloc_context *ac, int order,
 	 * Make sure at least one zone would pass __compaction_suitable if we continue
 	 * retrying the reclaim.
 	 */
-	for_each_zone_zonelist_nodemask(zone, z, ac->zonelist,
-				ac->highest_zoneidx, ac->nodemask) {
+	for_each_zone_node_state(zone, z, ac->zonelist, ac->highest_zoneidx,
+				 ac->nodemask, N_MEMORY_COMMON) {
 		unsigned long available;
 
 		if (cpusets_enabled() && (alloc_flags & ALLOC_CPUSET) &&
@@ -2855,8 +2855,8 @@ enum compact_result try_to_compact_pages(gfp_t gfp_mask, unsigned int order,
 	trace_mm_compaction_try_to_compact_pages(order, gfp_mask, prio);
 
 	/* Compact each zone in the list */
-	for_each_zone_zonelist_nodemask(zone, z, ac->zonelist,
-					ac->highest_zoneidx, ac->nodemask) {
+	for_each_zone_node_state(zone, z, ac->zonelist, ac->highest_zoneidx,
+				 ac->nodemask, N_MEMORY_COMMON) {
 		enum compact_result status;
 
 		if (cpusets_enabled() &&
@@ -2973,7 +2973,7 @@ static int compact_nodes(void)
 	/* Flush pending updates to the LRU lists */
 	lru_add_drain_all();
 
-	for_each_online_node(nid) {
+	for_each_node_state(nid, N_MEMORY_COMMON) {
 		ret = compact_node(NODE_DATA(nid), false);
 		if (ret)
 			return ret;
@@ -2992,7 +2992,7 @@ static int compaction_proactiveness_sysctl_handler(const struct ctl_table *table
 		return rc;
 
 	if (write && sysctl_compaction_proactiveness) {
-		for_each_online_node(nid) {
+		for_each_node_state(nid, N_MEMORY_COMMON) {
 			pg_data_t *pgdat = NODE_DATA(nid);
 
 			if (pgdat->proactive_compact_trigger)
@@ -3366,7 +3366,7 @@ static int __init kcompactd_init(void)
 {
 	int nid;
 
-	for_each_node_state(nid, N_MEMORY)
+	for_each_node_state(nid, N_MEMORY_COMMON)
 		kcompactd_run(nid);
 	register_sysctl_init("vm", vm_compaction);
 	return 0;
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 410a29732bae7..c8ff60e6417ba 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1209,7 +1209,8 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 
 	if (node_state(nid, N_MEMORY_COMMON))
 		kswapd_run(nid);
-	kcompactd_run(nid);
+	if (node_state(nid, N_MEMORY_COMMON))
+		kcompactd_run(nid);
 
 	if (node_arg.nid >= 0)
 		/* First memory added successfully. Notify consumers. */
-- 
2.53.1-Meta

