Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30AF03DA5AD
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534475; cv=none; b=cnxQpdk4XCSsz6knXGsSOqtYEvff1Ofdzc9qfwSqOkInCCU29EHLs+zBQ+7I8NLexh+W8RCxNfGHOK8XLlw9xa5PhGiEvkGpqAkWns8egx9IKMeUIhoRtEv99c7512BIqi8SG5HxJT94KMYa8s7dUJZr/1YGtmeSs65Fd1zgn+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534475; c=relaxed/simple;
	bh=ftejCI4cDYR15DURdSwoo+KUTTkz4glwgHDYbKITpyw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U3GVep1s5uZtp9MCQlx1Tqgh24SBQWE9wlFu3VEXpzo5xqa4Oa/rKr1pvRv6wNpWxxXmWkT3HvgLbVOM9enqdNeazmss2kvFWQAhu7fU7taOaWam8THx9qUFzqMcHD4spUF+cIoq9T2Hx1a6Mup2w8YjGDsTOXN7xARE1BSQFtg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YkXGUqc0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B9mRh2Bc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YkXGUqc0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B9mRh2Bc"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U44X132099527
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	U1lg30DyGHdc17+B9LzqWTA6Lt4/KitzUTkvawVH9l8=; b=YkXGUqc0UwwFKQda
	PE1GWHQR2rLBvZZuCvHXOt537eZxo7bpxUkuhu/01yPufMEdgsCS46y3dh2vjshm
	yOBLMyqduCPu+m8TK48Ct32cK7HWZLIQpgsrW8Kr/mL3VJr2dBJAYN32bWr73v9a
	sV6yeNJB6MkMuCvDr5qzEshW9EcHuZBSM6XNx6mCL5ZOB9zodEy76yVbvSS5o7Z6
	eTpCVHLQ/30HKkVVJ9vYAZmXpuqMLLXRsi33P0AIgfYjEVQApvfjQU13xzkm1aTE
	KU7qJ14v3rNPnlFNoG1sXF4CE8vXEYqBVY8TZ4uxqjOr/TkOg7U7cl9289PmVSeM
	xpbHEA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duyr40n4c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:34:18 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50faf575af4so12945891cf.0
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 00:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534457; x=1778139257; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U1lg30DyGHdc17+B9LzqWTA6Lt4/KitzUTkvawVH9l8=;
        b=B9mRh2Bcr7xS8A69C41r+LKPGGqrzgyzsrEj7cD3DuKP7z2qx1M5w07AWe/JeVDCfr
         XFX+ejlmg4Bb15sqRbBtVf9p2pO1b7wZjYw1KdUFx7wxxByl/e4H1YBF7wG/B4t1xS1Z
         hnZYMCeEFHF/4FHH8MS2P0GFgVKTuIG2d12AMaMkD5v0voSKIfMGCapd9Ee4ad4SFTxH
         BAZ5EyzBQB3aa1LJ/2BuV6T3KtQoMHxEydB/PyyI0mhDDmXRT/DkmTBTe8Qu9kkmmKAr
         1W9BqYjhoxnyucSic//407j8AwWh5G0BneyRaMHZOuG+u3NlkEHwJOXz34Gplgfm0+9U
         WJew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534457; x=1778139257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U1lg30DyGHdc17+B9LzqWTA6Lt4/KitzUTkvawVH9l8=;
        b=bESusoTRbfgaPZREdzWq5WW+KlfnjbK1Vyim2bfpGnc8avGnIG4AXi/T+m182Kcm1C
         PlrDm2ofpZ5EpiP4EsyCN2JttR+cmKqkS7t9RU/wTHoywDG5LhBD6gOwBerzMrKLTV6h
         +jisfUWnpAWFcEq7oJ6AGNDT9EtUP5+VsPMW754FO8ce3qaC26Oqbmi4PMDdoPWeSegb
         c9kVcVUGs5PYznbjyOqv6HswNxCkZgrIMYVGoDKdYuxydpRKtLWnz5rfdktUD4lLl9Nr
         LiV4HBYUhGEbD4ImIYQwRDbKcDNIfq4okpds1cLL+tcPoQna+OSkfFybOyAaS/qs5Tei
         kCcQ==
X-Forwarded-Encrypted: i=1; AFNElJ8WeJeZoTfByNiCB3Q2HyR8tJt41nxyEknaCRuMgEzbhtXfJ3m8ms1NQoR+rHiG8pUvIt0JUpXiABTTaw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyx2CqMlpgIUWzLJTQMbZuQH207d0vyyji+bui1Zc+cvJQPTILb
	9/yNXK+Xt6zLrd32p+67sEQ2k7inBnxqySi7QZlQkhwi1sU6YM8Env0DVqD27iSNPZK+LTtKpO/
	0PDS0cZSMh0xipXk9rq4D7rWPFD/sBeubggIOodTosbaieMY9oyx1GZEpnBNbAxzV/A==
