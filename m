Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0263934AAEA
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831682; cv=none; b=f2W/0cvkx3lPptldpJcSWTmiTO8fqAsYBXU+DtDUDaWj627Q7VbksKMUZp0iM+bLxURh5zJQhN4VQA1ydF5l5M7+OhjWOcO1fXAM3zx1trX23KnwIDRgIaDM7wnuEmmpv7qJ0jP/kNk3GxH72Ax/nsd6zLGLywTS/7yw4cMUtuw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831682; c=relaxed/simple;
	bh=G2Qaq1IYTDtA8nYq8hb67ozAR45iYXNAROMWtKf03Uw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CboxaopJopiyh6k0YfG8v7wHVTCEEPMf0aJVxVcRh9OqxMGVvrdecj6wHi3Sl349Ts/zrpkLvJodyrk/prg0ISrtnz+H4ESnDUwktbpJOfC6AF8ZbesYepm2J9fHgY0E3VKWnRhyOHkpx2V6hpsDOmlv3hYU4DMevWkxO/DLk3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPkQwJkV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LGZG/1os; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPkQwJkV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LGZG/1os"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MNXm863683223
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=; b=IPkQwJkV2xswGPCh
	rc3S7O5B9GNV14vX4IX8goHyV0CQK1YBxQHVtKRzM7s59ilh+7WdzmyNwk0bPXo1
	4BtOGKkxBBhQecc+toLDIAgYgKgx5oOC+N9otwEZFgVfHQKJtSlX9txYMWJQJHxD
	xUHTNr7LClPUIZveXVZbDiFmTfdb21XbH410rYJS3nv4+71vAyTjwE8jCfPA9ziA
	b61Lq5jOuNoK1GnE5TKO9/QABCXAQPfFymvBkzuQlukp0j0gJb4u22iIvLXz0rHw
	f9xG75AOu5gdH4B2LSoLOVXpfvnCRMMZE/DnZy3j34HbXdOgUxLXgx54prbFk90E
	yuSbgw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5u8krx2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c70ed6c849so3814211785a.1
        for <driver-core@lists.linux.dev>; Sun, 22 Feb 2026 23:27:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831675; x=1772436475; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=LGZG/1ostUs2b86ApWh4NJl2Qndsi+ds977ZJg4hmJBX20oJJMcQlfWr3agXsYGET3
         QDUde+5JkOLX50Hdi4NnBE4poXBLnyOao41fwJcm+lcCzVxPbh4wP77lZzzWwmLG+aTb
         Z6QKPvELvRU66tABGzhd1FEPe2jRTxk1oNEHpzzKSYOZfPQGX5Pmr4QrRv/IeCciubaS
         2z+Ms6X3O627zjyKJUAPX6SaPhDLAPeIfSNHk3w0YOhYGz3anyD4NDIZEfQPptX26ntq
         J6qAtUcj9miIpbRAKXFYpHANGzJNWt+ODdRukBigb5RBz1xTRJ9YUSsoVNzplU6WuvqA
         N5Uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831675; x=1772436475;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=AH50fw9QTtdpPbt41EGIzTuypwuiZyQQHwG7B4PGWqg=;
        b=uoRmDCKzOUtN6mSvg7PKATfug4ElUedUj966/o3xO3aBLSbf9in3v5qiwJoTOKtAFb
         xx26dgCEw6idJH6fTRYUOjhfXBJdfH07X2urqf4rhwS/pTmsStEOEYYdcCpe35t44zHy
         Stwy3P+7nYNGxh2C8YUhkiH6z0nLfXBUg/FpQge5+Ypsd4mJ/4mHvQJw+a0L7Uz61YeS
         1Sk1FDoPuuNIpU+Y9ERBEcaIhazFTUQrnVpm5CUUvfMgr6E3nJWPQvWtDf7ZC1T4AM3o
         BGiBip26sDlghSZhGMB0BcFQ3n7x2s7vxBdXU5QGzCZ8gBmrh/qw6YSZlMd4sgFZSb7K
         H3uA==
X-Gm-Message-State: AOJu0YzA5zawXCoKHl1is0+z6OjgTJuv+AXKypTq1ZGEomLXKR6d4t60
	ssHnYLMZu8/73te6ddJUiz2XHrpR2zDs7e6WgVVw10d+w7EbVTfUo2wWdlGpf2bWWouJdqUN44j
	S7Wb6kyb/MomK5kjxcgl/YxUrJyQwDQk0QvVY2duuVC/2b0d6QBDA++VR+mKB5WtuGXN0F0E51A
	==
