Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2773E928B
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 14:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139324; cv=none; b=BZBhDVlNi01Rq7LVAsC6wRX4Uqw63E09E4Tiax23xR11gerio3tsE9822OCM8tBRbqoyLKcjEd2LlBmW3Ms1zO9U6JDegxJfI6wtDiyA5FqMhL8l+4VxAXhu1/xC4wMhALcffObw6cwswFO/W70BKS3lbrmuLbFAkqTjJSUAr74=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139324; c=relaxed/simple;
	bh=biv+GH+fROKOSl4fjZqd21aT3c4FLHEhSXzFKMuT8pQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N1nkrdvOBj1z8IKWIubXH6KIKfKhjQ3CmiWnUi5taMM44mylic0Mn8mhj9+tpjOdx4q28owF6n9rEBL+WVnXoNUPHpxj6bKUVFUsq395ziQhiPZCkQHRiECZWrlJ6IbBrm6j9N6WwTaWe9UPYARMmhe7m9zBU4rarRWfokawJSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZJ9HwgEw; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IPjpJ/Di; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZJ9HwgEw";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IPjpJ/Di"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632CgbPn3956631
	for <driver-core@lists.linux.dev>; Thu, 2 Apr 2026 14:15:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1QP3yia4CdU5PX7yrF+zFl8JFATM5bcCf24XnEBdAEY=; b=ZJ9HwgEw3XRIYWXB
	5Dy0Wpj5dn+FGEp441qjsC2bPEzYqQzvcRCFp2TTSuP68RwkhbqNAvZA70PHDvBn
	eGfBeQet+Z0Kx/hasgTcjeAiMJJ+ftCYY+DPISLN1C+Q9ZW5iEsZyC84njmCX+Oj
	iaoD50pu+JIiNtP0wZ/1d2ZoF/2uLPBzdcwRYXzLCx/oPNfikHn9kkWNiQjWJV0l
	uyOtjlLm+YMd18I/aO+OQxhGwl9Q09DcsODECgPhtYTgFobVJrD1TmEgdkfnF3eP
	9WBPqvQKDx9EN2qdHhDxjj4wswEx9iRpmMsoVcqWL66sxbvfDYC87b/Z9xC3ODHD
	1Jgv+w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9aw5km6p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 14:15:21 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50b4987c698so3990621cf.0
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 07:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775139321; x=1775744121; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1QP3yia4CdU5PX7yrF+zFl8JFATM5bcCf24XnEBdAEY=;
        b=IPjpJ/Di+WxkE1CStZsSf+LR1JtVLKgLWL3fcsl+CTwkE8SDgA4XwCWpuLcQHXWqsT
         Lw9RBXTN2ZRqO+Z15RcdY2utxQdEIiiyX6Sv4xMlRUa2YwKgOQMnSQXXiPzHO2bvVTRO
         qRA1HK+l8LZo0w1RTuM5LTDUhr7NRxCWGv60Sbokqcvje4P0b6bk/oobl+wlcNeuFGe2
         B6qioBlGXcPVq9VMmO6hTA47/rONhmQW2WuNDAWsG4M7+S+G57zKOFjXKfK7t0G15UCn
         sU6hYDb5FvjPDFnImN+AcHakFgFCgPERK91qYOtl35CJ2Ng9pgkh5wNTyDCFS4VaSeMh
         IOmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139321; x=1775744121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1QP3yia4CdU5PX7yrF+zFl8JFATM5bcCf24XnEBdAEY=;
        b=TXpJ7z7Ksb/VKgZi8d0iHglSYYkckSNQMj6WJBGtqdWch+Z88k5L/WXaEg/nlqxH55
         q3HungRDg8atDrhOTnAsOuWIRQLiNSEZLbKfFYUsyE74CLNHRd+n2jh3rwgM2R/f/sr1
         gSyMDmrNZ7Xw1wocl9MDt2zNUrPRPcvV2bB1eTNGdbcuravbL8W+EHk2pd4cQoWq8g4l
         SjBiiSALiwfFkhCy0mOzOm/+fGGKlYGRcJaRN9DOt0ZtX45Zd6LazHuvCKD+hYt6+RA2
         UBoveEGzUA9FuKN8ZwnfPrkrzthxWH283d80/MWqJnGmT6EeNYKUFRbY+FSla1L67NkZ
         sF5w==
