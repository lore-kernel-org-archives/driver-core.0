Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CD143EC2C9
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 14:15:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139329; cv=none; b=Fy/qZWxTRVi8yYQdkME6ka7hCb6TWay4h3tm2uJtgMrtbb3jnQ0/edY6F12CCU0YJ2bUTHip/tKKpwea+aLRKV7pDANw1T9Qg2m6wVcSy0Jit0pyCv9wLexEVRkOwG2oUsxieBc7Ghp4brM7O5hmbGGFz/QcFHZZQzhxNwzGcr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139329; c=relaxed/simple;
	bh=84lA+sQad0KFCHbORyyoFKtDWqR/112mWPWVfk7uVlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LzHQQeXGSWzXpYO/bDEdcSmqhgOBBZQN88hdPbbjc5e4PZd45ExRvvQr8PR7UWyeO1rXhrwrneo0rmZiwzJJ19hO+2o5DlK4m61upqlSLsQhTzmVYdgMXIYaiJCCr0z3zY/MLpBFCZK8HmXH/ksnj4Riii1Nf6UKlIa+irJSysc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BCRWECBd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GtJaxFRf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BCRWECBd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GtJaxFRf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CEfks1964872
	for <driver-core@lists.linux.dev>; Thu, 2 Apr 2026 14:15:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ko1IaIbS30UK07529xORwTESC79YHbPzcSNYySWBN3s=; b=BCRWECBdceo8emiX
	zVu1XemBIxDnAfpAVprpPRAtAlqgL/yPKHibQWKIS3zbIOD01OFtUiWDAS3pX6Fn
	ucFB4kUiij61guxsMtPANwSlFiRlxBcTqjkm/jybIlqHtlUUaSzprNzh9eUZjlhO
	4SY3Qxd3PEsLR/MdCYJkvauFJGNyoXqrSuxHJI26weardUyj6KzMZgZd0klhoQFy
	0OWz113/0NiJGgwFWJ3SzZVjjjWotAojZrdACM8sI4q5TeA419H56AmYkcgMH7me
	yLWG2u17rfXBltd9QIdNHGVvJfaGXuY9RqSvobF3/XoDleHUGKPlwYOox0/0jbeJ
	NWr7Qw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9b9h3jpw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 14:15:27 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89ce5eec0f0so35669696d6.3
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 07:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775139326; x=1775744126; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko1IaIbS30UK07529xORwTESC79YHbPzcSNYySWBN3s=;
        b=GtJaxFRf/g7Xm70RFbnGlah9ZaWnZIUmTFqbQewEIfv5PXI2fghhuwrU94xgrRoTr+
         CjQj2VFhaStrk5LGH1YGXIfDe9uIh5Oji2UGESBinht4jCB39Rj8jw5LGGDHMdB3+97N
         9Zmqff7DVE5LIfygBm9gH0sa2NpZHn5gNGeQHeWIO+SCzHMxC75v4E724SHRFto2k2C9
         ryB1hNbET07qE2GDNRJer+Aj8EXQtCYdH9VqGFC2vSIJWyphG2K90oWJEKOFAACAMz3P
         JHEohH8IYjgJEIiZ0vnQlgaVcaBeFwl3vAtcFgOoJIazmx6SNmD6m72Fdz00xKm4XVQq
         Zvmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139326; x=1775744126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ko1IaIbS30UK07529xORwTESC79YHbPzcSNYySWBN3s=;
        b=AgBeIlKbuCn17kgZFY9dpQ71FN1lla3L/W/kR4x+RF8ITBcYoOj7Vf25UW/lDyge4Z
         FCRfKqATfCJYVLCvuc0I2INDSx/E8nSfMHsO46QLQyQcoOiZOMqL70TFYFzg7UuQjdlm
         SLlY2/NEyIQSpx+TAQcSsy5bzFlon2R+MPqCVZCp9yKCRtlYJaZhWLgN/iIgEYb7A+5G
         SxvtAKWfuZFp3oZRraHpJIRdMfkg63/J8+Xus9m4u5mLqjXW8sN5Ch7NixmmlFG8SYBp
         SML/99sCDFaF2oUpyESI2Ciu/WVF/Q3feVBJjrNpWuHk2sJtzy2suuqlGVwZ6zpyVeS5
         K/Ng==
X-Forwarded-Encrypted: i=1; AJvYcCU1gVrVTOk6Xrghm/9vPL7fMd2Xfmi3qFLlFfEBfXTi82k3UHsvq8poM0dMjDSVwpHEEVJJRG8An7lRSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx3PGHpibP1mnZAQszcPq1L8PrmT4eowiRtfEUqDu2RKZ31sTOT
	v9coKQaNXcuP6QFWmLZoHn/Uacgyee333gmvy7/v4zkPbMucnbfN8FqZQnLQIIi/JMjbPHRRtem
	JLtofOBVwU0tUBU5KQZM3ge72gAzZ25lfzCgUQQWbRn16WDVwHyCh3XAsFwSpACzHiQ==
