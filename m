Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D953A1A26
	for <driver-core@lists.linux.dev>; Mon,  6 Apr 2026 23:25:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775517930; cv=none; b=k4nlMDb9hoxbr6mD1nONhOshSzJiu8okmMPrwFrsa6dcLTIUTu2cZJ+sUj35mDH+dgUXqZ06mtrDAwvQtIs+7uepcVRAfvbTl0rufiMQk13uuEeHCZu8n2LjvWUADRfPdIIi0E/NC+3Ns/VEZMVIgsNDQDuHcFyzzoIzHgUL91I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775517930; c=relaxed/simple;
	bh=JpoNAGDaJKJ9hL00/1zW3OpQzxxaUbzvYD001zjveU4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CqExP2VBRLsxbY/olMIjeOKhPsELOzuumpcG4KmkaAQQMI/f4MAqpySJK1+jM0W1okd9RgsoTphTD7QNpMgM2B7pdiEvNS0WLlSrZC+Hshz+aGZO2yl+DxIOW5pUWRJAA1Fl2+789Lj2LnLS0ugtYTOBozkVCItUtBoRHiZDFzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=F5mTpRWW; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="F5mTpRWW"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b4520f6b32so4885263eec.0
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 16:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775517928; x=1776122728; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CaJt/QytLmx9cc7EXwGuHstK77fL+3uwr/3WBtDIoI0=;
        b=F5mTpRWWS4X36xTeo3m2NxDJdrewH0qYad4YJCI4gmTmb8J/xWNV/NssGmaGrt8yJu
         YkyZr8QvIayFUuzgTLGP1KNizNzqUycy/s+FvRkYqbIRmbgcWzFuYITb3WPIijoVeogF
         oZv4tyDbEFggMNrWAUiVLgaFG51VFTvnt+uYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775517928; x=1776122728;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CaJt/QytLmx9cc7EXwGuHstK77fL+3uwr/3WBtDIoI0=;
        b=p3aatRLc5fRg36D136TO7ADoQrkn1Yv84lDDuz68tfO8ybqOzGLq9bM8HsEMOkJUR+
         NNEfJ6Qu+PgCrdDy9ZsEAcXyDe5tpk3G1DUNSSlADS5h/FwxPWk8fHTHriVwbfuO3/Q8
         YKf+kgAyu0xUBNqGAWwLvkPIKZ5VZG+jmCNeT6jnwzMottIVl0hlf5KEXCb0DOaCWm1o
         z8r1IEt46ttbjj5bvEKWC7JEIOvkQx0mRSD+/xRFcqDWOt6gR5Xb73rL7A89lz5rAP3b
         pR3XlKLwEfE0K81i1Qm9Ry8zfdLeLnygDfBg9TDOcbIrpDpAdvUfHXgptOqN0i1vXa3b
         Jpvg==
X-Forwarded-Encrypted: i=1; AJvYcCVDpwpQl7wrmB9m2/OlWPdZBHJRj1f7enNusTyzUEE29mSzZelcyBlK6Z0cQQq3YVCVZqI9pqwKVPUTdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMy7d+TB7TibvmwPPodqs556P7DOD1Ji+mvZ2mTzwi7Rp4QlnC
	Rp784t/88yxURm2Xj4HAXs4YV/Xmvd/L5P7Q+qi8YFdBM85+jQ9M+wVXZ5mDLG18Hw==
X-Gm-Gg: AeBDietWnJcsk8a68ktTqbsSQeIVyEi6FKQqUoCPclgy5TGybTu9ko9rf0XayohwXm4
	yYGEwIapfaxIzJ++FmUdw9gPpxpweWH2b3qX9uqSw4Hxz580HUiKVxpELGd/9mM1XVzPervURIU
	NwmLay18SoLQ0HvlPgwZFf+aSLhRVhrW43ftjqyw08I+aAXOu1PPwcIqur6XuSBEKJVCsop+2d3
	4LZd0a4Ruw+ANwvK8Kzlc48lGuCAj/2lK9yfh5qpTfmUbjNYGBHY+58N9Z9tSng/baSzD8/1kBM
	vQBG2iSFfOy0Q/RwvpjGe/4Nf+Ggv/sqpkfq32lvbEJ0R6ruuZtCegPY5dC4hLIV1ayTuTiXab8
	3gHVt1bqoMCkGuPTaLl+EdlX9mCYLYyZzsvYxCXinpXyuGeFNG3OtZU40Fq7h2QzSnJQX4e1znX
	+jbL222Nd7AO3pasFMsZRZVzIc0XLavWUpQRWXvCS2JBj4YLffN74zAxADW5/M5naQ0FzPKQRaM
	6dkvvGYQrmK/GIkkigB
X-Received: by 2002:a05:7300:a287:b0:2c0:f424:b545 with SMTP id 5a478bee46e88-2cbfa5bdfb3mr7483451eec.15.1775517927810;
        Mon, 06 Apr 2026 16:25:27 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:c071:3b78:5a5:824a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca760b0518sm14730975eec.0.2026.04.06.16.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 16:25:26 -0700 (PDT)
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
Subject: [PATCH v5 2/9] driver core: Replace dev->can_match with dev_can_match()
Date: Mon,  6 Apr 2026 16:22:55 -0700
Message-ID: <20260406162231.v5.2.I54b3ae6311ff34ad30227659d91bb109911a4aea@changeid>
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
threads without locking. Switch "can_match" over to the "flags" field
so modifications are safe.

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

 drivers/base/core.c    | 10 +++++-----
 drivers/base/dd.c      | 10 +++++-----
 include/linux/device.h |  9 +++++----
 3 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 984d6bfbd6e4..db5aec9e6a2b 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1011,7 +1011,7 @@ static void device_links_missing_supplier(struct device *dev)
 
 static bool dev_is_best_effort(struct device *dev)
 {
-	return (fw_devlink_best_effort && dev->can_match) ||
+	return (fw_devlink_best_effort && dev_can_match(dev)) ||
 		(dev->fwnode && (dev->fwnode->flags & FWNODE_FLAG_BEST_EFFORT));
 }
 
