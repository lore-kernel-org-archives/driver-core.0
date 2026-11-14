Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794640241;
	b=X9pKHddondpTpp8m43LIgdZ0SpQl5jZtOt7cOunGfYtflKVM8eU8ienWnlyWO7xoSnYu
	 p8cQptIihQYffTO0iCWTwLWgV0AXKOi0xdGQKsW79fl0h/qM2YZ99vsld6nZufVZcmDk6
	 PVJ4GX3MPYFHqk/RWAb3sZpkVFCto2nptr69NVA5ga00bv2u8VRBwQ741/LPQ2gwiNko9
	 WJ1AN5J9mkKQCnoPZ+sdmlgFU2tgcCnwz8ia+PMZj7euuQsbTKw6bzF7KUhvmXXJJUlxV
	 8T1Ntq7mI8yFMkdVb1vql8SouhYqvME1Qp4/wqZAoc0PKWdOssc/4scu3GHbZlEBmzg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794640241;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=TW0pg36vCDijleVRTyqZR6UjU0iehYYk3FdVNC+q6Cw=;
	b=XHa8rfot7CxKW8TN7D68qL3792GkrZXTxD5I1WT3bBOrthKuA0N1VG8ny8+JBuKUjrDs
	 tLpoc/cgidFXXV6WxUXEiwct5SMO7O/YhppKLJNYplV2DVczWA7nv2QautiwkMctMiRUy
	 M/g5Y+j0Pz5DZ8f+FEZmNsAyQwhWaP9fH6majGnHjaM/Ubn5b+tWjo13PKQ7sWV5lH4Ij
	 yXsi7XzYYsFaVXzuRTHU5xC7UjMtkEjl7jFmSMYZVDXR/PiW5wChSeKFNfNs3JIexUX1h
	 U3dTflz14kHHFkrAi4vQ1yI8cZW6uG9IbIFQFbqH5dMN0O67p4pjbSMdX8eWCQWvkEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TE3JlMbU;
	arc=none smtp.remote-ip=209.85.219.46
Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC8CD60A2616
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 07:10:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC8CD60A2616
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TE3JlMbU
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-91ec2d42231so30643086d6.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 23:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1794640239; x=1795245039; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TW0pg36vCDijleVRTyqZR6UjU0iehYYk3FdVNC+q6Cw=;
        b=TE3JlMbUJAYnSFB6WBXsLcgEn+bQBWcYy8Gp4d8vKosGJUP+bCoeZ/l/dGVjt6wgSd
         kX533FJOKHS5OsLyx5seillcVIu//3TunFSvKkeK4lUyDmWzMAmdJdSKnmFTu3RdkQAP
         KFNEotulcnFRJe42Wcbmy6QKQC0Y7bKVC85IMnCpaPX63BL6U11GyD9wEMJQ8c3ZktFt
         dI3yckXKQSxuMbWFmHJPAZj53+iBhddCkCwc/46yJ6+Cjhba8uziM91jLmgBgxCQ1dH+
         /QC0okzFqSvJk+QXU5a/mt8+f7p0y8m2UHqy6EnZGi7mCjypPshjRZp3jALU0rQaz+/8
         uEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794640239; x=1795245039;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TW0pg36vCDijleVRTyqZR6UjU0iehYYk3FdVNC+q6Cw=;
        b=SRgGf+fR+qUnlPZS99R3MFm91RvMU46wzVOYqrHZzloGO0shje414bs865YHU3q11s
         LrDS8FUIcya8V4XkJK/oN/Dtaorfi58nQ3ZhfhJSci2K+jM+mezSggSogAT6z/9ZCmNX
         rMRn4vwwgsc1Ynz0+b1V1egO4coLuKDHkMntq0VtjyvfnOLesi9ftKJz802eZG+bP04Q
         lf1yTCoUB76DyCRtkPI9DHSY+16LEa0wHAbLPzTfs9LJkeQyj69+UFSborzQ0x8vcpwk
         7fTykykx0LTv66WSfvk8wlqmca5T2K9ZtbOVXj+iSuJ35RRKZNtgdzspdHi7O8GSGAo4
         WvoA==
