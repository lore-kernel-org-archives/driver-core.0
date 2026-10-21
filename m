Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792616086;
	b=o5WzipWLzBTy+m2c5z4+q3ANAG884gkJIQasfzAhLJQGp2UcIwjz0QB/b6XaMbjvUavh
	 2FFzaLqmKn/2atYmmKVTGCFYMMNAx+J6jPgxPhmWyfnxSX4IpSttk1lfnhZE+hsj6YSkJ
	 xI/pIRPeBsZKJiBn5UtmTJTqnQ8d7l2aLa2k4kuwvfwg4yIMTarMcDt3bL1ntJlX97lPN
	 6s7SfEVyOgG+nKSx8RxUtIN49w09184PU6n/e71lSyG+daEfZ010G9cmX3CfkVwm1qezl
	 QSE9691QhZekLQgsxTnTwHpSKPrLd4CIlaFvmJpJ1B2QgmTItqesMO9KZsklv0SBgLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792616086;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Nyxxw8DG13rMyX2N86ekq3tZi/snenQJIvWLK/Fd68Y=;
	b=fnFH1hdlkLCd4GkuhWuQvjwzYHDpo/wnMa0UbXhkdcgFT9yLcyUZ83YP0i10olFvTm5r
	 h9E0YarxEVKUrJz1Z2afh2fPhF2lUjQ8ZZ6CuN4MG62EhQtE2BRdUcXisuJMt4ZtoZ5jm
	 IXau+zg2aDSjKIoc0EzL7I5n25F5n/SNFKHIRt6AeK9kxuLhTXNiJJU+SrKJGcu5a4sRU
	 MrBR4Iby1O/kv5s53Vj1nHhRMYdAWdJNLaYkitnZI36PBWjz/IcGSj+zIRSSlK6CxZ8dc
	 jaKiFAo37Iq+wOYMRPHX4tCvExpNJgWbhkm3j8RTAD6wJzVX2yVWp5DZW2KR9FkEESw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZAvTNvVL;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B21606A31B
	for <driver-core@lists.linux.dev>; Wed, 21 Oct 2026 20:54:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 35B21606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZAvTNvVL
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792616085; x=1824152085;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Nys0NFF+SKnsf1loxXJC2D3JKXXqFWVDDp0Z70gpJU8=;
  b=ZAvTNvVLsLR9XVNZM/QSCLrCNAAXwKxZtwx/K0ON7mSsSm4qDQwgltny
   e+Wq4dJI5VOfITjGhfu/uhxKPr6md/Xi6J8EhtTO7H4j2clvC2iWUMHMW
   8xglPFxvdVs6W5o4HE78EL2lp0SCU/ZVnh+Y/7XKhfOfM39JstJfgdjLt
   m1SXhtD+gsgp2Veh3J6X81yPiRoqHZjGy0GtHvrxKQzJiEMYYES7MBww6
   DDeImN0V/nUENYn9r97hiU75K/r0IGAQf5bEjtFpaI8Q4m3bC+/X44IJs
   ZfuARJlMMfWH0yZUe8CBTBfOXrHeksOapD1LZ1Tzh3G0SdTWn+io+wvGq
   A==;
X-CSE-ConnectionGUID: KMJo+V1MTbWBikfbnd7FEQ==
X-CSE-MsgGUID: VgzG0kPzTuKGstA7hZv6Kg==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1374372"
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="1374372"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2026 13:54:45 -0700
X-CSE-ConnectionGUID: Xmdrkm1cSpqwtJYqt+V3UQ==
X-CSE-MsgGUID: Cnc7wkRLRXWlsuVWsB93/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,170,1787036400"; 
   d="scan'208";a="3525321"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa007.fm.intel.com with ESMTP; 21 Oct 2026 13:54:44 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 343AF99; Wed, 21 Oct 2026 22:54:42 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>
Subject: [PATCH v1 1/1] regmap: irq: Get rid of duplicate check in regmap_del_irq_chip()
Date: Wed, 21 Oct 2026 22:50:35 +0200
Message-ID: <20261021205036.1013622-1-andriy.shevchenko@linux.intel.com>
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

irq_dispose_mapping() already 0-aware, so there is no need to
perform the same test outside of the call. Get rid of duplicate
check in regmap_del_irq_chip().

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap-irq.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/base/regmap/regmap-irq.c b/drivers/base/regmap/regmap-irq.c
index 715eb9e7aa2a..bd7c89618dd7 100644
--- a/drivers/base/regmap/regmap-irq.c
+++ b/drivers/base/regmap/regmap-irq.c
@@ -1021,7 +1021,6 @@ EXPORT_SYMBOL_GPL(regmap_add_irq_chip);
  */
 void regmap_del_irq_chip(int irq, struct regmap_irq_chip_data *d)
 {
-	unsigned int virq;
 	int i, hwirq;
 
 	if (!d)
@@ -1039,9 +1038,7 @@ void regmap_del_irq_chip(int irq, struct regmap_irq_chip_data *d)
 		 * Find the virtual irq of hwirq on chip and if it is
 		 * there then dispose it
 		 */
-		virq = irq_find_mapping(d->domain, hwirq);
-		if (virq)
-			irq_dispose_mapping(virq);
+		irq_dispose_mapping(irq_find_mapping(d->domain, hwirq));
 	}
 
 	irq_domain_remove(d->domain);
-- 
2.50.1

