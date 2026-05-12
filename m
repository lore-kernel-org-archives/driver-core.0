Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CDAC3CE0BB
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603969; cv=none; b=SaptvnwMjZw7H4t9LaVLhkDlMSRlzSSiae31P40NgCC438SpzTfAZbXsHpSHGY0lOfaL2Xq2Wc+7tP4CO5FV7vXY+UL3Qmp4VE4ieTxK5WpCTPgM3Hi/eLufEaz5iPXZIFbQe9ag9C24WPK8Zz7f42lDIYljAnykV5/jVi+M6po=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603969; c=relaxed/simple;
	bh=cUdVNVjErc1TuS8AxGPhITg+PWnyvjVsEFQ9D6CtD04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O1OQhu6P2IdTX6dobp/5l36gaO4LvwglRZ6yoV5BqfmFbf9tMAmKZi8SYK/60oA8IR9yVQgWjgIfoQ+qqOJiahurgDybaZtCxuoyQAyQwnmdsigyZxC8vvI0UusIioM2+olN1DTgJkv7l7AjPQbwQdeabojTk5F8GMcE2mtcJFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=TwW/0FgV; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="TwW/0FgV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1778603956;
	bh=cUdVNVjErc1TuS8AxGPhITg+PWnyvjVsEFQ9D6CtD04=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=TwW/0FgV8yUHkrQ+vZRdfQvG2myxOc/ngs3ANN66drHw1pePXDqVOafP6VSvK/+ev
	 mk8vQ2qt/rkVS9TZy588gLf5DT208OZ5T7Wal/9kEJxbhVP1R3R0b/0N5PRjkZ5l8Y
	 oJKBRxhHwLCmp/uD/LSsNIEHPxsPTGnLKMcLJZUg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 12 May 2026 18:39:14 +0200
Subject: [PATCH v3 4/5] driver core: Allow the constification of device
 attributes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-sysfs-const-attr-device_attr-prep-v3-4-cb7c17b34d52@weissschuh.net>
References: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
In-Reply-To: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778603956; l=6530;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=cUdVNVjErc1TuS8AxGPhITg+PWnyvjVsEFQ9D6CtD04=;
 b=djR8ZKOo3pPypRN4s/oFQes17+rZL2YP5Sm2pTmGSdTer4FaHYPI/LuxJ92IhccbS+ti74hnY
 jCuaM8R/w32BYm32JC5yvbNB8jDxyHUD5XscIZ+TNNFcDRYeh5Y6GWz
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Allow device attribute to reside in read-only memory.
Both const and non-const attributes are handled by the utility macros
and attributes can be migrated one-by-one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/base/core.c    | 12 ++++++---
 include/linux/device.h | 69 +++++++++++++++++++++++++++++++++++++++++---------
 2 files changed, 65 insertions(+), 16 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bd2ddf2aab50..6e2ee6d55a0b 100644
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
 
@@ -3047,10 +3051,10 @@ int device_create_file(struct device *dev,
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
index 17150b0dfcd6..354f54be02b9 100644
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
@@ -221,8 +267,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 #define DEVICE_ATTR_RW_NAMED(_name, _attrname)                            \
 	struct device_attribute dev_attr_##_name = {                      \
 		.attr = { .name = _attrname, .mode = 0644 }, \
-		.show = _name##_show,                                     \
-		.store = _name##_store,                                   \
+		__DEVICE_ATTR_SHOW_STORE(_name##_show, _name##_store)     \
 	}
 
 /**
@@ -255,7 +300,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 #define DEVICE_ATTR_RO_NAMED(_name, _attrname)                            \
 	struct device_attribute dev_attr_##_name = {                      \
 		.attr = { .name = _attrname, .mode = 0444 }, \
-		.show = _name##_show,                                     \
+		__DEVICE_ATTR_SHOW_STORE(_name##_show, NULL)              \
 	}
 
 /**
@@ -279,7 +324,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 #define DEVICE_ATTR_WO_NAMED(_name, _attrname)                            \
 	struct device_attribute dev_attr_##_name = {                      \
 		.attr = { .name = _attrname, .mode = 0200 }, \
-		.store = _name##_store,                                   \
+		__DEVICE_ATTR_SHOW_STORE(NULL, _name##_store)             \
 	}
 
 /**

-- 
2.54.0

