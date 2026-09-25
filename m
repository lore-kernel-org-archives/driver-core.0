Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B398486436
	for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 09:35:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790328918; cv=none; b=iOvDSFfBYEQ3dVGgqZvEk9NpNKWUyDy3PlZ2KLI1OUbmlRc/eaKnsuS5Y/EjaYcerP6l9Wx3AZywl8EgA3TeXzqu5mSGqkelZUyWosWsYO1XHSW2rvXxMQxwyU4wRtQJo+dz089KnRWArf46Pb2QkhPUgwxqYdfS2qyEZJQjjOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790328918; c=relaxed/simple;
	bh=DDAoA13Z8+rHS9pPf8eE11524ZJOa7eHz1ryfQ2IOIc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Le/ZD1B6pjV3zCH3thFtu5lmeV3zL8HJ8JICq1VBDmH13tOXfkzlF0dOIF9/KO1lrMq4FufyYvjM1G2Ozb5ZUqXlo034TDdQouK5HN4cFkx2CeumgyQQJY/aDGZSwHJ5VPDQgCi6lhA9y002sIYln9qevWZ9RxyGjiV7sxIuNTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YmWOf3lv; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YmWOf3lv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790328916; x=1821864916;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=DDAoA13Z8+rHS9pPf8eE11524ZJOa7eHz1ryfQ2IOIc=;
  b=YmWOf3lvSOWeKLNqDzsUVu80g0khTamVWfGJHpptMgc57SBwlZUu4zoe
   6n6lQmvrIVpwJOlkA3etGAyBvXKmhFaTeEFvvBY4BfZwurWL17Q9WsUE2
   v66vJ+YAu85eBu5I4qSXT1uVJXWuEG+QfmUG6VC7CcOFC2TXR49S6HLT4
   VcCyJGFuYbkSkzgjySvaYkWKCskOFNoNG27Qe+jS8v6+nZFsESGmAE70J
   ILDqWubU8MR6HMlsMRZzdy9hYOk8LoTKgZaEz8wHyI+SeMiNpj3eiIUzr
   7yEBVgqaE/NwjsmUsW+3SlLPRH4DwvDqDZugt9cmKRXk9kEwKHa3wXMo/
   A==;
X-CSE-ConnectionGUID: RuOIH9c7R1+8MFUfedLVpQ==
X-CSE-MsgGUID: DHvKhrLYS4O0/uhmu/13IQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="116640895"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="116640895"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 02:35:15 -0700
X-CSE-ConnectionGUID: o748zX7PTHK637eUrNQGBg==
X-CSE-MsgGUID: 0ijMl8OxRIai1FCC/5NBLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="272103426"
Received: from crojewsk-ctrl.igk.intel.com ([10.237.149.0])
  by orviesa006.jf.intel.com with ESMTP; 25 Sep 2026 02:35:13 -0700
From: Cezary Rojewski <cezary.rojewski@intel.com>
To: driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: linux-kernel@vger.kernel.org,
	dawid.osuchowski@linux.intel.com,
	Cezary Rojewski <cezary.rojewski@intel.com>
Subject: [PATCH] driver core: platform: Simplify platform_device_alloc()
Date: Fri, 25 Sep 2026 11:39:28 +0200
Message-Id: <20260925093928.3765486-1-cezary.rojewski@intel.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is no need to double check the 'pa' object.

Reviewed-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 drivers/base/platform.c | 19 ++++++++++---------
 1 file changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index b45d41b018ca..461ffcddad2c 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -620,16 +620,17 @@ struct platform_device *platform_device_alloc(const char *name, int id)
 	struct platform_object *pa;
 
 	pa = kzalloc(sizeof(*pa) + strlen(name) + 1, GFP_KERNEL);
-	if (pa) {
-		strcpy(pa->name, name);
-		pa->pdev.name = pa->name;
-		pa->pdev.id = id;
-		device_initialize(&pa->pdev.dev);
-		pa->pdev.dev.release = platform_device_release;
-		setup_pdev_dma_masks(&pa->pdev);
-	}
+	if (!pa)
+		return NULL;
 
-	return pa ? &pa->pdev : NULL;
+	strcpy(pa->name, name);
+	pa->pdev.name = pa->name;
+	pa->pdev.id = id;
+	device_initialize(&pa->pdev.dev);
+	pa->pdev.dev.release = platform_device_release;
+	setup_pdev_dma_masks(&pa->pdev);
+
+	return &pa->pdev;
 }
 EXPORT_SYMBOL_GPL(platform_device_alloc);
 
-- 
2.34.1

