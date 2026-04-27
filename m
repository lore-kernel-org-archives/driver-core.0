Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E600285CA4
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 10:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777286815; cv=none; b=VqCNkNBMKM/9zxinNRExWqmCVHxx1QIuyejjWdCzQZxjhXlY0Lq9YWj4RoWIIrI2WGJLBcLMuYU6dKiE+Ch1jcKvNIPoxk0M85m313djSx2MV2SGcJXlRfeGsz3m2h4oteu/irw5Ez7tMn9mlHjyTgX7J76S5uwjE61Uc4wOzn8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777286815; c=relaxed/simple;
	bh=YRML3/4wubgO3BKLVRzWveh6hjcAaWgMYaQc9TCSNb8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Fw5boE4tRBrhjSCQNGUi5r9rGgSVrw/7bnuaoXNmn+GNT89/VDi8tShjjiQZdlXb1OWWx/S5CrIZFS4jFb9HWl+P3Spm+ouHEIPIE5l94159r3hAxBPtv3Ki6H2Io1nHXUQlkUdQlxIGxkxXGSombvy7S+dESb2lBkDRKwNjTKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ry9QQjob; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HAQtMbFQ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ry9QQjob";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HAQtMbFQ"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8kG5V3961981
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 10:46:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8BXF30rYIbp1AFSMQS7md7
	DuGRyYvVsJVET8/FPU4oo=; b=Ry9QQjobYnoN0yZY5QYzJCvfP/8S9zvBWQgLlt
	n/nvl3ogvZPaWQAnVYq0nGzk5jd8SNKIqudewE8X0wuzGnpgNZzLuR4Gh+v0K24M
	1ndKEvpi2U7IAjllwV/UC3Fdatt0vjl42rORzQBNAxqG5A8Pn9EYi/koproGgaCt
	+J993EA6pDClMijoH7uMnjlr/4LXIxBcC9VJuDvAEYfbGsHYhUMTfEpAXBxK1V8t
	t7eD4bFeJTf8acCGTr7QKj+VUaPt8N7LvILZTWXwnHrPiIge0aype5VmPfsdqZyd
	U5GRBs2zdMvNr2tZusNcJafAm8vijDkLTvhR0jABSMv2iz1Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt4k30pjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 10:46:53 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50fb007bc36so174274771cf.3
        for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 03:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777286813; x=1777891613; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8BXF30rYIbp1AFSMQS7md7DuGRyYvVsJVET8/FPU4oo=;
        b=HAQtMbFQD20pH2vQgbZlj0KnOHmJl3LAdxuRVvQfS6O62eRxGcLUt/cq19uoBM03b0
         QHEsGyRwib7ZzIEfQFaraoexaplzbdCrc8LGAGKgQO+/rpQq8eaBKs+DSeZoyeBpi+MX
         NriV3CPM9i70Q3TgC86JIdYnos2FMz6znUpVMxmn/VJNT+ggDFfP6gk8+ehjTyIEpp0B
         pm6LThkSt0yDlo91RbBAR5zxCezJ0w52/ykXOHyUJsa5mjBGEi/QM53eq8dMb/HeFnhA
         Nu3cs6qLboxh6QlLVYFvWeaHDHAzFsAvk+zN5rPx9Q97Z0otDWbHXn8EAnHO098rEdlO
         s4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286813; x=1777891613;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8BXF30rYIbp1AFSMQS7md7DuGRyYvVsJVET8/FPU4oo=;
        b=dFPaKC2w2DtZn4KgwFagrl32FQIXXKDbG+1pArLe22q0/sx0qwDZTNUMhNfAqgUpBQ
         Ovz0icEeUp6b8yohLj1rgNFQR+btJ5Ft+uMNhZGv372PqyknVbw7+nCVTn/hmn9mLCoN
         tiG9iOV6bGFnF8vOmINxo/fEa/CunFWsnp/eZLZZnwxQJINyXIkfZqRSQX3/KbpA1smB
         37R/i7GkTdO35T/LomwegNBFL9NEkBmGcO6Ayn6eh2D14pmc2A6eUfzu5va8xJEfEdPq
         zED/xjdZc/RVZ6gkwcVmDritlJnpxL3ODhOfYxIdNq+SVEJgAx22o5MmKP+LD3wbYJYm
         sagA==
X-Forwarded-Encrypted: i=1; AFNElJ/FlALAof7SXDEuuZ2GF5DYnyVK2C7aNI8TxePPNjZIpsbd3T4hyhdQDs6wiAd5rDwbpS5jcYyTp6w3Zw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYvea93HetkuTLrPKgjP/4DHlrjmAeUePwQSUpaDfQJ2L58Zwf
	Kd0mEt42OMF9ZBpakp9wqiEFeMbV90JjpVrEZSpMlHssfFgJkTj40nbpz+lk5gBWNYxPQv53e02
	GQmwbA/d60nbyfqbvwGjSrqAyEFRDc4XGUb25bH2XBw/S8jqAI9+QIvOEOk0Qnigmow==
X-Gm-Gg: AeBDiev0zgzNXfq80F+a3dubqblbZnz8QxkIELYMQGgycQEZr/IEq9Gipg80jjO9XaM
	bzsa7bfEFIZRoDjmZujphKlyFF3TduAigxtj4kaQrlT2SIvDl3tu1/CuUsWiT3yeL0bgCH0syXs
	co2J2PQkbrkaoRaHaH3+jRoRJiZWppmGzFCOMqE/My7D8iS0gBW0OuNOwX7IgD+RV3YhcwhQOVM
	Dmh6IDWHXKkFrNyhnh/kbRmp3zxwEOQZjR/o5G1eH7b1af+mzdi8Cpz/iwFiRp1O781QRprC++N
	Jf7NgYb3OvDLGbl/wINpGrjN3dTJpj9CvjqOArgNOVQB5kB42MBo44Mqy3vut9FbzlABb+aiRj3
	MZcbeHqeQSzNCm+3OYoubmhSX/F3CNqFcGYjpFESPb31yJYf1ZMohH9KMOLPdwg==
