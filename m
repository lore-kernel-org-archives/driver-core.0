Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBD43B8955
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534273; cv=none; b=qGad5rOOUE2X0XXkHzAuXY4kJJmEPPRa5ir/Z/Jquov9HDi4sfd7EVtvcaUwX6tNqWuYPvOkh8InnOOR39+w1QNBys6Vf8W89aUPorRBEsUz5xtAF3BiT7RChIRliJRbEu/rAc2RLvdzRbaMdvVcAbuhFwa5T1JaaLKuciDZ1AY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534273; c=relaxed/simple;
	bh=J8vOAbxHqFIcemhsO1j1p/gwR3qJw56MPg1KBgWm1Zw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LPs3oktZQ/RUQS7OCQTGJo2aul6rwrIKghyu0NAg0Ej7wPCx2US6r0j1XMp/GDuWKanSCI+m+9j/+Kk5ihArsMnOXZcCMmZiW7v81li2nLgalRb6bNoanxJ6qmMqOLrFoAaOyjQ4Wm/08+E6kQHUXVYES0yjKX6C1Sy+qbCoBJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=biQEilki; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=d82AL7cf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="biQEilki";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="d82AL7cf"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U44aqI2099586
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IxYfci1kXSVxnQ7Is9It7s1mhDgddxrEV+/CL+oUtl8=; b=biQEilkiXpipI5BJ
	3ya0Lj73D3h7iTmWUk0Isp3hmgxiMFZepJVx6k4eAkdG0EvJZNI65pJSW54F/HYH
	/VTFnigFknR/CYAR5SmpVQgdlAz1xAdBUMPkF09gVI8zBKQ4YDvVeuHhBrrsugve
	WfShuZB/V6+xQv2DKwWB0No6gYMPzVsIFOAzAKwSDUJ/7YzIQkEKoOjI3cCKjxug
	KPj+LwwqewTkebdRzoKAY9kDfxuDo0Ff0X/ulc9jyGQwaqlqMT4xPAwvPVxgNJab
	L3LNzkU+IRXOkGa9p5wRnxMUNWSVtqtt2XeziAD23AyRqWmqJtjtUvOd31J1KtKz
	RCQsyg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duyr40mr2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:10 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50e67a4f642so11857451cf.0
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 00:31:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534270; x=1778139070; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IxYfci1kXSVxnQ7Is9It7s1mhDgddxrEV+/CL+oUtl8=;
        b=d82AL7cfU2RzEeq5NGz6L2jUTYuOwI1xg8PnLYrFEEzeexLcowemqRNZQceRdXelWu
         +1b8eBofVFCo22mPvrSazAol8Upds7peFj0csrPOViQWrYdFuTh9RVYj4TKnyri7QsCg
         uqYpG1nKj9q9p9NJ3rIfwXESbK1LwSnHxrk+IMG2M0+8qEMI/HvLlXzTxcipSsWLm+BO
         EaAeFUH64h9eOMLIQ3xnn90FBwZ9ANAb/KrkM367USoBLmMcPZRHdrGG4CbG1a8GuXE6
         Bzq1DJFxX25PMwqqYQByD26YUWWcFiN84pktpBuQHDrtU60dSHBtwnXttF4PRlEwp3AE
         77hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534270; x=1778139070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IxYfci1kXSVxnQ7Is9It7s1mhDgddxrEV+/CL+oUtl8=;
        b=TcQ5pR0xzcgnXy9mmx7TqyLUvGxMRWa28kqvxdWWlx+lcPLe1c5oQFfUTwb+J6oy+x
         wqSSBU3EQj+na4LShfsc+riHTkkfVX5qdFJStvP98z8eD6yzIj/Wt+sLfkDp1i7mnU38
         SreXtkUZpYveLSKxUuB7nSnsZoBBHKpqcH8Ihx0m/0IyLY4g1g/Qmu2+0w2OeIsNMwmN
         ywZW9KVsJjeKX3csBOG0UJ18nRt/siT8QcFgp7tiVKP3/+N/kZx3IttrbP1NQLuLeoIF
         RFOsV5imqu1+DYDrZLLJjTCB+tUpBYcrav899aCv0g0wHhRvFOe0xAvjl7UJkcCVsAfT
         qHVQ==
X-Forwarded-Encrypted: i=1; AFNElJ8kW6nCc18KEVTNPys5e+9IO5NCVzy08elgVSWiKKD0mJ1MkVBJkHTavAqO9rkHHu6lqaELFMi1SlXoAw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzK/mTpHQ0Oq2mxP57jfelynq7l87GEUFsnBxEkSfQMvk0W07Cu
	yor8WvcMVwiDqNY4XDweWRZFSX5leGhBAOXsrY1kWuQ6FNmKS/98T7ePQOg9p+Vz4NSN1pYp9Fn
	ooHpoNqoA92HNGiH3zTBIblsxFMqb7AvBq6mmtInuDcgj6UI5QyXYL1N2rSZh96rIew==
X-Gm-Gg: AeBDietuYrLZjiJ6k4GVB0jKS7bMlK0ZgHMYfCsfb8LwZm+5OV+eMkNiY4c7i5cvUhY
	a7kWZ2eAiLkbjBrJt0gAcWXNeydGZ+VGmD1wD4ILODBSWcz3Ew3t8mCmaH5iYMVrrHbYSkzCO2D
	RolhgMXBWBb8hLRT5Pn0Z9turwf4aSOqYV4wj3kCYymhwkuILaL9fWR7eFZurAgLhkQD6sDWuMG
	VS4qoWjlw64XCK+8Xw3ESnirgi6Det2CQYlrSpldjEa05fIuIY4m3MOnzKCUFs2/l3rvi/ISz/z
	OhnodCpsO88yOhtyyo9l+JpuYm27rQpr3SgBsbgMX/r21PgUMEEgsYtT6+2XP6Yox8HhzOZrEAV
	YEPzvz16xHnhLqzC6d4S+cP/VQQjM5PW/gAVUn8rdJsZO7X7dAVrw69ymaiFG
