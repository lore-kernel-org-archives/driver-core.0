Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FF12495E5
	for <driver-core@lists.linux.dev>; Sat,  4 Apr 2026 00:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261257; cv=none; b=U7CG5PkiSM42q31zWFNyYksVRYabA/u55vp1MrSQAxqqJIl0qeHchJZA/aTaVYfG/lrjIs1c3KC35t+gjkNlqXTWvsdsyUea6+yq5/EW1mXwwA7Xz+6RaBxU7aHHOR4P15O9Xgq6xLtPC7VqykMBipRIwqPg3q9Jv0Z/hE1N2oo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261257; c=relaxed/simple;
	bh=KoRQwAoZXwBl8kOQW1MVyWt14NupWAYTSsNS21YFjro=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=L+F2yeL5P4xq1W7rD3PeFDYIkYtSi8tGulgC79Qx0P5COhdpei45GTmXWJdsLYmuN920+FI9SnOnOKeizwbfEfrCQ3OfC6vki1ShNAlh42QEsrQot37hsyKLxwu/QWVxQgYkU6Am0qiixa6l8y3LJ0UBej9GfNAZjMhCXnZyNC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jlxxBSQ3; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jlxxBSQ3"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-128e4d0cc48so2549627c88.1
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 17:07:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775261250; x=1775866050; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iaEmExAw4Fi7AHFQ4lJ7E/IDLxtvfEnb2vcxgfiheP4=;
        b=jlxxBSQ3Rx/d3yt+AKyO6bJCBwAgNnzLWrJUfdNKittqj4ok2Ht2JJpZtlCM3lCTMC
         xTQ86Vt2ORqw9+1tOWh0J7/LHrVLmt7SJGvk/K+JGfZL/dGixA0719ODCxFMpUavkeWy
         RfhrlCkWGCOcqlSa7T2oFEcWx7OVMQZwuAQxA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775261250; x=1775866050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iaEmExAw4Fi7AHFQ4lJ7E/IDLxtvfEnb2vcxgfiheP4=;
        b=XN3bJdN/dKxLMUfy1xxqHWtx0x/UmrLPWwi2IyXHqzciUZtFRYT4m0MsTdEKwaTydN
         FwH3O5VUH+68n8RAU0PqtZtCLz2uAyxOSOFGUQCrPkl///zxw2OJlkt/LzzPJ7X7I2Pg
         Hx67pFVZphrxxkVx8KZiPDz6O3h5P51el9Mj+sQcnT5JFYWjH4M/u+KACTxyeKy1H4o/
         YpyPH8YSom74ptnijH6VGrX8DvluvXq24bd/kcwQ92yLjSlzheEG4plGWlWH7LIVh5ky
         /t6oiBLzP614mkANvpJKVlb6YImok0esxShDv7WDYtfM6xh0/OVeGz1QEJH6ZdZBcJfQ
         VN5A==
X-Forwarded-Encrypted: i=1; AJvYcCX35wsAsy7WNZMLSg2UkVjE5MPMdEVK8D4Nv0lx6KoY3SIBLIQQDxN7tMEZLK+UOpDrcb9131gy9J8SGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwteG7mfq7vk8HBbc91t9LSfB8pVa1wKbktvj2uIva400E1agBQ
	ExtrJFk7l3bAjHW5hLV5zNCdzYMm7IFQa9BdVDUPQD1t+3HG0WIKe0ZDVbQYpBitAQ==
X-Gm-Gg: AeBDieuMaoAON46/nXQLOAzrb4BZqCzfDrBcj5ytSGb9dEAOjtKQhoPMg9l1iv5yAdc
	Apgk7bOaN2fbe9o0Ynn74WyfDAoUQJkFTbp1uCsBTRmZ9a5rimts22flVnBiYL50IG8FSfYJarQ
	sTFeJ0T0WMklcWU0PGCXZowRTICPyMOTwfEeV6JAG90IJWe/Tp/LZIAF6xXNGjUtMw+ibzYhDYx
	PTAWgAzE5LOR+6+1eTz8V4XeyJz/yU3Ac8FQvnRFYYfchdqM66Fp9NxKSqiLi/vk5RxC6Rwvgz9
	zf4oCpZFCG855qQ22Xu7jm80x48yGTmtL/25m4BxbLoG/cSYPd7V7j81IiG56lWc87D2KA6dm0c
	Md/G22781KVFDgem7qQZIlqEYmpSgpTym0Lfm3jdVjwSOvF+WQiTJwCWKYOhVve/sMzpNVXh52q
	y0nGolbq5QOg/39G1BZbAwMKV6K+dFB1tDjQPDjyoGfS8322pyqmOqAnrPcg85gaDWV/Xqwp3b8
	IDgmcQvxUA=
