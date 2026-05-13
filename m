Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A80EC48123A
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 15:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684735; cv=none; b=KZqc0veq27peoym+aTQuVD2IwsPlQ2ICzNlHtuxysoylcb6M3aCmx1sJwBpHqt2BAI/TZtj0afbjj+6+n0HcTqRYFkPCedhR8Zfp1e7WYEP7BnkD9vAbj8LJ5RMM9KtbRl8dXcfVLO08irPdRCXpEglrm+tUg9lMBA908rCzFy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684735; c=relaxed/simple;
	bh=TN3rwCiI8I0/geUE/YlaOBRn/fGhaU1EpgPqlk5aLxI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ADr5nRMrK+TbH+FYMRlvgoX+EXa9Vs89oWcHFDTLxku4AIHe/ow7rqKzBN5MjJlP3a7Do1ox4F5PnhH9Gjh7SqKFGBfjkPnEXaBUUY/zaRBBGOIyTw3Mxp3/Z2rpFh+roMPk8x4LsL9uvVR7xYNQfxCEqdvLpWqubokT/BGyVJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jo+Ul1LW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HGrztC3B; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jo+Ul1LW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HGrztC3B"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DAVOUe3430231
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 15:05:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sKKql0vh/Nr4+jL7SLsLVXl/MczXH430C80D/Yrjpr8=; b=jo+Ul1LWRR5iviyZ
	qLUx6IUh9CqgAMkRLobae3Aj0krsT7uGIoY5CzUkECDWyEZZyQUxECDJFz+4QVts
	5A9m+84/fE7PET0ZmQuetwPhPFfb21FyNCpzuljbPd2ETpf46FzRP0CBj0IXZCVI
	15WU153OC7ix1C+tCNXQStuR3VxMh8cLoMj0H6quIEuE1H0WBQSAy+g/fnULLjQu
	tOjAfSkbWpMwrNj7beT903Vawbo+RoFiNNV+LdpuD2kO+fTwFLSN+MT38NHc1D7C
	UnmNzymi6hC6lgQPRJ9/27KCvR2fnYjWclcm5G9k1Nd5dEe6PEMkX4zq5q+NKTYl
	5dQIVQ==
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4qmch1s9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 15:05:32 +0000 (GMT)
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7dbd50dee52so16008233a34.2
        for <driver-core@lists.linux.dev>; Wed, 13 May 2026 08:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684732; x=1779289532; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sKKql0vh/Nr4+jL7SLsLVXl/MczXH430C80D/Yrjpr8=;
        b=HGrztC3BmXSm0AuXi2c4PsinfkbQDTpLQf1GM7n7kIRh+S1MLgHxPX9ckgTM7pwkW/
         2VgwGY7z0UtWfC+hHM7HIhBvkCbrDarH7wLlEj8nj851hn1J+zi4/XKd3OOPH9DPht+t
         jxhs7bxNIZ1f4ZdP5hv4uv8QoXwoOTm7lBBpVjYSsWFgwTORVi1e/pblzgxilNPiyBzf
         +5RfoPt6DOijDbqi4RHqUxEsCLBwfbtGHkub4VK68AZJRGYOa36QUIRdy4iLxnqwfJ/P
         Azv7R5aa9avOaVFw3HtAXJz86jz0SAScdhXLIJeM/uhdy+z5GldoycRrNGH47QMJIe+z
         YXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684732; x=1779289532;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sKKql0vh/Nr4+jL7SLsLVXl/MczXH430C80D/Yrjpr8=;
        b=rm/dP+K9rORZr7/R/2uGPyXbqNfdU4GsAPf2jMxCfemmIU7Lj4O6WcrxoOB7uDea2c
         r3L3pcZuMjZfwqev5LMMWzssd4YLauFOFGk2MY7pg6bhQ+8Vpp6SwNFi9BFnK6YDTG5j
         Qp47IZTevWyjCoRYRQXop/0mypKkYJhvKFpq/nKvuWMmM1Ctfx24otMiTXPxL052p0+x
         vAORFlJL+zFWQanA8MqakDws/n85aDDAg3bfRyEWkYigoqk2OvW0BrPmn2HxFgrc1QXt
         Ok8J+a4ZqxLYtJjhDDPlJ5F4nM7lFspbhjTWxsGSdl5Ckb+1PRJnRGcMPbMCTAYz4JLO
         /ddw==
X-Forwarded-Encrypted: i=1; AFNElJ9FauMtUTGLG3BrSbdV1Ix3ZzX57KG3aQ7oQDBgR6XbyAJPtocdKXy8N1iF6ul2WPNHqfUOfRy7aEbdeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzCzFrB2D6P+E5+dBXNfJuDevVNtG5xYIGacwl1VpWy/TeFgrGy
	7XjPlQ5abGxxNZBAlGULP0hd3Cjgx+NoxnMc/zokoHq6VcAn2ja3edEb1SWTLKcctNjf/WToFHD
	pFK+s/tWhGl1XoCbWNksSwLz1fV6Ip9yPiwTaeSsyIQpyT+lM9WBgQanv8ybe0t71zw==
X-Gm-Gg: Acq92OG2ljgtAuhFIrAZI7SiMBK/WSImsEDIr8VU1UOCNF2dbd5GCp8r/Bp+m0AYo7p
	0mBZHUo4A6JEUhIpd+qTTIA6NwCPqx4mC63BzXBqZA2z3rJVdjoYgbncEkHlY5Po5dkg1SQXWUf
	SoHmFJbA5uuxxLVnKHYGNV3RtQ/OY51H41Y91AojlTuFBZapFraJyGRwqQcAlWF2NtUja56W1e/
	bowYj9IbSUz3ycgEZHNEmuO0VekkdQmHXvxYgf2pGLv8tpAckvCW4rlvYCvDbDk0os+n3LA47l1
	HzbN7M7+spnXidiTZvhP2w0JnZvL8KsuuiLFKzItY0Ish8OZdj2iwCeEkvZ+JlR20AqJ+tuQxGR
	i1h+tNHN31Uj5WvTzgH/jOhputMP/+HBOUhrPfuqnd2yrWp2eYA==
