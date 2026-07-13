Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E2D035F619
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 05:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783919038; cv=none; b=cDHJgUd0/+JOHLuBU8x7KZqGBgdFhhtqrh+xfmfs3kOHeGmlFsmIrNuPQ4MlqKGtvHGePkFbqaVdg9hjb4ZUDcSF6DMEcilvKjjI+W6qYtHI31YmfngF62Hb4dW211UrB8rTw4KT5REwsScxj7bdFTNb7QrvNjpktPG1XeFTG80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783919038; c=relaxed/simple;
	bh=rmcs9P9fKkhuQ1Whjqom8hv+KPJ88SeslsM+ceFKlqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gfykAX2Ns8W40m6Xu5HNSsTkSp/cYxNEVxi7LE105DUWoryoGKqJ4odEqQv9Egt2Erwhoit9lLzucJNg9x5kBK0yzzpNHI1P3eUS4Fyk9ZrczRrUK9cbAhlM304CC9aYx2XzorGF2m7zsU9ZrK5AeUZwfN1XHXr+JRFVPRN9w08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2Rf1qaQ; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2Rf1qaQ"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-381018b9375so3123180a91.0
        for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 22:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783919036; x=1784523836; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vnDoptGQ8NnxjTZz5BygVfis6KpDnUGxJW3/PWmoOvY=;
        b=H2Rf1qaQUnqBNupmdAoyw2dtz0gePsSz8hsUS8LKy7tz1J1rXfnV+P9XHcbzgbsYEc
         mLin5UVXm3IAWZRfzfEEWwNYBadQk0gidRUsAbCWXpnYAsfH1hDf2kykhcWZ8eOn74Os
         x03igVgEwuefb4qkL3P/zOC/fXx//Qm1HlQJWr6oXsyy46+DmuW1RPNiXfevtPq8l8F4
         sd1c5jYG7A1MaBwnCiQfe9o/F+O4DNNSlFFaL/WxEU8WYaW1p6eqDEzJtAmfYE/VMzem
         uQwwlhEwy0JZWwR8R8YY2qx059mvZVVEXlEf8SNK3hrP7y/e0DKwFY1tXjfPbPkIEXtQ
         5PxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783919036; x=1784523836;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vnDoptGQ8NnxjTZz5BygVfis6KpDnUGxJW3/PWmoOvY=;
        b=ru5sQ6Jl2gk9mjSPVoVZZcsfB7CTIlU/1O7+ryoMh8TDn7OlkpAmAoEkQ6lta4Dcsz
         NV81U3clbqQ2grHgYrg6QW9ILUjmto5PaMK+DemSit7OxYFtSif/2umEjmE58h49HPye
         fVjnPJKPJEujzNa6DtpM0fUBKkvfeyqPx4YDwigoVInG8sCTfU1U4n9zttDyPnwr1DUe
         WM0a05duW/1xcZUtTQ+M7Jc78FuqNDoIFb1sDSUp1NZGXbbOZoqvInE0kFRyVnoUaoUr
         xPxK7fvQGRdBTQrBqqnuHRSy+FS28z4yRL5BxAXnu2cM16FBEmqo4wwJHw0UOl5Nr/B/
         endQ==
X-Forwarded-Encrypted: i=1; AHgh+RqbJGa5MsyZFLkFga0Z/l4pUVWwJFf/bRY62arVMoVAtugGaXIqJk9qrXYGVlo9DbbKLO5C8h3VmPY3cw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5oWz8VUKrloJKbwP0eVHDwiRm99xZlirARELEa3p2Nmb97Cbs
	lkqAlUgfLGak9xRblpneOmqZVyl2314eoilnMGOv8dRWOY90wRTsvEPT
