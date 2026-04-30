Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 838643D904C
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:46:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535189; cv=none; b=Yu1MnwPssHU/VcMuRdZV5MTq8Mo59I90/HypAVbRf0jw2F7vfc3DZhFEYPCw8HJF4jwd65WugBmac5Q4XJDI0jK3TtFEi8ZBionY7rlMixk4UYQb6eFBbLiCWZ0GV6A4MkEkpdZYk2Rcgsu6R6fWYAa2nl4ziidvBAkJCSgvwTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535189; c=relaxed/simple;
	bh=a3kxmSehqMFl/pq1mo8hhGqnhavQ9y5hTS7eBrV7YMs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yd80B2RiQ7RWRffvkd5frwGzy28RPuIvCEt4Z/T/LmX32hksY8MzKXZkcFvAwQUWahXeNYZOXNqQdfHk5FKYkzYkBXyBMCVlAB4llE8c78k5+KAwQANiUvnE181q5/17+G3QfR2ONqgOAPegsS8jZ4ytc+X7f+e0t1Y3InDmRk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RX3fKRw4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QqM30eqw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RX3fKRw4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QqM30eqw"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U6H5xK256087
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3czt389yZj9Aogyc/90tArENXIqN03I1zI6Kzz5LCmo=; b=RX3fKRw4Ih2dCFAJ
	TSFjE+ymud8px9czwLxeuLHa/bJqXdLPQE1RIeWvRiMniWhztTCb8KGGu0+0wWpc
	cvw0C+xat1VMnkvpQt04kDdsF4UZnBtur83Z2K1SBKot5xY4eWk41bxuD8m5JWjp
	S7DIWeOWFIQRuRcUJAWEBP92b0q3H3dAqmtlBjCnx5B9ZnSsTZbXuPpb+ENop0wP
	/m6KfzP2PiBOxi5XR0EqxeZvVCKgA9CZvTSqD7CUdzWcgj80miQolkN4Ihl448/S
	l535dv5m1lSWcYue/VC5ikKY+AYgDM/uqIfraQMG7vLvbg6Z38opr7pyh7UpMAmP
	4aVydQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dun71jw96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:46:25 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50edf0245b0so11052721cf.1
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 00:46:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777535185; x=1778139985; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3czt389yZj9Aogyc/90tArENXIqN03I1zI6Kzz5LCmo=;
        b=QqM30eqwgPSceuI3iTOOiVgFWiEME3WawaBeRmE9BeQL89f5AIWh6nzY7Kej/ernrW
         LetgIsgR51Z+cwptTyOcU7w1S2w77O1JEZkvTpG6kbUGDVP7ZzhyF/0foHWHP7m30sMu
         etLEy6h+mSDF7V0DDSfC+Pg+AjcRa+Xrigq0VdLVw/viFnkFmdMb/YKHCsqjwc6EXcg3
         W24unIRDIfG+x8v5+97jdJECvKR/WT6pMyKyG5IqXUK20FMSwjfQHKYWfAiMyKyrl3zI
         1LylUmuY4RhNUPpGhNdJHuziJ17PB9YGndVIFSV9fMGZ0qG/PE/jE2t2WClXsfpAkQmi
         Xp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777535185; x=1778139985;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3czt389yZj9Aogyc/90tArENXIqN03I1zI6Kzz5LCmo=;
        b=S3x++Mm5sut6SPEXSAWeiJX58Iyk8jd2GvkhMDPncbYrG9o5DNKL9LnDFvS/pXO+WK
         MJWAKgXITWbV8PWPZexSuEQO2UkQU0kcL/NnNEGTUAUcG3dth7rQbtGmjBT8tz5oBuMJ
         NEVdqH9feqQvS3dcxzuSahvx5qi8X/gkgX9w9/H5XAnJ8K1J4VDV1dBy3YRH/msHhFZk
         /hHbYL5mztMWeBl32V2XST4k9HFVefchQyQuhsDmZJ1DPvu76VsVKt5QZz+ErNnYaXXk
         usPNXb4lha22d87KYlaiVbYriFpdQKNMzDk7XRkw62btvNnXxTyn9tv7GJPki82ZgiB1
         /zzA==
X-Forwarded-Encrypted: i=1; AFNElJ94qQUMWN8i2veY3bzUxz1Ws1rT40IXqs5VFY6+p8KBD1ZyHPD81B98WsWRygssB+48e1a3Tud9XKa+MA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwA3erKNGwqN9a8UMVyycmmsObR6/YhUrAS2YFcox2OhtszgEZz
	0fe0pb0QWRH2l71oZGeK7ODp0hGvpJr+qMYxfc6wcCo+QGFTl5V4S04LWuC37IY4kXRVOcafvV4
	TcRtfARqCsWpaemAU/4/DajZhr5JluWk7zR5exozpcj0bNQRYRXgTT6Pl8NubwSFAZw==
X-Gm-Gg: AeBDieu7nl7ERzGqeKLqyWbMJcAOEfVAbRp7uNTHMVb9HRRMvkyHEnJFaxDPfrYS4yy
	k4uW/0wzpct+2RbL0SSDOrYgqUIIdmc/wC2paSuE9sperZR7Vtcix3kphPbUy7VeevI11h9Hfy1
	KaXYn3eNRwAyEPNZTCHHMD5H8yGQfrvFt5/wLmQ3spilUNnW7Dnzz9qtga+0pzGrXfLUTfIWk4p
	qe4O4AKoohWiD6o59WZh2EaqgmsCekHSmRzKEvU42YtOXG9aPhibYn/eznjllUwfloVOmCRKC8z
	wjAkN+OSEug6iyFASgZecNJFRDXzOl04fsqlVIOT7na9Xlm5WARN43c7u2mVveCET4qbMJIKI7N
	J+aD01MJ9G+ef2zLtKu6w8p6Y5KGqTx34Bxh+QzHgvR1xel8mRIMR6gWk0NX8
