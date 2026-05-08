Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE48F3DDDCE
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243964; cv=none; b=Ck2RDzwQAU5XfuJEwIFnHGPUwYYbEphsOeW8Aw2GAkQhUSvV36lVv0BJd6VBXxX/lpEc/ZVZLaRlMqStFo5Y5/A632mxHvBDIII6DsrYMwoe1KzDhEofsZLl0LI5v9AdqYZQgw67S83VznZa7KwCFZK2sSS7JfcJrOtz7ePKDeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243964; c=relaxed/simple;
	bh=JSUt4ly77w9AZQ4tDDDyVxBvz8uAP90OcaWHAL09iUo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uNTcyglLyl6wnIgE6HMDpVInmQiSjguS6LTsxaPYl6/zSqNFbZxjEp3k9eZyTvJOXgu4Ribg9Umpmb46BJW3prt1XVuag01CP6SQfDhqWklcVzxJvfa1YSZwBJNfqz/+Uk1xE7hZKr9MA8ontrnegf15LBh75/ieZNRlbhAqpmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=wFz5nb/v; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="wFz5nb/v"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38e97e73234so18108691fa.1
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243960; x=1778848760; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T1V7f6VwIFJnpdLDcuGNrN4BNy0ycpcL6FQiCdAHMdc=;
        b=wFz5nb/vD4vvBwYAY1JD9c49uStp0oyL/bk4YGOyXgcDbrPwQJkZA/3MarV4NtjDwh
         v0Yfh7zJsJf64eKM1c3DgVoTtZFj7K6g0oqsh8GblfRlHH6kIoJy3gLG8FidGL6DePfF
         o6/dRP5FTck+JP4RLDhR4IBBwWbY63TQhVluQY7wbiX5QRWbAn1PrL+bJpxIKXri0zL7
         gHU0NNOUIlEwZ9Al87r9HEdmZhhO+KnWyml9YMtznrbMhcsr1SCapIsdFL0BzN/bTg1t
         JTT57WNuALjX+/pAAvtffxdtoYD6IK8CQcxbI4OkBIYCbGWmh68gvqEvE1ugMlsQuZXv
         jgSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243960; x=1778848760;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T1V7f6VwIFJnpdLDcuGNrN4BNy0ycpcL6FQiCdAHMdc=;
        b=FPOyag3ZU7nrqpyvi2zzS6yWPnsT2MJ0r7mhRT5iul6VWj9kvwzLIK3zYO1nf8Gyn+
         yLHVzUQr3leO6M8mux2hUlyaI6B5nP4PKha1IB4/jyheP8u3N3GQZ46iujnUf1s0u6wj
         sVoYaxKsWW9+kH1QPvgVrGEDjBc/sMVLEVG+Vo31SPImdxaZKd80gT8d3iqCe9q4/MtJ
         1a4DY5mCY6R9EjL5WMCYFffEt7OGFEcv6Pe4J9cDsVqC5Dc8Tr3/H3yQR/+GbWgh5LTz
         5OrMjnf7neYYQ9jA7TJIPK1x0H3ahvkxUCZlesZZqiqiKlqMjXxDdjsb0bGIx2wL9XCB
         2M9Q==
X-Forwarded-Encrypted: i=1; AFNElJ+FNlveLmU8f95gS5+napMIN5SVigC2fL//JYmNQ5dmUmLDf+tkhHvMY19VsFwMntMd8UI4kr7OqorBTw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8LI0Il7Ryp1fq35qst1mE/LyW8maL+ws6JhxR2x9TyOK6UyE7
	hS182zIgR5iUaxIjwoYk/VpfcRXaiflzxsmdDf+YThlwwAWJrNU7hM/YC6lXjZmF038=
X-Gm-Gg: Acq92OGtk1Wb8y+D9Sd/BjhV8IEOSavji29J4weF573gCgAGyoP7yF0yGx/mEJXL9Ml
	EzFYmnu+fhTLGOhtKjJA193Vr2b7fGrf7cE1n3pMTeStb6QeldJjEFPZZK4fG5xPd3z8eluw4Vv
	RQeqHBczFlqTXn0ddaHC8gj+XYFC1hghJ8YfQwmQFZD1YJJrjvDnK5Xox1ytzmlzvTFX5ZTPIV+
	Kk/lxlNl6E3+2L/jVWSoCDsVjQU12Fx2PspFKk49o7mHcNCUTBb6JiueqsjO5RgMrC8ol93WMhq
	3Un2xYvfViy+qDzeKV5hTHOL7Qd0mOtwFbIg8HaXakca1NllmW9FDCrJCyhziiJzhBYDDjLQP3q
	+85JXWndCfNqUOrbsnmzA7XBurITbttMuay4nXFjl3RnGEy1ctQa21Cpu4wy6WcmmDD8qppmTcX
	7f9N07PBTMH8HQLhKWeSJHG915R/LXScHL5UTlE8T9U85PxyhNyMEG4pqkgJ19qvKwCxk0N7+L
