Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640237;
	b=mNsnzaOabLl49fII1g1mF4RHIIWIdhurpsL+BoPUcqhtuHM4Oe845UNm7lD21jmCRI6N
	 Ax8CKEwuX+egC8LIh4gjg+EQ2+hRc7ZwfheWkIvjhmxmONBVdoe/Ov2Gotdb0vDncWL2S
	 U8RbvYu2JKBZ39yL2iP9sDswwVecpfU552i/2MaGkEcC6tRTB7AK2eEcRK9c02kkpwyDY
	 QFBLv/OXeubyf5eZPQMBCPfqJ6ro68T4r4wEizZrh/VK2vpX28mHXQ4mteHapmCCmcEgG
	 INBIzi8a+Vu00w+iz2opGdAeE09LiKGO/KYkyFxuvJuKpYr4XGw25AobPGXz9B+fRJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640237;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kuOKXOl2seY2nuHPa7QaSgImf7rgxxNJypl2yP4/rNE=;
	b=RUZawo9b32MNYtJ5ctZKOHGHPbk1PKAZx78f6nyrpRfKdlHfZwna5hfPfyEZu6LyBtsy
	 9JssxqnFC+o/hwr3F/yQXpMWeKNbrKpA1Dj34BsRSON1H5iorYAKYd+EXQEJq7Np0b3UV
	 MIJ9EWmevH8czz4l5haqWuSliJMwknQz7DWkvz55axEF3lC07gFs2YASaXSTKfyFsqP+M
	 UABy7xh0glBGiNH9dwZo22jn0HDkXwGgLe8KTlJx1sPyXAN9Y6a8C+hHCQGvi3I/EZIfH
	 KG3xwdURB846PVuT+BfLf5kd+Ki86C1U4VubWddMpFzOunw6WxvpLKM80F16YQb+Smw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="b+D91/h7";
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8913B606B42B
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8913B606B42B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=b+D91/h7
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91ef011e338so29793446d6.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640237; x=1795245037; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kuOKXOl2seY2nuHPa7QaSgImf7rgxxNJypl2yP4/rNE=;
        b=b+D91/h7LQ8J5mgY9LDECAPVr3JuNIRCPNade4NZGZlQeSSbHsbdyVwlHZ26g35jeO
         xtrdo0g71kElvFWZ/twef4EhQqcN5+zWQ414Jlw7Z/O7Nm7TKdrZlcV8GGQZ7Nntq36w
         LNBMPCyP2l5V3BewhHt1JR6woFxL8n4oGmqZ+4hUb2ROaSAk7Erbc6CZwcHD46xiOd6G
         h4G7QfSOrHY8lxGBto/fX6V/KueVnEk4iyezqXqcHy5qH7Az1CY4jC9TDWMmeuc+Y1yS
         lh0uIjrKVrjIfKNKscJ0CE6l26ec+THzO0oqAlHByO1VIUXtNRoahWktul8QMFwmKHmg
         seRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640237; x=1795245037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kuOKXOl2seY2nuHPa7QaSgImf7rgxxNJypl2yP4/rNE=;
        b=pIT1stYG2URL11uDojbZUDP4IYyTnCR5NrTU2c8+SyWDHiH0lBVsvqjxLo4tAgNkuZ
         ptiohGLZjFcpZ4NOm2MT8Ox6/65eU17JrmUGCsyvizMEvdn7rigFJEphwqlIOCahzFBD
         LkBG6Y5tFORRvk7g89soioO9vPtS9YwIj4q+nmTY4+4G5wpXmZmcom3cDA8OvxtfuymR
         wC1D0H2ZTYXYNpxjZwN9lZlsgp4XSZ/xmL+GGuhTUBl32K2auo7ek/LKEj48D8boQinw
         JlzISXSjYu1w8bcLIby6cZ1HcxgBZ4nt82mkeBneE+7azphMOwvvQT5A0+7PocHnw4wD
         Simg==
