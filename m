Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6DB8274B53
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783691524; cv=none; b=l9kqgLa9ebH8T91bePj1YIEo7w4wREhTv9dIpqnpskB3TIpVL+cIvnbi6l1fTA/scAYCbWOrO63WLFY9tlKK8lkT6e1ZNRruOs3QGv3fbUO77ZkifzbU+M68IFoSEizv93HVpLM2l8VZNzyGFq6mYSiLAD/VUZ4dOKuoRpztxyA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783691524; c=relaxed/simple;
	bh=CFrdgZbVB79JRVdgy1NMnyDL7oZ1pLItVngC17HzSWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n2XuMOpGx6x1pCObqTdPLuFP3hvfx4TqPXl4x8GCSYe1ys+cYS1TAPgSle+FOmb93uVgKDZ0rueQnuPNgje7enPcqdDbMzw/+E9p8LHhcpTc887nIEEKD8jLOklqfrbJLXF+0iu/BbU9+YogZSSU433SgsLQz/0FXuoOcV5agpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BRkIObGH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Id7dS+Lh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BRkIObGH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Id7dS+Lh"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66AD6lgW730850
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KjEgunGRHSr6O/b0XycHyRTbVCGHQqSoducIqInOUVA=; b=BRkIObGHJpZ/RvTr
	tXdoYM1EKR19XU+559sJYPB2JiCfJB740ay4heYLA+HnIkcM/gPVCus0vMOYgVyP
	mxSIgwnXwpYQs3nwwUO6ilMHxABSrHsaKkSUF0KDerMPIuQhd9R3t5SfX7q5Zd8i
	grZuLy7rA5yhsJsV4BOencQq/h96kVkCWKdThCWro2Vn2TUaSrXrVYRoHyR54FW3
	agrfZUmJAgqSp1hB8yvQD9A0Qw8RIqkjQtLRvghi5rWuoGKlcPufiPOpV112e0eK
	SbU1fxW/j1k19CMM3VjhxOlgtuNhu0bM8LWJPze4T7Sz8giosVuFIaq8TGnuzTMP
	ikMvYA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4faf24vgv6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 13:52:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c0199faafso9511511cf.3
        for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 06:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783691521; x=1784296321; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KjEgunGRHSr6O/b0XycHyRTbVCGHQqSoducIqInOUVA=;
        b=Id7dS+Lhjfr6mjn8NpJIrBYwaQQRj7NVWzY8eE4gm+3SCG4bzh7diFwo6FiAtsQyEL
         Wm+o/SkpBOC+AlGS0cDq9RixglY4tvBCkGJ0Fa68x3ewUuiG5+bmpG70lbkzwKH/Lltg
         2vq0OPDQ91ywhKXWK7ZUN+ijvAAqfa2lR+5ta2YC5XJUgoJ9cUGv2Yr21j2hW5Jv+KyD
         6Mofg9Yx2yy8DSxwl0watCysmCZ9nivvcIL0rANyLOG8OA5ZRpcw4DPnUKvckva/j3L3
         50D68QvLy4jM5+jdgK0ONW/cuOxldFnm5Igtq+8NeK3/g+c7fsUlqPjCPjsks9Ydz5sw
         BUiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783691521; x=1784296321;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KjEgunGRHSr6O/b0XycHyRTbVCGHQqSoducIqInOUVA=;
        b=qxEBhw+ywYeFg4HIazKbAOFuj33MEA0z7C8Locqa5yIs4u2P9qc+VHqpcemX2aXyIa
         jzVfnfJ1yFvGWJskQkMskRFgKWzq7Ks4ir4DsUX4uzx/GMJd4NOChsmWe67EvPD5jeBR
         YUJ1njTgSyMsAU39KG2qFGGDiBvG502kz9yPJC2WxIHXXdGyt+xKD0PZFVwsxt/HlEkE
         hfRyS5iCez0Uw1Vtwz1jJ/uSh1jeZCv/3T7dmBTvqiUV57qopgyuyDHsepQAU+B07OY5
         mE6CcDMXVC/+hlALSSL13uRiYbe5YSwt5VO3w0+LyRIRin6s/1VocFuGcO+vJv31a1/E
         WK/g==
