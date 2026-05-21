Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED8DE3B9956
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779352677; cv=none; b=BawgTgUYXsJ57dX/K9kcjbBV6JYinA0zQKSp57D5dRW7Q4PBkWGREulTCEfrVzGIgCdJCwRWyaWZM+viYpWc3IyUS+Jp7+BNkH5oHSCGTqP4CkaD+7qQltw1E7uxdy2Y9uLxBZivl6wU5tzKAYfkoVZm6SZYZ/Cm/gCrVVIljCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779352677; c=relaxed/simple;
	bh=/a+MERyMSqDcoSUK0YpUrISA2FCHwIZDi0YPUao6yb8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JfiGVKvKng90c68vkTURGbbr0+zMT3sEDx7TY1Esrb+ifwJXM+FIHHPVt0yW6BhhSmdZQR9pgBlUQERrkObIlLr1F4ipjDGlRou7ZoYZPVtMDhnJpdaV43tshErOEBGkcalYDEBYuwffnYPjEHUXnVXySr8yZoNiwMp7GVvuJ+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YalB4pHJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SiN0MixA; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YalB4pHJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SiN0MixA"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64L7U92A119076
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9A2tU7W24wHfGN4B/qiO8RCtMLc7lIw3uVlzGKe1klw=; b=YalB4pHJpzpglVnr
	oLK/FB8peejpgKNYZsuGUsLbEL1xet26NbmiQzQ3XGxYG3KZSEiPToDswLtDVh7L
	dqIL2nKHwSLQL1lI0DVaSn9+ydVafD6rhYBH85aCJ/mp35B7n2X/TU5IwkBpyX3/
	KvGBx9+m/E0c0+whgpeKAEQRUbtIx0bML1oVyUKC2K6cFQNlaXI/re5f75V4TLFC
	ZByXbME/5ecAxlTTbmJ2I1IXdf4eYWJuPTnIVogCarJLERm6Tab5cakGkdDHrDHs
	Ux/dePNZWMSBr95PyUVOSVSuUITkrs8nfXVqsH6t806tbVlX0YHFAHtVM2EkSyPc
	vcikaQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e9ee8c1cj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 21 May 2026 08:37:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5165d10e036so83053051cf.3
        for <driver-core@lists.linux.dev>; Thu, 21 May 2026 01:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779352665; x=1779957465; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9A2tU7W24wHfGN4B/qiO8RCtMLc7lIw3uVlzGKe1klw=;
        b=SiN0MixAtS8Z5Dq2XaMY8Ecm7Tup4qOYtI2wFFSDrwsXGwTavMUPLcBVMHpPucZ84d
         x6y3XDJmFuSe579dskEdjgskqVcckd3J/I0J437KRQ5oJFiS8wa7Tlr7ZVMxOcG7zbLf
         loufap8Nk1zGbNpwhKezKRHhfvubSV09xhu6G1bOXjd6SOnAeXhGL6MgulLCMuWmt0Nq
         e1ClWOrf3ECmzQ4nD9dJc9N+GptYKy8pQZcWWonqmSyLeSKfkCpWVWAkmQnQQr/3bAxZ
         ydPuUZacGGUcZE0CoQa3Z+sjxd5fPtOvgw/dpnGx5Cq3qpDsD2wAFdbkCyzyzCW9/zlI
         nXJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779352665; x=1779957465;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9A2tU7W24wHfGN4B/qiO8RCtMLc7lIw3uVlzGKe1klw=;
        b=Q8kcZ+zON9Jnb1CWoPIn10EzCJv620AJV7w2R2bZvSXhH0bpC3EKtqSLMcDTIWAhYz
         lS0aBzhK0mAcJkrVvAqrv8ydWkDgJD6Wi5yt/BLwROrP9prEuuiL09vQZPg8R4Qsjx2q
         QiN7qh0rxNZFk4deKoI5P/Ly+6XKgk99CqIvJ9RcDs0p6i7O1wNA3HarOdXOjZGcVKeP
         HZKPgOs294infNIJQXOF7P+qgov1MnJdOfCsnBGEwGMVgzSJjajMPh9AleN3BFKDjunq
         u1+Qn76An/6rVG7CP6t6OnH6hXOv58W5ja5WF2EsLolnJc7UaSWNpHpUmZGfrAgBBCCk
         KEHw==
