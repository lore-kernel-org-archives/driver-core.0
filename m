Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EB138C2D2
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530106; cv=none; b=md88zU5dk1e+J5+8FzdF+559xN5KB/Hh9R7YcAb+BnCDtGsA4M9T/pz30/KotgkuVrJ0kc3qVp9Fya9atvxCZvhHOLYok51veVqOi8W8gqKa8nUcterKQve7ouzE0Dz5kkeHYghW3rNQ3NQ7agM2tOo3cjgE/00vpKByFmVQ9CY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530106; c=relaxed/simple;
	bh=yE91OKGLs2uTQUKjWEljRwzeF7bgU+XX9O7nDFSUduc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bWqpSM8EQ/IvwreU3zWWTLV12sKoZCYu0YJYyfDz2wJS6xo4hewiu6pllYGt6tOIxg4jvNj5CgOdcObB1agC1hos9MuxbzWHztpa3ATkPjwulc6/ULne9DDeT9zBuk/QjT/LCgsPE0HlglahbfKj8tTvmSRWMbbhjIXiqVuH0JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AskOa+lW; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AskOa+lW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772530105; x=1804066105;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yE91OKGLs2uTQUKjWEljRwzeF7bgU+XX9O7nDFSUduc=;
  b=AskOa+lWqdRZvMjpud/zyMSvPLdOH0j1LTV+MyxErfmriJX4UGXL1vLU
   V9zWhTsHr3qWJzDR88u8w1AnmzJF03QSDlJta9KDCRnLeNAhjBdnTG709
   W4s3tFLvulA0IJgdXjPa7jgc6C3AoxdnIQFPrucEk5UYtYvH0dYNhnn1h
   eiLcXo9fuowoVNJplxxLfXYqEueLVcYx4TfnO6yzek+zZ7+wSrWKj42pn
   LECgkrTcqyDHSXqMkY9lPE6tfLn4lsa0rP9FqqS3rpfUjN1glSRFZgE2m
   W8Fwgc2l8Gi0tDBCHpC1ha16ikO2BinNv7DV3cQRbiGqUYHqOmpXBPGtV
   g==;
X-CSE-ConnectionGUID: 5c3BwxXcT4GNQ78lSYiY5A==
X-CSE-MsgGUID: WhM09rdtQ02onMiM9VQNcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="99035058"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="99035058"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 01:28:24 -0800
X-CSE-ConnectionGUID: oJi74WpkRAKnoc0lnA206w==
X-CSE-MsgGUID: DjHQ2IzsSM+cZVA2C6XXIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="217927464"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 03 Mar 2026 01:28:23 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2F83198; Tue, 03 Mar 2026 10:28:21 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 1/2] regcache: Factor out regcache_hw_exit() helper
Date: Tue,  3 Mar 2026 10:26:24 +0100
Message-ID: <20260303092820.2818138-2-andriy.shevchenko@linux.intel.com>
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

Factor out regcache_hw_exit() helper to make error and exit paths
clearer. This helps to avoid missing changes in case the code gets
shuffled in the future.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regcache.c | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 13c480b6e21d..329cdee1ae1c 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -131,6 +131,13 @@ static int regcache_hw_init(struct regmap *map, int count)
 	return ret;
 }
 
+static void regcache_hw_exit(struct regmap *map)
+{
+	kfree(map->reg_defaults);
+	if (map->cache_free)
+		kfree(map->reg_defaults_raw);
+}
+
 int regcache_init(struct regmap *map, const struct regmap_config *config)
 {
 	int count = 0;
@@ -245,9 +252,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		map->unlock(map->lock_arg);
 	}
 err_free:
-	kfree(map->reg_defaults);
-	if (map->cache_free)
-		kfree(map->reg_defaults_raw);
+	regcache_hw_exit(map);
 
 	return ret;
 }
@@ -259,9 +264,7 @@ void regcache_exit(struct regmap *map)
 
 	BUG_ON(!map->cache_ops);
 
-	kfree(map->reg_defaults);
-	if (map->cache_free)
-		kfree(map->reg_defaults_raw);
+	regcache_hw_exit(map);
 
 	if (map->cache_ops->exit) {
 		dev_dbg(map->dev, "Destroying %s cache\n",
-- 
2.50.1

