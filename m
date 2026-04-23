Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B20A38B142
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776946349; cv=none; b=IqIeOgNZyEfvPwqRMNso+G81J11duB726RlX2YROD41dgSlZE3+m02UfPTpPPLODALO/sPX6K5ALdpbQdAbz1EGnPItxQAynl/jfvWEiCYijtuSI/Cqu8CBMQMumjNrjDfJXa7ah3IxnwNqzPcOP13/GoBCY3KDyLV/g+T951P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776946349; c=relaxed/simple;
	bh=SlQMI8IRV7H1W+0eRMmQQFi9awkSEWmQRb6390DKD64=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pSlCg0MDi/y3KGnWq+/8xnrszPzqds+/jrYDyrjPKf91xTZFxNbWEx9qznklLHKZ1OmPLIK7r5IOBugYfbJnlWmMSBMhGEVaVcMYqMgX0vFX+fQZ+CY0iABmSROy/B0oK1dasjla6cK5a6SVjomucA8EYuqVjK9Ar9+E5BrgVPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gu/juZfg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NeXZJ69w; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gu/juZfg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NeXZJ69w"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N8uNOI1565810
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 12:12:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JC0K8TJYemUka3ukcc1xuIUxIRphSxLm0aw3i2Lpe9o=; b=Gu/juZfg9DW6wQ53
	LoOzGqs7uExgdk74DDKx0DAm8MIH/AvFpR4pJGYFQVSftrjkb3zcrNpQQMEY1ewy
	6m/s0Q//ZkPD/yrsV2anqkQziSqAkqxnyc2BSAzsKB4IhkhM1r95Grx60Ue81jab
	xkimBeZww6MO/w1I5LWRpJPwiZwgdrRz00qH5ByedVFzlqejrmnN1mlVsOvmJ8Tg
	4IQrvG1Bq+3yD0aUoYwQs+5kqastSVu2JpANt9quv27YZUV3TQ7fteIeW+k4qZwn
	eQdT4UYxo/1o8+hVuFuk2EXhz/mGSJfCOtp2ZvuZP0WEClhNmetrfswRVpQquHpJ
	gWLS3A==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dq16wuxwf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 12:12:25 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50d826ed6f9so60795371cf.1
        for <driver-core@lists.linux.dev>; Thu, 23 Apr 2026 05:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776946345; x=1777551145; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JC0K8TJYemUka3ukcc1xuIUxIRphSxLm0aw3i2Lpe9o=;
        b=NeXZJ69woYTnRIw7YRWCNBkfhmTmgbhcuic0EX3QerH4lzJE1ItsHO/ssLJ/O7Nj/v
         eHDz9OKhRqlI2YObLZebYmpk8rSKCEsYu+47M3OX4OIFBxI4xC2zGqigojxS5+Ly+HWl
         21SmA0SdYy17+tycTxV/+gBfdtJDqbQnlYVrQGwPlIVz5Jq0mUrZ7uQxlat6WmsIt4La
         PrOl7MQ8WvAiwJUSywUkwFHONOELU0ZkxXJ1qX/68LVWBohl+9/cnh99MEGg3XONKio2
         m+flW2Z7mDJhTDM1xHRfKl3l18EK+ZngCpt1h2DkENwiCtj5jxfgO3XyOExyl3cWWmCd
         oJyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776946345; x=1777551145;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JC0K8TJYemUka3ukcc1xuIUxIRphSxLm0aw3i2Lpe9o=;
        b=j08IWGB71YFUFGj++HzRWnpMP41ecaJ5uj3wMZS1KYbuqO71FjRV1niUWwPVApr/BH
         QEKZp8Ft4sYMhUeZJTGxu5kJwkrA5bU8zi13sBMECvo1jZ+IBEK5lpoILQrET3sgi+pq
         UXPK58ctzh/H4upaWzY4QBI+3qPQk7zkXEF4gGRawuGT6rq3DAghj6DZX05zYpeemoJy
         1hA3Pdj/eiRJ2e8g9mnyQ/CEFLWPoy1Ky1fHsrstEJgWb+9mylO/NZTQeuxt9ULunF4o
         sy2JEDOE6Bre7nHI5/v1YA3Btjmc+CPEcP9DZmRBYuwj+t/oJcbKPatI314qogKYj4Om
         UXJg==
