Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794584851;
	b=T1wGA3oSk+w9A3TcGWLJUHVjpgPNZOSBU5aXAu5+v81U4opJ/kAhlUIJkNBCwf5CObjd
	 qy0gM3kd6JrGgd9Ang7+Lmm/m/UzEggvBYJ74c9j3awFeQPmmROSrASlrkHX4bRMg7r4S
	 spgvc3Qp4jGMBm3qbyP87fROU6iGNgktvMlPZtp1AK44DLdTL2+AIJbb+9ZnXoTMxWOd2
	 k8KGDUM9Ng0z6owHARL4lBMITQIzIG/mtVlhA1+9uFBqyOJGm2cBP9wbI+1uIUu5PzXtU
	 d9Cg14xFPt9KLdBLVt+K55HKOA8fJ2ghVgu9lGsmM6ok56rDnBM6nT34FBWiJ4xGd9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794584851;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=xIAA2jNFCJ+6tLPWMOr60k+SgBUtsA7E3rf6IqkE5SA=;
	b=LbRzJvPimPK6V+qptBj3JcGE3UWx8ditxcyRZXs5UK4pMBeh4c8TmDuly56RzhzvfPvt
	 gYEUnn88KHjmmJyyCAvv9nWsjV1xa/GQeRK7M0TVlrzW6qSkPg7wRO90WGqZY4w/2CXvG
	 MsEh86SfQtTiieAzIFeNyR4p3x7mxlz9FroZ6KM2G0qYRFuEcexsh14ToGYxed6aHWHj5
	 SCRFtg0o34yOufhbV/5afvpnpDjlHFwK4ht9wc8RO2S+RK4OSKoC6Sxg9vjIqULCOGh43
	 xPofBKrXJ+lV7OOh0s0Ym49VrhwU5skwUG822e3Ln8eA/L6ci6wX9cErrooNxnf2v4A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k20QXJmH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BzSY2rf8;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8C1160A5BD5
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8C1160A5BD5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k20QXJmH;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BzSY2rf8
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADFR4P41076214
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xIAA2jNFCJ+6tLPWMOr60k+SgBUtsA7E3rf6IqkE5SA=; b=k20QXJmHRd9pC5aY
	iHKkfLcb5A+pwvjj/0I4RHUJrjmB8nAmbqTSnBg8E57eyfQm5bFat5Dnt+C9hi5z
	NKiH+2ZSZkIdOF7tr+GD17sGoIhLYNER9tipaA/iYWsffJpn6vevDMabMNHPG85N
	REEKxvKAohHSjsRKTSHzEwxHOWE04l4o33VhyAfN7Q4YqXm3FHQWwqd9Atm5kOCN
	Flfv3AbF4VgkMAFVzjAByGgbIF59gBAPYjmybBFq/oOtLqv+GfI1XtP5q2NrqKLK
	ACEJezjxyhDDIZKAXqd38H094WTpAWt4BrtkhAV5b98RjvdzN6hdu8dFdaUaUU64
	qjQFyw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwh0amep3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 15:47:29 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc3a482af7so1082600137.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 07:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794584849; x=1795189649; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xIAA2jNFCJ+6tLPWMOr60k+SgBUtsA7E3rf6IqkE5SA=;
        b=BzSY2rf8r+to/KSNfqKBPmmoTdqNiTEHaurMyN2pAuKhub273fOFp7my5kVnxJvNdu
         bdql+gyAnonsiTVmdW0+3qMfCd1KB8xvZX3FdTnamXNjAPvS3X+ec7jzpf0TfmHrek4w
         phgCshs7zmltBHTADTb+WciZyWIQyo/5pUFRzOvBREo15Btxbu/qg09A5v2P2Ulse18G
         fYeLcUtobd47Nt4sUEF/qY98fQzC2f8hEtSzCp6/s8aS70JVBUQW5SEoQBVquqsltSgw
         qYaomww3n2vvZvargiPmnnLxYs6UcG7g4+liUzLLzgJ7/rVWpwTMIvPmm55MMB9bZ0n7
         IeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794584849; x=1795189649;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xIAA2jNFCJ+6tLPWMOr60k+SgBUtsA7E3rf6IqkE5SA=;
        b=RRBzGvm+8l1q5Q6dX5Sqf49Flkzt7NO2dvWemkB+4ll7Wi/86P9otwa5IuY2YTpJtd
         Z54jFPyuuckqida8A4HGe9+BOLQrxfTr8S40cjYM1tYs/uo+xF5Zi2apTu2XvLFa3YM8
         tDPxXe+2Fl29hq9Fv/QN523GBLt/uHTYxPst80G1uEER6tK6+AitdQnD7+v7YMihQ6bI
         xPQUtpWR6byNr04bApuQmDdxxsgBmiUK/fNeyg1YNsZ6PYecX6fVVQHA6LYTXIdqRtev
         oHVnaTCPEMVWJ8iQW1/F3HeVZv1ZNgoVlL9ff2RHF7Xm4RA0K6R+LUvggAOEYmETAlgS
         0ERA==
