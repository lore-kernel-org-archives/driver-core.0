Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EF53BE163
	for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 11:51:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775821863; cv=none; b=gub5iGWp7vYvyrBynGf1+KxceS5SgbKW+RQiaBc5rS88glouXXKP6YcF8qR7U94JkYG0qENmKjc0qUaZCjK332RerwFLQEgOgN9GjFoPSWng4ugsKX+emdt4QIn2Ngd0/pqTTNDK6QWmxw2LUHZ9QaQxl3aAZ9mMO1nVfTZAK5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775821863; c=relaxed/simple;
	bh=uEmTa1Cui8ivRrXX1tA5/vZoRd69sBEQCXpRmHwtUVU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OTmbAXBSavB6JSCIpaSva8a1unnIctl0X4+W0xjKYLiEw0JdXLUbqHYkUDGPD3px/1HIbZ5h9UC4tBGk/Hcc1PY9H8iXjDjPJqB1+icIPnlBL8v6KF1UvCWUZ8RZaFoSuj2RslBN/KHd7egS3dUANuH+P/47YJX6jTlAGPcsRMg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cDeneem1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CLcjhWcn; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cDeneem1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CLcjhWcn"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AA5cen1498619
	for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 11:51:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GX+soZIT5hGaMpGQOd2LotAtObKxH4M9garUFiT3agw=; b=cDeneem1IDfQ5vZL
	zb/OFnOathVJrBZbmOB9OjZ4dDvgS0hJ1/ohbH6FnnTzS5olnUoSNXd7e9gWyEVC
	+pMBHEMUtZTGOtqIx7yem0dsSamvNuf5GgLPvpDOEL5hi6JfQaNU2qt80xWg+dZX
	KkmPIPEdtkLl+sygImIpI0yW4xq6PfcA2LCggbGdhadYd12jBMFZiXBJns5TC46Z
	L2OKyxTi3yQosW6r3kPB6HoT0uWC/yYrWUoPLcv+CaVKzWPxZoDcO5K38pJZbboI
	a+NShyDufR6oUCrzOD/K9AoSjoWID9Ob2zRF2ur20DfODbB1r51kQfKMucUpUY9f
	QTWo6w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dey5b0a4f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 11:51:00 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-50d76f460b2so36175631cf.2
        for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 04:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775821860; x=1776426660; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GX+soZIT5hGaMpGQOd2LotAtObKxH4M9garUFiT3agw=;
        b=CLcjhWcnQ/gZtu9AZGJ1hajF/VZAdoFBvJjYTQKVvKS+H59opqulHhaj2qRwOVreSt
         94slCSNu4hBtO2FPDkqiSwmiarbGLdz0VIgzT0M1GPhFMDwL+8P19xOT8f2GWZ95rblM
         FXO9n4KHwi5sf+4TSb92z3x7Wl38QNIpSROL8Gc2SN+wtMXaiE0xW/6jYWKhB/IbjwDy
         MMee2Aew4O+sbJDBRNrGW+k5nMzPKqF9a53lbDj+NwtbQy9Ujve5WJCZpo9lS1rZxlaF
         wLeeFBaO5/Hm6oaRP3hWy3q3+RwKZE9GlZADcNulGa3J2uZJTDWg5wkPVUG0O254Q7WI
         Pj1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775821860; x=1776426660;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GX+soZIT5hGaMpGQOd2LotAtObKxH4M9garUFiT3agw=;
        b=Yo034WU/GiJmvoNopL5UstjrpsZg5SZzuxZQeIlyK40WMmVXJezkl0TiEBcEG3isg4
         KsDPMz4CTi1I6/DX7mPby0RDjgujN6sda+mhQKB6OqWadUf9HL2Bn6tCZOO+HYMnBpTg
         TxRkTTtSA94N1sKszNV2Qx/6+13okv7KNlX/VE6oWqqFav5rribZLo4ESBlz3jqlolWF
         18HYMHOYMkwGtFH8/7LPYA3oAsC7yuyLnLG0fXcDH5dpTDiEUFpMPHK3wm1pTRECWtX0
         LqGXB0pHeqt/yjZjf41UFp62yFdvJDd6vxnXA7D5j/rwhhQbBnF3IHHAJbvPFo1ZLU0+
         sqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCWj7qpJF33qCUf/qABeAxbJubScAfm1BWcYbZQekfjnsNdb0DDqaJ+eFZUzmvGlUc3fPrK9i0F0izau2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxR09H5BTlYTmmyGiliDYV9SE+GXBOlKRdkNTl/s8CQRrrSeR97
	0EmvFGR2GsnvnoRTvLoz4I/vMJg/1+4JDqHXl2q4wmB3YWMnq8A+pRQcGu6qq4AhsL+AiQqPZ7m
	n0x5VGwhPs0dc3CfybtSjNJ9BKHrzoRLYU+KCVWY8r0P1xtwRjvHuHX8C7S/U9BeAvg==
