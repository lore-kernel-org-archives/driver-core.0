Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D3D3AC0EA
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777535184; cv=none; b=advEioOFD0x4Hf3V+gFNXmfLilaIJ+hOd0K/OqgC79GJAq+FioT25e1p3UdG+YSS1E4+HA4PdvktlsPRygq/mMVZC4EVNbzsWFA6eGgu6jaPPCJSq+IxGeZUQdaKLdh6sziFr3d/XKrvnQVWxfG5CPaWZ+8GE63tc5eT2+0TpnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777535184; c=relaxed/simple;
	bh=xqT6kzop9Tu9IRegDxu2r1ixLhIQNCTwTag8YUl9Jig=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QbHDKNfNYWT76b1IjTlD6/n5qDlWjJC+aVkW39r/X6Q72UFJiUxvfr+OSCfkZZISXmYIIFpKzfjwN3ICoC+nD/l5uNjEZd92lZIFtpRao0GtLxjCkETP1sdqty2KkX2sozsgvghtfHsxag3mHM42HvV0wEu4OiYZB/hAWsgbGJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hq2pLFfi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jn4JLVCb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hq2pLFfi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jn4JLVCb"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63U3HBLx3729389
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:46:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CKiF1d5L+Ukri0gr8t+v5QxYVCgWBtf/9l2+Zs13NyQ=; b=hq2pLFfiY3h9ocWE
	kbJpQythjLQBTaCZjB6NFymebS3tclg5Oj5K43VnF1Dy5MjJ/J5Aylf6IqfVGFgx
	6TjPv6IEMZNCJN4yX/J6SLFL8sMOr5nYz3ijiJMfad7F5qARhAYGZjvA0DCm8ndR
	LasCvFcHSs2ykGM4Ng46MnqLfJqMXN3BpyLP8/765JF+TiZh1eKH2OwaNPCICRWj
	4lJekBZdGEj4BGTZySRi2t9RVRm2kxU4skkK12TnjGZ2fc7Fp8s9okC5QfYtDiZ9
	fiSI1qBVrq88jnszpntyfpyt4HZ5WUqH/4iaA9Fw0a6ffMWY1tHh5H0EyHii5VTa
	ewMG+w==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4duy1w8tp2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 07:46:22 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50df4c130dbso16778721cf.1
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 00:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777535181; x=1778139981; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CKiF1d5L+Ukri0gr8t+v5QxYVCgWBtf/9l2+Zs13NyQ=;
        b=jn4JLVCbtI03mGJaA6TJrn8Q/vs0mTqkkgzUWL1k+UE9VM3n215SUG0jdaw0f51gjx
         /gy0zGDCRYybbB2HSNW3TwbBVItXOueR10rcpBiqoYTiT+WiLlMSRvdHF5QCxTLgYgOO
         /DgzkdESqHfZAWLrmJmBkLQXhUenz74woSWuGo08fbdzFyAN0Rm4tlXZiRi0PzgYT0Lv
         UBvTdAZYSyE92FAFLZFbcWX0dwK8RYvoTXZauppKFoNEse7FYO6JFn5+9ORANYxq/hDY
         KoW5ZVgDkfyrtxNVE6+/CQuCI3Yz4WUea7GAsYgS2flhZx30zYnbrl+/G3/mC/ecrKIY
         xbrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777535181; x=1778139981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CKiF1d5L+Ukri0gr8t+v5QxYVCgWBtf/9l2+Zs13NyQ=;
        b=lKfoAn3cEm8j7W3PZ9mo1529+s7ufVHYHoSFjUTI8KXP4PKyiHN0EL0s1O2pqgGHEx
         ioBvwGGRmKdGyhGKJ16FdRI/EbQ8hfBOIrmBRlJ2WjPrwfZNgrFfeDiMZ/JwlTaCp7zi
         y2x60RHwIRe0HccCASUO8uiPeheqN/eLwvQC71cUtswgJnyjUAJAf6Y7Q8CEDruDzXeA
         p6pRt8lxokELeRZkiUs/wfX2vRn2l47JIW9uu0wkPqLLqtI9OkaK8dClROGzYufk0h7r
         zGcqhVsz8HyzF9gvnIofgrtBD541HQZHhjF0FPETKc7Wil4x2MomoEVUKmMdb44az7rV
         tWyA==
