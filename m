Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640214;
	b=eHCUem7obnl1LZiiCIxvCIwTYqAfpjzM22NX9DFR76GIYOVFt9LYMYZKMVjIu7GPvgxl
	 PBzUR9QOREQMzdVjR5AJjWtzRKqB/eBaf58+nnaH4BfRF+C0lWr/xSEBTIF2PXqqx/D56
	 CPKMulVfIPUyNvOvx+GPA7GYvhcqUGtvzAajqjU9dVR1cI7iqETScisLhxxSQyOC9Z2+z
	 jEcpa2/ksdoluuf3uypI745tvQEJjhhlv68gatGBA00Ic7jr0bvgSiy81fwpUpaeUaE0K
	 j/4DxnHj6F6+mMPhjAN9dXU+Gs6y9HNrAqBI8PDjFgPej9oXNa+31GffQ6GGrlYbHOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640214;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=dol9r1sYlhR7CIgJNfl3WOVG5mT9B/6UaBUUhYtXcU8=;
	b=utxQUFsZk9Chcw6de9/DjtF8zGBQKFNJP51w6XEjnaFufuQJKhahmckgnZFyl/ntLAVY
	 Ajh6B5AfC+tkCtZEEJmNDz2GroIW+TtZv2ejthnQgFILNPUd9pl/oVH8pBjbwhA7sPV7/
	 vF5ff1O5eyle9CaZgt245kafqu+oY64OUhk7KmkJZUtMh61y2h9WNAkfnbwLzQ1TfneM5
	 hA2RNsXEk+eTLssbGYg1BftOBtvlf/DCM07is0dSsGhmzumQ6aJWTD+/HY9Z9/EwolmiA
	 NTfPcuyHWbZld4reJH/jRUZrbQbPeeiKkn0L4sjUPK9ohGXPzabX+FJ725K66J+sO7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=mxC+7WOi;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF7E760A260B
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF7E760A260B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=mxC+7WOi
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-94962d80d34so26212985a.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640213; x=1795245013; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dol9r1sYlhR7CIgJNfl3WOVG5mT9B/6UaBUUhYtXcU8=;
        b=mxC+7WOiFDhiDXXmLHu5ocKxtEpD82U3gSrosQQq+Udm2zjq18AYeQr/864Jsp/Ww/
         BtQB9WXLFN+ih4jCSXPH1UmcCldLGEk5W7X6aEZW5aGvqpuaBKNX/LjelwNa5C99GwyC
         7eaDQm67NdLYUGq0GqT5fCyCn5tTq4+Zo896esRqAZ/Y0goGw6FMVJ6ZJDN2eSWea8EY
         TgF0Lfhxea37KL2LTPYke5+xT1A5beNT2/8uLZ6XIARTA0aTJ6sTBDuWCNlJAfD3CK4e
         PhJlurHWs0+wDsBo0oV7BIaw8tf/hWngYxgk1Tc8oXH8uWUQoK0CYuJVUWmnGyoZj9dm
         rIhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640213; x=1795245013;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dol9r1sYlhR7CIgJNfl3WOVG5mT9B/6UaBUUhYtXcU8=;
        b=Lu0uSsCuZq9dFXCjFhifdMXSiyYV606KIZdOpgh3zcFwEUPqZ//wk0HAV5jLRG6Gfj
         G5yUEO8rcwsTT+tb2qNuzM7EvS9pGHLKRCNKgl26x8abLn9V1Avj20DRkmumoeCsrG/2
         z1UL4laDrs4i6xJGtV4oAfEXlOFDI7+LDAu2W52OZ9disPEsoQ0ZRskyRNiaedAzH/1E
         Wz0WCqt0h0awgUgQ/j4fSK+sdkjUrZxWdVJec5mwRpiw30n/KyM8/zJ6p6hiTF+I1emD
         wre/4BEcP5i+CDu5H4EZOrpt7Iu1W5t2hQwAHk+pmTRNDZsGGn6QfEwJgVREV1522V56
         NldA==
X-Forwarded-Encrypted: i=1; AL+hErF9bJdmR0+Qu6ACdUTvOYxtkajH2VbVXQlFOTLZBsu/vLys43+ksa9N4V0B10CjECtk/yommSpFw6MxSw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+a2O5nQudP9BqkIRZE7zQW4bqLg23LQ9FTIdhTYkMw8ZPkKYV4
	owP8PWlDcZqHICRe0rkDnZo3gEiX1GBBvWCWubMY3yV30qXK8w1O37wpU91XGa6Z6cU=
