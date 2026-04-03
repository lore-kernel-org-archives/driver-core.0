Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552F72405EB
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 00:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177516; cv=none; b=VrmRBpvHW81W9aifjkma/GuPcuY0yvWMJbK1sZi54uA3JF8zkFFumwWt00B/mW8xVI6R5FwGQ56lin32++piRiIJX5OyIESSbAFflOemPjdDeCsNp0OFWsuf/FPHThT9SVMPdlf9Txm01xPu2qY7N4P+S8uWGrL1UT93eqZjghs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177516; c=relaxed/simple;
	bh=5N3do3f1bda60XdV+FFEIMw3KG/6XRb7QL0OIJu2YW4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p4WLMDwktgpXw994d4lOEGvlCjDVASePT7icTVfTSbp2nki7ggNXub0ErO8T5cWIYH0FPh1IXTDdhVagYEmips5abGK5O5xprXm6hdB/pWGqASot2mLqeG9CVKBsoZJbc1woRtjcJ2DmtU849u4qIRdeLxCSWiWE0CpWOymed1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ra0erj8b; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ra0erj8b"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2bd9a485bd6so3281065eec.1
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 17:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775177514; x=1775782314; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgGJ3qVhvTnihbeXgwabOY+LFFKSLUKoX7zSIc0h7aU=;
        b=Ra0erj8bwyD77DryEVvRLipDqlHlfvDNsyFhUxr5lcQRYyFikwJt4rtSef6iKk47fZ
         7wiWBP2CvkRAg0lFWCFtMmi92S8+HXfV85oju/Sw+fVVlRfR1BeiIQ1gTD6xyZyRErii
         W0W3ixrsE9M6nTItnK5KEUAYUckFfM+S0jZ+4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177514; x=1775782314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kgGJ3qVhvTnihbeXgwabOY+LFFKSLUKoX7zSIc0h7aU=;
        b=Y5HmpVNrvEr3GRKg7aTqQdXmSNFvq3rJZxVFuHLBaI8IGlNYkSkUOmW6VogbmDW60H
         uBlQOx+OUKeBpDfUtWr1PYdzUdmGwKLuXulj7CIQpOJtnY9dZH/pPkQxL8aB9nWMHtbu
         gr+LkmIo5tmAmTiqq7Masb6KlgsU2oqFpQIwbUt7vNHqQr7Akp3SOAqA3qx9LVxlzr4/
         gE9wDrH/5bap9ia6bKjlInry6Iyb7tnBsVzOoBi72KV/p/N4WsDBwpMDgPfQU21zKLq6
         f5t8Y9NiDF67bLsLnR0VNr27PnFMM+mbNj5/lswkNSI2cI5VOaehJ55o90KxEdREoYIi
         TvCw==
X-Forwarded-Encrypted: i=1; AJvYcCVCi3ju3XpP1Uu/8vOjd+lewyl/ljXR6apRAPSf9KvqhilvIpmwCenyWulLDqE0gXBqgnljiWfeHjkQzA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpUkP9Cqmibv5Fs0VzJPKqkRKmoqZYTaROEt9/TF400G5bDMOx
	wygyWRyJ5CNZgUyiq5HhRulzCg6EiDrAoGHApZI92g4S6frw5jwNGUXQtkkbqaZUgw==
X-Gm-Gg: AeBDiesjJs0mHIs6g+642MLyya7GyvMT8BH88wcBdrXEvgmzW/w6niJasZWwwF9mily
	7PSWKv8BwFjl1mR/p7ymrQL8jdJENrAp1qAePRvX7XOH7xoQKeDw3V/7ewXV+wgN++y8LxXLj2v
	ugM02ynnXjH7wtqZXZBa0VP3EXn9A6ZaR1OLbkROBLHRd7GwhDyzqbH/7axnTdZEzfSNw+s0eXd
	xB1myqcVAGsSsuSn7HYIwfHfwfu8yaN0CMjaRR0oJ2IDEGcPedh6ONzN8cRAdCqVSp8L90qR6j6
	G2yS34lN34YYmvOP5UQ8JKrXxR+uyLRzOa6o2TRGtfR90w2pFFzj5Iq5bH0JDWIJ5boaCA5sM3P
	q3m2Cs4ngkJJgGQXTGh6LK7hKNkNvlfraUTry2pcffKcDbOgWOyZy67AQiqq58eNS5/ylMYMnRC
	+892Tl8eo+FWmoWC5l/pLZV09kgtZdHnpcZS5hKG8DY2awPFy5vIAmB1a3qFbVNtoy/BNm6h307
	u9j/zz2mhw=
