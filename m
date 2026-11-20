Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136850;
	b=3cj8Vwd2rHq04ahLHkzMVsScq5Mod95zPBc/8BAmzAnET4L7l8uU22iWf5JFZxmXudQP
	 WfNui0NVOc2QUFta/yoqo6S94h+M+kMs+xtkiex6uabgHkkeeClAzx0jmZsOK2nNzHp7z
	 8vovyy/J+B5wqfj3fooSYp2Ov1oLWdHRdfkLpRQ3DoNFwoaQkbladCzp4qCeAGZeKmSzk
	 pXAq2zbxWij2Jt/CMBio6sBhJv/qvhabsjcyfnBhlPtpVpHTOsTNp0KtVFUv6IrzQcT6Q
	 Zke2wbGtGfSzKBHDyw6vLtH91ZYaOei0lzv9Z9uvSost+ZujEDpB/4fsUiUcNnjqBNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=uXiDLRBLPSFfTPfUoJ5i1Hu7TTvZxwWf2XG5sLJAj+k=;
	b=hXygIEbsAMDISezjN2qRkg8XYKo2Bhhfi5XTzWoQu21+CQAQAoWEBeu6dtdQSILDtAtd
	 Tr8Sxn7mgcD1JYDl9Ne1w/Drhs0onCmviOsPs9VysKOIJB2p1BJmBh1qkt8qy5ezo/5yb
	 yWiD+KfncwBx+ecc3qvYXGRpLNbBN54HnbCu7jbiHJHplb3frH+emQ+cx4VbTcYQ/JWgN
	 Zr8bFJAjIKZLoK29tYzl3CoRaBi0xZMqaPTm+oMF+mS+vB04LzkcWAdFlUfzgiUu6OWMJ
	 2xUjfYSdhALNfbL0u2pOjLbZBs35jhRoYPho+dJSn3VXl7s3Tu97UOv9DtgrfbvYjyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PjgN82xL;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8EC6074AEB
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 01:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8EC6074AEB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=PjgN82xL
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b88815d748so342163a12.2
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 17:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795136848; x=1795741648; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uXiDLRBLPSFfTPfUoJ5i1Hu7TTvZxwWf2XG5sLJAj+k=;
        b=PjgN82xLnioW5gjEThBe083wzzt8aMz2UNTV67T9D0YSRL7mouXY3s8d+RW4bF2BQT
         x4Hh/m0fgNOuaZKMfR2vd2I8/0/+YNfB0k5HbgdkV/LJzwzQijbkBr0p4c6JWeVcHxYX
         dTvWJovqlzcXRabpZ/BF2lkkQduargEX/+vTtdURix9N5xkop1EP5vZ7Lw1vP0NNeBkB
         oQRSeJjoCtBELfY6UGX+8vflkxv4Dy7Pw2econBAA8q90atiGbFIAqtk2qli0zCFszR/
         JvNKaaRD2AfzYY39NLlxkEUtfalJ04Plwo5KXvGZ0pUh93GnBMqIKaYiiavCuaHBGxul
         iKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136848; x=1795741648;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uXiDLRBLPSFfTPfUoJ5i1Hu7TTvZxwWf2XG5sLJAj+k=;
        b=te9T9ZiF5xwOwHm2ObOzWbllxjX6Q6/dd41whwf7WufPJGN/tn7OkKrD5xLCm6wT9Q
         QZ93F/YW0v6ptffuuYTRz3jWzscukoyUtucEAPJB5KiQrtWcR44U9utqKPmsMzagUKjN
         z+0tbRrNonyV1CfrB41f0ep5XKZFJwCXrqu8kF1wQbtnoDxdwMK0/NBk1GSFm8077QH6
         LSWNEcK3ZFkyDpA8SonAd9J+2XX2w8iWvk2YIO8xsrzmMmRdtDzJryH+XyRxX0sazOLc
         byZqNLUwLuL1LnF+gTYxttl2pToONJ56DHWTlwY6r8uuOkzy8kX8WFhsz6sigK3+9ADH
         rHZQ==
X-Forwarded-Encrypted: i=1; AL+hErHRCMnefLuB/OyEl1pkjntdEyR9CjsV4cXr5GWjWSIjT/xgKgclecj5lPFNl8qgENhh1XX3klKJjVZ+Og==@lists.linux.dev
X-Gm-Message-State: APuU4Z9YLI0+VTcFrggqzHg8a2WVmz1LrVh/9coNdO14oEJRU2C4ci0P
	pO1np/cANIxVopZgihUGUtMHtj6uTLpYyfBrff5Tz3D3DdmQ6/uZ3sb9GbaKugYkK+vQp+0eZvy
	d/jEkAw==
X-Received: from edeg28.prod.google.com ([2002:a05:6402:565c:b0:6b7:8448:c876])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:c522:20b0:6b4:c971:589d
 with SMTP id 4fb4d7f45d1cf-6ba37d640bbmr579772a12.13.1795136847835; Thu, 19
 Nov 2026 17:07:27 -0800 (PST)
