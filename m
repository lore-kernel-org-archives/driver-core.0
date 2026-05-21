Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8156A3CAA57
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352695; cv=none; b=JfS/1Pq9gimzCLf5YYiWS7ZI2hFGtnYpqyIMsyWAeBIL/mYJq5ZgcCR+OEVMqbtsC0puZ6ypKeoQNjSGVEO4dlS289YMUfcVKJ4tUJSyBqumZkIntuLstR0h6cDGS/cIxX4CNfoErD7AVWuKSXY2AQOraJSM2zssfmGAEhVpZTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352695; c=relaxed/simple;
	bh=q0BBrKwJivsx1U3q4//iRRQAZdK4Wb2RemSiR718+X0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZ3/0veOb55rMxiOCraIqUJ/bo0ZTnPqcLoYbR61A1ZotezPw29h58Ou7K2rhRI9eq9lFBGDvvkvUoaK135Vn0T1QW1ixHqaXwryCAybBy3/cuijLUzOlfwomlF5A1qdhprxeUu/Q+uJlfoQue8YAqOYdpnlQ5P/8KXx1/eLYao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NaiPPQxC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Z+6EQ18S; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NaiPPQxC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z+6EQ18S"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L8MEAE748388
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:38:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3mrpSj7hYO1R358xz6evwVlbQEFwGLz67PRgSKvrF+g=; b=NaiPPQxCTakR9xCQ
	HAOnGWPoSIKRz2a7X0Blbt4DOnPGLT7hgydJRIRPTgOaArMCtJc5nh/f3Q5eL/J4
	tI9pdv0cWJrKRHJPhw8L+NEYjuTpoShPhmDAdtXAfE03RwRURDbROZmSrb0pRogX
	VbKnBSGXer8Hd+VZiTc6auJ2BrxihPdrwhSkImE2aqQzkdT/DXL753GnnCLG2QV2
	xwQ2gNKcpvN4eLDQpn42k9LQ8aujLUEil3XZz9hAfWs7c7nINyrRU3FsJ/ftxhkQ
	phQjh+3NoTmquC3mhpKSUHCxxRQcu994GDZ82TYWHEimad4JRMnRY7kIlz1O6Hk7
	7ef01A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9fb6kjdy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:38:04 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5104b861649so230859801cf.1
        for <driver-core@lists.linux.dev>; Thu, 21 May 2026 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352684; x=1779957484; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3mrpSj7hYO1R358xz6evwVlbQEFwGLz67PRgSKvrF+g=;
        b=Z+6EQ18SiIHWtCv0H3msvrYZLKOL43+5WosWwAj9qXBoKY/UeplAnhTcl42opajlMN
         kwMhQj4QVA2CGtglzpFsvAtd5S+FJaulCI/IZBiU4CXL/YSuJ7Zj/POMLeTcafHr2lw+
         98js643UlKA2xnJ8Xn0blee8s+pWZDtWKMPnSY9nrk+0KrU/LyRBqEVU/scVaMtVW9ke
         lzYGRfMT2JUBvbh/zL5IFdKcRbsS1wZYQphs69/MNIeXFzBAQYqoof6zIAIT0l2SlwKd
         aS54To4J3ezJaEM7UOCTZxr6RK78N+MkjzNm7yB4K7/5yvI0rKYfy3LmtYP5SGcAXliP
         Tp8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352684; x=1779957484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3mrpSj7hYO1R358xz6evwVlbQEFwGLz67PRgSKvrF+g=;
        b=PawkAiTv3hxJR8gI0ND9T05LK2T+noO8cj4UaO157bAIQUN9D7O/8Tj4B8BEh6E+wM
         gzTn5QfdsjQXVayzdFALs5NLgf/y6R46dloUB7l3hS21PqC/PFmmDlWgMZDGJ5kBizrm
         wh7jkBI9IqbF29rlEEkG5nAZTNYDvs0TcEZ6IsXUbZY3b2n3c4XLs02iNZlcd8mUh++A
         lWlq3iE4drIATIi/LaneaSP7DravfrUsuP8RhIPFTp6QBK/pU146n2SX9I/X3jGczorX
         fFyYc7js+v8SCvBijP8gj6qSkKPg+fWQLaczM7i9A67pmaVJofNxoOp2UPNbSaNxX/30
         OS9Q==
X-Forwarded-Encrypted: i=1; AFNElJ9IDL/7yjVzACM4Hf6arAnI0MxzJn0wBnasrsZmLUMcxwSGBAEqz1VdnHivP9yE2CdoRHYwode6MJ5gpg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDpsbqX+TlUyD/JnrPQNrQPio7ZgcGa2r1cq4ud/fmJMGFO4SM
	AsNaUtX3Q1roLI70Uw2cEGuiSL7/b4KYBTD0+UvV6MUH6VNPcQHTLf1CPOyuJqcUipBkbM+9xiD
	tcUStvJYTLr/+Vv/5scUkvGXUi3kxEtyk6jaomdMu1XiQpVXMnc3vViDG6rhSHBJKfw==
