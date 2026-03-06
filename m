Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26DB939FCC2
	for <driver-core@lists.linux.dev>; Fri,  6 Mar 2026 13:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772804777; cv=none; b=Yrh0Lwo3gGc1gnFXT1WiB9wsxrLc3XovFwzriPHcKs8Jkege7ejB6gTd+OAYjPJvXh1QFlzHe+o++J2WBOAwZzVseUJM8OUKsKoXgd/UiuuVOZJwN07n1GbLmCyFiNX4+9D6ow8M2kI5/Q3AD4dB8M1CkuSVooq4gz6Xg6QQXhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772804777; c=relaxed/simple;
	bh=SSDAqZ4BPyTybfxZoWobH9SrqkBDrojjcbeeILlr+HM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=cujds/+xTg+cn8yT/4Ar/ZX4E9bghn6Hz9GWjZS9s5qRqMubfVoLmeZB50SuahO348IVXwT6BedeUNnqNic+jNHpEoZV6WMNg7OSon/JJovZxDugM80ggGxp24ohruXXHceksnflqImEnlvuS+7c1ebdkWZn0XNTu7Bv7RgnaKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nWwAv2HH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W1d240+7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nWwAv2HH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W1d240+7"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 626BavSs864953
	for <driver-core@lists.linux.dev>; Fri, 6 Mar 2026 13:46:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8+SLyHVxBbG1mkAY054XHo
	dnmb9M/jloyrUQ/IyIBYA=; b=nWwAv2HHZSb7QW4DgaX51Rx3SPxrMuELprIUEK
	cBVI7NiI6FoFGS1ehI2Ryu1ln+q022JUG2xxTiFDa0jlNdRExE1dynfQZUUGCgTn
	axxCJXJbtaKtXUJrXRSXSzATwC5H4OIVjLOkKHunVM/mBEYjaxLjbT/ruQ+8NO7G
	CkPRnIMdCHmP3l9rEbvJw3sqYMzZm4sushNPE6egjxTQMgawEbm5ev9NEOwTScFE
	ujXQYb/K5G9B/KDl4fwaaKekubR/4bG8VOU4DLI9vVSdrxefecQb5DcGbDPG3bQs
	CjDPBk7EhbwlK+3oEDm68EwX3lv1U+3KqN/Wkm0XcM6Jl1Zg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cqrf5sm7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 06 Mar 2026 13:46:08 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8cb4d191ef1so1207108885a.0
        for <driver-core@lists.linux.dev>; Fri, 06 Mar 2026 05:46:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772804768; x=1773409568; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8+SLyHVxBbG1mkAY054XHodnmb9M/jloyrUQ/IyIBYA=;
        b=W1d240+7VzPEkLDs0NO3JGG15BVRUqJQmpQajC00+fG52S61CM1K1OhYZOFwu0XMax
         L36xVwDrd3FL63/eyHiKN9sRlORYQK+tKYDXsaE1D0nZMVVIQ7h2k0IdD6LWy5/E/F1y
         34SJjqEJRMBn9dXvqDr4Tmy2KJDQYg5HvQe1pTB2HqRKFR+N2LHZXph2wWu3C3dq8fmd
         52XLKLgE0C7ONo6TSfu22km6dVSXkpspOkV3/arBx8cfZ68NGBBJo2wc0vAtrq+RPra3
         MuhjyAiuJFM1lNLonHHFREkSjWwyWZi1OlETumuIluG8jQd5a83PhPW/p7MDDIi1Bpbv
         3T8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772804768; x=1773409568;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8+SLyHVxBbG1mkAY054XHodnmb9M/jloyrUQ/IyIBYA=;
        b=cfeU7xsuP06rRWFpmT1brFrgvfCGe9oy2iupOcq69QTlxASrbpny1CfpevNJXxf4kQ
         OZuLy7FMrh9lJQEzw73tpmAHziUpfx9vW2NXOHi1jxNth+TMuhNB71v1sX/fia8ofLGr
         mT1JsdYCVGRXqDD8S7ifJKy0Jk54TQ2nGcTco699lQgiWe0n8WVBA89oDeqUblAKSbgC
         4F1C9YEjaPshybMy0d9XlVuAB+jgvoQhKPL/o23xIGgDLavGcz3EShsa/qLB2lpZNYWl
         Zp9cgCtR3NNLtfv6F7Rr1eJKC59d0jxklrsr4Y+w7OV+acYnGQolgB/ucGAEr3l3fSfi
         J4NA==
