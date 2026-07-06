Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28A943B6E4
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 12:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783342488; cv=none; b=tpnCosc45p2AIECmCZXt3JD/HzlAgUjqxWVGS79SBX9rnGIMpq1eHZAi72NS+RA1wR90cS+Ml7tzh9AGD3Lc4RwciRZuWx0kO3dRdzlSlc57+9rzpeabh23acgA44qSvFiEZKCC/Wy25zOUMcxthZGR21VIYw3SpkVDMpLUXKjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783342488; c=relaxed/simple;
	bh=YfHcyUNANbHeZfkVxh8Mcj2c+wv3uMr6hNGRG2BHmb4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=phkzgdNJ6oWfiHu3xwVBTRDdBNkcWvhuVcLqioL0hAUZ5LOdmebvNv/vAD9eS21J3yoMaTnnP2ChGtGrbCgNBSyISI6Af4tZ3nq77MIpNaCUdcRWIFDbYRYl4rJ1/aHZRRMS8Y/hTCkbYKmTO1b5wYrwU2+KWJq5nxUnlxtMMEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IRg9fI4X; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ly69Gakl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IRg9fI4X";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ly69Gakl"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxJS6316461
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 12:54:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BB0X2QPG4c6v3cXjAQPmMt28HqfalSRsmx2hnmqXpu4=; b=IRg9fI4Xj3lGFCKa
	HQ1ZtkVFz8rKgSgTR/cbGaXxgkKN2Oku2AhTV7prMrgMNN15a6nUKfbluJAEyyq0
	vF4aAMAPN9kR9M7JvKcJAuhIWlL1C9GtoL6pN2EkoH4HubG51qXMr31LvuAPBzeY
	MSHR9f48p58Q0fIeU07H9j3/W4hu+q/kJTQ7li7zeNHKcGjV50l+6CxZPLjlT5Um
	zxN4QJWyihVLiLDjBATd/aG+zLIVKLkI4ZvZFKXgQYgAlfAmHuPb0nzPiTGVQDrY
	eDXuaMzC2xGySQDSsWglLcZrQyUk5T5ZFGBxSw77MRFN9Sos3Huy0aT0n9W+Yqxn
	OS688g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f87q7hadf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 12:54:44 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92e695a3b28so388783185a.1
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 05:54:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783342484; x=1783947284; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BB0X2QPG4c6v3cXjAQPmMt28HqfalSRsmx2hnmqXpu4=;
        b=Ly69Gaklzj4Hx+tGapepFPMjImriHrzb5jmquVlfKp+O0cFS/wvdgCyEaMFTXhdP2x
         Xh8SidEoaAV4MI/nXdTihNWzkh7VjThyMRj1AvGRpLdtcxJqi1n7pJA9MO3r4HpkAOhe
         KEqZbPRUCk+cZ421SyQvBP8G2YH7GgQ3BDab4Uy6qaadSwkn9Smj5O+FTyOEacANW0T1
         SkKV9uD7U0XWLnfNdPX/garQh2MGRI5E8J/EwMiPseuLQmduEDwrPQsO1heSXeDB1t1i
         LIidv5nUK5bnaoxvQWAEkhJ2CyRzYq/y0dhuF4wuRnN/fZWr5mLk0N7NNemjZsOa2MiA
         pUsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783342484; x=1783947284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BB0X2QPG4c6v3cXjAQPmMt28HqfalSRsmx2hnmqXpu4=;
        b=e0T1QIKjh6BxM+BYf7SFdS2UD6wkmxbSARDj7Z7Q8tdfWEv1+uObuoEN4Ov/4/JVB0
         TZ9Cy8Sx4P9CArBLGhEZtay9oLWIYE461eFcvCrfLyzXsGrlJ5BxEylXC2o4EjNAM85L
         fZS/KfDuqC2X3vsR/6e0YHTjeb1dMSgtJUNDcIMbB/Hc8lIGeyxQ680w5/CUpWR7VvGR
         mW1bTGpGu4+9NE+nk/qoX1OQDlXcEe6mom/AUwnm1QWJad43nBzqmdUMYEoQb6dpJ40M
         LdTm3Jkh+H8Q9rgjSxF44j8pE5TZPXl5Oc7K1tRLVPEsfh2R4//iR0CE4EnH24n70pqm
         WUCQ==
