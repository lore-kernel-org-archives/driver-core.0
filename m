Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640208;
	b=3RphEurpx2VAQKR25HC1c1c0CAZs0Viw1FkuIXYoH5w2Z15hITrr9daWtPg1SOeKSz92
	 SNxlNff+lOXRxVnLyl4xS6JYPPM4TDYC6J0BU0GJNPYdRlk34mpP6xSgQo3kfaCSyvfWP
	 A/G+nmeMFKU5PbDSmrci15LyqhZyGqKTf3TWtnXJwyaV9RZpBIyPwNr798Qtc6qAC04mk
	 GPtTgLymYjktnMr/iQdblx44VdzhUqrexKZ5Uqz40MZaFhzqn+Z01LDsp7vkwOHTU3nB7
	 lmxPtP2mQsjV/Umy+mMsRXefZWmcFo/gVn0dxE+nWxnkHP+kAji1XV7p6ujlCInshKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=8m1rh8YCtMa/eK/x1h9nBhdh93CAkPykNk2YYLlQM4w=;
	b=4nr5jRpOq5K/KKuwvpwqCpv4Lt9ppH1Eu4Ws8ooAjOS6HRRFyhFrVOlhHbtVZRv4gIGf
	 t2PnLqDCfdeHUWosM5E6jrgN6ghDhcg8X2GP2QiB+fcuar3oTBxAeQi4ivS81X14PLoKs
	 zD6eExIcFoFGBj8sHeXzn9YdCn/2me9EfDgBKq22zapk8QFRi5kOL+Y9MQvFxk6kgZpic
	 X+BZg8UI8A5ZgfdiT+sC6an4ycm6w6G6deW1SPSUkN+X+E8Yls6jdvhOOKrPzJX7xDC0y
	 T08N9WHQMWHbueVOvuvgS2J0V6cP3cmEABpAdBaNyoUvLkxKBGQPBh4nnh4bpCYz7GQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=P1KGu7Wu;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFB3E606A880
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DFB3E606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=P1KGu7Wu
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-93f1e5d7450so262327485a.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640207; x=1795245007; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8m1rh8YCtMa/eK/x1h9nBhdh93CAkPykNk2YYLlQM4w=;
        b=P1KGu7Wuvr6v2oBfj4o311JBLaA6bJBWLTGeoD7tgptsObosBN/jdmP7P5w40mI2qf
         X1/N1YXnNnLErR31QfZtLDozOklLkSrmkA4PogYf/wckxtlyG/C5FL5bhODovIoK2QoY
         dbp+vVRA2F7X3pqKNac2YPoDH41bpCPmj9bu3que3A0N89DSBDbK3lQbEdE24IT5iVyI
         ACnCKepbmr0bid2xKcwJkaDF14LnhFemu5COpgzjRyFmrLiC2IdRJFggWbBU0CCyN+CM
         Jba2t0FfHrjeWGKOwi2+qHZddBFiyvxDYdueeobPtFOrwXDo+6j+lU9gPPUwhdqshLiE
         Ojtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640207; x=1795245007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8m1rh8YCtMa/eK/x1h9nBhdh93CAkPykNk2YYLlQM4w=;
        b=O+tFcEaERN8JwQsMSgUjG2vLInyr6YB8SnFTJXFPuRhRU3E0AwKMYKQV4l93xK1dZl
         pH0knEHXmPK1Xall8rYGj1IL+MTsy2n4JxOuUvNjiLVA94AwADLNxgC3cxX0+jRap68g
         r67U51w8b9KGk8EFRhe2pUIG9DFuQmoXsKrUwMtnW/dOVos0MVTaYE2CvMvXBIogRz0j
         i9PccfxIjrdVq3KkPYxDrKYlx6k+QYR2kmNiLpuhNt+xeaZnvO/wza1ictD+Jh1/tE4M
         NpFdeI+4xx4nmUR5ARt0cxlLAHCG57nDx4dSNmxh/wR280XyklFRlVPfaVoh9zjC20Kn
         hL6Q==
