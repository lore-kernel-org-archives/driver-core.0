Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640246;
	b=SSW0timPM6QCpaP71dWnT7aOW1FLoMhTgeQ7W+/A7+kPkNo8fwdDi9Kjs4rRkuDpapez
	 FZltMECOLmVjHE9qYmnfiAPMkZdZ21orJ5E2LeJkIhXHJWHp/WG/oRNm09gusOLUNJIvT
	 LK9HYknNhHjU/Te8dMa2o0AgC6e0LMawPl/jzoWw1HQBDfGrB3LlVEwtUymGhTz8FebQu
	 RHnC2SfnP8uMDeV9CZMuB8m2KuVvg0d6Wumy8jRyBSgmgmCgwbxuYpEUco9w3uv2k3e2D
	 PT3h0tlpqHc3WMHjGiHA8y9AnvDQLFW31WbNhPzhvW58qpdQuiV+DZgdBfEZJPPvsIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640246;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=YEak+iwgBd7H+tAUDcNraVIKxkIkqE3kGPmkcYQNtnc=;
	b=pUKhtOp5poPMlUHtiGBNqheClgcQQQWzogxXRX9TUuYU84CbCxRvyOOx1GxYWx6QnSr4
	 AKkqUnElJW9Gn4IYBkpO1V3L3bTSS1DhJbw+VzkXCGNvpgy3svQE/S31tjrQwhoVJjvZl
	 y5DJ6m2ect37WdB3R9wdgx2xTcQWUmJI4LhoS69IQsLtO7r+ayf5RGBA57trOEY7QK4PC
	 68QZkSdl+tyr26eGXSfKBJtmLtr3y8cyYtWguyM067k8b+lfQd14Xl/U1AGQgunwkEQGc
	 RxlOHAseuj7uVvcXaHYqGuMGmGmIY9Tkh45ALnMzHM3i9Lm8/hUg+pCc5uD1GtU+m8A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=R7uTHpSj;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB231606C0FA
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB231606C0FA
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=R7uTHpSj
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91ea2e29d90so38114526d6.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640245; x=1795245045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YEak+iwgBd7H+tAUDcNraVIKxkIkqE3kGPmkcYQNtnc=;
        b=R7uTHpSjLpuYx2p7l1lOw5ERxOimCIAHAOSS0WSHajP3oE/NdyUA6BpRUNx0OJElK6
         5eeWy4SplAleru1AvbmU6z5Q7uYGztYGj73XL4d+miXZOsEOhAQIcQh9EI6ohiYJcjcL
         VYaIAabKNiK0hvs0kJzyWPGvTRXNXFhHtULWxn/qRQVuutG0QIWRV1A5nrO/VAD2zdsw
         MzmZWf0+q8lEPimJ33c8zv3WHFgpSn2PytOpgS6AuqFZzg4v3il5Tx9J8LgbB0koMyIE
         tjxHn82++u9q+haKIENxyjqY0r+XqbQOfwLMGNfeTWCByKBgJxP3DYLiD1MPQBDYmaUw
         lD2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640245; x=1795245045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YEak+iwgBd7H+tAUDcNraVIKxkIkqE3kGPmkcYQNtnc=;
        b=f1lx91LZIt3+R0sKKx2zc63jqaNOCNNZbh82RcZxL3ataMVGY6VrsoNUpA1/hevN2b
         QNHmTkt7dVBHtM0bbp7A8sMLIz2zRh+jQc2cLEvbd39nVfcsBdxzE7k68CVkGHIW8lop
         Sv8v4ZnxUdVAiNo8kH/HTEszktx4A6v8k/iImCEIQanGAOb/AcT0/cEZt7h0ridQDWRF
         7oscYbGRbx3yVY0bteFc2CKPrCbkoLhFtXKdm0EohU1bFIs/FTBUEMW1tMe61je83/CK
         9A5hkQTMxoR0/WEi92HrzcniL3tKd/PoDuqSWTDLiB/w527GfaXN/1tyhqrj0p3h+FVo
         xGeQ==
X-Forwarded-Encrypted: i=1; AL+hErFGoP05Z1rlYOucHZI/uCexOCP/20d/3J6rTJIjQgbN+OOSmNP6UjK5sSAC+jNIX6qDIoYzVXLkAI4DXA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+JvNmhSuxOFC/xSQzw6ushfHSoxWpK2oVa/Z6nyw+HBK2wcaO9
	D1hgD4Vc5H9hsPXizg14M5pbB/KKv6hSSFzTVCDv0Uwc9Ltik107FqzTXsQnce3YmE2UDj0fvZc
	3BCzR
X-Gm-Gg: AYBFou27hWml+uUgWDl23YobLAUrjoV3wa3QoqNvBYx6IWPB+z+7c3UoxL4FrT+Z4qr
	POUe8xal3A7hATrF5bjkN+AMwztOXzbkXHeeBSmGM2wLQcOm99F8M82irEuX0Omo4abnaeGhUYR
	LPewwg7UMWTVSIWKFMAYr9UO1dgTfhs19cWlh2nEOOkON6P6gBi38yL81odKU5xaES0xbYh6Xiv
	19lLpbolfu4JcqNgh+jv76dc2Qf8oe5ejRqiRK2Ri27IPHVDMqWJfrASlfZbcXMBrYXYoSAi7Y8
	ghwjy4CXpRjq+L3hNwfWTgKb4rXclw0tTinOMnn+EdjsVxZo+RuIDA+yg5D7f7mMXH4UnklTGr7
	1BPcSPI4DaNZcH6/RS22IUDLUMZLpkthfTiWQCI6r5Qi040gIWWQKtw9oz0JkVQ39qbCQWotoxA
	Owy0+LMHGvkmcQJafXgdxwVMMRJD/clwH0V2Sp+WrneIR9xu9JLX38xtc5rhXm8LLQcsg4AQ6OR
	OdzRVd09wQ58DWAeBvDQ9ffjEx+LDpRS00uC0nzwqqT6pL4wAxtCLnYQ2glwMm2HrWjbZDM61Ld
	g0gJcuF+kNLx5J+mWH0AyBHriEbEd66SyaxSLs/oG1FqTX7ncHCwcs76xx5SbBn0HZZuThoJ/yS
	cmm+DHL/Y7ofXAxk=
X-Received: by 2002:a05:6214:2f93:b0:91e:b7fd:8ce7 with SMTP id 6a1803df08f44-91f2425d524mr70448086d6.28.1794640244861;
        Fri, 13 Nov 2026 23:10:44 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:44 -0800 (PST)
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
Subject: [PATCH 19/22] mm/migrate: restrict move_pages() destinations to common memory
Date: Sat, 14 Nov 2026 02:09:56 -0500
Message-ID: <20261114070959.3490008-20-gourry@gourry.net>
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

move_pages(2) places user memory on a node the caller picks. As with
memory policies, the destination should be general purpose memory.

Reject a destination outside N_MEMORY_COMMON with -ENODEV, exactly
the same as a node without memory is rejected today.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/migrate.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index 28a8d7734735b..fed910c9ba9ee 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2400,7 +2400,7 @@ static int do_pages_move(struct mm_struct *mm, nodemask_t task_nodes,
 		err = -ENODEV;
 		if (node < 0 || node >= MAX_NUMNODES)
 			goto out_flush;
-		if (!node_state(node, N_MEMORY))
+		if (!node_state(node, N_MEMORY_COMMON))
 			goto out_flush;
 
 		err = -EACCES;
-- 
2.53.1-Meta