X-Gm-Gg: AYBFou2risLAbE6y2CHjETJn3+5iec2Qni3hXvHFM5FVLSsKJOya0Lq0NTCPv/6vMnI
	lrCae3rJDl7Wa3XTQOYVPQshbiyWfsOUahnLk+ie4C8i3CwNOIqGpXzj7P4zBrUJK8aRIzz1qTx
	qgqwiGZE7/yQggv3N1B7L8eEl/5O7O4yzWVFQwKztSnS9L2OPjNHIlL8BSIzWSrTpymA/eP/Vp9
	TGKJHF+US+dnKm2iKNWKkbtLw1CS2llbU/adFmVxeZfLTekp7VLKw09aJY6Gw0SRgz13N3tl/gA
	wYSesZOIsXpLGsjcmPVZBju46fnxhwdGtQdnRxAIGbtZulNtx/b6Cz8jJPzpFBMot1JvkOewz+P
	yInPd0qW+qRp3dpXqEvJ/6cRQN2iawqLSWM+WcS9n8fL4lwVE0oOjDVpdRHWC1+3w7qT2W2588X
	UaUogFLN4+9h6v+P5jKvHq2CAS0WCQLNdOzoy9cLCYaYzxkPob9zXnh/LQbiq/biPilWmYr2lHx
	4OlLrU0SyF0AWjW4wG1/Ss1K8miUO1tgoiGmmma5tgF6Ri3DLryYYxktP/Vx2gvNn3VoyOEkAxH
	EBMVTxa1ip6eNwlynFxDLzd/S9+jZ/87U37uesWV96LZshFPBM1CYS7JPKo8O9ogTNeAODHD774
	pXx4NAsEswqnR0Wc=
X-Received: by 2002:a05:620a:7087:b0:949:402b:f18e with SMTP id af79cd13be357-9494bc7e777mr835710585a.66.1794640213010;
        Fri, 13 Nov 2026 23:10:13 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:12 -0800 (PST)
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
Subject: [PATCH 04/22] mm/page_alloc: build zonelists from common memory
Date: Sat, 14 Nov 2026 02:09:41 -0500
Message-ID: <20261114070959.3490008-5-gourry@gourry.net>
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

Zonelists decide which nodes an allocation can reach.

The fallback lists hold every node in N_MEMORY, and a node's
__GFP_THISNODE list holds its own zones whatever the node's state.

Ordinary allocations should reach only common (general purpose) memory.

Build the fallback zonelists from N_MEMORY_COMMON, and __GFP_THISNODE
zonelists only for a common node.

The build_local_zonelist() refactor lets use reuse the code to build
a local-only zonelist for nodes outside the N_MEMORY_COMMON set later.

Every node with memory is common, and a memoryless node has no zones to
list, so the zonelists are unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 6ffa972811462..580feeb608b7a 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -5906,17 +5906,14 @@ int find_next_best_node_in(int node, nodemask_t *used_node_mask,
 }
 
 
-/*
- * Build __GFP_THISNODE zonelists
- */
-static void build_thisnode_zonelists(pg_data_t *pgdat)
+/* Build a local-only zonelist when this node is eligible. */
+static void build_local_zonelist(pg_data_t *pgdat, int zlidx, bool eligible)
 {
-	struct zoneref *zonerefs;
-	int nr_zones;
+	struct zoneref *zonerefs =
+		pgdat->node_zonelists[zlidx]._zonerefs;
 
-	zonerefs = pgdat->node_zonelists[ZONELIST_NOFALLBACK]._zonerefs;
-	nr_zones = build_zonerefs_node(pgdat, zonerefs);
-	zonerefs += nr_zones;
+	if (eligible)
+		zonerefs += build_zonerefs_node(pgdat, zonerefs);
 	zonerefs->zone = NULL;
 	zonerefs->zone_idx = 0;
 }
@@ -5960,8 +5957,12 @@ static void build_node_zonelist(pg_data_t *pgdat, const nodemask_t *candidates,
 
 static void build_zonelists(pg_data_t *pgdat)
 {
-	build_node_zonelist(pgdat, &node_states[N_MEMORY], ZONELIST_FALLBACK);
-	build_thisnode_zonelists(pgdat);
+	int nid = pgdat->node_id;
+
+	build_node_zonelist(pgdat, &node_states[N_MEMORY_COMMON],
+			    ZONELIST_FALLBACK);
+	build_local_zonelist(pgdat, ZONELIST_NOFALLBACK,
+			     node_state(nid, N_MEMORY_COMMON));
 }
 
 #ifdef CONFIG_HAVE_MEMORYLESS_NODES
-- 
2.53.1-Meta

