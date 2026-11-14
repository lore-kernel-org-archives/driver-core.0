Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640252;
	b=nV4uCxJalaAJJThcdpzUnvPWpqf0n7V3UOJPtdM+eHg/hjf5cMSW0n0fB2LR0lVu1krw
	 gCaeTrnHsuVOet4jpIhNcinq7h788rPdQkr/AuvfPP7MV3T5V4qDyMNmx3PV1ybWz4jJH
	 2R/i4vsIAkF13uZUigY6G5yLl8zkzujRim26ZdR5V1cj92N2tp4OefOSmgX/mvFO/x4pY
	 3BUKd4fuB+X2lGmqt7B6BMQcG4tNnMBAMAFa4IXScf0Hm298OUZPts4KGPHENSNwVAhEq
	 L1LajKO3HLjdea3UFQUyxXnrIK52gyHJf8eqsmbi1Jsv9yiiZQuH2fzvQRYOPy3l1gA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640252;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=+HAKXNFyWuVVus4jyGRYSZgEnC6sp/o+JpWnVYJ3k8U=;
	b=w3BkjOtgauV6+N+1Ty5JBKs2uRxWsIY2bScAifW+mW5gER6u7xQYTW9/4SSJlTDNmtZK
	 2DFdQTO18L1Drcyaz+/rCSJsdJfxFsOmYobvaJAOTuTex8KE5vyrgUaeOgojczqNLerKn
	 bKq3qoLBZT4JK6eS9COilSn8ZBrqdjORP5nlHxIUyvqQR4AXY9s5peS15A2DfGe9OrU4K
	 UyuG+czj+/txZl9qNKAIsbHMuslt2m7Mw5zWAwV5kISzr2hXwn7buwAfc2/D7aNAO0VBY
	 7n7NzRf/TUMLC7hT0X46r3wmZdlAlPg/ARD+kTyJDXycf3us+b4WdeRb1LmEyk7OXSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=s38phKjG;
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6D2E606CDAF
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6D2E606CDAF
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=s38phKjG
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-55b8cd4e2abso17327931cf.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640251; x=1795245051; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+HAKXNFyWuVVus4jyGRYSZgEnC6sp/o+JpWnVYJ3k8U=;
        b=s38phKjGjPup5LXNJUW/uya+GQoXUfpzM6IAve6DcKolIOCXSLnP8IIwiqM0LMKGEp
         bjNvdWxA/jO0jmFV9PHpltK1RF6CtEpNDehChXYmBY7gMBWlzv1lTdCqIa7WlIrbBVoe
         dl7FQUZ0A17iD3CQ0oL3i1JUyQXLdoUBsPQlyOBsvNvjJ+xWdZI0kWFdt5njgsRW+Upv
         /nHV0UhbTEGpNAyjRFflohtilaAeRCq4McUGrBPSKqWL6HeotWhSYfpYvS0u8sISzXTq
         1yZ6t+T0J7jhyXStoTuY9QmphLCPFABVqD4IlIv/vZcrNuzloph0CQnEm44aN0NcyhPx
         GJjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640251; x=1795245051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+HAKXNFyWuVVus4jyGRYSZgEnC6sp/o+JpWnVYJ3k8U=;
        b=f6R7HtCaqBUPLwZTFDFvFwLHxPk+YEJlgmsrSQDODlyAQ0hLtJfsDUV4aYcscu6+Jh
         2XDzjcUVfnM/9jfY7XNkLbtDsKiwys9jZjstTm9OSvLcteGKb7TGqNd2ZXNh1c2EQlVL
         eK4C7q+YpjRau07pSo1h2qM0gW+yMBWKulzvVm6Rlg8um91oehGcj+t4f8oakvMqp2hZ
         HyEWfQo6S/NYH0iS2gbBcnTD2pDEIYxbGWk8yG1xHOkZq+xxVPe6qro+Hd1tUWgjcre6
         CpvmXCkyjQTpimEGQTgwYpv/ICU5luQbuwm+oTj2BEDpPXOCgBhFqalYyfF8u4z8J4sy
         Wo6A==
