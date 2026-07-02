Received: from pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com [44.246.68.102])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E69381EBC
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 17:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=44.246.68.102
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783014686; cv=none; b=ccvaCjx1qM5A/B/1gzp/qHHTal3SwM1aG+z/DenBHjhvrRkpaybSm3jPuqhjiVMJtY7TyaIzdCo5IvdvjYf++Yd5twHq7PA2noeTM1KFc4/ZZpMgRbXTn9dEZgW4hz7XYEHk9XQz2WW7eUyHePrndPItxJfyWBoFqALxWZcscSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783014686; c=relaxed/simple;
	bh=JqmBCdphyj3X5OfvvKiK+XlECE00ghoRObioH0bZ08E=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d52b3OLZvQba9NWcllqT9mEO2LVyrnWU3W+L8D3r1G0ibV8zsvhPMmAjwtQOx320bPcEI+JjpOQtxIbpiZNxwLESVkGQ9L2y7RKWjviYv8uR8torg+SZbYSEtI1VeVnP/o0dOJ5LtWkmvvkiyF8Ngf0czhuQhQLV47mUUbodEMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=PhCUyCv2; arc=none smtp.client-ip=44.246.68.102
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="PhCUyCv2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1783014683; x=1814550683;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mmK2zooHqLvAHzbEI5SDeIhxEVgl5YiYD7Pep1MMb4k=;
  b=PhCUyCv2nC+Q4/rdBp1CrLZRfMGFJs/cgPFZgOk7LXC2pjGkRrpGBL2h
   CVpbVz8j3Q1WsMl19rTgUJMOZstZSiSgYPnvBKcbhNt/M/FYZ6awOo8Rc
   KyfhOtlYa/Zig7PfgQXeJ7mqsdQ2VWE/uSA65eH68Gk0cXNHSBNTKe3x5
   ic1A5nhdJNbdZs/JRlhviMfz6M1N2q1+DVKEu00inpFUWtNUCrocb41AX
   0tmIk2zi5Oic0YBQDH5JfDF8EmDjAm+z7UJaS/UXvHimAJQ21H6rdvo3Y
   KO40bk+kOyc1HfaE+VMiwK7lQzUvwrV1VRmVdX/XOYc88YX0hFeDusiZz
   Q==;
X-CSE-ConnectionGUID: HKUz4EBzTdic+O93pqepGA==
X-CSE-MsgGUID: DNQoA3ZdT9yO4I8VAgOujg==
X-IronPort-AV: E=Sophos;i="6.25,144,1779148800"; 
   d="scan'208";a="22963757"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-003.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2026 17:51:22 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:4473]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.43.112:2525] with esmtp (Farcaster)
 id cd19b220-fdcd-4ca3-8e48-99625866b657; Thu, 2 Jul 2026 17:51:22 +0000 (UTC)
X-Farcaster-Flow-ID: cd19b220-fdcd-4ca3-8e48-99625866b657
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43;
 Thu, 2 Jul 2026 17:51:21 +0000
Received: from dev-dsk-sakacpav-1a-480d1124.eu-west-1.amazon.com
 (172.19.96.155) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.43; Thu, 2 Jul 2026
 17:51:19 +0000
From: Pavol Sakac <sakacpav@amazon.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki"
	<rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Tejun Heo
	<tj@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>, "David
 Woodhouse" <dwmw@amazon.co.uk>, Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, Pratyush Yadav <pratyush@kernel.org>, "David
 Matlack" <dmatlack@google.com>, Samiullah Khawaja <skhawaja@google.com>,
	Alexander Graf <graf@amazon.com>, <linux-mm@kvack.org>,
	<kexec@lists.infradead.org>, <nh-open-source@amazon.com>
