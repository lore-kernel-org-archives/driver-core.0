Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 600733D47AA
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 08:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366366; cv=none; b=RxrjV2OQK84MdRR/4F4V1eaZFrc8gfQB66wHpA4bG93kXgaR6W/Vxvynpb3cftULzVDBJe2bm+o5UGJSz/Na91mGkW9l++Q3fC+2F3JoDTsxb6GT81p9KpJA00Ckc8TsW3QeJGUwOlbxgynDwW+xxXBNJpIX1FDK3bUv9XzQowk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366366; c=relaxed/simple;
	bh=iuwtwcgHq3raBwyHyUBxeAqB9w0cY8KY67dh1gll2ME=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ruzJnb3g5gwgdnpkAXiP6c5WckFuAUQPN2Xjt2QMBBra0PL6ZI4X6ApQoXhz7fEDc/Fb+6sJYh+bXT+cgYgZnK8IAlBNNq0JN5XlKs1bBCrb0QsgXvDVZMK8ybiS5QxU2sQePwCcsCaZ79X2p6InWRrC3el8MDa744gqwWGgEQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=VazaPrDj; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="VazaPrDj"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-356337f058aso7006549a91.2
        for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 01:52:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777366364; x=1777971164; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MSJ/Zlq/U4yHk19v3uYTHivwFzozYncFCgI5ZpuZJfE=;
        b=VazaPrDje/BRwACv+7zgibI/U4U0v0gLM9YAofIfX+qp7Dv+uh9aZv8TWLYaHYeHg4
         XZH64Q8LgTmw9gfjsOpCZTI2pI594BbX2ZWVvh01uoxmc53sGTpC/EJgz4zsOzUlFKlG
         XMr36MpbreYdHqZHes027ohQiGqstthIfJ6QEQt9Q8BFJNmoST7Yw7nr4cidE81q50/g
         1rt5xW0LnEyBSgsYDR2Mo87qIPgHWQLmhc+l3fZpv9wjYemAxUWkH23c2Hdk+zT7WLpO
         9fnWrf/wCwvhygtchzkMRIogxzE8PnkbRRYXVeMTgn14yahFvm2LZBanicW4kJd6F700
         ImFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777366364; x=1777971164;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MSJ/Zlq/U4yHk19v3uYTHivwFzozYncFCgI5ZpuZJfE=;
        b=NNCDrp6zjI4F9eFIk6lR84unM5BbVjeaarvbigBH5poIiWb8IkcGKdNv/sWGSpUvnS
         9UbsHdwUpgJiH+q61eBGkyOlkwgLZmEE1Bh4tjLaS2kjRfvavZRt7c1Qo+l+TaRTORmb
         iCd8WI4Rluukt39vXtjhkkDMHtFJz2edfeCWRsYABjl4/6GXvE+z1atBRBrGctNl4mdv
         /1zubfL87Y6tTnMEYLIgaq/8u+vDDZSeblyTlpyTxrbJWN3uDf6q9q7bpGA2fWKYipKK
         JtWG8TCMGc1PhsaJwLryJKJr5dppLkQtKF7Iay16EnBshFbitpxak7e2OkvPyjBNnrzw
         Xsvw==
X-Forwarded-Encrypted: i=1; AFNElJ+1/lCROM8WTMCl/pVIwmc2SYRCFQMZwcHSg6+aPmlZOv2DbgcbPWZdDU5L5ADQcNH1UtcOI6vL+CtspA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyKMNkZELerbX4jC6pAySz+2TMAQ+3eLF2b+7JxRNia/KhubRNm
	PGozP6BpOz0Q9lygjSk3CFahumBWBbd117Z5kvRHMaIrH0P3K3E/aJQBq9PfriJrQOo=
X-Gm-Gg: AeBDietkLOqAxS/Eubk4dessP3eqvvb/+GLExImBZw65V7mzMXgfOF1z4ZKshBmljY1
	u3w9kwXXmR9/s6H9FpA3kyXbzT5yjSasgelLZjYfWkhqSDGWtfXh3XQfphhVEaxlvOztcYH8V4h
	ZBnNUtZU9DXKjyREcWGcjLqHk9ZYxSuQBvp3DnWLtqexKrPG8O03jWdksIRL55eVW4nSWGzrKMe
	DDzxWJj9HiC3wlG3zzv8jZBlEMxX98ygc+OraYvauzOuLj8ksQNZPhkSr3QCDNlFjPUhbSCcPay
	bdu0+H4lr0xcF3mRvgQUBM+8rP932LN4sdjGq602FBFMyTVDNqtkDuU+qAAQOZJwKuFLshah9xr
	Ts5OMbOqeapJN0vJPhnjBJshWjVLSYqSsxEJpLY4RvAJ86MoNRywcasZdB9jL4LvAl4uAX4rszz
	E954HSMpefaaPLxxTgXM303xAjHM7B3ZrQBJSvusAq8Oh3P5EsJm46tN0=
X-Received: by 2002:a17:90a:fc4d:b0:35b:e4f8:7cc5 with SMTP id 98e67ed59e1d1-36492068746mr2311671a91.25.1777366363725;
        Tue, 28 Apr 2026 01:52:43 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364902e7debsm2889080a91.15.2026.04.28.01.52.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:52:43 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Vishal Verma <vishal.l.verma@intel.com>,
	Ying Huang <huang.ying.caritas@gmail.com>,
	Dan Williams <djbw@kernel.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	stable@vger.kernel.org,
	muchun.song@linux.dev
Subject: [PATCH v2 3/3] drivers/base/memory: fix locking for poison accounting lookup
Date: Tue, 28 Apr 2026 16:52:19 +0800
Message-Id: <20260428085219.1316047-4-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260428085219.1316047-1-songmuchun@bytedance.com>
References: <20260428085219.1316047-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

memblk_nr_poison_inc() and memblk_nr_poison_sub() call
find_memory_block_by_id(), which requires device_hotplug_lock to
serialize the xarray lookup against memory block removal.

Take device_hotplug_lock around the lookup and nr_hwpoison update so
the memory block cannot disappear between xa_load() and get_device().

Fixes: 5033091de814 ("mm/hwpoison: introduce per-memory_block hwpoison counter")
Cc: stable@vger.kernel.org
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 drivers/base/memory.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 6981b55d582a..f76aee29e9a5 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -1228,23 +1228,29 @@ int walk_dynamic_memory_groups(int nid, walk_memory_groups_func_t func,
 void memblk_nr_poison_inc(unsigned long pfn)
 {
 	const unsigned long block_id = pfn_to_block_id(pfn);
-	struct memory_block *mem = find_memory_block_by_id(block_id);
+	struct memory_block *mem;
 
+	lock_device_hotplug();
+	mem = find_memory_block_by_id(block_id);
 	if (mem) {
 		atomic_long_inc(&mem->nr_hwpoison);
 		put_device(&mem->dev);
 	}
+	unlock_device_hotplug();
 }
 
 void memblk_nr_poison_sub(unsigned long pfn, long i)
 {
 	const unsigned long block_id = pfn_to_block_id(pfn);
-	struct memory_block *mem = find_memory_block_by_id(block_id);
+	struct memory_block *mem;
 
+	lock_device_hotplug();
+	mem = find_memory_block_by_id(block_id);
 	if (mem) {
 		atomic_long_sub(i, &mem->nr_hwpoison);
 		put_device(&mem->dev);
 	}
+	unlock_device_hotplug();
 }
 
 static unsigned long memblk_nr_poison(struct memory_block *mem)
-- 
2.20.1