X-Received: by 2002:a05:7301:1003:b0:2c5:ed1b:c8a with SMTP id 5a478bee46e88-2cbf9afd5e5mr636627eec.5.1775177514535;
        Thu, 02 Apr 2026 17:51:54 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:5db3:7542:a530:f43a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df3b84sm3630074eec.5.2026.04.02.17.51.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:51:52 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Leon Romanovsky <leon@kernel.org>,
	Paul Burton <paul.burton@mips.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	Toshi Kani <toshi.kani@hp.com>,
	Christoph Hellwig <hch@lst.de>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Johan Hovold <johan@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Saravana Kannan <saravanak@google.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/9] driver core: Replace dev->state_synced with DEV_FLAG_STATE_SYNCED
Date: Thu,  2 Apr 2026 17:49:52 -0700
Message-ID: <20260402174925.v3.6.Idb4818e1159fef104c7756bfd6e7ba8f374bebcd@changeid>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260403005005.30424-1-dianders@chromium.org>
References: <20260403005005.30424-1-dianders@chromium.org>
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

Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

Changes in v3:
- New

 drivers/base/core.c    | 9 +++++----
 drivers/base/dd.c      | 8 +++-----
 include/linux/device.h | 8 ++++----
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbdfee887833..8dbb7a9c7aab 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1123,7 +1123,7 @@ static void __device_links_queue_sync_state(struct device *dev,
 
 	if (!dev_has_sync_state(dev))
 		return;
-	if (dev->state_synced)
+	if (test_bit(DEV_FLAG_STATE_SYNCED, &dev->flags))
 		return;
 
 	list_for_each_entry(link, &dev->links.consumers, s_node) {
@@ -1138,7 +1138,7 @@ static void __device_links_queue_sync_state(struct device *dev,
 	 * than once. This can happen if new consumers get added to the device
 	 * and probed before the list is flushed.
 	 */
-	dev->state_synced = true;
+	set_bit(DEV_FLAG_STATE_SYNCED, &dev->flags);
 
 	if (WARN_ON(!list_empty(&dev->links.defer_sync)))
 		return;
@@ -1779,7 +1779,8 @@ static int fw_devlink_dev_sync_state(struct device *dev, void *data)
 	struct device *sup = link->supplier;
 
 	if (!device_link_test(link, DL_FLAG_MANAGED) ||
-	    link->status == DL_STATE_ACTIVE || sup->state_synced ||
+	    link->status == DL_STATE_ACTIVE ||
+	    test_bit(DEV_FLAG_STATE_SYNCED, &sup->flags) ||
 	    !dev_has_sync_state(sup))
 		return 0;
 
@@ -1793,7 +1794,7 @@ static int fw_devlink_dev_sync_state(struct device *dev, void *data)
 		return 0;
 
 	dev_warn(sup, "Timed out. Forcing sync_state()\n");
-	sup->state_synced = true;
+	set_bit(DEV_FLAG_STATE_SYNCED, &sup->flags);
 	get_device(sup);
 	list_add_tail(&sup->links.defer_sync, data);
 
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 66df31696349..f5d004f919ae 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -581,12 +581,10 @@ static ssize_t state_synced_store(struct device *dev,
 		return -EINVAL;
 
 	device_lock(dev);
-	if (!dev->state_synced) {
-		dev->state_synced = true;
+	if (!test_and_set_bit(DEV_FLAG_STATE_SYNCED, &dev->flags))
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
+	val = test_bit(DEV_FLAG_STATE_SYNCED, &dev->flags);
 	device_unlock(dev);
 
 	return sysfs_emit(buf, "%u\n", val);
diff --git a/include/linux/device.h b/include/linux/device.h
index f5845bd7c3e6..6c961dac9fdb 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -477,6 +477,9 @@ struct device_physical_location {
  *		optional (if the coherent mask is large enough) also for dma
  *		allocations. This flag is managed by the dma ops instance from
  *		->dma_supported.
+ * @DEV_FLAG_STATE_SYNCED: The hardware state of this device has been synced to
+ *		match the software state of this device by calling the
+ *		driver/bus sync_state() callback.
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE,
@@ -484,6 +487,7 @@ enum struct_device_flags {
 	DEV_FLAG_DMA_IOMMU,
 	DEV_FLAG_DMA_SKIP_SYNC,
 	DEV_FLAG_DMA_OPS_BYPASS,
+	DEV_FLAG_STATE_SYNCED,
 };
 
 /**
@@ -565,9 +569,6 @@ enum struct_device_flags {
  * @offline:	Set after successful invocation of bus type's .offline().
  * @of_node_reused: Set if the device-tree node is shared with an ancestor
  *              device.
- * @state_synced: The hardware state of this device has been synced to match
- *		  the software state of this device by calling the driver/bus
- *		  sync_state() callback.
  * @dma_coherent: this particular device is dma coherent, even if the
  *		architecture supports non-coherent devices.
  * @flags:	DEV_FLAG_XXX flags. Use atomic bitfield operations to modify.
@@ -677,7 +678,6 @@ struct device {
 	bool			offline_disabled:1;
 	bool			offline:1;
 	bool			of_node_reused:1;
-	bool			state_synced:1;
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
-- 
2.53.0.1213.gd9a14994de-goog

