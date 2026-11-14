Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640220;
	b=ORolNLDtp5VyHcfMFWIq3W1QvVG/IpbfdPmE93pOvwDTCpod8lC806pVnwMC/y2TmzH7
	 r0/Cx7NXSNQW/coTehwrK3YyxeiTHCLIOFs0760fS5bfmnIoLDSMR8LJkYu1l4R1/8Jma
	 a8tFq1toLB/+H81gKdA9r4tODjEobtcyDuooOuRBArXaOr2mkVZc+YE3FnVwrV4f0pgFe
	 RzAtbAPEaE4N9maalZ/WkSBy5rrx8szYMPu7Xa+fz4KUpFlMM1Z9Ff4JM4aEcFiy9XLYM
	 6fcVj2rMLhlP8atHBxv2SkafycLY5ofNTV4xPCU/MOyZZTlWS1Gw2luM/zWIlvDqY8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KKsqfMs+Khz2jHdLUAmVstaMz+t2qjUPbSjoMCe8lqE=;
	b=Z4LaGwNS4DT8tizZt5oZYmaGhL5ELeJVMVmk7iHqiaBqnMWYfug8nEA9DSKlGI3QKLs8
	 NNoj4RbxdYNg2k8aKSfaVg5gQizUMGvRi0j43Roxh01muUjnASlwMe97W7O/Uf+f0TlDe
	 3WHr2b1ieJNYQlr43+76YQexABsBq+9lmRPbCcJEjLYxUFcwRZ8K/OVHc8fu0rrsGnZ6C
	 0Co4OGqBebyKIVbAbj7M4BhjyP6cHmSRGhzT7/N4PTzlGyB8VJQOGkbj+y0pEt0K6xL6v
	 Uf2y4E2CowKgzKdmIdDMQcQInOPWga4eePyqQIL6ipq7B+q7F8ho7P04EORaN51Gjzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=W1OylGpA;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5FA560A262B
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5FA560A262B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=W1OylGpA
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91eb53957cbso45071426d6.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640219; x=1795245019; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KKsqfMs+Khz2jHdLUAmVstaMz+t2qjUPbSjoMCe8lqE=;
        b=W1OylGpA4BfP9zCMyW7rwFKo9B6IX6QMlAhEdmLMJiFYXBHuXaSu6l+ObB5oQg3hxo
         DfqPWD2r2oYfEERgCAzzewmnX4x/JsFalsaiDlQPpqdD6GaYL8O1vJIBb1d+vNKRTd7c
         K8Nk8e6NqNIanbNz61LnlOUHeZslMDBdlLaezHpwr4Ab09ZO+K0E8JB37y5676xIIaSG
         HSV5ZjMhtgEv/liGIv50W0+bEu+H1bDuyX2QZ0Kzk9CX1lRE0XmsU3Qe3h4Y+JAQ5POv
         7m/CSI5v7QwjmPNPdXKlk5k5aN4buJo6hc8/jk36GAjNjGyE+pAd/YD81q8yEw/hmyXI
         p4lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640219; x=1795245019;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KKsqfMs+Khz2jHdLUAmVstaMz+t2qjUPbSjoMCe8lqE=;
        b=CldlXLdDS4Qlq6NB2gEoWjon3gvqAh3lTop1SRH7UZJwnC68EI7JZUMyXeJscxvJoW
         JZJx0HG7a0kozeS1BMZYlgFmn3qhlbTPyLEnVARkUEMC2+o4HJ4EINKOVO96i46ArEAo
         5vXXa6iClfWy4f8KUEodALIuviin3pWsooA5axSSbHVtLW73ufc0NwmV81Kh2jA6mkCz
         X9+Sonyt4IprcFsqjrHKzYRbmH4bVNqLeVQMqIwqnYk5dDxj8rKOauKcZK5UpAcOdakE
         NLihk6L6l0/BkgmY2HBghvPOuvs8LVm/bmwduup+6JhoyBlAx01FCxHWe1uFA8hrgBi+
         IeAw==
X-Forwarded-Encrypted: i=1; AL+hErFZqq+YEiBJgTnGz3BPNZtR+hClSzy/1hsQtTQhMQZFIAOux9eo42GRex4Ziq3Il2RWq+UqhErFf0hfrA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9eE4QT9YPbmu4EDM5jYL5YwEiK0CB+SCbwBypO9h4Y1pCQJbba
	+0l9qvuDLl2JGNOLGvvTmgZK7/Dg3U9OCqoYEf6uQQ4XXpVnzYNwfMXnHyeeI5pk+No=
