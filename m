Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDCA33E51F4
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 14:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139393; cv=none; b=hjTERvrmcU4qTm7IQ8S/VZBV0eS7xbEZiFsrfV8RdjjKRFAcgu1p8reez8TtRmOzlXayqn/3QaHLN22QHii4S1S0y8hTFwyFMSX7Sado/Wr8UGoL80FvfkKY80C4RU8UkLYBFDoruELiRy/RBEleS2JCUi55kPMFId+MZVYIGvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139393; c=relaxed/simple;
	bh=LCXTRWIgG/99GVhp8MFYkc06vlJUWv5VfMB08f8sFao=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ClciIGOhprVcD3F5/cY4oEtcNX5/3ShLLyWgKGYx3mKjANaAIFCokemPGbfisplgGYLL4+5xQ4dnRK5PevZS7D1cBdDeLCGfcC10RAHlVxh1sVQq8rKF1EyC3jrgZw2bcP5EuD1ME/Yc/nL5v1XH3QwrlE75crDasvMWE+E0erU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jv3WMqmF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fE4/pwla; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jv3WMqmF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fE4/pwla"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632ABcZJ1551693
	for <driver-core@lists.linux.dev>; Thu, 2 Apr 2026 14:16:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	wES8wcKZ1pvEl/GAGqGsZxc6MwZbf2WUlgbApncZLUs=; b=jv3WMqmFBff5n/3D
	p2Q4nbtgyH7nrv5A28lD+FTh32DfaAjYQfVtWjy/XIWhE3JRLMEnijm/ei4Bj5rh
	KvckIv1qIpteRNPmKWmeBghWcVyUw/ccZE0OdZ4mhMN3p2hCsfKxJj7GsLAZaa95
	Jd0HLcyHDy1CNPKgQzR3YFGq9gFir+g1xxfsGNqrdI+fZINbYfHFqqjulNSPwHfb
	/LDLzCjZ424Jf1kaxV/+iRqX3M/ZK8mVnoKZEtkE6m9S3LjIq1aNxYN/g4NzOlz+
	r5p289hpQSq0k1knzA9gfQj8xYJp7mA+ldH5icZ3f70VOdC8bo0307DZ2Er+DOAk
	9prNJQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heetd19-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 14:16:32 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093787e2fdso36448801cf.2
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 07:16:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775139391; x=1775744191; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wES8wcKZ1pvEl/GAGqGsZxc6MwZbf2WUlgbApncZLUs=;
        b=fE4/pwlaXm435IUJOcC3gJEkvGPouV2xBDyvWfvY3fGBa2sr+dsu4n91BkBjarS8OI
         tN4GfAmH8XCnddM2au/pH/ptGo/afQVpo4ssCBSLFFqneTZLthYxJL+KzCKizWbyck0Q
         NTU42pveD/MuItVpTbALHIH1+j+YdD80BPrbhyXZW1zsyxsPLTmDnXVuTumJxn2EYT/O
         /uJY3pFfiJv7b5ofnalHkyJJDga1DGQmkyMLVMAAK2W1zempDGu9djzY+J4+u2AUEeAJ
         zhZiUJQ5VL6V54fAAfhGog2sSLZ665No3k0ab2BIyfqApKVzzbVnSDA3ZrzFMgcP6WrQ
         FbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139391; x=1775744191;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wES8wcKZ1pvEl/GAGqGsZxc6MwZbf2WUlgbApncZLUs=;
        b=ln5VH/ogADHmArD89zE6mBVKzTpCu2S88OfcugtLUUS+Gd+ZFHfXn1w51pYyJ3xVW8
         C3WSAo1UVajIZEAwFUiC0bmNdZ/pS44lYskBQAzbsD4dPlFhDBSzxftm//md55pkFfHi
         NRUymjU0Ul0r/iDT2jCt7iaPT3MZukogHIQRq8YKGEYp9bPm2wL/b3rPYnA5QL6mY8ci
         YAOZdo9el4aw/8BhK3ZL5qUg5owpjBOnULYBtqQA0KOSxUGTk06t2/l3MT5BJPhPBUgU
         ftpKRZCZE8VcJU/UXEJ2VtLb5+ApxuMM6uBR37X4+THk0WkvdJKwBDsK7kOcSmtSBCct
         VhFg==
