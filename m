Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F31F30C162
	for <driver-core@lists.linux.dev>; Thu, 18 Jun 2026 20:00:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781812817; cv=none; b=IQoloTm5fWKhCAu7dT1Np5pijGpkk3G2v7oIGubrQXSqqUjObGQ4vGLBBBMYWN0dm/8Jl7nWTBr6L2cbMt0cvFQ/ZdJaaR8VL2z0YjXA+4r7iYHCyqWOAI1LstXlFf/TI1siM//5uDoaWpF7E+AoqiyZJ+aZi9UzbIHXr6D6jUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781812817; c=relaxed/simple;
	bh=fb5rpSuO1hoOOtd131Ps2DqCAszZpQ4vJ/umbDH6r7w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oZNCKmQuOZcQJWtgLaKosPazD5dJ4N+t1AHB8aakBT0kJZXX610NyVBxPrddzJeMKAZ0bk90u6X0EZSpdHJ2/NOWmQjyin7IRDuLiV4srUcTV9ILfDmnmp4b8y7jwZVNk9Ddc8GEFQ13MX/KgjMuCZiL4iTxnwwRnGoNB6pXu64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AYJ5VfvT; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AYJ5VfvT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781812815; x=1813348815;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fb5rpSuO1hoOOtd131Ps2DqCAszZpQ4vJ/umbDH6r7w=;
  b=AYJ5VfvTTD6DKsoaPn1hk1iVie59IG1f677kov1Y+6a9OyoMIg4DN/Wu
   OqZpM64iMyDMnPhDf6cB87OE2XmEG/ocbDcjuuJT7bFTw+O3a10Sh15Wn
   7L/gaXfj1hUDMbvzd1PhPHg+N150s3bfhbwUMUJfe8ZNdYsftW7vT9mOw
   2KneqsFdbm3cEu1OANboWAHZHUqGvsgNGyWh9Z+VWyBRIFYHyRdBhO95a
   vM4mOzEyqHj75+OtXb69Q1+feSbd6R08/+OVELX0gXIUoUA0GjIjycAEU
   CdOBFoAu29rBaM7C392wZDj3mV6BLd6c4srNPdn6epcrxsykHqaIRPNY6
   g==;
X-CSE-ConnectionGUID: /86Xm9o1R+Ka5+OpJZI/oQ==
X-CSE-MsgGUID: AN6UI0fcQNCkeNXdv2LbFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11821"; a="93311490"
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="93311490"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2026 13:00:15 -0700
X-CSE-ConnectionGUID: BrxPzpsWROG9/F3uqGsYVw==
X-CSE-MsgGUID: 3YUbuk7AT02DIXI8apqA6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,212,1774335600"; 
   d="scan'208";a="248531524"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa009.jf.intel.com with ESMTP; 18 Jun 2026 13:00:13 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id AB47195; Thu, 18 Jun 2026 22:00:11 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] regmap: Drop never used devm_regmap_*_free() APIs
Date: Thu, 18 Jun 2026 22:00:09 +0200
Message-ID: <20260618200010.3279713-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_regmap_field_free() was introduced in 2013 and was never ever used.
devm_regmap_field_bulk_free() was introduced in 2020 and the same story.

Drop never used APIs.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap.c | 36 ------------------------------------
 include/linux/regmap.h       |  3 ---
 2 files changed, 39 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index e6e022b02637..bd29f54e7927 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1332,42 +1332,6 @@ void regmap_field_bulk_free(struct regmap_field *field)
 }
 EXPORT_SYMBOL_GPL(regmap_field_bulk_free);
 
-/**
- * devm_regmap_field_bulk_free() - Free a bulk register field allocated using
- *                            devm_regmap_field_bulk_alloc.
- *
- * @dev: Device that will be interacted with
- * @field: regmap field which should be freed.
- *
- * Free register field allocated using devm_regmap_field_bulk_alloc(). Usually
- * drivers need not call this function, as the memory allocated via devm
- * will be freed as per device-driver life-cycle.
- */
-void devm_regmap_field_bulk_free(struct device *dev,
-				 struct regmap_field *field)
-{
-	devm_kfree(dev, field);
-}
-EXPORT_SYMBOL_GPL(devm_regmap_field_bulk_free);
-
-/**
- * devm_regmap_field_free() - Free a register field allocated using
- *                            devm_regmap_field_alloc.
- *
- * @dev: Device that will be interacted with
- * @field: regmap field which should be freed.
- *
- * Free register field allocated using devm_regmap_field_alloc(). Usually
- * drivers need not call this function, as the memory allocated via devm
- * will be freed as per device-driver life-cyle.
- */
-void devm_regmap_field_free(struct device *dev,
-	struct regmap_field *field)
-{
-	devm_kfree(dev, field);
-}
-EXPORT_SYMBOL_GPL(devm_regmap_field_free);
-
 /**
  * regmap_field_alloc() - Allocate and initialise a register field.
  *
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index df44cb30f53b..70fe7dacc911 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -1482,7 +1482,6 @@ DEFINE_FREE(regmap_field, struct regmap_field *, if (_T) regmap_field_free(_T))
 
 struct regmap_field *devm_regmap_field_alloc(struct device *dev,
 		struct regmap *regmap, struct reg_field reg_field);
-void devm_regmap_field_free(struct device *dev,	struct regmap_field *field);
 
 int regmap_field_bulk_alloc(struct regmap *regmap,
 			     struct regmap_field **rm_field,
@@ -1493,8 +1492,6 @@ int devm_regmap_field_bulk_alloc(struct device *dev, struct regmap *regmap,
 				 struct regmap_field **field,
 				 const struct reg_field *reg_field,
 				 int num_fields);
-void devm_regmap_field_bulk_free(struct device *dev,
-				 struct regmap_field *field);
 
 int regmap_field_read(struct regmap_field *field, unsigned int *val);
 int regmap_field_update_bits_base(struct regmap_field *field,
-- 
2.50.1