@@ -1079,7 +1079,7 @@ int device_links_check_suppliers(struct device *dev)
 
 			if (dev_is_best_effort(dev) &&
 			    device_link_test(link, DL_FLAG_INFERRED) &&
-			    !link->supplier->can_match) {
+			    !dev_can_match(link->supplier)) {
 				ret = -EAGAIN;
 				continue;
 			}
@@ -1370,7 +1370,7 @@ void device_links_driver_bound(struct device *dev)
 		} else if (dev_is_best_effort(dev) &&
 			   device_link_test(link, DL_FLAG_INFERRED) &&
 			   link->status != DL_STATE_CONSUMER_PROBE &&
-			   !link->supplier->can_match) {
+			   !dev_can_match(link->supplier)) {
 			/*
 			 * When dev_is_best_effort() is true, we ignore device
 			 * links to suppliers that don't have a driver.  If the
@@ -1758,7 +1758,7 @@ static int fw_devlink_no_driver(struct device *dev, void *data)
 {
 	struct device_link *link = to_devlink(dev);
 
-	if (!link->supplier->can_match)
+	if (!dev_can_match(link->supplier))
 		fw_devlink_relax_link(link);
 
 	return 0;
@@ -3710,7 +3710,7 @@ int device_add(struct device *dev)
 	 * match with any driver, don't block its consumers from probing in
 	 * case the consumer device is able to operate without this supplier.
 	 */
-	if (dev->fwnode && fw_devlink_drv_reg_done && !dev->can_match)
+	if (dev->fwnode && fw_devlink_drv_reg_done && !dev_can_match(dev))
 		fw_devlink_unblock_consumers(dev);
 
 	if (parent)
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index ec7ef9c5d62e..70fa0b13e74f 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -132,7 +132,7 @@ static DECLARE_WORK(deferred_probe_work, deferred_probe_work_func);
 
 void driver_deferred_probe_add(struct device *dev)
 {
-	if (!dev->can_match)
+	if (!dev_can_match(dev))
 		return;
 
 	mutex_lock(&deferred_probe_mutex);
@@ -861,14 +861,14 @@ static int __driver_probe_device(const struct device_driver *drv, struct device
 		return dev_err_probe(dev, -EPROBE_DEFER, "Device not ready to probe\n");
 
 	/*
-	 * Set can_match = true after calling dev_ready_to_probe(), so
+	 * Call dev_set_can_match() after calling dev_ready_to_probe(), so
 	 * driver_deferred_probe_add() won't actually add the device to the
 	 * deferred probe list when dev_ready_to_probe() returns false.
 	 *
 	 * When dev_ready_to_probe() returns false, it means that device_add()
 	 * will do another probe() attempt for us.
 	 */
-	dev->can_match = true;
+	dev_set_can_match(dev);
 	dev_dbg(dev, "bus: '%s': %s: matched device with driver %s\n",
 		drv->bus->name, __func__, drv->name);
 
@@ -1014,7 +1014,7 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
 		return 0;
 	} else if (ret == -EPROBE_DEFER) {
 		dev_dbg(dev, "Device match requests probe deferral\n");
-		dev->can_match = true;
+		dev_set_can_match(dev);
 		driver_deferred_probe_add(dev);
 		/*
 		 * Device can't match with a driver right now, so don't attempt
@@ -1266,7 +1266,7 @@ static int __driver_attach(struct device *dev, void *data)
 		return 0;
 	} else if (ret == -EPROBE_DEFER) {
 		dev_dbg(dev, "Device match requests probe deferral\n");
-		dev->can_match = true;
+		dev_set_can_match(dev);
 		driver_deferred_probe_add(dev);
 		/*
 		 * Driver could not match with device, but may match with
diff --git a/include/linux/device.h b/include/linux/device.h
index f27ed6eb87a9..38f4316b3cde 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -466,9 +466,13 @@ struct device_physical_location {
  *
  * @DEV_FLAG_READY_TO_PROBE: If set then device_add() has finished enough
  *		initialization that probe could be called.
+ * @DEV_FLAG_CAN_MATCH: The device has matched with a driver at least once or it
+ *		is in a bus (like AMBA) which can't check for matching drivers
+ *		until other devices probe successfully.
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE = 0,
+	DEV_FLAG_CAN_MATCH = 1,
 
 	DEV_FLAG_COUNT
 };
@@ -555,9 +559,6 @@ enum struct_device_flags {
  * @state_synced: The hardware state of this device has been synced to match
  *		  the software state of this device by calling the driver/bus
  *		  sync_state() callback.
- * @can_match:	The device has matched with a driver at least once or it is in
- *		a bus (like AMBA) which can't check for matching drivers until
- *		other devices probe successfully.
  * @dma_coherent: this particular device is dma coherent, even if the
  *		architecture supports non-coherent devices.
  * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for the
@@ -676,7 +677,6 @@ struct device {
 	bool			offline:1;
 	bool			of_node_reused:1;
 	bool			state_synced:1;
-	bool			can_match:1;
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
@@ -718,6 +718,7 @@ static inline bool dev_test_and_set_##accessor_name(struct device *dev) \
 }
 
 __create_dev_flag_accessors(ready_to_probe, DEV_FLAG_READY_TO_PROBE);
+__create_dev_flag_accessors(can_match, DEV_FLAG_CAN_MATCH);
 
 #undef __create_dev_flag_accessors
 
-- 
2.53.0.1213.gd9a14994de-goog

