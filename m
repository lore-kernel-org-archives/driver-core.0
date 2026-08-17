Received: from mail-oi1-f170.google.com (mail-oi1-f170.google.com [209.85.167.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F37A3B1EE2
	for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 00:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786924841; cv=none; b=i19kNcRseURd9wUEfpga9/tfO87OSYU3Yw9hQPuvE/kuhWs1sKnSwEyONxJZ2Vrr1K+pMlv9SZvMC0fX99wj/S8ubLhJVmJXMOmHXRLztFQWkr/9Ws5NJdINCGxbtdCeRsXTIBjgOvoLdluGIYk0D/kRzUEKzlUiM0feuKEdLSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786924841; c=relaxed/simple;
	bh=1tIKif3P5fdyg5CZ8dhfBg/gndunLfBUaB/WNclV6oE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oEk/7erAbGEdta5AtnANJsm6pB99nPPlHaKjaMqEzfQkHp+qN8OeQvLOibLJj8u8xZgI+wQKa7U5SUZ3/hxu9rmgeVwQLjuV9uORKdD4kQbjhNGBZyH3MvLb2aqosjEyqU8X1zG6Ti8C01k6rCROMVn01k6VdaTTLX+2yDQVKi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQwFzPkc; arc=none smtp.client-ip=209.85.167.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQwFzPkc"
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-4b1be215736so1837556b6e.1
        for <driver-core@lists.linux.dev>; Sun, 16 Aug 2026 17:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786924838; x=1787529638; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RGeTM77wWZWsSK2KW0+uwZ5W8XboIGpTuNX+ISzK3/o=;
        b=ZQwFzPkcynDelimQAr/Nk2ZVnlbG8jqwOskSm/dx5qNA2ANnxjHvLApE5HhbH1PTab
         LFRDG/TGZaozZ6ocs/0HsV0o9qBM0pPRNKpRHW1J2kxE4TptLoSdGKq0VH7xpDTjBJzL
         qS3IXnYvezSR8vFsfvi/eO/f3EDOCYyw0EBmZF/bS3B9kksAXJVEO/dS/S3AW8Dv/Ilh
         Yb5fx5by6+iluzYerU3MZ+iBxCf0wHrvGztfUt1sg51xmh8qiyCJDsstAXxRoYEdZRXT
         dkBlwND1F88b7C1MAhRDFU5ih/drfK2dES0yDRvMOV6LYnK5tUI08eoNQYTHbnuMMups
         H6Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786924838; x=1787529638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RGeTM77wWZWsSK2KW0+uwZ5W8XboIGpTuNX+ISzK3/o=;
        b=eWOtSiRN+ZBaA6AusyckArZfaiGCLsbxoxSdw7jY7o9of8BGWSQ+i71IT2aupfDqLE
         +aD22mgvkgdtfFCk1goyNpTCJp4CNKreilklGnQI46fFfDLn3aW6QSWR1iHmS7sxjJcd
         VkzTYAs+syWW5AfhiYjT43KCcR8fHUOuviRgIGg0+mkcwSY9j5Krjb8E2nYYSiCGnzcC
         zB0s19usFigM2V9WluNHvquwrXZoVCpYD6wF2qPGSzePHsSmemwMAgkX76gHRt8TpESc
         JRKQ4xF9RAQDszisixWnvGB5wA9oDxOxQKMxY5dIH6D/XHQIZnKR5ti3mxLe1ZCcCeAU
         j5LA==
X-Forwarded-Encrypted: i=1; AHgh+RrsfSHb1mDlfKB7sHqclqT+TZTTKLx4CYbh6UA7EgRbH3ZSG0HcL9TdGaBDxwm5fz9PC99K1S3Yo11+dw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOx402CmUpFB3CFSkmiZy0gSsiaj2YVO5/Z/eertKSkq+ZJ9Aq
	pmW2+eGnWaZDCkKA87XKDe9nA95ySO48JBwYgQXA9CzF8KMjfS7zBnrN
X-Gm-Gg: AR+sD11pQaEVyczKFOqNI8Ilac8WLEtN4vVG0P8/97oTNA9NTVKP8vX+1XVCppTW2iv
	EazejEmVsBPGCCNFPed0TsRk2v2kV4nFNaybd98CMvdpVvgz763uij4AzNu6xL6AT3cIQ+7lDfg
	I5DOBF3mq8htB/FClTqeu+LWL+Xu+JULFm4kb/tR744wXSwjzVWTs7SBU4KG1jR3NrfTtQ8/4Ii
	ugDHv87NHd9r9M+zV2RCxjRabBbjmBZmiMeWMF6z0yxXli+TkRPOzhrUCT8DB7DKBzNS0alKqwh
	eVt09qO3GNf8uELrbtYyBFUy2xF1pOZXkzgS8Xtf9c4PDAPm0Y4tiCMbAB/guuRljSpTtlwv8oS
	UsKgNjlw3UqaeilId9rZgD+W+zKq9rGH/IIDDcgeppTS280zxTkk2NwngIsPTSIXcGM1s4TuSDx
	M+KT5T/mU2gBbFAltBzoaR3XOq+KpY82JdSOq4OFhr8kbl1auw0Zvw4oB59E/MjZ6DPIdkiSGTx
	4Zo0/EUqRVo36vPtLGJTs0wjWDjsIqiR7bcTrCXp3U0YSgQ77b1y5h0obq3H0qTU65FhPJguwVK
	Oqpbwy+mLcOUOv0+CemLiTVkNbrFEMJNKkM/duGqc0WmuMz1V2psbVPNKzqCY0geunYAFS66wzC
	Iwp+qR8VvUGPRZsU5
X-Received: by 2002:a05:6808:238d:b0:4b1:b037:da8b with SMTP id 5614622812f47-4b241b9d07fmr18056158b6e.11.1786924837907;
        Sun, 16 Aug 2026 17:00:37 -0700 (PDT)
Received: from [127.0.1.1] (184-96-154-59.hlrn.qwest.net. [184.96.154.59])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2714dc18asm2556802b6e.17.2026.08.16.17.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 17:00:37 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Aug 2026 18:00:29 -0600
Subject: [PATCH net-next v2 2/4] driver core: factor sync-state-only link
 cleanup
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260816-submit-phy-package-fwdevlink-v1-v2-2-23e55dd59fad@gmail.com>
References: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
In-Reply-To: <20260816-submit-phy-package-fwdevlink-v1-v2-0-23e55dd59fad@gmail.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Lunn <andrew@lunn.ch>, Christian Marangi <ansuelsmth@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, netdev@vger.kernel.org, 
 James Hilliard <james.hilliard1@gmail.com>
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

