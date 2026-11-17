Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.203
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794932329;
	b=hIEEB+uWJRV0WnE6AdiC/NPq7LokxasvDL3LtcypThzYVXLWyapiVWDZTqePXuswxTek
	 aNlgkh7YjhYXkoZfHqcEpXahYl6u9ztvwyqvQ7hLpep8NM2AO7nzcNRcQ2153QslLRrwH
	 yzX7X0/VQRClYEjRgqzN8OI2TL3fXE1Htl+b/EO9cwGyZxoHLtSn7HBx6IPQRq8DIfEh0
	 X+mzpgfyzRYDqMP3TD5kvV3eMVET1HKXj3CIMTZUmN5KFTCSZloJzUjyGm6kxBGBvzTnE
	 6pkevRiiWTk8U4mMBfI7+aFN8fwbtrxW/5FbubFmKRg/dgBS4+kiyX/89HmFInEmI2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794932329;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=3A0NUBGw7hohi3d+XmCUqawXBiw6IIJ0lPqUY++p0+I=;
	b=bBVBHzSLKDJdvvJQNoxo840o85NumBAG/xysb2rnMwLsHQ/ADS3+aZ1UAkDsVWfko8I8
	 fVB8hXbJEj8zt0J90Bhm7FxD3EBY9PT2cQBUuBFIs3oOacfpQ6RVbPbWC3bbu+lzPogKk
	 B1CovDUXxOU2FFxrxHqpFb++NgMtx6zuSe0kcb6/pxqFBbuDALpDid3vIhWSWMV/3aCxM
	 4yiNARuCPugbM7iRU3vHqdf09HCSOj1B+4SxFv+fY71APd/2Mz0G47XDS9ITwhSeB7k1s
	 x02sOH9TG1zpJtIpEY3LntfS1lMLXV4EfTiXQqMVD2ksxKgM9UsCu8l7m0pnIOAJbYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OOI+2EWK;
	arc=none smtp.remote-ip=95.215.58.203
Received: from mta1.migadu.com (out-203.mta1.migadu.com [95.215.58.203])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E326606A330
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 16:18:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2E326606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=OOI+2EWK
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=gCLLdRe+FkKRAkuLVQBRU3B7vt5eEHfwO4DkA22HIfs=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794932326; v=1; x=1795537126;
 b=OOI+2EWKim8AbWMZboQLxvF90sW4R9i9QQWG+wG61svuA+0uqRpinMtRoVQpHd0YOJCwjVC9
 O+VyK4GkvlU+0E7cXdXFC1wH7wKGIrdd/6PS/JDY3x1zcTqV1ttGkF16KYhNhGMXhgdlmEo6rFv
 Q8617wogRM7JqI4QgsSbnIio=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id e2c3b1bd99078875;
	Tue, 17 Nov 2026 16:18:46 +0000
X-Mizu-Trace-ID: e2c3b1bd99078875
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
To: broonie@kernel.org
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	peng.fan@nxp.com,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH] regmap: fix reinit cache failure handling
Date: Wed, 18 Nov 2026 00:18:15 +0800
Message-ID: <20261117161815.1576684-1-peng.fan@linux.dev>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Peng Fan <peng.fan@nxp.com>

regmap_reinit_cache() tears down the existing cache and then updates the
map configuration. regcache_exit() frees reg_defaults_raw when cache_free
is set but does not clear cache_free or the pointer, and neither
regmap_set_name() nor regcache_init() resets map->cache_type on failure.

If the reinitialisation then fails, a later regmap_exit() calls
regcache_exit() again. It frees reg_defaults_raw a second time and runs
cache_ops->exit() on the already torn-down cache. A stale cache_ops can
also make regmap_volatile() treat registers as cacheable on a map that
has no cache.

Clear cache_free and reg_defaults_raw in regcache_hw_exit(), and mark the
map as having no cache when regmap_reinit_cache() fails after tearing down
the old one. Assign the new cache type only after regmap_set_name() has
succeeded so the failure paths cannot leave a type without cache ops.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-5693609c-7965-4f36-ae8f-30c610e10a33
Fixes: bf315173359b ("regmap: Allow drivers to reinitialise the register cache at runtime")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---

V1:
 Separate from https://lore.kernel.org/all/20261113-regmap-improve-v2-1-5dfd6a89078f@nxp.com/

 drivers/base/regmap/regcache.c | 10 ++++++++--
 drivers/base/regmap/regmap.c   | 14 +++++++++++---
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 1447967ff00b..5b36ac48e394 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -122,8 +122,11 @@ static int regcache_hw_init(struct regmap *map, int count)
 
 static void regcache_hw_exit(struct regmap *map)
 {
-	if (map->cache_free)
+	if (map->cache_free) {
 		kfree(map->reg_defaults_raw);
+		map->reg_defaults_raw = NULL;
+		map->cache_free = false;
+	}
 }
 
 static int regcache_locked_op(struct regmap *map,
@@ -276,18 +279,20 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	}
 err_free_reg_defaults:
 	kfree(map->reg_defaults);
+	map->reg_defaults = NULL;
 
 	return ret;
 }
 
 void regcache_exit(struct regmap *map)
 {
+	regcache_hw_exit(map);
+
 	if (map->cache_type == REGCACHE_NONE)
 		return;
 
 	BUG_ON(!map->cache_ops);
 
-	regcache_hw_exit(map);
 	if (map->cache_ops->exit) {
 		dev_dbg(map->dev, "Destroying %s cache\n",
 			map->cache_ops->name);
@@ -296,6 +301,7 @@ void regcache_exit(struct regmap *map)
 
 	kfree(map->reg_defaults);
 	map->reg_defaults = NULL;
+	map->cache_dirty = false;
 }
 
 /**
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 7bb90d8aed3d..57de64241eb7 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1452,6 +1452,7 @@ int regmap_reinit_cache(struct regmap *map, const struct regmap_config *config)
 
 	regmap_debugfs_exit(map);
 	regcache_exit(map);
+	map->cache_ops = NULL;
 
 	map->max_register = config->max_register;
 	map->max_register_is_set = map->max_register ?: config->max_register_is_0;
@@ -1462,22 +1463,29 @@ int regmap_reinit_cache(struct regmap *map, const struct regmap_config *config)
 	map->writeable_noinc_reg = config->writeable_noinc_reg;
 	map->readable_noinc_reg = config->readable_noinc_reg;
 	map->reg_default_cb = config->reg_default_cb;
-	map->cache_type = config->cache_type;
 
 	ret = regmap_set_name(map, config);
 	if (ret)
-		return ret;
+		goto err_none;
 
 	map->cache_bypass = false;
 	map->cache_only = false;
 
+	map->cache_type = config->cache_type;
 	ret = regcache_init(map, config);
 	if (ret)
-		return ret;
+		goto err_none;
 
 	regmap_debugfs_init(map);
 
 	return 0;
+
+err_none:
+	map->cache_ops = NULL;
+	map->cache_type = REGCACHE_NONE;
+	map->cache_bypass = true;
+	map->cache_only = false;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(regmap_reinit_cache);
 
-- 
2.56.0

