Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ADA3793C6
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 20:44:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771879469; cv=none; b=eSAw3n899LZCzgGUNI6ac71U0hLf79om1Ivt1b6ECgRw6kxhDBOSujOmModj18fjVfC3BDJiTDkBANWErxv7y8Hv6sJV5s8JNnD5/StWtm0iDc5z3CoxC3TGkMu7cB0paU5eke4+TxZUOFuW0Xd33J0VZSbENBB0R++10y1FFMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771879469; c=relaxed/simple;
	bh=hDo7vV4l0SXbcs1Xo9+74l02q5jsJ4F9mHa8kkrZXjk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LOpLTh+6aX6sDW0YModpWcNODTmr0IhAr9TrQZb/23u5e7UWUmBBlel3qNsosBpShaqJVmQvNXmWNCvmCD/XudcbhfBJoUIPCiQylegSWv6GWaLafw0wwpMhMP3EgahTTDkET10L369OBOJF4zk4c1LdP+7eDle12mscH5GaKqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IBrqds9x; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IBrqds9x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771879466; x=1803415466;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hDo7vV4l0SXbcs1Xo9+74l02q5jsJ4F9mHa8kkrZXjk=;
  b=IBrqds9xqPj9uj/19zPX8jPG37ySTt14I3QzhHEielgPuVVR2TjMdicB
   F2whsFEw6j1jxb0ps5wIIQzdPSoqO0wCUua9mJiZ9GNu+jwJuQ4mNHkxn
   EoxWb9+VdRbY1CUHJPLN3Nj8llkKQgaihnddfL9SAaYkCfNRoo49uYyzl
   7ip8DexcoIwtU75rTLSF997q1Vku8+kYdCSiF1cQF5QbiVebbCu+tMSA8
   fJGcj1u0rX0oWlPX7ZlELT+I2NtivfLVsBvVGMGxwbH1Hh4V+HIwBzhna
   xVTLVNzDhbu92Rsd2gx+5h92YM3Nluo2p1L9BojVoJATi1mvFAhFu4cFz
   w==;
X-CSE-ConnectionGUID: oEfEJt1NTbyNpGp8G7SUtg==
X-CSE-MsgGUID: BIx6TnDATvCrm+i+orwW2g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="72795336"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="72795336"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 12:44:22 -0800
X-CSE-ConnectionGUID: E/8Q1/VRREiGblqjJnAi2w==
X-CSE-MsgGUID: 7pbjLTCcRXq+IeUj2e7gLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="215700222"
Received: from black.igk.intel.com ([10.91.253.5])
  by orviesa008.jf.intel.com with ESMTP; 23 Feb 2026 12:44:19 -0800
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id 39F1C9B; Mon, 23 Feb 2026 21:44:18 +0100 (CET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-acpi@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>
Subject: [PATCH v1 3/3] driver core: Split device related fwnode API to device/fwnode.h
Date: Mon, 23 Feb 2026 21:30:32 +0100
Message-ID: <20260223204412.3298508-4-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260223204412.3298508-1-andriy.shevchenko@linux.intel.com>
References: <20260223204412.3298508-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

device.h is a huge header which is hard to follow and easy to miss
something. Improve that by splitting device related fwnode API
to device/fwnode.h.

In particular this helps to speedup the build of the code that includes
device.h solely for a device related fwnode API.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 include/linux/device.h        | 17 +----------------
 include/linux/device/fwnode.h | 28 ++++++++++++++++++++++++++++
 2 files changed, 29 insertions(+), 16 deletions(-)
 create mode 100644 include/linux/device/fwnode.h

diff --git a/include/linux/device.h b/include/linux/device.h
index 4ba6ae72ddf6..d2e2745243ea 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -31,6 +31,7 @@
 #include <linux/device/devlink.h>
 #include <linux/device/devres.h>
 #include <linux/device/driver.h>
+#include <linux/device/fwnode.h>
 #include <linux/device/types.h>
 #include <linux/cleanup.h>
 
@@ -38,8 +39,6 @@ struct device_driver;
 struct module;
 struct class;
 struct subsys_private;
-struct device_node;
-struct fwnode_handle;
 
 /**
  * struct subsys_interface - interfaces to device functions
@@ -603,20 +602,6 @@ int lock_device_hotplug_sysfs(void);
 int device_offline(struct device *dev);
 int device_online(struct device *dev);
 
-void set_primary_fwnode(struct device *dev, struct fwnode_handle *fwnode);
-void set_secondary_fwnode(struct device *dev, struct fwnode_handle *fwnode);
-void device_set_node(struct device *dev, struct fwnode_handle *fwnode);
-int device_add_of_node(struct device *dev, struct device_node *of_node);
-void device_remove_of_node(struct device *dev);
-void device_set_of_node_from_dev(struct device *dev, const struct device *dev2);
-
-static inline struct device_node *dev_of_node(struct device *dev)
-{
-	if (!IS_ENABLED(CONFIG_OF) || !dev)
-		return NULL;
-	return dev->of_node;
-}
-
 static inline int dev_num_vf(struct device *dev)
 {
 	if (dev->bus && dev->bus->num_vf)
diff --git a/include/linux/device/fwnode.h b/include/linux/device/fwnode.h
new file mode 100644
index 000000000000..4fe6107191a6
--- /dev/null
+++ b/include/linux/device/fwnode.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _DEVICE_FWNODE_H_
+#define _DEVICE_FWNODE_H_
+
+#include <linux/stddef.h>
+
+#include "types.h"
+
+struct device_node;
+struct fwnode_handle;
+
+void set_primary_fwnode(struct device *dev, struct fwnode_handle *fwnode);
+void set_secondary_fwnode(struct device *dev, struct fwnode_handle *fwnode);
+
+void device_set_node(struct device *dev, struct fwnode_handle *fwnode);
+
+int device_add_of_node(struct device *dev, struct device_node *of_node);
+void device_remove_of_node(struct device *dev);
+void device_set_of_node_from_dev(struct device *dev, const struct device *dev2);
+
+static inline struct device_node *dev_of_node(struct device *dev)
+{
+	if (!IS_ENABLED(CONFIG_OF) || !dev)
+		return NULL;
+	return dev->of_node;
+}
+
+#endif /* _DEVICE_FWNODE_H_ */
-- 
2.50.1

