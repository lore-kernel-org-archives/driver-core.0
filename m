Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D1239A81C
	for <driver-core@lists.linux.dev>; Thu, 26 Feb 2026 13:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772114374; cv=none; b=BjJNe0GH2hP24qn3le9a5UyMq9nYsJglIqXwSo2rMytNpZRwJha2O4jgkD4m4bSHqBZDv/fMpN0vBQ2eguCzUWmMp51OrbQVYG1xm2lJeoQuT8qayHuUYStzerCdMzbC3WYpuoBP9qVzj8aG6R7myJEOTYz7KWZYL2LgqXu/iKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772114374; c=relaxed/simple;
	bh=F8wlxy0JgsOLaXjVoU3j2t2ouYerwxqyx10gGe5nDYY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fErHBOkUlQBsHhP9TKjzVcMTwJRsmWgs0Xq6+pQfYcRaliOrE1UCebzPvs53Y1W8Zf3QD4uwC2lL0PPoCmz0JNlM3+wXRHZcFobnozU6xJ0B0HRhfFbpJiBpE8LYOc0WLiMEfEJ2KyA4wtAUyrq7JqASYZge7Py1U4tdi4gxOX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cXMe2JZN; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXMe2JZN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772114369; x=1803650369;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=F8wlxy0JgsOLaXjVoU3j2t2ouYerwxqyx10gGe5nDYY=;
  b=cXMe2JZNeiuO9ilN7n9tDT0NIGkPGcNPOvyvIDBehCAFlwDm02bpyAZ8
   j2XXhLUdmEeYiSLi3it2IMJ/9Kb85a33QNy0EmkRyF8h68WNYZ7g2i3s4
   K964YNqCA/COhXFu02e88ui2Q5snER+/rah4iAwDSDvTZZTghWP556bH4
   NlO/UT9BMOAwVLug1KPlnIyvXCRWJdTzjfqIYE7fEhP+n05oNoXamX1iP
   g6bpTfJs9RNZlTLwZYAAc/WOpkvh1WN5sjQD1WnOmA/4LrYh9i8D6wUc6
   P64U+R7Vh1vRX8yrz/m//NWvcnXv+Ly/aKmQ4oBqw7hwuj0uS+EpnKLnn
   A==;
X-CSE-ConnectionGUID: rdycVeg0RzG0V3++uG3WrA==
X-CSE-MsgGUID: MwD9AK2sSWS4rWaxkynJVw==
X-IronPort-AV: E=McAfee;i="6800,10657,11713"; a="73044505"
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="73044505"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2026 05:59:23 -0800
X-CSE-ConnectionGUID: oYpoMrX6Rwe+nbjwTDhbow==
X-CSE-MsgGUID: MP8Tbw+HSwWhyKyEeNv2+w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,312,1763452800"; 
   d="scan'208";a="214549630"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa010.fm.intel.com with ESMTP; 26 Feb 2026 05:59:21 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id CC34098; Thu, 26 Feb 2026 14:59:19 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v3 0/3] regcache: Avoid accessing non-initialised cache
Date: Thu, 26 Feb 2026 14:57:08 +0100
Message-ID: <20260226135918.381979-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Refactor regcache flow that populates cache on initialisation phase
based on the values in HW. This makes code robust against any possible
accesses to not-fully initialised caches.

Changelog v3:
- dropped unneeded churn in patch 3 (Mark)
- fixed code to pass kunit test cases (Mark)

v2: 20260225161659.3811671-1-andriy.shevchenko@linux.intel.com

Changelog v2:
- rebased on top of the latest regmap changes (Mark)
- added two more little cleanups (patches 4 & 5)

Andy Shevchenko (3):
  regcache: Move HW readback after cache initialisation
  regcache: Define iterator inside for-loop and align their types
  regcache: Amend printf() specifiers when printing registers

 drivers/base/regmap/internal.h |  2 +-
 drivers/base/regmap/regcache.c | 42 ++++++++++++++++++++--------------
 2 files changed, 26 insertions(+), 18 deletions(-)

-- 
2.50.1

