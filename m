Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 457973E95BC
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 14:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775139329; cv=none; b=cIbTcjI5JZaXd6bZk+6unrWhLDAZAEpPy7YJgBK2Bxx1uZJTdgh9R2+hBtNPOqOZMh6sDqYf+oPp2xruguu3lvZKgBRn58UfLM76zqsbPboxFDn1Tnt9k4fEZ1JnPXhmmFw0T1dPVVIYZCaXaB+s2rC2MKYs303RqgON+ggE9nY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775139329; c=relaxed/simple;
	bh=yBKrNw7YytejW291mPySbI6LGBLYwN1ehugPvNfrHLM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PqL0AJaeS783LzMx+j33YS8l0DoqCKq057bx2Ld8zBDt+prD6SUNvVzSSvxMREw0Hn1CJ7smpSb2VzoJstQa3/qK8lHf3b5ZXZXAPkVtiwp2EFOE3xTJzfoAerslQZ5dmVksW4415pSssfGcDHvadoxPqWk2OTkd9osARt49S2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JK9y2rzy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PwKXZPp9; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JK9y2rzy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PwKXZPp9"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632BlNHI2338020
	for <driver-core@lists.linux.dev>; Thu, 2 Apr 2026 14:15:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HwshQwGEYEPB4ewYumRkBFMYexYVpzxnnKi7Qlm1u/c=; b=JK9y2rzy2T82T4od
	hlXEty4Z194J87BnMHPKV1Xm0zaIdOavDzvHIjzVTkZJFpmq8LtbZt2PyzyqSERt
	iQX1gQmPRsOF76azXI88JRtsbXsDXgT3NT4yFV8RsE5IKvIONKrLNac/yXF6ME4D
	gDkbIdvlcTi5EApn7Kn/UnAaLdseqaPM0fRI08GakZ1U01PNuGh/VdaqIHkOEtpp
	qOyzEzFHQO90FjRnF4aiJ0asS4jiHtmmcVR7beSN2+xHn5rR6csNXKG5Zshk+Vj/
	SiHkOmaPKwcq6vdGdmkMFZOWXvebEdUC75QaCSfonmbkt4Gcg3l2ovpOUTPiktRC
	nCZxUQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9qw08mjs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 14:15:25 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50b4ca7e7c2so21268711cf.3
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 07:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775139325; x=1775744125; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HwshQwGEYEPB4ewYumRkBFMYexYVpzxnnKi7Qlm1u/c=;
        b=PwKXZPp9AAV+AfyNnTEAySu1oI+vMhTLbssh/DUzuyWlHd5h/ztXZvnx/yuXvr1qdy
         XZp4/uoRkHrDXKDFYgEahWjATDUAvqFsFA1vbGcc7UKLIOVfPJVqd9JrAcYgbMz4wikJ
         wdaZO+Ul13jWXiVHdURVf+t/b63TqhzpUMuh0UCwea5RiM9GIMnFVk+B3axgsQtCYbS/
         i5YCwc92WAE9sVqmTnmU6roqguX73aZ6e4OTZADVAcgbmd6I4Rrbo/BUzwTnF2dgHk04
         OSuEvXW2ICVrHFD67RJ4cNHFEAcPdBD16hX/YHRYr6O75PrkSfFBxf04NmgnFdwg9F2r
         NcWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775139325; x=1775744125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HwshQwGEYEPB4ewYumRkBFMYexYVpzxnnKi7Qlm1u/c=;
        b=tUdpQEXBXbrMZMiAbIauoESqc1pfPgrfCrz811vuIsw8IEiJpMTsmby7AWkeOdt9rU
         gWgtlx8Xlh4NJeJen/V871NU5wKRBSMXSVmnvPrbLSe5WQqE6nIgsF+3vEoXOXQ4ReVQ
         /btc23TMD1743+7dZfdOQJBf3ikDpwgwju69cr/MuXCOn5PmSB9ZopFeyPlxc7ltSYWb
         sdhC9Bgr1GkdcuDMkP47U4FmsIelvkfYXE0yIekSwSmKiYoOtPS4TaGfsSW1oMP71LOa
         jIyedhDa/vu/Zjg1VQ1zNnreiITsV/0T8l0eL+tU0TUvowdglkg6/NINDkjx/i1Fmz8L
         ydkw==
X-Forwarded-Encrypted: i=1; AJvYcCWdkS0R3dmpyWUJ1bYZ/k3NtthV9q+/bbnu72mc/8lf5s7nAscPiDAsahVk1wAIRKhfQ+GMl9R3hMm4JA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzdIuYeM3IbmA/hWe36PcTpRpVuIWmPCfPFyHX+Dant4kr1Z0x1
	/bYhZUe+UgPJc8hXogSZ5w3LHU0DwppF6bK4Efck04DVC1agDuanCsegm3jWI+L4FFP90XR6GFe
	030eEKfuOr7yAa86Au91LEpGWdHH7vrH07InxhHHNleZxVo7kuTTElxN1nEuBtxjkxw==
