Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FC55334C27
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 09:20:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777368046; cv=none; b=mUakkbN43YIEBjdtXgVb4EpeEr7y0d8QmiPzFST7yllFfWk63Yaapu6SYm6BU813Ul0BNYsQ9sQ1ww8Sqlcxhz/bwBCYbbpGatsSSrbdoLQ+X5/TozG1CLCELcUKVoT6BwF35g3xIg1KBkCJ+6tcvhFwwHymyYoROnEcbM1O8dQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777368046; c=relaxed/simple;
	bh=DeQzfE7uEw87FoNwrajQBxkZ/sMoxBLsCBYIPXjNSsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QvXO6YYH+yorLxxTeFL151jgz4D9G83/GI2E70YZOmZPruDLREnytduDguKrSOa/fgVUHCwebUIeCF1rjQmJOj90i8c+xPPL/+wQ9XiEU7ypWHDjwZl1E85cJIt9Y69aLugEQC2wRqnbXdMCvWDvwlwpaImgVGOLZ1NKIoZs+FU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bYzgtmhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TWP6xOjG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bYzgtmhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TWP6xOjG"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63S7vq9p1744983
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 09:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=; b=bYzgtmhAlL2xOEog
	bwiRdU5d99A0r7XLhrX3j5IqFAYqa97K/RbCTFMPLDZV3kylCEwhJ3h23J/J+3ns
	Wqy4n95vc5PUYCZiha0S6cZiXzzPAQhjdYeWdPMA8DHcsJnC91VAyMU1W+qmAXbL
	qCKpufsDq3BC7q0KPJ9cWPDCj7FVMSYGcDqrFMkIRVaRbLsjx3lMCHL8EC3Ilg0S
	i5YuNllFb7wes7I9YJm6lmdIOn4WN7y3j3xrn8Dez+dv1itkY9gise/VM+wWU+OX
	WAg/mh75+fhPhIF9isR9MQd7Wv97SHcAailD9cULx1qGtg0qAj3+Fj8hl8BXrYH2
	urHanQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dtryd8apa-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 09:20:44 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e136aff17so204116551cf.3
        for <driver-core@lists.linux.dev>; Tue, 28 Apr 2026 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777368043; x=1777972843; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=;
        b=TWP6xOjG7LQD168F0GfxYe/EdGYOEYMhEKpVfKJ0nmFXGqrPt67be8m+1xkxj/YOjY
         rm676SZdothaKy4ZFwE+RIcYBqTYnrbP9zKAKeHGSmkc7O29G2ds3a0m/pESucfSJE8G
         5OFDMuuLcXwUfh9tNQafb9H11trofFBghEbGX7zcZbM8HAIoQlT7NDDje+zPyp3j/UXr
         tGCgpdeazK/jcoAkGAm4yWOl+rZcv+dv15jXBO2xskyh6XL1j04FAd8c0Q+nrpEUkFoJ
         uBJg3KwA15rDuG/jkOpe3NCpunv+PnnNUMobuqNcKaT21iu8CtkSufHYlQfEDACAqlmg
         m5VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777368043; x=1777972843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=;
        b=bZdHBvjznzYGUKuT3wOs4hMp2HzhY3H9Lye1eExpXZ8IlLC2zO0LMca0Offm6xZYsx
         9RmHy6bnc/Fp7tevKRJdwx9LKNIK06yDaBfPy2zOvwwHCVilVOOg/S4ef6qwSNPO7B3v
         ggPtM7E7MVSvQ8w6hqJ8TvRV70tQGqjkoVoSXUGdD3Ye/MN32bLcjQqjIVDm4kIBcslX
         blD/ne/1Wj8+9qU9X1B42KlUxrCEjAdySrPpTAXtoaantZ0WyG3K0DjWQ0YDCLh4Ir+W
         QBkmezRtk9RKJnHjLNB9WRk4REA24iVeCaTE9J5Ox+JwwLJJ1EPemQFg6DeJqxcoUi2i
         /Btw==
