Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 504D93D7D93
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 16:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772036234; cv=none; b=lMNMwngwkQP6FHxzG8bLw2yMVRBI0arwbhwnigpUdCClkIO+jX3rKXVzXbLdbo4Dsso8YHE5f0InxvjPJ5tCyAqzWygpwqzD8OcEbGxd9pSSjohOt6DeuKnOgEJ1xVxukG1d6hxnOBmhCVPHmkeWvdilEXGURnl+TGDc8JLISr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772036234; c=relaxed/simple;
	bh=H0wvEMusid9NfjMR9UoGpO0J6QmNST1faBlU+zgyt+U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O/uPH/Bo12MZtPchLVRGeJc9Jkh5a4PRXNVNFLCwDXA6UsaBzX8ZC/yA8FRaBOz7blM0rX4vmgd8wyLs7Q5iWMb3OWtTCpo4vXpTv77zbHt21i07ovQDmNpefOglKnYbUa4MD/VsgfKhdiG0LoiiIH8PNqEwYKXkpKv1jzMs2HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YZHnOMU3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YZHnOMU3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772036230; x=1803572230;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=H0wvEMusid9NfjMR9UoGpO0J6QmNST1faBlU+zgyt+U=;
  b=YZHnOMU3Kq0oMOVpuFwGsye9ygGOffw170kzaaOd3fYdA3QBvGMVltPu
   5QNdjxHK97oFiqbbYlMOxXRky35pxQrW/A64qHrPZexsGSXdD6NQmJXsC
   LvXhgpbBrE/82IgmxH8ObXFlvOO9xN5pclBfvb0vLw/SucFxfhYxTFkuH
   8S2J+SeO4n+/3s7TSsVPa47dQjPH+Lq2/6rDoI2gANO68L59AnYjlctPd
   IEDKewFIXSiHgupQgt3ZvHMREDWxK5ug3CAh9qdH9cAvm0meMO+e0Zm3T
   U8WR90av6bR0o1Ryy/+rw8KwMiXI9s17MOLVTKahX6ECP+Pn+AgRxXMxB
   Q==;
X-CSE-ConnectionGUID: 6bVPEfFHS1S2u+hCJbx7cg==
X-CSE-MsgGUID: 125t4NqYSqe8REUjOM3kzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72783308"
X-IronPort-AV: E=Sophos;i="6.21,310,1763452800"; 
   d="scan'208";a="72783308"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 08:17:03 -0800
X-CSE-ConnectionGUID: rAgEjlyJQ6SdofrHqo8MGg==
X-CSE-MsgGUID: gwKiOhCBQkmQLdB1ROCV4w==
X-ExtLoop1: 1
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa003.fm.intel.com with ESMTP; 25 Feb 2026 08:17:02 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id B597898; Wed, 25 Feb 2026 17:17:00 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 0/5] regcache: Avoid accessing non-initialised cache
Date: Wed, 25 Feb 2026 17:15:54 +0100
Message-ID: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
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

Changelog v2:
- rebased on top of the latest regmap changes (Mark)
- added two more little cleanups (patches 4 & 5)

Andy Shevchenko (5):
  regcache: Remove duplicate check in regcache_hw_init()
  regcache: Split regcache_count_cacheable_registers() helper
  regcache: Move HW readback after cache initialisation
  regcache: Define iterator inside for-loop and align their types
  regcache: Amend printf() specifiers when printing registers

 drivers/base/regmap/internal.h |  2 +-
 drivers/base/regmap/regcache.c | 57 ++++++++++++++++++----------------
 2 files changed, 32 insertions(+), 27 deletions(-)

-- 
2.50.1

