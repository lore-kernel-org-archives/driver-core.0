Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C32B83672AB
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730371; cv=none; b=J7brrk1Xeidf9j3b2nd6xvCirVQVhCtchFViiHFeJ7s/GX2W3hQKIMIJtU30JUFr7LZjpLkXtRxn6yV0v2e4iHJz2eukHJvS+AOVpWL/sOAWW1tWMWTTGyqZ8CcN6RpSlfHoYArDf5EYPI66iOQ2lkgMZH1s6y1Xbvs5W+UCexI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730371; c=relaxed/simple;
	bh=5ZYuxtVNXiy5hSdL+C+93oIsymaS+bqU3K2XV8qrldc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=t/rywrGUIiQxe63IRHSMy/90E3+3yC4y2xaRUSdX7MmXEDWvdqrix+wFo+vZRGN9pGYo0dxPF9LmGMwY9fr/v5Bf7rdLw/g9W8PzkGmqtEmKCcW/RzaP73DlyfgCAdXpWtcNZSjzbWvpfL7Rb7wOS2By9/+XpNn6gllKwnPwidU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=faSEqvcA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ab/9IG9r; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="faSEqvcA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ab/9IG9r"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASq0p2601114
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v9u/dWN+tesK5LB6sPBgJ7HTGERuPeKrSaSRCLi4Ip0=; b=faSEqvcA+pJv8InT
	cNq0Np5SG+ld9e3NXoHgKZuYJAQWqAgyLhwTbnW9tYW30gBMndZZWhqhZF4nTMmD
	sA/VZXMutKHNHlwj+iOEv31+B/qtZdQEtZStlZXdqcbvP6+0fcBIAhYi6/aZyrRE
	ux6kzEiIs8PRtFT+d7Agvf53iYRDnqEf2rkfVVbu3ZAoVzSPvNP5tkMU8evVXvyl
	auVg3gPdTjzITd+AY1/Ua62EFAZetlcDWPJ1mLB3UvmPPSyvAbY9R/dibL1jniCa
	8euoKj5TCDyV7dMKPii0zVZIVUigA20S8cj/Yzj+XIClVf+BjpKlc8AYCv3nZc7y
	u+VP8Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8ep6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e59b0e0f4so32727885a.1
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 03:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730365; x=1783335165; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v9u/dWN+tesK5LB6sPBgJ7HTGERuPeKrSaSRCLi4Ip0=;
        b=ab/9IG9rObcuWcK466I3DdvAyaw+1CQglzm051hJFvR2khJnaep5mDiDitno52OF7V
         kkFR3MJ5nGZ9+eioofMbsYIqE27/tZ8sESyyR+oUS1muRgJggm0Vc0CZisdBJ+5I6REj
         qKgyK11oJEvXFvmWW5dEd3fdTQmf3b6ST8KinbSDyH9uZEXumYY20KO8iPUCcBTwO4Rv
         MGGQV8DRXW2Xg8Ix5Lo/jWg/Tf3B+GKnJiKdtRQMc1uhUgPleYfZqnrZE/kaKuYDeQrD
         Gow4a/IStRNDNM4mKk3O9Oaxu1At/wOFxSfgO5f++7if86FQbDoA/sFzCNHEZAH2iXnP
         Rl3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730365; x=1783335165;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v9u/dWN+tesK5LB6sPBgJ7HTGERuPeKrSaSRCLi4Ip0=;
        b=aWJLAx/Q635FVLP0kP2rJ4yibMNc38RVTwDKyWM33yz47L9it/oAQByfyGlv8+lP7T
         nf9SV77fMb529UJHkDCXH9gdDhgPDXYWQ8GGG83DjdMDgV/10m1KCr4WzT56mkDponax
         cK0SF8H470PaaMRYPWq3WFcjIXU4ZgA1LceMsE/jOb9WdFZHqZ+slEAib2LzdgN+9EbQ
         /UlJPIix9BUHMtsHQfX0IDTi/Z2vK+zX2RWz94V9N/xIppIBHkyXOzdcS2QqSUUDxw3l
         aanqhvqN58Rw2IN6T33l+p2Yj72UewJA2xhc5952jIg2yo7aFIx8BIcDjV6HQlV1MpP0
         mYiA==
