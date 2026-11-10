Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303507;
	b=yhdkGBg1Gj/mzcJRRXT4HyBX8N8khhlI891e055z31QxZsFbwHK5CxMKGHLv3pLIBOoc
	 GTV9T3upQaL6h1Ir6abM9FXZ5pNI/ach+FjZBG8HVZ+AgVB+ytM6Cw9WFBcYyo1izedt/
	 Zitj+uQ2gE1JsNjFZLWwM4cMdyRBsTDNx5FX1yjDAX6cDXsyK7yJOJ2gaQyc9SePVVWAw
	 GylKeeTv3KcwflSK6a/oe04dWjYoLy6gH+QxB2lwvgTinJjiIEISyrApiaeIK+mCFKNho
	 4HlV8U4edrqkLmhmNvJsfRONXx+iZF0s+k58SktN0VJL+JNylv6axCP97ItFcgmdDPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303507;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=06Ulj6NkCviQUwZyv/2qREw+wPFZbw4i2H/2PgdA2hQ=;
	b=R1tOIL4ReeIF39gCWAvNlNy/iQ2p/KsdpHnwFdKp0kTPMxa6WTbyEyLDhmYgjmRRVkuO
	 WwSJXVgvVBuR//ZeUAAxh9NlIZSXSdnuzLUAm5PXsXKrz3n71uxmri5mK7MPWVeYgigYM
	 B7yNp22Ww1wfRLgXZ6+G5TQXeh3JyyLsBAX4z3Tpx56WsKGXevxHWM2amEHNMOvzo85+w
	 YZUerG5sqlpX651/sEYDCe0nfzjOIADNS1uA0pEHJ//GKMr2v1hTMsHahJOVnQmDPck/V
	 HdR3x58nvWNDTjoFse4Qmj54RHdnALrULVFta5oWQZOe7v+Wv9L4o1dVE24XCvANULA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lzfnmqON;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CFC2606A995
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 09:38:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2CFC2606A995
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lzfnmqON
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794303507; x=1825839507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=vSIburH/eRmSgUJQS3jc+S7IkjN724pv+ZMk2byW2r8=;
  b=lzfnmqONjvhODYaGI8pLc5ydKSf9B51+EFobn/ks6LSOnvz48nVMFhmU
   TwovXfgcEUBfL8dNGUakMxy+JOI/nvrNibqylKgYMTlh4jiGS7z0W4a4w
   kI8awP0MCwS+JpgUnnTMS+zL3L1yKdxEiFpkZRMKrM+X5aMqvJwShuUxe
   f6VeD/aTcJMlWcgq9wZnahKeChqNrhcvomj0Y+Vea+zqpcVapxXroOyeq
   mhWz7ekdGirUSXMlZdtBVPPNIeyL5dqx68/Qkf2vY3/UvZHkrgjGuhPDK
   J+Gk70V7DUw0ER3/zPDGxZsWWpMEHzBjmfDNlqMmYN3sy1xJ9sigHDiod
   A==;
X-CSE-ConnectionGUID: 5YYwQKp3R6m5GrSqou0m8A==
X-CSE-MsgGUID: FYTNROtEQRCzdGWfWPukGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2961816"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2961816"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:38:25 -0800
X-CSE-ConnectionGUID: iS0YaAfdS72TurVb28PtgQ==
X-CSE-MsgGUID: JvO0gIIcSnK+bxTVmfT0IA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7975224"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 01:38:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 2E494A1; Tue, 10 Nov 2026 10:38:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 4/4] regmap: Drop duplicate ret assignment
Date: Tue, 10 Nov 2026 10:37:02 +0100
Message-ID: <20261110093820.454682-5-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
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

In a one case the ret is assigned at the top of a certain function and
gets reassigned in all cases after that, making the initial assignment
useless. Drop that assignment.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 1855b5fc76da..b729226e9e3d 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1608,8 +1608,8 @@ static int _regmap_raw_write_impl(struct regmap *map, unsigned int reg,
 	unsigned long flags;
 	void *work_val;
 	void *buf;
-	int ret = -ENOTSUPP;
 	size_t len;
+	int ret;
 	int i;
 
 	/* Check for unwritable or noinc registers in range
-- 
2.50.1

