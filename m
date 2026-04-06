Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7355D3A3835
	for <driver-core@lists.linux.dev>; Mon,  6 Apr 2026 23:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775517935; cv=none; b=c/gwCf4549Ap0OhLh7XvD0Ep/OAfTInKnaC5z1euJluIVw2VGcEQDJMepmaiRpaw7bsPa3i4kIV38EOJx9Vir5/djnXZYIl2cUv1PcVp/DKZ5roP2TKz++Y+ihxbbvjA7m7ltT1j/6Kky2Rx9xHq4rWcDWr71tFbR+8VOrnXb7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775517935; c=relaxed/simple;
	bh=PJB68tvUBxAGfM8D7po7gDr2ii1Rk0JRq8vNSQIvxbY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dJMsMnZSa5+CMjCsSHuMULNIQCgTmSpvMhroGg2kLX80Jaaq9Hb1i7JQhTC3yAjvGQCjExVBQKo/rqIEgY2nFMfDPQrYbuRESsxVQbsSH0O1IiYMCN+1eN8tOcMka/Z4nCqQz+AOyRboPRxrUTd/lUQiKux+2af1fEXvdeyVUlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=V0CDMEQQ; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="V0CDMEQQ"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12732165d1eso6093711c88.1
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 16:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775517934; x=1776122734; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QDRSd3siXPnUjKK6z9y9zPLL94slqZupXaMexT4yHSg=;
        b=V0CDMEQQWTGtsOlJ1U80LUJ+C4LnZXdVtNxuSGzoud/+7x7rsNE5OA5R4BEN9kpQi6
         KWOWWRwTYZSHH548Bky0G8y6ECj90kxIsGPQLEPKaECrB4Pd/sGuLdx7EK+3lMlQdFSP
         GzKZP/xbEECbeJejQvljg884IhBhHit0Vm8fU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775517934; x=1776122734;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QDRSd3siXPnUjKK6z9y9zPLL94slqZupXaMexT4yHSg=;
        b=To5lZ71tQMrViR11T2hm96Kwi11EAUpF6RzFzycGxbWaPfUdbeTDgiesrJi+kRDIc9
         o+ATgdLSepyvoZnbP/Uh9OOUb3c73YnFivNLq1KMJqxp3xN5GcLx9QicVSEEfIsDU16b
         kkbN2gxzSv8jvNsvBqRLgCHZt3z+auYnQNlMgKsGx6fOGFKmOsawmoOyIf1/cvw4oJKC
         VF3DnN7XHKiYaQF2bClL/92H5jdofkCZSZTCrU/HUDCtDgSSlFzUyyuSZp4aaRMWlKr/
         BBM2Yv0afubPYw5qc4BLfpF8NxQds02Hb+nYbI5gRv53iy3YUk9pJTA1SHHEz41HwKZR
         cRQw==
X-Forwarded-Encrypted: i=1; AJvYcCVYoHBi7MDSa3Rcp1HlvQCBzwVCJvQtbe5pCymL5a4Nz5SvuFU9r6YWSurjV0YwOaYcErGa56e4WZuAJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx5cSp8rf5KdXnVNrmfyqhqmpa+v7Zya++VcH8s629O2x24q1m9
	Aj0JcyJy0JBMI3UH9vGqGXFOYyIgclfH5I6WPVgzdiVNkjyw2k5M+WdI9lD6EdnUzg==
X-Gm-Gg: AeBDievurXeWJuCZ5MPgCn1Ih9VEUYZNszk8iOKjdllWKhRXn04r5vA5UWrHXXxBCFt
	a3PE0gKOQ5dGryhNk5BkAkymERvmXBYk8Rw0J41nJ7dGb2lC0sh8W2z3vYtyDFYP9XWVuoMMo+U
	QTj7zzgupiZamndoGFRjnjQ42Y5upAyFED84P7PtVbCxnQjccJtTZdgNqYfge8kgGyQpsO8Mxxd
	o2sdxrhhPqBIIq1DDWEYhbHHAmd0WkOK+mlm1Zu9R0cwZso+gQ4jpcdflGQoH/j0nISKRKspJhY
	ERY1cA9j4VZyPMTcYYaLNrgA6g3e4azPtaGy3r4isFocXwy9r0r4Cuo5YWfbI9jaUHgxVOvx7ox
	d8HXfkBZqwG9Yaq2P30tpzFve3iVFKgutxXlJF4jXXi5N+V6XbT7gMWXLC20j17e+bD9QNCg2TS
	oJOYAuKSjleu9vncc+2h2r/OrQgRXfrLp+et/Mnw+sHZDTVHf227MEHvvFt8/AJI9tlhovx7Z4T
	N8AL6zJSQ==
X-Received: by 2002:a05:693c:2c93:b0:2ca:9b08:e7d2 with SMTP id 5a478bee46e88-2cbfb4a8218mr6499235eec.22.1775517933588;
        Mon, 06 Apr 2026 16:25:33 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:c071:3b78:5a5:824a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca760b0518sm14730975eec.0.2026.04.06.16.25.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:25:32 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
	Johan Hovold <johan@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Leon Romanovsky <leon@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Robin Murphy <robin.murphy@arm.com>,
	maz@kernel.org,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	driver-core@lists.linux.dev,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	m.szyprowski@samsung.com
Subject: [PATCH v5 4/9] driver core: Replace dev->dma_skip_sync with dev_dma_skip_sync()
Date: Mon,  6 Apr 2026 16:22:57 -0700
Message-ID: <20260406162231.v5.4.Icf072aa4184dd86a88fa8ca195b09d1651984000@changeid>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260406232444.3117516-1-dianders@chromium.org>
References: <20260406232444.3117516-1-dianders@chromium.org>
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
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

NOTE: even though previously we only took up a bit if
CONFIG_DMA_NEED_SYNC, in this change I reserve the bit
unconditionally. While we could get the "dynamic" behavior by changing
the flags definition to be an unnumbered "enum", Greg has requested
that the numbers be stable.

(no changes since v4)

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
index 620306e8380a..c38593cf2583 100644
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
 
 #undef __create_dev_flag_accessors
 
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