X-Gm-Gg: ATEYQzwgr0QV3fQZ6TnlAT64Yyd0HYzRWroJMr22PvEZ9LKtf8Z7HkIJgHP2ZIcVIkM
	0EuDf2HqMy4frhvJxBB1Wd8UneyRhMDABluFYCSc6IU0xlBfEhFWIR4n/j3nTX/eB0/+jERA0h/
	QSOiv+yWYDlPfTpEzz3qTrWtbvWmIGj2vrzTBLb7dkwtYBpm1V1Ie0kHdmCX0EJYXNvzyGrhYj6
	2TIFPDkH1vSA+eaUlYMnvI9UDIw5EyRTy39qM9pQnlzEJYWR6to7FJVzyeajf4WvBWBoBrW3/G5
	2m2/KRw1r+hNUuZU/NVybrlrZrZKsNtFyWcUKItmyyYGHAtryBHxvPY82ZpGuCdVAnsdgT8ZIt/
	edkNQwbDEHvbVKDAcfeO7+3P92gz4HLudOQgR/Ko7grew5pNsWZxF
X-Received: by 2002:ac8:5fd0:0:b0:509:2822:670d with SMTP id d75a77b69052e-50d3bc2a2f8mr109665901cf.27.1775139322494;
        Thu, 02 Apr 2026 07:15:22 -0700 (PDT)
X-Received: by 2002:ac8:5fd0:0:b0:509:2822:670d with SMTP id d75a77b69052e-50d3bc2a2f8mr109662421cf.27.1775139320358;
        Thu, 02 Apr 2026 07:15:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e80a5e2sm192824885e9.1.2026.04.02.07.15.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 07:15:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 16:15:03 +0200
Subject: [PATCH v5 2/4] software node: remove software_node_exit()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-nokia770-gpio-swnodes-v5-2-d730db3dd299@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=776;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=yBKrNw7YytejW291mPySbI6LGBLYwN1ehugPvNfrHLM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpznnvGSCWONe5TLbuQtSrY72fMOoZXTKRAcb0s
 mqhmDG1RZuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac557wAKCRAFnS7L/zaE
 w1OUD/9OSD86XkGc+sAjVkMGHKvcn39N4RTc5O0XXVLyLfKn8tE4xyjvFcPy+smX4mZyqyxcO9v
 QE0Y54slQVt6egHK85JFznO6nDzDzrYEI4wJnsTzUyRS/cE23bZdQm8DFkgyYgP8SulxVAS3F+e
 d+SBdsaUs6fkx/LqtPKOc1XoUXMTM7FD9IhjioyMDVXHUHCGcx0x8d42mPmg1PiaQLThQCwguoy
 sncbcYKbq7W+1u5FKq0JmITwHq57JrwfABCNQI0X1hVrQlwTi9AXAto2/4SHQww+mzBIse1gNU8
 gjo5XvNYp5r0dqhHoq6mXrJ0+kOV6ElLlHCw6n+vrXNjmMzdcz5Vccwh0z7vqIkRJvZwoRaBhHm
 0xKIF6wX+eB1TQyioX01Sn/QUuJ1WgrEdOnx2t0/EQgEJVzp2gqeJLymBvCvoxDroUsRPyF1WdB
 P5fB2uoHdxlEid8l7NJPUtghQ94mOdP9pf16fIt+hn53sovq4v/O3tkDlVDcDL75pxTWYHkk+UK
 KmasIyRWS9Slo0MnNObblidd2xrrH5qjDmYLxjMyAdowUPByvMTuTwsvG+2F6WNzAF4gWsc87h+
 og8McoR/tx9in0Wch9REdNGOErbElO7/2aTCUayieZjXfpgNFbzdYNUbZibB/Y/2s/wiEhPOAVW
 oB7blfpwAAyLd1g==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDEyOSBTYWx0ZWRfX2Z6wvT7LRnjO
 UhDbDE3cCTcfdMV5Tmp8Y9fVrV3ziKQbmmc/hc0Cr9rcrP4wKi5UIpDJwEZDUXa+sT0L+JDpDh5
 iT7a/VFH+K3CMfvSdGVfgoIt2xh01aAE0Zyu7sF8Cfei62AMH0/Z8zZyimVG2HhEpNOT4cjNrbP
 v5V+ySGhklKOpnK8uEbelpaRW+zwDN2ONudrgajnlluNd4ZYi9fwQ8lO7UVgR3YJ8/CRb7arzau
 zop4v28mI5mq4+/4zqhWfy/8VieYdHt2J6oae8FqPiTt4YVa46nOiIksmTdlCHYZLUSZmAdWLEM
 RRzrkBWSh/fZTnRv4nZDmet5ZeFDWJ0L3Hj3oVCBfMO1ErNZI9TGdY7HOdE7dQUxtHHSYDkZcmB
 fIwBELmy9HQMLrtCgn3dxKjhemrKoHY7QA4gosQFScUzSE/gEOyz9OemaSXrPBu3Bzjl5HlsPoG
 cls3QKDOIqScDAVzPGw==
X-Authority-Analysis: v=2.4 cv=PNICOPqC c=1 sm=1 tr=0 ts=69ce79fd cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=mhlm9Ems92mV8WSaVUEA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 3eESOyV23X8uOyHjk9AJFqCieEhljrbV
X-Proofpoint-ORIG-GUID: 3eESOyV23X8uOyHjk9AJFqCieEhljrbV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_02,2026-04-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0
 priorityscore=1501 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020129

software_node_exit() is an __exitcall() in a built-in compilation unit
so effectively dead code. Remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 51320837f3a9f1bf4f65aa161d9b941affc74936..26cbe1c2a2e043a2315764085207561069c23ccd 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1135,10 +1135,3 @@ static int __init software_node_init(void)
 	return 0;
 }
 postcore_initcall(software_node_init);
-
-static void __exit software_node_exit(void)
-{
-	ida_destroy(&swnode_root_ids);
-	kset_unregister(swnode_kset);
-}
-__exitcall(software_node_exit);

-- 
2.47.3

