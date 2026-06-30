Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1105F328635
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 21:19:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854345; cv=none; b=khA3QPU57VxiJNiQmvtKdkqrKu/7peBfIdF7U/CDgnqOSksq82kTuYnCzytZIiONePGoXEGxoldrtKI1/kqwYkZ7WVLO8Wf9v+wqpy4HC7kQbwgdHgmspeuGv1s7Nk+qUw8319HsCp+XTfYzLk4gafKpwvT0sR7ZDY4PrhPb5jI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854345; c=relaxed/simple;
	bh=M2XlJjFZxF3IK8lHYlvHWP38+NcKhixhRvsiCPbvlKU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XNgGAW16PyN0992tcW4m15M3DQYKmf/rkN/KsVcMdzGFwISQHgje1kK81jlYsIOXqmUUBZeo9EAaqzpR06DOAy9Tm6JtxCFI6Glq9h4ALJfoPJ5fvBdnIv2FPZVgb51mcC7j+GTNRHndMA+l9yaHAJgknIjBU6ykTuvvohgl20M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=MA7hqAWf; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="MA7hqAWf"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-920f33347f5so444288185a.3
        for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 14:19:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782854341; x=1783459141; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1IP2YOjgAZGfrsS4LZXJr3sh6H3JBdzwvDSe5f7yamI=;
        b=MA7hqAWfq7QuSj0JVdJxmDypkJgJP/Me9KhdgsO+Wjy4p3vM2Pj3ku0/r65xlCL65K
         t43cUJGCm8ODcGBA1fuhwJE+GDfIjUh0KrF97t2xZVOvcLtqsJP78mUeU+d8wQWTVh6R
         0DYKnW6uxCEajKJl/4R4kn4F2xjiUFPis3VDZbP+Dquq+/PbFzED2I2KTUdTCAqaI7qo
         TPYC8NkMBr4VP7MP1+ISDHF64uhfxWryericVihGqdEMHqIl8jY+uS+mzMnceo8ACvbC
         N+W3S+yoKegn590JWVyva8/BZ4HTK/xmPVJQeweIlpAq4QGFRbekbO9lCRz8XqmVUK7S
         O5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782854341; x=1783459141;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1IP2YOjgAZGfrsS4LZXJr3sh6H3JBdzwvDSe5f7yamI=;
        b=mvIyQuldJwksmvsasCkJAvI6tEPMVar2Pa4Q8wKVV3X4VINiSBeFfD1/GK6zimxQZY
         18m8xOYBU6ERp2tEpZiNxO8rsB4cqK6c+VZIakrbYynGgWazU11TLh5liSyzI7z4SWmA
         t6e5gj3ZMtxEqKcOwIU+B/yQuC3o1vb/kmU3P3zOjmKESkiPRJOneFHUP8WpwyMbHoKn
         ZC8sEFBTX6o4vyJlXzYxR/TzTX2sw9HtIQibXdbhCcQev1hmBZOwNNWeDQOm0QSbZgok
         BVgan+52f7uFfG3lJz7q8EoD2Xh1X6J+Xw5zzdtpqq7kIbcksr59AfnvtTTFoj2Cxl0d
         WssQ==
X-Forwarded-Encrypted: i=1; AFNElJ8fHJvR6lclhdSJwhbpPrGOy0qovKgdqdP9If8cNx3iYBrbKk7irxyRJkDuQHOvBOlBkLyv6GU9E24Hog==@lists.linux.dev
X-Gm-Message-State: AOJu0YwlYzTHXcPIGxy52rlthnd1o3djDlorabBAh0gMybpzXwxh1Wq7
	fLJQJYqyuHmLowE6sddIG0zpe2l/Dkw8FLv6Zsv3NOe+WpLiZe0FrCAdx8o+g6iLRfA=
X-Gm-Gg: AfdE7cnTqNM0ar+w1ky/SrOFDJcSA94LcG++Mf+hpfcwiep9FaeYABmvAg8GeOob7lG
	JBmByFFv197psVxksJzWS/VPBoYhl+mvlHAIrD+zMPen4ZHLE5qUXd1PTIrW1XjEP8oMy3NKVyw
	0+kpJlZup1u4haublYJD+3+A/vuTDHmMp3CZ2E0skk/o29VxIFs0p6Eadp1BSHSgV8bknp1Jjk8
	Nda6nFMdbTkHWYHDmQs0b4w74bbAnEN8Q5S/8TK5GjDykkiSf/04SiunC48oX+b45VpS+ludnFN
	9L3fCpkVtGlZSS97jA8hLZV6ycOwuFFx+10YAsmfmosvZ0JOZEphVkEG9N7eB/yHhwdvhGx6xoo
	5tluRUzbcPAKM3uK2EVnJLAZkL8YmSO3UwcoL4IjJNDRx3eGSsvMyqsyIW3QDsvgfJWrKomBuQn
	vjq77BxxtVVBRHIRn2l8QIGjSt3ElL3RAMsnDAwAajP4U5KKhOR4F1dDc6VATCDkW32g3Tyf5uk
	j4DzyqOFT9z
