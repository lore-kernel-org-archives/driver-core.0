Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248752;
	b=gfq3wjFO4fCCUcKQCtZp+TjE2V41Ipdy3rbZ1L7jkwkkiGEbL0Td4xM8+9ltfEGa0yHa
	 hOiaKbgD61b0ZJk+7qiRk0Uz2B40x/iihkP4toVdNCIWik3qgbg6IuZ8Sd283j0KzuAUW
	 c26usuiezHZOeDzWVQO9M+4ufhfLyquDKWtVVw7OqWiLU8xaALuW7XwqpZ59Oh31vWFvm
	 P2biAGYaAarnEjnkBEXTo4jRJmagTUre9zxez99jFThJ7ev3Br3IF0FQ7uQ3v/abwjBns
	 8xZfKudpPWGWZS07TlIPIkvFXQ+8ZLq1a1Ep3iDzyb5lFRAtKpytlDJxX1f7/kCPfbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248752;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=NBXycfk6vA0iRzHtj3njzH1Lm9NHD4+ffX/6h9NPcU0=;
	b=w+h2nepGrUw8lpODv3goyLgVQQcwTLijEd/pu8MtuUXtWFOcGfgr1eTqvL0twDxfsR3k
	 B/WfsFgkHq+cOia8OYtWwbp/GtAdLWytYqPhfUN5ZXULH2i4INFMOBtQ27vlpyylLTsfb
	 6/mHdvUPxK5zFznUXj8JmJlyHDltG7krACs/nqkAfUe/3oOoWgtqL26SsggNyjk1tJCiC
	 L8OMN0kBOjyPtG6ck4AhiTA+1/SZWwSh/AY17avPbkN/r+m1HtnMPUgyqOmHbkcOqa4nS
	 aVQ5a19mrB2Kn+pP+Q7pRIrqs/5++Zo88Dzd9tQbrnlc3YZ+FjguFsGUa1KXSxmqy1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e1oFYxYe;
	arc=none smtp.remote-ip=209.85.218.70
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6396606AFC0
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 18:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6396606AFC0
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=e1oFYxYe
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c25501f4aa2so133583366b.1
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 10:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794248750; x=1794853550; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBXycfk6vA0iRzHtj3njzH1Lm9NHD4+ffX/6h9NPcU0=;
        b=e1oFYxYe4M6+ej5HDIh4HNvOmlUJjbpWe8tN3+G4Kf9u9SsvY4odX4epa6q6vM9Qr0
         sUTmVFKlr0IF8/9VSQ3X6OOKfZo4mvcPyahrAufUYBtX4OjO+jMkKB3Zp5qU+/n0VLBd
         aXT2dqAYrTuLDcc1CIz6n6m9dB6KJok9I2xAL695ZhQ6Q4GvUt4qwjP6FwTg6JwZJNnv
         nhu6nXhuR7nRVzXetz6Ulw+pe+1LymwkoGiAxPiJEoWJam+e5m10rfdtDhw5Fx21maUL
         SPe/zOV72Gxh5XG+mXfvxlWw1qsd46a612kVwPjpC/jgFowlUdqNi3q9qbR0CxN3rcXl
         VJuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248750; x=1794853550;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBXycfk6vA0iRzHtj3njzH1Lm9NHD4+ffX/6h9NPcU0=;
        b=aw8ykDunTr5otglkfCeStlkOKhvsl0ICXAv117zClz4sD5sop+FHRJjP8HVqrlCWL1
         NeBeKue35ainnRs3ToDB7SrtmXZ6vAt48czNha0BLZug7qtKkCqB1McOYFBV/UszljfU
         epfMZ1AgqH8pJQKlc1QxFCZuCY8/VcdoW02prnSV0/AWCwoBWieaGx8ZzMPZVjsvnId0
         E5cRO1zuX/8BSwt6u8758M3mMa6q4OKEWIHeF7YVPL1Q2udndrzedNklI2l63GyDXtyD
         LsZnWFwonanNprOLWjzNV5r/NLksiXM5h9+hdRTtk+8xsZghMivT5ssLNidgnidFYiWE
         wVMQ==
X-Forwarded-Encrypted: i=1; AL+hErFSkB9frYniy1YQNa0VHTBEGKfuxNdob6zLOeNDClYWpWllJe3yyztMrFFBXcRXN+tCIBD3J059THJrXA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/bw70BzTmHCuByOBe8NU9tszHozKXgb+WQtIIshYs48FB3W/+8
	f3NZfiF4AKcTLtt1vhXmpPumIkam+s0eyg1CSILDDByTVhMIDLd7RXTSlUzdYR4KNzs+hjtG7Ci
	W5wjzFA==
X-Received: from ejbgr9.prod.google.com ([2002:a17:906:e2c9:b0:c4d:4f51:fd3c])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:d54e:b0:c46:78af:6150
 with SMTP id a640c23a62f3a-c5047a434a2mr29783866b.2.1794248750196; Mon, 09
 Nov 2026 10:25:50 -0800 (PST)
Date: Mon,  9 Nov 2026 18:25:21 +0000
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
Message-ID: <20261109182533.3594984-14-lrizzo@google.com>
Subject: [RFC PATCH v2 13/25] net/core: Use PISA for page_pool memory
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

When a page_pool performs DMA mapping (PP_FLAG_DMA_MAP) on a device with
pisa_rx_bufs enabled, pass __GFP_PISA_RW to use PISA memory.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 net/core/page_pool.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/net/core/page_pool.c b/net/core/page_pool.c
index d7c88c0b67e53..91cae5ba78373 100644
--- a/net/core/page_pool.c
+++ b/net/core/page_pool.c
@@ -16,6 +16,7 @@
 #include <net/page_pool/helpers.h>
 #include <net/page_pool/memory_provider.h>
 #include <net/xdp.h>
+#include <linux/pisa.h>
 
 #include <linux/dma-direction.h>
 #include <linux/dma-mapping.h>
@@ -622,6 +623,8 @@ static noinline netmem_ref __page_pool_alloc_netmems_slow(struct page_pool *pool
 	 */
 	if ((gfp & GFP_ATOMIC) == GFP_ATOMIC)
 		gfp |= __GFP_NOWARN;
+	if (dma_map)
+		gfp |= pisa_rx_gfp(pool->p.dev);
 
 	/* Don't support bulk alloc for high-order pages */
 	if (unlikely(pp_order))
-- 
2.56.0.542.g3ef89b7020-goog

