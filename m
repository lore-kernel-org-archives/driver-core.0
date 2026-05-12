Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC453CE0B1
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603968; cv=none; b=q2cHXUFxWNOTerWPpYr7QAztvSdpA4ujy5OXrDk4mxW5Z7kiG9HImHXDc/8RzygDffd4vHlgY/HY7wWtHHy3mRj3GkbKx3iTRr5pqf7JqPRpmuBJ0fy+XW9NJP5Qv7Y3ZV4V80aIk+VW3HwpcDZ7+m9YyfeomrGVaKck3nbAo/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603968; c=relaxed/simple;
	bh=qVTV8qeG6V+Z9IZtbOivrANMEblCi5CBzzop6HZ4Z0U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Jradi8RH+DtKOVW8k+7w0DElDTUEnO3x2o44bl4cZRhzWCcWYgPtexISJH009v9XnzKY0xxyIrtFKwn4z4OfaW6JC0nKJAHfO5+tfLG5WLGy5DwfSd6Pyidyuq2PaOb83krmTYV7jUjrK7cR4olC0Nos9qt70LHgWSlenEXha8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=dRthu1nf; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="dRthu1nf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1778603956;
	bh=qVTV8qeG6V+Z9IZtbOivrANMEblCi5CBzzop6HZ4Z0U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dRthu1nf+LTY45xiwjbDgogtYEjmORklZgMBy8/5gbQvBW9O+xh48Tp0cBYdpb5Mj
	 BfG8YCCEabkeQ88PRD1GNS71ohfYwnCNU9/43dxYYJWcU/8sBFTP0xdj5BvVopEcUU
	 3l43NLVSDc3qrdgcNK3/TzHTU6JPow2OgxK443JQ=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 12 May 2026 18:39:12 +0200
Subject: [PATCH v3 2/5] driver core: Add low-level macros for device
 attributes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-sysfs-const-attr-device_attr-prep-v3-2-cb7c17b34d52@weissschuh.net>
References: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
In-Reply-To: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778603956; l=5979;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=qVTV8qeG6V+Z9IZtbOivrANMEblCi5CBzzop6HZ4Z0U=;
 b=kr9KqPnQS1NgwtuitCmYxoiXVW7amMHsR/WHA4OKuqB21sPRgRgAAMLVtViBZ1rqDvaDo8xqS
 kNsBZpxXZw/D+hbzavqRyJUWL+xtT1Y1HZwjx2nNagA2Z5XKukLoppg
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

For the upcoming constification of device attributes the generic
__ATTR() macros are insufficient.

Prepare for a split by introducing new low-level macros specific to
device attributes.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/device.h | 43 ++++++++++++++++++++++++++++++++-----------
 1 file changed, 32 insertions(+), 11 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 06ec4e27a1e1..24ed3a6caad2 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -135,6 +135,27 @@ ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
 ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 			   char *buf);
 
+#define __DEVICE_ATTR(_name, _mode, _show, _store) \
+	__ATTR(_name, _mode, _show, _store)
+
+#define __DEVICE_ATTR_RO_MODE(_name, _mode) \
+	__ATTR_RO_MODE(_name, _mode)
+
+#define __DEVICE_ATTR_RO(_name) \
+	__ATTR_RO(_name)
+
+#define __DEVICE_ATTR_WO(_name) \
+	__ATTR_WO(_name)
+
+#define __DEVICE_ATTR_RW_MODE(_name, _mode) \
+	__ATTR_RW_MODE(_name, _mode)
+
+#define __DEVICE_ATTR_RW(_name) \
+	__ATTR_RW(_name)
+
+#define __DEVICE_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store) \
+	__ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store)
+
 /**
  * DEVICE_ATTR - Define a device attribute.
  * @_name: Attribute name.
@@ -155,7 +176,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  *	};
  */
 #define DEVICE_ATTR(_name, _mode, _show, _store) \
-	struct device_attribute dev_attr_##_name = __ATTR(_name, _mode, _show, _store)
+	struct device_attribute dev_attr_##_name = __DEVICE_ATTR(_name, _mode, _show, _store)
 
 /**
  * DEVICE_ATTR_RW - Define a read-write device attribute.
@@ -165,7 +186,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  * and @_store is <_name>_store.
  */
 #define DEVICE_ATTR_RW(_name) \
