Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794248759;
	b=3YzeEBkAQXCEKIDBj7j9GLPfgHQp4mbd53tyrn9LKLtLHd7BV2D/avABNEDAl46zvt4k
	 8g/j87OPcqO0ku7/u/SmmgJTZrDsv2f302OHBCNsySmfm/V67iLUQ9O2dLVi6iuzO+kiQ
	 PVRpOMeExogB+g1V3SUc5LYvntaEG2ehw2Q7ckpzJbHg7BDrb1k0CbLXhLz0XP3ujz/Q7
	 KgUb51ixnf6iuZVeeVsModt85y63tqv2SHz1xsdt+a+sCrBavxf08ieDLPHS5fk7bs8wX
	 mMb6MO0osI4AcsAxa4iWbtAt5ebiOYZjTifn1LFife7s5SG/ZV61e+3d1erUZQBoNwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794248759;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=+CkU7K8AN4V+yWUdhaz7RzC7M7eZI1Az06smW8kAgic=;
	b=vpQlMQqbuOcBoaDkmtBEzpEFk6SCM8nznXUzR8qkU9BGwYPGZ6k1M3bmYu+nr6lLTzpl
	 BRjAhzEg8X5/bPZCMwIXFRs1m8OPnAYl8Ikj3JFh64ZN75CJzrrAsJd5L8mi1dR+nJWnK
	 sEcvbb47gBObfdClFVPFhikBQO/Ykoblh8VtuzqWHBdE9jtbK+3sQ9K14lOVk6V1GgA8i
	 U9mzOBjGrGL863jOFEnWtFCZUVgCrdcru946XOTJ+GVJrezXI7f1jVQHTiphbGKYNTwTS
	 2SD2W4yCHFVmr2hIXekbD6/OtAxsT5u7sAkfKq9zdFIDT9rUpgTFBQQBTdxUtLY11qA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kTp0e6pJ;
	arc=none smtp.remote-ip=209.85.208.70
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B342606F385
	for <driver-core@lists.linux.dev>; Mon,  9 Nov 2026 18:25:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B342606F385
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--lrizzo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kTp0e6pJ
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-6b56a350f2aso1516439a12.3
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 10:25:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794248758; x=1794853558; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+CkU7K8AN4V+yWUdhaz7RzC7M7eZI1Az06smW8kAgic=;
        b=kTp0e6pJr/2VXXJJdByEaYsPUWIGpem6zt4eD8rlt8pLYcfutlzKVKGMmvvb77/b2T
         pYyk1IKy+2wTb9jkZPQnHZNkt/cO7XdoOPv+AycigcW6uUfro75t9vB8ifwNFDVwlQI2
         nZish+pPD80ZWKqZbiiLokne2QeywaD12TzpKBIPTpbg+EbjWF8+u7rqYV9K2lrRO7Nh
         TXGepg/G2rRY9C4zRj/cAizF1S4SblrTrrcYMb7kTY3ax9Etlg7rCsQmjkOFovaY/oD0
         8M0pKmCEcoiCQygEYnkV9GaFfN02oZrgD29zEtiBrR6Wq+d9cq113UKQjUedH9mxyhgT
         NugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794248758; x=1794853558;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+CkU7K8AN4V+yWUdhaz7RzC7M7eZI1Az06smW8kAgic=;
        b=f2WzfSBqLoTR++l51VrMleRittrCLJZXe6cAeV4bDWQ7owRaHIVHuUOgg1SSjedAJP
         hAXMy5KvscfNovbhefgXW0LmdJRtkDi8ARBkldz47ToefIoJ+x4NUZOchxNxz1NCi7w7
         WPVC54R9oCxDfhf7pZiXj+FD70CBf63Bqo5jaFUxaVii741esaSzyNw3VvxvFDt5oieC
         EsJGglLzMO0jhq3pK8nCEYFhLiKrG6X31vsNWf232Qeg6xjst9Xf/g/51TCxPvWMyKcX
         wbJWTwuEYKjEhxG67R6UN0RA3dVQfQSpWkzxPRj0v3GFrB3ym06TZMyhe9+PS/k2nNWA
         fWGQ==
X-Forwarded-Encrypted: i=1; AL+hErG9K7gwW9IFbAyfU0HiX3zAS4AmhufP8RwEOMCa/rtlDvzhjn0uMhE7ASU9BqumRPCc3MsatefJqxdRlg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/e5WzX7fU4WTkPATA2ZzmixPS1Fj3XywBv/kSCOa7GtOeHtSDY
	A+zoRcu9Yd4j9NKcAQFgU9NawEEeA8VD7gxtGeq3yOdWlOtCCLQOdN45NMyWrYfaLOvt4FEdC6Z
	90kLO6g==
X-Received: from edqs3.prod.google.com ([2002:aa7:d783:0:b0:6b6:fa4d:3bb9])
 (user=lrizzo job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:1f05:b0:6b5:7872:3905
 with SMTP id 4fb4d7f45d1cf-6b756afbbd0mr357136a12.31.1794248757581; Mon, 09
 Nov 2026 10:25:57 -0800 (PST)
Date: Mon,  9 Nov 2026 18:25:28 +0000
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
Message-ID: <20261109182533.3594984-21-lrizzo@google.com>
Subject: [RFC PATCH v2 20/25] net/libeth: Use GFP_KERNEL when pre-filling RX rings
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

libeth_rx_alloc() is called both when pre-filling RX fill queues in
process context (for indices 0 .. fq->count - 2, when buf->truesize is
still 0) and when refilling RX buffers from NAPI softirq.

Use GFP_KERNEL during the initial process-context ring fill so page_pool
and PISA page allocations (including set_memory_decrypted() under CoCo)
are not forced into GFP_ATOMIC context.

Signed-off-by: Luigi Rizzo <lrizzo@google.com>
---
 include/net/libeth/rx.h | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/net/libeth/rx.h b/include/net/libeth/rx.h
index 0e736846c5e8a..de1e5fe44aa40 100644
--- a/include/net/libeth/rx.h
+++ b/include/net/libeth/rx.h
@@ -106,10 +106,17 @@ void libeth_rx_fq_destroy(struct libeth_fq *fq);
 static inline dma_addr_t libeth_rx_alloc(const struct libeth_fq_fp *fq, u32 i)
 {
 	struct libeth_fqe *buf = &fq->fqes[i];
+	/* fq->fqes is zero-allocated and pre-filled in process context for
+	 * indices [0 .. fq->count - 2]; slot fq->count - 1 is first allocated
+	 * in NAPI. Use GFP_KERNEL for initial pre-fill and GFP_ATOMIC after.
+	 */
+	gfp_t gfp = (buf->truesize || i == fq->count - 1) ?
+		    GFP_ATOMIC : GFP_KERNEL;
 
 	buf->truesize = fq->truesize;
-	buf->netmem = page_pool_dev_alloc_netmem(fq->pp, &buf->offset,
-						 &buf->truesize);
+	buf->netmem = page_pool_alloc_netmem(fq->pp, &buf->offset,
+					     &buf->truesize,
+					     gfp | __GFP_NOWARN);
 	if (unlikely(!buf->netmem))
 		return DMA_MAPPING_ERROR;
 
-- 
2.56.0.542.g3ef89b7020-goog

