Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB2423A562
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 00:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775177503; cv=none; b=RVLadBrSCstuaxi3MzECGKDxfMVaOoCHJK+eNcNGzhoq5WcJLEocUToBkvBVmLFmlwGHraIsDWPrE/KPl7VF8XbwRdciLWgQ0sxcuaCMqf5zQyLKAU0rN/SQPFWtMBi0ttkJlgG7vn+4CBZ1VHmY0riB8wfc2NvBhvEIfIUsKJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775177503; c=relaxed/simple;
	bh=Bo2GWZohNn292lukZgzff2DpfwhmF9Z6e0841aFT4Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZuHDZYkwZK+minuiVek6SPwA+XGaaMz99h8uGPSZg4FxczbrlpREEmlVOAfD1j9ZAjCNhLY74jzozxsTu4+17WgB/UmYZMy+1jb1QWDLphBJau44tvL3sbjPimevyYTGwsj+u2qJLXS35rFgryFX2UztH6hj1Ja/w4PJVSjda6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mDeFfPDN; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mDeFfPDN"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c15849aa2cso1763348eec.0
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 17:51:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775177501; x=1775782301; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XoCbtVdJT6LJXHOLiB7SAxTxtsznK4H2L8Y6Y6a13vM=;
        b=mDeFfPDN9rtDDfkKTwiEQIvOPOWb5IalWsuZvKYToPnO/JrFbSqDE4mtM6LRe83jVt
         qWbGvh2U8BvEhLhnkl++jU7ixtnaHzv496ItsLXTA0xtvl2L3ZFHda+RHNxIZXL+mlOg
         fc6AvQlR0iUqlT/pvc/0Bd5QKP/jbsEC61ZbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177501; x=1775782301;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XoCbtVdJT6LJXHOLiB7SAxTxtsznK4H2L8Y6Y6a13vM=;
        b=sxCo62XqhSJqPW3o1kkUopsadxrMcigXCpmZW5OxLNam0lPy4Gctzu3jDI7WMl1w/q
         zJuKq7oYH+FNI8rFcuz49ynBV5GVWgQwfia7SGM98hWZlZMMJJFQElHbA3tpi4y6c1vD
         xaVfD4TShAwDVhArK//xcd8y7EJuaX3AlSINL6/DHoh2fp84/FTJiRC4hKTWudWp257P
         QQddIVpRsXpCtg9tvnti+HkuSgjdWZf3WmYc+KuOB/lrlwPwyAktcHQhraFtutHWotfI
         +E2gcRHsJL3AZV0T7LHY/WEz5TQVEOTRoHowJ+zbG9KgyK7szCpMYYGLvUyXNjosm8Vz
         eiLw==
X-Forwarded-Encrypted: i=1; AJvYcCWGiokJP0psEWLroFtzvev5vWZzL02NAXWQJzpr1p+pqcVrbS70oBxENxR8LqejEeYnojvv2SHHcHKIsA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwSuwAb7yg0rmRbLPXr/+lDqZBepLNTbPMjjbx8ze0qQtAHBRmL
	lIHFlqWgRXRMQSpfjfpUiQXFFG5/mDGW60AUYGn4QbXDzbFrlVvwUXlZCV3xb29UrQ==
X-Gm-Gg: AeBDieuebjIY78OU++67d/FpVzWVaIL2e7WLTc1ZX8A1I/N2CnOra98jZ1P9GNC9Cjl
	l3BSQBoviPkrd+XfMKvr7lvTtwEjnVLH9lCPw3ldqKi2PREk2vcJg2V4yvG31rCb1XENZqAUpsK
	gkO9Q0ypMBEGCwkWTe/e6nvXIxR8ex85CXR9yZwJopyrthJ6F6HtGfbt622CQIzTGfzvHchGRDY
	OKJ5xocXIflSthCHl8PvF/WZ0viNXDhLYRqZmKDC4zc0joMd1I9IXlh9xxbc1jg5J5NDhp6C0Fh
	HdV3jBQyg+Idw9sDp/NvjH2ZHGbXq2CYu9FWdo0t6B2TJiRu1ccE7VJjtUzvnO0m17zHrhO8CFA
	0Qx+oNmxNEtbfkBB/2wr7ZkO+Aa7pYRQ+HDFJN+sniuf0XFLVx46MG/9J2sHEr25GV5cvTnw+0a
	8ljhTzjHwqJUYK4nPibsvvplqakvX7CnSt1xY1cIfH5V/QmUq6lDbz798AVaa0NpaLBhePx9e3E
	OInmo+UGJ8=
X-Received: by 2002:a05:7300:fd05:b0:2c0:d46d:cfc2 with SMTP id 5a478bee46e88-2cbfbe7d5e0mr573537eec.23.1775177501410;
        Thu, 02 Apr 2026 17:51:41 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:5db3:7542:a530:f43a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df3b84sm3630074eec.5.2026.04.02.17.51.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:51:39 -0700 (PDT)
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
Subject: [PATCH v3 2/9] driver core: Replace dev->can_match with DEV_FLAG_CAN_MATCH
Date: Thu,  2 Apr 2026 17:49:48 -0700
Message-ID: <20260402174925.v3.2.I54b3ae6311ff34ad30227659d91bb109911a4aea@changeid>
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
threads without locking. Switch "can_match" over to the "flags" field
so modifications are safe.

Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

