Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3698B41DEE0
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205131; cv=none; b=r2vBlhF7zuUyr60yp8rS4VeQQU7mCYZNJUKIaECFg9hpK4mHhM2bHTyUdvXR1UTK5eXcB0PxAwHt47o44dvBm9Jqh4WGC5YyYU1fxnHgwHx0IRLY0Ev+j3vKnMln2XQeV5n6KINhq4XPPKGdywvN3ci4u9SRoO8CSMHy+YyzFdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205131; c=relaxed/simple;
	bh=V/KoRkaS+83usWGN912iUHUZ0L9VCW5/9FGQG/93XDA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mhv/uOCGoG1qEMd73dsLrqGrRxhiVK1vLSgH0e217dGwq7fGoH9WbfPrTu+brC6+SsAjYI8J+4Db0zpAIE/D3rvD1KAfBbpy5C6qEAQNQb4yrsspSjs0Q4gxPUdvk/702AmGRn5Hs4FLVhICxgCb+b++/sO9RkEo0Pn63kU7G74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NzcA/YnU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RbSUxbXC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NzcA/YnU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RbSUxbXC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBihnC3747445
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9l0T0GCUa4XXTn8B4it8C3G46rwuAieDuTvkXQVUEaQ=; b=NzcA/YnUIFTOOyx7
	6f90moPDulXAs6HdrfRjnL8ufIMakApXtUwSx6wEybdv18wjncn1AKp7xMoe/dXB
	FDlhFvPFLeDp4J4p8u7rfIAwTG1MScJHwOOwnFgmysl/FDfYZ5SrSNE3juIQ/7pp
	MaMGUEzghiXsUDnT4MGKzBIIB1p1NovjRen1C/gMPEbBiUSRYUEe/58875T/RWcp
	GXX4l/6MJrWTNzVSiirqEJh7j+WFr7CFT4qgBZQsHvF8hqHhOwQXK7IAJXBMW/I3
	jQjiUgyJnZtF26R6zwungofLPQ5Zicsu5MBNc3Ueb7GpytHRdpuMP4/nH+14RG/w
	BsmlXA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feq3pj4se-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1e6f602cso60734421cf.3
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 05:32:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205127; x=1784809927; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9l0T0GCUa4XXTn8B4it8C3G46rwuAieDuTvkXQVUEaQ=;
        b=RbSUxbXCMt32BZaCuQhFb/eIuoz5dIkklm0gHBK7k3tqvvQ3y0YCAFwDYEdlQU0LbB
         opo1JsuGzTMhRhOgPaG3zL2JIaPKDLU7k+lYizxTK8DMQuJd14uL2dghz41Vq+eKSY1+
         noDUIdK4kd9kVAie/HoADd98wXd48SNi+JBmW3OSEJeH7N3o+KTXmDAWJOic3rDoxVv9
         +wyxYqH8rZe2l63IHYIfAgiE/u37/vKPC/SKqez78qy2TjfHvYBgSkCiMoS4jy4Q/vU0
         XKomZru/Szk7VFEWTMjgkYNZJwTlpFrmRlYiIfSPuKENxbhoatMjmS/EltITivK6+Bxs
         RzzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205127; x=1784809927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9l0T0GCUa4XXTn8B4it8C3G46rwuAieDuTvkXQVUEaQ=;
        b=IOA5DHXXHUAwK7xv5HZs3ks3sPBnSyDp8Bt/+QJm5sDWP4Cth6L8Sb47DVWg3YuSiG
         HuqB45NNaL66rMm3OGYfg2g32i0jzm6RyJISpkU1oPVukqRocbxRRYAHnEZzd5OMtWBC
         w4Kx9XVCmy25DXCQba1fVB8y4Qd0D1P2mIf0moosBcwqde9xKx66wUobw+gGQ2gSEHf6
         qbaYak74+GH7CLu7UBEmh2BaKnSudMXBDEAF+8ALgQcAjI1UcpCCSqpGIpw7SqvK4mZ3
         OLiBIsRlgoVyP/ZGZEtXVrj2b4hPhBloUip0piP7zKGSc30E2QYPq4aRlDizDExKMeJh
         JVLA==
