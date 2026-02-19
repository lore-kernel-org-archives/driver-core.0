Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA7D134CFC8
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 16:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518702; cv=none; b=HRGIbUUB+pobxy/8TnvhVPh9JGdH9jilwpwGstQb796OxRn/qae6fyPnTY9FqBLRs1lWL3mk+Qlmg4ilgfLUTnK9RZECW0ggF/7F6VY0LrorMZtt5+A1XVQyVKQs0OpXEtgYznRylCfz+89nWCyKm7z+/GI7skaAySONPSDBzYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518702; c=relaxed/simple;
	bh=UliX6sLzotx1qsQF2WyN927FXSQxxc6AV3CGUQohm/g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nPvf2Fq81qzbf0RF2IHfnX3eQ7V2n682Slromics12piGVMe/6WMIxyTIZu6+xReA7Hotki/u+g4iCGXOPdZy2CB3No4CucXWBvw0xuNsN40gfvEV0aQssSu3Jfj7QecRCkxy8IjOvAycWUVLh7NgaWxM+uM1DKiEV1C5REdkYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kMX94TH5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fBdY87ld; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kMX94TH5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fBdY87ld"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JCOp361716269
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 16:31:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	t3i3Zc/Bg7Z+rAWlq8NW6uaCfPIho0nsjbiZS7RQ/uk=; b=kMX94TH5NLMxflfp
	ELxVADN3XlxGc0EFZ3+aFyo7svO3hdLMH3Gf/XEq1SqHUPWqr/9WbYIHR6jWhlo+
	xMgiiEjhgN51KcpqLyg+m+XxhIEa1CEALPLvPoQqSRO63niTMBmSon9GnnSDBGBj
	oq0R0Pmm0G//P6n0QofMu3gtcZypWnfffttDfI0c9F9eCS0+PB6q4VrjN1jeWDXa
	Buus46427s+yWNyunuU1gTDN8x9+ilSAjtf4rylKSVbXmIUMT+K1Jylc7BflxFhK
	erHrVGvlm3t3ACI3IAQ0XAkoCM3PtMPoeBcTsK+xBQd0BoueEI8EfvytYgtae+/E
	dcl8TQ==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ce2ghrt7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 16:31:40 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-9483c030e3bso16441601241.1
        for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 08:31:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771518700; x=1772123500; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t3i3Zc/Bg7Z+rAWlq8NW6uaCfPIho0nsjbiZS7RQ/uk=;
        b=fBdY87ldgqjvxsXiakJw1uIMYGwshtz524W2oMXPTwQAQ4mJsIlAzZpFP+7aBNUE50
         +eswX7qMcsho4fJTAfufC6TK2xPJimkdWZCsCVwspngHKJXGOGM1pk/X4vzAknvlpPsH
         MtQ0DUi5Gla1tWHLXuRTyoXrNDxnsfGMctcKUvl3sZNUpcBtxlz6F6msdI1OjzMMbopB
         Z2AjV/uDvwI6eh0uJ9sua9TtUWXgb4XB3KBFHN1m7RcBH7kXpENRoiJSFMLOboYK/Bk4
         STVULTZLm3eoGC+CIq5zx9SkLfYufLMy8ITfbIw62VFqv84+4M9VsfMtO80V3KBmB2JF
         p5qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518700; x=1772123500;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t3i3Zc/Bg7Z+rAWlq8NW6uaCfPIho0nsjbiZS7RQ/uk=;
        b=WykdoU3Fl34T7DveBRBamweJdS05fk9XHVjMmDQcZbWxdeZUK0rUoiWgWGS1ygeV6w
         c4pAROXy5V2IfobkZDFAst/0cRtM65G3w1msJFRFf9AC8RuCm/4fTxsOOfKCxhHPidgE
         cAurF4ghz60Z7FaqO3LBjKmHfZ6AgQmIG2hOdTj+FHmx5htlADRJAvEmBM1WPliIWOTJ
         lobKKUFgNPEwAm0flmymBmrbJTed+cle6U51C1F35N7z1OzT9lwA/f0NYHYX4h/UM/ak
         VJmy/u3B2dCPs/y9T4b4QKPIKPs61HcTVODWl7akGl0kswMLYkYBxBIrBtdlb2fe6nZM
         jGNQ==
X-Gm-Message-State: AOJu0YyP+YeUIRrrHPTBGO+RT6zw0lpOTcARqAxcBWWLvGmH6Xc1hOg7
	m857bJMtBxFcGSQswiKvZLBeyK1f13vh+zVrgP/zqUu+SQWJMjUuIN9a2170lMEHjuKgVq69Fhf
	0Jtwh8/sguswuyXGq0iHmyq/bk9CT1BRkxupzYCNvyckDdZHz7ej4b4ZjKFO4C45VBg==
X-Gm-Gg: AZuq6aK/6+OTmYOelBP2hio1fGilJJ0FQ3nH4u7+qrBtvZKgIexUvx1yzAol4VCul9u
	clN6OYE7pmoj9W73UrK6Yqe6xgLHS6+XshPmQtsxkmH3IGe11ch/iKqLBztt2sBpp6WaVyuVNZV
	DHkJerSV7nDNVuATgq/cgYjmaGHkfPjVt9XSo/0P7PtuZZ8UCly+YvrOJUNUClSIEP6FOX3+EKW
	qQ0ZDeyBMqQKWfdP8kMdHHUPyMzwBjJ2BTPi39dIvVgjToeMP1C92kVZFSsM3CTGCArCvASFWPo
	poYhYWrppzttNGMxhtBOrXvlNL8x1WYh1yJewpSMLG8dBJYDrQ2z0CphwuKGvbikSqtfOY+0DdH
	mNpaJSCZsksiT+1S7NyrDM1zckRr6pP3KtQkrRrSgnjD6V9hMaaTW
