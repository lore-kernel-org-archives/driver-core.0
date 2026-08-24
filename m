Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B38144212E
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787585386; cv=none; b=loNs1W5a4YQ0ZiGB9Rx32kKrDlm0q64jTYR4EGIZlCoH9EspkabeQxSNfCHu40uJqZEvilwLLCpz7vHha4iXBiDIuckPP/X1qzvcR2rtXOERJZ8IJY+4LxqJMex++Ze/VQSe+sb2MJS2uc2h0e6J1mrVpT1uQDAgT78ICb7rt6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787585386; c=relaxed/simple;
	bh=Y8jENIUNDeT2CaDx0lPDFpqJK/OjLgdPk5Qq7s+pqKQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hWFko/6hiX1psd74vgAdD42J1KzmQlOQaW7crNL7NOydjWlRNxWOjRXGiYPAPUpisDlF13p5SUQzuO0aEwYuQeiReWIaVE54j2keWjHwbpODni0Z0S7y9tKnHPCMhvA3IfLplVzIyj+PgOCCM6zygtBBBz1O8OpPS0wujT/VUKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dGLpYYqS; arc=none smtp.client-ip=209.85.208.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dGLpYYqS"
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6a17c83732fso3839935a12.2
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 08:29:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787585381; x=1788190181; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JPV7mwpWvFlRgLJpo7McYGSN9ACQlDljrVAQMeggU7g=;
        b=dGLpYYqSN/F4xHnyebN7PusEPQ9mgXlfR8/afLxEfwZpS4kyAo7IUnkGlT2LKL+5JM
         zHOflhGlOAZC5UW3shAG6rSn9OcEDkvIbO2gu7OFkk7F4qf/SI+b4LGoildlrsrZMb4k
         ESx+9HzhWtbth69/EC7ZHJoS5/v7kQ/Y9RlLn6WwRZJqra1+vAw7RejkPFtBTA30YF6k
         TUPmbUnLtcH3EJx9qPtWBERGyl1lq4ALlqhWwRc5wQHM+gD7ZDOwJ22HCcj+hek0CP8S
         pQXpyTjok0EuY14GxAc+wHXcrhFeXzuCvpJ6SLv/W3K4MAw2xwM6siMzp7u9C1JZtYmC
         Z2rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787585381; x=1788190181;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JPV7mwpWvFlRgLJpo7McYGSN9ACQlDljrVAQMeggU7g=;
        b=Epx96qb3fVBdkjRxNctBIIXAwySs4h2QXMO8A3i3X2VyQ5+AZ3Z5aJqzjazTnJjxmn
         35Kn/AgkWnVDVojhni9rN/CYpXzbjy6De1ByF2x2kM6lRE+fqtqnZNhwp2KCtv/IWhB+
         VqImCRBJkiqsbQPozj4n+1L20ajYYbqtub0sle59otzIjiHkoFChOv3eUnn7N/Z0cl9m
         T5HneWjAiXK0PoNw8AK+0Dl+DImkiEc60kJaDuFh9vY/2TV6bbRcNouf7861Hu4xKTyl
         FovH+QwhBXxxpkSDm6m2gsqVNt2Jr+K1dAyBl0/n5YbhcPy8Y8H3n2lTjR7Kg5++Gb4M
         Pzqg==
X-Forwarded-Encrypted: i=1; AHgh+Rp2rMjn8hR2YMUCRkfdGG72VPIdcEPJAkdzToYBdRTsOCWxwl/u+5Ag4dNZPeRyjVyeaeoYz2DDQVrgrQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kpLNxYVm8B8Jbb05/7r2i5p2OQGOCfEQb2QPh7Y/b/e7kJFnt+
	wq5KS73jx8Rsybbby/p9wuM/rbqfg8aVYbBDT8sfydgfuyFTfytvhp8/z2igwJw/uQ+Rzb3bMop
	KpT/BFA==
X-Received: from edro3.prod.google.com ([2002:aa7:d3c3:0:b0:698:6d8c:dd8e])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:321a:b0:6a3:f3dc:d7f3
 with SMTP id 4fb4d7f45d1cf-6a42f216053mr33518684a12.16.1787585381419; Mon, 24
 Aug 2026 08:29:41 -0700 (PDT)
Date: Mon, 24 Aug 2026 15:29:32 +0000
In-Reply-To: <20260824152932.1583506-1-lrizzo@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260615234220.3946885-1-lrizzo@google.com> <20260824152932.1583506-1-lrizzo@google.com>
X-Mailer: git-send-email 2.55.0.766.g2966f0265a-goog
Message-ID: <20260824152932.1583506-6-lrizzo@google.com>
Subject: [PATCH v2 5/5] swiotlb: Implement RX nocopy with fast recycling eviction
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

Conditionally divert receive buffer allocations in page_pool
to the SWIOTLB page allocator.

