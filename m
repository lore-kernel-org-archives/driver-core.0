Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29D101DA60D
	for <driver-core@lists.linux.dev>; Mon,  4 May 2026 05:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777872838; cv=none; b=qUPMPfKs7vZG7MDFuOBUU8Q1CwfanLrMRcvbWImv9rITavNLhhOq7T3JyzoqM2HwMS45F2191M1QchgN9jPVYXtkxoiq3EGbctyMokMMeDQkLdwxWD7AynrxzIwBFDkbnfRcPUSGhqoQMcLUVtfGIsB9AH1uUzCwZZqPdj0kf6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777872838; c=relaxed/simple;
	bh=Q2Kj+fih1psN3SqbcUkOIM/tNiFEPciiP5rTFtjkws4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cFIS8UMaDn+39CilXT1inqD67SXBiVP7Ou1N6NCenAUe0pE/TM2qAWoPH+MdsS6l61ffiv8rBFiIe2p4Ysy9jR5EQAr96wqzXedHRQ9PjvgMMc32FjdpVb9/Zklb7xosokP4i59xBM7KaA07aFvXvaFmabLG9wkk3qaS4eVgJbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=GoK+KYqh; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="GoK+KYqh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777872835;
	bh=Q2Kj+fih1psN3SqbcUkOIM/tNiFEPciiP5rTFtjkws4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GoK+KYqhDiTOVi9owQw0cgAbQ2oChh97WNNz/CX+Z+ebHvZwKY13ZZqHxnhVICQLM
	 AdRziyaUPGGD8D/UkLDjpPmG7gq/panDEi2mAaIwbSRMPvOzU+iqF0C30jWoiRKgXe
	 8dwhWwVCnwfagopgAvp8NjCk3h/MW5CF7dfvtXQg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 04 May 2026 07:33:52 +0200
Subject: [PATCH v2 3/5] driver core: stop using generic sysfs macros for
 device attributes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260504-sysfs-const-attr-device_attr-prep-v2-3-79d291cb3071@weissschuh.net>
References: <20260504-sysfs-const-attr-device_attr-prep-v2-0-79d291cb3071@weissschuh.net>
In-Reply-To: <20260504-sysfs-const-attr-device_attr-prep-v2-0-79d291cb3071@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777872834; l=2231;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Q2Kj+fih1psN3SqbcUkOIM/tNiFEPciiP5rTFtjkws4=;
 b=nEnVJs638hmPVKHtjYOsiAaY0LReou5ZkIM9bHIS7ZNuQfyM4Y4MILS+2H7g4tPnMGcK5YL+z
 YlFBGvXm/mjAGeKU24wDZMq7XG5p9LZjmRR1q+XlOSpUDviuU1AkklY
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The constification of device attributes will require a transition phase,
where 'struct device_attribute' contains a classic non-const and a new
const variant of the 'show' and 'store' callbacks.

As __ATTR() and friends can not handle this duplication stop using them.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/device.h | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/include/linux/device.h b/include/linux/device.h
index 24ed3a6caad2..17150b0dfcd6 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -135,26 +135,38 @@ ssize_t device_store_bool(struct device *dev, struct device_attribute *attr,
 ssize_t device_show_string(struct device *dev, struct device_attribute *attr,
 			   char *buf);
 
-#define __DEVICE_ATTR(_name, _mode, _show, _store) \
-	__ATTR(_name, _mode, _show, _store)
+#define __DEVICE_ATTR(_name, _mode, _show, _store) {			\
+	.attr = {.name = __stringify(_name),				\
+		 .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },		\
+	.show	= _show,						\
+	.store	= _store,						\
+}
 
 #define __DEVICE_ATTR_RO_MODE(_name, _mode) \
-	__ATTR_RO_MODE(_name, _mode)
+	__DEVICE_ATTR(_name, _mode, _name##_show, NULL)
 
 #define __DEVICE_ATTR_RO(_name) \
-	__ATTR_RO(_name)
+	__DEVICE_ATTR_RO_MODE(_name, 0444)
 
 #define __DEVICE_ATTR_WO(_name) \
-	__ATTR_WO(_name)
+	__DEVICE_ATTR(_name, 0200, NULL, _name##_store)
 
 #define __DEVICE_ATTR_RW_MODE(_name, _mode) \
-	__ATTR_RW_MODE(_name, _mode)
+	__DEVICE_ATTR(_name, _mode, _name##_show, _name##_store)
 
 #define __DEVICE_ATTR_RW(_name) \
-	__ATTR_RW(_name)
-
-#define __DEVICE_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store) \
-	__ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store)
+	__DEVICE_ATTR_RW_MODE(_name, 0644)
+
+#ifdef CONFIG_DEBUG_LOCK_ALLOC
+#define __DEVICE_ATTR_IGNORE_LOCKDEP(_name, _mode, _show, _store) {	\
+	.attr = {.name = __stringify(_name), .mode = _mode,		\
+			.ignore_lockdep = true },			\
+	.show		= _show,					\
+	.store		= _store,					\
+}
+#else
+#define __DEVICE_ATTR_IGNORE_LOCKDEP	__DEVICE_ATTR
+#endif
 
 /**
  * DEVICE_ATTR - Define a device attribute.

-- 
2.54.0

