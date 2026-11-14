Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640227;
	b=e5arpzoyuvZBBR/CPQcHb71eN+h2i5WCaCV84znr3LVyAbWsIZyqp+zUz52kYfsMaPqE
	 Uvj0VRP2Yt29RAF7aF0QLYgdoZg2cuxSxA803iWFEYST6fn0ajNtg9mluwPTk7HNl8FM4
	 y42weMQP6lMhqD16TIXVHvKakCy0vS58l7trtVI95jS8CWvfKezGIlZy9yLKi/D3UO7Fc
	 AnjiblFO5gHmH7JqE7DLCZsWLexTpze5I2Z4SxMj5wwl9tYXI0/rDBEj3fI5Cwp4ZZrw9
	 O+t+0oqKxzotOmt+PzoYddeYNnzXIPhX8VfILEfoHmkEFvuq1u5ccQZeQLJjjMeKfxw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640227;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Tt496ll4IbdlqeCDi3ioSW9/vXDsw+lkgrGBEmtKDJU=;
	b=u/lP7bUdi6P5tNcBb7m9/4YDI52wHv3jqY1DJnGL3OcvM/A58fDXYY6QhBiOgywdb98S
	 1llrWZ1LmuMmmEpysx+SzU6a8Y1m2u9DeHGyamZrqOMBlLUwlaWgvKq0ObjfPMO3Vv1LD
	 XFYqrgOCbRaHzD97fbdDrEd6YxRw7b26TK6O69SNCLFW0Z9ihSfGUPPO53tVIQFApsRnF
	 BtG/cndS3b4u2kIpNTxR07Mbcl+SLCfPeToldD5Rq4Vdj20yIwSJ45NOsfZTXLSYVyGao
	 nqsjp1JGmkAOVOheldkJRr9hO6PLwYjQbsTaQw5wfSYODsO7YSTvcd7CMCqYU4rGqLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=IryoeXqz;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B056460A382E
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B056460A382E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=IryoeXqz
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91f1e3dd08cso7449316d6.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640226; x=1795245026; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tt496ll4IbdlqeCDi3ioSW9/vXDsw+lkgrGBEmtKDJU=;
        b=IryoeXqzUQdrT9HfL/4HDH8dX5eeLdESAfiIMUKCvdoCYm+JrcweHiNoc2tJKLaf2c
         21DS1GzmO8wjIWfikAGVwIV0k1B+gzrGBG9KPst1S2WigUpOiiMyHBEvuNwYHkwZJ3ig
         oW4U4wDgQCrkfz2822guyBYV5LWHO4Gg+RkB4u1xmCDI12gvuEyFB8nV4zVQ9mK0xC/E
         xC0IL8kOGtl+tg5so+/nDyTmOf61X+8chVAmA+1ESjcTfa87Q5Nz/kAmFpDXIoVa02ml
         zy+fOGJJN5Zhk+F21EbnSp2bCR54IhcfgSYPWWByilLAQY5sO4QkcDWmOgbnIHx3lJaM
         hEZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640226; x=1795245026;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tt496ll4IbdlqeCDi3ioSW9/vXDsw+lkgrGBEmtKDJU=;
        b=YT1rklhj/Gd0mZfBx6+2/L/W2HSzPSOCvBG10x8vSv9Wvk7m5f7ZaltZl9KKGfDERR
         kNHw3SQTksTwPopoanwDFWh47yZXDuEstABW+Ew7HMRr+f1HXSOhtaCAdcELVQV3f3d+
         givIgBZxmQGe96OlDotf5NB0tRQlyRPndoKl7uncXg4S/BEBXdloFb/VqLuP3YjZVfzk
         NdTnA16+tGFTTPP1U4C/nFpJFD9zMQMdb5GGw1OOFLNxaL/0k9Ccqr1RtRcYUNqSUyMh
         rYwzW1feE/+OFO9lohdbO8bbRJnoTCmi4xg9I14RDY3Jwim0pup4/2gZsXJjhk05kcOH
         gl/w==
