Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640218;
	b=3yIAgs3M9YS3kfN1UIqAGtqfn4L3ozK0TdRaYqLED4Ujtlathkn14DXsjVdwaCYYLIV6
	 ce5KAVQPVXNup9Hu4N2kB6KP3MoDAwYmoill83tJyAgmlIsBoQ0F03CFlrgSAQ7HTum//
	 yzNvmDVDavIsi8HVryHfr/6rhUO/QRD97ydwM/DCiJBGNtvTmpPrR4cxVgBUIVirTp7zq
	 GCXwyiK4vMavcqoYgFxCJbLZYvjiamOpRqoWFBarR5NzYYlFH5WMBscvNpk0J3QiqPiht
	 +sRh+Uv6qtVnTsO8Qi1JnoUrin4lCR94ITp0q4NUNkKZOqMLWGM5PTbdqBxpaATi6Bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640218;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=pld+EM/EXNXxfgZubwvob88FbJ3qDEqFg5eLGFwAxrw=;
	b=0knDDf0lWO5uUMOECpL4SGhElH7iyemxYwYFQPn33VJxiNfWu3fEpwy5S/BksCBqgxY/
	 m728J/gqIZYdrqmGk7Mya90wEoUQX2qG+kFMG2t3ax/scW48mTR6VJtu9rsijngpV/PSf
	 SrIHB2C8vLiKKNU5H38VJPIUsq94Fc/tpTjualbcLi5JxRV183SZ4g9OSS7WwkCpfp6ZP
	 eHoq0N81CeyPIk+MLnXqx0WzcWBNMUpgN93pAvkyRNWxGWXTWVAt3NwfcOmE2R4XvwrHZ
	 kMvqXyWEe2qC81w4lEwVGAPc7wv9KnG67rlEhaTxsOMDEEovBEvxVcgjAZ85W2a84VA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ct+xPY1D;
	arc=none smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BB7060A3803
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0BB7060A3803
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=ct+xPY1D
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91eb53957cbso45070876d6.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640217; x=1795245017; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pld+EM/EXNXxfgZubwvob88FbJ3qDEqFg5eLGFwAxrw=;
        b=ct+xPY1DtrgxmMmbnkPvgL1GWioCTi+9p2OTv/ztfCbmWwkjPS1I+3ksuGvSee835w
         U9re8UM/a+pYtFYHz16ITdxCKQdq+HcNthoG0ZF50l2qVXMLSa8ZGZSzBkuhFM+rsMjQ
         PYBRnxDNSmJoAHHZjI5vCetUDvPcDpNCVXgGYFMwh9WtAYFM1756y6Xb8BpR2r33FRa1
         4MH+awbHQtGGrjfOidNjbxhIHFYhbSj+S8yPBYBcHC7jHOK3ce9MeT9RWSirelgSPQoM
         gSqaE0Qtiv10Ru04GqCbABUq6crFfbN1pF8Ddr1vBPebXeVTOnX2rVu8UF2hwfXFtUSV
         R9ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640217; x=1795245017;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pld+EM/EXNXxfgZubwvob88FbJ3qDEqFg5eLGFwAxrw=;
        b=IA87all2yfZK7e8VcA0tuYyJibjPERmXtOCzM3dPW7foKTLSK/sJ5fb/gBkrWC6oCh
         /HA7FaLrNS8MqiX39SYdoHA9lC2kNW55J/AR8M3yAmagRCR/5TPuwn1Xg7T07qmXlxH0
         OPk0SrjtM57kQKa8zRbkYbp7I77cLPWBqg1Eh+3dUH1SZf/sXe1pGCGIBDw93y8CTtfg
         QbjkiIT7yV9llPIcQWboKT+uomEKTxgJDr2hVdoAWm8yCIe6FKiYPHV21fsVB+Smu607
         yg5uT3mhXtbrdkA80LK+YOANl7SpV3Ol+Akq0UezHIWUawGHQc+V0c6wu7MHy4f4KSaP
         8MEg==
