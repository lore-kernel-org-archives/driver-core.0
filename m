Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 413E738F63B
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 09:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445544; cv=none; b=jAI0YdMuuBd3RAgwQN/sSyUxzjLCubWcMdFoy4/Yx06Do70TgrWyQQUzTVjdf47AbMqg/L/DMkJoA169WgmxDc27TptKQPxROZCrNqu3e1Jsgov9P+b4LZwdGFGCTCQMM5pCrkSnu8MOBK5SzX/UYHp9s5M7QeMjyp8LBVRpi1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445544; c=relaxed/simple;
	bh=SmrzIIdTvC5NcRZWc+K38Miw25CJKELSo63s2QWlQ04=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oGIYwNK/pdrgUayGzbZ4Zfu6LEqdxHWhV/pwYvMr+4zsmUYkStXJyr9B4h+jf3znzM+39/TRDtRrPjPQaV68xMNv2qQLn3DxoDNmz3E0DQanIqPl56xwXtBf5oOTBMd8jTU+vbLxJmzO3NYsovAapQ6uQctsnjA2BKH8M6s7Ybo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cK1xN5qq; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cK1xN5qq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772445543; x=1803981543;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SmrzIIdTvC5NcRZWc+K38Miw25CJKELSo63s2QWlQ04=;
  b=cK1xN5qqY0rUaycbGyg3enh5l5p4i5ZKdel1QeiDET/wJsZFaKQ91wMx
   W7KQwLxi/Io3e5S0HA3BxkoMq96g0i/dTIsyOkacwqxicT973+BF132D0
   1NiVZcnidtYh5WA5MOX5kYRGBR0B9jSo6pSIljbtMhhXy5Oe0MhMNLC4V
   lZoSDJYIblP7SCZVnWqC/jWogLZSrssMzfS/h89/zq2Th591V/BQIhtUe
   RH58s8aoyaZyNsziMQ9DuQWROxLm1aJQNkLI5TX72OUw06igIbnAUgwC/
   nBZtJTl36INhoN3IfQtTYwFoCly4vKrJwiVjL7Stmx3YL7ML8REj+r6d/
   g==;
X-CSE-ConnectionGUID: sujqTxcIS3646Es7/K8+pA==
X-CSE-MsgGUID: jExMx4SRS4ecsjhRtGQMgQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="96066036"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="96066036"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:58:52 -0800
X-CSE-ConnectionGUID: sLO3htK8SKyWBSnKoLOFjg==
X-CSE-MsgGUID: aD6qCZrASj+z+InPWa0xfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="217628234"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2026 01:58:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 01BE399; Mon, 02 Mar 2026 10:58:50 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 2/3] regcache: Define iterator inside for-loop and align their types
Date: Mon,  2 Mar 2026 10:56:56 +0100
Message-ID: <20260302095847.2310066-3-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260302095847.2310066-1-andriy.shevchenko@linux.intel.com>
References: <20260302095847.2310066-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Some of the iterators may be defined inside the respective for-loop
reducing the scope and potential risk of their misuse. While at it,
align their types based on the type of the upper or lower limits.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/internal.h |  2 +-
 drivers/base/regmap/regcache.c | 13 ++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/base/regmap/internal.h b/drivers/base/regmap/internal.h
index 5bf993165438..c77f3a49a89e 100644
--- a/drivers/base/regmap/internal.h
+++ b/drivers/base/regmap/internal.h
@@ -162,7 +162,7 @@ struct regmap {
 	bool no_sync_defaults;
 
 	struct reg_sequence *patch;
-	int patch_regs;
+	unsigned int patch_regs;
 
 	/* if set, the regmap core can sleep */
 	bool can_sleep;
diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index ae60411ea8dc..2605d0bbf550 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -44,11 +44,11 @@ EXPORT_SYMBOL_GPL(regcache_sort_defaults);
 
 static int regcache_count_cacheable_registers(struct regmap *map)
 {
-	int count;
-	int i;
+	unsigned int count;
 
 	/* calculate the size of reg_defaults */
-	for (count = 0, i = 0; i < map->num_reg_defaults_raw; i++)
+	count = 0;
+	for (unsigned int i = 0; i < map->num_reg_defaults_raw; i++)
 		if (regmap_readable(map, i * map->reg_stride) &&
 		    !regmap_volatile(map, i * map->reg_stride))
 			count++;
@@ -62,7 +62,6 @@ static int regcache_count_cacheable_registers(struct regmap *map)
 
 static int regcache_hw_init(struct regmap *map, int count)
 {
-	int i, j;
 	int ret;
 	unsigned int reg, val;
 	void *tmp_buf;
@@ -103,7 +102,7 @@ static int regcache_hw_init(struct regmap *map, int count)
 	}
 
 	/* fill the reg_defaults */
-	for (i = 0, j = 0; i < map->num_reg_defaults_raw; i++) {
+	for (unsigned int i = 0, j = 0; i < map->num_reg_defaults_raw; i++) {
 		reg = i * map->reg_stride;
 
 		if (!regmap_readable(map, reg))
@@ -849,13 +848,13 @@ static int regcache_sync_block_raw(struct regmap *map, void *block,
 			    unsigned int block_base, unsigned int start,
 			    unsigned int end)
 {
-	unsigned int i, val;
 	unsigned int regtmp = 0;
 	unsigned int base = 0;
 	const void *data = NULL;
+	unsigned int val;
 	int ret;
 
-	for (i = start; i < end; i++) {
+	for (unsigned int i = start; i < end; i++) {
 		regtmp = block_base + (i * map->reg_stride);
 
 		if (!regcache_reg_present(cache_present, i) ||
-- 
2.50.1