X-Gm-Gg: AeBDievGTocOpJAXlJckBhxGEMJ4xd1lifP6e2bkTN5NWHVd98SFNer3nV7bBvN/aZc
	mdKxkA+0sHToTHNmaEbOHIHFZ0W5nvq99OcRxtiXDfXOe4t2PTmjCsatv8QhxdXSOho7xnKI/nc
	aV3omu1lOIfWJky4f5qPT6PzThWxd5dBYZCKn5mT46NFSa7TGTKi6KvOzXZxahr5AxBJ3JAdv7c
	gwNR329YazfUxuN2eN0dCJr5nul48W6frNwA1EwTgWai+t7pvpwSdGyTFTius/CRogCYIcUTZ6P
	/vqXPIlBe8SatRv/t8rDibh3dN9XOBzmOHXh2sDZsctfCr2hid0yyomFznbQqMJ11y3ZsFr9c+q
	QhY5XUB0ohr5IjViyxB38ihBBJSlb6XdNZ3seW+73gD5VQif1bDpr6I7wTsR4
X-Received: by 2002:a05:622a:2296:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-5102ae1dd37mr24163121cf.29.1777534457239;
        Thu, 30 Apr 2026 00:34:17 -0700 (PDT)
X-Received: by 2002:a05:622a:2296:b0:50d:abc3:eed5 with SMTP id d75a77b69052e-5102ae1dd37mr24162871cf.29.1777534456853;
        Thu, 30 Apr 2026 00:34:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed6bafsm76132625e9.2.2026.04.30.00.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:34:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:34:06 +0200
Subject: [PATCH v4 2/2] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-baytrail-real-swnode-v4-2-767bcda6667f@oss.qualcomm.com>
References: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
In-Reply-To: <20260430-baytrail-real-swnode-v4-0-767bcda6667f@oss.qualcomm.com>
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
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4114;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ftejCI4cDYR15DURdSwoo+KUTTkz4glwgHDYbKITpyw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wXyNbrBg8v29GzWwZQSXhoATQ3VfPNhBQPyX
 CBTZhwb0VGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMF8gAKCRAFnS7L/zaE
 w74HD/9R4T00RQB0nP0oxJY0jbchVJlzM2HQLvTUIxu3XYf2kbK+9M5LCXFZDn6pP6shJQG8qg9
 jvbNZ48V+8pTQiu2nRdH5ofy4TTP97Be12edItD9zYZc3BZyaIIfoREEHbyOOXcNxbijgu2ZXgK
 aDnFxWjXdxmcJP3+44LmtBc2f66btigvbsfJ0bqpA+kXXU+pFBtW4do7ukRCaGucdQmblYoufqX
 aFul+BFkxk6RW4b1C1jMkOnsI57vXPULWviGGg1koW2eTe/uFbexumZFhUbk3lo0nZFqVQXeKTy
 w1QBbtvIGl07Q1FFKbkbuzNvJerte0vlk2XaTvUnOlqNViiKDhO5dJpPWYQT/Fl0lbJ07uv5yhc
 A7HAcqvh0fSpG0of8UbqGjbqxuRiZM+E4H8S3qIZXfof/N5D0WDZmfbNSLZVfsqz9gJwSBv1uja
 aSf/DmIUIvwc8Nq5HINCUozUGe05IUEvmVUyNfxIHkpe3JzYgUd+LNSMKGNXRx6ePOF1tSsQlOH
 4hzKHjmxsFkDi5IrYsP+BChzM7/DIcso0+CtHzTNy1fzq9x73NgmvHhL5plWj4KkJqSVDz9q7py
 BAbKRhko5Ya21J6x1Tg7FjUR0qHOE6OQUOmwLRRZ99r6LSdHxzDlZDihR8wbZyeP42Kh0pJQ1qI
 oz35jL4OLjuxAVg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bJcm5v+Z c=1 sm=1 tr=0 ts=69f305fa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=k_IdGrc-7EcYSgGcGvIA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfX0O5JR48aqPtq
 IoP8I+0zIJ+PRy2kdrT2ESs3Skglmv5M5tSF/IklZ94UvlzmHHpYiXUqfChlc9TqIYWefeg8YoR
 VyOlvvTPuhAYbaLHOajfEdye58NJK+1Rmr6CSitGOLKmhOwuM+XZEirNlMI7I5jlniKTDVTONUn
 67byM/T3BlKHKTNzgiU0AhpEdJrgRLWwPeXIG+eQWL+FuwWobk3i0wH722ZKDTMEX3njIS1QZil
 0Ia+u7ypcxWJSj9Doo1AkMrpFDzyD04c1QEvh9y6sA2eyedVcQwyV3jL0AXhA2Nb13HqF6KWskV
 AYclwbkETiOiLDBf25W9G0m5nyDunbdwlZohC9lwZ2+20TEt3fOsNGLDUGwtMGaIFR+br+b4Ihy
 rhl0FJd58ukIQBL9OddsFtxsHpoHPV/+PrOIj8FZ3F87o3MNrdRbV5DUEE5TXib289oumKdEbli
 veM/Jgj3m1dnFTghHsg==
