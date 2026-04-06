Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F83B3A2548
	for <driver-core@lists.linux.dev>; Mon,  6 Apr 2026 23:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775517938; cv=none; b=ZeIPiJ9QaYuaYPqnb/sGMjors2MTv9f/VXKQx+PaSAmeXn8hloi4AQnTBbiAO+FSAIft9FuTaQGST5WpPjOdmDnBnUn6sCmoefvxIgklFuJIjUhnzkBnOBgp8kXl9S63ymDsIW7lmVZtxiYIEVFIzCa82xAobXat89tzJDrU3jA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775517938; c=relaxed/simple;
	bh=5LVNiArQZYUSI+ZEaYqr74aA326eok+3E4kn/jEWtrU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PrkFBZn9/fqT0jpETJLfaaKq0VByQLbN0k5d53fxQTMaKlLPYpo+BWc5j5rzPBuiXjw2jT1def6M/aBOwUcSPnNveg3ShnGhqYpYJ6Edd8LgMHJMKCuWODKUJJunLdDl2Y1RoGEfP7pJ5+Zl7KLJo29/C8sNgYDUVO+5ddiZGAk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=XaPf7aLx; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="XaPf7aLx"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2cc4c693d59so7789087eec.1
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 16:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775517936; x=1776122736; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QLh8ZGhB5dU98LppXST8xiQJL4Zgmni3hu9P++EXxzM=;
        b=XaPf7aLx/Rte9ze5GXrGe9yw0xEgYuRXQE2P8gNxZnWGNUTeuXZooco3I2e99Wn1J4
         WHSRSdGDUNQEFFbPv9rfz53xMfShGHOKHOlX4Qg2ZWqE60hce9pDppp/5Ked3XDZ1Ct5
         vRZu5zJcIfUaPKMSdD6WhdXxxN0rqib2My3gc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775517936; x=1776122736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QLh8ZGhB5dU98LppXST8xiQJL4Zgmni3hu9P++EXxzM=;
        b=bzOWh2gNJ/jh+LX2phi2yfA+Q1+dQ7YgOGcCMdkX2+5V3HPH4Af4rawjl2ScOImWY2
         /BRBYZa2wRSUd9zln6lwg8ABoAkfv0WrHR/r3IPoeUQ+OZEfbGn1oeDaVqR8l3IOHg9x
         17DSgmP22Zwc9yIKGdZLlcJjh4ZBfi2qhLKVUtY3aGsSQlOChTcJMHGXOIDgiCwOi8sy
         RCvktWO9QFkDAYuhQ2zLIGcfaVsbROMgvVEFbISPmg5k09ljIynACbTXMmLj8Cr/gvH0
         S3sordgiRJ2c0u9sXG1ANIUYS0ByVVD9ggKlAVDV/yxzxxWheYUKqI25GmH45YDJM/+S
         mPVw==
X-Forwarded-Encrypted: i=1; AJvYcCVxzP7qHNYaspmSMjqo2Av/KgGCcOvSeXqVsETnoyp8zwTT0WPTrAI5A7PZ2iaaOsqnwBStPx/TnyYWSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzKlS6u0IuK7PNs+82173W3Z6FdXd9DbvuudKx2/0UnsjijL+HG
	N1xCkKsgTkjaH3g4AxB0rpQSAGxZ7DBR9H5RPNdfsIPr2oYqKsjgsvK9h8zDQf0g4A==
