Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A201435837E
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 07:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783927875; cv=none; b=YdqcHvBaw1W9xsyPiPwzxPiOFAp03cV8Dwm4Eggl2bGN09dSr9cBrhVB+wALxDJDoPmUfdbFEe6PRrA4jYgfJA4guEExyJoq0CCda4heKVWdI+wIy4IkEOZ1RMi/LgsSas5MN1zngVjGL6UwfA8Xt9TDvunEqAbycjW8+rfVr0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783927875; c=relaxed/simple;
	bh=nE94jIpzbTpP6e3RBc5xMQLNFbMWa6pESy1FsxCN9Zc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KkUHNd7FAeP1wc92JMVOvQnl6GdTxEIHAfXLrSms+KPukLGMLsm1Raz0KgjOdXuv+5GABmMrgUUPRgWLzLJg5zSCWwWOHc4K6j0bk3ppFfkqgb4yQy/L+PBd4QZ4FPCkQ8qCN1qUrOZe885Wh8Hv/nWY5WEyGSi0lXn5bNiYTzw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aSYcML/B; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aSYcML/B"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacf197759so41256905ad.2
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 00:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783927874; x=1784532674; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=eeHOpcp3LVDBa1WcVuoFtpJpeqLR6lLlad78twh11no=;
        b=aSYcML/B2ZZ9ivsUdAo/G54ZYr8UBSLKjf8myx4bq1kicO/83W4h3eJDa8rjF/8wOt
         bPg5n7mdKhvcwEWOw8AVWQ2wpVRmw6I8H+Y/YFG5qckYboZAgx/yRrbsimHJOz++esGd
         OztvLiuqyTh9hk++fow8YOHLxzOcbEPJTOHR47W8rlNQZ4YFewPH1tO3mMbZRHZjDTxn
         N3Ekv9SBkt4murSDiSGdCDBMqiR9I1VGmvHlCpXIaT1LMy1ykZRZa9kADF+6I6ysuqq8
         VtOY77/qwW+Qrp0CYXhU0b/ZUkmnqNZiBsVHrlowpwN6dU251OLpNXx8pwiHN1JhutLZ
         dJ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783927874; x=1784532674;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eeHOpcp3LVDBa1WcVuoFtpJpeqLR6lLlad78twh11no=;
        b=s66HZA3kwczR4Owal2a8t72Vv8OxqQw78D8pbNaH125tQ8uLTM/6U3uRVWAHz6KM9G
         GMhJbs+LDx+AGqKxws6Q8orHnk+pwPoUgSV0uuChwN9qqMK3vYjehoEzImE5iQPt/WtV
         zP/VRO/R38Ud7w/yr2IUl281rZcAslgtft3oMcCXp5mszUZcdWJlSeJevpR32ko5PN5x
         SNuvELlRsa4futvWPKcneMsP4b3CsTfuuZoRLps159W+QuUnRtwdiEWuvjztbRgA74/8
         pGXLwJl5KVrPepKZFQV5GYSkTioQf3UFrSsMdheB+0KjWIj3otVzaFGe9LSQ/WAg76+p
         7Wzg==
X-Forwarded-Encrypted: i=1; AHgh+RoU2H5uwwrZcTLHv/LR6QS5NPosxOC3lC8m6JxF4OPNK+L8hpSGaORsSBzxWkKUbjX2aA7SpX51J8cGrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJ0NNIVMzhQBGJ351vSWN+I2ZnUQ/3IcJxuZ8or16O1bqr4pXG
	/IhD2gwiYU66Fnl56M6voz1gfsi+rcGx1q4o0BnuLxDxt2zTF+p6HbGZ
X-Gm-Gg: AfdE7clvbM+i5M3rVAl1/c/NbM96pTCEphbbqmWr1enPgfB+WNEchwKtjT0nOnXj1oL
	t9XOQWsvbWJBvfFIn4RaQ7fQUJM/dsTZdsDzqU4uFEY6HoooKfGb2T3XYV6CAMgMV+Jc7t1uHXC
	VOeeaqtRFBV2KZ0FjFbGhx3EnvDRBOchuuo6nWxeqHmJ8XQt9DMsyo++ENahw9wDXsohn9Yx2uc
	yrNWdLXrrVIEMb8AQ/bPKUPJnh1cp9Oe/tbdAV6i6Y3yjeTKUqpy+RArhf79fyowOXwiiouTpoS
	2hCgsn+MsAE4xM0G8ETn9hPbiNNsAbqi7BKitLyouEI2CF21J7/of42kB0bHlD4DEo8jrq4WhMX
	ZdSszgririDwAEr9PB3SFhs+n8UnqEjflvSw1T3zrtPNTkEpdaWS/MLkYFYaf+8fekIEofmJZc1
	1XA0s3fz2lWKT2jqg2LAPciTfFRqIdjVNe8Qk8ixVMZ6z3Qtw=
X-Received: by 2002:a17:903:1a0e:b0:2ce:9439:59a5 with SMTP id d9443c01a7336-2ce9ef21831mr78809055ad.36.1783927873948;
        Mon, 13 Jul 2026 00:31:13 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb76asm97535925ad.12.2026.07.13.00.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 00:31:13 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	rafael@kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH] regcache: disable cache_only before rewriting paging registers
Date: Mon, 13 Jul 2026 14:30:58 +0700
Message-ID: <20260713073059.47914-1-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

cache_only must be disabled before re-writing the paging selector
registers. Otherwise, _regmap_write() would update only the cache
and return without calling map->reg_write(), leaving the selector
register on the hardware unwritten and out of sync with the cache.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---

Note: This patch was created while working on the following patch series:
https://lore.kernel.org/all/20260713050312.38729-1-phucduc.bui@gmail.com/

 drivers/base/regmap/regcache.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 96cdae25b9c4..43ee7c6c32d8 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -406,6 +406,7 @@ int regcache_sync(struct regmap *map)
 	unsigned int i;
 	const char *name;
 	bool bypass;
+	bool cache_only;
 	struct rb_node *node;
 
 	if (WARN_ON(map->cache_type == REGCACHE_NONE))
@@ -455,6 +456,9 @@ int regcache_sync(struct regmap *map)
 	 * have gone out of sync, force writes of all the paging
 	 * registers.
 	 */
+	cache_only = map->cache_only;
+	map->cache_only = false;
+
 	rb_for_each(node, NULL, &map->range_tree, rbtree_all) {
 		struct regmap_range_node *this =
 			rb_entry(node, struct regmap_range_node, node);
@@ -472,6 +476,8 @@ int regcache_sync(struct regmap *map)
 		}
 	}
 
+	map->cache_only = cache_only;
+
 	map->unlock(map->lock_arg);
 
 	regmap_async_complete(map);
-- 
2.43.0