X-Received: by 2002:a05:7022:4a4:b0:128:d5bd:3572 with SMTP id a92af1059eb24-12bfb765439mr2140467c88.31.1775261250429;
        Fri, 03 Apr 2026 17:07:30 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:a8b6:55b2:3eb6:2c0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca79e1d93bsm6520716eec.12.2026.04.03.17.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 17:07:28 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Saravana Kannan <saravanak@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Eric Dumazet <edumazet@google.com>,
	Johan Hovold <johan@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Robin Murphy <robin.murphy@arm.com>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	driver-core@lists.linux.dev,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	m.szyprowski@samsung.com
Subject: [PATCH v4 4/9] driver core: Replace dev->dma_skip_sync with dev_dma_skip_sync()
Date: Fri,  3 Apr 2026 17:04:58 -0700
Message-ID: <20260403170432.v4.4.Icf072aa4184dd86a88fa8ca195b09d1651984000@changeid>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260404000644.522677-1-dianders@chromium.org>
References: <20260404000644.522677-1-dianders@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In C, bitfields are not necessarily safe to modify from multiple
threads without locking. Switch "dma_skip_sync" over to the "flags"
field so modifications are safe.

Cc: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: Eric Dumazet <edumazet@google.com>
Cc: Christoph Hellwig <hch@lst.de>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

NOTE: even though previously we only took up a bit if
CONFIG_DMA_NEED_SYNC, in this change I reserve the bit
unconditionally. While we could get the "dynamic" behavior by changing
the flags definition to be an "enum", it doesn't seem worth it at this
point.

Changes in v4:
- Use accessor functions for flags

Changes in v3:
- New

 include/linux/device.h      | 8 ++++----
 include/linux/dma-map-ops.h | 4 ++--
 include/linux/dma-mapping.h | 2 +-
 kernel/dma/mapping.c        | 8 ++++----
 mm/hmm.c                    | 2 +-
 5 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index feb11ba1ba71..fde0c72c3159 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -471,11 +471,14 @@ struct device_physical_location {
  *		until other devices probe successfully.
  * @DEV_FLAG_DMA_IOMMU: Device is using default IOMMU implementation for DMA and
  *		doesn't rely on dma_ops structure.
+ * @DEV_FLAG_DMA_SKIP_SYNC: DMA sync operations can be skipped for coherent
+ *		buffers.
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE = 0,
 	DEV_FLAG_CAN_MATCH = 1,
 	DEV_FLAG_DMA_IOMMU = 2,
+	DEV_FLAG_DMA_SKIP_SYNC = 3,
 
 	DEV_FLAG_COUNT
 };
