Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640242;
	b=V0oMyVfq63M6lS+YGEyr16pa8rEF6dzYgoqjefmw4DezoZe5Qva9DGH4M34rtBOE6Mgz
	 +5G97OxKX2CGYvirzf4N/uAqkspxvUdKXL4/APpZ/Hn+VyRPWLBJin49Mk4NBzcYcgEgo
	 bk8ELU5GFu090rhQ5cxw6o1wPyyGdf0Kdek8neOKRgu5bpm1oAB0UjbiutoGqvhFE3sY1
	 cO2qlg4RmR5mFmeP2ZZuyy3nYw7HuoFVqK6oIklrqMR6SNnCG2npzy8FtU+4M9UHvnwjj
	 jrnkcQO5Jt9diVR9MNuhy/kX5/1vMHSSGRyv5CuCIYnUvPhvmWiry+aRJD+DQ7ZErtw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640242;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Fkzw1dSkiJcsilY2Mokhk9gjBcrzBYNOsKL3JfHFbP4=;
	b=X6Bi+5ZKGFuoQfScPoLHfEtoSqZRAzBsybgvDIq/fQLtrE8ttig+isBW/nu8QkE5zjK9
	 x9STtLqx7qw7+LGmTotB47uSA8WrRvTwkf2bE5lhzQXMhrXNZQYWCLIPRMm11XxSP3GZd
	 ceq3COT/pvcEM2KIEKTur+hoem9XQexnHgLvRXTX7usuioI5yhYX72qW7G6M8YAljuPVD
	 Cl1MzQPFkjFpuAWOT7NNNQAhPynIAQ3LfrOBz0OF6hgjIIVk35CBYY3mlaPEB3xHiMZb0
	 T0B+H70+B01z83ry5JhuXZl0KOeYB+oWR3mF78O0hm85yW79SdobWz4ClQZxe+dIZjw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=U9RDYU3x;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1338160A2638
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1338160A2638
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=U9RDYU3x
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91ea0c05c92so32027456d6.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640241; x=1795245041; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fkzw1dSkiJcsilY2Mokhk9gjBcrzBYNOsKL3JfHFbP4=;
        b=U9RDYU3xcVUWOssMt974oUfW9TgUuKGjVVOgWd4RHxCPQU81oo32gYF/K/o2t1ZUM/
         Huko/T6TilHIzLmpk6tyUMsyG+7fgcyImxMmL21MYPGCVDfdx/+QdvtcqfxXNU6Ol1un
         9A3RjWAtS2bR04FH1/JskV1IN4j57e8CcT4BS22nmg8Y0GK+d/EPI/QZjKVKVTGYWFRt
         BxgjilfB8Sq/OXWpSrFHCrd8Rx9lyQU7idZnnv3A4o9WMXGfycPEu7tHAvDGNwo9OgD+
         k0mgXY2WR6cogDdwCxpN5zLmY+QdhsYxyq1VFVzdm3EOwzOT0BB37FLDOYNEf7tpAfAs
         j0oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640241; x=1795245041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fkzw1dSkiJcsilY2Mokhk9gjBcrzBYNOsKL3JfHFbP4=;
        b=UDpSsAEDcwmcDQME+bwH//1BoigUSs43WUyUy+xv9mabZu8Fhva+iVizhOUX0msqlH
         bluhTawP/1vfVy1wkfvZKn1z9+PsB0YboEwjTONIp20y32F3uvwaNtvVbMoya4ZJhk1i
         ZJ2UOhlDP5usxmYKtdrKTUb8SeDGzuWUMzrpJ2SLis4MJfXFCUAqBbPAP8AJ7M2s87+h
         J5VkdcCUzihvDVtxFP1FXLP5IZKwzxpyf+FSzKBp7i7AJ+Kiw3JRLqMM0EQsjeeXXBQr
         A63vdfud/uzSgdw/zTrYp+E7IwpS/2oaHOnNEOiBzod99Dl7XLz/unZweDxjV00D0EE9
         EW1w==