X-Forwarded-Encrypted: i=1; AL+hErHBxMYnHj6jWUILTWxXm6jsfrWiP5ddyUdo5NsuObw22tpNMRrDgXrIC1Hm/AjG1SlNqh+lAIdGIbvhLw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+EX2PnPOB0CBaTSzjqwpu031iFKu56O/Est5Ax9wBtFnPooglX
	9yzc3zZSuHKhgsbMM+6EeIRN7u7MSzR7P8KRBj2OYaofJHdw8CPnkbsbm1VilpI6R5BpoqSv7nC
	Du98yHvElBf/MoH6d/hSM+hR7UzP2DW3YDpP67doeVQRxp0nSvBTcq/5b/oKoOOvycQ==
X-Gm-Gg: AYBFou33zDdUAVhH6XOEWXvT+SH2t0qaDTy3l5VnBYN6L6gkqj/TqrGpGuElxFT5E5o
	4FTnQAAc6wSHAKnKCBKMM9JrY0+ZWbm5SMRIWXd1swjqapzzmw66VREzJw2XDUc+uHFBx9qrZDY
	sA7PsRPUTz6AJJhHDTsu9yslNVeoiM1lT7FJVIS4WXc2UJsdFScWvy+wu6FEacFqW6BdHPwlmR5
	J3NjQRsamWHoozTIQQmxFj495uiXYSpi1iZNZ7HRp4/67nEfL+cefctAaaycH0TaQL8cZnf30l8
	hhD41a3w6SXty9mapsRp+Lmg3LcSL17UBOTI1k3jHPHFPyTDYPdEXxz1tu7mIEnfWcl9qz/Jvwr
	low4eEl6idHqQp3OYpYRTr29v3Uuuesy6F/N5oQ4AcqWJ1vz95jAMuh+2GCmA+d2E0jwznTcLMD
	2ZLQ==
X-Received: by 2002:a05:6102:6e88:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7d64d8ab91amr729199137.37.1794584848973;
        Fri, 13 Nov 2026 07:47:28 -0800 (PST)
X-Received: by 2002:a05:6102:6e88:b0:7b4:879c:bb8d with SMTP id ada2fe7eead31-7d64d8ab91amr729169137.37.1794584848274;
        Fri, 13 Nov 2026 07:47:28 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f5972a7sm5636519f8f.21.2026.11.13.07.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 07:47:27 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 16:47:10 +0100
