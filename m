Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E9D3B9D8B
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534275; cv=none; b=LhlRkTi2Uv0rm40eGBQnpOCT7IDXStwcFoBtEkO15b3Do/0ZRVuXtDtAyXts/Xkk6DG386HICKb5vdt50TpoY94HOc7+cW8saPX++14ot79TpF7MPHwh/jJc+rXBNmxIoCnQxcUM0NceHf5FlrBweoE86OynsenrRtXcWrh8dJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534275; c=relaxed/simple;
	bh=PHpDrTZXHmNwZUSRWJMw+i4wybcuMgJ3uN1C9wMAxi4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QrX/jKHPmg/tGYk9xASxGWhh5YoSM8Aeexc9f/5CMSpsKV1H0DwiihI9aUx9l2cpBb2C+JcSVCzVORJri3rdiRWB0S335TCIzWG6NqX6bj1b0yydEXmVrdWWUkOP+UPYCiBB3SIyJ3C3CMf51pLf1ER1n3OYiah6gg/hFbLkLqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8ZEcTAZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Podg3OIx; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8ZEcTAZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Podg3OIx"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U75JmR831278
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/b/CPdx/UP9zJB8T5L7o6k+fxq4JskuiICzDFnr9ggs=; b=e8ZEcTAZndD7gvDd
	xk7RR6Poc+Z3TLgW4S1as3l4G182g+5Y+a3wT7kEvQnteuRD6Lt3D4dLtI3Yl689
	Wmd48IfyZq28fVE7l3CO9vC1azul95ORfkpoEDWmTigo3EZRBrDmV5+dj3NmJ/xZ
	+Hbk61dmTcH4LE+m6IU25Cr6PekHMJpOqrLi4axzUhLUmfLyYhdsnoyeYBhGl9O+
	bjq9/V1c4zJhCBmbQIvjmAVmAiqoE0D6wAa6LaajksvVufwg5UCq3sCsmXeR1056
	M4FbAgvnZev88GbC2MV04CcYUtTyh7gznGtH5869RkHah4HnddTrI2YIOq8xsbkk
	x36O1g==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq02yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d812c898cso14386841cf.1
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 00:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534272; x=1778139072; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/b/CPdx/UP9zJB8T5L7o6k+fxq4JskuiICzDFnr9ggs=;
        b=Podg3OIxhG3vlsU4DLWNrZwpmSj1NWEnFnISL+lyXj+nPBcDZ60w+aFubc3oQxvHhK
         tQcbIttDvW0SME/fP+uWGNxL9Y/3EavSQvBb7913WESCPVFKW4hXzNCQ20yxxNWaWoNT
         G0zzORJxMgHOi0uz+JmmI9vITe+S9XBCDWrmY+ujAZ9JY04bLuWE2WqS+n4WorSKgnhE
         5rOkxpizKgshXzm5Xy5VrJSgaiuCxjJdJ7QZ5zozD5cvvkri1b9Kr8OVIdk82z9oZ8LV
         2cACXE3HAC39Z17uVX7grypFrzX2oqn/NSW8I3UHlNDLIy9DDCZvBj+5tDA4WQRi2sHu
         cBTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534272; x=1778139072;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/b/CPdx/UP9zJB8T5L7o6k+fxq4JskuiICzDFnr9ggs=;
        b=gd7uenPKheoA18bf3Zj25H8GwK33Bbhp7sXG0w6at2bdr02OCJ88SVzmAO6yrc81KZ
         P797DTwDWNWJqy4XEteriKEeA+4h57Bz2T2e1xG5MSnwzl/x7zQSOx5knwjYaR2vzDnb
         VYUq7ucmaXcpfKbEZtuPlpbf47HVBVLvEvZFe6kzuHWHY6fmlOGkfk8qfdTENibBPwR8
         UyoUXksgNW4yv9vyopzajiogvPavEnwyXkyYV+UdJfnT/4STHrP6Ocu5CRUVM//E5w9I
         X7IKBrHkZXRF/LojH2WRspsvsfnRu6fuauKRKvtQmwdIOS5wF7ubU8BHTmjTuICXF6S/
         83jw==