X-Forwarded-Encrypted: i=1; AJvYcCXw24hdrH/puM7OtLHXTTJCkmOgbdEN4AS/mHEgjrQbqsHE2ok6Qxz7yiIVwMqh2xQRFLJtGpXH63AeHg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyVkJkM9eoUDrZHg3QyP3IkFQpk+fKA/EbPDi9x4zwU+TAtemR1
	N5njO28naIxDzqSJSbx8U1vorZPdewA37a5PSw7UxfoV46xX5w1XhP/01oewWrlKAj4DmDX2Ruj
	5j0s47SeCactAmJG9kPesgSRObb7gso7hGVmpA8wsFSbUWYyKeINKihhik4nEonRoyQ==
X-Gm-Gg: ATEYQzzKIqymJQqzEcG2VUNsbpEhW2BFoq8eM51cSJH3zXZAdE2H2C73ZIHXvBgvrrd
	Ewe9aEAlhOKzJArcLJmACJRf1EdLszR4xT+CoOoYUDRUB/X+pehVwd4CBpBTzZtq78ovMit3p8X
	d4dfXCyxtzvewLRjHTRLlxVJ75uIhg6GWnT52FFgcExzfk8wAIy1u/IEyqk/mJjO7zAPB83uBQJ
	R2Q24J2adLwSST7SivAlZMSdIxydvUlY3aoXE1NByLcUVEqxkpHowscDik26OYwsvhuqUCNC6BZ
	1AP7bPu7CBT0s1Wm896ryP3oOI6XHILjnX8fOPfSyHhkOZQj8vCG3u+N7IgNk0XWh3GT3p7MvNX
	ZED8WtMkCaer3yROgDy0q7xehcaAZZYuXUbuaQvQ2uFkVHlPxF63S
X-Received: by 2002:a05:622a:e:b0:50b:893f:7d89 with SMTP id d75a77b69052e-50d4fcf5467mr29566771cf.36.1775139320239;
        Thu, 02 Apr 2026 07:15:20 -0700 (PDT)
X-Received: by 2002:a05:622a:e:b0:50b:893f:7d89 with SMTP id d75a77b69052e-50d4fcf5467mr29564051cf.36.1775139318611;
        Thu, 02 Apr 2026 07:15:18 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm192824885e9.1.2026.04.02.07.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:15:17 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:15:02 +0200
Subject: [PATCH v5 1/4] kernel: ksysfs: initialize kernel_kobj earlier
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-nokia770-gpio-swnodes-v5-1-d730db3dd299@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2976;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=biv+GH+fROKOSl4fjZqd21aT3c4FLHEhSXzFKMuT8pQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpznnu7om+n7+rbJOz3z08q9B8Y3FEV7dYeTCln
 OZLROiB7lWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac557gAKCRAFnS7L/zaE
 w+WKEACdYAfS2DGORcLixPHvLig3V48ch0qzhA4/SOrOeb8/L90oRYwHpVF3FIN8XJzcj+sXrqR
 mlvTnt8vY4kXOYEKWN8M9ozIXntN3nD5cBV970wYhYxNEddy/g6xcFc2D7MLu/vKNsU18jaLRG2
 uUqYfq1288iNrwpEa20YD8fdUsTj68e4RHXkBiG1F0WsNOEx4fJJGeAbiQkB26B09EfDCSkvZxx
 ItkmsL/OjanSVB+1Wad3WZWFE5g8Dwx6PbqCZXp8oja4Xrpo7opxeKIF1dr5YFMwKvCjlZR9TvQ
 332efEH7bJT0Tov0H/xOSgTKMOezKuVG+EN+cODZ+CsZrOSyCtMYBENElpyfAf9vV8SB60tGFGa
 BpJ2VG/WASYT54LNTh+sopX5OYCnYlCEDRZFIlatE6Y4WgPGovNHUKI8I0R2e+RUME1wSggR6p/
 HTLsIgc8Fq1kTvZL3ep+ygvuwb7eV0fBtv2KR0Hsb4gTnePyZSnwVeFxfCR4Zi2HIWAE1OZKOBP
 mkH6cVwt35lSDpumJverYjHAkR7wJRlqMZemeZDsWnjW8+NU3920MVWAUGAJ0MbCHUAqTVuYIL9
 GLLpdx7e48FFJh6X8e8ShyK6edBvSrsYGdzeN/5jZcUgZ+LBlWFgWWQN0SDMd1lC0xe6hL+gyz5
 LMEtq/0VCF+he0g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=Q9jfIo2a c=1 sm=1 tr=0 ts=69ce79f9 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=cUGsBi5UaGteNmT5bNcA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 29q-hCwtzRtF9fReoyyu1oCPjpkMPmgH