X-Forwarded-Encrypted: i=1; AFNElJ8XZr+hIqxf+YxFuYa+M08aCHoFmo1lGXgYtXAv4jov8Xf6Dztdof5yo+OWvhU2DNZQ8oMfz7GpxmCjMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1iLAve8vB80jA8YZNl7dNygZ4qbku1O15oFx5330MYBQUn287
	ZysQE1hHetCXKq1kxDJBVrNL+CxCKi98phG0rfPLN4Hh77FBJ2e8k0zkwQd2BH4AnB7/Juwbt3p
	afdHletELnkP07/3V/oDmw5NN6ZD0MNfrav+Ft5dsxymeNA2VXQ3rDDrZB9KecMsqdw==
X-Gm-Gg: Acq92OG+4yzcVPxiqUVbdvYVLkuesAhI2xFz9tFY+7uCsY+GS1s94soF7hepDVepjz9
	pBxwPB+fir+fNNpGm8feDBsQ0HnySMXNtLDZqfd5+gpaT3ohB0hIbWAP2pV3cJaKILxyYwn8+Iz
	9GrYiAYiMOXVEtYxoYAyZ9XSMmLDt/NPRjxXU3PduwahTqoni5HgwFkIJoygCtDYVUJQyt0D6O9
	Rg0Nk0YmkOJVPijpt9Q+X7Lq4AbApJXwPK77Rlxq7ue7Hk6pkcfVBmxLqjRr95MBYmnWZPaJaOg
	ecN7dIe9Q2jhyDZOkRRbM39BDVLze2C1ZYg2Cp0FRmLo4GZtLWELuE/aBCXaTM96rUb+lf3+sF/
	KXI6dM8RA+ohxm7ZpazZfd08wLZ0lmddF68kN82u5nSlux6IVApE=
X-Received: by 2002:a05:622a:4247:b0:50e:6183:beea with SMTP id d75a77b69052e-516c5541ae1mr24110331cf.23.1779352664102;
        Thu, 21 May 2026 01:37:44 -0700 (PDT)
X-Received: by 2002:a05:622a:4247:b0:50e:6183:beea with SMTP id d75a77b69052e-516c5541ae1mr24109441cf.23.1779352663505;
        Thu, 21 May 2026 01:37:43 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bb10:ae82:b7c3:d15a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4903caede9fsm10502405e9.14.2026.05.21.01.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 01:37:42 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 21 May 2026 10:36:35 +0200
Subject: [PATCH 12/23] iommu/fsl: use platform_device_set_of_node()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260521-pdev-fwnode-ref-v1-12-88c324a1b8d2@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1114;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=/a+MERyMSqDcoSUK0YpUrISA2FCHwIZDi0YPUao6yb8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqDsQotZe8en0K64gdcDUDXtpmS6GOzkP9zhLUG
 wQiRdRvUuaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCag7EKAAKCRAFnS7L/zaE
 wzJ0D/9ki6yMyfxj5IPA4WZXhvSRCjYfEyyzohJM1lkxI7225RU8N7R6I5vmcI0nALd2JoVBrQN
 dHQk38PS2J9r6YDUA0tfaqeE/XdOejp83w/mESILl91sCQ+Y2/ym4ncSQjVS1DKHZuHnT6P6iXZ
 ngP3JB4d3UEL+S9YdiXguejpCjLrxQsTwHwn56GS1T7T0E7Xdns4Y3LjqruF1DGdNXeXBnVhQic
 GkSLBbtCLNlnUMra+NfdQWune2cIBiRRhyajsiCetgjQh14UcVIkPcU2z4+4AQ/WJni0G2eKV0V
 8HxvZyJD2whJttOY1Nl9QcLB2z9x6HP8vHf1nq70L6FjX65o2V2l6upCy+ec8TamrRkKgieELkz
 EvNScrepAodJqwPZUTI/aFC4S63UkYyLS1CNtTzUcUFoK5RmT/Pls9eTFXp4FmOrkqOcQoTIhHy
 8tP9ZXTyJNRwr8yug/J1oB6n8a6D0xiOWEuiQhmCOSJRuBdlNMd/1KJ9yeSy08IaJYTF3DgCCOT
 Ql/Y9OBEipMJ9mdR35+DyMyacdNCH3ebjNi2LLXJKBvC7ZMIBN6mNrq+QJnTcmxshM7BmJ+Es8+
 XPoBDTV+KR0B8MFgJBV+Fl+7yZjHHn1yUlWKnChu6berFk+8LBbqEc4im1ktnXzJxODw+7QkWJN
 it2vrdcf7zOeI7g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: pHE1N1Br16r7CkFeGjZlB9B6HlnwWtFS
