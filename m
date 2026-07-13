Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76EF0386C13
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 11:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783941310; cv=none; b=s/Sj+FxuZqaYVhFGTa125y2G0BMmnakHrHrEh2t/Ian61bSwiUWEySLmInLnYdWpcOfEFD/bQkwvSyqNuOgoPi7RUylO7pL+SBuXkGvpNVN8KUqFCRzsMseTRpMnkPoOZV3fXWjPNDEwG0Vobun13keo0jzZNGP2E+Y65k0lSGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783941310; c=relaxed/simple;
	bh=uFLoL2fvDTFtaPGJjiYzbRQ0YLyv32CJCl3JGUiomJ0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=agsIyiuLXXkT8qYFMIrSleUprqvyFnEI5XXMN4FRS5v+JANXIIttcTRYhxyK4k235yNO2wg/tT3FZdYRimlv3fhl2qMdT4OgK5FBTYP3qrehCeCGc4T5i45iAu+Gh9Y0Pu8K7lOHxp8vyxcbpkW3vvAQhC0b3Syh/3gqH7vXTTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kEA28Ldy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MlPIT/LZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kEA28Ldy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MlPIT/LZ"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D7KhKu775116
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 11:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YlTE9tG9MyDB8d3Vffq87ifEYJb3TdmU4EqBwnnxKpc=; b=kEA28LdyBQ3Ug6yo
	21hsuGc9OORE7PCXmMcOrZFD2aSRkngX/W9h4pOoQvUlB3a7NjCaxTdtf5vIPS1M
	gJKbEay9zu+k2gCx8cdEDVvHYz5rGmsbb49n+b4Ar2NU1HQUehZF2uk+e1hwYPm6
	7DJBxtYc7eFJbZZooKH2ZShrvGDx8GSaC6w5AenPzRYPS9ivCIgGsRkWgfJh4dZH
	4fkpbQKVPVwKHS88sZzHFA17x6Ekw027wHyAjgvim3Jj0Jf30Ae529nk+/d/IFWZ
	iQ/dcOSIBnuBjDob2zXQwSagUF4TX6m6vs6ToEnfmxlFP6JTfVL6rQ6Gn5C+tPn2
	xTTDGg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcuj00vbm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 11:15:06 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51bf321d786so36177131cf.1
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 04:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783941306; x=1784546106; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YlTE9tG9MyDB8d3Vffq87ifEYJb3TdmU4EqBwnnxKpc=;
        b=MlPIT/LZDksDagkObsr65tozKDsXuoBYN8/QQahirVgfHd2cJwt5t+vvNKFVtYaatV
         YTVhsIct06CeQaGmv1ayS8553pwMB+rkOs9X/lsZvYvdtS2HGAUmJgHvVQZXS0wqG7pV
         Vi1xrKbqD7HGSIt3g9GuCmUNLWQjuujLMC75Du+1LSQZ3VXyDxlfqrnEK34GGFGoeSVu
         cOjNxoe9G5TP+b5/3V1JS0UKkR0asau+22G3t+C+CFIOlrl+D0jqjZSdjWugHyidezHn
         wLpySqwAXYoPrQ81qX9/8nr768RWd911HqIq6eihiy0C+AoiD15O7d0FpqW1rMBEtGhV
         emRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783941306; x=1784546106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YlTE9tG9MyDB8d3Vffq87ifEYJb3TdmU4EqBwnnxKpc=;
        b=F5dz67HF8PFEVem8NJnJzj2T/4tOblPHUWx6JwrH0k88B1XuFlnKEZEFNrw7JgYHYk
         sHjfoKbfM4ENfgxErCXP2obX+i+lO4stKkzQ5LPcBZWY8nQhX8+RSVcmxkgji4jIgkQR
         HKl6o20zXQgnAWEucacWHWimgnhyKiRonp3Mxr0GJmYcuF8jSRZDG6ruyWm7BhaOlE8k
         mIK0thLX9SfwczIgBvXeeRjrCpQNSgdM0bXvMYjR3CiD37XVtph89OGPzWeNNJKq8EGb
         U9HW+lCKTR1YEx071zLjqqG6lsQmzaT2Ut0ChW93mhtIwm4qd6B/HtLggbXyb4HaOjhP
         onFw==
