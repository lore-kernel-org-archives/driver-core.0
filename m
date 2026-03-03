Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A66738C40F
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 09:28:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530107; cv=none; b=Tt1IxfPgSH/TjGBNlP17BtLRkXu0BavKBxKt5VzqgqRsbsBE5lQz7USiH3pjUgBex6KNIhaeGx5ZcayOap0X+LPVJRjaL+XEDuzR69rP8AkJRaQ28VI5iXL/ntzWGIo/stAgMFHkB6k1AIjHz8jIE09N4CB8ha2cnIsl4P7Pa/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530107; c=relaxed/simple;
	bh=COVnH2ytVPCM/6gpIZlke7Xd41k7QzVJ48aO0t2mQdg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uZQiVN1Mtqy+zsup4Lo02BuIcrL7Hp0jsxban/LMkeGw6GY9HbgI4h3ykOW1/1KaaA5Gt4iPcRnXsh4/x3CnotJxsZZzFCf1GtgRmv2SFlAZ4/7rQl9llMPzw7OuJvgA5e/6t/kKoWJr2d/OsdhkPi9b+7TXWVl8kDrUb8Dcudw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LH/PeGN4; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LH/PeGN4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772530106; x=1804066106;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=COVnH2ytVPCM/6gpIZlke7Xd41k7QzVJ48aO0t2mQdg=;
  b=LH/PeGN4Vypg5tR+FNtJlcoRrsHgecSoJyXBT5xtKgv4SDFyBgM58l6c
   /7ft4J7aUy7bGLYgl1Iypd+ayPTjt+vCPZ7BJ5SPn4O1Wys9kE3kzRsgl
   v7U3BHgWQU90sP5/m7ZgXggX3Cn4AxVRSuv09IS3PByGS/cZChW7Hea2T
   npAQLsXywP5criJR0+EO4Oh/+fnGPLW0GVi9HdGdj4SGbv6rtDBrN3gGn
   xyFUOaDb0hada5AF9Tg7AhTxtqwJeoC9po3ks9pt1UxEv1C+NKaK3N5nQ
   P+EQ5G8Gntc4/8FGZVbSdu//rj/nmLUutc39rRrPOoo9xDFU6ZXGFZMuN
   A==;
X-CSE-ConnectionGUID: Kjs8PCduQNCQBDJ8jKEeEQ==
X-CSE-MsgGUID: J1Dt35rhQRqwqz8RBvk0UA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="76158830"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="76158830"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 01:28:24 -0800
X-CSE-ConnectionGUID: 5fCM5T8ERwS4OK93iqH8UQ==
X-CSE-MsgGUID: hBnlXx+QT8GfWR5tvDDjUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="222095482"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2026 01:28:23 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 33C6699; Tue, 03 Mar 2026 10:28:21 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 2/2] regcache: Move HW readback after cache initialisation
Date: Tue,  3 Mar 2026 10:26:25 +0100
Message-ID: <20260303092820.2818138-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260303092820.2818138-1-andriy.shevchenko@linux.intel.com>
References: <20260303092820.2818138-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make sure that cache is initialised before calling any IO
using regmap, this makes sure that we won't access NULL or
invalid pointers in the cache which hasn't been initialised.

As a side effect it also makes the ordering of cleaning up
the resources in regcache_exit() to be the same (and correct)
as in the error path of regcache_init(). This is not a problem
right now as they do not have dependencies, but it makes code
robust against potential changes in the future.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regcache.c | 33 +++++++++++++++++++++------------
 1 file changed, 21 insertions(+), 12 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 329cdee1ae1c..5beada4ca64c 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -66,6 +66,14 @@ static int regcache_hw_init(struct regmap *map, int count)
 	unsigned int reg, val;
 	void *tmp_buf;
 
+	/*
+	 * When count is zero, it means there is nothing to cache and hence
+	 * nothing to read back from HW to set up defaults, so skip this phase
+	 * without an error code returned.
+	 */
+	if (!count)
+		return 0;
+
 	map->num_reg_defaults = count;
 	map->reg_defaults = kmalloc_objs(struct reg_default, count);
 	if (!map->reg_defaults)
@@ -208,14 +216,6 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		count = regcache_count_cacheable_registers(map);
 		if (map->cache_bypass)
 			return 0;
-
-		/* Some devices such as PMICs don't have cache defaults,
-		 * we cope with this by reading back the HW registers and
-		 * crafting the cache defaults by hand.
-		 */
-		ret = regcache_hw_init(map, count);
-		if (ret < 0)
-			return ret;
 	}
 
 	if (!map->max_register_is_set && map->num_reg_defaults_raw) {
@@ -230,9 +230,18 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		ret = map->cache_ops->init(map);
 		map->unlock(map->lock_arg);
 		if (ret)
-			goto err_free;
+			return ret;
 	}
 
+	/*
+	 * Some devices such as PMICs don't have cache defaults,
+	 * we cope with this by reading back the HW registers and
+	 * crafting the cache defaults by hand.
+	 */
+	ret = regcache_hw_init(map, count);
+	if (ret)
+		goto err_exit;
+
 	if (map->cache_ops->populate &&
 	    (map->num_reg_defaults || map->reg_default_cb)) {
 		dev_dbg(map->dev, "Populating %s cache\n", map->cache_ops->name);
@@ -240,10 +249,12 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		ret = map->cache_ops->populate(map);
 		map->unlock(map->lock_arg);
 		if (ret)
-			goto err_exit;
+			goto err_free;
 	}
 	return 0;
 
+err_free:
+	regcache_hw_exit(map);
 err_exit:
 	if (map->cache_ops->exit) {
 		dev_dbg(map->dev, "Destroying %s cache\n", map->cache_ops->name);
@@ -251,8 +262,6 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		ret = map->cache_ops->exit(map);
 		map->unlock(map->lock_arg);
 	}
-err_free:
-	regcache_hw_exit(map);
 
 	return ret;
 }
-- 
2.50.1

