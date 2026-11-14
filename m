Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640248;
	b=5QwE1LodBmEJLKR9s15VQnWAuhfkKvfJDhPzXqRvHI4Rn+JN9VZb2Z+xqr/uFsH1iDvd
	 I9/1+wD5YM/HVKPHDvvHAfUUPTG1ueU6LpJlbNQ2UGkCvTc1VQ13rpKixfmJgT8y45WtL
	 nk+7p1M/K/OCf6xhlHabyeboGhdluWQWapZDg0cyWa6gUa2JL8mMLGzOMkw9tPmuCgwQB
	 965iw11a39IM9W+UjXEqxlkyNMektRpE3tEDTnXODoG/1PTsOhF6uysrhJKOy335D57IT
	 1TfNqXY0gLRxaYreiv9WH0guQmvUi4YxqUlQRlTTgpsTuseTgYlajOCUNCFTk0fRo/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640248;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=2WARPg/nf2WwBmWaZN6JnUP4gbZP7FMkF0eRnIkIgZ8=;
	b=QGzbWrTSXT1+by7d6Vl51ZLapiMYb/hn+ACA9A7Va4pecMf4m/pIm3lhfDt8g0tCzTrV
	 a9EdqTKKC+nuPhF68EOaY/E0WUT6rNdJ+oslU+yxo/52sNUufh4MfgFpIvUcpcilrKDou
	 pQym1iFpMoObCgu+/OuvbDLbVKNhBGGcRtLmO9OPs7lV9i9RTFVc1Afdf2mbra6fH3Yfb
	 QelsbIEwhi6aE5lYTSpiv7BegneYPCKBIHE5W7OaiU6tJ76FcnGFzV8UbsdYyuoBmhT0s
	 yeNL8JtwmjiAdlAAXrekY1Qy5z9jOpck1u2WapvGLzZWcnq10U/ixHShiCN+9JRpGdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=kQQuxD22;
	arc=none smtp.remote-ip=209.85.222.182
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34C1360A380D
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 34C1360A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=kQQuxD22
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-9496317b730so59213485a.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640247; x=1795245047; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2WARPg/nf2WwBmWaZN6JnUP4gbZP7FMkF0eRnIkIgZ8=;
        b=kQQuxD22XLSAL4Jj4h37tYEuykH7dkp1yqAQmUIw4+PGnoRWvQ9DS19XzIe13rLmA1
         iyQf5AqAl0bL+T1AS/yaGRHl9ZA8VNdsvIU7jXFBkaD/jtGNaN6rT12tUSlwn/7PKl4W
         Fa4hrnCB98Wh9qLGwCig9cfW/qOTKFjotj/WZX3MS6In0HLZE72VF7yGARvEx0zHI/GQ
         43e615kn5NY2+CC36PJ2BVn6ZFNOS4nsNuEdL0XTZ2eTsdVMZLLHVu8QfJrwLMBawPxX
         ujAJMm4C1IYbcxjuFGIdj+WnjNE7QA1gWV0n6uyo53QzjSwst3PhyS6aImEA9Xets7pc
         JNrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640247; x=1795245047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2WARPg/nf2WwBmWaZN6JnUP4gbZP7FMkF0eRnIkIgZ8=;
        b=zxjTzKzU1KgWZ8CQFZhyANPgwBcJAnvVTF7A6fCOvuJrq47bQenDkAT7nyLN18IMwu
         QoKfCu9Pzm67Ckcb2E4uSZSC49L77ghzwihk7JgzXyaaDzDQCcHrtTkVkH8uZAAbc+z9
         gu8j8uGtuwpqfhLQFrHsQ7Dq1zr6cTrQd4g/678c4S9KeoB8Q4ilxKCdkTFY+ConNCHX
         xXBw6pL3Z2dp5I8ox+LgTosGBvyZzEJYG0QAJX+RPCiUlVpZOrua4SeR2sMlEY1EKmlZ
         0HTPYvhU82TNtEQIcdtjo2/MZ4oe4b1IMS8KkRprd73MSPSAvHboSkjpQbStZgdhe6Rd
         VKEg==