X-Forwarded-Encrypted: i=1; AHgh+RpjlYaqOmnxNfl6pghUG0OLBmi7Sy3UMde9q7uhr6B+8pILrxZTy5cW7H+VmGg1NeEfWCbIkYwGb9J2JQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywd/NkvMOreR9E4NiJs8VI7fvd7nFu7Plbecyp2pir5PzznlzKd
	C4mei3dOfV/P/OwdtiXpuj6c1A0qWZ1nIwT7I6+aj5f6Q4s3OYEscpCq/RyE9Hq8IvBKxGe3mrG
	NkYcHCAW7CmLZkGAI734SkR6of402B2T+KBGLtV8PZiDhreFys7XRb0+E2i3UJPnN3g==
X-Gm-Gg: AfdE7cn8N6++M2TqBbqophT2ACAoLg4srGoXHz0zKXCDYLVVsjDv8Em/ayDMN4R1aLJ
	FG4FMirm3ZGRzM/dlzw+BZAsw/5rnfKyZ52KYjtD0zpWdeRIkuZNFG5M7WjrKlOIAfeaMwv1p+s
	ex67mT02Kt2rCG5LazgfyxoDy5XQWC20Bsv+T2wHVV4/0PX5lByZOz6ZihygAw29J4McA7jQ3U6
	/e8EmNFrEoS7TXt6UiMPSqoFvd7TX8w8DaPOJR4n7N3lYtKMZxvv9bMRiXS17mjpwhorQnNT/+E
	gvGfWy0N3f+VT9QjrdGHLQUCeQWWL2EziYp0ggqJUke8AsJtQNdYO8Ynykt0SSpR5s5E3V2/J8D
	UDYdVCp7RYlqkOezSTl0eGzyTExgEVbSg/wdQDPHX
X-Received: by 2002:a05:622a:94d:20b0:51c:8dee:964e with SMTP id d75a77b69052e-51c8dee99c0mr79277701cf.57.1783691520991;
        Fri, 10 Jul 2026 06:52:00 -0700 (PDT)
X-Received: by 2002:a05:622a:94d:20b0:51c:8dee:964e with SMTP id d75a77b69052e-51c8dee99c0mr79277411cf.57.1783691520473;
        Fri, 10 Jul 2026 06:52:00 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:adb6:d740:6427:4097])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb670a41sm135669295e9.0.2026.07.10.06.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jul 2026 06:51:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 10 Jul 2026 15:51:24 +0200
Subject: [PATCH v3 5/5] gpio: kunit: add test cases verifying swnode
 devlink support
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260710-swnode-fw-devlink-v3-5-993f31874e40@oss.qualcomm.com>
References: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
In-Reply-To: <20260710-swnode-fw-devlink-v3-0-993f31874e40@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11893;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=CFrdgZbVB79JRVdgy1NMnyDL7oZ1pLItVngC17HzSWg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqUPjvL2HjJuGt7YLd4fcBkX1g9NoN6biwfYpp9
 gtdKaCEhMaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalD47wAKCRAFnS7L/zaE
 w/TVEACkrSG5GWFakHjwZcx76ywa5Daf3KasZhOxBAU5ZkO3p791QFyumsb04oSzWDJaPZUhtkj
 azES/YungvYC+wldy6E+6Szv2zFDSpp1cNeatSo8XWPHeueP6Jqg4/FvRAJYd52TJcxV7VRuLWP
 XBsVLNJIJdmuPTLimmZ4IA81DGDXlSvk3F1rJxuPMfGxjSgrn86VyVNzIu04KCTdW3rDatSGvio
 1OCg9FoK5J/H2ao00hJKCENlYMs5IgpN5BpQJ58/ZKQrR1rEgQHN3T/3FCiwyhLlqEqmUkfze96
 jqY/bD7GY4ipoIsxTzIXXnUkjTgbiqHe4uVoeGuLUxSUT28CTdkoJCpeCiBX0Co7MEYkoLcY0Xk
 4gRzDm158P9RG10sm6/CXOchX4b4JW5QGJ+89zymKWwsXx4aKZHv+28WsRqOcr7GojfbS6sEpm1
 R7tqzouAUbisPevad8Ahb6f7lIdvR4PKETIMCMw9xHA6qYDe2b1yyDXU/bOlKUQWDqSd4sZoa33
 pkhyRYa4VcWRNMFZXkhc8MgobBjahV+4MSJVo2phldSJ8+6hCtpf+PE2f0BjwBPN2Eni3T3zKPI
 oRbIsZE9gVjhtkamEx7pvmq8fO6tKPxWylgusHdqgv/8werkOPDo+4nQH6EjPjuc17Ah64Kk+uU
 0/qvcyzS6J+/F3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: jolMoYDL4YI0RATi8XhxDvgefT56Y8Bc
