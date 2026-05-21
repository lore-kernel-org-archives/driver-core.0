Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42A13BE144
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:37:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352672; cv=none; b=BSKoHkHLDlccNgNM5NQ6TaB18qbb79OKUev4o7gRQGEGngm8i6bUZNZJdHj7iNuuL5aLNsAkVTJQu1ylVrN/GvQQG9OMFUePvl+Om6Wb5TJr30fO8kSIB0HMvv28LwvjTjtbhsq/JKyp+mGBJTkucISQt5EQfTOpdqC7T4F5cZo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352672; c=relaxed/simple;
	bh=p+fQeVJ2vmWIeCxFE8NZdHeJWd3aLMCiwqgj0JdxAhE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=buK5fd4P6A4VPGZqek/syijIemoUPxJxas812qUhALJbMuWBOjg9yyo/5Wo4XBiZ/oX+E3n5LeJyya8rXfJX00HMQDc+a0UnkCJRO42SppqscWznoaywtE244RPqxOaHLVj8ys+NAIvYlByHGjzACXdsRJPU/+vCZG1z6Kk4pEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DaLgqQRJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gO8Ou9MT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DaLgqQRJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gO8Ou9MT"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L2TCwY3816873
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:37:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s8lmlS7ZeqY9udA3IoNxXw/VBQr0EeteGuDX8nsz6DM=; b=DaLgqQRJXv7nSfwY
	SocRU7aywBVODrbHtAfDYAcrqDXYdrxv4YfVOKrs9rMHPQBH4XhyoVJVj8+ftz+W
	l4heq1kv4t0PFEyXUsjQg5h1+NbAc3kQpTkfoR0eyax8su5UAckvnt10Ny/TNRxy
	la2aSjPWMezrt88xiGbTU0ba5+R4S/9lFdzfmKL5pDVL9I+gICRUoV3ToE+2YoYj
	AOLAEskzwK7IR3BZhRO8S6geG5/gXgtR35ZLGBFdufsm+1VDrT6EzeUwWRSFG4hK
	t+CU9A0tvODp85NkcBYdT3HGU8cZqxUvjFFKgDfUvu2ERSl2aaD/ycrVy5jDweDn
	/ebgSQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9saa19p9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:37:41 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51009190feeso182885521cf.2
        for <driver-core@lists.linux.dev>; Thu, 21 May 2026 01:37:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352661; x=1779957461; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8lmlS7ZeqY9udA3IoNxXw/VBQr0EeteGuDX8nsz6DM=;
        b=gO8Ou9MTDvIDBsplniSByrX2w/XJmCi8y2ETcbw/sefXTQRyKbbtKQyGhmyFLKRIDp
         1gU8elIOiVLaFk/SICR3PcdZW0p0JeWCmtRh8rlqmLmN1E0iJOmxJX1ntlvVDj8ZYyPL
         Pevf9lGvq6iBEU6zItU6wAtRXxuzA+v8m0QmUlmcsVizaJLgNnQfN2ALkguZli10rc1g
         Dm9XZYDtERiY/WS0tlEI07+kHemR0yXbVx3vcTto/5JF3uUEKAHrXWCyqk9iq/ZX2k0t
         nX11Znf+wCxP8VRCtPzrSJlFtoVvWDl3B5Nq6JZAi3XTEwxu35Wos9QeQ4m3ZfKOCgpP
         whFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352661; x=1779957461;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s8lmlS7ZeqY9udA3IoNxXw/VBQr0EeteGuDX8nsz6DM=;
        b=W3m9j+GGAYmqUvPlemXGWICqo4Mr1zV+baBJ13t1w5LashwgGUscC5K6VksY7MpBEE
         pmVqcxIizoEPu99w/fx3NhT3/pZxAndX85W+fYaesd9tcRZAcj6a8Wh60eP97l3SlXb8
         gs6HKsQfzIgddnYzJO3ZV6qDoHhVTHlvsdiwQAfuQQpEZgIbuam/d2JCxAeeN1rEADBR
         S/RAH/4Uv+fv8/82BjXl91RmB0Gb8cioFu8dt2Joo8EDILxVajUoLG17T2ljshztGhB2
         aaw2cdS7m/K0EZ4BrdF+5xQc27ccUcHaaXNdsJ7jxw104ivGHzcbt7h8RpYtESYxKo8r
         teMg==
X-Forwarded-Encrypted: i=1; AFNElJ8jx2L6KLotrnJjATSr/ddFub11I085UJUGh6YVILo3/LwjCtx1wcP//QJy1CEtlY4mJ4eJNvtqpf4DAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw/YXpqyGMpLfuZ174kqx/uElPY4n+FW7dZ4B5A5ARbwzUXQ8j
	IVYKwf+APucQCjjn/rrtIgQFQTjiPAXQxkYCXPImh6yieVZAWQ7RBQuZrOqr6tI6DuFY7Rd1iFR
	1PvP/SUeb20Q0SYP2Ow6leFxWParLjTn/MPM6eSWZbEeVwKV8GYgmSUVcuT4m3Nl4og==