X-Gm-Gg: AeBDiesnMSkjaakcLdoxWL14lxJJclGoceQ6T/+lDR/gVW2nh+I+2HCblT5y14A/4eD
	Qux/4DLuG9T9PNul0HknRZuneUyzmu9dYIZRuMZNa0+baNi1KgtLyQhJKX/+Ei6wvXki8Tbzfws
	CNeNZC6L0dFKM9pNdhRl+1vO5er234ZBec+5yFL9ov5TyDh7mRLglChCkW2Hv0rAl0v3wF2lZc2
	xc1bnrvYr6ro66oFHMH7j+CB8S/0afd/5OP04H0wB5iXREVRpibSw/06pWLm8TnjsD0j9Ur0JFB
	WJsSF5T0MP/IagnZgyEevMGxoi65sFOa0MrhpAtWQQ2UXn/ysOwZCbTAd63xwOPp9sb8jWXupiq
	Vtq7JbLRFl8Xa3vFU7vZutblCPsJ/QQFJiQiteLpcTHZoqiHmMskROPKEcpn9bPXDg8cEwFzcbM
	NLH4NpYXbtBpkSrq/9CqIq+6wJT1IhBK9xoVAiLK6y2S297HaJ94kFNuD4kCg2z0+5UTgTqcT4s
	CzWL0Rtxg==
X-Received: by 2002:a05:7300:f190:b0:2c4:ec89:be0 with SMTP id 5a478bee46e88-2cbf9fe1d36mr7655035eec.9.1775517936536;
        Mon, 06 Apr 2026 16:25:36 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:c071:3b78:5a5:824a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca760b0518sm14730975eec.0.2026.04.06.16.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:25:35 -0700 (PDT)
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
	chleroy@kernel.org,
	driver-core@lists.linux.dev,
	gbatra@linux.ibm.com,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	m.szyprowski@samsung.com,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com
Subject: [PATCH v5 5/9] driver core: Replace dev->dma_ops_bypass with dev_dma_ops_bypass()
Date: Mon,  6 Apr 2026 16:22:58 -0700
Message-ID: <20260406162231.v5.5.If62b84471ef2c85e7ad250f0468867d6dba965ab@changeid>
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
threads without locking. Switch "dma_ops_bypass" over to the "flags"
field so modifications are safe.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

NOTE: even though previously we only took up a bit if
CONFIG_DMA_OPS_BYPASS, in this change I reserve the bit
unconditionally.  While we could get the "dynamic" behavior by
changing the flags definition to be an unnumbered "enum", Greg has
requested that the numbers be stable. This also allows us to move one
"#ifdef" to an "if", getting better compile-time testing of both sides
of the "if".

(no changes since v4)

Changes in v4:
- Use accessor functions for flags

Changes in v3:
- New

 arch/powerpc/kernel/dma-iommu.c |  8 ++++----
 include/linux/device.h          | 15 +++++++--------
 kernel/dma/mapping.c            |  4 +---
 3 files changed, 12 insertions(+), 15 deletions(-)

diff --git a/arch/powerpc/kernel/dma-iommu.c b/arch/powerpc/kernel/dma-iommu.c
index 73e10bd4d56d..6d1899b38c3d 100644
--- a/arch/powerpc/kernel/dma-iommu.c
+++ b/arch/powerpc/kernel/dma-iommu.c
@@ -67,7 +67,7 @@ bool arch_dma_unmap_sg_direct(struct device *dev, struct scatterlist *sg,
 }
 bool arch_dma_alloc_direct(struct device *dev)
 {
-	if (dev->dma_ops_bypass)
+	if (dev_dma_ops_bypass(dev))
 		return true;
 
 	return false;
@@ -75,7 +75,7 @@ bool arch_dma_alloc_direct(struct device *dev)
 
 bool arch_dma_free_direct(struct device *dev, dma_addr_t dma_handle)
 {
-	if (!dev->dma_ops_bypass)
+	if (!dev_dma_ops_bypass(dev))
 		return false;
 
 	return is_direct_handle(dev, dma_handle);
@@ -164,7 +164,7 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
 		 * fixed ops will be used for RAM. This is limited by
 		 * bus_dma_limit which is set when RAM is pre-mapped.
 		 */
-		dev->dma_ops_bypass = true;
+		dev_set_dma_ops_bypass(dev);
 		dev_info(dev, "iommu: 64-bit OK but direct DMA is limited by %llx\n",
 			 dev->bus_dma_limit);
 		return 1;
@@ -185,7 +185,7 @@ int dma_iommu_dma_supported(struct device *dev, u64 mask)
 	}
 
 	dev_dbg(dev, "iommu: not 64-bit, using default ops\n");
-	dev->dma_ops_bypass = false;
+	dev_clear_dma_ops_bypass(dev);
 	return 1;
 }
 
