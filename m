Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DC10394487
	for <driver-core@lists.linux.dev>; Thu, 26 Feb 2026 13:59:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114368; cv=none; b=tXuIjEA4iArhWxmXegBjIBJQrg8o4cPE0fjOcwrue1WX+PDQXBWVutZiji1BvYtCYKsSRMjBSkMVYHYtY3U/9wbgQTYtBDhpd9gbpqB/4oSA3xSmYHsQeiel3JvaiTLGW7qc2/2k407w6IgxBNgZ1hGy/ll3S+t6lFgGLKlhuLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114368; c=relaxed/simple;
	bh=3scbGjnD9BGgCkN2tuuQjEIZEdznr/MSJfSKAXHxJxo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nCSNbekY3YlgiSbYbe7huc8c/oq8iu4+rpdLZ+h0C5NApJNHI3vLJseTX2aCINgHvsJuGoQB/ZTcqgKG8PuQqGU3lDBs4MkzsA0l3iT4e5MhsTbSXD46iz4wyOWqcv1xXZwEXOJHywtoZ0xrGi8cKp/iGT/cQ6Rbzj34zitQeVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZH0qm2Sg; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZH0qm2Sg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772114364; x=1803650364;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3scbGjnD9BGgCkN2tuuQjEIZEdznr/MSJfSKAXHxJxo=;
  b=ZH0qm2Sgr/4JXfssYzNq8hZ49gCgZqI7M/hzIkb+/nf3WWNWA0waIepS
   bT/Yf2AQ92SEWbPJlnQQ/WFMDB7mV6k0h9NjI1lwOixZD7+BvXebh/6PD
   9feeNu7MHbHa+x4TUGZA3ThicccT14GFG0UpYdWAGGi3LeAYQ2aoUlAdM
   HEn6R0WFoeGj/X6XoqZXYPRzz0WB+KU9TI2Ph8fCSznSo2b6ICI8XMYcT
   r/CTSm3UHxWzP78ljcK267HKu3nNIbgiM80PtlQy/4594jlgAgNStVFb/
   ddPCgZTT06t89qHF09hGYLx9BwwphDOzPXpGSosLYzIiXJmstXiN5HD2u
   w==;
X-CSE-ConnectionGUID: ZECa0+r9RIGZZMF9iUCU6g==
X-CSE-MsgGUID: YEvFe6bNRfO8ws5E8/goQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73044501"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73044501"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:59:23 -0800
X-CSE-ConnectionGUID: yG9+9U5xQl+OC1ACnLbwjg==
X-CSE-MsgGUID: 2Us88m+aSraEO/BFxi3hYg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="214549629"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2026 05:59:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D25989B; Thu, 26 Feb 2026 14:59:19 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 2/3] regcache: Define iterator inside for-loop and align their types
Date: Thu, 26 Feb 2026 14:57:10 +0100
Message-ID: <20260226135918.381979-3-andriy.shevchenko@linux.intel.com>
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

Some of the iterators may be defined inside the respective for-loop
reducing the scope and potential risk of their misuse. While at it,
align their types based on the type of the upper or lower limits.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/internal.h |  2 +-
 drivers/base/regmap/regcache.c | 13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index 5bf993165438..c77f3a49a89e 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -162,7 +162,7 @@ struct regmap {
 	bool no_sync_defaults;
 
 	struct reg_sequence *patch;
-	int patch_regs;
+	unsigned int patch_regs;
 
 	/* if set, the regmap core can sleep */
 	bool can_sleep;
diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index bde60255ddbb..4a27fb871877 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -44,11 +44,11 @@ EXPORT_SYMBOL_GPL(regcache_sort_defaults);
 
 static int regcache_count_cacheable_registers(struct regmap *map)
 {
-	int count;
-	int i;
+	unsigned int count;
 
 	/* calculate the size of reg_defaults */
-	for (count = 0, i = 0; i < map->num_reg_defaults_raw; i++)
+	count = 0;
+	for (unsigned int i = 0; i < map->num_reg_defaults_raw; i++)
 		if (regmap_readable(map, i * map->reg_stride) &&
 		    !regmap_volatile(map, i * map->reg_stride))
 			count++;
@@ -62,7 +62,6 @@ static int regcache_count_cacheable_registers(struct regmap *map)
 
 static int regcache_hw_init(struct regmap *map, int count)
 {
-	int i, j;
 	int ret;
 	unsigned int reg, val;
 	void *tmp_buf;
@@ -103,7 +102,7 @@ static int regcache_hw_init(struct regmap *map, int count)
 	}
 
 	/* fill the reg_defaults */
-	for (i = 0, j = 0; i < map->num_reg_defaults_raw; i++) {
+	for (unsigned int i = 0, j = 0; i < map->num_reg_defaults_raw; i++) {
 		reg = i * map->reg_stride;
 
 		if (!regmap_readable(map, reg))
@@ -849,13 +848,13 @@ static int regcache_sync_block_raw(struct regmap *map, void *block,
 			    unsigned int block_base, unsigned int start,
 			    unsigned int end)
 {
-	unsigned int i, val;
 	unsigned int regtmp = 0;
 	unsigned int base = 0;
 	const void *data = NULL;
+	unsigned int val;
 	int ret;
 
-	for (i = start; i < end; i++) {
+	for (unsigned int i = start; i < end; i++) {
 		regtmp = block_base + (i * map->reg_stride);
 
 		if (!regcache_reg_present(cache_present, i) ||
-- 
2.50.1