X-Forwarded-Encrypted: i=1; AFNElJ/KoCwltRswMcjgCl+q/k2znUYxVI4ooXDR55woEzdm83pUfu8IWOlWuXGUg9jY2I+XUCxBiDlc6/WxrA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDcgWhbgBeUTW2EpWYOwZXZsqVv0Dyy2XV3rl0JzFy+QQSZwmL
	Mfao1oEcSnUiR9dKT8TH5YMCx6E2j3TXh0KnkHZFzoXtWMgQI9IW0bW7g3NIEnrylMczEXPiXmi
	z7urtFGbjWTev0tS4WhGYcjwMlE1tYL32NNyfL27wOH1ULpWPsBcEhXz7LtRYdoa9nw==
X-Gm-Gg: AeBDieuSIZWie1l2sDjOhOfQeZbBfh7yK3dKDOBW6QdDjkmoIqcKurLNXxWABVqdNEY
	waDQzYGjtSGdqBzZe7sf003yJhFpfbzjalxh2dp4vRWMYn8tzzYzWiicWxRB4DT+tlQNUG4WQQl
	NbaV1ywi7F3N+A72Pmu08ij15WaTgvIbu+0vu2wsq3HsoW+a719ITuGX/v9WMClPAhExZvvY/nX
	fZHyz/xTB5vv3Bu07ih7hxZardLPbaaktetAytMlundMU+o88JNV7FghzaZHU5TBsYFLKvkYk7Z
	PMyNrFM024nyFUhuo75MLi/o8gzLA7AeXEsqtqIMyKqBIKYHZ3eZdZtUNocaw4kk8ha6fIY/IzD
	yriaPLhQBW9NYKkB79JkGuV96GxEBwrPe83crSRAj/kNO1P/HE2B8LA9Xzecl
X-Received: by 2002:ac8:588f:0:b0:50f:c26d:f309 with SMTP id d75a77b69052e-5102aac21fbmr23257141cf.9.1777534271628;
        Thu, 30 Apr 2026 00:31:11 -0700 (PDT)
X-Received: by 2002:ac8:588f:0:b0:50f:c26d:f309 with SMTP id d75a77b69052e-5102aac21fbmr23256831cf.9.1777534271174;
        Thu, 30 Apr 2026 00:31:11 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed69fasm59515035e9.3.2026.04.30.00.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:31:10 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:30:56 +0200
Subject: [PATCH v7 2/3] ARM: omap1: use platform_device_register_full() for
 GPIO devices on OMAP 16xx
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-nokia770-gpio-swnodes-v7-2-c88f74c90dd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5930;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PHpDrTZXHmNwZUSRWJMw+i4wybcuMgJ3uN1C9wMAxi4=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wU4XukNO7TP55pg4f/67FONGRM2nuEafp/wT
 kRV24+CwxuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMFOAAKCRAFnS7L/zaE
 w3vwEACMegZhfLDIQ41bJnAVGxvOM+tx9kxXuv0GdzvafYaKXSUamw6nOax3IPck2um/WXiok80
 oijfD99qGVMuGCgXiAVeJB3cnUwFGmNSYZNgRdu8cDD0Tbfn5wu6qxzZEPzBWuQ3q3Beet58xiC
 zUZwCZ2hfdTKAQINwI0kxqXrwNX3fYejHuH2EGJGrdM9fC+SRJSWFS1wMg+ExyHbVrceqlUOYKf
 b0q6f9feaBt8wptE6WJJXcNUyanIGiQFLN5ityIWCB9RAzcd6tBLBOzo2FfpGaKaleIRwjjEKkJ
 xUy252eNIl2x6oZbdoTfZTYA1nL85UsSwYRgRDMCEfiwra4dEv1KSXyix6YmaYCeeIObTUSbaab
 0NYI0YxJmUceuT/wXMyRh6kS0bO9gGXOpdWGH/PFq0TloUloHJuA6ZAQYRhTVnwibXdvtWD8cwx
 ks0jKWqs/aO739f/hzvZiMHd2zp4sQrLJSJ7P2Y329iI6lFCfsLzBMNI8vAPm5kIOn/4rNAc4ay
 GOfHfl2szvcTi94YtgvkrercKXtfuXDREpvuRas1ivYiUcDFH+NyrLOcMiTv9rGIa1ZZ5ouQOFF
 8jME7Cd0uZceegeS+xby6ZOagF1EIr08e0lJlyA6SQz/bM1Oqj5uVMoJwau+4ZlBXBBF9WRbkLN
 EdqOak95M9yCBpw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: OUKPwpcQukns6mh3S12RGt5-Wcd--lO2
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f30540 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=f8xzO-aaW-4QTlJhfLUA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfXyuKLYaB2ueUi
 qBl9WMbsROf2awuIz0+XVnYaCaMy+gKoYWdI9MaCAJvpczzineaXXcW1mhyF+Wl/zPMZH7AnfsZ
 6sCcaR5HygroNI0rB1soNkJb7/WhfdEoMQjFTFHoHXgsDrJ2ZzfmNFSOoNbgAua3kLceRRBkCZn
 KhJxyA51M4KvOJ9gkdJVEAmCc1und1gKmfL/44LTZEDAkqu6LlSQquq1rJzBW39a1NycTkV+2ck
 iVWD/y0u4RM0Wk5G95jOUSzXsQscyh8CXKLhuHIa/xKK8j1ZNjVTTPwcu/6OVW5ajQvQ4RnMV1/
 FqbBQ2sdIvPJnZXvVB7D/2E9xxwEKDXi79kp9Tl6kdO0iDHsxufyMOY94LUPA/iGNGb6UM4czNL
 AcKZv92NHFcmJjShI+C0J/0Eiz6V3rGWBp6B/b/vP3uS12YCAtfjRKTtdg4PRy5nwDNJHy+kHcA
 HlNMLVhNlirzAIF5dvw==
