Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E1C382361
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784205128; cv=none; b=Kn45nosK4DE0o/22Y4veyeaLSMm32NvU0gk4WpVSnQkwMJQfBCTt8jPQdv5J13ZMas/hsCFM/lHqX8OqnTS20YSiXGLF/lqN9VI4Su430KTifLdllnFgMNva4GT8PB1UhBEBD7r7KvRrKyQr9ZKF5DfQONIAngZU8t7N4X6NE9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784205128; c=relaxed/simple;
	bh=N9AP3SYxejXwZhikmnovuItOtHN2XBZf83KApz5NXJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QDCWeromnAMYxYur/pemJfIGNfSDjNfi3m68ccIk8h6EAbFPFJn8MriE++9dHIsDmrMoqMlAGHMgmBd06bRZuC9xgw6lALLdgOOAAwrQnaMUglAFHTURblrqvPLGBYZUfFQ+Xn5HK9RONhjeZIuKceN+afrADS+s1IUrqp4oBZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=d+Kww1pD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NDgtUyjM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="d+Kww1pD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NDgtUyjM"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66GBjBUj2506762
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3y0IvySJBouPRgIKjp+IRovT+WNJHA9QwSsnhwUAWFA=; b=d+Kww1pDbw8BsEPL
	G38+XoN8euPnjzHPwfhBUXjniQCm2z1F09uU2lG/WiYjHy3Mk5sRVLfeFGQM/5j6
	Lw4nkGpegPpQ0y7OZMlJdbDwoAYBTLLYjSX2acswSGc0bo8IcC4r5McqdPshTD8k
	FF4NMAtEUlixWJA66e4PhyCEW03+LoyIERhx+EMuyLMjsiFItgkKItvZH3dj9ONp
	H32KgxRSdow0HZbKLEa7vnpMEHE1lrTE6yZy8TEA/YJxh9Oliyd9LyJTB+t24Pm9
	wzhbmi+D/HurAmNTeAM/fb8SuryK9TAq2ytVVl+cYR1oWcCsB1hME60a2ttblZXx
	wlWPZw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4feehvbsde-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:32:04 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c1a9764f0so82484341cf.1
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 05:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784205124; x=1784809924; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3y0IvySJBouPRgIKjp+IRovT+WNJHA9QwSsnhwUAWFA=;
        b=NDgtUyjM4KLyO8IL29GCOIEdLGtWPMwbaxc92NF5WmdHLlEBlcDY48c4dxlN5rG1Pr
         s7J0iFIRoPz95Oe/hAnT2pbpJBrWtJi6qzM5Z0TSIiaQrc+6/TwYTCrHTL2QZ8n+9fLX
         p438KrLuS6JW9BHyPFNtWiXht+djbDTfY+qgP0mKyt2gEL+9hdlCf37qhS7IGXRz3mmx
         BUuRaYkRHRBKA3m7xDsfy9EkRbLBPo9dcIoxu3uIzBUUqJEtGLT3R9TwvV/vLcdT104v
         r2HraSo5+NAG2CctOao/9Mum7cFkKnwDi6ixfC4qOcrEdypCtK0HrHVArkZVGCxsYzDy
         0w6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784205124; x=1784809924;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3y0IvySJBouPRgIKjp+IRovT+WNJHA9QwSsnhwUAWFA=;
        b=ZneIaQ8R5tqpstI0KkCFUaee0YnUGHHTcwBln+0Oecj3Xia1MdFdRiXn2DA2JOafnF
         plKNZxHzBd7Iu/mrsOWIlonDhaE8V6p4eV8xtED4W5XqnCetXqW9q1t1licub0LKY7U5
         qjrQlgjCsHJsXD9D2FINasUiuroVPFA+vCMnxDLxoNRCgUs62C48YqEAeKcRxYibSUAj
         uLTMYnJb3iv3Wqnfg0JwtieNJmP7Dd+n2dr0LWiaIPcIGb3b/cINvojW/4MDcun1cuiw
         3ezeP0rfDq4fnJzFRoAvblYO/BZ8vhhxT6XUxZykKQ07y1oZjgWwiaIAYakSoUsnhUAb
         04QQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqx1DDk/42w3RgIMOy0UY1C+HDNm5vvbNFnKqy3b7g4cpSP3IGW6HCiOYRFX/i/NIwNvpB7ALozvgcKoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxHD6XU5UmC2zzNFdXLQDKcFyXi9deRjazxE1YtZn3J9/kR7U3I
	H2nM1YOpjvZ9/67lFkNELJmTOE1V3ApuiQBGXmcmcVbGYzh24txkZq6lI5se8YNXbsf2vLIeKNH
	eIgKxFmJBj0GGUuo6qrk/v0BUM8X9Ef81alATvzYQP3HFGU29Qld2V5SY/PL2TFUVyw==