X-Received: by 2002:a05:651c:20da:20b0:393:903c:2263 with SMTP id 38308e7fff4ca-393c434912bmr37128391fa.31.1778243959937;
        Fri, 08 May 2026 05:39:19 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:19 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 02/13] driver core: Enable suppliers to implement fine grained sync_state support
Date: Fri,  8 May 2026 14:38:51 +0200
Message-ID: <20260508123910.114273-3-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The common sync_state support isn't fine grained enough for some types of
suppliers, like power domains for example. Especially when a supplier
provides multiple independent power domains, each with their own set of
consumers. In these cases we need to wait for all consumers for all the
provided power domains before invoking the supplier's ->sync_state().

To allow a more fine grained sync_state support to be implemented on per
supplier's driver basis, let's add a new optional callback. As soon as
there is an update worth to consider in regards to managing sync_state for
a supplier device, __device_links_queue_sync_state() queues the device in a
list, allowing the new callback to be invoked when flushing the list in
device_links_flush_sync_list().

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- Re-worked the approach to use a list to queue/flush devices for
	->queue_sync_state(). This should make sure the device lock is being
	held when it's needed, as pointed out by Danilo.

---
 drivers/base/base.h           | 18 ++++++++
 drivers/base/core.c           | 77 ++++++++++++++++++++++++++---------
 drivers/base/driver.c         |  7 ++++
 include/linux/device.h        |  2 +
 include/linux/device/driver.h |  7 ++++
 5 files changed, 91 insertions(+), 20 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 30b416588617..c8be24af92c3 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -196,6 +196,24 @@ static inline void dev_sync_state(struct device *dev)
 		dev->driver->sync_state(dev);
 }
 
+static inline bool dev_has_queue_sync_state(struct device *dev)
+{
+	struct device_driver *drv;
+
+	if (!dev)
+		return false;
+	drv = READ_ONCE(dev->driver);
+	if (drv && drv->queue_sync_state)
+		return true;
+	return false;
+}
+
+static inline void dev_queue_sync_state(struct device *dev)
+{
+	if (dev->driver && dev->driver->queue_sync_state)
+		dev->driver->queue_sync_state(dev);
+}
+
 int driver_add_groups(const struct device_driver *drv, const struct attribute_group **groups);
 void driver_remove_groups(const struct device_driver *drv, const struct attribute_group **groups);
 void device_driver_detach(struct device *dev);
