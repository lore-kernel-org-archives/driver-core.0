Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640228;
	b=AhE19mJ8WAtwxb4pVhFDPrxl6zeyWB+HRzbz2A3zNkSv8jb8R/pWrED/g2R9KLdcmbTl
	 2HmO1nYXa9NLU3a+jVa5h3Q4G5teqR4LkQPR3ilSBmlmRx5E+g/jUnuMX4VsHdGVFf7oj
	 SCivLkJJUVFYasjn9kFelyKOjFp8LYEGZH0fkAuQS8x/hpXlihc8iOHkS7CIY6jfDevQD
	 rDsNJD4aWEU5bQci5aT9kElwz/LCN9FnOt4Y4FPkXMUnDAxWSb+FUaSTl4cwqF9O5pdiw
	 9VRMIJyVpNZwONJi2+LUYtLokaPTME71us7A3R9yy7zGXdex73sl7yDW0C656163wZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640228;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ug/CLwAsG6XPyYIr9OCoTcVisBprjwnxP+sIccpst3I=;
	b=ulsTlJo8cYKVt1LGAEl5IxBy+iwdi96BWyZzVfDnn4KsXx+/ZG58dKo8xvyGEbkLf9+R
	 9jInvQ6N4zrXfUmBJYn9SILKNxw59IYVxUySCnVk8t47pajuG5pdduogulXceKYiZ/yd+
	 Z9AV7iF9MzSSIcu7qwOQL/M5qzEbv+WLoTA+2vPESTEwDsb0FJ8NgoAimSlRqhJTK9Tnl
	 rEC1CZW4Xjr8hSuPe5Y1nyhntwB5LmxcQAneC4P8rjSL15XJzh9ObMUGvDT9re7MWp756
	 wLMHeU4zGxfzHyEXhjbL7SLF9D+hs64OkCBGfCQi+ccpNHxE9SIeRsAMf7FgF0QZANg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=rlOWu8ua;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE4360A6F44
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BE4360A6F44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=rlOWu8ua
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91eb449364cso32557756d6.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640227; x=1795245027; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ug/CLwAsG6XPyYIr9OCoTcVisBprjwnxP+sIccpst3I=;
        b=rlOWu8ua6+5H5YIJssqxtDxUtQ30Wa+5xmPhyOOAJp0YxsXw/bOtooKZgSU5ALVORH
         TO9IfKh5g4O0FQwxW1GoyRWvvtTVwn7pXn55B3tq8y1U1AddL0729n0KoM1B6Z2IIyn+
         Frk+c31C/gdkP4ApzwHB85pvlj+AWXpgYMrb4t3YFPAlXE/YAMGMUGJuCyjbhfzrlaTL
         myNrEX0q/jTNt7V+h0A/zkgrZmHaXZxgOPsdskp+I3lI6+EwCxqFwcPks2fQW1cDtiDY
         4Y0n5LI07dgUngiiL6Vc1RTFWKdHVyggMHbiC9ehqkun4AZkhBkWbcceI00ZJ+IVtl5W
         C02A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640227; x=1795245027;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ug/CLwAsG6XPyYIr9OCoTcVisBprjwnxP+sIccpst3I=;
        b=wNpYNQLie/h/eGUQ4EAEVSB1Z34aKFLHecSZaP2UnlLRBt8xLcYB5xrDxu+kKPJDxE
         Z8669Utquw8ISA2I4REqWl2JakSgmFLRaG4+mK0waht+2ylAFBgRMBFyfGgPVwdUWGjd
         F/s9bzIgrTG5v21NM9uuIJjUZf+3yZL2sRzoT7nvkVTP8YdF+ehZa3QZwVE9jUe4LB18
         eX/7vUCmM8jnd3+EJ1kGDFhAmLKWjx1khlnevgQKFmevMym4B1z9fLeFbMNcsIl6vAps
         eltDBOaIDgJxBbcfeE+IlAXxHhMDJz0I3/cl4b5/B51aNpxwVrCh97E8a/WGTEWRjTOy
         y0Vw==
X-Forwarded-Encrypted: i=1; AL+hErFcI1wIQvzuWPW6lPOzUvm35mB2vGqeXKxvDX7XOnqkcXn+vBQ6vck21kQggEkMJXrPeZb7VUrK4YWHkg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/5coc6+hu9LZS8PFeE2RaOJ+qJo6OCjk0402ItOcs/T/FMICkz
	DBydmsaI60LXIQN9vxZHMiuhCWxHmZQ6qgO+hS9Mi+jyEjA1NlB1R3CAHbm4I7cI+po=
X-Gm-Gg: AYBFou1awx729JmTFPL3takt7uKQ1ZII7upwO2U7oq7otqc00UEvCThvrvwEZwobWYU
	pm+vIxzvM/7OwdeADjkLDxKYKj9mKrWUPZKi1odx5fxFiMebaHQuQHj+sQpcWOe0vfYVjPnq0WQ
	u1SBOGMmQ5V+uQHCWF5XQFtBgeci/blfEQ4bfhkkZg1MQt1sM1+ftMTjs5fcOkK7HeRw4oZPdEP
	2TY2SfYHBn+jHRwwB+FWXrUunOokAFV4+nGTQl4ZymJ6jdmj6CgiyOunLQOYKwcKczKFj8MXf6L
	rxxamt0KgNJI+pgKXB8zHo/28rxyPDRpi7r4EQ47s9L++ifrzfi4P23PQ1KRzo9SwdDYA7wdQCS
	37AtVmJkSt6RRBlh3Wu/K1BQYOlqiE8TwN+f7yioRB6GZZwvSU6JL2KGCm0PsQBr9humOKIIegc
	S0qI2lBB3CxnpkdKEzQFIZpuB1LrHaCxaB5LxNRdo0PbMHZARi2kGuvxHfKMEZ458xPouR3sbt9
	4PTMM1F7yuNbVB10RB/UCc1mVuGPzdnkBq281NZSb1pbXBdGPiAy1uUQ9q0M/0KEUJnnDvP7RAy
	5qJBCcnIG9haVxtpv3XEOUXtXtmmmhrki9BdHjJjf6VgCRyd5Kd3bv4q4M91Qq7d3v1NgjV2Gb+
	U7AKS30cnaQkyOrs=
X-Received: by 2002:a05:6214:dc1:b0:91f:1bc7:b779 with SMTP id 6a1803df08f44-91f24251f4dmr78714166d6.56.1794640227399;
        Fri, 13 Nov 2026 23:10:27 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:27 -0800 (PST)
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
Subject: [PATCH 11/22] mm/mempolicy: don't NUMA-hint folios outside common memory
Date: Sat, 14 Nov 2026 02:09:48 -0500
Message-ID: <20261114070959.3490008-12-gourry@gourry.net>
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

The NUMA balancing scanner installs PROT_NONE only on folios that
balancing may migrate.

folio_can_map_prot_numa() already skips ZONE_DEVICE folios. Skip folios
outside the common memory pool (N_MEMORY_COMMON) as well. Do not inject
hint faults on those folios or migrate them.

Convert the zone_device check to a common memory check (which includes
the zone device check explicitly).

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/mempolicy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 662ab420fe03c..619970f0eb954 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -863,7 +863,7 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
 {
 	int nid;
 
-	if (!folio || folio_is_zone_device(folio) || folio_test_ksm(folio))
+	if (!folio || !folio_is_common_memory(folio) || folio_test_ksm(folio))
 		return false;
 
 	/* Also skip shared copy-on-write folios */
-- 
2.53.1-Meta

