Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583929;
	b=xfIfzy0EEvq6k0Og64906S1BuXXWN365yFbWY6JNlfAy6vuc79/8NtYHulC8EFviuTKZ
	 x+075ZNQKtIGk7VCwP2XykuXWqsOz936w5i5P7BDXVz4TYoj4IO1gliK9t+7poAC5tCDt
	 4qmYMlq8X2ODn+GCEMon4xTSNIW/hfGZSqIenL6CsW6JBfQcHsZgf2WTRxlzIeBfZo6eX
	 +EBRaEFs+nWKCYpdd8m55+WFwcpuY1nGrfp2eR/wJoa5RtcBwRgoaexGIiQCseFdoh12o
	 aXcXkf//tL4Pm6KCGF3WOEwrgcsygPwXRVZQrnBvyiIriKgQvxBdBYbZecaVr+Pa2yg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583929;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=SbPuNQ4elSJHHzxTWuBsK8sxzOVItZdNtr4rk1uSmYI=;
	b=AL6Qksyy7Vufs1hUOob3zZsaM6zs1Yxer0HAUlhP2y4KkTRI2S8p1VE/IZ33NLUlTuZU
	 AKjObD4pyxAvEdE6W5Zcg3yrJ6KjKpeIQ4aPOdPKSoOfjHa3CfWrqeGQJf5Ds9KBFKpgY
	 8WJCmzxo6vvosUTeSnpfx8tlVSz6MVZwU+fOfJmuuFRqdJaG2QMxVafGYFb+grGLjl9Wy
	 hdCj1AaXuuCGpEnFLqmDs7cC0hXoJJ2Zj08rOaS7rfqWZhNK0vFSH5MWAPXWNzE8xdEWC
	 Xk4pZMroFnRnJ9esRc6qjPhug2n5SkvFe2KhDlKR5/HxQ52Rm5cMc7mI7LNuC46+Y2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tKTkrqvN;
	arc=none smtp.remote-ip=91.218.175.44
Received: from mta0.migadu.com (out-44.mta0.migadu.com [91.218.175.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19412606A330
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:32:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 19412606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tKTkrqvN
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=6jgy9UJKIBreFrmHieIU9cNhMtUqrChMDcvSwpvJhzU=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794583927; v=1; x=1795188727;
 b=tKTkrqvNSLYniYRoYvAZ3pM1yvgQJgs4Wlyp76zTlpkvXyYaUk6GKZn9THP+mugQ+fHNik8z
 Z/66i8f3wM/dWiVQLsVHFW2hLdSgcJZgSmoax3GLK7o0/Mke+zJsIv69uAz4iVPSvvUuIQK/RzV
 wFBX0IR+T6S1jJKRB1ZJQTHk=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 19fdf752ab5d448d;
	Fri, 13 Nov 2026 15:32:06 +0000
X-Mizu-Trace-ID: 19fdf752ab5d448d
X-Migadu-Flow: FLOW_OUT
From: Peng Fan <peng.fan@linux.dev>
Date: Fri, 13 Nov 2026 23:31:49 +0800
Subject: [PATCH v2 01/10] regmap: fix reinit cache failure handling
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-regmap-improve-v2-1-5dfd6a89078f@nxp.com>
References: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
In-Reply-To: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
To: Mark Brown <broonie@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
X-Mailer: b4 0.14.3

From: Peng Fan <peng.fan@nxp.com>

regmap_reinit_cache() tears down the existing cache and then updates the
map configuration. regcache_exit() frees reg_defaults_raw when cache_free
is set but does not clear cache_free or the pointer, and neither
regmap_set_name() nor regcache_init() resets map->cache_type on failure.
The old cache_ops pointer also remains set when reinitialising to
REGCACHE_NONE.

If the reinitialisation then fails, a later regmap_exit() calls
regcache_exit() again. It frees reg_defaults_raw a second time and runs
cache_ops->exit() on the already torn-down cache. A stale cache_ops can
also make regmap_volatile() treat registers as cacheable on a map that
has no cache.

Clear cache_free and reg_defaults_raw in regcache_hw_exit(), and clear
the old cache_ops right after regcache_exit() so a reinitialisation to
REGCACHE_NONE cannot leave stale ops behind. Mark the map as having no
cache when regmap_reinit_cache() fails after tearing down the old one.
Assign the new cache type only after regmap_set_name() has succeeded so
the failure paths cannot leave a type without cache ops.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-5693609c-7965-4f36-ae8f-30c610e10a33
Fixes: bf315173359b ("regmap: Allow drivers to reinitialise the register cache at runtime")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/base/regmap/regcache.c |  8 ++++++--
 drivers/base/regmap/regmap.c   | 12 +++++++++---
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 1447967ff00b..2954e73180ed 100644
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
@@ -282,12 +285,13 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 
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
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index a0e14dc1f6f6..327ae2ea9729 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1424,6 +1424,7 @@ int regmap_reinit_cache(struct regmap *map, const struct regmap_config *config)
 
 	regmap_debugfs_exit(map);
 	regcache_exit(map);
+	map->cache_ops = NULL;
 
 	map->max_register = config->max_register;
 	map->max_register_is_set = map->max_register ?: config->max_register_is_0;
@@ -1434,18 +1435,23 @@ int regmap_reinit_cache(struct regmap *map, const struct regmap_config *config)
 	map->writeable_noinc_reg = config->writeable_noinc_reg;
 	map->readable_noinc_reg = config->readable_noinc_reg;
 	map->reg_default_cb = config->reg_default_cb;
-	map->cache_type = config->cache_type;
 
 	ret = regmap_set_name(map, config);
-	if (ret)
+	if (ret) {
+		map->cache_type = REGCACHE_NONE;
 		return ret;
+	}
 
 	map->cache_bypass = false;
 	map->cache_only = false;
 
+	map->cache_type = config->cache_type;
 	ret = regcache_init(map, config);
-	if (ret)
+	if (ret) {
+		map->cache_ops = NULL;
+		map->cache_type = REGCACHE_NONE;
 		return ret;
+	}
 
 	regmap_debugfs_init(map);
 

-- 
2.56.0

