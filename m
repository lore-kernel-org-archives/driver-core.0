Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97B673D6698
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 16:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772036232; cv=none; b=tlabcYUn7ZfiDr34KKnA9s3Um5u7nag+Zm3KVdCh4fPmTx2gAMb9euuchkpLimSbt64UyVo0yG0cpwgIqcIasgLORSKW/LwKbTWOp4D7YTLCx8alQTYnqs0gHrXIFKz3bIzr5FIQyMmyHey3q+3d3nYU4UtPT2b1IRUN8DT7jcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772036232; c=relaxed/simple;
	bh=1rUxMu9OMJ0rOknLdIz6iSzQkW6FgEjpgRF9j0FCNis=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lRajKgBw2aFzzUBGpCNQHSzM9pr4l+zDYG+/aGgFG8zwojf1oeIKHQOlajNrJsQGdw9T7gMU9BwCTIQIRR/AfWcKe1ddjgUpZCgSDAztFKzu0kH87PURNKUopWxT5qzeOUFP7H2gAZ2ELz1u6f5JQOEcLrr40NeqpZgmOPFRiCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nx2Hvsb/; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nx2Hvsb/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772036228; x=1803572228;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1rUxMu9OMJ0rOknLdIz6iSzQkW6FgEjpgRF9j0FCNis=;
  b=nx2Hvsb/73cWXcWmyENy+Y6yzFjw6UW5NnsTgADyQxIR5QC1R9viCq5f
   9RyXgcQg0PtW8ga5bPlr1z6vfSDgb6TOpxO1dDsWFR40vLWwBxekigIEl
   FOUV3y/1LZiuKnlQdEw7aGbdOFg5xWEOi2nNrIEmCyMqLX/9hfxsF1OqI
   5pEkqVzfYA26b+9N4EEDib+RDSd4/vrMKdjxJdbz+bXl1PRQuwHg5tuug
   jFMJLW87iAV8PEZjktsofPkK/vT2NTFb0w2On0m95TlG62JUkqPFg9CcU
   a8eXt63hr96yZ1B872yfYtnHeLbnwc8vTNMaYXRIDnD/sYY9gf6fTJlL0
   Q==;
X-CSE-ConnectionGUID: T2bhc9MoShCqLc95CNSDOQ==
X-CSE-MsgGUID: +nQE7AxAQI6wOrKEYycEiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72783300"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="72783300"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:17:03 -0800
X-CSE-ConnectionGUID: NbqALLR6QSOVdSp/SSaaZQ==
X-CSE-MsgGUID: MM2DwbsMTR28DeeDuk3eWg==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2026 08:17:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B866F99; Wed, 25 Feb 2026 17:17:00 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 1/5] regcache: Remove duplicate check in regcache_hw_init()
Date: Wed, 25 Feb 2026 17:15:55 +0100
Message-ID: <20260225161659.3811671-2-andriy.shevchenko@linux.intel.com>
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

The regcache_hw_init() is never called without preliminary check
for num_reg_defaults_raw not being 0. Thus, remove duplicate in
the function.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regcache.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/base/regmap/regcache.c b/drivers/base/regmap/regcache.c
index a35f2b20298b..d41cdb39c78f 100644
--- a/drivers/base/regmap/regcache.c
+++ b/drivers/base/regmap/regcache.c
@@ -50,9 +50,6 @@ static int regcache_hw_init(struct regmap *map)
 	unsigned int reg, val;
 	void *tmp_buf;
 
-	if (!map->num_reg_defaults_raw)
-		return -EINVAL;
-
 	/* calculate the size of reg_defaults */
 	for (count = 0, i = 0; i < map->num_reg_defaults_raw; i++)
 		if (regmap_readable(map, i * map->reg_stride) &&
-- 
2.50.1