X-Gm-Gg: AfdE7cl1aWpLoJAkDMHekIUhTPp1+Pvp33r9BljPtjdBkRgDpt3DeuF+s5/3jRHhHQv
	6h3fkhnCRImvXhQ/xHs9Wy0kxIAc3t/Ic5IJKMCPT1LRU68GdqZLIDgJO3rvUgjHBqJaoFtGwg+
	SRyyCg8A1YV4WV2NdspyZoEbV+rK30+gnuF2PTf4DhNPzN3/mkE9td4O4CgmCKaVfWGml4xlNE/
	7zidGhLwXOjd9o2He1JE7jupI2nJo7Rku0tWxCEXiL9SsxULwCtUM7wJ90AzGN7l125xJ9rEs5y
	aFptqmW9MZAI+6F6xG3Ok9Oc3XafzxIl1zv4kLaFSfePxNmtOw9bxaWzcnUEBBJqrtytUvWTsAz
	Y38xyeQMxVjR7WQ55zs+XWNgFkR4=
X-Received: by 2002:a05:622a:5c0b:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51cbf24a901mr225502141cf.39.1784205124064;
        Thu, 16 Jul 2026 05:32:04 -0700 (PDT)
X-Received: by 2002:a05:622a:5c0b:b0:51c:7d0:7ed7 with SMTP id d75a77b69052e-51cbf24a901mr225501391cf.39.1784205123470;
        Thu, 16 Jul 2026 05:32:03 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:76f:d108:485:5b34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c7c96sm23766635f8f.33.2026.07.16.05.32.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 05:32:02 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 16 Jul 2026 14:31:38 +0200
Subject: [PATCH v8 3/5] drm/xe/i2c: use
 device_create_managed_software_node()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260716-swnode-remove-on-dev-unreg-v8-3-5c2b8cc38c28@oss.qualcomm.com>
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
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3182;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=N9AP3SYxejXwZhikmnovuItOtHN2XBZf83KApz5NXJs=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqWM84B4CZo/dOB2syOtU64FTk1R5pO8s/CZfq9
 KDb7tFbYReJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaljPOAAKCRAFnS7L/zaE
 w4uvD/4unAYN6h4orRS4Qx06lB5hF5W4abKelOlO+kea/N2ACPE1RjvtENYOim1DuqF1YYahceW
 0o/eeFpQVa+J5C3TuanVNe/pFfVPQGJmYinHXmdyzRT5OOFOkXtXB/TaFB0VNm3/sTYZQEtHTVE
 LdTtmW9sv43I978VkwcnpTqLvYd4mpgDTc40WpsbyRQCOkfb53h0gEroKzx9BRon86KnLiE3IJc
 wzoFo4yUOgEC6Lk/93fRpgaiBUN4wn2mzTTOGfE90abwQKNwh6U/Di0mGXnZOrMH3WW4Z7O0YHB
 woTuI6jlG9jzMJ3S+Bbr742Zyhwc7kxNA0aCmoKHkXF4bgYsTE+unyMIif8MQgP6/MhqLzuIfCR
 QLUxvf1+Ck6LtuSGuSFed5i9NiN5S7FJhgNh9qjOLlQP3LG/E2QsGaJkLNNOV/p2bbwXPlnU4+2
 lm17JZs9+5gQfVQ22itFzbErCzxV2THEmdjnCtkDI3vhjBwUsFCHMGlEY3iW9y7Azb8N7i8/JHL
 LSlPUnEdU9c0iBZj1AkO3Uedtoeuu1cv8T8WPgW41si1nD3+e28cK6HNkQXjPjs/Sb9/1lukAOV
 w+EKBHvo4kOcfVX/PdQwR5zepm2AhvHCXWSPOLnsUplcyLGcF4SjUxw+1pCmZqGuMgtrp1phMVD
 rKvLJIPfewBDYjg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=ZpDd7d7G c=1 sm=1 tr=0 ts=6a58cf45 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=QyXUC8HyAAAA:8
 a=EUspDBNiAAAA:8 a=djUoAwcJM79xP0FpthAA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX7CzmcsM9weaA
 AvQXNn7HlTMv5Lqq7L+IcYGjMh/DIkQ1Pam6MvlNUXyLstHB81UJDPNORDB67NR8+JBn+vgvvke
 2v1ZY9f+EtwVbSyuj3HSCPtUVNv2zJcQaitC4W6oQGhz6dGCwh2EkLOzpYs5Wa10gQXwUccDV+G
 88uvgY91g9NR1o03G7DzoeIO3uk+X4SIGAapJ+aa0b/unEAjH469zNi+d7hZxiAcdA2z7xnuwXZ
 roiOHlkYGz7sVVmz6qdITvgPNAlMBx5q8TF9i50dxQUP8kUIqA6zjO9OjpOnHyEXVmMwd+SKiLf
 3hFlVpN8Z/JKn+Dle7tqgib3UvMbfTIDuW2j/k9PF2y9M8h1IHIoIQlYh6EgdxRmf1u9XmuN/wa
 lMB3rYdKhySi25HHkg+BSxxTf4tGsO0569ARbiy6zqjJP3NXfIKEMlbCmnFVjl76RRzg85wtsd7
 5GjMkXLbTkyQfdYrbag==