X-Forwarded-Encrypted: i=1; AFNElJ/wNFpqHOd43TFp1m0qzvGxiZJCsbOvpBSaZEZs9DEnxjG+LOlEH+Fp+Sz646sk8IB3CrTkMp8y6RuMlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxi8I2r/A4HObmHFIkAGci0N+7LJDGkdBwEHtmGgBUZLv5nLfsm
	f0sju7egkl2MA1WTURFhQlXVlrn49cva7qzL8/8B8fub4BePUaSQqLcsfun7pB0Uh54UaNmlFmA
	bYaCgZyd2aHuIejk48HMARBct8Z5TWcEq5zYxPpYH/gSawogPqMhp6hJyOFixWIbOYQ==
X-Gm-Gg: AfdE7clAek9r0Bzk1IfYbRJ/DKY0eDBefY/9RGrsAOmmvz3kYYkqh5Mqt5GX2PU7/l9
	GbX84hpfQbSzrnVU7EXhJi5GsfPq9CSgtu3cLe92VcZuZlvUrUr3LjMLXB/bnixz5Hq0oLHR/g0
	abrdwlMozP1QBS+J4wxRTRB4pjuDsgiFf3yOnvvm0gvTPYOBv5icDAbODUyP+iLMn0xkyaTR/HB
	jjitBvDHOOoV68RH6r+bl6wHS1QS0bHCSBOO6wFnd6ZyCf+o1AlqjbptOxU4ONs6QlTTv+PGIvl
	TEZ4kr6qmSfCuhtnFDjtrDF8B7hSggRu5jicQmuiCoB6IJlT3ybms/DPisZL2ahttusGZ0es7A3
	Wl9s7+DI0onlv8P5qqknlG6/OZAOZ3NnE6/ZzB+hi
X-Received: by 2002:a05:620a:319e:b0:91e:e613:9cca with SMTP id af79cd13be357-9293bd3b235mr2723045985a.21.1782730364680;
        Mon, 29 Jun 2026 03:52:44 -0700 (PDT)
X-Received: by 2002:a05:620a:319e:b0:91e:e613:9cca with SMTP id af79cd13be357-9293bd3b235mr2723039085a.21.1782730364003;
        Mon, 29 Jun 2026 03:52:44 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:43 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:52:10 +0200
Subject: [PATCH 5/5] gpio: kunit: add test cases verifying swnode devlink
 support
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-swnode-fw-devlink-v1-5-b90058b41839@oss.qualcomm.com>
References: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
In-Reply-To: <20260629-swnode-fw-devlink-v1-0-b90058b41839@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11189;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5ZYuxtVNXiy5hSdL+C+93oIsymaS+bqU3K2XV8qrldc=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5w1zk+Mz9TW/IaUck8XEm8Emm5Zbx2HYxdW
 lTy/RxFo7yJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJOcAAKCRAFnS7L/zaE
 w0YKD/wK69HCHBEyql5qyIMiBAV03zmpZVLBiVBpNuqGnlNI1Nrrt5qelYc2Y6FYkKha7fc7Dod
 KdsF/0AqQ8ErbVc9bPlH3UvpN/zWsfW/MQG1J/C1xZP/SpWtC5nQAx5GmJsJF+U+X/26ghZxIZH
 qX6cLSRXr/6FUEpsgVlSKFelGh66KBm1ynyj5ucH9QGhwleslvzkNX+e2tCUbSMtm7BEXPqT5bK
 76dAwdGBlanudXWRxpPL21Il/W0Mt6ovQsKvhhSQl7B8x9iAbzey2NmwYmo8pqy6iRM1ybeI7SC
 T3WDKYhaxZIkGGp+NGVyumCoiOC7xRBIz/QeapT+yG54l8rJQtXDeVEXWbqykl5UhmUk5wym95i
 bUz0rlJ8hrdN4uswK7zAQDEl5B1zn3Dc+mbxLbqqltAffkKLj27AdUvzdNHs7pTqWlTX/wYBhS8
 WtESN3eTQFGDYb2ArC+nSw0syda0/rsTO/2a+a7JdPbOgLudnUtRJjsprMGo0D3nxnfVw2rfJJF
 Ytqi/EzwZxdmmUKMVh2TsKglbIyvjpga+hB4chpD3RvppyxpflcyUiMJj2h2QmTr8hv8we84yMJ
 DAcz8lBOqejJ7I6xc43ciYxEamcIisgeBqUUx3fJCx7e3WRNrxPfSHuIVnrcy/5IIpC6GHYgLU1
 lKI5uXazPqEd27A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX7SJjj/up1k+6
 sUJZPqg/+Perf2japacMtp+EeN96nCXvigpb9SrOrz7lQyF8LIszPtSnZNgtk3D0fo+zQ3f2tmA
 hh7vyY6ya5jpGZMo9em3wHyXBMUVGHY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX8Nis9xZM4Amd
 0LLW3gZqYq+akGxaZCKI+Hqyx6MldsmsfTbYughzwOknSn+kgwhAt7eh4DE7jxQBJrj+XRdBug0
 qS851DT1+LHvZ4zSBEiAgYK+uIpaY1xt1Oig8KVN/XvkKzB9aHUb6HN+oOxaDQXUfgAnKsjIzr/
 PoUkvw8PaqkUVK0bQl8ifaUirnn8/utS8vEPdcGbtvu3yPpS5Sp1YpN9A6Eo0x8/VB+jnvhW3Rh
 fjmZGILnTbXxdwKZwrLY/j25GWWAOPLqxfJSegA0x9r/LuQv2+cz343NapaI9KDlRFnKfC/h1JM
 Hn1Ile0Eu9kmf+xqE5Ow9faV9tp3y1szRFVo9/gg/HNobvShyg1LSHowtcJjgdESI+Pne0bkEGL
 1YUCAslo1hLwREs9abIzI7X8SVTgiiRO8R8U7EuQ5kS7SPFnL5ARfzDbD9OZt5akD1Y30sZ7qUe
 0LbMLwEMo1O2avON8Dw==
