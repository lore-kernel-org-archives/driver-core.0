Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B16A4346FA1
	for <driver-core@lists.linux.dev>; Thu, 18 Jun 2026 19:40:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781811647; cv=none; b=r52/9T4fx2PVZ4sNZ8wmmWUxfph1yd7XXF0BiGsNTw/Eq2qaQLa1uhcYse7+uu/9egodvLEHcSXXbhFX+CRA8lI5UI2d7MoEvrXVAd88ptoEn56j4m+Bu//8GTREQVvgeTRehAl5Sk+qVgSZYZsE4ItLiUedhd91r4+8BfeYGA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781811647; c=relaxed/simple;
	bh=Tx4M/Sup4c2TbP20JbtyaZvWcj0EZn+G0lx9l36yXds=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KL2KDFVzeYV3CaV2HEqp6Zzw5uHVFKt1+xZbNj5ar75Sb75764ghrfijw/cEaG9ulnLlfFyT+E2V+Nb3O4yFH6cG8T40JEhfGt77ZICpRs+95mCNm29f1xLDPgwDPNxVZlnCsUYdi+LKv5An9S8NA+7Lufg2k46T6X/rDS1T8/Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAt2ot2B; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAt2ot2B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781811645; x=1813347645;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Tx4M/Sup4c2TbP20JbtyaZvWcj0EZn+G0lx9l36yXds=;
  b=LAt2ot2B2oyumzpP/gKpKD/EizS3ar1VkFzJKQSbrsLbMQpu2DGTBARw
   5TMkoonmA55UBLSJ4bj8fUGOlYpk+nKIHfLIhh/WEZ3rdlTZteFoXL0Gc
   060nZwNLnRwH0bCxCxD5kSIclC4THXFJQ1OnnsP9KJK+OBZk1HO0yntxy
   2zYsqQoCBeG/ErHYAggv2bQ8GslfXzzuz6mpFFL9T6wyVnCA7ob1be3em
   SdpIDk280QNIJ8zYjh0QkwtsWN+fiQum52UuJ68dlGJEmiXwjJvv7vPsQ
   QC8H29a9Ccr0HQV/OMwNUdQPa6k6OOEkiPhBaASHGqE5YUk0AiJ6ibgzf
   w==;
X-CSE-ConnectionGUID: ZDW3xYogRXKZFDprgksm+Q==
X-CSE-MsgGUID: M22ypE7+RPeAhorCUpyd8A==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="81647675"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="81647675"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 12:40:45 -0700
X-CSE-ConnectionGUID: ADPYss47QyGrxuSSc0yhkg==
X-CSE-MsgGUID: yBL5stVZTfO/B8at09Xi3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="252764940"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 18 Jun 2026 12:40:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 028D995; Thu, 18 Jun 2026 21:40:41 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sander Vanheule <sander@svanheule.net>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v1 1/1] regcache: Make ->exit() callback return void
Date: Thu, 18 Jun 2026 21:39:50 +0200
Message-ID: <20260618194036.3275202-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We do not check an error code from ->exit() callback, nor we ever
return one (it's always 0, meaning success). Make ->exit() callback
return void.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

This depends on recently accepted fix that dropped the returned value checks
for ->exit() callback.

 drivers/base/regmap/internal.h        | 2 +-
 drivers/base/regmap/regcache-flat.c   | 4 +---
 drivers/base/regmap/regcache-maple.c  | 6 ++----
 drivers/base/regmap/regcache-rbtree.c | 8 +++-----
 4 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index 55273a6178f8..a6e4689000af 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -189,7 +189,7 @@ struct regcache_ops {
 	const char *name;
 	enum regcache_type type;
 	int (*init)(struct regmap *map);
-	int (*exit)(struct regmap *map);
+	void (*exit)(struct regmap *map);
 	int (*populate)(struct regmap *map);
 #ifdef CONFIG_DEBUG_FS
 	void (*debugfs_init)(struct regmap *map);
diff --git a/drivers/base/regmap/regcache-flat.c b/drivers/base/regmap/regcache-flat.c
index 025e6749bb24..be8497fd240c 100644
--- a/drivers/base/regmap/regcache-flat.c
+++ b/drivers/base/regmap/regcache-flat.c
@@ -53,7 +53,7 @@ static int regcache_flat_init(struct regmap *map)
 	return -ENOMEM;
 }
 
-static int regcache_flat_exit(struct regmap *map)
+static void regcache_flat_exit(struct regmap *map)
 {
 	struct regcache_flat_data *cache = map->cache;
 
@@ -62,8 +62,6 @@ static int regcache_flat_exit(struct regmap *map)
 
 	kfree(cache);
 	map->cache = NULL;
-
-	return 0;
 }
 
 static int regcache_flat_populate(struct regmap *map)
diff --git a/drivers/base/regmap/regcache-maple.c b/drivers/base/regmap/regcache-maple.c
index 49ba7282e4b8..9d2f3a23ffb2 100644
--- a/drivers/base/regmap/regcache-maple.c
+++ b/drivers/base/regmap/regcache-maple.c
@@ -307,7 +307,7 @@ static int regcache_maple_init(struct regmap *map)
 	return 0;
 }
 
-static int regcache_maple_exit(struct regmap *map)
+static void regcache_maple_exit(struct regmap *map)
 {
 	struct maple_tree *mt = map->cache;
 	MA_STATE(mas, mt, 0, UINT_MAX);
@@ -315,7 +315,7 @@ static int regcache_maple_exit(struct regmap *map)
 
 	/* if we've already been called then just return */
 	if (!mt)
-		return 0;
+		return;
 
 	mas_lock(&mas);
 	mas_for_each(&mas, entry, UINT_MAX)
@@ -325,8 +325,6 @@ static int regcache_maple_exit(struct regmap *map)
 
 	kfree(mt);
 	map->cache = NULL;
-
-	return 0;
 }
 
 static int regcache_maple_insert_block(struct regmap *map, int first,
diff --git a/drivers/base/regmap/regcache-rbtree.c b/drivers/base/regmap/regcache-rbtree.c
index a69e8b4c359b..520d5f8ba3cd 100644
--- a/drivers/base/regmap/regcache-rbtree.c
+++ b/drivers/base/regmap/regcache-rbtree.c
@@ -16,7 +16,7 @@
 
 static int regcache_rbtree_write(struct regmap *map, unsigned int reg,
 				 unsigned int value);
-static int regcache_rbtree_exit(struct regmap *map);
+static void regcache_rbtree_exit(struct regmap *map);
 
 struct regcache_rbtree_node {
 	/* block of adjacent registers */
@@ -196,7 +196,7 @@ static int regcache_rbtree_init(struct regmap *map)
 	return 0;
 }
 
-static int regcache_rbtree_exit(struct regmap *map)
+static void regcache_rbtree_exit(struct regmap *map)
 {
 	struct rb_node *next;
 	struct regcache_rbtree_ctx *rbtree_ctx;
@@ -205,7 +205,7 @@ static int regcache_rbtree_exit(struct regmap *map)
 	/* if we've already been called then just return */
 	rbtree_ctx = map->cache;
 	if (!rbtree_ctx)
-		return 0;
+		return;
 
 	/* free up the rbtree */
 	next = rb_first(&rbtree_ctx->root);
@@ -221,8 +221,6 @@ static int regcache_rbtree_exit(struct regmap *map)
 	/* release the resources */
 	kfree(map->cache);
 	map->cache = NULL;
-
-	return 0;
 }
 
 static int regcache_rbtree_populate(struct regmap *map)
-- 
2.50.1

