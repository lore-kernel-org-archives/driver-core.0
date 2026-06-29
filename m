Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B977402BA1
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:13:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782724414; cv=none; b=DdDIMqF3/oBb5VUqqSRJRN3CCqfMV+y/ik2dfI0QL5wdqZfbeH3nsSdyqnDE7kq1kXkT4Bt4dEUciJVLi5IVeUg4Hf4Qzk6NNeeHvaxiz34P0MCp4BQQhuWZVOCVrt98qSGBKM1Hr06lVJxy+9IWDwSHkZMc+uUZR2khQ2jSNCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782724414; c=relaxed/simple;
	bh=1m0AW2cExEyKezaoaqpg9M8Sd9W7xIah4eoQaNoNaio=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZZHSW2QneTVoS9YYe9YLOXAUPmSvlCZu8yH2cZj5FYhUMAEpCWRe4ONqUiZF1jDOcp3uOvxrfbyUtnDgL9+wv3dhwf/WOs/PF/C9gFHw7LOOw9iSZNQv29Xjz6Siiz5CTi7EdWFUsWE4llTo1eJqbviGcZnofvU6VkbOIH8gY6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YLrjbRzb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=JNcFfooo; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YLrjbRzb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="JNcFfooo"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65T6r8Pm2076539
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:13:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LiqGJIubV46C/XuNtoDonnq8kzRgQ9Nd2r1gbru07SI=; b=YLrjbRzbBYmFp1KH
	Y2HoZaQbXuGUJvkgTgwOWjtrK9pG9fm3ZuYyicnUF2+5HPB7TscPcag8+n/Xhz5y
	BNojp5k9tclKQ8iF4yUsL34rdrR55sY/ddoFwlEO04saIGrqP9FInTNVnYC3ai+Y
	FE9VgvTn59oOumkLnuvTlpqgSa4/BqV5s7Ec2U1WqL/WSYxX9DQp+tz4URhyC+7o
	NOUNOwgdBb00bTIydhR0xFyvvop0WA++tA67XRWREQeXNWtFULQg47nRtY+0eeVx
	CCweYiv0RHwkM2cKfHAFOgElT44BugsDsURIPYs8OYxNux1HGSPUDuwuN7SfwBjv
	spxv2Q==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3kp7gkn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:13:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e53b8a302so91726985a.1
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 02:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782724412; x=1783329212; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LiqGJIubV46C/XuNtoDonnq8kzRgQ9Nd2r1gbru07SI=;
        b=JNcFfoooMmF3jKqxW0m6zYE+70JAvuEqedx8vGSiIm/eEtCAnwVbGrWsu6y+l1m6U8
         S74a2yzF+stkkTxrK+w7uAL9r7sh9pFNp71jwyp7y/xlenkcPqE3cOSLIReqMplaIML1
         yLnLE7x+GXqc0/gaQW8tR8T1Fx7nzVWqODhPt/zuE1UyFg0fcj5dUjDQPLQ6naveXFix
         7py9Ys9kD1MD5C3AouJ/XI4ty5YJ62SJCs2hNnE+Fs1eJNKWEkMKw2dxHnxNG+K80/uA
         4NNwiIiivteZoJWtBrRf2yc/evh7wzWtmPfiCdQlUTNoF1BXEYg7brH4n0gOKJa9d2pG
         E71Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782724412; x=1783329212;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LiqGJIubV46C/XuNtoDonnq8kzRgQ9Nd2r1gbru07SI=;
        b=X3DzIt9lCA/PZpHL/RGpmbZ1MGn/xmLODv/B9U6QBekpYYFexHyhdYZQgW8et1XfkO
         gW5W5Vs462837lvUN1c31NLKT5V5Tcw3LhuJi+lCTejNH7y//qkF1zpifxWyiFMCKvYh
         Kbcabu4SzfssSaR8WouFAgd9KJAwxuLtF7Gw4zT5xVKGLxWMvwr4zuuCj0EDXNMQK2VJ
         HVddLYmqrg7wShGFBHuUeXJhYWtOM+CNJjBgvVJS0VTZ3rEegtwg6TCASc7LLv5S//o7
         Vecd+b7MzV1LnrTkZK32KaxBykzPcwdkWkYGaprVO5/uFFLlKKi4iq/c64Zlsd3Ilq69
         tpEQ==
X-Forwarded-Encrypted: i=1; AFNElJ+msTNxBEjKKm0WULEcbVM+PeOv5Cv252ENnCSGEkB2WgBm3/9U6hHkNeJvT+j9+abcEST2foQtGDFCTA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxo1HKqNJA30sxJfVTVmJ0FamwVcZ+KlgCQXs7wKT+Mt2CUD0E1
	7tw1Aa3Hq+qZ7r6hQ3zwTAQ0DOZY2uipfcg1PhFDq1EsA5pKirHw7szTh4Fd+uumsVY7VSHzygH
	L1LawCsvB6e6/KmALUgEB0TrT7anxywGG1OugL94Re49WG776d8yJaGBVOQrP4WuAxg==
X-Gm-Gg: AfdE7cm9TfVhht80NPIWM4VToKlsmCxFgjfAARnYRKEc3/0qpGy96YhmIm6QQIiauPN
	Ik5GXJEOVIP3dGvo0FJ2o8L1n8j1bsWTQkrluGQFU42iCKXLERFflLUF/gIwr7i35+Wz/xYZWPN
	ZDPAAcpKFaGfHefTesshGo1DVrqvZsOPzeRYK9HWINuQdJiMVR41ar23vwZlalU4n5OaYmLD3ze
	yOiTc6GRyst9ahvsoDE7T0stScwU78FBZ7l4yJUbcWGZNGmSH4YOksTyK61ghUQuXz5T2L189Vp
	PSog5P58+iZqtIU+yv0eWqfUOIXyR5vkLSt/DkwCwPzeyK3wB+yAqfN7z4rVZX1DXYRVp/IoN4j
	0DZIG09lUt1W9LvQNuQYR1eN/u3qb9PWT8r7px4BL