Subject: [PATCH v2 10/10] gpio: shared: generalize most code to firmware
 nodes
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261113-fwnode-for-each-prop-v2-10-4edc23d5cf50@oss.qualcomm.com>
References: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
In-Reply-To: <20261113-fwnode-for-each-prop-v2-0-4edc23d5cf50@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10652;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=SexayAjoGmM0SM9EBGWmn4gRwKXubj7VXk7FNb71fjU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq9zD4W3VsuOppEvN2FRv/gLXfgRAtbX3HrLAYp
 MSJTyFyadCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCavcw+AAKCRAFnS7L/zaE
 w4J7EAChzMVwiytuL5xeT4Ef+V97BDqtjFagx9Ct4O9dxKcG4NZKVOqFQN1EFwRnpN1KEHQTjOs
 nFJJqAI/qcmO1+aFmC3fRlF5Y6Cu+5A+VBQkxu+g47ZFGonbpo21OWz/vhG4lrcw3gvJtlaYbhW
 Fp1qvSw9WC2Z6nZfh4oBMzd99Wqm6zCad9lHEcPzGXD/TWkKYAxv8ZnrHV1OVAFrC/Yhe+8O4N1
 FUQNkFMMIq0uXlUuk1wBUSOlI8lI5YBSEXae2KI/rca8yrG2yAlOQ8e0I3rBUYzGqRhEPuPVXqH
 C2ESy1Hc0k4NFbJKwMXQi2djoD/aJ49z1alukWRaVNxn68Sw56q1WxoW3eB26l7ugc3EPEWICJU
 6+6/qcJUefnuQ/fQSPYvAlBX30APUxPnQHqJkm7beC9u2ubTEN0OjlAH+GnXSZ2OofPFJppeN7s
 WtQ1pz/g0f24TNRV811blPYOuVeGfMv+QaUd6WKQZBw0BoeVrzp50tyleucAkA/USmeu9Y3E47A
 b/p5EtnLbGdk8oK5IVAUJCIPMnQHt03YecoL9ueVn7fvI6Fm70tcwP7I6Vwj7/PNr4tlOQTKY/q
 TZCNqtHYbhUwiAdMcr1zv3ijsYvXG7eKUy4mwHwNynx4vXJOKyrrrPbybzDHrZ653YvUtmC0sLW
 yY38WwViQfDvVMg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfXznL43F337m2c
 tws8o62Jn2EzxkXY+Wd/2u35fcZk8sd4ROv9fuNFX9EQ23wKDaI0TdeP+VltO0szisiZS6s6NR9
 pX0j7rQx1FIXfQwCMnGPoPn9bnDWVYs=
X-Proofpoint-GUID: 0bNlZSd9KevaHGtgVKy5ogAnxAKNiD7t
X-Authority-Analysis: v=2.4 cv=N+e8hG9B c=1 sm=1 tr=0 ts=6af73111 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=ziVQ5hnd3nnfPSIR4FkA:9 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA2MiBTYWx0ZWRfX09sfrGcx+TE/
 XtFGj73rgNH9464s4bfqxdEJzEJJu3J28Z32nvznmH6UjQpANdiRLMwadoGxTjoHMAocVCnKdai
 zV3pQrrzXtc8BtSbXVpF8zOANEjiVcrlGs7TBjq+1gnnLafYfooluepJqB1koC7D24h/dj4uAKq
 SG4iVhzrUQsctLxKhT7DqxHFx+//HpASoXk1uhjQ8e4mj53p/PV0RaLF6fZrN54RexZv1hdlutT
 nbRc46/jjIvJv5RrF+19rufZno7VKlqvIcRwF/rqYLDr/3Fc7Bp+C8xPyEdplhd+g/wHGuRuVW4
 DjI58WZ6xAxE2VqB6d7eqkb78o8Yk5X5WDzrZD60FrdGX62c/1JZLEqnhpFSl6AT2KykDNbV273
 IKHmAtF3visCKhWFbP4hwL8qG5TGwWUfGwusmCpPOXqCKYisRjNPZHIXw8XCp1qaFnJW5U5Gfir
 82GOF4CLeS4GJW4BWLA==
X-Proofpoint-ORIG-GUID: 0bNlZSd9KevaHGtgVKy5ogAnxAKNiD7t
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 phishscore=0 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130062