X-Forwarded-Encrypted: i=1; AL+hErH/m3AGbDjggBZ2dnvUurLiUxVtlrWLq5gwDTG8lRVoiVPcQhVQtE9WOPNKakCJIPwWds/wvErCr1OSTQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z95FEH3RAl/CKTtnthDeD6aX7NN7l0oLLy6339H+YOEPL4auBY+
	1f+cTX/uZQ8EFWoaw9sqdrs/aZCTc6La6dUldh38vQJqtphZjg7gh8D9h+QIe/P9dS8=
X-Gm-Gg: AYBFou0aNXWzgKNaRz/eYQMqa/dstXswrhUnj707APv5Ba2mdYnSDrddbIwEyNZmT+I
	RdrI+lNruLd9WXYsbfHjEkNM436YsX53ZPghuASnvhTExsN0KzX9IEm3zZCCduIiWLypL08XXvF
	Ov26algoq+i+sTc2XjJOmQAHe1TttRRLlaXE+uYIK8F8HXCC7OaMjml7NY4SIGHUeFL+aO5l7bt
	tB3AhBBctnTY89yX35CCbxx68V+vJsWQkqKk/RT+cMPYLoKzCRdmH7Fi2E/FByxH3qf/iUbzgpX
	GuTFVGeGu16gQ4vMp69m3JnTTydMIgSUgxpog+qtnOYgHjcD3uHMROgRiC+O+5Ar/+JrgcHyyeE
	kbzEsnMn+yBhlAMoF9x7m9c/KVJtO6wV0kieWWTi7ubxpeMIibipWnWNl3MDyUnPt1Oon/+JfQ5
	BtSPrgtVme/6cji+yiw4WXa3HKEBrHCkBtBCa49eO8HP9OZY+uaY9teIY5H1k19lXg0Q176GBMl
	Uxuit9wFa3dX0RIa9AQgjrHAiAh+1mIHDEhk/1OYLtaYeRq9OvaOdbEFZPcFBn+lAKKmk0jVZ2X
	75hTAMqR9SJzXLQpb9j92jlsS7ZI4uNzkbdjev0qjW0pYi6sDAjTjqIzmYQjgdU3DezcQRZqqma
	hWLE+2oAR9MsITrg=
X-Received: by 2002:a05:620a:801c:b0:93e:c12c:fbb7 with SMTP id af79cd13be357-9494bc76c5amr813866785a.68.1794640246800;
        Fri, 13 Nov 2026 23:10:46 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:46 -0800 (PST)
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
Subject: [PATCH 20/22] PM: hibernate: size the image from common memory
Date: Sat, 14 Nov 2026 02:09:57 -0500
Message-ID: <20261114070959.3490008-21-gourry@gourry.net>
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

hibernate_preallocate_memory() and enough_free_mem() count the free
pages of every populated zone as room for the hibernation image, but
the pages used to store the image can only come from common memory.

Count free pages only in zones on N_MEMORY_COMMON nodes.

The image metadata estimate is a separate sum.  The bitmaps track the
page frames, and every zone's frames are tracked (regardless of node),
so that sum still needs to be calculated for all populated zones.

Every node with memory is common, so hibernation is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 kernel/power/snapshot.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
index d5dba0e50b2eb..8aeb086a3fd3d 100644
--- a/kernel/power/snapshot.c
+++ b/kernel/power/snapshot.c
@@ -1866,8 +1866,10 @@ int hibernate_preallocate_memory(void)
 	saveable += save_highmem;
 	highmem = save_highmem;
 	size = 0;
-	for_each_populated_zone(zone) {
+	for_each_populated_zone(zone)
 		size += snapshot_additional_pages(zone);
+	/* Image pages come from ordinary allocations. */
+	for_each_populated_zone_state(zone, N_MEMORY_COMMON) {
 		if (is_highmem(zone))
 			highmem += zone_page_state(zone, NR_FREE_PAGES);
 		else
@@ -2011,9 +2013,10 @@ static int enough_free_mem(unsigned int nr_pages, unsigned int nr_highmem)
 	struct zone *zone;
 	unsigned int free = alloc_normal;
 
-	for_each_populated_zone(zone)
+	for_each_populated_zone_state(zone, N_MEMORY_COMMON) {
 		if (!is_highmem(zone))
 			free += zone_page_state(zone, NR_FREE_PAGES);
+	}
 
 	nr_pages += count_pages_for_highmem(nr_highmem);
 	pr_debug("Normal pages needed: %u + %u, available pages: %u\n",
-- 
2.53.1-Meta

