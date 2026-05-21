Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552F83D1ABA
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352701; cv=none; b=OxD+OCEcuiqIf6rkELdYiV9AGuoEsMRM97GHJL9NBVhmIyghyil9hck2K/G3bfBY6i42g3+/Br2yeV6bUQARnNdA8xrEWK0+scbGI8fdEOxC7PW1gC5zhZy0xIptnTVV4sIDi3JgZwoL6y5EYkbNkPX0fC5sLBrXogf8EgCx/TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352701; c=relaxed/simple;
	bh=BQp3BJQMi/G+gQE50h68jsUUyT+B8hxHS7036l8NXls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l9XKz/YA7cn3zBYCQBVOuB2idx4HA1WMy9YYYby5myNlEbjA5DgUSwldhueOJUILIk3AYxK2y7vlg2STUa9MzOCNYUTDTLBmaUMxXPQtp3HqwULi55kESKPALxi57BDbclCTe1A/o3AIXrm1RoYieLsksn5wKIJ7eDEejYksU1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ETMv0UEz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MIYrphMz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ETMv0UEz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MIYrphMz"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L6mIQV1798612
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:38:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jQm8FjEEV1MO6cIIhFWA2fcDzddol+KMBCUaCkXjjmU=; b=ETMv0UEzGin18yIO
	zOHyP7x8iY+OlWlx9nKmm444bzrPOPxKwh3b2E+AZUBPwvrz34RnxbQiemMT1XNT
	Nzaw5W04hcIM3aShKSaFmTXczPUAy1RwkVkuZEhrNUeN0B0utS61B7jMcxDL1MYi
	dgZ7uJC6QGv2JrzBWVq0ThUYemMcLrNROllJ0Td/q1IjYV23CRsACtchry7AwdpC
	99JE9KQ7duYxULEWMIr5Sw76zn4qf+i8X/kH6sFyOLBk49gRvkPlBf9UP1qGCU2a
	QEyls5Pg9lt1s+gyw3fKGWsm6VpskmbS+g6c7huGknaUwlmF4lft0+EyxIMpScFp
	7tiZLA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9dxu4252-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:38:07 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-516ccfa109dso1704411cf.0
        for <driver-core@lists.linux.dev>; Thu, 21 May 2026 01:38:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352687; x=1779957487; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQm8FjEEV1MO6cIIhFWA2fcDzddol+KMBCUaCkXjjmU=;
        b=MIYrphMz19mBgrECzShSMZkqlPaYkiH7gtUhMvmyahacqA4F4f8zxDPzg5gHBP6wF0
         JVOJNZ8dt718v14FibS/lHgWyHXrmfq7asknIyOXPUxmguWjQq/KRUXYtZsEZKrBzVs/
         6AqtVvDaVboy0aR5Lqw3cN5t1MDUF4KhtnmVDLfKhnzYBaJWajO97FulcwipkZCVvKeJ
         UWmfWDR7H/eMT65lX/B7hc6zm7LU4KtvPq9jFvbTbKHKL0z5BYqxefQkDPK5alEEvd1Z
         wnP13/Y/NcetHaZSE+hDCSxQa0MwJOPPPNppY3QOp7NKf312Bll9oBVyqn7hODs8+NUY
         qomQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352687; x=1779957487;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jQm8FjEEV1MO6cIIhFWA2fcDzddol+KMBCUaCkXjjmU=;
        b=LwOxEaa3GFuuiP7nPfoa9DK1rfMnFyP8LWvrFL5I3aRIRiidW+hQIT6r9jMwGO9aR7
         VBarpv+otMHvE5CnP3gwFiW/ZfDiY1+eZHVGnffa9hIxLqAGykmxlCwj24pU5WO2YaWJ
         k/asfbg6oT2aeoAosvpFFDVpDvlqXZMED2NLPrOktSynFM0IV0zwOlzFk8E4mWh1iMy7
         jW/nr/uBgFCsfqoaKRhq2a05gfGkfDDrkvCgPTzKizMRgFwipvWFkJG3oR4EDqOy0hip
         DMIwWeRos5UuHmfCUKTewXDD1UOdBItuxMoe+M2ZdeTyCAuEFACTUi/eaqcLul449pkm
         t4KA==
