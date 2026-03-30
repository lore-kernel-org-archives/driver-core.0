Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9B13D331A
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 12:41:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774874470; cv=none; b=hcRVDF1y3AR4Tk5CFPX2sMaSxhK0r/q7pNlygQZix2XbSG3Sw0dIuPAqoI71qRXIyIElF5vmaT6C1ZUPnB01AYh6+Xb/Xormq56M4654sn4UdZnbuPL9Mg+VtTTxH9+MFMUkekaruYH7Y/viktwvaXjMB0DwCo1RYtU+Dy86pUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774874470; c=relaxed/simple;
	bh=84lA+sQad0KFCHbORyyoFKtDWqR/112mWPWVfk7uVlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M6DKEvpG+tJTOy/iXPey14Sd2KCTdwGi+/C8EDGI73gN9WwjbwwDxYNdJ1q3cXtIPXhpKwZruFOuoEeWaP4NRh6F2Nh+arZ9ahM8C2l71Bbkv4FFtoa+LdfbiLzRJY1Fo4n9zQ3M+ZH3Vgp/rdINbf+15gcYGNmPQOJ76y3XMik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jmrmusQO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XF3MCpBn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jmrmusQO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XF3MCpBn"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UCcVv93195173
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 12:41:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ko1IaIbS30UK07529xORwTESC79YHbPzcSNYySWBN3s=; b=jmrmusQOEXUlkMAU
	RFn5qgz0heXaQtsy/G/nHKb6zRqKcKUC3ZQSJxeoDhcDzPKpywJcINRj4EVbc+JO
	JdQMjPmLG0qakAUl2oIC/+QzUuocxqOryXMUucfUlF+zgQcyOcqAq9PoQ6cXydR6
	1hsce97+sPOMfBC0eeLr1pBnZJ9BxqZ/7ZcPSITCi0uLNMT6hbIxw4LGshTSnVBc
	hKVfpf/GoHFt4ssLIIT4D9JGinD+9VnjBiEsmbuFkruWuNU1hCegiwx6v+Kxw98R
	O/lVdHquwLk5dyl7xungLevWAn2MCVmE/obm7qywmyKdw0JWZqCJ6s/dWzBQl5e7
	6qQYzA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7sbwg06m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 12:41:08 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b274f94f8so57437001cf.1
        for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 05:41:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774874467; x=1775479267; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ko1IaIbS30UK07529xORwTESC79YHbPzcSNYySWBN3s=;
        b=XF3MCpBn6EWLkJlaS0yS03OgPvzUKoGO1T4gQLhAw0xzm/JzS4JQlcnNHwon889A4F
         4xjgXuyOX+u6R0PzNr2GwL3gAuRnj6nDh56YN7ExJtVgjbXNdxpUKXIfr0b0R13Qkyp+
         2Yu9k+UZONWLPJhIvZY1s6QDgkQOVR8Z3oEe/0Kf7c9FTHUHrbC3P06jkGPSYJNJHZVb
         8v66tOxUQHsXaz1u8oelKWNGQG0pajC65o9YZ9NxdL8tN/E44UC9cgCL2iCdaGPfEnEg
         gXfAcE/CyimHN+CEt06teXo7q1iyBbpkNLjvkoY3sMqugW/66pjdMcJxVX3YM3RJ9nIS
         R+DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774874467; x=1775479267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ko1IaIbS30UK07529xORwTESC79YHbPzcSNYySWBN3s=;
        b=hAtqX8w47UCYsliS3feRH14LrFFiDNTC0jWiYkyBgRGGQbG3ZcOst+3416jKyy/wkj
         4yl/NUEPhByiLFEBLIMLE+jsu+5f/98AgcRKr9afgKq/oY/DdDx6iMJD209ynHz+LQI7
         lQ/mIKVdPaGU67EoNu0pZVATei56bJcrmRo4sxKKrPEKR8PBNdtx4bHvx5NNqEodSDXZ
         7MZslHwZHMeg/RRpH1+TpMxEdOA6kxnWWfi939WLuNFYuOrz14qSMEaKxBE5vTzuebRF
         8pPxIjXqntkqYFJ0gH3USuIyAwXNyOhNZad34LziKszdIHsHDOmMvBi6wh/lGnIYCHUd
         EADQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+csfMWHs26HyaOCi9zTmKQTtW+e+vK5gzToqXrWtPuTcn6mCbubyieyT0wkVMtdrO823I7xr86I0Mow==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGeyeLnaZ+SGTL06CFG6aY6jZUrpQMJjy3P18e7Cf9395ffN7u
	k7HDe2tyS6YeDaTIDTZjARZbpyLkysWcVUAhjPPMxK1rUPa3KcPmbRlvn2n0DYLOyoGTP3mh/Gf
	29Rt7RQNLiDY8gAvKXRTX0FMdzLWAQqj/fYshl9SvW+2yduV3w7OTtj5+nQ555yudIA==
