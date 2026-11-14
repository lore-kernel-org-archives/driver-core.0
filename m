Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640210;
	b=n/KPoZJLgChOeFsHRcC6HWyrKTZdgf0MQuwGmKrzFh+jZT2Fvmw7eB+sXr2l6dGzO+RZ
	 3qdREg+LfHHnoD/vW64f4jquoYO3Fdg5F+gLcx7UJPQRpOqFNmJUiDowJP4iBb+9byGRm
	 b/C5KD6FSomAGh6f9HHflMj9ceq3UZ8k9gv7k8QKwiPl2RRUZ+cf4htlCEIkZNzCV97yX
	 C1eDHtIZu26qUFhkIDuSFqSHfY9I6rJmZNFjekr3vU4FWUVQZpp32gEzu8+YsNacooqNY
	 uIjCIgF6ycM+ivWBW5FDjqpE8/st/1PTiQ8KrKVQTQH2LTxj9E4jTFyGMZrO4+PoqPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640210;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Ra1qoxU4QdTYWMO3cOdicsi3ZqR2JP+4Yyk7L1wLDNk=;
	b=ObpzTs97c+IfS5E3aynjCSRbxhj9d/O8pIxwGdSpGoMNyLUa3qH2c25owRJCeiwTk7gk
	 B8uKdDqQI2bsMAZP2XVHKHzH5ITvQqW0BPJaOh7QD7JZAj1K4o/E+fDJ6eUEUh4ffAjXA
	 +uPRR7szzdVs6Ze1Wpg/2n+pDM++kmCRX5IEX+Cd7maR0qOyDdlRFYtCHe/S9Z+QcsNH7
	 0fdYjyx+6JTjj0K6mVgmH/ICLOdnx2VmSM4gqU7BqOTGG+45UG7tXfcUCRuM7w2OfnRs5
	 opSqY90pca7jV/nv2+6Erc2rqwUjM3wX/skv5gA92QAHdecHF7toAqWtcAi/roaco6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=PqLAFOiR;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53C21606A339
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53C21606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=PqLAFOiR
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91c847584b8so29375426d6.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640209; x=1795245009; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ra1qoxU4QdTYWMO3cOdicsi3ZqR2JP+4Yyk7L1wLDNk=;
        b=PqLAFOiRQud2tLhS/ABxUgVACPUZ3I9FOI5TkatrC0H2G/XdlD1+cZydgq5Rllvt7a
         MoGW1hDQYg+OHm6q1R8ECLRKIqKNOOM5OnX+5Hay7RU33T8E2SiZ+RSY3gSKCWiWmUfn
         uex/0PD5WnXzkYemmiajHbeb9C1+UScGLzBJQC5/9woCQZUcpFAc50FKjKtXPFXZ/VXn
         qZjVXfPQu3pDTxSkoKUdrHb6cC+BgRetHYi3SkpyLFXryiHJRQ5wDAl5CnrmLcLRK2up
         pRc2bg8pEEa0+7FnuwJDL2sQ3xwBvnBHuMr+LHqX26isokjs+9e8zv11prSUixRbKuiF
         yk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640209; x=1795245009;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ra1qoxU4QdTYWMO3cOdicsi3ZqR2JP+4Yyk7L1wLDNk=;
        b=SXK++/9ZOUROHTuNuEP6+zZq5vPfJKavm9BrRtQstM4N3uKrYDC19zRPf7Dh4oAcA/
         3AL7lCZxvLJUGqkuBc9O2549tq/tgiZK9/zX88zF5NPKjJKAQja2muXcb/ZqsArg14Bz
         tuymDYyDxbDqW3dXU1jTkNr/23tM7y2u+L3MQwIEqbMr3F03VDg4Wriu5UjUa1oxMomy
         eYU2XupdiZLz5O3qRv4CxU9CSZralSgmb6i010qv+7VWasTbNnODwR19tOGJ/MEVxSaO
         Ye8Ia7oplJRlpcCzrAgaOGDEGy0eLpgbIhM1GT0ISXCTVJE5kERda3xZaaF7/Z8lUACa
         RTDQ==