X-Forwarded-Encrypted: i=1; AFNElJ9tOZTFNNhs13+loib5i4+Fw7hIti4dj9bjE1rHfojxKnEoMYv61oMXNg9ils0Dh8pEP3QFu5q/59DXXQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YycNhC3MgeCJj7k38MkEjN5XiXbx/s7R66ngMPkvkuSk9MzsEHu
	lpoiNye5EQs+Ph1AAM/l0vDNU0EVm7C58hnKm3uf/kesNQ1QWFxdgY3oQ9MYRjOL/dzvTZwCFLC
	QzKcIkGMSzxJSZyu9MxaJMEFLMUrJ73YcryGLtSDDI2h7COOZIe1l/hOD9a5NjovmDw==
X-Gm-Gg: AeBDietxpnCltOIBAHe5XC5xIgdnV/M08K0yVon4eeEohPa1vsmzRdrYGlddY7PFvxw
	0Oq/A+Mq1R+RKGJtYQnq+I8PkJTGCE9n0ab74Wi0bcu+pkgbgx5Gn2mjPTh33VE7f+TckwXyH+7
	h57D0bEMBvPgnTv0dej4emGIhT4V4wef43dhMdKL32mYSPCcOut+DcoWX2VSP646yA7p+f8XaEu
	yTC9/tAH9lp4rbBoub/urevP9jXlJNPPDTxJI8ma/pgyg30mpudZFBDpfwQEGrnCvcnB5QLAzQN
	mClOqT6ZfOpGWOpIVOrC2XxffuzTZDsf6kFXfj0sDqwatJ+AO3IBlS5AWWhOskXfO5ss6X1/LxK
	f7++EKPRWYgbv6hTus9THP453SDvu4htWC4oLDiNc9KFIu+tyrJmYh/8laYcIhQ==
X-Received: by 2002:ac8:5f4d:0:b0:50f:6e68:d71a with SMTP id d75a77b69052e-50f6e68e71dmr189569111cf.28.1776946345088;
        Thu, 23 Apr 2026 05:12:25 -0700 (PDT)
X-Received: by 2002:ac8:5f4d:0:b0:50f:6e68:d71a with SMTP id d75a77b69052e-50f6e68e71dmr189568441cf.28.1776946344662;
        Thu, 23 Apr 2026 05:12:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:843a:1e93:1fb7:5d86])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a4b329542sm426273565e9.3.2026.04.23.05.12.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 05:12:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 23 Apr 2026 14:12:04 +0200
Subject: [PATCH v2 3/3] driver core: platform: tests: add test cases for
 correct swnode removal
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-swnode-remove-on-dev-unreg-v2-3-0e5213cde2ed@oss.qualcomm.com>
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
In-Reply-To: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4529;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SlQMI8IRV7H1W+0eRMmQQFi9awkSEWmQRb6390DKD64=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp6gyeqxuM5PCbhczHEbe4WKT5eqDgjzg6iDDXO
 4wUQzoCmrKJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaeoMngAKCRAFnS7L/zaE
 w/rlD/wL0If/GvdO1tv7cFZZI8IjImnBBeu5lMLRndVe/71H/5EmyKWMbOhP3vISG/F0wJqdewG
 9s1OateVJTbflrHbQ09U0ZfIF9AQMVJuXQF3/aGK0r2wGN1X2iFjNVoa9GND3t9h01lD7T4SkWS
 o9w30ommUJ0m0kC0Ub9RSBJv8AThLvzN8l5rXRmivTlg5yD4+rcFxZ2oQfQdxwybtfn5LmYOEw+
 SdtHFykWabbT7TkD5/0oC5wJtcrbS0Ba3ybWHd/gMkym6f8Csr6+UcXcKRxVRLdlX3iNTTyzaTC
 /4qmSssPiLOAB9qCf96GA2rvw88ZEbsYAyfHXA3Yy5C341oixHJ0FN6ZFtiPYTXg9gxqVTOyLtf
 EVezTRz5BEWYEThJodsG6XApGKy0xYB/9cMxSSyMIK33i1jhVuRcCxPYcuEjrf73qgA/gO81+9/
 1reSEhFVPzghc4d5zI11tmRYyUdlaTF+w5rt0HgLAdiLaSpIN0VOrmWFaBHrACYZReLJCCPUxHW
 s2GRRQ1nqamD24o+62NwQaruMLKPiBvJHeqjfifQFFitkoGTX/p71vj/QeQsVJeNaJ/gBMJnFGp
 YjyyVbmyZWk5sXld6rMek9TGkX+aCl3R4mI+KUIzPM+lLocPrnrAPs3hR+I1y3JMIVZ4F4MSMhs
 XCcGSjzvHKedJYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDEyMSBTYWx0ZWRfX2IHHhz6Ra/jS
 3t2FXVJozmYLiyMBv5jtoNDEYR1936zaQX2FFmX93gIoQ6B3z9Jno04pP6ezPVGcIXKsc08Qmo1
 Jmjb9cCrfvzFfQRdkhWH2tylXrLg1BGm8Bz/oBJ2a2UEUzIbT2WjaCDDUux583OD75Ex8vmGJ6+
 4C4iLEbYHHIdsrbx8iorrmhXiMuvI4rqbehehMQMOcTYaPotsEybg97QvsOW8sK0TjHUcqrO3cV
 6SWPMfm9+BffQX0EDmhcfa2j5lib0u5O7CVfBpwMeRKdnUPiImvpnZwemkbyoCz34L9mzi+LXsz
 1LCiHDCFD1dbdlBnhrRIKdH/0Ne9ZM9rG7l4ZIhmsbI1uFx2xFcMPUPgH38iHC/iU0SffdT8EPL
 eXyW5nMgTN/NJykcRkYpRSqIehfQa15eiTrdhRYko+yzJsH14tbTKtHa0e1MBudEW0O/BQ6vNR9
 EVzi8VMTpfauA2tSz2A==