X-Authority-Analysis: v=2.4 cv=e5k2j6p/ c=1 sm=1 tr=0 ts=6a0ec45a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=lY9XkqB3srsPruLtBu8A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIxMDA4MyBTYWx0ZWRfX/aldw4CDtY9T
 PZySzjbbeZEyod3VfIFp4TiUdOzStPLzj1Ap6diFFHZaGCpgCNjg4xde6GLlUbst27uNArr5YyJ
 gW1bgtNfesO8vCHWVqTMN3FWB5bwPyM9Negio1+nv39kd7CKVSWB8BOzSP+F6H1B2QXt4yF1RZZ
 H5ER3qtpQHs1Cb6MBxA0tcBKfvOxnBpaLNXxTTmZqzqB8em24cS9b7F2/IUTz269vYKBk0bxlQo
 bAIY+XjYIqEGFCKtXO8s7tLPL2Q4UYXglQqs/75x9EFSV49/m8Qv/g0+Vh+uW1jxRw0uz/LtMWw
 O8+OvSVrGBLd7x724cbqxHYFqCVsZKZ1YgE5Fd3N+1z7DHEfpmLKMY6t7ZI8+xipVERyUjYycvv
 nf5/0UDlPYwhMrSuoKPlcArah+uFzdYFh2NAgIwLt/3nJL0H4CgC5EnjfXsqFSU7Dy+uzmxgrX+
 iLIVXIkoVjL467AEEtw==
X-Proofpoint-GUID: pHE1N1Br16r7CkFeGjZlB9B6HlnwWtFS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-21_01,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 adultscore=0 suspectscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605210083

Ahead of reworking the reference counting logic for platform devices,
encapsulate the assignment of the OF node for dynamically allocated
platform devices with the provided helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/iommu/fsl_pamu.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/fsl_pamu.c b/drivers/iommu/fsl_pamu.c
index 25aa477a95a95cb4fa4e132727cde0a936750ee2..012839fa0d8a27cafc6a441373f4f6da794388c1 100644
--- a/drivers/iommu/fsl_pamu.c
+++ b/drivers/iommu/fsl_pamu.c
@@ -973,7 +973,8 @@ static __init int fsl_pamu_init(void)
 		ret = -ENOMEM;
 		goto error_device_alloc;
 	}
-	pdev->dev.of_node = of_node_get(np);
+
+	platform_device_set_of_node(pdev, np);
 
 	ret = pamu_domain_init();
 	if (ret)
@@ -985,12 +986,10 @@ static __init int fsl_pamu_init(void)
 		goto error_device_add;
 	}
 
+	of_node_put(np);
 	return 0;
 
 error_device_add:
-	of_node_put(pdev->dev.of_node);
-	pdev->dev.of_node = NULL;
-
 	platform_device_put(pdev);
 
 error_device_alloc:

-- 
2.47.3