X-Forwarded-Encrypted: i=1; AJvYcCX8ek028r5iTXr8lWTFcnUiMm83Rfu80QM+N6Be9SrLwAqWht9rgX/nVIxevHRPGFs17t+Pr0MJNRKwTw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVBcxapWM5f8if/D3fnq+tGEuUJFNcFYDt1Ff+9tzKa2PYQ/r+
	sK3rvrAn2En/f08v4KjHYGhc+9L5ohHGdQJjnNGeTycymhV1zg2Vt+B1GUx6ZcnJs9ya2Wt2Gi4
	7xIL+5I1v2L2XdYiJ9x1ZUpJe8/w3tdPl5I1vtA3GEX81yf9Ub9Ym0RFR2P3iLXjDHQ==
X-Gm-Gg: ATEYQzwyCSilsfeQ7Fduq2iSVPjFtbzAHjf8WH6c5n6NV5R2+4QJaNyQlo7vREh7ToM
	9S5G7mTkdPB4KOapc6X7XbjvAA2Sr2NM9WG0k4fnbabNQD1q17ZcPZF9pXPg8IGMBuw4tx4N8KF
	9sh68Pf/Kv2RTiATRvZFUbyZdDcREZl+eh4RPL8sdbcN3zSmrS5cZMHqZTtSJ8vzn35IqlXNR+0
	XyU7KNZWERZx3Ti8T56czMuEXJ2T/gT6E1KwxPSPcEL2sCYuYV2VDntALM9nYd9g29CKs6zAPiU
	6nXZdp4UwjfSdJJSP1itnQ0eyyU/RpCjY7/cN/em1MKz3bdVoeOeNUN5nW4w1sxkVyjK2Pzd1V0
	KCrSh+Zy9jPQwY3PId8vRh63dn5Dnw/7VhCbRHZ6KIDvJxWTu7e8e
X-Received: by 2002:a05:620a:4588:b0:8cb:5176:ee7 with SMTP id af79cd13be357-8cd6d4285efmr243152785a.39.1772804767935;
        Fri, 06 Mar 2026 05:46:07 -0800 (PST)
X-Received: by 2002:a05:620a:4588:b0:8cb:5176:ee7 with SMTP id af79cd13be357-8cd6d4285efmr243148885a.39.1772804767347;
        Fri, 06 Mar 2026 05:46:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:6d2b:ebde:c946:11eb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8d95dsm4388457f8f.7.2026.03.06.05.46.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 05:46:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 06 Mar 2026 14:45:56 +0100
Subject: [PATCH RFT] driver core: faux: allow to set the firmware node for
 a faux device
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-faux-dev-with-fwnode-v1-1-792a86a62530@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAJPaqmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDYwMz3bTE0grdlNQy3fLMkgzdtPK8/JRUXdNEM7NkQ3NjC0NTCyWg1oK
 i1LTMCrCx0UpBbiFKsbW1AI9FL8ZrAAAA
X-Change-ID: 20260306-faux-dev-with-fwnode-5a66c1738158
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Shivendra Pratap <shivendra.pratap@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6743;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SSDAqZ4BPyTybfxZoWobH9SrqkBDrojjcbeeILlr+HM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpqtqW+NF+cKZ8SyDiGqJGeWNHF6q91nx3U1mmh
 EswCcCFcLmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaralgAKCRAFnS7L/zaE
 wwrUD/4+ltDlHiQUvuipukMXmzcVbLIIGeeTCl0o+ab+Y2s/ZdqqKJMeZP7t6o6y5snlKgA8XyD
 eOFWgmQHNOaeJVb7qIPumSn0T69Q9rUVM9pjzcHCSsOuQ2bPspRt4FrybTiLOUp8YV/rlxVywe1
 Vp3TeM0oQk/B/2qXKfBocqreISKTB9tKhL6N9Hwr1shPpzgjmRPMnckPgpXdRlLvhGn0cPjJAqO
 zEHAHtnnHJllOw8Zl0BZPSxFX8QosBTC0JpUHItSx6IR+HlK3wMdCgTD7QZ3jeBpnjQO/sHO5yE
 3frrkzqeNRjguXPHFX3sYTED1j76x/OH5ZekGl8JYFDyY1szLVzUXaPqgqCZ6eJHdWwTk2I2S38
 k1zbkCbNAWdXQBw/R3AaDgcTzIt913fPFiK7ZGyuYKrot5CMUMsgBHZF6UzoKt7o/z+C+MqaQhs
 1tRnXaO1u9oT1pYHWSUUHqzszh63mTb/m2qdqN6iEaBihOU5we5llYAeYgqYal9WhOSx/kTS712
 m9bcY81vauA02CyA38gI9Msz6uXEzJSCkO7oFKAXCi6ykuXwCliPpoO6UHurnZD5K+bOx4OxrjZ
 APeW8+DNcou1JQFs/ptMbTPEG+MtmVa5zchy3LqxMnUqcwNDO35n32YK37opBT9I+w3vVaSPH7C
 578AncK92qu0y9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: ocYL1ua2FLIEdK3l-c5Kt6DreWeE-oOD
