Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3E65382F04
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 09:28:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772530106; cv=none; b=T0RMrbG3uqPTG30YP0LDi9tnpnJ3eqAQpCeMDnkMPX3YzK38zSWX683C5T1GPVsZLtXdRft1NHZplClBRQpe4gaiUPXp4ySzfZbQTPmG0OEbWOxgwzed0I3tXl7NlhzAgtbBPDiEKzLAyhzmZC2VVSMjDpIGZueMhh/tli3fQfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772530106; c=relaxed/simple;
	bh=Qd9DBS18m/CUGyyErtvMZXRZeolk997D0Nzh7CbbEY0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X+FHeYzSwoMweV3U/XeZCzB7p3YNU6Ir2vpfXFi3BqSqWhU709LYJgVTq9e6shXPYZ0tU1y7QYcjfcLArEKGYJzRh0HzcQ1aRFCxx3c7BmRJeju0saSqSlHvHooH/VqlKFu/i1KSkQ1vInVlw3nErrJHcA59ZrwHz6kKAF4+yUY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KRG8T2cJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KRG8T2cJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772530105; x=1804066105;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Qd9DBS18m/CUGyyErtvMZXRZeolk997D0Nzh7CbbEY0=;
  b=KRG8T2cJXaelqjpok6xgVZRzxm5DDtd6QxfLaj2ipAkyyfOxbEvK1yG/
   nbUMtwOgzQ77v+QFcir6FuTrDs34fYYYEwHS9QIN2e0HSb3f6QdrGdRzw
   NBh6QISWpH9VooRwUszxB3zxIFcuPnosR4si0w5dbgJvYIOOQAnzw20MW
   A159GhNS0lWCUcVpzutNmZyX/NLkwsoE97JKvXCvzJ9UtvvOLGgAbho7q
   aJdIp5wTjwPXurJgzRr95jrXOaIoJCsR1xKXZYRWyK4kBuYXlCoulSEXm
   ULO/a+csfh/Mbz8FVQyQoAeRYGnWOVwNnB4nz+dazYA+jqmg+TMKtvBGi
   g==;
X-CSE-ConnectionGUID: zzMCd4vkQ1ufl1ZURZcOcA==
X-CSE-MsgGUID: 0fyLXYWHTOqEBSHJGx6tAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11717"; a="76158827"
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="76158827"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2026 01:28:24 -0800
X-CSE-ConnectionGUID: lPrGuFCHR4+7Nle2+C5YYw==
X-CSE-MsgGUID: z0IUxQKCQXyRpIe1DR4IWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,321,1763452800"; 
   d="scan'208";a="222095483"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa003.jf.intel.com with ESMTP; 03 Mar 2026 01:28:23 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2C37795; Tue, 03 Mar 2026 10:28:21 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v5 0/2] regcache: Avoid accessing non-initialised cache
Date: Tue,  3 Mar 2026 10:26:23 +0100
Message-ID: <20260303092820.2818138-1-andriy.shevchenko@linux.intel.com>
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

Changelog v5:
- added a precursor patch to make things clearer
- also put the freeing resources into an order (Mark)
- dropped applied patches

v4: 20260302095847.2310066-1-andriy.shevchenko@linux.intel.com

Changelog v4:
- made conditional against 'count' to make it less dependent to the previous code path

v3: 20260226135918.381979-1-andriy.shevchenko@linux.intel.com

Changelog v3:
- dropped unneeded churn in patch 3 (Mark)
- fixed code to pass kunit test cases (Mark)

v2: 20260225161659.3811671-1-andriy.shevchenko@linux.intel.com

Changelog v2:
- rebased on top of the latest regmap changes (Mark)
- added two more little cleanups (patches 4 & 5)

Andy Shevchenko (2):
  regcache: Factor out regcache_hw_exit() helper
  regcache: Move HW readback after cache initialisation

 drivers/base/regmap/regcache.c | 46 +++++++++++++++++++++-------------
 1 file changed, 29 insertions(+), 17 deletions(-)

-- 
2.50.1