@@ -569,7 +572,6 @@ enum struct_device_flags {
  *		and optionall (if the coherent mask is large enough) also
  *		for dma allocations.  This flag is managed by the dma ops
  *		instance from ->dma_supported.
- * @dma_skip_sync: DMA sync operations can be skipped for coherent buffers.
  * @flags:	DEV_FLAG_XXX flags. Use atomic bitfield operations to modify.
  *
  * At the lowest level, every device in a Linux system is represented by an
@@ -686,9 +688,6 @@ struct device {
 #ifdef CONFIG_DMA_OPS_BYPASS
 	bool			dma_ops_bypass : 1;
 #endif
-#ifdef CONFIG_DMA_NEED_SYNC
-	bool			dma_skip_sync:1;
-#endif
 
 	DECLARE_BITMAP(flags, DEV_FLAG_COUNT);
 };
@@ -718,6 +717,7 @@ static inline bool dev_test_and_set_##accessor_name(struct device *dev) \
 __create_dev_flag_accessors(ready_to_probe, DEV_FLAG_READY_TO_PROBE);
 __create_dev_flag_accessors(can_match, DEV_FLAG_CAN_MATCH);
 __create_dev_flag_accessors(dma_iommu, DEV_FLAG_DMA_IOMMU);
+__create_dev_flag_accessors(dma_skip_sync, DEV_FLAG_DMA_SKIP_SYNC);
 
 /**
  * struct device_link - Device link representation.
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 60b63756df82..edd7de60a957 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -245,8 +245,8 @@ static inline void dma_reset_need_sync(struct device *dev)
 {
 #ifdef CONFIG_DMA_NEED_SYNC
 	/* Reset it only once so that the function can be called on hotpath */
-	if (unlikely(dev->dma_skip_sync))
-		dev->dma_skip_sync = false;
+	if (unlikely(dev_dma_skip_sync(dev)))
+		dev_clear_dma_skip_sync(dev);
 #endif
 }
 
diff --git a/include/linux/dma-mapping.h b/include/linux/dma-mapping.h
index 99ef042ecdb4..ef4feb2b37d8 100644
--- a/include/linux/dma-mapping.h
+++ b/include/linux/dma-mapping.h
@@ -419,7 +419,7 @@ bool __dma_need_sync(struct device *dev, dma_addr_t dma_addr);
 static inline bool dma_dev_need_sync(const struct device *dev)
 {
 	/* Always call DMA sync operations when debugging is enabled */
-	return !dev->dma_skip_sync || IS_ENABLED(CONFIG_DMA_API_DEBUG);
+	return !dev_dma_skip_sync(dev) || IS_ENABLED(CONFIG_DMA_API_DEBUG);
 }
 
 static inline void dma_sync_single_for_cpu(struct device *dev, dma_addr_t addr,
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 6d3dd0bd3a88..76fc65d1a8a4 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -467,7 +467,7 @@ bool dma_need_unmap(struct device *dev)
 {
 	if (!dma_map_direct(dev, get_dma_ops(dev)))
 		return true;
-	if (!dev->dma_skip_sync)
+	if (!dev_dma_skip_sync(dev))
 		return true;
 	return IS_ENABLED(CONFIG_DMA_API_DEBUG);
 }
@@ -483,16 +483,16 @@ static void dma_setup_need_sync(struct device *dev)
 		 * mapping, if any. During the device initialization, it's
 		 * enough to check only for the DMA coherence.
 		 */
-		dev->dma_skip_sync = dev_is_dma_coherent(dev);
+		dev_assign_dma_skip_sync(dev, dev_is_dma_coherent(dev));
 	else if (!ops->sync_single_for_device && !ops->sync_single_for_cpu &&
 		 !ops->sync_sg_for_device && !ops->sync_sg_for_cpu)
 		/*
 		 * Synchronization is not possible when none of DMA sync ops
 		 * is set.
 		 */
-		dev->dma_skip_sync = true;
+		dev_set_dma_skip_sync(dev);
 	else
-		dev->dma_skip_sync = false;
+		dev_clear_dma_skip_sync(dev);
 }
 #else /* !CONFIG_DMA_NEED_SYNC */
 static inline void dma_setup_need_sync(struct device *dev) { }
diff --git a/mm/hmm.c b/mm/hmm.c
index 5955f2f0c83d..c72c9ddfdb2f 100644
--- a/mm/hmm.c
+++ b/mm/hmm.c
@@ -709,7 +709,7 @@ int hmm_dma_map_alloc(struct device *dev, struct hmm_dma_map *map,
 	 * best approximation to ensure no swiotlb buffering happens.
 	 */
 #ifdef CONFIG_DMA_NEED_SYNC
-	dma_need_sync = !dev->dma_skip_sync;
+	dma_need_sync = !dev_dma_skip_sync(dev);
 #endif /* CONFIG_DMA_NEED_SYNC */
 	if (dma_need_sync || dma_addressing_limited(dev))
 		return -EOPNOTSUPP;
-- 
2.53.0.1213.gd9a14994de-goog