X-Proofpoint-GUID: ocYL1ua2FLIEdK3l-c5Kt6DreWeE-oOD
X-Authority-Analysis: v=2.4 cv=L+oQguT8 c=1 sm=1 tr=0 ts=69aadaa0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=_FzdcIj27RP5URbXEIgA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDEzMiBTYWx0ZWRfX/Hedb6hCwVdD
 DA9tNZS+Q1Cyeb5LbSnCoFzFWek7dCA0rEmYa3eVrWUesXHn5jnk4YSC/7/X8ycwc7pC01+mLb/
 8psbkqxAdQMwkHP34QsGos/J9tnjpnkw7lqg5PqpMwfVXALqDtmyByiHi/7chuP9horAdYsVhCS
 IebvYNnljYbRerk7jiQBPCrnnpcJ2U8I3/WsIzQ+PEazuCWFlUKuS92msQbJzzek9y9HUunXUti
 LBMk8q9CPSb42rS1/urJ1/Xh58BauCRITEzOSxb477SALupkZ7+qewdvDNME22ZaN1JmL2tDMmh
 W4Fa/9xpxNKW77ZLoa0XP3eI7GWjfOW3k+9M7MEjbm9Ok8NhLU+oaoEzrGNnT1CVwvODXbe3DjH
 wuBqdM1rb4ABlY5ApfanPVJV1nBmSrwlD+c0rSrGAYXUSJd0Eagw/3djb+FAJTjC7h7eeP8MWWY
 3QufKBepqyDs+NJMlAA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_04,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 bulkscore=0 priorityscore=1501
 phishscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603060132

Add a new variant of faux_device_create() taking a firmware node handle
as argument and attaching it to the created faux device. This allows
users to define and read device properties using the standard property
accessors.

While at it: order includes in faux.c alphabetically for easier
maintenance.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Hi Shivendra et al!

This patch is related to my response to your reboot-mode patch[1].

You should be able to use the new function like:

  faux_device_create_full("psci-reboot-mode", NULL, NULL, NULL, of_fwnode_handle(np));

If it works for you and driver core maintainers accept it, please
integrate it into your series.

[1] https://lore.kernel.org/all/20260304-arm-psci-system_reset2-vendor-reboots-v20-6-cf7d346b8372@oss.qualcomm.com/
---
 drivers/base/faux.c         | 64 ++++++++++++++++++++++++++++++++++++++-------
 include/linux/device/faux.h |  5 ++++
 2 files changed, 60 insertions(+), 9 deletions(-)

diff --git a/drivers/base/faux.c b/drivers/base/faux.c
index fb3e42f213624ac8854764f58e81b9c2bc58cc86..27b3923b461df14bccc07eab701c6e8070de631a 100644
--- a/drivers/base/faux.c
+++ b/drivers/base/faux.c
@@ -10,12 +10,15 @@
  * intended to be very simple, with only a create and a destroy function
  * available.
  */
+
+#include <linux/container_of.h>
+#include <linux/device/faux.h>
 #include <linux/err.h>
+#include <linux/fwnode.h>
 #include <linux/init.h>
 #include <linux/slab.h>
 #include <linux/string.h>