X-Forwarded-Encrypted: i=1; AL+hErGJXG0kOUYhRIG3HcGC2LxWe7FbJEFMsZlU23zJ+NlvkAJGmLYLGkm+3qieovi2JEQzKY536N+mieMEqA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/0/44K7UKv36CXlWlv3XMNz5XNAy/CLnKzMXesFUdMuMSPWMxy
	lBdwEkwPG1shIoutYmuSTWAgYwin6cKSbs1snv+D/eoJLa8lpzmA3ahOtMpkeLdq/eI=
X-Gm-Gg: AYBFou0UiSbx84Pn6fiC83CWYANBZ2vZhl6AvP6U1yof9PASsCGSRhjGbSlBendDKTe
	UkiakUFiCMOJDp1poAcJ1jZ9fMS9wDCypgx2Ua0AVUIW0WIFHTHLBrdakmIbIEbHuO2aPAh3mWF
	A8o4yNHN4vEufJqkHiHdATKEnxC4S4ZKaqHtrDW2OXyCUpq4O4G5qLgXlVEfoddDaxX8j/cZPTU
	f016KL7n0NIZqjRLDN2CkVs0xc4Xa87JIpZqHLCbOFVuBTnu2k1pCo7NME+lvWaOSG14mfcxxvm
	ZnN2YLDsXd6wltLGf4cJ3Za46BdsIQw5iuVsQgdQOT6mOOJb5jRFhsk/EUKc0B93jOlnqAOWMYG
	jfJZ5nRsqhc2eO+qLQw2XLOddDTyhPaHy09BKlacMwYCNhvQJsEvuCtKB3gZ9BOSxhtEJ0RWrzA
	ZgOZmkyy8riJxrmns+SpNSWzuFVZ5NWQgp+mzSgVVblhiCzN/ch2SsDuaHzO8csJDfI6dbmEnGY
	WKqq4v9TQ8ED2qH3gNalbXPPZLMJFyTs0uclX+zf98XrUEOCLdeGPnEjF5d+HD5TrUuAo49tp0i
	YZ48bPecFRdBWoySElwuHvzgtU5GLJhkxH8N64hGhdlmlNGfA074ywCFX8aSJYmKrBUU0bYQyLM
	e2vUm7XUR61sI81w=
X-Received: by 2002:a05:622a:191b:b0:535:a5fc:3b58 with SMTP id d75a77b69052e-55ac8b9ba4dmr73074831cf.68.1794640250752;
        Fri, 13 Nov 2026 23:10:50 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:50 -0800 (PST)
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
Subject: [PATCH 22/22] nodemask: remove the now-unused first_memory_node/next_memory_node
Date: Sat, 14 Nov 2026 02:09:59 -0500
Message-ID: <20261114070959.3490008-23-gourry@gourry.net>
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

Both helpers hard-code N_MEMORY, which says only that memory exists.

Every caller now names the state it means, leaving no users of either
helper. Remove them so new code has to pick a node state explicitly
rather than silently getting N_MEMORY.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 include/linux/nodemask.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/linux/nodemask.h b/include/linux/nodemask.h
index 7ace610bdd654..eea0ff7601303 100644
--- a/include/linux/nodemask.h
+++ b/include/linux/nodemask.h
@@ -457,15 +457,10 @@ static __always_inline unsigned int next_node_state(int nid, enum node_states st
 }
 
 #define first_online_node	first_node_state(N_ONLINE)
-#define first_memory_node	first_node_state(N_MEMORY)
 static __always_inline unsigned int next_online_node(int nid)
 {
 	return next_node_state(nid, N_ONLINE);
 }
-static __always_inline unsigned int next_memory_node(int nid)
-{
-	return next_node_state(nid, N_MEMORY);
-}
 
 static __always_inline void node_set_online(int nid)
 {
@@ -509,9 +504,7 @@ static __always_inline unsigned int next_node_state(int nid, enum node_states st
 }
 
 #define first_online_node	0
-#define first_memory_node	0
 #define next_online_node(nid)	(MAX_NUMNODES)
-#define next_memory_node(nid)	(MAX_NUMNODES)
 
 #define node_set_online(node)	   node_set_state((node), N_ONLINE)
 #define node_set_offline(node)	   node_clear_state((node), N_ONLINE)
-- 
2.53.1-Meta