X-Forwarded-Encrypted: i=1; AHgh+Rrh/t/0ZpJCpz1dPSufCehJ7PLqYfCUBL16Nx+8mdTH15Rb/swkoQ5Joy5k3yqccZ581OZRdQsrntSaKw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyGZ8a+tCaPU5sm9yr15w1SJJvahE0fMMNtfnaJtt2AH+sH5OKw
	SgwB1+jkef4rAzAy3SKpgRuhWsZYyI5GDxYb//L1uiwFdkeUuh87U5ZyGrDhlcDDp4XftQLk4HU
	mEp+XWyZr3rSvHCtf9KqmhQaKaXwnZEYCtU6TqbZU5i9IDBVA6NCQ0WPVqKd/T1Xvug==
X-Gm-Gg: AfdE7ckxXeNJoxhDx0Jl6Eeq4wej+XCIfIa0vd4TE3qJktp5nULtXybWoCl/7nPXsNK
	N2lDXq6H42604sC84iTjlvMsqLm4vpczunC5ZfmjXVPRhM1gmVvyDDAPv7GhUUrGQ/71yPW+iHR
	ckSaeQZGEkOdKx/8O6Rc598Nm+RVh9DElWHl7aE99plsXtp6Kgx46y6mXtBy18QBnzjvAiENKH/
	cQh4XfPfZf/qY7SRaU77hHQy7aiayBRa1MU5riBHD2D+mBA2OGlaZwmASpgo6rzgntQEZAQozCc
	BX8VwSFhU8YgoaJbyNIknZf8CieFvT5KvZ3flLlvKU0vluqfEwqNWJbfw0Se8HcNKoqzlfc4pA2
	7vVmwGNLAdtijpQHPbO3w/lmEt2WZLH+zHn9h/ilM
X-Received: by 2002:ac8:7d0d:0:b0:51c:140c:6893 with SMTP id d75a77b69052e-51cbf058eb2mr82898351cf.11.1783941305952;
        Mon, 13 Jul 2026 04:15:05 -0700 (PDT)
X-Received: by 2002:ac8:7d0d:0:b0:51c:140c:6893 with SMTP id d75a77b69052e-51cbf058eb2mr82897921cf.11.1783941305455;
        Mon, 13 Jul 2026 04:15:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0f214d2sm82323160f8f.33.2026.07.13.04.15.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:15:03 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 13:14:44 +0200
Subject: [PATCH v4 1/5] kunit: provide a set of fwnode-oriented helpers
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-fw-devlink-v4-1-d4f2dee27ad9@oss.qualcomm.com>
References: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
In-Reply-To: <20260713-swnode-fw-devlink-v4-0-d4f2dee27ad9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6696;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uFLoL2fvDTFtaPGJjiYzbRQ0YLyv32CJCl3JGUiomJ0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVMiu+nsriE3lOF9zrRtytxUH2n+H0QN6LfRCx
 cLBlDZOkMOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalTIrgAKCRAFnS7L/zaE
 w+OxD/973xGLRGLOocJWBtz3tDcEyidl5QcoNu1o/BmJ8bmpshzd9DbKi6mUMvJ7cUXUL3hIl+0
 JhTpNCwomo8J6p9mzXG5XpRj7vt4n5gtoYG+xHLxqhJv/rwYZouzzfjgpiWQEBrkXpIpo9p4TCt
 szPq6BBhhsXssuZ+pCQTlJiCrPtqUAOGIKLglxwEX+PfI7e7ebDYsIYBxQQsdulW7WW0SuElc6N
 duy5VViezwsA73FchoFNzNe2MqXmylcMcO4ZJ5X+Lex/FLguDimknnlXQUjxbQqHpPE8gFh5nht
 Yye/mAChuLnWqw2ImH65Z36MaXsQUdeVfr4gE7nCFXmDvUMPVIfnu7m+S1+REbHzeb1rPIPucK9
 8mOfBd5Kv5yqdbnP4x5Mqqd4ceF+Q3ifP8oLJdLBaqMZR1kHhZVf5Q8qeV3QkeNrFDR5km2UfIU
 n8iOlfXAV/e3HoQoTVwkmnsm+0xfaHjQCzKjHtHLQ/gPmNUeChjcIT3evwRV8MnszkjNsswBLzx
 xZcmulKIuzxW02naVlpUZW7cjlmhZtr25cv9vSpYo0qjFNfmn+4GGc3C+Z4ONrHRIrDxQgaGSpO
 1+M2YuLUXh6DRGcplbcrF+q3cYXO2VQQ6Nx7Ip4+EvIoUHu8FlDj0w8fzi85jHvKHm9gahD0nFv
 uCDgq7HGFUdwAKw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX2ZntXyqr0L/I
 MpKVtYmrheumQ6qK38pUPqfXYC3As5BbDmo/NlLJWN6nxXWOihhSirWwwcnomVOjnJpSbWp02Wf
 JmiMatpIfB0DtcUiEREzNFZDZoukcfs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDExNyBTYWx0ZWRfX9LpN2SEgjxZp
 v7NI7HrAFrg5O7PcG9mM/5WkPYL71B10LFEYszCkj+UwO2PUXgyU4LRS4WocUCHa2d1jgzV0YDq
 xEPXDXvNSfIO8xiRsH9a3yiUfqUo/m9OyBKhjA9zWa1jg0b6zrvRQPCwXqgVCHtAaRuq7F2azzK
 RtduIdFHBIxYbHQDLHjJsQH7cTTFeiOeSH//mgp/G14/iRqXpOOl7VkyBz0WsZ42dgfq8TNaJQu
 OZ9k6FrXVyfUPK1PXG73D0GTAondkIVhZNEMRdmCHdxdH+i3QMV38410TM9a8Ghp8bv04UI4BV0
 OIHKtLhkMtVZg1c62808Yg/2S9566FsN5KLD8VakP/k0k20441HWaPfj7h2WpkOfraIrTNL2HKt
 xZwPjCJ16PqA0u6bD7wVjjKbYCq7Njo0pnEw7DqaRrMUhRgNkIpATS2M7XME3KARVPDszMQMjag
 W3/wDPKP2OHvOWeMMug==
