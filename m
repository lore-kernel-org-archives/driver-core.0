Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B6E2E8B83
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 18:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772477280; cv=none; b=ewc28PVhbOx/wiOjZrSke0zFKk+sizeCJHd56s5FAmDpka3epAdEVQkQbg851mHbz8Ih/d94s7BameGqcKZL5wmphUojkV40Y1hbQU+N39Pp7IDBiPtmJEkVgTJhVWb3eyIvxZusjm4BUZmaP7p4Ep0AByo9rWyKhx3KRC35tnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772477280; c=relaxed/simple;
	bh=ZBUwEmFFn/Kb8j/bpJISJv0/ObspuRoYuea/IKSFX5A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pyhve3MfFj6Vef67Nr1ZmQiqvN6EtU84MpHZ6C6geJqTN+oTFtHBUNSm2NyRTV5HbkSK6NpBSL40S6ieq8cAJ++1R8k5I80G6bKuoCU08ka/0Wj/riBgMjcocHOeRWWIXKDzMq820HlHAmFWqZ0c6nQKrar0ix4ggq+eBEZP4Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AfGhKyKx; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AfGhKyKx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772477278; x=1804013278;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ZBUwEmFFn/Kb8j/bpJISJv0/ObspuRoYuea/IKSFX5A=;
  b=AfGhKyKxX/24iomb2TNgooXaJn/yb84cTyNsas+7GCfpma0e5NMOjeDO
   3wrCBtVPJ4/NFB+UZxptKUAAYY5Qf9S9yo+Tk9qb5iDNFlSyLnIK9DNYY
   S/6UAeXDkWaA5XR4VpeTEJoSSIU9rMQH6XBmJHCcNZ/KtmVV25CDgJE+U
   dNQ7yoc8H0H1HMG5hynI/PLhQU9Y37GFUaNnY8uIDUk1gE8eY5CNK/iNL
   JgU+MfdbrdThnrE+wUDUA3fSRldYJE6KJdCGwDfybs7rL8CSpDIEozNQN
   3njM2KZo+wRmZQKJrV2TYLRk1UjF+HTFMLIqNAh58TdAbt+bsjbdgt2KU
   w==;
X-CSE-ConnectionGUID: K+/bFWKwQSWIZTCZqs0Jkg==
X-CSE-MsgGUID: qEV/nIi+RhitltVDyhqEgw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="83832661"
X-IronPort-AV: E=Sophos;i="6.21,320,1763452800"; 
   d="scan'208";a="83832661"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 10:47:57 -0800
X-CSE-ConnectionGUID: kFQduER/SCCKm9kZzcwL1w==
X-CSE-MsgGUID: Yk8a4YoJTp+1+5YF61jlEQ==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 02 Mar 2026 10:47:55 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 9A7C498; Mon, 02 Mar 2026 19:47:54 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Baryshkov <lumag@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Subject: [PATCH v5 1/1] regmap: Synchronize cache for the page selector
Date: Mon,  2 Mar 2026 19:43:31 +0100
Message-ID: <20260302184753.2693803-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the selector register is represented in each page, its value
according to the debugfs is stale because it gets synchronized
only after the real page switch happens. Hence the regmap cache
initialisation from the HW inherits outdated data in the selector
register.

Synchronize cache for the page selector just in time.

Before (offset followed by hexdump, the first byte is selector):

    // Real registers
    18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
    ...
    // Virtual (per port)
    40: 05 ff 00 00 e0 e0 00 00 00 00 00 1f
    50: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
    60: 01 ff 00 00 ff ff 00 00 00 00 00 00
    70: 02 ff 00 00 cf f3 00 00 00 00 00 0c
    80: 03 ff 00 00 00 00 00 00 00 00 00 ff
    90: 04 ff 00 00 ff 0f 00 00 f0 00 00 00

After:

    // Real registers
    18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
    ...
    // Virtual (per port)
    40: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
    50: 01 ff 00 00 e0 e0 00 00 00 00 00 1f
    60: 02 ff 00 00 ff ff 00 00 00 00 00 00
    70: 03 ff 00 00 cf f3 00 00 00 00 00 0c
    80: 04 ff 00 00 00 00 00 00 00 00 00 ff
    90: 05 ff 00 00 ff 0f 00 00 f0 00 00 00

Fixes: 6863ca622759 ("regmap: Add support for register indirect addressing.")
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---

v5: applied fix to avoid circular dependency (infinite loop)
v4: reworked the approach completely

Dmitry,
Please, test on your HW to be sure this will have no side effects
in your case with LT9611.

Marek, this is the same version I sent you earlier off the list.
I haven't added any tag (while knowing that you tested it, so please
confirm it by providing a formal Tested-by, thanks!

FWIW, I have tested it on Intel Galileo board with Cypress CY8C9540 chip.

 drivers/base/regmap/regmap.c | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index c299218849a1..13f994429b38 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1509,6 +1509,7 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
 			       unsigned int val_num)
 {
 	void *orig_work_buf;
+	unsigned int selector_reg;
 	unsigned int win_offset;
 	unsigned int win_page;
 	bool page_chg;
@@ -1527,10 +1528,31 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
 			return -EINVAL;
 	}
 
-	/* It is possible to have selector register inside data window.
-	   In that case, selector register is located on every page and
-	   it needs no page switching, when accessed alone. */
+	/*
+	 * Calculate the address of the selector register in the corresponding
+	 * data window if it is located on every page.
+	 */
+	page_chg = in_range(range->selector_reg, range->window_start, range->window_len);
+	if (page_chg)
+		selector_reg = range->range_min + win_page * range->window_len +
+			       range->selector_reg - range->window_start;
+
+	/*
+	 * It is possible to have selector register inside data window.
+	 * In that case, selector register is located on every page and it
+	 * needs no page switching, when accessed alone.
+	 *
+	 * Nevertheless we should synchronize the cache values for it.
+	 * This can't be properly achieved if the selector register is
+	 * the first and the only one to be read inside the data window.
+	 * That's why we update it in that case as well.
+	 *
+	 * However, we specifically avoid updating it for the default page,
+	 * when it's overlapped with the real data window, to prevent from
+	 * infinite looping.
+	 */
 	if (val_num > 1 ||
+	    (page_chg && selector_reg != range->selector_reg) ||
 	    range->window_start + win_offset != range->selector_reg) {
 		/* Use separate work_buf during page switching */
 		orig_work_buf = map->work_buf;
@@ -1539,7 +1561,7 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
 		ret = _regmap_update_bits(map, range->selector_reg,
 					  range->selector_mask,
 					  win_page << range->selector_shift,
-					  &page_chg, false);
+					  NULL, false);
 
 		map->work_buf = orig_work_buf;
 
-- 
2.50.1

