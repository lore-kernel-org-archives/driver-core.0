Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 249573783CE
	for <driver-core@lists.linux.dev>; Wed,  8 Apr 2026 19:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775676655; cv=none; b=uRXYK18XJyOkDlIETU/E/QgNmZDMQhoYYI1zyFAN0ULCc+HDCBYhvst1X1C7ONOidcQseixuGp3M4ExHlAUjYIEEn38GiqTEsYnkTy6tdGZkpVF6eQVrZ3jorcI2rhhtmGjW7CQ620ThcUf+DjnQh/ocQFNFFYThlnQsEaqB5WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775676655; c=relaxed/simple;
	bh=+nbPD7BwS/SUUadDJb/9lHBAT0OX4YEir/hK/GeyFkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Wzu4jgS2K2DoaeIjM/xtgAf24bGvJV6rlQf5Le0wOZBYJ86z6Z+XVMcD1YrrWWQ0WsWirg0JVT2fLSBa2u/Z9voqtZU4enOi+p4licA32lAyPFsdBJsudpjapf/g7FWpF106Ay7sqWUy4tsZ791PMp5Js5bISwA2ROTp4VrHPqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=YvjBE0ch; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="YvjBE0ch"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775676650;
	bh=+nbPD7BwS/SUUadDJb/9lHBAT0OX4YEir/hK/GeyFkA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YvjBE0chOnpb5vd8z4xnZlOmsr/vuTvzLHqMzbmkjY9XaOSsMTRSajOz5nqCwHxCI
	 Y+vHT/sBuFj1UdUqyx1LfYWprVMI2rNLiy0mhHm8qwpF0lMQ04Iemd0og5JnQkorWZ
	 DefAXrJMSOsyFriSiQlonEDFWAkS9IZ+8PxUV2PY=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Wed, 08 Apr 2026 21:30:51 +0200
Subject: [PATCH 5/5] driver core: Constify core device attributes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260408-sysfs-const-attr-device_attr-prep-v1-5-232934f77b3c@weissschuh.net>
References: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
In-Reply-To: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775676649; l=5281;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=+nbPD7BwS/SUUadDJb/9lHBAT0OX4YEir/hK/GeyFkA=;
 b=phO7B4RvbrhoGoDyzGJa6ZRa9cadragz1y5XEhYk8bXZmoLane21Yk7w0siQf4WXm28vZ1DiB
 FhFuwUnqy4AAy85Y2WezbmdJdvST4FhsQuthlbHIE7J1k3W1HaB+Dnc
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

To make sure these attributes are not modified by accident or by an
attacker, move them to read-only memory.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/base/core.c | 38 +++++++++++++++++++-------------------
 1 file changed, 19 insertions(+), 19 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 8a48cb2137ae..0f314c83eb9d 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -422,7 +422,7 @@ void device_pm_move_to_tail(struct device *dev)
 #define to_devlink(dev)	container_of((dev), struct device_link, link_dev)
 
 static ssize_t status_show(struct device *dev,
-			   struct device_attribute *attr, char *buf)
+			   const struct device_attribute *attr, char *buf)
 {
 	const char *output;
 
@@ -452,10 +452,10 @@ static ssize_t status_show(struct device *dev,
 
 	return sysfs_emit(buf, "%s\n", output);
 }
-static DEVICE_ATTR_RO(status);
+static const DEVICE_ATTR_RO(status);
 
 static ssize_t auto_remove_on_show(struct device *dev,
-				   struct device_attribute *attr, char *buf)
+				   const struct device_attribute *attr, char *buf)
 {
 	struct device_link *link = to_devlink(dev);
 	const char *output;
@@ -469,27 +469,27 @@ static ssize_t auto_remove_on_show(struct device *dev,
 
 	return sysfs_emit(buf, "%s\n", output);
 }
-static DEVICE_ATTR_RO(auto_remove_on);
+static const DEVICE_ATTR_RO(auto_remove_on);
 
 static ssize_t runtime_pm_show(struct device *dev,
-			       struct device_attribute *attr, char *buf)
+			       const struct device_attribute *attr, char *buf)
 {
 	struct device_link *link = to_devlink(dev);
 
 	return sysfs_emit(buf, "%d\n", device_link_test(link, DL_FLAG_PM_RUNTIME));
 }
