Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F904CA26E
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 19:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576162; cv=none; b=E5BKD0sycA2h5kGplHlTaIMinRtD7S4jXA375i/SfH+lmZvFDX1v/KtQLvM+VKL/5PWCebmFTKYcMgK6aqahY6FmAfx3nEPY1Ppaqd+ZILO9NFsI4/DAwMQd7yExtGkdVT5wAqSwBv7JpTOWpW0THUT9/O8Tf91iYs01eyjGG6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576162; c=relaxed/simple;
	bh=99pkAOPGtwB/BzPLgYWE1L+4EzvxcH4p7JFn3jZ80+c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBHhK3uC20G0eyWSDjA/UvDBHZJTdoOfWgFYtpjpbTsbme4jH823Devyr3PiE03YpE5rufItjFJUx0IWG0y4eDe6GETLsiDt6JXquM9NQMR8Fwh2Xxb9aHW36srZDHif+1UPMx5mQob4X+9mEP3st5jHIlFmRGPR3oPoYEl423Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TKyJtJ+B; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TKyJtJ+B"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92e622cc874so782475785a.0
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 12:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576157; x=1785180957; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yyvPve12WhVPZzxgug/++OGUAj2qo04o06OFhCcQQmk=;
        b=TKyJtJ+Bnn1RxOaoB9E9TDSlesS0pEvSP4XWY2BVzLObm0NVJmz9cZWxpsMXtuCihB
         eYdpviSKMHcvN77WIImGzqn7QrnHOecNgmkOoofk/MYstrAMU0JHezg9r8UqzOVewTg2
         mRAViDx/y60YJMGm2L+92P6bVEJue8SeN0t20wX+QXUbo913y/cwAf36+gfZdsK7dkoJ
         yf2vRrrd+CQxkWZ3Xq28OyNTpHehGZKEG2vMLg2ZvXDRe3Tc9RyzA8q8BzZkukFeGU2i
         CA+amh5g52beYO7E402g1F00p1+y+ZGAvgvmlnqMAfo7UR86aR1O30jkCD+NEz/Sp5uf
         JptA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576157; x=1785180957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yyvPve12WhVPZzxgug/++OGUAj2qo04o06OFhCcQQmk=;
        b=IODsre+TqCoRI4LRD1Twbny9BgL9scjaNOV14vTGoEdXlyUyqdw2jeaSafdq6bRgb3
         rjHtBTdBk/8tM7hXlevjn3AyfuubG9xAytTWso/cLGel6i7p0Hy7CD4vZl8i4vW7aZFQ
         fVpcUxMdq9P4NHTLHYkvzxWUlfRT2jCJM+Gx40VtmIcOuy+s0jmB9S0TP8vWz/KnfLFP
         IhNBa3+5NHQyaIl9avY7flaLjkYU4KWpyvdZmn2nmVjOulqU4pC2ToY6zsQnf+Dp9BAk
         ziR1rao0sXcVQ9oNSY65m9YbeJg5eMKrP8hmScPpEeIJ4JKxTMlXWbPeWw3R1XwCAcUW
         EGiA==
X-Forwarded-Encrypted: i=1; AHgh+RoAA3p4VT1HkxiRTqWHVFFjoBi6MbWdBSwoYCfHEInNve3++fQxvd1DL4m4UxJ73HmcPsVKbJd8yoavgA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQvj37kgEAyF4uT9BrV2QhHKbKMPRu9jNkqQqQ2+WdUwWre4X9
	LIlPP2I423mmVNP4hsz/BksRPYxbufrmvkrDcU4ZK0hUVhxgngUjD6i5lLAWWww/htc=
X-Gm-Gg: AfdE7cm1y0UKzIsUcoZwnFDxZq2YEQcmSXhK9JlKDK41v2lfJ0Nb6ZbJyhkTvIwrnCE
	NHuA40FM7JVcp68RRZwfuXfw9CnyWd0lEH9ZIOPIPs3HEgZs1YHN1YdjZZIL7I1oPWKzPw3ctrG
	dDY98amZ/B+2FvkbdLCZ7/sJ7fmT2MuDNmNFADwMpNVMJWTC95/R6ACokeTLogHq8T35QXQQKqF
	NIwXuMK7TUTnNaQkSvg0dfqyDC2mSTYG705yIvsArUzOrRPbkLWylh9uelNXpCOtnEa18vvShdm
	IL42SraM+TgqEUuz+kALW4yf/NG5FDdmw0TNdthYLesip0iAh2DVYFvU69wmdZCYSeuee6F/siw
	BJ+DCN/i+QHU01an39Mw0oZjD4aLQ7C5avO/0C57kMa8Nqnx5mzWzZ82494LMwbDGm3rKks6jvW
	YasWZt4YfkgUdji4yIui1QMPF0r1JO2K7vd6hjqXtQqoIsQ/uh1aGfKqbOXFN0SLY=
