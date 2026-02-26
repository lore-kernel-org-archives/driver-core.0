Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DCF93A4F5B
	for <driver-core@lists.linux.dev>; Thu, 26 Feb 2026 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114368; cv=none; b=mmF94AYn4+LNw0qV9gVf6KdaOkOSbDYHqX/tOUuQ1QGWLBW0aartM4/Ue5XTNi1aiOO5WBu5vX6JA+Bq1ZB966pyojyCjFUuzLfL/Jey8tz82FIwX9faamPGxCWhJ0WcFLTgCHPwtBWyVFF+MTjztnSpsyF71182pux6tzSy4Fs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114368; c=relaxed/simple;
	bh=FA8g05qWcqZtrQ6kzSuDpxdXxqN0KSUBHl3vjHncbHI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Rv8DL0VgPmVp/zTDA8qXlPpMujyULyBDFzH2y4+E9YhQWYX1XZYp2olxyIMDgFuFLYTmsLy3as3z9QZ1Oc+OCz0iy6YykgGInHroP2O0Xlwmr6mgfIJ7VB1wxQOVyaN3SLwhmTFx26YhZNWvuLIKdah+qo7BpIGd/89+FyELpJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E7S1ztHh; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E7S1ztHh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772114363; x=1803650363;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=FA8g05qWcqZtrQ6kzSuDpxdXxqN0KSUBHl3vjHncbHI=;
  b=E7S1ztHhmFzchWPPTy5AHiy6Heub1b/S0mkSLSVxLCv9+hi4cOHjp8W2
   Vu9qWmcDKg9NJIrRln9RXlnbqKiWHfi74S4pkjLQDfsLLOFWw3VqyP8zM
   LKmRriFBKtKu0RejuUnX+zOyufGaGeSFKZBtdXQ26b1FpyTNML534Gp1G
   mNiyB9JpNPhOQdseBazal8qKlGUJNrRlNVZVH+k98lWsdJ0wBGco0lfsy
   hDhL4apJbwu2eMB/wosizXiwR7++FtI9splD2qqThGFxkvVtrBlB7UGow
   0ZvVIR8xxfiDvrWcc62oJcnkjCDRfUISXod7mio5p2j+A65Or3Lda9Es5
   Q==;
X-CSE-ConnectionGUID: SwiD76izTv+L9Qu2mFZDEg==
X-CSE-MsgGUID: bdVSGMlgQOmPhjGgOPpfRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="60749589"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="60749589"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:59:22 -0800
X-CSE-ConnectionGUID: bpc5D/T/R66vMBGaJqkvCA==
X-CSE-MsgGUID: znLvCAYvT5u1FdXFGMi4Dw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="215275436"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2026 05:59:20 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CEB3E99; Thu, 26 Feb 2026 14:59:19 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 1/3] regcache: Move HW readback after cache initialisation
Date: Thu, 26 Feb 2026 14:57:09 +0100
Message-ID: <20260226135918.381979-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260226135918.381979-1-andriy.shevchenko@linux.intel.com>
References: <20260226135918.381979-1-andriy.shevchenko@linux.intel.com>
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

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regcache.c | 25 +++++++++++++++++--------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 73cfe8120669..bde60255ddbb 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -67,6 +67,14 @@ static int regcache_hw_init(struct regmap *map, int count)
 	unsigned int reg, val;
 	void *tmp_buf;
 
+	/*
+	 * When num_reg_defaults_raw is unset, it means there is nothing
+	 * to read back from HW to set up defaults in the cache, so skip
+	 * this phase without an error code returned.
+	 */
+	if (!map->num_reg_defaults_raw)
+		return 0;
+
 	map->num_reg_defaults = count;
 	map->reg_defaults = kmalloc_objs(struct reg_default, count);
 	if (!map->reg_defaults)
@@ -202,14 +210,6 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
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
@@ -227,6 +227,15 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 			goto err_free;
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
-- 
2.50.1

