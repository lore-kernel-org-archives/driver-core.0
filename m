Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C88D3B840E
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 16:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778603968; cv=none; b=oRV2w+T09S2ND9n/3f3Mc2zjRaZG3FJlB1Xb5exrxqoW1asy8joRdzhg3BfQj0CQn6gbnBJLVHXjmgR65eYuZ/Hkv8fPqUCNrqB74crTHFCO+Zwx1E8/2vFGTjKcPso6QJOiqyX7M1XeyqwA9RF+5Ubb9tab/Vxf54HRDkj22Vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778603968; c=relaxed/simple;
	bh=Q2Kj+fih1psN3SqbcUkOIM/tNiFEPciiP5rTFtjkws4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YbDDiibr+9A3pYUyDr1trKFitY4Ka9C7sZlc4/Mm6ExpWqaRYlcdoVjqvQaJYiiWBS6Ad7Ie3FC1HhqHIHctxu2Pc2eygyfMbUyh35dQmq+lk1ye5H0jRmbwIQ5qpd/TncBgi8qpgVMCVJIzz2zQe7GTm4P04b8qMVeflxMetX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=B9dlfPmc; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="B9dlfPmc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1778603956;
	bh=Q2Kj+fih1psN3SqbcUkOIM/tNiFEPciiP5rTFtjkws4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=B9dlfPmcXJwj01QFdURv7miStetZ0xOlhsRSWzOOZBcmfDS0Fo7SgXBaAxCRuyLha
	 2+ZrnqBVZ6xBZcpKB7FDyLbPwESImcEtggfxpNgaetNI8s/DsqKkJMxUTZT0gvNc0m
	 VI0I1vRwj7zpyS8Bq1zRXLNXF0+PFRrhqUL6pbVU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 12 May 2026 18:39:13 +0200
Subject: [PATCH v3 3/5] driver core: Stop using generic sysfs macros for
 device attributes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260512-sysfs-const-attr-device_attr-prep-v3-3-cb7c17b34d52@weissschuh.net>
References: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
In-Reply-To: <20260512-sysfs-const-attr-device_attr-prep-v3-0-cb7c17b34d52@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778603956; l=2231;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=Q2Kj+fih1psN3SqbcUkOIM/tNiFEPciiP5rTFtjkws4=;
 b=9Co0muNHbxA2SY3sTKaXUdvzzoncXtyfRKaXIAFU60PpLfhwh7qmAoWhQW5UozocQM+aF6pdR
 5lBVyrUF1REBGu/w4vz8hWOpbH1U2SHsBjkr9XFlpnUz5qI6cO7/4oj
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