X-Received: by 2002:a05:6820:81cb:b0:696:1a85:5873 with SMTP id 006d021491bc7-69b78e116bamr1863284eaf.31.1778684731903;
        Wed, 13 May 2026 08:05:31 -0700 (PDT)
X-Received: by 2002:a05:6820:81cb:b0:696:1a85:5873 with SMTP id 006d021491bc7-69b78e116bamr1863208eaf.31.1778684731249;
        Wed, 13 May 2026 08:05:31 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f542e56sm43216455e9.34.2026.05.13.08.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:05:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:04:52 +0200
Subject: [PATCH v6 5/6] kunit: provide kunit_software_node_register()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-swnode-remove-on-dev-unreg-v6-5-f9c58939df27@oss.qualcomm.com>
References: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
In-Reply-To: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=TN3rwCiI8I0/geUE/YlaOBRn/fGhaU1EpgPqlk5aLxI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJMo2xq6fi/uo8K/0LGlBjhlkl317KmZZ3X2c
 J8MKavEKAOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSTKAAKCRAFnS7L/zaE
 w8hkD/9/IGJadpEJ5ke4yZkGtfmJ4R8w3TmhY6kcA40le/WTJyx80wQ+gjd5lru5gAsV0mAbnof
 XlyvWqO7ruMYDglY9A5H4F+J+nFvOMS/sUYYgt0yPaVGTicqBTBWFC6bg/VswcDXVZvsK5n1Nzz
 PCJz61LAkMZN6yu5dGlnVkv1Z9wUF+aNXja6Vvug7TQBJLWauOa/06K9pqw8z4TEyTOhg3YUc7M
 5DLMNS/QvMr7Iqq2uFkoo0s3SbwIwikDbryC2u9yF+E6+QnUWaJk52TJAWLNzXC5EZwrTrnEk3a
 CZoeQM8C9vyN+27aSWqpUvl8kSy0U+hkRb0WRYWt1T7s+0vLN193mOc3HV7/G2huwCv6+3rkdth
 kAOlFHrUFOqEpv1IhZalUWt2t1BpB8wsM+fDWUcOof6J0dknJN15mlfITcaKXciSsq+RLYuACPn
 WUfMSLBQ3qg9+ucgaiArHiS7SjMH2OkMqm66GaahYTvvgdVFbUZPHRdUSoas0OQ+k+Td7xd+EGm
 iabYBmPyPsgm75klBfAYPT9P1VJXgyZVAXfx0DrrKKc6pfbqb2ilDJHPjhlgCKKvgeTKj3DJYdA
 j7yHuEsWVjtJosH8fzkOssRL7Fk3I4zjoAYKZ0d5CKBMu6IO8I4HSyY1HM9+ZRhnj+Hagi5RQlC
 KBAl1lO+06kg5bA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: uaIlpL10kvUtVQUf9ukIdJSaSHcRBTmG
X-Authority-Analysis: v=2.4 cv=Hu5G3UTS c=1 sm=1 tr=0 ts=6a04933c cx=c_pps
 a=+3WqYijBVYhDct2f5Fivkw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=zroAqjQEQs_9sBr7nkcA:9 a=QEXdDO2ut3YA:10 a=eYe2g0i6gJ5uXG_o6N4q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NCBTYWx0ZWRfXysqwl48aJosT
 s9RdXGqwsZPP9kJWkTM6Y/4f32cBRTrO245kWS93u0uYdXpwIm6zC0NcYs9wewOTfL3BlmW58fN
 AwYNm8v31mCWjl/uEwjqAV41sahi7R3GulZjFagz3Vfpt3pkRaBrzeQRwLIuwcBmFyyXU/J2aFB
 4Z0xeBdubMLnADRtwZB6HvQ2gh+V9+og+YkY4Ve0XVsVuUMLUXAt9iBPQqsW6yBdcvKzacUikH7
 6es6J2Y2TzLgQCIVEWFvdMjUhOSzD1a5Lwe43OFHZ5VnftZgnwCTxoX4UFbhC4S/bKcdBqnN2sD
 IlIIq8m5NZvsa6+RsgWg52B4aLwC2k5u4MuI13SptBJipA+NVuL20Y/iMwdVYSk5GoR/64kULJG
 GD3PtwJ1rkWLbE9nqeUEYmfTa1h3TGBsuqFuyW6k6oofWW6J7tsew71VeAaJqlzsGGnEVFxFW8G
 UTHEstFcK3GYb8ucjMw==
X-Proofpoint-ORIG-GUID: uaIlpL10kvUtVQUf9ukIdJSaSHcRBTmG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130154

Implement a helper for registering kunit test-managed software nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/kunit/fwnode.h | 19 ++++++++++++++++++
 lib/kunit/Makefile     |  3 ++-
 lib/kunit/fwnode.c     | 52 ++++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+), 1 deletion(-)

diff --git a/include/kunit/fwnode.h b/include/kunit/fwnode.h
new file mode 100644
index 0000000000000000000000000000000000000000..48ad79f3e193ad932cd943aadf159a57149223d8
--- /dev/null
+++ b/include/kunit/fwnode.h
@@ -0,0 +1,19 @@
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