Date: Fri, 20 Nov 2026 01:06:54 +0000
In-Reply-To: <20261120010655.467825-1-lrizzo@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261109182533.3594984-1-lrizzo@google.com> <20261120010655.467825-1-lrizzo@google.com>
X-Mailer: git-send-email 2.56.1.809.ga0b61035b5-goog
Message-ID: <20261120010655.467825-25-lrizzo@google.com>
Subject: [RFC PATCH v3 24/25] net/gve: Use PISA memory for RX buffers
From: Luigi Rizzo <lrizzo@google.com>
To: Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Vlastimil Babka <vbabka@kernel.org>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Luigi Rizzo <rizzo.unipi@gmail.com>
Cc: Lorenzo Stoakes <ljs@kernel.org>, "Liam R . Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Zi Yan <ziy@nvidia.com>, Harry Yoo <harry@kernel.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Hao Li <hao.li@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Jan Kara <jack@suse.cz>, Jann Horn <jannh@google.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Simon Horman <horms@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>, Dragos Tatulea <dtatulea@nvidia.com>, 
	Naman Gulati <namangulati@google.com>, Pranjal Shrivastava <praan@google.com>, 
	Mostafa Saleh <smostafa@google.com>, Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org, 
	iommu@lists.linux.dev, netdev@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-api@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

When dev->pisa_rx_bufs is enabled, allocate GQI-RDA RX packet buffers
with pisa_rx_gfp(dev) so they come from the per-node PISA
allocator, and evict plain pages when a free PISA RX block is available;
DQO-RDA uses page_pool, which checks dev->pisa_rx_bufs directly.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 drivers/net/ethernet/google/gve/gve_rx.c | 34 ++++++++++++++++--------
 1 file changed, 23 insertions(+), 11 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_rx.c b/drivers/net/ethernet/google/gve/gve_rx.c
index 7c201fd513ee3..562c11f5bdd24 100644
--- a/drivers/net/ethernet/google/gve/gve_rx.c
+++ b/drivers/net/ethernet/google/gve/gve_rx.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015-2021 Google, Inc.
  */
 
+#include <linux/pisa.h>
 #include "gve.h"
 #include "gve_adminq.h"
 #include "gve_utils.h"
@@ -165,6 +166,8 @@ static int gve_rx_alloc_buffer(struct gve_priv *priv, struct device *dev,
 	dma_addr_t dma;
 	int err;
 
+	if (rx->data.raw_addressing)
+		gfp |= pisa_rx_gfp(dev);
 	err = gve_alloc_page(priv, dev, &page, &dma, DMA_FROM_DEVICE, gfp);
 	if (err) {
 		u64_stats_update_begin(&rx->statss);
@@ -494,13 +497,19 @@ static void gve_rx_flip_buff(struct gve_rx_slot_page_info *page_info, __be64 *sl
 	*(slot_addr) ^= offset;
 }
 
-static int gve_rx_can_recycle_buffer(struct gve_rx_slot_page_info *page_info)
+static int gve_rx_can_recycle_buffer(struct gve_rx_ring *rx,
+				     struct gve_rx_slot_page_info *page_info)
 {
 	int pagecount = page_count(page_info->page);
 
 	/* This page is not being used by any SKBs - reuse */
-	if (pagecount == page_info->pagecnt_bias)
+	if (pagecount == page_info->pagecnt_bias) {
+		if (rx && rx->data.raw_addressing &&
+		    !is_pisa_page(page_info->page) &&
+		    pisa_has_free_blocks_rx(&rx->gve->pdev->dev, 0, rx->gve->numa_node))
+			return 0;
 		return 1;
+	}
 	/* This page is still being used by an SKB - we can't reuse */
 	else if (pagecount > page_info->pagecnt_bias)
 		return 0;
@@ -544,7 +553,7 @@ static struct sk_buff *gve_rx_copy_to_pool(struct gve_rx_ring *rx,
 
 	copy_page_info = &rx->qpl_copy_pool[pool_idx];
 	if (!copy_page_info->can_flip) {
-		int recycle = gve_rx_can_recycle_buffer(copy_page_info);
+		int recycle = gve_rx_can_recycle_buffer(NULL, copy_page_info);
 
 		if (unlikely(recycle < 0)) {
 			gve_schedule_reset(rx->gve);
@@ -664,7 +673,7 @@ static struct sk_buff *gve_rx_skb(struct gve_priv *priv, struct gve_rx_ring *rx,
 			u64_stats_update_end(&rx->statss);
 		}
 	} else {
-		int recycle = gve_rx_can_recycle_buffer(page_info);
+		int recycle = gve_rx_can_recycle_buffer(rx, page_info);
 
 		if (unlikely(recycle < 0)) {
 			gve_schedule_reset(priv);
@@ -970,7 +979,7 @@ static bool gve_rx_refill_buffers(struct gve_priv *priv, struct gve_rx_ring *rx)
 			 * owns half the page it is impossible to tell which half. Either
 			 * the whole page is free or it needs to be replaced.
 			 */
-			int recycle = gve_rx_can_recycle_buffer(page_info);
+			int recycle = gve_rx_can_recycle_buffer(rx, page_info);
 
 			if (recycle < 0) {
 				if (!rx->data.raw_addressing)
@@ -982,13 +991,16 @@ static bool gve_rx_refill_buffers(struct gve_priv *priv, struct gve_rx_ring *rx)
 				union gve_rx_data_slot *data_slot =
 						&rx->data.data_ring[idx];
 				struct device *dev = &priv->pdev->dev;
-				gve_rx_free_buffer(dev, page_info, data_slot);
-				page_info->page = NULL;
-				if (gve_rx_alloc_buffer(priv, dev, page_info,
-							data_slot, rx,
-							GFP_ATOMIC)) {
+				struct gve_rx_slot_page_info new_info = {};
+				union gve_rx_data_slot new_slot;
+
+				if (gve_rx_alloc_buffer(priv, dev, &new_info,
+							&new_slot, rx,
+							GFP_ATOMIC))
 					break;
-				}
+				gve_rx_free_buffer(dev, page_info, data_slot);
+				*page_info = new_info;
+				*data_slot = new_slot;
 			}
 		}
 		fill_cnt++;
-- 
2.56.1.809.ga0b61035b5-goog

