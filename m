Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC64C37BE80
	for <driver-core@lists.linux.dev>; Wed,  8 Apr 2026 19:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775676656; cv=none; b=jfYfAmtX2JKJNOKVAYS9KLs5hKsE1cRrlTM2ZA+lNg/J6QhTe+yRMXQrcWFXFSXVxYSYn0HPVj1NuoLWTvlTgWh2dCKoKoIWJZDgPdyTDETBiac0FxUnoKApzcq6u/ZuKBMdXgHZA8JZJVtM5wY/x1aGmUzww1BSxKJ6hS6m6W8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775676656; c=relaxed/simple;
	bh=6hwBbCkSpU4vJNM/DAUBPxXilF6YuGEwR/N51hFz5QU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qp1Rxyn+8kilpEFTWCVEbhovquDmlJdWQlFJjtb9GDtWVCIo3ePDiFlMPnZviGzI0lnsuyTauPnKC8LgUB+UGfC5OMdF26rOpEBgOdnYFIgMtCpC+ne7ZUY/ORP6fL5w4p8PGFj3ubswJeLWSHNbJ+V1EuHKOUKtlu3sPXIQYwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Ye+ib3kR; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Ye+ib3kR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775676649;
	bh=6hwBbCkSpU4vJNM/DAUBPxXilF6YuGEwR/N51hFz5QU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Ye+ib3kRdA57vx/7nVEPLP0qxFCB0HaGR7SFYrpPemRjqInVoQh89bDz6UFmmeX4f
	 5RWXIEgRljiA8IZR9DuE0BrP39auw5QKt2xjNJEtOobFgLMV/W5tVQ/Hj6y4VUUcDF
	 mDTdNCssK9wopT2nToFf+1eDQTTNv5PlLpBjKcKg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 08 Apr 2026 21:30:50 +0200
Subject: [PATCH 4/5] driver core: Allow the constification of device
 attributes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-sysfs-const-attr-device_attr-prep-v1-4-232934f77b3c@weissschuh.net>
References: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
In-Reply-To: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775676649; l=5144;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=6hwBbCkSpU4vJNM/DAUBPxXilF6YuGEwR/N51hFz5QU=;
 b=uvjkhcbUwJMEP/tPwvklh4s0OsNG7X2m5d/LizfTgQmK7mlW6XpyeFATEU/Q1lW21cJvvh4iK
 sckNf2bgLrcAEmS6uIyUnyW2OcmRI6q0b0f7tRuOi3LDsgDDeyVPdgs
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Allow device attribute to reside in read-only memory.
Both const and non-const attributes are handled by the utility macros
and attributes can be migrated one-by-one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/base/core.c    | 12 ++++++----
 include/linux/device.h | 62 +++++++++++++++++++++++++++++++++++++++++++-------
 2 files changed, 62 insertions(+), 12 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 763e17e9f148..8a48cb2137ae 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -2419,9 +2419,11 @@ static ssize_t dev_attr_show(struct kobject *kobj, struct attribute *attr,
 
 	if (dev_attr->show)
 		ret = dev_attr->show(dev, dev_attr, buf);
+	else if (dev_attr->show_const)
+		ret = dev_attr->show_const(dev, dev_attr, buf);
 	if (ret >= (ssize_t)PAGE_SIZE) {
-		printk("dev_attr_show: %pS returned bad count\n",
-				dev_attr->show);
+		printk("dev_attr_show: %pS/%pS returned bad count\n",
+				dev_attr->show, dev_attr->show_const);
 	}
 	return ret;
 }
@@ -2435,6 +2437,8 @@ static ssize_t dev_attr_store(struct kobject *kobj, struct attribute *attr,
 
 	if (dev_attr->store)
 		ret = dev_attr->store(dev, dev_attr, buf, count);
+	else if (dev_attr->store_const)
+		ret = dev_attr->store_const(dev, dev_attr, buf, count);
 	return ret;
 }
 
