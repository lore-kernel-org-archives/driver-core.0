Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C2F53A1D0C
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 13:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783344218; cv=none; b=mDDW+Bv/febKmW/n3q8FsZlQz+UWf9ZcTTGymCgSbx68Yh3wsUiPBkgUJgTtJCq2ErcUEJAfZGRWEbWOEuesSli+o7F+W305Wuay/qNNcVhv5Si7VPWqJRLHX0Phv5ZUVPl3aoMkNerudz9M6q3IdisNUteBFvRPqhmF1f5kfTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783344218; c=relaxed/simple;
	bh=ToUoBuUJoS1vI9JQbupGD9AhsrfiD0t/t7tbmkvJ+bg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IDGQcwHJ/BB6gNLke+DE+MV7e/ZVR7JJK/m6JlbJ4g5DxGNCQycFRYo1BBSWysQqeC7ZBdZSz82VGGFK7fL6zebdgvKkOcc62IRz2j74o0v9Ch99XZBs+MG/zp0uhv7CPrLRMtHM5/lMzfXtA3vC1+azrOd9D8fzAq4o/2gRfzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MjFrAnhn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cg/NXf0h; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MjFrAnhn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cg/NXf0h"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxDw6395287
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 12:45:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ygsrBoZ5Msq9mGih2gcNmJUG+KH6qwVJkoNpq3S1CcA=; b=MjFrAnhnTzb+xV5s
	v+4J6CGSB7Axv+Nr58UzsQpgwafsybZqVyHj6wa6qd80gwGZIVaDIPIu71l1pwAs
	2Mkc5NH/bOSZrO15edr08Y9srJOJX2R1XayYh0b4yygYdSpy7EfuSlqjbaUz9DjA
	HrL8KBUsmxXkhX/v4TIQzIYw0FIR+PZnYBaGVMIIQpSGWE5teYcUbkbrFKyZNhg4
	bU3CEXzfLm2PPlChvI0t7Izu2ovMdgX5HZfe3YF/E3K5Sic6J1EkpbAggWyM8dPx
	ariZaaWueCZsLX2beqMa2/FpzW6FHOJiITC4zMbnd7Tj6PsJlwjElOOZI2OykkVa
	WIQehg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89qpgqq7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 12:45:29 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-915d3261c5cso255296385a.3
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 05:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341929; x=1783946729; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ygsrBoZ5Msq9mGih2gcNmJUG+KH6qwVJkoNpq3S1CcA=;
        b=cg/NXf0hKavECqAxHZbjIrfwnxl3NBgRwEW2iGJQTX4gQxb97+gwJ75q6VS9K63qLz
         5Vw1xOCowR7JxRpTDCreNSiOVI9CFgUdcGYEC9chFrXxV+3LVb3kJvrBFUps6UfR7B8M
         dY2U4sMz1woOKfO1jQ6ImboJkYjn3vMWft/L725xEjlKAhYENlLCwFnu5LOUrEQNkOmR
         P8qKVt1OmU9y8r2IsQF0xtPuaIpE1FTymOgQ3wRMRkU0vdGHQYULH9U/yzRIZFuuoOPH
         NpphGR+ArWXD8AJTu6bMgrSNOp/276e9cvOjosy1r9DY24rPI1b1J5wgyCLx4Zaqo5Qb
         8YHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341929; x=1783946729;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ygsrBoZ5Msq9mGih2gcNmJUG+KH6qwVJkoNpq3S1CcA=;
        b=lO8/+xMZNieCkHki50NCx2bRyLpV9akkWReHtIDg70AHSvG4TgSn/9lOVapneaRI+u
         hkHSwCP2s5LwPcqq/CmP/Yi6Xxf2BNo6h4ykzckQJbtiYnzwn102FdB047MrtR33sEh9
         RkoyyB8UC6lM50ue1+WzBBm/MIEb1+F3lBvIwBt13Um2Nj3gS6OpOQloqS/FXQBxr9EQ
         UJbiAzY4ZH6f+qpHXhsnpT6QirC9Udv0cx3SV/G+T9XmeXqJrc02qdrS5rBUaQABuy9D
         wfZw34sLiU0qahR7a2PhqtVZbQ8FAoedkWmgxbLzN0K32R10zQAzNtWMvr3ZowLYqQEU
         f8tg==
