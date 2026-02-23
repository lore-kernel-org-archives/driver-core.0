Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E5734B42B
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831687; cv=none; b=MiTeCdrRKyMhZoja/HrY+bLRA8IW6WKkLGthlx08rfq9jNiKImhIdFQbuVcgprFDAHa+uGnEBU1bmDDK2frC9l4J86kJPB+WgpTYAPAtPudenj//8NXyLLLhJgKFITx1DH7pIs8K7W/npoo9k4AGCg78JOp0blOXjqs78s1GB+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831687; c=relaxed/simple;
	bh=Tz7aCKZpxvE/URE9NHfPfJCIW6o+Wox+HN1jMO8zCgg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XC4seI+5UTeTyjs+LFb4Cj/wlO3Zkk+L5DLYfY41xSeJG+wA8OV9Lazs7S2r2sX4gic/5WbDldhdrTogT96aNWpx6cmz6rcv5zdY4RuoV5f2ZPxXbeeROv+34vwZkTB0ZZ5nOtVQ4qfLoNfgjVvvzAmG9rq8BOjsbIsChbHWvLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bqdUhSGg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HCzdwMRX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bqdUhSGg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HCzdwMRX"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61MMHsNM1427508
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:28:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V13TbOnjuV6VzvANE56HZysaUseqHKiXk3Stv9fSSv0=; b=bqdUhSGg4fNXC5Tt
	lBynV7L5CjuSOXJESYwWx3vFyqDGDls7Zwtx7n9sISNSuMJzh7UN16lJ1w6hz4s5
	2bThB4m0OzgpMqh7TiUxcmBjPWZOLk2wkaBSYBw5RNRm93k55D3BIgWqvIon0MIr
	ZbghUmGcXmjMY7v7Kc5oWG0gRwQRAJCmhK7yj8iTuw2EEiwBhm5GLL1E8ryEqvwp
	tJnt0AEfpr8xKWCvvxkvKVaIBiHl9KFAnKVTR+vOCizkWpraNxR7J5XHJNG3dOX9
	mEG5mvwhpWDUHVP9s6z26/akucfbtWNRM1FpY2dp8NShJqDdJljAs+CiJj/M7ACH
	VitS8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5x7ut0g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:28:03 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3b6b37d8so3730447185a.3
        for <driver-core@lists.linux.dev>; Sun, 22 Feb 2026 23:28:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831682; x=1772436482; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V13TbOnjuV6VzvANE56HZysaUseqHKiXk3Stv9fSSv0=;
        b=HCzdwMRXFXOUs1v265SoClcI6N43b5TiscAp5KiFko6Uv9YUnw7r0+VV6qIpaSU6wM
         HYSHoYR6n2xnjqv44ip0KwAkUhHzuHdJlvwfsZaMTMqAFh/fTghIqO4fxY03W49Ls+8H
         821aoYJHXrtEMy3575pyzaSNLbJz5j5yvoKW+CV4odpSHybOnUDec1cqtdZw/nyN/eER
         FGzAjsPFJHerLXmk0u8kZJqhrZQ9cHAsGut3nVdyVkoXsTf3DP0hsWVy9qE+lN0ELRmZ
         2rkHeqNmFeJ1Ignx47bnJ7vDFy2JdErWLp09ueHuTqG0LhvdyBGNUqpUc62KAny7pdpJ
         RudA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831682; x=1772436482;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=V13TbOnjuV6VzvANE56HZysaUseqHKiXk3Stv9fSSv0=;
        b=kYQxQTgRiGYJrDwPheecUSR5TW6k4W6rI23HKlLuI+ixp5FE3pCvImLo1dv9E2/pQv
         72faPCHnedCd5by89BbWL94dUI4IfBrSCUiErhFZh1GMZ/A0ziXQNPM4b9zTnkUnRq2j
         nQTwchZwMDjKKhQJ+GLUHtAnJGgV+YHF7gd/ha1K89j00PlXkFdKv+mfG3/naVf/QI0w
         CSbaHk3JhkdAeELIKC6oFm2oLcI5ofihippNVD0gqtVZDDqoLVOS4MLxjsZdgwmDnSRm
         eLtk/lchcbL0cL4qNIkAgO2C79gB/z5z6ko5j9VMr18qc8uS5yYxj+MUJkVlF5jVxx7H
         JdAg==
