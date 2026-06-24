Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C6E73D7D86
	for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 14:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782313078; cv=none; b=jYV02ZpgrWMuqILzzP4uUwkyr+5eE0egocYx3068eMhdH+i4ThDDNWPGTcZ24HBBsoCjP66FjUeW3LEVXAuehreXo+5Ta+o1bOH7wIBQOr2HMNyOmucAj6hdl6amTQ4vRi9n2ftvJ+md8UA07K+C7QHe5vKXubdq4Q89HRNqkgo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782313078; c=relaxed/simple;
	bh=TDiA7zntPHCkesbe2HDhTkXNSMZ1tAv5vFsX39Fbk2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oDFDCg/GNJLpv6QBWQiNucYj1zZq+LB3mhp49KJ4yBteXo1wmUntjZV/cBTr4dgaeCuB4C7Wf91XmKwE3Cdg2VKK3T2B89kH0SkWAzvZ+WjjoAHPNfq2Op3RkupP4DNUOLa5EhdGZ/g1frO/JyNVzPOzvfJ4Kd0kpAVNR3sNF9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Gz+TVV6S; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Gz+TVV6S"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-517de710886so7802291cf.3
        for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 07:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782313076; x=1782917876; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5N7tLwBQJv8x9qNdxv/vKv4Fda4fwQcQqQmjxm5j+/M=;
        b=Gz+TVV6SsNxP1Fd+lWzszyyAUVpo2o6gBRyf8rcNcwy2QAQAyI6AVP1oXTjBQVZmFC
         D4vBJ1nNwbg2+1y29bDwacRBdBlP9xdmnHaHcJP7CUVO7gxRY6zw8UlOrYfxJmhdDMhq
         mjTUjxwxGUfcsjk5Ju7+el3H40a/jv+C4nGftKxz3UxTCXuiJVTU5VqELw1YNdxLEK+5
         rZ0nW2lAPcTZZpBDYCJYnDBcyYu5G42d09ge6ptGM/g3UrlRCjSIRfOMHoof/bwPyUhn
         kqQrC1R36QwmXpduIys5PrPP0+GET60Ey2ArN5n8iPgw8claAZ5n7X2H3AvCWrzSNlDM
         c3hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782313076; x=1782917876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5N7tLwBQJv8x9qNdxv/vKv4Fda4fwQcQqQmjxm5j+/M=;
        b=r6+G9JNwM6gqlBZ7UML8msemaNHMwGGn9Ho5Vb8+VQ3bJfaJzJgSY0deN6wK+VOHB2
         MZy0vDtXaVZPrx0062h+SWiJQ7ZNgxrgTDGKtpRwu53u6iOXMgxKebsvh8EEpEYcCEWN
         sRpbg3tBSXjyWLuOYyBaAs6FVW0n9QPhCm3BBzzI1HToZSr8+OhMZvHuVCxlgLV/0jET
         g+T2MescaR8OZCxxeAj60d8SA9WUWNF5ChS600rPsWo/+vruxfG+XOpGHmKRlfPIJYE7
         EvFCYBHr+k5CUegslrUm3DzYetFa84jh/TzxP2H/asKu3lfCch0N4JCBTHMwq0Is1RBP
         6irQ==
X-Forwarded-Encrypted: i=1; AFNElJ+v9Agkb78fO6544g9PU8dGYlPdmvwEwonr7qVtvHVLS5NwG5K4fHU2Garu+GCb7hn4NsDItvUSAvpaHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhB57GwQQoGSNX1dXXrRq1Tyx9hFGe3yCYNI3JdPJX4cVcIbKd
	r31fTQEuwuOO6qT1W2HG06xL30F7PvV5cZtbNUNYkjjIcVuSN1rdLgkUMUTMRohJbYY=
