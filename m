Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5108B3D6463
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 16:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772036230; cv=none; b=XYiwPKun29nnar8QZlRGQ9fIRqKyRSprfxqtPbwv6gtqt+aYEeUPQTJIx/vcm3lSRN3d62SPExcl7+B/pp+IXHtCuNF/9hjSSkH7mm3hm0L3Ocu8sOVOmi9u8gxuutmRkQGEtrAg3zyUiCVgv4mUYYbP/MbZsIWhf1adSjGKJFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772036230; c=relaxed/simple;
	bh=KB5uIH+bxuXS+jO+xUrSeBRqrW2qkuL+VRN/E6aFTsI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cDr1RLRE3OLmhSzzZLh+jqdLo2NICq71IvLftW8SaM4dseFnL6guvi6EQwj0CB8yONPukKyGwoC7GP/i8KN8aYM3Z33veBlNCR3RRYD9TdFoqIUFNOTTKLmeO1ewhopSqj8g9l14CWiPJsNVpKOH8g490z55Bev+xoEfwycseVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+XWlmaI; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+XWlmaI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772036226; x=1803572226;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=KB5uIH+bxuXS+jO+xUrSeBRqrW2qkuL+VRN/E6aFTsI=;
  b=R+XWlmaIVkY1JLtuiRvJJWWqBFZnlDL7pI6iySvryehGGSYYuJEskaNb
   LrPlr6htWR+nOqEMHpbu9p5QtAAYjG9Bsc01N9MipopwC0KIjBuyoceyb
   lS6IM4hvA/F3duH1me09KcjV7OHMFQ8r0c9Az9UhPw1E9wVdl5Jv+Bsl2
   5K4nsE+3W1jnXCs3KF1PkNMHIzSh5nzwnESj3SDjnzC11ZsXqYpQZG2ee
   y9yHIVFe67bE5+ARB8tCVfMILDwWHv6F8AOocfMQQXmOcFwjLT8dXd7f3
   MRgHfKV6luYXss1eS8WhR0nu5P90W/36nJ34pjB6uutfftLOLT8HuhodX
   g==;
X-CSE-ConnectionGUID: P29Ns53fSry4D3P1nBzHmA==
X-CSE-MsgGUID: cFk8zgjoSxykTZulMo9ueg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72783296"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="72783296"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:17:03 -0800
X-CSE-ConnectionGUID: lSjHeH+gRBira1jP/RgY3w==
X-CSE-MsgGUID: yoYN6fnCQka7mg/vmXXBnQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2026 08:17:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id BCE959B; Wed, 25 Feb 2026 17:17:00 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 2/5] regcache: Split regcache_count_cacheable_registers() helper
Date: Wed, 25 Feb 2026 17:15:56 +0100
Message-ID: <20260225161659.3811671-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
References: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The introduced helper allows to check for the non-cacheable configurations
earlier during initialisation.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regcache.c | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index d41cdb39c78f..73cfe8120669 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -42,13 +42,10 @@ void regcache_sort_defaults(struct reg_default *defaults, unsigned int ndefaults
 }
 EXPORT_SYMBOL_GPL(regcache_sort_defaults);
 
-static int regcache_hw_init(struct regmap *map)
+static int regcache_count_cacheable_registers(struct regmap *map)
 {
-	int i, j;
-	int ret;
 	int count;
-	unsigned int reg, val;
-	void *tmp_buf;
+	int i;
 
 	/* calculate the size of reg_defaults */
 	for (count = 0, i = 0; i < map->num_reg_defaults_raw; i++)
@@ -57,10 +54,18 @@ static int regcache_hw_init(struct regmap *map)
 			count++;
 
 	/* all registers are unreadable or volatile, so just bypass */
-	if (!count) {
+	if (!count)
 		map->cache_bypass = true;
-		return 0;
-	}
+
+	return count;
+}
+
+static int regcache_hw_init(struct regmap *map, int count)
+{
+	int i, j;
+	int ret;
+	unsigned int reg, val;
+	void *tmp_buf;
 
 	map->num_reg_defaults = count;
 	map->reg_defaults = kmalloc_objs(struct reg_default, count);
@@ -129,6 +134,7 @@ static int regcache_hw_init(struct regmap *map)
 
 int regcache_init(struct regmap *map, const struct regmap_config *config)
 {
+	int count = 0;
 	int ret;
 	int i;
 	void *tmp_buf;
@@ -193,15 +199,17 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 			return -ENOMEM;
 		map->reg_defaults = tmp_buf;
 	} else if (map->num_reg_defaults_raw) {
+		count = regcache_count_cacheable_registers(map);
+		if (map->cache_bypass)
+			return 0;
+
 		/* Some devices such as PMICs don't have cache defaults,
 		 * we cope with this by reading back the HW registers and
 		 * crafting the cache defaults by hand.
 		 */
-		ret = regcache_hw_init(map);
+		ret = regcache_hw_init(map, count);
 		if (ret < 0)
 			return ret;
-		if (map->cache_bypass)
-			return 0;
 	}
 
 	if (!map->max_register_is_set && map->num_reg_defaults_raw) {
-- 
2.50.1

