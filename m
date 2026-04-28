Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484C53D4123
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 08:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777366361; cv=none; b=RrUETlNHeSumKn03Zyctn9q3lDQsu91OcjH/pjJFElQQQw+SinOMJq41q/3eriJxhHsPM0Ao35r3eKGTBAL0uKOT7kGMrZN43/f5AcNjzhjSXePjpM9gbAVJYpeCJgAbJ8pOCoTt3YcpRj/KlICKS80ejp8TzXK794GHtb75QD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777366361; c=relaxed/simple;
	bh=EwDlAeox+pLWJIfRBalnhzrey1T0agG3+31xvcpS+7k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=i18td2bUqpDl2qTvHj9NA8voev2aWI0wrp/sj/trzMT56ShD5icLUfpm93LSea1pTMwGjkxupzIwGMN2H2u1cNg7QbnUvZo4yTbwruru9nvuWJmzFg9GzEOPENq/JpPEeKD28xasAC0ceiMpKDrKFMwGYG5EWAZpJgLrwaTE2do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=Kx0qp+bq; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="Kx0qp+bq"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-35d90833cacso7011254a91.2
        for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 01:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777366358; x=1777971158; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jiF95cax3V5L6nJjgrGO2oz2uPDfmL3HpmR2wC0cXHA=;
        b=Kx0qp+bqHxHb1vmCMh+t1pA/kyOp1mEZSIbz5NgbjtfOeCTrQp3AwxQSFJ8kn/Yhoa
         ysmqBAz9aA05lS/42qppa1rDUq8Ve6uEzUZYYUG9Fyb7JMI4izKLbsq+l00YtlxrvsmG
         cbRyew4H/ZSfLORogb0o8UGQ6jXRyG+49TweUnCCFjpTgJQGC5MFx2okrvo3z4kezo7C
         S+o5XkeBJNZ3zN2IDtPiUiixW3vcxxN4E6NVjLdiOHhuGEbXwEyxRFay6BuvyriFZxzN
         CSaBLW36ZyzeQ7+mZgC7N0gcQWB7hKkTsdGv5u9h1ZGmkdk0z6q3qEJL2D03VUahts99
         wHtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777366358; x=1777971158;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jiF95cax3V5L6nJjgrGO2oz2uPDfmL3HpmR2wC0cXHA=;
        b=c08g2vYh5vrfeyFQ3P4ovtR7qcoGIhUlQB3pcsM4MmVH9+d2Anli9hBEmrgiF3Bog6
         2ib0wq4+aXQj624w/PxykZIMuR9xNuGMQTznGsh4O2hoAIYIGSFqSfrrcnAOdbVotr8K
         W4P9wZpv1W3ll2EIzfu1mV02okDFPL/XchwyyE+rhULp+vyYax4ub6+kDZjlmQa8ZUII
         IyJtPFZEvXFzdOvaybVoynufZKMNwiywZ62O72rFGPiHItLNjDPEtqeqOQkLVhPz3jb6
         xN48QzPbqx/GJgwxOqcNHnveSAbT1rW+oD9Dut9m0TAIKSWbwO4tdNfls7QQd3xKsSXr
         aMLQ==
X-Forwarded-Encrypted: i=1; AFNElJ9R5GigRiTFG22tdHN/hvsisTink2no5zRfmxAE0Yp5Df1T+q0279mYMWbvdGei5hcNo2NSBjAHF6u7Iw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfQsQXAoWds6AIs69b6Q8JhLwwWBTyLn08DcU/lPDdQcyLEPGc
	UAQSEY6dh4RZt4dPCTGv0ef6sGiFE76Ojy7tDlf9juB1GAVKaZs/43uWNr86qEqgixU=
X-Gm-Gg: AeBDievHmvOByYg99Eer2T+Y2b28EPZqKcyLhmXi0X0GRNvrOaKkJ7TIwVWGFF8U2+Z
	OPbGriYVBl5GhoV33ZXOgFl8osKUQTud8lbhK5DqbwCBQIWsRJ3BPYLT7AqREaoJuyZEQbyAYQT
	EueCO4QJBtJXuyA7RhM3zBzVOFuOeqijoO88JAz8JO7YjpIEICSK6lH+ZdkbJFshzQAgEs4gJ7s
	tPpnpnhMN26NxHiJktDcRPMoxOvbRwxPxNm2nksXjCRFMmfRDTN5ozZY7o4/22XhG/T5V/zL1GP
	gt0U91dEQtaZnHuLqY8oy7mQc5qEh4ZIoNKx62l05D6w4fQf0mdRqLEyQQfKK1qp43on/PFH6AN
	bZTxSXCtCeZtLEYKp1bTAVB6tTSb+qQ1KNIX9hxpxNYnOmmc+ga7jzx+KgG7iVOZr9w/3DC6tMf
	izZWsCwogaB8MZdZr82sknzrkt6z0s0bchCkmhyQFSct3j7+lVVRYV8/Q=
X-Received: by 2002:a17:90b:554d:b0:35d:a380:6d1a with SMTP id 98e67ed59e1d1-36491f89850mr2386051a91.2.1777366358483;
        Tue, 28 Apr 2026 01:52:38 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.103])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364902e7debsm2889080a91.15.2026.04.28.01.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 01:52:38 -0700 (PDT)
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
Subject: [PATCH v2 2/3] drivers/base/memory: fix memory block reference leak in poison accounting
Date: Tue, 28 Apr 2026 16:52:18 +0800
Message-Id: <20260428085219.1316047-3-songmuchun@bytedance.com>
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

memblk_nr_poison_inc() and memblk_nr_poison_sub() look up a memory
block via find_memory_block_by_id(), which acquires a reference to the
memory block device.

Both helpers use the returned memory block without dropping that
reference, leaking the device reference on each successful lookup. Drop
the reference after updating nr_hwpoison.

Fixes: 5033091de814 ("mm/hwpoison: introduce per-memory_block hwpoison counter")
Cc: stable@vger.kernel.org
Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
---
v1->v2:
- Add Reviewed-by from Miaohe.
- Add device_hotplug_lock in the next patch.
---
 drivers/base/memory.c | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index f806a683b767..6981b55d582a 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -1230,8 +1230,10 @@ void memblk_nr_poison_inc(unsigned long pfn)
 	const unsigned long block_id = pfn_to_block_id(pfn);
 	struct memory_block *mem = find_memory_block_by_id(block_id);
 
-	if (mem)
+	if (mem) {
 		atomic_long_inc(&mem->nr_hwpoison);
+		put_device(&mem->dev);
+	}
 }
 
 void memblk_nr_poison_sub(unsigned long pfn, long i)
@@ -1239,8 +1241,10 @@ void memblk_nr_poison_sub(unsigned long pfn, long i)
 	const unsigned long block_id = pfn_to_block_id(pfn);
 	struct memory_block *mem = find_memory_block_by_id(block_id);
 
-	if (mem)
+	if (mem) {
 		atomic_long_sub(i, &mem->nr_hwpoison);
+		put_device(&mem->dev);
+	}
 }
 
 static unsigned long memblk_nr_poison(struct memory_block *mem)
-- 
2.20.1

