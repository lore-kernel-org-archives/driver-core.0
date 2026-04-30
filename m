Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879283B7B7A
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777534273; cv=none; b=FpX0+K9dDDqR1wLhQTPyysVEwLawHS1lkXuKISB2llseBbgAHzV8A+JQRwYeT+EflU1Ja+ITMz7apLG3EF+M5FtsHuzlU1jz/c+ALP41luUhvORUI5D34jTlWL/7FfY/DrJgV4cOzfLCl0vy5VQu2MGUyUXDJTEA9c6JAszIJB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777534273; c=relaxed/simple;
	bh=1N+EfBQB45Tp1UHYeYYJOHZLrrWLfb06n+j18VwGZl0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GObRXP9EPMjLufkUnGNZumhycVtFVzCuuoaDhFpey1ZU6iHxRR4A5qNvyjglRby398WsugEA4ZSLUlR/6uhOZQ973+0fJgZsAddLgVdg1iEaEZ+SYtgqDYlUdTxciiUKkvNwMLi9excWcxvvfhpV61Ewd3XFK9Q76Bt8CvV1yq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=V8jz7+3A; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c27xx9mH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="V8jz7+3A";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c27xx9mH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U755Jg830496
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=V7JzakOUT7akT5SMUuhE/h
	DcVBqqxoGfQexPvwrbb6Q=; b=V8jz7+3AoG34ijaiBiEbTr4kmX8Rik2a6KYneJ
	Doj57lZyjxXF0z6D26a68iHGLzvn8qVa1adh4GMHKWdP2SrO/hERoa8Lu8hS5skT
	Z1BbbWM6Fkm23aIzorC3jTNkSlF6PrUJInlTJrUiD7flh4qNhgBBzWf0WmpBfd1y
	KrdRNnYA/mUUu+zkY/TUx3HybctQuiNlDme/2w6sOwjdUPTNOU673Bbw8rVM+vJN
	3tbNVTnQOfKBpXIWT8ytNTeN29b+a8KO9wKACxZkbde8KX29lrXdMu7OkQNjvMJD
	qB6Lpm2ufwOqACpDdoLv441tT9i1VyOG0Nk2YG/aCk4jQWnQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dv2cq02ye-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:31:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50df4c130dbso16530901cf.1
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 00:31:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777534269; x=1778139069; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=V7JzakOUT7akT5SMUuhE/hDcVBqqxoGfQexPvwrbb6Q=;
        b=c27xx9mHuFQpS13mtHfkKG4rW2VmDUZjjulQl/HZqRtgp5IWFA8GA1/32DNgT2sdRT
         XTHJCgz1KIkBNGInSmWmk7KdRHavWJnymxUafMff/9R7YsJfi3WjXLpA+Askqzo7SK8m
         ft1re8XGbbbIC0pM2X5BxuujmJtaCoNy2b/7obxjiTikeRGddnlLUy1KLI088hPf9Dhk
         eNldAsAX5dA3jwQq3TkI4ESsGzMqdx7DJ1EMxHdgB8xCkaahZbHCfaA4SW7VPMu2dS6u
         Wi4TKXo2t0MexloWoS8lRhEe9leFyI2H9ee6yD/yTpRRfC0Wz4RPJjzY5klnFruyKi9k
         r4QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777534269; x=1778139069;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7JzakOUT7akT5SMUuhE/hDcVBqqxoGfQexPvwrbb6Q=;
        b=GkQqwLV4hDtS4C593Tt8GtftjGfFv7woR7kFLq0fvHaL70agMTmUvVVhGEADW7yMOu
         6fLRnRvyuzKaXY/VoCqOvjBCoyMK9ixJPg4yR+2glAEwCc4cpBaEq0SpRIanFM8Bkknr
         j2UetdjchNonzrmkmWQGU1eQ50fuCEj0sVZY8vWPig1HhOcZ4SQAYeV1DwF8j82bRagX
         84+FX2eJ5ENvcl1qUiF01Umy2Nv+QqsgDBqOomx7SsVO6i0f4WnOAkF4QchITJDw32Z9
         TvCLxxFZj1iE14v4J+NPimu3WGZbRAlZkOPTbLzVKIj78cYRRgO0BajUDk9JbXLlnDp7
         JmLQ==