X-Forwarded-Encrypted: i=1; AL+hErEW7Pi5c4e8HkTayPhaKZIs7hC9fk6Xb5bjRaSax5bd/qIWXRltFXFQDQvXj+Sz1p/kq2zRTfFsX2/LoQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/L/g9ApnbFG4ZS24vuD47fy+gxsaga4JlCqnCaFUEVL8fxsqpV
	6Oxj5dTH3nXvQtPS/wcxk03KypevKaXPluXobW0MrgNu3dW8WdVom09xK2+Zv/c16EA=
X-Gm-Gg: AYBFou230BIZu3UHS/tullDJLEQNpDgGnMhVOxICcDQYe3F8lFHWOCZbgHfSfud9R4G
	6ITSTIs4r9U+25yDbDT45LztocgaIHR+55Nr0uWR/MY3p/100yzuGXoWSDg+N0BrYiHSdQl45It
	94730bOsyedz46Uz6TAOG2xoWhVylPOLjBGt4/frlTgkl1EQUr24+CcTkP1z+TZ22RMmoiBMiEZ
	2wCQsVieIdA+ybzs42riQ+aNb0tN2p6/i1shCSoqt31S7H7HDRThAxpOnQ6RUFpGIhkTGpi10gU
	2XrhY+aNlxq9aBxXGNtdDMh06A91tbe3E2buqRiaZXHtqOdi0ZbObMuGv2SkWd4H+I7EJ8lh8Ft
	Ufbd6mANQt18bFs2QlVIZDgAKvGnrUQgC/MkV73+WwOzAuqTDVW6/RthNqDYErricEuj0srI8I/
	BShN/zqkd/iEIU7oL7+rlnYU8k3MGRbBrhqB6bp9j/bIGimfpiwN1hSt90qZgMYE8urVp7zEhoY
	8Z2iofta8KuRInB/RpUnCTmqjgd/kvKxBlvsW7fV/M30+vNojpNKweDwWFcAFrNRMPL7090rqqV
	JITvxQJaBJ4b7VL97SZ0ZGYwuHO/QkLOWEm6zFAPuviA1uUsMZzVDBQeF2n5K0iNttV/OPk4Qan
	kaYlWwYczWntx+ts=
X-Received: by 2002:a05:6214:e8a:b0:91e:7bb7:fd65 with SMTP id 6a1803df08f44-91f24292699mr81332616d6.56.1794640225203;
        Fri, 13 Nov 2026 23:10:25 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:24 -0800 (PST)
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
Subject: [PATCH 10/22] mm/khugepaged: restrict collapse to common memory
Date: Sat, 14 Nov 2026 02:09:47 -0500
Message-ID: <20261114070959.3490008-11-gourry@gourry.net>
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

Collapse is an opportunistic MM service and should operate only on
common memory. The anonymous scan and isolation paths already filter
zone device for the same reason.

Replace the zone_device check with page_is_common_memory().

collapse_scan_file() gains a folio_is_common_memory() check. Page-cache
folios are never ZONE_DEVICE, so there it only filters memory outside
N_MEMORY_COMMON.

All memory is common at this point, so behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 mm/khugepaged.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 4bbe319ef86fa..b4bd29f25c145 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -628,7 +628,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			goto out;
 		}
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(!page_is_common_memory(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out;
 		}
@@ -1673,7 +1673,7 @@ static enum scan_result collapse_scan_anon(struct vm_area_struct *vma,
 		}
 
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(!page_is_common_memory(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out_unmap;
 		}
@@ -2741,6 +2741,12 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
 			break;
 		}
 
+		if (unlikely(!folio_is_common_memory(folio))) {
+			result = SCAN_PAGE_NULL;
+			failed_pfn = folio_pfn(folio);
+			folio_put(folio);
+			break;
+		}
 		node = folio_nid(folio);
 		if (collapse_scan_abort(node, cc)) {
 			result = SCAN_SCAN_ABORT;
-- 
2.53.1-Meta