X-Gm-Gg: AfdE7ckt7CH6K4UumUMIqcFWPMf1EGSGwLf+mhmD2yFVUc0qsELgnNU5h8TE2PoBa9F
	k+PuSGpx6pRyhJ8tn5bJZno9XvLN8q833zoVb6xP41MMwfKWCm0HJWL6IhNd9h9CSTY3ZYrQ6kK
	HHsvgmtNmkj/3AZ/KbmUr1l5iNCzd99e9NzKDyzMWn8wXVr/Zp8lJiZEgNBR2ObEyAN8YhuMUpy
	d0rSJOfpVbCKpFYghne85b4+3lOPGIjODs3R5VG417ymUy1DDv11pMQsP3jC0gK6wd9OdgDUGmw
	oFGpCuYjp3H4hozl/xU8VNxMtbtkbDV7gsGh5XqhskmqbUlQ3C1sPgTeN9weqvBbSRiXYXaMOx+
	u0G0QtltsbTeqkeUqbx9fkY3NVWvTtPXU1LHGFyoCWX6L7ll0b07iKqDhTGfzIEvl6ArV3mE87j
	tVbRJAT+ImErbD0qV38vRx/+j+lYSmPvdpnnOgf/cpoeYxKPo=
X-Received: by 2002:a17:90b:498f:b0:37f:9ce1:cdb2 with SMTP id 98e67ed59e1d1-38dc778b138mr7508268a91.32.1783919035926;
        Sun, 12 Jul 2026 22:03:55 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-313c50c70c9sm21927368eec.29.2026.07.12.22.03.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 22:03:55 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 1/2] regcache: Preserve cache synchronization errors in regcache_sync()
Date: Mon, 13 Jul 2026 12:03:11 +0700
Message-ID: <20260713050312.38729-2-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260713050312.38729-1-phucduc.bui@gmail.com>
References: <20260713050312.38729-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

regcache_sync() currently stores the return value from both cache
synchronization and selector register rewriting in the same variable.
As a result, a successful selector register rewrite can overwrite an
earlier cache synchronization error, causing regcache_sync() to return
success even though synchronization failed.

Track the two operations with separate return variables and preserve the
cache synchronization error. Errors from rewriting selector registers are
returned only if cache synchronization completed successfully.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 drivers/base/regmap/regcache.c | 23 ++++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index aa8f2efed779..040fd60c0d59 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -401,7 +401,8 @@ static int rbtree_all(const void *key, const struct rb_node *node)
  */
 int regcache_sync(struct regmap *map)
 {
-	int ret = 0;
+	int sync_ret = 0;
+	int selector_ret = 0;
 	unsigned int i;
 	const char *name;
 	bool bypass;
@@ -426,21 +427,21 @@ int regcache_sync(struct regmap *map)
 	/* Apply any patch first */
 	map->cache_bypass = true;
 	for (i = 0; i < map->patch_regs; i++) {
-		ret = _regmap_write(map, map->patch[i].reg, map->patch[i].def);
-		if (ret != 0) {
+		sync_ret = _regmap_write(map, map->patch[i].reg, map->patch[i].def);
+		if (sync_ret != 0) {
 			dev_err(map->dev, "Failed to write %x = %x: %d\n",
-				map->patch[i].reg, map->patch[i].def, ret);
+				map->patch[i].reg, map->patch[i].def, sync_ret);
 			goto out;
 		}
 	}
 	map->cache_bypass = false;
 
 	if (map->cache_ops->sync)
-		ret = map->cache_ops->sync(map, 0, map->max_register);
+		sync_ret = map->cache_ops->sync(map, 0, map->max_register);
 	else
-		ret = regcache_default_sync(map, 0, map->max_register);
+		sync_ret = regcache_default_sync(map, 0, map->max_register);
 
-	if (ret == 0)
+	if (sync_ret == 0)
 		map->cache_dirty = false;
 
 out:
@@ -462,10 +463,10 @@ int regcache_sync(struct regmap *map)
 		if (regcache_read(map, this->selector_reg, &i) != 0)
 			continue;
 
-		ret = _regmap_write(map, this->selector_reg, i);
-		if (ret != 0) {
+		selector_ret = _regmap_write(map, this->selector_reg, i);
+		if (selector_ret != 0) {
 			dev_err(map->dev, "Failed to write %x = %x: %d\n",
-				this->selector_reg, i, ret);
+				this->selector_reg, i, selector_ret);
 			break;
 		}
 	}
@@ -476,7 +477,7 @@ int regcache_sync(struct regmap *map)
 
 	trace_regcache_sync(map, name, "stop");
 
-	return ret;
+	return sync_ret ? sync_ret : selector_ret;
 }
 EXPORT_SYMBOL_GPL(regcache_sync);
 
-- 
2.43.0