X-Forwarded-Encrypted: i=1; AHgh+RqPRQTWzHo0+K5KKY0oCZ+cGG+2q78gTOvF40R4URu73iOXrPCLqT9uwMpefLXAlEFu0+z1ErwaV92ZfQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHxJLMutIobmWcRk0ODckDPEArWClj5uOe45mx+2c9klbtD2A7
	y7pjOsF4iomb2lFDHUIZDCbwXxUVqUGKwxBZuOV0OxGfqc1pkirqLzRCuNeNCEhumSFz2IWTiT7
	vNbP+PEzP0UGSfN9cNjZOUksvCjPNM2mpFgbXJfFyLXY0TEGAgiuA1QrfJiQM5owIIA==
X-Gm-Gg: AfdE7cmX5i7xGBpLGov99t6A1XCEvcbKNogLVpzaMOATJnYHgvEV1nWS0APFRQ60rAW
	O4eYM6ONsWTefzQ64C1VtaEZFNh5he3ZQ877OIWVLsAu1jDdFlo7EFXylJ9XiQTiI/6GGEY+RHc
	lP9X/iq2pwZdg/mZwscrXKMw5Hq0jH++7jOZivVGdoyqSjMK6X4dhD91O6gtRl+p6oQlLJtvu5o
	9T1Bb2snUyn4Uh+I/UJjLriLi85kJ3Cf2mRxx7LgmC84IVfuFwAuzpyxIwYy8IUJZz7R4AmqYPt
	2tRkW6lxNiX26Pe1zahWveT+Nl50Y+X2iELEg5W1xHQvyz1EPtSvSRqw6yzQAvxyPJ/N1CqGT0T
	dWKY7jtGezDLmWgFL3OPE05jkGTTXbaD5aMW9T0ck
X-Received: by 2002:a05:620a:2b94:b0:92e:65d0:1cc4 with SMTP id af79cd13be357-92e8b543ba1mr1834669785a.30.1783342484115;
        Mon, 06 Jul 2026 05:54:44 -0700 (PDT)
X-Received: by 2002:a05:620a:2b94:b0:92e:65d0:1cc4 with SMTP id af79cd13be357-92e8b543ba1mr1834664585a.30.1783342483591;
        Mon, 06 Jul 2026 05:54:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47a9de1e736sm26856931f8f.7.2026.07.06.05.54.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:54:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:54:12 +0200