X-Proofpoint-ORIG-GUID: jolMoYDL4YI0RATi8XhxDvgefT56Y8Bc
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfX/6WKsmr3z69C
 3wcDPBSSgGkb9u6XN/B0V6R1GRbp1ZwFdv1yVHhXrsTB0Nv6BUdGFw//n3YnIe+L534ECJUfqzp
 lQtTDSp+7vOfJ0UJ+qRLIkVyKNWmj68=
X-Authority-Analysis: v=2.4 cv=daKwG3Xe c=1 sm=1 tr=0 ts=6a50f901 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=r134EpD-t8S8Nhkp70wA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEwMDEzNiBTYWx0ZWRfXy3aDcNzrCySh
 zjrytGEXRa8HsUtF1sSNH5jasjTrdNDDLmcwiWRUrhWDAA+upKGwQxOAkIvs1uDBbfts4lqeerL
 QV0er8jhgyUvARffzY+yc6HJpRuV6PvpVcxC9fl3ftNpbXTHUzoOssNZxiLv74ffWgAP5xa8Z/k
 GBuUN8wZW8lm+CRDr80+ETmTJ5/g5/vswdrJhd5tPBnfRMEr+SYGSeQSZz+kNXwmN1IvuJMnIXh
 7IMTx9OPonUPaK8C3bvlB3nepEw1YUZ46xpsRrgawQLAmBzZe23p4QG2jlV+/vsS0c9TXXcH/dm
 H7j7ShAHGl/6OiSFUPP7ql+PCgli8yyLP1eYm9dDxfizyYZHd35Y5Ehc9VubgevMHAkcRhlKrZe
 CKJiReXhFyn+k/Hvw3MxNWfguuwm5ZBa0mTHetnvafPsRzfXUlHkHy3WAqr7FIJQuf5KFcEg3cC
 jMUkVQ8YRYtypftJckQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-10_03,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 malwarescore=0 priorityscore=1501 bulkscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607100136

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

Acked-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-kunit.c | 286 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 279 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 380b68f879e55433668353bb88067d561142a5bc..ad961cf97aee7b1b6e3fb64c9f5d52be25486253 100644
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
@@ -213,6 +219,262 @@ static struct kunit_suite gpio_swnode_lookup_test_suite = {
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
+static int gpio_swnode_probe_order_test_init(struct kunit *test)
+{
+	/*
+	 * A prior test may have left a managed device link teardown queued on
+	 * the device_link_mq. Flush it so that software_node_register()
+	 * doesn't spuriously see the node as registered and fail with -EEXIST.
+	 */
+	device_link_wait_removal();
+
+	return 0;
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
+	.init = gpio_swnode_probe_order_test_init,
+};
+
 static BLOCKING_NOTIFIER_HEAD(gpio_unbind_notifier);
 
 struct gpio_unbind_consumer_drvdata {
@@ -310,15 +572,24 @@ static void gpio_unbind_with_consumers(struct kunit *test)
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
@@ -350,6 +621,7 @@ static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
 
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
+	&gpio_swnode_probe_order_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
 );
 

-- 
2.47.3

