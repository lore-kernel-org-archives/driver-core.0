Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794303508;
	b=ihbxjqQ49GBqOPb3R31FHfdgOZ7q8pL9JXsk31L5gPcqneEOyiS/HWgRq9jRefumziCo
	 oALYn9aDWuKu65Gr4toK9sEUZ1axMki7RNTCmn9d9EumTet1SoParxjhDh4gWvjC6Ew3p
	 R+p11rCois5F+qisd8Izh0GHYmk5qZhHSRYAyBhhhsKpz2W62ZaJt9NUVChBzrmK9Pp4V
	 FQBpCowl35PssBGdgPMbg3dad7zkkVwCnTJsBbIWoW1tZMp9NE5Dk8H0QcyHoNz74xB2U
	 6PqULeMUoARdV8PnKpG5JGivf7VXvpbetZnxnVd7RDgX0KhRT/73EQE2FQcNDQt5W2Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794303508;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=FNBnF5z+qlyzuaTI4Z6q/k6karpzVQwZhjUK109S5fE=;
	b=EW/YAtqHGc14Y90JthcsFX/0JSjJwZaozLGIpGtdZfuKQWIiOeOLOjrsbwLthLeyhbWn
	 pIifUcjE2qf4OLJa4F5MnfyL3yVSpli9vxkLbE/DmnAFAKYhNzx2iPMEQ88b2DkluXgWM
	 pTN0GstE1ai80X7uC3lzztdwqQVaXwozFGcTPqqEsQ37YSNdv3TZJBw7QsfDCWOHHEaNx
	 xdtHJmaskQWke6y2rUcSD530R8BAmD/cmtbuY38F13gEYjW8HsMRwnUZ0703NITsfRj44
	 0qdf/PXkHNBlQhTq5W5/hQ6LRkznYN2cPe+DYN8iLJgpXjGttFqa/f2Cw05xwK7Fqqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AYP6DdI2;
	arc=none smtp.remote-ip=192.198.163.11
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCD8606A99B
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 09:38:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5FCD8606A99B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=AYP6DdI2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794303507; x=1825839507;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kEqIwbcCOfNd4+PN9qLSem2g9APgdKjSTtiBZRVhHWI=;
  b=AYP6DdI2hWi67pLb+CTs3rrrYFSPMUJB89s4TMYwYZVu/mzViPC2ZYRO
   LmTjLXzXcUrCdo7lFIIgkjTKzmwIjymgF0/l4j9zCu6XsQhlgcw0pz6C5
   WA2sH1UKHbfxfG+6l779eM25rAWvxSWku4OxpwCeEl/EGOQbhATObg0xi
   xQfyaVjeTz4EHOIRqb8tehf85Dd++kusyqIeZLDD2GX0EiApVI3A/bO4g
   /19cP8082LRJEEvQ8q3Wnt+TAYCJv4wTzRX3R6jP8uJwrQMZGkF0eGbme
   6ItA7ksUAB9o3mHCQ8RQgBXM4eaDKTG1ALVbH9vMphheM6+JVncwmc+Tv
   w==;
X-CSE-ConnectionGUID: CzI28pXGTIiBiJQMkke6qQ==
X-CSE-MsgGUID: 618cAHCuTCef9OKkMy1y6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="2961821"
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="2961821"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2026 01:38:25 -0800
X-CSE-ConnectionGUID: UhEAkUoeQu27HIEPNxSG3w==
X-CSE-MsgGUID: a7LUaSiyQwWMylEpQvpA4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,205,1787036400"; 
   d="scan'208";a="7975225"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa004.jf.intel.com with ESMTP; 10 Nov 2026 01:38:24 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 20CA49B; Tue, 10 Nov 2026 10:38:22 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Mark Brown <broonie@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1 1/4] regmap: Switch to use kmemdup_array()
Date: Tue, 10 Nov 2026 10:36:59 +0100
Message-ID: <20261110093820.454682-2-andriy.shevchenko@linux.intel.com>
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

Let the kmemdup_array() take care about multiplication and possible
overflows.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/regmap/regmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index bc4e53ce8ecc..e327850ecc97 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -2595,9 +2595,9 @@ static int _regmap_multi_reg_write(struct regmap *map,
 		 */
 		range = _regmap_range_lookup(map, reg);
 		if (range || regs[i].delay_us) {
-			size_t len = sizeof(struct reg_sequence)*num_regs;
-			struct reg_sequence *base = kmemdup(regs, len,
-							   GFP_KERNEL);
+			struct reg_sequence *base;
+
+			base = kmemdup_array(regs, num_regs, sizeof(*regs), GFP_KERNEL);
 			if (!base)
 				return -ENOMEM;
 			ret = _regmap_range_multi_paged_reg_write(map, base,
-- 
2.50.1