X-Received: by 2002:ac8:5a0c:0:b0:50d:d1ea:65dd with SMTP id d75a77b69052e-5102ab5ce91mr26359891cf.14.1777534270190;
        Thu, 30 Apr 2026 00:31:10 -0700 (PDT)
X-Received: by 2002:ac8:5a0c:0:b0:50d:d1ea:65dd with SMTP id d75a77b69052e-5102ab5ce91mr26359251cf.14.1777534269537;
        Thu, 30 Apr 2026 00:31:09 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed69fasm59515035e9.3.2026.04.30.00.31.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:31:08 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:30:55 +0200
Subject: [PATCH v7 1/3] ARM: omap1: drop unused variable from
 omap16xx_gpio_init()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-nokia770-gpio-swnodes-v7-1-c88f74c90dd6@oss.qualcomm.com>
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
In-Reply-To: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1037;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=J8vOAbxHqFIcemhsO1j1p/gwR3qJw56MPg1KBgWm1Zw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wU3IFS0fzm52KuRz8vZ9jnjkYXKp8dgiD8yg
 rUMlcVe6cSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMFNwAKCRAFnS7L/zaE
 w06dD/4m9RCZVbL5FfpHf3Po0kybG/VDb7u9MGxFtkNWG5xQiIBAJB475iiNgui4Ilb6ysX3CFP
 FW6iC/AOp6MDFRfcNxEJuVKNS9uSIP1gCAnuUu0mcoeBCqbUuMz1sov3zIGB0EgQhC+xhWY+fjJ
 gWi4Z5D0jLFz3f1ulw4grvWwm4B3CC71KPbOIJ/IXFP29XalvEx+qfQ2INJwSHqmPS84xohI06t
 ZpIAOFw2H8GKeqjGZrGZELUG9NT+1/VvgETJqD57N8GNxpRJi/hewRe8u3DkOmDwUgGgK+Yzr0s
 LVqmAOuo1u41/st79UCc39NAKE4Urn4kZL8DdpThFMqCfjeu0jgAVR969FDPhzpI6FDQEzJ3Pnx
 nZreA7fqnu4pXkyay3EAhuBKFotprhRuF7GcuBjBAkwO/mRV+L7fpYdT5m0bK0w+vSbiPghwm8m
 AsbM3HlqmcLqGmWmT3wHZydHz8ifgpst5nGjnaZkPNN3GCGq6f1geqkpX+ew5eg1vBCgm5Lp+Hk
 398ejYLi6hbpjAbm99qXplqW6FhlCTsHNRSVDOJM37s+VrQznEKhqHDTKNs39gpYr3bU9e6z61w
 doZpXfuEpG+mUOvKuo0Rb6/EDu5tTl8KB1qlt7PFwTWKbCOnfcULJXFOhqcL3GWVq2Ok9rQ1pn2
 6xz0VLSU1838EAg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bJcm5v+Z c=1 sm=1 tr=0 ts=69f3053e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=FU2xtZrg5b9VnPq6Jt8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfX5NSjiKHt8eW7
 tY5qTu3tdQTnCH9lkeYx52eKyXHqmwvxWBiE2DcpIDvdB/N3wJEK5fIwjWFWB/bpmjnOi9VikjZ
 cUNadz9Jx6wio8VKaY8JBX/yHbNXS3zJarvcIM7Sy/Ii5E6FqwV6P4b/0TcdMN6Vqq8xCOS3Wq9
 1/S4oln1tugCuqe5T1mZiUN7pCgnQVH9TJoMzq7mL1ZBR9LtnUoVYhcCE7Yoh/Hask7zgUCuE7R
 xZ/6cHfVAtITfkEgZ+A18eu7oyHNQ1aS176z+5vTOWzE+YRkZxFPV4n517rxi3z0NT8EKJeS1IR
 Kb+vq5+3OuYBx3NlMMQ8WgG1L4UjqrgKq5xUXdS1lXNCNHftL70bwW4cuFivTn9Ict7k/RLp0oy
 PakLD+JwXUhLQZzmw8t+6gBe5yhGUk1VgfycAkIZmBjYLFVD82LgDSVI6XwOuUzw/6zYpA7Z95+
 BqhZddGJW+os7ulTLOQ==
X-Proofpoint-GUID: sK76WeI6_bGop7YlW7eGJ1J3HPB4OXyf
X-Proofpoint-ORIG-GUID: sK76WeI6_bGop7YlW7eGJ1J3HPB4OXyf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300072

The pdata variable is set but not used. Remove it.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/gpio16xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index 55acec22fef4e73f20935473602ef6cb2f4f379c..e8dbe173bd33fae72c7c884f930a530f78096839 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -212,7 +212,6 @@ static int __init omap16xx_gpio_init(void)
 	void __iomem *base;
 	struct resource *res;
 	struct platform_device *pdev;
-	struct omap_gpio_platform_data *pdata;
 
 	if (!cpu_is_omap16xx())
 		return -EINVAL;
@@ -226,7 +225,6 @@ static int __init omap16xx_gpio_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(omap16xx_gpio_dev); i++) {
 		pdev = omap16xx_gpio_dev[i];
-		pdata = pdev->dev.platform_data;
 
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 		if (unlikely(!res)) {

-- 
2.47.3

