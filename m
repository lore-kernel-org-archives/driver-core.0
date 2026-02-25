Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2892D3D34B2
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 16:17:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772036228; cv=none; b=Uw5wlhjoOLyRIea6dSByYzodkQu4viPiH6GfdyNdIgyETAYBl7rSHtYxM6X1l0GT8NSvMGfcA39IA4/dYyUf26b3Go4SFID2JWFdJX6/BX0uoPBK3geaVVyfza2G8gEW14E5HpRg3uKmoCJfil/zw0LNv/qoQtTMOJH8kOwRo84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772036228; c=relaxed/simple;
	bh=pSMGSYAXd7SYnY+dr0hI5UuXS3I9ARZIjw5YmikXJwY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=r5lphyckr6I++3a4HkV4+Zsb5IsnqROZ1m1gicHsJ2Y6IQtvRRgDkW+F84O0xDCExuURrjqpDv2ss0byzBPHUJozqngKquGdEhWKkq+clRAZBJVBtaoqDQTPDj5S47+zuJGbFXAOUF2EUe9SkARTGWaz9me2gxeq0eEbczwf5Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bXF5Cvet; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bXF5Cvet"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772036224; x=1803572224;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=pSMGSYAXd7SYnY+dr0hI5UuXS3I9ARZIjw5YmikXJwY=;
  b=bXF5CvetYtSzQlTWOd0WoysDIzRSIVFaxx9ZPEKIbF+jDVPJsE9PZ6m6
   IimLmIcPg5HqdGl6Fw77Q/zcSB7xKpRBAcFF5noz57sxUC7ejBvBhD5vw
   7PePm4weGCUa5PkkxPaY3VCL3Wujxsn6+KLNiL7bNC73eLiqldnxoKCdp
   IVT5qPd80iEejG0wrNIneEcb6RnScqc7iPl87MOGqPQwhS3hL/+jSD08W
   w4Uu5XgoSYbuWTzLYsHJgRjR+n5y5BWbu13CcxKK/zhVFA8JmxDTep0vR
   PfbdzVh3MhFb6LYBxGvRl4y6njChfi/+lPaLmLwj35b0D7UkWhtfs3ui5
   A==;
X-CSE-ConnectionGUID: zuqwM+ARRNWk6m62VkJVrg==
X-CSE-MsgGUID: 8y/z0JapQAuQ0Um1/iEQjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72783292"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="72783292"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:17:03 -0800
X-CSE-ConnectionGUID: o1CG5Qo8RVKTMMihFu0oJw==
X-CSE-MsgGUID: AcEMU4XWQD+sH1ZIO7TXzg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2026 08:17:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C12139D; Wed, 25 Feb 2026 17:17:00 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 3/5] regcache: Move HW readback after cache initialisation
Date: Wed, 25 Feb 2026 17:15:57 +0100
Message-ID: <20260225161659.3811671-4-andriy.shevchenko@linux.intel.com>
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

Make sure that cache is initialised before calling any IO
using regmap, this makes sure that we won't access NULL or
invalid pointers in the cache which hasn't been initialised.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regcache.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 73cfe8120669..de03b090f152 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -202,14 +202,6 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
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
@@ -227,6 +219,15 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
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

