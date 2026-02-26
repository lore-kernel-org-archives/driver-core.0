Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0047135D5F8
	for <driver-core@lists.linux.dev>; Thu, 26 Feb 2026 13:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114374; cv=none; b=Magp2nfyTqqkhZo/GDCXJitV/4/Ous7+KxVZDPr3EMTAQtybzxugi9mr0PvMVfb5054dOI7UhzN7ycmhKJjJJP5w4UDGoCPUvfk5sOYO3lpnOrKAcCPXQbHPTPDfXNh54azRoo3LwOHPtQjwbO4d2QZf1ZqnKksoWutHusZuwSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114374; c=relaxed/simple;
	bh=5pUf4Cex0OtjkD/0khprn0E7BOXzDucdy5k1hn/MaD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ekQKKCvhYluHAlgzUlhNbRY/h98PoaoSesnno4B/pk4tr+TlUwAIko5C9FaZcAnkcfbCNlkeAoLtTc0gr/hrK9WprRlHQrno/wny8eAT6GnTfnCSk6K72NbnnZlYnPOWACprtUJWrkYfM6DUfp8YxApZS7LCQthtiaKvn2IAdUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lrkSbaCX; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lrkSbaCX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772114369; x=1803650369;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5pUf4Cex0OtjkD/0khprn0E7BOXzDucdy5k1hn/MaD0=;
  b=lrkSbaCXheD3FiGb8JDqaFQzJG/C8SCokZztnYR8z4X5opnojNh0PCof
   pZPl3cxDoEfriSi8WL99FG3NieThUBjO5PvJrjPFZnr467jcY+KyiJ81F
   NCzt5TjQXHq8ydl87OL3gV9dCBIBvbIRZWIpMb4ICzKdrLDeuYW+7lXD3
   08l0bm40RTl8Cqqn3G8PRF64GZpJdciN6/QZ0uwzuXFCmG8lOSuOckkB1
   zdhyPkgBluO8WQ2rzatoBulxTiN3BAtj4vyjlPTlqZ0biO5yKQAvxyLUn
   0wUuPvC74vUg46sw+PGQzwWn4+suxRWAw0yU32g2Dt3tchDG+ij8eShqM
   A==;
X-CSE-ConnectionGUID: vLSj+V58RiiKRqrXxM2Tug==
X-CSE-MsgGUID: XPUkIfQwRNqZeEt9q6gZsw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="60749595"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="60749595"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:59:22 -0800
X-CSE-ConnectionGUID: bJYNem8vROCW+Jffg4geVA==
X-CSE-MsgGUID: lj3jOVLFQbqcGY4k6nOLeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="215275437"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 26 Feb 2026 05:59:20 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id D6CCB9D; Thu, 26 Feb 2026 14:59:19 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 3/3] regcache: Amend printf() specifiers when printing registers
Date: Thu, 26 Feb 2026 14:57:11 +0100
Message-ID: <20260226135918.381979-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260226135918.381979-1-andriy.shevchenko@linux.intel.com>
References: <20260226135918.381979-1-andriy.shevchenko@linux.intel.com>
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
index 4a27fb871877..221bbeb60f53 100644
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