X-Proofpoint-GUID: K_E6ltJB-XE147e7FsGubgm7Z4DO7w3y
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDEyOSBTYWx0ZWRfX+qM9VhdHX9KF
 AgGWiXRJqLEAzx88p1dRZaQGrSNoWjg223/ok1Ui2StxZaaBykjOuSZXE1jdASWLV0V7TxnjKtP
 irONGbjl+aU0KHdMongE+cuGX+U8eOY=
X-Proofpoint-ORIG-GUID: K_E6ltJB-XE147e7FsGubgm7Z4DO7w3y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_04,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 adultscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607160129

This driver intentionally uses the fine-grained approach to creating
platform devices. It assigns a software node as the primary firmware
node of the device it creates. Ahead of improving the reference counting
of platform device software nodes, switch to using
device_create_managed_software_node(). This way, we create a dynamic
software node whose life-time is tied to the device to which it's
assigned.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpu/drm/xe/xe_i2c.c | 22 ++++++++--------------
 drivers/gpu/drm/xe/xe_i2c.h |  1 -
 2 files changed, 8 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_i2c.c b/drivers/gpu/drm/xe/xe_i2c.c
index 3d80eafb9a1318996d10db11e14af4cfde07ba55..af6e973e5e68125a9c006bb646447ca6e377a6e6 100644
--- a/drivers/gpu/drm/xe/xe_i2c.c
+++ b/drivers/gpu/drm/xe/xe_i2c.c
@@ -93,13 +93,8 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 {
 	struct pci_dev *pci = to_pci_dev(i2c->drm_dev);
 	struct platform_device *pdev;
-	struct fwnode_handle *fwnode;
 	int ret;
 
-	fwnode = fwnode_create_software_node(xe_i2c_adapter_properties, NULL);
-	if (IS_ERR(fwnode))
-		return PTR_ERR(fwnode);
-
 	/*
 	 * Not using platform_device_register_full() here because we don't have
 	 * a handle to the platform_device before it returns. xe_i2c_notifier()
@@ -107,10 +102,14 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	 * platform_device_register_full() is done.
 	 */
 	pdev = platform_device_alloc(adapter_name, pci_dev_id(pci));
-	if (!pdev) {
-		ret = -ENOMEM;
-		goto err_fwnode_remove;
-	}
+	if (!pdev)
+		return -ENOMEM;
+
+	ret = device_create_managed_software_node(&pdev->dev,
+						  xe_i2c_adapter_properties,
+						  NULL);
+	if (ret)
+		goto err_pdev_put;
 
 	if (i2c->adapter_irq) {
 		struct resource res;
@@ -123,8 +122,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 	}
 
 	pdev->dev.parent = i2c->drm_dev;
-	platform_device_set_fwnode(pdev, fwnode);
-	i2c->adapter_node = fwnode;
 	i2c->pdev = pdev;
 
 	ret = platform_device_add(pdev);
@@ -135,8 +132,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 
 err_pdev_put:
 	platform_device_put(pdev);
-err_fwnode_remove:
-	fwnode_remove_software_node(fwnode);
 
 	return ret;
 }
@@ -144,7 +139,6 @@ static int xe_i2c_register_adapter(struct xe_i2c *i2c)
 static void xe_i2c_unregister_adapter(struct xe_i2c *i2c)
 {
 	platform_device_unregister(i2c->pdev);
-	fwnode_remove_software_node(i2c->adapter_node);
 }
 
 /**
diff --git a/drivers/gpu/drm/xe/xe_i2c.h b/drivers/gpu/drm/xe/xe_i2c.h
index 425d8160835f4648891ff75f2a9c06284241710e..b28229f056c5a664e1d41dc0cc1978782fe1c2f1 100644
--- a/drivers/gpu/drm/xe/xe_i2c.h
+++ b/drivers/gpu/drm/xe/xe_i2c.h
@@ -30,7 +30,6 @@ struct xe_i2c_endpoint {
 };
 
 struct xe_i2c {
-	struct fwnode_handle *adapter_node;
 	struct platform_device *pdev;
 	struct i2c_adapter *adapter;
 	struct i2c_client *client[XE_I2C_MAX_CLIENTS];

-- 
2.47.3

