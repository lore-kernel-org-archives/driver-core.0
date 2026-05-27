Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7A0D2C11F9
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 08:04:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779869044; cv=none; b=eP7SBsTu7US1vCWIauxgcJA5YS5TZfuYT/vgrMmFQ6hzEpQipY6sO+Olo7zBnh8TMaWJqDxtUK/EEIUkeaa8OL2JvQ5+kTzRC3vV+QmqftygfjVwITVn0YrQvqdZGiVstQQksCC5sxsjmD+XAAEMvURztmM3nFT+VBVbYAfB1lc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779869044; c=relaxed/simple;
	bh=ZGqZL845qyTXPK+tlB9pFfWL1VcdzPYHM7htCSoE4r0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NVVuXQKoYsoGj09Mfmbb9upKxIYq7+jk8G71eE5TUDaIMzspqk8IvpBZzEivTODR1he2AgUUcSEOGW4slbM1Tzt1ojq1sceGHs73BXAYeJOHBuxihK4kIunYuVM/lWImJLomBWA4LyEi5hhDi/kwNI1wsEshDnAMgrZL8ppBWno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z5csz6s3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X6X6BXcX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z5csz6s3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X6X6BXcX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64R6G43s1803459
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 08:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7MkxY5VHM+Gf4iGD+fZqDE7SlRll0D0csA8BjLC9/20=; b=Z5csz6s3ut2SvmjU
	fXVeJy8Lmi41Gg1aCF3w/dxNeYKrIN3/op2Sz3iZjBvmxXaTF1Bn/+5BRgeuU+ty
	jygZ4bViqwOwsD7V1eoa+O4IiPUFuGmMz3+z7RqSBdFjAWjFggdZelmGmWGc1bwk
	V5nKBThxTppHXJxI3B5v5wQAIUZaw/hjmLurvo6WBJVqDCS2kD2XkaxXBFZwZGCW
	s2qsfnL+u9JgY7DnuXhzH0TygVPZjjdWdQxPwDkRTfa7WvwprKwaLGQZt4zZ1aic
	dnBff+nwfXjZ4+nyUHzAcCeYiBhxXpFhGonEHCrRjHUMN8TSJo+1Xc25uA1GQo5Z
	xqlggg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edu6rgcv2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 27 May 2026 08:04:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51650041428so68599581cf.3
        for <driver-core@lists.linux.dev>; Wed, 27 May 2026 01:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779869041; x=1780473841; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7MkxY5VHM+Gf4iGD+fZqDE7SlRll0D0csA8BjLC9/20=;
        b=X6X6BXcXX3hc+qp5G2v70aWO0TNmRJbW4fQrlD5qdaOBchO4K0DHt/e+Hk2GHI5bf8
         DLoiwlbZ5kb0MudxY8T3ZSTbxPhmoKf2Ux/0u0gR0R7WEJozX7VkNYAcnezcLitEIqW6
         bnijo+68sPjyxfwGt/zNmPJ3K2Mma+Vvgf5X39nFeQ3f65or4LEx4mPivlXDs+yuR1C/
         7gqqniheuGOn1H1mGMBk27T/x0rKs2sI2ZOP7au0idLV4AXXLwo7DzwP+8Vv5U+1EQDb
         9J+PNeE1hC1aWdth3Gz96EG128zt3VlgoStcdJPjffbvctbZdW0tLxZ7Zda8OPTKrDz0
         D3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779869041; x=1780473841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7MkxY5VHM+Gf4iGD+fZqDE7SlRll0D0csA8BjLC9/20=;
        b=U06QiKk/VQQInBaXDJCpXPdNpAPNtWQPmy/g/JiE6nqEaJuwpX0gpmmf0+/cHUl9T4
         OiTI2A1wWOFGyV9w1vHS/ToAn8C5mrPGukOIK9RmnecgAhROZ2aevdzzTwMLTvyNX3qh
         xhnMnnHBsIx2rzRGhLvnP9Xl9dzA3sZ1Mh/bRhFfQk2ByjGlmGPpeOMm03aFi3AofEd/
         4sVu+X4ns/3h1tXS+qh6z42aVi9HvpgOmBqFez+BzqliXiScSIQ5zCe50jW3fhCCUr4s
         HCkgR69V8iarJyyFAIzuY5To8tlGDBriUWlskgxIyLWerB+CeOaCpeDZReplbZ54dW+I
         SNhA==
X-Forwarded-Encrypted: i=1; AFNElJ+MDgWmD2WW8ncL+qKTG9ueReLx1miftq0413OXBeLcbWcRDVykAcg61GkPz1mDrHepGrCjdNRY/3iKiA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+djyeqnVXpFPVRx5XTSX6NmwKsZKDkb/rz9EjM5vkp1kB/xc1
	JGBiV6sdXULuvJHGx+XCmvkdIPhF6yg3VYhZIHULVO0pm+AHUtriSf8TUA8skYi2KpipX/fIjUW
	hjMWwpPUWVyfLLEWEPUKxjcLXKE5PmYZbwjiDnJTWNuto/dy+YGJZ9oDtowzSrmZrDQ==
