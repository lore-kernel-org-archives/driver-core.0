Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D525B49A3C8;
	Fri, 25 Sep 2026 10:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790333008; cv=none; b=o8qmG1BkDX6vS6OGCVCvHxVcbG9osMjYDUJhZ0KUR0l3yVnAJy+yMuIeOhrjBpjsqNtSY4HwBuAJWLQjs0WgLHR3EvaxWQdhhbtwPv9oI2brCYwMicA4Gabj4pFqyxVFj1q7xfe8BN/xRqTXPi2wmRLM59El1gWH9gOUB0/PZEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790333008; c=relaxed/simple;
	bh=jPWO8NRa+f0g0v8dbKCK2h3llHZx7aafBFUVGLf4TaM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=AyktKFbinxiSGwju8C9HE7yEGd3F+6luLjM/OxLguwv4j3KEjBtPPcrKA3GZdbqHWter0sRHJUN0poOVG25IvMfYyXVUjbdUuB/SWtvZUITV//XBH8FzC9H+VnXwJCJD1nxyNpIlpHeybLZ/7QmoB5y7K2p4VlQzuoGeQ8pQk14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NFnPZ3FP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NFnPZ3FP"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 57C5CC2BCF5;
	Fri, 25 Sep 2026 10:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1790333008;
	bh=jPWO8NRa+f0g0v8dbKCK2h3llHZx7aafBFUVGLf4TaM=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=NFnPZ3FP/8F1OoewYjeni1ZY/a1kRs38FIUf2j3LOylDc1YbfB23fKRCE5oHGZmio
	 0nMbbjLKGEUFFvdrwh5vhx8gKa1rs9B1nqru62OVqce04swom3QiXqZDHAKHmspmln
	 jmDVLUGqrYz+hI7TlxXTnUU5ZQcb1o8K6J2ezCFd43ukarr3I4h4tg2Vly7Kf1VrOZ
	 gOGcqw5Zn3dvPVuxxUFqusaLCOfEXoETBL4BJjoYUlGv+tpIrZ9gxmN6WjHVfevXxX
	 VVMN75kXkNYhhJPY6/fn/BfpJ/EhzWW6BOfSSfowver+dRSOAW+xT678aQmfZqVM5e
	 oeaxvVdQBqlmg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 337C5C98321;
	Fri, 25 Sep 2026 10:43:28 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Fri, 25 Sep 2026 20:43:22 +1000
Subject: [PATCH] regmap: Drop map lock during cache init and exit
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260925-regcache-lifecycle-submit-v1-1-83b75ca79d96@gmail.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x3MQQrCMBBG4auUWRuIVSN6FXGRjH+agTbKTBWl9
 O5Gl9/ivYUMKjA6dwspXmJyrw3bTUdcYh3g5NZMve+DP/UHpxg4coEbJYM/PMLZM00yu+M+70J
 I8Dkxtf6hyPL+vy/X5hQNLmmsXH7HKdoMpXX9AqTUvreEAAAA
X-Change-ID: 20260925-regcache-lifecycle-submit-74f366be0fbc
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 asahi@lists.linux.dev, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790333007; l=3198;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=bhjdNcpqzJyQqu6KoQ8twHsi4wLo39lzrrDM3q6SV2U=;
 b=dUG6HMWKRqJlIop9DgRJPb3yaHf2oRN1ulewe0RSquIucnpgEeaD4QYiU0nCrYihnyo2OHmbE
 ZqaWLU/lz7nCNl5ztbqyWdqV8WQL4Uud5DiTfVkChm4nrPoRdWuzwbm
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

GFP_ATOMIC does not make this lock nesting valid.

Holding the map lock during cache allocation and exit is not needed:

- Cache allocation occurs before the regmap is published.
- Cache destruction occurs only after all users stop access.
- regmap_reinit_cache() requires callers to prevent concurrent access.

Commit fd4ebc07b4df ("regmap: Hold the regmap lock when allocating and
freeing the cache") added the lock for Maple tree lockdep validation.
The current Maple tree backend uses internal locking, and cache
population is now separate from cache allocation.

Remove map locking from the cache init and exit callbacks. Keep map
locking for cache population and normal register access.

Fixes: fd4ebc07b4df ("regmap: Hold the regmap lock when allocating and freeing the cache")
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
Tested on Apple M3 MacBook Air (T8122):

- All 4 GPIO controllers probe successfully with lockdep enabled.
- The "Invalid wait context" warning no longer occurs.
- All 549 regmap KUnit tests pass (38 test groups).
---
 drivers/base/regmap/regcache.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 0d58d900a..b137ded7f 100644
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

---
base-commit: 5dd1818b15d98d4a20806cd00b1b40320b06004f
change-id: 20260925-regcache-lifecycle-submit-74f366be0fbc

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>


