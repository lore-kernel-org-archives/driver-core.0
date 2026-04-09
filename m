Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB41829D29F
	for <driver-core@lists.linux.dev>; Thu,  9 Apr 2026 03:51:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775706687; cv=none; b=HEUyf6LHfEQTGd237Eu8r+1u5ps1HwJ5Y+5SXkt2oKoHz19BHllR1D1AK+Axr8OwAQlv1AtaQjhDgCmYq5VCs0mGwLQdg0JJQk4XXBw4LhCiojbmZna59/1xXd98IKVtqPCcyK1YDKKI0MZeZtfErI7Nfyfgp/thit0kAX2YHRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775706687; c=relaxed/simple;
	bh=jQeg69YQKYn0VFpcS13LkJvZxFfLvhw/HHMWSe69x3Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GOFccPCbGxH/AEoE+uBcXYW+DhN7cWHijksVxcooKtf9bTuCiRX0oQ4rYGs4bpkQrpuWno2HDPNUJlMj7RUmGM7BZ7F858WivErTnZL5c0AliyrIUapW6+0GAIIHzYyBm5+qG6MQhwWFoilZ3z0DB3lKQpo+9Dspgqo0XXflwkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VKmpB6r5; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VKmpB6r5"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-82cd5c07f93so248179b3a.1
        for <driver-core@lists.linux.dev>; Wed, 08 Apr 2026 20:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775706685; x=1776311485; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lJUyfGutcgNErN7QvADBH8DmYA64xB1+DKMG5W68/Ys=;
        b=VKmpB6r55CaEJwAUhjFLFJ1LixIOW9pGos+9grvudA+EQLwQ3Casv7y8IKD+cRv4JE
         0OMccldmrSogczl/JOMa5U2AZgoPnbtggnRlBNiRnOzIm9916qP1qbAmvQcGE6pP414r
         XfiwWAlyGACnfEhwOsMoDXq3FzSJo2yxIf6tlYSP9WuG7oFsJnz2USlsz8052Erk2lg4
         tEtjJyW67tyNjEhO6zdHAfwsvbeGOJ3r9vU5Jf75X00w1V50DHkeScATeO5GZ1XshRRA
         7weRJV8oTekoNfqcO+ZRfiFcSOBwx3geIpBVZDUTpdaj9y5HCmYZ1pq2UbNC1Pvh/JFn
         Jh+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775706685; x=1776311485;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lJUyfGutcgNErN7QvADBH8DmYA64xB1+DKMG5W68/Ys=;
        b=dl0GcjemNux/CIFgkU5aJo43t3BDaWXHlPb+z6gzEQtvUQAJfnXayj1A68FQ0co8RT
         9wpKCa76BlBSMv2Z+mPQ3boSC8aCOo72WwjfSQkCEPg9VqH/quiGsoK1wOI/5t1GF6G0
         00ZkKgFxk5raEgoYI8jOKHYQtC9uew4lmeUE8fcDYI6VazUvugODvXiRVtwtiTRS+VEE
         ALEVNEgDI87MlbxRnlBHfwgduSeq9/1wU7VSWC5Kane2a7gtsFwnCNqOgo5LNTg8Cp2G
         3HxqyTAaewXMTrLZK06MaOdoXp75ckbpgmDhDQ84pPi28+EFwhXBu1PgC25ZCZkkiSkG
         RUqA==
X-Forwarded-Encrypted: i=1; AJvYcCXp4zAbMXoTKD7lmwEurDzrZJ3/StuLGwFZx2g/ScT1bgxIurmjTCSL81Ue4Xy++vCZDDYUlDcASIFShQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzaZN5n1ZFGse5H5HeacqwfgRO5HPGdiRYH1tvXjej5rWHcZ6nW
	n9HR+/igcaQ4IaDQSqsRZXEQKqNpG8NI9feAW/keNBlab66S82C6TdrX
X-Gm-Gg: AeBDiethntkq67zSKIKNzoVsRPkr0aW/PZf7HwHxRp32h1ffv442MML4v/hKFpLXOAW
	0ThfI0y0NhqsT9GK+8mMh5bAn1caUVfipOv8ApDzMTvMgL5nN6r2xEsuVs7+5FcyUPfeUcKQJYp
	qxnJVwCDo7pKUd1t7kGTB5V2Br+VXCjYTs8GMhoG8gzrHILD4t48A7uiTjubY/tY9em1tn51Pcr
	BXnlqNGv42XSFQt2A7rFaLOlYhOlX1EmEvLdc+TuBPEe0xqwcdEatO17Aif8qpE8yr3foI67/Bp
	1R6uPjiBRrUyaWmsd8lnIE9MGKyDXOIQfg80JQnR+WdKUFCWOLeuXYEdMr947mqahubW6VUtGcd
	g5d7Q86hoJtuVIInU5klk56VyUKWrDHGn17kydUVcMsVDUPZeaIF9MKPsdv1WqDYFeVgMQpSlBd
	4GMal7bUNh+feYittGKQCMHQaZbw==
