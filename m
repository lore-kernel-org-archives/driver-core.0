Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EB51364053
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782730360; cv=none; b=PkopIwmwUH4hwWLW6tsudGHW/D1jz5MHZdqncI3WqFRehKxJ3/UT95aRtSINClXIMZ4OhYRzpke7x8ZzFKh7YfDVLRulY/ssJJcJzHl3SLfvWEG3Ad+/3mU4U+yoPO4SXx9nOHRis0FVFKvjPCTuCBmeCtvOxKGRYI82NVuhxm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782730360; c=relaxed/simple;
	bh=lZbgNGsMr1suEXSQ3AyujBAwdJTKYOJyzKWDmgEJ74E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ej2mmeHWPJmO3lm7dR2Z2Nzjb61QdrQ0wYhx8GOBPtwQFJCCqPbrTj5JxRfBTYy1begb0G39vaCa+85m9ow33agf3tSOm5mLwOLLJsJpVglsHSDHvzoO4f942mAsarsi43WPDCZ57lxk4/ZCh/f6l+bNIU9bKxXtlwQwYBOaQLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ElViAz+h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ot4AHFSa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ElViAz+h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ot4AHFSa"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TAT3Ej2641405
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=; b=ElViAz+hI+q4I2AV
	oBcrYXf7Y/iTAIxg9V2VlqJqdwv7+VoCTBf2TW5dO05ntXLoDRQuvTFQvFlb8nDH
	XgvCW7hSGJlOXd0vNZaZEstdLZJE6tLD3H0f0QNYKdmw9eI6Kydyp2i6yJXbpCUP
	V7xkArJMOsxzTPPk+HKlxJ9+Dx6EUZ2E/tBy7tXTeSnyXgF7V/i863IczWcSBE/Z
	NLH3GLd9bPc1WTwdI3l9LwZuSbbQRlgbhWboQSwlXwH1QUpGlaQ1jnod4aeoPBqQ
	tnPuUIFYCc3aeX/aSPZLwteB97JyUJXNbnluL5PRi4BN20OpVC4Gb7f9SA5S0qU3
	Q8/CIw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s0kt0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 10:52:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92b41f17488so411416785a.0
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 03:52:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782730358; x=1783335158; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=;
        b=Ot4AHFSa7KPrKlhdAUtqsPY5DzcyLUtHFPDGLNSiO0ZtkUKDXxRDiLhFvjauJuyy6S
         oUqFMyHCO2i46a6/VjwtOZj3QN58/OKp25Q57Ez4PKtfzOseaemDHnoE27XMogElCgKP
         9TfMNpDqnnXZuG3mpH8xBTXbDvvC31/dPR5qwKVzkud4LPY1J0XNTUrhaQWpaEmGJgGh
         2azbxV6kNEEBPrjNaKx2PybnOtOiNTvfgK6BunSgS+KElJTMDCYSEkxNMUKT/CvcSVSV
         +EnhZxMx/56oVDqa3adQYhDEJSBpFIT1astQ2RYuhlzv6DhdwYuWLDrYGtJkjRNGFyV/
         Wnmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782730358; x=1783335158;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=8JWLLs9BtcGkliFw968AXZYd7Z9KZJ1rY3dzFwNebIQ=;
        b=e5TJj8JFBAYuU8hJafCmIdC511rY/nEkvtaqhVXfwfe5ABKH4cGEUh1+rFt7xnnpyk
         Gy6Luv8y6QUmGjtDDju8MtP/s+jPVb7cVfxScuj9mnz7sfeeZ7u5YDk1h1uX7SijTROA
         pw9fxpi7D4ABcydeMZBm5jILJEE7qvPV2rM1EBIPpVFCstJO/G9eJff3ctOubLi8pHHc
         I6ec1kHR5DrdDVNg/fZHU/c/kre/rdNrRQF+lT4Y/U/xcDScx4y85+4L8WqNx5Q8hdua
         uk2Hqr0qil+9aIWlzdn/BtDbPaWSpn9Vf86oTOTnGbKESOT6aZ5snfYKHeD7GpENgAeB
         0a5g==
X-Forwarded-Encrypted: i=1; AFNElJ+G6ZUYizQynkX9HdN3Yx2X+hcL0b3DOSBASK3Q5+ZO/fnpTAM+IKvSpofl0aQqD1iWfFTWvldqNDzNaw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyivnlgFlypcV6Gjh3As1tVknGalS+oZrd+Ylkb7ls8vsCargaf
	lGSXUwC56tswmoqN2pej+KdgTp8kZ8aZfp/gMfBemAk5fyaOzaeFntWqLeZi/F9JCDwE+oePaFM
	Yi+Q5+ze/bpPLGuRxNMlRALOO1wT09xXEqG4SHoufJ2qJ9xIrhbv9tjMzeiP7nggpZQ==
