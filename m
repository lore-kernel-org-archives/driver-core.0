Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A53183D16E6
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 12:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774874465; cv=none; b=igxuQK0F7sXWX4iv5gkmnV7uTiaACNnkBJff2z3mKNcx5BoK3LJ4p4mHnSo8Rzl3a+hVPa0EWdL0ERQ4Gvof+Jhz69tV8iRZj1bMMoiX6aYtjGJD4hCaWUonEJYpIYVAwzc4UuwnZL5snhsHjtAwiNZj724xfwTJLqe7E9c09kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774874465; c=relaxed/simple;
	bh=P5PymIvljl6p0WRzyDTMcM9zlkuK6HlOeCPW5+0Lkaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VVHfDE0o6WRynPL8zYV7+GcWne51wH+qGydjwnITeqjAS/W2E+KCbhk/haaPHq9RSSEn7eEm2t+rn4JwmCUmBsAgwbCB/6v76Wujy6HepDSnRErt660u7vrffjAzlZ2RITjdktQsIRe5BSyG6AZ6aOh8FXK9jORX8GDCWLcK3mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J3xyZIR7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Q42QZPln; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J3xyZIR7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Q42QZPln"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62UAGi0q3175040
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 12:41:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e448+MMxh+/7H+vtw0PBLnj/+MwlVFLeTPvEog6+haY=; b=J3xyZIR7IZGl1n2j
	KOon/2PvGrQXPrvW0hr7FhOl4Pk6qmFlI7jHpbLVmZccARTygxT9T/9pwOF09tjt
	kWQ2SHkqSbaSzhpMI/UylI8Er2gmRjuPYScIfqWx7wtg7HldWZOwP7IP9esC5n6v
	CNSQXzLKqK57ymwWjTMKH467dBmq1ARTLWRI8Lub0tXj3PRL/opFRWjW0TvFeERV
	Jf7KbpSN50eVNqGRRovSTru+ItpJA64ZsexmxpmAw4bOTSxoBMm9ihPdXTT3rekn
	60Om1QqTMOXp6xRPIptJFSQNaBhbNjAPtfNUveg7uBen9f3zYbrERQLGER4ZXP+9
	YRfhRA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7q9h0hn9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 12:41:02 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cdb995a1bfso1232749285a.1
        for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 05:41:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774874462; x=1775479262; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e448+MMxh+/7H+vtw0PBLnj/+MwlVFLeTPvEog6+haY=;
        b=Q42QZPlnc5j9xe/i8vSWATLxl11uEAXdfZGwvtodRRaX9O3v1oVrEo1g0tKxWag7p/
         F4UXt8UL1Xu51OtgwmuP3X7HVsaxPt9fJFidu5a8h5hJaVO9F8HsfUjq3nGNZY2Oxds9
         vfg30/y9g1NYTROklL2y8YFNXAcgrjLfC75bk9Crx4ymV140hrRElklatFTMGAccshVR
         rggFVor2V6EBiIxG4tC9Va2FXlnk6nDA4zr9ZiStNgxzJv0IdgZSc4yqt4stDat6F8dF
         m3MOqYy0ouJ7hD9Dutgxf7tDR8WNNb3K/zU1CgYS7fLt9MuqL+YjwgNZsvyX9rkPYGJw
         6uQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774874462; x=1775479262;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=e448+MMxh+/7H+vtw0PBLnj/+MwlVFLeTPvEog6+haY=;
        b=LguSHDzbU+nUccT1OR2R+xRRmTLNut+Os6WCg32oItGMHwX20dOTGCL1Ih/Z7PK7Jv
         S1wNPr2mEGrL3c8WJ/SuMEsU1bBHwLwdU5hwlG8cYAzEad/sz0Zm8Np0j10vkG91d0HX
         JNntU2Nnms//ptuWgbcPLHwoosBwUQdsFoUVLMkbLmhFonpWPvKmAfmMsrssGpTHrSQY
         cBBZY4EsVAOpQimtCaMFTazxJ3hQAqDjc0a8HK/u2V179WvKCdPdspZrKb/PCF5/U+kh
         2LdlqB2uYg8ClIDNw3EP05bK3YI38/imbG6hVfc/aNvN+pnVgHFsak5SLlaY1UsqfP5w
         HvSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkujgf+O2/DYKQZCkiMOgCv5s2cfUQs2rfEC9Qo3mSfzzMzQeMjHvO9PRVDXyM1pR197Q5e5cUVeby1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcRqXNwKkQT/Mdg45l0AlWmGOFeVa7P0LG2Cap0NFPK68dYVZy
	sEDCou1xU+hJvcPIaLo+TdS9vPKRK3JJlo5MT2SVv2te5g3nFrFBKXqkdDEJ8TyKSBlut0d7FZ6
	aWTFN/yhtGb8FzsadVRpNmLmIoFo0vzT5p3dP+2F03FxlwYuyeACU161t0SsfA+z9jg==