X-Forwarded-Encrypted: i=1; AL+hErHNg93aqQtZ1/SH+S6/M35+ckBeYr7GPdOdB7W65xRs0Vb/zX4kZHG1vkaLuD2xkt9C3qCQC1QdGD9bVQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/QluYMZnd2lYc77v379Mz+/RykUhILiZNdMpF8/8YkoXNuBRC7
	qzD9fkCm8EkN8K+QL5+4K45i6BVA4z52p582eN3r0QUgobBZ83QGEJ38kmHpdaHmctk=
X-Gm-Gg: AYBFou1Hod4UyDrfIcrQS5pYjlX3tKhO7et0feEuIfXfPAdrGikMjWLqIhR5bfU+vXQ
	lR3Jxt3KsphvSOjEwzMXbixNCPOFw8Z5iCKUM6O5pPDmMNmZNboH+W4ECxz6qEBMFnfVdYd3J39
	CoKwzXOk6YlD8Zg5eWr3lkNU9XGrEeBMD5fMGRk5yjB8VwUttXD7ylU1McuPRLJWgzHAQ9JNPHc
	QAz0k0WHCebdf+5ClvmDwK3ActXM83bUerZh//exOmTlZWljjZj7f3pBH+j0NKsVSMzCpLvN3lf
	KRZs4wpi+/ej6KA+CeG/Zyd+eQsDOpDRonxHxSzJfxxnjOORtJIUobpvAwEDEew1+MpxO84G2cn
	A0cy8lTBTiT0Q05bCGJ9S1t97qCYqx0B7rtl7KCPI+vGgiHD2TUGv7oE9CNpXMn+Ms/o5OGQ0lf
	bARWIrdM8CeCmMoT+1hzLmznO1XpbwkgSgqZeUWq0rv3pk5dTu1xZBz9NCQ4LqSdSe8ZCKb/suY
	5f8NtPzkxpR1pad04QqTY2KI33QzwWFwOlrJq0Xplv0RZMOG2v4FIoFrTPHBBmmG3wzrVjk0pmo
	rfctNFoscmk5IaI0LbVl/+j0oCc0UsKPXx5SFbKc557OMk313+mGbQ38yiI/nT5+4xDu7UPe7wh
	kvH5wQsbbEW86f7LcanOu4OZKySHe+UR8Bzj5
X-Received: by 2002:a05:6214:6347:10b0:91e:cf4d:f868 with SMTP id 6a1803df08f44-91f2420f9c3mr56246926d6.22.1794640216984;
        Fri, 13 Nov 2026 23:10:16 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:16 -0800 (PST)
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-serial@vger.kernel.org,
	linux-pm@vger.kernel.org,
	damon@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	akpm@linux-foundation.org,
	david@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	johan@kernel.org,
	jirislaby@kernel.org,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	baoquan.he@linux.dev,
	baolin.wang@linux.alibaba.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	pavel@kernel.org,
	lenb@kernel.org,
	hannes@cmpxchg.org,
	brendan.jackman@linux.dev,
	ziy@nvidia.com,
	sj@kernel.org,
	muchun.song@linux.dev,
	osalvador@suse.de,
	nico.pache@linux.dev,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	kas@kernel.org,
	xu.xin@linux.dev,
	chengming.zhou@linux.dev,
	gourry@gourry.net,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	ying.huang@linux.alibaba.com,
	matthew.brost@intel.com,
	byungchul@sk.com,
	apopple@nvidia.com,
	rientjes@google.com
Subject: [PATCH 06/22] mm: base hash distribution on common memory nodes
Date: Sat, 14 Nov 2026 02:09:43 -0500
Message-ID: <20261114070959.3490008-7-gourry@gourry.net>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114070959.3490008-1-gourry@gourry.net>
References: <20261114070959.3490008-1-gourry@gourry.net>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

hashdist is useful when large kernel hash tables can be allocated across
multiple NUMA nodes. The tables come from ordinary allocations, which
only N_MEMORY_COMMON nodes serve.

Count N_MEMORY_COMMON nodes when applying the single-node optimization.

All memory is common as of now, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mm_init.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index b4c4dba93652d..0c076bf5bf380 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -685,7 +685,7 @@ __setup("hashdist=", set_hashdist);
 
 static inline void fixup_hashdist(void)
 {
-	if (num_node_state(N_MEMORY) == 1)
+	if (num_node_state(N_MEMORY_COMMON) == 1)
 		hashdist = false;
 }
 #else
-- 
2.53.1-Meta