X-Forwarded-Encrypted: i=1; AFNElJ866rg+cKOT+1gv4AotpR2R5vYWrSHM66mn7AwBhtYT1cP37p6Lz1SUny6xCFIrvDD+dsIGUUVQniOVFw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyTD6PP0F4bXia69ecRXIIFE9KQUPh6voH8XizSi6np35QCx/2t
	BiE8oA48KKaUyEw+w5NOGzdBQDuOTwrnco95xEcn4LuWGDcX82PT0TuMYVkJm2VClDrkT4Jmz9I
	y/InP+5uOANzTWp0Swgev8HFNwt56M9luC3S+W4WqIzy5mAG6fqJDlBGpPBYYiyQOng==
X-Gm-Gg: AeBDieufl2MnglMDsUNZF4tUKkAXCr4d4SXnvqJJZ+Xf2rmTMthv6VGRo9rCXUZ5W4b
	wEObN8FHb+Q1DGyeSY+/tlbHYjxDnQYm1ZonDd1MvCVNGvXnR+rhAy7yjUTbsgogbwrZebPaIzj
	SFZ/RX1yucTQnUoOAihR6qq+yKoYlSHpl3FiEzX0flYNCuW/zqHycdnCL+YGfygzc5Ha1VyK2uf
	v1zIA1JrsKy/biNnBHhmj3HZMWjrr6vjIGXJNdvEimTbZIDmgEVOZH9unJA5vNKeaLq0GYlcAnv
	e+1CO2E9WXXXwicQItMZfP2yi+ArauwOrIWahyIfBA5vDudnRfquqdri/9zcCI/JsL6acAO+LGY
	D9RnTHwdC17mp/aD0iRXw3liu9sejhiAfmuOkRw63Rg5uGCQhsq6ANmrvx3fD
X-Received: by 2002:ac8:5fcd:0:b0:50f:b181:6ae7 with SMTP id d75a77b69052e-5102d10aa50mr12953691cf.17.1777534268550;
        Thu, 30 Apr 2026 00:31:08 -0700 (PDT)
X-Received: by 2002:ac8:5fcd:0:b0:50f:b181:6ae7 with SMTP id d75a77b69052e-5102d10aa50mr12953271cf.17.1777534268014;
        Thu, 30 Apr 2026 00:31:08 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a81ed69fasm59515035e9.3.2026.04.30.00.31.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:31:07 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 0/3] ARM: omap1: use real firmware node lookup for GPIOs
 on Nokia 770
Date: Thu, 30 Apr 2026 09:30:54 +0200
Message-Id: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAC4F82kC/4XOTQ7CIBAF4Ks0rKVBfosr72Fc0IIt0UIFRU3Tu
 0u70YWNm0neJO+bGUE0wZoIdsUIgkk2Wu9yEJsCNJ1yrYFW5wwwwhwRgqDzZ6uEQLAdrIfx4bw
 2ETKtqloRJik3IHeHYE72ubiHY86djTcfXsuZROftPzFRiGDNKyaxkUJotPcxlte7ujS+78s8w
 Awn9sEowmsYy5gWBOmaaI2lXMH4F4bFGsaXzyTBkjdbWbEf2DRNb7Gr5lBbAQAA
X-Change-ID: 20260330-nokia770-gpio-swnodes-5da8ba35946e
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2254;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=1N+EfBQB45Tp1UHYeYYJOHZLrrWLfb06n+j18VwGZl0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp8wUyVo05YkXyeGq+r5+ABl8MGaLWfVKJhfYwF
 D7bkHjP0hGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCafMFMgAKCRAFnS7L/zaE
 w9P6EACPoKJBjfy/3HccBoDT7Vcxp56X8dUSIvSER+/ZKPQewE2NBo5IZzxEV/l3HA32Hf0FhVQ
 oysmoXhqs8RnVWNT/Q70oqtl9lSqOyGAal61LnzUp5+8agcZsJWBaAZnTOYqLQl9B/SP8ggwmJF
 SbeDEwtEoVHSGZ5JtBXLe8XQ0UteLBNUiZoI9fb+Ro93mao8ECJWVnAZQWds7mCF1RVdlWPyvVn
 De28hheIiN0Lh6ykp8hNj76km/Op/kji2yrcn/9aRhoodq4RE2hFKHvzmPYUfyMpASWQ/JK23Uf
 3ixXMRIFHjpOj0nIWigGy1UVgCtZpGmYVk1wyZwS0xmC8C20LeTw3G21blZLXB9sYewBn+ioUD6
 HRhIhh+ltOQf2XodXwNHPhV5lcY9iHKPIRoDGdrjAq/Ib2ObsyLNLkl0PBdTD5p8y9ZRwUnOnlN
 AGPAjG4iPHhPY7yqnKKEN0AYF+2uIdv8xRYXiED6smIEbQKizoe4ou52MrIuqkSTAGlDxvTl58L
 BVuM9O0hK77+vI844XLP2G1kTqYg85XIwQKQsW51eKDSdvzaZZTDYgBrYHiLRxm+IRKmF2DwF/l
 2xT1vPiAPOS63bz61/KDdlxHnnc1axlJukOwTvP8q0olX8XRFqnp4ysQsF9y50eyqIhWr63OmlW
 Y/JpsT6kYEjqTfg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: dTS2KqaYR3BSPyhkBkwRUJWVkxqoegOl