X-Forwarded-Encrypted: i=1; AFNElJ9bSXV42AzNzD5qj5afMhAwsjZcKNIKBZmEfT/Q6hwvL0+xclXtzDpzrczPmf3CnbZIkzN64+ZeIoDvAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBGzf/m3TLLR3Qcfid/pFDDl0KAxbF8QjU9bQeIIArk0imYnM0
	/zXIgY1luHQ8acBIqaNquEf6+GTswt9SA3+1pFM9AYMPIMb/0l+5caiEL2roA6Mnf5+L18lzQL7
	JeyG9SrDlBr8IzDFmPu1FE8SC0nk/1fGRGqrfSR1scJMpGo23A1KpUshOQgKjasXX/Q==
X-Gm-Gg: Acq92OH2PP5vCSuHn516BlOP9Fu9xIj+UzZE4tigtXQGnzr7cPf70aVqdfBnNb4G3kI
	FeouogNNvBRydnh3G+xsXBJ5Q/c+p7rMqDONZ0o3L81JekI079/stCFiaBkZ8zyNS09LUP0WwbR
	yFWwBwGGwyYsVWo7O8rcHYekEaiO7E2mteQ1g3Ipnq1ri5jLNAWMDPHfqGs4gRgrg6t5MKsWq8V
	YyiypjWWwbIM+c/qGhvMTv/KG5/y9O7Ymd+tEjggfW583gAqeggaafqYUQ8BRkvv6xCvaHzg+J+
	pSYVQ//45+U42OwdMCk53xSd41HszfPkzylPUJXjBCL4Xi2TIUXpbCCUvmTsZY8sufdWumP9t+n
	8QxbA4Uo6MveoBzylbzHepl8kMVBWDkhz3wxL4bWDSXYv1NaljT8=
X-Received: by 2002:a05:622a:5986:b0:50f:be4f:465b with SMTP id d75a77b69052e-516c55a0cb2mr25069691cf.33.1779352686703;
        Thu, 21 May 2026 01:38:06 -0700 (PDT)
X-Received: by 2002:a05:622a:5986:b0:50f:be4f:465b with SMTP id d75a77b69052e-516c55a0cb2mr25068921cf.33.1779352686206;
        Thu, 21 May 2026 01:38:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:38:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:43 +0200
Subject: [PATCH 20/23] usb: chipidea: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-20-88c324a1b8d2@oss.qualcomm.com>
References: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
In-Reply-To: <20260521-pdev-fwnode-ref-v1-0-88c324a1b8d2@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>,
        Mark Brown <broonie@opensource.wolfsonmicro.com>,
        Thierry Reding <thierry.reding@avionic-design.de>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Vinod Koul <vkoul@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Ulf Hansson <ulfh@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Peter Chen <peter.chen@kernel.org>,
        Paul Cercueil <paul@crapouillou.net>, Bin Liu <b-liu@ti.com>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>