X-Forwarded-Encrypted: i=1; AHgh+RoY1wf+jboiSzTtQ26ZiOxw0zcRN/Ffd89bB6bPimFQiViGVrwHupY1Ps/QCapF4GKc3l6o/EBulnbVwg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwPYnL3KlvapSwhryJ9c7vG0mD1wCHcNQTMaSOdbCDtcWA2D2GE
	yeJkNeWyqa3nkg91FlY0bc0J619U11gJdbdNDkqs9/KfgIG/3kFDdrRJTh9f/EA6PZ4125vA1M+
	cjIGNkl7sMUlKq77ljRh1Cnzkt8yz5BoAv7C/GzYvSs83FuRlQqxbn/ua3k8VFlPKsA==
X-Gm-Gg: AfdE7cnUqaxmdU16eek5hza86mzKTi7biY+PZt8xEe7tLqks74xTAXtPs+4/gCcZysr
	WvbCGF+28uKcIWo64Fhmmo79nKhyi06NW1XT2tuciP/5WG2a7t0zkykRWeOENdhDLt/e2syeTEl
	hT6lmnAThTSteOHqTU9DbTJmXyvQxFcgJk7Zm+r/tk39BNzvtQAOuuuOBmnvC4eunDTfL3wcGLB
	8MUTugw3RzyZFWnMY50LDH88T832H1LqItM2A59HgXcwRZFwOsgOZN2/BNPeYW04zWlBFcvv1/l
	yQQOnRyEl9xGAXyvrcaN6+5xLjfLmL96fLgIAcMbrov/NJGBILtd83RUr6QYIRZ/zi7XhDosIAm
	5FvWqKJ846VMEVDCuR0E/FMW47w1JYpoEJJP7xP0W
X-Received: by 2002:a05:620a:2725:b0:92e:6637:db5 with SMTP id af79cd13be357-92ebb4c7b4bmr53503485a.16.1783341925172;
        Mon, 06 Jul 2026 05:45:25 -0700 (PDT)
X-Received: by 2002:a05:620a:2725:b0:92e:6637:db5 with SMTP id af79cd13be357-92ebb4c7b4bmr53358785a.16.1783341917264;
        Mon, 06 Jul 2026 05:45:17 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:21 +0200
Subject: [PATCH v3 09/20] iommu/fsl: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-9-1ff028e33779@oss.qualcomm.com>
References: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
In-Reply-To: <20260706-pdev-fwnode-ref-v3-0-1ff028e33779@oss.qualcomm.com>
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
        mfd@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2377;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=ToUoBuUJoS1vI9JQbupGD9AhsrfiD0t/t7tbmkvJ+bg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M2nbcqYQU2rto0INZYhmejKoOnH4JJ+foOF
 gbtQ5diyWiJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujNgAKCRAFnS7L/zaE
 wz3eD/9zvS34vmhbvapxOOuDeHkgoWjbwClrYYz28lrOOlhdhx5lHNAE1M677a9LnxVGFTNWSgn
 z/9TlTUdzy917cFnaNTfg70HD8e/p303kaNPl4g8CNn4TxYUEHm9ktX4btw0hsN/hTGOEb9xrJt
 YTxoQgL6mPAoTC0Lw2nQbw1KUtKQD1CFXM5HUF3lWAyZyOo0ZKAUpQ60eF/hC31K9znEizz+t6H
 MDZ3G2qpJhCF52wAoxmhehajnKaeHhV16Ecs/vtwGrv7Yg7zibDx4RVD+ggasuNS3h+wjWclE77
 a8ascuOrwRU45/+MqL4dliFlZ6Ybby3l8MDigKYin/YAH5vuJF1HzvySs9WsRdD6C8Lq4t75DEm
 HXFZJ0fB1GZp0UT7ayM9xHCIglviy66c8S07wtLg6kkkLq2x3VnHMgPUcoT7h8f95M59G3qXUEA
 8ATrnqHYVAYpH0WshNgZ4U5bJMUAVg+VeidCRa+lK85JtBU3wAWCTEqc1gsfTY3+XhDRr5yiHx9
 Q2zV36L8qjBGU/KX0zn+aScN54PuQD+Sw8Fl8IgXOOnNdr4kHuA1+O3XIlVqm+rrQ8GKb7n2k0x
 SL5YGsI5Tya0+tbYEXhNPxmRmzQHjKyZL7455KsB1CiWGQk3FpnaykdRAHJuEVyv9OmujsnRceK
 xP3+XsEnk3J1FyQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=c6qbhx9l c=1 sm=1 tr=0 ts=6a4ba369 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=7CQSdrXTAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=31kahzM04Zwkpn2euDMA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Jh5mCJL61TXc5MABRmhGtBwDuqff6T8K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX/In0gEJugCJg
 UnRWkigR7K8b7k+Ks538csHYakWsGgYoTWcZbu1PaEo/CnKSGWfagrChafxO3926HVoQIC7Zj6Z
 b/GADNTgMDIIwOfARoIi+FmTTJsyfs3aKv2HZU2kfDMMwOkyNmQl4DOBdK+tULuEkOZPolT0QhO
 aaQeuKPaKgr+ympL8Hh1VR2wgg3w9hqvEkSNAMjCRTjaHE0p/6YMDcpC/ctwOepcdptcK/T7Yij
 gzcS9z4pnnx5+Gl3W7qz9JKArBnp98XXh/hOpXSO3nh9orTYwb2eFgWkXHc7WXDM9wtAq0aap3Z
 8w7vZ+yT+RaZut/+7sNcw/eXeYQbwVTve/ul2MAHMV693fQrrYfh1pJRJaaHeqpSLdgV+CyBXMR
 sHS58SUGAudarQQATObjGLMK93rSKsQiuVYhza8UaoT9+HeCVc4aP9leOND/04tI4wiFVnnQkeG
 n9lZPDa4FoRXJVtnGXA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX3CDcmJQLR3ic
 9YTBWz+6zssCiyK82/BmA7E3kfhlmhoCgx5/1u3Q3ON3vCmzyAzt8pfDiGlq8YKVz2Z1t7PcQuV
 KLqbOdqtdT7t2j3dRUN3SQ6kC+Tsakw=
