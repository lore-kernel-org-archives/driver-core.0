Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9F73750CC
	for <driver-core@lists.linux.dev>; Thu,  5 Mar 2026 08:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700895; cv=none; b=XR4zQCewp9ZyhvROO+u5j5L1gi+19C5GxDExdOV7I2ph4o5c1YOPayO44PkEUpM5KsYUniXf/SbUR2NfSvhxEh5/+ojBNdgXt4MqGwGc8BKENgGSud62JnoSNTU0FA2ZKITGe/kADUWc1ICXqVhZkO9YfM6gs7N/QsWYVh2JHBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700895; c=relaxed/simple;
	bh=kXH9K9ZBKw/KaO+pgZt2pJn2cuQwBKJxPFo+0T/rU88=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uCmjhcon2VrJZ+oibaghXDtfVy2HRKmKuLDCML+9nDg8abZUNAoSJsgQoKSylaiU5QPtPbMOIJwkQvmJ7KA8hoH9ibO5pX+m4A4CveHETmjOd2W+JiZXbQNPlG2VUydR6/0cU6xs/BB6oJbiV1u489uVfx8CsMwJVmctFx2hRl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgIzYJis; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgIzYJis"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772700895; x=1804236895;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kXH9K9ZBKw/KaO+pgZt2pJn2cuQwBKJxPFo+0T/rU88=;
  b=EgIzYJisrNmr2wldVEwZDf3bnYLVk8xWjpjQcfwJd8jzmEg7URs4pSLv
   LNCmkr3H98akRMJPwLB/m+Qd033fMT7+Ru+UUS082FUzRoffXpVDm3BKE
   uuqxvRBURpot7XkF1i6TSPZUc3dQgOG69PYzYz3EKOQrwWAulZjA/R4gK
   QObCea8Ktlq6BN6YOsCiFOmoSnZxTAokUZ4FtTBiKU1nTQT8cJIY5E4Y/
   nyQ4CaLm0h93JoZ3qRrBQPVH3MHM6Dzdnc5OHxIiYc+vsNr1qaJWH7/Qs
   WDoCafJjBoHJjPdBzzdUmawrIFR+H0vKAVSrgbgyKexLJP2Nw8rQey9Am
   Q==;
X-CSE-ConnectionGUID: vwWbqNegTgG4uwogofCS+A==
X-CSE-MsgGUID: gfzDRQ5KQh2NnGPOHEdVLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73694920"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73694920"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:54:54 -0800
X-CSE-ConnectionGUID: vzjuRr4nRCieZIyJDCGj6g==
X-CSE-MsgGUID: Jo8pUf7JQQOdEwPcx4lcBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="222769271"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 05 Mar 2026 00:54:52 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5755198; Thu, 05 Mar 2026 09:54:50 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v6 1/3] regcache: Move count check and cache_bypass assignment to the caller
Date: Thu,  5 Mar 2026 09:53:00 +0100
Message-ID: <20260305085449.3184020-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260305085449.3184020-1-andriy.shevchenko@linux.intel.com>
References: <20260305085449.3184020-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Make regcache_count_cacheable_registers() just a counting routine
without any side effects by moving count check and cache_bypass
assignment to the caller.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regcache.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 329cdee1ae1c..b73de70bbf3f 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -53,10 +53,6 @@ static int regcache_count_cacheable_registers(struct regmap *map)
 		    !regmap_volatile(map, i * map->reg_stride))
 			count++;
 
-	/* all registers are unreadable or volatile, so just bypass */
-	if (!count)
-		map->cache_bypass = true;
-
 	return count;
 }
 
@@ -206,6 +202,10 @@ int regcache_init(struct regmap *map, const struct regmap_config *config)
 		map->reg_defaults = tmp_buf;
 	} else if (map->num_reg_defaults_raw) {
 		count = regcache_count_cacheable_registers(map);
+		if (!count)
+			map->cache_bypass = true;
+
+		/* All registers are unreadable or volatile, so just bypass */
 		if (map->cache_bypass)
 			return 0;
 
-- 
2.50.1

