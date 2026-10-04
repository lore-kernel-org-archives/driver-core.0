Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29150448BBB;
	Sun,  4 Oct 2026 12:38:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117523; cv=none; b=sF+73MM/9kkGGNxEZvzCySjAFQKPaWb+xy4ExBUBlYk30v7i56Mg0xV8bDVsRkX0KkISVzTEgIMOEnAt6p5lAu2vppiCsaLkt56Kge/r8s70Vx4XvtvTWeGoNgAV1yRAozzhNQQ6ZMWI3a/Zy1NDhGg8gS4xIy8BxCGXe7VRCt8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117523; c=relaxed/simple;
	bh=TUO8AJBf3E3JvwLPSS+PL+fnZX3uTlkibJ4Pdtsmr28=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eeiDHnMgerXWr0zF1ILo2ykBx4/QIhUT6EYWDxVmWWkn1Fa/b1c/5yI8ccE0wWDm1MiscPnufb+wJRJC9qFllNqqUqFn9HvC1toAkHjj1mnRZR26RmwGul+dmJrbbSr0y4Jd4FNggfMbwV9YdWmM9DMnWIbLvoHo472ahPsFi94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B2PNElOG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B2PNElOG"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B8222C2BCC7;
	Sun,  4 Oct 2026 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791117522;
	bh=TUO8AJBf3E3JvwLPSS+PL+fnZX3uTlkibJ4Pdtsmr28=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=B2PNElOGxfzpLWDsYHG2FHDT0n5XydfnJL6mPJgMVHwy/5pMolf+athIMtfaq91ru
	 L1cm4OxxaTfPLP+ouEl0yo9BoGvo2/ui4Mh39nbu1ZRkqzk4kh8PoAZ8hoE49FhcLQ
	 1vn+6G+s/ejz4wJNisN/DySwuh419siYQSbd1W/qI0UBJblkuBZnI+/2cyd6znAhoB
	 Cfpfw2IQnqrVkbL4lRE7VGZ7BVtvla0ueSV14OJ20IcjVcCZ/LkVcBEcPl3R2stbPp
	 m788ZSDyLTafX+sQizShhDrrbx0m9F+yOis3JyJCxpkd91lVVMoOsOnI7p5f5eD53V
	 CEX1+eRv2X9CQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A17ECA5FEC;
	Sun,  4 Oct 2026 12:38:42 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sun, 04 Oct 2026 23:38:43 +1100
Subject: [PATCH v2 2/2] regmap: Drop map lock during cache init and exit
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-regcache-lifecycle-submit-v2-2-976d405e89a7@gmail.com>
References: <20261004-regcache-lifecycle-submit-v2-0-976d405e89a7@gmail.com>
In-Reply-To: <20261004-regcache-lifecycle-submit-v2-0-976d405e89a7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, maple-tree@lists.infradead.org, 
 asahi@lists.linux.dev, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791117521; l=3467;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=zvpCev1OcFqijOyG7vtnR5Nx239kVlRoXAF9NZ7PjIY=;
 b=kfCOCpZ3IVQaT/GRKTiufdV47V8aaFOG8VELtL2P9tUyQH6IFf1sE/0th6nFG3zBvqs7RTJeP
 TxEbHRVExQXC5ibFY7HtwNJ+jpLqD206UI7K8I489budoBFNPxE56MH
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=VJ0TvyQ9TvfzYZa908YSE9kpkjFLLD5luv0bERu+boc=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/fedora-20260918 with auth_id=1035
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
Reply-To: michael.reeves077@gmail.com

From: Michael Reeves <michael.reeves077@gmail.com>

On systems with CONFIG_PROVE_RAW_LOCK_NESTING enabled, Apple GPIO probe
triggers an "Invalid wait context" lockdep warning.

The driver uses a regmap with a raw spinlock and REGCACHE_FLAT. During
regcache_init(), regcache_flat_init() allocates memory while holding the
raw spinlock. The memory allocator can acquire a non-raw spinlock, which
causes an invalid raw-to-non-raw lock nesting error. The abbreviated call
chain is:

  apple_gpio_pinctrl_probe
    regcache_init
      regcache_flat_init
        __kmalloc_noprof
          __pcs_replace_empty_main
            refill_objects
              _raw_spin_lock_irqsave

Cache allocation occurs before the regmap is published, cache destruction
occurs after users have stopped accessing it, and regmap_reinit_cache()
requires callers to prevent concurrent access. Remove the outer map lock
from cache initialization and destruction. Keep it for cache population
and normal register access.

The Maple cache still uses its internal spinlock during teardown. That
lock can also be acquired from hard IRQ context during register access, so
use spin_lock_irqsave() during teardown to preserve its IRQ-safe lockdep
state.

Fixes: fd4ebc07b4df ("regmap: Hold the regmap lock when allocating and freeing the cache")
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 drivers/base/regmap/regcache-maple.c | 5 +++--
 drivers/base/regmap/regcache.c       | 6 ------
 2 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/base/regmap/regcache-maple.c b/drivers/base/regmap/regcache-maple.c
index e46fe5c32b..9419dc1be9 100644
--- a/drivers/base/regmap/regcache-maple.c
+++ b/drivers/base/regmap/regcache-maple.c
@@ -312,16 +312,17 @@ static void regcache_maple_exit(struct regmap *map)
 	struct maple_tree *mt = map->cache;
 	MA_STATE(mas, mt, 0, UINT_MAX);
 	unsigned int *entry;
+	unsigned long flags;
 
 	/* if we've already been called then just return */
 	if (!mt)
 		return;
 
-	mas_lock(&mas);
+	spin_lock_irqsave(&mt->ma_lock, flags);
 	mas_for_each(&mas, entry, UINT_MAX)
 		kfree(entry);
 	__mt_destroy(mt);
-	mas_unlock(&mas);
+	spin_unlock_irqrestore(&mt->ma_lock, flags);
 
 	kfree(mt);
 	map->cache = NULL;
diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 0d58d900a2..b137ded7fd 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -225,9 +225,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	if (map->cache_ops->init) {
 		dev_dbg(map->dev, "Initializing %s cache\n",
 			map->cache_ops->name);
-		map->lock(map->lock_arg);
 		ret = map->cache_ops->init(map);
-		map->unlock(map->lock_arg);
 		if (ret)
 			goto err_free_reg_defaults;
 	}
@@ -259,9 +257,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 err_exit:
 	if (map->cache_ops->exit) {
 		dev_dbg(map->dev, "Destroying %s cache\n", map->cache_ops->name);
-		map->lock(map->lock_arg);
 		map->cache_ops->exit(map);
-		map->unlock(map->lock_arg);
 	}
 err_free_reg_defaults:
 	kfree(map->reg_defaults);
@@ -281,9 +277,7 @@ void regcache_exit(struct regmap *map)
 	if (map->cache_ops->exit) {
 		dev_dbg(map->dev, "Destroying %s cache\n",
 			map->cache_ops->name);
-		map->lock(map->lock_arg);
 		map->cache_ops->exit(map);
-		map->unlock(map->lock_arg);
 	}
 
 	kfree(map->reg_defaults);

-- 
2.55.0