Subject: [RFC PATCH 06/14] driver core: wire device_ktype populate to walker
Date: Thu, 2 Jul 2026 19:51:06 +0200
Message-ID: <20260702175114.24659-2-sakacpav@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260702175114.24659-1-sakacpav@amazon.de>
References: <20260702174033.32116-1-sakacpav@amazon.de>
 <20260702175114.24659-1-sakacpav@amazon.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D033UWC004.ant.amazon.com (10.13.139.225) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Wire the kernfs syscall callback shape (kobject *, const char *)
to the device-level walker. Add device_ktype_populate_one() and
device_ktype_populate_all() adapters that dispatch through
device_sysfs_apply() over dev->kobj.ktype->entries (currently
NULL; the migration commit installs driver_core_sysfs_entries[]).

The adapters early-return when dev->p->dead is set so a populate
racing with device_del() is a no-op.

No behaviour change: the table is empty until the migration commit.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Tejun Heo <tj@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org
Cc: driver-core@lists.linux.dev
Cc: linux-api@vger.kernel.org
Assisted-by: Claude:claude-opus-4.7
Signed-off-by: Pavol Sakac <sakacpav@amazon.de>
---
 drivers/base/core.c | 50 +++++++++++++++++++++++++++++++++++++++++----
 1 file changed, 46 insertions(+), 4 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index aeb4985eb8838..975b6e0c4dabd 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -33,6 +33,7 @@
 #include <linux/swiotlb.h>
 #include <linux/sysfs.h>
 
+
 #include "base.h"
 #include "physical_location.h"
 #include "power/power.h"
@@ -2841,10 +2842,9 @@ device_sysfs_entries_end(const struct device_sysfs_entry *entries)
 	return e;
 }
 
-static __maybe_unused int
-device_sysfs_apply(struct device *dev,
-		  const struct device_sysfs_entry *entries,
-		  enum dev_sysfs_action action, const char *name)
+static int device_sysfs_apply(struct device *dev,
+			     const struct device_sysfs_entry *entries,
+			     enum dev_sysfs_action action, const char *name)
 {
 	const struct device_sysfs_entry *e;
 
@@ -2972,11 +2972,53 @@ int device_set_sysfs_lazy(struct device *dev)
 }
 EXPORT_SYMBOL_GPL(device_set_sysfs_lazy);
 
+/*
+ * kobj_type populate adapters - thin wrappers from the kobject
+ * callback shape (kobject *, const char *) to the device-level
+ * walker. Both read dev->kobj.ktype->entries (which is currently
+ * NULL until driver_core_sysfs_entries[] is populated below) and
+ * call device_sysfs_apply() with the matching action.
+ *
+ * The walker traverses an empty table today, so these adapters are
+ * no-ops in behavioural terms. They are wired now so that the
+ * ktype plumbing lands as one reviewable unit; subsequent commits
+ * flip rows on without touching dispatch wiring.
+ */
+static int device_ktype_populate_one(struct kobject *kobj, const char *name)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	const struct kobj_type *ktype = dev->kobj.ktype;
+	int ret;
+
+	/* Device is being torn down; do not populate. */
+	if (dev->p->dead)
+		return -ENOENT;
+
+	ret = device_sysfs_apply(dev, ktype ? ktype->entries : NULL,
+				DEV_SYSFS_ADD_ONE, name);
+	return ret;
+}
+
+static void device_ktype_populate_all(struct kobject *kobj)
+{
+	struct device *dev = kobj_to_dev(kobj);
+	const struct kobj_type *ktype = dev->kobj.ktype;
+
+	/* Device is being torn down; do not populate. */
+	if (dev->p->dead)
+		return;
+
+	device_sysfs_apply(dev, ktype ? ktype->entries : NULL,
+			  DEV_SYSFS_ADD_ALL, NULL);
+}
+
 static const struct kobj_type device_ktype = {
 	.release	= device_release,
 	.sysfs_ops	= &dev_sysfs_ops,
 	.namespace	= device_namespace,
 	.get_ownership	= device_get_ownership,
+	.populate	= device_ktype_populate_one,
+	.populate_all	= device_ktype_populate_all,
 };
 
 
-- 
2.47.3




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

