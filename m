Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 431341A6810
	for <driver-core@lists.linux.dev>; Sun, 26 Apr 2026 14:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777214717; cv=none; b=OUE92BW05HGD5mrMizhbxwtIjR5b6zPdZPcKLNxDSqcA+Uz5WAH1rWk4m5L4ttsyklCHtMOfAIvm+7qKcR8JZnkZqWTUbb2fRT3yXGQ7/6VvzNl48DMvB+E2KC+94ugUsWrGtWN5OiJ4xg3GRQ2AHxhXwq3x/Km5yk/EfXTQJEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777214717; c=relaxed/simple;
	bh=G65XguRFTm7zXcup5EUJgGsyJNI1Wz/tFU4uJ30YpbQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DnuPVI5kA7M6w7cGFzZniXo2dvwbSzMbjiaqnV7WNmQW3m1c1BLWuMyRwK+OAg2roqVxz1y3S0iQKpbuAbxQqqhCmoiCCvTGukd9GxrdLAdmPKS8cDvJKEs/kRhacp/BfabP/5FpvEEC3dmXlqWr6wrzN+0w0aVXKr2uyREcde0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Y1BojnbL; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Y1BojnbL"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-82f6b592fc7so4196310b3a.3
        for <driver-core@lists.linux.dev>; Sun, 26 Apr 2026 07:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777214713; x=1777819513; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=OiFyBmC7gClh7pyL8uPE736qSNuG55EW852NdgZNRz4=;
        b=Y1BojnbLR6PNjRwPCuHpjsGAdZt/a/+Uc+jLVvIMjQe83w9yWtptZVCJhNqbYyrV5q
         e8JzxwqbLgiqHlGG+63t9UfkuBpdZjPIk/J/Gz6TqzK1VSEZjS23eDJp1rdMERS7GZXY
         hby8bxanDORuupxoQp6MfI+mMsAPLVse+NZoTohjgEeGuiw5VboCD83Q4PaWynCCM3CL
         LpxRq1S3LsqG227tXhS/RLsbq8NJRprbus+Vck1/XEJA8QziqauyrpHUMmiXcwsMYroK
         DeiN/w3bilr9IMhOktYT/OeA7Kv+Pm1QUDl0l8eA7W//MdpDLVUr2xNPkjPkqPFtIH0x
         tq5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777214713; x=1777819513;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OiFyBmC7gClh7pyL8uPE736qSNuG55EW852NdgZNRz4=;
        b=EMYxYkexvrvV9Vc/k9qJwkG+HYVdbh2XrOVthZA+xYeDY7wARr4iVEAW4budMNF1Xa
         5OXAwWCm9B0wMA0kqO/+7NvPrCwv72T5R4fe42ddkIdLzglVvjDYq5buawVkRrbajEMP
         371ZkHZobYFKrH8a8/4ylFGs1o5KS091S/8bx8eu0/24A163X06m1QZ3GNmDbO1IfSOW
         iUh/pud8hWkSFqvxe3RHpMDwKtb3NGguNksT4NO/K1aoCBuu/XXF3mP+m3+y+z3ZYcCE
         x2ZzlULR8AY53zvIiwQYgzIdqIyCt6RF2W08DAErflLzgFI5+Yu+vozOqhYXUGu5rh7Z
         WqCA==
X-Forwarded-Encrypted: i=1; AFNElJ9ICedStNfgEChvY+0eRtcjKr43QT4p8cpPOHddU1MvrRKkSL3bASYhnseRYXuQdoj6jcghPrDdG8tG3Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIOEMJZt2pfb4Lb0kimrrZfLgmeG21wcLxHF+7BXNbbvp/CsNM
	fQkWNzWiWaiC3jYh0Hs0KOnZ+lEf0N9Zxm3B6F/BXVmhnn3n7+6b3A77rdmG5BrRe48=
X-Gm-Gg: AeBDievzAA71tDHo9x8x94OgqnkUH4Wqg8LCWzosO3w9BZW5wA6DPi6X46F8VLxG53b
	kxEVU6auBSdIP3OqdoI7f9Ftyl57zTByr3u2TnOhN2+fCZLYzuE6omwfc18YijHBBXcDXARX4GN
	r4NRDcJ4VAxtPtHmOMEZgsyK8Yep3DHbmtMUAvZzgZHI5hAr/Q53FsvHx9p/hc6bjkz3aSFpdU9
	FHSIS0Pj117u7bCyVH31bMf4LhSS3be75WQW/NI3KiCs7vx9mWZAHcV+EK48zqJO/a2jAsGn05Z
	VinQtzlMRTEWTcfr01WT2tDOjiNCAmYSSPzQlGmL377mnaN/WHQ17pPg1QLO5XtL8tFOQBrmzF4
	Hsp7hyw/8fDN2dZzVJ10TMGY4BsL+Pd1ikSj80vRY8Ep+77gNHOpxyBVJZFdaek+KaRatqq66Uo
	+X7N/oXLzfOwoRovngDOOetH/4Hiq4
X-Received: by 2002:a05:6a20:1b17:b0:39c:241:65a3 with SMTP id adf61e73a8af0-3a08d68777fmr31746742637.1.1777214712721;
        Sun, 26 Apr 2026 07:45:12 -0700 (PDT)
Received: from n232-176-004.byted.org ([240e:83:200::349])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703059fsm22340550a12.24.2026.04.26.07.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 07:45:12 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Cc: muchun.song@linux.dev,
	Ying Huang <huang.ying.caritas@gmail.com>,
	Dan Williams <djbw@kernel.org>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	linux-mm@kvack.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] mm/memory_hotplug: fix memory block reference leak on remove
Date: Sun, 26 Apr 2026 22:44:46 +0800
Message-Id: <20260426144447.817722-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
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
---
 mm/memory_hotplug.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 2a943ec57c85..4426abb05655 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -1422,6 +1422,7 @@ static void remove_memory_blocks_and_altmaps(u64 start, u64 size)
 
 		altmap = mem->altmap;
 		mem->altmap = NULL;
+		put_device(&mem->dev);
 
 		remove_memory_block_devices(cur_start, memblock_size);
 

base-commit: 7080e32d3f09d8688c4a87d81bdcc71f7f606b16
-- 
2.20.1