X-Gm-Gg: AfdE7cmsmhb9MOy/pbuVEtQjxfDAN30zUFlKwcxPJNaYLLHuFcd6rRgl/Czai0Np66h
	yGsPUzCT5uWgFPRBri59cb8J31gqn561Ye1Z6VZF11t4yKwlMMbW9sbOCvYeOPHOMqz4b7Oe4eP
	yn43yXJnxY1sRvinuRAYjLs8I+HPDqz8HRBwdnhaabzE3qE7kBzCUIubgCsO2QnlTsu0YjKSivj
	XCiuRQ8UyqYC/oBPwprOZNHyDGsI2oZyw7G5onFmUxM9YOdV3cHu+fcAORwh09EKtyJWN/NwIaB
	59AXJOI6nZOPvDN/+WRAti6PM15KIXPqeNIN63NY8ZLZc4CPvEnlK8psb3g/05mEfhHPXtDPQ8Q
	PTVYrDob5br+pc0T7J3/FczjqzsiBoNDpaGbOtO8a
X-Received: by 2002:a05:620a:44d4:b0:915:956a:71e3 with SMTP id af79cd13be357-926004a8459mr3564815785a.13.1782730357746;
        Mon, 29 Jun 2026 03:52:37 -0700 (PDT)
X-Received: by 2002:a05:620a:44d4:b0:915:956a:71e3 with SMTP id af79cd13be357-926004a8459mr3564810385a.13.1782730356974;
        Mon, 29 Jun 2026 03:52:36 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4726b76e6f8sm18341754f8f.13.2026.06.29.03.52.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 03:52:36 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 12:52:06 +0200
Subject: [PATCH 1/5] kunit: provide a set of fwnode-oriented helpers
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-swnode-fw-devlink-v1-1-b90058b41839@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5500;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=lZbgNGsMr1suEXSQ3AyujBAwdJTKYOJyzKWDmgEJ74E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQk5s8+0T+1rYepjw78mjOfJ7HDxeLmBF7VH0Z
 H71ylVa+QSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakJObAAKCRAFnS7L/zaE
 wyK1D/462lwu84IwHESL0dSs0hJ2NL2jtoDUPJhLurRJpvJ/TBAr1M+EJnvGrAEVJg593UIwlXs
 /dvemDRvgHfXacBumVZZDk42Gdlp29dXqcu797sviaGoLhFpPu6pgsVQ5LDxhLzWwLz+L43TOh+
 9ahkGhlmiW+ehjEEVt8aTmwNHb51pyjbvkQgXXDwWnmylILqBrT7JbsYXSTMRkoswlRW0PnCJP2
 036BoOuu9q42gkb8ytXCN8cb4fZCBmmjrmD4zRUD3arv4ukEgPyval3GboC5PlG301wZQtuC0j1
 3ofSnx8GA+l0l8Dd+p9bDDqfUvnChlsHxhpoKL+xoqiVUiWwd0Y5hfZVRRiWzVRlHS30Ln2jwQe
 ahgArzyjaAhGQNu5T5jSeq/9RhwjeudDUfjBmaHOmbhAHwJ4tLN6QSfdnTQ/OQ2/nFn3AXmsPmc
 aZ7HIOtieVGY9aRxob3G5/iGISSsAwr4GOWDeeME2+JN30j6m2WfM6c/nM25ff5BxK7IwAVMdkP
 e+BsDJbGYmwFtue25YIG/hN4TgY4WXsacRP6OiIKy/vjB9Ln6RteCFQYYRwFx6xT4zTsXlZvOQ8
 HCzHpJF6FZJlpkbkosn1lXKeH9V6yA3m4+L354JE51z1sCxZGQmqOqzp5D7Tii4KtrhaG5G5qPB
 QzYV5FP8UEdItng==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX7ZHPDZpFeRR3
 P4TvyotgDMEARn5phzFne79K5L2iTxuPRr2MwOPX8R6BcxLGrsC0K6h5flzP+valyrncRWF7TYz
 CL/9chw1cv711vIhWhhStapZ2LYkoN0=
X-Proofpoint-ORIG-GUID: _8x0kzRkpKAAh31tUEz1EzPkFm6uTUpc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA4OCBTYWx0ZWRfX97+ORg+Ov/F+
 AKofKnVVTre+CCKNYWMi1U5dnktiboMqXitwJCi5iJqodUdgY6gM16b1N979NktuoUFg8x1K2vi
 Ydp+QPUE4zV2C/UMyDpTLc4EaIt0GAPzQEPNPFfKWP6EDjabKXcO1GF+NBYyLqPV4nyCnRYobNK
 dzs1SvKkmXelAW11p7+WGCaNftWTFjZhw10hf+MgcE1rCZXDXeZ1oTXdDEI/PGMQd6apmSpDvoe
 ztEDI4NE1YzPFMzlUc1E7HbMcgRnUFhYqiunvWQgLFGWTDKQe0VON0vZWVAyP/gDOZ+Y68Twdbs
 gPfQ6oCmlQn2qW1+EtGbkmnXTmlH2rXtDGkIEzplZ7RktiGDBp8JCuvIxcTYfb4Bn5srjwhgkf9
 6KP7scuAWLPX7Z8IgdKeYmTl3QLwXeAaNxd5ikwkEI1JqkS5kCGtWG01ucLuxQMstoCvOTEs3ld
 quaIaKLq9ga1xp2Kgcg==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a424e76 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VSMHv2xdrKP6GTymTuoA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _8x0kzRkpKAAh31tUEz1EzPkFm6uTUpc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606290088