X-Gm-Gg: ATEYQzw3yVSYBw3cWxjkjwDTJr8c2AOtW0g4dp6l8+fmrO+alo/EQPOYs52LheZJ6a3
	FtsdOovY4pTj0ScK/ge/oSMrdt05dSamEeXSCZas3TqRcYfx5IpRK0fh7+6Oeas7SNIPEkGHJLT
	PQDHb140WWGNmIdbcNwOxV2AgPEoGwcnL6Cvtgip5vGm3ZQF7QuomMTe1/0JXqp9h7zW+Ghaqv5
	kRgfCJvqbo1kKsKD2a/ZqAnZ1E7FkhLPwdfFjRyccBx84y37Y8jJUmyad3Tq2UwHxYX57TKQPIS
	Dh4gBzj8yUWIjSM9jsO3u6msysbgjeDz45S/iDd5oFkslygZ34RM4CuAhYWqT8lptPt+cawWT6W
	GL6a4dKVh0UddIFQIddkhW8k+GoXSkCnXlhI9va7l7k6/36J5h59B
X-Received: by 2002:a05:620a:4cd:b0:8d0:3c58:c7c5 with SMTP id af79cd13be357-8d03c58cb7cmr224183485a.58.1774874461817;
        Mon, 30 Mar 2026 05:41:01 -0700 (PDT)
X-Received: by 2002:a05:620a:4cd:b0:8d0:3c58:c7c5 with SMTP id af79cd13be357-8d03c58cb7cmr224178385a.58.1774874461364;
        Mon, 30 Mar 2026 05:41:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:e931:8d81:9955:76ef])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf24739easm19576153f8f.30.2026.03.30.05.40.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 05:41:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 30 Mar 2026 14:40:46 +0200