X-Gm-Gg: ATEYQzyay1UcuhpjRq8GFm3tFIPgGZsq3yu3IzITmGf/Cbimy86bFWSTHjGKeRo9I0i
	mCoo2IHCsnMuoBxrALhXyAQrwDND9dkZ+3HRH+zB2fHcEmk7geKqzJBkL2vaSYtldHxfQWNBTu9
	wTUwsO+nlzGuiOCpy4v3rXfkmQ+TOG/cO6dA1pMWB0XH8ICDEdlA0nPPgfb2kuKYTH1LDc+XCB8
	p9nOxt35aYyq1r7g0x8A7ZhVodIVl71j+yKKsxJPacG95J1VaGgsAqjgOpUQgnFDEneqzXoAvHf
	7sRO4VdxJd7xPgHmneLRj5N5YgHU050yXCHF6Iro0BeGBnGFy2jps4YdcxtfQwrnlg0pUv32GzH
	1wH4q3wKt2A3Dplz2v0ZtWn7tqQ0UnX/MLuBWWka9RXqY805uwnur
X-Received: by 2002:ac8:5a89:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b994a2ef2mr179889421cf.23.1774874467168;
        Mon, 30 Mar 2026 05:41:07 -0700 (PDT)
X-Received: by 2002:ac8:5a89:0:b0:509:1b5c:fe25 with SMTP id d75a77b69052e-50b994a2ef2mr179889051cf.23.1774874466642;
        Mon, 30 Mar 2026 05:41:06 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:e931:8d81:9955:76ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm19576153f8f.30.2026.03.30.05.41.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:41:05 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 14:40:48 +0200
Subject: [PATCH v4 3/3] ARM: omap1: enable real software node lookup of
 GPIOs on Nokia 770
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-nokia770-gpio-swnodes-v4-3-b68592e977d0@oss.qualcomm.com>
References: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
In-Reply-To: <20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com>
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
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpym9YJCTjMaPTcRorvdqssCYI1k2/E5GJ4jytw
 ZR57hP5o8uJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacpvWAAKCRAFnS7L/zaE
 w0NyEACit79oWBubTSXRaaJq6YU0cV2jClRR5Pm/4h8x5xRF2z/gLJIJSF+x1qXg0yuxJKR2haF
 3Z0d+rFQ60Gl3L1OtJnvwMgRypx6zY0Q6MG7Mmy9ECWLZ+NXChFBipM4KtpNPz5dF+q+SieEr0w
 64TQJX1O33B2L6MHdyDfT+QDp41ssoIhcVGDGAkzPeNIu+smVIm5BDURH5vyp05vGhHG+6VW9nH
 8mfUAAwT6x1XYVl4uiRlKA0i4BVia0WY9+Ex+lMkSulG22R9hbs/iGoCKJEh2i9RJ0XR4KPP21A
 /40PNmYgZaVxkQHNFFaiDAVO+BbqHxxrFR47tqi/P8PvjiB/yvASU7SeF2s/8cjSD6YRmP7MEMO
 6uc39r0lndgV5mL/Uvnv8Z7HCpixxbYh08vw1DgAusvSS6omRm6NGjmQyvvB+8OMynTzNC/P5W3
 0npezTcalpAcC5Bhzn9gKkAXDB4abPIm/lsjFRTplB92tVP9ZLpukZ0poUDMekuKEPCtKYhECOa
 W5whKrHSRxv84A2oE07uonp3s08xZTguhMjkk2MSyTBSLLIdLFV8isuwT9xjQR18W2lH6rZwbhI
 NG4Qay4HfA4cXVkfjnX7pCsZAkexdAjVBYrKJdsHIYASkj89OmNZetU65DXT9JNARw0ZIFKC6LM
 tWqkSTVLaXfQ/Lw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: KBu10qnOi7V3B29kkfRP-WFUQ0y96PY2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5OCBTYWx0ZWRfX59s4hU+t2BIn
 ABeZ36ZraH+Vn2vos6dhcDUJ9Me+8Co1TNam+/03paZ/aPjQSHycbEQPnqvmbZAWBwRtgpg9PAg
 jkhc6y6245L7T1gcKtcf8TqvpqwgiahqExFwKlb8DQfrEI8JivRzmbzkMcHZLbm/dtmPuzZ1T9D
 ysZNAQPqy97mpu6N06AYMm2JI5kfU/bugtN7uF9XDP1IFh6I2jLlwLRgEF+68V8Q6UNsIWnQfz1
 K9Bh6a6iyf3bhjQi7sK8YIKCGlz+TkE5875lJU5UWbo9x/8jPHvguRbfWFLxL0Ffq27d7VwyCy5
 4hg57IRKR1MqzUW4a9VNM/2Ov/w3WEJUlFdSAF68gdbzu05XkyIzSQ9gfyBjpsXrNzqD/24126R
 WamY3p6zo05/PlvM45X6wTjHZc551NDtnRyNzDITcSY1NeEZsNTm/wqDDPdhPQoI99T5vb7wrSK
 unPKeYrxTaFxB3p/jaw==
X-Proofpoint-GUID: KBu10qnOi7V3B29kkfRP-WFUQ0y96PY2
X-Authority-Analysis: v=2.4 cv=TIpIilla c=1 sm=1 tr=0 ts=69ca6f64 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=mL5-Ybe71cLVbzrCEFIA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 impostorscore=0 adultscore=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603300098

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

