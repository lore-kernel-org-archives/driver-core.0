Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB6E3A3E8C
	for <driver-core@lists.linux.dev>; Mon,  6 Apr 2026 23:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775517941; cv=none; b=OZMIa4jjbJPesymu8eChUvhvs5yjmy4Glm7AnNP6P7qQWO3Lh86COlxcR+KKvF3pnXGGR3weFgedBxVM9Izw9WNxqft30UVfvwgKkQX2nad3nhaT2LLCRGOSvCDL7s5oa5lTJiRfjixL3K80EL2d+qo/cCUS/Acptg8lLBIbW48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775517941; c=relaxed/simple;
	bh=cp1k4PYAVtmRCQrxYc1pt9qs6gRNOi0JlUXRBqpNf+A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I/lSfmY/X+7WzXjE9x7k21K7OdJE9vE83GfBqWyD4EI3UOrIjJhAy4nxuDflUZRP/ZKWf0ykHNFJUKUfZTFrD0ufH8HXEwIWeAKUv/IbOppVq6GeSVJooxfkxuZuUgVgI1fVycFXQMqGhP/Ion1O4Nv21c2Gkb8vVZts+w1BtdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VRcT4q5Q; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VRcT4q5Q"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ba895adfeaso4769225eec.0
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 16:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775517939; x=1776122739; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KZmSYewuETJxw2Oo6JV9qDD2uOkf0pMYDKKz9xaL9LQ=;
        b=VRcT4q5QuxuuWQa5stSU4IVyaBwugGERDGw1wOG8HvNipjd2rVebXjDgAWL8yo+kuZ
         OQX8iJ+Py6Cn+sop3TjVvqYdcn5KqybrWcHXE247hApv33xoEhgkWwUmKMksZqtxbRNF
         FRsD9FW4dP+/ml0XbNDS0fjrrRz0CNEGEgU5k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775517939; x=1776122739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KZmSYewuETJxw2Oo6JV9qDD2uOkf0pMYDKKz9xaL9LQ=;
        b=DpyeyGz06aVT+KErnqYlcahACYHRtuQ7q9bbP2EMA6gfsLzoyxwPitAJEhc53fofQa
         H1dMuNRkIilwyEh8f2RsZz9EwLiSKsjnPHO+1jZDBmgq2acdegDhNCBH2IThHRO8qd8a
         PeGH0cp6yQpHqEyV9xHIleFbXp/EZ/SMlOmzK6KevyNI1413mxm9+ZJChSWTT5//3m0k
         nGAPYTcPt4TnsRAOLujNkL90JyXreXXwWZKNbuwWBm6v8sN9xcvFbLX/PecthzBKlqJh
         mcifoQoDig3e2wTp3/aGv/aPg0A7KZe1OMZgGXLfs1hbkIzVPzRUXjsGnp7j8OOaPYtG
         xbuA==
X-Forwarded-Encrypted: i=1; AJvYcCWwTefPglEVvuaoCRos5UijgugLZn80QHsXjME2zfRyJmIwMNDIrPhhO3Rigcf19TS6fKGd8/aM94UTXg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDau+OQBrNXEZFzjgAxRSqjWfg5x9hxyXuUvGqUnEimMhS9IM5
	RSH4yOgn/ZGLuQoRjEMNzAwwVYaYx1PCgFVDdDlz/eoIUT9t1K7ej2F7OdfYNbsUOw==
X-Gm-Gg: AeBDiet+x7uim6H26ju4DTJpkPWqW06TgW9MLz7WcRu1dXF3isNdr3MsFX6AxgQP3ct
	Bo82EYs4rjPsNait4Yr3MxcDx/4/yY8X255d3TWiQ5VvVdy4JtOkTovecQuYkvht97W6o84mlZw
	JcEGlmt/U0wvmUeLpLuVVLuM11h5m2yZky72gBGXnCyYKZuzNfyYWUdAx5c3/ZrG1TlBLMUlM7B
	Ito/9vRFOY5jX22Ih/uRRPs04NHOkDS+AnEhZF09Q389ZhWQp1R58qabwGJe5pPyKsiD/922QL2
	PNzipAEYlHmVWP2C4yEgJLKqYfitBfDjfo4LLhr6se1y6A5SxODtmT3c9JV/QwuCgLNrHq49XZx
	jjvwHj7UpxrNEdNS6lAoIzb0auKqUgmu8oewXFPUqqwBSq13XR9gs/1UZpSE53WlUIA1l2ksw2J
	y9SDU6c4RSKA9Ub0t93i4BFMtpwn6MvV6oy9dvb52+wClPOOwSwS0gv7jTJIbqt6rgo7nZ/2Cs2
	AXELQWoIw==
X-Received: by 2002:a05:7300:214d:b0:2c4:c4ef:48f7 with SMTP id 5a478bee46e88-2cbf9afd2e8mr7475964eec.11.1775517939476;
        Mon, 06 Apr 2026 16:25:39 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:c071:3b78:5a5:824a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca760b0518sm14730975eec.0.2026.04.06.16.25.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:25:37 -0700 (PDT)
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
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 6/9] driver core: Replace dev->state_synced with dev_state_synced()
Date: Mon,  6 Apr 2026 16:22:59 -0700
Message-ID: <20260406162231.v5.6.Idb4818e1159fef104c7756bfd6e7ba8f374bebcd@changeid>
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
threads without locking. Switch "state_synced" over to the "flags"
field so modifications are safe.

