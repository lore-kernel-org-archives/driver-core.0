Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0D273F9278
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:13:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724434; cv=none; b=GO/4SuUoAn0SdgYxmh6i2a1y2W27S/rKgLSFeIFPYVd1Y/CGc6f2xGkXi9xtk8djgD58MWbQrG/ZPbVUaPRpKSBKPGuBmpOAxOQOjp6PGkT6W3y/fLFcVuggkZBafezW2Z02FnrRPb8cp5vQjMXvdCVzbrXMUHGVIu7K/jfn8Lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724434; c=relaxed/simple;
	bh=4q74vFm5uja4ZnWq1lcGzJHIM1G0GMuR0uWtoVmzh3w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=E3ojqD83xGSla5do2s6GnRCo31UOcekWe0zlJOAff4w/gWuiyDB/PFyzKda/Gq1/zwM/d414uwCTfqLducVM8crqRvfKMQdHVJarK2McbnIrV/Nvr4aHPfkxSMV4VdnexJpcf1xSR6jVnS3CDKE69ZL6KlyKOJXWe6YPMUzRiY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pBiLrL/h; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkrFCj1Z; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pBiLrL/h";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkrFCj1Z"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T8wX2f2391268
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:13:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=; b=pBiLrL/hYuKQO+rU
	ePrxQHLapFiYpVVJMeqqlJrCUakgS5j3y6au7ou9qpQAXazZMU6J9Up//h0r6mQP
	1351AZAcaFoIu0eoYC3KHExgEMiQ5kpzn7EAR0/LhZoAKFkZySvHRZMMBybkaEs9
	MidW3MKMX47N92sSvR80tS322/UVX4E13iabdO19NYxBhkXtPraCSbEnJSNVsklQ
	Ya4TR3ZKNEviFJi/w08TeHKgefV2q8CJk65DJdADQ+UewHHqye8koX6ffg93U2Mg
	Jm6NgNFPuCDsF5+1UYyvOtipjmo79mlydHqwd4L4/WiketDb+f+2o3JhCYYERY/F
	/gy4Vw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw829j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:13:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92b797ce02bso558514385a.3
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 02:13:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724431; x=1783329231; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=;
        b=FkrFCj1Zg3vQBCdmTbCPDMfacSkv0fdf0OV33J/vPHG0/8ldG4Kh/5gX8iE/4hpJwm
         Imtw0MpDp39DXwdHEADRFqHBuho9BbtXf08KmLQinkA0mY/fY6mpz7GJUKQIig9a2yoi
         1pSGS7IJVJwIZmb/Ry274n/0OcmZ6VfzKk0c004esGsfq5+hqXRiYEkN092npTqsqM7S
         lzXIVnsi/Qo8xiT/kOXHmb1FdylKt3aDdpcMrTeha55Yjz8r01mh3XJBKMb34fIZL+WO
         0Iompj8wOwh4G8b3drNU1Qu1YTxK6rZBi2ukgzNPTQStrMgeyhfj3jYlNhvAtZcYEAbz
         DZLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724431; x=1783329231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=69XgShsEeNDkbLdefBHgY7gGgfsPixaRaQOC3zvYX9Y=;
        b=MCOGRPfXQ2AAKZoEEcQKv5svit+6X2RAQg17BvWoRmSPKhRR1YImuG8DNk54dsN0EC
         BsVnXFRA4k2gD8IEDv9wxLDP84DUhHi4lgkxIGFCTYk+ZsHVrAOrghPgs3RwemtTd0Gc
         NDMfQjJS73AFA6RNpVHNIAkqUgkb6EsIXt6FNfikHdyQptWmZdSjcvDCVeSqvvnA0oqc
         En+FW/aVsca/mJ/+81f4lMkkiDDiBsuVOB1iltGmImAYFppbPcFbqMddRFSyQdFb4lBf
         VNd2+xV34R3B1zDp55TUzAzRhgy6+6YDAgV/NcBSiszbrLQEOT6vG8AIO/h+ScT4t8BH
         JCRQ==
X-Forwarded-Encrypted: i=1; AFNElJ86K8OEReQIusuoQYV9Q9Lqe8n7g02AHmv0Af8O0bf+Y4abNyJp1APagb29rkgaq98EMpL55J4twm39AA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzfhq7DJbv4meQT8OIT5UrHO0R/rkF+n2gJcxrX8+kWQg/XpuRs
	mtEoWNtAlhrfO4g4aVcmWcdakk1VqKHiIWKwvB4M8Z5RDO9JJC3oQ83boF8iqVnOVUv8LdwB5zW
	qoMS8Sty7bPA5IlSgqEn11Kutu5+izNfJEEsQeFtT9GGqTiDCKl0xLOfOuzvs/PmAtg==
X-Gm-Gg: AfdE7cngb2cwDmce+rhPr6pM8Wf04N7FsC4e+88m3Ds7BGFf2Wi67ZrqUYTJahATu4X
	oGSTuRPc+cud183Jx4sZHcG4XcP9vV7LmGN/dR4tBHRFXilxgkugckAoY6LTx++qPPq4vwlY2cr
	BnuFyyPY8fgIh7Q9GkL0OGGrenRyeNlKZA52vgY9qNizBOW0pvRNwWf1xnIT5Nyi1F2vd/cfI6U
	q2PykrsuWaxSxmHiXBKPkiQL9OvYCSLwrc08VzaiGJhEPyQpfWwwlVAxZBPM1raKt3/7Ziz5wYJ
	VkAQdEz4NMgiPglenY40dq9PEfkP/fKRXkIURkN3qRxqU2d2pEsq4Ah9ctgY6KIPWB/NipMOxyH
	lhoxn4A6CmnO32lFg3pEtOggKfEtKij7hR0YQfPZy