X-Forwarded-Encrypted: i=1; AL+hErEF32ZVww1jMPEV4IvHU4QlhtJnBeNtCE41mXwCdxaGYNFBPM2l8JowkEVzvalEwH3Gmci3fs4BylftrA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/29vCUu5LkmLNaZkDrL30MM6uk+Jw130bfkMzQBIBSn8YJKnrR
	PI3ixxk5NDQ00NGwqL5evguhAfQEstkG0qEOrK3u68pskkd0dy2/ju0HmRL1GNtcB0c=
X-Gm-Gg: AYBFou115NkQx9VBnUcGaY4nAd2g5iMFlKvL7UBfK5GUelN1xgDUwNcaWXMnxdnFjuO
	xXCG32aWHlB21u8j6BEPyxdSxaQnD0UfKCPpewfiMYAkG648MwRqHiDEBQ4eT9LGO+gnDljfIaC
	jlQvZ9UoaSBM4J0K1jsM4gE7VZ2RSBOgSlQBOFPL5H5ZSehlVmVspqOkJFVMxeUEh/zm9Vyh8+P
	D58IZhiz6NuqeBLHqKS6fk4DiM1SAesMFghrbaWpcuKu4iGltoUtRpdKEpelx9DyLLDpsYyS2k1
	6MMb2ioncf89JIPAKOFAblTNf1GK4vzySA7sS27+Bs5KlGyq2jzNyoiovJ6iX9NV5/Fecn/K7SN
	WMyBt6+j7sMcLc8Hc8U+UGxhqbuqEIR5+niV9ZXyodKH9uTBc8mqRHfPy95Q7CA0OUSeraTmzhr
	23VdnIfSkqQJU/I/8LHiJD7TkQZJWAlEykVg1gbige0saigfTZoTYmK0pasuF4f46zR21zQnllL
	4hIp8Y3M6Dq+PUANufiV8EcW+9j2AZ48es77sMlamslNYPTfPwhA6+jENC0vBeMFVc3yqRvzS+N
	YQLl5ZTWZADbpuqyR7984yYTRirEAyLigBWjngUruW82F4+SIqfZqTYrbJxvRrHS0XsgDlD+ZLb
	x9LqrBNc2z1VraBQ=
X-Received: by 2002:a05:6214:c2b:b0:91c:9086:ee07 with SMTP id 6a1803df08f44-91f2420df31mr81654406d6.38.1794640240818;
        Fri, 13 Nov 2026 23:10:40 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:40 -0800 (PST)
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
Subject: [PATCH 17/22] mm/vmscan: restrict reclaim to common memory
Date: Sat, 14 Nov 2026 02:09:54 -0500
Message-ID: <20261114070959.3490008-18-gourry@gourry.net>
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

Reclaim serves the ordinary allocation domain.

Restrict it to N_MEMORY_COMMON:
  - start kswapd only on common nodes, at boot or hotplug.
  - walk only common zones in direct reclaim and when throttling it,
    so no reclaimer waits on a node that has no kswapd.
  - walk common nodes when MGLRU registers an mm and when its debugfs
    interface iterates or validates nodes, using first_node_state()
    and next_node_state() in place of first_memory_node and
    next_memory_node.

