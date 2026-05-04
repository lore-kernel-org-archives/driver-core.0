Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ABA23A75B6
	for <driver-core@lists.linux.dev>; Mon,  4 May 2026 10:59:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777892360; cv=none; b=tTJ8YhVDyDIrZIEYrm+9P6fkz/n81Fy42tkTCYLp5xnqnhbjfbWDTw5lqLVMigHnnEF4k2nvMdvf820lGB57N0VoeoWlLvLKmMUgMlr1sQMX//4IDQrIJUktpqeRm1jKWZXuEuSDfsUsNMPEQJZJcqMujYoeApht1GjDzgThCQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777892360; c=relaxed/simple;
	bh=7JxG9a0+MCIZqlKYdVA9Lfg5AHcwDLPHiaU90aY4OuQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Il2kvevGrIBgYtQp8ehDp/vwjeuPUERLQ+FtB37j0M0xTY74bbyHj339zl7JdTgkn7cg0XIHXRnWgFmClH3fR0WWII7NytBWYt5QC8AbCeyQrT2+Ptv+aIG3Rn/2bh8ZCrX5VMGGAcGU24B8ZAs7MkB1olUVSMhEKMOGzxVnlmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YdaXGfuu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K3eYUiwr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YdaXGfuu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K3eYUiwr"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6448fLSG2777170
	for <driver-core@lists.linux.dev>; Mon, 4 May 2026 10:59:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ym0DookTYIjJdHtgNOrhmdkhvs2SuwVIeR42yl8FikQ=; b=YdaXGfuuGJnGgu1N
	zMGDSSXG+G941arQ0MAiAbf4M5iTS0kZnaANzqBCirJCh5vTbUG1EAVTZpLgm25U
	RgueE8LROaOrRaX0fzwceizG6DGIztZ/py96V0fLQfTGT1T2wypU81qT/V5N+k+t
	sSO7bmy65o3+f21zb9SqodORdHjaNM7PWyezh7/kpGd1QkpWQIdg3hNBi33CpeEK
	k1UoAFpkV0CT+M8GA4PtuZHlRLtgRfMBUwoBhIM+FT7R2hLJ+Kv4VsJf1kDuCHQO
	NTjbT8zrbpCNLgCFacSNp8k3TXCI/I8VxdRZ9zb6pRx+bB3KUmkQAR+Bx2wQ9Eqs
	Ufv/FQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dwaj7davf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 04 May 2026 10:59:18 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50ea1a7a5d0so98210211cf.3
        for <driver-core@lists.linux.dev>; Mon, 04 May 2026 03:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777892357; x=1778497157; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ym0DookTYIjJdHtgNOrhmdkhvs2SuwVIeR42yl8FikQ=;
        b=K3eYUiwrlF1KhGAezRyPIRqAmzrFTyfButizD+PMTzo+mGod17cJ2IormI9x1l+/m+
         XRtjhiynuiVSZcO78g+2c240PTs4Fjzbf2hlS1hbWZ47joXT1QxYJ0g0lVyhU03C5VOW
         c99cMXiv3B9cZNe626P4N0h7oJVHfXPtxqOluQ+HJ7HPwYb5aG3eTJa3xs0BP/zuOfBO
         WLNx1VxeKjTmopYJFBPI5djGwyBB0h96FPDu3cAuWkzkbPLYUxKC0yzMRZaMX7DeUe8N
         rMn1eh5U+tGeA7iHPNYbo6sai9244s2TlipdqJWvqLTK5xVxYQPxp3SdswhAR0ay1XQx
         lvBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777892357; x=1778497157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ym0DookTYIjJdHtgNOrhmdkhvs2SuwVIeR42yl8FikQ=;
        b=hhqBpDaFQylZIUJoSoCPRN9MRzIXQxSpbGeWsH1+HvQOn0UdI/C+R10Bc10hM+XLRr
         APA5QDDr4IhP5a0Rx1PU5MtpSawZ0gqRFl9e4NIbhSpQvL4mRzkhIqkkdtDEY3c1bj+2
         16TzJ70rXZJf3wb3b65EqhLMBspPE5dckpM52lULNFM+F8l22iq8hE9LedgUyyrsQ9Bq
         x+9KWLAifewVGAvss6GYwRty6DhceTVgQJvsTPUpP4Rb8wGa/vfuq0+u4o2tQdmKHfSf
         6ZdR+qjkf8YyDw4xutX0bYl3L4xtbIBqGFwkBq94mk720wjN2gmmt6jd6Yi6XCRGDKFJ
         0qng==
