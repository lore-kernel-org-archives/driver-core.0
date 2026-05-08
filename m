Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F8F63822A7
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 09:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778233959; cv=none; b=cYPsVU6IiN+eR7n/Ul013Bi8lIYLN5/zth3BU+acdiJhKqcFlJdRXyJI6ovHp0BAqmy8qPTSgEpmq05K/bQZT/ilgJPRksh9SvfWq48C8pE8STXWX/o8MFdlpOmDrZV66jveTD6upepeLYyAmNgF71NlwLqVrPCq3SYtrCdxBXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778233959; c=relaxed/simple;
	bh=kB4pwQk1VP9vEdqFC6FddTbPYUz90fjdey691RjMcVo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gKeUBXieOK+tcbFkWqpV6Pf5yxi2g+GAIedj2tf8FYv/Zf8Z/ePjw7JGEd4qyoZyqWuyGYOxEY9BUjaPFHGsR1dCli4PFhPHZ/BXsW7ylrilt+nIz6mKYDv818ks28TQw/SuoHt4HQEcb5ydCeJ7tYZpZWkdCuGqAj7j6q77Jxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mkol12mo; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mkol12mo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1778233957; x=1809769957;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=kB4pwQk1VP9vEdqFC6FddTbPYUz90fjdey691RjMcVo=;
  b=Mkol12moTavgwUDCk2IqdJNVAZsiCFfh7bz7phFcENAUgUgrE5IqOyyB
   3q5a6Lz/inhKAMUVmgieu94XpNeYUkkbEHF2Ew9tyI7aN8i44TD+/d/MW
   xR6XXZCWhu/lJpiEAW81IcArqafYF7xNAB9IGvUbuM4D498QwU7pkHNik
   5vitN6Mgn9ojbgRxlWuhHD//ti4xYQgmYSgABl3PmWefdZoJUqeZ7bmXu
   OUR4HHhPLiAOQ8PXM65HCCTwrmd3zsOmid8A0EgrO8s9adyZp3bBS3eHr
   hZR/spGyll+xp0tWq6fmyR/2roSg7mW9sirD+/s6Ivmxl1wLurD/HBIoF
   w==;
X-CSE-ConnectionGUID: D37aWCS+T/ytLmwjBJhvog==
X-CSE-MsgGUID: YA6ZuEiPSxy+YSsQttDMYA==
X-IronPort-AV: E=McAfee;i="6800,10657,11779"; a="96623805"
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="96623805"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2026 02:52:33 -0700
X-CSE-ConnectionGUID: HKvUq+K/QgSqr9Zoff1M5w==
X-CSE-MsgGUID: m9UNxfknRIWDF2zWdf0djQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,223,1770624000"; 
   d="scan'208";a="241728647"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa005.jf.intel.com with ESMTP; 08 May 2026 02:52:30 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 4F25199; Fri, 08 May 2026 11:52:28 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Mark Brown <broonie@kernel.org>,
	driver-core@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-spi@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>
Subject: [PATCH v1 1/4] driver core: allow certain drivers prohibit override via sysfs
Date: Fri,  8 May 2026 11:42:39 +0200
Message-ID: <20260508095224.1275645-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260508095224.1275645-1-andriy.shevchenko@linux.intel.com>
References: <20260508095224.1275645-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Many drivers, that may be instantiate via ACPI, OF, or, in some cases,
user space won't work without necessary driver data. These are, e.g.,
most of the drivers in IIO subsystem. Trying to override the driver
for the device that has no matching entry makes no sense in such cases
and might lead to a crash, when the driver is not prepared for that.
Instead of adding a NULL check for driver data pointer in each of that
drivers, effectively meaning a dead code for normal functionality,
introduce a special attribute in the struct device_driver to allow
drivers just to hide the attribute for good.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 Documentation/driver-api/driver-model/binding.rst | 4 ++++
 drivers/base/bus.c                                | 4 ++--
 include/linux/device/driver.h                     | 2 ++
 3 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/Documentation/driver-api/driver-model/binding.rst b/Documentation/driver-api/driver-model/binding.rst
index fa0888c2b3b9..19b565a2de86 100644
--- a/Documentation/driver-api/driver-model/binding.rst
+++ b/Documentation/driver-api/driver-model/binding.rst
@@ -147,3 +147,7 @@ Additional helpers are available:
 
 - ``device_set_driver_override()`` - set or clear the override from kernel code.
 - ``device_has_driver_override()`` - check whether an override is set.
+
+Any driver, which bus has ``driver_override`` flag set, can suppress that
+behaviour by setting the ``suppress_override_attrs`` flag in their ``struct
+device_driver``. In this case the sysfs attribute will not show.
diff --git a/drivers/base/bus.c b/drivers/base/bus.c
index d17bd91490ee..16a530b91a00 100644
--- a/drivers/base/bus.c
+++ b/drivers/base/bus.c
@@ -594,7 +594,7 @@ int bus_add_device(struct device *dev)
 out_subsys:
 	sysfs_remove_link(&sp->devices_kset->kobj, dev_name(dev));
 out_override:
-	if (dev->bus->driver_override)
+	if (dev->bus->driver_override && !dev->driver->suppress_override_attrs)
 		device_remove_group(dev, &driver_override_dev_group);
 out_groups:
 	device_remove_groups(dev, sp->bus->dev_groups);
@@ -653,7 +653,7 @@ void bus_remove_device(struct device *dev)
 
 	sysfs_remove_link(&dev->kobj, "subsystem");
 	sysfs_remove_link(&sp->devices_kset->kobj, dev_name(dev));
-	if (dev->bus->driver_override)
+	if (dev->bus->driver_override && !dev->driver->suppress_override_attrs)
 		device_remove_group(dev, &driver_override_dev_group);
 	device_remove_groups(dev, dev->bus->dev_groups);
 	if (klist_node_attached(&dev->p->knode_bus))
diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index bbc67ec513ed..4b1c1774fd43 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -55,6 +55,7 @@ enum probe_type {
  * @owner:	The module owner.
  * @mod_name:	Used for built-in modules.
  * @suppress_bind_attrs: Disables bind/unbind via sysfs.
+ * @suppress_override_attrs: Disables driver_override via sysfs.
  * @probe_type:	Type of the probe (synchronous or asynchronous) to use.
  * @of_match_table: The open firmware table.
  * @acpi_match_table: The ACPI match table.
@@ -103,6 +104,7 @@ struct device_driver {
 	const char		*mod_name;	/* used for built-in modules */
 
 	bool suppress_bind_attrs;	/* disables bind/unbind via sysfs */
+	bool suppress_override_attrs;	/* disables driver_override via sysfs */
 	enum probe_type probe_type;
 
 	const struct of_device_id	*of_match_table;
-- 
2.50.1

