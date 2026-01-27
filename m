Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B853341ADF
	for <driver-core@lists.linux.dev>; Tue, 27 Jan 2026 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510014; cv=none; b=o6pnBpJK6zm6JZUMQnd4RuvZJy4QhRE04zUgQW8475bS8tFb/49USOtdi6oWOUfWeK7uHJvlQuRoeNu9VFUfuBcaRUK8IpwuYY3TetPey1RG/J/5ale1aItq+9ZTJT+JODHe/bKKTfIMy9bd/ggC/RfyCwS93o1xaUd1lyk8Pes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510014; c=relaxed/simple;
	bh=IzDqYGGG5wQws5n5/t2DJCKrcVDFe42MuIxiJkeclLI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aBJOIog74gHNGh5a5gImAiYh/Djh2Ekbhxu9Q1LTQ3hRzLV51fgHDiGosjQhZpMrkHF3fOpiBSHQp6tdEcbZ5za108qSQ69nfRaHyk2wJQ2vBesOJnKSGBdb5JAsbOpHZC+gA18/4Ki+tsnQF763zhabNDI5MYMEqhZrfNCtD48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EQw/izdz; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EQw/izdz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769510014; x=1801046014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IzDqYGGG5wQws5n5/t2DJCKrcVDFe42MuIxiJkeclLI=;
  b=EQw/izdzOv/AjcjWeFUylR8bg6EuR64P7JhwaXpEDjTeg4ivpzD0V3LT
   XhC+4yqeiLYypXgO4A9cq7ihT6DZUB7VlrCDeA/sAn6RTEXm8/82zBifE
   WNsxid16P7BZlXBQmp0WP6Q/BgBXpwovNBJtcJmMq/yznXhF70JARpYPf
   qOVz1RU/VDzRCB1DuiMzG7cokquLymG2j7HB/XKZYX2hPwCZt9Ve2FXMt
   LngFpUUheb1xd0l0Av3jeqaaGqxRzZ8xGKcxM9SaX2qi2Ulo6c7FZf37X
   CeG8aTZeNVwpK2RxY6YWi8rdd7UiWk2SW4JZlaX11y17potfeH1k2+fr9
   g==;
X-CSE-ConnectionGUID: x9URuP47Q8GnPqw9fU33OA==
X-CSE-MsgGUID: 8zio9xe5Q1mjNaiOy2t6fQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="93360002"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="93360002"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:33:31 -0800
X-CSE-ConnectionGUID: hZ90SbZmS/mrx/e6Ipqs1A==
X-CSE-MsgGUID: 7gYDBLWzRz2Q0ZKTcRqpuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208184405"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2026 02:33:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9441099; Tue, 27 Jan 2026 11:33:26 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: [PATCH v1 1/3] pinctrl: core: Remove unused devm_pinctrl_unregister()
Date: Tue, 27 Jan 2026 11:32:06 +0100
Message-ID: <20260127103325.3925173-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
References: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are no users, drop it for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/pinctrl/core.c                        | 22 -------------------
 include/linux/pinctrl/pinctrl.h               |  3 ---
 3 files changed, 26 deletions(-)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 0198ac65e874..7d2b897d66fa 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -408,7 +408,6 @@ PINCTRL
   devm_pinctrl_get_select()
   devm_pinctrl_register()
   devm_pinctrl_register_and_init()
-  devm_pinctrl_unregister()
 
 POWER
   devm_reboot_mode_register()
diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index 83254a95ef17..b2b86c4d8475 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -2323,16 +2323,6 @@ static void devm_pinctrl_dev_release(struct device *dev, void *res)
 	pinctrl_unregister(pctldev);
 }
 
-static int devm_pinctrl_dev_match(struct device *dev, void *res, void *data)
-{
-	struct pctldev **r = res;
-
-	if (WARN_ON(!r || !*r))
-		return 0;
-
-	return *r == data;
-}
-
 /**
  * devm_pinctrl_register() - Resource managed version of pinctrl_register().
  * @dev: parent device for this pin controller
@@ -2403,18 +2393,6 @@ int devm_pinctrl_register_and_init(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_register_and_init);
 
-/**
- * devm_pinctrl_unregister() - Resource managed version of pinctrl_unregister().
- * @dev: device for which resource was allocated
- * @pctldev: the pinctrl device to unregister.
- */
-void devm_pinctrl_unregister(struct device *dev, struct pinctrl_dev *pctldev)
-{
-	WARN_ON(devres_release(dev, devm_pinctrl_dev_release,
-			       devm_pinctrl_dev_match, pctldev));
-}
-EXPORT_SYMBOL_GPL(devm_pinctrl_unregister);
-
 static int __init pinctrl_init(void)
 {
 	pr_debug("initialized pinctrl subsystem\n");
diff --git a/include/linux/pinctrl/pinctrl.h b/include/linux/pinctrl/pinctrl.h
index 1a8084e29405..c329cc693139 100644
--- a/include/linux/pinctrl/pinctrl.h
+++ b/include/linux/pinctrl/pinctrl.h
@@ -187,9 +187,6 @@ extern struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
 				const struct pinctrl_desc *pctldesc,
 				void *driver_data);
 
-extern void devm_pinctrl_unregister(struct device *dev,
-				struct pinctrl_dev *pctldev);
-
 extern void pinctrl_add_gpio_range(struct pinctrl_dev *pctldev,
 				struct pinctrl_gpio_range *range);
 extern void pinctrl_add_gpio_ranges(struct pinctrl_dev *pctldev,
-- 
2.50.1