X-Forwarded-Encrypted: i=1; AL+hErGm466sxGofpr5sD7cEE9EEFWx7205wm/hhU2Ez0kRvR+Vk5n+pzMYZ6vPK8KhUVTTkTmLMYVj5PfGjJA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+CkCKGCBbMrfnEDq+xMA+xfTtRy5rWB49rDlICNhfAeSfiXJAO
	JpUQQR8/6ZMpjDHVamgh/zQHyHB8kf47ndH9xYSAgQ8a7bBjd+I6SuJuJQozEPhkGyA=
X-Gm-Gg: AYBFou1pXMJyjXsvSzOv1nhDXL1dYf3JpZFcBsBQvI0vj09nY7n0DKavwuRQbE7jCJu
	Vz+ZVOv8tg0t63SMeOn34eTzpWNBBE8SiLDt3HpqXQvrDm5rgvdMWBrXzX3SJR5fOdQajFPdbAz
	5Xstjq5ujrcUERvF1lBm32OMIGNjb5cZFqxYgg6UK4FpATqt/qM1BhdiAMLKFYE9FYfml7Sym1Q
	1tnsCrES/LZiqjTZa/gpA7ddpa81No7dCx2bV2+1A/ie3UVsu5zyrJqxl9V4W9r2rAxci3LOFj0
	A1f/3ztVFUT1eSLDZUrwkYvcsLSnQM3MnpkQn7mugEj648Ic47vgN+tFGCIa22QSGEydQWMLEGn
	O2RJnfjsh5pCSCG/uGWYi1keQdQ5IAeOK28SJI1B1kAaaK5yw16AVm2/WsFTu4S3ROxYzG9JFD6
	NRhBwZUEbWr3oXZhG5+f+mdQdimMSKq+CG/EG2ki8Jw6t0w2tDI8BcfWa6BTRF9oB0YIy4TqqRb
	hy5lQioSqJxBYB7YcgHMW4n2UXi5wF1sudJydBGniZhHT0WLzltr89mBZfoYCkJg7AaNoJ1H9ef
	fqDWSUq5mGDYmIwHP+WQsdyqaB1phu6P0JPyJXvmdXlDIstYlfw7I0KhwH7kQGwFYeHClx5xAlE
	GHX3tlG+tC3vM5Eec7lsQ08aN1OX8OVr8G8EM
X-Received: by 2002:a05:6214:18f1:b0:91f:1a70:4b0c with SMTP id 6a1803df08f44-91f1a70a6famr79219716d6.4.1794640209017;
        Fri, 13 Nov 2026 23:10:09 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:08 -0800 (PST)
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
Subject: [PATCH 02/22] mm: publish and clear node memory states via helpers
Date: Sat, 14 Nov 2026 02:09:39 -0500
Message-ID: <20261114070959.3490008-3-gourry@gourry.net>
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

N_MEMORY, N_NORMAL_MEMORY and N_HIGH_MEMORY are set separately in
free_area_init(), check_for_memory() and online_pages(), and cleared
in offline_pages().

Centralize those updates in node_set/clear_memory_state().

Behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/internal.h       |  3 +++
 mm/memory_hotplug.c | 11 ++++-------
 mm/mm_init.c        | 14 ++++++--------
 mm/page_alloc.c     | 15 +++++++++++++++
 4 files changed, 28 insertions(+), 15 deletions(-)

diff --git a/mm/internal.h b/mm/internal.h
index cd3675c044e0a..608a83c34c224 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -62,6 +62,9 @@ void lru_add_drain_cpu_zone(struct zone *zone);
 void folio_deactivate(struct folio *folio);
 void folio_mark_lazyfree(struct folio *folio);
 
