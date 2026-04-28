Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9C703537F5
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 09:20:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368049; cv=none; b=GipVmqHsnLLwKYV7fLfGs8c30WF4Xua7PYr9ynhbg7u3lPG10TIB+WLRR/WjlAU7yhvv5BoVQNzv8wvOKXADnloMtyqAFJX6o+TEmAZOUKLRt2XNkaL01huNltPqToavbw4pXEo9Qrt5szOoCfuOq0IeEId4h0dVUUS4WLM7occ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368049; c=relaxed/simple;
	bh=T8cDYp2DNAqsSajdUoTPkvXrB2+9GR9lrfSx0ziTXnQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Xdy+wgCV75EmhEHTRaRjQA4EroiKx0C6VXUr/wM9tnBow76sp83o+vpnOhsnxCOQEcV7fqt3vAUnOgp/CzR4+tHMGB96rUqJTFxNKI85RkNo5BW0SxwDbf2S13IwTeM7Uih/kJFX3/Rbe38FupXQY2tuuIjyYawnsTAALZV71Bc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iGlAvFBw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krvICtQv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iGlAvFBw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krvICtQv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S6lTlX1624769
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 09:20:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p8vfhMIPFT/sWGZjm7l26HgyrbyRR4i+eno24bHq3b4=; b=iGlAvFBwKsx2g8SM
	bLBvtLP2mtu2ixoHUpUxDHk8Mnme4jXi1SJqbh+yJ9O6tCF4oyDmpPKHylIb2l1d
	oeL7gRtBGQtVcmXYnPG+iOEy6uccnbPjZYk15dm10Wn5GvUM7UnfMeqaGQIxW8t0
	944vwqGoc+BB8pIb+aEXAMnmP6QSi2g3ldh3ZdcCBWChIMC7EbfpIAhmL53j38zc
	OCDKbxMO2xsTfJrV9W03xBV1371xVP4I2fDYt5NFXB1y9lYAyUhJoemVenckwe69
	L0NKSysLPz9VItP8n6ZsQpBRDIY4zGRJ7GwCDk5Xe8l9fPV+GUebdG9d1Wq/afsl
	Y7nljw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtgmsa79u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 09:20:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50faf1ecd1dso232017681cf.1
        for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 02:20:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368046; x=1777972846; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p8vfhMIPFT/sWGZjm7l26HgyrbyRR4i+eno24bHq3b4=;
        b=krvICtQvx2WwFQRm9wNcO+JzvGXUFQFOQnl/JKZWrgzqRCTQle2AOmK2O1DdKVzQb5
         F+vuvft7x4vDe+Qsm5qr4XTnUSXx3ZJTJA/jWp7uXnC9C4KTCNE+uW7MpjAflw87RtO/
         ZpXMZd9q0fH1cgPe4u4gpzgwI1yl5aDzCgWegZOKjecPgYIz2NUUt9+SGA1IoKAVYSU7
         p/VIYGzjYhhCSj/cRP2kpvvWkXsrMy1xOnzIw443rucd3a5gzKO/7sz2AW57Rjjmz/Zm
         LspbA3SViHam3RaLnSL3WQPUYF0mFkEQL4gw950zTfBH/QY/0WdoqMrRunMwNECw2WuF
         dpfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368046; x=1777972846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p8vfhMIPFT/sWGZjm7l26HgyrbyRR4i+eno24bHq3b4=;
        b=iHRldL1EXVVrw90O/i/1DRnCNEKqHPmeELb0/RUDlfwDQOVIhQ5ExCkO86jktoGGDU
         zPjjeYqdesKUgUXjWPu8bZ8YEnihpdycNsuif7K45L1T+5sUd9EJve/DGDL/ZMGYwOeM
         3wxR9OJS4YgDkLpSNsCboJg9M9jOkJDRyA2aQ2bHs3DoGwv4D22kxIpKdbPqblETN3l4
         ectANnY30Boiw+FVQtMtbXfinVHhQMdupVdJ6b6tDVm9HQMeY/YCyvf3B6nYSKOsExt7
         9ma0prqSSpJfKZPAEOL8r0VhQtMhR6tPbQCUYKYXbmGTVoiaNcONDAiGEn6VFnUGnu19
         7Cpw==