X-Gm-Gg: ATEYQzy37k8dzVaqGj6cfF8CmWGOsy9/Lcq6RNjQ1/plj76btH+TzCtLPXWqmuARLmD
	s5vkHiiVxKxOl0orDXJXYFgF/O3+5MZ2r7PtrdBkfyjJEea2Ppgyf5I8zMSU2YxIMFn182ToAQN
	AEnZjtK1Uz1DMlj8C620uwXQ4dNs8eVYsMmSRVg/i5Qre4YsAw0LERpw/UXUUMzPZqA8S/Hoyj6
	rxfzk9+v0oGxFUW0H1SlQrrB4Qz4cFGpWoElIKfvo6P9PHIQqqI3sfgzsQtfkDlXYvBQkuNkI4v
	0DGzltUlwzUu8JrdgOLMRiqYB/2eNBbIGgGJfGVbUgkY87A/lGxIan0ZLLoGhNBGQb0qKm1v53s
	Ip3aePNOH9tzJFulDFizpz5Hy13vggebJFz1dRVvfUeJnVV0QOGyM
X-Received: by 2002:a05:622a:207:b0:50b:465f:706c with SMTP id d75a77b69052e-50d3bdace4fmr105254841cf.60.1775139326284;
        Thu, 02 Apr 2026 07:15:26 -0700 (PDT)
X-Received: by 2002:a05:622a:207:b0:50b:465f:706c with SMTP id d75a77b69052e-50d3bdace4fmr105251081cf.60.1775139323963;
        Thu, 02 Apr 2026 07:15:23 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm192824885e9.1.2026.04.02.07.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:15:23 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:15:05 +0200
Subject: [PATCH v5 4/4] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-nokia770-gpio-swnodes-v5-4-d730db3dd299@oss.qualcomm.com>
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
In-Reply-To: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7115;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=84lA+sQad0KFCHbORyyoFKtDWqR/112mWPWVfk7uVlo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpznnyrQduqYRzaSGCrj/a3Z+EMcoLtnR8gXIhB
 rRkqv36XQ6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac558gAKCRAFnS7L/zaE
 w051D/9/iGB6iVqBzF719/2yLqnIAn9kqb0163tgxIPoz8kXX/FI5zf+t6Q3zmC9Cygm5OUsqgK
 3n9fI+svI8LS2chxUKP7kCbHvxH3MlHHM300iW3hkLUyP9lkdwOHFQ3vvgA4djp78E1MeB+GKsW
 /GMMtvgntw0YwmWqQqY9WFPagO8FSHAncV3ui9H6PZf9TIeQIHwDQVDjqlLZHCeUZ7BxSbwup/R
 +YHFwpxiLdoFtdOX90NVHPpM3Yff462amLZatiXPrHWLaJblB7ZCjKZN+C1n0Gzrz+dDtXDM8sr
 cPfaXSnQjZz68q0P7NWLbFGNqRJAsS58iBbcFWCg5b5gVQMw1LMdMzBHiCz9jTTrDdpG3/MbfS8
 fEgjfM6Lxkd1oaH61wlXPx0Y6lmzjIvoGZb0kshhiQrymMOrMgvWjPuVX56IWKkRpW0GNXUJ0iA
 vLIMOuaxk43lNIX8tl/QmEeYrpw2KFAi8MR/l1JFlADn3xEr+3imTlmUsdyUthTNmqsd+Ot6YIp
 3SLge6ThitT8CX8lKjNM44ZjsAijL3cRu8XH8lDcBwz7pd2Px87aAvJKBoBbwBGG1RtRhMM6pj/
 7bJLVfMTbgMApzwv+lIh6glmEODbiutZfQR3jm5iJfk8OUtD5eXjBLIgH1CiDIkXbpjcfpW0yLk
 W1Ge0RJ1TNMYuwA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=TqLrRTXh c=1 sm=1 tr=0 ts=69ce79ff cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=mL5-Ybe71cLVbzrCEFIA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: w1uFH4EkcKJitYEdg35PnvNi9vv0LlNh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyOSBTYWx0ZWRfX3JbLE/ITAToF
 whQVhBZ/kDasx8jDi1eABv6Dt9Y20NPnXa8TvG5hzqcX2iFQum8EGiIL7uAlQ94Qbb/mEjmCBS2
 jBL+Xjsh/3G3+cKOgrWo3Pm299BNfw2c+kzjGwlkyRe7/G6ANWR26yoniA3FPWgLF3alocEUItl
 90kvxXsMXvhsRjP9DeMEr2CUEsXjyKL7L46BLW7sVzOuqwIRmUL6L+apS7NCCqdAWqeodye0PZp
 MjpV7ZGohAaAtLXDOfl9CdkAoResT8350Vl+XoTk+Pp5g9Qjubdr5fCMRen6wZziHkBaGikGnqA
 zCprWsaEWaHCXpuzLkKlFAbzx2yXRUX43h6ElcovrAwf4LCVF8Vr5DQIy57VUfbnM+Y+Xu+3sEb
 8b0nTVDIr3YuB07T54iCxxIeY/SpGlkqkBYsN2qK2vPrWXzh7neoMLizwBZeltJNXjsvZFWMSg5
 zkM8LxlRI6shn1htJJg==