X-Proofpoint-ORIG-GUID: Dw_pWwJItJFDG-oC7sB9-FZmMUdw9Xnj
X-Authority-Analysis: v=2.4 cv=DbcnbPtW c=1 sm=1 tr=0 ts=6a54c8ba cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=nzuXsxulAAAA:8
 a=EUspDBNiAAAA:8 a=5HYbyjZdm2YZoA3apZYA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Jn5cl5okm61iLnyvC_SE:22
X-Proofpoint-GUID: Dw_pWwJItJFDG-oC7sB9-FZmMUdw9Xnj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_02,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 phishscore=0 suspectscore=0 bulkscore=0 adultscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130117

Provide three new kunit-managed helpers for test cases that need to
register/create dynamic software nodes.

Reviewed-by: David Gow <david@davidgow.net>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/fwnode.h |  29 ++++++++++
 lib/kunit/Makefile     |   1 +
 lib/kunit/fwnode.c     | 146 +++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)

diff --git a/include/kunit/fwnode.h b/include/kunit/fwnode.h
new file mode 100644
index 0000000000000000000000000000000000000000..e250bb87e144c42b1a7e439947a224f50a253179
--- /dev/null
+++ b/include/kunit/fwnode.h
@@ -0,0 +1,29 @@
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
+struct device;
+struct fwnode_handle;
+struct kunit;
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
+int kunit_device_add_software_node(struct kunit *test, struct device *dev,
+				   const struct software_node *node);
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
index 0000000000000000000000000000000000000000..a58ce0984d76bae1072d77abc26f4cd516e487ea
--- /dev/null
+++ b/lib/kunit/fwnode.c
@@ -0,0 +1,146 @@
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
+
+KUNIT_DEFINE_ACTION_WRAPPER(device_remove_software_node_wrapper,
+			    device_remove_software_node,
+			    struct device *);
+
+/**
+ * kunit_device_add_software_node() - Assign a kunit-managed software node to a device
+ * @test: Test context
+ * @dev: Device to assign the software node for
+ * @node: The software node to assign
+ *
+ * Make @node the secondary firmware node of @dev. If @dev has no primary
+ * firmware node, @node will become the primary node. The software node will
+ * be automatically removed from @dev when the test case completes.
+ *
+ * Returns:
+ * 0 on success, negative error number on failure.
+ */
+int kunit_device_add_software_node(struct kunit *test, struct device *dev,
+				   const struct software_node *node)
+{
+	int ret;
+
+	ret = device_add_software_node(dev, node);
+	if (ret)
+		return ret;
+
+	return kunit_add_action_or_reset(test, device_remove_software_node_wrapper, dev);
+}
+EXPORT_SYMBOL_GPL(kunit_device_add_software_node);

-- 
2.47.3