-	struct device_attribute dev_attr_##_name = __ATTR_RW(_name)
+	struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RW(_name)
 
 /**
  * DEVICE_ATTR_ADMIN_RW - Define an admin-only read-write device attribute.
@@ -174,7 +195,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  * Like DEVICE_ATTR_RW(), but @_mode is 0600.
  */
 #define DEVICE_ATTR_ADMIN_RW(_name) \
-	struct device_attribute dev_attr_##_name = __ATTR_RW_MODE(_name, 0600)
+	struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RW_MODE(_name, 0600)
 
 /**
  * DEVICE_ATTR_RW_NAMED - Define a read-write device attribute with a sysfs name
@@ -199,7 +220,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  * Like DEVICE_ATTR(), but @_mode is 0444 and @_show is <_name>_show.
  */
 #define DEVICE_ATTR_RO(_name) \
-	struct device_attribute dev_attr_##_name = __ATTR_RO(_name)
+	struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
 
 /**
  * DEVICE_ATTR_ADMIN_RO - Define an admin-only readable device attribute.
@@ -208,7 +229,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  * Like DEVICE_ATTR_RO(), but @_mode is 0400.
  */
 #define DEVICE_ATTR_ADMIN_RO(_name) \
-	struct device_attribute dev_attr_##_name = __ATTR_RO_MODE(_name, 0400)
+	struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO_MODE(_name, 0400)
 
 /**
  * DEVICE_ATTR_RO_NAMED - Define a read-only device attribute with a sysfs name
@@ -232,7 +253,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  * Like DEVICE_ATTR(), but @_mode is 0200 and @_store is <_name>_store.
  */
 #define DEVICE_ATTR_WO(_name) \
-	struct device_attribute dev_attr_##_name = __ATTR_WO(_name)
+	struct device_attribute dev_attr_##_name = __DEVICE_ATTR_WO(_name)
 
 /**
  * DEVICE_ATTR_WO_NAMED - Define a read-only device attribute with a sysfs name
@@ -260,7 +281,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  */
 #define DEVICE_ULONG_ATTR(_name, _mode, _var) \
 	struct dev_ext_attribute dev_attr_##_name = \
-		{ __ATTR(_name, _mode, device_show_ulong, device_store_ulong), &(_var) }
+		{ __DEVICE_ATTR(_name, _mode, device_show_ulong, device_store_ulong), &(_var) }
 
 /**
  * DEVICE_INT_ATTR - Define a device attribute backed by an int.
@@ -272,7 +293,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  */
 #define DEVICE_INT_ATTR(_name, _mode, _var) \
 	struct dev_ext_attribute dev_attr_##_name = \
-		{ __ATTR(_name, _mode, device_show_int, device_store_int), &(_var) }
+		{ __DEVICE_ATTR(_name, _mode, device_show_int, device_store_int), &(_var) }
 
 /**
  * DEVICE_BOOL_ATTR - Define a device attribute backed by a bool.
@@ -284,7 +305,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  */
 #define DEVICE_BOOL_ATTR(_name, _mode, _var) \
 	struct dev_ext_attribute dev_attr_##_name = \
-		{ __ATTR(_name, _mode, device_show_bool, device_store_bool), &(_var) }
+		{ __DEVICE_ATTR(_name, _mode, device_show_bool, device_store_bool), &(_var) }
 
 /**
  * DEVICE_STRING_ATTR_RO - Define a device attribute backed by a r/o string.
@@ -297,11 +318,11 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  */
 #define DEVICE_STRING_ATTR_RO(_name, _mode, _var) \
 	struct dev_ext_attribute dev_attr_##_name = \
-		{ __ATTR(_name, (_mode) & ~0222, device_show_string, NULL), (_var) }
+		{ __DEVICE_ATTR(_name, (_mode) & ~0222, device_show_string, NULL), (_var) }
 
 #define DEVICE_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store) \
 	struct device_attribute dev_attr_##_name =		\
-		__ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store)
+		__DEVICE_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store)
 
 int device_create_file(struct device *device,
 		       const struct device_attribute *entry);

-- 
2.54.0