X-Gm-Gg: AZuq6aI9LSreBplKD4BCdG9rnl+Wem0eAZEQX3wsmlq1FOKDeu7An3fj8t4UlBdNtBm
	9RSfvgy0VV0PxQbmyukMzL3aiIHcZm/Usb9uX5HzhWSROKwScjfFVvtfq55nKrOOp8O3ynkY1VY
	MqzfqbzF8dSNPc9Cuzp5jaEnIJtis+CZdnJHn4gmZ5iBI6S9hUTzFrvSjRCa+ZbFh0RrRJ3O8PI
	ZT2475WLUoFmeLfSO7Id8w9s9RVPEgTD3NdtMCl+HOmWIbJX1FLauHH5FkCGQctXHUgvH7D/7PL
	3XLzJzpsBT7sxKi462mHonlPzaUBVy8i80sO/LPJtj/KFvK+377QxqZLfkis8MSR9uHrb3891p0
	eX5WgXIbHh53bp/7Ua9rWEHf57jyb0ooh0Fg87hOHoKdM8g==
X-Received: by 2002:a05:620a:25c7:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cb8ca8926emr880335485a.71.1771831674939;
        Sun, 22 Feb 2026 23:27:54 -0800 (PST)
X-Received: by 2002:a05:620a:25c7:b0:8c6:ed3d:be60 with SMTP id af79cd13be357-8cb8ca8926emr880334085a.71.1771831674487;
        Sun, 22 Feb 2026 23:27:54 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:54 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:33 +0100
Subject: [PATCH 5/9] power: supply: ipaq_micro: Simplify with devm
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-5-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3021;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=G2Qaq1IYTDtA8nYq8hb67ozAR45iYXNAROMWtKf03Uw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFqVbGd+Oyd+isBnLp3Irn3IzZIFzgrOBn+8
 5TEkaEct86JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBagAKCRDBN2bmhouD
 1/PbEACD32lwshZ2ZGTfWR2j4TEzEqcr5UkWKivQj4l2BDJ3b0cx3v9UXC+uQpxEwQRsNqj0BvG
 I1fbqNt2AyWmkGgU5CQ/mctWF9CLx35r8IK/9NdFjOqcFxht4uwjb6upeBsp+J9Pv4HEfYA0wAN
 KTA7ic+gakOj5ORF0AX0XB+z9UwqeB8IbQrIH7214fJQfuMgYgOooGihxSqfiOsUPuOZ9ls5/dM
 epmwdKvIbeyOiwRprJ77lkVrp+OMFQXa7Z3PUu0SZkkyFzbd7PZxw1z192ZbcfxAarusRPDYPy3
 wg9eYXwcNtW8bxgrkKEeFuuHIQYLM/XjrlvnAGGRttd3REFDczgFmq2NJxW17OOVDZeYCMfKj4U
 x50tsh+z6Y0ziwp0yrkLamVu++cpOHEeoets78gt/cg4eSkEFdA7Bm6o1PBYHVqPrYUMwYO3uzw
 jTyOPwQM3T2UT6UB95Cz2t5+dDzKC/lSPReC0bsI+qBURe6pUl4SOcPr44WISrvlDFn+uxccMAP
 cZ9tGiPuZpEGR4H7DnWR1quOQzOJwWZEQ/EbBXRzQS0zF1KAcc0gxH1sTluqtgGKh/1LOGDmNJk
 ILB2rMYlea2r74+WwfmYhcO0zntsIz41R1A3mBVMXjAxQHSN1RCq0uN/1cASc2WbfdgyvfjfE/z
 84W99rJwWh793pg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-GUID: BUYgBtgIpxpL2vaCkK2GhCryCv1CEEgS