X-Received: by 2002:a05:620a:44c1:b0:92e:54ad:3d9e with SMTP id af79cd13be357-92e54ad40a8mr234399685a.67.1782724411626;
        Mon, 29 Jun 2026 02:13:31 -0700 (PDT)
X-Received: by 2002:a05:620a:44c1:b0:92e:54ad:3d9e with SMTP id af79cd13be357-92e54ad40a8mr234374485a.67.1782724409249;
        Mon, 29 Jun 2026 02:13:29 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4640:d76a:6126:9b65])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-470f55acda0sm20109240f8f.23.2026.06.29.02.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jun 2026 02:13:28 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 11:12:33 +0200
Subject: [PATCH v2 10/19] pmdomain: imx: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-pdev-fwnode-ref-v2-10-8abe2513f96e@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=965;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1m0AW2cExEyKezaoaqpg9M8Sd9W7xIah4eoQaNoNaio=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqQjcQyzurssOLyeyJpbZ44XjlA13nVoOMp4FKq
 5FZ7f2+wTeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakI3EAAKCRAFnS7L/zaE
 wyWrEACG2jfBFV4TvBfRwgewJrn4MxZY9WNutkVnrkExL+M7S0eJJfGkP3U/Ukk/dDuUejoAZPq
 Sb8SC82gQT++7Px/b+D/TRPwIKXTnW6UmQ8FAi2TIsKTxV7Y0BFWyq3LmTfXizbM2/WWieYNGfj
 q1obXEmNP6PgwvgxLOWFzKk3aQnyMP45KHCH04+Azw3h80o389TeYER396jSTd6J8D1Z0iVTlfM
 kspWO9GmIoBe6xg1eZ7BSif8azWOyC3XZYrMHyM0N2/xr3DOSNw4jR6WbM1ly0g/TOJQyqyZ/bZ
 XK0kk6MV4xzK9uCp1fdLBufhgIo3HnLUprQPj3ypXUDqTXs53DWtHvSaIOPUqBe/e7pyGvPnoBG
 LBo3Z8Ms6GvyC6woMBczrgA1VOaN7rVQmzMhcWTOZy/K7ejTa/fQbduwysKFk8LAjCDSmjrBuad
 dcUiN6hnJHjImb37ruwv+NawTfliRSl2eEIP2fZfY1xjR5bUyjLzDtU5XDwyLvj7po8px8TWAJ1
 1PG5K7rrfKL9XK/lYkC1XTBtvco7sTwy02oSD2cg+YQOUecFEzGzFZTD26WnyMafToduI/mIs1d
 0X5Y/9B8j/BEfdQKBcEanz8PzvHy0mc0uYTjL3aycjoL6wAeXuh4BC/cNLOIJu0l6wQBFFLC7fC
 yDjtPW4DVmx/sYg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX8YuTF/VPI0wG
 eJ4iy0kHTIUv6Q2PeG06xVzMR0ICHZgdvET9BwiZmMLDGwCsaI5/T9cm0TKMqqP/UU1CpY7eJht
 HJLAGI8pvHbxytoJ4ShPeJpOLMu/JOY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDA3NCBTYWx0ZWRfX5MvWmsok2OQK
 BA45JUdk/vuh5Y6ifH6UbWOyBpyhDpsAOxMBzru8fjz5nKlFAx3bo6xXG1qgVYRy+p4zDwZchyy
 p7jrYNSlmJAFsKizEMOQKQnb6RFaXliP2n+i4qOTXvQGgvWFENCCGDULyVCWsUnrmN3Fx8fkN6t
 dTW/cJ/uZ4Gd/fxwjJMcNYukUNei4Yjk/EVdRrTMLkaMhBH46VENldPWFDLo2t/QPAuy/wa9Zee
 8JJox+sHfPDG/XymFt1+N4ho1XfzSFNwHu1sR0Z0Hs3Hwura91Lr1oLMIpAijLg9U1v9aaZJFmk
 QVt2GOBmAupn+WQypod8m6pDdveY2Q5A+obp1yfPqwD7SmJoFPGZDjlYeXTh3z6wuYEiLH9HYgQ
 y7f4Qaue7NfSKL+SamVp+fQdz5eUEYBtGbaCXxNrYO9MCoyl1BXNoRhRxstrWLX1c6TiwEnjIoC
 kJ1ww8Fn9v0eYPLYhxQ==
X-Proofpoint-ORIG-GUID: It3FixHq7Ec-ly1Kx3FrAkop2AmuC2pQ
X-Authority-Analysis: v=2.4 cv=MZJcfZ/f c=1 sm=1 tr=0 ts=6a42373c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=J9-S39C9qTGxOfEZqScA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: It3FixHq7Ec-ly1Kx3FrAkop2AmuC2pQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 impostorscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290074

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pmdomain/imx/gpc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index 42e50c9b4fb9ffb96a20a462d4eb5168942a893c..abca5f449a226fbae4213926e1395c413160c950 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -487,8 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			domain->ipg_rate_mhz = ipg_rate_mhz;
 
 			pd_pdev->dev.parent = &pdev->dev;
-			pd_pdev->dev.of_node = of_node_get(np);
-			pd_pdev->dev.fwnode = of_fwnode_handle(np);
+			platform_device_set_of_node(pd_pdev, np);
 
 			ret = platform_device_add(pd_pdev);
 			if (ret) {

-- 
2.47.3

