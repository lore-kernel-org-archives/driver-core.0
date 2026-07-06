Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07C04481A96
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 12:45:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341927; cv=none; b=FUjsyjGyMhd58+kA3S8XEG8XmhVANHRaj2zzZccn4mVVX+e1WB963U+huxp59Y5z6kIb/122w8zsKN09QDi1oWsAxJ8AILBgTRB+2/gVn3rXeBrijXfuy4s4s2R7gqbtn5jJygFmylrGPlPK19TlInk4YcWKUXjBIIRqsKxsW9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341927; c=relaxed/simple;
	bh=Jgf74WxLCxW5Zz726nCnOm1WawVwm90mJr+JyHWzTfo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=shTeiNvOWhO6HdyRugoaUC5DRoqtU+x4zHZNQWqgkcOT1BDvtfWt/tBG/5H4b/MI5mxzP3tD1TQo24U08ZL9E2Kgr66WkZAhrym6Da0q79RjqV2b7AL03tUHMfDenj3mnQUf4Wy+CLRB08E8O5+a06wjev5desKcW18Cc7bFRAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pdv8xzeb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=BcRW+QMz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pdv8xzeb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="BcRW+QMz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666AxVOX369651
	for <driver-core@lists.linux.dev>; Mon, 6 Jul 2026 12:45:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=; b=pdv8xzeblN7EO7HG
	FH5xzwmFSqOU2Hgogzz26thWi65+vWdeyuOWD7eOyLyNa29P0b+SaswNqF9kS4FC
	KA1OVnpMYTn/40Nz2pxTYv4trMR0LigFtFqWn5NPzbosdepwcoCO7dLbSdFCU11+
	625Rv+YZ9WtsBt6QnCuBYwmabFKfoYm1Etyt6EIi5GTkcT84WTKLii+0R8U05BkP
	QzADCpTzhPgK8NnvXRccEl/Ux/Y7UZb18sHQKEENYHn17Kvs9gUu8wgAYrYfwdim
	kihEO6nIPf5AxXiTwzdTR5gncp7wXW5IQPREllLfupSbD+sMCFkBnKT21iqYXfA0
	EiG0KQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f88h9934f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 12:45:06 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e68cb7a3eso553035785a.2
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 05:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783341906; x=1783946706; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=;
        b=BcRW+QMz56ZWsPYfVFiM348672F3Ra8TshChrxfAbDJyZGd4//hCJoWDltWCVIUkrh
         +r/XLqnDs+dR2QaksMB6uOUo+6V60gN3IwfXmTHBab7CgvqnxGgWP8W3ZN4c+sZdUzoC
         pxJse2Zn9QNp8sC4dbu3MZvmh8SgH1MyiRWCL0m3/TSw6xvWmQvySqFFcuQAAtq3ySL5
         HOd9HQ7T56nmx52ns64zdywHkwm6x2zXJ3uuvWcolvJcjz7gsZOjHzQE0fsY+jB2rRA7
         G96LBcTDpRDWqggZ0iE8NtCuGDDtmwqF8JTGocCTPRjcJ06eN8jSj4izWTAHAzWjrIG2
         g8hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783341906; x=1783946706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4ypedl6lAdelBq6beblP/gtF5+9BXsm+BYvhqSYvSm0=;
        b=cIfLZOzyqG7X7UdkipHYplzzkIbmy7bQ0gCtOnxFtMV3wQ35MZwAEd93Ci9zOxrHU5
         MHoSxlrn4ZQ94ulTm5L1n3sssfpB/wuVDQrDG6wxnD/kEMFeCfHV4sVlHqHPaKtnsOJO
         2RZVG2yPqDWDrmIP1HW2DXWtf/11EpjOfxrGrhrk2Tomh+pViiE204axDmvJLmQEyGAX
         agT9+Vd8u/G3/DQnXzvEVwVNce37XENwomJwnTEi5JLp0MiT6OpKqn6DchybSMzCoIGO
         SXYH1mcftRCdgee0kYsLlGFNUP39Iod7HeiaZRxczzcjtGxis9e4cmlqmRgb0gj8bEwA
         W+AQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKzg07AugThFODCvBr7P/X6qvAKmjtEN1RyM4zoHSReavVj3+yFbWEzmv5MYAWBSpZ+zBY4YsgsVgEoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywy1SVENCRd+LuL5wKQzTbw2/euOwqO2/ipapD9MVz5d307wGm6
	kvCNt2NUsSzG9C85zI9OaAaIBFSjHnRUESabtHH98qKeB1V+Ll/25OJaC+OAOsAa7HS6nTigc8z
	zlJZJfrM3Wx7TyQeiSpWnUr53mEFBtvC4KjfAd8ZANca2uLie0ReFv0/ZqsjS/8mkZg==
