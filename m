Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60E5B3DFC86
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 14:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139323; cv=none; b=bPByvVxJCcJ2dI15eQnVhnZZUeN1iCjXn2u0tXNGj1Udu5iKLY3c2hoYsvc4Zt7puhyiiujG92HsKvtFYUc+V3zb2PjJIcrRY7AlSH173LX+pj3wmiH9p6Gwot3Gqyx+mPjoxUJ/6swL4BeUWcdb6UIreNkDCfGA9DWbZbZTFVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139323; c=relaxed/simple;
	bh=9xHP9YGJtqo9V/BvuF1Xk3Wt1TALDLTxAhAxwgZviEQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tAgyXTunHAVRefeLMlypE3lF8ba96gKZoYC+KulrvnPVRPFDPPA9PyskwXAd3s8SYOPyEQRaHqN0xdvUQmtxVkSHl+QDmVKwQ2wg4xqpgT6HCiFlZd0d5FoHe6k+8lNbwCZH6wyVuMyuIu/k38NnPvKT0QF3TtT4jCmxpclJmr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMfUXqfE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ccLgW1eL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMfUXqfE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ccLgW1eL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BtQ3b3238747
	for <driver-core@lists.linux.dev>; Thu, 2 Apr 2026 14:15:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=I0iEYnM6TxpFjlb6DDopS2
	eLno0oaG8tAIZJH9RCSIc=; b=VMfUXqfEvL1i05v9ML1s09gEgzAP8RxxtyO0GR
	PbaWK6ex2ZXp4fX9pnyChWWI5ch0d3wSZb7Sg4H8+D9yUJ1dD4iv2HZJVKOyiyvR
	dWbzTl35sh18TTuk9fhAl3F88y7Q6ZDomkjzYPiLjMLwgC0afQoPeQ2wCU30ysBz
	BHa6PLsM/2mlEpORmwLwQCtX43DYgaT4OEUbyhVXFh70asqmwERtsSnw97QUGv2a
	+o8G+GZrcQZzgUDZG7oABwbqQU+8LzwG+dHeOq5TciIXJTNyN9qy4lGSBcZi7SHG
	J2+V8SIDyGQehrSL9uKLW9uevE+ocum0dLc02mderrSyyZrg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9r0u0jwn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 14:15:20 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b3544bc7bso11420981cf.2
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 07:15:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775139319; x=1775744119; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I0iEYnM6TxpFjlb6DDopS2eLno0oaG8tAIZJH9RCSIc=;
        b=ccLgW1eLTOOLAJq/+/Ms4Hf3l+u3pRG/EktM39gF0cBQ9eAgMjmIlD+MG3pRwhO3SK
         PCDrLL+dxHpKIvOxo8FYOayY1tSeo0gUTkiTlClW2wVub6ufx5gmIrIsW92jOssPaS5a
         hwQOAPw9YtprNneGyx7k4XHCJMLMPrVXuBXCitfwTCSCa0DN5OUrpHFbGilf8UUj/HE7
         M1yqWGVR+Puco2Gm7Uf4T83B4aV3v5Gl8Gpm4GL5/Y1JMaiJIj9833xOXn+/knq50wYJ
         UZ1awsf1VOyRfQfxO8EKtxkzpIah1vMeVH01OZrTO2n8Zo5Ue2cvSRlTo4UgiTLVrh0/
         amYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139319; x=1775744119;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I0iEYnM6TxpFjlb6DDopS2eLno0oaG8tAIZJH9RCSIc=;
        b=DIIOUXyRsQAT35r7j9BR3aF3X6/u3HUJyjQ43zvYVDNv9DQZK8MI3igPCfoIl+XXSl
         NtT73FtQgZpMPo8GSllbMg9xZfDHg69yESp6vEIEMDxLol2jwiOjmRjZjcDRYDks8Xvi
         Up5TAliqXkOrcPFfodTAYU+9EPtOdeKei92iNSf9OktaZARtoRTW6Y4E7GKhH5OxxdEd
         KWi3N0LrwemjjBeLbtyhZTTACcbzxIGB2cU7XGSzF0L2RClrKm7k3epprFPpFi7meZ5J
         G1Ns6fedCw/tASYOQg/cGB0aCnUg2gWMk+7NrmPcDYfOAbhKJ9WEUTV8dR1S8ZjFPU/W
         AXIA==