X-Forwarded-Encrypted: i=1; AFNElJ/zCEu5Ri4tnv+t6xQSovlKkj6KlVHQAgTfr1v6epIW3kNq+9RjeR+iOUqtqn+wIAZ7JmyYyW+6zDOgUQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwzlL57ZL5xV/jh9fffryNTLbJuAXxovQvMtfwGuzCc/ichGref
	m5tdbAQq//rj2K2sr0wCp2SbmSQCqjMeKtOaFQK5saBeAeIbYrOMo/7GFuvOHYfrjIkgtATax3C
	DouUQPh5TzQVxAo2pBsJnsv0dyW93eT6a4wi/wskgGYTQVycq0sjCs90pGMQlKOpBkA==
X-Gm-Gg: AeBDievcivQjJYmQsH9XK8cBwcnrixd0RnZX9Gav+3uv8n6+xHWfHgaAgylW7Rg5KNo
	BAt4P0Ea9RSYuM2urAyWaRR4x2IdlMuAUcKGG3maUnYCa9uUVdruoH8OFiYX1bczfxwdOeeAOMs
	HzadphZXRC8t2qxD01gfxO1FMP67zs/MJw02hP496j5QEbLJ25dR+KtaU2ZWzVcWzNen6pn58Kp
	1ncmVre/RxLBYKk+thhR/mXAZBUxSRxLPVsDuCh7fTEJvpU6xudW9inj00joCa54ybGlFlF4uq8
	jGCcdaX8ti+NC6RMBMDgL6HrPwpXUgrUNMfHnRaV5Ax3Cq9dQAbzT63pYQks4Hxu8qIilWktFD4
	dw/BfgC23ZJhORiT7GIS3E5dYaxkgR8k0j9sXahUBItD/zCcfKSO+wMHSMgh9
X-Received: by 2002:a05:622a:251a:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-5100e207f59mr27362241cf.59.1777368043518;
        Tue, 28 Apr 2026 02:20:43 -0700 (PDT)
X-Received: by 2002:a05:622a:251a:b0:50b:4e4e:1a20 with SMTP id d75a77b69052e-5100e207f59mr27361861cf.59.1777368043014;
        Tue, 28 Apr 2026 02:20:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:7473:f19:2705:c566])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a7748f236sm15726195e9.5.2026.04.28.02.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Apr 2026 02:20:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 11:20:27 +0200
Subject: [PATCH v3 2/3] kunit: provide kunit_software_node_register()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-swnode-remove-on-dev-unreg-v3-2-533bdc71b22e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DeQzfE7uEw87FoNwrajQBxkZ/sMoxBLsCBYIPXjNSsI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8HvjYPF7YvsnZDQyKI3cG13qVRN8CodRuRqEv
 5QGGXs/HrqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafB74wAKCRAFnS7L/zaE
 wxonD/0W3xu1ONPw5UYpM1/xd+A/8K9nawsk6xomadRBYWW1A3uvxzvEWfSZ14N7w2x+rRKQ+2b
 68a4ac24vsmx4wFXTwm3F1Ln3Un5A7nhMCRO2A65iqQ75CjOX5lWMe4lyZMIFptmev/o/1aChXi
 7bbRE0RyV+lYiG8SJ1DzLQIrle0lOPxzBolO8aOG1uBUMNqIebRg740VYJcLu2DZT90y5tpeSfF
 4/KO5u0ss2VWvjHHtRxqMY3OHCmQWvNpUZmM92vsr6NJMGtz6xglmv/KJwq2GHeUgbvIgWCY5/j
 in4ofLnaM9OoUnw39WsDvP0PPVgvTsEGOD3CD51TUDrXsrqmWQB3TP1UxrWB4NUWdGMDN4538bR
 /Bbln4CCGSIIfqwV6IJ2xUU3wV042eN6d8NTN1gmARcM1f/52hYGvjqWVNSG5GZt/5YmWEc1KYM
 vD8ixcyrnTZwJqsLFYxyjZgzuhu1tdKX9XUhhrnKI8Hz8N9boVHHyisbV1HA2lMsf8sfetp4JG1
 CVZgXDSavaYAHBlmtFIEjfIVFn7uRYN7/XFqgq5L7e25l1biS/UoLB6k1ooFivCQOomDRMcZ6wc
 IYXd+kCmkuZLXppSnpw5th/hWfyiBsXPRXXzYx+nW2mEVuoxmtH4S+v3jBbiihR7o8nXh/HOaLU
 vQeUgCsv0J2/fjA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: QuqJFvqOMixjwZD_KC0mISUm8z3Wfpy7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDA4MiBTYWx0ZWRfX03mKxtU3YUXm
 mJdWj/nLgVJO2XaDJEH6oikTXmwrBJCU4xt2Dwik+2AQTuJ9jaScC+fnK+BlW7Q3PxNjZOjQ4bu
 cFZpn9/FZGL8+UMro8b+w1DAXZjxgMcRLgRg761V8u9FZIp4l0fRdNtl+d8CegsRoplTZ5xACY7
 V6vGAR0S3vPGKcdSeYYD6atR6yPTUB9vOlbPV5bgSXKquwcu+fMTGRP1C3YDIc1gBc4ymqczA3Y
 bfj5pZe5gIGuayaHGCLHpSAoPDW1900QISeExRTUQaP1eQp4k2lIzZuXkX/qmqNjvY46i2pDu1K
 mdtbUYbMSg9y3atGpNw3at1HQbtw3tdrivXtIDCLShQbozZHKQ0U0gXzJ0YxpzePv7iFIpRXWDI
 +d3z7r+dgtu4s/9WGR36KBbm2BNNvbRO7hMDnwgwrF+oVvAU/GjYSPYP9UKbJQV5oOLqkIqJKzv
 yOwA647kVEjh8RMUt8Q==