X-Received: by 2002:a05:620a:17a5:b0:92b:6805:eae5 with SMTP id af79cd13be357-92e6d92926dmr414099985a.66.1782854340864;
        Tue, 30 Jun 2026 14:19:00 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e62366303sm335924285a.40.2026.06.30.14.18.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 14:19:00 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com,
	david@kernel.org,
	osalvador@suse.de,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	akpm@linux-foundation.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	shuah@kernel.org,
	gourry@gourry.net,
	iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com,
	apopple@nvidia.com
Subject: [PATCH v6 07/10] dax: plumb hotplug online_type through dax
Date: Tue, 30 Jun 2026 17:18:39 -0400
Message-ID: <20260630211842.2252800-8-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260630211842.2252800-1-gourry@gourry.net>
References: <20260630211842.2252800-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no way for drivers leveraging dax_kmem to plumb through a
preferred auto-online policy - the system default policy is forced.

Add 'enum mmop' field to DAX device creation path to allow drivers
to specify an auto-online policy when using the kmem driver.

Capturing the system default would otherwise break the ABI, because
the system default can change - but we would be statically assigning
the value at device creation time.

To resolve this we add DAX_ONLINE_DEFAULT, which defaults devices to
the current behavior, while providing a clean way to override it.

No behavioural change for existing callers (still the system default).

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/dax/bus.c         |  3 +++
 drivers/dax/bus.h         |  9 +++++++++
 drivers/dax/cxl.c         |  1 +
 drivers/dax/dax-private.h |  4 ++++
 drivers/dax/hmem/hmem.c   |  1 +
 drivers/dax/kmem.c        | 11 +++++++++--
 drivers/dax/pmem.c        |  1 +
 7 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/dax/bus.c b/drivers/dax/bus.c
index 492573b47f66..4a03b323b003 100644
--- a/drivers/dax/bus.c
+++ b/drivers/dax/bus.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright(c) 2017-2018 Intel Corporation. All rights reserved. */
 #include <linux/memremap.h>
+#include <linux/memory_hotplug.h>
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/list.h>
@@ -394,6 +395,7 @@ static ssize_t create_store(struct device *dev, struct device_attribute *attr,
 			.size = 0,
 			.id = -1,
 			.memmap_on_memory = false,
+			.online_type = DAX_ONLINE_DEFAULT,
 		};
 		struct dev_dax *dev_dax = __devm_create_dev_dax(&data);
 
@@ -1527,6 +1529,7 @@ static struct dev_dax *__devm_create_dev_dax(struct dev_dax_data *data)
 	ida_init(&dev_dax->ida);
 
 	dev_dax->memmap_on_memory = data->memmap_on_memory;
+	dev_dax->online_type = data->online_type;
 
 	inode = dax_inode(dax_dev);
 	dev->devt = inode->i_rdev;
diff --git a/drivers/dax/bus.h b/drivers/dax/bus.h
index 5909171a4428..3bc76bc0a145 100644
--- a/drivers/dax/bus.h
+++ b/drivers/dax/bus.h
@@ -3,6 +3,7 @@
 #ifndef __DAX_BUS_H__
 #define __DAX_BUS_H__
 #include <linux/device.h>
+#include <linux/memory_hotplug.h>
 #include <linux/platform_device.h>
 #include <linux/range.h>
 #include <linux/workqueue.h>
@@ -16,6 +17,13 @@ struct dax_region;
 #define IORESOURCE_DAX_STATIC BIT(0)
 #define IORESOURCE_DAX_KMEM BIT(1)
 
+/*
+ * online_type sentinel: the device was created without an explicit online
+ * policy, so the system default is resolved when the kmem driver binds,
+ * (not at device-creation time, which would freeze a stale policy).
+ */
+#define DAX_ONLINE_DEFAULT	(-1)
+
 struct dax_region *alloc_dax_region(struct device *parent, int region_id,
 		struct range *range, int target_node, unsigned int align,
 		unsigned long flags);
@@ -26,6 +34,7 @@ struct dev_dax_data {
 	resource_size_t size;
 	int id;
 	bool memmap_on_memory;
+	int online_type;	/* enum mmop, or DAX_ONLINE_DEFAULT sentinel */
 };
 
 struct dev_dax *devm_create_dev_dax(struct dev_dax_data *data);
