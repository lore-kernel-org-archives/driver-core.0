Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDAA30FC26
	for <driver-core@lists.linux.dev>; Thu,  5 Mar 2026 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700896; cv=none; b=onl7Ol5OkHWmc680Qf/iSk12lfH27ogIDxjXvJ1kE6f4sff3gDDvOf5X7qCEIHly9xbgO/C/4B1b+04fpE7rjArIm2rfR2jKgVwjWA4WrBXqS84Zud3dMWC7rg8cRLeMPUkCcJ9F7veEwWmDcqOGH+WrDv9oh1YXEeufqyBE/lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700896; c=relaxed/simple;
	bh=9P5dpYxQuWcUjFjd+RUZceybv8gUSEaT/oC+QYdlkBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ag9lWeEeFdhoitRraD+6Mpye5tiloNgxkKjPL4RSJ5HBY8bx7O9iBoWsgwJ3FMMJaDVk7zMwjny7Ra7i8Bm3fXjstAChwcMbCoNVSel/XGsj2XbM+JKaRjfDP2y2tAcLTCaw945b6IE8Wm8LrLxguViuakh07s95FWmgmcmi9ck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TnnU8OEP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TnnU8OEP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772700896; x=1804236896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9P5dpYxQuWcUjFjd+RUZceybv8gUSEaT/oC+QYdlkBE=;
  b=TnnU8OEPa9xGj7f+WLGAuELzbg9lwij1JExbC8mUAmXeFr3SHLb3fxCp
   CCJT5Lkw3eUSXW/5YLXWcw27ikcF2TR++GTiu8cwcRLvTCT1S6MMpiMVZ
   V4M3oranat2YiIR9suVUnQ67p0pSG8259lf87EihNNvPkR5A5GTYHBod5
   S4GKiLl9GdlhunQaw+dvNUGk+alCI91mNMNyj7cEfh3PS/g8ifG7kqX6K
   M45FSDV+MxqN2FGAou/oxhhUInZq5w46PIMOXaDfGGjlKC2W1jA5WKxD6
   /5cXgus7Zcvq/4HGi0tYddEATYg885ZRlyMqYUp8calSIHGWslkmP7HAI
   Q==;
X-CSE-ConnectionGUID: TgZxVlEXQp27XwAfH7CrnA==
X-CSE-MsgGUID: fQOYzKn8Rny1Qh2Z6w0uKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73687436"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73687436"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:54:53 -0800
X-CSE-ConnectionGUID: Sbs7cjivR3Snq2Necac6cw==
X-CSE-MsgGUID: 6fib0Z6YR8Cbez5VDyURew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="216425988"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2026 00:54:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5B93999; Thu, 05 Mar 2026 09:54:50 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v6 2/3] regcache: Allocate and free reg_defaults on the same level
Date: Thu,  5 Mar 2026 09:53:01 +0100
Message-ID: <20260305085449.3184020-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260305085449.3184020-1-andriy.shevchenko@linux.intel.com>
References: <20260305085449.3184020-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently reg_defaults buffer may be allocated on two different
levels when the user provided them and we duplicate it in regcache_init()
or when user wants us to read back from HW in regcache_hw_init().
This inconsistency makes code harder to follow and maintain. Allocate
and free reg_defaults on the same level in regcache_init() to improve
the readability and maintenance efforts.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regcache.c | 34 +++++++++++++++-------------------
 1 file changed, 15 insertions(+), 19 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index b73de70bbf3f..e9d95aa63938 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -56,17 +56,12 @@ static int regcache_count_cacheable_registers(struct regmap *map)
 	return count;
 }
 
-static int regcache_hw_init(struct regmap *map, int count)
+static int regcache_hw_init(struct regmap *map)
 {
 	int ret;
 	unsigned int reg, val;
 	void *tmp_buf;
 
-	map->num_reg_defaults = count;
-	map->reg_defaults = kmalloc_objs(struct reg_default, count);
-	if (!map->reg_defaults)
-		return -ENOMEM;
-
 	if (!map->reg_defaults_raw) {
 		bool cache_bypass = map->cache_bypass;
 		dev_dbg(map->dev, "No cache defaults, reading back from HW\n");
@@ -74,10 +69,8 @@ static int regcache_hw_init(struct regmap *map, int count)
 		/* Bypass the cache access till data read from HW */
 		map->cache_bypass = true;
 		tmp_buf = kmalloc(map->cache_size_raw, GFP_KERNEL);
-		if (!tmp_buf) {
-			ret = -ENOMEM;
-			goto err_free;
-		}
+		if (!tmp_buf)
+			return -ENOMEM;
 		ret = regmap_raw_read(map, 0, tmp_buf,
 				      map->cache_size_raw);
 		map->cache_bypass = cache_bypass;
@@ -110,7 +103,7 @@ static int regcache_hw_init(struct regmap *map, int count)
 			if (ret != 0) {
 				dev_err(map->dev, "Failed to read %x: %d\n",
 					reg, ret);
-				goto err_free;
+				return ret;
 			}
 		}
 
@@ -120,16 +113,10 @@ static int regcache_hw_init(struct regmap *map, int count)
 	}
 
 	return 0;
-
-err_free:
-	kfree(map->reg_defaults);
-
-	return ret;
 }
 
 static void regcache_hw_exit(struct regmap *map)
 {
-	kfree(map->reg_defaults);
 	if (map->cache_free)
 		kfree(map->reg_defaults_raw);
 }
@@ -209,13 +196,18 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		if (map->cache_bypass)
 			return 0;
 
+		map->num_reg_defaults = count;
+		map->reg_defaults = kmalloc_objs(struct reg_default, count);
+		if (!map->reg_defaults)
+			return -ENOMEM;
+
 		/* Some devices such as PMICs don't have cache defaults,
 		 * we cope with this by reading back the HW registers and
 		 * crafting the cache defaults by hand.
 		 */
-		ret = regcache_hw_init(map, count);
+		ret = regcache_hw_init(map);
 		if (ret < 0)
-			return ret;
+			goto err_free_reg_defaults;
 	}
 
 	if (!map->max_register_is_set && map->num_reg_defaults_raw) {
@@ -253,6 +245,8 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	}
 err_free:
 	regcache_hw_exit(map);
+err_free_reg_defaults:
+	kfree(map->reg_defaults);
 
 	return ret;
 }
@@ -273,6 +267,8 @@ void regcache_exit(struct regmap *map)
 		map->cache_ops->exit(map);
 		map->unlock(map->lock_arg);
 	}
+
+	kfree(map->reg_defaults);
 }
 
 /**
-- 
2.50.1

