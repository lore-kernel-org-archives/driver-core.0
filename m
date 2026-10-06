Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A485375AC4;
	Tue,  6 Oct 2026 07:03:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791270200; cv=none; b=tnk7PzpsbmOv8+akyzyBFrKDkwH/7Gi0zq8l1JmZ9n+4wqiEAaXFOEBWm4cqgBlcBJhs3Qm7EStMsdbLNwH34mjPX+4ses6bB0W1xTEGA+eox3oY8SUeacJtElfCBCc5yFrtmekw0ru7V2ihHp96SR0MXHsv5Ymn0k8OeDwYHYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791270200; c=relaxed/simple;
	bh=JibEKNEcmqb57qhexlohigAcFZyJJ9PXqg76F+GByhM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Cl0l47TbxEOyiSkCHhSSbpi/hRivepbYWJDj193RgojTYSE0xbmopYiE+x8eQUJn/tjzDN7kD85dy4AaX20bm8I7+HI1/27cdDq7OlgVNWNHNm6OhUOjrGlh7gUcbN0aNVtpLXoAPd0ZBAiZmSQpM/iwM/NDQ6s987mWuH+LEwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dC+4del+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dC+4del+"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0FD37C4AF13;
	Tue,  6 Oct 2026 07:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791270199;
	bh=JibEKNEcmqb57qhexlohigAcFZyJJ9PXqg76F+GByhM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dC+4del+bSd22JNDwtGhVHPQ0pXwhcRaRJGlGO+oLVuW3ByDlMm05j/WMTnJBbOiD
	 2F26JFh5HWOZVkhCLMHNSRQoxnvnFMi+i6DTOfVytM2k0v2s2sUNand4dRmtKzhneh
	 dHsw1tsKjq9abykTppCQ+YSNNvSwTG6n7fu9noxfUc7zeUzVjuBDXRG9jSv7pfyLPF
	 Wz7BxDarLcjBQbgYcBGK7WcAQdc+EjllZ8MBsSvC/ymlanQ0z0oEHOT//OzDTscs2f
	 L7LIlC9vIoEa+i9pd+3RYdI42xipO+IHPpM+67Fg+DzQNlCMNbjf8hAobtu9+NVC59
	 nvvWtRZlqSpFQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3CA4CA5FFC;
	Tue,  6 Oct 2026 07:03:18 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Tue, 06 Oct 2026 18:03:16 +1100
Subject: [PATCH v3 2/2] regmap: Drop map lock during cache init and exit
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261006-regcache-lifecycle-submit-v3-2-37bdd82fd47c@gmail.com>
References: <20261006-regcache-lifecycle-submit-v3-0-37bdd82fd47c@gmail.com>
In-Reply-To: <20261006-regcache-lifecycle-submit-v3-0-37bdd82fd47c@gmail.com>
To: Mark Brown <broonie@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, maple-tree@lists.infradead.org, 
 asahi@lists.linux.dev, linux-mm@kvack.org, 
 Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791270197; l=4482;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=SZnYqaht9eHldUBPSRohyllzfPag5yZhmg8EqkFgLTI=;
 b=uN5nLx6ZAujPvKZMbgpw3DySy1o1+pySMXk2i51JpxFsW1vI7ul6yjeaShfQMDox58eZ0ur+P
 QigVOzCdaz4BIRbCRE2hVKGYtz7KbVfe1XF33e16jGnFVgEnrsdLO0B
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
lock can also be acquired from hard IRQ context during register access.
Add Maple-state irqsave helpers and use them during teardown to preserve
the lock's IRQ-safe lockdep state.

Fixes: fd4ebc07b4df ("regmap: Hold the regmap lock when allocating and freeing the cache")
Suggested-by: Mark Brown <broonie@kernel.org>
Suggested-by: Liam R. Howlett <liam@infradead.org>
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 drivers/base/regmap/regcache-maple.c | 9 +++++++--
 drivers/base/regmap/regcache.c       | 6 ------
 include/linux/maple_tree.h           | 4 ++++
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/base/regmap/regcache-maple.c b/drivers/base/regmap/regcache-maple.c
index e46fe5c32b..16e488da5f 100644
--- a/drivers/base/regmap/regcache-maple.c
+++ b/drivers/base/regmap/regcache-maple.c
@@ -312,16 +312,21 @@ static void regcache_maple_exit(struct regmap *map)
 	struct maple_tree *mt = map->cache;
 	MA_STATE(mas, mt, 0, UINT_MAX);
 	unsigned int *entry;
+	unsigned long flags;
 
 	/* if we've already been called then just return */
 	if (!mt)
 		return;
 
-	mas_lock(&mas);
+	/*
+	 * Register access may take the Maple lock from hard IRQ context, so
+	 * preserve its IRQ-safe lockdep state during teardown.
+	 */
+	mas_lock_irqsave(&mas, flags);
 	mas_for_each(&mas, entry, UINT_MAX)
 		kfree(entry);
 	__mt_destroy(mt);
-	mas_unlock(&mas);
+	mas_unlock_irqrestore(&mas, flags);
 
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
diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index e595ae5cd0..f6491a92ea 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -507,9 +507,13 @@ struct ma_wr_state {
 };
 
 #define mas_lock(mas)           spin_lock(&((mas)->tree->ma_lock))
+#define mas_lock_irqsave(mas, flags) \
+		spin_lock_irqsave(&((mas)->tree->ma_lock), flags)
 #define mas_lock_nested(mas, subclass) \
 		spin_lock_nested(&((mas)->tree->ma_lock), subclass)
 #define mas_unlock(mas)         spin_unlock(&((mas)->tree->ma_lock))
+#define mas_unlock_irqrestore(mas, flags) \
+		spin_unlock_irqrestore(&((mas)->tree->ma_lock), flags)
 
 /*
  * Special values for ma_state.node.

-- 
2.55.0