-static DEVICE_ATTR_RO(runtime_pm);
+static const DEVICE_ATTR_RO(runtime_pm);
 
 static ssize_t sync_state_only_show(struct device *dev,
-				    struct device_attribute *attr, char *buf)
+				    const struct device_attribute *attr, char *buf)
 {
 	struct device_link *link = to_devlink(dev);
 
 	return sysfs_emit(buf, "%d\n", device_link_test(link, DL_FLAG_SYNC_STATE_ONLY));
 }
-static DEVICE_ATTR_RO(sync_state_only);
+static const DEVICE_ATTR_RO(sync_state_only);
 
-static struct attribute *devlink_attrs[] = {
+static const struct attribute *const devlink_attrs[] = {
 	&dev_attr_status.attr,
 	&dev_attr_auto_remove_on.attr,
 	&dev_attr_runtime_pm.attr,
@@ -1233,7 +1233,7 @@ static void device_link_drop_managed(struct device_link *link)
 }
 
 static ssize_t waiting_for_supplier_show(struct device *dev,
-					 struct device_attribute *attr,
+					 const struct device_attribute *attr,
 					 char *buf)
 {
 	bool val;
@@ -1244,7 +1244,7 @@ static ssize_t waiting_for_supplier_show(struct device *dev,
 	device_unlock(dev);
 	return sysfs_emit(buf, "%u\n", val);
 }
-static DEVICE_ATTR_RO(waiting_for_supplier);
+static const DEVICE_ATTR_RO(waiting_for_supplier);
 
 /**
  * device_links_force_bind - Prepares device to be force bound
@@ -2727,7 +2727,7 @@ static const struct kset_uevent_ops device_uevent_ops = {
 	.uevent =	dev_uevent,
 };
 
-static ssize_t uevent_show(struct device *dev, struct device_attribute *attr,
+static ssize_t uevent_show(struct device *dev, const struct device_attribute *attr,
 			   char *buf)
 {
 	struct kobject *top_kobj;
@@ -2770,7 +2770,7 @@ static ssize_t uevent_show(struct device *dev, struct device_attribute *attr,
 	return len;
 }
 
-static ssize_t uevent_store(struct device *dev, struct device_attribute *attr,
+static ssize_t uevent_store(struct device *dev, const struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
 	int rc;
@@ -2784,9 +2784,9 @@ static ssize_t uevent_store(struct device *dev, struct device_attribute *attr,
 
 	return count;
 }
-static DEVICE_ATTR_RW(uevent);
+static const DEVICE_ATTR_RW(uevent);
 
-static ssize_t online_show(struct device *dev, struct device_attribute *attr,
+static ssize_t online_show(struct device *dev, const struct device_attribute *attr,
 			   char *buf)
 {
 	bool val;
@@ -2797,7 +2797,7 @@ static ssize_t online_show(struct device *dev, struct device_attribute *attr,
 	return sysfs_emit(buf, "%u\n", val);
 }
 
-static ssize_t online_store(struct device *dev, struct device_attribute *attr,
+static ssize_t online_store(struct device *dev, const struct device_attribute *attr,
 			    const char *buf, size_t count)
 {
 	bool val;
@@ -2815,9 +2815,9 @@ static ssize_t online_store(struct device *dev, struct device_attribute *attr,
 	unlock_device_hotplug();
 	return ret < 0 ? ret : count;
 }
-static DEVICE_ATTR_RW(online);
+static const DEVICE_ATTR_RW(online);
 
-static ssize_t removable_show(struct device *dev, struct device_attribute *attr,
+static ssize_t removable_show(struct device *dev, const struct device_attribute *attr,
 			      char *buf)
 {
 	const char *loc;
@@ -2834,7 +2834,7 @@ static ssize_t removable_show(struct device *dev, struct device_attribute *attr,
 	}
 	return sysfs_emit(buf, "%s\n", loc);
 }
-static DEVICE_ATTR_RO(removable);
+static const DEVICE_ATTR_RO(removable);
 
 int device_add_groups(struct device *dev,
 		      const struct attribute_group *const *groups)

-- 
2.53.0

