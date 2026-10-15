Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7832451A722
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 14:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075609; cv=none; b=dfVPFOKKoDxFqECzixQuFKNL1b5bTh1ih7hrB0gHlgxjaL7uI9jXerGHoXUq0Z7HQkw1BNdJAYwOrAK9aTrJjtMJrKJYWoFiG8AJ6LMkPX0dKLYwSvWofQiQCu50Khs9FZe0zG3O8E0Ad1lkOPSFuHuF4il7Q9MtCaq8WkMoKII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075609; c=relaxed/simple;
	bh=NDWirnr4vg3QN9XbIRUWUV1IvDXviUNFZMI/OP0DktY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIOHBw/iuvm/j5T0M6XP9fE2Vs2OKEAm/kFgu1vtlKsDAM5rivZEiD7LFSdfgNpL84rG/p4AQYOilZvuxUsTxA5CEzlOEIMIEAYlOg+M2dSFCcWRwz8ocJuxQbbVXFnC+9jlQWZcOd5AKznFLPqXHD6FIAtnoWZJDpNl0QTkqQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cU5dHnhg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MQPPPFF4; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cU5dHnhg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MQPPPFF4"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jWEq2416991
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 14:46:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GJV2UsBufFSWGkCz1dtlwgPFuz884GffidJVAFetku8=; b=cU5dHnhgydKQmz8g
	Fa6xgQFxTMpsiTuD0tUYQuuC6TlVeN3KkRCKCZ0Rbc8UkDQiIGc2ciOSFcJQGlwb
	Ttmiu+zcnKJmH9bMB+iUVmILHz6//nKM+RPjbU4izcJWj7idEz0RVYJdDDrl/IyU
	ZmWZiIPvRlMwQwR/mjJXqlgUSrhew9XnPe02Cnqt+fsQNxWLexZFoa95lRqtOZLo
	trYmY3mdI0+o6Qx+ZhhKBtzbJQHmpPUYhQVzpe/hFQY1/bcNL+hd/pIdfEmMaCFp
	c8/cEGs3Wsdo1wA5GX4TriC5LtPDTUvxA8IhGXzriB4QQP8CCi2jL2db8OGxvJlR
	dDhILA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haqdhjn96-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 14:46:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93909014c85so1081685685a.0
        for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 07:46:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075607; x=1792680407; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GJV2UsBufFSWGkCz1dtlwgPFuz884GffidJVAFetku8=;
        b=MQPPPFF4Qub3wh3F1UiI9lbhfl6BnoHiWIF1Aynk3uSNiVY45yOsIpP/vfRJIP5czp
         P/2zn1/oPuOobEVCpOOajWiZI7GSoqKQQx8hy1+iSWc9AAx/yQeCvHW2sxVmjUeQSEsQ
         VZtDnmyq1SpElPej262OZUWPSoVz+qlWdBWV0t5KOvI08FdwSgqSiO2Hpg7s9g6RFyGG
         pR3AXcKlyqg9ZemuJoCUvECAdoP6i200CSou/2zhSyW7bV9v1V9F1oJmMpyNosOhXr9O
         vlgcUDyqwGIn5XL6kCU7qUMOgkbsu+haRys1n54NYn86V6CyFgwMr7bU/Mw/t5hS1wI5
         pX4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075607; x=1792680407;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GJV2UsBufFSWGkCz1dtlwgPFuz884GffidJVAFetku8=;
        b=NliGlMxL3hMMEvF9lz7gQcs2YJDajngJPo7xRcywPREKC7I7qBd9WbjpEMRcDcRlV5
         Ety1SsOQqi6UxGQfvmU0y/h9TOQMhQx7UpTLXZxGiT9lH83xDszWFGgyhCtK1LQ+6M1p
         McMSQgqnLPZCiXdTy4Vd6T9xj4zCokuYIq1LE4ko/vz+69j2aBRluOx6SZXA5fKgv6Lf
         /8mkD57Grq8AqNgqeasRsS4iHnLXpa1BYe4KBQQ6uR8YyiER6p/yadHCIAX0MSyOk9ji
         TNPYtRf17PKESkeMfjE+Ow5g5FhN9WN12tBcfpkwB0NvA5Kw1L/uNJ6z6ajEbUFgsb+6
         B12g==
X-Gm-Message-State: AFq9FYIZ6/HP+unRLDYHxXMETK6KAeDv36A7StSQgxtTZFSNSqFKEHhV
	oaLjkiMZAuZJwQpO+uGyggwUMo8iQonWO9e7ONgWF7It90ZklU3n+LuyPwADiKRD39BXPCcQIMR
	x0kouTXePyLaxN0VXYILBV51BoOKmkHIeh+wADn3RdRumAj7fjlOD/xN1wkoSsAamjw==
X-Gm-Gg: AYBFou0ENPBoBBV+/5Ou9Z/hBvCN+RttoXam4zs0bleIzCwvtWVFx1oJkpu4Hv3Mj2n
	Mj/ECQr7D4l+Zn7+djt8z4bCGjGw+pxXRfDeSOTLbb/Z3/utbGwuTVnK82BP4yoVHrThF8C4LZO
	e4+8zTazCn4scRHd/2feZ1fd0xQVOvLhPiEC712hqs7sfpVkWYt7n62io6NpS1NOi1IapP1HI/c
	2+aA1iOmc91i7yPQgf0Xe29LuY4nKHX3T7VK0MLHKG5U7er43YPYjlTqCXCEw7zsps3j2VB1x8w
	+RDqxi1aK8QqziIEOk/k0MF6Io1tFbynxiao7RVR+Lc4CW5Tfhma9anJDSCwOBvyRfuXAXOlXjb
	2MKh7TbF62VNx9xYcPZ00KXz4zdXp