X-Authority-Analysis: v=2.4 cv=cJftc1eN c=1 sm=1 tr=0 ts=699c017b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=PkD0MmKtpR7JdVUpc-MA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BUYgBtgIpxpL2vaCkK2GhCryCv1CEEgS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX3vmOgQQ7s6wt
 rcVWImsgrEQJHyqN8bNSoK7e2Bj8qd1CJGWw5aYBgwDHpjTy6hoU5FSjGUNlkN5bTmZRCk65fSs
 Q5eClwK6qT78lzPaLxELG7MfZNgz+AVzKoxJ/Zf1y6qZcaCebzRBvfUlBpslT2SfaozCdlO+Ws3
 lo/DXboNlJTHgDxqw1egWAd9ooWFhSB59bOFBk7BuxNF7VnxTG4RACfLZNqItiDmqwEy/ShsXku
 HEG3UlZgSHbVGuJcvLHzxt7+30E7LL4F6levTNl9tnCNJm922vYPux/XwrtRfraMUxqnUF+Q38O
 4AyMw+CFC8alQJ3niw1n1QAyNRLCx1dSK/jG9Tj5MKw5wmBCPb0aAwsji3a+hGo7TGlzWuLPBFe
 1iE79yQiEZv2evdn9A7+KUzUeAFdknKa6GqX0/5Rfx9GqmtRRrN204PUsXER8gUIO5pwociL8eB
 p+PEH56ae3GrM4TTfjw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230064

Simplify the driver by using devm interfaces, which allow to drop
probe() error paths and the remove() callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/power/supply/ipaq_micro_battery.c | 50 ++++++++++---------------------
 1 file changed, 16 insertions(+), 34 deletions(-)

diff --git a/drivers/power/supply/ipaq_micro_battery.c b/drivers/power/supply/ipaq_micro_battery.c
index ff8573a5ca6d..5e3fe3852d0e 100644
--- a/drivers/power/supply/ipaq_micro_battery.c
+++ b/drivers/power/supply/ipaq_micro_battery.c
@@ -7,6 +7,7 @@
  * Author : Linus Walleij <linus.walleij@linaro.org>
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/platform_device.h>
@@ -232,49 +233,31 @@ static int micro_batt_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	mb->micro = dev_get_drvdata(pdev->dev.parent);
-	mb->wq = alloc_workqueue("ipaq-battery-wq",
-				 WQ_MEM_RECLAIM | WQ_PERCPU, 0);
+	mb->wq = devm_alloc_workqueue(&pdev->dev, "ipaq-battery-wq",
+				      WQ_MEM_RECLAIM | WQ_PERCPU, 0);
 	if (!mb->wq)
 		return -ENOMEM;
 
-	INIT_DELAYED_WORK(&mb->update, micro_battery_work);
+	ret = devm_delayed_work_autocancel(&pdev->dev, &mb->update, micro_battery_work);
+	if (ret)
+		return ret;
+
 	platform_set_drvdata(pdev, mb);
 	queue_delayed_work(mb->wq, &mb->update, 1);
 
-	micro_batt_power = power_supply_register(&pdev->dev,
-						 &micro_batt_power_desc, NULL);
-	if (IS_ERR(micro_batt_power)) {
-		ret = PTR_ERR(micro_batt_power);
-		goto batt_err;
-	}
+	micro_batt_power = devm_power_supply_register(&pdev->dev,
+						      &micro_batt_power_desc,
+						      NULL);
+	if (IS_ERR(micro_batt_power))
+		return PTR_ERR(micro_batt_power);
 
-	micro_ac_power = power_supply_register(&pdev->dev,
-					       &micro_ac_power_desc, NULL);
-	if (IS_ERR(micro_ac_power)) {
-		ret = PTR_ERR(micro_ac_power);
-		goto ac_err;
-	}
+	micro_ac_power = devm_power_supply_register(&pdev->dev,
+						    &micro_ac_power_desc, NULL);
+	if (IS_ERR(micro_ac_power))
+		return PTR_ERR(micro_ac_power);
 
 	dev_info(&pdev->dev, "iPAQ micro battery driver\n");
 	return 0;
-
-ac_err:
-	power_supply_unregister(micro_batt_power);
-batt_err:
-	cancel_delayed_work_sync(&mb->update);
-	destroy_workqueue(mb->wq);
-	return ret;
-}
-
-static void micro_batt_remove(struct platform_device *pdev)
-
-{
-	struct micro_battery *mb = platform_get_drvdata(pdev);
-
-	power_supply_unregister(micro_ac_power);
-	power_supply_unregister(micro_batt_power);
-	cancel_delayed_work_sync(&mb->update);
-	destroy_workqueue(mb->wq);
 }
 
 static int __maybe_unused micro_batt_suspend(struct device *dev)
@@ -303,7 +286,6 @@ static struct platform_driver micro_batt_device_driver = {
 		.pm	= &micro_batt_dev_pm_ops,
 	},
 	.probe		= micro_batt_probe,
-	.remove		= micro_batt_remove,
 };
 module_platform_driver(micro_batt_device_driver);
 

-- 
2.51.0

