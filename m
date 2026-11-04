Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823865;
	b=21mBzEN+X5mTKAtcEZUMQ3oV7cVwk+iCJf6CBRN3AmTCOhKsgCA25ohSkNA14ja7J3Zp
	 QpEJ5xu5TtU5Cm3Fp6eJQTMPmtSaFeGvEWmoF9maziXJCyY6Ats0vF66BDKLGKHJomeQx
	 y9jZ1BlxYMWxT+BEehBnYff96JSuE4nCkfi6l9ogRLfjXuChI0ENuPHBe5bR3bS2cdXEh
	 qKp6vQW/9XkjUkNm/6l5gGgMUJs8OiF2XzNVfVPBv9UhG5tvp0Y7xC21nlJDqlDDiJqJ7
	 75oUgibgxNVU0o1kw3LEc2wpHkoURZb0Wk6+1/v0oUplivELYkRAZ7VB7AuOKXKPwwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823865;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=4MgHEzrLAbBkM61NemPdkRvlUGQL1y0M7TR9LGDl3pk=;
	b=chtV5W/AIpAeIDFKc3TSA6SDMFA2EOzwTwQvXLwwcXUI05fvs2PlpYKn+hpTouM7wIxw
	 148Lu7FmsuGk9OqW3O1JILs21lq3cOqdLIlhXMn2BIt+k4KSfwIpUFYnpJHmSmk6JUyuH
	 JwZcoX6SWhs4WjE9BXLfDTtLj49B1aqASGtH8cvMGrGIBonAjd4QRXy6OlrJF/Ds2zcVR
	 6vjM1RBvIlONc9aeGyuXS5hYzeCvHa4zxGeyBgeX0mNSVfEpqTknZWDp4Orx+yuScymxU
	 Uy/ve+/w/EOhlOq37eBFD9wzAqvF3KCsjNd1BO1mhDV5t0MnSz/isF3EJNuGVoxtSSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TwWmQ5SU;
	arc=none smtp.remote-ip=192.198.163.14
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55B22607031A
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 20:24:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55B22607031A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TwWmQ5SU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793823864; x=1825359864;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LWgter10bERtXpWLYXd1wiapGKiS6iehhQeOe+UG9sQ=;
  b=TwWmQ5SUZPOZyQacXrD6r/jwXSwBYw2TV8KjfggWdQcru6gWLvbTgw1d
   CN6Stu60TkgAvK1i6pBFsHSYYFSY7C49eyQL8xwT7GkDTJU3NP9cTp4fI
   UEQ6uAqC6I0nnM+LINcKYQmEZa+FRmo25OtX8jJWyeFHwwWrmoTsDvuUD
   5zHI2ij1wOOCPamhjgAXhveOJDPWGR/OCYFNkeehuuMQ2401q2jfJ7Ghb
   rcq1j7MukeMGBLSOfNDBM36C/6Dn1tJnSvxhVeC/RV5iWTjS4KZnSsoM1
   tWKGV74h09UJKw1kTviiADTM/nW7hxBhnK8QdZ0pZOXAd8/wSgGkevmXT
   w==;
X-CSE-ConnectionGUID: x7YXmM8vSdum+qUpJj2JzA==
X-CSE-MsgGUID: M63GlQ/LRqircxa4IX1jiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11956"; a="2624196"
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="2624196"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:24:24 -0800
X-CSE-ConnectionGUID: znWOc9rLTPCh0n2A7dCh7g==
X-CSE-MsgGUID: P2zyPZiZRP+s11PTDcfMZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,195,1787036400"; 
   d="scan'208";a="6830955"
Received: from dut4425arlh.fm.intel.com ([10.1.80.189])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2026 12:24:24 -0800
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
Subject: [PATCH] driver core: platform: tests: add a shared software node test case
Date: Wed,  4 Nov 2026 20:24:16 +0000
Message-ID: <20261104202419.30180-2-stuart.summers@intel.com>
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

Signed-off-by: Stuart Summers <stuart.summers@intel.com>
Assisted-by: LLM

[1]: https://patchwork.freedesktop.org/series/175858/
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

