Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F8A38F63B
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 09:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445543; cv=none; b=HN2PM7gw9WyIwssty7t4jSPjaLbXpgFsA5kpjhF0ZUNgBWnawrl06w8C3Eo5aOMJT5ivo+ygX58OQR4XFgQXFON7AQlsL5OtDm6aglvfSLaUwmCxMb7gskukUavHM3q96HnBBIiVuXHuADvg1d1v4fmmruutRKjFJ2WdB3PF7bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445543; c=relaxed/simple;
	bh=Jj7mcxOQmjsHoRrowwkJxsw83DIbd4a6kk5yqeGizdA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FWAbK8YqBt8oDo0hHFoGVMjbxw+7NW8TWIUGpu9ey6ERd0j68cFxRlptlcZ+qsP+QVyVZ05AOSRNQVhC1DvVUcNvyont6p6sQgGuxJ1A5b5EKhuvA1fNn3F4HUNwEEcUzAoCjUPLGqNNaq4vKW7BM9hOlwKHTu35Co/VWAVR42w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ui8NKoTC; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ui8NKoTC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772445539; x=1803981539;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Jj7mcxOQmjsHoRrowwkJxsw83DIbd4a6kk5yqeGizdA=;
  b=Ui8NKoTCN6xjrOjOyXsoOEbikQ2iVP4IAaVTyB6eN2aYldlBhH/dUhDH
   LRdUouOCKvuNkekBTLyMIp0sbzePtr3fVFg9wgPUwi/8Byud/TQOwZH6y
   3ywwwbP1xRfVEDZbRlxghTS33OZD7L2ccLkY1/aBpm7jzKqqlfuuhyKOq
   xPYM0Rq9OaL3GFAj+u61QVGta8RXpU8L4HunhRdkJ4vcKjfCKHEZr9Z54
   NyW6Zn9RDJKESGiV1UNJFoZgqpdXv1EDaP4AMePF7d2MiYgtFYs3ED712
   9Wkgg9fpXwWV3dvZZjZ3EwRNBPJ8Cu2rOwADJ/E1JOfKbqKGFQSgx5Hai
   g==;
X-CSE-ConnectionGUID: ZfMWK8YbQCmxhdOLtyAnrQ==
X-CSE-MsgGUID: EQZfB3gMQaCVQv8W7LiYdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="96066032"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="96066032"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:58:52 -0800
X-CSE-ConnectionGUID: hOe4T3jURjyi930qyRGr7g==
X-CSE-MsgGUID: uQRNLmhuQimyQWbErAxyjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="217628233"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2026 01:58:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 05E1F9B; Mon, 02 Mar 2026 10:58:50 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 3/3] regcache: Amend printf() specifiers when printing registers
Date: Mon,  2 Mar 2026 10:56:57 +0100
Message-ID: <20260302095847.2310066-4-andriy.shevchenko@linux.intel.com>
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

In one case the 0x is provided in the formatting string, while
the rest use # for that.

In a couple of more cases a decimal signed value specifier is used.

Amend them to use %#x when register is printed. Note, for the case,
when it's related to the read/write, use %x to be in align with
the similar messages in regmap core.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regcache.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 2605d0bbf550..6bec435a566b 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -120,7 +120,7 @@ static int regcache_hw_init(struct regmap *map, int count)
 			ret = regmap_read(map, reg, &val);
 			map->cache_bypass = cache_bypass;
 			if (ret != 0) {
-				dev_err(map->dev, "Failed to read %d: %d\n",
+				dev_err(map->dev, "Failed to read %x: %d\n",
 					reg, ret);
 				goto err_free;
 			}
@@ -517,7 +517,7 @@ int regcache_sync_region(struct regmap *map, unsigned int min,
 	bypass = map->cache_bypass;
 
 	name = map->cache_ops->name;
-	dev_dbg(map->dev, "Syncing %s cache from %d-%d\n", name, min, max);
+	dev_dbg(map->dev, "Syncing %s cache from %#x-%#x\n", name, min, max);
 
 	trace_regcache_sync(map, name, "start region");
 
-- 
2.50.1