X-Proofpoint-GUID: Jh5mCJL61TXc5MABRmhGtBwDuqff6T8K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Acked-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/iommu/fsl_pamu.c | 16 ++++++----------
 1 file changed, 6 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index 25aa477a95a95cb4fa4e132727cde0a936750ee2..c83bbc3faad56d6ee1c89b0a7f74028af02c81e9 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -8,6 +8,7 @@
 
 #include "fsl_pamu.h"
 
+#include <linux/cleanup.h>
 #include <linux/fsl/guts.h>
 #include <linux/interrupt.h>
 #include <linux/genalloc.h>
@@ -933,7 +934,6 @@ static struct platform_driver fsl_of_pamu_driver = {
 static __init int fsl_pamu_init(void)
 {
 	struct platform_device *pdev = NULL;
-	struct device_node *np;
 	int ret;
 
 	/*
@@ -955,7 +955,8 @@ static __init int fsl_pamu_init(void)
 	 * PAMU node would require significant changes to a lot of code.
 	 */
 
-	np = of_find_compatible_node(NULL, NULL, "fsl,pamu");
+	struct device_node *np __free(device_node) =
+			of_find_compatible_node(NULL, NULL, "fsl,pamu");
 	if (!np) {
 		pr_err("could not find a PAMU node\n");
 		return -ENODEV;
@@ -964,7 +965,7 @@ static __init int fsl_pamu_init(void)
 	ret = platform_driver_register(&fsl_of_pamu_driver);
 	if (ret) {
 		pr_err("could not register driver (err=%i)\n", ret);
-		goto error_driver_register;
+		return ret;
 	}
 
 	pdev = platform_device_alloc("fsl-of-pamu", 0);
@@ -973,7 +974,8 @@ static __init int fsl_pamu_init(void)
 		ret = -ENOMEM;
 		goto error_device_alloc;
 	}
-	pdev->dev.of_node = of_node_get(np);
+
+	platform_device_set_of_node(pdev, np);
 
 	ret = pamu_domain_init();
 	if (ret)
@@ -988,17 +990,11 @@ static __init int fsl_pamu_init(void)
 	return 0;
 
 error_device_add:
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = NULL;
-
 	platform_device_put(pdev);
 
 error_device_alloc:
 	platform_driver_unregister(&fsl_of_pamu_driver);
 
-error_driver_register:
-	of_node_put(np);
-
 	return ret;
 }
 arch_initcall(fsl_pamu_init);

-- 
2.47.3