X-Received: by 2002:a05:6a00:ab87:b0:82c:24a9:d5f1 with SMTP id d2e1a72fcca58-82d0db3f376mr23845609b3a.30.1775706685085;
        Wed, 08 Apr 2026 20:51:25 -0700 (PDT)
Received: from user.. ([39.170.101.209])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82cf9b27313sm22703207b3a.5.2026.04.08.20.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 20:51:24 -0700 (PDT)
From: Zxyan Zhu <zxyan0222@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Zxyan Zhu <zxyan0222@gmail.com>
Subject: [PATCH v2] regmap: debugfs: fix race condition in dummy name allocation
Date: Thu,  9 Apr 2026 11:50:15 +0800
Message-Id: <20260409035015.950764-1-zxyan0222@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <2026040834-runaround-glass-8ea6@gregkh>
References: <2026040834-runaround-glass-8ea6@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use IDA instead of a simple counter for generating unique dummy names.
The previous implementation used dummy_index++ which is not atomic,
leading to potential duplicate names when multiple threads call
regmap_debugfs_init() concurrently with name="dummy".

Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>
---
 drivers/base/regmap/internal.h       |  1 +
 drivers/base/regmap/regmap-debugfs.c | 21 ++++++++++++++++-----
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index 5bf993165438..e067890866c1 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -84,6 +84,7 @@ struct regmap {
 	bool debugfs_disable;
 	struct dentry *debugfs;
 	const char *debugfs_name;
+	int debugfs_dummy_id;
 
 	unsigned int debugfs_reg_len;
 	unsigned int debugfs_val_len;
diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
index 5a46ce5fee72..18f1c60749fe 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -12,6 +12,7 @@
 #include <linux/uaccess.h>
 #include <linux/device.h>
 #include <linux/list.h>
+#include <linux/idr.h>
 
 #include "internal.h"
 
@@ -20,7 +21,7 @@ struct regmap_debugfs_node {
 	struct list_head link;
 };
 
-static unsigned int dummy_index;
+static DEFINE_IDA(dummy_ida);
 static struct dentry *regmap_debugfs_root;
 static LIST_HEAD(regmap_debugfs_early_list);
 static DEFINE_MUTEX(regmap_debugfs_early_lock);
@@ -539,6 +540,7 @@ void regmap_debugfs_init(struct regmap *map)
 	struct regmap_range_node *range_node;
 	const char *devname = "dummy";
 	const char *name = map->name;
+	int id;
 
 	/*
 	 * Userspace can initiate reads from the hardware over debugfs.
@@ -567,6 +569,7 @@ void regmap_debugfs_init(struct regmap *map)
 
 	INIT_LIST_HEAD(&map->debugfs_off_cache);
 	mutex_init(&map->cache_lock);
+	map->debugfs_dummy_id = -1;
 
 	if (map->dev)
 		devname = dev_name(map->dev);
@@ -585,12 +588,16 @@ void regmap_debugfs_init(struct regmap *map)
 
 	if (!strcmp(name, "dummy")) {
 		kfree(map->debugfs_name);
-		map->debugfs_name = kasprintf(GFP_KERNEL, "dummy%d",
-						dummy_index);
-		if (!map->debugfs_name)
+		id = ida_alloc(&dummy_ida, GFP_KERNEL);
+		if (id < 0)
 			return;
+		map->debugfs_name = kasprintf(GFP_KERNEL, "dummy%d", id);
+		if (!map->debugfs_name) {
+			ida_free(&dummy_ida, id);
+			return;
+		}
+		map->debugfs_dummy_id = id;
 		name = map->debugfs_name;
-		dummy_index++;
 	}
 
 	map->debugfs = debugfs_create_dir(name, regmap_debugfs_root);
@@ -660,6 +667,10 @@ void regmap_debugfs_exit(struct regmap *map)
 		mutex_lock(&map->cache_lock);
 		regmap_debugfs_free_dump_cache(map);
 		mutex_unlock(&map->cache_lock);
+		if (map->debugfs_dummy_id >= 0) {
+			ida_free(&dummy_ida, map->debugfs_dummy_id);
+			map->debugfs_dummy_id = -1;
+		}
 		kfree(map->debugfs_name);
 		map->debugfs_name = NULL;
 	} else {
-- 
2.34.1