X-Proofpoint-GUID: d8ujgI3UxEB-lFjtYy7E5WeMyH7V_Ixp
X-Proofpoint-ORIG-GUID: d8ujgI3UxEB-lFjtYy7E5WeMyH7V_Ixp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300072

In order to allow GPIOLIB to match cherryview and baytrail GPIO
controllers by their firmware nodes instead of their names, we need to
attach the - currently "dangling" - existing software nodes to their
target devices dynamically.

The driver uses platform_create_bundle() and expects all required
providers to be present before it itself is probed. We know the name of
the device we're waiting for so look them up and assign the appropriate
software node as the secondary firmware node of the underlying ACPI node.

Scheduling fine-grained devres actions allows for proper teardown and
unsetting of the secondary firmware nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 78 ++++++++++++++++++++++++-
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 021009e9085bec3db9c4daa1f6235600210a6099..8fd0cffe351577182f31c90c104b616cec78c481 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -13,6 +13,7 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
+#include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/irq.h>
@@ -360,6 +361,76 @@ static const struct software_node *cherryview_gpiochip_node_group[] = {
 	NULL
 };
 
+static void auto_secondary_unset(void *data)
+{
+	struct fwnode_handle *fwnode = data;
+
+	fwnode->secondary = NULL;
+}
+
+static int acpi_set_secondary_fwnode(struct device *parent, struct device *dev,
+				     const struct software_node *const swnode)
+{
+	struct acpi_device *device = to_acpi_device(dev);
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = software_node_fwnode(swnode);
+	if (WARN_ON(!fwnode))
+		return -ENOENT;
+
+	fwnode->secondary = ERR_PTR(-ENODEV);
+	device->fwnode.secondary = fwnode;
+
+	ret = devm_add_action_or_reset(parent, auto_secondary_unset, &device->fwnode);
+	if (ret)
+		dev_err(parent, "Failed to schedule the unset action for secondary fwnode\n");
+
+	return ret;
+}
+
+static void auto_secondary_unregister_node_group(void *data)
+{
+	const struct software_node **nodes = data;
+
+	software_node_unregister_node_group(nodes);
+}
+
+static int auto_secondary_fwnode_init(struct device *parent)
+{
+	const struct software_node *const *swnode;
+	int ret;
+
+	if (!gpiochip_node_group)
+		return 0;
+
+	ret = software_node_register_node_group(gpiochip_node_group);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(parent,
+				       auto_secondary_unregister_node_group,
+				       gpiochip_node_group);
+	if (ret)
+		return ret;
+
+	for (swnode = gpiochip_node_group; *swnode; swnode++) {
+		struct device *dev __free(put_device) =
+				acpi_bus_find_device_by_name((*swnode)->name);
+		if (!dev) {
+			dev_err(parent, "Failed to find the required GPIO controller: %s\n",
+				(*swnode)->name);
+			return -ENODEV;
+		}
+
+		ret = acpi_set_secondary_fwnode(parent, dev, *swnode);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
 static void x86_android_tablet_remove(struct platform_device *pdev)
 {
 	int i;
@@ -391,7 +462,6 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 
 	software_node_unregister_node_group(gpio_button_swnodes);
 	software_node_unregister_node_group(swnode_group);
-	software_node_unregister_node_group(gpiochip_node_group);
 }
 
 static __init int x86_android_tablet_probe(struct platform_device *pdev)
@@ -427,9 +497,11 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 		break;
 	}
 
-	ret = software_node_register_node_group(gpiochip_node_group);
-	if (ret)
+	ret = auto_secondary_fwnode_init(&pdev->dev);
+	if (ret) {
+		x86_android_tablet_remove(pdev);
 		return ret;
+	}
 
 	ret = software_node_register_node_group(dev_info->swnode_group);
 	if (ret) {

-- 
2.47.3