X-Forwarded-Encrypted: i=1; AL+hErFIazmdy3e6UHIGKd/byHtyOVJ/SPYEmBVlDIA9evpckC7kokuK/cU2uHE5+tgHNxUfGuMinapUArfxLg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+XWuIfYdFp6IG7pOORcUvfk3XWnRL+5y0SmJPl/7ny5oQDC1LQ
	taP+dLHAaRWJMDWpHb1sJkJaVU3FquNOQKMzPE4k4Xnew1lArV5Uhg5cjhg1DDpNGGA=
X-Gm-Gg: AYBFou0F2BTGk1IxHljljnH/DYuSzYa6Lw8K2H33v6yjPvOQGjiRq3912JORUo/pPsf
	1ZEnf+mhgIujNSOSoPY9cT7CVJxW+G2wC+bhSnQHr+woJ4Y6ja8yWYXVP/VBpmBfpgIFQkThhn0
	4fl/+rDo6NDAYO/VGeRDFviw0zy2ufPxXzV2NIWq2aHi5Lr67UckMKBBN0rSdaazlSZhY+jOJtQ
	rYF0VcUM79sORNRAcLvKCHcF470zMDOzCE3avusSGQBo7MflSFF6zPqMYD/6ghKbbJJHwdiXOEH
	fZE6fL9lEAQ6C7OmO+9y7c9YcrRgy3Bex4NSCTofZbxeblVkMVMzEFjUnesKp1ATM7iy3sZbLjz
	ox40v20u5q8fzs5P4o/Euk6QDKQcQbYKYtxCoUpg1Mie+Up2b8G/yaaf7Qzt+leCFWDGlzQ9rtK
	v9k+b6fFUMamRLTEytoTEeAXWHbNFYlxhCmW6v27CA3bPrlZqa+wpKNHNfIMIYgEE1+VJm32ePq
	MewZdCXVOWNNGV0uGRkyKi2oAVaMrw9GzszfWwQ0WqRk/YiKxCSxr8izeCskb/vRairCP9mw4As
	9vxNQA+nNpPavyAslNZz0bD65LjyRNNOSxSC+Fvbrdt3pWrOQra54AYvjZqNHM/velCOdg8H/7l
	UNw+/zly3fKdlXagvM+RI8/lHHupGAKKoS/SQ
X-Received: by 2002:a05:6214:1311:b0:91f:2208:b683 with SMTP id 6a1803df08f44-91f2428c6aemr76715686d6.55.1794640238785;
        Fri, 13 Nov 2026 23:10:38 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23db3a99sm37730986d6.40.2026.11.13.23.10.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 23:10:38 -0800 (PST)
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
Subject: [PATCH 16/22] tty/sysrq: use common memory for the manual OOM zonelist
Date: Sat, 14 Nov 2026 02:09:53 -0500
Message-ID: <20261114070959.3490008-17-gourry@gourry.net>
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

SysRq-f constructs an OOM request with GFP_KERNEL and supplies a
zonelist for allocation-constraint checks. The request represents an
ordinary allocation, whose fallback domain contains common memory rather
than every node that happens to have memory.

Select the zonelist from the first common-memory node instead of the
first memory node. All memory nodes are common at this point, so
behavior is unchanged.

Signed-off-by: Gregory Price (Meta) <gourry@gourry.net>
---
 drivers/tty/sysrq.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/tty/sysrq.c b/drivers/tty/sysrq.c
index f4571d05b4962..824f5836b47d7 100644
--- a/drivers/tty/sysrq.c
+++ b/drivers/tty/sysrq.c
@@ -386,7 +386,8 @@ static void moom_callback(struct work_struct *ignored)
 {
 	const gfp_t gfp_mask = GFP_KERNEL;
 	struct oom_control oc = {
-		.zonelist = node_zonelist(first_memory_node, gfp_mask),
+		.zonelist = node_zonelist(first_node_state(N_MEMORY_COMMON),
+					  gfp_mask),
 		.nodemask = NULL,
 		.memcg = NULL,
 		.gfp_mask = gfp_mask,
-- 
2.53.1-Meta