X-Forwarded-Encrypted: i=1; AHgh+RqGiWNvJohZWDmhw/vSIprBX0ThBEZVHBz5rE75YlwGESEaHcl88N1Qkoi8tR0W1FDlFsaEfx132GuRzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOgmlOw2hTa5mEsylugEVtXDsAFbSfkbKWqSiI6l7/yApL13Oa
	SvLrlPLi0CvsogJ+pbm33iSFMtzMe7MdS811/walO9UipksgByqBP8pujtCyTxuvtwrS8J/xLNC
	Ler0F1B8bBzYTDMvEpzRGJP6COvD/G2mNOmtwdy6+wsa0hQj1rBXa8L6yG7vmBY1VJQ==
X-Gm-Gg: AfdE7cnZKGGLWeb/ujMq6RbQ+r41Q1+9ROeWPrTp9jYZNbxfefl1Imayxr3OY8oqGaQ
	dotW9L4HfPOufByvueNUrN5zDKIAxGLlTn4RsWtiMhJB9Q4zBU21X3aMSzP0RNi+N0MMdVa2z6G
	mi+H9w6BtN4L155eEOOjFiax/g2dMP2Gel3z0maIVAG/GXDla/uz/BLuVKOixEEUtqkKZrZYLGK
	6anw5cvloUfvJn1FSLmEMiLB6q0p+tA5jkE2lrYFEzpAwyNIXMzxdqCIipU3RlETeJWNHANn10D
	Hbhokdvz8n44ACu42zb8WVJL9byt6NqXO9ZjhX4RnL99waGpss6WvmagMZnOtXeNMkGjmjyMBOk
	3SrDcPrmJ8C7BTSd3cZF70R0KL20=
X-Received: by 2002:ac8:6f16:0:b0:519:f59e:8108 with SMTP id d75a77b69052e-51cbf1601a5mr221556691cf.31.1784205127520;
        Thu, 16 Jul 2026 05:32:07 -0700 (PDT)
X-Received: by 2002:ac8:6f16:0:b0:519:f59e:8108 with SMTP id d75a77b69052e-51cbf1601a5mr221551271cf.31.1784205121589;
        Thu, 16 Jul 2026 05:32:01 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.32.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:32:00 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:37 +0200
Subject: [PATCH v8 2/5] platform/surface: gpe: use
 platform_device_register_full()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-2-5c2b8cc38c28@oss.qualcomm.com>
References: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
In-Reply-To: <20260716-swnode-remove-on-dev-unreg-v8-0-5c2b8cc38c28@oss.qualcomm.com>
To: Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: brgl@kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2590;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V/KoRkaS+83usWGN912iUHUZ0L9VCW5/9FGQG/93XDA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM83p9RhBwshF4v+CF7UXRSRfhDVORsXqTwJU
 8v1VZYWbjyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPNwAKCRAFnS7L/zaE
 w6bLEACeQ+4V/bJNhB1WQ2H6dfrwOUnKDGZwjMD2bpdwuqfEUzAcCRev4jXklTgd3KmKQmjvjJ5
 V3bviQgXPe1vcVXP7uUFN79OgQBkLMfH5mKJ62AcgOSKTLmBFYF60GRZ1XMuQkUpRP/Ambd4vzE
 TaTvXhASUgCDA32nnOTZgkLMvUPoGv5kLBBdOBsUBXGin7coEH2npQP3i8dsVUByeNzfnmmzVys
 isOEE3p8B4BKITgqM3lZ3dOSqEjGBHyoXvQouFqUgJuoEou30Dk/QYEmb79qDfFl7hbdrITIOgG
 S+bLySv/eAgRKWYiy20yFKIxiJPzWIFLXt1FhfL0TNnmH6AnV7XNaUH93hbP2OGsngqLePWyVhC
 KA/Zvzt22eJFPxOgiwvvyFlHxVcqqQ5Ss3OvTXhhBcQa1TKI5nKm/QKZOaBwSm/ADdeVso2VXJO
 kyI6h1udNzdLEk2RY8ueGxWZXQDO93MXaJDTajfwCcL00Ndx3wlylUSeX30NeIEkZ3wVEBT15ep
 A8epEbSZnjjNd2P7VgEy0e8Qp+qVu6zAuF4GIwwtOZOshdSxyM6rpOvY3N71NS7IS2ZpLH2kJ7L
 dIPr9hKSDR5eA9cYQNyAlbPDR05FixCknh3x1NSyMUCBws7Xd7DO0JhORd/gGknYTDtwuKgN9tp
 c/13CIP8A7ARwlQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: Y2KDkj0I8LNgP2zBYt5W7Xpdw6a8yryM
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX51HtCKZk4UDp
 YxHuxsVXqiSBU/F0GsaInEOwr0JRNpP54poa1dgUderG2X+gIVKGalWAqJemRahmLrqkRA0caNg
 gd/g6GbxcUMNcRI4VyiWPVfgd1f4sI4=
