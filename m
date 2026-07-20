Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9476D47A0C3
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 19:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576117; cv=none; b=lxSheSR1mmK+fJWhMeFfR9xkgK7qcQGu8To+b6AOGdMhRq/n3gN/3PJHAgCcdM3Yp6ndSZk5Bj1F4omWCAfR7TRDFq27J2w/vTagraSlGN0jvT2pHbo7Dfi7lD+6o81P/eu7nnfaiJFCLvSAMkYyaVskVfwH+UPI1H9T0N2FSUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576117; c=relaxed/simple;
	bh=rQ3ZLRwttPY5U7qx79TyOlCHcsHd1SWTIks/cm1EO0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BdoYbCHUuBrxLhLElK2TnGY3O9DWH85BqGqRqycHdKm4Re8lxEkLpKfUOrgVrUH1BPBT3TslF5TE3cic9+93mP/VXQ+6iHjP9Pj6ErJgtIomG4Xsx0yMpT5r403eYqEI1WotcTRKse60kHXzCxDfyTVMOVQmXd9IQCY46awyN78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mhirHceG; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mhirHceG"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e5b048375so757524085a.1
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 12:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576113; x=1785180913; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXwJlI/llosQi30lLS1O2+gV7rtKvgDC66cTY4z3y4o=;
        b=mhirHceGDm8cngo62rI0fvr5camhq+mfCWDi3kYtN8gwv0GmXuXMwQQHHDo64wWecm
         JZPXySomncMpJ/sbKB0lRITX0kX5m4JrzYwBdHlfkSJT3ujS86/6+eiyebla6DSLz9gt
         tE/IxR1eypHiGjVrEgJh3ob4hEHzvSL9B6V3KtsjH1kpmQhtaJnYFXzkL8TAbnHvhfvP
         1YDJB9am6qAhDBwzDC2H8dlChxZg3DTuFonICjoq/sKxq+Tfgq/6Ajo4xdjOA3MywQDN
         fv+DSV64QInshIrzYK6RqbD06TC45BH+6R0LaL2lSOPPysfLl3wa7a+NyxIl2XAmeaDi
         /ujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576113; x=1785180913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXwJlI/llosQi30lLS1O2+gV7rtKvgDC66cTY4z3y4o=;
        b=Tuz6dcyr1nzm7F4YXqff4HgH5f86ydJLHgE+9wMEm3wn1Td9Cug7pBRg5lEpppw8jy
         BXXcOKnQhCttWX7jk+8k/biB9icN/+T9Q2zGX1Gvo2vDCFJUKNLJostBT3awuGeYYzKA
         9ahlZIwxmmmc+Mx+jHfeIXg32lXUmjX/mzT6lJNpXQGHBnpP/JXHUvPtaKPI4MzHrvmM
         KLksuya9hci8dJXhuoCrD9rmJ44E0WR5yoKKCl+KtfMzpMz8WgLq0lkbbgDCAXkRcizS
         KY2dtZg7qI9kShWZlq7DITpDmFQyUPD6gBQr6WupkLgrKS4FKanzXBqipdKvzvcY7FxJ
         481g==
X-Forwarded-Encrypted: i=1; AHgh+Rp7hLp0+Abky/TeAk0EaKV5t+TaClbmFnN/V5zFdcYTjfORdUH1Ltc4imTOvX1UwekiT6Nxkz35nXK4Cg==@lists.linux.dev
X-Gm-Message-State: AOJu0YywdjRR/4RcwgbYaYi2+vM5zkGmrCjLXvBSKIbIaYQDSnXiS7Ss
	K8SB2gRVapLtHzqaXYXzOaFz8LCdjIV47n1lxD1ilVUPFheSu6kZb8y1eidbMKCvUZY=
X-Gm-Gg: AfdE7clHzWLEC5mBqoL+2zGDRmQCWPYwDOZeaTDrmV0WPpO0C0hQokH10nc8CS7rAGz
	uPYnUCvfGqiydL24xC30o6DUM5JSI9UMVU2/1qgetLoP+RXuJmruSBrJu/umCvGHDffBezukkwF
	c31sf8Z8nXWmr+zHetSDUNLK4Z43zEKpSbu1xx7CLyOrjSAg69HNZVYGRMAIgOt5Gpp7V+whXHM
	tjeNI13RgDh+WyaEqT/Bamw4D609ajdHb/bwR31BWYQJuoevaraOTnSQMKGnz5cBgwRGKUvYShy
	pA9QfZju8S8EiUHm2vPt9cMhssVpJAJstl5kV/VFfGedCBAC5YiA41ei/lHH5dY0QqC1aDQnDJp
	Y911xNFcPz0IhNk41JaIYNCtx9brbevomU6sB7fD/z4ugzSttue//BxbyBbfpD6+R25lS24QRge
	BMvInL0DHOOIrrqSPBnpTLYtDqHR1m8HaZueZ69uIB5RhBV2xJaC5V8r/GQ9yETVM=
X-Received: by 2002:a05:620a:45a4:b0:930:af44:c3f6 with SMTP id af79cd13be357-930b416db87mr1543521885a.43.1784576112837;
        Mon, 20 Jul 2026 12:35:12 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:12 -0700 (PDT)
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
Subject: [PATCH v5 13/36] mm/mempolicy: disallow NUMA Balancing prot_none on private nodes
Date: Mon, 20 Jul 2026 15:34:07 -0400
Message-ID: <20260720193431.3841992-14-gourry@gourry.net>
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

Skip private node memory the same way zone device memory is
skipped, since private nodes do not presently support migration.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/mempolicy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 8e8763f6e5f5b..2b76c57a460c9 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -845,7 +845,7 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
 {
 	int nid;
 
-	if (!folio || folio_is_zone_device(folio) || folio_test_ksm(folio))
+	if (!folio || folio_is_private_managed(folio) || folio_test_ksm(folio))
 		return false;
 
 	/* Also skip shared copy-on-write folios */
-- 
2.53.0-Meta