X-Authority-Analysis: v=2.4 cv=aYRRWxot c=1 sm=1 tr=0 ts=69f3053d cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WeWpliTHXVVyQaQyHOwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3MiBTYWx0ZWRfXwSB8lepESczS
 W+sWGZx5cl72+Cl92nYVgzlnYOZd8JEXMbLo7+OZePb4BS4LbX0G/Z12Zut2+WtHtF+AXBBU9BG
 OAKumiSNcxKHZJtS3/7QbvMJpzsVqgh1MPGNfCpQUQN/7A7IO4rB23olPuf7de6+YDlaq7EuojB
 qpXd3moX5ciheoPw5QQFS5AiRA+cdHUUHllmdcydputmhTHCSqjdK80sM9w0HACTvULP1fBYrIH
 IAPKQcxYluBfCn+ThSOsF0QsKUECEpKGJEqiS7t6B9F7A7UqIPPufFzeRlEPJc/AxgEK4HXGGyw
 XZMt8A4QijU2QU6sFAw/BcPFIHcyUA1ynj24RVuWHcv6dYMd79FkJHWOK3mbiWhOEILG9hJZQ1m
 DUyvhgr3JTHDhzIlhsLqE+cNyhGl2c2zRlYNGqe0mF6/svahsh2wcvcHveh09CAFfb3CrRg6dGz
 sxR6Kj3MUH9TebZYtKQ==
X-Proofpoint-ORIG-GUID: dTS2KqaYR3BSPyhkBkwRUJWVkxqoegOl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 clxscore=1015 phishscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604300072

This converts Nokia 770 to using real firmware node lookup for GPIOs by
attaching the software nodes describing GPIO controllers to their target
devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v7:
- Drop ADS7846_PENDOWN_GPIO define from patch 3/3, move the value to the
  property entry
- Convert the second dev_err() to pr_err()
- Add the device name.id in the pr_err() output
- Collect tags
- Link to v6: https://patch.msgid.link/20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com

Changes in v6:
- Switch to using platform_device_register_full() and pass the software
  node via the swnode field of struct platform_device_info
- Drop driver-core prerequisites from the series
- Rebase on top of v7.1-rc1
- Add patch dropping an unused variable
- Link to v5: https://patch.msgid.link/20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com

Changes in v5:
- Put ksysfs_init() in a separate new header
- Remove software_node_exit() in a separate patch
- Link to v4: https://patch.msgid.link/20260330-nokia770-gpio-swnodes-v4-0-b68592e977d0@oss.qualcomm.com

Changes in v4:
- Add patches making software nodes available earlier
- Remove stray newline
- Link to v3: https://lore.kernel.org/all/20260212112508.73500-1-bartosz.golaszewski@oss.qualcomm.com/

Changes in v3:
- fix references to the MPU node

Changes in v2:
- fix build with CONFIG_I2C_CBUS_GPIO
- only export the two symbols that are actually required by the nokia
  board file

---
Bartosz Golaszewski (3):
      ARM: omap1: drop unused variable from omap16xx_gpio_init()
      ARM: omap1: use platform_device_register_full() for GPIO devices on OMAP 16xx
      ARM: omap1: enable real software node lookup of GPIOs on Nokia 770

 arch/arm/mach-omap1/board-nokia770.c | 33 +++------------
 arch/arm/mach-omap1/common.h         |  3 ++
 arch/arm/mach-omap1/gpio16xx.c       | 80 ++++++++++++++++++------------------
 3 files changed, 48 insertions(+), 68 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260330-nokia770-gpio-swnodes-5da8ba35946e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

