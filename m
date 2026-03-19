Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC06F3E95B4
	for <driver-core@lists.linux.dev>; Thu, 19 Mar 2026 16:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773936679; cv=none; b=n1pxl/fpsD9no4CUGnfGrDvQpy9hodUtUYafPW7VlwdWKX4DS2nLHq6t+y8S940zkxlWciXwA2djMiaIe8tZR4lRwUZCBgD7nDZWhJ5cZxhgyjXEB1i1zhyKLwdp/6DJs9vVnVh0Drp+gjMAINKdOh9QhDqfE9esuXm/h6KA4/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773936679; c=relaxed/simple;
	bh=kyQWpc+s6LyGB+cuyTPjoSS5DZ25LWb/g6VCYSKQJQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IYqbKAkFaKw9JS5RgCY5M0EsQHRhZ9WmBgXcv7lgVm8YkbrqHhw5CeD57b/DJNE3GXY5OcyZUmNLMax2OvIWmRWjmj7I0kGsdlELTUAt9e4M91d/fWF4QGkW9nM6omtuXnQ+BWmJZanGSzWKHHKYTPDH9R9IiJkorZoE4ym6rI4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HNaSJJna; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z8ceTIj9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HNaSJJna";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8ceTIj9"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62JEnqrr1567541
	for <driver-core@lists.linux.dev>; Thu, 19 Mar 2026 16:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	n+3e6RrrE6nJ0WW2f1xgH0NuNkol6/On6k5K+mXa1Qc=; b=HNaSJJnaPZB/375t
	jgSeiStPttPRFUhjs/PQ8Ngrlbz+QGeqWvWPKcSOZEPFKw8yXBsf8jazlwlbB5HV
	h/B5bCoYECDdx54tSsVtMdHxcvXARd7FnnqU+P9qOrY8j78zeWmLz7t8AABsOuYb
	xTKYgIOoDTkSkK769CMn7liHQhlX+iTwX2Tl3FWqDva4iAMAblTIFESNRF+chLZi
	v/SwlISGNLOmDFswigvcpJ37whKpxSRFkf6hoI3ELK9Iuo9KmNKJULIrgony4/By
	+UyBbuW8Pb4Lx6GTvzteJBjcmfa6VKStWO1rt8JvaZSQj9JTQMour4OT+1j+xAYl
	TyQQHQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d0akxj2h6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 19 Mar 2026 16:11:14 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-5ffc6cb5980so1356882137.0
        for <driver-core@lists.linux.dev>; Thu, 19 Mar 2026 09:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773936674; x=1774541474; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+3e6RrrE6nJ0WW2f1xgH0NuNkol6/On6k5K+mXa1Qc=;
        b=Z8ceTIj99eNEQpd1TqyeKzh8le3WIth31XtTBchwp3rKGu9mKZVH9MDzkQRlafTkyg
         3oEdtZunavzHSs6Jaa/Yh10e4+kKg5GxvBaEdDfxGSAcpJSYIV6RKSnJA0wuMxqbLyvo
         N/qkTMGnFkOxDWVsL11Ep4ZYzeltiFcc6JvaxU4TJyTT19gDlbUb66oURa1REYWCe39U
         PNRvsNJzrInhEaTXss3Qg+tHb8nOuDMwasjBD+P7MduZ0JZTZYbHDGrkiF48JLrUulDn
         aH9XQrSZACkPXHQAHHteXOmSzOltq4mWboYO1hXR+gbtm88P/Gqom/aQYzynoQWimkI2
         eOrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773936674; x=1774541474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=n+3e6RrrE6nJ0WW2f1xgH0NuNkol6/On6k5K+mXa1Qc=;
        b=Ad8yT5Jt5bXSAsgTKj4h27mKMz+FN42g7G6LGhfhPhi/ko0few0nSTLWbeyY+/D7Sx
         OTGku2c3azb+ysCKWw34me+sajwg5F4j/nLFlfnhsB9rFx6CADrJp1PhZA8+LjjksCTb
         sv1Lyu/StcjZRg+YxnczOfMgiOG+9UKIeaYmbuenfPdKAuhadlEb/IZmpqKA58yjw3Ee
         xHNflJOK+7HqaWCgs+78+My32guLpjKAgP8qQh0bMb13J56hFh2dHPAVfxmt2Ft/XEvp
         Iv/xcQubrGJ2zyrVVFYZn/GBJlqb3pY5bTyFmWWzwbLd0wpNgQ/56F3bgXIvgmjYhAAW
         ysGQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGi8JGFXPaqQwomXW6NcLbruHumnuzT25KFD/43RIStvObO2mZhg3l//Tb5DIkvHymK3ohy5LrgOYJFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDhJWSEeDvwagmRDVxoyVY7Klc7kvYBcoPm75hOVSVSurnZjJD
	ctJKczG+pfrh3XdrSy1cyveQ2aakeFKlxW4zukFleACulE7YN9o3ZCWWMeL0o5Y7/oepg0ZXl+8
	z8V7yDczfDID1kdjJCq3Y8IqVkXM46Q1kjlpGPA8lVUsoNl8y4gtE+0c3FNVXH/w/iA==
