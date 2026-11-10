Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303507;
	b=SG3+OEqxFCbALW1WV67iMzemtioMY8mr4nafhByhqOsmRu/+eFlyorGHA63FsrkHfTka
	 IafCENbzKhkASa16SjodobZq+apXpxXa3hSEzVMsP8034rvokmU1JBhjMPPBZj3zm7w+1
	 Y9bdJFTNTyTvbs6eI4hrlPqyfVfQIiRI5gtx1hwA6cMEo47eg2LZcnahDK1bvqby/5KCR
	 nQ1tZYffyjFDgRjrAwqorMFysP6/wey/zLQ/WQt1u2qj+6cDNy9JfIWpsLA5U+j6tIVwU
	 yQctunnzhxz6n+QFFYaO/8pii0Tf7MVRW55iiXYZRTnz7jqvJNtlZ0xq4AmV/0pbhPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=soIcd3rUx4/jiC2klzoUd5iGOQj53t5mg7c5bMYOoZM=;
	b=jTTbbDuqnC51lk3aVTtm9OihsbyFu8HNqNOe4Qhxq2RUc4DrVka/aNv72wzJz4pKtDOp
	 Hei3yOj9gX8o2DSStVmj9jqyMg/fY11j2Mx4XVPI8ZN8qp5fCviqOlKQLG58+wdhzrms1
	 hq98SAFVQIrIylxSNecck72e4WdUyzjRPcFZXxCrlVfwhuEqz+QGDkS5tEdtmcvvGgw1D
	 q349uO43fwfSfHhCsM8HSUM41b6m/7Afzb439or2C6jm6nOwi6BEGBXBIZUKd2MCVpqG+
	 SZAMA7I1MX/DOT4E1WzXnZRrNS7ZCcCUYXgkZZZw62hIywY4AiTX9pnbHzltS8Q5oxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GTecZRbi;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7E36606A93A
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 09:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B7E36606A93A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GTecZRbi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794303506; x=1825839506;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fYEHP3H6dl2AlwUfY3uxUWjcJf4gmcOuQGAvPXqF/Qc=;
  b=GTecZRbiC/k1a34SD7z8pa2iCANk+0pW3sxtSuqChxld46ykdgoTHVMM
   MlErrvyrsUAHaRf7lgswIpD6Kop6TamUxtV9hOtmh00/8Dx9JIhgo9nri
   LqvPnctY9MeycXFC46E5mo6e6m/fuSNx7KqM10zP3xk6e+qYr4OmaM1gp
   9PBWRoIDAt+WlQ/r2AGGn5MPMszvk4S8bxwVPJB/mQKml3eJFJYusw1Ci
   lzMSCVu1OIrqxopHQndWOUc8sDk/gL7w6t2wCeCxgOPsLHAWoj5OaCa5Y
   6pZ72MxZg2BRV1LCCBX26uSRtS49PUlJEJojzQTasfIFegjta659h5tcS
   g==;
X-CSE-ConnectionGUID: MlwEgMoASNuIAhzDJrOBwA==
X-CSE-MsgGUID: 3vJzPeHcToWzoPGDVpHoUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2961812"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2961812"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:38:25 -0800
X-CSE-ConnectionGUID: 623ppO9uQQKjqqr/inrOiw==
X-CSE-MsgGUID: 93y9gQlYTXSvS2uYCouirA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7975223"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 01:38:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 1E1E499; Tue, 10 Nov 2026 10:38:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 0/4] regmap: a small set of cleanups
Date: Tue, 10 Nov 2026 10:36:58 +0100
Message-ID: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This is a mini-series of a small set of ad-hoc cleanups.
Read individual patches to get the idea.

Andy Shevchenko (4):
  regmap: Switch to use kmemdup_array()
  regmap: Drop never used devm_regmap_*_free() APIs
  regmap: Defer assignments to the later in some cases
  regmap: Drop duplicate ret assignment

 drivers/base/regmap/regmap.c | 62 +++++++++---------------------------
 include/linux/regmap.h       |  3 --
 2 files changed, 15 insertions(+), 50 deletions(-)

-- 
2.50.1

