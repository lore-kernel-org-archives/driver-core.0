Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EE7B38F65E
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445544; cv=none; b=u10EAeVTdmJ/tv08jvJal9Egfc/F7toval4kgSaoB5dPST6x+HfL8SaneTfI9KWsyo0MxV1oBPpcFBfoRzVzKPw+Mkv2G8ACGwhuEJmI4EqQSzTXgXHAK0VKYquFRq84ZH3I0+omObCJmDe4gyHj+V9RJshjWx6IIsrX4STHoUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445544; c=relaxed/simple;
	bh=+U/a3l9efdYmCTx9oJhBq4AgxHYZOLO9mX+G/kxf3oc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OrcYAWym7ijGZJXUctUCu5H5nZEamUDNtA7cjY8yJwKE2WUoQLUt0mVTI8mSiOmq21/f1MYxOZLWhUg36LBVb28Npa4bKYbLU9LkU02QzpcMM50xYGrwhnyBvMY8GPEv06YjSvsDOSRDe1+Rc3Io54+dU73YKTOY8+wBjPuS850=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/t7wppd; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/t7wppd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772445543; x=1803981543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+U/a3l9efdYmCTx9oJhBq4AgxHYZOLO9mX+G/kxf3oc=;
  b=T/t7wppdSwvmrgBAmPAqEyJ48LG+4nYMy4VMRnl4v8ChQoQnH9KtMn7a
   wyd1DW3H4tfV7y9ludzt3VmAgM5gk9CvjzLzI4CgtQ7slXUD7wcSbd99E
   V7J/4cgx8ERWCg3o1C9+i2XlYbTzaJUqES5O0FhlD25gaJnqM+ZS/oCuD
   iHVEqlqylD7FVccjSIhhAx1AcNAmrvy1nluDnAX9ryXl7PqapHWexm5u2
   vzCb343v8ZZPqji61EGScwmn5ubtJH3bk/41qIzQYu/pFgBoB1w+pkdZc
   KnHcJi0rFkPGwOwNEc60GL4jwzs0jy6Gf9LUpxmoerk/BVSAI9NW9BhzV
   Q==;
X-CSE-ConnectionGUID: ZDSxcaeXRVyGtlZ39hAmgQ==
X-CSE-MsgGUID: Ly/FIiELS8mOFN4ASmgLxA==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="96066029"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="96066029"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:58:52 -0800
X-CSE-ConnectionGUID: z4WytTbeSEestykCDzTCqg==
X-CSE-MsgGUID: GEizdR+lRxaHwEmvS26MIw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="217628235"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2026 01:58:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id F195A98; Mon, 02 Mar 2026 10:58:49 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 1/3] regcache: Move HW readback after cache initialisation
Date: Mon,  2 Mar 2026 10:56:55 +0100
Message-ID: <20260302095847.2310066-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260302095847.2310066-1-andriy.shevchenko@linux.intel.com>
References: <20260302095847.2310066-1-andriy.shevchenko@linux.intel.com>
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
index 73cfe8120669..ae60411ea8dc 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -67,6 +67,14 @@ static int regcache_hw_init(struct regmap *map, int count)
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