Subject: [PATCH v2 5/5] gpio: kunit: add test cases verifying swnode
 devlink support
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-swnode-fw-devlink-v2-5-f39b09d50112@oss.qualcomm.com>
References: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
In-Reply-To: <20260706-swnode-fw-devlink-v2-0-f39b09d50112@oss.qualcomm.com>
To: Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
        kunit-dev@googlegroups.com, linux-acpi@vger.kernel.org,
        driver-core@lists.linux.dev, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=11429;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YfHcyUNANbHeZfkVxh8Mcj2c+wv3uMr6hNGRG2BHmb4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6WHS5pFiMlrg2b4Nwf/qXSExFRgsmPEbV9fZ
 QCOi3m0l1+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakulhwAKCRAFnS7L/zaE
 w98bD/9H2eLICaZAJk20cD+3nwNg2w6Hrc/UWvoTvCi7YGrJQv7h98pdlTbl1SxpghIZT5zdG49
 dVgWm4ECY+0vz7u0KLhhJmAXAZ9YskJ1OFiv+2qidBP/EBqp2zqVRLb76KwTDe9e/7/iJDNDGRw
 Ja5AXy8zK8DSrmQS9ZcKuj//QZdtuGT5J35yDOgBjk5nb2r6GqyRSdQKYqYZpreJyD3nACiS1zO
 o7xz5+t02exqM6fsx7c5ToRkoIZ0F/cYctpdBQjTTvU+3wnEFPOE8md71TLoz3lZb2k9Shqs3w4
 IQIJ2gfWjRYq+7fAYeIfElR4Fv9RmbQ5g1QPowKFdUA6VSu9QqDasv72LJMYDy90/P+jFFH8tYv
 SAarb0yYczw8tEjJwmnqI7J50fc8iBf1h7OCoqAytkqWhauwBdzS4OIp87q7ynX8KaDTzwUU7HJ
 RJlpEmKCIaRf2T2rHgR7XB6Wr42syjaK1YAcGpZOzTxf92aOQumjVa4aPcrjQqwOY0p4mIAOBSu
 B+exAuLTXiS0ifBgg6qaNs3tsIj92d5U/sHA5c0Tx8Q4jJDxG/4/py0l39tzuBsTc0ZfNBT0fr+
 DypABuB+OKPvU2S42ceq3S2SBCsCfsMeKl65kyAnmjovyhQYVbOn//fgsZ40TeLDkk6UPkyRrf9
 Hy3stfKhrcEAeDg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfX+Xs4Bh0y1Qr8
 c6PUBDjGwqGGmEitIKviPPzEdRPiIB+OIP6ack/SRBYUrw75wbvLesNFN0Vj5jnUtKy0LW6hn/C
 cT2iu1bpZoVBkdOBA47sKnsBySwDwa52Qly2M69075niwycnQu8gCw5eGftlcWIilrmfw1lWgV2
 6hCboFDumaOo5NC2tlDY+uZvri6PNM9DeZhkqG0tFw9cu+iJ/UckfcCZ658lnT4/UKM8ue4HEib
 GpAcT10YUXe1pkqaOXdO/uFmmruMIg29pdKuahxjQyVe1+qz54+tdkPW1ACCSEuU3oOnDDebkpA
 YPeLm+wPy1QKVDhaQWCHZaFkpZ9jcxJGx/fHkAwge3lNlmAP15nbmyU4RFLmmwcYeQrfESi6HWH
 qw1zPbgr0/HlZNUb/Ra937tuiokZksCtVqj9SJ8A3rE9ylgeINDVoutG7kcGI1Cap1FdXMClPuq
 HE39C5NlZD6xYDBFh8A==
X-Proofpoint-ORIG-GUID: HNIdjGwsLhVyeISMlmpTNfl_7TDI7U_L
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEzMCBTYWx0ZWRfXx4jULro6LGJa
 ARVc6h2sWe1YqOwng7UIsg1gcdcciIxksUyoP3Ue0SYnvyDRywU0yKLPFOPvExaTkYnZWuIg9vC
 dnUSBsMYOBM96LbeBYqaYkvjzxH3H7g=
X-Proofpoint-GUID: HNIdjGwsLhVyeISMlmpTNfl_7TDI7U_L
X-Authority-Analysis: v=2.4 cv=f9N4wuyM c=1 sm=1 tr=0 ts=6a4ba594 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=r134EpD-t8S8Nhkp70wA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060130

The software node fw_devlink support already has its own kunit suite, but
that verifies the fwnode links in isolation. Add GPIO tests that prove
the ordering works in a real-life use-case: a GPIO consumer that
references its provider via a software node.

The first suite registers the provider's software node, adds the consumer
device first and checks that fw_devlink defers its probe until the
provider has been added and bound. The second covers the fallback:
with the provider's software node not yet registered no supplier link is
created, so the consumer probes, devm_gpiod_get() returns -EPROBE_DEFER
and the consumer only binds once the provider shows up.

While at it: the existing gpio_unbind_with_consumers() test keeps the
consumer bound while the provider goes away and then operates the orphaned
descriptor. With software nodes now being covered by fw_devlink that would
instead force-unbind the consumer along with the provider, so opt it out
by setting FWNODE_FLAG_LINKS_ADDED.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 273 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 266 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 380b68f879e55433668353bb88067d561142a5bc..fe984a283318849df26ced1c1e572734f7e154ae 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -3,6 +3,8 @@
  * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
  */
 
+#include <linux/cleanup.h>
+#include <linux/err.h>
 #include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/driver.h>
@@ -11,12 +13,16 @@
 #include <linux/notifier.h>
 #include <linux/platform_device.h>
 #include <linux/property.h>
+#include <linux/types.h>
 
+#include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
 #include <kunit/test.h>
 
 #define GPIO_TEST_PROVIDER		"gpio-test-provider"
 #define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