X-Received: by 2002:a05:620a:a0c4:20b0:92b:32d4:4ae8 with SMTP id af79cd13be357-92b32d464a9mr987655885a.8.1782724430937;
        Mon, 29 Jun 2026 02:13:50 -0700 (PDT)
X-Received: by 2002:a05:620a:a0c4:20b0:92b:32d4:4ae8 with SMTP id af79cd13be357-92b32d464a9mr987651185a.8.1782724430435;
        Mon, 29 Jun 2026 02:13:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:40 +0200
Subject: [PATCH v2 17/19] usb: musb: use
 platform_device_set_of_node_from_dev()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-17-8abe2513f96e@oss.qualcomm.com>
References: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
In-Reply-To: <20260629-pdev-fwnode-ref-v2-0-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=976;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=4q74vFm5uja4ZnWq1lcGzJHIM1G0GMuR0uWtoVmzh3w=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcUaoEAQ+rGtNym4mdXn6H+wSR5jovuUo4Xe
 W9yGwBaFkuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3FAAKCRAFnS7L/zaE
 w+6hD/9LyiWIfVxtqm4ndMyDneBYNN60hwgm4cXHCq1XpEjqnjcyEIHTyKq0I49Mp8FU9xpXN5k
 gQnaVVJJIxMCT3XeyUAxsXAhXnTNImA1TC2sZ/cTz3ryUteIURQPE8qc3VgF4KyMNH7LrlhVvH6
 mVXhZnUgvbwb1393J/lNIVJlB7A4PPUCoILoaFbJEZ3I2Lu2fKgtFcT5kmyU3LLpAsDbK0GCz/s
 xsHPglMoY9iIOvWGke5+knNUDHTadqb62yylQ7xFD9LCHeYhM+7ccdwrZBa/9p25vgwxULJN2n3
 zqM1MgrGYYkih87L7JCf3nBpW4gWnMnL1NfURb0Zlto5Vz62R/8UTrhMuS/w84x0/t31HCBVErk
 oHJibHcDBVb0IbGbPfGpf2qJITOS1rRiLSn40TuksrjJG1QAVul8rE7AD66q/ZlTmSP1QW9yMBF
 yGMvvd6BlGHB2wWyuiUWSffSIMvy0pvl9TXEfin18wKuOG2OFVpCk6HA1Lci6A6MQH+RmAavl5D
 tlxWgLoIWF9Zwwo5YAQpX5pEacDY2k7YkNdg87Msyp6ati7upxnfA16Kau8oVAKHJOmxITIxXIN
 2qvAYYTH1oq1ReTzfFHxdVibxbCpDOG1ddeqkDEwFV3rHpCaT95BOfXx8yhP1afAGlDp6fXzGx2
 pD/9VIfSZmKjbFA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfXzfo8snSWy0YJ
 LatuCpxzUJtWdWClVovF0j1e2AIy5mHQEKMtlAk2iHwycbMH5rWcZRRJM3x9H2DvMuU3UwUFcf8
 HZ1mkHo+j5arxixxfEhOpEhyFRsAr4k=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX4r21e+QNpCBm
 117wfeWJ8kA60vd88u7BQyKuBY7OW3+CAW7ZYMyFriHNCrTmCqTu13ot5y0TtuTIzRgbS988mIf
 a6AiLWCt0f8iM5fDrMcNBpfzIjmP3MGONz4OwUv1pdfVttT4xonHF23yB1+83RzggbYxaMgwnoy
 jezHio6CqkAidomWKZwPtxQV6pMPBy9VC9KExSeSVfLYtekJxC5LkyMN3MhlDEc0NUtw8vPVeLa
 Wdw7lrCfayalKCzL02C4O0gUqs3mIRyfCABHOFxH9e5ZGUswgahlJi/SPP68V7EIiFuxey+dosJ
 bCKWOGVrJvzckaofoVZmpYIZ4oeD7B2rnj4JAVi5Ifgh64yYy85eC9OdTI0FYoQBTmG3fozMYHq
 To9Nbg+KDHFn8DEGCEjmvI5suNC4pTrQpYgcDS9NBRpaH3GTatRv38woh3OmkVqE+GKciug2Ze6
 YrljdmYRcrysns22ftA==
X-Proofpoint-GUID: xhwDcCExWvrsVJNxeLOUwVjY77XNQ-s9
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a423750 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=-E7rG7sKBpYtUKygALQA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: xhwDcCExWvrsVJNxeLOUwVjY77XNQ-s9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1015 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node from another device for
dynamically allocated platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/usb/musb/jz4740.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/jz4740.c b/drivers/usb/musb/jz4740.c
index df56c972986f7c4f5174a227f35c7e1ac9afa7ca..c770ba576f05b6b672836753cd9b696b752d017a 100644
--- a/drivers/usb/musb/jz4740.c
+++ b/drivers/usb/musb/jz4740.c
@@ -273,7 +273,7 @@ static int jz4740_probe(struct platform_device *pdev)
 	musb->dev.parent		= dev;
 	musb->dev.dma_mask		= &musb->dev.coherent_dma_mask;
 	musb->dev.coherent_dma_mask	= DMA_BIT_MASK(32);
-	device_set_of_node_from_dev(&musb->dev, dev);
+	platform_device_set_of_node_from_dev(musb, dev);
 
 	glue->pdev			= musb;
 	glue->clk			= clk;

-- 
2.47.3