This only happens when swiotlb usage is below the threshold set by module
parameter swiotlb.nocopy_rx_percent (default 0, range 0..90).
A value of 0 disables the feature.

To prevent existing DRAM or SWIOTLB pages from circulating indefinitely
in the lockless receive ring after changing the parameter at runtime,
__page_pool_put_page() checks residency against the active parameter
state. Mismatched pages are immediately evicted back to their
respective allocators, achieving rapid, lockless mode conversion across
active network streams without requiring interface or queue resets.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 include/linux/swiotlb.h |  1 +
 kernel/dma/swiotlb.c    |  5 +++++
 net/core/page_pool.c    | 25 ++++++++++++++++++++++---
 3 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
index 3baf52e6572d0..f4597fd01c52d 100644
--- a/include/linux/swiotlb.h
+++ b/include/linux/swiotlb.h
@@ -205,6 +205,7 @@ void swiotlb_destroy_compound_page(struct page *page, unsigned int order);
 void swiotlb_safe_put_device(struct device *dev);
 
 extern unsigned int nocopy_tx_percent;
+extern unsigned int nocopy_rx_percent;
 
 /* Track epoch (number of delete operations) for leaf device info. */
 extern atomic_t global_device_epoch;
diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
index 7b818a796ff96..91f175c34a34e 100644
--- a/kernel/dma/swiotlb.c
+++ b/kernel/dma/swiotlb.c
@@ -129,6 +129,11 @@ struct io_tlb_slot {
 static bool swiotlb_force_bounce;
 static bool swiotlb_force_disable;
 
+/* enable nocopy rx swiotlb and set the percentage of buffers allowed for it. */
+unsigned int nocopy_rx_percent;
+module_param(nocopy_rx_percent, uint, 0644);
+MODULE_PARM_DESC(nocopy_rx_percent, "percentage of swiotlb buffer allowed for nocopy rx");
+
 #ifdef CONFIG_SWIOTLB_DYNAMIC
 
 static void swiotlb_dyn_alloc(struct work_struct *work);
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index 50ee550fef73a..fe8839a7c70a8 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -19,6 +19,7 @@
 
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
+#include <linux/swiotlb.h>
 #include <linux/page-flags.h>
 #include <linux/mm.h> /* for put_page() */
 #include <linux/poison.h>
@@ -578,10 +579,16 @@ static bool page_pool_dma_map(struct page_pool *pool, netmem_ref netmem, gfp_t g
 static struct page *__page_pool_alloc_page_order(struct page_pool *pool,
 						 gfp_t gfp)
 {
+	unsigned int pct = READ_ONCE(nocopy_rx_percent);
 	struct page *page;
 
 	gfp |= __GFP_COMP;
-	page = alloc_pages_node(pool->p.nid, gfp, pool->p.order);
+	page = NULL;
+	if (pct && is_swiotlb_active(pool->p.dev))
+		page = swiotlb_alloc_pages(pool->p.dev, pool->p.order, gfp,
+					   pct);
+	if (!page)
+		page = alloc_pages_node(pool->p.nid, gfp, pool->p.order);
 	if (unlikely(!page))
 		return NULL;
 
@@ -616,8 +623,9 @@ static noinline netmem_ref __page_pool_alloc_netmems_slow(struct page_pool *pool
 	if ((gfp & GFP_ATOMIC) == GFP_ATOMIC)
 		gfp |= __GFP_NOWARN;
 
-	/* Don't support bulk alloc for high-order pages */
-	if (unlikely(pp_order))
+	/* Don't support bulk alloc for high-order pages or nocopy SWIOTLB */
+	if (unlikely(pp_order || (READ_ONCE(nocopy_rx_percent) &&
+				  is_swiotlb_active(pool->p.dev))))
 		return page_to_netmem(__page_pool_alloc_page_order(pool, gfp));
 
 	/* Unnecessary as alloc cache is empty, but guarantees zero count */
@@ -835,6 +843,17 @@ __page_pool_put_page(struct page_pool *pool, netmem_ref netmem,
 {
 	lockdep_assert_no_hardirq();
 
+	/*
+	 * If runtime nocopy mode toggled, evict circulating buffers immediately
+	 * back to their respective allocators rather than recycling them.
+	 */
+	if (unlikely(!netmem_is_net_iov(netmem) &&
+		     swiotlb_is_nocopy_addr(pool->p.dev, page_to_phys(netmem_to_page(netmem))) !=
+		     (READ_ONCE(nocopy_rx_percent) > 0))) {
+		page_pool_return_netmem(pool, netmem);
+		return 0;
+	}
+
 	/* This allocator is optimized for the XDP mode that uses
 	 * one-frame-per-page, but have fallbacks that act like the
 	 * regular page allocator APIs.
-- 
2.55.0.766.g2966f0265a-goog