X-Gm-Gg: AfdE7cmOaOB7fp3V2mrdPWhk5+40XZTYSHw9THnHmEAWM1sHN2lOLtSJFqte/UMVz3h
	xQQxtpOEu8qiXfuwEOoCUtOiUZnY4y2Z+A20HOUotweYwFthDLxGZNq7tRoy9uHZe+ELUXUF9wL
	PsGquiYw7J89BaRGOTPezmp49nsZn1SmtFe70El8exbcgo7+Ozx5E07Ho4SJ7j0DxS7VtkXP6Pr
	JiGh8nwrcOtmI0EyWW6/oghzCX+AtGVf80jgYX7D3jMSDStHIuyftV2DQ8k8EnSxcrkaPJfEe/x
	FwpdRD1Dm3iUwPS1FWGeyCw3/9B8EwAghsh1GaEQra8r2ObkN1qKWmV01tdMx47wThMr/0IwJMm
	ritG+/5Erhpipfbay8hNhBLJI4rdhvv1FDli/AtW/
X-Received: by 2002:a05:620a:28d3:b0:92a:e474:92eb with SMTP id af79cd13be357-92ebb58d4c6mr45838385a.55.1783341905922;
        Mon, 06 Jul 2026 05:45:05 -0700 (PDT)
X-Received: by 2002:a05:620a:28d3:b0:92a:e474:92eb with SMTP id af79cd13be357-92ebb58d4c6mr45828885a.55.1783341905233;
        Mon, 06 Jul 2026 05:45:05 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:86f0:c42b:ef4c:d3bb])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a55be4sm22126539f8f.31.2026.07.06.05.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 05:45:04 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 06 Jul 2026 14:44:17 +0200
