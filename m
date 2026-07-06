Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADA734C77BD
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 12:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341944; cv=none; b=hXPds9ahPIcDnGj7mlF57QGrz+DRvgJtzd9FVHgGT/fRLGbNqxA4FQDKMgxjH4PzuUjJq1OBPo1qhJfcSyfpaJdOdo9S1AgOoR/uWPg6CIPXs6xxzrDZgTKqNX0BAQFjiTC/wswZi5rcwBY23n6qpd68q/WpGcYNO718/8yEZBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341944; c=relaxed/simple;
	bh=hK6KuPL0Fkp2tcUxylzP/EXq5M4YtzoXDw8O6icggM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=njNdLO2KRv1G2wEZ3ATiSg9Jr7FnjFpUjVSZxOxWUi8F7TjTNrrCiwfuvGTZ411PhO0NPTzNFBBX9jB+Cm1o/zrL2OFko2/Wgq9iEIzIYHgc+Cqs2kKB4DdMUtwz4wuNGzMxAwUz1rluOIwt7SVyoD6PADgw6x+lxAJB59VF9MI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iwyNy+Ih; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Dx8bcPQE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwyNy+Ih";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Dx8bcPQE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxUHY361592
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 12:45:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cXUi3uXAyC4OxWqNWLbh5atOLaQPfv1B39yCRWJbLQA=; b=iwyNy+IhGsX+O0T3
	2kGvU6ImOgg8EjDd1o5sbToLqJ+h+J42bWw11oOKHn2iza+sGFzhlFcYywkcJUBy
	HeSBI+6jTPzl0z0WmeufrDDA3k5b/geFNZabQnp2CL+Ab9ynYk2AcTRksJQ/+rYe
	E8Hctc/S4ThFCUuD1dnULxTglMrmx1+pljFRLfA8vCQppBG+3/6+TAL73/TG4DsL
	cBQEsCgQEGltOsP0Mr8x83YCo0df0mU0GDYCtse3AL0b0s8CO2JFE81P1yUgB4qM
	HoK/QkxTOUS1TNlrlhR8hFCSBgrY6afF2PMam+drQNByb/XsozJ0CPCVjg7gkHjq
	5vYUhw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h512f4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 12:45:25 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e59b0e0f4so223931685a.1
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 05:45:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341925; x=1783946725; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cXUi3uXAyC4OxWqNWLbh5atOLaQPfv1B39yCRWJbLQA=;
        b=Dx8bcPQEuhoQqNEj5nkRpkKYpMI4iF8ikph4bfknLK+1DOR1NZ9TCX1ARcIrPDWPpV
         FWEs8GKCjRsFbF5x5CJmj8pDSJ5Ev0BzMrjgKaLU8n6TU/zK0CpbEpAb53gih86LKK3w
         bfs+sQd1Euhxvb5WFnRh9TSi/i7d0vJu9KamrlFf6eyDO7ssuBc6R5uLzQuXEwNvBZm9
         R8G54v0R3ii7LjxMgpzpHDecWl3Ijzyycog4DuUuvW8NwA03OFRd5rPFrARkYimI3AqT
         33dqN50KedheMT1LtNNj+heDWCcVFkLJXEDhiYVCyWF0aNM3VyCSq0lOJ3R1aC/WRBRo
         gU3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341925; x=1783946725;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cXUi3uXAyC4OxWqNWLbh5atOLaQPfv1B39yCRWJbLQA=;
        b=T2c+O4VpPu5sqkySWF3lv0DXliIfyP8AIDxGjNiGOMwTSHsiwENVtEdoFt+iGLMQg8
         PKbR8gxKCMO4Cs5Lyozs2uk2FPg//u42JW3nUYFUKftrn/LPSOgfeTC3wsbDbwJ8WOxR
         A+k1doRQX3LHfHcnxokH4fwfj/PKEo7GgW5ALMsCy9QWlsnI8zPSoKenkfbnS6PvVQcs
         iiHjIsYMJF/jOr24FK31IHj/ymFKnJ/vprGyAqdKJTUVvqo5Wt/JZL5m38U8Ey/iAfPJ
         q1S4oRKE3qDlnNgdnxFdbcIZRAzUFsL4rUQ+hr2YzssD2CVKYQxv8UhY6akGf14aErDz
         konA==
X-Forwarded-Encrypted: i=1; AHgh+RrUIz00Zy7ABt2SMXDEwstCwv6UBXKprrr7YOXLs+3dziCBcpKMEq9QU/n0OgD4eTYEsX1Vb+yMLyY2Tg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVIeagl5O/FXEYak2d9OCrrcnWg+FSGVwAoKuzv5hiW4z0jtkT
	uqX3/gERcvNk2kayFAnhWrmRS8DOz+N2oKCw7wyT7s9FYK99mbEXv6byudP9WV5lgzC3kWldpz7
	OFWwNEQMCn/qRLyv4bKmGbdNNBkI0/jb2hnmwXoz0RkUrug2r6e5dgGC3IamMAUzODw==
X-Gm-Gg: AfdE7cm3TZpCaSHAWyeyVimkVHhC4/A+iOjzRXNa1Gob0NbKJkoxxhL3zvIabTjzhWR
	hcvDM4R9rlwkKK3qhpT3ct2W4FXTO35agfC9km67k11ROeNQNMzrgAPVS5hVHxTFrH2HwbgugkY
	b4QYOtcUG3Fb4r1TP6zj4RA8WHfv4aReSd7s6KQVPGWH0j4Ox4EMMJM2k6Gy/hcrRqdMKtNPVgH
	YaiNJtdwonfTa9/JWf2BX1swgZEYV+1X3D9LXDR1cltneWp+3LQk4ZGxbKZ9Cv2GvZzXHinz9/F
	C1kf7iYq692cdAbvTu2ARv5AeBpeuLTNZ73ETiN4sPXb1hJYqKKbvAOExeYXFkdhOVlKLFp7wrI
	OIlVV2HpQlQJwMkwig2lD2EpfqWnnI7bqCTaYAtE4