@@ -3048,10 +3052,10 @@ int device_create_file(struct device *dev,
 	int error = 0;
 
 	if (dev) {
-		WARN(((attr->attr.mode & S_IWUGO) && !attr->store),
+		WARN(((attr->attr.mode & S_IWUGO) && !(attr->store || attr->store_const)),
 			"Attribute %s: write permission without 'store'\n",
 			attr->attr.name);
-		WARN(((attr->attr.mode & S_IRUGO) && !attr->show),
+		WARN(((attr->attr.mode & S_IRUGO) && !(attr->show || attr->show_const)),
 			"Attribute %s: read permission without 'show'\n",
 			attr->attr.name);
 		error = sysfs_create_file(&dev->kobj, &attr->attr);
diff --git a/include/linux/device.h b/include/linux/device.h
index 714e36d610e3..a529a8eaaa9a 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -104,10 +104,18 @@ struct device_type {
  */
 struct device_attribute {
 	struct attribute	attr;
-	ssize_t (*show)(struct device *dev, struct device_attribute *attr,
-			char *buf);
-	ssize_t (*store)(struct device *dev, struct device_attribute *attr,
-			 const char *buf, size_t count);
+	__SYSFS_FUNCTION_ALTERNATIVE(
+		ssize_t (*show)(struct device *dev, struct device_attribute *attr,
+				char *buf);
+		ssize_t (*show_const)(struct device *dev, const struct device_attribute *attr,
+				      char *buf);
+	);
+	__SYSFS_FUNCTION_ALTERNATIVE(
+		ssize_t (*store)(struct device *dev, struct device_attribute *attr,
+				 const char *buf, size_t count);
+		ssize_t (*store_const)(struct device *dev, const struct device_attribute *attr,
+				       const char *buf, size_t count);
+	);
 };
 
 /**
@@ -135,11 +143,50 @@ ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
 ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 			   char *buf);
 
+typedef ssize_t __device_show_handler_const(struct device *dev, const struct device_attribute *attr,
+					    char *buf);
+typedef ssize_t __device_store_handler_const(struct device *dev, const struct device_attribute *attr,
+					     const char *buf, size_t count);
+
+#ifdef CONFIG_CFI
+
+#define __DEVICE_ATTR_SHOW_STORE(_show, _store)						\
+	.show		= _Generic(_show,						\
+			  __device_show_handler_const * : NULL,				\
+			  default : _show						\
+	),										\
+	.show_const	= _Generic(_show,						\
+			  __device_show_handler_const * : _show,			\
+			  default : NULL						\
+	),										\
+	.store		= _Generic(_store,						\
+			  __device_store_handler_const * : NULL,			\
+			  default : _store						\
+	),										\
+	.store_const	= _Generic(_store,						\
+			  __device_store_handler_const * : _store,			\
+			  default : NULL \
+	),
+
+#else
+
+#define __DEVICE_ATTR_SHOW_STORE(_show, _store)						\
+	.show		= _Generic(_show,						\
+			  __device_show_handler_const * : (void *)_show,		\
+			  default : _show						\
+	),										\
+	.store		= _Generic(_store,						\
+			  __device_store_handler_const * : (void *)_store,		\
+			  default : _store						\
+	),										\
+
+#endif
+
+
 #define __DEVICE_ATTR(_name, _mode, _show, _store) {			\
 	.attr = {.name = __stringify(_name),				\
 		 .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },		\
-	.show	= _show,						\
-	.store	= _store,						\
+	__DEVICE_ATTR_SHOW_STORE(_show, _store)				\
 }
 
 #define __DEVICE_ATTR_RO_MODE(_name, _mode) \
@@ -161,8 +208,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 #define __DEVICE_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store) {	\
 	.attr = {.name = __stringify(_name), .mode = _mode,		\
 			.ignore_lockdep = true },			\
-	.show		= _show,					\
-	.store		= _store,					\
+	__DEVICE_ATTR_SHOW_STORE(_show, _store)				\
 }
 #else
 #define __DEVICE_ATTR_IGNORE_LOCKDEP	__DEVICE_ATTR

-- 
2.53.0

