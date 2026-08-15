Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7939626296
	for <driver-core@lists.linux.dev>; Sat, 15 Aug 2026 00:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786754920; cv=none; b=uvpL3oOV7MKRZ3J/jJaebnI4pKG4fkl4axusyKhFhcVpAudzqSpbDPv/tzq7P0hODZPsIh6G8jr7aTIsqH+UKUyUcRLgKFDq+GxsrjwufuooXlzB3oG9tXogdqt5i6x5Kt2jF/5zKlUAFyDTiaBDToMEL3GaGDy2aT0f+Biv8VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786754920; c=relaxed/simple;
	bh=1tIKif3P5fdyg5CZ8dhfBg/gndunLfBUaB/WNclV6oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OEmTQQy+5TGzWUObwI63F3LiQsoTZprCexHzDiOyiX/Bt2e9SppIHGxsOxzJLTN5h4VUxZcSpBhyfyy4NRbzh5UwA+E7pWfhuu1Qml2r8w5z/Pj8DIoe1r9+LK4XaAAZXFmJq7z5n9H9P7PQVXZI2aha0IMFtyJYUOE+P9TI3qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFonrKYd; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFonrKYd"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6ae9b721927so1095182eaf.0
        for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 17:48:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786754917; x=1787359717; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGeTM77wWZWsSK2KW0+uwZ5W8XboIGpTuNX+ISzK3/o=;
        b=iFonrKYd/PwZNGKfSFKVg96MVFyaObGS7LxQAYkQoOW98XRl2qTsv60dYArp95ZNpK
         7KNKkrw8YtW42Ge4UJSmarF67i1p/Mt4hHWdqTDbm9q3fnmyLAaJCRpyz2drlzYSb3zr
         I2cv2Jovn3i65Zv7h/yeNNV+7vpuNiSHX8yGmlgzYm4UHiUDxdBg2v72r4S3AmSRYqc0
         yq5A88MMpt0iTMSRsSekpnTxFsVWkN/cIfOK0Muh07mTY63JzUPRgeaT02IJsP3uPTMh
         q4VHKQqrmP/JRIBLyowTUHydKeQtsv3VJ7XhnMBvnG8qTNZQQRlp6KSUNXC6/wmRHq0e
         KGew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786754917; x=1787359717;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGeTM77wWZWsSK2KW0+uwZ5W8XboIGpTuNX+ISzK3/o=;
        b=dhuCcWPDzl4bGy1kRLgs3ZV1rov5sInm+ddF312mcEBduvlCcEPyqDkWyg3Ji+wYuc
         tH4HbR9BxvtFVHWjgQi0Ile/c/w0/pCL25SOFm7uXSn3NzmfUYs862NFKJ9IG55MpnRk
         BsX+MTU7wiOI4lLVvRYH7ILdzU6FgHRmBt/N1TM+B/RRWbjykfHBJquY5N2imW9fgj6b
         txbL9wx85y0FPz+lnt2Au2DG2CAnnCwJf4FQpeZD91//kPhS9Jn+sI+/D+boP/Vd/yji
         Fe+sSyOEqrceNnQHgikRkhEppQfYtAv14XOXOmxB4gUomA64F6WnRXnt0+kTfl0T8BM4
         2vXA==
X-Forwarded-Encrypted: i=1; AHgh+RrCRVnZMPFPYfFzhhePxKMHftQ9MqtBaxz4PFetEVpJDDGzsBylCBs/N0Bc5pOewJ23GXRpwvs7MIwZPA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxChXeaJ5DlRrYwWyZUj0s6grG2anagyG11xU+Hpnfcu+hj8l4j
	WL50xn7lcW+yTsgQuhQT3iFeFmuyIdPo666VIyL5gOKUGlHFbShqk5Vh
