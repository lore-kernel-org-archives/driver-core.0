Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FEE6375F62
	for <driver-core@lists.linux.dev>; Thu,  5 Mar 2026 08:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772700896; cv=none; b=HtthuSnWjNAe6b+9I4DkniBY/UFHAjrL9/Hj+eMQ615i2W2FH1Mc5sDh39nh2Qd1aHYRSS57BjWcg2KuDQsI4/SeQR9Ic+mYxJSKsMQ4aHs3tDry368z+wo3pJNt4w8ZY82mbtRUyz8d/zEUczC6IS+C/jFH39Y7kNkiHChJFPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772700896; c=relaxed/simple;
	bh=ncHeq+ah16rZNtN/74k33aTkvCBaxfd0eBCLEnirrLw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bzmCNlHSWq5FTTStLA4k/jVqCl/rY5UsayXeTSX5XpnGeep/Oxaroawyij9kflxB0Df1SlebiPDqUV1wxpd7cNhyjfwRDk6tjFegQno6gOMNAR/bArDuZgKfF4Onz3b9aiVz1rzkjj1PL82Vt1P4hVOnIxb4G0y2TTViVX6PPJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gjprKxdw; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gjprKxdw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772700895; x=1804236895;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=ncHeq+ah16rZNtN/74k33aTkvCBaxfd0eBCLEnirrLw=;
  b=gjprKxdwcjh8nGCzCib7mpyhBuM5UtwvK95xoVEQjCRpIonwojUKB+rV
   JOCMTS87p/qZaFnVrkotmZ8lz12h1AYPNdCIJYc8krP+us7ZpfN6TQ4zP
   iM6t46918l2gCFJQhaa11XfQtPDrQ+ZkP6x2giSu/aRW4tBVyihO+Bpxc
   Ow4v6x1iM6PHbciYFAavm6OVyXul0GJpkwSEyZ6qbOsNpqipU3MXn2jWu
   xwmfjEiYSF2HrU7Zdkof8w1NE7OcYo714kN0z7ipuXfDS2O83Y5yjvF1M
   4jHukijVWpWIqW0QNmah5JXzbQgt7NnzHclwG8d2BMK1Us/bywhnAG4BJ
   w==;
X-CSE-ConnectionGUID: IlcHT/xpQiCsTlZQhoh5wg==
X-CSE-MsgGUID: O3JwTlPcRUSjoF8bT741ew==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73687431"
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="73687431"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2026 00:54:53 -0800
X-CSE-ConnectionGUID: ixMqgIqMTo2DdV1lzK8Yig==
X-CSE-MsgGUID: XZCwT8tISVOjBtlKdwqSjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,325,1763452800"; 
   d="scan'208";a="216425989"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 05 Mar 2026 00:54:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 5407495; Thu, 05 Mar 2026 09:54:50 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v6 0/3] regcache: Avoid accessing non-initialised cache
Date: Thu,  5 Mar 2026 09:52:59 +0100
Message-ID: <20260305085449.3184020-1-andriy.shevchenko@linux.intel.com>
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

Changelog v6:
- refactored to make sure we always clean up the allocated resources (Mark)
- dropped applied patches

v5: 20260303092820.2818138-1-andriy.shevchenko@linux.intel.com

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

Andy Shevchenko (3):
  regcache: Move count check and cache_bypass assignment to the caller
  regcache: Allocate and free reg_defaults on the same level
  regcache: Move HW readback after cache initialisation

 drivers/base/regmap/regcache.c | 63 +++++++++++++++++-----------------
 1 file changed, 31 insertions(+), 32 deletions(-)

-- 
2.50.1