Changes in v3:
- New

 drivers/base/core.c    | 10 +++++-----
 drivers/base/dd.c      |  8 ++++----
 include/linux/device.h |  8 ++++----
 3 files changed, 13 insertions(+), 13 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 8d4028a2165f..cbdfee887833 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1011,7 +1011,7 @@ static void device_links_missing_supplier(struct device *dev)
 
 static bool dev_is_best_effort(struct device *dev)
 {
-	return (fw_devlink_best_effort && dev->can_match) ||
+	return (fw_devlink_best_effort && test_bit(DEV_FLAG_CAN_MATCH, &dev->flags)) ||
 		(dev->fwnode && (dev->fwnode->flags & FWNODE_FLAG_BEST_EFFORT));
 }
 
@@ -1079,7 +1079,7 @@ int device_links_check_suppliers(struct device *dev)
 
 			if (dev_is_best_effort(dev) &&
 			    device_link_test(link, DL_FLAG_INFERRED) &&
-			    !link->supplier->can_match) {
+			    !test_bit(DEV_FLAG_CAN_MATCH, &link->supplier->flags)) {
 				ret = -EAGAIN;
 				continue;
 			}
@@ -1370,7 +1370,7 @@ void device_links_driver_bound(struct device *dev)
 		} else if (dev_is_best_effort(dev) &&
 			   device_link_test(link, DL_FLAG_INFERRED) &&
 			   link->status != DL_STATE_CONSUMER_PROBE &&
-			   !link->supplier->can_match) {
+			   !test_bit(DEV_FLAG_CAN_MATCH, &link->supplier->flags)) {
 			/*
 			 * When dev_is_best_effort() is true, we ignore device
 			 * links to suppliers that don't have a driver.  If the
@@ -1758,7 +1758,7 @@ static int fw_devlink_no_driver(struct device *dev, void *data)
 {
 	struct device_link *link = to_devlink(dev);
 
-	if (!link->supplier->can_match)
+	if (!test_bit(DEV_FLAG_CAN_MATCH, &link->supplier->flags))
 		fw_devlink_relax_link(link);
 
 	return 0;
@@ -3708,7 +3708,7 @@ int device_add(struct device *dev)
 	 * match with any driver, don't block its consumers from probing in
 	 * case the consumer device is able to operate without this supplier.
 	 */
-	if (dev->fwnode && fw_devlink_drv_reg_done && !dev->can_match)
+	if (dev->fwnode && fw_devlink_drv_reg_done && !test_bit(DEV_FLAG_CAN_MATCH, &dev->flags))
 		fw_devlink_unblock_consumers(dev);
 
 	if (parent)
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 3aead51173f8..66df31696349 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -132,7 +132,7 @@ static DECLARE_WORK(deferred_probe_work, deferred_probe_work_func);
 
 void driver_deferred_probe_add(struct device *dev)
 {
-	if (!dev->can_match)
+	if (!test_bit(DEV_FLAG_CAN_MATCH, &dev->flags))
 		return;
 
 	mutex_lock(&deferred_probe_mutex);
@@ -860,7 +860,7 @@ static int __driver_probe_device(const struct device_driver *drv, struct device
 	if (!test_bit(DEV_FLAG_READY_TO_PROBE, &dev->flags))
 		return dev_err_probe(dev, -EPROBE_DEFER, "Device not ready to probe\n");
 
-	dev->can_match = true;
+	set_bit(DEV_FLAG_CAN_MATCH, &dev->flags);
 	dev_dbg(dev, "bus: '%s': %s: matched device with driver %s\n",
 		drv->bus->name, __func__, drv->name);
 
@@ -1006,7 +1006,7 @@ static int __device_attach_driver(struct device_driver *drv, void *_data)
 		return 0;
 	} else if (ret == -EPROBE_DEFER) {
 		dev_dbg(dev, "Device match requests probe deferral\n");
-		dev->can_match = true;
+		set_bit(DEV_FLAG_CAN_MATCH, &dev->flags);
 		driver_deferred_probe_add(dev);
 		/*
 		 * Device can't match with a driver right now, so don't attempt
@@ -1258,7 +1258,7 @@ static int __driver_attach(struct device *dev, void *data)
 		return 0;
 	} else if (ret == -EPROBE_DEFER) {
 		dev_dbg(dev, "Device match requests probe deferral\n");
-		dev->can_match = true;
+		set_bit(DEV_FLAG_CAN_MATCH, &dev->flags);
 		driver_deferred_probe_add(dev);
 		/*
 		 * Driver could not match with device, but may match with
diff --git a/include/linux/device.h b/include/linux/device.h
index 5b7ace5921aa..7e5737c6d7d1 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -465,9 +465,13 @@ struct device_physical_location {
  *
  * @DEV_FLAG_READY_TO_PROBE: If set then device_add() has finished enough
  *		initialization that probe could be called.
+ * @DEV_FLAG_CAN_MATCH: The device has matched with a driver at least once or it
+ *		is in a bus (like AMBA) which can't check for matching drivers
+ *		until other devices probe successfully.
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE,
+	DEV_FLAG_CAN_MATCH,
 };
 
 /**
@@ -552,9 +556,6 @@ enum struct_device_flags {
  * @state_synced: The hardware state of this device has been synced to match
  *		  the software state of this device by calling the driver/bus
  *		  sync_state() callback.
- * @can_match:	The device has matched with a driver at least once or it is in
- *		a bus (like AMBA) which can't check for matching drivers until
- *		other devices probe successfully.
  * @dma_coherent: this particular device is dma coherent, even if the
  *		architecture supports non-coherent devices.
  * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for the
@@ -673,7 +674,6 @@ struct device {
 	bool			offline:1;
 	bool			of_node_reused:1;
 	bool			state_synced:1;
-	bool			can_match:1;
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
-- 
2.53.0.1213.gd9a14994de-goog