X-Forwarded-Encrypted: i=1; AL+hErHzvThRzWUtoK+FPUN4lLapCgO/7IFxoQVY5yKtkrTXLEt/CjKPzPaWIQghEsRXhB1wjKtTJribpsEspA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/LuiSzzQpse9jf5uYMaRhSA/1Pxr6yEPI/2z+wPPACJPcCW3zM
	voBaXQdhwxpJJx8jNFCG6ukOx9DwFHSm9VPLPPZX0SqS0nRLqi76XdvHoFBBEc4hm1k=
X-Gm-Gg: AYBFou12GW91auw3jDrFRkVcD9OQB49LmWxYKAXtj5UKp8ppv5LvjumBwes1+IpUf0F
	ocH0W4d/Ifg0o43zkKQZeNNj1uRRMuTXof92rXU7uO0TD7xOiywCpzoPPEGoQWpebpCxEvXteqF
	y0GVT72ty53VN5sXjo1PMXBUfMHC7DfPbDuDCEXtffL30H0hWkvMKZLedxLIJGzLz2HoNwoD2lT
	3iXiaeoidD4mvcwMamox/VumBa5al4v47McqQmYRX2ofZMUl8OALC/0VQiKqOYyRsKwvgPS8zOh
	MDIrVhJmKgYbqKeab9X/Vb/U/ifOllIkVAegFjYyyaTqEypb24QhthkP6klZpm7Cd2HjOqOTdVm
	TzKHbXAHsB8ag+vr/QPbrxPDBXl/14ph5yyR5/OzngTi3j8ckzP66hiM9uZAAdjRRHMZQ9Lared
	9BKtup5JRVKYMqvbPXVxs6u2gvzDpVv0CdKSdjncAxypzoz0571nhdx1bejUH1I2fJNf+Ugi5Pw
	Jymr1y4rCbq9c6RLmRUiv+qWRbwkUYXYRQG2lstRR5AjB8g5Rx5kvtcFX8LAB2Qaf6iGylV0Mvh
	nBP1Qlmllyf2zJw1qKYiHRAHk6k/l2WL1u0ifK7iMGNiqcSlOr9T1w9C1JxkcETmktL8uIxeW9r
	y0IA7F55fdsLxBZk=
X-Received: by 2002:a05:6214:3b85:b0:91c:15ce:66ce with SMTP id 6a1803df08f44-91f24194ac5mr80511276d6.11.1794640236685;
        Fri, 13 Nov 2026 23:10:36 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:36 -0800 (PST)
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
Subject: [PATCH 15/22] mm/oom_kill: compare OOM constraints against common memory
Date: Sat, 14 Nov 2026 02:09:52 -0500
Message-ID: <20261114070959.3490008-16-gourry@gourry.net>
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

Ordinary allocations reach only common-memory zonelists. Compare policy
and cpuset constraints against N_MEMORY_COMMON, so nodes outside it
neither make an otherwise global policy appear constrained nor inflate
the constrained capacity.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/oom_kill.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/mm/oom_kill.c b/mm/oom_kill.c
index 5d48bd862c27b..1ec22bdad1fd4 100644
--- a/mm/oom_kill.c
+++ b/mm/oom_kill.c
@@ -274,9 +274,9 @@ static enum oom_constraint constrained_alloc(struct oom_control *oc)
 	 * get_page_from_freelist().
 	 */
 	if (oc->nodemask &&
-	    !nodes_subset(node_states[N_MEMORY], *oc->nodemask)) {
+	    !nodes_subset(node_states[N_MEMORY_COMMON], *oc->nodemask)) {
 		oc->totalpages = total_swap_pages;
-		for_each_node_mask(nid, *oc->nodemask)
+		for_each_node_mask_state(nid, *oc->nodemask, N_MEMORY_COMMON)
 			oc->totalpages += node_present_pages(nid);
 		return CONSTRAINT_MEMORY_POLICY;
 	}
@@ -289,7 +289,8 @@ static enum oom_constraint constrained_alloc(struct oom_control *oc)
 
 	if (cpuset_limited) {
 		oc->totalpages = total_swap_pages;
-		for_each_node_mask(nid, cpuset_current_mems_allowed)
+		for_each_node_mask_state(nid, cpuset_current_mems_allowed,
+					 N_MEMORY_COMMON)
 			oc->totalpages += node_present_pages(nid);
 		return CONSTRAINT_CPUSET;
 	}
-- 
2.53.1-Meta