X-Forwarded-Encrypted: i=1; AL+hErHTFZVyFdiPMIQbdu5mGdUL5RQuT3G/rzEyIlf4E8JQoY4seLQZFHR5tZyJDUmPv85A4iBDWMtFGK2kqw==@lists.linux.dev
X-Gm-Message-State: APuU4Z++zta+on8WTdiF0ZZBva1waqFizFvT3o3Gttxj6sHT/NVyp55d
	98wmwLsa0tD0o7e+Lbt6R77UI/qIHWp3VJq0kwxV89mS8mt1TdZ7BDV3IPa1DloXU3Q=
X-Gm-Gg: AYBFou3dD3is36kawHdmdF/FlNwTL74xNvB6+6gpTwAgpI/n2x/7cRO3m5JnWtzhlfc
	l4oqfjFBJSRWJAoQIGc5AQL1kS8YDEgLTK7HFD8OxT4MhHjtNfB29nL2ShuMbZiPNVu6sdWpSU/
	vQEHCCRpxqaEGmvC4si3Tokw2u+yrm0oqfwtn4/7RbX9khfBTCrNUcKBN/MncbCRLppOXNIYiXE
	ot4LIPkfb8OZlCyBr9KPpYYPYxDCqSWT9iL48mBAvMjksz8XRGsL/kyQW8Ur1Bk/ffr7T66pJKQ
	ZmsMVccPGR66OP535j4LxBHdvnl6SLyZxWfpy0UcRDwxDJD54R1cykKI5qodnxi4WrKFlXGFMYB
	m8KQ3F57PeO7I1vZs9oX17iskxz8Ay58G85gdZv8rynEFh7byQLrEgtCAu0pLfYm45MuOVLlhno
	DgDrtZBOYXMncVEBwWmZsolKgOUDxnr9mzedj5uQz123f5ftZRhf6WbRRGzsjLn4Jr4uHUSBFaH
	A8msxB6Fp79RO8rNO8GhrjGFux43w7Lgrm89XTcVb+Nb/pGxYsZpGBYpWml5QrJWcZ967tzb3yB
	cJE7RJez7yTJiT3JPjpMFIc841mdeWcygbIn6Z26UAKQgAYCNKlCczFSxGclxbhuU2Ep3I+MN55
	+nnaXdEm3buZWgik=
X-Received: by 2002:a05:620a:6606:b0:93a:2d07:142f with SMTP id af79cd13be357-9494b9aec7amr802433485a.7.1794640206954;
        Fri, 13 Nov 2026 23:10:06 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:06 -0800 (PST)
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
Subject: [PATCH 01/22] mm: add node-state-filtered zone and node iterators
Date: Sat, 14 Nov 2026 02:09:38 -0500
Message-ID: <20261114070959.3490008-2-gourry@gourry.net>
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

Add node-state-filter helper functions/macros so MM walkers can select
their node eligibility explicitly.

Add nodemask intersection and nodemask/state iterators using the bitmap
intersection helpers, without allocating a temporary nodemask.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/mmzone.h   | 46 ++++++++++++++++++++++++++++++++++++++++
 include/linux/nodemask.h | 28 ++++++++++++++++++++----
 2 files changed, 70 insertions(+), 4 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index c161d563ce8fd..5ff190d870830 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1845,6 +1845,13 @@ extern struct zone *next_zone(struct zone *zone);
 			; /* do nothing */		\
 		else
 