X-Gm-Message-State: AOJu0YyVolBbZl2y+CattsFFy9fPf0JKzwjiuvVfwLH0DYQ4+hHDvwch
	L2lJevS8oMk+YN/p/iH1T3IE3Tm165MQbbsX7tuE68W2x3C5OMu8McaBDEZrw46J8EuAJA+zPcF
	y802NZwendHUmhbjMgDoJCO2RitVgkQN24nRKZ/zjsEH/S29jX1oWRYVYkTlkf64BvA==
X-Gm-Gg: AZuq6aJwiXM+H441x1avVsE8pRP3a0Vj28xLI5xO9dG+Bp2O7GsFNepWb/cELiNWWd8
	+Jcpa09fG5mID84U9aEKhcenaPYZIUIgs/B21/JxQDBwO3swJsK5pACEKvfwbKSWfSFVQ1AzQlt
	r7qX3W3bE0J++h8AQMrYLEVRbucdBqvmasL7CwtdT+m3zhldS6VRMvVgAWwwp22zlx1itr2P46E
	LW7rZcfC0m4y/G/NDG2kOR7X1V/dMKGhcnWN/H69DiI6xZzjTBhwrQ5iwT5AwViyZR3aiGQlBvG
	MmFJCLEeEEaIQ7nNjY/pXQinQMkIpG5v98JGGFGnKVNHPCB3cNAmSRDQHYfsG6/Z41GO6kvHeHG
	/rQTnhL1NdbCQWO9++63a0XoAsqMZyJ1PX7/6nPSy+petlg==
X-Received: by 2002:a05:620a:414d:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb8ca92dbdmr1030170585a.72.1771831682487;
        Sun, 22 Feb 2026 23:28:02 -0800 (PST)
X-Received: by 2002:a05:620a:414d:b0:8ca:3c67:8914 with SMTP id af79cd13be357-8cb8ca92dbdmr1030168285a.72.1771831682019;
        Sun, 22 Feb 2026 23:28:02 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:28:01 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:37 +0100
Subject: [PATCH 9/9] platform/chrome: cros_usbpd_logger: Simplify with devm
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-9-10b3a6087586@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2369;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Tz7aCKZpxvE/URE9NHfPfJCIW6o+Wox+HN1jMO8zCgg=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFu3KNp+CTKSy+V7k67mEChB+6tEknfgjT/Q
 0+9orefkKyJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBbgAKCRDBN2bmhouD
 1wuWD/9J+JqARU6TsvU4zvVDheM7Vy4GbVVCDxKaqTn1LB64+jTh7G+qQDyEO+/8tfwnovEz32a
 dZfCA3g8kmt9XMucw0VfKlsZIX+GwOFNPaCzVAIUDxeJAZLU7RU0qIm5Sr9Tfvg2BRzyeDraYlT
 J7liSpFkaTD39Xe9e+ncf8BMH+iTwVSEDGmzCDAoM8binwflLgSFhX8+1BAAD+6dGF7I8S5Jd9F
 f+Yfs6XweClFjvk/QYcBtkxFZgTpt1p4s/Ksnk40iJqDUWV9nT7P4LCPGIedS+T3FPn0QWCatUy
 WQrnAzUWqundJe80uxqAF47q1sVAqylM2iuodrq7bUXWaR8M1DHKMOsQK60jEyt+n0BrWTqTC4X
 0OvX08AJfnLsjhGl7MXfKjH+t/A+dPPQeqxzDF//csXt0QJqWoJNq9HCMfDdAkCxvlSeo4H9Z+z
 cYCbIcdRo8JQNn5a6H/48X2v7YhZV8tkKw2OTs2JmW54h38R8qRm/EVPRfMRk0VxUtTcZIuj/Vm
 qUIhXscFFPVRJCkWfps7q1UEqNoWwk6x+NdWrH7EYppRe0NRgJ7xIAgldkle635fxHyB2C0sUgo
 yylFHJPeufQjL0tRBOlpP0gjwNExCI+B70e1ZlGbs4mOM7RJCdTfEZLGq4326lxqaEVTZZ5aRHq
 kW1pfV1AjFgY8vg==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX6hZIU3PxDcQi
 aL0dXHS9E9wuAgGbwq6RU8EggbnXwR7xnIAwL6z3JK9BSPLoS/BCruIfCENJOb1wHn0MIETyX2H
 S6cPIyBtGS2GfWR/0e0ePm4karNg7ozazn52JqI/URzdmHeHaXwUPw5AHfpbbSLvbcm+PyGrsWx
 PsqJtF0yyO9wuu8YNKv6i1D7P/cNfP/uYAUCgFdhGTwaHMyMZ2SMONftohjjOk5lOe/K0pjRGcI
 XRatsFRDKwZvi2BlRAOpNPO2V2gPQUHPazQUDp9wPZa4ATvre6qqXbY6Z0HDCfBarVu45dzrlDa
 xC3dUmY9fw7cMJqT2sg30IqUO/RNlOJxoH7b/5QSsF4a68aW25pCWceMsBlhyAemt77//lg9ci9
 R3yVO6RcyqV0w31PomjNDWmxlsKvkkIuM5vVoc3at5cGMvtlJj0pyA9Sj7TM3t4I6fyjTan581D
 v+j3icJzBexF/0MNKVw==