Cc: brgl@kernel.org, linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-i2c@vger.kernel.org,
        iommu@lists.linux.dev, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, linux-usb@vger.kernel.org,
        linux-mips@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=919;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=BQp3BJQMi/G+gQE50h68jsUUyT+B8hxHS7036l8NXls=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQtJH8QMbFPV1dWqzeHalCAZ+RpZK0MKHRiJ
 e2Dnj28kPiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7ELQAKCRAFnS7L/zaE
 w4sFD/43Yx1hMHGpbYfxWKnFqlN/WdgLuFdPU6cY8Np++YZo2rYf3uPGYaOPteE7Q4cL5RynKN9
 tR0Q5pOUhbL/jLv9XdF/FeTDp2Wtb+TtYWM4RNYXfZiLtOcIW1O1RcscMBMDg4SKDXrB9nTsFlJ
 Ets8a398cI+pUsB6ZfjOT2KSJcdnUmMi+G9PftPgIVhNrFawhhoQeIPbZjqlS5xIYc7aoup8q/F
 cHF+pVR8vRKDG1fnQKF7uZujTEhgvA55j3FSZTVCZkxCsBX0/njfg8jh+9GfGikqXOJtpFtrqIB
 YRP/K01aDpXYz4urERxYGVxMrwzGzHwEGh2xWQFo4GyeVir0TahMIMPZogHAdeXd2fwtP0+Lurc
 oF92WGf2yxlTJfSUv88Hf+XvE8g1GANQ6YH6zrRxwkbaYi1lAW7i6pVPyAZsYPHERSHgjP+9t/+
 UJeBVAVjRDPH5bZtRjJSdOzNtuBlEvMbQhzXOo91V7kuzqQjqauwM0s6wHQTd/P0JuKRyXzkBbZ
 2WgOWEzaNqEGJyVsjDv9LxSCs8TCSw1CnD1brSHk6LTZZWG6G7GUcE6KkvtVssqWUr1hner+mI+
 /oFzTOsTFEXIwdUHSm5mfY+fzKnlCN4a0GHwdRITxW8thNpsdc6uikexiFWnwMcZhAW6Q1lW8wp
 aEsUt3Z9Z/xE1VA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfXyAhe0Ru7wEzT
 X5+AKjycHpyiogw94tZ5bM+I1d5rF9ZQlk8kEmOgxb+4Pwm/NmxjBG6mwN3ae519H4RB+taYDVA
 gB/y6xpliPaNPNS8iIiuxkdMQCe7D6inQYgVB9xYPC0zlcsx2GGuiHa98wC/mevC/IblBv5nDUl
 24vpoKDFO9+05MdKX8kRfdw4GIIKYsUPtF9lhBvdhTkNU/GAqC4Iwo2Tpr/n91T37Hi/uw/RfVj
 EiFuLjJX4Ln0sfx7LI7E+0a/YuiO20d59gzQRBi7RluCCj/PgG0G7Flo1qEIZ6FuyvVI5F4Kn/x
 XE031/+f4mxl26ExjqwAyC0l3DfHApvIonPXMX8lHhjmzX81f3nonkR/vkn5C1Mils5ICBcTHpX
 m33agqdjubKYby7lCveIEEHTAuC5rCgSc/v4MNqwCNDvt/hIQeZhCokq7RIkNzVAmHgySWxTtqw
 bKo+mrsJSjI1A8tvWfA==
X-Authority-Analysis: v=2.4 cv=Zckt8MVA c=1 sm=1 tr=0 ts=6a0ec46f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 9Ct08xu2K25whrYrEQ085DP5LyE_R_xh
X-Proofpoint-ORIG-GUID: 9Ct08xu2K25whrYrEQ085DP5LyE_R_xh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 phishscore=0 bulkscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/usb/chipidea/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/chipidea/core.c b/drivers/usb/chipidea/core.c
index 7cfabb04a4fb80c6db56ccb430d290dbac61b716..5dd415f42fe0dd026e8a1cc162357e42ba8ceaec 100644
--- a/drivers/usb/chipidea/core.c
+++ b/drivers/usb/chipidea/core.c
@@ -888,7 +888,7 @@ struct platform_device *ci_hdrc_add_device(struct device *dev,
 	}
 
 	pdev->dev.parent = dev;
-	device_set_of_node_from_dev(&pdev->dev, dev);
+	platform_device_set_of_node_from_dev(pdev, dev);
 
 	ret = platform_device_add_resources(pdev, res, nres);
 	if (ret)

-- 
2.47.3