X-Forwarded-Encrypted: i=1; AFNElJ/smSLMV//1lK0OTV83tjxBxPt4Pelb4XNdR9YHjk9YP9B3SjRwQ79sNbtRvS07ylst4zv7QHYKGFf/jw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3u4U4N/v3VCSpw06E/jI0QOywxJmnWTtSKeJ5H0fm6nVKodmO
	VkyXjUHJscRp1qM3D19hfZ/BhcXdFQtNgF/N1XgnhfRAuBfIAIDSMgj3yx6jiDsO98XhosWxbtK
	UH+fCGWbR+rpc3Wj/OWIsuHYqPLX5P66KB3zonao3mCF8YLKItN8BW0rlTXb2DvfA3g==
X-Gm-Gg: AeBDieuWXLu7qGEfhDxqOFnc6hvpm+x2NRq6kxP5EQivQw/uSruruWs/S3n35M+3LNg
	VWqZxq1aVOxXHDSgeWzm5y+61RKeiYPMaWuWSMRcQTEnxWUG0PXEbz2+enV9dRHpNZBb/UiA/Xt
	gMcxP/49VhBmsWigWn0KWi2U6khzWOm8ScglStXCvmOimVTLdPBAVvNPlsyT+HUui2k2QjHBbGe
	+VAZoAGOusqL4yJW7stHOGsZzr9Uibe1/p5ftMXnxwsvyQigB1PxH6BTqrnDyX5OnArphoAqBp1
	RO/YSAMgu1ZYm5q4RnnJcqeXCcExU8AdZ5RBpuQpo00MEwBc0DfdUabtRSqZG3LM9Xz4pHYjyh6
	GCna15ICKG2T9nbpxx8XQKK8bszUjuOXVgglswGxbRjCoQPamQyZZoqJE5kmVJQ==
X-Received: by 2002:a05:622a:3d3:b0:50d:9c60:fe2a with SMTP id d75a77b69052e-5104bdf32afmr133826051cf.1.1777892357339;
        Mon, 04 May 2026 03:59:17 -0700 (PDT)
X-Received: by 2002:a05:622a:3d3:b0:50d:9c60:fe2a with SMTP id d75a77b69052e-5104bdf32afmr133825771cf.1.1777892356882;
        Mon, 04 May 2026 03:59:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:56cb:50e1:b507:63d9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a8eb69698sm474728135e9.1.2026.05.04.03.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 03:59:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 04 May 2026 12:58:57 +0200
Subject: [PATCH v5 2/2] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260504-baytrail-real-swnode-v5-2-c7878b69e383@oss.qualcomm.com>
References: <20260504-baytrail-real-swnode-v5-0-c7878b69e383@oss.qualcomm.com>
In-Reply-To: <20260504-baytrail-real-swnode-v5-0-c7878b69e383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3689;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=7JxG9a0+MCIZqlKYdVA9Lfg5AHcwDLPHiaU90aY4OuQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp+Hv8F40bmal2NGM4+D73NxohtUby8U7XhNz9B
 oZXnOiF3dyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafh7/AAKCRAFnS7L/zaE
 w9F+EACl5E46Y4zdsjIUMNaMjTFQxPyc/2sdshlfPC1wn2kRrq5ayfJWGAaz9FM9nR/H+ORq48/
 1kukI3+S8sJg57yC9L9DLjkSnxn+u/lPTt2YBc+S1/cZwdniXgYQOCK46ofMd/VOIEAAUx7OZMt
 rSXlWFS9yjGdQ1dyTroupVZ96urBveKOfQYnIKccfbbyLNejwOhp44O8nygkkQyuxtc/Al3Ea9u
 qZ89NDfRgaVS8hl0Sb9OboCpnpakew478TEMSCFzPaY7FFuRNijCLAzTyHUopP2CQ117HWHYQUQ
 mbbe/bWSruOXBRtV640ADEsqbYWVgGAgG6vNR26+XxSdg2j3r2vlQQdvesSALxyG7NavDllHQ7R
 eFQEppGqjBFxl97k7fPGZnQ0lvmxRtp++X9i6pTW9oGB6wPYn84Uu7Wne3DyJqeW1IkGrjE7qOR
 j7Jqa86KG4mGMb3Y7fy9NT+95GJXoOkWIEnC9heDp1wQ2oZumid2ZvB0I8NC2/75vBNHzrrKacC
 H+UuH0dzb5kEG0E/U/EhoOxguI+HaDC4508+d96tCfGa9TiYRuQfEWNTtzDqpW21hlKYOoOgPVj
 gTnBPyesvsCaoPjeqmCC2+coGaQjEivkAIsBL32FMWPJIzq17FAIkEr6sRytIVi9GMi+CCnNPMD
 JxiGJHreBY8X05Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: -9V2ds2_HzaPRAMWX8eiJuAGNmQHGcIw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA0MDExNiBTYWx0ZWRfX1ncVridYxQZN
 8C7C9PITZFnLwOlojv/UjU8+w+LGE3hVTySf+2teF7sGzwEJFsxb8TTroJ0qX9DEDyjtY8OY4n3
 cIODPLfE9nPtX1HDiyX2pW43KboCUZWy8yqkWboOVpUwU+FyZddK0kdZSVgr7XtxTfZ2hoL4rIk
 5EjBLIaWblXrBxrGSsZ2ElBBqS35OzN6fveQbQxag9b4/wfbI234DI/8b9tYUUgZcalT4MLU8lh
 TpY2Zfw4vDdaAoAecXCx/DRnyOx+kdLx+xuv9ciEsl97+k8lsjMlvZUGeOKxIYe703oYASLsmjv
 D7+4lDoatHOPuC1bVSTGPosZPeLDiPt8FLsEyyE8likS5elnb2vFsv8TpkhP90zWaSiCVxpwI4T
 aPsgLxIUI79IxvaoLBsrEaxiggDuNIzHZB6ekpqN9YRDG03R+g7TyhC2kxJtlOgdvb500PrymCI
 AXPU9yGuxYXmTbR3bvw==
