Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB8939281B;
	Thu, 20 Aug 2026 22:54:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787266482; cv=none; b=sxrvBdBajEMMOWyBbjZUipkFQehSnSCJHkUlFoVpYdnHlOxxYLc71jrR0u1PWfcGc0wO07rgqYeF4Ob1fXRPMXxhpScRVrvkO0870e+SNALhUPNG7x2SuQGm4/7Cn3CX11k7cW+I3LLTWmdJ3vFaRbi3L5FQ+THK8ex8g+1JEqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787266482; c=relaxed/simple;
	bh=7Au701bf1sZC5LElU/P6jtiOctOquYQpP1SGLwX8GdE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tu52oWSBSejUcoJqa64KBxEw6w9rlz9JB5U0wQJg6L/zx6WyGjlKmDpgTuOmZUY+6z/4qZb3KZvT/wAwTUI9r0Jfpy98Q9izupGGps4RRAQVR7x8oTczIixtZUxWLadZPu0v8NtgasSDiUKkVWVeqJ87CvVOYhCwrOEgD8T5m8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aZIBceQD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aZIBceQD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B761F000E9;
	Thu, 20 Aug 2026 22:54:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787266480;
	bh=BydrFpxIM0sG9LnR/EWtwRv2hOi+zg7xGaPmMcWrlA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aZIBceQDE0Eq6gOoeA2CPnIP4O56T34BfCFKzSzDnC9X6JNrFGfWmRv+EOai1ZMB0
	 XjYtBRym+eHBHyPfWd4vQagY4P9gNy+5z+f/guRue3RlS3aXdE+0I2d0T+VF6qc8QU
	 PLi7lCxKtyDndyYZrauV4I2vdCepAEK6/U4NhUYZx47eyUDfWoxcpG6aDpffHua2LM
	 hlPdblntpsxZ8s0B/mK/zvoxz7cqZpmoUHAjoGN3XjYOaIjiEQS3kSTyV7p5CY+RUa
	 X8tZCQFhD7AL7AZFACcICgdSQdj0hlBZKBTe0Ecg481QpobQPK4PVCV2TyfnIY87UQ
	 H77QXwCjiDoNQ==
From: Danilo Krummrich <dakr@kernel.org>
To: krzk@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 3/3] w1: stop using struct device template for master devices
Date: Fri, 21 Aug 2026 00:54:11 +0200
Message-ID: <20260820225430.1847356-3-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820225430.1847356-1-dakr@kernel.org>
References: <20260820225430.1847356-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

w1_alloc_dev() uses memcpy() with a static struct device template
(w1_master_device) to initialize new master devices.

Replace the memcpy() with a w1_master_dev_init() helper that sets only
bus, type, and release.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Compile-tested only, no hardware available.
---
 drivers/w1/w1.c          | 15 +++++++--------
 drivers/w1/w1_int.c      |  7 +++----
 drivers/w1/w1_internal.h |  2 +-
 3 files changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index b40f2d9fd29d..d71e2a1568bd 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -193,19 +193,18 @@ struct device_driver w1_master_driver = {
 	.bus = &w1_bus_type,
 };
 
-struct device w1_master_device = {
-	.parent = NULL,
-	.bus = &w1_bus_type,
-	.type = &w1_master_device_type,
-	.init_name = "w1 bus master",
-	.release = &w1_master_release
-};
-
 static struct device_driver w1_slave_driver = {
 	.name = "w1_slave_driver",
 	.bus = &w1_bus_type,
 };
 
+void w1_master_dev_init(struct device *dev)
+{
+	dev->bus = &w1_bus_type;
+	dev->type = &w1_master_device_type;
+	dev->release = &w1_master_release;
+}
+
 #if 0
 struct device w1_slave_device = {
 	.parent = NULL,
diff --git a/drivers/w1/w1_int.c b/drivers/w1/w1_int.c
index 19a0ea28e9f3..a59ca19471e0 100644
--- a/drivers/w1/w1_int.c
+++ b/drivers/w1/w1_int.c
@@ -22,8 +22,7 @@ static int w1_enable_pullup = 1;
 module_param_named(enable_pullup, w1_enable_pullup, int, 0);
 
 static struct w1_master *w1_alloc_dev(u32 id, int slave_count, int slave_ttl,
-				       struct device_driver *driver,
-				       struct device *device)
+				       struct device_driver *driver)
 {
 	struct w1_master *dev;
 	int err;
@@ -57,7 +56,7 @@ static struct w1_master *w1_alloc_dev(u32 id, int slave_count, int slave_ttl,
 	mutex_init(&dev->bus_mutex);
 	mutex_init(&dev->list_mutex);
 
-	memcpy(&dev->dev, device, sizeof(struct device));
+	w1_master_dev_init(&dev->dev);
 	dev_set_name(&dev->dev, "w1_bus_master%u", dev->id);
 	snprintf(dev->name, sizeof(dev->name), "w1_bus_master%u", dev->id);
 	dev->dev.init_name = dev->name;
@@ -116,7 +115,7 @@ int w1_add_master_device(struct w1_bus_master *master)
 	} while (found);
 
 	dev = w1_alloc_dev(id, w1_max_slave_count, w1_max_slave_ttl,
-		&w1_master_driver, &w1_master_device);
+		&w1_master_driver);
 	if (!dev) {
 		mutex_unlock(&w1_mlock);
 		return -ENOMEM;
diff --git a/drivers/w1/w1_internal.h b/drivers/w1/w1_internal.h
index cb5a74e9939a..ffe7c7e8c4ca 100644
--- a/drivers/w1/w1_internal.h
+++ b/drivers/w1/w1_internal.h
@@ -65,7 +65,7 @@ void __w1_family_get(struct w1_family *f);
 struct w1_family *w1_family_registered(u8 fid);
 
 extern struct device_driver w1_master_driver;
-extern struct device w1_master_device;
+void w1_master_dev_init(struct device *dev);
 extern int w1_max_slave_count;
 extern int w1_max_slave_ttl;
 extern struct list_head w1_masters;
-- 
2.55.0

