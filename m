Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 994E743148D
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 12:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341947; cv=none; b=koVTieLysYoA+YS5k4DHDCWEm2EPlT4YJ18VdyCajDtcf0x4vLJ7TOU+uZLgiwVKDEYhQHq4FEcGHT6cBvyiGREDWj6jsBrxXe6wDJAVCVxaJPYn/mkKo8IRW1Ybz2Y7wlhAfqY2v2lZqUg1ayU8g8/E/njf/sbETA6mzVa9M74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341947; c=relaxed/simple;
	bh=dJOOLkzsh6Wqn9Xl+Q2MUEX+fF/xdnyRuGBTZrS3poA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XCZA5mMr9hzYf14wS6sySOwrcF2Mly36LQlCofLhhDd0FMPlqmYpOGcG2cWjt4YV8p/YTmyCAf/Uf38lQrUdF6Z46OPuwKM8JOIQN7K3h22GT7ly77Bca4WRyA5LXyRTHfwn9dZ4WzHS2cN62N4gLV54U5c/tN6e/1kU29LqOiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gJh35zU1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CiQm/qRo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gJh35zU1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CiQm/qRo"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxVQH402246
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 12:45:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p51jH23aSJ9P4hgPBVXfrJf6rqkVYzBZRhHms1xVt08=; b=gJh35zU1SYc059Mf
	kDmzOcoi8OfW6ne7PvGIDiA0fUt9s1YZpBnz5nVNLGXFepzjq+wO6cJlTtHczuDD
	ZGqYtYQUPKB+pVGNdLRTXkKNfZAAbm4v0ug8pX8PFkIaNGBY01+7NSHsN/u2HN5Y
	tbm72Yl/fWB/aTmvseGlpzcobggBnxVRm4q0Gog3CtksosQwpxEDcARFFDPfPkpg
	ChwullFaVKNGGJR6F92cq9S6BLPebAuiOUtq4Iz38rx+/oWMW8Ott0xZJiW+0YVd
	2dbOKMC0L9HHcKIfxWOq/UqBsRV7quCnrptznzywqiW0Xb9yNcRzTdtOklJNiczb
	qZigqw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f8a3grm42-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 12:45:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e623b0e95so246873385a.3
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 05:45:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341939; x=1783946739; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p51jH23aSJ9P4hgPBVXfrJf6rqkVYzBZRhHms1xVt08=;
        b=CiQm/qRoahtMPZRJWbQC5aqzHyFB/0G1ONeuvMHseN9m254OuM5P4uJ3z/VbYF+CT1
         Bl+gxaKUix/ojJMyjeKzO9NiF7sQl53fqwaAqntXRwmw/6PoiS7ITd+1Cv2CHzE5sua9
         vPe56xZLMoAmThXBF5QTFrF+gLWhMWX377Si6TCkJWO1901DMk6IgNrtVh0VmBOAkzr+
         MKWv64HbVUOzijzHmvVCUsmNRcBE7mR4YKJ6xY7Zunvk5EE62GgDD0EwOXBFmEq8U5Sj
         uyjIYhWWq1Hdp2gZEL4TlkPm3KBR67AvJ+CWQo2yNSCGV323+zxj49KXtw5G9fhJq0KC
         fy5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341939; x=1783946739;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p51jH23aSJ9P4hgPBVXfrJf6rqkVYzBZRhHms1xVt08=;
        b=GPejh++ut8CSZW90CPzhpLhxixZYtLOGKRxEq+QWbE1/hSVAUkVxnXSHpnAyzf6CHZ
         sM0krPpOQyNVi5r5XgQ4XrtBx8dxv1D1B6AAJJIkMF2D4Yp1s61sPw371azl2/VpXq4Y
         eV4ufB3xrKz58msNQBerD1R13YG7x2V5NybOSM/CJXHxGBLs9ckfxGnb1/iarteMdEum
         dlUQOya3nGI0An1SJ3opydZxn6o5tbI+m7rFvY+deNQXqITp1sME18B710EMfOxd0usx
         e5UXlXzQZ0WqIO66RuPvp6dXPvSRv+PUbWxovnhW5NoIx9xthuwzSoF1i+fbJiEC4LzB
         kLZw==
X-Forwarded-Encrypted: i=1; AHgh+RroxkfmYjt9XqMcAcPeFp2q55R/Nyg6rOTFHcbYLZ0TVdG5GhV6MX4RHwMs19Oi2pkWYu2NctmfNh9AFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxybzJFovE4IKWFx9Xi5qkt+uSw6VDciq7QZWwJOvJkw5RwGt4l
	BTiCjcOdmBEbWyEQtmg2b8hS2P2O95l1//9u6OW+/KeZbPfrA3uY1MLVopVurvuCMo7JOxm4gVC
	6gy/nEISCsgjVKP6VqId1FPGWjmn3H2wKr3Y8dPcxG417iUlonuw6bi+A8GmVuy87Iw==
X-Gm-Gg: AfdE7clH6hw32+/0pOarCmZYaxjAnvyl28xiWx6ir3+HAlbFgcbnPhUQCyadlokZFqp
	RuIdqWCyvTIJ8n6IyAR6QRZrRRhG6WlwsxHFPQr5wzRen172P6kYPxmyDnwJIGXlGv7Uxd+MNMr
	CkzBRDN/VsA7I0V58QnD1rElAv1+KB3Aodcn7dZsPRZYnezgZwt8RoXNBl7YIYQVBYv+QOVWrkD
	/CwPSdl3J8afawk0OsCxKaf1YDOOdW3nZr9K2k/uvQ+p/YKtGmxYlgendexVJRwKafDxAnPcueE
	YwPHmjfbmIKzW4DtVXYLYynUfyeWDQqHp+mQHSez4KlmWLwSappYsQP6ssuGps6ybuSpSbpkDCv
	oif/oe1GSu+N7P2Va6sPj7hyFmOxDh41C/Hpb2t+S
