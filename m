Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A82B35959
	for <driver-core@lists.linux.dev>; Sat,  4 Apr 2026 00:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775261258; cv=none; b=N1DLC19TYaWhRBkcrqpOrg87ZKdZcdUkGkh3F3llVHZXcr9nZVKEZpzeczwRCVvdiI3+Zul7Dq/wlh11tNyoLY31xqQuxyhy18AAHXLqIfUE63RyAyXum6VVfLYy0V+HUwXBzykKfdXQGhXi+SOcGcu68h2mC390HS8qLeySxp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775261258; c=relaxed/simple;
	bh=TgyyhRKZN/WoCmiVaktIxTAO95/iAlKYAoCl7YuTmec=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q7Rg7l/QciVebnBAPT+zm2l7abtQ0plREHFb4CrGM2WsEDDM3rVWLBtFW7kVMsh9vMSH8tJHiazG0L1szpjlvQOPso5Gv/PsGTB8WVG0a6ZCAWRuU5odPP8c4N4Nc4RBXGJ6yhJAZ/dOl0xPYuGKM0sen5fNpKU2CAW05hAhulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m0/Rrg1Y; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m0/Rrg1Y"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c4db6bca03so1216200eec.1
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 17:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775261257; x=1775866057; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRammz33zgALoDB0EK8vTnIXAeS5Kg+fXRfCOEnRqe0=;
        b=m0/Rrg1Yci98zrVsC5NL0a0tJjwTsO3iEc4IB31hF6QTHX5IcH2SI2aPl+AhbD40es
         aQQkwgA6izrdgXVtK4Maimt2GqfkQNLfXnmbViXKk3pIyZERlHmw35lHOIibAoIaDS3r
         wyHxwncRSmE2CXg6ZGD3YHT1jUwt+pmsFspNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775261257; x=1775866057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SRammz33zgALoDB0EK8vTnIXAeS5Kg+fXRfCOEnRqe0=;
        b=hkq+uLiMOHxUPtCEZJ90oEjg7lCQ5HmkN3R/tz5LWIEDWITjEbWWLKMzDVY/5On4f5
         6R94fu488x6clHjTGP0Azgn/TJfK9dvZBTmYvBoE/XGM5hLGn8y7v1PPuoCplsNO2g8r
         dhWq9DX9ckOYjtrI9AOOm+4fhruGaVuvLB+a4EMxhE/e9kXUOs2dwuV4HfDdFsFkW+6R
         JvKVGfgbWvqoQQpMxR4xO3vRR0fA9GeMcOoy4RKotCqvL0LUXwTbQrbM5CleWM5G8UwM
         cgvkM6Spnqq0Fopq35L21+w9ww/VRFmM80E0YXPIsxHxBmQJPT2HRaUM+8cTyl8C91tD
         CoDQ==
X-Forwarded-Encrypted: i=1; AJvYcCVe3OFd0G9l7bsZ+7ff0+d5nnqP/aYzPkIbLZkgknXCs0icCZL8AvZD126ZnWCDRiWJJDuMGgop7lBFiA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzMpI5RE+8e17x5nLsBtWpCFdxEA/y06+3C2CWtFs4SXuRD3jKn
	FXtDB0itFczv/MsR17YIAykigPtUL+RgjWyzjMKCDbsfGSFhp5Eb9YuX9CcKy/MV6w==
X-Gm-Gg: AeBDievsr7OMsvnhJbrcDmYbtC/gTA5vZI41jJtw0i3+5BnD5o/1N4AJf9JbLhicE/1
	mUbTiawocnBI31TDoTiJyP/wL3vcpJo/kYO9Vjj5mPnMups/oIZFr3aPwdsDMB576m+7HiwyXoX
	hnV5BNeZCP1dP+dyMcIKFIHhlUTnSYN9Ij7IFd2HfkhN4RHpehL/I140oRouLZW3KfP1hw0f9xB
	NNcZujD0+tiQ+rWZnn3WEi9QDADcGmKWWn4PPlKPv0u/TgHohoVWpaWJIg8+2tzwK+yXRiS4J5l
	1OOhwLiEOSgpZukmrpy/7aL6LS5e56PmmoSh2lb1E6ZpSRhfxDOLqzk/kepHXrsdR7qZ5AC5vrH
	oyJPaWZkBSNO/NqjRujRTHF9xvL6mH9Ynt79f6ggOh79lKjsEiTHRmEDQyV/+C9ib7l0SPBdKl/
	j40Oqdd6l4XOvdl4NP1vlrhFJML2BZmJ4zAtX+5j0jEgYZ0rIAiXaIMPzOHPdol3HyXEiQGVa84
	osgwwf2Jew=
X-Received: by 2002:a05:7300:fd05:b0:2c1:67e1:61a9 with SMTP id 5a478bee46e88-2cbfba8de38mr2116743eec.13.1775261256542;
        Fri, 03 Apr 2026 17:07:36 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:a8b6:55b2:3eb6:2c0e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca79e1d93bsm6520716eec.12.2026.04.03.17.07.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 17:07:34 -0700 (PDT)
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
Subject: [PATCH v4 6/9] driver core: Replace dev->state_synced with dev_state_synced()
Date: Fri,  3 Apr 2026 17:05:00 -0700
Message-ID: <20260403170432.v4.6.Idb4818e1159fef104c7756bfd6e7ba8f374bebcd@changeid>
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
threads without locking. Switch "state_synced" over to the "flags"
field so modifications are safe.

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

 drivers/base/core.c    | 8 ++++----
 drivers/base/dd.c      | 8 +++-----
 include/linux/device.h | 9 +++++----
 3 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 8acf7f684417..0986051a6f14 100644
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
index c7c0851ae073..e1132690652f 100644
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
index 2ce89e3cfab9..a1d59ff9702c 100644
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
 
 /**
  * struct device_link - Device link representation.
-- 
2.53.0.1213.gd9a14994de-goog

