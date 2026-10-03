Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF8A33537E5
	for <driver-core@lists.linux.dev>; Sat,  3 Oct 2026 21:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791062592; cv=none; b=plI2Zpp2uJoWXBArviAZu4G03xFpVA5igEr2P3rVwe/xvA4JRMCyXtp6uRw5B8Tqp1IJBkj5Nm5M/nOdny8TIba8qeyGRWJobNlU8UoZM9mA9Eyr23VpjD8b9mvpPWANoQW+TvZykKKWicU4x9PwPuPNW2HOQ48FrnJP1O3nir0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791062592; c=relaxed/simple;
	bh=aRhPkQ0AujSti8lSbFZvdZ/I9EYR/iIXHu//HkeGLmw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fZKzaci65aodHfKlh3HR9rFtGqr5wmllgJ1B+u6xBN34fN5Rg4u1IVUj6DzDYqCKq6x10rf4B9Gk//hKETXpV/bBayWTdSDXezuA6wPtI6I4tewmHy2m/QzIeagNvzh7KcLjBJEwjL6fSDsk6aLxWUGChtVrILa2ytJAHlqnF3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tKX6zwJP; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tKX6zwJP"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c25501f4aa2so97186566b.1
        for <driver-core@lists.linux.dev>; Sat, 03 Oct 2026 14:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791062584; x=1791667384; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A8y+NqNGWEVo5m0sdN+ejiIJNOP7rTpNObbOwi7GoT0=;
        b=tKX6zwJP+MDcthDvtJ54+VnN+tAwEQouZW7DLmC57EFbmvFpoW56l85czeUs7nA95U
         WGztpsCrDGpzYu3m49nGUi7Zg4BIJeZ4zq+Hg+yIv3AaiJbUolX7LufuSlvuT17fA9yd
         wKkUpcqFhoInOOmDarnWFanh8Vf10Bi90cFyadMGjI5JKYTaGc0y6Y7PH+4Wvg5yDWJQ
         0EV+w9n+xz1dIURHHwBc77RIuKE5npwpUiUpFNmPed1BqmhJsgG0g0ld48yXKEy9pkRt
         BzNcgd8iTjv2NBwJw2QAp+F0SlxSD4OaLQTzP3TbjHFjM/0gdgmfWzi/aUvMe0syShbk
         T3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791062584; x=1791667384;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A8y+NqNGWEVo5m0sdN+ejiIJNOP7rTpNObbOwi7GoT0=;
        b=Rk8pHdfJIoKYNqdU9/Pc9wZLHdGGbx7MTcjOKTgowm4eMqC8p125jIi3n/OTFunJC/
         ZIcFcOdDaCLVPAeLTIYUU6N9fxWOkgc/S9yxIu/saIxGi5Oh00eXpsrv5Ab1wK7sVt4m
         mNEZHi118lDrEPRLyi60jYiBx8bfBBAhXjelFkZZgR7eM3Ib0zpFJZETP1b+T2hgdojz
         +3kl4QPZvQVJzEjd79zl97TuH/8ras/hBiTBHAPsfgtts52RmGRy7YRUSbvlhda933l9
         x6lc10BTdQwzF02ks/S16uSuKkxcGhdZygzWs4aP/oAeggptFsVrUlYHiVE6d7kV1XJA
         nWEA==
X-Forwarded-Encrypted: i=1; AKwUvBw/SIoXLGFD8db0x/cD7lNn0pFBcNZqKIatlfrybdCQB2kvAfT/VcdjMmJi3CsTeaEljd3qNyBSonxnZQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mIvWYG/DGj1zUH9yTPL6Q1IOmZy6P1DhZZeyQj4E0kYIUrAodf
	+Nu5D8RqR6xEgJs4hI/IIrVZTu532h6UpPCWHhOElLRaMG2GAvk7xKQU69zSANzRaowlgtRZuxc
	gPYQVzQ==
X-Received: from edse14.prod.google.com ([2002:aa7:d7ce:0:b0:6ae:2c82:36b6])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:97c7:b0:c2e:22f7:59c5
 with SMTP id a640c23a62f3a-c2e33ef144dmr845653066b.7.1791062583666; Sat, 03
 Oct 2026 14:23:03 -0700 (PDT)