X-Forwarded-Encrypted: i=1; AFNElJ8zRkohbwvmeK/bJ44GyfLr99TY+yeR8seyBLvhsG0c1NRgRaoIRJtnhUG308JWVMVcapZhAzbk0ppVOA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzghIfgWqqKMse3/UgoFe4i1GJTnvh0RdHWVvTEieVBxhcAiHKe
	hDgxR83cbFY2VhXFBdsGoJfNsdlUtoPuCcz57vOi+POy0iUfUspVY+r+FnxYV7PcxtHPuizgbSl
	vh9R1HyLeLIJrQC4LpyJzPEAyEWG1BsI+9C3ue2PLx1dPblJ2yuJ12/otQGm/9A+K+Q==
X-Gm-Gg: AeBDiesH8qSPgkZ6B+4FAlR+8MF8WTmFbPg5pY6jJ3yO5NZISytEngg8n5ImFgriqvI
	N5+ycUDecCDaShnIIqk1eRihuR9tkTI7/4xn9TT+r6pjD5y5qKZXm6JhI6MekigQX+h0H7pVHaF
	T57Vsj7h1Nd21i8SPOiSNSl5jpEkSgBq6PTOWJOskYDQLqh9pVIHoqx00vTuoWhDjswupH2VCdR
	IIm27InbAv1qrwbXAuGJvmaWxkrMT9o4LVDAAlONNqBbkR0+hwkFMBHkUh3jdPnvVAmFBXD/CQc
	KQhro2lYEbCPwXvlNKK5RtG6pPcml7X6HzNR09++lxOLaAVXbXVQI3BelkJRLWfJTSXUa2scbln
	Xg4oW0Zd0hHFS3yC7DHB4g1bzxKvIL+IaSKr+d/1gTScse+BNAeHpRTn/ZikO
X-Received: by 2002:a05:622a:9009:b0:50d:9f3e:e1a with SMTP id d75a77b69052e-5102d09ec31mr12893471cf.9.1777535181115;
        Thu, 30 Apr 2026 00:46:21 -0700 (PDT)
X-Received: by 2002:a05:622a:9009:b0:50d:9f3e:e1a with SMTP id d75a77b69052e-5102d09ec31mr12893291cf.9.1777535180700;
        Thu, 30 Apr 2026 00:46:20 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:79a:f446:21cb:22e7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48a820c856dsm48714825e9.6.2026.04.30.00.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 00:46:19 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 30 Apr 2026 09:46:04 +0200
Subject: [PATCH v4 1/3] driver core: platform: remove software node on
 release()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260430-swnode-remove-on-dev-unreg-v4-1-01574da0aed3@oss.qualcomm.com>
References: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
In-Reply-To: <20260430-swnode-remove-on-dev-unreg-v4-0-01574da0aed3@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3068;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=xqT6kzop9Tu9IRegDxu2r1ixLhIQNCTwTag8YUl9Jig=;
 b=kA0DAAoBBZ0uy/82hMMByyZiAGnzCMWh/lxrSWg36NMX+/CKGA8yIxzcbCw9gWBIJOnLLP2Wk
 4kCMwQAAQoAHRYhBJHlEy3ltUYde6Jl/AWdLsv/NoTDBQJp8wjFAAoJEAWdLsv/NoTD1g8P/3zh
 ii7c5Pw1temLKFdC1ULb6TiSHLSQJ1Q33ZFxLJo8hK7Q1GoPRtKoaQLwLCKaYIPy35AZjWTsOOh
 HjjsxqIwUkYec0EzgZOu8QXEm+yA0cH2ttSRje3CPeF4DczxvYJmYpP0+zXAScWBaUUW2fQmmje
 cpVOQzw3C/vmqTZzYETS+8SWg8dddZixpUy4MJhSnH2dzg+W8vXuOxhzZGMUmW21CxuF+tFNMlb
 057+jnh+YlSv8cfn2QMxnlC7RPhumH6FzpikjjDukOwHwTfWqRbqvftP918ZYQC2B2wB6ty1HU/
 554t0d6rMztG0vQ0JYRkPd26dtJKxCkRE/Su6QPuxzzd6zEATWcNX9RJlYRtl4umLmOKDN+c4U+
 4yAmKfCkn5JiQ4uRCIFRYoyNpzvuUiT9l/Lu4Ssk5BgEWd5krR9DLmHTdNIWAzTt0i+IadBCO9C
 MAxPKY0TWWfcbkIxaDxaFQwhgKSLaoo5zXhBXVZ9M5DxNVVHotb2S97nFqlDLJvjdvFawYVgTql
 IDj/iOXa/lhTvKkE27oSlUCPZdITe1z7WfWnlspuSY6E/AJxilpcq/uNrkDx2iIL9PyJ8TfnLuw
 lpGE9uc4j/1C+YOydOrWvyxuB0BXLdLIOC88YkkMpbVYhDIbC+Uzq6cdyuSOxwyGPJi4kOmXjfo
 Hw7wu
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: LWbUqGy70XEckM1SXEqa_ipUVWqJVdn2
X-Proofpoint-ORIG-GUID: LWbUqGy70XEckM1SXEqa_ipUVWqJVdn2
X-Authority-Analysis: v=2.4 cv=DPy/JSNb c=1 sm=1 tr=0 ts=69f308ce cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=PTX60mhBgyOAItwlv74A:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDMwMDA3NSBTYWx0ZWRfX7n6VtdxMYXPc
 iIoEh61ikhg9XCj3u2Zd+czK4CITB39SWjcxHDFPjpWM0to/IO54f7JB5YU9AYG2viiJY+/qUgO
 di5dr2E/OPpPaUgzve9WtDQHDoJ2/qfvrkeo6yVQlpWBIk1nyMtvaU4qc37OVJTjVZgJ9V384X5
 g564irKcc9L3KTTSH+CUsPVIwhYR+67O1rS22SfEKgKP/aZjOZQPi8DKF+FTU9K0MKLCgQEqlZA
 lHB5tyUW8ta/mRd6n9xnT9YqPTkx6uuxSZr/4gSVPZqqUHUcR2mR/JBbGw+dnpBzL26Cf9ZXcqH
 ydPvZxX5EtBkcm018FOZxuVAcfFQ65Zvbk9dVP5OyeiVtKg/a8hnpW0oUQOjfI3m4++cYbBl9qG
 bMEDWyUjZhUBXm58+hAwSkyFXSOXOZO9g+ZI9emG9bZ7LP1ZXCGrQ21AEiGFe2RiRAGflb3mIa6
 Zh38pyZ+y7KcotU5/Fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-30_02,2026-04-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 spamscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604300075