X-Forwarded-Encrypted: i=1; AJvYcCWzvdy3hS590aewg1r4ZlmQZaaVJh+k1APjOfOcQnri3thnNmiavdWzVrmK7vq2ul06ZvAMyq2KzETP7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUnTb9mXVR2wyPxzI9ckw10JTiYYJQ9DRVVTEcSJRgYipemoI9
	hTrmh4D+Bb+vciRjyrCc36XJUfssj5VP4uUBd9kAy3SEiE4zR4JxIkxL14aeKLMIi3ViuQgfRlO
	iyUHntzl6O1zOB20dZGo6cDpcJ3kFGIb2hWpbFFm65DMozViQy7Pe0G0lIfpR8TbGdQ==
X-Gm-Gg: ATEYQzzlLe+OPqYOsCVmcB7uPzV1eAoE9p+wN92aehB63mlJ9kdKI5MwufUZCESzUZj
	Of6CX2SikrfYD7bKffC2RBf+ylxOFKpzrjc8cwtK4Y7J7hBhOAGC+Cf+l0FgFkOmfiN9bPq6cos
	Sb8WQAHaCeohQ2WgD/3CwWJHwbNYRSiCaCU5gmKsWpy2Lot6QOI9YLjiM0fuOtPTEuDgrjeuZgQ
	6+LWBJToWzfvoVX7Wthir+3MAHPE5E97K5Vxt94l+zpeSdaDq/vvccuo7Ia+gdDAJwI0fzL7KnI
	tXpGpN87amso0Y2HF3wmPZxnt97zHmCIJYBJ1j2qOzCIneEHlNkBUgAeWc8x8242l0+y/xdHIEs
	GdgEcjW9NJ2Fi0c3BiLZOHq1/WYK2Fx3lQkj3wDE/9u/fDMEediVE
X-Received: by 2002:ac8:5a91:0:b0:50b:5056:fcc4 with SMTP id d75a77b69052e-50d3bb92f71mr104571251cf.4.1775139318443;
        Thu, 02 Apr 2026 07:15:18 -0700 (PDT)
X-Received: by 2002:ac8:5a91:0:b0:50b:5056:fcc4 with SMTP id d75a77b69052e-50d3bb92f71mr104568721cf.4.1775139316950;
        Thu, 02 Apr 2026 07:15:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm192824885e9.1.2026.04.02.07.15.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:15:16 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v5 0/4] ARM: omap1: use real firmware node lookup for GPIOs
 on Nokia 770