X-Authority-Analysis: v=2.4 cv=dL+WXuZb c=1 sm=1 tr=0 ts=69ea0ca9 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=nEOnLqI-ckDzOwT8s0oA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: _Xy2UR7UL8EbWMG5l2woX9JP8Pxn2o4m
X-Proofpoint-ORIG-GUID: _Xy2UR7UL8EbWMG5l2woX9JP8Pxn2o4m
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 adultscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604230121

Extend the kunit module for platform devices with test cases verifying
that the same software node can be added to platform devices repeatedly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/test/platform-device-test.c | 106 +++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 6355a2231b741791b54eb78af42e13f31f745184..4b23f0d7f88548c62c49801fcee0919915e6e153 100644
--- a/drivers/base/test/platform-device-test.c
+++ b/drivers/base/test/platform-device-test.c
@@ -1,12 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <kunit/fwnode.h>
 #include <kunit/platform_device.h>
 #include <kunit/resource.h>
 
 #include <linux/device.h>
 #include <linux/device/bus.h>
+#include <linux/fwnode.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define DEVICE_NAME "test"
 
@@ -253,9 +256,112 @@ static struct kunit_suite platform_device_match_test_suite = {
 	.test_cases = platform_device_match_tests,
 };
 
+static int platform_device_swnode_test_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver platform_swnode_test_driver = {
+	.probe = platform_device_swnode_test_probe,
+	.driver = {
+		.name = DEVICE_NAME,
+	},
+};
+
+static const struct software_node platform_device_test_swnode = { };
+
+/*
+ * Check that reusing a software node works correctly. If the call to
+ * platform_device_register_full() fails after adding the secondary firmware
+ * node, the software node must be unregistered in the device's release()
+ * callback or the subsequent call to platform_device_register_full() will fail
+ * with -EBUSY due to the software node aleady having been registered.
+ */
+static void platform_device_swnode_add_twice(struct kunit *test)
+{
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle fwnode;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode_init(&fwnode, NULL);
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = &fwnode,
+		.swnode = &platform_device_test_swnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
+
+	platform_device_unregister(pdev);
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
+
+	platform_device_unregister(pdev);
+}
+
+/*
+ * Check that passing a software node as the primary firmware node of the
+ * platform device does not result in it being unregistered by the call to
+ * device_remove_software_node() in its release path.
+ */
+static void platform_device_swnode_as_primary(struct kunit *test)
+{
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode = kunit_software_node_register(test, &platform_device_test_swnode);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, fwnode);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
+
+	platform_device_unregister(pdev);
+
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, software_node_fwnode(&platform_device_test_swnode));
+}
+
+static struct kunit_case platform_device_swnode_tests[] = {
+	KUNIT_CASE(platform_device_swnode_add_twice),
+	KUNIT_CASE(platform_device_swnode_as_primary),
+	{}
+};
+
+static struct kunit_suite platform_device_swnode_test_suite = {
+	.name = "platform-device-swnode",
+	.test_cases = platform_device_swnode_tests,
+};
+
 kunit_test_suites(
 	&platform_device_devm_test_suite,
 	&platform_device_match_test_suite,
+	&platform_device_swnode_test_suite,
 );
 
 MODULE_DESCRIPTION("Test module for platform devices");

-- 
2.47.3

