Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5906341079
	for <driver-core@lists.linux.dev>; Tue, 27 Jan 2026 10:33:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769510013; cv=none; b=ObuJBl9h06hk3MuMb6nWlFSyo21MAOlxQJhv24s2jCHabFOuKvZI0Vj2tuc2rd3a9LE1e8z7zErDLyzUSUllRR+hRdnyGiHNkMmPXpexY80xPli1GPjctmBPMpfpdQ490AFUvY2yJTXp3oFTugzL1HAbNeyuCRjauRvnblplixo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769510013; c=relaxed/simple;
	bh=DJ3JhWzFl94LG8FkPcczPSqAf4HPV5lfZRDEWuIpHuQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VxQdqv7+7b2fYGFTyRcS4u5YjkQcYTMUJlUlQwovU+dkIEylk1HVVT+S7FB+Yga+GQhsnNS4Z6SBZhHboJDoXX3Es8A5lq17LeEjUz+z5SVQzV2pgF7nnIZVUnLX7GPW6vP7ZQuBPzWM43D9dLLwTPQQ2yfOfzb5NsRWON0dorw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a46kph/8; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a46kph/8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769510011; x=1801046011;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DJ3JhWzFl94LG8FkPcczPSqAf4HPV5lfZRDEWuIpHuQ=;
  b=a46kph/8e2MfosGq0Yz6zRX0d0xZ3Xb2YTWLQ7iu5RNlYiQ2wQ3XRBV3
   fcljquod/WJ35Qi+yul6WmPPmjTAinh6bVIrceFP51wTWRZnIs48g+LX+
   k73WQhKAfhZPIVZpruWjH6ThmM6AN3nRcFMj8zp+B8o2DnD4xcXDAzmOX
   3FWAXaRvpB2v6HqnzW+oEPyCAYHvRPWebISukVlwOKefYXYozqnnSOY9a
   JOQJ5A6dRjwrXh7oc7dXJUStBW5p8tY7WcAtdz6Lubxm1oEzS8hbz+62F
   ITuyoJM4o50d06XTpYAdL4/70Q7G6Zy3AaCYIt0Oksh0H/pT1cIuoqFOa
   g==;
X-CSE-ConnectionGUID: 8TojoqZ6RC6+U36yDnStrg==
X-CSE-MsgGUID: d3q+oZxxTXG0OlIhh0dkcQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11683"; a="93359996"
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="93359996"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2026 02:33:31 -0800
X-CSE-ConnectionGUID: JWpa0YtmRCSuu7zurTx2DQ==
X-CSE-MsgGUID: KFTIp+3EQS+uZATTyiKw8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,256,1763452800"; 
   d="scan'208";a="208184407"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa008.fm.intel.com with ESMTP; 27 Jan 2026 02:33:27 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 90E8A98; Tue, 27 Jan 2026 11:33:26 +0100 (CET)
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
Subject: [PATCH v1 0/3] pinctrl: core: managed resource handling cleanup
Date: Tue, 27 Jan 2026 11:32:05 +0100
Message-ID: <20260127103325.3925173-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

I have stumbled over low-level APIs used for managed API implementations.
Here is a clean up along with a drop of some duplicate messages.

Andy Shevchenko (3):
  pinctrl: core: Remove unused devm_pinctrl_unregister()
  pinctrl: core: Simplify devm_pinctrl_*()
  pinctrl: core: Remove duplicate error messages

 .../driver-api/driver-model/devres.rst        |  1 -
 drivers/pinctrl/core.c                        | 93 +++++--------------
 include/linux/pinctrl/pinctrl.h               |  3 -
 3 files changed, 21 insertions(+), 76 deletions(-)

-- 
2.50.1

