Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49102285CA4
	for <driver-core@lists.linux.dev>; Wed, 17 Jun 2026 06:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781677353; cv=none; b=pgIpw+vtFM8sYMI82juWLkFyr6aqLbvmIE0yMsB3JAAPDSVdy3n3xVIm5AJO+KvmTbF6a2u2ZPkDRWmxcrKy9qyUDM3fNK7qJXotOXEIQmsR2tjkfiok1wuiSo/Pk8Tc5o5gku9wf3aXkpOvgOZQo0Y+wi462g+B61aAuJjcwOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781677353; c=relaxed/simple;
	bh=tX6q3M8wAw3TehCzxow1yfzjjN3As8he2G6anlmONTQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ditEfiu5prwkxu0weSvIVE4X6nGPTEwSc9EHG5f99xCMhyiBJKZWWujM4xssznKffCJaDUVJ05ipRQwM4+MNfLGACRMGbfs8jKybBIYEp9nZgSZ56CKPK5DIAcgkgoYHM2RGYqEGx1Lljjv4yyrXCXSHEBe4dJihUqJQK0CyDTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=ba7i61zi; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="ba7i61zi"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-45ee5cdbd28so328621f8f.1
        for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 23:22:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1781677350; x=1782282150; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fCUpK6BCjcexe7jWiZOfijJy9UXZK3vanCT94EnudFY=;
        b=ba7i61ziVkY0UhH0r7zxIDcfttwxiFOL+WA/G+u79xeShIzaWx84bFADe1fYTyZvnY
         xjYqCwS8gHf0odqFcSEWPhFupdD0C+ZaIe/nZH9qQHWj7hQhJttkPZert2eQsHaGKxML
         ft3eu6qfwYjLKSYbRVV/8NQ1hJphwfOfrzdmiV9lDzmVlFk89Squk8Yiq6S/P8TSVZBc
         mb+0QWNHdyfFOM0lUdZsZf+tYVxIDZMVl+uY+RXs1UO8sjIRJIuzohgnjvs3vZGSdwtT
         HYpyH/YrUpNe68Qj603u3G8+GvYUycZmpsP6v/gRuWyYZr1pGdIKoJYGu9mLwgABpmf+
         LbNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781677350; x=1782282150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fCUpK6BCjcexe7jWiZOfijJy9UXZK3vanCT94EnudFY=;
        b=FRh4wjr6FW7AKJRYAVAiyO8RRevb35UOgxHVGc2GriGwCU4CnC6xA1xCJjSNDHjqLg
         wocfoMzN+BNVYVE6lyHfr6w2XoLGdYGcTqcPOZzibi4BLWTiwqiw2ioaD1iv2jqBzhVm
         VNLJMIo6CZK79Qv43+wJymGSDobuBSo9bXZuslB0qNYraNMEPvGN4X6T9eb0UkpVY8i8
         djYSERfoHk9LZx8Lf7VsA8ujgFB0ITs9LEbWLaMYMZ2ESmteQkh9BTQGBoVkzh+F6WL+
         MceK8sSk6IVEDbw6iwoL4j8NZj50BL/rMcAkAK94E4tXCjheijOpTqM1WNGYZ87/Gb6v
         hgGQ==
X-Forwarded-Encrypted: i=1; AFNElJ+v/xdCtn9EG1KkcWVE1fFU12lZPFT4wvggxOeTExq/y8278gnT1mqPA3QrghmR9N4QWeMNdG3lDdnSOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yys1hQfSx37p5vVG0lIKtVJc/hsoQyU4HE6vbln0yQbPBhwXqdb
	j8TSsyJGK1qdLwSK9t7+tiw1c3sHS+cDdgtWn8zHLFgdFqvRp3GGhRySorx+Sy4mKuo=
X-Gm-Gg: AfdE7ck/lLX0TDNtec/6k1pREnvtKo7TEBslTDy+oNqgu2QZGVUNWIbf9fasLA5Q8Cj
	kvFxK1hAUpe/kiFA99q/d4JrYP4i1xOzUEQDMeUinb8jAvRV/ahfxP4v20yW55O+qgDWvc5Pz7r
	avrigV+14190J4fPKeOnKiCzNHz/jDCGzugauSy4+myPFBPyw7B5DG5P7KSy1QFaZKAm3ylhZe3
	4eInOOmoZqguDNo0fNfqPfh1GtM9taPK/Fd50WvEiTAujacYGsZU8120AncBYw14oRw6En9qjhs
	iSCMG//SRu3OwOESfjLH7m2ym/H7qNUh+LfXU3gI0DikxiVQ7zrA4TPwMrcv4RaiS5356aYOwq8
	t8VT9IcK7A/hKSc2Qt0Wm6HDzKT0aS62jdr2Kd2Nb5uRVq9gv5fryHSnHARW4N6PrBOmUlbmZVD
	ulDK0KKy1eSScQ/aUJYzsbAaTeqpInrCIKR3AtK7rJ
