Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640225;
	b=Pwote3yVeHAZ6Bvu3yMK3Lvuxgv5ygFZtPqYlPqLRCRLLTJf3t8X/mZdXYUaBGn8yOSu
	 ax0KGjtryTtmwTyEKVmRfjxiKpmXEDhTqiuk09q5pLCIrY2MVViBSErVlacuUv49x1R3A
	 Bya8YRO8kpw2J+s3m1Y1zg3H8zQiTOcHAY3waXy6Fy254nY5i9p0MBYZy+eyGJIuz7ean
	 i/aFXv79247t1TbJzhyrkcTOdVfhmEH4/vWV9g5l0oe+0MaBET4AuTH4bfg3h41g80bc4
	 /Xzf+k/8lUFUQMpaEAAnW5O1HYN9Wr0cSD80pRlShiNWS3zvPYzpPgGt40OdNXPK39g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640225;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y6oxwUC9/qQIZVXuymnHKur3Vt67CPiMCpmdjljurXM=;
	b=MQVQ7YmOGHffLdkuTmpI7jQeLAUbalqSAUyBjKNwksS6ZXytiRo4h+W/0FT3T/pnMYDA
	 JwNTS5fQgYzpOhVmULM2+KUbzYDvqlFIi/1mBqH6nB/2eDTrIqLvpox+/LUjHgUY1SVxa
	 b/fM6JuTq/gVfGOY0Bq42S1XYW3O/zG7/8Nn9vrsqi81seDtuSlb+nGgZmySWRcqWVnMO
	 Ga2apB83gOeWQ6Zw1PPBXIFHG6lO7MFPnMYJMm09jWb2BTYyvGdELSfpN6bCipBPBaFop
	 4JfUZL6IEi/XhCq76QWtayYGa+xNJ3y6umSKSuqsugq8IZkGp/LxXhAX8xjLJ+pw+eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=IFTtneFL;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23CE260A5BC9
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 23CE260A5BC9
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=IFTtneFL
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-91ea2e29d90so38112186d6.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640223; x=1795245023; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y6oxwUC9/qQIZVXuymnHKur3Vt67CPiMCpmdjljurXM=;
        b=IFTtneFL7+veifXsxC+OpNGyBlgx6LrOQkpA0/qVDJFWbcJ4Qv+0AjJu4ZJMrGjuBE
         ZedLAbozimZyftcMDNw6mwMwp9q1z7UA8+3lTLcKxWWp3ifdP+Jc4GovUlruYWDmJHf6
         5rzt5B3e7gyYCTN6VqQe+2M7CXRye8d6vNTAC1Zh19D+T8hqtCycDjsynZGv8i46xYVE
         HCRV7/FgA/yPKZGMavUKUPMNeB73ZxTzwqLBDxz7vDSm4aLeEV6P/yY0XBxAJ8RyEO+7
         I8AGRTxpo4FBr0uGwVHIxna3ogU5xGlChOkq48ocXA2cj0+Fesi4oS/eHBnVgQyU/7L7
         xTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640223; x=1795245023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y6oxwUC9/qQIZVXuymnHKur3Vt67CPiMCpmdjljurXM=;
        b=cfFmtUR2lnFWyJA8m/cBw8nBxK23d/rnOddllurRw39S3A/grfTeqKo4IVXSa+CGy6
         iHTcBxmr1atLdQWXPjX3687W6urIlxMxHxudPgFHzEYgmtTGTf70GuY+h97s3+ClvzKs
         AM16UvnpM6EYewMw0OYAMucvMKggSpdUF275yTetkIxLvdJju+CyASoVXWgExuRF6M7+
         WnLERM+yWEUeCF/TMLJwL+NyUtxALp4e/kF4t6XSw2NPk0abllJUjvUJM8rH9gjmkhd4
         RNECf60XQVoj9ecSGevKdINVay3DDqQ06UGsSGpAaCnWiuP/s0jSC3OGoMW7dfb/uWOu
         oRUQ==