X-Gm-Gg: AYBFou0hj+fBAguexZz61ddwXqsWxBBjoDcY+xa4ArtyOVORPPXHM3rXwS8ySWaWAbQ
	Mgb4y/Q9WK9EioplGeMWV3H80vCuwkTK5bIuNrTAzfEX6a14n/u4bL8Vg6P+BfWT8FnlilX4tiC
	YMjtPmd9uwk3826A1liiJ+J3XzRS7IXc72H/KUUUXV6KtUN3wCFn4MoV5AdWwX4xXblErxAElPz
	xoTyePlaLGz0/74Qpnq+OUpekwc2yGrSJJq70qMXvhjdMx1DzyiEmiYaEpSi+TxwwSvhnziEeNr
	Z19WkAEdvpO75jI3l+dQMuMu2nxaxB5BvvRtKQOTQLyJJSB0F1kMv/KdNMW9LAI4m3ERCn/5y9+
	mcrqZSPAlHmqyT38ijN3ZNHVEYDGXpvQL7HAx0krDbuFSwbAqx42tr92B2O7R9V5q2MX8aC/tXz
	IglXvm/HY6rKDZv+Q6OTH+GrIJlNACGoWRKgaBDBYyVVudDLyYkFS6Q7lpsgTkG8FRHrjK2GNh3
	g7egjrVcyerNJgHX5xmU4BjbPb+1BHbc7oCyfYCa5kLHKhJKwpKTx8ptEjUw/nNrdrxrTAJyc1m
	DrCnAYv3Bi7+XUaWaGuxFpYpD9BIfO0IeHiPLIVBTG2/NxUikXdzNA8Y/bRO6wIUr2RN5Tz40T7
	L2PrZGqiprOk1Gk8=
X-Received: by 2002:ad4:5d68:0:b0:91e:a6e7:b445 with SMTP id 6a1803df08f44-91f241e127bmr84458226d6.9.1794640218986;
        Fri, 13 Nov 2026 23:10:18 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:18 -0800 (PST)
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
Subject: [PATCH 07/22] mm/memory_hotplug: migrate offlined pages to common memory
Date: Sat, 14 Nov 2026 02:09:44 -0500
Message-ID: <20261114070959.3490008-8-gourry@gourry.net>
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

do_migrate_range() / alloc_migration_target() is only capable of
allocating memory on N_MEMORY_COMMON nodes. The destination nodemask
presently starts with N_MEMORY and removes the source-node.

In the current code, if the destination mask becomes empty, the source
node is restored to allow migration during partial offlining.

Consider this configuration:
  Node0 = N_MEMORY_COMMON
  Node1 = N_MEMORY, not N_MEMORY_COMMON

Node 1 keeps the destination mask non-empty, despite being unreachable.
This leaves migration with no usable destination because the source
node is not an eligible allocation target.

Restrict the hot-unplug migration target-list to N_MEMORY_COMMON so it
reflects the nodes the allocator can reach.

All memory is common at this point - behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/memory_hotplug.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 490f400498f14..29ff2c46499b3 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1904,7 +1904,7 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 		folio_put(folio);
 	}
 	if (!list_empty(&source)) {
-		nodemask_t nmask = node_states[N_MEMORY];
+		nodemask_t nmask = node_states[N_MEMORY_COMMON];
 		struct migration_target_control mtc = {
 			.nmask = &nmask,
 			.gfp_mask = GFP_KERNEL | __GFP_MOVABLE | __GFP_RETRY_MAYFAIL,
@@ -1919,9 +1919,9 @@ static void do_migrate_range(unsigned long start_pfn, unsigned long end_pfn)
 		mtc.nid = folio_nid(list_first_entry(&source, struct folio, lru));
 
 		/*
-		 * try to allocate from a different node but reuse this node
-		 * if there are no other online nodes to be used (e.g. we are
-		 * offlining a part of the only existing node)
+		 * try to allocate from a different common node but reuse this
+		 * node if there are no other common nodes to be used (e.g. we
+		 * are offlining a part of the only common node)
 		 */
 		node_clear(mtc.nid, nmask);
 		if (nodes_empty(nmask))
-- 
2.53.1-Meta