X-Proofpoint-GUID: w1uFH4EkcKJitYEdg35PnvNi9vv0LlNh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020129

Currently the board file for Nokia 770 creates dummy software nodes not
attached in any way to the actual GPIO controller devices and uses the
fact that GPIOLIB matching swnode's name to the GPIO chip's label during
software node lookup. This behavior is wrong and we want to remove it.
To that end, we need to first convert all existing users to creating
actual fwnode links.

Create real software nodes for GPIO controllers on OMAP16xx and
reference them from the software nodes in the nokia board file.

Acked-by: Arnd Bergmann <arnd@arndb.de>
Acked-by: Janusz Krzysztofik <jmkrzyszt@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/board-nokia770.c | 30 +++++-------------------------
 arch/arm/mach-omap1/common.h         |  3 +++
 arch/arm/mach-omap1/gpio16xx.c       | 28 +++++++++++++++++++++++++++-
 3 files changed, 35 insertions(+), 26 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index a5bf5554800fe17b430e84ae421ffa8da2bb11a0..46f817f6316b70ff37bb9dfde86c675fd692999b 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -36,25 +36,6 @@
 #include "clock.h"
 #include "mmc.h"
 
-static const struct software_node nokia770_mpuio_gpiochip_node = {
-	.name = "mpuio",
-};
-
-static const struct software_node nokia770_gpiochip1_node = {
-	.name = "gpio-0-15",
-};
-
-static const struct software_node nokia770_gpiochip2_node = {
-	.name = "gpio-16-31",
-};
-
-static const struct software_node *nokia770_gpiochip_nodes[] = {
-	&nokia770_mpuio_gpiochip_node,
-	&nokia770_gpiochip1_node,
-	&nokia770_gpiochip2_node,
-	NULL
-};
-
 #define ADS7846_PENDOWN_GPIO	15
 
 static const unsigned int nokia770_keymap[] = {
@@ -112,7 +93,7 @@ static const struct omap_lcd_config nokia770_lcd_config __initconst = {
 };
 
 static const struct property_entry nokia770_mipid_props[] = {
-	PROPERTY_ENTRY_GPIO("reset-gpios", &nokia770_gpiochip1_node,
+	PROPERTY_ENTRY_GPIO("reset-gpios", &omap16xx_gpio1_swnode,
 			    13, GPIO_ACTIVE_LOW),
 	{ }
 };
@@ -138,7 +119,7 @@ static const struct property_entry nokia770_ads7846_props[] = {
 	PROPERTY_ENTRY_U16("ti,x-plate-ohms", 180),
 	PROPERTY_ENTRY_U16("ti,debounce-tol", 3),
 	PROPERTY_ENTRY_U16("ti,debounce-rep", 1),
-	PROPERTY_ENTRY_GPIO("pendown-gpios", &nokia770_gpiochip1_node,
+	PROPERTY_ENTRY_GPIO("pendown-gpios", &omap16xx_gpio1_swnode,
 			    ADS7846_PENDOWN_GPIO, GPIO_ACTIVE_LOW),
 	{ }
 };
@@ -225,9 +206,9 @@ static inline void nokia770_mmc_init(void)
 #if IS_ENABLED(CONFIG_I2C_CBUS_GPIO)
 
 static const struct software_node_ref_args nokia770_cbus_gpio_refs[] = {
-	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 9, 0),
-	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 10, 0),
-	SOFTWARE_NODE_REFERENCE(&nokia770_mpuio_gpiochip_node, 11, 0),
+	SOFTWARE_NODE_REFERENCE(&omap16xx_mpu_gpio_swnode, 9, 0),
+	SOFTWARE_NODE_REFERENCE(&omap16xx_mpu_gpio_swnode, 10, 0),
+	SOFTWARE_NODE_REFERENCE(&omap16xx_mpu_gpio_swnode, 11, 0),
 };
 
 static const struct property_entry nokia770_cbus_props[] = {
@@ -318,7 +299,6 @@ static void __init omap_nokia770_init(void)
 	/* Unmask SleepX signal */
 	omap_writew((omap_readw(0xfffb5004) & ~2), 0xfffb5004);
 
-	software_node_register_node_group(nokia770_gpiochip_nodes);
 	platform_add_devices(nokia770_devices, ARRAY_SIZE(nokia770_devices));
 
 	gpiod_add_lookup_table(&nokia770_irq_gpio_table);
diff --git a/arch/arm/mach-omap1/common.h b/arch/arm/mach-omap1/common.h
index 7a7c3d9eb84a06c18fbc70e7c94a161b487cd002..c0f6e231fdb4422c5d2c1aa3e33dd6dd99d2710e 100644
--- a/arch/arm/mach-omap1/common.h
+++ b/arch/arm/mach-omap1/common.h
@@ -35,6 +35,9 @@
 #include "soc.h"
 #include "i2c.h"
 
+extern const struct software_node omap16xx_mpu_gpio_swnode;
+extern const struct software_node omap16xx_gpio1_swnode;
+
 #ifdef CONFIG_OMAP_SERIAL_WAKE
 int omap_serial_wakeup_init(void);
 #else
diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index 55acec22fef4e73f20935473602ef6cb2f4f379c..e371183e0213912ebfa7edd34ca7e7683869ab12 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -9,6 +9,7 @@
  */
 
 #include <linux/platform_data/gpio-omap.h>
+#include <linux/property.h>
 #include <linux/soc/ti/omap1-io.h>
 
 #include "hardware.h"
@@ -55,6 +56,8 @@ static struct omap_gpio_platform_data omap16xx_mpu_gpio_config = {
 	.regs                   = &omap16xx_mpuio_regs,
 };
 
+const struct software_node omap16xx_mpu_gpio_swnode = { };
+
 static struct platform_device omap16xx_mpu_gpio = {
 	.name           = "omap_gpio",
 	.id             = 0,
@@ -99,6 +102,8 @@ static struct omap_gpio_platform_data omap16xx_gpio1_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+const struct software_node omap16xx_gpio1_swnode = { };
+
 static struct platform_device omap16xx_gpio1 = {
 	.name           = "omap_gpio",
 	.id             = 1,
@@ -122,6 +127,8 @@ static struct resource omap16xx_gpio2_resources[] = {
 	},
 };
 
+static const struct software_node omap16xx_gpio2_swnode = { };
+
 static struct omap_gpio_platform_data omap16xx_gpio2_config = {
 	.bank_width		= 16,
 	.regs                   = &omap16xx_gpio_regs,
@@ -155,6 +162,8 @@ static struct omap_gpio_platform_data omap16xx_gpio3_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+static const struct software_node omap16xx_gpio3_swnode = { };
+
 static struct platform_device omap16xx_gpio3 = {
 	.name           = "omap_gpio",
 	.id             = 3,
@@ -183,6 +192,8 @@ static struct omap_gpio_platform_data omap16xx_gpio4_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+static const struct software_node omap16xx_gpio4_swnode = { };
+
 static struct platform_device omap16xx_gpio4 = {
 	.name           = "omap_gpio",
 	.id             = 4,
@@ -201,6 +212,14 @@ static struct platform_device *omap16xx_gpio_dev[] __initdata = {
 	&omap16xx_gpio4,
 };
 
+static const struct software_node *omap16xx_gpio_swnodes[] __initconst = {
+	&omap16xx_mpu_gpio_swnode,
+	&omap16xx_gpio1_swnode,
+	&omap16xx_gpio2_swnode,
+	&omap16xx_gpio3_swnode,
+	&omap16xx_gpio4_swnode,
+};
+
 /*
  * omap16xx_gpio_init needs to be done before
  * machine_init functions access gpio APIs.
@@ -208,7 +227,7 @@ static struct platform_device *omap16xx_gpio_dev[] __initdata = {
  */
 static int __init omap16xx_gpio_init(void)
 {
-	int i;
+	int i, ret;
 	void __iomem *base;
 	struct resource *res;
 	struct platform_device *pdev;
@@ -244,6 +263,13 @@ static int __init omap16xx_gpio_init(void)
 		iounmap(base);
 
 		platform_device_register(omap16xx_gpio_dev[i]);
+
+		ret = device_add_software_node(&omap16xx_gpio_dev[i]->dev,
+					       omap16xx_gpio_swnodes[i]);
+		if (ret) {
+			dev_err(&pdev->dev, "Failed to add software node.\n");
+			return ret;
+		}
 	}
 
 	return 0;

-- 
2.47.3