X-Proofpoint-ORIG-GUID: QuqJFvqOMixjwZD_KC0mISUm8z3Wfpy7
X-Authority-Analysis: v=2.4 cv=cMnQdFeN c=1 sm=1 tr=0 ts=69f07bec cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0NWOcHYCwBz2ZqcsIPkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-28_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604280082

Implement a helper for registering kunit test-managed software nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/fwnode.h | 19 ++++++++++++++++++
 lib/kunit/Makefile     |  3 ++-
 lib/kunit/fwnode.c     | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/include/kunit/fwnode.h b/include/kunit/fwnode.h
new file mode 100644
index 0000000000000000000000000000000000000000..e1554ace64b8a5899aff9f4b4247e5157826a49b
--- /dev/null
+++ b/include/kunit/fwnode.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * KUnit resource management helpers firmware nodes.
+ *
+ * Copyright (C) Qualcomm Technologies, Inc. and/or its subsidiaries
+ */
+
+#ifndef _KUNIT_FWNODE_H
+#define _KUNIT_FWNODE_H
+
+struct kunit;
+struct fwnode_handle;
+struct software_node;
+
+struct fwnode_handle *
+kunit_software_node_register(struct kunit *test,
+			     const struct software_node *node);
+
+#endif /* _KUNIT_FWNODE_H */
diff --git a/lib/kunit/Makefile b/lib/kunit/Makefile
index 656f1fa35abcc635e67d5b4cb1bc586b48415ac5..7549a701791b5b7eaa8e0637b6818cdfd0b655a8 100644
--- a/lib/kunit/Makefile
+++ b/lib/kunit/Makefile
@@ -10,7 +10,8 @@ kunit-objs +=				test.o \
 					executor.o \
 					attributes.o \
 					device.o \
-					platform.o
+					platform.o \
+					fwnode.o
 
 ifeq ($(CONFIG_KUNIT_DEBUGFS),y)
 kunit-objs +=				debugfs.o
diff --git a/lib/kunit/fwnode.c b/lib/kunit/fwnode.c
new file mode 100644
index 0000000000000000000000000000000000000000..bc8bf06762dd71a741a3419c1ca04028d6ad3ec8
--- /dev/null
+++ b/lib/kunit/fwnode.c
@@ -0,0 +1,52 @@
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
+static void kunit_software_node_unregister(void *data)
+{
+	const struct software_node *swnode = data;
+
+	software_node_unregister(swnode);
+}
+
+/**
+ * kunit_software_node_register() - Register a KUnit-managed software node
+ * @test: test context
+ * @swnode: Software node to register
+ *
+ * Register a test-managed software node and return its firmware node handle.
+ * The software node is unregistered after the test case completes.
+ *
+ * Return: Firmware node handle of the registered software node or IS_ERR()
+ * on failure.
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
+	ret = kunit_add_action_or_reset(test, kunit_software_node_unregister,
+					(void *)swnode);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return fwnode;
+}
+EXPORT_SYMBOL_GPL(kunit_software_node_register);

-- 
2.47.3