Provide three new kunit-managed helpers for test cases that need to
register/create dynamic software nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/fwnode.h |  26 +++++++++++
 lib/kunit/Makefile     |   1 +
 lib/kunit/fwnode.c     | 116 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 143 insertions(+)

diff --git a/include/kunit/fwnode.h b/include/kunit/fwnode.h
new file mode 100644
index 0000000000000000000000000000000000000000..239bc71eb5072ccead0beb51fc0882bab69c6877
--- /dev/null
+++ b/include/kunit/fwnode.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit resource management helpers for firmware nodes.
+ *
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#ifndef _KUNIT_FWNODE_H
+#define _KUNIT_FWNODE_H
+
+struct kunit;
+struct fwnode_handle;
+struct property_entry;
+struct software_node;
+
+struct fwnode_handle *
+kunit_fwnode_create_software_node(struct kunit *test,
+				  const struct property_entry *properties,
+				  const struct fwnode_handle *parent);
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *node);
+int kunit_software_node_register_node_group(struct kunit *test,
+					    const struct software_node *const *nodes);
+
+#endif /* _KUNIT_FWNODE_H */
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 2e8a6b71a2ab07a738964a7ef0f442fd53e085b1..204e02b10eba1030c6d511991fe2f6271de64603 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -11,6 +11,7 @@ kunit-objs +=				test.o \
 					attributes.o \
 					device.o \
 					platform.o \
+					fwnode.o \
 					bug.o
 
 ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
diff --git a/lib/kunit/fwnode.c b/lib/kunit/fwnode.c
new file mode 100644
index 0000000000000000000000000000000000000000..332490f07fae78e0fbf2930f9c80da0cc7dce028
--- /dev/null
+++ b/lib/kunit/fwnode.c
@@ -0,0 +1,116 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#include <kunit/fwnode.h>
+#include <kunit/test.h>
+
+#include <linux/fwnode.h>
+#include <linux/property.h>
+
+KUNIT_DEFINE_ACTION_WRAPPER(fwnode_remove_software_node_wrapper,
+			    fwnode_remove_software_node,
+			    struct fwnode_handle *);
+
+/**
+ * kunit_fwnode_create_software_node() - Create a kunit-managed software node
+ * @test: Test context
+ * @properties: Properties to use to create the new software node
+ * @parent: Parent of this software node
+ *
+ * Create a test-managed software node and return its firmware node handle.
+ * The software node is removed after the test case completes.
+ *
+ * Returns:
+ * Firmware node handle of the newly created software node or IS_ERR() on
+ * failure.
+ */
+struct fwnode_handle *
+kunit_fwnode_create_software_node(struct kunit *test,
+				  const struct property_entry *properties,
+				  const struct fwnode_handle *parent)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = fwnode_create_software_node(properties, parent);
+	if (IS_ERR(fwnode))
+		return fwnode;
+
+	ret = kunit_add_action_or_reset(test, fwnode_remove_software_node_wrapper,
+					fwnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_fwnode_create_software_node);
+
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_wrapper,
+			    software_node_unregister,
+			    const struct software_node *);
+
+/**
+ * kunit_software_node_register() - Register a kunit-managed software node
+ * @test: Test context
+ * @swnode: Software node to register
+ *
+ * Register a test-managed software node and return its firmware node handle.
+ * The software node is unregistered after the test case completes.
+ *
+ * Returns:
+ * Firmware node handle of the registered software node or IS_ERR() on failure.
+ */
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *swnode)
+{
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	ret = software_node_register(swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	fwnode = software_node_fwnode(swnode);
+	if (WARN_ON(!fwnode))
+		return ERR_PTR(-ENOENT);
+
+	ret = kunit_add_action_or_reset(test, software_node_unregister_wrapper,
+					(void *)swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register);
+
+KUNIT_DEFINE_ACTION_WRAPPER(software_node_unregister_node_group_wrapper,
+			    software_node_unregister_node_group,
+			    const struct software_node *const *);
+
+/**
+ * kunit_software_node_register_node_group() - Register a kunit-managed software node group
+ * @test: Test context
+ * @nodes: Software node group to register
+ *
+ * Register a test-managed software node group. The nodes are unregistered
+ * after the test case completes.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int kunit_software_node_register_node_group(struct kunit *test,
+					    const struct software_node *const *nodes)
+{
+	int ret;
+
+	ret = software_node_register_node_group(nodes);
+	if (ret)
+		return ret;
+
+	return kunit_add_action_or_reset(test, software_node_unregister_node_group_wrapper,
+					 (void *)nodes);
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register_node_group);

-- 
2.47.3