X-Forwarded-Encrypted: i=1; AFNElJ/mYGESP3Gg1K5hWldAMmDtQumGZbeSfko0rHGhdAtfOrn4Ewi5mN2ieTnyKFwYOsIROEveh1DZn5IErg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzxw6awVMh1ZHhSpPSdzWNlQb33DHZwZUEJEdDF4kf34qKC7QMG
	ChJ868edhdxU0FpJRtgUFJ8s0cA9hmjIRvZdbtjUvyB6ax3JLBS5aF6XtJaG4LCWLWrxLpEjBOO
	MxaPa5ftkz58BdWOdnR+zpa6/tt9dqa1DH6bJSJCZ3qjhX8hE84EXfBEPSDa/4bcGaw==
X-Gm-Gg: AeBDievDwbi7KxRl9husmB7RDEEdzrNbicujIRSGo/kTu1mZMidvtEWEsC97lrbFC5B
	/7U2KpClYq1MmZI/whSRWKILCjo36ukaI8iFtDXZlPQ1Mc+6PmWVZvRd6CfEuekfnUrNaiYn/i7
	k/Eh1gI386cfajKu5OXOvFJdFuSZBLJb1XVHeet04guk4/VVU0qujE5/Tju14ViadG6ESckFdhI
	u4QCv0zslESlJ7JfJ8ahTa7zjZmOQR8/9EpYQ0e28rv4i1Yd8R0FqvOO2BZQGshGJOta8G5cjBt
	RDeAhoYInjU36VK3iDyXcZUcZCBCtZiY3qBUuCjguElepCrO2WyM90nZXmeXoBs1pZkLTO0gnLf
	QGUy95d+rtD7EWKV778NVTmEMNn8XhAIQgbfsMpQyjKJzr/Si4Q6wkK234UQG
X-Received: by 2002:ac8:58d5:0:b0:50f:c5d3:a18c with SMTP id d75a77b69052e-5100e12dd9fmr27572621cf.20.1777368046065;
        Tue, 28 Apr 2026 02:20:46 -0700 (PDT)
X-Received: by 2002:ac8:58d5:0:b0:50f:c5d3:a18c with SMTP id d75a77b69052e-5100e12dd9fmr27572461cf.20.1777368045598;
        Tue, 28 Apr 2026 02:20:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7473:f19:2705:c566])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7748f236sm15726195e9.5.2026.04.28.02.20.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:20:44 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:20:28 +0200
Subject: [PATCH v3 3/3] driver core: platform: tests: add test cases for
 correct swnode removal
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-swnode-remove-on-dev-unreg-v3-3-533bdc71b22e@oss.qualcomm.com>
References: <20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com>
In-Reply-To: <20260428-swnode-remove-on-dev-unreg-v3-0-533bdc71b22e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6067;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=T8cDYp2DNAqsSajdUoTPkvXrB2+9GR9lrfSx0ziTXnQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8HvkK3aARE5v16HitWeAITYrhw1b7vUsRJWGO
 oOiPEUW1quJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafB75AAKCRAFnS7L/zaE
 wxlzD/93aEyaLYrv6CzlQiY8MU3aZm+VK+O2gnw9M1ctLlVaMh/NeWYDnJeGO1t50dAn8rOWCUh
 So7WyOHHs6Wx1UQ47NcG2eEk97qi9dPo6wV+YXShKCXnr8+/TLPdze5JCu7lASLE6dk0+by36Jl
 sP2iMDPXPpOt58ewSEGdLRMijh0PpFMy9Ji5Qnx10saLFTmz40Rrd6i0EmiCm+et3w++x6AOm7+
 PvBHm1/EN56gBrA57cSo30BW+ijrCEJCP6eFn0LDdp0zOEsINf/6e2I6T5z79Z8CBgQlMXUjQgt
 sua6Zf/qG1QmGzr+DsPnx+oq1QGwb3n3I0wGuPCzwc7pnd18X0nT9AedPfqU9avnnbHGD+WXl7A
 3sBjzyf5as9wNqJBzsZoBXn5EeWSVlYnPsKDDgAzPrAUSWaTpmyQgwzHPBXomm73B0wKa+h/TJq
 adYf1nSF1B6lVyFGKRFAJIX+BsZ+O8DFL2lRP6KFUu09A+GG5mxeSxBhURsk8KJae2xFUEPtY29
 kWMR8GC51nP4DZA3AM0JIqWa4L/50RULM6Jf4DxI3uvVRQ+xK9HRx/g82i/8NFNnhFTRcBXt5yb
 /3ugyQLekmATa2avQD5D0Rp7dcmJ9x17Bi7K3tyV2RbbUZ7TE2aRDuJSU6fVbh4LYA7M4495RpL
 jX6a0cshCbH3dOg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: cgu9M_DqGkjJVa_Cvq5oz1c-Vyo-96gS