X-Gm-Gg: AfdE7cmLDnTGTXc5baNZ7pyZ9hpbqFVvcAPfvga5+RqzTxGjFz/i4puZDq1IlBGIf7g
	geiXhY1/3R0SPD2FYb3CNDuYOCIhn9sxzJfzl1UWkwTaXEJvaeiFRcYwj9bDp9it1rwwsvFddDc
	TZksTSFDSNrkeVGCDsGGWuN3FjOchsjQUBOt7wlvT/sSnb4t4yzuhrOqY4Q2VEubPep5/aJLsyl
	ieZN6yZmUyqHtSYV0GBWSaJu8XoW/1b+b/E1oo571f1gO9ayfLZmdOEwEo5+naepKbZhKDzmeSQ
	VkdKa+NV+mR45ZrEbUhuieAot4/8O047PU2CnrVphc2QCFouFjBRQxI3+yeWNH0Aixo4rbOjh/+
	luiw7XsrfESGn/hxmaJ1DUGxL4VzkUPkB5yvKLTHK7+lmhUm9CHrOJrE8jCuFaRPBDWgrSzAW4y
	Xxcj0K4JVQbJBeWgZGWoQFGIB3WJzwW76zez0W5jVEOjrmmenwwJR2yrWnQp83wPHsXI7znyvwI
	KNV+gSPwx8/
X-Received: by 2002:a05:622a:144f:b0:516:d84a:9f54 with SMTP id d75a77b69052e-51a5484ff5fmr102012121cf.38.1782313076353;
        Wed, 24 Jun 2026 07:57:56 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51a51ae8ee7sm49502301cf.24.2026.06.24.07.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 07:57:55 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org,
	nvdimm@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com,
	ira.weiny@intel.com,
	apopple@nvidia.com
Subject: [PATCH v5 1/9] mm/memory: add memory_block_aligned_range() helper
Date: Wed, 24 Jun 2026 10:57:36 -0400
Message-ID: <20260624145744.3532049-2-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624145744.3532049-1-gourry@gourry.net>
References: <20260624145744.3532049-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Memory hotplug operations require ranges aligned to memory block
boundaries.  This is a generic operation for hotplug.

Add memory_block_aligned_range() as a common helper in <linux/memory.h>
that aligns the start address up and end address down to memory block
boundaries.

Update dax/kmem to use this helper.

Signed-off-by: Gregory Price <gourry@gourry.net>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
 drivers/dax/kmem.c     |  4 +---
 include/linux/memory.h | 22 ++++++++++++++++++++++
 2 files changed, 23 insertions(+), 3 deletions(-)

diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index a18e2b968e4d..592171ec10f4 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -33,9 +33,7 @@ static int dax_kmem_range(struct dev_dax *dev_dax, int i, struct range *r)
 	struct dev_dax_range *dax_range = &dev_dax->ranges[i];
 	struct range *range = &dax_range->range;
 
-	/* memory-block align the hotplug range */
-	r->start = ALIGN(range->start, memory_block_size_bytes());
-	r->end = ALIGN_DOWN(range->end + 1, memory_block_size_bytes()) - 1;
+	*r = memory_block_aligned_range(range);
 	if (r->start >= r->end) {
 		r->start = range->start;
 		r->end = range->end;
diff --git a/include/linux/memory.h b/include/linux/memory.h
index 463dc02f6cff..9f5ef0309f77 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -20,6 +20,7 @@
 #include <linux/compiler.h>
 #include <linux/mutex.h>
 #include <linux/memory_hotplug.h>
+#include <linux/range.h>
 
 #define MIN_MEMORY_BLOCK_SIZE     (1UL << SECTION_SIZE_BITS)
 
@@ -100,6 +101,27 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
 unsigned long memory_block_size_bytes(void);
 int set_memory_block_size_order(unsigned int order);
 
+/**
+ * memory_block_aligned_range - align a physical address range to memory blocks
+ * @range: the input range to align
+ *
+ * Aligns the start address up and the end address down to memory block
+ * boundaries. This is required for memory hotplug operations which must
+ * operate on memory-block aligned ranges.
+ *
+ * Returns the aligned range. Callers should check that the returned
+ * range is valid (aligned.start < aligned.end) before using it.
+ */
+static inline struct range memory_block_aligned_range(const struct range *range)
+{
+	struct range aligned;
+
+	aligned.start = ALIGN(range->start, memory_block_size_bytes());
+	aligned.end = ALIGN_DOWN(range->end + 1, memory_block_size_bytes()) - 1;
+
+	return aligned;
+}
+
 struct memory_notify {
 	unsigned long start_pfn;
 	unsigned long nr_pages;
-- 
2.54.0

