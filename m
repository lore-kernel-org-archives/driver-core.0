Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DFD043F081
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 15:29:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585381; cv=none; b=VZVP3thXK7/JQ8JUZ1mTQ4EgwujCvqQLATjPsYSmIdiiU93hYCPecDT+k2jTCdwJPSeOODz3y3lj6uFyTxir6S3eZoz0sJuLoMv2Ogce55KxTRHOdZpK2vfOO5nqwVwSGasehYOCw5ypeUnjygK/Q5EihVYMNq0NATDoiU6FJ34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585381; c=relaxed/simple;
	bh=wb3aYsExEyGsCbKmxC8jyjPeXblGtpkc9Lib1zp0eB4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NjbPz2kXwPrahJvMQObnl0Yr4+8PtqDX48JlBYIBEZs5+3yEnoqm4Exyauh91jo/Txy90E/6vyDTHkP8MD9rfSekyMXIYVULSlsV/Njq++vNtgvXpfL9ZyGEncWjcH4TU7ZvWgAouYqcnC3RvxqrMUAaPo0hubBCjZ3SGpFT8Ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ifa5lMR5; arc=none smtp.client-ip=209.85.218.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ifa5lMR5"
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-c15d4224f9dso78608066b.3
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 08:29:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787585376; x=1788190176; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XxtYpttAkkFeNCs4heKfMrvlAQRBvH9LjM7sWbysPCs=;
        b=Ifa5lMR5ws5n1+v89S3d8zjhZ+3mw1AohxyyFL3mKZAWdK6lcOVSH39fbslPopkWoz
         H1Q6Uri56fE+sjMldf4U1cvNvxvalEDsx/L2WhZTwm8aMsoUyYvrdjuXsd3Dr5eqpKF6
         8th+3opxlEB02HcqM6h3vISpQJnV0amhSAqWff/zMa1bJ44mwabgJIeBacloPWMP5jxz
         4FVevoT/9UIPmYjZWCDYko8M2yFpcZBGsm1wGyWqVRH4ftUDHhqe2jhwMs0q9D2vdGAt
         ORLvXGosDjwEkbQXjmMQhHwRUXPSHfjwfXWwXBMQfkSOl4482J9yjl2ege3VU8L9VDMb
         Jwrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585376; x=1788190176;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XxtYpttAkkFeNCs4heKfMrvlAQRBvH9LjM7sWbysPCs=;
        b=VocqatX8x1iNOUeDPKv2reeN6C4Y2dhPhV1dbea/g2bXukL7dW2NNQs5rqsSuwO+ZK
         Tg7Pb9XBTL8KLVlB4iVIaA6CdizVGtz5Fbg82EiZLSiDN3qi2LtYBvTfae1zRHfKyODV
         pvUfnKj+fJfiIclKAyuFKrcBVqEBF3zJND64hNWVUbDAWmx+T9veO1fGOlKwtOKs4chA
         aHVqbYYb0Dxasg4mFp/MQpOv+m/XKq8qLqztPUf6tlT4MNjyI3XH/E3Y+LVlhoqWCGQf
         E3KzRM2Rx74F5Hn7Ru43mrDYp22X4ShhXveoPTqcptaW8JnRQr3+jQBZnV1+VigiHGWT
         77XA==
X-Forwarded-Encrypted: i=1; AHgh+Rrb/gvNS+0r7pyVoN2A67ODX7AWU0I8iwi6SVtytxCbYV4gbs73+ApckJVlTXb/qbzMf4Y6JVR4VXTT1A==@lists.linux.dev
X-Gm-Message-State: AFuF++lGm1+u1OhV8L4V+o8Xelu/LdH5i7n4fBcdUG7XHLvfelvZ2KZw
	46R/EIvy87Is+Ph4VytCyLqMMiyVQXJqwBKiSPLDiNXv7HV6pYekTn6yyftH8tYb/OKhV0XaOiy
	SgYl5+Q==