diff --git a/drivers/dax/cxl.c b/drivers/dax/cxl.c
index 3ab39b77843d..1a7ec6212213 100644
--- a/drivers/dax/cxl.c
+++ b/drivers/dax/cxl.c
@@ -27,6 +27,7 @@ static int cxl_dax_region_probe(struct device *dev)
 		.id = -1,
 		.size = range_len(&cxlr_dax->hpa_range),
 		.memmap_on_memory = true,
+		.online_type = DAX_ONLINE_DEFAULT,
 	};
 
 	return PTR_ERR_OR_ZERO(devm_create_dev_dax(&data));
diff --git a/drivers/dax/dax-private.h b/drivers/dax/dax-private.h
index 81e4af49e39c..902e922dc4e4 100644
--- a/drivers/dax/dax-private.h
+++ b/drivers/dax/dax-private.h
@@ -8,6 +8,7 @@
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/idr.h>
+#include <linux/memory_hotplug.h>
 
 /* private routines between core files */
 struct dax_device;
@@ -79,6 +80,8 @@ struct dev_dax_range {
  * @dev: device core
  * @pgmap: pgmap for memmap setup / lifetime (driver owned)
  * @memmap_on_memory: allow kmem to put the memmap in the memory
+ * @online_type: MMOP_* online type for memory hotplug, or DAX_ONLINE_DEFAULT
+ *		 to resolve the system default policy when kmem binds
  * @nr_range: size of @ranges
  * @ranges: range tuples of memory used
  */
@@ -95,6 +98,7 @@ struct dev_dax {
 	struct device dev;
 	struct dev_pagemap *pgmap;
 	bool memmap_on_memory;
+	int online_type;	/* enum mmop, or DAX_ONLINE_DEFAULT sentinel */
 	int nr_range;
 	struct dev_dax_range *ranges;
 };
diff --git a/drivers/dax/hmem/hmem.c b/drivers/dax/hmem/hmem.c
index af21f66bf872..2de3bc925172 100644
--- a/drivers/dax/hmem/hmem.c
+++ b/drivers/dax/hmem/hmem.c
@@ -37,6 +37,7 @@ static int dax_hmem_probe(struct platform_device *pdev)
 		.id = -1,
 		.size = region_idle ? 0 : range_len(&mri->range),
 		.memmap_on_memory = false,
+		.online_type = DAX_ONLINE_DEFAULT,
 	};
 
 	return PTR_ERR_OR_ZERO(devm_create_dev_dax(&data));
diff --git a/drivers/dax/kmem.c b/drivers/dax/kmem.c
index 592171ec10f4..0a184c0878dd 100644
--- a/drivers/dax/kmem.c
+++ b/drivers/dax/kmem.c
@@ -72,6 +72,7 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 	int i, rc, mapped = 0;
 	mhp_t mhp_flags;
 	int numa_node;
+	int online_type;
 	int adist = MEMTIER_DEFAULT_DAX_ADISTANCE;
 
 	/*
@@ -132,6 +133,11 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 		goto err_reg_mgid;
 	data->mgid = rc;
 
+	/* Resolve system default at bind time in case it changed */
+	online_type = dev_dax->online_type;
+	if (online_type == DAX_ONLINE_DEFAULT)
+		online_type = mhp_get_default_online_type();
+
 	for (i = 0; i < dev_dax->nr_range; i++) {
 		struct resource *res;
 		struct range range;
@@ -172,8 +178,9 @@ static int dev_dax_kmem_probe(struct dev_dax *dev_dax)
 		 * Ensure that future kexec'd kernels will not treat
 		 * this as RAM automatically.
 		 */
-		rc = add_memory_driver_managed(data->mgid, range.start,
-				range_len(&range), kmem_name, mhp_flags);
+		rc = __add_memory_driver_managed(data->mgid, range.start,
+				range_len(&range), kmem_name, mhp_flags,
+				online_type);
 
 		if (rc) {
 			dev_warn(dev, "mapping%d: %#llx-%#llx memory add failed\n",
diff --git a/drivers/dax/pmem.c b/drivers/dax/pmem.c
index bee93066a849..e7adace69195 100644
--- a/drivers/dax/pmem.c
+++ b/drivers/dax/pmem.c
@@ -63,6 +63,7 @@ static struct dev_dax *__dax_pmem_probe(struct device *dev)
 		.pgmap = &pgmap,
 		.size = range_len(&range),
 		.memmap_on_memory = false,
+		.online_type = DAX_ONLINE_DEFAULT,
 	};
 
 	return devm_create_dev_dax(&data);
-- 
2.53.0-Meta