X-Authority-Analysis: v=2.4 cv=csirVV4i c=1 sm=1 tr=0 ts=69f87c06 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=k_IdGrc-7EcYSgGcGvIA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: -9V2ds2_HzaPRAMWX8eiJuAGNmQHGcIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-04_04,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 phishscore=0 bulkscore=0 impostorscore=0
 suspectscore=0 adultscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605040116

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
 drivers/platform/x86/x86-android-tablets/core.c | 63 +++++++++++++++++++++++--
 1 file changed, 60 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 021009e9085bec3db9c4daa1f6235600210a6099..4126b49e7d07b64ab9cdb876326c315f9a73b16c 100644
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
@@ -360,6 +361,61 @@ static const struct software_node *cherryview_gpiochip_node_group[] = {
 	NULL
 };
 
+static void gpio_secondary_unset(void *data)
+{
+	struct device *dev = data;
+
+	set_secondary_fwnode(dev, NULL);
+}
+
+static void gpio_secondary_unregister_node_group(void *data)
+{
+	const struct software_node **nodes = data;
+
+	software_node_unregister_node_group(nodes);
+}
+
+static int gpio_secondary_fwnode_init(struct device *parent)
+{
+	const struct software_node *const *swnode;
+	struct fwnode_handle *fwnode;
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
+				       gpio_secondary_unregister_node_group,
+				       gpiochip_node_group);
+	if (ret)
+		return ret;
+
+	for (swnode = gpiochip_node_group; *swnode; swnode++) {
+		struct device *dev __free(put_device) =
+				acpi_bus_find_device_by_name((*swnode)->name);
+		if (!dev)
+			return dev_err_probe(parent,
+					     -ENODEV, "Failed to find the required GPIO controller: %s\n",
+					     (*swnode)->name);
+
+		fwnode = software_node_fwnode(*swnode);
+		if (WARN_ON(!fwnode))
+			return -ENOENT;
+
+		set_secondary_fwnode(dev, fwnode);
+
+		ret = devm_add_action_or_reset(parent, gpio_secondary_unset, dev);
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
@@ -391,7 +447,6 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 
 	software_node_unregister_node_group(gpio_button_swnodes);
 	software_node_unregister_node_group(swnode_group);
-	software_node_unregister_node_group(gpiochip_node_group);
 }
 
 static __init int x86_android_tablet_probe(struct platform_device *pdev)
@@ -427,9 +482,11 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 		break;
 	}
 
-	ret = software_node_register_node_group(gpiochip_node_group);
-	if (ret)
+	ret = gpio_secondary_fwnode_init(&pdev->dev);
+	if (ret) {
+		x86_android_tablet_remove(pdev);
 		return ret;
+	}
 
 	ret = software_node_register_node_group(dev_info->swnode_group);
 	if (ret) {

-- 
2.47.3