+#define GPIO_PROBE_ORDER_TEST_CONSUMER	"gpio-probe-order-test-consumer"
+#define GPIO_PROBE_DEFER_TEST_CONSUMER	"gpio-probe-defer-test-consumer"
 #define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
 
 static int gpio_test_provider_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -213,6 +219,249 @@ static struct kunit_suite gpio_swnode_lookup_test_suite = {
 	.test_cases = gpio_swnode_lookup_tests,
 };
 
+static void gpio_swnode_unregister_swnode(void *data)
+{
+	software_node_unregister(data);
+}
+
+struct gpio_probe_order_pdata {
+	unsigned int probe_count;
+	bool gpio_ok;
+};
+
+static const struct gpio_probe_order_pdata gpio_probe_order_pdata_template = {
+	.probe_count = 0,
+	.gpio_ok = false,
+};
+
+static int gpio_probe_order_consumer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_probe_order_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_desc *desc;
+
+	pdata->probe_count++;
+
+	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
+	if (IS_ERR(desc))
+		return PTR_ERR(desc);
+
+	pdata->gpio_ok = true;
+
+	return 0;
+}
+
+static struct platform_driver gpio_probe_order_consumer_driver = {
+	.probe = gpio_probe_order_consumer_probe,
+	.driver = {
+		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
+	},
+};
+
+/*
+ * Verify that fw_devlink orders the probe of a GPIO consumer after its
+ * provider. The consumer references the provider through a software node and
+ * is registered first. fw_devlink must defer it before its driver's probe()
+ * is ever entered, so the consumer probes exactly once - only after the
+ * provider is added and bound.
+ */
+static void gpio_swnode_probe_order(struct kunit *test)
+{
+	struct property_entry properties[2] = { };
+	struct gpio_probe_order_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct platform_device *prvd, *cons;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_probe_order_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = software_node_register(&gpio_test_provider_swnode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_add_action_or_reset(test, gpio_swnode_unregister_swnode,
+					(void *)&gpio_test_provider_swnode);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_PROBE_ORDER_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_probe_order_pdata_template,
+		.size_data = sizeof(gpio_probe_order_pdata_template),
+		.properties = properties,
+	};
+
+	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
+
+	wait_for_device_probe();
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+
+	KUNIT_ASSERT_FALSE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->probe_count, 0);
+	KUNIT_ASSERT_FALSE(test, pdata->gpio_ok);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	prvd = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
+
+	wait_for_device_probe();
+
+	scoped_guard(device, &prvd->dev)
+		bound = device_is_bound(&prvd->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->probe_count, 1);
+	KUNIT_ASSERT_TRUE(test, pdata->gpio_ok);
+}
+
+struct gpio_probe_defer_pdata {
+	unsigned int probe_count;
+	int gpio_err;
+};
+
+static const struct gpio_probe_defer_pdata gpio_probe_defer_pdata_template = {
+	.probe_count = 0,
+	.gpio_err = 0,
+};
+
+static int gpio_probe_defer_consumer_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct gpio_probe_defer_pdata *pdata = dev_get_platdata(dev);
+	struct gpio_desc *desc;
+
+	pdata->probe_count++;
+
+	desc = devm_gpiod_get(dev, "foo", GPIOD_OUT_HIGH);
+	if (IS_ERR(desc)) {
+		pdata->gpio_err = PTR_ERR(desc);
+		return pdata->gpio_err;
+	}
+
+	pdata->gpio_err = 0;
+
+	return 0;
+}
+
+static struct platform_driver gpio_probe_defer_consumer_driver = {
+	.probe = gpio_probe_defer_consumer_probe,
+	.driver = {
+		.name = GPIO_PROBE_DEFER_TEST_CONSUMER,
+	},
+};
+
+/*
+ * Verify that a GPIO consumer referencing a provider whose software node is
+ * not registered yet, defers its probe instead of failing.
+ *
+ * The provider software node is deliberately left unregistered when the
+ * consumer is added. fw_devlink cannot resolve the reference, so it creates no
+ * supplier link and does not order the consumer - the consumer's probe() runs
+ * and reaches devm_gpiod_get(). The swnode GPIO lookup returns -ENOTCONN for a
+ * reference to an unregistered node, which gpiolib maps to -EPROBE_DEFER. Once
+ * the provider software node and device appear, the deferred consumer probes
+ * again and binds.
+ */
+static void gpio_swnode_probe_defer_on_unregistered(struct kunit *test)
+{
+	struct property_entry properties[2] = { };
+	struct gpio_probe_defer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct platform_device *prvd, *cons;
+	struct fwnode_handle *fwnode;
+	bool bound = false;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &gpio_test_provider_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	ret = kunit_platform_driver_register(test, &gpio_probe_defer_consumer_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	properties[0] = PROPERTY_ENTRY_GPIO("foo-gpios",
+					    &gpio_test_provider_swnode,
+					    0, GPIO_ACTIVE_HIGH);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_PROBE_DEFER_TEST_CONSUMER,
+		.id = PLATFORM_DEVID_NONE,
+		.data = &gpio_probe_defer_pdata_template,
+		.size_data = sizeof(gpio_probe_defer_pdata_template),
+		.properties = properties,
+	};
+
+	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
+
+	wait_for_device_probe();
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+
+	KUNIT_ASSERT_FALSE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_GT(test, pdata->probe_count, 0);
+	KUNIT_ASSERT_EQ(test, pdata->gpio_err, -EPROBE_DEFER);
+
+	fwnode = kunit_software_node_register(test, &gpio_test_provider_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = GPIO_TEST_PROVIDER,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &gpio_test_provider_swnode,
+	};
+
+	prvd = kunit_platform_device_register_full(test, &pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, prvd);
+
+	wait_for_device_probe();
+
+	scoped_guard(device, &prvd->dev)
+		bound = device_is_bound(&prvd->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	scoped_guard(device, &cons->dev)
+		bound = device_is_bound(&cons->dev);
+	KUNIT_ASSERT_TRUE(test, bound);
+
+	pdata = dev_get_platdata(&cons->dev);
+	KUNIT_ASSERT_EQ(test, pdata->gpio_err, 0);
+}
+
+static struct kunit_case gpio_swnode_probe_order_tests[] = {
+	KUNIT_CASE(gpio_swnode_probe_order),
+	KUNIT_CASE(gpio_swnode_probe_defer_on_unregistered),
+	{ }
+};
+
+static struct kunit_suite gpio_swnode_probe_order_test_suite = {
+	.name = "gpio-swnode-probe-order",
+	.test_cases = gpio_swnode_probe_order_tests,
+};
+
 static BLOCKING_NOTIFIER_HEAD(gpio_unbind_notifier);
 
 struct gpio_unbind_consumer_drvdata {
@@ -310,15 +559,24 @@ static void gpio_unbind_with_consumers(struct kunit *test)
 					    0, GPIO_ACTIVE_HIGH);
 	properties[1] = (struct property_entry){ };
 
-	pdevinfo = (struct platform_device_info){
-		.name = GPIO_UNBIND_TEST_CONSUMER,
-		.id = PLATFORM_DEVID_NONE,
-		.properties = properties,
-	};
-
-	cons = kunit_platform_device_register_full(test, &pdevinfo);
+	/*
+	 * This test deliberately keeps the consumer bound while the provider
+	 * is unregistered. fw_devlink would force-unbind the consumer before
+	 * the provider so use the FWNODE_FLAG_LINKS_ADDED flag to opt out of
+	 * it as a workaround.
+	 */
+	cons = kunit_platform_device_alloc(test, GPIO_UNBIND_TEST_CONSUMER,
+					   PLATFORM_DEVID_NONE);
 	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, cons);
 
+	ret = device_create_managed_software_node(&cons->dev, properties, NULL);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode_set_flag(dev_fwnode(&cons->dev), FWNODE_FLAG_LINKS_ADDED);
+
+	ret = kunit_platform_device_add(test, cons);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
 	wait_for_device_probe();
 	scoped_guard(device, &cons->dev)
 		bound = device_is_bound(&cons->dev);
@@ -350,6 +608,7 @@ static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
 
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
+	&gpio_swnode_probe_order_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
 );
 

-- 
2.47.3