X-Received: from ejcfb18.prod.google.com ([2002:a17:907:3a12:b0:c21:94a2:c168])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:c245:b0:c24:6f95:4f0e
 with SMTP id a640c23a62f3a-c2492719d94mr2282288466b.18.1787585376193; Mon, 24
 Aug 2026 08:29:36 -0700 (PDT)
Date: Mon, 24 Aug 2026 15:29:28 +0000
In-Reply-To: <20260824152932.1583506-1-lrizzo@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260615234220.3946885-1-lrizzo@google.com> <20260824152932.1583506-1-lrizzo@google.com>
X-Mailer: git-send-email 2.55.0.766.g2966f0265a-goog
Message-ID: <20260824152932.1583506-2-lrizzo@google.com>
Subject: [PATCH v2 1/5] swiotlb: enforce pool nareas and nslabs invariants
From: Luigi Rizzo <lrizzo@google.com>
To: Marek Szyprowski <m.szyprowski@samsung.com>, Robin Murphy <robin.murphy@arm.com>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Luigi Rizzo <lrizzo@google.com>, 
	Luigi Rizzo <rizzo.unipi@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dragos Tatulea <dtatulea@nvidia.com>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, netdev@vger.kernel.org, linux-mm@kvack.org, 
	iommu@lists.linux.dev, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The SWIOTLB allocator relies on two runtime invariants across all
pool initialization paths:

1. pool->nareas must always be a power of two so that a slot's area
   can be located efficiently via bitwise masking (index & (nareas - 1))
   instead of integer division.
2. pool->nslabs must be a multiple of nareas * IO_TLB_SEGSIZE so that
   each area contains an integer multiple of IO_TLB_SEGSIZE (default 128)
   slots, preventing contiguous allocations from crossing area boundaries.

Enforce these invariants consistently during early boot, pool
initialization (swiotlb_init_io_tlb_pool), and restricted DMA pool setup.

Fixes: 8ac04063354a ("swiotlb: reduce the number of areas to match actual memory pool size")
Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 kernel/dma/swiotlb.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 1abd3e6146f45..8e4bd9d47735a 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -33,6 +33,7 @@
 #include <linux/kmsan-checks.h>
 #include <linux/iommu-helper.h>
 #include <linux/init.h>
+#include <linux/log2.h>
 #include <linux/memblock.h>
 #include <linux/mm.h>
 #include <linux/pfn.h>
@@ -176,7 +177,7 @@ static void swiotlb_adjust_nareas(unsigned int nareas)
 static unsigned int limit_nareas(unsigned int nareas, unsigned long nslots)
 {
 	if (nslots < nareas * IO_TLB_SEGSIZE)
-		return nslots / IO_TLB_SEGSIZE;
+		return rounddown_pow_of_two(nslots / IO_TLB_SEGSIZE);
 	return nareas;
 }
 
@@ -269,7 +270,16 @@ static void swiotlb_init_io_tlb_pool(struct io_tlb_pool *mem, phys_addr_t start,
 		unsigned long nslabs, bool late_alloc, unsigned int nareas)
 {
 	void *vaddr = phys_to_virt(start);
-	unsigned long bytes = nslabs << IO_TLB_SHIFT, i;
+	unsigned long bytes, i;
+
+	/*
+	 * If we have multiple areas, ensure each area's size is a multiple of
+	 * IO_TLB_SEGSIZE slots by aligning the total pool size down.
+	 */
+	if (nareas > 1)
+		nslabs = ALIGN_DOWN(nslabs, nareas * IO_TLB_SEGSIZE);
+
+	bytes = nslabs << IO_TLB_SHIFT;
 
 	mem->nslabs = nslabs;
 	mem->start = start;
@@ -1813,7 +1823,10 @@ static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
 				    struct device *dev)
 {
 	struct io_tlb_mem *mem = rmem->priv;
-	unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
+	unsigned long nslabs = round_down(rmem->size >> IO_TLB_SHIFT, IO_TLB_SEGSIZE);
+
+	if (!nslabs)
+		return -EINVAL;
 
 	/* Set Per-device io tlb area to one */
 	unsigned int nareas = 1;
-- 
2.55.0.766.g2966f0265a-goog

