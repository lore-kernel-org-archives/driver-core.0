Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462B248C8D2
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 13:09:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782997769; cv=none; b=oe3kGrZ0A30iN84wk2PukBN8M+G8nTeSDhe0WZsdQyIUXQUvsQgnh9VHciqIDGyO3ETCZc1wxkiwB8ljqp20V5C6pIubLATUEAkwy+ZHd+4qatXpw/7F6X6rHchBc8WBQ3+jWfHjojvbzrPq5FNO/2zuF/QEvWNDmrjDUPMxvjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782997769; c=relaxed/simple;
	bh=sayFem59xsLU5QvtjYKmfb+cFOYGKZInO3e2nOb4Dms=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pzSZca1VhN434yK+m0/yyzDTE04PKct7s+zkwDRFeRXdp9d0pnQEV1CDkkjfepG/9XsEYWf6jNQVe/0U2bgtLPwxlJEe/tz2m8rQ4yHY5iWdLJoJsVwBPu8S2tNViZKmEBVqyvWVM1zauMt2YD77+CYuIR5ObTK1xq9fTModuco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BI4fcHk3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BI4fcHk3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782997767; x=1814533767;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sayFem59xsLU5QvtjYKmfb+cFOYGKZInO3e2nOb4Dms=;
  b=BI4fcHk32cYL/P5pwISU6y/dkarwHTtEQYYBROrWOt2y5/GlFJAUX3t7
   KTyi9dghJdZ3I/PBiAdxK0tP+/D2O+Qil9yKREtUc8uDg4FJhuX7ZUWHB
   2yqNPeKBZ0fd4+xCdHDymNdL+k23ebVKNakeBnJcHBI8rg/ZBSJkOXNM5
   szQ7SjzF95L1nDGHsazHCN9PhSCdvAj2ELCuFQ4XQ+EfNVYj/jdXZa0wm
   rzMIst7tmjt94GtVbRwFYeBC91L8xUbuSaYUfNrY6lzwF+8Coc06VsuZ6
   nXyO6bYgAkGHZdxSDRiKK59wIxrEdZMiWt3vKjIUAA+IX2NJb+wdzWD9M
   w==;
X-CSE-ConnectionGUID: 62VdRRTERneYEr8yo05PqA==
X-CSE-MsgGUID: ZqNb7SqkSOma+qKvBKiD2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11835"; a="95256367"
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="95256367"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 06:09:26 -0700
X-CSE-ConnectionGUID: Rmz0jVmKQQ+YszcaIfFqxw==
X-CSE-MsgGUID: akJwM1c5SZaTRIfukKetVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,143,1779174000"; 
   d="scan'208";a="251140488"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa006.jf.intel.com with ESMTP; 02 Jul 2026 06:09:22 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 77BA295; Thu, 02 Jul 2026 15:09:21 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-gpio@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Michael Walle <mwalle@kernel.org>,
	Yu-Chun Lin <eleanor.lin@realtek.com>,
	William Breathitt Gray <wbg@kernel.org>
Subject: [PATCH v1 0/4] gpio: regmap: Keep tracking IRQ requests and releases
Date: Thu,  2 Jul 2026 14:42:53 +0200
Message-ID: <20260702130903.1790633-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

During the review of the v3 [1] of the series that adds a driver for
Realtek DHC RTD1625 SoC GPIO the gap in the GPIO regmap implementation
has been discovered, id est the IRQ chip that is created by regmap IRQ
doesn't have IRQ request and release callbacks and hence in terms of
GPIO does not track if any line is locked as IRQ. This might lead to
undesired and most likely faulty behaviour. This series is to fill that
gap. Currently it only fixes the only user of the automatic IRQ chip
creation facility provided by GPIO regmap, but also provides the exported
callbacks for others to be possible to call them from customised versions
of the callbacks in the respective drivers.

Most of the affected drivers if I am not mistaken are the Industrial PC104
ones, hence I Cc'ed William to look at this and perhaps even test.

Yu-Chun, can you give a try with your v3 based on this series? I believe
we can use regmap approach after all.

The merge strategy is to go via GPIO tree with the immutable branch or tag
provided for the first patch that can be done by regmap tree for others to
consume. Of course, there are possible options, I'm all ears if you think it
will be better in any other way.

Link: https://lore.kernel.org/all/20260512033317.1602537-1-eleanor.lin@realtek.com/ [1]

Andy Shevchenko (4):
  regmap-irq: Provide IRQ resource request and release callbacks
  gpio: regmap: Provide default IRQ resource request and release
    callbacks
  gpio: regmap: Apply default resource callbacks for regmap IRQ chip
  gpio: regmap: Order kernel-doc descriptions with the actual appearance

 drivers/base/regmap/regmap-irq.c | 22 ++++++++++++++++++++++
 drivers/gpio/gpio-max7360.c      |  7 ++++---
 drivers/gpio/gpio-regmap.c       | 25 +++++++++++++++++++++++++
 include/linux/gpio/regmap.h      | 21 ++++++++++++---------
 include/linux/regmap.h           |  2 ++
 5 files changed, 65 insertions(+), 12 deletions(-)

-- 
2.50.1

