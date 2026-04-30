Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1FFD3B7B7A
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534277; cv=none; b=jvUWbX3yK7+MwV1Y43q6lrm3dWGORTKBuyuy4I8tKrVA5H09Ewm6T4I6QBxamYVcyamnqNeciCHJvzPSdqolU93g8dx4pdDGOwSkKA3HmLApndpFOvwparABTn+42oNC+5rCN60mGEehtc2rf+7/qnyzwW5FsSjbTklbVWGvjaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534277; c=relaxed/simple;
	bh=pyDEdb+DFpm5kfoA02KDZuG37h8dk0QejYiq94QeCKM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hl+mokkYjNNRu9ij9s65OT6M3FABjeBDVEdhUdbe7RiqpZhp+b8KJQupB2CDtpXN6UhFCtVrit/x2dMCzhp0zfCqKUi4BHMdGPOCeojKUS29pTOeRoGZ+ei27f/sg8REcrmmDFU+X7oN7+CwGntCgt99ghFRkkUa7c2j7rvdz2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iXSSTh4v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ja9a2IaO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iXSSTh4v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ja9a2IaO"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U44Z4o2099574
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HmC3RsHHTgvLe9Ymngb+fKV16ObHubi1Lo4FYC69W+Y=; b=iXSSTh4vb6vFfiGh
	kAwA7D6gzyp8Z/21HeaPenKEgwmXQ+7vcmQ2L1C5Q0QKqBWomHzLkSTPydNZX/a9
	kGteRX7ZG7Nc1u0GQ8Oki+EvuZ+TMevrmbLGz/mkVEGLtb4fnreyEHaLgZAuUbWx
	lztofw4C8QEWbGetGAfcNi1c37M76xDG0ISgCLtl81jSqE9A+lkyyVOmpUmjkA0C
	MtoqAs8ru//DaFBhEzo0DkLwAVMwD/gsqcj3foLE0FN6Zn8NdyxyK6b2VmKMXJf/
	qUotdgBsOfJX9NqSiEEdk00iSWhPnIkmbm9Ws1xWJQMdzn4IAB07xPNiLdYtpTge
	4QNGFw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duyr40mrd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:13 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50e423a05c8so34081421cf.0
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 00:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534273; x=1778139073; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HmC3RsHHTgvLe9Ymngb+fKV16ObHubi1Lo4FYC69W+Y=;
        b=Ja9a2IaOS19z//8RHQvAfhn0TldEs5OH8qnTdp6zSLZ3nPaDxp+XpKoXKbdKg/DYQ0
         0eOYw1fCbBJ9L/sLNZMI8Y0iYiaMaYXINrSfW289Kgfqvn+eaXLkcdm1udJ/ZpZQTlvE
         QUqvQByfpg07loK7lQ1Un9+wZP64L2uT9gW9H/0Os7KiZYSks8X+63b+sghpWSnzLu0j
         BQa15OXPmRHHOTkW+lkOPjsFMOoQzgOsx+TGR2B6fWELs+ZE/b6vwheJ23PZNvUpK1Z2
         o0MqZOlNfMLYg1qKrzQ3voypIBklCFxXBXrGJSjCpaR1CkzkUz9edI/HZcUV/DgXFBJJ
         U8rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534273; x=1778139073;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HmC3RsHHTgvLe9Ymngb+fKV16ObHubi1Lo4FYC69W+Y=;
        b=DJGu+/w47Y3n22BznKQR3zeED79Gy4OWKALdNq3XkZEIZOVObJ+aYFwNY7zCUW3kS6
         +4h4EvicMZ2qdySEbw/CX+WiQlOIfcJJbLPF8rhd7vlijaU4TthPDiyJzDYdO+FgTvtb
         Pn2J/OOSXk4W1a62OjlFt2R7+/MXwXzJNGuV4nrmrlz9o8ux6O4qq51bpvjyhgq3uhgM
         koP9eMu8JkUmEaXTzBCLZJKfOw1ynrYuC3B8SHatTQ980n64xoK37f74+gAj+CXPH1he
         9UXlkhHwtXtz0n2lZI8IUU5i+3DpHY33UAsblcA73PtUn+z1C2+acoP1dvxxV2BDnRO3
         BWgQ==
X-Forwarded-Encrypted: i=1; AFNElJ8U//Yyl8GkqgeN+TdQ8NbTHIipJUTF2sEGx4O/a2MTZ3HsWnus8p5s+dI42cFtoRtDUzdA6c+3QpmZ7g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw37jaVkgg8nbfg1eWL49mcJBE/fL8D9F4ELpYdR4mLij0LPLzb
	jCfng90q1H9NgKYoUDFOfmgNrF7FB6iE8XXM1EHkw0/kY/W48cJgWNb+D6EyVxqYrLc/Z2p2+IT
	7FjMV4Hjhex2CeAOFNPHoPfl5Mj0f9snHWazpdaRaobl54NVFEqZm175NS/iOa6RSsQ==
