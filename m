Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795136839;
	b=necYwSA6FD25RT7ojUlymOhf3iTrNbMkUr+VPSPlYGLZY1BeTN8ub+QM1Be4w1mvrHu8
	 87mOUGbyBIjUMK4JJkSH4kYwwNiyD7E/ECRcWax7jcdXQYs6+fd33ECGP+piYcVboT6Xj
	 SvACBqliAmhi86p2UJOwlbBKNfN6btaV/TkuDrfxNqFIjKaPJo4PlDEnzv+qoIZ3z2E/p
	 o3NbR8Ia/vBQ6syc+y96EucLFrztBG46FbkT3s1OrHbb6/zoGHMPPUyPpYzO1aBr20yks
	 /Vh+5+cBjNmzJrp8aHvTU+iBtMSew6NfZut2A6uh+ADo4F44e7ilkYq481jhiB9tElQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795136839;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=vXU5FE3T392RxN9QNel254D35psegmPr29XGG2IaIcw=;
	b=wPLJ85Mfk/YdL0cy0wZmI4V5s17SUp8TmSgtzmComY/sT3HY/mDksi/9P8FbvZsEjsXm
	 6C9cwXBLNfqFG8KzD6xqGWjx/cTzdUPjd9TGg+CsTb3BCpzLovVAHv4LmQSXiG4y0y3zt
	 vLS8bTpsr71IrGG14q0o9flyjUtLb3f9L2m7p+cG2I5uNtVAjlYA8ketW0oTATska/XGm
	 g6FORCssW2Lr/7+uJDujK0RbeSIBAopzgD0GIOfe0aTNtvr1hs6qCCxANSKV0gpUrIsMn
	 iU/CiqupxtKrpMA668qRVdJ9OMuLsZT0RTyuatB6Dco0Q4QlNfflYMoYj5ZRiSFjDhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QbUTPWKs;
	arc=none smtp.remote-ip=209.85.218.69
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com [209.85.218.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 624DD60A381B
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 01:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 624DD60A381B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=QbUTPWKs
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-c50c9af44d6so28680166b.1
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 17:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795136838; x=1795741638; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vXU5FE3T392RxN9QNel254D35psegmPr29XGG2IaIcw=;
        b=QbUTPWKs9UxltPvokhRyrF2tIEhGUQHhhLvby5CXY6u7ME8ZLHgDBc6LZO/iEfpmFo
         AH4259OWvZ1gKTE4hxT0p/lHDOFzpic6vyzfZWoPe00RT63RH5uFG0rZFcvbealln1S6
         dQqWzKf1mr2q2zYsdCO6sL2zT7Y1vAmPgP8ES9889fu2q7dyqafhPIyZfForzAqKBEgr
         ATNk/hCyzeRn2qg/UsHST1VS9jEmxoo8eRW5VJV7xY40NOjuuOQEtA7k0cB9BfLkQN8W
         d+Rqi0jkEg9vSnndsrttThSW8NORXcuhwbfvejUIhHzaXWPuMWbRVPHH/SAFIrudo0vw
         rJZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795136838; x=1795741638;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vXU5FE3T392RxN9QNel254D35psegmPr29XGG2IaIcw=;
        b=PtUqC80HNR6AHLUYJkZIJJtAvog6iwC7JnJVEL2ECf1or9Ej0PHzKpaUHZpYtS7kRj
         vQ1tahOMOnp8pcwH0ol2NHkoRxVMbO+u8Puj8goC8HZYS5cyseCPuCgQW3kaI61PuRgP
         aEqZTdBPED0sPx6KskS0RfpVeSbyUBHmDaFjx5xcTyAFgbNWTfwvhhKnq94EFtlARFYe
         hd3w5nKEWe/8OZ6xTVi0nFHzI132YTpazW/CWlN1CZiOb5rVPIkTxFbSa1FGRrXVZaZ5
         yZf8KSQ4XrBOw9l+HtLgeVSVRM5e+jko22XYBnjLwqxAAP+JVNWVrrGgmtGXzR88z9xJ
         VBKQ==
X-Forwarded-Encrypted: i=1; AL+hErG5JCAH3+myskerH0QpK2bH7JT2V00F0kiLSb9MuzCK6qb/8ZmvfZ2rAKfGDROiPPbsWfF8wxHDpL6b0g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+NHdhfKx8fxTnAx6uqWrV1Ku3QKgD7DnVVb28b/X+saBfAVqwI
	lx+gaR3dM+VpVYJtOHHvDUSfu6E6mD9iYEr4TGRvcB+D3dLBQ3q99uB5vBIgQabDXy5XgVVT5TM
	kG4Y3cA==
X-Received: from ejdlt17-n2.prod.google.com ([2002:a17:907:c651:20b0:c50:cd62:3dd0])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:906:4fc4:b0:c2e:62af:b6fe
 with SMTP id a640c23a62f3a-c513a5e62e7mr135377366b.8.1795136837193; Thu, 19
 Nov 2026 17:07:17 -0800 (PST)
Date: Fri, 20 Nov 2026 01:06:45 +0000
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
Message-ID: <20261120010655.467825-16-lrizzo@google.com>
Subject: [RFC PATCH v3 15/25] net: Use PISA for page_pool memory
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
2.56.1.809.ga0b61035b5-goog