X-Proofpoint-GUID: z-JDkjvBnpyheJ_d3pK5i8NTeswTt4bs
X-Authority-Analysis: v=2.4 cv=X71f6WTe c=1 sm=1 tr=0 ts=699c0183 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=fg_Lw6XCFRazdZfdaoQA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: z-JDkjvBnpyheJ_d3pK5i8NTeswTt4bs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1011 priorityscore=1501 adultscore=0 bulkscore=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064

Simplify the driver by using devm interfaces, which allow to drop
probe() error paths and the remove() callback.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/platform/chrome/cros_usbpd_logger.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/chrome/cros_usbpd_logger.c b/drivers/platform/chrome/cros_usbpd_logger.c
index 7ce75e2e039e..b0d176c0f4cc 100644
--- a/drivers/platform/chrome/cros_usbpd_logger.c
+++ b/drivers/platform/chrome/cros_usbpd_logger.c
@@ -5,6 +5,7 @@
  * Copyright 2018 Google LLC.
  */
 
+#include <linux/devm-helpers.h>
 #include <linux/ktime.h>
 #include <linux/math64.h>
 #include <linux/mod_devicetable.h>
@@ -199,6 +200,7 @@ static int cros_usbpd_logger_probe(struct platform_device *pd)
 	struct cros_ec_dev *ec_dev = dev_get_drvdata(pd->dev.parent);
 	struct device *dev = &pd->dev;
 	struct logger_data *logger;
+	int ret;
 
 	logger = devm_kzalloc(dev, sizeof(*logger), GFP_KERNEL);
 	if (!logger)
@@ -210,25 +212,20 @@ static int cros_usbpd_logger_probe(struct platform_device *pd)
 	platform_set_drvdata(pd, logger);
 
 	/* Retrieve PD event logs periodically */
-	INIT_DELAYED_WORK(&logger->log_work, cros_usbpd_log_check);
-	logger->log_workqueue =	create_singlethread_workqueue("cros_usbpd_log");
+	logger->log_workqueue =	devm_create_singlethread_workqueue(dev, "cros_usbpd_log");
 	if (!logger->log_workqueue)
 		return -ENOMEM;
 
+	ret = devm_delayed_work_autocancel(dev, &logger->log_work, cros_usbpd_log_check);
+	if (ret)
+		return ret;
+
 	queue_delayed_work(logger->log_workqueue, &logger->log_work,
 			   CROS_USBPD_LOG_UPDATE_DELAY);
 
 	return 0;
 }
 
-static void cros_usbpd_logger_remove(struct platform_device *pd)
-{
-	struct logger_data *logger = platform_get_drvdata(pd);
-
-	cancel_delayed_work_sync(&logger->log_work);
-	destroy_workqueue(logger->log_workqueue);
-}
-
 static int __maybe_unused cros_usbpd_logger_resume(struct device *dev)
 {
 	struct logger_data *logger = dev_get_drvdata(dev);
@@ -263,7 +260,6 @@ static struct platform_driver cros_usbpd_logger_driver = {
 		.pm = &cros_usbpd_logger_pm_ops,
 	},
 	.probe = cros_usbpd_logger_probe,
-	.remove = cros_usbpd_logger_remove,
 	.id_table = cros_usbpd_logger_id,
 };
 

-- 
2.51.0