X-Gm-Gg: AeBDievBT0sv8YI9GZ272qzyhd2Eq9m5KFLpPCmevAVjmw2IAa9WF7XAdDZnsdYmGV0
	JQH4VHtdy79pg+0eLuG7fD6R5gvgTKUNz+gJEODEBomYANddfWPH6G91Z1Ik+GA9Zprk3o8KbcX
	kUAcvNyxNyk3zJ2FFX+w4QgsX/3dvUmn8PTdqDckSjFU8PieZi3t+vTSwM2EwPNq67fYxWrxuXF
	ZKjSY1pJ/U3uuKouEQJO729zqMX9pcyyDhnowCYquCOr6/6u5twUwI4azZ//h5BUgiB93HIOK/E
	SGPReNDAEqklEwYcclk7E3H4pGTcJu6tflbQxEcIuc/XEYK8xR10Mi0o6dnCpzDeNIh/Enmfh4x
	30aSjmgBeR5933f6ELZ40TmSIHoEcccvpYtH4xK8sXwX6aDmLTyjz7H/Do9LP
X-Received: by 2002:a05:622a:8310:b0:50f:ad91:8906 with SMTP id d75a77b69052e-5102d1d0a24mr10843701cf.20.1777534273161;
        Thu, 30 Apr 2026 00:31:13 -0700 (PDT)
X-Received: by 2002:a05:622a:8310:b0:50f:ad91:8906 with SMTP id d75a77b69052e-5102d1d0a24mr10843571cf.20.1777534272725;
        Thu, 30 Apr 2026 00:31:12 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed69fasm59515035e9.3.2026.04.30.00.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:31:12 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:30:57 +0200
