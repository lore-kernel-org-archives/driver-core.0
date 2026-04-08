Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5429135AC2B
	for <driver-core@lists.linux.dev>; Wed,  8 Apr 2026 19:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775676654; cv=none; b=j/9TtNeo6fvn3sUtXG9I92qIXuwwG8wqK7O3oklHIoM/l23Lgp6/sR1rH/WpW+XfVRidBYjciB1sN8g2xxz/zAi/BPc+ULr4X3JW+uyk7vj5ShVc+iOanWUfRNI6Xw5N8gtBWVI57RTIS3pk6zPVPxMxoKT3ilwZ/0rIg5+HQ8Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775676654; c=relaxed/simple;
	bh=mlcewPKPxaP2lJBm90zUvK8H7itlW5p6M//h2z7TgMA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BfZqB13wgT15ffocQoEm/4q9yeXRAY1SSgU23Y79t7wONCbxNmTPzA/bt1gyR/HsN0NOepKNy6++xqogd+KgPg/3ykrLtDAYu6SmGjBrBIiFUDL7pzg6lNmAKFKOP6mlDJZVc/NaBhbGZKFtvr4Co+PO0bzqUCcDgCzyCgNCJ20=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=cttF5Djz; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="cttF5Djz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775676649;
	bh=mlcewPKPxaP2lJBm90zUvK8H7itlW5p6M//h2z7TgMA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cttF5DjzuHAMGI5ft6Arcl94EQu6VIXZnf2DJdRawCsPTqKggyO8dpi6b9l5ZXfm0
	 RQx7uZRWPIHouLA0DO3eTt5Z45b5PyKRTO0tmh0kNYY7rS9a4FXTKG7xm+5hLgoNBV
	 ZYoYOjBnmRgUoz0tyrWaqWGgxSep/kvUiMwA814U=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 08 Apr 2026 21:30:48 +0200
Subject: [PATCH 2/5] driver core: Add low-level macros for device
 attributes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-sysfs-const-attr-device_attr-prep-v1-2-232934f77b3c@weissschuh.net>
References: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
In-Reply-To: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775676649; l=5939;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=mlcewPKPxaP2lJBm90zUvK8H7itlW5p6M//h2z7TgMA=;
 b=G4PQun+/0McWbBB2edgI4uN1g1PQg/p5CdD/eFXASVs2CN7UJCjqIw7Za2lZEKRF01PUhcj+P
 kMJQwPX+PdGDqmatjnEM2DidJ864c+UVkjKlWoCoY608Zerc/Q/Sdn1
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
index 8ba3168180e5..a0384dac06ee 100644
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
  * DEVICE_ATTR_RO - Define a readable device attribute.
@@ -183,7 +204,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  * Like DEVICE_ATTR(), but @_mode is 0444 and @_show is <_name>_show.
  */
 #define DEVICE_ATTR_RO(_name) \
-	struct device_attribute dev_attr_##_name = __ATTR_RO(_name)
+	struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
 
 /**
  * DEVICE_ATTR_ADMIN_RO - Define an admin-only readable device attribute.
@@ -192,7 +213,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  * Like DEVICE_ATTR_RO(), but @_mode is 0400.
  */
 #define DEVICE_ATTR_ADMIN_RO(_name) \
-	struct device_attribute dev_attr_##_name = __ATTR_RO_MODE(_name, 0400)
+	struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO_MODE(_name, 0400)
 
 /**
  * DEVICE_ATTR_WO - Define an admin-only writable device attribute.
@@ -201,7 +222,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  * Like DEVICE_ATTR(), but @_mode is 0200 and @_store is <_name>_store.
  */
 #define DEVICE_ATTR_WO(_name) \
-	struct device_attribute dev_attr_##_name = __ATTR_WO(_name)
+	struct device_attribute dev_attr_##_name = __DEVICE_ATTR_WO(_name)
 
 /**
  * DEVICE_ULONG_ATTR - Define a device attribute backed by an unsigned long.
@@ -214,7 +235,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  */
 #define DEVICE_ULONG_ATTR(_name, _mode, _var) \
 	struct dev_ext_attribute dev_attr_##_name = \
-		{ __ATTR(_name, _mode, device_show_ulong, device_store_ulong), &(_var) }
+		{ __DEVICE_ATTR(_name, _mode, device_show_ulong, device_store_ulong), &(_var) }
 
 /**
  * DEVICE_INT_ATTR - Define a device attribute backed by an int.
@@ -226,7 +247,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  */
 #define DEVICE_INT_ATTR(_name, _mode, _var) \
 	struct dev_ext_attribute dev_attr_##_name = \
-		{ __ATTR(_name, _mode, device_show_int, device_store_int), &(_var) }
+		{ __DEVICE_ATTR(_name, _mode, device_show_int, device_store_int), &(_var) }
 
 /**
  * DEVICE_BOOL_ATTR - Define a device attribute backed by a bool.
@@ -238,7 +259,7 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
  */
 #define DEVICE_BOOL_ATTR(_name, _mode, _var) \
 	struct dev_ext_attribute dev_attr_##_name = \
-		{ __ATTR(_name, _mode, device_show_bool, device_store_bool), &(_var) }
+		{ __DEVICE_ATTR(_name, _mode, device_show_bool, device_store_bool), &(_var) }
 
 /**
  * DEVICE_STRING_ATTR_RO - Define a device attribute backed by a r/o string.
@@ -251,11 +272,11 @@ ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
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
2.53.0

