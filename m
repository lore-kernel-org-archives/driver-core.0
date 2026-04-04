Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F08D145348
	for <driver-core@lists.linux.dev>; Sat,  4 Apr 2026 00:07:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261247; cv=none; b=XfQjfq2MA1wf1FEKN/lI5QkSzWQbqwnODN0qNeisSo7L+etRP8Hdl1Fi4dvN+gJnBzMtdsXn5E6yqdAS70YSCjsMOym3p0lquwlZ9MYshtnmNA+M/RqtVPrPPqPrhQEfghaQKyUNMnzFPBDsPQXqy8BNNt6NbJBrZ7LKVscamUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261247; c=relaxed/simple;
	bh=JY7h+w0GKt4GsXMg76jK5zvh+LiKytkPd1+jRUhDFvA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=htf1XBF52U5wKJ8EFGhsem8S6E2bmN9Xd1tMEmIyEPQIl097WvMKVIvRK7GjwGqQmDBy6IpwcMW6rEMSY3iUYkFvE4RFQmSw9P5tlgXRL9EJLWQuDACi9YUTz81MAypzqpeQuBSwItlsScpbOKsrHOCaJoShVwY+R17Ouw5nLK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ug6xDBio; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ug6xDBio"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c156c4a9efso2737508eec.1
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 17:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775261245; x=1775866045; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y7NMSciOmg5XkKsUSZgnNDTKkHjdVzk1T1Rc96+x1Ko=;
        b=Ug6xDBiosBH8Lbs65aD6GpqRAl5d+7r8Tf2lMEJnehWh81AtnUO+u5O5U8AF2fTdkn
         i3ZBRvnJmoUKvDhP6R9DiKQKsXqrqCIPnF+eA84Ggex7ms43rUDUI5khQblbfMyySro6
         GOM0XMu2dW81Vx7TAFmTqZlDZ1tiTCCxUoeWE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775261245; x=1775866045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y7NMSciOmg5XkKsUSZgnNDTKkHjdVzk1T1Rc96+x1Ko=;
        b=gGktF6sqxjQFV+LhwvnSPSQf+Y1CNQgf2RpSk+/QOr19AZx/zDSlsQyVRdfA1S66fx
         9jYlV8taynOOHHRFKMdKHwuDZMY856H+Tjk2J8e3VWxujTPVa0q0eOhCHMvDCbW++90O
         RYuEt90LA3l39pzd2atbVwEDmW0OCjsld7tiQNX6PGJPZW6+JUOd1y481fLotLCLRAK+
         Rcr0bfpYqF5owjuWogMLJmDy51W6eW7F8REkoHLGVIABwiHFLsoOHXXeuNMyaMgoM7kN
         O7frodEIgmJr1vO+cNfM3D6P7bPVLfUCim7mamWGghO9s2wVuS7hdCJXs5/YUSPtNV8A
         Y8RQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG8pQqp3tCvtU2kU/SkMQTEzP2GpBMB6/t7MxomB7AcAtsJ50XmWQ88qQfhAwV4pyCekNGefn4b+CGwA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAq7cxBtSbwwRnO8+c2WFPXdlj7nWbD7aOoXJYxqdegV2BE8fq
	BnbKVur0tOpWjQr84iRiK8HQCey9OBP1mJ9X5B3SeiZOIQpTxiZ2d36QJxMUltLX6g==
X-Gm-Gg: AeBDiesElVPlsO0juRQtk2z0DLxnkeAWlTh3gWaPDeWMBf5cEo6irsOsMLxoZ0ir4BE
	2ZbDghbM/esMW9+88KHL8S0YYjff9KPVOzwLPcRnqDy56ZVaq0ie1tSfvzxV0iHIuS78KRFyUaZ
	pwTL5rst7NUoCbYrfwB2PEnoWVA2ZNY3VZrZaivmFywqRAHPliZEdorqDw+iXHj7dhaQn+xcb4x
	VpAT2xfDcEAB6BHnT9roKR9ZNkvPdfu+jbR2Ea5aUKrV7rtQJfaHsoRCyCnMq0YS8oFZPVROvFN
	keulU2bJDkhftIzy+q6dqPZIy09er4r0kB4gzQawKNlZUlz70ZCjKmXwM05pMix+EQs+YD3LQF0
	1fVDPksqy1W/5ULKilw9xQTmaCSw116Wn0htsue0mk0HdN4F3RsBlwLmVremgBpX/KbH3ittcQu
	nvtIs0561+iVJZFojc3TitHMA0VMsv9CpwTDu98edv+bPDWPUPF9PTarLTd0GIG11JjpQMrrtgx
	RZOttTPS2o=