X-Received: by 2002:ac8:5790:0:b0:50d:8cad:2381 with SMTP id d75a77b69052e-50e36f18d42mr627543401cf.54.1777286812896;
        Mon, 27 Apr 2026 03:46:52 -0700 (PDT)
X-Received: by 2002:ac8:5790:0:b0:50d:8cad:2381 with SMTP id d75a77b69052e-50e36f18d42mr627543071cf.54.1777286812430;
        Mon, 27 Apr 2026 03:46:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm80353681f8f.13.2026.04.27.03.46.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:46:51 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v6 0/3] ARM: omap1: use real firmware node lookup for GPIOs
 on Nokia 770
Date: Mon, 27 Apr 2026 12:46:31 +0200
Message-Id: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIc+72kC/4XNSw7CIBCA4as0rKUhPIsr72Fc0ILtRIUKipqmd
 5d240bjZpJ/kvlmQslFcAltqwlFlyFB8CXkpkLdYHzvMNjSiBIqCWME+3ACoxTB/QgBp4cP1iU
 srGlaw4Tm0qFyO0Z3hOfq7g+lB0i3EF/rm8yX7T8xc0xwKxuhqdNKWbILKdXXuzl34XKpy0ALn
 MUH44T+wkTBrGLEtsxaqvUXbJ7nN/iScG0OAQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1928;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=YRML3/4wubgO3BKLVRzWveh6hjcAaWgMYaQc9TCSNb8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7z6PK3nq1haznfGr8//ff9K8BQVl7mgRVhqYj
 +aI9ADMb8KJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8+jwAKCRAFnS7L/zaE
 w7nnD/9AMYdqg75oZStvRYC5FCyQ2IE2ivLl2cj1MByL/F7KHa5TAPL4LF8aDOusADUsd4Vgakg
 AJO23vfiElRCFVsqBY5W7BaTdW90nZRPr5zZmhqq9OkKThMiU/K1HF4bBuNP0cGEnep7lW0CoxZ
 6LruRyg4K6P2fDvlzH8u9x31q7g2r42VQsHg8za9Y7mr432v9+xQsUcfMAvZkDAfu+tNt/5+naH
 RQvRICsNPsXsxblDLO+qwLOcwFvoUPeiRfCC2DJaU8anql7CqdHch3QNjwp9q5exov3+I9WMU1O
 OK1HvP27Jso0PH7OPQohRYz2iDnzSvsESBVpVlaPwxXjT9/U+zmdmYiEKPGAHthmRwNWDg29ZB0
 fqV9VcdUVhVAdTAJzPm+Od+4kuBCQcfDTn4y9opqei9iXIr6ox55NItZdV3BSQcxiQSUH+YIUfp
 xDQjfc76y8My1uXMA9ZdZUr7tUkkV1ZCzr4i11EQP8VbL3NfCKmv0s+RVb5OKLuIX6NJmq8lx40
 1vBv1n73Iz36Xu66+PFeckqSSITHNnMfy/TdmjJv0xFBaAqyftoANFjx61rrCCRaQvXluMtVemX
 YmW13Yf615p1HgSgiskOrwLGVkaRMh7LTSMvJ/XnweiMAnK8DDGPXm6XKZdcBHyOgHtTZ7L1e+s
 2ygmuEHqFUOXj6g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNCBTYWx0ZWRfX3Ib6FHKE0fK1
 JPiSYad+m5OvMHM8Qea6V3gkBL8I0DtulWurNrdO2mFk2bsCSsHqP6CE1pS/npCG+P5nkCw0Xlf
 gQnDSYOHZmmGIMGGuqUcfqtnxc7fKixDnpvRv5XJGkWZSH024sZe86i21tmg8PxhKFwHQNaGgZn
 MIeIKvEspESVzEK1uMgfagw0x+ZMlEV349mr591oFEUkLzHNXHcCdUt3DsLn00ClnBOMD87p+g9
 dy6VRp7+oz2GyuJxLE1km5fTFz/ztYp9Wt4krmGePOUIDSoQVP2/uzgB5baLvHSPoh5O0dB85JH
 btf9yJdbhLuuxGH2Szf2umydkO9Pw6QlrNw8H9obDbwc98DKH359Tu6i8RJQbCEHqQHH4+qodm+
 sCNp3+TxCLCfW7RWUrAYOT8SyVm+YX2uw3kNiXxXYcXUZOppqJ2sTbWT5nXZ0lti1CcgrB10TE0
 X2P9c3/7I3PkvkB3cXg==
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=69ef3e9d cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=vccPQ2CF_Qf-qLDx940A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 9hsV_Kff7Vg3iMM5IANqtk66YOsfH04M
X-Proofpoint-ORIG-GUID: 9hsV_Kff7Vg3iMM5IANqtk66YOsfH04M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 spamscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270114

This converts Nokia 770 to using real firmware node lookup for GPIOs by
attaching the software nodes describing GPIO controllers to their target
devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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

 arch/arm/mach-omap1/board-nokia770.c | 30 +++-----------
 arch/arm/mach-omap1/common.h         |  3 ++
 arch/arm/mach-omap1/gpio16xx.c       | 77 ++++++++++++++++++------------------
 3 files changed, 47 insertions(+), 63 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260330-nokia770-gpio-swnodes-5da8ba35946e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