X-Received: by 2002:a05:6102:4190:b0:5f1:5be2:114b with SMTP id ada2fe7eead31-5fe90c4a53dmr1474822137.20.1771518697916;
        Thu, 19 Feb 2026 08:31:37 -0800 (PST)
X-Received: by 2002:a05:6102:4190:b0:5f1:5be2:114b with SMTP id ada2fe7eead31-5fe90c4a53dmr1474737137.20.1771518697117;
        Thu, 19 Feb 2026 08:31:37 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bfd6:96b4:947a:52ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm20272365e9.8.2026.02.19.08.31.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:31:36 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 17:31:23 +0100
Subject: [PATCH 2/2] gpiolib: use device_match_fwnode_ext()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-device-match-secondary-fwnode-v1-2-a64e8d4754bc@oss.qualcomm.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
In-Reply-To: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1018;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=UliX6sLzotx1qsQF2WyN927FXSQxxc6AV3CGUQohm/g=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBplzri7W7lUZ7RiuAYz8/s94t4gStwIJ23fD0TZ
 z0pKDMSqh2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZc64gAKCRAFnS7L/zaE
 w+u5D/9/QPf7fqpaO+syn275H8hFZ7xB+oT8FGaW9c2UtkC+ROtg8YLQVOYzoSG1Xm2mSbfnWF1
 R7IPDR7Yucpz+3cXd97ZkJw2tS8g1nJcqJVqFhvuUBWCJSi7rNfVZsdwMnDib89jZV4Gt3XPFcx
 pDYP9OAAhHEKe8HDc5TInM18PZv+4NFOdADgJNVlOIO0k4wozW3GnpfzfbtGv7Qu2gz1KfHsZEN
 m2pawyODYnOBiRaxMI4jlTvvACvXuV7Zj+TxucJE4rlkuXTMQWOj8TlQq8tOpaZ1HFSU3jAf6Kh
 wp+yh9LROef521l36L+F/BjetNeO50S5hJ6Ur6EmCOETVinMyW3t5Rla+FnN66DqG23XJsjNUjd
 vg4rIU7eZ8e2sp5kqHp9dP7ScpDlIJc5pnh0Ep9mA1I6QvzhIIlA4T0C+HlDF6mQrgaPSJHMI3U
 x3/v9PFDyiVFh77lNZ0LqNg9cZR4ojymZgtR2w6uUJfAMFKMXMXimp4Zqg18p1ONSx9mzaArjkj
 BWVeF+s9hcalMHlSLsDfms4HHL9TTLCmNC1mju/VI84P8fJwc75bBP5gzqipZwMFrsdI1bDMs0s
 nvwKaRhRvxR17GksLC8feRnPTC9AWK6S++G5cz80Zlu7t5xl+fT6vTwwEZL7BBRi4jjhC3jrADX
 7Smjg00wnMfUknQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: oKiEbNANAPqNo5k-9aqvxKkEwrL_x--G
X-Authority-Analysis: v=2.4 cv=dqzWylg4 c=1 sm=1 tr=0 ts=69973aec cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=y8mqIuvH0L8eC_VtVMEA:9 a=QEXdDO2ut3YA:10
 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0OSBTYWx0ZWRfX3xt+gtbBQnve
 jINMwAUfnJ+ecChUR+XW12h5mg9z0pyVXsH1rbO2UM+JsdHarfy1Cda01Plp70DkCoaqEQQflQ1
 q0ohh2F7ao/kK/tLDhh+scGp1PweG5j51pjLS+RZokpphWav9UVYLtt3K2dkKsfedTdTX58lUMU
 ivcGly4hn3LttfEKZZDDIp3uxzaUcakbxtqxOvk1glLR2Q46ycyZRx7wrDT4Q93qVhh/BthSzvP
 4S9JCMko3WdUx0nQA3HRDJ2tRJEszdxKi0gpuvmv7gSuD+hsYCvdrWVPvOvB4DKPymk3yjnt+Z0
 FUyHOYjsm3IhEEvmHUpCUb2OQYoXYOojx/OyUTvRPi3R6Leqz9n7ncvg2i2UL8VEqclQjc/gEDA
 nmhsru+7tF7fhRWjDdP312uFnx12kB9m1Y11OGF77Vw15bdlLLe3l/Du/Xxg/nhsCK42Eds3gyl
 KmoExZldFin7vrCoJtQ==
X-Proofpoint-GUID: oKiEbNANAPqNo5k-9aqvxKkEwrL_x--G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 clxscore=1015 bulkscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190149

Use the extended variant of device_match_fwnode() to also compare the
secondary fwnode of the GPIO controller device during GPIO lookup. This
is useful when a GPIO controller has a primary OF/ACPI node *and* a
software node set up for devices created in board files.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c52200eaaaff82b12f22dd1ee8459bdd8ec10d81..0430a04ea060c38b5823cb48dc7a439b73ba9b83 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -1395,7 +1395,7 @@ EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
 
 static int gpio_chip_match_by_fwnode(struct gpio_chip *gc, const void *fwnode)
 {
-	return device_match_fwnode(&gc->gpiodev->dev, fwnode);
+	return device_match_fwnode_ext(&gc->gpiodev->dev, fwnode);
 }
 
 /**

-- 
2.47.3

