Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640236;
	b=vXeuNAztj2+VTaLEeF30FEMToMCW7LsGEeCmKsSubSBTeKilRCWhAhpwp+7HfPl4fOVY
	 /vQPXZ1cdV0sZjTMFAiTWah/l53EVBwKu1Vzss49W9DorB/ghRgRSRcHJoOgQvEPrvaJD
	 NKhT6v9XpIA+hq3i9kIvoD2g58b7rE2+HY0yx3B14y7Krx275QozdNQBvkSHpJMhsbitI
	 w8iEw5UhSI85mZ7DGAOJGf7QPCnMLrV9x1knbABVeK27QnXeRZIjZcBVabo6V9SUAEjj4
	 rTcb4REQHUZPeUFJdOAX5LwqPuXDizcv+4wpxHq1Ayt8f9Cw9mtnjbcyDfjtgHLBcMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640236;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LMm4cY2G8/N+lvY6+YyUeSTrUdIgOLxyZozNrk1mUY8=;
	b=pYMVkFd+axQXqlCqgBfmRJF91xdIzQqCLf8HqENI8lnTqHrTkg5cz4j6N/2CcgT1hjW6
	 uCnuFeH4Kam2qNeUDCiyWrvjsnWjk00oscEGPxkIKC3eVtSgvHCE/PzG8y+zQnih/whrM
	 qTukIcyDXgjbRggr78YqAlwsGDAh6/daPFSZSmaboeNOgCq9k+DHf6xvobxhU+LFdQPwB
	 t6ppftnRO3oPnFz3l0lqpQHlYTn+DGWCdFCpSs6BUQ5yGQ+ONBC40hweihL5GkyfpmIka
	 TAy6/1uiKs6UKb/0lnFnHoLrlxMopvIuwceSb0nOS7VFiTRZAR+WxnXPvGkM2uHT/jg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=CH4YjEA5;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB36F606B41C
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB36F606B41C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=CH4YjEA5
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91eb449364cso32558586d6.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640235; x=1795245035; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LMm4cY2G8/N+lvY6+YyUeSTrUdIgOLxyZozNrk1mUY8=;
        b=CH4YjEA5/pPUBd3brO40Ys0VFmTUV3nhKoRHUhyuyj02EN0kmlgS5D2P2nYpN+dfaU
         Yca4qMpyP84ibJto4/MT8P5wmtILf3YFg9vKMVVntkByv7rcb6nc6MaQReNFm7KUdd9H
         PaMVRpYzoqCiaWoJNplVQx6a1C1sCQqyBbkUhqaowhRtQ8INIwE0R1bluZabK4aAaxOQ
         ezxRYTGSaMfJS/bg2Sl60CU3dgh8xZoa7LVy/QAgvF0xMBADXvh2vAp/AuShfDBdZXY6
         AIAQO3vKsJKZdSGOo7wEwM+ZS62EVXwTtKJOuFP/3m1SBL9u/5wsnhVAPT6LtYEzktpO
         lA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640235; x=1795245035;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LMm4cY2G8/N+lvY6+YyUeSTrUdIgOLxyZozNrk1mUY8=;
        b=xMuvW969iMHdSkFwswjWfEYzzDQRgXD6HnpI69PXI5D/RoIK7k2rihLnKBDm4EAXgW
         geZWI8YvvJ51ldRgApRJ1X3GQ/2cBBbJ6H7LV3EypoQoBMg9bZMzJZHFPR9Qqxkbi+vw
         vFaHrK+creQk5iA+fkSU4N33nXYcpWXVJqNaOebWamBnzXqdiqdi90m0KYKSRfAJVAOA
         5nqNbOxyEaGy7JEG5KFVH7DDESep+PJU7nVtjL6WhA9FKpWekXFgtXmzALLId10x2ubU
         SPAFy4X/DY3FMbxfnxAPSe4FwX/HtRAwoq2GsUqrx5eYs26nqqLLBhAmRMKhuVLjcoHf
         RPpg==
X-Forwarded-Encrypted: i=1; AL+hErFxsh6iMqQDd47MRNnv361YsZmuBNwv6jIPip/a38vvfi63OOVnjemjyxQwIVLqygnYdNqRX1ZIGh1q9g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+WSs9SUyhtM/xufkJl8+MXf5v+NmDbMA+lZ6SdCqabul9A2IB/
	gz6y7yq7zHfevsmbnWdOVXNu+mmpfSWG63qQzWJnghbr2JAZJBRt/jSq63/oib9azeQ=
X-Gm-Gg: AYBFou1ufDnrZdbX2R1EZBCYpII3M93EoxB2dCT00fiEELZnXgC9MLGUkwsq/H7LNns
	+JWZjCf9zmvW3AEbmM1ai+ei4EKkS7QCqhPil9auSzDb+k7LRFFW1PPg0kiTRyolc7EU9mNkwc5
	A9qnlqQvDuAl8zC7V4uPFwGPFEg+3Kh91os1zXcoGaVbtgHySYT6Afp/T/u1ZRXoqRgfK+Fb+fT
	zsP91HUwneItcinm/Oj8Oi1Xbq7VFb2YQKvYjRQ2Mm4InQMeoMGMX7IssbaMA2wicbVf/kNCWCt
	fpOX89zqzMRM+HBvxaP0nS5LJ8q36k1YyW/M47h2h00B9VVpuQx5i8SJnYoqQnuc91gDh1THZ9M
	9fkXAOveFi+tO6UDemzNiSWNPpTv1XJYekFKyBm89d+TCOTnCnvn61mX64YlIFFn5opBOEvm2ww
	+o5OpVbNnqn+wfT14P38lcMHZWNcCT8aHD6hU085pcig8cmlC54bDxnQLl4lmw22hIeHto35ry9
	CjZNdGLAlCRmDZd/MSu5v4yMkkX8zHCyzJfAe4N4h9gh1iPiJWbd2VrPMiWaeVvh1/wkZsc8YPp
	qw9ucqB+/s7bnmhhXSGBK07sgdZYkC6z2ed/AfKkrHYygVHiRsQUlhKa8eT0ipWliKBuDoCN7Uu
	fyP8aeSLuw/N+Xig=
X-Received: by 2002:a05:6214:1d2a:b0:91f:17be:7c90 with SMTP id 6a1803df08f44-91f2424c199mr78511936d6.55.1794640234508;
        Fri, 13 Nov 2026 23:10:34 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:34 -0800 (PST)
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
Subject: [PATCH 14/22] mm/page_alloc: count common memory nodes for kswapd recovery
Date: Sat, 14 Nov 2026 02:09:51 -0500
Message-ID: <20261114070959.3490008-15-gourry@gourry.net>
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

When a zone recovers above its high watermark, free_frozen_page_commit()
clears a hopeless kswapd state if more than one memory node exists,
since allocations could then have fallen back to another node without
triggering direct reclaim here.

Only common memory provide fallbacks, so count N_MEMORY_COMMON nodes.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/page_alloc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index 580feeb608b7a..6d98e213460a9 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -2949,7 +2949,7 @@ static bool free_frozen_page_commit(struct zone *zone,
 		 * kswapd work again by resetting kswapd_failures.
 		 */
 		if (kswapd_test_hopeless(pgdat) &&
-		    num_node_state(N_MEMORY) > 1)
+		    num_node_state(N_MEMORY_COMMON) > 1)
 			kswapd_clear_hopeless(pgdat, KSWAPD_CLEAR_HOPELESS_PCP);
 	}
 	return ret;
-- 
2.53.1-Meta