X-Received: by 2002:a05:620a:4449:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-93ebd263d3amr3070954485a.44.1792075606405;
        Thu, 15 Oct 2026 07:46:46 -0700 (PDT)
X-Received: by 2002:a05:620a:4449:b0:93a:17c8:a1e7 with SMTP id af79cd13be357-93ebd263d3amr3070950885a.44.1792075605880;
        Thu, 15 Oct 2026 07:46:45 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm86840625e9.10.2026.10.15.07.46.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:46:45 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:46:22 +0200
Subject: [PATCH 1/3] driver core: provide a test-and-clear device flag
 accessor
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-swnode-dev-notify-balance-v1-1-9e7537bd2869@oss.qualcomm.com>
References: <20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com>
In-Reply-To: <20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eduardo Ruiz Duarte <toorandom@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=914;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=NDWirnr4vg3QN9XbIRUWUV1IvDXviUNFZMI/OP0DktY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0OdPWsRp5kvFYVqOM/F9vDktvQv7TiGE+He9l
 H3hp1ja8QaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatDnTwAKCRAFnS7L/zaE
 wy7xEAC6MgYZiI3qCgL9uauMenPEogWQJFEc9/AXz7T8xhIegqAWOgGl5fPh5cGLtcvC3T1n2Xy
 yyHH4RKt1EAz+ZaisSUTnp3nwt9Txt7bjqa2egUFNhIdWPr91RMVeWWfVPSk7edu702+l4MlmxJ
 TLi/nLcb25EG731aJ+6SQ2UoDaaS7ktbx+DHH7kX7fbRs+9mGHzbgExIayd3x3kLWCrHrTGmVMO
 lkpeHyZXTIJiym0BxasyCWHkXdg3V/jhLBgmvZsw99XQTyC4CM/D9jGZOAsbnfL+g+nu9sA3zSc
 wzKaXPtnFCgJaFcy5/wPGz/3tg+L15egtgXDrX6A77fYW10KRMAq5fbpe3ywq0yUxt1tufxu8U1
 gqyF7c6rPrye20D9UW9znOEX+Z/Pg+fOtQI+i1z1bsCScdTIrd0KfVAf3YNfZ4NCnOVPzWJ4tMx
 0uo+RAir9xNMTp2amUBQevB1GOzeUXoh1qMqad7Bj59RErcdD/WEopsL1mHQywQOkv5mm/dLw3z
 X3TBPo0465yCR3M3B+svxhWO1eEOByii3FqaEPj15D6Ka89c0omMLujHWjz/iguhipIOTy53Ukp
 9inAuBhKErGKh8ehVHcV4g00IiNbmH0+1pSPuSO79sgH8oOdQ7K6xb/qtHVR2hStjXrhjESzPl/
 Jx/r6rbl3qaLWPg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX8I38TQRFGuWz
 ZZzj/uu6/RURYcpGaZ8MkyNq5dWUEVo8syLKacXw2hpKCyL/4nvaCWz+I+I0iOdDSpLt5tP+lCR
 8FqowLtSRMZ2t/xqGESMzBV1JYPeIp7og85DjPVlSX0WMNHvO1sX8FA4uA7yLGhr5fZCBL415EY
 c5MxGYltFrPCWXV6PLbVxa3EcFmONZ96DSUD3SoVeyi20oMEeMKhnqrjkmr5EGUQiDyXYjVGZTL
 ANeun9a0KE6f2aZDofouB9R0LvDLIn9A2fqCPDcEOAJTsXR5YPifR+v7s8aXHCbizvaRDLgtgcM
 TMAWVAs9aR/AVQQrwe9rh20SgfuSHl0Ywkt6JeKMeuRWOphu+LinQk0ulYLSAcP4WmEkIWKiiaP
 3wLol88FZdnwZA+EzT2v7qxpHw2EDRusPftBjHWAEzWWhgoraaJB30APnJqtNjb6EoFtnT6p2qg
 fLCMwEr+xxzHVv6yeAg==
X-Proofpoint-GUID: 0VM---J92U7uvRHoVi-XxTTg4eDqbd5B
X-Authority-Analysis: v=2.4 cv=DeeCOftW c=1 sm=1 tr=0 ts=6ad0e757 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=0Wdk4a6BYWEShyIiZzoA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX9GZPKaGv5YXu
 4bsfn0W+Phj2sPvwSV4l9sVJg08ZOeggcjx2BEel5kOA0vFuuyWtzuEleLuZZO8Lk6+ZkGTXoBz
 xga76xVDVfzLoh6WLbe5v4P1LcWWzpY=
X-Proofpoint-ORIG-GUID: 0VM---J92U7uvRHoVi-XxTTg4eDqbd5B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

Extend the device flag accessors with a test-and-clear operation.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/device.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 879eb758b5eec3f634d4fee0e4a57433fb537801..c8de370d877f978dd4a160f0094812a1d8441078 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -817,6 +817,10 @@ static inline void dev_assign_##accessor_name(struct device *dev, bool value) \
 static inline bool dev_test_and_set_##accessor_name(struct device *dev) \
 { \
 	return test_and_set_bit(flag_name, dev->flags); \
+} \
+static inline bool dev_test_and_clear_##accessor_name(struct device *dev) \
+{ \
+	return test_and_clear_bit(flag_name, dev->flags); \
 }
 
 __create_dev_flag_accessors(ready_to_probe, DEV_FLAG_READY_TO_PROBE);

-- 
2.47.3