X-Gm-Gg: ATEYQzy3h5y+kRnJ3CBcX+UVGCoSoOchWjaMGVWKE61H2XgwfEG+SaMcEEUvVK6cNW4
	ubNb6loGaG+MEAzlTJ3KmVcl5IC6lez8impBlWOdwYaTF6YFu/zRP2m/TJRbL5QgVpG9ZI5YE3D
	IA91x6ryOCQniVk10qCzFnL9xhYqu4kXk7heUw0Mo+aWrUWFsJV4qQjdIzraZS74NQ6qt7Wz7YH
	rLejzI5vnhBUq/syUXDWrrjYVPrg4IIBzW6DdDvyzI3jaqIc2dWxsAdBhOcQWWcPiOXuBaMrA5J
	ygWr6W2M3TvP/2bqq85qofuYPpS5fvaG/bOlfMPsYVigCC/BPgHlqMa6CPDN2rJVR8M8Z20nUTW
	hatbjbPXjPkK2ebhEqpJFUx/4ehbAWTpkE2//xIb6CICd3leuVODI
X-Received: by 2002:a05:6102:1620:b0:5db:fe0d:7fd5 with SMTP id ada2fe7eead31-602aeaffb34mr60905137.10.1773936673685;
        Thu, 19 Mar 2026 09:11:13 -0700 (PDT)
X-Received: by 2002:a05:6102:1620:b0:5db:fe0d:7fd5 with SMTP id ada2fe7eead31-602aeaffb34mr60853137.10.1773936673125;
        Thu, 19 Mar 2026 09:11:13 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:9d74:8015:408c:d719])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486f4e5495csm83756915e9.2.2026.03.19.09.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Mar 2026 09:11:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 19 Mar 2026 17:10:55 +0100
Subject: [PATCH 2/4] pinctrl: intel: expose software nodes for baytrail
 GPIO devices
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260319-baytrail-real-swnode-v1-2-75f2264ae49f@oss.qualcomm.com>
References: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
In-Reply-To: <20260319-baytrail-real-swnode-v1-0-75f2264ae49f@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3084;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kyQWpc+s6LyGB+cuyTPjoSS5DZ25LWb/g6VCYSKQJQ4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpvCAWd/YCTQb1ZpJO3nLK2ALOKvuo/gh4sQpxD
 NZKbSmFQVyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCabwgFgAKCRAFnS7L/zaE
 w0X8D/0bgfGvEb2pvErq1zJpsj5AKN2FholT28W7NlXp/35ot8SBkYRIp+s0nFspf20bQ7psQTz
 sWMAraTPQQ9rikZxk6pZ/38l0bUAl74JMpX21PBM4NBZBgoTwZJyLbRTLPWWh9FCFM0PeO5Wd5e
 Ir/aju4y5ybblGAWOLmnZ9E8CC+OpBod5fgduXJa9Xrfv9OpX1O4DueusUQilG6Id/LlBA0NS7z
 s2lxyePsa6rPEUGSFxTnyWQieC4bUVtvgynmTpBvIM5sN8oTWwSXISPKt/wvFu3CASmNtuBZr7u
 e9nIQvOuUUA3wHt2rCcON8UgCtU093uL0YY3LiHppMc0L4dU2FrczGPz08ilQ01RtE0o6vajcvL
 Yd+ZhjMX/JPa6z37M0W1Bk/Bzbky/Ooy6AgXtJKHuDxGDSbIPN78HMEzhEStMijexYkhkDNjWt6
 wJXTQyWX4NmzY/ImFOOn5yvEbat6yqUxyRrNYvAVIE1e7mj2EHw1FjtBPrgkY3iihR7sMAERCHA
 jAFkanfTkja73k5GyEJnRbqItJnuLeEeKw2RbHole9eevfAtSflfk6EoeReoO/ZHo1M3Vondc/J
 DTtHvihyA4Rs47Yo64ET4i0N+Web+EqtzT7xPQ2azvY9xzM/30fTYKrF8hLtE5jM+Y70LIDm+94
 MqdlioRoOi4r2bw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE5MDEyOSBTYWx0ZWRfX3eiDSGTGgp6Q
 l6prPqTrhjPHWwcRwFRBi8MoAqMsF4UBvhEtYvmvX5V22s1dfBdO2n09pKW2VsWwiFRC4Bco7U6
 PigAUBmMDKKELiCl6EYbhlwN2exxgiQ34LMXzQAXeNhAo7cA6CpyAfwzn+j1CHzc1ltopyeoqPg
 rw5ELxq1/9z5t4fvs/a5w8tfbrIAMwaghxsCVyUF5j1pLVu+QqBtqjGlYVBp74ejO5rMQYEYKdo
 BxNbRHEEuFxDdVjKLiK9dvYCFXxvzlh9LFh05Wx0vS9/ki+v58vEUwAMo+3gYm++HQzJ+yZ3FsG
 umb28kDih3Oovm0vHp9DTBWq8Dz+ei/PYj3lOB2d4d0cblOhQoHjYBHVPqPuvRQ3sBWiZT0ASYv
 45os0aASaUvO5GOPGxAOvksuIR6sxmfxmNQ9WCIRp+B/cLwgdr5bK1tyVceP+SVKAX7Cjxmnopo
 RQjfLeKegd68QFbSrUw==