X-Authority-Analysis: v=2.4 cv=R4gz39RX c=1 sm=1 tr=0 ts=69f07bef cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=vxuIP30iJWOd7SGqMXcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX7R8u2zX8aH7p
 CRimy3nCRo7GEgViGgNx3q3+kLihizuHrCwU7ClerUhPcCi4Khg0/z96yZi/OyZx1z5FLg2reRH
 nd0aObpCvmTeNnoNSonxxH03aaeCfOyNRj2eKzOftQJhA2oMa4MsXzgBETg7A9YWdEhdQW2MYD+
 SRQ29FKyQdEGNNlN7MhkXCwSOEmKZy7bZeOtnMOG+W4JqK4SyAqeQFJljfIWwiLURHqY8E7lQQz
 bgL18pOIoHZZmPyOfbJVaPAan+qGevlwhppCwhAFecE6lQiwER2NFPWvTJ64C2jav0BMhqX4//s
 uHnWYGTClucurfvH8ymw9Eh5y0+gx1IAlzQtGi4b6zY2qqiO5XrvZf2sTW7TZmYGMPMdVNOBLSJ
 B4YpZowiBfhrUrst6/8MDxD40ly75/V3e+S43w2AEKrPI7D/kqNYtc2GVMQIU3YZeGXkbORIJe+
 uBoleEGZdgK0JojLibg==
X-Proofpoint-ORIG-GUID: cgu9M_DqGkjJVa_Cvq5oz1c-Vyo-96gS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 impostorscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280082

Extend the kunit module for platform devices with test cases verifying
that the same software node can be added to platform devices repeatedly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/test/platform-device-test.c | 156 +++++++++++++++++++++++++++++++
 1 file changed, 156 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 6355a2231b741791b54eb78af42e13f31f745184..19b3b2ea150738877278f7e37be7ef69539147c0 100644
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
 
@@ -253,9 +256,162 @@ static struct kunit_suite platform_device_match_test_suite = {
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
+static const struct software_node platform_device_test_primary_swnode = { };
+
+/*
+ * Check that passing two software nodes to platform_device_register_full()
+ * fails.
+ */
+static void platform_device_two_swnodes(struct kunit *test)
+{
+	static const struct property_entry properties[] = {
+		PROPERTY_ENTRY_U32("foo", 42),
+		{ }
+	};
+
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
+		.swnode = &platform_device_test_swnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
+	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
+			    "Expected errno == -EINVAL, got: %pe", pdev);
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.swnode = &platform_device_test_swnode,
+		.properties = properties,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_TRUE(test, IS_ERR(pdev));
+	KUNIT_ASSERT_EQ_MSG(test, PTR_ERR(pdev), -EINVAL,
+			    "Expected errno == -EINVAL, got: %pe", pdev);
+}
+
+static struct kunit_case platform_device_swnode_tests[] = {
+	KUNIT_CASE(platform_device_swnode_add_twice),
+	KUNIT_CASE(platform_device_swnode_as_primary),
+	KUNIT_CASE(platform_device_two_swnodes),
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

