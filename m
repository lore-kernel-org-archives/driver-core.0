Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75C55377ECD
	for <driver-core@lists.linux.dev>; Wed,  8 Apr 2026 19:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775676653; cv=none; b=JDEZM1U7ytqJojcM/Va9CXRsGlQk1Qy2W2zG2ozNQIQByd/0mLfLyHzDPfjgNwXd/9AOXcuSA9S7DnmSiRAIkm+P3lWoZJxr5u9gboty3P3dDxAwLhnR3cQnwQewB/vPbkCqDi3O+uZ+gsNXTOcFGSf4+96kwB7Keu1Jiz2K+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775676653; c=relaxed/simple;
	bh=5+dH3jR0AwZQvYGap1t8Z+5wOCcNFjWWNEfTEQJMtJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cpCFzy1NrXpDYj9LiKZlF3SSWoGH49jS9ZNdOoMiVMyHKxa/hHRnCe23zlgMFzrPn1RZPgpiUsPQJSnaL4WkdeQu8cfPHfaPTdT9L4DvWpaouN3z+t6BtzBB3mFqsGReiTX4hQtoABvB+/csjLzQtgLaJdziQ+WmGQYIz0mPBfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=oDvVKBvD; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="oDvVKBvD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775676649;
	bh=5+dH3jR0AwZQvYGap1t8Z+5wOCcNFjWWNEfTEQJMtJc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=oDvVKBvDERFaCYQydKiNFRSt3tQEGfXc/B0+gos6lcvXn+Zaom1rndLeJHd+hPWxU
	 BKjxDMmE9R1uCvGf1gMLKnCYaA3mU+X98EHYxaNrQfXwj8bILculkNLG1ITiTeij3R
	 j05yhafZaqkni2IrWdHvVFnHLQVRBlRWg5domubg=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 08 Apr 2026 21:30:49 +0200
Subject: [PATCH 3/5] driver core: stop using generic sysfs macros for
 device attributes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-sysfs-const-attr-device_attr-prep-v1-3-232934f77b3c@weissschuh.net>
References: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
In-Reply-To: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775676649; l=2231;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5+dH3jR0AwZQvYGap1t8Z+5wOCcNFjWWNEfTEQJMtJc=;
 b=j3k6LHi+phl0tL0kE9pjLFELzu8BMkCQsC/NeyU5uGQInILUEAGceMYJm8rzRTnaIhFtA247z
 xkZfvi5gcSCCPLLnK+k++zJuQeuqqhi71K4q05Q7w1eC1705gUi7atj
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
index a0384dac06ee..714e36d610e3 100644
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
2.53.0

