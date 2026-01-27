Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F3D2340D8C
	for <driver-core@lists.linux.dev>; Tue, 27 Jan 2026 10:33:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510015; cv=none; b=hGFzOXgM7FzRxJIFpWfbPL/7LI5fzby9c/c5paZ1Gy5egaQi+ge92B5kaM551wkqiaLFE3LGrrzF4n9J4MiSqgPAMVRtO1hQLP/4DZCPwOvC2vJ2izHjSBhxK+ic6883lVGlf/Gl9kbPYAKQkqPhdEdeAcFd4+76Ikzi/cIUWwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510015; c=relaxed/simple;
	bh=MP0MnsR/BquRxvUNp+TB4jwxKm3J5DHmTOVK3JU0UvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WzXADQAfkqukXNuAkHdz0AemN48TAtTCXpdJBagLO8dUVLZlSDurKZanHBLT9ubvOC9xuX28Y5cNeGw+hz+Mal56HRlVeqYS/A1KE03h/lLGNnpee80Qg7acJ3JG/59Vs/nGGzRR70+MJRJ1FnaCODlhkWAdNzWkKuKl6RAea6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fWQvQV9g; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fWQvQV9g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769510014; x=1801046014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=MP0MnsR/BquRxvUNp+TB4jwxKm3J5DHmTOVK3JU0UvI=;
  b=fWQvQV9gspf/zSlrs28dhD77+Oql/JzkBKg6zc5J1jPdZe/d9PhphcH4
   rj7ykIC0g1gVnXoV8WIp+mdJEh6Sfh5ujh+IbpmRhHTwoWaJEvyEU6i7s
   86o1IfdAgW2IRjo5MI/QqaqBuYEPCvYbpoYSJsQdIWFZ5hGYFLMP7BuUT
   q7n1iD5CGBKNZbD7dcVXTVTMO9/AmSa517qsDzyAUXZ5pPM3yIR2Ayg3g
   McfwbJCyJMZbExiZ6bXXHjx1wTO1D2rLZ+K7TMJKegc4LAF8t/5lIimvj
   h883+vIfbCiPPBqu9ODvRJq1rEKPKrOmFs+eV6WZbUw2RTpEa14YDVkB3
   g==;
X-CSE-ConnectionGUID: Wyjy/j7TSVCtGkdZqVEApg==
X-CSE-MsgGUID: MeApj9z5Q2GGu8+nFjSepg==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="93360004"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="93360004"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:33:31 -0800
X-CSE-ConnectionGUID: Jhy0DzNlSsiX6QnAq/0nug==
X-CSE-MsgGUID: cSR+34z2QIOlPYax2W11tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208184406"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2026 02:33:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 993789B; Tue, 27 Jan 2026 11:33:26 +0100 (CET)
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
Subject: [PATCH v1 2/3] pinctrl: core: Simplify devm_pinctrl_*()
Date: Tue, 27 Jan 2026 11:32:07 +0100
Message-ID: <20260127103325.3925173-3-andriy.shevchenko@linux.intel.com>
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

Use devm_add_action_or_reset() instead of devres_alloc() and
devres_add(), which works the same. This will simplify the
code. There is no functional changes.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/pinctrl/core.c | 67 +++++++++++++-----------------------------
 1 file changed, 20 insertions(+), 47 deletions(-)

diff --git a/drivers/pinctrl/core.c b/drivers/pinctrl/core.c
index b2b86c4d8475..ebf803bff867 100644
--- a/drivers/pinctrl/core.c
+++ b/drivers/pinctrl/core.c
@@ -1383,9 +1383,9 @@ int pinctrl_select_state(struct pinctrl *p, struct pinctrl_state *state)
 }
 EXPORT_SYMBOL_GPL(pinctrl_select_state);
 
-static void devm_pinctrl_release(struct device *dev, void *res)
+static void devm_pinctrl_release(void *p)
 {
-	pinctrl_put(*(struct pinctrl **)res);
+	pinctrl_put(p);
 }
 
 /**
@@ -1397,31 +1397,21 @@ static void devm_pinctrl_release(struct device *dev, void *res)
  */
 struct pinctrl *devm_pinctrl_get(struct device *dev)
 {
-	struct pinctrl **ptr, *p;
-
-	ptr = devres_alloc(devm_pinctrl_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+	struct pinctrl *p;
+	int ret;
 
 	p = pinctrl_get(dev);
-	if (!IS_ERR(p)) {
-		*ptr = p;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
+	if (IS_ERR(p))
+		return p;
+
+	ret = devm_add_action_or_reset(dev, devm_pinctrl_release, p);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return p;
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_get);
 
-static int devm_pinctrl_match(struct device *dev, void *res, void *data)
-{
-	struct pinctrl **p = res;
-
-	return *p == data;
-}
-
 /**
  * devm_pinctrl_put() - Resource managed pinctrl_put()
  * @p: the pinctrl handle to release
@@ -1432,8 +1422,7 @@ static int devm_pinctrl_match(struct device *dev, void *res, void *data)
  */
 void devm_pinctrl_put(struct pinctrl *p)
 {
-	WARN_ON(devres_release(p->dev, devm_pinctrl_release,
-			       devm_pinctrl_match, p));
+	devm_release_action(p->dev, devm_pinctrl_release, p);
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_put);
 
@@ -2316,10 +2305,8 @@ void pinctrl_unregister(struct pinctrl_dev *pctldev)
 }
 EXPORT_SYMBOL_GPL(pinctrl_unregister);
 
-static void devm_pinctrl_dev_release(struct device *dev, void *res)
+static void devm_pinctrl_dev_release(void *pctldev)
 {
-	struct pinctrl_dev *pctldev = *(struct pinctrl_dev **)res;
-
 	pinctrl_unregister(pctldev);
 }
 
@@ -2338,20 +2325,16 @@ struct pinctrl_dev *devm_pinctrl_register(struct device *dev,
 					  const struct pinctrl_desc *pctldesc,
 					  void *driver_data)
 {
-	struct pinctrl_dev **ptr, *pctldev;
-
-	ptr = devres_alloc(devm_pinctrl_dev_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+	struct pinctrl_dev *pctldev;
+	int ret;
 
 	pctldev = pinctrl_register(pctldesc, dev, driver_data);
-	if (IS_ERR(pctldev)) {
-		devres_free(ptr);
+	if (IS_ERR(pctldev))
 		return pctldev;
-	}
 
-	*ptr = pctldev;
-	devres_add(dev, ptr);
+	ret = devm_add_action_or_reset(dev, devm_pinctrl_dev_release, pctldev);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return pctldev;
 }
@@ -2373,23 +2356,13 @@ int devm_pinctrl_register_and_init(struct device *dev,
 				   void *driver_data,
 				   struct pinctrl_dev **pctldev)
 {
-	struct pinctrl_dev **ptr;
 	int error;
 
-	ptr = devres_alloc(devm_pinctrl_dev_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return -ENOMEM;
-
 	error = pinctrl_register_and_init(pctldesc, dev, driver_data, pctldev);
-	if (error) {
-		devres_free(ptr);
+	if (error)
 		return error;
-	}
 
-	*ptr = *pctldev;
-	devres_add(dev, ptr);
-
-	return 0;
+	return devm_add_action_or_reset(dev, devm_pinctrl_dev_release, *pctldev);
 }
 EXPORT_SYMBOL_GPL(devm_pinctrl_register_and_init);
 
-- 
2.50.1