X-Received: by 2002:a05:7300:6d23:b0:2a4:3593:466c with SMTP id 5a478bee46e88-2cbf9fe2d96mr2541861eec.8.1775261244759;
        Fri, 03 Apr 2026 17:07:24 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:a8b6:55b2:3eb6:2c0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca79e1d93bsm6520716eec.12.2026.04.03.17.07.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 17:07:23 -0700 (PDT)
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
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/9] driver core: Replace dev->can_match with dev_can_match()
Date: Fri,  3 Apr 2026 17:04:56 -0700
Message-ID: <20260403170432.v4.2.I54b3ae6311ff34ad30227659d91bb109911a4aea@changeid>
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
threads without locking. Switch "can_match" over to the "flags" field
so modifications are safe.

Cc: Saravana Kannan <saravanak@kernel.org>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

Changes in v4:
- Use accessor functions for flags

Changes in v3:
- New

 drivers/base/core.c    | 10 +++++-----
 drivers/base/dd.c      |  8 ++++----
 include/linux/device.h |  9 +++++----
 3 files changed, 14 insertions(+), 13 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index f07745659de3..8acf7f684417 100644
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
@@ -3708,7 +3708,7 @@ int device_add(struct device *dev)
 	 * match with any driver, don't block its consumers from probing in
 	 * case the consumer device is able to operate without this supplier.
 	 */
-	if (dev->fwnode && fw_devlink_drv_reg_done && !dev->can_match)
+	if (dev->fwnode && fw_devlink_drv_reg_done && !dev_can_match(dev))
 		fw_devlink_unblock_consumers(dev);
 
 	if (parent)
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 8ec93128ea98..c7c0851ae073 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -132,7 +132,7 @@ static DECLARE_WORK(deferred_probe_work, deferred_probe_work_func);
 
 void driver_deferred_probe_add(struct device *dev)
 {
-	if (!dev->can_match)
+	if (!dev_can_match(dev))
 		return;
 
 	mutex_lock(&deferred_probe_mutex);
@@ -860,7 +860,7 @@ static int __driver_probe_device(const struct device_driver *drv, struct device
 	if (!dev_ready_to_probe(dev))
 		return dev_err_probe(dev, -EPROBE_DEFER, "Device not ready to probe\n");
 
-	dev->can_match = true;
+	dev_set_can_match(dev);
 	dev_dbg(dev, "bus: '%s': %s: matched device with driver %s\n",
 		drv->bus->name, __func__, drv->name);
 
@@ -1006,7 +1006,7 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
 		return 0;
 	} else if (ret == -EPROBE_DEFER) {
 		dev_dbg(dev, "Device match requests probe deferral\n");
-		dev->can_match = true;
+		dev_set_can_match(dev);
 		driver_deferred_probe_add(dev);
 		/*
 		 * Device can't match with a driver right now, so don't attempt
@@ -1258,7 +1258,7 @@ static int __driver_attach(struct device *dev, void *data)
 		return 0;
 	} else if (ret == -EPROBE_DEFER) {
 		dev_dbg(dev, "Device match requests probe deferral\n");
-		dev->can_match = true;
+		dev_set_can_match(dev);
 		driver_deferred_probe_add(dev);
 		/*
 		 * Driver could not match with device, but may match with
diff --git a/include/linux/device.h b/include/linux/device.h
index 5eb0b22958e4..5e42261ba3aa 100644
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
 
 /**
  * struct device_link - Device link representation.
-- 
2.53.0.1213.gd9a14994de-goog

