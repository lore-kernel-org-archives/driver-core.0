Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248762;
	b=Tw3la63RlF06wZPuhxuuP9WhEQqDP+31P5bc0RnyW41GFL6SKU54Apr7wu0iz51kN55J
	 2oWubcTH5S59EJ60+93L+yi7CFu7MgP3HcjFeNOHreuh5g9GfTqy4JOllPWx0sQJbyskR
	 JSCs6xL0ZO2S8QsftjpdpVqawL1yTJoZ5XGNumKrU2o0qD4h56PigLfISDPK/8GzncdHm
	 uzpdcpnWR0WgKy2J1+gkcVR5Az41MA9UAy8Jm1voSbVc6qLz3klgn6Mo4PpV3SVhJ6DXQ
	 6AtSmkDJwqgW/R6D0zAhRormd2aYCRSXU3Vo7L42/cMQfz3OGSS1cN5IkDwgRqWnf4g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=X6oblkqCvojP6e7fV/VhIpBJOcN4NASJcWrnm45v9hk=;
	b=zCDEZdrbxXBhOhzCpLNm3rfIhMqVMuNTksISzMDhy7eMyfZZgiXVgaC8wMej7al21tt+
	 s4axht1qWlA811/KVW1AhxKypjovdM0ypMt2+2Br6NepnuMbnPXTm3NptBZt+f5qQiYJn
	 06fLRKXl7gYuB150HUvLM2pdJRVJhDvNz9NfokFyjxTDjwPPuw35P/jMk2uaQOtPlrauB
	 UkxbtK1bD1Im1OxMgfjwZiIOyL1BOP2ib2Cqt5pbPoYETSjX8HOgESy/QEkJnHqRdTPg6
	 z/uaj0cr3vwLT6/0uKE0WqwK21lNIHAhR2I/xLGZyHos5cdFNEMEafkk415h0bYw6pg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IayRXlQe;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 932096070095
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 18:26:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 932096070095
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=IayRXlQe
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c4108bfb63dso74364066b.0
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 10:26:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794248760; x=1794853560; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=X6oblkqCvojP6e7fV/VhIpBJOcN4NASJcWrnm45v9hk=;
        b=IayRXlQepf8MXDNWeNC3ifbOFYKgTMh4X8OVj7oXOVN84HA3NgYpjQZrRs94xsHcbv
         voFZJoCxXnhwixdLZ4MlwItTez6kXk6C2t/rfKuWODo4VSHOci8DU44BQuJjdg6QaevX
         pBigsb4l+727JsazHpo82LHNyoOBxT4bJujve6aFkeQhbf7MbesIc3C82HDpufDLze30
         BddwRbnbxvidYkwUbNI0WTxXe2nVL7oVSGENtcYU0gBF/rQ1GLpmIb6D0JlXTmkbCDS1
         gIjBL5TUCLx4HmPoQBmkqCyYLbQvd+d5yJVBosxdZ9hlrLm9MHMo18QcfOQq9md/NkQc
         8Y7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248760; x=1794853560;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=X6oblkqCvojP6e7fV/VhIpBJOcN4NASJcWrnm45v9hk=;
        b=JHbVcy0NKa+9wlhOyXOU1xagvzWEyrlIRu7dn+NjHa5dSxEZBXWeeDfQEarJQ63TyH
         vrElNy8h4J3QbNpJ9JAYDIY0h66gC0jjZTIjUCL0W0rNUN9gRvxOUw0i27LVehyrSfik
         gNBav4ItyJfHtV4DcrG+/eZOO99DDGbN3hL8/vYxdBJuz9KZcqTx9s6RmjkAJbX9a1UC
         iiS7Yi1Fc67D2zeSvHDXVaNUS59iioA+0HTdxQybmyLkGAKNwImp/CTMaJjfUiY8YjCm
         FSlKfFJb1b96V4pmzRxXSTqtq8oZu24ryHIrrn4SxhtU8E4bxKGS7mld/dGqTjhQbn8z
         OoJw==
X-Forwarded-Encrypted: i=1; AL+hErFuAuq1l94e3qVjsGQYwIGLTEEtsx1oJOVS8V0hfMjZMXPjPjKxmUXDAU0mvSurkIgr29hJOQRE9lWAMw==@lists.linux.dev
X-Gm-Message-State: APuU4Z957v0h6qHsDjetQJJAbWvCfcPO1HIdkeaEKkx7ORXMBrkPqkNm
	noRyYiys1+VU/5l37MiZ++pSwOBQn2UVpx3mEVaVqHR+LIF+IXQ7zSPT7/gEtUYGIJbF53wK3Z9
	fg/6+Gg==
X-Received: from ejblh15.prod.google.com ([2002:a17:906:f8cf:b0:c34:bb1f:3bc4])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:944f:b0:c3f:98d4:dfd0
 with SMTP id a640c23a62f3a-c50495f01c0mr14975066b.45.1794248759870; Mon, 09
 Nov 2026 10:25:59 -0800 (PST)
