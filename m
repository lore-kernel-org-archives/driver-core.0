Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041027;
	b=CxWpz8Wq7AZE/uad2K0/x7MgPXDTQl+9TF7eTkfniAeF+3FHc8whja75RzjAD2+v7d9u
	 Cd9gdwc9ZCSC1GKOdjzmmnc/mhYGG29OT8uAknSh9p7LQVEI5PJi4t3IH6S2jAnFKt0pQ
	 sYyDjn51xPA/0cj3pBhlgnyi/rigznNJmKPgDzIYyz4VRtBqBeCc0xLPovyLm/qMR6X1o
	 U9Gu76jS/iF3EftSjtAs+4JlopRJfU7S5ia8ZncQkGOFOOFZdntxVEVZGUfk5fVng7Rhj
	 aV9n021kP87b+UukaVAksXMXNisMHWlKXA2EFE0HylvmY2ZUAwM/+EJOyyPPN1k1MDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041027;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=QLyyB3TY8HIBfI0UehSTXegv4s6HQrd5kKMzx3nu9Aw=;
	b=gML3zRNa/Uh/4MCIFHhhoB9vbRPBmvEghig12Adymb0svA6oFc/lH66HQeXUet9TS2LE
	 osUiu8H2FIHZg8JW/MYGiYYa0EDu7M9g9qBK5Y08jwrNQ35H9lgkkArghM/W6iDgB+gEc
	 pCMIXrS5KKaEQAAct/+xxI1sY5Q+11Dm/NwLsPMoz1QP21/OBYmz1stVjAkL77YxXI0K+
	 iDT1pCAp2gr/wn7+pYQ9hFOs0xGVzgpYFHRp043ee9PEAfievrpkbc4oN7s5m5MjtT95x
	 r/HnLq1aTHDQrbCw4p0KlYdzghdfbUIWrfJL4YSlGFrLjaovBClGwoD1ZWnZ/XPdIYw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D2cShabd;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9C7606A333
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 22:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE9C7606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=D2cShabd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795041027; x=1826577027;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=4zGIZsdmuPzvRgSJ4qawFG5d4oixYPrNtASyWnLjLpc=;
  b=D2cShabdWapoR4hi3ThMjAydwTC7p4NT59CLR8aJBeCazd0cvEEMeib9
   SWfE4QNpqjcQRX6NU8ns/87sL/Ych6ZamgjK8XRRBnuvu+l03Y5IAYSKn
   DQz5J6yhTSmRIPwSCO1Q51bz3/FtmFRQCKCDppHjW1eGNgxF2Nfv5hlfJ
   XOBn3IS0yhoPJJRkFTUEaLxshXR1LCKP2iL3xtMT7sDROAO23HAx63bsI
   pk/e/iMHWfAasA+AVvMjeH0NmmRhNhf+eg4EH4ByiW+bsigzgt6hx3Elp
   Dl5RCcvEMTxWzmcXvocprLS6XtWog3v2H95LKps9LsXGCLfWNfwDhv32a
   Q==;
X-CSE-ConnectionGUID: E1BAANObSeu6Tr8XsFnnYQ==
X-CSE-MsgGUID: kiYQYLulS5uJP59wvLj79g==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3758835"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3758835"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:30:26 -0800
X-CSE-ConnectionGUID: b8LnhNXSTvaKsoDPcsocAA==
X-CSE-MsgGUID: 6fQ3npixTQWzEj2o4eUH4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10655814"
Received: from dut4463arlhx.fm.intel.com ([10.105.10.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:30:26 -0800
From: Stuart Summers <stuart.summers@intel.com>
To: 
Cc: driver-core@lists.linux.dev,
	bartosz.golaszewski@oss.qualcomm.com,
	balasubramani.vivekanandan@intel.com,
	intel-xe@lists.freedesktop.org,
	heikki.krogerus@linux.intel.com,
	dakr@kernel.org,
	andriy.shevchenko@linux.intel.com,
	Stuart Summers <stuart.summers@intel.com>
Subject: [PATCH 0/1]  Add a shared software node test case to driver core
Date: Wed, 18 Nov 2026 22:30:22 +0000
Message-ID: <20261118223023.19653-3-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
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

Original patch was posted here:
https://patchwork.freedesktop.org/series/177785/

This is just a resubmit with a fixed up commit message and this
cover letter.

After dropping that assisted-by tag, just a quick note that I did
use claude opus in the development here.

Stuart Summers (1):
  driver core: platform: tests: add a shared software node test case

 drivers/base/test/platform-device-test.c | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

-- 
2.43.0