X-Forwarded-Encrypted: i=1; AJvYcCW4e7W2yOgZzMVnXInlsy39VfrpiY7KCIGtRoKzlOiQliYnsj7aPRSQlzqYPVvWZX5wgTSjtidewGMeLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDrFukS99VyJtTWgOQh7q9Zgbs89tAdSaaa873rgSX0uAFkFYL
	t5EHJ2t+naGbb2AXFh2a3tMaLe/HPIsHo6YmlFiTvTsJ5v8rrJ66Xw25THMaDrzDT6SYC+Z3z/e
	4nEfrhdZgV4iTycTpqj9bgzYmBJ6WeBHIRhJxsUGAy51IlWUaoN00qFtR4hk/PuU+Aw==
X-Gm-Gg: ATEYQzzy6ZlYGnu/8vRvjMHsN5Fa6hiJjIvzzrW+7l28JyzMNYkeQZxAcp93p0U9yDW
	wzLqM33dVpKbaz2VP7ysSMRMvtGe59ybY7UFPGr51JY0KnOblKvzmhVBapSCUQadCO9qCHLaZxu
	z8CRhtwTTEddaTh4qpdOXG2Kc1DeSrOuDaKsMOWq1i4Y/caZc/JB0sMrwWPSuC18EqMDFTj7eve
	99obB80VKA9gd3hET5PfSrSIxEDZ90b/IuSmMrJhzSq9WW1nBj6StCpucPGgtOS1m2El5WMxr5D
	FfaLkUWeuCPiI5+HjIbATOMaR92aBLChss8tm6G0CmzNvQWDPEZneV/lfVu7u+/bz4iFH7K2rt8
	K+OKqqzLK4z/Sio7X3YCiZjuCXCiaCm+juTCJTbyeEMTzdsJuMY50
X-Received: by 2002:a05:622a:1648:b0:50b:7d38:9453 with SMTP id d75a77b69052e-50d3bc8d065mr106378051cf.39.1775139342891;
        Thu, 02 Apr 2026 07:15:42 -0700 (PDT)
X-Received: by 2002:a05:622a:1648:b0:50b:7d38:9453 with SMTP id d75a77b69052e-50d3bc8d065mr106332871cf.39.1775139322170;
        Thu, 02 Apr 2026 07:15:22 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm192824885e9.1.2026.04.02.07.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:15:21 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:15:04 +0200
