Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63ABE3D902E
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 16:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772036235; cv=none; b=fim/WjK5Fzs7UrbQSQS82oOjLp9Eiyv43oV3Slm5o7AXsg83nuASoURqckxpTdNaMCiulnWZkLtc2oPmcYgiwJ4VEYtdx9d1BJU4UDhN41Qab8o47mdKIYsW7NMeMW76Fq6KoPR5VkU7CaIOBBCL6qCiEL6cBaqE7ao8+4Vtwfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772036235; c=relaxed/simple;
	bh=5/NgxQmy/TQpSlRUMZT0ARZ3A7OkjFT5Sujw50dl+dw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IiEqm158XRIAub28VMZPSfUYy0r7+Bh014NlU5Sd5hgoHlerDMo3iAWT1qxcOqpL/uO+AEWDa6Z8UM2+CGm1ysjZhemE2Ak9foxxFkxTPb6Kk/4ZbynERHPyBOn05GYxYCD/bXtB2bdK+JJ1JNdXPOBsuJw9TXXKJmf9GJDo160=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a88e59yY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a88e59yY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772036232; x=1803572232;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5/NgxQmy/TQpSlRUMZT0ARZ3A7OkjFT5Sujw50dl+dw=;
  b=a88e59yYtLDDup5oyLiG+308mi/gYySpTS+gnfMEjvMQYzneRL72PIeX
   ZKNiTxCDHl5VvcMtSmwu1+x9A2Dz/yE/Qw5REy68Hf1IWwGuTOODj2A2d
   /RcIt4geUDUEJE6+GBEsh2+Fq0YeIs/blNxJMdbfVb6ekXBr7TJ3kL6bG
   9UhOc6SYH4dNqu124wgJq226g+wPEdHv50q0qxpihQTrJn1mKn9l6j+Fp
   QxTLaAyIQkM0UWzEyAhhzGRaqpXUnHeGVyoKP0jO3Lnr9Re2Sr0hQkYwG
   oMDyls0J6RqsYJ+LBmecqValDEXl5C3zCKPGuAAVWLmBFHp8Ldrzs14jh
   w==;
X-CSE-ConnectionGUID: nAKjlc7SR6K/CNGc9PectA==
X-CSE-MsgGUID: yJFxwYKdTYCxJfacqCX3/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72783316"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="72783316"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:17:05 -0800
X-CSE-ConnectionGUID: TF1sJYE+SnSF81nO5JBFZw==
X-CSE-MsgGUID: i+rriGxLT/CrUaZGgs3/8Q==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2026 08:17:04 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C9102A1; Wed, 25 Feb 2026 17:17:00 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 5/5] regcache: Amend printf() specifiers when printing registers
Date: Wed, 25 Feb 2026 17:15:59 +0100
Message-ID: <20260225161659.3811671-6-andriy.shevchenko@linux.intel.com>
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

In one case the 0x is provided in the formatting string, while
the rest use # for that.

In a couple of more cases a decimal signed value specifier is used.

Amend them to use %#x when register is printed. Note, for the case,
when it's related to the read/write, use %x to be in align with
the similar messages in regmap core.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regcache.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index 7ac30762c236..1d1e252a9f7e 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -112,7 +112,7 @@ static int regcache_hw_init(struct regmap *map, int count)
 			ret = regmap_read(map, reg, &val);
 			map->cache_bypass = cache_bypass;
 			if (ret != 0) {
-				dev_err(map->dev, "Failed to read %d: %d\n",
+				dev_err(map->dev, "Failed to read %x: %d\n",
 					reg, ret);
 				goto err_free;
 			}
@@ -509,7 +509,7 @@ int regcache_sync_region(struct regmap *map, unsigned int min,
 	bypass = map->cache_bypass;
 
 	name = map->cache_ops->name;
-	dev_dbg(map->dev, "Syncing %s cache from %d-%d\n", name, min, max);
+	dev_dbg(map->dev, "Syncing %s cache from %#x-%#x\n", name, min, max);
 
 	trace_regcache_sync(map, name, "start region");
 
@@ -818,7 +818,7 @@ static int regcache_sync_block_raw_flush(struct regmap *map, const void **data,
 
 	count = (cur - base) / map->reg_stride;
 
-	dev_dbg(map->dev, "Writing %zu bytes for %d registers from 0x%x-0x%x\n",
+	dev_dbg(map->dev, "Writing %zu bytes for %d registers from %#x-%#x\n",
 		count * val_bytes, count, base, cur - map->reg_stride);
 
 	map->cache_bypass = true;
-- 
2.50.1