Subject: [PATCH v4 1/3] kernel: ksysfs: initialize kernel_kobj earlier
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260330-nokia770-gpio-swnodes-v4-1-b68592e977d0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2209;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=P5PymIvljl6p0WRzyDTMcM9zlkuK6HlOeCPW5+0Lkaw=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpym9VDPYcvUDtQcRRyLXiSGwTCL5TtoBoMitI9
 5KEwtMyxMWJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCacpvVQAKCRAFnS7L/zaE
 w12lEACc3qlLfd7n/bdgg8wuL8w0hRu8DG0YSa1pHDI7Gz/2qDM8CkzS7RgvlWa2k9XnRqaQpvb
 qYlWakeZWTehD7eXQEl+Bm6pA/ZLje+dyUXLIEbTbQMiGmcJUb4X4rABtrFmCu9hx982XFNiojI
 WjdfnBWqz1ESmg7UbHCJrQqTgNEsUFD3Nr65/Fmx+RxuOCJUn/vf3fyo30+G1Sw2NX5bnXnceZR
 Zm4+KUApxI0R10dWCzZ1fEmzrGi0Et1gE3FDqN3ahC1BJ5PP4GPQqCaCRTQ1uj1Te0ApXEmK39J
 AW6qSVVVOXY+6Nj1ISo6gqwoDTgT6AsATzX6WskIW0Oqh5g/U/vX90qEyvAYOjPTy1vl77R6bXD
 6utqFHsR1vZKI7e1UEfRORFVSijqHaWoTM1DJpqtUOAhrJbrHRODBNPbarb5XIPH9oQHzS6Iwae
 i2ral9+gCb+6p2fCD2UTRMADtSpIiUx8V4dyFUVCsfAklTBjxMpgA4k98LE37uXj8ntc0WoMadP
 Bcbbp4Z8FP99OrFMBssRy10jzs8sptHkzebdUIynsjjAa5dyjq1ofMN/Sqb2947QSPJ5nyt9oZX
 pAHLUktXKQ4yg+wkDsLCKFJAUV0SZVPh0hc0tcttlTqMW8GkyC9bmRr1oF2WS8G4VH08z5VmBjC
 gMl+KvVfyvagquQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMwMDA5OSBTYWx0ZWRfX4rQcrm4ZeU6e
 6KXGPZMjUlDKFgGw90uAqKAYfov5PajEPCx4433/3h6sPkJfJviRnoKKM1eOVhttpsd+603QcED
 Z9iJ+kKp03Y+SEc9E48BzqbAdkyjIrSDXz3bZ7BsQs4dbbm5JNL0wRTeiDhAoj+VnDD3gxxy5HA
 Oy8ysjmJxLA9L4xMXYh0Op8eL5WFq21mkFjyrfApKya7u+ai7NoJ75M72/7nXmgIzGWFnMcueA+
 uyV1Nk/tg896MjnUK6OJMqXqVvQE5zgdfiyBmMNW5+fqHeqp9Mm5lABfY48do9Me6+nIQ3r3ZT9
 7MYKy5QSaWm9E7gd/Da30st4AdE3PX93kCBpAwtB5et1DxMOEPFHg7bW83O6qiLQVj36fD2U+fS
 7Tck9yfe/qLZ0NwnWvNAVpdbF/xpmQkvKuburfSf39Z+jxoUMCJ+dwY7ZkPIU4Fg45JkU1A97/l
 BtzWhLgSAMMwHVCkYOA==
X-Authority-Analysis: v=2.4 cv=AZS83nXG c=1 sm=1 tr=0 ts=69ca6f5e cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=cUGsBi5UaGteNmT5bNcA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: GhJewmMx0ZXJGTL_k5bW8QZNIyQ-lQcT
X-Proofpoint-ORIG-GUID: GhJewmMx0ZXJGTL_k5bW8QZNIyQ-lQcT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_05,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603300099

Software nodes depend on kernel_kobj which is initialized pretty late
into the boot process - as a core_initcall(). Ahead of moving the
software node initialization to driver_init() we must first make
kernel_kobj available before it.

Make ksysfs_init() visible in the kobject.h header and call it in
do_basic_setup() right before driver_init().

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/kobject.h | 2 ++
 init/main.c             | 1 +
 kernel/ksysfs.c         | 8 +++-----
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index c8219505a79f98bc370e52997efc8af51833cfda..71b9086621c35b7e4ef99b9d3b6707db23faf58c 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -219,4 +219,6 @@ int kobject_synth_uevent(struct kobject *kobj, const char *buf, size_t count);
 __printf(2, 3)
 int add_uevent_var(struct kobj_uevent_env *env, const char *format, ...);
 
+void ksysfs_init(void);
+
 #endif /* _KOBJECT_H_ */
diff --git a/init/main.c b/init/main.c
index 8b7633b7ab720b9c13a231d64291d35d3852602c..1a9046b563e469057cca72ce39a0701c9c4d49e1 100644
--- a/init/main.c
+++ b/init/main.c
@@ -1482,6 +1482,7 @@ static void __init do_initcalls(void)
 static void __init do_basic_setup(void)
 {
 	cpuset_init_smp();
+	ksysfs_init();
 	driver_init();
 	init_irq_proc();
 	do_ctors();
diff --git a/kernel/ksysfs.c b/kernel/ksysfs.c
index a9e6354d9e2579317d3b1bcb54223432d3ce0950..ac546562a6a1202a752de2d36719c6a193520a79 100644
--- a/kernel/ksysfs.c
+++ b/kernel/ksysfs.c
@@ -213,7 +213,7 @@ static const struct attribute_group kernel_attr_group = {
 	.attrs = kernel_attrs,
 };
 
-static int __init ksysfs_init(void)
+void __init ksysfs_init(void)
 {
 	int error;
 
@@ -234,14 +234,12 @@ static int __init ksysfs_init(void)
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