Date: Mon,  9 Nov 2026 18:25:30 +0000
In-Reply-To: <20261003212241.3432303-1-lrizzo@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com>
X-Mailer: git-send-email 2.56.0.542.g3ef89b7020-goog
Message-ID: <20261109182533.3594984-23-lrizzo@google.com>
Subject: [RFC PATCH v2 22/25] net/gve: Use PISA memory for RX buffers
From: Luigi Rizzo <lrizzo@google.com>
To: Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, David Hildenbrand <david@kernel.org>, Jens Axboe <axboe@kernel.dk>, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Matthew Wilcox <willy@infradead.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Willem de Bruijn <willemb@google.com>, 
	Kuniyuki Iwashima <kuniyu@google.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	iommu@lists.linux.dev, netdev@vger.kernel.org, linux-mm@kvack.org, 
	linux-block@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Luigi Rizzo <lrizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

When dev->pisa_rx_bufs is enabled, allocate GQI-RDA RX packet buffers
with pisa_rx_gfp(dev) so they come from the per-node PISA
allocator, and evict plain pages when a free PISA RX block is available;
DQO-RDA uses page_pool, which checks dev->pisa_rx_bufs directly.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 drivers/net/ethernet/google/gve/gve_rx.c | 32 ++++++++++++++++--------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/drivers/net/ethernet/google/gve/gve_rx.c b/drivers/net/ethernet/google/gve/gve_rx.c
index 89f287b678bf0..85c243bbdeb33 100644
--- a/drivers/net/ethernet/google/gve/gve_rx.c
+++ b/drivers/net/ethernet/google/gve/gve_rx.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2015-2021 Google, Inc.
  */
 
+#include <linux/pisa.h>
 #include "gve.h"
 #include "gve_adminq.h"
 #include "gve_utils.h"
@@ -170,6 +171,8 @@ static int gve_rx_alloc_buffer(struct gve_priv *priv, struct device *dev,
 	dma_addr_t dma;
 	int err;
 
+	if (rx->data.raw_addressing)
+		gfp |= pisa_rx_gfp(dev);
 	err = gve_alloc_page(priv, dev, &page, &dma, DMA_FROM_DEVICE, gfp);
 	if (err) {
 		u64_stats_update_begin(&rx->statss);
@@ -499,13 +502,19 @@ static void gve_rx_flip_buff(struct gve_rx_slot_page_info *page_info, __be64 *sl
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
@@ -549,7 +558,7 @@ static struct sk_buff *gve_rx_copy_to_pool(struct gve_rx_ring *rx,
 
 	copy_page_info = &rx->qpl_copy_pool[pool_idx];
 	if (!copy_page_info->can_flip) {
-		int recycle = gve_rx_can_recycle_buffer(copy_page_info);
+		int recycle = gve_rx_can_recycle_buffer(NULL, copy_page_info);
 
 		if (unlikely(recycle < 0)) {
 			gve_schedule_reset(rx->gve);
@@ -669,7 +678,7 @@ static struct sk_buff *gve_rx_skb(struct gve_priv *priv, struct gve_rx_ring *rx,
 			u64_stats_update_end(&rx->statss);
 		}
 	} else {
-		int recycle = gve_rx_can_recycle_buffer(page_info);
+		int recycle = gve_rx_can_recycle_buffer(rx, page_info);
 
 		if (unlikely(recycle < 0)) {
 			gve_schedule_reset(priv);
@@ -975,7 +984,7 @@ static bool gve_rx_refill_buffers(struct gve_priv *priv, struct gve_rx_ring *rx)
 			 * owns half the page it is impossible to tell which half. Either
 			 * the whole page is free or it needs to be replaced.
 			 */
-			int recycle = gve_rx_can_recycle_buffer(page_info);
+			int recycle = gve_rx_can_recycle_buffer(rx, page_info);
 
 			if (recycle < 0) {
 				if (!rx->data.raw_addressing)
@@ -987,12 +996,15 @@ static bool gve_rx_refill_buffers(struct gve_priv *priv, struct gve_rx_ring *rx)
 				union gve_rx_data_slot *data_slot =
 						&rx->data.data_ring[idx];
 				struct device *dev = &priv->pdev->dev;
-				gve_rx_free_buffer(dev, page_info, data_slot);
-				page_info->page = NULL;
-				if (gve_rx_alloc_buffer(priv, dev, page_info,
-							data_slot, rx)) {
+				struct gve_rx_slot_page_info new_info;
+				union gve_rx_data_slot new_slot;
+
+				if (gve_rx_alloc_buffer(priv, dev, &new_info,
+							&new_slot, rx))
 					break;
-				}
+				gve_rx_free_buffer(dev, page_info, data_slot);
+				*page_info = new_info;
+				*data_slot = new_slot;
 			}
 		}
 		fill_cnt++;
-- 
2.56.0.542.g3ef89b7020-goog