X-Received: by 2002:a05:620a:1a20:b0:92e:4b7b:b509 with SMTP id af79cd13be357-92ebb71dd15mr45120085a.70.1783341938886;
        Mon, 06 Jul 2026 05:45:38 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:92e:4b7b:b509 with SMTP id af79cd13be357-92ebb71dd15mr45109985a.70.1783341938396;
        Mon, 06 Jul 2026 05:45:38 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:37 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:28 +0200
Subject: [PATCH v3 16/20] platform/surface: gpe: use
 platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260706-pdev-fwnode-ref-v3-16-1ff028e33779@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=dJOOLkzsh6Wqn9Xl+Q2MUEX+fF/xdnyRuGBTZrS3poA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M7vyboAnx1GXm4N71aps9kZIgDjWS536X7B
 R0DvjC/PLmJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujOwAKCRAFnS7L/zaE
 wxGND/97BgjATyNhjWpgHVy2n/eBlvyk9m1ACiooUS3Aa21bdFHgaiofDxBxF2cMiA2c0EhNy/t
 yCcK3JPuDx80ppfSjGwmjnCJdeW76uOUgrIR9fEkRhfl5uXDdZ1UuNvgSgWqWLPpP7FiX6sQISU
 ekCOzOUytlF/cDiDZmOMYv1swMV7subHOQoxVfhIDmwL/RnlsR3WOql3VY6yXb48yLv1lXH+B1J
 yrWVkN8KdzQRCrBmBxI6FV2+Slzy1n9it28F0VGGE9eLn7HC+steWu0qWnNh3Df6XBggoSSSgD4
 EV4WaMWdLM/lWmxcqjsEOYh7A1HPAhrpPOfeelnV7dj7Q7t3fD3dF5G9ToZyjI1W/NybHHU2lum
 LT58xttRQ4UNCfwia5kKUaz6cTYDVIucBYOQyaiGnyC6BMlWkY4JjkrMp2YuEdsSxfG0+btmhsX
 lpyOd277A8TCDmgWDOzZ/8tOKvnV2sKttsOGgUMIWaihJYfQ/aS2xnC1dEAChFukUZlIWWWm3Qp
 JHwEuPx13B2be7HKRm6PQil7pRAJHYi9tAmAp/de98huRMq7OQpOJeR3s6aJtjpd+yrRyoD71Q9
 7X8ByYmBR/0kT9aixxj5YiEcTcNcX1dbwkXRGocTR+zDiXrImgKkI99Z5SjhG1gaRZAbVFTqEAX
 XDRBrIltqvBZ+0w==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: fti4v0ydeGZpIaKPhWwBLwgtBCIzIhnz
X-Proofpoint-ORIG-GUID: fti4v0ydeGZpIaKPhWwBLwgtBCIzIhnz
X-Authority-Analysis: v=2.4 cv=CPYamxrD c=1 sm=1 tr=0 ts=6a4ba373 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=PjYnKYjuuXkzxcC25kYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX2Ekun842A1Q/
 E8THm9X3OyAAsq0WxyvwQbZdw1RgmiyVvuPptsamo/5x0dZIMh/KJ2FhxxQAsx1dMGIiodMW5Ow
 2ui3/A/d5LGlrAANKlqF1Kw7+wtqUHnjtHE2gbu0PtprbI/yDTlcnMSrYQH1yrqAH45zyjIYyJz
 O4ViJayuqM/Va+gCGrTkmo0vpXWQ+f8dWDhM3mKkmup0/FywHVzEvQdkhmYFzhq76Oj4XuRCk4a
 Zo8NoQsQBUrYUdHMbna/d1UOqHQtrk2UUCnFd4/moPjOxfB25J3kOf68xXVNJzqasHWQQvnbCGC
 3I/oNS9YalnHyjJwdC/OprSdr+nYbHLTkrtAgq/SGD5qZVc5vCTOZLO22DZtlAcfF+R+KJKyjXq
 U425t549kXeHe2Gz1VpKHLd3vKvEE2y51giZJGhAKbgRHiT9axTBqba/519+LV5cmIb4kWG/e8/
 vu51XWuy0bf5FYWzONA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX8oIDCmz/l+MZ
 SsIDxOItpmLacsb8bgarBVxh8RAjVyEpIgOPWp6w/A7pzs9/t6je2LVzZnh494ijC6CkXxvq8fc
 guIVLJkNlkTyH43uy1XQQPVMYB5tZCU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the firmware node for dynamically allocated
platform devices with the provided helper.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index b359413903b13c4f8e8b284ef7ae6f6db3f47d72..40896a8544b0a4da4261ea881b1eaed62d93b32b 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -317,7 +317,7 @@ static int __init surface_gpe_init(void)
 		goto err_alloc;
 	}
 
-	pdev->dev.fwnode = fwnode;
+	platform_device_set_fwnode(pdev, fwnode);
 
 	status = platform_device_add(pdev);
 	if (status)

-- 
2.47.3