X-Proofpoint-GUID: Y2KDkj0I8LNgP2zBYt5W7Xpdw6a8yryM
X-Authority-Analysis: v=2.4 cv=PN8/P/qC c=1 sm=1 tr=0 ts=6a58cf48 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=vKDqCkOE6BQjc6v61vgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX6bjtljYp046T
 jMlmqHnGaYsUHpZ8D/yUFiMTZXQD7DOfn/k+ngmZMWTFNGuvv2E/9Mcf/I0ZE3YfdA6vSd1jJIb
 hZ12d6d4kv1mbAxyBlzqZeXL3dLtqUBNvpQRJ7ng0XUlhwhiiOn0QTnzcETZeKG6N8bGKWjSURa
 cVcjvq75Wk37M+xFmgyIvx1nHCK2LVFHS6gVhaNzCeyJfT1iElV2STQvCfCEfGxJzHZwCjdVPCS
 v2Q1mgr2FqIXNHH3b+PFLmCs8t2Hb8K6MCnHRSaG3f6vcdGdbC76ceeP0fBtQidkCfjsejk5A5C
 t0vL3qXVaveC4RM6nSjpe2ABxmwarTbacSyvvigvP9iqzosmp3XO0MrdVZb/qjw51yAmLmh2GKm
 3Hiywphhy6JP/8MhKwY8SeZs8TeVvC2YgUPg3ZuabA5wko/ZWL4GIS2RsOxYF6QeHLfNFOHHYm/
 NF57dqefldWj60X3bgw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129

Creating a software node for a given set of properties and adding it to
a platform device can be achieved with a single call to
platform_device_register_full(). There's nothing in this driver that
suggests using the more fine-grained interfaces was intentional so
switch to using the high-level helper.

Acked-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 39 ++++++++++------------------------
 1 file changed, 11 insertions(+), 28 deletions(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index 40896a8544b0a4da4261ea881b1eaed62d93b32b..4ca7ad76f3b9d2b6c455a5d5b37f23a85eb69c69 100644
--- a/drivers/platform/surface/surface_gpe.c
+++ b/drivers/platform/surface/surface_gpe.c
@@ -290,9 +290,9 @@ static struct platform_device *surface_gpe_device;
 
 static int __init surface_gpe_init(void)
 {
+	struct platform_device_info pdevinfo;
 	const struct dmi_system_id *match;
 	struct platform_device *pdev;
-	struct fwnode_handle *fwnode;
 	int status;
 
 	match = dmi_first_match(dmi_lid_device_table);
@@ -305,44 +305,27 @@ static int __init surface_gpe_init(void)
 	if (status)
 		return status;
 
-	fwnode = fwnode_create_software_node(match->driver_data, NULL);
-	if (IS_ERR(fwnode)) {
-		status = PTR_ERR(fwnode);
-		goto err_node;
-	}
-
-	pdev = platform_device_alloc("surface_gpe", PLATFORM_DEVID_NONE);
-	if (!pdev) {
-		status = -ENOMEM;
-		goto err_alloc;
+	pdevinfo = (struct platform_device_info){
+		.name = "surface_gpe",
+		.id = PLATFORM_DEVID_NONE,
+		.properties = match->driver_data,
+	};
+
+	pdev = platform_device_register_full(&pdevinfo);
+	if (IS_ERR(pdev)) {
+		platform_driver_unregister(&surface_gpe_driver);
+		return PTR_ERR(pdev);
 	}
 
-	platform_device_set_fwnode(pdev, fwnode);
-
-	status = platform_device_add(pdev);
-	if (status)
-		goto err_add;
-
 	surface_gpe_device = pdev;
 	return 0;
-
-err_add:
-	platform_device_put(pdev);
-err_alloc:
-	fwnode_remove_software_node(fwnode);
-err_node:
-	platform_driver_unregister(&surface_gpe_driver);
-	return status;
 }
 module_init(surface_gpe_init);
 
 static void __exit surface_gpe_exit(void)
 {
-	struct fwnode_handle *fwnode = surface_gpe_device->dev.fwnode;
-
 	platform_device_unregister(surface_gpe_device);
 	platform_driver_unregister(&surface_gpe_driver);
-	fwnode_remove_software_node(fwnode);
 }
 module_exit(surface_gpe_exit);
 

-- 
2.47.3

