Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35B384D9911
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 12:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587207; cv=none; b=UtSaI9o8W0G0+Fshcf6mDKiIkrP+KIOE2gQXNJ03izqp/fLDAUrcQJxi8ZfAxx5P//PlNPPSDbhKc+6XfDVdLjG15zYVA9RqvLV4ZD8pP8xP2Nlxd++mgEay12LeY1UFQU58HJIefWDLjRpUoqztdfUCeOzgClEiDxuD0gBjnsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587207; c=relaxed/simple;
	bh=DeQzfE7uEw87FoNwrajQBxkZ/sMoxBLsCBYIPXjNSsI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ll+DQhmDoJeJsv4OteaXKHMLgpwnnRrEYL7cyLR+Zdm15JzGVMLXNqYuGBlpZcnvwvkyuFgbNew0n9faBPAUnZqSi2t2ZQfdrNUT3gHDFleWWrmioc5BSfMNyzE32+P6NjguHbwPFQjzrimxy/T8aR0hJRnjf2UKT0kQ19T2gas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TcdXeMA2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=U8w3bzQc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TcdXeMA2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="U8w3bzQc"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CBxLet129127
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 12:00:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=; b=TcdXeMA24SddLE3F
	SfH1/E+iui1tlbkeFLLtpgiUiLCtbId1GDQjdU2rJ3xECSnZkOkOXIhFkbNF5drM
	/SiB6NoYCIUE4Nv49Clxx4GLYv1fcpHhQUgjfRLhl5g+hbKskItfjdTnTS11jYZu
	OzcPRe3m4hu2A6Y08pUPeYow5P/1unahYPu7nCf1umJ/rZKdAvUJphkZq5/gPl7q
	+CMvNiX5zMQz/UJ5Tsxzta28ke9FGUy9MwUagt3H3d3ezwg44M2qFXL1ugL7TpTM
	pKZBVNINGhXHJlntJORNa3qkFfb8Y2MqUidsuOAJERTSPFYP5ZyzRjC2AdavdTis
	v7XbTg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e43tn0047-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 12:00:05 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5104b861649so161010561cf.1
        for <driver-core@lists.linux.dev>; Tue, 12 May 2026 05:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587204; x=1779192004; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=;
        b=U8w3bzQcto+LCVexD+3GqI9f4gH8fxrEWRTb78DUJmugoLFfPtcyspgO9irMb6TVRY
         zqIe1C5oK89nuVlaVNjdIQ+UUE2eLAgaPdEFdJ5RPSxlHsqSKz/SrjBcvMBDxBWxNthD
         qXRe+kpe8QzVlGAJnZ2uGsQ7bhv/DRbq9XQWhd+wfb7HSa+2K385A5zh0RiE3iyrvkVh
         xiMnRWbXblXqBIoUWeSfeLgc7400bJ2waw5zsahg1IzcH4SPlMqzMFlXbOpYb2XzflMF
         0eB0LDsZkX+RE14SoooypMh377Y68GldXAcxaSodjGVArD3QfwHtLCjtAs0ZKHpTdyR8
         A45g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587204; x=1779192004;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=34bMm2QC5D3vRxjYjMA8BCTGNq2X+nM48LZ6CVNLD7Q=;
        b=rj3AGe44/aV0lpdjeU/pDmox9E6ASBx73Tk4stLoYMFdmUnslLpIose8dKLcE4EXiL
         qvLbxfXmEjo+NuSdJmK/EIxEL+CLRuC+7op1NvUR/SUrkvAov9qRhFAQQSh5iC/hJDqY
         uHCwkxnWKmXQvlszJuDTsii/KU2mHJo68ShYGi0yojfJpjsbofmC3qae2QXC9dXwlhjB
         bv5UDWHZ38jglkrZsy93Zi7mqEfRgtujl18vCjTVksUwhscuiUeIxth5jxXcnFq9wMAK
         q8aJ97CqCrn44j+lkmyEKSCygBv7g/j/Dt7pHX9Si4/8OIQEJPCtacYU24qIlwDhbh1E
         EELw==
X-Forwarded-Encrypted: i=1; AFNElJ+j+ZE4QpiW2XbhOyF5O5Q5sm3dn7HCT525T0U8jCs9MuJsFTAj+rHZpya6QeS0TEM/cfKx3cxfpNegkg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy0nZIeKmB8QFKxrPCP9S4BwqSokPhAdj7mZ9K6ut+lrUnSq7/n
	hxfbwUKYOb7xJ94LXj0rKwlaOram+tG6LlimpDi2EvuQgfIjzZTlEnGBgS1uoke3+2oRjaYB6g9
	LBdrcDaipD95D3CuR/bW0caE1yhER9NkyuCFZ2WLnfwF/6SSrc+CEMItSioLnvHwyPQ==