diff --git a/include/linux/device.h b/include/linux/device.h
index c38593cf2583..1c43ff695e83 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -473,12 +473,18 @@ struct device_physical_location {
  *		doesn't rely on dma_ops structure.
  * @DEV_FLAG_DMA_SKIP_SYNC: DMA sync operations can be skipped for coherent
  *		buffers.
+ * @DEV_FLAG_DMA_OPS_BYPASS: If set then the dma_ops are bypassed for the
+ *		streaming DMA operations (->map_* / ->unmap_* / ->sync_*), and
+ *		optional (if the coherent mask is large enough) also for dma
+ *		allocations. This flag is managed by the dma ops instance from
+ *		->dma_supported.
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE = 0,
 	DEV_FLAG_CAN_MATCH = 1,
 	DEV_FLAG_DMA_IOMMU = 2,
 	DEV_FLAG_DMA_SKIP_SYNC = 3,
+	DEV_FLAG_DMA_OPS_BYPASS = 4,
 
 	DEV_FLAG_COUNT
 };
@@ -567,11 +573,6 @@ enum struct_device_flags {
  *		  sync_state() callback.
  * @dma_coherent: this particular device is dma coherent, even if the
  *		architecture supports non-coherent devices.
- * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for the
- *		streaming DMA operations (->map_* / ->unmap_* / ->sync_*),
- *		and optionall (if the coherent mask is large enough) also
- *		for dma allocations.  This flag is managed by the dma ops
- *		instance from ->dma_supported.
  * @flags:	DEV_FLAG_XXX flags. Use atomic bitfield operations to modify.
  *
  * At the lowest level, every device in a Linux system is represented by an
@@ -685,9 +686,6 @@ struct device {
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
 	bool			dma_coherent:1;
 #endif
-#ifdef CONFIG_DMA_OPS_BYPASS
-	bool			dma_ops_bypass : 1;
-#endif
 
 	DECLARE_BITMAP(flags, DEV_FLAG_COUNT);
 };
@@ -718,6 +716,7 @@ __create_dev_flag_accessors(ready_to_probe, DEV_FLAG_READY_TO_PROBE);
 __create_dev_flag_accessors(can_match, DEV_FLAG_CAN_MATCH);
 __create_dev_flag_accessors(dma_iommu, DEV_FLAG_DMA_IOMMU);
 __create_dev_flag_accessors(dma_skip_sync, DEV_FLAG_DMA_SKIP_SYNC);
+__create_dev_flag_accessors(dma_ops_bypass, DEV_FLAG_DMA_OPS_BYPASS);
 
 #undef __create_dev_flag_accessors
 
diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
index 76fc65d1a8a4..30bf8455730a 100644
--- a/kernel/dma/mapping.c
+++ b/kernel/dma/mapping.c
@@ -126,11 +126,9 @@ static bool dma_go_direct(struct device *dev, dma_addr_t mask,
 	if (likely(!ops))
 		return true;
 
-#ifdef CONFIG_DMA_OPS_BYPASS
-	if (dev->dma_ops_bypass)
+	if (IS_ENABLED(CONFIG_DMA_OPS_BYPASS) && dev_dma_ops_bypass(dev))
 		return min_not_zero(mask, dev->bus_dma_limit) >=
 			    dma_direct_get_required_mask(dev);
-#endif
 	return false;
 }
 
-- 
2.53.0.1213.gd9a14994de-goog

