Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C61B02EA48F
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 08:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366356; cv=none; b=syAn+JrgIjfk+u9HYQHWc+nDJd5S/H1j9n4VMcRJWVKSFY1BdWkSbZh4tMsppDT/ajUjuQjui+7JlI+IFqnHcH+NuD8FLHuSkV39QjPJHKIeQDJhV42NSIXTiv3bR/rSYRf8dKj3hG6yrt5add7S8FBKFlnQtK7m9cTgMok/H7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366356; c=relaxed/simple;
	bh=nQdEySHsup5tuoqx9Fwrf6ki6sgYhd+krQ8jAeZzU/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=BtYAQiFK8rcKWabeGo3bYDHedEFE/16ERyivqYkUaQZRDRuuoCwJZY8AfrlH05ar8sJ2N41EQOWptEMbhrhkdwFe9hG9lrMR5ANxpJWFCjMfzyXda6vBRrEnl7cqsV6HAmEX8XfLUqjZknfXuNyQMfc4R96bR+E6Wd3oyWNAeqo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=SXEmEvDb; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="SXEmEvDb"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35d99bae2ebso9876244a91.3
        for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 01:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777366354; x=1777971154; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g3RZ85zZRMSfm4V5G/nYn9e3XYF7QD6vD8DovC4NkGE=;
        b=SXEmEvDb55GrR51DR/Hj5HM6RvDb9+Ck/GEeuM1gvo0k7yUyHL0Alr9EMgs8wAozKr
         m4CTUuAEMzqfQ3vm718MGZuCXNn9fr4e1wK7oXwbrJavmeCV4i04s+Ih6zAhQVVVmr/5
         cAY+BVom7MxtKBnTZ7j/DCbctjbCZAUndgYJfSojnwchUzzCO9gd8u4d6QZKDktQWNZz
         fHkpMn8oyu3tmDxvA2dXNsAUL622ODPnqO0in2wUG75Cg6LDcQn/hOqJ+p7BLlbqWc/H
         mtu7PTglWcKoBlS1PLrepLbTfsOIGGKfayzrvOFaE2g2umysJ76Ipc3lJMRQui1PGJLQ
         oruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777366354; x=1777971154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g3RZ85zZRMSfm4V5G/nYn9e3XYF7QD6vD8DovC4NkGE=;
        b=CSyjR4VK/WxISnFhPKeL1KHLWLBQSwGSgvg5n/DQCnjHI8in/LoI+pFP8UabAJXMvD
         dmsuBG33oimdRStrsYuMG8YKjxOHrzjR+1qIDlf1hfebl1yyB2EpL/v7+u8kyUXFQcJ1
         L79iq8Zm28CA0shmz2DRsZ95TJjbS/kDEWI+eo7KTCrSlkn4QZsfQF4H30nn2AOIXdIw
         ycRWg/FrIduBLQYcH10/eOZNZ4UXzMKtbJ+LKtIjlt8K/Q6YDT4h4Ph8e/fnUdSj01Wn
         6G/tMR+qFM3TQVU9sLeacO8OeDR6AtBEtkptqjXqzxNcCIinXq7w9L+bO9Ndy/CArQiL
         kfKQ==
X-Forwarded-Encrypted: i=1; AFNElJ8SKGLrK4D9FtpbK/zPcr/7k6f0M4P1wAFqGX/InpiHvBIdytp+Q4xoVFH+0smUK39Z9tNYzwZOLMlMoA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTRiwstVm6pbA25P9BiyW807kp/p0ObVVZnetXihS57yEaks9x
	n7kugeM5ETmxp853B+IkBkBtFqoRKVzNIHQ50UtPgbKM+ub/s1RubpopvgZdv/rrjRg=
X-Gm-Gg: AeBDieuadsMnZ5nrgtkuAJPigiJzfzmeqSBjL3cYjpalTO61PvCdG4G9Ek6JGp26EoX
	58FNdSa5//zbcKkL6dxsYh2ypKUHl/CN6fNrBZSuUBLSQqS1fyhUPJqMrVvx/ULEA/6s0TI6zQQ
	iU8Quq27axlTGTqqFG5OU0ACeTwMWONmOjDIKSzQEZBmbrM0hSKYbghDCcbc3jtry9ASR6/3ht2
	VI7+sUBlgOxRI9B/kZaY6da1GsaJc9auvY7srxLQCntYUEkYwI+34TQXUqdLEOt+h7KT7xYqZWI
	rzB5wnSTIuGCxdurut+fLF4nVdkzPUdbJNltK6ckRlcoDbJ4EJxDuD4cvhowH6wid+9X7lPIL4H
	duDZ1+GeuGfUa/g0ppxBmQ0K1xXyi+hVZJE7r5chvFnfA6/8rE4uPpSerD7apGsJXj/XTjlFpxy
	2Ei2t5xRf8pEmNUle3d/F0/CPvYe3WneaGM14duYT4O1xaWIAC4Vs38z4=
X-Received: by 2002:a17:90b:3510:b0:35f:b5df:463 with SMTP id 98e67ed59e1d1-364920a5111mr2319506a91.14.1777366354012;
        Tue, 28 Apr 2026 01:52:34 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364902e7debsm2889080a91.15.2026.04.28.01.52.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:52:33 -0700 (PDT)
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
Subject: [PATCH v2 1/3] mm/memory_hotplug: fix memory block reference leak on remove
Date: Tue, 28 Apr 2026 16:52:17 +0800
Message-Id: <20260428085219.1316047-2-songmuchun@bytedance.com>
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

remove_memory_blocks_and_altmaps() looks up each memory block with
find_memory_block(), which acquires a reference to the memory block
device.

That reference is never dropped on this path, resulting in a leaked
device reference when removing memory blocks and their altmaps. Drop
the reference after retrieving mem->altmap and clearing mem->altmap,
before removing the memory block device.

Fixes: 6b8f0798b85a ("mm/memory_hotplug: split memmap_on_memory requests across memblocks")
Cc: stable@vger.kernel.org
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Oscar Salvador <osalvador@suse.de>
---
v1->v2:
- Add Acked-by from Oscar.
- I didn't add memory_block_get_by_id/memory_block_put because this
  is a pure bugfix series. I will send that separate cleanup after
  the bugfixes have been merged.
---
 mm/memory_hotplug.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 2a943ec57c85..40c7915dabe0 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1422,6 +1422,8 @@ static void remove_memory_blocks_and_altmaps(u64 start, u64 size)
 
 		altmap = mem->altmap;
 		mem->altmap = NULL;
+		/* drop the ref. we got via find_memory_block() */
+		put_device(&mem->dev);
 
 		remove_memory_block_devices(cur_start, memblock_size);
 
-- 
2.20.1

