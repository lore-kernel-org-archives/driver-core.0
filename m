Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A78392800
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 09:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772445548; cv=none; b=JDVsQ000JGPo4r8TWSWUhVTph4LTUCqRiK+ufaaQTeVihEe4AKTqFd/pwgIw1C4sttkoQ/txDqT2A7KDt4LiiWc9ztwK5MhXA7hRZL9xnnySiA1b8b2DojLOlKKjJIPqkW40M92LBsPtgAQcUeHIVszrLa2f2vgANY9oVsD3Kpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772445548; c=relaxed/simple;
	bh=eRJWGojM49Ji/+2iZ0H6trQJMLyUoGk/ENbpTtxpdOE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VgP3jSeYzhXoVPPHmNz9JxiY+1yY8d+aelBQc63pCqJIaNdSDM43HaSbkyYJyP6kmKdhEHry2VJUaJPLqhoiBcRRy/2V+Cetk/Qb721NAJSm77fXtOhpJS2wLVOJNwHn/+ObLVCaKxBaBuHHjIKez++XqGHU5jLMgIQzPWnxAn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RY1ksUu/; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RY1ksUu/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772445544; x=1803981544;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=eRJWGojM49Ji/+2iZ0H6trQJMLyUoGk/ENbpTtxpdOE=;
  b=RY1ksUu/RjwZ0F9o1eEUFd1me47k6enzHHOu3N7XFrefQXAj0vPgttqu
   bHQ2rjqasDYJOLEEB8n6F8AaGjMpAzZLUlhqTMrKAc/eAbm1tDtLtSmAR
   IU3nKmhkxvOvCNDvpsuUpqpn3bVGe2u2WNJkrsaKrZASvMthWgQHYCwRt
   Jjg91qvFQKiBhI0b5MD3FuV6P9GmmwKuWgBM5bwu7jXB2PYJrhlGMoYJK
   p+o0cEN1hEtbHOnyI5bZwp/gu36FsRFF9xglSDfAiJED7oWDpfrkmSLvz
   Bpj/mTTpRlXKhK+xEkKaKXyBr+QStAxezDJrr1dAD5UDo+vAZOUhOsNyy
   w==;
X-CSE-ConnectionGUID: kAEIpDZUSqakWo2uwkNv0w==
X-CSE-MsgGUID: w7XZ153+RlCg3Dp239XKkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11716"; a="96066040"
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="96066040"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2026 01:58:52 -0800
X-CSE-ConnectionGUID: b0KjjVgESZWNnRQDWxqE2g==
X-CSE-MsgGUID: WHxmzjh/TcCwcGTqJER82Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,319,1763452800"; 
   d="scan'208";a="217628236"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 02 Mar 2026 01:58:51 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id EE13C95; Mon, 02 Mar 2026 10:58:49 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v4 0/3] regcache: Avoid accessing non-initialised cache
Date: Mon,  2 Mar 2026 10:56:54 +0100
Message-ID: <20260302095847.2310066-1-andriy.shevchenko@linux.intel.com>
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
  regcache: Move HW readback after cache initialisation
  regcache: Define iterator inside for-loop and align their types
  regcache: Amend printf() specifiers when printing registers

 drivers/base/regmap/internal.h |  2 +-
 drivers/base/regmap/regcache.c | 42 ++++++++++++++++++++--------------
 2 files changed, 26 insertions(+), 18 deletions(-)

-- 
2.50.1