X-Gm-Gg: AR+sD12SfW4dmGYgo3rhUCjStecmNZHHVvviAr8kJL3Gf7I9iKRoqDS0jRAfUo5PzDQ
	a3gOUR7cG7UKTm05JJmf1g4IPwiw1OaGHnJEdv+a7XFajfk4Xfv/WRe+TIdFxP56ju2YfspS9wl
	e6vXSheWradMd8rDqbPUBn5FNl7CNYQmuF3LufbK2D7wsEhpsiA/qewkhZC5/U8YcpqFCI7+tMw
	GGwPz+yuCbQHIC4nCjzX55pyGKM7JBG9Bh4Byg324LGiQo7KRT2pUfEQgHc+aL24zSTHBiuodDc
	/1iLdNYOQ1xQyj9IhEVrcs7jtG+WMX6KsyAdurLFvDLGAsM+tTF55BbPl6+xR2mqApmOkn19hEu
	5ysgBX/0+Qwq5ZVbhkjWYmy75uNIK/w/seuJe1Lnp2Ly3hwxu5/o9ILKeMmjC7Pt7ym80JGc5/9
	ARDm2dzhqvmGYaNnww6y5aSDymoo/Y/K/G9/MUpASyMYC5c2I6v6lpol7KREtIX9OJwEJccmmqg
	crLyFDfDSIOcQ3jfr/8PeZ28pWlx0dAp89FbkazrdOKN1Iss88x6aHSCJKkh3xRhXDnGJZj/p83
	qqy6CTFDZExPSLEnIWl4UVDcbb+C+ZM6MlqzruRmgSgyfJZcQyJvFOie6TjuK0JUJ+3SCj7JAI5
	z2oBSCD3PYLMVxbXH
X-Received: by 2002:a05:6820:905:b0:6a3:f597:7552 with SMTP id 006d021491bc7-6b0d7408188mr8771074eaf.35.1786754917253;
        Fri, 14 Aug 2026 17:48:37 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b0d9574d7csm3240730eaf.2.2026.08.14.17.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 17:48:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Fri, 14 Aug 2026 18:46:15 -0600
Subject: [PATCH net-next 1/3] driver core: factor sync-state-only link
 cleanup
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-submit-phy-package-fwdevlink-v1-v1-1-2319844f057a@gmail.com>
References: <20260814-submit-phy-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com>
In-Reply-To: <20260814-submit-phy-package-fwdevlink-v1-v1-0-2319844f057a@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: Christian Marangi <ansuelsmth@gmail.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 netdev@vger.kernel.org, James Hilliard <james.hilliard1@gmail.com>
X-Mailer: b4 0.15.2

device_links_driver_bound() drops managed sync-state-only links after a
consumer successfully probes, then re-evaluates each affected supplier
for a sync_state() callback.

Frameworks which populate child devices below a driverless device need
to complete the same lifecycle step, but cannot rely on a successful
driver probe to trigger it.

Factor the existing cleanup into a lock-held helper and reuse it from
device_links_driver_bound(). Add a public locking wrapper so frameworks
which populate children below driverless devices can retire temporary
fw_devlink proxy links without affecting real dependency or runtime-PM
links.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 drivers/base/core.c    | 74 ++++++++++++++++++++++++++++++++++++++------------
 include/linux/device.h |  1 +
 2 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 4d026682944f..627fcfa274f0 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -1305,6 +1305,57 @@ static void device_link_drop_managed(struct device_link *link)
 	kref_put(&link->kref, __device_link_del);
 }
 