X-Gm-Gg: Acq92OGjR1GWLL277ezypJvA9A8PXD9VRoSTX68qYhLSQOXgJqqcKjFPpzFb1LYv5Y+
	U+E+2gmN+3g1ogPmdBmsJDJi+jRHoSWg4YPSbIZwoH1D6ZNsAmMH/8ceYOijB24d87N4cEss8Kq
	FUbwOrnqzY+E41T+dgaY88iONlpIsDa/cPX1pnux2tlxX8UMVM4+heVQiqVfPwOkoW9ayngr26h
	ySRbgBa9j4aOPKvmzcmE/JE+9PiWkavYUpmCblZQGL7t6cr3QAGZNuNbgufUymqtEUpn/75G3SU
	NNKCz66erAptaSdsYrXlsiJvKZnmI5OXEy700bOxW4vV3aXNysVf9KHMo3rFzAR9ePSvu46p8k2
	uYRmBpPd2a++RGm3dN/7swFRG59+nQuOPKxWtWINn5EACvKW+dc0=
X-Received: by 2002:a05:622a:9:b0:50e:60b8:347e with SMTP id d75a77b69052e-516c56016abmr24589251cf.59.1779352683832;
        Thu, 21 May 2026 01:38:03 -0700 (PDT)
X-Received: by 2002:a05:622a:9:b0:50e:60b8:347e with SMTP id d75a77b69052e-516c56016abmr24588411cf.59.1779352683250;
        Thu, 21 May 2026 01:38:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.38.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:38:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:42 +0200
Subject: [PATCH 19/23] platform/surface: gpe: use
 platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-19-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=890;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=q0BBrKwJivsx1U3q4//iRRQAZdK4Wb2RemSiR718+X0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQt0KUa/w8xmB04PUNyuE7AG92a7NaZhaUnP
 mJj39PwRpOJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7ELQAKCRAFnS7L/zaE
 w6UQD/4rfUM5cMoT5JyGjLafVOFuEAMOc90j4vuFKnQJU0FBGgfkBhxUzbYOhzKrncHxTg6Zkte
 mhYpnojOkwe7oqrccWEFE+o7dOAFDjcWoL0XCGF45N65gk3++u0Yx4L1yZeRX+1/MxFwbvOLw7t
 FwKBQcWM/DFEoUfCz+aXTRNszmzJ4Zj6xYPDsAKrn0IwrPangabw6sMw6uzkisg8PvVArLUnLkg
 4vNKnff31zVgEoVGWoY8esEvtxLgp0RsbEXIiotSTubVLEI21pr4/gKwWV38zgpd6yPPqnTpJoy
 dmxTUwCFDJkpoT3Idq+TVNWcIyn02UHZrRwsDlCVYmVQ51wfypaNz5tTOpMvEgeDcVkvxUIAZ2i
 yULGhW95dkUtEPV0VFi5jg3X1A2b+Vbvd+ViGB+7pn4K8qQVHVRni4OB4DXw0rYFTrU9L6XirXh
 QsuSw7uOuSVF+n2JUZdDkeR4qL6AyLuLXOzO5yrdhEijTNjDhRzOMN0tyEe4gt6eOhkNE8jVJWn
 o61cKiG3FXHChYk9gR+qsT7eb5EbBOtXwgO1X13FwAGQ7Z1KvzlA4EmmqMEwLsauLqOHl/azGVS
 V1aYTijMW3c/SYhdXa4jacKaO5oqpdlh8hIAaLEQB5V98OZNElzsuX53XKqZWBrYixFuWj8HYas
 UtG1L4x3L3xmxqQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=do/rzVg4 c=1 sm=1 tr=0 ts=6a0ec46c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=PjYnKYjuuXkzxcC25kYA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: VjcbuVVP7Jt6qx754zCNKyJVeEplkHaC
X-Proofpoint-GUID: VjcbuVVP7Jt6qx754zCNKyJVeEplkHaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX75J1YT35Nk5Z
 kAN9OwdvWTiEg8JVrIEOMS6eM2V0o49jXiGPnfZw34MApS0bmPZnY1u/YKLrWpn1zWMqmBYTjMR
 /vkWAekBw/ndmOMgTnnu8LghNJY3zTb7gAkROCXJOfnKUPJl4IpN0hdBVnsA43xIqACzIBQ6zYE
 XuzmqnphoaTDdttbaQUuY+tf4vj0imVDqX71dsedhAde8R51jJ278ohy9rrJR4WsmXyYF+fdmjT
 kAul6svVWOZTewdHMr+kcNTrCcuT6ut7P/1i96S/lVWUH4Y2MUjjkb8cAoqLB2E/BPujE/0HylE
 hfTqGFb1HRZ70xgJBE6UzCtCpowA77s5CmRdZMBPSyQncPRNVJdMCuqLZc9dZXE/kBOYsm07InW
 r4wgmXkrOCapDg3Ve9yAolyWgM0tI1cRNeI8z0Tm/gK/1LK3o9OC4q42vO21oCiDLLa1v5zIeBf
 rt5Jm6zCOZsPy6xtL0A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the firmware node for dynamically allocated
platform devices with the provided helper.

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