X-Proofpoint-ORIG-GUID: 29q-hCwtzRtF9fReoyyu1oCPjpkMPmgH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyOSBTYWx0ZWRfXwEKG0tHV84AW
 /M2GLjULhXiCEZh2ETWnq+43acj+Hwb9JZJiB/7+boExRUvTeh40ES83MyVJmsz2G9c/UIo2aON
 6wjcMGhu6Yo/c9guimI2qElq5BYxbQYijs4oe1id7IeVeEmr4sJI9aGO4o6MTbKmliBcm3EQaAG
 11WqRu7VmRCDVTbzEEMoLDmOOL26lIUTQ6f2lYykfTAOhNy75E6n9WRIl/rVqSbakFOd8OuGW3U
 SDO0pn1Lq+ayqq0mEWl5Uu2geHSCgYB2AxeDjtXKPz2rDR9Ll3Q1C8qp+uAp6Cam0X7IgBQOSFu
 grAOrHy3xJFsenyZ4oZ+PaAN4LxsMhFButfqc+4zUi46+mmCpN9ngXBV5MhmXFSwTDZ9HNrAUoQ
 Ypp3Nb1ifx9/ByvTG8sAex5vDcbqXsPGcR4hr6LeiZeMsOiDJ8d+rd3Dugb2j3yT2K/g7F6GJGE
 JL9ZpV1Pws+rsm7fs4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 malwarescore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604020129

Software nodes depend on kernel_kobj which is initialized pretty late
into the boot process - as a core_initcall(). Ahead of moving the
software node initialization to driver_init() we must first make
kernel_kobj available before it.

Make ksysfs_init() visible in a new header - ksysfs.h - and call it in
do_basic_setup() right before driver_init().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 MAINTAINERS            | 1 +
 include/linux/ksysfs.h | 8 ++++++++
 init/main.c            | 2 ++
 kernel/ksysfs.c        | 9 ++++-----
 4 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0f258aeeacba184d2025b932d90280cf2aabf4b0..8bc934162e712cf8ddf033e53bf3481054cfb7fe 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7843,6 +7843,7 @@ F:	include/linux/debugfs.h
 F:	include/linux/device.h
 F:	include/linux/fwnode.h
 F:	include/linux/kobj*
+F:	include/linux/ksysfs.h
 F:	include/linux/property.h
 F:	include/linux/sysfs.h
 F:	lib/kobj*
diff --git a/include/linux/ksysfs.h b/include/linux/ksysfs.h
new file mode 100644
index 0000000000000000000000000000000000000000..c7dc6e18f28e8a12a66d64ffffb13749d424a881
--- /dev/null
+++ b/include/linux/ksysfs.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef _KSYSFS_H_
+#define _KSYSFS_H_
+
+void ksysfs_init(void);
+
+#endif /* _KSYSFS_H_ */
diff --git a/init/main.c b/init/main.c
index 8b7633b7ab720b9c13a231d64291d35d3852602c..96f93bb06c49013bae8d3d6b7afca13d6277a868 100644
--- a/init/main.c
+++ b/init/main.c
@@ -36,6 +36,7 @@
 #include <linux/kmod.h>
 #include <linux/kprobes.h>
 #include <linux/kmsan.h>
+#include <linux/ksysfs.h>
 #include <linux/vmalloc.h>
 #include <linux/kernel_stat.h>
 #include <linux/start_kernel.h>
@@ -1482,6 +1483,7 @@ static void __init do_initcalls(void)
 static void __init do_basic_setup(void)
 {
 	cpuset_init_smp();
+	ksysfs_init();
 	driver_init();
 	init_irq_proc();
 	do_ctors();
diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
index a9e6354d9e2579317d3b1bcb54223432d3ce0950..f45ade718054af4eb72fba88dab10c86287986ee 100644
--- a/kernel/ksysfs.c
+++ b/kernel/ksysfs.c
@@ -8,6 +8,7 @@
 
 #include <asm/byteorder.h>
 #include <linux/kobject.h>
+#include <linux/ksysfs.h>
 #include <linux/string.h>
 #include <linux/sysfs.h>
 #include <linux/export.h>
@@ -213,7 +214,7 @@ static const struct attribute_group kernel_attr_group = {
 	.attrs = kernel_attrs,
 };
 
-static int __init ksysfs_init(void)
+void __init ksysfs_init(void)
 {
 	int error;
 
@@ -234,14 +235,12 @@ static int __init ksysfs_init(void)
 			goto group_exit;
 	}
 
-	return 0;
+	return;
 
 group_exit:
 	sysfs_remove_group(kernel_kobj, &kernel_attr_group);
 kset_exit:
 	kobject_put(kernel_kobj);
 exit:
-	return error;
+	pr_err("failed to initialize the kernel kobject: %d\n", error);
 }
-
-core_initcall(ksysfs_init);

-- 
2.47.3

