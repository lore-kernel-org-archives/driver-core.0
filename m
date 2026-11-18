Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041026;
	b=rP8x0lwH21j+xA3mbrVGv4aho/YQgoXiMx4r0NvIKXqjuXuv99b18poe8jS3TBnTwlUT
	 luZbmddTtjjlDTQ2t0maZhPUHVo6fY/tjfjLvLD4x29bOAZ+kslGG5pCym4KLMr0uQwaw
	 s+Yr1ZACf4XBwRfJQuSBJQ2OeTD9Q1Kc0mh9XUQYPo4wCPlrG6J6+0R1nU2/3aINRLEmP
	 FhDuo3uvmTOdt5CbhdnbC1ss3qqvg3uiFfY92b0qEqcDeKNOIUBuqzP6i3S6OEsmN8Pkl
	 Q9kGSX47FeB1SDroiOPcNCG4//LGvnciWIka6WC8ngaxnCf9fu4SNOKqEqrvJHWsAnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041026;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Taitlzs1vwZknjkwI4biHZqtmDllD06WAM7OflAbEpY=;
	b=DjEyy7BLUpVsD7YRi2txvp4kBX0VczZ7V9lEkEFgS3C01qgwMIO1V12OgVNIVx2fKUjC
	 fltNIU7HsJ1dUvHkqH7ybOsM1ZzMj+awYhG0Zea4GUkc+UK7fiJzGWEJW0jR3r/vdBSI5
	 Jq6FDSlZhKZidChUrMoQCal1ON1ShN2hgH1UZMD1JF4AcK8rFBMa/EsAQxOQDqSao6i1s
	 2LwEvSXNrhKyo/PMXp3dkGdQVXM0f4Hww9ntRf/OmHUJd2hSUFCPq8zLql1jj/LPlMAgI
	 WFMMt0eBW/Txbnjys5VzilC6w28nF7pRJSpZ1Hq0vIBp6g7x21M1PPXV5g8DD5vGcDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SsOBDOsM;
	arc=none smtp.remote-ip=192.198.163.9
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5505A606A332
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 22:30:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5505A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=SsOBDOsM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795041027; x=1826577027;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hOjUPErAuOxme0x2HPcayzvowb9pxVf6bh1gsWTWfI0=;
  b=SsOBDOsMye2g8QTJ5fJIpGt758NB256j+zGg9UgTCr69HgPMzwsN7CgH
   ziEASAzGvPFHukT6XlhKpPuGDvPV/eHF96f6p8kBSc8TXDo+FL2ciFeOn
   iVS5hWfMtOeECUIf/03DfehZneDMr8fXxRE1LTS+88I6mPvLJaVuSSNu0
   I9uIfY3Lew2PF1QvoHL13DJGOGiFY4v/SFhf1JD5i64TidWQfKOXyo5V6
   bltWAYRSwZsIvHlczjQdLJGxiLvZG4wzrgW5BeQOZaEiQ0yd6BOJkYK53
   4jYoV9kCh+4YGmFhDozG7ebyimDm2HYECA9CWs8I+AU5SgLWgZ90rdE39
   A==;
X-CSE-ConnectionGUID: gr3WQ9qBQMKJ/nYe1kbMyw==
X-CSE-MsgGUID: BwLh9WVXRLeo31Xt+z/PIw==
X-IronPort-AV: E=McAfee;i="6800,10657,11970"; a="3758839"
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="3758839"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2026 14:30:26 -0800
X-CSE-ConnectionGUID: Ma3dO4YpSYSBan5+LCv4BA==
X-CSE-MsgGUID: hBM+G52kRACUK2aDbW1Jsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,219,1787036400"; 
   d="scan'208";a="10655816"
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
Subject: [PATCH 1/1] driver core: platform: tests: add a shared software node test case
Date: Wed, 18 Nov 2026 22:30:23 +0000
Message-ID: <20261118223023.19653-4-stuart.summers@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261118223023.19653-3-stuart.summers@intel.com>
References: <20261118223023.19653-3-stuart.summers@intel.com>
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

Cover the pattern used by drm/xe + i2c-designware, where a software node
assigned as a platform device's primary firmware node is handed to a
second device via device_set_node(), and make sure removing that second
device leaves the owner's node intact.

A potential fix for this issue in the drm/xe driver is being discussed
in [1].

The signature in this case looks like this:
Oops: general protection fault, probably for non-canonical address
0x6b6b6b6b6b6b6b73
RIP: platform_device_release+0x6f/0x80

Link: https://patchwork.freedesktop.org/series/175858/ [1]
Signed-off-by: Stuart Summers <stuart.summers@intel.com>
---
 drivers/base/test/platform-device-test.c | 57 ++++++++++++++++++++++++
 1 file changed, 57 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 9ce563f76aad..378ba7fab2ac 100644
--- a/drivers/base/test/platform-device-test.c
+++ b/drivers/base/test/platform-device-test.c
@@ -420,9 +420,66 @@ static void platform_device_two_swnodes(struct kunit *test)
 			    "Expected errno == -EINVAL, got: %pe", pdev);
 }
 
+static void platform_device_swnode_sharer_release(struct device *dev)
+{
+}
+
+/*
+ * A software node assigned as a platform device's primary firmware node may be
+ * shared with other devices: i2c-designware passes dev_fwnode() of its platform
+ * device down to the i2c adapter device it creates. Check that removing the
+ * sharing device leaves the owner's software node intact.
+ */
+static void platform_device_swnode_shared(struct kunit *test)
+{
+	static const struct property_entry properties[] = {
+		PROPERTY_ENTRY_STRING("compatible", "test,shared-swnode"),
+		{ }
+	};
+	struct fwnode_handle *fwnode;
+	struct platform_device *pdev;
+	struct device *shared;
+	int ret;
+
+	pdev = platform_device_alloc(DEVICE_NAME, PLATFORM_DEVID_NONE);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	fwnode = fwnode_create_software_node(properties, NULL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+	platform_device_set_fwnode(pdev, fwnode);
+
+	ret = platform_device_add(pdev);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	/*
+	 * A second, non-platform device referencing the same fwnode, like the
+	 * i2c adapter device created by i2c-designware.
+	 */
+	shared = kunit_kzalloc(test, sizeof(*shared), GFP_KERNEL);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, shared);
+
+	device_initialize(shared);
+	shared->release = platform_device_swnode_sharer_release;
+	ret = dev_set_name(shared, "test-swnode-sharer");
+	KUNIT_ASSERT_EQ(test, ret, 0);
+	device_set_node(shared, dev_fwnode(&pdev->dev));
+
+	ret = device_add(shared);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	device_unregister(shared);
+
+	/* The owner must still have its software node. */
+	KUNIT_EXPECT_PTR_EQ(test, dev_fwnode(&pdev->dev), fwnode);
+
+	platform_device_unregister(pdev);
+	fwnode_remove_software_node(fwnode);
+}
+
 static struct kunit_case platform_device_swnode_tests[] = {
 	KUNIT_CASE(platform_device_swnode_add_twice),
 	KUNIT_CASE(platform_device_swnode_as_primary),
+	KUNIT_CASE(platform_device_swnode_shared),
 	KUNIT_CASE(platform_device_two_swnodes),
 	{}
 };
-- 
2.43.0