+void node_set_memory_state(int nid, bool high, bool normal);
+void node_clear_memory_state(int nid);
+
 /* mm/vmscan.c */
 unsigned long zone_reclaimable_pages(struct zone *zone);
 unsigned long try_to_free_pages(struct zonelist *zonelist, int order,
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index f04a248d8adaf..490f400498f14 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1184,14 +1184,11 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	online_pages_range(pfn, nr_pages);
 	adjust_present_page_count(pfn_to_page(pfn), group, nr_pages);
 
-	if (node_arg.nid >= 0)
-		node_set_state(nid, N_MEMORY);
 	/*
-	 * Check whether we are adding normal memory to the node for the first
-	 * time.
+	 * Publish this node's memory states, including any newly-normal zone.
+	 * Hotplug never adds highmem.
 	 */
-	if (!node_state(nid, N_NORMAL_MEMORY) && zone_idx(zone) <= ZONE_NORMAL)
-		node_set_state(nid, N_NORMAL_MEMORY);
+	node_set_memory_state(nid, false, zone_idx(zone) <= ZONE_NORMAL);
 
 	if (need_zonelists_rebuild)
 		build_all_zonelists(NULL);
@@ -2146,7 +2143,7 @@ int offline_pages(unsigned long start_pfn, unsigned long nr_pages,
 	 * list. Otherwise this node would still appear in the fallback lists.
 	 */
 	if (node_arg.nid >= 0)
-		node_clear_state(node, N_MEMORY);
+		node_clear_memory_state(node);
 	if (!populated_zone(zone)) {
 		zone_pcp_reset(zone);
 		build_all_zonelists(NULL);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index a9d848c92678b..b4c4dba93652d 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1763,21 +1763,21 @@ static void __init free_area_init_node(int nid)
 	lru_gen_init_pgdat(pgdat);
 }
 
-/* Any regular or high memory on that node? */
+/* Publish the memory states of a node that has present pages. */
 static void __init check_for_memory(pg_data_t *pgdat)
 {
 	enum zone_type zone_type;
+	bool high = false, normal = false;
 
 	for (zone_type = 0; zone_type <= ZONE_MOVABLE - 1; zone_type++) {
 		struct zone *zone = &pgdat->node_zones[zone_type];
 		if (populated_zone(zone)) {
-			if (IS_ENABLED(CONFIG_HIGHMEM))
-				node_set_state(pgdat->node_id, N_HIGH_MEMORY);
-			if (zone_type <= ZONE_NORMAL)
-				node_set_state(pgdat->node_id, N_NORMAL_MEMORY);
+			high = IS_ENABLED(CONFIG_HIGHMEM);
+			normal = zone_type <= ZONE_NORMAL;
 			break;
 		}
 	}
+	node_set_memory_state(pgdat->node_id, high, normal);
 }
 
 #if MAX_NUMNODES > 1
@@ -1924,10 +1924,8 @@ static void __init free_area_init(void)
 		 *memory-less node. The pgdat will get fully initialized by
 		 *hotadd_init_pgdat() when memory is hotplugged into this node.
 		 */
-		if (pgdat->node_present_pages) {
-			node_set_state(nid, N_MEMORY);
+		if (pgdat->node_present_pages)
 			check_for_memory(pgdat);
-		}
 	}
 
 	calc_nr_kernel_pages();
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 8532af052d74b..834d199ff8429 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -208,6 +208,21 @@ nodemask_t node_states[NR_NODE_STATES] __read_mostly = {
 };
 EXPORT_SYMBOL(node_states);
 
+void __meminit node_set_memory_state(int nid, bool high, bool normal)
+{
+	node_set_state(nid, N_MEMORY);
+	if (high)
+		node_set_state(nid, N_HIGH_MEMORY);
+	if (normal)
+		node_set_state(nid, N_NORMAL_MEMORY);
+}
+
+void __meminit node_clear_memory_state(int nid)
+{
+	node_clear_state(nid, N_NORMAL_MEMORY);
+	node_clear_state(nid, N_MEMORY);
+}
+
 gfp_t gfp_allowed_mask __read_mostly = GFP_BOOT_MASK;
 
 #ifdef CONFIG_HUGETLB_PAGE_SIZE_VARIABLE
-- 
2.53.1-Meta