X-Proofpoint-GUID: a33k8BaFwMaZCc6Mi7du3j2j22XmFEix
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a424e7d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=L6j-Bhk0s3QyjTGi4sQA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: a33k8BaFwMaZCc6Mi7du3j2j22XmFEix
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290088

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
 drivers/gpio/gpiolib-kunit.c | 272 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 265 insertions(+), 7 deletions(-)

diff --git a/drivers/gpio/gpiolib-kunit.c b/drivers/gpio/gpiolib-kunit.c
index 380b68f879e55433668353bb88067d561142a5bc..3def39f11ece46557cbdf8bae8642b2ad21232f0 100644
--- a/drivers/gpio/gpiolib-kunit.c
+++ b/drivers/gpio/gpiolib-kunit.c
@@ -12,11 +12,14 @@
 #include <linux/platform_device.h>
 #include <linux/property.h>
 
+#include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
 #include <kunit/test.h>
 
 #define GPIO_TEST_PROVIDER		"gpio-test-provider"
 #define GPIO_SWNODE_TEST_CONSUMER	"gpio-swnode-test-consumer"
+#define GPIO_PROBE_ORDER_TEST_CONSUMER	"gpio-probe-order-test-consumer"
+#define GPIO_PROBE_DEFER_TEST_CONSUMER	"gpio-probe-defer-test-consumer"
 #define GPIO_UNBIND_TEST_CONSUMER	"gpio-unbind-test-consumer"
 
 static int gpio_test_provider_get_direction(struct gpio_chip *gc, unsigned int offset)
@@ -213,6 +216,251 @@ static struct kunit_suite gpio_swnode_lookup_test_suite = {
 	.test_cases = gpio_swnode_lookup_tests,
 };
 
+static void gpio_swnode_unregister_swnode(void *data)
+{
+	software_node_unregister(data);
+}
+
+struct gpio_probe_order_pdata {
+	int probe_count;
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
+	struct gpio_probe_order_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct property_entry properties[2];
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
+	properties[1] = (struct property_entry){ };
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
+	int probe_count;
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
+	struct gpio_probe_defer_pdata *pdata;
+	struct platform_device_info pdevinfo;
+	struct property_entry properties[2];
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
+	properties[1] = (struct property_entry){ };
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
@@ -310,15 +558,24 @@ static void gpio_unbind_with_consumers(struct kunit *test)
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
@@ -350,6 +607,7 @@ static struct kunit_suite gpio_unbind_with_consumers_test_suite = {
 
 kunit_test_suites(
 	&gpio_swnode_lookup_test_suite,
+	&gpio_swnode_probe_order_test_suite,
 	&gpio_unbind_with_consumers_test_suite,
 );
 

-- 
2.47.3