X-Gm-Gg: AeBDievNBUGqXIhgzGxzF2obccfm/qykz+Er8iVlhgjMlP+g18C5lqv8nTf7SJcc+Ql
	Z3OQW+dHr+tK3kIjGybq7dYCGDfvfISER0XrWDqYAyeKH7vkadTm6CG4dF9DTUrWz8UrJ6NT+Nm
	ZLFPLLIMfV6MDrR4QXbnWSNyC/xQPg+zy55yBC9/dgU1nbutvaM6jyNbrrEtoX7M71Ighgnqu68
	qsWQjC4JdxybR790mow7978MLHUIA6FXKfuGdOdcf/VS/7R4qXd3O5MN+MaWEywXBKjJ4PeXtyE
	NvnlbH6rnZh+S8KpoT32EtfPpo/JyG4KekfcxRLSRuxc+9GeKAENDA2ti2HJghNrVQMKYM2bXs+
	k+sJunVEIYlggBQ4cWpwc4GR4fUTsJDW2cOFwKgbL1Bartjbsmg==
X-Received: by 2002:a05:622a:4d3:b0:50d:a248:68e1 with SMTP id d75a77b69052e-50dd5ca6348mr42676371cf.56.1775821859951;
        Fri, 10 Apr 2026 04:50:59 -0700 (PDT)
X-Received: by 2002:a05:622a:4d3:b0:50d:a248:68e1 with SMTP id d75a77b69052e-50dd5ca6348mr42675941cf.56.1775821859529;
        Fri, 10 Apr 2026 04:50:59 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47f7:9881:2ff:bd1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63ab84cdsm7019329f8f.0.2026.04.10.04.50.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 04:50:58 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 13:50:46 +0200
Subject: [PATCH 2/2] driver core: platform: tests: add a test case for
 correct swnode removal
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260410-swnode-remove-on-dev-unreg-v1-2-cd7d305f3db2@oss.qualcomm.com>
References: <20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com>
In-Reply-To: <20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2834;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=uEmTa1Cui8ivRrXX1tA5/vZoRd69sBEQCXpRmHwtUVU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp2OQdNrVU2LxIv6dwf7Wy0NlUyFuXEUp843Ch8
 2WqewjZORSJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadjkHQAKCRAFnS7L/zaE
 wzNGEACnIC10CfziuYF/96g1POuCCcNlWuyx3V5k+GSgXTm/MYzVbRHGmQaievPke1T4ZBdYDaY
 KPVwsmiRLWHjUgqdLNzxJyV8WPRCJXu8thuBJkqigeaAs2ijvHtSnidVj1Ekwe1zS2RMtLwvDT5
 CepWPaIMc1aj1O/HQzxdCRnL84XSe/+gjSxmRuj1NVeuO1y05BedPmSJpev2WWwOk+bB8PhKWkR
 k3oXMpalwQXp4G3KSQl++MgUNYOQ3PWLBhUyDWTLBGrQXt7eP94OWOEjqleZq2Atmrp7MyZ6Z4/
 9JwHc8wOLNlp7Cjhrwz4bKiGE82WJB2/eFi3rEwoXtVzlCstlcTPyGQIgTBfKKuMXXqmxFFiqzZ
 +I8H1dKX1m9AU562Onsymien+Uy4qZuzE54MS91gRSAccXxkAYIoo8DBOJeSPJxCmAmmzOdtkI4
 3kML8FnMVdMuZ6f1dv3EF2DC5itlPSq36+m910QRuOONo8g6DeZcBsMpIJA4GZSZqx1Zz1T1PtE
 PfyMRm/oxt+J4XzEY0ogw9RPQqluRvSYaHBqi+IueQtqiobkVrQCCWF1uo7MMIUzoRRZz7qTlAm
 Euly9ZQf6L4XLx85iezVNBOwC02qWQCYxQIyo0UVLqutrdhZq20SFlyuoYo3E1K0Ll9w0/EneXr
 1HjNuhnX9Q9HJlw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 8oEZm_T_cgXi5PGwBptOEjg0iWuioHEh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDExMSBTYWx0ZWRfX4BjX1fLLecQH
 phqS1umLRTrhMg0vc4wzamsgt6RuumzRkun3l5A71GD+VtgS3u43xGPwPB7wr0Zj6j8JJcG4Z3I
 MLmsC1ML2EpNKdFI0xdAqcLQOmsdyow3oFQHGEOuHfCWivW+bEWCQ8Um+RaGWelP7on/4cfPmS3
 P5Ev/HS8APCYBmEPdnyv0SV088dwURS5m79BExqed1YGqOKYrkOZf12bm0W0LMIk+GD107HKfqT
 4Jd+jxco/tIl5qiLtO73iLFslmh5BRLgbJ+CZ5CfzT81UKPD1C5apjAXZygkfDwWYSz4mwjJSPd
 0Wv6yfA25MkvK/sPYnGOpD32j+wz+Lxok9zh4kV07+33deJ844T4Kf5FlMORYkGZEYKIrnhZBe3
 FibW/yMlOfIcVCxGADKJLg1poAD6zeWY2MjiGXr+Vzg7ncnWGv3w1n1huujXhsbXHbwKJojryul
 MH7Jx1++9tVOayVI36Q==