Subject: [PATCH v3 05/20] driver core: update kerneldoc for
 platform_device_alloc()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260706-pdev-fwnode-ref-v3-5-1ff028e33779@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Manuel Ebner <manuelebner@mailbox.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1416;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Jgf74WxLCxW5Zz726nCnOm1WawVwm90mJr+JyHWzTfo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqS6Mye7m4WIbR8PkDTH2c4X+IwaDKU66SIcDpL
 mQAGRuCAsaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCakujMgAKCRAFnS7L/zaE
 w4ZfEAC41Mo4fJZG469yMU0Of0D0DGwRVaKN4uoZLlhdTRAcVxaepoBujUjtupSZqXiayqNHV5U
 gi5UTfW3wn++NDJyYjf09qZKyCOyEnE/UmdnwGURK5nJ+PshyBSYME0avY5FZHKVYTCIXlPzGqF
 UHC6t7eVnwL46lXo0kHJ7EsWs4t3tAPczpks24WUn0sdkVu3uPWOSTcCd94HIBE4WBs5ytMBh/+
 /FrSJqgIth1+QT2DtNBUdqqbCdI8jabVZp3kRhU2DP/pDsdKfBtljH8QRtloSKXSAddgv+vDvmZ
 5KdXc433Hkh/oTWAw8jbFbKHe67pgQKXGKko6LXTH77itBDpywUUWcIk/qEbCKQgqCku3xTgHZP
 H+H4trXem4YILFtiNbwsiQFtaD9iv124/YqQzguOiNSJYYbneWqaJUXkLzRdiHcklMRySNnUQ1Z
 zzlY+2vbp7eQSY7hvbHjthXmH7V3pryL4Y7yDI+OaiYJcYu8ca/YbMP5Lq2mqASntQtP0qTkBwv
 WlH7HQjT0H2v8cocaoPHpRRmZ6FmkINXxIXvK+awAkiCuscSrZeN9lSC36RmTZANo+qHicYPUm3
 0ymNHLd9ZEW7+c55YFCw8msnV5MMfdIaQF6xsNtguNg6ayHTyrtqvt38bkFvNglpZCmrVFxNFQ6
 Ysws8qDm8bTfJYQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 0XU0teGstgvD9OGOmf5SF_pjzDKru3dA
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfXyKqDgcHqfOcL
 fAbTp8fpHgNckrKDnKPakK0n8ur2mq84m5yxaFPjTPqJ4cLGRUt2Aorw/gWetRZYYXh7dfwlwzB
 DsPLHieWM23C2Aa7CBM2F/QzCj2BGZ8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDEyOSBTYWx0ZWRfX35vhFXBCcBex
 7u4W8qD2vMOLSV4pbMBG4a/lflMYOrxcW3qix3+ao/4Hb7kkTImSCF/V+n3wVp1cn5fIN43SOFo
 yeD/o/OEmXn1hAB1zD52I5CusoFIjr6LlysR017QaLYjBwfpBwP/+nMz4Wpd89Frurw+3y2pOcz
 Xxit8ZFu4srIVMoULNLUfuDcztYSLECXylyHDK6JkYbZtyykhfmVJWKcB7W7mrss8T3y0bnTXHx
 tfzQJX3nLT6saFDRtryPHhN4R/730GO9B/UxvgEwxlcLY4rmqY5AEq2ZVqAB8Gl7WlU+HjkR4Xf
 Yw9agPZ1KnIn1TvALFa1JLZlM6wpUc4rIaCbeOf5TGyG/2hAMK45x/W6c5AwPLHChVLkL5hSWh0
 ghhKMIXOhtlmSVhuPy4N6hUBpOktBFGpEa6jZJRj6WnaoEgsB1EFoaulDCGPpusD+WlJmjkOgYF
 uZeey0tStZ8rddlBdWw==
X-Proofpoint-GUID: 0XU0teGstgvD9OGOmf5SF_pjzDKru3dA
X-Authority-Analysis: v=2.4 cv=GulyPE1C c=1 sm=1 tr=0 ts=6a4ba352 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=b3CbU_ItAAAA:8
 a=EUspDBNiAAAA:8 a=1vxtNpAeqxpoFZHZEuYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=Rv2g8BkzVjQTVhhssdqe:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_01,2026-07-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 priorityscore=1501 suspectscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607060129

Users of platform_device_alloc() + platform_device_add() must not modify
certain fields of the dynamically created platform device object. Update
the kernel doc to say which fields are affected and which functions to
use.

Suggested-by: Manuel Ebner <manuelebner@mailbox.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index f24a5f406746b53ca9eaab9472f6dd1345e04ad6..9357942d0c79b032645035879b2bed3d53305b9f 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -619,6 +619,13 @@ static void platform_device_release_full(struct device *dev)
  *
  * Create a platform device object which can have other objects attached
  * to it, and which will have attached objects freed when it is released.
+ *
+ * The following fields of the dynamically allocated platform device must not
+ * be modified manually: resource, num_resources, dev.platform_data,
+ * dev.of_node and dev.fwnode. Users wishing to do the split platform device
+ * registration with platform_device_alloc() + platform_device_add() are
+ * required to use dedicated helpers for adding resources, platform data or
+ * assigning firmware nodes.
  */
 struct platform_device *platform_device_alloc(const char *name, int id)
 {

-- 
2.47.3