+/* Caller must hold the device links write lock. */
+static void __device_links_drop_sync_state_only(struct device *dev,
+						struct list_head *sync_list)
+{
+	struct device_link *link, *ln;
+
+	list_for_each_entry_safe(link, ln, &dev->links.suppliers, c_node) {
+		struct device *supplier;
+
+		if (!device_link_test(link, DL_FLAG_MANAGED) ||
+		    !device_link_test(link, DL_FLAG_SYNC_STATE_ONLY))
+			continue;
+
+		/*
+		 * DL_FLAG_SYNC_STATE_ONLY excludes all other managed link flags,
+		 * so it is safe to drop the managed link completely.
+		 */
+		supplier = link->supplier;
+		device_link_drop_managed(link);
+
+		if (defer_sync_state_count)
+			__device_links_supplier_defer_sync(supplier);
+		else
+			__device_links_queue_sync_state(supplier, sync_list);
+	}
+}
+
+/**
+ * device_links_drop_sync_state_only - Drop managed sync-state-only links
+ * @dev: Consumer device whose proxy links should be dropped
+ *
+ * Frameworks which populate child devices below a driverless device can call
+ * this after adding all of the children. The children will have acquired their
+ * own links by then, so the temporary links which only prevent suppliers from
+ * receiving sync_state() callbacks are no longer needed.
+ *
+ * Re-evaluate each affected supplier for a sync_state() callback after its
+ * link is dropped.
+ */
+void device_links_drop_sync_state_only(struct device *dev)
+{
+	LIST_HEAD(sync_list);
+
+	device_links_write_lock();
+	__device_links_drop_sync_state_only(dev, &sync_list);
+	device_links_write_unlock();
+
+	device_links_flush_sync_list(&sync_list, NULL);
+}
+EXPORT_SYMBOL_GPL(device_links_drop_sync_state_only);
+
 static ssize_t waiting_for_supplier_show(struct device *dev,
 					 const struct device_attribute *attr,
 					 char *buf)
@@ -1418,6 +1469,8 @@ void device_links_driver_bound(struct device *dev)
 	else
 		__device_links_queue_sync_state(dev, &sync_list);
 
+	__device_links_drop_sync_state_only(dev, &sync_list);
+
 	list_for_each_entry_safe(link, ln, &dev->links.suppliers, c_node) {
 		struct device *supplier;
 
@@ -1425,17 +1478,10 @@ void device_links_driver_bound(struct device *dev)
 			continue;
 
 		supplier = link->supplier;
-		if (device_link_test(link, DL_FLAG_SYNC_STATE_ONLY)) {
-			/*
-			 * When DL_FLAG_SYNC_STATE_ONLY is set, it means no
-			 * other DL_MANAGED_LINK_FLAGS have been set. So, it's
-			 * save to drop the managed link completely.
-			 */
-			device_link_drop_managed(link);
-		} else if (dev_is_best_effort(dev) &&
-			   device_link_test(link, DL_FLAG_INFERRED) &&
-			   link->status != DL_STATE_CONSUMER_PROBE &&
-			   !dev_can_match(link->supplier)) {
+		if (dev_is_best_effort(dev) &&
+		    device_link_test(link, DL_FLAG_INFERRED) &&
+		    link->status != DL_STATE_CONSUMER_PROBE &&
+		    !dev_can_match(link->supplier)) {
 			/*
 			 * When dev_is_best_effort() is true, we ignore device
 			 * links to suppliers that don't have a driver.  If the
@@ -1449,12 +1495,6 @@ void device_links_driver_bound(struct device *dev)
 			WRITE_ONCE(link->status, DL_STATE_ACTIVE);
 		}
 
-		/*
-		 * This needs to be done even for the deleted
-		 * DL_FLAG_SYNC_STATE_ONLY device link in case it was the last
-		 * device link that was preventing the supplier from getting a
-		 * sync_state() call.
-		 */
 		if (defer_sync_state_count)
 			__device_links_supplier_defer_sync(supplier);
 		else
diff --git a/include/linux/device.h b/include/linux/device.h
index aee79fd6b32b..8afb9f2b0d82 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1381,6 +1381,7 @@ struct device_link *device_link_add(struct device *consumer,
 				    struct device *supplier, u32 flags);
 void device_link_del(struct device_link *link);
 void device_link_remove(void *consumer, struct device *supplier);
+void device_links_drop_sync_state_only(struct device *dev);
 void device_links_supplier_sync_state_pause(void);
 void device_links_supplier_sync_state_resume(void);
 void device_link_wait_removal(void);

-- 
2.53.0