X-Received: by 2002:a05:620a:45a5:b0:92e:6a8d:38aa with SMTP id af79cd13be357-92ebb715eedmr45289885a.63.1783341922287;
        Mon, 06 Jul 2026 05:45:22 -0700 (PDT)
X-Received: by 2002:a05:620a:45a5:b0:92e:6a8d:38aa with SMTP id af79cd13be357-92ebb715eedmr45258885a.63.1783341920254;
        Mon, 06 Jul 2026 05:45:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:22 +0200
Subject: [PATCH v3 10/20] net: bcmgenet: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-10-1ff028e33779@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1146;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=hK6KuPL0Fkp2tcUxylzP/EXq5M4YtzoXDw8O6icggM0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6M3t0pRyIvWtZ3y9/kmYZJtWQnTZ1JwDAy//
 CsWsDHHr0OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujNwAKCRAFnS7L/zaE
 w63wEACOGysngK2nm0QicOyzdn1brppnkLrfHtIsrAcQ6K/s6NderUhLDryX4rcF0Rlw6HmXmNg
 epZ48Mx4J3UnU+PRjfDrDnU7GawDhxMjlqB61QqqSdtHlPaKbywufH/xrDNwSFspkipSNtateGL
 pbsRAUIsu1IhDvDMuRPtomMEHwKt3wvaMhy0QEkDyZF4RLJS1NjqlqECOHe0BRxBAP+OmuzQTpa
 oMxis5dLIqamCrsgjaweckAFttguLVhpVoRa35V3tgqh6G8gMSA3vYFajE3vVwlk9P5ts3bhHFz
 tSISSzP80joTF3QF3/3hyxGvP1lF2NUBgNAJ5TISmI2kZoyGmzcZ2XDRgjMtgfxjq6xpnwDjRIG
 9nKCfeqppxo660tr7LATQCxUco2jllbHz+6ma7aeybYxfpCvOfBoanPl0fme6v2jXuG0kA7S0cg
 Qig0wTZq3jZ+0WRSOK769hUG8E8M+56X+vajU1q/woTmsvsIhotoZ/IPu3Q7pTh9TZMfRHz5tYg
 JfQANXNXaMH/V5XUAU4mzYNu7cq102DojDBd6q+pQQOUvFmIsFFHwxAPS2aUMGWPa1Cb/FdACap
 rNKF8e6iN/oRaSKbqvIh7KwkYlPtsbqdUYAP4dxlBT7SznOUKolCzhD9ioxnchcLdrjasucBuUZ
 iHW2JM94Uq8jnbw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: bKrnl82sbGUXz6GOWHlWIQXK-slznT09
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX9vE8DpwS1SjQ
 nvLhB6e4gY/9k1X2XH0L1JQMxtV0Wj4JVJ3mVszaup9ljwaN/pt8H+rr1/hZnxhgUURBAnY/Evi
 jIn66AIbiLOBmc3mTAo2y9OLPcaHLLc=
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=6a4ba365 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=S253l8tU-mt40G6jxkYA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX3ifLj0iqLWT7
 W0uxIyYDrnsQuUz+OcbB9FDGiIadmZz3uQxMfgPrhO3ytIomRpWNKk1FNqnbWB4gsAHbI3qwYyw
 z6LAb9yaedhPU0m5fiteOiuHcfw9895G6ft6gU7Dtre6Ni1bYFlx/sN05QQf4vE2dLzGstClmSt
 Q9I5yLYwAlpcZRb+4Tlf3L2ImZ5nRZfpd4o7DlakneZ5FLSL4JF9loKyNljisTbp4/QwkJZT7om
 /xJDlU/bqUWeI7dgvxqJaKBL7AfrIuD0SovfNkNQFZwXS9ExV/8v0q3gp9ouqSlLhFtbYB8D11h
 q2vmX8W30zJcy98pG2K+eWQ1pHX0VIKzKNcIThn2JhVH294hjuSboeW4vZQ74Rg81wMORmMHe1w
 G63ElcaPqe9UuBxXYf6pg6N7T7cvvuUQq+MGMpAF2+5NwbWw1wfZ80DJPbQbLz38pVZf+VUPc4q
 7Eeb4KI9Iqt+YX6eGbA==
X-Proofpoint-ORIG-GUID: bKrnl82sbGUXz6GOWHlWIQXK-slznT09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 spamscore=0 adultscore=0 suspectscore=0 phishscore=0 bulkscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060129

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/net/ethernet/broadcom/genet/bcmmii.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/broadcom/genet/bcmmii.c b/drivers/net/ethernet/broadcom/genet/bcmmii.c
index a4e0d5a682687533a1b034ccf56cdb363d6b7786..0f0dbabfaabbce3469de79af91d7731b8476709f 100644
--- a/drivers/net/ethernet/broadcom/genet/bcmmii.c
+++ b/drivers/net/ethernet/broadcom/genet/bcmmii.c
@@ -490,8 +490,9 @@ static int bcmgenet_mii_register(struct bcmgenet_priv *priv)
 	/* Retain this platform_device pointer for later cleanup */
 	priv->mii_pdev = ppdev;
 	ppdev->dev.parent = &pdev->dev;
+
 	if (dn)
-		ppdev->dev.of_node = bcmgenet_mii_of_find_mdio(priv);
+		platform_device_set_of_node(ppdev, bcmgenet_mii_of_find_mdio(priv));
 	else
 		ppd.phy_mask = ~0;
 

-- 
2.47.3