Subject: [PATCH v5 3/4] driver core: make software nodes available earlier
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-nokia770-gpio-swnodes-v5-3-d730db3dd299@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2240;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LCXTRWIgG/99GVhp8MFYkc06vlJUWv5VfMB08f8sFao=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpznnwjyviMXX92bx3A1RXtxXU4Yu4V8IwHdYnS
 LameZPSOhGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac558AAKCRAFnS7L/zaE
 w833EACzWlKbqVGcfZAhKjZPDmJLE3XoLYXCIx6/AmX6i/x38OUku4A8Hy5Vu6BnJmTohfTi3l6
 ICdFhU7cVmlDO7NZtv4bBQokXVA3qUHb6ucwParLHw4jS6OPQrClb9B/GM91u20GomjJJOeKJtr
 a6E4/Rd2atvM8Q4nD+Q/V8fg3p1O3AOoJ+OeSZQa5JD4/7GzGHVErq06oN/Lh9g2so7xlUv0Hlk
 1mt5+BUNingwKzQ7YP1d04QJLigehOSy+bOpAvPwUsBiAzwRhFB4UJmgxrhXCUekYXxDNQlbj58
 wv50XhJTMr1sJpYVLAnJeXIgpuW376dd74Qa+ixJZXo+5ov/0scoZV9lATu7VCGPm7JNJ8J0cOG
 xN0eUm2khXwnOVfXlM0JYIbDg05TMFeHJzcvlNl4vATbxBudv4YHGgvAkyPeRyhUTcdBoNeTfK5
 sopWdebg5X8SzCgGQMTBzhK04LSrxiHZJeucP0zYrwAr7JAy/y2FI9/AfWTnc5RYOartdhkdCLL
 f2JrVcdSLAaMToMNOHZ4IZZddi4+nQTcg+/9OWnYESTHZ1sIgnTJxDuA2eSeJP6p3syatFohtfm
 BsLzPKbFSQBNnOw5sF2wGIz4DDXMqcrv1XY86Y1X/LEm7kA0uxNj6scB3+QtLzDjjbqTOe7RBIt
 LjjR/jmjXCsDhcg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: C0RZd1ZOsOOmYwyYT4Ylb587sXAdjvwX
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce7a40 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=pGLkceISAAAA:8
 a=EUspDBNiAAAA:8 a=XRX4SzNu4mOsujJFFI4A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: C0RZd1ZOsOOmYwyYT4Ylb587sXAdjvwX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyOSBTYWx0ZWRfX/53fXTpjhZxV
 L0ey/yktdtWufJbuQ0Y0QRhjl5jht28DU2pxdA7MvIzDhR+y1b7bdmWn96Je8ZSHaCemXEzEN0v
 JzUBikJ63eW+GlKcqkxeRhK2nNKYyMKDJoM8YOGV04hX0NP0sZedHrbe2OI/uThPagyfM+ZAMM2
 VkWiQXHrLtFxbhux2RoKbsTiQrNETKJ5iqL/aBhKhrUIucygMnhEaa+6LSjwAYCUXZaBeWIKai+
 /1PJLUQajEIPJhAvr4dbsbtR/EUd+kavfgdb+19IYIcupMNkilXrZTkGjhBKYKR6B6USh7hA9f+
 qR30RsApVfvdest1EUwy6QggzpvkN9gPAjqhVI7/XG389caOO8VWfRYcIsfteugbatvGZbczIBV
 2RYYK+OwHg8vO6AyG201UZc9HwPZh0yQaz/+fm6wnWHug0A1FTObfrqrkmGtjvkXArACq7ta54I
 HGPpaeREyGkm3SIEzLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020129

Software nodes are currently initialized in a function registered as
a postcore_initcall(). However, some devices may want to register
software nodes earlier than that (or also in a postcore_initcall() where
they're at the merci of the link order). Move the initialization to
driver_init() making swnode available much earlier as well as making
their initialization time deterministic.

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/base.h   | 1 +
 drivers/base/init.c   | 1 +
 drivers/base/swnode.c | 6 ++----
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index afeda89fd4710c4c5492b5f19134e2aa8e1e581e..30b416588617bbc3fb433654c999c9b533d73752 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -312,6 +312,7 @@ static inline int devtmpfs_create_node(struct device *dev) { return 0; }
 static inline int devtmpfs_delete_node(struct device *dev) { return 0; }
 #endif
 
+void software_node_init(void);
 void software_node_notify(struct device *dev);
 void software_node_notify_remove(struct device *dev);
 
diff --git a/drivers/base/init.c b/drivers/base/init.c
index 9d2b06d65dfc6bf8759f6c232e2d3f753da139ac..af8014416c2460fac91b08ce919c082bf961fcce 100644
--- a/drivers/base/init.c
+++ b/drivers/base/init.c
@@ -34,6 +34,7 @@ void __init driver_init(void)
 	 */
 	faux_bus_init();
 	of_core_init();
+	software_node_init();
 	platform_bus_init();
 	auxiliary_bus_init();
 	memory_dev_init();
diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 26cbe1c2a2e043a2315764085207561069c23ccd..a80575bf598b509eb1469cae8a09c601726ce0c8 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1127,11 +1127,9 @@ void software_node_notify_remove(struct device *dev)
 	}
 }
 
-static int __init software_node_init(void)
+void __init software_node_init(void)
 {
 	swnode_kset = kset_create_and_add("software_nodes", NULL, kernel_kobj);
 	if (!swnode_kset)
-		return -ENOMEM;
-	return 0;
+		pr_err("failed to register software nodes\n");
 }
-postcore_initcall(software_node_init);

-- 
2.47.3

