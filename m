Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BDB430FC26
	for <driver-core@lists.linux.dev>; Thu,  5 Mar 2026 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700895; cv=none; b=bP02GD8cRYOF+0c0AexyVS3B7YCwJyT6faxvEZIep7hNZn2/P1+D5Sz/obsi7xU/ev+GRFAmQoHROf3RBnAGZ4ofelVTN5TrTiygL+1XBxgLWiqsncU+l+u7DGUoI9PatJTO0gkqJcN61vzIbK9+aonNT81cgyfBUz++uw+emKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700895; c=relaxed/simple;
	bh=uCDhRz/YziYy/ZVEBYIphoKDsEPiZhCr4o+SajIrYBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sNdbNphAaQ1NqsZzKqS972BJEY1uSq52dwtioelrT9YSr01mydi3JQdEOiYbXD39EGF6F05OQUqNQmD1VFhXkXVODRTQetZFHgGvW0tSzfgprRC+3X9yQRSCADRKWf/ChN6mYvTOgPfOdusdKqf2WqRjildO+RC/rwSYxQd/Ubo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iWa6eYC8; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iWa6eYC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772700894; x=1804236894;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=uCDhRz/YziYy/ZVEBYIphoKDsEPiZhCr4o+SajIrYBE=;
  b=iWa6eYC811kZVggjpOvGvrQ9ykfpghACdAs9e0uXEKRV3xZ7ultsEwuf
   lU0W+MRJ2fmbQlkXaSgtB08Epf7qbx2i+g5XNYBIDOhBawMvFgldPByIv
   sFpryvO7hcFFwgRFJ4tbkHO/xWAzTnP89CpvdBM3U0sebR5TmX51mVgu/
   GwZ+LI6qYTrOZZvkUoMlJydubxTJAbIbWW8cUI3UiwripXIJRKfUiwRlR
   wlJ/tCVo9q0Ksdi+H6nEct3Z+rTEdYGj1AL2/3pACkHasidfrX+Yms4F0
   1RlaTNbd1yoGtVsOiIVgAmyb+Nni2Pjjc2UvU5ZE4ZeG/WbXU3DGfQbRh
   Q==;
X-CSE-ConnectionGUID: 1GF7louOQ4iYWV2gh41AKw==
X-CSE-MsgGUID: MeyH1VTDSz+MmNR+wzZsEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73687427"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73687427"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:54:53 -0800
X-CSE-ConnectionGUID: YJoJmXfuThK8fR1PVAxIsw==
X-CSE-MsgGUID: Njl/CuhtQt694S2ELTb/Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="216425990"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2026 00:54:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5FA579B; Thu, 05 Mar 2026 09:54:50 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v6 3/3] regcache: Move HW readback after cache initialisation
Date: Thu,  5 Mar 2026 09:53:02 +0100
Message-ID: <20260305085449.3184020-4-andriy.shevchenko@linux.intel.com>
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
 drivers/base/regmap/regcache.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index e9d95aa63938..27616b05111c 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -200,14 +200,6 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		map->reg_defaults = kmalloc_objs(struct reg_default, count);
 		if (!map->reg_defaults)
 			return -ENOMEM;
-
-		/* Some devices such as PMICs don't have cache defaults,
-		 * we cope with this by reading back the HW registers and
-		 * crafting the cache defaults by hand.
-		 */
-		ret = regcache_hw_init(map);
-		if (ret < 0)
-			goto err_free_reg_defaults;
 	}
 
 	if (!map->max_register_is_set && map->num_reg_defaults_raw) {
@@ -222,7 +214,18 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		ret = map->cache_ops->init(map);
 		map->unlock(map->lock_arg);
 		if (ret)
-			goto err_free;
+			goto err_free_reg_defaults;
+	}
+
+	/*
+	 * Some devices such as PMICs don't have cache defaults,
+	 * we cope with this by reading back the HW registers and
+	 * crafting the cache defaults by hand.
+	 */
+	if (count) {
+		ret = regcache_hw_init(map);
+		if (ret)
+			goto err_exit;
 	}
 
 	if (map->cache_ops->populate &&
@@ -232,10 +235,12 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
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
@@ -243,8 +248,6 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		ret = map->cache_ops->exit(map);
 		map->unlock(map->lock_arg);
 	}
-err_free:
-	regcache_hw_exit(map);
 err_free_reg_defaults:
 	kfree(map->reg_defaults);
 
-- 
2.50.1