diff --git a/drivers/base/core.c b/drivers/base/core.c
index d49420e066de..f1f95b3c81e5 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1101,15 +1101,18 @@ int device_links_check_suppliers(struct device *dev)
 /**
  * __device_links_queue_sync_state - Queue a device for sync_state() callback
  * @dev: Device to call sync_state() on
- * @list: List head to queue the @dev on
+ * @s_list: List head for the sync_state to queue the @dev on
+ * @q_list: List head for the queue_sync_state to queue the @dev on
  *
  * Queues a device for a sync_state() callback when the device links write lock
  * isn't held. This allows the sync_state() execution flow to use device links
  * APIs.  The caller must ensure this function is called with
- * device_links_write_lock() held.
+ * device_links_write_lock() held.  Note, if the optional queue_sync_state()
+ * callback has been assigned too, the device is queued for that list to allow a
+ * more fine grained support to be implemented on per supplier basis.
  *
  * This function does a get_device() to make sure the device is not freed while
- * on this list.
+ * on the corresponding list.
  *
  * So the caller must also ensure that device_links_flush_sync_list() is called
  * as soon as the caller releases device_links_write_lock().  This is necessary
@@ -1117,7 +1120,8 @@ int device_links_check_suppliers(struct device *dev)
  * put_device() is called on this device.
  */
 static void __device_links_queue_sync_state(struct device *dev,
-					    struct list_head *list)
+					    struct list_head *s_list,
+					    struct list_head *q_list)
 {
 	struct device_link *link;
 
@@ -1129,8 +1133,14 @@ static void __device_links_queue_sync_state(struct device *dev,
 	list_for_each_entry(link, &dev->links.consumers, s_node) {
 		if (!device_link_test(link, DL_FLAG_MANAGED))
 			continue;
-		if (link->status != DL_STATE_ACTIVE)
+		if (link->status != DL_STATE_ACTIVE) {
+			if (dev_has_queue_sync_state(dev) &&
+			    list_empty(&dev->links.queue_sync)) {
+				get_device(dev);
+				list_add_tail(&dev->links.queue_sync, q_list);
+			}
 			return;
+		}
 	}
 
 	/*
@@ -1144,25 +1154,28 @@ static void __device_links_queue_sync_state(struct device *dev,
 		return;
 
 	get_device(dev);
-	list_add_tail(&dev->links.defer_sync, list);
+	list_add_tail(&dev->links.defer_sync, s_list);
 }
 
 /**
- * device_links_flush_sync_list - Call sync_state() on a list of devices
- * @list: List of devices to call sync_state() on
+ * device_links_flush_sync_list - Call sync_state callbacks for the devices
+ * @s_list: List of devices to call sync_state() on
+ * @q_list: List of devices to call queue_sync_state() on
  * @dont_lock_dev: Device for which lock is already held by the caller
  *
- * Calls sync_state() on all the devices that have been queued for it. This
- * function is used in conjunction with __device_links_queue_sync_state(). The
- * @dont_lock_dev parameter is useful when this function is called from a
- * context where a device lock is already held.
+ * Calls sync_state() and queue_sync_state() on all the devices that have been
+ * queued for it. This function is used in conjunction with
+ * __device_links_queue_sync_state(). The @dont_lock_dev parameter is useful
+ * when this function is called from a context where a device lock is already
+ * held.
  */
-static void device_links_flush_sync_list(struct list_head *list,
+static void device_links_flush_sync_list(struct list_head *s_list,
+					 struct list_head *q_list,
 					 struct device *dont_lock_dev)
 {
 	struct device *dev, *tmp;
 
-	list_for_each_entry_safe(dev, tmp, list, links.defer_sync) {
+	list_for_each_entry_safe(dev, tmp, s_list, links.defer_sync) {
 		list_del_init(&dev->links.defer_sync);
 
 		if (dev != dont_lock_dev)
@@ -1175,6 +1188,25 @@ static void device_links_flush_sync_list(struct list_head *list,
 
 		put_device(dev);
 	}
+
+	if (!q_list)
+		return;
+
+	list_for_each_entry_safe(dev, tmp, q_list, links.queue_sync) {
+		list_del_init(&dev->links.queue_sync);
+
+		if (dev != dont_lock_dev)
+			device_lock(dev);
+
+		device_links_write_lock();
+		dev_queue_sync_state(dev);
+		device_links_write_unlock();
+
+		if (dev != dont_lock_dev)
+			device_unlock(dev);
+
+		put_device(dev);
+	}
 }
 
 void device_links_supplier_sync_state_pause(void)
@@ -1188,6 +1220,7 @@ void device_links_supplier_sync_state_resume(void)
 {
 	struct device *dev, *tmp;
 	LIST_HEAD(sync_list);
+	LIST_HEAD(queue_list);
 
 	device_links_write_lock();
 	if (!defer_sync_state_count) {
@@ -1204,12 +1237,12 @@ void device_links_supplier_sync_state_resume(void)
 		 * sync_list because defer_sync is used for both lists.
 		 */
 		list_del_init(&dev->links.defer_sync);
-		__device_links_queue_sync_state(dev, &sync_list);
+		__device_links_queue_sync_state(dev, &sync_list, &queue_list);
 	}
 out:
 	device_links_write_unlock();
 
-	device_links_flush_sync_list(&sync_list, NULL);
+	device_links_flush_sync_list(&sync_list, &queue_list, NULL);
 }
 
 static int sync_state_resume_initcall(void)
@@ -1296,6 +1329,7 @@ void device_links_driver_bound(struct device *dev)
 {
 	struct device_link *link, *ln;
 	LIST_HEAD(sync_list);
+	LIST_HEAD(queue_list);
 
 	/*
 	 * If a device binds successfully, it's expected to have created all
@@ -1351,7 +1385,7 @@ void device_links_driver_bound(struct device *dev)
 	if (defer_sync_state_count)
 		__device_links_supplier_defer_sync(dev);
 	else
-		__device_links_queue_sync_state(dev, &sync_list);
+		__device_links_queue_sync_state(dev, &sync_list, &queue_list);
 
 	list_for_each_entry_safe(link, ln, &dev->links.suppliers, c_node) {
 		struct device *supplier;
@@ -1393,14 +1427,15 @@ void device_links_driver_bound(struct device *dev)
 		if (defer_sync_state_count)
 			__device_links_supplier_defer_sync(supplier);
 		else
-			__device_links_queue_sync_state(supplier, &sync_list);
+			__device_links_queue_sync_state(supplier, &sync_list,
+							&queue_list);
 	}
 
 	dev->links.status = DL_DEV_DRIVER_BOUND;
 
 	device_links_write_unlock();
 
-	device_links_flush_sync_list(&sync_list, dev);
+	device_links_flush_sync_list(&sync_list, &queue_list, dev);
 }
 
 /**
@@ -1516,6 +1551,7 @@ void device_links_driver_cleanup(struct device *dev)
 	}
 
 	list_del_init(&dev->links.defer_sync);
+	list_del_init(&dev->links.queue_sync);
 	__device_links_no_driver(dev);
 
 	device_links_write_unlock();
@@ -1808,7 +1844,7 @@ void fw_devlink_probing_done(void)
 	class_for_each_device(&devlink_class, NULL, &sync_list,
 			      fw_devlink_dev_sync_state);
 	device_links_write_unlock();
-	device_links_flush_sync_list(&sync_list, NULL);
+	device_links_flush_sync_list(&sync_list, NULL, NULL);
 }
 
 /**
@@ -3169,6 +3205,7 @@ void device_initialize(struct device *dev)
 	INIT_LIST_HEAD(&dev->links.consumers);
 	INIT_LIST_HEAD(&dev->links.suppliers);
 	INIT_LIST_HEAD(&dev->links.defer_sync);
+	INIT_LIST_HEAD(&dev->links.queue_sync);
 	dev->links.status = DL_DEV_NO_DRIVER;
 	dev_assign_dma_coherent(dev, dma_default_coherent);
 	swiotlb_dev_init(dev);
diff --git a/drivers/base/driver.c b/drivers/base/driver.c
index 8ab010ddf709..b8f4d08bbd58 100644
--- a/drivers/base/driver.c
+++ b/drivers/base/driver.c
@@ -239,6 +239,13 @@ int driver_register(struct device_driver *drv)
 		pr_warn("Driver '%s' needs updating - please use "
 			"bus_type methods\n", drv->name);
 
+	if (drv->queue_sync_state && !drv->sync_state &&
+	    !drv->bus->sync_state) {
+		pr_err("Driver '%s' or its bus_type needs ->sync_state()",
+		       drv->name);
+		return -EINVAL;
+	}
+
 	other = driver_find(drv->name, drv->bus);
 	if (other) {
 		pr_err("Error: Driver '%s' is already registered, "
diff --git a/include/linux/device.h b/include/linux/device.h
index 56a96e41d2c9..6848b0a2c2d9 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -414,12 +414,14 @@ enum device_removable {
  * @suppliers: List of links to supplier devices.
  * @consumers: List of links to consumer devices.
  * @defer_sync: Hook to global list of devices that have deferred sync_state.
+ * @defer_sync: Hook to global list of devices scheduled for queue_sync_state.
  * @status: Driver status information.
  */
 struct dev_links_info {
 	struct list_head suppliers;
 	struct list_head consumers;
 	struct list_head defer_sync;
+	struct list_head queue_sync;
 	enum dl_dev_state status;
 };
 
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index bbc67ec513ed..bc9ae1cbe03c 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -68,6 +68,12 @@ enum probe_type {
  *		be called at late_initcall_sync level. If the device has
  *		consumers that are never bound to a driver, this function
  *		will never get called until they do.
+ * @queue_sync_state: Similar to the ->sync_state() callback, but called to
+ *		allow syncing device state to software state in a more fine
+ *		grained way. It is called when there is an updated state that
+ *		may be worth to consider for any of the consumers linked to
+ *		this device. If implemented, the ->sync_state() callback is
+ *		required too.
  * @remove:	Called when the device is removed from the system to
  *		unbind a device from this driver.
  * @shutdown:	Called at shut-down time to quiesce the device.
@@ -110,6 +116,7 @@ struct device_driver {
 
 	int (*probe) (struct device *dev);
 	void (*sync_state)(struct device *dev);
+	void (*queue_sync_state)(struct device *dev);
 	int (*remove) (struct device *dev);
 	void (*shutdown) (struct device *dev);
 	int (*suspend) (struct device *dev, pm_message_t state);
-- 
2.43.0