X-Proofpoint-GUID: 8oEZm_T_cgXi5PGwBptOEjg0iWuioHEh
X-Authority-Analysis: v=2.4 cv=VsgTxe2n c=1 sm=1 tr=0 ts=69d8e424 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=UE1O9HurMcZhDLJ-m8gA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 adultscore=0 spamscore=0 suspectscore=0 clxscore=1015 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604100111

Extend the kunit module for platform devices with a test case verifying
that the same software node can be added to platform devices repeatedly.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/test/platform-device-test.c | 62 ++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/drivers/base/test/platform-device-test.c b/drivers/base/test/platform-device-test.c
index 6355a2231b741791b54eb78af42e13f31f745184..9046be1cd0f68b57f70eddb15227609c925318ce 100644
--- a/drivers/base/test/platform-device-test.c
+++ b/drivers/base/test/platform-device-test.c
@@ -5,8 +5,10 @@
 
 #include <linux/device.h>
 #include <linux/device/bus.h>
+#include <linux/fwnode.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 
 #define DEVICE_NAME "test"
 
@@ -253,9 +255,69 @@ static struct kunit_suite platform_device_match_test_suite = {
 	.test_cases = platform_device_match_tests,
 };
 
+static int platform_device_swnode_test_probe(struct platform_device *pdev)
+{
+	return 0;
+}
+
+static struct platform_driver platform_swnode_test_driver = {
+	.probe = platform_device_swnode_test_probe,
+	.driver = {
+		.name = DEVICE_NAME,
+	},
+};
+
+static const struct software_node platform_device_test_swnode = { };
+
+static void platform_device_swnode_add_twice(struct kunit *test)
+{
+	struct platform_device_info pdevinfo;
+	struct platform_device *pdev;
+	struct fwnode_handle fwnode;
+	int ret;
+
+	ret = kunit_platform_driver_register(test, &platform_swnode_test_driver);
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	fwnode_init(&fwnode, NULL);
+	pdevinfo = (struct platform_device_info){
+		.name = DEVICE_NAME,
+		.id = PLATFORM_DEVID_NONE,
+		.fwnode = &fwnode,
+		.swnode = &platform_device_test_swnode,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
+
+	platform_device_unregister(pdev);
+
+	pdev = platform_device_register_full(&pdevinfo);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, pdev);
+
+	wait_for_device_probe();
+	KUNIT_ASSERT_TRUE(test, device_is_bound(&pdev->dev));
+
+	platform_device_unregister(pdev);
+}
+
+static struct kunit_case platform_device_swnode_tests[] = {
+	KUNIT_CASE(platform_device_swnode_add_twice),
+	{}
+};
+
+static struct kunit_suite platform_device_swnode_test_suite = {
+	.name = "platform-device-swnode",
+	.test_cases = platform_device_swnode_tests,
+};
+
 kunit_test_suites(
 	&platform_device_devm_test_suite,
 	&platform_device_match_test_suite,
+	&platform_device_swnode_test_suite,
 );
 
 MODULE_DESCRIPTION("Test module for platform devices");

-- 
2.47.3