X-Received: by 2002:a05:620a:2855:b0:92e:c118:18e1 with SMTP id af79cd13be357-930b437e3afmr1539338685a.88.1784576157342;
        Mon, 20 Jul 2026 12:35:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:57 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: Zhigang.Luo@amd.com,
	arun.george@samsung.com,
	balbirs@nvidia.com,
	brendan.jackman@linux.dev,
	yuzenghui@huawei.com,
	apopple@nvidia.com,
	alucerop@amd.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	osandov@osandov.com,
	jannh@google.com,
	pfalcato@suse.de,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	pbonzini@redhat.com,
	osalvador@suse.de,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	sj@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kvm@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v5 30/36] mm: add NODE_PRIVATE_CAP_NUMA_BALANCING for private-node NUMA balancing
Date: Mon, 20 Jul 2026 15:34:24 -0400
Message-ID: <20260720193431.3841992-31-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720193431.3841992-1-gourry@gourry.net>
References: <20260720193431.3841992-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

By default NUMA balancing does not scan or prot_none private-node
folios, so the kernel never migrates them via access sampling.

Add NODE_PRIVATE_CAP_NUMA_BALANCING to opt a private node in.

Add folio_allows_numa_balance() to gate change_prot_numa() scans on
node eligibility. Opted-in private node participate like normal.

Unlike demotion, NUMA balancing is not reclaim-driven, so this
capability stands alone and does not require CAP_RECLAIM.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 include/linux/node_private.h | 29 +++++++++++++++++++++++++++++
 mm/internal.h                | 13 +++++++++++++
 mm/mempolicy.c               |  2 +-
 3 files changed, 43 insertions(+), 1 deletion(-)

diff --git a/include/linux/node_private.h b/include/linux/node_private.h
index 87b03444b2c97..5c3e070ed0deb 100644
--- a/include/linux/node_private.h
+++ b/include/linux/node_private.h
@@ -16,6 +16,7 @@ struct page;
 #define NODE_PRIVATE_CAP_USER_NUMA	(1UL << 1)	/* allow mempolicy */
 #define NODE_PRIVATE_CAP_HOTUNPLUG	(1UL << 2)	/* allow hot-unplug */
 #define NODE_PRIVATE_CAP_DEMOTION	(1UL << 3)	/* allow tiering demotion */
+#define NODE_PRIVATE_CAP_NUMA_BALANCING	(1UL << 4)	/* allow NUMA balancing */
 
 /**
  * struct node_private - Per-node container for N_MEMORY_PRIVATE nodes
@@ -143,6 +144,29 @@ static inline bool node_allows_demotion(int nid)
 	return ret;
 }
 
+/**
+ * node_allows_numa_balancing - may NUMA balancing scan/migrate this node?
+ * @nid: the node to test
+ *
+ * Access-based promotion/migration.  Unlike demotion this is not reclaim-driven,
+ * so CAP_NUMA_BALANCING stands alone (no CAP_RECLAIM dependency).
+ *
+ * return: true for normal nodes and private nodes opted into CAP_NUMA_BALANCING.
+ */
+static inline bool node_allows_numa_balancing(int nid)
+{
+	struct node_private *np;
+	bool ret;
+
+	if (!node_state(nid, N_MEMORY_PRIVATE))
+		return true;
+	rcu_read_lock();
+	np = rcu_dereference(NODE_DATA(nid)->node_private);
+	ret = np && (np->caps & NODE_PRIVATE_CAP_NUMA_BALANCING);
+	rcu_read_unlock();
+	return ret;
+}
+
 #else /* !CONFIG_NUMA */
 
 static inline bool folio_is_private_node(struct folio *folio)
@@ -180,6 +204,11 @@ static inline bool node_allows_demotion(int nid)
 	return true;
 }
 
+static inline bool node_allows_numa_balancing(int nid)
+{
+	return true;
+}
+
 #endif /* CONFIG_NUMA */
 
 #if defined(CONFIG_NUMA) && defined(CONFIG_MEMORY_HOTPLUG)
diff --git a/mm/internal.h b/mm/internal.h
index 62e68acae08a3..01ab8b32b0bd8 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -123,6 +123,19 @@ static inline bool folio_allows_madvise(struct folio *folio)
 	       node_allows_reclaim(folio_nid(folio));
 }
 
+/*
+ * folio_allows_numa_balance() - may NUMA balancing scan/migrate this folio?
+ *
+ * NUMA balancing is access-aware tiering migration, so it follows the tiering
+ * opt-in: false for ZONE_DEVICE and for N_MEMORY_PRIVATE nodes without
+ * CAP_NUMA_BALANCING, true for all other folios.
+ */
+static inline bool folio_allows_numa_balance(struct folio *folio)
+{
+	return !folio_is_zone_device(folio) &&
+	       node_allows_numa_balancing(folio_nid(folio));
+}
+
 /*
  * folio_allows_longterm_pin() - may this folio be long-term GUP-pinned?
  *
diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index fe42a510590a2..4daba81fff7c7 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -874,7 +874,7 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
 {
 	int nid;
 
-	if (!folio || folio_is_private_managed(folio) || folio_test_ksm(folio))
+	if (!folio || !folio_allows_numa_balance(folio) || folio_test_ksm(folio))
 		return false;
 
 	/* Also skip shared copy-on-write folios */
-- 
2.53.0-Meta

