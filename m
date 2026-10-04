Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C743448B87;
	Sun,  4 Oct 2026 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117523; cv=none; b=KXDVeG4261W/wqvq+hnudTbw5+7xE14mfs1eA1d9/dOLDjndid37YkQFN8PgyKECfEpdRQfPsfSPtBNydyZFnpNh4Tj3sSYKm6Eq30qcKwID14lvcD2wX6VQX2vxGENnpn3R0Hrtl7Zea3puSm0IPgEwDBJha3zx6Aw4hWnKpPY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117523; c=relaxed/simple;
	bh=cyIjSgiZBCj6qCcFCL7fETCO1R7toajPATwE4IXsxhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=laDGg7990pJk8NmLiUeAVUXmtWI6osjULhh8GQ954os/o4zP3TJ1PeFJZkYEyyzxlRQA9vwy4sFd4osHCvW2t6v6Hye/1JwJUT3SuwsAvXnchFA/B+m/32smc4lrICNJQvXQMXQNv1j5Z9Sx/GKwd8htlcngoX0BrA+ykFxw7Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eebmOAKg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eebmOAKg"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AAFF9C4AF61;
	Sun,  4 Oct 2026 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791117522;
	bh=cyIjSgiZBCj6qCcFCL7fETCO1R7toajPATwE4IXsxhw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=eebmOAKgwyuVFGUUkComhvKobqIaIWHiY4A78H1uZgqeUEz6Y5TneR8hHNNb78PGK
	 QKaK8zKS9Lf8FCXT95ubeKazEvheqEqy4+uIcNiLllJXDIBAdF6Kfcl02T2aDCLhBk
	 sxbhJAyLt6L56PD8CdZag3GUy+HoliwABsW1cvZtY7iUGe4GQKn0qh44TUmWW1TUln
	 21Ax9FD/gAuIGlc3yJSwout5t3vOsmuoJADRHBLSLhoIuTGeNMJ21mqzYoPangk7oz
	 m3eaTRV7b9E7zVmXXH41TFHv8VyXs9QY8cGVrV5loA1G+0+l5Y+axq3Sr1PqrJm26M
	 LQWvTY2Q8c7tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B49DCA5FE6;
	Sun,  4 Oct 2026 12:38:42 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Sun, 04 Oct 2026 23:38:42 +1100
Subject: [PATCH v2 1/2] regmap: Remove debugfs before cache teardown
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261004-regcache-lifecycle-submit-v2-1-976d405e89a7@gmail.com>
References: <20261004-regcache-lifecycle-submit-v2-0-976d405e89a7@gmail.com>
In-Reply-To: <20261004-regcache-lifecycle-submit-v2-0-976d405e89a7@gmail.com>
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, maple-tree@lists.infradead.org, 
 asahi@lists.linux.dev, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791117521; l=2394;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=zFAOzXLct8D+NOZeYw7b3fI/ausJUSmG186K8w5WDHA=;
 b=t8H4GIz5lx+KnixSmRTsDLehoSK7Qb4FFR5kLNP++meiwFM9+MgOsSXmnCDXkmsz8nh0+J+Pk
 Jy1y97CbKQCBRYFXdrdAqOfWqo6QimiLnTI/yBvjJkybv56A2xwqUVt
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=VJ0TvyQ9TvfzYZa908YSE9kpkjFLLD5luv0bERu+boc=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/fedora-20260918 with auth_id=1035
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
Reply-To: michael.reeves077@gmail.com

From: Michael Reeves <michael.reeves077@gmail.com>

regmap_exit() and regmap_reinit_cache() destroy the register cache before
removing debugfs. A concurrent debugfs cache operation can therefore
access cache state after the backend exit callback starts freeing it.

Remove debugfs before cache teardown, and clear the debugfs pointer after
removal. During cache reinitialization, recreate debugfs only after the
new cache initializes successfully.

Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 drivers/base/regmap/regmap-debugfs.c |  1 +
 drivers/base/regmap/regmap.c         | 15 +++++++++------
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/drivers/base/regmap/regmap-debugfs.c b/drivers/base/regmap/regmap-debugfs.c
index 18f1c60749..9a09df2ba8 100644
--- a/drivers/base/regmap/regmap-debugfs.c
+++ b/drivers/base/regmap/regmap-debugfs.c
@@ -664,6 +664,7 @@ void regmap_debugfs_exit(struct regmap *map)
 {
 	if (map->debugfs) {
 		debugfs_remove_recursive(map->debugfs);
+		map->debugfs = NULL;
 		mutex_lock(&map->cache_lock);
 		regmap_debugfs_free_dump_cache(map);
 		mutex_unlock(&map->cache_lock);
diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index e6e022b026..8e50a05ff0 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1422,8 +1422,8 @@ int regmap_reinit_cache(struct regmap *map, const struct regmap_config *config)
 {
 	int ret;
 
-	regcache_exit(map);
 	regmap_debugfs_exit(map);
+	regcache_exit(map);
 
 	map->max_register = config->max_register;
 	map->max_register_is_set = map->max_register ?: config->max_register_is_0;
@@ -1440,12 +1440,16 @@ int regmap_reinit_cache(struct regmap *map, const struct regmap_config *config)
 	if (ret)
 		return ret;
 
-	regmap_debugfs_init(map);
-
 	map->cache_bypass = false;
 	map->cache_only = false;
 
-	return regcache_init(map, config);
+	ret = regcache_init(map, config);
+	if (ret)
+		return ret;
+
+	regmap_debugfs_init(map);
+
+	return 0;
 }
 EXPORT_SYMBOL_GPL(regmap_reinit_cache);
 
@@ -1459,9 +1463,8 @@ void regmap_exit(struct regmap *map)
 	struct regmap_async *async;
 
 	regmap_detach_dev(map->dev, map);
-	regcache_exit(map);
-
 	regmap_debugfs_exit(map);
+	regcache_exit(map);
 	regmap_range_exit(map);
 	if (map->bus && map->bus->free_context)
 		map->bus->free_context(map->bus_context);

-- 
2.55.0