X-Gm-Gg: Acq92OFvAcschTtTZ3+pmzeJpQBxdI44itoj1ybls0PWRLauKv1tXRyXJc2f8LsTqTq
	buPte8VJ9eguG7QzQB7jZve2C8i0Luq973yuf6D9Ip84T+7Cz2e1Noiv6gMmRCRr64uURzslRmD
	uw+XXQtZlUz7fbp7rM/wYJBHZ9mnISdEO4gWxRF9q/dCZCIAo42uST7USXPlurdBRWZnaSDwQfs
	U2jXWikukZk7s4vbPs3U/as+tPf3io5jSfp7+wjRGOiTevunYpZo66CXHO9MZxgHWlbiLsGi2pY
	QT3Bgol5wmBySKNNx3nkbn+/9gate6H+YtGTjPeMI7Srp0qRfnS6DXqIAH9yaEX2tCmOBVfqNDK
	OJ/aCNAQNCLuuUur5/tctFqkdVWSDfy9INCIIy3rGJND+4KBzcyI=
X-Received: by 2002:ac8:57d3:0:b0:50d:912c:c2cb with SMTP id d75a77b69052e-514d22159aemr34005431cf.42.1778587204391;
        Tue, 12 May 2026 05:00:04 -0700 (PDT)
X-Received: by 2002:ac8:57d3:0:b0:50d:912c:c2cb with SMTP id d75a77b69052e-514d22159aemr34004721cf.42.1778587203664;
        Tue, 12 May 2026 05:00:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.05.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 05:00:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:28 +0200
Subject: [PATCH v5 6/7] kunit: provide kunit_software_node_register()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-6-0035eff63812@oss.qualcomm.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3107;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=DeQzfE7uEw87FoNwrajQBxkZ/sMoxBLsCBYIPXjNSsI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYz9AUQJYLx8Gjc9Aw9y61bGXtDlL8RtTsEq
 ZrS1S1vhtuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWMwAKCRAFnS7L/zaE
 wxhHD/90KCisG8rjredY8t0hKDZvnfuJKDb5Ib1/NvR2zJgo5hYH+7sRtl3DPo+ZdBdf09AufUQ
 Y6B+WgCIiaMT77J009hTBYLY7I74tS5YrnoSmpsLeXoVTr1PqwE5OUrzYsCKQUJX56izRh6ayEn
 CcX7Olv7f140cVo6FBRP2rLpld5eTf6pSYVRXl1OMlrFt+2QUqjIYFXIi4b6pm8Jn8+pINaSrdS
 IcNeRyKb+yf0pXxNYMqWpn/HYdMMTjV0NoTu2Dz/+LNF1BKbyJgPtsQyl7JRD3RFCPMIJ7oaA1T
 UR0FISiBtF/x4Hkcxz1Mx764PbpImB6T7j3C2KK3jMpCxuKmTqZ6I9BVCebYtIpn0yY62WouzT+
 JPpGErbBgfUWIHUqdif653NyT4C4pQ837yvUsdz05uK0vhzvztBadDV9+xwe7rSUkinK5dG5WEO
 Af+gpi+zob8FyLwUgCtjs0wpHbvP/lxOBhVWAo9tULjQTHZD03dl1D344A8oHqS9yIyFOMyxOkU
 fGHnEjIfRuOM4DPXpdYUIyyFwtcfMhw0eyy0HAHfmkLACZtShOD9lj77RzE/m8u0MRgflgt+msw
 KdaBL2/2Wil0qqPX+fUjCB1+IyQtt14dw3dEVRjsVtr8CCwqwqIW0DjKz+s1R1VF8TRn96Y0EYH
 NKZMo+uDfbAxm7A==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: PSIQ1bz5C2_R0equr_S0nwWVhSUNa5C3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfXxntFey92aJ03
 IBJJ+1Ju1+HH9s3Az1JoeRKICSihjX6/X8MuYJdn246xVylmSFGsJ6gXUHsI1qka5zAVdSCQlAP
 o0yfMVzrKb/VU5KoAHnYiEEDfEEt+4nqG8IvFYejijfpDVtaTffB6u3fKiZzd7pshUbxCy29Lpi
 8PTx6tjHlHQM7IekSK/Ypw2giz/tknTuIQWV53uwN0gcTYDWhYF8pdR4Q8SSOC+8BPHIlh5I1Ru
 qbdEqa7968lXXIs+gt+LEISmrS/xQg9fSBtTfQ2IlOLfO7ZFiXPDbUegBjwS4Tbl1/MyJ6rOl+b
 RHCoR09TDZy9VYX6SUksgN4brYbhI/NQOyAPm2wuytET18M+yMw3S3TpfMJtNKXwHAJGN39eTvQ
 tDtfUXpnYv93cbw7jrv4yQb861CJi1Vnod5lU9EUxx5nAZbmAoVq/rqN2mVtNPty66BFcVF0trK
 kVKbp8kdRpkCdwm0ueQ==
X-Proofpoint-GUID: PSIQ1bz5C2_R0equr_S0nwWVhSUNa5C3
X-Authority-Analysis: v=2.4 cv=Ebn4hvmC c=1 sm=1 tr=0 ts=6a031645 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=0NWOcHYCwBz2ZqcsIPkA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120124

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