-#include <linux/container_of.h>
-#include <linux/device/faux.h>
+
 #include "base.h"
 
 /*
@@ -95,9 +98,10 @@ static void faux_device_release(struct device *dev)
 }
 
 /**
- * faux_device_create_with_groups - Create and register with the driver
- *		core a faux device and populate the device with an initial
- *		set of sysfs attributes.
+ * faux_device_create_full - Create and register with the driver
+ *		core a faux device described by the properties of the firmware
+ *		node and populate the device with an initial set of sysfs
+ *		attributes.
  * @name:	The name of the device we are adding, must be unique for
  *		all faux devices.
  * @parent:	Pointer to a potential parent struct device.  If set to
@@ -107,6 +111,7 @@ static void faux_device_release(struct device *dev)
  *		into, can be NULL.
  * @groups:	The set of sysfs attributes that will be created for this
  *		device when it is registered with the driver core.
+ * @fwnode:	Firmware node describing this device.
  *
  * Create a new faux device and register it in the driver core properly.
  * If present, callbacks in @faux_ops will be called with the device that
@@ -123,10 +128,11 @@ static void faux_device_release(struct device *dev)
  * * NULL if an error happened with creating the device
  * * pointer to a valid struct faux_device that is registered with sysfs
  */
-struct faux_device *faux_device_create_with_groups(const char *name,
-						   struct device *parent,
-						   const struct faux_device_ops *faux_ops,
-						   const struct attribute_group **groups)
+struct faux_device *faux_device_create_full(const char *name,
+					    struct device *parent,
+					    const struct faux_device_ops *faux_ops,
+					    const struct attribute_group **groups,
+					    struct fwnode_handle *fwnode)
 {
 	struct faux_object *faux_obj;
 	struct faux_device *faux_dev;
@@ -153,6 +159,8 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 		dev->parent = faux_bus_root;
 	dev->bus = &faux_bus_type;
 	dev_set_name(dev, "%s", name);
+	if (fwnode)
+		device_set_node(dev, fwnode);
 	device_set_pm_not_required(dev);
 
 	ret = device_add(dev);
@@ -176,6 +184,44 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 
 	return faux_dev;
 }
+EXPORT_SYMBOL_GPL(faux_device_create_full);
+
+/**
+ * faux_device_create_with_groups - Create and register with the driver
+ *		core a faux device and populate the device with an initial
+ *		set of sysfs attributes.
+ * @name:	The name of the device we are adding, must be unique for
+ *		all faux devices.
+ * @parent:	Pointer to a potential parent struct device.  If set to
+ *		NULL, the device will be created in the "root" of the faux
+ *		device tree in sysfs.
+ * @faux_ops:	struct faux_device_ops that the new device will call back
+ *		into, can be NULL.
+ * @groups:	The set of sysfs attributes that will be created for this
+ *		device when it is registered with the driver core.
+ *
+ * Create a new faux device and register it in the driver core properly.
+ * If present, callbacks in @faux_ops will be called with the device that
+ * for the caller to do something with at the proper time given the
+ * device's lifecycle.
+ *
+ * Note, when this function is called, the functions specified in struct
+ * faux_ops can be called before the function returns, so be prepared for
+ * everything to be properly initialized before that point in time.  If the
+ * probe callback (if one is present) does NOT succeed, the creation of the
+ * device will fail and NULL will be returned.
+ *
+ * Return:
+ * * NULL if an error happened with creating the device
+ * * pointer to a valid struct faux_device that is registered with sysfs
+ */
+struct faux_device *faux_device_create_with_groups(const char *name,
+						   struct device *parent,
+						   const struct faux_device_ops *faux_ops,
+						   const struct attribute_group **groups)
+{
+	return faux_device_create_full(name, parent, faux_ops, groups, NULL);
+}
 EXPORT_SYMBOL_GPL(faux_device_create_with_groups);
 
 /**
diff --git a/include/linux/device/faux.h b/include/linux/device/faux.h
index 9f43c0e46aa45bf492788adcdc081df5cc0c5fc0..ecad00221590e10e63d13698db9234b3c138a492 100644
--- a/include/linux/device/faux.h
+++ b/include/linux/device/faux.h
@@ -54,6 +54,11 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 						   struct device *parent,
 						   const struct faux_device_ops *faux_ops,
 						   const struct attribute_group **groups);
+struct faux_device *faux_device_create_full(const char *name,
+					    struct device *parent,
+					    const struct faux_device_ops *faux_ops,
+					    const struct attribute_group **groups,
+					    struct fwnode_handle *fwnode);
 void faux_device_destroy(struct faux_device *faux_dev);
 
 static inline void *faux_device_get_drvdata(const struct faux_device *faux_dev)

---
base-commit: fc7b1a72c6cd5cbbd989c6c32a6486e3e4e3594d
change-id: 20260306-faux-dev-with-fwnode-5a66c1738158

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