Cc: Saravana Kannan <saravanak@kernel.org>
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

(no changes since v4)

Changes in v4:
- Use accessor functions for flags

Changes in v3:
- New

 drivers/base/core.c    | 8 ++++----
 drivers/base/dd.c      | 8 +++-----
 include/linux/device.h | 9 +++++----
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index db5aec9e6a2b..e94749092345 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1123,7 +1123,7 @@ static void __device_links_queue_sync_state(struct device *dev,
 
 	if (!dev_has_sync_state(dev))
 		return;
-	if (dev->state_synced)
+	if (dev_state_synced(dev))
 		return;
 
 	list_for_each_entry(link, &dev->links.consumers, s_node) {
@@ -1138,7 +1138,7 @@ static void __device_links_queue_sync_state(struct device *dev,
 	 * than once. This can happen if new consumers get added to the device
 	 * and probed before the list is flushed.
 	 */
-	dev->state_synced = true;
+	dev_set_state_synced(dev);
 
 	if (WARN_ON(!list_empty(&dev->links.defer_sync)))
 		return;
@@ -1779,7 +1779,7 @@ static int fw_devlink_dev_sync_state(struct device *dev, void *data)
 	struct device *sup = link->supplier;
 
 	if (!device_link_test(link, DL_FLAG_MANAGED) ||
-	    link->status == DL_STATE_ACTIVE || sup->state_synced ||
+	    link->status == DL_STATE_ACTIVE || dev_state_synced(sup) ||
 	    !dev_has_sync_state(sup))
 		return 0;
 
@@ -1793,7 +1793,7 @@ static int fw_devlink_dev_sync_state(struct device *dev, void *data)
 		return 0;
 
 	dev_warn(sup, "Timed out. Forcing sync_state()\n");
-	sup->state_synced = true;
+	dev_set_state_synced(sup);
 	get_device(sup);
 	list_add_tail(&sup->links.defer_sync, data);
 
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 70fa0b13e74f..067a06edd6bc 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -581,12 +581,10 @@ static ssize_t state_synced_store(struct device *dev,
 		return -EINVAL;
 
 	device_lock(dev);
-	if (!dev->state_synced) {
-		dev->state_synced = true;
+	if (!dev_test_and_set_state_synced(dev))
 		dev_sync_state(dev);
-	} else {
+	else
 		ret = -EINVAL;
-	}
 	device_unlock(dev);
 
 	return ret ? ret : count;
@@ -598,7 +596,7 @@ static ssize_t state_synced_show(struct device *dev,
 	bool val;
 
 	device_lock(dev);
-	val = dev->state_synced;
+	val = dev_state_synced(dev);
 	device_unlock(dev);
 
 	return sysfs_emit(buf, "%u\n", val);
diff --git a/include/linux/device.h b/include/linux/device.h
index 1c43ff695e83..b7a8b902efb3 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -478,6 +478,9 @@ struct device_physical_location {
  *		optional (if the coherent mask is large enough) also for dma
  *		allocations. This flag is managed by the dma ops instance from
  *		->dma_supported.
+ * @DEV_FLAG_STATE_SYNCED: The hardware state of this device has been synced to
+ *		match the software state of this device by calling the
+ *		driver/bus sync_state() callback.
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE = 0,
@@ -485,6 +488,7 @@ enum struct_device_flags {
 	DEV_FLAG_DMA_IOMMU = 2,
 	DEV_FLAG_DMA_SKIP_SYNC = 3,
 	DEV_FLAG_DMA_OPS_BYPASS = 4,
+	DEV_FLAG_STATE_SYNCED = 5,
 
 	DEV_FLAG_COUNT
 };
@@ -568,9 +572,6 @@ enum struct_device_flags {
  * @offline:	Set after successful invocation of bus type's .offline().
  * @of_node_reused: Set if the device-tree node is shared with an ancestor
  *              device.
- * @state_synced: The hardware state of this device has been synced to match
- *		  the software state of this device by calling the driver/bus
- *		  sync_state() callback.
  * @dma_coherent: this particular device is dma coherent, even if the
  *		architecture supports non-coherent devices.
  * @flags:	DEV_FLAG_XXX flags. Use atomic bitfield operations to modify.
@@ -680,7 +681,6 @@ struct device {
 	bool			offline_disabled:1;
 	bool			offline:1;
 	bool			of_node_reused:1;
-	bool			state_synced:1;
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
@@ -717,6 +717,7 @@ __create_dev_flag_accessors(can_match, DEV_FLAG_CAN_MATCH);
 __create_dev_flag_accessors(dma_iommu, DEV_FLAG_DMA_IOMMU);
 __create_dev_flag_accessors(dma_skip_sync, DEV_FLAG_DMA_SKIP_SYNC);
 __create_dev_flag_accessors(dma_ops_bypass, DEV_FLAG_DMA_OPS_BYPASS);
+__create_dev_flag_accessors(state_synced, DEV_FLAG_STATE_SYNCED);
 
 #undef __create_dev_flag_accessors
 
-- 
2.53.0.1213.gd9a14994de-goog