+/* Populated zones on nodes in @state. */
+#define for_each_populated_zone_state(zone, state)	\
+	for_each_populated_zone(zone)			\
+		if (!node_state(zone_to_nid(zone), state))	\
+			; /* do nothing */		\
+		else
+
 static inline struct zone *zonelist_zone(struct zoneref *zoneref)
 {
 	return zoneref->zone;
@@ -1937,6 +1944,45 @@ static inline struct zoneref *first_zones_zonelist(struct zonelist *zonelist,
 			zone = zonelist_zone(z))
 
 
+static inline struct zoneref *
+next_zones_zonelist_state(struct zoneref *z, enum zone_type highest_zoneidx,
+			  const nodemask_t *nodes, enum node_states state)
+{
+	z = next_zones_zonelist(z, highest_zoneidx, nodes);
+	while (zonelist_zone(z) && !node_state(zonelist_node_idx(z), state))
+		z = next_zones_zonelist(++z, highest_zoneidx, nodes);
+	return z;
+}
+
+static inline struct zoneref *
+first_zones_zonelist_state(struct zonelist *zonelist,
+			   enum zone_type highest_zoneidx,
+			   const nodemask_t *nodes, enum node_states state)
+{
+	return next_zones_zonelist_state(zonelist->_zonerefs, highest_zoneidx,
+					 nodes, state);
+}
+
+/**
+ * for_each_zone_node_state - iterate zones in intersect(nodemask, node_state(state))
+ * @zone: The current zone in the iterator
+ * @z: The current pointer within zonelist->_zonerefs being iterated
+ * @zlist: The zonelist being iterated
+ * @highidx: The zone index of the highest zone to return
+ * @nodemask: Nodemask allowed by the allocator
+ * @state: The node state the zone's node must be in
+ *
+ * The state filter is part of the iteration rather than a trailing if, so that
+ * this expands to a single for statement: a macro ending in an unbraced if
+ * silently steals a following else from the caller.
+ */
+#define for_each_zone_node_state(zone, z, zlist, highidx, nodemask, state)	\
+	for (z = first_zones_zonelist_state(zlist, highidx, nodemask, state),	\
+		zone = zonelist_zone(z);					\
+		zone;								\
+		z = next_zones_zonelist_state(++z, highidx, nodemask, state),	\
+		zone = zonelist_zone(z))
+
 /**
  * for_each_zone_zonelist - helper macro to iterate over valid zones in a zonelist at or below a given zone index
  * @zone: The current zone in the iterator
diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 607373bd83ee6..28a456c3f5964 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -386,6 +386,10 @@ static __always_inline void __nodes_fold(nodemask_t *dstp, const nodemask_t *ori
 	for ((node) = 0; (node) < 1 && !nodes_empty(mask); (node)++)
 #endif /* MAX_NUMNODES */
 
+/* Iterate the nodes present in both masks without a temporary nodemask. */
+#define for_each_node_mask_and(node, mask1, mask2) \
+	for_each_and_bit(node, nodes_addr(mask1), nodes_addr(mask2), MAX_NUMNODES)
+
 /*
  * Bitmasks that are kept for all the nodes.
  */
@@ -411,6 +415,10 @@ enum node_states {
 
 extern nodemask_t node_states[NR_NODE_STATES];
 
+/* Iterate the nodes in a mask that also belong to the specified state. */
+#define for_each_node_mask_state(node, mask, state) \
+	for_each_node_mask_and(node, mask, node_states[state])
+
 #if MAX_NUMNODES > 1
 static __always_inline int node_state(int node, enum node_states state)
 {
@@ -435,15 +443,21 @@ static __always_inline int num_node_state(enum node_states state)
 #define for_each_node_state(__node, __state) \
 	for_each_node_mask((__node), node_states[__state])
 
-#define first_online_node	first_node(node_states[N_ONLINE])
-#define first_memory_node	first_node(node_states[N_MEMORY])
+#define first_node_state(state)	first_node(node_states[state])
+static __always_inline unsigned int next_node_state(int nid, enum node_states state)
+{
+	return next_node(nid, node_states[state]);
+}
+
+#define first_online_node	first_node_state(N_ONLINE)
+#define first_memory_node	first_node_state(N_MEMORY)
 static __always_inline unsigned int next_online_node(int nid)
 {
-	return next_node(nid, node_states[N_ONLINE]);
+	return next_node_state(nid, N_ONLINE);
 }
 static __always_inline unsigned int next_memory_node(int nid)
 {
-	return next_node(nid, node_states[N_MEMORY]);
+	return next_node_state(nid, N_MEMORY);
 }
 
 static __always_inline void node_set_online(int nid)
@@ -481,6 +495,12 @@ static __always_inline int num_node_state(enum node_states state)
 #define for_each_node_state(node, __state) \
 	for ( (node) = 0; (node) == 0; (node) = 1)
 
+#define first_node_state(state)	0
+static __always_inline unsigned int next_node_state(int nid, enum node_states state)
+{
+	return MAX_NUMNODES;
+}
+
 #define first_online_node	0
 #define first_memory_node	0
 #define next_online_node(nid)	(MAX_NUMNODES)
-- 
2.53.1-Meta