If we pass a software node to a newly created device using struct
platform_device_info, it will not be removed when the device is
released. This may happen when a module creating the device is removed
or on failure in platform_device_add().

When we try to reuse that software node in a subsequent call to
platform_device_register_full(), it will fails with -EBUSY. Add the
missing call to device_remove_software_node() in release path.

In addition to the above change, make sure that we still function
correctly if a software node is used as the primary firmware node as
well as disallow using two software nodes for platform devices as
device_add_software_node() does not handle this case correctly (in fact
a comment inside it states that only one software node per device is
allowed but it will not bail out if two are used so we need to handle it
here).

Fixes: 0fc434bc2c45 ("driver core: platform: allow attaching software nodes when creating devices")
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/platform.c | 19 ++++++++++++++++++-
 1 file changed, 18 insertions(+), 1 deletion(-)

diff --git a/drivers/base/platform.c b/drivers/base/platform.c
index 75b4698d0e582e67adafa78c312d75c72fd654cf..22834be0a3aeabf538f57ec6815ab3cd6851c16b 100644
--- a/drivers/base/platform.c
+++ b/drivers/base/platform.c
@@ -599,6 +599,7 @@ static void platform_device_release(struct device *dev)
 	struct platform_object *pa = container_of(dev, struct platform_object,
 						  pdev.dev);
 
+	device_remove_software_node(dev);
 	of_node_put(pa->pdev.dev.of_node);
 	kfree(pa->pdev.dev.platform_data);
 	kfree(pa->pdev.mfd_cell);
@@ -848,7 +849,13 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 	int ret;
 	struct platform_device *pdev;
 
-	if (pdevinfo->swnode && pdevinfo->properties)
+	/*
+	 * Only one software node per device is allowed. Make sure we don't
+	 * accept or create two.
+	 */
+	if ((pdevinfo->swnode && pdevinfo->properties) ||
+	    (pdevinfo->swnode && is_software_node(pdevinfo->fwnode)) ||
+	    (pdevinfo->properties && is_software_node(pdevinfo->fwnode)))
 		return ERR_PTR(-EINVAL);
 
 	pdev = platform_device_alloc(pdevinfo->name, pdevinfo->id);
@@ -866,6 +873,16 @@ struct platform_device *platform_device_register_full(const struct platform_devi
 		pdev->dev.coherent_dma_mask = pdevinfo->dma_mask;
 	}
 
+	/*
+	 * If the primary firmware node is a software node and there's no
+	 * secondary firmware node, the primary will be affected by the call
+	 * to device_remove_software_node() in platform_device_release() and
+	 * its reference count will be dropped by one. Take another reference
+	 * here to make it have no effect.
+	 */
+	if (is_software_node(pdevinfo->fwnode))
+		fwnode_handle_get(pdevinfo->fwnode);
+
 	ret = platform_device_add_resources(pdev, pdevinfo->res, pdevinfo->num_res);
 	if (ret)
 		goto err;

-- 
2.47.3