Ahead of adding support for sharing of GPIOs for other types of firmware
nodes, convert as much code in gpiolib-shared.c as possible to using
fwnode APIs and guard the remaining OF-specific bits with CONFIG_OF
guards.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 239 ++++++++++++++++++++++--------------------
 1 file changed, 128 insertions(+), 111 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 44af3bc1494e47310973844a0ef19ac3ec5cd719..edd61d16f065f4e4f2c440ef0529a2365d0bda44 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -22,7 +22,7 @@
 #include <linux/printk.h>
 #include <linux/property.h>
 #include <linux/slab.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 
 #include "gpiolib.h"
 #include "gpiolib-shared.h"
@@ -61,7 +61,6 @@ struct gpio_shared_entry {
 static LIST_HEAD(gpio_shared_list);
 static DEFINE_IDA(gpio_shared_ida);
 
-#if IS_ENABLED(CONFIG_OF)
 static struct gpio_shared_entry *
 gpio_shared_find_entry(struct fwnode_handle *controller_node,
 		       unsigned int offset)
@@ -131,157 +130,159 @@ static int gpio_shared_setup_reset_proxy(struct gpio_shared_entry *entry,
 }
 
 /* Handle all special nodes that we should ignore. */
-static bool gpio_shared_of_node_ignore(struct device_node *node)
+static bool gpio_shared_fwnode_ignore(struct fwnode_handle *fwnode)
 {
 	/* Ignore disabled devices. */
-	if (!of_device_is_available(node))
+	if (!fwnode_device_is_available(fwnode))
 		return true;
 
 	/*
-	 * __symbols__ is a special, internal node and should not be considered
-	 * when scanning for shared GPIOs.
+	 * On OF-systems __symbols__ is a special, internal node and should not
+	 * be considered when scanning for shared GPIOs.
 	 */
-	if (of_node_name_eq(node, "__symbols__"))
+	if (fwnode_name_eq(fwnode, "__symbols__"))
 		return true;
 
 	/*
 	 * GPIO hogs have a "gpios" property which is not a phandle and can't
 	 * possibly refer to a shared GPIO.
 	 */
-	if (of_property_present(node, "gpio-hog"))
+	if (fwnode_property_present(fwnode, "gpio-hog"))
 		return true;
 
 	return false;
 }
 
-static int gpio_shared_of_traverse(struct device_node *curr)
+static int gpio_shared_fwnode_scan_property(struct fwnode_handle *curr,
+					    const char *propname)
 {
+	struct fwnode_reference_args args;
 	struct gpio_shared_entry *entry;
 	size_t con_id_len, suffix_len;
-	struct fwnode_handle *fwnode;
-	struct of_phandle_args args;
 	struct gpio_shared_ref *ref;
-	struct property *prop;
 	unsigned int offset;
 	const char *suffix;
-	int ret, count, i;
+	int ret, i, count;
 
-	if (gpio_shared_of_node_ignore(curr))
+	/*
+	 * The standard name for a GPIO property is "foo-gpios"
+	 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
+	 * There are some legacy device-trees which have a different
+	 * naming convention and for which we have rename quirks in
+	 * place in gpiolib-of.c. I don't think any of them require
+	 * support for shared GPIOs so for now let's just ignore
+	 * them. We can always just export the quirk list and
+	 * iterate over it here.
+	 */
+	if (!strends(propname, "-gpios") && !strends(propname, "-gpio") &&
+	    strcmp(propname, "gpios") != 0 && strcmp(propname, "gpio") != 0)
 		return 0;
 
-	for_each_property_of_node(curr, prop) {
-		/*
-		 * The standard name for a GPIO property is "foo-gpios"
-		 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
-		 * There are some legacy device-trees which have a different
-		 * naming convention and for which we have rename quirks in
-		 * place in gpiolib-of.c. I don't think any of them require
-		 * support for shared GPIOs so for now let's just ignore
-		 * them. We can always just export the quirk list and
-		 * iterate over it here.
-		 */
-		if (!strends(prop->name, "-gpios") &&
-		    !strends(prop->name, "-gpio") &&
-		    strcmp(prop->name, "gpios") != 0 &&
-		    strcmp(prop->name, "gpio") != 0)
-			continue;
-
-		count = of_count_phandle_with_args(curr, prop->name,
-						   "#gpio-cells");
-		if (count <= 0)
-			continue;
+	count = fwnode_property_count_references(curr, propname, "#gpio-cells");
+	if (count <= 0)
+		return 0;
 
-		for (i = 0; i < count; i++) {
-			struct device_node *np __free(device_node) = NULL;
-			char *con_id __free(kfree) = NULL;
+	for (i = 0; i < count; i++) {
+		struct fwnode_handle *fwnode __free(fwnode_handle) = NULL;
+		char *con_id __free(kfree) = NULL;
 
-			ret = of_parse_phandle_with_args(curr, prop->name,
-							 "#gpio-cells", i,
+		ret = fwnode_property_get_reference_args(curr, propname,
+							 "#gpio-cells", 0, i,
 							 &args);
-			if (ret)
-				continue;
+		if (ret)
+			continue;
 
-			np = args.np;
+		fwnode = args.fwnode;
 
-			if (!of_property_present(np, "gpio-controller"))
-				continue;
+		if (!fwnode_property_present(fwnode, "gpio-controller"))
+			continue;
 
-			/*
-			 * We support 1, 2 and 3 cell GPIO bindings in the
-			 * kernel currently. There's only one old MIPS dts that
-			 * has a one-cell binding but there's no associated
-			 * consumer so it may as well be an error. There don't
-			 * seem to be any 3-cell users of non-exclusive GPIOs,
-			 * so we can skip this as well. Let's occupy ourselves
-			 * with the predominant 2-cell binding with the first
-			 * cell indicating the hardware offset of the GPIO and
-			 * the second defining the GPIO flags of the request.
-			 */
-			if (args.args_count != 2)
-				continue;
+		/*
+		 * We support 1, 2 and 3 cell GPIO bindings in the
+		 * kernel currently. There's only one old MIPS dts that
+		 * has a one-cell binding but there's no associated
+		 * consumer so it may as well be an error. There don't
+		 * seem to be any 3-cell users of non-exclusive GPIOs,
+		 * so we can skip this as well. Let's occupy ourselves
+		 * with the predominant 2-cell binding with the first
+		 * cell indicating the hardware offset of the GPIO and
+		 * the second defining the GPIO flags of the request.
+		 */
+		if (args.nargs != 2)
+			continue;
 
-			fwnode = of_fwnode_handle(args.np);
-			offset = args.args[0];
+		offset = args.args[0];
 
-			entry = gpio_shared_find_entry(fwnode, offset);
-			if (!entry) {
-				entry = kzalloc_obj(*entry);
-				if (!entry)
-					return -ENOMEM;
+		entry = gpio_shared_find_entry(fwnode, offset);
+		if (!entry) {
+			entry = kzalloc_obj(*entry);
+			if (!entry)
+				return -ENOMEM;
 
-				entry->fwnode = fwnode_handle_get(fwnode);
-				entry->offset = offset;
-				INIT_LIST_HEAD(&entry->refs);
-				mutex_init(&entry->lock);
+			entry->fwnode = fwnode_handle_get(fwnode);
+			entry->offset = offset;
+			INIT_LIST_HEAD(&entry->refs);
+			mutex_init(&entry->lock);
 
-				list_add_tail(&entry->list, &gpio_shared_list);
-			}
+			list_add_tail(&entry->list, &gpio_shared_list);
+		}
 
-			if (strends(prop->name, "gpios"))
-				suffix = "-gpios";
-			else if (strends(prop->name, "gpio"))
-				suffix = "-gpio";
-			else
-				suffix = NULL;
-			if (!suffix)
-				continue;
+		if (strends(propname, "gpios"))
+			suffix = "-gpios";
+		else if (strends(propname, "gpio"))
+			suffix = "-gpio";
+		else
+			suffix = NULL;
+		if (!suffix)
+			continue;
 
-			/* We only set con_id if there's actually one. */
-			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {
-				con_id = kstrdup(prop->name, GFP_KERNEL);
-				if (!con_id)
-					return -ENOMEM;
+		/* We only set con_id if there's actually one. */
+		if (strcmp(propname, "gpios") && strcmp(propname, "gpio")) {
+			con_id = kstrdup(propname, GFP_KERNEL);
+			if (!con_id)
+				return -ENOMEM;
 
-				con_id_len = strlen(con_id);
-				suffix_len = strlen(suffix);
+			con_id_len = strlen(con_id);
+			suffix_len = strlen(suffix);
 
-				con_id[con_id_len - suffix_len] = '\0';
-			}
+			con_id[con_id_len - suffix_len] = '\0';
+		}
 
-			struct fwnode_handle *curr_fwnode =
-				fwnode_handle_get(of_fwnode_handle(curr));
-			ref = gpio_shared_make_ref(curr_fwnode, con_id, args.args[1]);
-			if (!ref) {
-				fwnode_handle_put(curr_fwnode);
-				return -ENOMEM;
-			}
+		ref = gpio_shared_make_ref(fwnode_handle_get(curr), con_id, args.args[1]);
+		if (!ref) {
+			fwnode_handle_put(curr);
+			return -ENOMEM;
+		}
 
-			if (!list_empty(&entry->refs))
-				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
-					 entry->offset, fwnode_get_name(entry->fwnode));
+		if (!list_empty(&entry->refs))
+			pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
+				 entry->offset, fwnode_get_name(entry->fwnode));
 
-			list_add_tail(&ref->list, &entry->refs);
+		list_add_tail(&ref->list, &entry->refs);
 
-			if (strcmp(prop->name, "reset-gpios") == 0) {
-				ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
-				if (ret)
-					return ret;
-			}
+		if (strcmp(propname, "reset-gpios") == 0) {
+			ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
+			if (ret)
+				return ret;
 		}
 	}
 
-	for_each_child_of_node_scoped(curr, child) {
-		ret = gpio_shared_of_traverse(child);
+	return 0;
+}
+
+static int gpio_shared_fwnode_scan_properties(struct fwnode_handle *curr)
+{
+	char **props;
+	int ret, i;
+
+	ret = fwnode_property_get_names(curr, &props);
+	if (ret <= 0)
+		return ret;
+
+	CLASS(strarray, names)(props, ret);
+
+	for (i = 0; i < names.n; i++) {
+		ret = gpio_shared_fwnode_scan_property(curr, names.array[i]);
 		if (ret)
 			return ret;
 	}
@@ -289,19 +290,35 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 	return 0;
 }
 
-static int gpio_shared_of_scan(void)
+static __maybe_unused int gpio_shared_fwnode_traverse(struct fwnode_handle *curr)
 {
-	if (of_root)
-		return gpio_shared_of_traverse(of_root);
+	int ret;
+
+	if (gpio_shared_fwnode_ignore(curr))
+		return 0;
+
+	ret = gpio_shared_fwnode_scan_properties(curr);
+	if (ret)
+		return ret;
+
+	fwnode_for_each_child_node_scoped(curr, child) {
+		ret = gpio_shared_fwnode_traverse(child);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-#else
+
 static int gpio_shared_of_scan(void)
 {
+#if IS_ENABLED(CONFIG_OF)
+	if (of_root)
+		return gpio_shared_fwnode_traverse(of_fwnode_handle(of_root));
+#endif
+
 	return 0;
 }
-#endif /* CONFIG_OF */
 
 static void gpio_shared_adev_release(struct device *dev)
 {

-- 
2.47.3