Date: Thu, 02 Apr 2026 16:15:01 +0200
Message-Id: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOV5zmkC/4WNQQ6CMBBFr0K6dkhDKQVX3sOwKHSEidJiR1FDu
 LuVC7j5yfvJf38VjJGQxTFbRcSFmIJPoA+Z6EfrBwRyiUUhi0oqJcGHK1ljJAwzBeCXDw4ZtLN
 1Z5VuygpF2s4RL/Tevec28Uj8CPGz3yzlr/1nXEqQ0FW1bgpsjHHyFJjz+9Pe+jBNeQrRbtv2B
 eDGddLBAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2587;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=9xHP9YGJtqo9V/BvuF1Xk3Wt1TALDLTxAhAxwgZviEQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpznnpgbWuE8PB92kyk7oxM0EhrfC9uGBqdWjbK
 5/AVS9z4L6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac556QAKCRAFnS7L/zaE
 wxWDEACXpxQ47yMXyNOUQwCxOnke7iYT5ZQOnqkVVZvzIPH/rpFUqujwJTR6i77GBhHklwMd76n
 nz0VXCWCxBstpkby2i801FON5C1se1aityaTE0UexGxIDX6a7UlDqNJfpwgkyWNdGXm/bhOawr5
 Gt5aQZHe9u0bHKJf6Ocv5YdO/ATOtNygibon8PvTR43Bu1iynN3LWQH2I29xPtQfSTPf5eYtzef
 4CtWkr1jd8ZqLnth3r4J1T68um/z3XHqjl59apZ4/gdQh9EXsx1pJTYwrwdIt5RZ4l5ezVnpDWa
 Wrg4S3WMXyWmKmJP+XPoZkzKIcSImHJqA1Qm5Q4Tq2Do0G46aRg8WPiSIOsqjX7WByQ/gBEqMDN
 WKvH8saFlplZ05ZJ7TVQKwRxBKHMhRzq0QdullzLHCnEJ3tT85P7P4Du9Zl8TKbWZWmKiXny1qw
 a7p1JALeRLwCRDbgDVY+ZPhblU3YF5s7AmgkX5UOxZMhvOxZSwyPtvneHGZs66I5Q0S3qS9tH7R
 aT/AcxEeqJZHS96PIYfpFFkFYl0yb9WrxZh5E2tu3Cl1AqPJ04bO4UVKuHbtXm+LvMgp5Dy09jm
 PlR1ufRVBI7A7QanvZfKMEz6Y+EcB88mzBac88+prWUsCZT7PpV00MHuHH/11UE3KZURkZDNdF9
 6tH4XwQ8V4izhbw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyOCBTYWx0ZWRfX25pK8V2RVt61
 5b9F/ibPNGB9J+INZfbRMnDSuN+5wMZUZ2m6RJpuEP+3pWAHxqO5kdpqBB9Pi8KkOyuME2Awl/h
 y5z2VbHzo4b8SMbQlwioP1cw9MvxLwMg3BXW2U3dJsc5GAez2lxcZvzYonQg9GrJUJs15wVbOFQ
 zyEG7J2XSGiy+TK5l0GHLpaiiDE50g2R2ezSbqv8PeeynwP95Jowhf97EgFLOuvL7LHxFwljx+d
 E++c7fMot09egHGvrNY0pvbblDCZvbXTnnejtK8hK0BAquzoNYw6NtN5bffipIM6dMxE8BgxjSv
 Pre+DtID6iHKScu7hfn9OnSNv0IR5Tx6ueuyFY1Qork1JW7+abwYxnf8FGikjPp5JRB6/LNynqL
 25AZB/gJer4nf4v+osG8a9l4fC07xBrJ7SYrWetf1Thu/qyXoLAOfuH/6iOQbMxv0pgtr1czEo5
 Ec0O5gjMc8SFy6t04kQ==
X-Authority-Analysis: v=2.4 cv=D5xK6/Rj c=1 sm=1 tr=0 ts=69ce79f8 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bC-a23v3AAAA:8
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=WeWpliTHXVVyQaQyHOwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: dDDqWHWjjx5m18zf-W6Y1VM1WVqGFkxe
X-Proofpoint-ORIG-GUID: dDDqWHWjjx5m18zf-W6Y1VM1WVqGFkxe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 priorityscore=1501 bulkscore=0
 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020128

Mergin strategy: It would be awesome if patches 1-3 could make v7.1
through the driver core tree after which the final patch could go
through ARM-SoC separately in v7.2.

This converts Nokia 770 to using real firmware node lookup for GPIOs by
attaching the software nodes describing GPIO controllers to their target
devices.

As determined by Aaro's testing, both omap16xx_gpio_init() and
software_node_init() run in postcore_initcall() so we need to make
software nodes available earlier hence the new patches in v4.

Please note that while the goal of this series is to allow Nokia 770 to
use software nodes earlier, we're not modifying core kernel code just to
accomodate an old ARM platform - more such conversions are coming up so
the change will be useful to more consumers of the software node API.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
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
Bartosz Golaszewski (4):
      kernel: ksysfs: initialize kernel_kobj earlier
      software node: remove software_node_exit()
      driver core: make software nodes available earlier
      ARM: omap1: enable real software node lookup of GPIOs on Nokia 770

 MAINTAINERS                          |  1 +
 arch/arm/mach-omap1/board-nokia770.c | 30 +++++-------------------------
 arch/arm/mach-omap1/common.h         |  3 +++
 arch/arm/mach-omap1/gpio16xx.c       | 28 +++++++++++++++++++++++++++-
 drivers/base/base.h                  |  1 +
 drivers/base/init.c                  |  1 +
 drivers/base/swnode.c                | 13 ++-----------
 include/linux/ksysfs.h               |  8 ++++++++
 init/main.c                          |  2 ++
 kernel/ksysfs.c                      |  9 ++++-----
 10 files changed, 54 insertions(+), 42 deletions(-)
---
base-commit: bd0f139e5fc11182777b81cefc3893ea508544ec
change-id: 20260330-nokia770-gpio-swnodes-5da8ba35946e

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