X-Gm-Gg: Acq92OHLqr5L5IW4WJe9OJS0WZV+HiOnpJu7nL21FECaP9mghUJFPOiethiUJQLqNX1
	qEvnhqe98QfmCLut9IZHG6MdHXJA+EZfW4u06hZqpivopro6DNa3ld3Gi5qPanoqyX/9BrKiJOa
	KAmut+It0uz7Dj7Fd9vTsC00t80picngzksMC/F5OHKBCqAuJH/ArNVaR+cm03cygfhWKWwR7hv
	bHXujpSfXJhn3HXjFPrBa/WQwRhdmlFHGhGWCCbFryVCjvkN9YUZxxGwnR8jnkTdbyWIId02xQQ
	aLoXq1RUFmeP2KeGxsBopUmSeiuTgA7rTtcNTrNElH6+Yif0XlyQ1NRuusDcp2pvdOA00YZ4KCp
	rRx+0zZU88EE4zmJzlPMsX3/p7B2I0BN7VdPwz89/mqVwbr6176eLitAQgMVuq08D6YJFle7d78
	C8tIjmuBU6DwPSkJUbPNCj/5R09rxD213T57lLun3VAa7TiMsiVg==
X-Received: by 2002:ac8:58d4:0:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-516d45b200cmr299429871cf.16.1779869041220;
        Wed, 27 May 2026 01:04:01 -0700 (PDT)
X-Received: by 2002:ac8:58d4:0:b0:50f:ccdd:13f1 with SMTP id d75a77b69052e-516d45b200cmr299429381cf.16.1779869040697;
        Wed, 27 May 2026 01:04:00 -0700 (PDT)
Received: from brgl-qcom.local (2a02-8440-e500-3194-8c70-1be9-4d87-8bf7.rev.sfr.net. [2a02:8440:e500:3194:8c70:1be9:4d87:8bf7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561a198sm371665135e9.10.2026.05.27.01.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 01:03:59 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org
Subject: Re: [PATCH v7 0/3] ARM: omap1: use real firmware node lookup for GPIOs on Nokia 770
Date: Wed, 27 May 2026 10:03:56 +0200
Message-ID: <177986887080.4201.14057302691715759454.b4-ty@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=MoJiLWae c=1 sm=1 tr=0 ts=6a16a572 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=akhc-qRKS61dJtW-bLwA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI3MDA3NiBTYWx0ZWRfXw97D9Ai7+XCE
 MFBSRUDcKOKE1aahjQnGGxGSrL8AFPws5h9KH3bfPOeb1KmEgaVYGr3cXoaZcxT2XnyQ4INGXcc
 j31qIlvsZI1tjelgvTJef4Zl7/EycA2PUM2Dq1jWtTBniHvN+2HUeN56oxc5rP55J66Ank7aSd/
 mVAD4hSxi8/4/0JQd95L3yvAHTNpSdhYM5lRLoOivEUWNY8xdrbXKBkuPQ+Qoy7AyG0ydXOJTe/
 e7hukdWOtxT/+LyeKzIKtqpTveB5S3PUkb32jSTiOW7XtQ0aYOTBMX9vHVgwPjrwG9bhzcgPpMK
 Tvp3aI3+2ea5PV63cVPvmoDjhYYLI520qJXNAV6FJzO8DNFBQHpjnHGlPSF+lIrGMKt5z9l5ERr
 M1kzyVxZ8LJxFt/lwSlTZez03ywuf4F2LwmNLnMu1Fnc5H+dGMf21b9k0AJVn+8JFWxHGT/zU5k
 0x+l/0xQ1RJ/XOAHtjA==
X-Proofpoint-GUID: eGKCsrZnk5gJ3Ciq8uw2GXgVlXDZntf7
X-Proofpoint-ORIG-GUID: eGKCsrZnk5gJ3Ciq8uw2GXgVlXDZntf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_05,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 priorityscore=1501
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605270076


On Thu, 30 Apr 2026 09:30:54 +0200, Bartosz Golaszewski wrote:
> This converts Nokia 770 to using real firmware node lookup for GPIOs by
> attaching the software nodes describing GPIO controllers to their target
> devices.
> 
> 

Kevin told me in person I can take this through the GPIO tree as it already
has all the Acks from Aaro and Janusz. I've queued it for v7.2.

[1/3] ARM: omap1: drop unused variable from omap16xx_gpio_init()
      https://git.kernel.org/brgl/c/3288e99f9968c37a8b654d5f4251382fe11bf854
[2/3] ARM: omap1: use platform_device_register_full() for GPIO devices on OMAP 16xx
      https://git.kernel.org/brgl/c/2bdf432e15818a81575e691e4ba0e3a3259d1711
[3/3] ARM: omap1: enable real software node lookup of GPIOs on Nokia 770
      https://git.kernel.org/brgl/c/61442e46fb9de57718a36f54c9ce1ce66ff7750b

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