X-Proofpoint-ORIG-GUID: OUKPwpcQukns6mh3S12RGt5-Wcd--lO2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300072

Ahead of changes attaching GPIO controller's software nodes referenced
from the Nokia 770 board files to their target devices, switch the
method for registering the platform devices to the
platform_device_register_full() variant. This is done to leverage the
new swnode field of struct platform_device_info which automate the
software node's registration and assignment.

Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/gpio16xx.c | 71 ++++++++++++++++++++----------------------
 1 file changed, 33 insertions(+), 38 deletions(-)

diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index e8dbe173bd33fae72c7c884f930a530f78096839..9cca29f860544ddbec3734cec9b3246ce468543c 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -55,14 +55,13 @@ static struct omap_gpio_platform_data omap16xx_mpu_gpio_config = {
 	.regs                   = &omap16xx_mpuio_regs,
 };
 
-static struct platform_device omap16xx_mpu_gpio = {
+static const struct platform_device_info omap16xx_mpu_gpio = {
 	.name           = "omap_gpio",
 	.id             = 0,
-	.dev            = {
-		.platform_data = &omap16xx_mpu_gpio_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_mpu_gpio_resources),
-	.resource = omap16xx_mpu_gpio_resources,
+	.data           = &omap16xx_mpu_gpio_config,
+	.size_data      = sizeof(omap16xx_mpu_gpio_config),
+	.num_res        = ARRAY_SIZE(omap16xx_mpu_gpio_resources),
+	.res            = omap16xx_mpu_gpio_resources,
 };
 
 /* gpio1 */
@@ -99,14 +98,13 @@ static struct omap_gpio_platform_data omap16xx_gpio1_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-static struct platform_device omap16xx_gpio1 = {
+static const struct platform_device_info omap16xx_gpio1 = {
 	.name           = "omap_gpio",
 	.id             = 1,
-	.dev            = {
-		.platform_data = &omap16xx_gpio1_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio1_resources),
-	.resource = omap16xx_gpio1_resources,
+	.data           = &omap16xx_gpio1_config,
+	.size_data      = sizeof(omap16xx_gpio1_config),
+	.num_res        = ARRAY_SIZE(omap16xx_gpio1_resources),
+	.res            = omap16xx_gpio1_resources,
 };
 
 /* gpio2 */
@@ -127,14 +125,13 @@ static struct omap_gpio_platform_data omap16xx_gpio2_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-static struct platform_device omap16xx_gpio2 = {
+static const struct platform_device_info omap16xx_gpio2 = {
 	.name           = "omap_gpio",
 	.id             = 2,
-	.dev            = {
-		.platform_data = &omap16xx_gpio2_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio2_resources),
-	.resource = omap16xx_gpio2_resources,
+	.data           = &omap16xx_gpio2_config,
+	.size_data      = sizeof(omap16xx_gpio2_config),
+	.num_res        = ARRAY_SIZE(omap16xx_gpio2_resources),
+	.res            = omap16xx_gpio2_resources,
 };
 
 /* gpio3 */
@@ -155,14 +152,13 @@ static struct omap_gpio_platform_data omap16xx_gpio3_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-static struct platform_device omap16xx_gpio3 = {
+static const struct platform_device_info omap16xx_gpio3 = {
 	.name           = "omap_gpio",
 	.id             = 3,
-	.dev            = {
-		.platform_data = &omap16xx_gpio3_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio3_resources),
-	.resource = omap16xx_gpio3_resources,
+	.data           = &omap16xx_gpio3_config,
+	.size_data      = sizeof(omap16xx_gpio3_config),
+	.num_res        = ARRAY_SIZE(omap16xx_gpio3_resources),
+	.res            = omap16xx_gpio3_resources,
 };
 
 /* gpio4 */
@@ -183,17 +179,16 @@ static struct omap_gpio_platform_data omap16xx_gpio4_config = {
 	.regs                   = &omap16xx_gpio_regs,
 };
 
-static struct platform_device omap16xx_gpio4 = {
+static const struct platform_device_info omap16xx_gpio4 = {
 	.name           = "omap_gpio",
 	.id             = 4,
-	.dev            = {
-		.platform_data = &omap16xx_gpio4_config,
-	},
-	.num_resources = ARRAY_SIZE(omap16xx_gpio4_resources),
-	.resource = omap16xx_gpio4_resources,
+	.data           = &omap16xx_gpio4_config,
+	.size_data      = sizeof(omap16xx_gpio4_config),
+	.num_res        = ARRAY_SIZE(omap16xx_gpio4_resources),
+	.res            = omap16xx_gpio4_resources,
 };
 
-static struct platform_device *omap16xx_gpio_dev[] __initdata = {
+static const struct platform_device_info *omap16xx_gpio_dev[] __initconst = {
 	&omap16xx_mpu_gpio,
 	&omap16xx_gpio1,
 	&omap16xx_gpio2,
@@ -210,8 +205,8 @@ static int __init omap16xx_gpio_init(void)
 {
 	int i;
 	void __iomem *base;
-	struct resource *res;
-	struct platform_device *pdev;
+	const struct resource *res;
+	const struct platform_device_info *pdevinfo;
 
 	if (!cpu_is_omap16xx())
 		return -EINVAL;
@@ -224,24 +219,24 @@ static int __init omap16xx_gpio_init(void)
 					ULPD_CAM_CLK_CTRL);
 
 	for (i = 0; i < ARRAY_SIZE(omap16xx_gpio_dev); i++) {
-		pdev = omap16xx_gpio_dev[i];
+		pdevinfo = omap16xx_gpio_dev[i];
 
-		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+		res = &pdevinfo->res[0];
 		if (unlikely(!res)) {
-			dev_err(&pdev->dev, "Invalid mem resource.\n");
+			pr_err("%s.%d: Invalid mem resource.\n", pdevinfo->name, pdevinfo->id);
 			return -ENODEV;
 		}
 
 		base = ioremap(res->start, resource_size(res));
 		if (unlikely(!base)) {
-			dev_err(&pdev->dev, "ioremap failed.\n");
+			pr_err("%s.%d: ioremap failed.\n", pdevinfo->name, pdevinfo->id);
 			return -ENOMEM;
 		}
 
 		__raw_writel(SYSCONFIG_WORD, base + OMAP1610_GPIO_SYSCONFIG);
 		iounmap(base);
 
-		platform_device_register(omap16xx_gpio_dev[i]);
+		platform_device_register_full(omap16xx_gpio_dev[i]);
 	}
 
 	return 0;

-- 
2.47.3

