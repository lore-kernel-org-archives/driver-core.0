Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA7E3CAE6C
	for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 09:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776851368; cv=none; b=YqPQqyz/DM6rmuSai8ecDctvVhoMCAt3o8NtnEDSy3w6261Gk6FaDgtI3g57yxqOKPCjni4BD760XEqE9NRC2XU4g02C0XLBmnHo6d3lIGpvqz/8hcOhP7draBILXMw+UwCi0a04aCa6KzKmheITLlMqsehN//Z9my3p5/k7ZSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776851368; c=relaxed/simple;
	bh=eZjJersyGIBenk2J4qjxDILAN6mXfwSsXarE9vCQGA4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SpcwBLiGwvZt5E4FbuuWGgx8ZXMDxQ40zmqSqlNRt6kKQlFoVjtEgNSlkEvGyJkkBjnI5sd1eRxCUmncmiwMomh97vwtrgorTjRiylI4zEjyKvttDRu31cMcxlmXO7Bx80LZvhf4JQh9gpvt4w6jCQ8Xl9LGY6w1exfco2nRgrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=jAv3DWZZ; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="jAv3DWZZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1776851366; x=1808387366;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=JBge5+9i7mMTwM3YkJGYLaTiwktQRowqhIWANLQ9LBw=;
  b=jAv3DWZZteab9wmdpQefrSUq84nJAZlg32XQ7OrvVom6Vtbf+085+7Gu
   yCqlopzyi2OclcvHlpGM6u9xXyxZIIZfw5Plvsn5YA53DYYDwW52CWS0O
   UBq3JeYTHhSIGIKh9XOzQHySSLeuGv73wccZExbVHcKDe/jiW7Z1tkp8l
   jeeW0GXTmFkAh02XIE3edwCvlQqJvDF22Kb/8bmw+boF5Z02XqG2gWqEd
   3+TZ/SGt1dN5AjjCG5+hdzrJEZVNkIT11Eut6o+BeTEm0zAmjRfbRwhnG
   A+m0PZHEdVec0v8m+53h6wn5qXr5xqfUhZ3mSD9v4EPOrsegnqsKKVUQD
   w==;
X-CSE-ConnectionGUID: 9lNJpzKGTdmcKaeaPvpJjg==
X-CSE-MsgGUID: seQlAH4FQhGCEz0I2WRxAA==
Received: from unknown (HELO jpmta-ob02-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::7])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2026 18:49:17 +0900
X-CSE-ConnectionGUID: QXYUqtlKSVm1g+ZPXX4t2Q==
X-CSE-MsgGUID: M5YBq1fETDWRx9/xs4958A==
X-IronPort-AV: E=Sophos;i="6.23,192,1770562800"; 
   d="scan'208";a="51446131"
Received: from unknown (HELO [127.0.1.1]) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob02-os7.noc.sony.co.jp with ESMTP; 22 Apr 2026 18:49:16 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
Date: Wed, 22 Apr 2026 18:49:04 +0900
Subject: [PATCH v3 2/4] coresight: pass THIS_MODULE implicitly through a
 macro
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-acpi_mod_name-v3-2-a184eff9ff6f@sony.com>
References: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
In-Reply-To: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
Cc: Rahul Bukte <rahul.bukte@sony.com>, 
 Shashank Balaji <shashank.mahadasyam@sony.com>, 
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org, 
 linux-arm-kernel@lists.infradead.org, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
 Daniel Palmer <daniel.palmer@sony.com>, Tim Bird <tim.bird@sony.com>
X-Mailer: b4 0.16-dev-3bfbc
X-Developer-Signature: v=1; a=openpgp-sha256; l=8285;
 i=shashank.mahadasyam@sony.com; h=from:subject:message-id;
 bh=eZjJersyGIBenk2J4qjxDILAN6mXfwSsXarE9vCQGA4=;
 b=owGbwMvMwCU2bX1+URVTXyjjabUkhswXM2es+tR62ehV49PC6c3r/uY+vq7ve7ZGbZFWg/HPD
 78+vt2o2lHKwiDGxSArpshSqlT9a++KoCU9Z14rwsxhZQIZwsDFKQATqXrI8M98kqTOvFcbRRb1
 zrw3+fnn+48enQq8L7zy7ioHj+DUq8zfGP5nR0z92WnZeyVgdeoctS+epvEX3eZMnv9wH/dqdjn
 ezwu4AQ==
