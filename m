Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9BD61F7916
	for <driver-core@lists.linux.dev>; Sun, 26 Apr 2026 14:45:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777214726; cv=none; b=kisbbq35WAZR9dYZAWu64wrtyqsf60q1RD37L8salm8kgPqvChyEiMhqOFPL0UfXtdcLDvF4LbWvDlGjitXg3CNuBXCIdlqEWoPZ1N1zR7glcMYTW01vlGwIyjlsMMql0Ic7ipnGQou/jz1B8Cja3hoepdXugB6tXkxVBnalrss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777214726; c=relaxed/simple;
	bh=7YaBT6iNVRZFSk14jBUoMTS77VVYE51p/LoYdbnTAqA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=oN3km4p6OFwXmWiTKJBkT47xBRqsc8VfZThP1Ja/NTayHAnM/sis183zU1qspWxNqE7dmLx5DTfvADhqj264CmX0TiYlWf4PJsrqPyVjNDNfD7qvCJXl3I9SsJs97LvgL84M1pmsvme6BRk4VowKPOM0w/vstLT6JItz/fx7i2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ekrjItxI; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ekrjItxI"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-35dac556bb2so5298418a91.1
        for <driver-core@lists.linux.dev>; Sun, 26 Apr 2026 07:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1777214719; x=1777819519; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mYEWwYPnxNhfjfvrN9NBByfvj86/jsr9iqTYqVjgdNU=;
        b=ekrjItxIlW4eJC70qSoMeZxn+TonuIkwSNacXDGWXOr6J3Mds9gAs8Zui52RYD2MvW
         /SgIsoGq7SSDg580Y10mUxMv74XsNqxSoMyDyoomNsDw9jorSOwzP23rkbQmo3V5WELO
         Gc1B+j5OEKCc9CnCO56RKUGyoQ8onUXWPhNn9g3mPqOg/fEA1GP9aaFHnYz2WL4Ptk2O
         zyqV/XQJWs8j4qFiifSmBcGteG/WBpLq7UKJr59Vojc7A12cYRh8/6G9q57V13JIaM/h
         7+qDAoXzPiiUKLO5LN2ZLBtuvC6AI8fsGiL5Gsv3LH+IRNDN7C7WCPCcDQvGnnovorjO
         m1jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777214719; x=1777819519;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mYEWwYPnxNhfjfvrN9NBByfvj86/jsr9iqTYqVjgdNU=;
        b=eP71v+UWMPd0whQ8Zklku1klrpjKbQ3EXpWPAFfpv5Fuo1CZCfk7gIM0H9x1Aa5QOB
         YnFxAEx9vb3+k7hPLVHO8a9RB7AF33KcSgq8ng9XN7sptQ+XkGDkqV9cRSAtBgNcXVUV
         RHJKq4hFgfyYZNTqCPpEM86PZunVOgoXoDuZCWmp21b1mQTzwQws/zyuejp77L8BC546
         sHgcHcCeyO3gSf2Oo5KYNl7aB9I1KDdTH1VTqjCSzDVbhCpfGTiv5YRGw26Qfx8+uafH
         EtHzc1nsa1wfhPz0dhorXaV12wnvyxfh/h1WX2Z1rC7cVj5Xx0AKshEV7h/kLgHom4vZ
         Cyzg==
X-Forwarded-Encrypted: i=1; AFNElJ8cyMj5ckwOiCu2MQz5Enx3YxRy/w44b0EIWHcILTMK5CnW1jqL4Go5TNzFrWEamtx7zM26jEMFL7oywg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUznf/VFA63gtWCQS6GTD2tkjMzwWpySrDL/mGYFBz0DYX4a8R
	wwUnJFZ7XerYbjPEuE5DmVNHE4An/Q7PBBsvdEDUjJm8GutyVLeoF6ypDarAxdVmP38=
X-Gm-Gg: AeBDieuyUPQiovQf1xEDRO69WLNbj7NyCFLeZ3iF4FNXgjppk8hcVmBTYNcoA4hGf8D
	ycHhwmofVrLmVm+8hwCU1JmH55AdMc72q7hTrQ2nC3wud4op7Y7+NgkLncIPoXZSWOkPR38lhHD
	Fy3Uv4I3eBAeAwHEPnuEjLZLw6IJWlM1vVT1cjPSYnzpHaR0aFci3UX8x384hKt4Y4Ez4eRkJBv
	7ofY/NveGYP11wty2cmqwD8KCZjNKJgzeqwi4CzFOpJhxF/2oCZ6QKAzqcnTbbwYg/OSf69cV+5
	TEWVOmBqynT4/1FbdEk4WhFpfV/o/wSdnVcVpXDWMYZ3X7BFKl5yvc9BYyiZH8OwoKAEZ6iRSfM
	I/MrZsNf5LG7YOuMmRHYuOf3QGKcdRGcexm3rjvk2BvtccRm/360cQgB53vZdL/6l0/zgNOKzVS
	FKETVNqy/jmSsShxa1RLe4MGpUShe0
X-Received: by 2002:a17:90a:f94f:b0:35f:c5cd:cc5 with SMTP id 98e67ed59e1d1-36140498686mr40821690a91.24.1777214718891;
        Sun, 26 Apr 2026 07:45:18 -0700 (PDT)
Received: from n232-176-004.byted.org ([240e:83:200::349])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c797703059fsm22340550a12.24.2026.04.26.07.45.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 07:45:18 -0700 (PDT)
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
Subject: [PATCH 2/2] drivers/base/memory: fix memory block reference leak in poison accounting
Date: Sun, 26 Apr 2026 22:44:47 +0800
Message-Id: <20260426144447.817722-2-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260426144447.817722-1-songmuchun@bytedance.com>
References: <20260426144447.817722-1-songmuchun@bytedance.com>
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