X-Gm-Gg: Acq92OEYdWBpSWpQdoAiOkfBsvBvKDu4CjrKU0rG/1UNgAT8sQZ6pK3+t8f7KghFiCV
	3B5YZbGlH+fWkf7bzHVmteqAWBKIhQCcFqksXrQBayESC5AbGhoqt5AGg2DteclrzRc/lPDaFnS
	uuwd/K+L6k8TP380IwhQFG64H53DcyBJCVveJT5iWsUYicPI3U8YmbjauSRHsx16YzWxnEnBlbz
	uGXeobp9a/kbnBhd8fNzIHaiKCXAlrSDEw+iEZXAA0OXZ3MSIcbQUuuaPJh9ebm3bSxjXGZgQ87
	WVw+ah46OvJDW6EVvwsegTCXiXOZ5oWw7uRe2oK6Y/DMjiqVQLF87kAmrTt22ew8uD0ak/l5bdg
	ucjynFGKONa9deHq/+QDLfsCiCaFK8KiPHkQo8VY+7Ql9afYtcRs=
X-Received: by 2002:a05:622a:1e93:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-516c54a13fcmr24203181cf.22.1779352660859;
        Thu, 21 May 2026 01:37:40 -0700 (PDT)
X-Received: by 2002:a05:622a:1e93:b0:50f:ba44:ce5f with SMTP id d75a77b69052e-516c54a13fcmr24202871cf.22.1779352660361;
        Thu, 21 May 2026 01:37:40 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:34 +0200
Subject: [PATCH 11/23] i2c: pxa-pci: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-11-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=942;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=p+fQeVJ2vmWIeCxFE8NZdHeJWd3aLMCiwqgj0JdxAhE=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQo4KNVL307DNwR+/EfAcS03uVuTfyMcVo5R
 Ddt4Kdh/uWJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKAAKCRAFnS7L/zaE
 w5nKD/jttCuRwjJL5Z4Il89d2N0A4tqyEE0nA9nXREA+66qoEbjqQyieTedDwGD7MsX/6MSPxWV
 5CG3DD9FTc9h/ClROUNg/GH2d7w0kmkUywGwm9JyvBvlzAtQWqhuj075sIa5tYyeQQyFKPC34Xk
 RnsOL1rVgTEuFPw7IDDHaHI1wZ9tgnujchxPW/lP3+3NQe03UfCKxaQCxAG1ynKA8raoCqq+t2k
 tDuwqhRGAwWDfLmmH+F5oJMBzQm1CP16i+5iXRXocTOr5qSp23nOk1Z0Q3UloRClQzplCgq37L3
 K3IsTU3OSaWhfpVZjZDVu0OjtCMJSs1504goCjTXsrMMAehTj8kA5H2Q3oCJ1ybTPTXCrMu/8zx
 w+UhqGCrcQOhqlnF0W19dC/7abRToVks9nrDn5Nfe/sPPCCMCkx8LdnTYZg26piql+IHqJyhggI
 RkLs/3wvevoUmIlQEEGS88N+eHstmcvVdxGfGKcsK5B24XL9VaFYBNJEgnodc32ODuzo+Syqaku
 ZvCejLw5tSb2aNz/ngtwFBWmsvToRd+AshtUjUtEull4jHEwNa8fuhJk1yBf1zRRFEGMAvVSQ9D
 2oogJMuOeGt9NYmDMDCE4lV3vTJHw/hkkS0pvxsEB3/vQzc0MTZu850MXdoOqqqDJ26YedDWmog
 ilIGvILVlz2uM
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX3nMJ9qRtwDG9
 W9CvO1WfyrPeBePw1fAAXtNzQ0i6NolV7sTRU2oT9conAyaav34yxm4AH5S08j4N6iNdWxuWRS+
 ov5WfSOhD4FeTfsAlujNqJhh+EW1HzML8qFl5R3DJcyKlV8xVbJaGZ7d8r/HHUj4a4geLRMPvrK
 aCq6UDrDFJAMkokL/9Vop+ZFZMgZICMqFjCw+xTqS1rX6Q9hFkm4n6IRenI3FUBbli58NAr3SQS
 nEtAxeHw7q96N0/h98pVORLCPioOjS1RU1eigEdjrizHz9oIn4QGY/+0s8PsficEblYA+MjEplj
 90/PaaXVctiA885Zhgkk1xFuNXnDzLotz/qOSG+FnSn+uZk9WCLBMGworzrGCqQmCKJecuEHug7
 ni82qQMxD8dbEedTvGl6qE4rfaDOliUwI+uOsW3opcBHFqGdD+hHUAQu0er84mJQ8eX8RKRptpq
 hq4F/88x7X2YJvu+BiA==
X-Authority-Analysis: v=2.4 cv=Qe9WeMbv c=1 sm=1 tr=0 ts=6a0ec455 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=Jb7EFCjKRuSTjX4XlnwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: pYpmVL9A0Imu8gr5UNiN-nhygHISHJAn
X-Proofpoint-GUID: pYpmVL9A0Imu8gr5UNiN-nhygHISHJAn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/i2c/busses/i2c-pxa-pci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-pxa-pci.c b/drivers/i2c/busses/i2c-pxa-pci.c
index dbd542300f80043c6bc65a69fa27ca7b3d5fe787..92a0647f08c69f841ca99caca757c1728b3f6fce 100644
--- a/drivers/i2c/busses/i2c-pxa-pci.c
+++ b/drivers/i2c/busses/i2c-pxa-pci.c
@@ -76,7 +76,8 @@ static struct platform_device *add_i2c_device(struct pci_dev *dev, int bar)
 		goto out;
 	}
 	pdev->dev.parent = &dev->dev;
-	pdev->dev.of_node = child;
+
+	platform_device_set_of_node(pdev, child);
 
 	ret = platform_device_add_resources(pdev, res, ARRAY_SIZE(res));
 	if (ret)

-- 
2.47.3

