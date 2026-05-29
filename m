Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8FD53F0A92
	for <driver-core@lists.linux.dev>; Fri, 29 May 2026 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073008; cv=none; b=r5IwKgDXtj4LJd3msWqjfDZzeE2ZrHVu84LSq7j6JgJRO3hw3Kw5/1834gAaWjYtaS2G+bNXXo6bbVLKN+gv3gZi2cFv/VkWTASBTXYyGQeRGpcgut3AVuVkrZvpTkLXZ7thoWRvGSRYTQyFZ4rwDccmJslQ15LTXJhDC47OnKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073008; c=relaxed/simple;
	bh=8WHvFnmK59Pi+8HXymoZgMJLRoy9RphqyWEgcwvTl9M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gQxuR21f+EVIGrAI6O+sCX54WB1aq0nw11VWbU6x7xZlluVxyM7GH3SrdVSXnhRjFvC0CNG84UCzw7jXDwaRTJk5p565z9Dx4a1VslKruDUmtYs0ux1t9XT1f1N7zflkg61qS6z5iygUyuGVULE3FgxQUqlORZ1phJ3AMT9gVaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=jeNsraOu; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="jeNsraOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780073004;
	bh=8WHvFnmK59Pi+8HXymoZgMJLRoy9RphqyWEgcwvTl9M=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=jeNsraOuoJWAdd9976rDYDwWDrsLqjdj/+rR95xaomKRUzMMXQW+J5NF1eNXLtEV6
	 b6relZJlrhVKFblbjh0ptflynUVK1LMW0j7T6updUFaxG2dKJ54SBFEIjtwLTXopjY
	 DzC/2DZKn35au2//cHHcuKmFzlpsbaA4CSD4kULM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 29 May 2026 18:43:24 +0200
Subject: [PATCH 3/4] kobject: Allow the constification of kobject
 attributes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-sysfs-const-attr-kobj-attr-prep-v1-3-7e667ba3bb85@weissschuh.net>
References: <20260529-sysfs-const-attr-kobj-attr-prep-v1-0-7e667ba3bb85@weissschuh.net>
In-Reply-To: <20260529-sysfs-const-attr-kobj-attr-prep-v1-0-7e667ba3bb85@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780073003; l=3985;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=8WHvFnmK59Pi+8HXymoZgMJLRoy9RphqyWEgcwvTl9M=;
 b=kKE+EWUd9U9jOjxESVGnkoYeNJV6tax2pnUBL+W/l0y9ZdREzo9S8RlPnkyhUuWE2O8aj08LJ
 HetixVdgjJNDD0rzw9vwZdTOS85VyTcltgRew+wsOns4K/WXV3klImi
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Allow kobject attribute to reside in read-only memory.
Both const and non-const attributes are handled by the utility macros
and attributes can be migrated one-by-one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/kobject.h | 57 +++++++++++++++++++++++++++++++++++++++++++------
 lib/kobject.c           |  8 +++++--
 2 files changed, 57 insertions(+), 8 deletions(-)

diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index 975a5361fb60..2c5b386d441c 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -138,17 +138,62 @@ struct kset_uevent_ops {
 
 struct kobj_attribute {
 	struct attribute attr;
-	ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr,
-			char *buf);
-	ssize_t (*store)(struct kobject *kobj, struct kobj_attribute *attr,
-			 const char *buf, size_t count);
+	__SYSFS_FUNCTION_ALTERNATIVE(
+		ssize_t (*show)(struct kobject *kobj, struct kobj_attribute *attr, char *buf);
+		ssize_t (*show_const)(struct kobject *kobj, const struct kobj_attribute *attr,
+				      char *buf);
+	);
+	__SYSFS_FUNCTION_ALTERNATIVE(
+		ssize_t (*store)(struct kobject *kobj, struct kobj_attribute *attr,
+				 const char *buf, size_t count);
+		ssize_t (*store_const)(struct kobject *kobj, const struct kobj_attribute *attr,
+				       const char *buf, size_t count);
+	);
 };
 
+typedef ssize_t __kobj_show_handler_const(struct kobject *kobj, const struct kobj_attribute *attr,
+					  char *buf);
+typedef ssize_t __kobj_store_handler_const(struct kobject *kobj, const struct kobj_attribute *attr,
+					   const char *buf, size_t count);
+
+#ifdef CONFIG_CFI
+
+#define __KOBJ_ATTR_SHOW_STORE(_show, _store)						\
+	.show		= _Generic(_show,						\
+			  __kobj_show_handler_const * : NULL,				\
+			  default : _show						\
+	),										\
+	.show_const	= _Generic(_show,						\
+			  __kobj_show_handler_const * : _show,				\
+			  default : NULL						\
+	),										\
+	.store		= _Generic(_store,						\
+			  __kobj_store_handler_const * : NULL,				\
+			  default : _store						\
+	),										\
+	.store_const	= _Generic(_store,						\
+			  __kobj_store_handler_const * : _store,			\
+			  default : NULL \
+	),
+
+#else
+
+#define __KOBJ_ATTR_SHOW_STORE(_show, _store)						\
+	.show		= _Generic(_show,						\
+			  __kobj_show_handler_const * : (void *)_show,			\
+			  default : _show						\
+	),										\
+	.store		= _Generic(_store,						\
+			  __kobj_store_handler_const * : (void *)_store,		\
+			  default : _store						\
+	),										\
+
+#endif
+
 #define __KOBJ_ATTR(_name, _mode, _show, _store) {			\
 	.attr	= { .name = __stringify(_name),				\
 		    .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },		\
-	.show	= _show,						\
-	.store	= _store,						\
+	__KOBJ_ATTR_SHOW_STORE(_show, _store)				\
 }
 
 #define __KOBJ_ATTR_RO_MODE(_name, _mode) {				\
diff --git a/lib/kobject.c b/lib/kobject.c
index 9c9ff0f5175f..e7b010a989fb 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -823,9 +823,11 @@ static ssize_t kobj_attr_show(struct kobject *kobj, struct attribute *attr,
 	struct kobj_attribute *kattr;
 	ssize_t ret = -EIO;
 
-	kattr = container_of(attr, struct kobj_attribute, attr);
+	kattr = container_of_const(attr, struct kobj_attribute, attr);
 	if (kattr->show)
 		ret = kattr->show(kobj, kattr, buf);
+	else if (kattr->show_const)
+		ret = kattr->show_const(kobj, kattr, buf);
 	return ret;
 }
 
@@ -835,9 +837,11 @@ static ssize_t kobj_attr_store(struct kobject *kobj, struct attribute *attr,
 	struct kobj_attribute *kattr;
 	ssize_t ret = -EIO;
 
-	kattr = container_of(attr, struct kobj_attribute, attr);
+	kattr = container_of_const(attr, struct kobj_attribute, attr);
 	if (kattr->store)
 		ret = kattr->store(kobj, kattr, buf, count);
+	else if (kattr->store_const)
+		ret = kattr->store_const(kobj, kattr, buf, count);
 	return ret;
 }
 

-- 
2.54.0

