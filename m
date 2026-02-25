Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E78CF3D7D82
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772036232; cv=none; b=grF5mw1qMkWtQxvbrfQujj5++POdB7T4oskSS1TdFdXDew13WIuw2OeaahMfeQG439CzIy3ENfn1s9pRq6KKROetzvjAA0grc3LjB94NolpCNJlpdIu3zulAHIWeHQmXlfnEAhkw3t1hrriC7Mn1+S8TI1+3o9w4qfkF68TFVHg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772036232; c=relaxed/simple;
	bh=z+nHRImxLIutPaJyWKxswcxQAhknQSLI4Jt9PtjKFns=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=n8iFO+0/o2Mknbxza4AKA2iOjhtZLlVyypzmxr/PDJn0Ly2mrLpbjtkZRfZQJx4KAqQ4IBFFRTKb0FRvuyo1Q67wNov4wdVAihdUeWj17wfnkUMQhTNT2FCNgkgTtwn0VXbSOHCb7c6esm/kbFYERe4YmTLNQfswUuoGmyo/go0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TXispnQj; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TXispnQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772036229; x=1803572229;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=z+nHRImxLIutPaJyWKxswcxQAhknQSLI4Jt9PtjKFns=;
  b=TXispnQj6MHt7arcWjJ9D+7lqATlLBiDvjgGA2fWuuoc4o0/Lixpo9Bm
   A60OC9ZLJfU6Bmh0zbcUGA+tVZBuG/eN0RQazt5WeqRDzXPjuonxA5kbu
   CNwlWpQXP+Jno4SDaX1/fyc5mLYZQyhwqmJsbOvv8+Keb8a/GlVOoTnij
   ZTCvOCzClqdLnxJiwpV3UHjwkrrl3hK8FN+OEEpyUxyaTLbRo7xX5PrY7
   h9age/jMbW5ZybBHUFrfnLmknCQadFwGQ5sLxWvOfoHDroBYCrt2Vy+gt
   33jv9PUgWVj3Sif2dPwWz6DEDNZvyVUX+EDWAMiuvOxgKLqtG8RTM9no2
   g==;
X-CSE-ConnectionGUID: vvBSll9wTP61kHRl0dtW4Q==
X-CSE-MsgGUID: 3+o1ydRqT1W5SiyyLKlYyw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72783305"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="72783305"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:17:03 -0800
X-CSE-ConnectionGUID: oerpoDNFRUeHNJUAoYJTIQ==
X-CSE-MsgGUID: VKDlY3BQRgSDOK/DGNKuhA==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2026 08:17:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C53D39E; Wed, 25 Feb 2026 17:17:00 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 4/5] regcache: Define iterator inside for-loop and align their types
Date: Wed, 25 Feb 2026 17:15:58 +0100
Message-ID: <20260225161659.3811671-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
References: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
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
index de03b090f152..7ac30762c236 100644
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
@@ -95,7 +94,7 @@ static int regcache_hw_init(struct regmap *map, int count)
 	}
 
 	/* fill the reg_defaults */
-	for (i = 0, j = 0; i < map->num_reg_defaults_raw; i++) {
+	for (unsigned int i = 0, j = 0; i < map->num_reg_defaults_raw; i++) {
 		reg = i * map->reg_stride;
 
 		if (!regmap_readable(map, reg))
@@ -841,13 +840,13 @@ static int regcache_sync_block_raw(struct regmap *map, void *block,
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