Date: Sat,  3 Oct 2026 21:22:32 +0000
In-Reply-To: <20261003212241.3432303-1-lrizzo@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com>
X-Mailer: git-send-email 2.56.0.rc1.315.gc6ed9934b7-goog
Message-ID: <20261003212241.3432303-14-lrizzo@google.com>
Subject: [RFC: DMA_PMD 13/22] net/core: Use DMA_PMD for page_pool memory
From: Luigi Rizzo <lrizzo@google.com>
To: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

When dev->dma_pmd_rxbuf is enabled on the pool device,
use a per-page_pool DMA_PMD pool for page_pool allocations
(__page_pool_alloc_netmems_slow() and __page_pool_alloc_page_order()).

When enabled, pages leaving the page_pool cache (e.g. held by socket
buffers beyond NAPI) return to the DMA_PMD pool on final put_page(),
retaining their cached IOVA mapping, avoiding per-page 4KB IOMMU
PTE updates and IOTLB flushes on replenishment. Plain 4KB pages are
opportunistically replaced in __page_pool_page_can_be_recycled() when
free pooled blocks are available.

Also skip inserting and erasing DMA_PMD pages in the pool->dma_mapped
XArray (used for DMA_ATTR_SKIP_CPU_SYNC tracking), as dma_unmap_page_attrs()
is a no-op for DMA_PMD pages and skipping the XArray avoids xa_lock
contention on refill and release.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 include/net/page_pool/types.h |  3 ++
 net/core/page_pool.c          | 61 ++++++++++++++++++++++++++++-------
 2 files changed, 52 insertions(+), 12 deletions(-)

diff --git a/include/net/page_pool/types.h b/include/net/page_pool/types.h
index 03da138722f58..62a5c50dda43f 100644
--- a/include/net/page_pool/types.h
+++ b/include/net/page_pool/types.h
@@ -34,6 +34,8 @@
 #define PP_FLAG_ALL		(PP_FLAG_DMA_MAP | PP_FLAG_DMA_SYNC_DEV | \
 				 PP_FLAG_SYSTEM_POOL | PP_FLAG_ALLOW_UNREADABLE_NETMEM)
 
+struct dma_pmd_pool;
+
 /* Index limit to stay within PP_DMA_INDEX_BITS for DMA indices */
 #define PP_DMA_INDEX_LIMIT XA_LIMIT(1, BIT(PP_DMA_INDEX_BITS) - 1)
 