The fallback zonelists hold only common memory, and all memory is common
at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/memory_hotplug.c |  3 ++-
 mm/vmscan.c         | 26 +++++++++++++-------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 29ff2c46499b3..410a29732bae7 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1207,7 +1207,8 @@ int online_pages(unsigned long pfn, unsigned long nr_pages,
 	/* reinitialise watermarks and update pcp limits */
 	init_per_zone_wmark_min();
 
-	kswapd_run(nid);
+	if (node_state(nid, N_MEMORY_COMMON))
+		kswapd_run(nid);
 	kcompactd_run(nid);
 
 	if (node_arg.nid >= 0)
diff --git a/mm/vmscan.c b/mm/vmscan.c
index 061fbd168d982..bb7b1c50bfb78 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -2932,7 +2932,7 @@ void lru_gen_add_mm(struct mm_struct *mm)
 #endif
 	spin_lock(&mm_list->lock);
 
-	for_each_node_state(nid, N_MEMORY) {
+	for_each_node_state(nid, N_MEMORY_COMMON) {
 		struct lruvec *lruvec = mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 		struct lru_gen_mm_state *mm_state = get_mm_state(lruvec);
 
@@ -5562,7 +5562,7 @@ static void *lru_gen_seq_start(struct seq_file *m, loff_t *pos)
 	do {
 		int nid;
 
-		for_each_node_state(nid, N_MEMORY) {
+		for_each_node_state(nid, N_MEMORY_COMMON) {
 			if (!nr_to_skip--)
 				return mem_cgroup_lruvec(memcg, NODE_DATA(nid));
 		}
@@ -5587,13 +5587,13 @@ static void *lru_gen_seq_next(struct seq_file *m, void *v, loff_t *pos)
 
 	++*pos;
 
-	nid = next_memory_node(nid);
+	nid = next_node_state(nid, N_MEMORY_COMMON);
 	if (nid == MAX_NUMNODES) {
 		memcg = mem_cgroup_iter(NULL, memcg, NULL);
 		if (!memcg)
 			return NULL;
 
-		nid = first_memory_node;
+		nid = first_node_state(N_MEMORY_COMMON);
 	}
 
 	return mem_cgroup_lruvec(memcg, NODE_DATA(nid));
@@ -5665,7 +5665,7 @@ static int lru_gen_seq_show(struct seq_file *m, void *v)
 	DEFINE_MAX_SEQ(lruvec);
 	DEFINE_MIN_SEQ(lruvec);
 
-	if (nid == first_memory_node) {
+	if (nid == first_node_state(N_MEMORY_COMMON)) {
 		const char *path = memcg ? m->private : "";
 
 #ifdef CONFIG_MEMCG
@@ -5765,7 +5765,7 @@ static int run_cmd(char cmd, u64 memcg_id, int nid, unsigned long seq,
 	int err = -EINVAL;
 	struct mem_cgroup *memcg = NULL;
 
-	if (nid < 0 || nid >= MAX_NUMNODES || !node_state(nid, N_MEMORY))
+	if (nid < 0 || nid >= MAX_NUMNODES || !node_state(nid, N_MEMORY_COMMON))
 		return -EINVAL;
 
 	if (!mem_cgroup_disabled()) {
@@ -6492,8 +6492,8 @@ static void shrink_zones(struct zonelist *zonelist, struct scan_control *sc)
 		sc->reclaim_idx = gfp_zone(sc->gfp_mask);
 	}
 
-	for_each_zone_zonelist_nodemask(zone, z, zonelist,
-					sc->reclaim_idx, sc->nodemask) {
+	for_each_zone_node_state(zone, z, zonelist, sc->reclaim_idx,
+				 sc->nodemask, N_MEMORY_COMMON) {
 		/*
 		 * Take care memory controller reclaiming has small influence
 		 * to global LRU.
@@ -6604,8 +6604,8 @@ static unsigned long do_try_to_free_pages(struct zonelist *zonelist,
 	} while (--sc->priority >= 0);
 
 	last_pgdat = NULL;
-	for_each_zone_zonelist_nodemask(zone, z, zonelist, sc->reclaim_idx,
-					sc->nodemask) {
+	for_each_zone_node_state(zone, z, zonelist, sc->reclaim_idx,
+				 sc->nodemask, N_MEMORY_COMMON) {
 		if (zone->zone_pgdat == last_pgdat)
 			continue;
 		last_pgdat = zone->zone_pgdat;
@@ -6756,8 +6756,8 @@ static bool throttle_direct_reclaim(gfp_t gfp_mask, struct zonelist *zonelist,
 	 * for remote pfmemalloc reserves and processes on different nodes
 	 * should make reasonable progress.
 	 */
-	for_each_zone_zonelist_nodemask(zone, z, zonelist,
-					gfp_zone(gfp_mask), nodemask) {
+	for_each_zone_node_state(zone, z, zonelist, gfp_zone(gfp_mask),
+				 nodemask, N_MEMORY_COMMON) {
 		if (zone_idx(zone) > ZONE_NORMAL)
 			continue;
 
@@ -7736,7 +7736,7 @@ static int __init kswapd_init(void)
 {
 	int nid;
 
-	for_each_node_state(nid, N_MEMORY)
+	for_each_node_state(nid, N_MEMORY_COMMON)
  		kswapd_run(nid);
 	register_sysctl_init("vm", vmscan_sysctl_table);
 	return 0;
-- 
2.53.1-Meta