X-Forwarded-Encrypted: i=1; AL+hErGNb5t8LsQF/9n398t+buIfMc2qprAJx6a2FZ0utwze7Fo7IEp+o8y3kcJeSsWfbDAvZ8aLlhihbJl+yg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+AOl1NgpFIMdtj0Pbimw5yt8rokNIzWbcwEQF9U2GFnaA4Ugfu
	X6CpjS88iUYlDuFpgcjAvTVUVoxb7b9a2ucYSlVBK8ecBdQvMl5olC8iya/F4G+C0Ms=
X-Gm-Gg: AYBFou2wQ/aWw0ZCnrSOFVtmU7MW3oFkW0LGEan6SyJtril9sdMyD5L/5yGS8rs4gV/
	o6C0Vb/rklorigyxfwPSAC0gO4FlNMQo8g8iGoCRdSJMtLw3wSEFnJXYjXsmTbbuzenyeox41no
	GIazB/8OpYZZF1y1EGEd4AWqfKe/zWBcUlphgxnIXjmwgkXhovPSFqRhHHoYkz+i9GeQrFEGNF9
	PMsdZOsrbbfM+Vlj8AsMl126B2ddr/th8cY7ga6PCEO73vSAGTEjGvHUNaEuxfsyz59GHMtYFV9
	hYRpGVaHEO+9vzq6W12rE1HgrQGZQuGH/ls0J29dqqvQWI3+JZVFgE6pMtQqzRJZs+1pdhWbu4l
	yhfMiYag2bUDrQPe4jvAK+7k2+RVPXkWWQpGy+tkLxhG1Ekj2X3qGiTTLvvygJZHBUmTdzKBcqe
	DS5+/jTBQQEoMbwVVcXktSq2phNkHA5kitCgJjLtnZasUQVHvM+bv38BcgJnKvE6gSyAgFhh1DN
	i++Ipra4ENMeebI0xsPer8ycLJnSN4FYRLaXDK+Wz6OCmxWihPDHS9K3NJJXj0T+efeeO5fmXVN
	7zc/Oj9JTYK0H0XzEF86w7gD0hqh/11MXb9k4VLhrfemfBib3wf/gEdMcIEQ2ttI8QPTy3/0Mxv
	Wsgo5WRi2S8OR3mI=
X-Received: by 2002:a05:6214:2462:b0:91f:3182:e94e with SMTP id 6a1803df08f44-91f3182ea72mr35908656d6.8.1794640223087;
        Fri, 13 Nov 2026 23:10:23 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:22 -0800 (PST)
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
Subject: [PATCH 09/22] mm/ksm: restrict merging to common memory
Date: Sat, 14 Nov 2026 02:09:46 -0500
Message-ID: <20261114070959.3490008-10-gourry@gourry.net>
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

KSM is an opportunistic MM service and should leave memory outside
the ordinary memory pool alone - as it already does for ZONE_DEVICE
folios at each acquisition point.

Use folio_is_common_memory() at those same sites, which still rejects
ZONE_DEVICE folios.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/ksm.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/mm/ksm.c b/mm/ksm.c
index 623a2cdb39242..25b2c2f944862 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -831,7 +831,7 @@ static struct page *get_mergeable_page(struct ksm_rmap_item *rmap_item)
 
 	folio = folio_walk_start(&fw, vma, addr, 0);
 	if (folio) {
-		if (!folio_is_zone_device(folio) &&
+		if (folio_is_common_memory(folio) &&
 		    folio_test_anon(folio)) {
 			folio_get(folio);
 			page = fw.page;
@@ -2571,7 +2571,8 @@ static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned lon
 				goto not_found_unlock;
 			folio = page_folio(page);
 
-			if (folio_is_zone_device(folio) || !folio_test_anon(folio))
+			if (!folio_is_common_memory(folio) ||
+			    !folio_test_anon(folio))
 				goto not_found_unlock;
 
 			page += ((addr & (PMD_SIZE - 1)) >> PAGE_SHIFT);
@@ -2595,7 +2596,8 @@ static int ksm_next_page_pmd_entry(pmd_t *pmdp, unsigned long addr, unsigned lon
 			continue;
 		folio = page_folio(page);
 
-		if (folio_is_zone_device(folio) || !folio_test_anon(folio))
+		if (!folio_is_common_memory(folio) ||
+		    !folio_test_anon(folio))
 			continue;
 		goto found_unlock;
 	}
-- 
2.53.1-Meta