X-Developer-Key: i=shashank.mahadasyam@sony.com; a=openpgp;
 fpr=75227BFABDA852A48CCCEB2196AF6F727A028E55

Rename coresight_init_driver() to __coresight_init_driver() and replace
it with a macro wrapper that passes THIS_MODULE implicitly. This is in line with
what other buses do.

Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>

---

Patch 3 depends on this patch.
---
 drivers/hwtracing/coresight/coresight-catu.c       | 2 +-
 drivers/hwtracing/coresight/coresight-core.c       | 4 ++--
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 3 +--
 drivers/hwtracing/coresight/coresight-funnel.c     | 3 +--
 drivers/hwtracing/coresight/coresight-replicator.c | 3 +--
 drivers/hwtracing/coresight/coresight-stm.c        | 2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   | 2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       | 2 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       | 3 +--
 drivers/hwtracing/coresight/coresight-tpiu.c       | 2 +-
 include/linux/coresight.h                          | 4 +++-
 11 files changed, 14 insertions(+), 16 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-catu.c b/drivers/hwtracing/coresight/coresight-catu.c
index dfd035852b12..1bace64eca73 100644
--- a/drivers/hwtracing/coresight/coresight-catu.c
+++ b/drivers/hwtracing/coresight/coresight-catu.c
@@ -708,7 +708,7 @@ static int __init catu_init(void)
 {
 	int ret;
 
-	ret = coresight_init_driver("catu", &catu_driver, &catu_platform_driver, THIS_MODULE);
+	ret = coresight_init_driver("catu", &catu_driver, &catu_platform_driver);
 	tmc_etr_set_catu_ops(&etr_catu_buf_ops);
 	return ret;
 }
diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/hwtracing/coresight/coresight-core.c
index 80e26396ad0a..9e93b22cb056 100644
--- a/drivers/hwtracing/coresight/coresight-core.c
+++ b/drivers/hwtracing/coresight/coresight-core.c
@@ -1644,7 +1644,7 @@ static void __exit coresight_exit(void)
 module_init(coresight_init);
 module_exit(coresight_exit);
 
-int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
+int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 			  struct platform_driver *pdev_drv, struct module *owner)
 {
 	int ret;
@@ -1663,7 +1663,7 @@ int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 	amba_driver_unregister(amba_drv);
 	return ret;
 }
