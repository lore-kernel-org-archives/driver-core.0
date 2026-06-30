Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C98831E858
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 21:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854335; cv=none; b=S4lzkq6BwC75CMocesN94WumU5xNIPkW8cTu78MkWqXZX1O2KMLH7qSfdhZA5BLaUgiJGIBI1Jv0IoduxLKck7UosxOSIhGVe6ldEVx0U9qYNZJUp85E1nSNnj3GBbSGE7VY7UIqFHGK2+vBtL/ZgW7flc3u7cnQO2vQh13YE4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854335; c=relaxed/simple;
	bh=8FG7ZFmw3F40yTw3byN4Wrjifv1WRBP6iWaBrd7AOJA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MbOs65622ouWVd5umbYNnmntE7odL3zWzyDsOt8mKlL+fjW7jyDiZW//BtktbG0v5++/Dc8uFUoi98GhJanEoSBnV1Mu7+ZPocMu4hRMorfjzwpDZQ6GR20Y8xZUdsbblaCN8jQh8U/Jwkl29ry8QI9kS9wTcA4WjYubYIciS0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=YRu5dW5s; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="YRu5dW5s"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-92e5c92c389so167798885a.3
        for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 14:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782854332; x=1783459132; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lel2Y3CZmRG0qaIuB9j1lDgS4wpuSucao3lSJ/Gln9c=;
        b=YRu5dW5sX5zC6vsQ3vSreLOK6C7wFhNt+d2kCX0R2r2gwFMAaV3NNjXssazcwoWyPH
         cWHIiYaZFLfcskXNKPvmFbKUWi6eEdmucyzr2fdYEOlKpQTyJQqSACYdHFjSdVuA7ecu
         oJ4aJsvkXhxzYTvDChyMg140htVCblD0nKNtZ+Of74a6tSwJgFz5usE918yGbshKch+d
         H80OYsvbqLkmOR/0TT4U7cF+qM+a0pHsODxeWnSsepH5rr2gIBV6UvdeB9ukpDOYLVW6
         AIXwnOLBUZUPVDUEJd+avxSq3LYm1eYKywM3r4xEQUMy3y78oDuYahdDM2PKQ1wV8D1G
         f0uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854332; x=1783459132;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lel2Y3CZmRG0qaIuB9j1lDgS4wpuSucao3lSJ/Gln9c=;
        b=XwWmgXWl5G8CpCrjQ3NLLYHyRU4Gkgyhk6pvpEAvuVgq5nhe+APtvzhYlHR+oyYsi8
         Kl6zN2JBisLeeJE1OUmyd2WTNCsXFJ6bCl2hl91C5Zn7qNy/eZwF+Hc/E4fBK3d66b6b
         DJpjAM7GXy93gBCHnkgI83ozBPkY6zkr2sQkLF+RzFGTIAzbcP4k4UX22cWIihrHQ6Jq
         ++drQ5axR8IeCPHla3nKwZOcZIulx99XYBVOyqYD34YJO6OeQW1p9PVhQSU851cmUoyf
         X5VDNoAjy9WKQkkfpzQIuy1G2U9tJlrdtba6IU24drehj03f0+RGD6WtBP/zMTL6bFl2
         WrDQ==
X-Forwarded-Encrypted: i=1; AFNElJ96fIY/okY7qqzJXKkQN3vLqsDiiJ/AnfISU0pxd30EIFvYwJ4oNOTzn+wdIvsda7V/9ge/ZYZNQr7zYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw8p6gXNo214UTxAK4drp32EdPU3dCA1BeK8/MC3t68ux86SYNd
	wrf7zktsYdiPyWZ6wvb42eERqfFQ4UiZoWKNfxd+paIUsx82f017F8doKpiQasSGjsg=
X-Gm-Gg: AfdE7ck5kCxncwCGipOoSnjuqrdhmOLE6pRqdtjOmnG2yQHWKumKZ/xFAc0c8rCHZO0
	PREZ68DsbTSEbvX1mnsFVdCMGF+Vt9Z+cuMXuTOjMSjbx4sqgP2cn+6+jIOPcUwc6XkgFiKDAr4
	90Ut9KEpS5yvoCH2jygxYpEds+rJvJUo20et/IDcXWR0stwMO+1PPHqXHKnVEtKpLawRrg1JWtL
	PKn4WhyXmCoWIby8KByew2s/SXKN7KDqObFdn5Xtvm4aPeD/MW1PbRLMM3qxUavzU3d0GwApW65
	aXRjuDkYrD/Taw2zxaEDEKUIcSVDGv5qnbwgC/vFELBBWsGmBFQ2l0A58opDr732Pll7WT7vdC8
	rlcFaSW5XhSDBEXNt23dG+cqD2vsXYNX95jDe/3pJmzLs5joqH8QhdCamtpvx+UClYql6H83eti
	oQEEN6xqInH9c27zahk2CD/XywtV0qq8A9E+wM3IvcsVlC0K+lksUzGy3AjGa8DFJB7vqJIfMl0
	g==
X-Received: by 2002:a05:620a:a190:20b0:92e:6e55:cc66 with SMTP id af79cd13be357-92e6e55e500mr269113785a.47.1782854331991;
        Tue, 30 Jun 2026 14:18:51 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62366303sm335924285a.40.2026.06.30.14.18.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:18:51 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com,
	apopple@nvidia.com
Subject: [PATCH v6 02/10] mm/memory_hotplug: add mhp_online_type_to_str() and export string helpers
Date: Tue, 30 Jun 2026 17:18:34 -0400
Message-ID: <20260630211842.2252800-3-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630211842.2252800-1-gourry@gourry.net>
References: <20260630211842.2252800-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add mhp_online_type_to_str() as the inverse of mhp_online_type_from_str(),
and export both so a driver can render and parse the memory online type
through its own sysfs interface.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/base/memory.c          | 9 +++++++++
 include/linux/memory_hotplug.h | 1 +
 2 files changed, 10 insertions(+)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index b318344426fa..3a2f69d3af7b 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -46,6 +46,15 @@ int mhp_online_type_from_str(const char *str)
 	}
 	return -EINVAL;
 }
+EXPORT_SYMBOL_GPL(mhp_online_type_from_str);
+
+const char *mhp_online_type_to_str(int online_type)
+{
+	if (online_type < 0 || online_type >= (int)ARRAY_SIZE(online_type_to_str))
+		return NULL;
+	return online_type_to_str[online_type];
+}
+EXPORT_SYMBOL_GPL(mhp_online_type_to_str);
 
 #define to_memory_block(dev) container_of(dev, struct memory_block, dev)
 
diff --git a/include/linux/memory_hotplug.h b/include/linux/memory_hotplug.h
index 7c9d66729c60..5d4b628c4a1f 100644
--- a/include/linux/memory_hotplug.h
+++ b/include/linux/memory_hotplug.h
@@ -127,6 +127,7 @@ extern int arch_add_memory(int nid, u64 start, u64 size,
 extern u64 max_mem_size;
 
 extern int mhp_online_type_from_str(const char *str);
+const char *mhp_online_type_to_str(int online_type);
 
 /* If movable_node boot option specified */
 extern bool movable_node_enabled;
-- 
2.53.0-Meta

