Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793874940;
	b=L8UWfh6AkiDv/M3iT9Y58VjqZNjp5J1dvP/ADc9PbV6h3iX3jvtRuVcZKcvkh8qorpQI
	 BweLYD82dtB/PsT4eAnyytu6/9zj+F/l7jd35asX1D9rP+JBA6aToAUILCQgPmyi1uRKk
	 e6oUnpPbK49u35EvdZC8B2Lgd/J2RQ0cAnHreswVraVLLjH1U+f4oMv+g+plAVxfGUrZz
	 X5W7Oulrz22a7eLrf+kQnOrhkwVfQv9ofkPUy7zALgbCWaYQVWjFKEk3F7aTFeGiTzEpE
	 RjaNZd2QPpoLiYFFnsrpWrmGzE4zdpKB80hysk5F34io2xruTjXffadFDqxfPHgzLhA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793874940;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=YNdbcFZbsaJWPBCwR8C1OKagOKxRAxAHyAgQ2nT3Lq8=;
	b=PQcawyxfZt1/iXYs2uBST6m0mCY9vO6H/i7a+o5fSvNwJiZUjBDGT0JujbsYqPg+x2ez
	 GFICZ3Vq9hBe9jCgPCVGROVdoilyVvxDtvfxZNaoyawgOJn4u3vvtbaxdI+DmXivk991u
	 Ce3rfX4V3gI846BONK8RzMZ2tfVQE3zkclNPREhWoGTM8MySaR6u798flVCoWVOI43yXF
	 ztmG+T2pFhaj04WXJ62WYHNXPeK8v28jIKeEQuxrgZ1s0DW4KIyi5puLykLl+zuzoqNbX
	 7FlwR3w27Vb46LhW3sth4NbyvKacOV6srXuvvv681WrRMJ7yVv3WYD9TYqxZHv6apHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bv3sYQLx;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76ECD606A326
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 10:35:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76ECD606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bv3sYQLx
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793874940; x=1825410940;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eNT8/TR9RrSgwmJ4tlW5/yXQPcCQJRbz4BDv4boO4TU=;
  b=Bv3sYQLxwdBGT5wMkTn3gRZFwdA0tso2w67T65XfBpuVSGNT3sN4Vuns
   yk7taDhs+/MYHM8hNYrv1I6es/8DSbfOwhW6z48WIGIJSpKjj3Kz5Y7U5
   yTU1WXDhL8KJjevv1hkrR0kF4EzL7w2kKCOTFSoUBw0o5n04v+9JQnmzP
   h88uGony99a88kDz6mz0vSqETW6SUxSC8U9uqFZ1+9/bWfmKAlpyez1Z6
   rdx6J1+hzIWGxaI+9BTPxSEvLzF5Cv6vwM1UF/VpznSHrRhbN05in+zZ1
   D1r6L/d9VN/vd/I6iA+FEL9KU1ziMf/I/oAdlDH5W1d/q7mY8eIafpYXP
   A==;
X-CSE-ConnectionGUID: XWJ4D3OJTwqLf3SsN3JLyw==
X-CSE-MsgGUID: Ut56XGewSPmUHJTwy8XFwg==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2673046"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2673046"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2026 02:35:40 -0800
X-CSE-ConnectionGUID: AxLYI/mTRRWpgEagJEcWcg==
X-CSE-MsgGUID: xdsO5fN2R/mGxWrwOKG0Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="8737660"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa011.fm.intel.com with ESMTP; 05 Nov 2026 02:35:37 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 80C9499; Thu, 05 Nov 2026 11:35:35 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Victor Chernyakin <chernyakin.victor.j@outlook.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/1] regmap: Add REG_FIELD_GENMASK() helper macro
Date: Thu,  5 Nov 2026 11:34:54 +0100
Message-ID: <20261105103533.1426533-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

One time in regmap and already a few times over the whole kernel
the users want to extract a mask from the regmap field data type.
Provide a helper and convert regmap core to use it. Others may
follow later on.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

Inspired by a patch SN1PR12MB25282EC93A27F3577BB9B454A5772@SN1PR12MB2528.namprd12.prod.outlook.com
that leaves the driver to handle the custom macro for that.

 drivers/base/regmap/regmap.c | 2 +-
 include/linux/regmap.h       | 3 +++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 83f1f5942135..48e96bc9e7b6 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1215,7 +1215,7 @@ static void regmap_field_init(struct regmap_field *rm_field,
 	rm_field->regmap = regmap;
 	rm_field->reg = reg_field.reg;
 	rm_field->shift = reg_field.lsb;
-	rm_field->mask = GENMASK(reg_field.msb, reg_field.lsb);
+	rm_field->mask = REG_FIELD_GENMASK(reg_field);
 
 	WARN_ONCE(rm_field->mask == 0, "invalid empty mask defined\n");
 
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index a72f17ab6264..8f3034881f8a 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -10,6 +10,7 @@
  * Author: Mark Brown <broonie@opensource.wolfsonmicro.com>
  */
 
+#include <linux/bits.h>
 #include <linux/bug.h>
 #include <linux/cleanup.h>
 #include <linux/delay.h>
@@ -1477,6 +1478,8 @@ struct reg_field {
 				.id_offset = _offset,		\
 				}
 
+#define REG_FIELD_GENMASK(_reg_field)	GENMASK(_reg_field.msb, _reg_field.lsb)
+
 struct regmap_field *regmap_field_alloc(struct regmap *regmap,
 		struct reg_field reg_field);
 void regmap_field_free(struct regmap_field *field);
-- 
2.50.1