-EXPORT_SYMBOL_GPL(coresight_init_driver);
+EXPORT_SYMBOL_GPL(__coresight_init_driver);
 
 void coresight_remove_driver(struct amba_driver *amba_drv,
 			     struct platform_driver *pdev_drv)
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index 629614278e46..3a806c1d50ea 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -757,8 +757,7 @@ static struct platform_driver debug_platform_driver = {
 
 static int __init debug_init(void)
 {
-	return coresight_init_driver("debug", &debug_driver, &debug_platform_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("debug", &debug_driver, &debug_platform_driver);
 }
 
 static void __exit debug_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-funnel.c b/drivers/hwtracing/coresight/coresight-funnel.c
index 3b248e54471a..b9929f0d13ec 100644
--- a/drivers/hwtracing/coresight/coresight-funnel.c
+++ b/drivers/hwtracing/coresight/coresight-funnel.c
@@ -414,8 +414,7 @@ static struct amba_driver dynamic_funnel_driver = {
 
 static int __init funnel_init(void)
 {
-	return coresight_init_driver("funnel", &dynamic_funnel_driver, &funnel_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("funnel", &dynamic_funnel_driver, &funnel_driver);
 }
 
 static void __exit funnel_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-replicator.c b/drivers/hwtracing/coresight/coresight-replicator.c
index e6472658235d..02fbca334667 100644
--- a/drivers/hwtracing/coresight/coresight-replicator.c
+++ b/drivers/hwtracing/coresight/coresight-replicator.c
@@ -420,8 +420,7 @@ static struct amba_driver dynamic_replicator_driver = {
 
 static int __init replicator_init(void)
 {
-	return coresight_init_driver("replicator", &dynamic_replicator_driver, &replicator_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("replicator", &dynamic_replicator_driver, &replicator_driver);
 }
 
 static void __exit replicator_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-stm.c b/drivers/hwtracing/coresight/coresight-stm.c
index e68529bf89c9..d4fceb52a5cd 100644
--- a/drivers/hwtracing/coresight/coresight-stm.c
+++ b/drivers/hwtracing/coresight/coresight-stm.c
@@ -1052,7 +1052,7 @@ static struct platform_driver stm_platform_driver = {
 
 static int __init stm_init(void)
 {
-	return coresight_init_driver("stm", &stm_driver, &stm_platform_driver, THIS_MODULE);
+	return coresight_init_driver("stm", &stm_driver, &stm_platform_driver);
 }
 
 static void __exit stm_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tmc-core.c b/drivers/hwtracing/coresight/coresight-tmc-core.c
index 36599c431be6..0e0caa600270 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-core.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-core.c
@@ -1051,7 +1051,7 @@ static struct platform_driver tmc_platform_driver = {
 
 static int __init tmc_init(void)
 {
-	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver, THIS_MODULE);
+	return coresight_init_driver("tmc", &tmc_driver, &tmc_platform_driver);
 }
 
 static void __exit tmc_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tnoc.c b/drivers/hwtracing/coresight/coresight-tnoc.c
index 1128612e70a7..e3f54d215414 100644
--- a/drivers/hwtracing/coresight/coresight-tnoc.c
+++ b/drivers/hwtracing/coresight/coresight-tnoc.c
@@ -346,7 +346,7 @@ static struct platform_driver itnoc_driver = {
 
 static int __init tnoc_init(void)
 {
-	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver, THIS_MODULE);
+	return coresight_init_driver("tnoc", &trace_noc_driver, &itnoc_driver);
 }
 
 static void __exit tnoc_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tpdm.c b/drivers/hwtracing/coresight/coresight-tpdm.c
index 06e0a905a67d..ca2add2af581 100644
--- a/drivers/hwtracing/coresight/coresight-tpdm.c
+++ b/drivers/hwtracing/coresight/coresight-tpdm.c
@@ -1533,8 +1533,7 @@ static struct platform_driver static_tpdm_driver = {
 
 static int __init tpdm_init(void)
 {
-	return coresight_init_driver("tpdm", &dynamic_tpdm_driver, &static_tpdm_driver,
-				     THIS_MODULE);
+	return coresight_init_driver("tpdm", &dynamic_tpdm_driver, &static_tpdm_driver);
 }
 
 static void __exit tpdm_exit(void)
diff --git a/drivers/hwtracing/coresight/coresight-tpiu.c b/drivers/hwtracing/coresight/coresight-tpiu.c
index aaa44bc521c3..401da2958f7f 100644
--- a/drivers/hwtracing/coresight/coresight-tpiu.c
+++ b/drivers/hwtracing/coresight/coresight-tpiu.c
@@ -312,7 +312,7 @@ static struct platform_driver tpiu_platform_driver = {
 
 static int __init tpiu_init(void)
 {
-	return coresight_init_driver("tpiu", &tpiu_driver, &tpiu_platform_driver, THIS_MODULE);
+	return coresight_init_driver("tpiu", &tpiu_driver, &tpiu_platform_driver);
 }
 
 static void __exit tpiu_exit(void)
diff --git a/include/linux/coresight.h b/include/linux/coresight.h
index 2b48be97fcd0..4f58bfc59080 100644
--- a/include/linux/coresight.h
+++ b/include/linux/coresight.h
@@ -697,7 +697,9 @@ coresight_find_output_type(struct coresight_platform_data *pdata,
 			   enum coresight_dev_type type,
 			   union coresight_dev_subtype subtype);
 
-int coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
+#define coresight_init_driver(drv, amba_drv, pdev_drv) \
+	__coresight_init_driver(drv, amba_drv, pdev_drv, THIS_MODULE)
+int __coresight_init_driver(const char *drv, struct amba_driver *amba_drv,
 			  struct platform_driver *pdev_drv, struct module *owner);
 
 void coresight_remove_driver(struct amba_driver *amba_drv,

-- 
2.43.0