X-Proofpoint-GUID: q_PRAhGcVcPVh2QlvocdsDggzhR4K6Z5
X-Authority-Analysis: v=2.4 cv=ZeMQ98VA c=1 sm=1 tr=0 ts=69bc2022 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=kPuSsqDpjDp9iQEZ0-0A:9 a=QEXdDO2ut3YA:10 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-ORIG-GUID: q_PRAhGcVcPVh2QlvocdsDggzhR4K6Z5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-19_02,2026-03-19_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603190129

Use the new automatic secondary fwnode API to ensure that when the
baytrail pinctrl device is added to the platform bus, the static
software node provided for drivers not able to use ACPI will get
automatically assigned as the secondary fwnode of the primary ACPI node.

Create a new header under linux/pinctrl/ containing intel-specific
symbols and declare the new variables there.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pinctrl/intel/pinctrl-baytrail.c | 40 +++++++++++++++++++++++++++++++-
 include/linux/pinctrl/intel.h            | 12 ++++++++++
 2 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/intel/pinctrl-baytrail.c b/drivers/pinctrl/intel/pinctrl-baytrail.c
index 02fdadf2189afb0ff654c80c131f813b59d623d6..bd0ba7c3351c021584127b3679c59d7463cc8a57 100644
--- a/drivers/pinctrl/intel/pinctrl-baytrail.c
+++ b/drivers/pinctrl/intel/pinctrl-baytrail.c
@@ -22,6 +22,7 @@
 #include <linux/seq_file.h>
 #include <linux/string_helpers.h>
 
+#include <linux/pinctrl/intel.h>
 #include <linux/pinctrl/pinctrl.h>
 #include <linux/pinctrl/pinmux.h>
 #include <linux/pinctrl/pinconf.h>
@@ -1723,9 +1724,46 @@ static struct platform_driver byt_gpio_driver = {
 	},
 };
 
+const struct software_node baytrail_gpio_node_00 = {
+	.name = "INT33FC:00",
+};
+EXPORT_SYMBOL_NS_GPL(baytrail_gpio_node_00, "PINCTRL_INTEL");
+
+const struct software_node baytrail_gpio_node_01 = {
+	.name = "INT33FC:01",
+};
+EXPORT_SYMBOL_NS_GPL(baytrail_gpio_node_01, "PINCTRL_INTEL");
+
+const struct software_node baytrail_gpio_node_02 = {
+	.name = "INT33FC:02",
+};
+EXPORT_SYMBOL_NS_GPL(baytrail_gpio_node_02, "PINCTRL_INTEL");
+
+static const struct software_node *baytrail_gpio_node_group[] = {
+	&baytrail_gpio_node_00,
+	&baytrail_gpio_node_01,
+	&baytrail_gpio_node_02,
+	NULL
+};
+
+static struct software_node_auto_secondary byt_auto_secondary = {
+	.node_group = baytrail_gpio_node_group,
+	.bus = &platform_bus_type,
+};
+
 static int __init byt_gpio_init(void)
 {
-	return platform_driver_register(&byt_gpio_driver);
+	int ret;
+
+	ret = software_node_register_auto_secondary(&byt_auto_secondary);
+	if (ret)
+		return ret;
+
+	ret = platform_driver_register(&byt_gpio_driver);
+	if (ret)
+		software_node_unregister_auto_secondary(&byt_auto_secondary);
+
+	return ret;
 }
 subsys_initcall(byt_gpio_init);
 
diff --git a/include/linux/pinctrl/intel.h b/include/linux/pinctrl/intel.h
new file mode 100644
index 0000000000000000000000000000000000000000..d45f090adc1f532f866c98aeca144a4d83fa28f4
--- /dev/null
+++ b/include/linux/pinctrl/intel.h
@@ -0,0 +1,12 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __LINUX_PINCTRL_INTEL_H
+#define __LINUX_PINCTRL_INTEL_H
+
+struct software_node;
+
+extern const struct software_node baytrail_gpio_node_00;
+extern const struct software_node baytrail_gpio_node_01;
+extern const struct software_node baytrail_gpio_node_02;
+
+#endif /* __LINUX_PINCTRL_INTEL_H */

-- 
2.47.3