@@ -234,6 +236,7 @@ struct page_pool {
 
 	void *mp_priv;
 	const struct memory_provider_ops *mp_ops;
+	struct dma_pmd_pool *dma_pmd_pool;
 
 	struct xarray dma_mapped;
 
diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index d7c88c0b67e53..5774247a06291 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -22,6 +22,7 @@
 #include <linux/page-flags.h>
 #include <linux/mm.h> /* for put_page() */
 #include <linux/poison.h>
+#include <linux/dma-pmd.h>
 #include <linux/ethtool.h>
 #include <linux/netdevice.h>
 
@@ -304,6 +305,10 @@ static int page_pool_init(struct page_pool *pool,
 		goto free_ptr_ring;
 	}
 
+	if (pool->dma_map && pool->p.dev && !pool->mp_ops &&
+	    READ_ONCE(pool->p.dev->dma_pmd_rxbuf))
+		pool->dma_pmd_pool = dma_pmd_pool_create(pool->p.order, 8);
+
 	return 0;
 
 free_ptr_ring:
@@ -318,6 +323,7 @@ static int page_pool_init(struct page_pool *pool,
 
 static void page_pool_uninit(struct page_pool *pool)
 {
+	pool->dma_pmd_pool = dma_pmd_pool_destroy(pool->dma_pmd_pool);
 	ptr_ring_cleanup(&pool->ring, NULL);
 	xa_destroy(&pool->dma_mapped);
 
@@ -406,7 +412,9 @@ static noinline netmem_ref page_pool_refill_alloc_cache(struct page_pool *pool)
 		if (unlikely(!netmem))
 			break;
 
-		if (likely(netmem_is_pref_nid(netmem, pref_nid))) {
+		if (likely(netmem_is_pref_nid(netmem, pref_nid)) ||
+		    (pool->dma_pmd_pool &&
+		     dma_is_pmd_page(page_to_pfn(netmem_to_page(netmem))))) {
 			pool->alloc.cache[pool->alloc.count++] = netmem;
 		} else {
 			/* NUMA mismatch;
@@ -565,9 +573,20 @@ static bool page_pool_dma_map(struct page_pool *pool, netmem_ref netmem, gfp_t g
 		goto unmap_failed;
 	}
 
-	err = page_pool_register_dma_index(pool, netmem, gfp);
-	if (err)
-		goto unset_failed;
+	/*
+	 * DMA_PMD mappings are owned by dma_pmd_pool (and torn down on pool or
+	 * IOMMU domain release without pool->p.dev), not unmapped per-page in
+	 * page_pool_scrub(). Leave dma_index == 0 so page_pool_release_dma_index()
+	 * skips dma_unmap_page_attrs() without dereferencing pool->p.dev on
+	 * late returns after device removal.
+	 */
+	if (pool->dma_pmd_pool && dma_is_pmd_dma(pool->p.dev, dma)) {
+		netmem_set_dma_index(netmem, 0);
+	} else {
+		err = page_pool_register_dma_index(pool, netmem, gfp);
+		if (err)
+			goto unset_failed;
+	}
 
 	page_pool_dma_sync_for_device(pool, netmem, pool->p.max_len);
 
@@ -585,10 +604,13 @@ static bool page_pool_dma_map(struct page_pool *pool, netmem_ref netmem, gfp_t g
 static struct page *__page_pool_alloc_page_order(struct page_pool *pool,
 						 gfp_t gfp)
 {
-	struct page *page;
+	struct page *page = NULL;
 
 	gfp |= __GFP_COMP;
-	page = alloc_pages_node(pool->p.nid, gfp, pool->p.order);
+	if (pool->dma_pmd_pool)
+		page = dma_pmd_pool_alloc_node(pool->dma_pmd_pool, gfp, pool->p.nid);
+	if (!page)
+		page = alloc_pages_node(pool->p.nid, gfp, pool->p.order);
 	if (unlikely(!page))
 		return NULL;
 
@@ -634,8 +656,14 @@ static noinline netmem_ref __page_pool_alloc_netmems_slow(struct page_pool *pool
 	/* Mark empty alloc.cache slots "empty" for alloc_pages_bulk */
 	memset(&pool->alloc.cache, 0, sizeof(void *) * bulk);
 
-	nr_pages = alloc_pages_bulk_node(gfp, pool->p.nid, bulk,
-					 (struct page **)pool->alloc.cache);
+	nr_pages = 0;
+	if (pool->dma_pmd_pool)
+		nr_pages = dma_pmd_pool_alloc_bulk_node(pool->dma_pmd_pool, gfp,
+							pool->p.nid, bulk,
+							(struct page **)pool->alloc.cache);
+	if (!nr_pages)
+		nr_pages = alloc_pages_bulk_node(gfp, pool->p.nid, bulk,
+						 (struct page **)pool->alloc.cache);
 	if (unlikely(!nr_pages))
 		return 0;
 
@@ -825,9 +853,18 @@ static bool page_pool_recycle_in_cache(netmem_ref netmem,
 
 static bool __page_pool_page_can_be_recycled(netmem_ref netmem)
 {
-	return netmem_is_net_iov(netmem) ||
-	       (page_ref_count(netmem_to_page(netmem)) == 1 &&
-		!page_is_pfmemalloc(netmem_to_page(netmem)));
+	struct page *page;
+
+	if (netmem_is_net_iov(netmem))
+		return true;
+
+	page = netmem_to_page(netmem);
+	if (page_ref_count(page) != 1 || page_is_pfmemalloc(page))
+		return false;
+	if (page->pp->dma_pmd_pool && !dma_is_pmd_page(page_to_pfn(page)) &&
+	    dma_pmd_pool_has_free(page->pp->dma_pmd_pool))
+		return false;
+	return true;
 }
 
 /* If the page refcnt == 1, this will try to recycle the page.
@@ -1178,7 +1215,7 @@ static void page_pool_scrub(struct page_pool *pool)
 			 * if there are no outstanding mapped pages.
 			 */
 			if (dma_dev_need_sync(pool->p.dev) &&
-			    !xa_empty(&pool->dma_mapped))
+			    (pool->dma_pmd_pool || !xa_empty(&pool->dma_mapped)))
 				synchronize_net();
 		}
 
-- 
2.56.0.rc1.315.gc6ed9934b7-goog