Subject: [PATCH v7 3/3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-nokia770-gpio-swnodes-v7-3-c88f74c90dd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5847;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=pyDEdb+DFpm5kfoA02KDZuG37h8dk0QejYiq94QeCKM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wU5rMnQBJz9MQOuwsfHvKzk9TQeTy+CclUe5
 LDV11j9LyaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMFOQAKCRAFnS7L/zaE
 w6hcD/9Met5lWK+MDWbROq9YzLzDfujaXzdRBbxuXCaavNyZhQmEfv/U+bWw+i77/2KlKNliaR2
 mYBZUQs/OpbpBNq9jKsGJZjwCWW/1aEcy7c2X/eyP2iq4FXmoEPHZkj3ltT9QJ3udfABH4hw8Wo
 018RnDbk8z9xUAnKuSum8A+NniE3hfJXwBLw6VjE7BA5UGGlI2S4GAmEXl9JUt3FlO2LgF30iDa
 xB3saThymeuMvomarIoKz9FcUwHs0KckUm1Xl4DiElrJigGAr+AdRWRrc0RL0D6yRKCqnkiflop
 xGgc865Uc8rgB3WgB8lduMcyyXpuw1y0vBCGKnsGbZuG8q9rhh3ssdN1EeDGVJYFhrit/6ngzQr
 Mfpven0EgQTTUhdM14DDGOIdtpWhpGOyN8ueuUo+qP9k5MSwJ1wSL/9zmhW4pELpX6xJUC8ukox
 g68m0nQwHuBRBOhcEOs5Fvo34JiloV/rXHkJ8BjGGPE0uT2EBH8zfQ9fsrXogU9UdrUWJfZhdQ3
 R3rPHCLN6VJVYGkeAc5oIuWOElGdRTQzUkZdYl4oQhyfm7HNz+5ANBngLQUbo/EdeWvsG7JMObb
 XHItXUfIMSoSa67NSBCrfwh5U+9wWiMjCHNTD9aQr0HXPyod+PrVkcaqMbgNlEL4KiA9KsPbTuX
 lOwLagATYin8gBQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=bJcm5v+Z c=1 sm=1 tr=0 ts=69f30541 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=8ufHpPoMNYqLVR2KE8YA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfX/7QtZgqOK3ji
 Ap9lin8Cm38/tIJ3GhiyDTkc5Ts32p0a2V5M/0P/u6vvJJDXHYH1M2Ng+7igH8yrCkFExiBc2Og
 oTTqxyhjnN0FpVJpbpv40asN5RQdC+kFTcAbFBgvvcvggtH8CSKBNCYKmaiZlR9L3esrCNFX2cu
 +l7A2OHZmBdUj2l6nVBEr/nSh9//sMje46osgtFFycBn0f32oGWXcw+XV1AInsfKLcQfKbOOTAc
 RBDaBzYNEiREAEN7L1AcLw4bXSG3N8mOKV25PkClI3IKfvE9NBrJDwA9wwyEi3ZqqyxbRe+1bS9
 bxDUpgZ0WjMnxm3EgCKeAhStxIffFaunhFIk7zccPkYQ3bH9KbFeVdR0YStqDSo5b96EMNfDTB6
 3wNLVH3jw3ZGUaCgEyDwS/KXOdgme1F5c5qiIpDLULFp/rWfLmWatrz57oqfZ087+w/c2D/Tfip
 sx9vxxPE3JxpLpN/8Rw==
X-Proofpoint-GUID: c08Plw62uyJvxiVCwrGlAhyfNWiOWlmS
X-Proofpoint-ORIG-GUID: c08Plw62uyJvxiVCwrGlAhyfNWiOWlmS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0 adultscore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 malwarescore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300072

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
 arch/arm/mach-omap1/board-nokia770.c | 33 +++++----------------------------
 arch/arm/mach-omap1/common.h         |  3 +++
 arch/arm/mach-omap1/gpio16xx.c       |  7 +++++++
 3 files changed, 15 insertions(+), 28 deletions(-)

diff --git a/arch/arm/mach-omap1/board-nokia770.c b/arch/arm/mach-omap1/board-nokia770.c
index a5bf5554800fe17b430e84ae421ffa8da2bb11a0..72d9e92a1071743cef0020fce750288382fcb0a0 100644
--- a/arch/arm/mach-omap1/board-nokia770.c
+++ b/arch/arm/mach-omap1/board-nokia770.c
@@ -36,27 +36,6 @@
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
-#define ADS7846_PENDOWN_GPIO	15
-
 static const unsigned int nokia770_keymap[] = {
 	KEY(1, 0, GROUP_0 | KEY_UP),
 	KEY(2, 0, GROUP_1 | KEY_F5),
@@ -112,7 +91,7 @@ static const struct omap_lcd_config nokia770_lcd_config __initconst = {
 };
 
 static const struct property_entry nokia770_mipid_props[] = {
-	PROPERTY_ENTRY_GPIO("reset-gpios", &nokia770_gpiochip1_node,
+	PROPERTY_ENTRY_GPIO("reset-gpios", &omap16xx_gpio1_swnode,
 			    13, GPIO_ACTIVE_LOW),
 	{ }
 };
@@ -138,8 +117,7 @@ static const struct property_entry nokia770_ads7846_props[] = {
 	PROPERTY_ENTRY_U16("ti,x-plate-ohms", 180),
 	PROPERTY_ENTRY_U16("ti,debounce-tol", 3),
 	PROPERTY_ENTRY_U16("ti,debounce-rep", 1),
-	PROPERTY_ENTRY_GPIO("pendown-gpios", &nokia770_gpiochip1_node,
-			    ADS7846_PENDOWN_GPIO, GPIO_ACTIVE_LOW),
+	PROPERTY_ENTRY_GPIO("pendown-gpios", &omap16xx_gpio1_swnode, 15, GPIO_ACTIVE_LOW),
 	{ }
 };
 
@@ -225,9 +203,9 @@ static inline void nokia770_mmc_init(void)
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
@@ -318,7 +296,6 @@ static void __init omap_nokia770_init(void)
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
index 9cca29f860544ddbec3734cec9b3246ce468543c..0f97972fd248d29fcfc1ed2a8ddb76a6d89f1e7f 100644
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
 static const struct platform_device_info omap16xx_mpu_gpio = {
 	.name           = "omap_gpio",
 	.id             = 0,
@@ -62,6 +65,7 @@ static const struct platform_device_info omap16xx_mpu_gpio = {
 	.size_data      = sizeof(omap16xx_mpu_gpio_config),
 	.num_res        = ARRAY_SIZE(omap16xx_mpu_gpio_resources),
 	.res            = omap16xx_mpu_gpio_resources,
+	.swnode         = &omap16xx_mpu_gpio_swnode,
 };
 
 /* gpio1 */
@@ -98,6 +102,8 @@ static struct omap_gpio_platform_data omap16xx_gpio1_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
+const struct software_node omap16xx_gpio1_swnode = { };
+
 static const struct platform_device_info omap16xx_gpio1 = {
 	.name           = "omap_gpio",
 	.id             = 1,
@@ -105,6 +111,7 @@ static const struct platform_device_info omap16xx_gpio1 = {
 	.size_data      = sizeof(omap16xx_gpio1_config),
 	.num_res        = ARRAY_SIZE(omap16xx_gpio1_resources),
 	.res            = omap16xx_gpio1_resources,
+	.swnode         = &omap16xx_gpio1_swnode,
 };
 
 /* gpio2 */

-- 
2.47.3