X-Received: by 2002:a05:622a:5595:b0:50d:a8f5:d51f with SMTP id d75a77b69052e-5102ae7701bmr23324151cf.45.1777535184521;
        Thu, 30 Apr 2026 00:46:24 -0700 (PDT)
X-Received: by 2002:a05:622a:5595:b0:50d:a8f5:d51f with SMTP id d75a77b69052e-5102ae7701bmr23323841cf.45.1777535184070;
        Thu, 30 Apr 2026 00:46:24 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm48714825e9.6.2026.04.30.00.46.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:46:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:46:06 +0200
Subject: [PATCH v4 3/3] driver core: platform: tests: add test cases for
 correct swnode removal
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-swnode-remove-on-dev-unreg-v4-3-01574da0aed3@oss.qualcomm.com>
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
In-Reply-To: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6434;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=a3kxmSehqMFl/pq1mo8hhGqnhavQ9y5hTS7eBrV7YMs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wjHY73bjK2GzsfwhlZAW3gnvrZSLWSGNacEJ
 F5T2xhiC86JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMIxwAKCRAFnS7L/zaE
 w6cyD/4pw9gjhCEZK+OXYGHyac3qFVKRZicRWxRNHKnSo8iba+1J1vCUQ0eBCIAhQlIe+atzvJ5
 ior8nrT6ruocPz+Vl394E/heboqSatWJvKwJMjV+DS2r9EmueH5Vp+V/LQbkajMsZTM7euNrmaX
 2bwpraSaEd09EMv0u9AVNhKZCZ9TBRScNxeYdMEpt8uvL2QPSpc8FLMb3vHvjoMmcdZ1A+qiC+/
 7PvuC2hqtZz8NVcug4TUFT+KBrvvM40b2l3vnPPDtQLvUht5C6gKRDl6cXpIQXPLHn/xja5dyLG
 K9JLk4xrF9LwgRv8LTKBPGN7vS1DeO4LRj3038ebTnCDBHTXpa2C9UQUppA48QLdUNWupBdrI0l
 HP1jsg4olP77BKnKJhp0pk1HIY3lg2Mx1+xsj4fxAJcBZHCdX/wY3katxwE5sIm9E4AkWDpA3Ed
 nvXlIuWvyuveouZQJKoi+R6XC6wRJGD7gYZ2GFyDdd0gwtZMOicAwnPM7Gh1QQpG59E1fLFitq/
 6RWrrIcjYQ6COJ+HgAV4YYWGMKhd1WgXDTBXAiTTRYA46YDMGurHD/eM7/6mHBJkWk3BcUZHjxe
 fIL/2LNxCV5FvKy+i58q7YmZf15tNxwglnl6JBZa+9dghuESCvKfbCxyUi0Cvbw9euanT11mfjK
 rCiArcrQ5omfNRQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: vYD841CzlWX7E4sWCsOfZGDhIjldntt5
X-Proofpoint-ORIG-GUID: vYD841CzlWX7E4sWCsOfZGDhIjldntt5
X-Authority-Analysis: v=2.4 cv=TvHWQjXh c=1 sm=1 tr=0 ts=69f308d1 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Cjzkl-VOwT-M8rwmhL8A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3NSBTYWx0ZWRfXz+cOeBFmI1FM
 7etyfDoAJThqDk7GTAKCMQfAR68pToY2W2ilWekikEOUOZOFxomFHtY1lV9xr0PFH2TStsH+4ON
 KxHWXwWJhG1rPDCF+fq8KPH+uPWDY+bMs7GK1kVzQ0nWVEbNIPAf/dndg45L/IKdaK/jzymnEl6
 eogzGrEhSN+sqI5oexrhBV/Hk8uM7+n2iKLvV5bRGglEc907ZY04vXW+ffiYZK4D8jJVbmrjTKZ
 JfsLSbuKJVrfmIMlcicJ4VEgZzN5BDC79xKzwHc7MZMEPrJ5wUyr0Dy46ZIoaoZUBp8RfcDxtxH
 28rndn5S1upOa6IKruNLyshutj62HXcWXuhSWTrRVMAs5J/WIVMioLxUpCTje2/8BJFp9/ZAKfK
 SFSJiQC0C2QMY6hIhgfUR3LQ9f0mC7s6cfB88rSMSO9CutqhN7HDEXbtCwbDuZU5+BNjYPQ2rzM
 jQJtLjBUJa+YksqEnbA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 priorityscore=1501 impostorscore=0
 phishscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300075

Extend the kunit module for platform devices with test cases verifying
that the same software node can be added to platform devices repeatedly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/test/platform-device-test.c | 168 +++++++++++++++++++++++++++++++
 1 file changed, 168 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 6355a2231b741791b54eb78af42e13f31f745184..3e42c205fc935ab1dd2066e257d4ecf837c9ad79 100644
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
 
@@ -253,9 +256,174 @@ static struct kunit_suite platform_device_match_test_suite = {
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
+
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = fwnode,
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