X-Received: by 2002:a05:6000:4a0f:b0:460:602f:85ac with SMTP id ffacd0b85a97d-4626649d859mr2302635f8f.0.1781677349713;
        Tue, 16 Jun 2026 23:22:29 -0700 (PDT)
Received: from localhost (mob-176-247-41-247.net.vodafone.it. [176.247.41.247])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26f3basm48341883f8f.12.2026.06.16.23.22.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 23:22:29 -0700 (PDT)
From: Francesco Lavra <flavra@baylibre.com>
To: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: stable@kernel.org
Subject: [PATCH v2] regcache: Do not overwrite error code when finalizing cache after error
Date: Wed, 17 Jun 2026 08:22:28 +0200
Message-Id: <20260617062228.2151685-1-flavra@baylibre.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1347; i=flavra@baylibre.com; h=from:subject; bh=tX6q3M8wAw3TehCzxow1yfzjjN3As8he2G6anlmONTQ=; b=owEB7QES/pANAwAKAe3xO3POlDZfAcsmYgBqMj0VqLSh1M9CDa5wGV+UsdZC4PcSLNEPz+PeP JlKuKpJ3xCJAbMEAAEKAB0WIQSGV4VPlTvcox7DFObt8TtzzpQ2XwUCajI9FQAKCRDt8TtzzpQ2 X5UcC/9hbFZt81Z26GJUbIubd8LYtvjUdGQ+PwnmOeogX1XI0WTBdyAQGXeUbY4neltEfGWgLpP RdzEDHomCfG0nI46tGHciOGrD2EhRMThWnf7eX9+t2mFdjiU/qk9Pc9yVAN3irAcAwKQsmm+Fqn ntVmOIXKp2SZ/30pCGr/KFrcuZ0pi/QqBvL0QvZtmPkUetNti9Z+ygRReZs8etbOwEiEZ+4BELW MAyodsY+lpwvdqLN6M8XfdlDf/ZE2Zi7uwtAdbwmXsz++IIFmwJ0WXZuE/g1EWr0bZQesQq7qDA vImkqkTzILrdOgoMNh0oEY4P7qygvui8yeIjqjbvGvg7qWE7rQTsXQriqrR2ROXOllWowtJDMYs WbcCCalInF5b+4LSMskLmQON2yXPEWHT5QNhGC5jbsjAzKyS0O6yG1rC0xuzbS0Lt50HVH7lplD NqYQq/J7oC6R2omYtVjtwMOBd61vYehLx60xUrvof0POpEWPh/75vOoz5u7DJtZuV8jaQ=
X-Developer-Key: i=flavra@baylibre.com; a=openpgp; fpr=8657854F953BDCA31EC314E6EDF13B73CE94365F
Content-Transfer-Encoding: 8bit

During regcache initialization, if an error occurs in the
cache_ops->populate callback, and if cache operations include an exit
callback, the error code from populate() is overwritten with the return
value from exit(). This hides the error condition from the caller of
regcache_init(), and can cause NULL pointer dereferences when the regcache
is later accessed.

Fixes: 94a3a95f0315 ("regcache: Add ->populate() callback to separate from ->init()")
Signed-off-by: Francesco Lavra <flavra@baylibre.com>
Cc: stable@kernel.org
---
Changes from v1 [1]:
- added stable tag to commit message

[1] https://lore.kernel.org/driver-core/20260616114429.1852456-1-flavra@baylibre.com/T/

 drivers/base/regmap/regcache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 27616b05111c..aa8f2efed779 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -245,7 +245,7 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 	if (map->cache_ops->exit) {
 		dev_dbg(map->dev, "Destroying %s cache\n", map->cache_ops->name);
 		map->lock(map->lock_arg);
-		ret = map->cache_ops->exit(map);
+		map->cache_ops->exit(map);
 		map->unlock(map->lock_arg);
 	}
 err_free_reg_defaults:
-- 
2.39.5

