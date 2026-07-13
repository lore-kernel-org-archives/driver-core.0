Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5D3D3750AC
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 15:12:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955546; cv=none; b=efz6rEiXXg9y+JHBlaZDCV5P+aunmcmcOGoiQQqJcZokWhp/RL+xQjJxP1Tdg3Mfpjoqh3CDm6/NeKmvdHH4WyNKNDR4/p43GAfff5nIgP3h/gxzrwOHfaL1STYeYtjjflKisMs+qxUa4QZemEjIwa/zYnB70mTOA1rvLMRXmVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955546; c=relaxed/simple;
	bh=K59bsZsPg0oBc3El4NBYgpsIGFNwewCJ8H6R3I7pL30=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y9CexzaVU/nSj18Aa04kjXcBbvBQR0PkZKndj2Ha5vdZKN5nSH8yGsoZlV4rAZA+hNRMttJkNYXqKIPxpd1qy4jT8iOiHwb9XOdXOoDfKJNOibFQP9kbVAApEot+GiSiugmYOE+2RiwhclpAcAd5QAr3XtMl3riI0Lvg080BsK8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=BOCC5f0U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=fW1DiSwv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="BOCC5f0U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fW1DiSwv"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8A481968322
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 15:12:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8K0JIquvs3cxPSyDd9QX1UWRoa9KdPTnlm5VgT6UzpA=; b=BOCC5f0UeMABLuQp
	/DeFIlYIp1dkCmGgfkTYCYsNLEXzLx+6TaIqcIl515s8AIhWOFmrK9qi5YidC9/X
	J+Mx6zXNaWuvsy2Bn2EHvCBTcZIpE02rGregTh/MoZCdrCvM8pyWnHjD783DGi7E
	cWhX2PYM657cnGCMBOgo8ib2BjV+PYoA7fWe0Fll+9vg+5IqqxbdqOv6WSyoCS6q
	IIn+jNGjhhGYHZSJBU3pmPDyhVWdDlWW0lXDnYYdY/RlALFZHPlMksAG38ypUR5Q
	Sh+B4eCOI5LK9plwzUpJzI8p23QZPidPEXC01VfV8MfImK8kp6kidUu642NJHS9R
	wq9bpw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjn3b6nj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 15:12:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1c7f135bso67642851cf.0
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 08:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783955543; x=1784560343; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8K0JIquvs3cxPSyDd9QX1UWRoa9KdPTnlm5VgT6UzpA=;
        b=fW1DiSwvAFlpvwbiCZlEOtLyC2pt03O/VbXa4ex9+Ie0/RPFQTHE8aLDyNpzdoP/Nr
         hP1/UUCcKCvSaenyJAPte4a4qsLuio69dZ+oiVyzhk2jB0zkT3CHj1ivbGyAB02Srswj
         nz4DfxRbCaT1jfgUweJ+BdQkQLmPZhJBym9agCadrAWxHGmR0eBoBJ6Dpn9W9w05CKMv
         228wGQU5pTOf0F66eXF1n9HdI2PlD7jjY4HMo2gMYJY+LS6YHQXNZX5Z0RBYDmX9It8C
         a/LME6vHoyN4RcmGwLNCrNo3SY53LNPw9FuYgqEKjg+AEqrLq/WWbIdH3VVv0RbgA/40
         rLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955543; x=1784560343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8K0JIquvs3cxPSyDd9QX1UWRoa9KdPTnlm5VgT6UzpA=;
        b=RH0mIzPg238tDjXcgWWgAvEXT/Vq4EFljK9GzVfN1BgB5Rz1CM50IsILdqs5SU6LFZ
         EseISYdPeM0Sbp55m4bHYG474uwypLjqOj5hthquZEbMJSI6SwpHXl0Xkhav4rzOyTWI
         CQIFLr5JW8CM8+KiAJcSX0MZ+NeARtSrKPe7LZkxFrJoztTcb+aWg+xCqhvJM0rUxhA2
         +cH8BazRZxxLlcJOW/N7O/wFwbz0xlhKdmDOVIMINBzWH05PbL6VgOwOg3UPfr99OcKK
         JA18qHhineZt2DbLl/zyTAHpcF4OOgoz9qZxsRvzqscwQEGR8c08aL2OJF9tjtGMYdNW
         xBYg==
X-Forwarded-Encrypted: i=1; AHgh+RrTmXobJcM0+ya1/4YjJaaXrkP+mD5+I5MQ2CFHclfqoFI6dPrhdtfRG2c+hP+9MZugGj6GgDntj+qt2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvfV8cH5tbSF0aWPg2Wmj9QRS2mlWpQDcgH1fu0y0vhSGg3lqB
	EAEFjkFS0Y2R2wzEy7NQuPieJ0VDX3jn+cZsGr9K4E9K1QtY4Akpp3XKU6TtyooGEXxTHfglNnK
	wj3USZRIzHieIzgowlfp69Dxi/hd8e2+CuYfyVgX3vB5u/PtzOztf2V/csqT10x/3YQ==
X-Gm-Gg: AfdE7cmQfklHenV6T+bvmDqlnvC2a24ps66OabgPw64TgbO4u29ikPrAzck4NSy6AgL
	nVwA6PgzsVoMn5PLP8FKwtIiYMlUYTi8Db534YHQytVVlKv9Jab30DyBAGgsmsJQszvWc9DzRQT
	ldZHkjtlPm8W0x8D0+qJCQHEpAclicjTx2FKZXfp5HRsawuohGl3GbP+yclKlHslP5z0CajLDJG
	yDsMtBKK4zqNI5B5nahFs5XoNXKQdzgfpSskFJsdxfYfOWZjZRubHEhgrWTQ27Qy+twlzu/b5Uu
	LOGhhXKzEUBRC9mg0fR6M4fZ/izH/JCbosjPUNIrtYktfm7fGVL9hNy41HRRd8BFOAILl8LSKHw
	tB1nLJdeAfzxATrC4fyWGjVzbKE3IceE4NQFlxD/A
X-Received: by 2002:a05:622a:10d:b0:51b:eb55:2916 with SMTP id d75a77b69052e-51cbf162a37mr95302441cf.34.1783955542546;
        Mon, 13 Jul 2026 08:12:22 -0700 (PDT)
X-Received: by 2002:a05:622a:10d:b0:51b:eb55:2916 with SMTP id d75a77b69052e-51cbf162a37mr95301891cf.34.1783955541957;
        Mon, 13 Jul 2026 08:12:21 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm87956664f8f.27.2026.07.13.08.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:12:20 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:11:58 +0200
Subject: [PATCH v7 2/4] drm/xe/i2c: use
 device_create_managed_software_node()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-remove-on-dev-unreg-v7-2-6d6bc448427a@oss.qualcomm.com>
References: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
In-Reply-To: <20260713-swnode-remove-on-dev-unreg-v7-0-6d6bc448427a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3069;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=K59bsZsPg0oBc3El4NBYgpsIGFNwewCJ8H6R3I7pL30=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVQBLHe90K6lVmtYl/c5igcZli7qp/jrWQWKZt
 nDmast6tViJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalUASwAKCRAFnS7L/zaE
 w9u+D/4rljpC3ahmszRx6QX+sN3PBN42YyT4ut7PwFuo5riz9VlF1xvazJvVY3hozqhuIWxlOtz
 Md9ESdszzAvd9ry6gerI0QURYd5Pu5ZufD/2fJZ9Yh1Q2OjnICBZwmsXuGHtPoyVIPA62doZmCH
 gYMnwWXUrh2G2HXZeszXq7/yrbuOnVW4FiHd4InX54iZ93wcck8ACxvX/WpPc72TFr1kCt19TEi
 ld3BMRR3Cl97tXhUGsYr+KbkCpELBTJHGZ28dquEd5M2BZDM0fGeWCQB3xSjOs8zwHfX4FX0U22
 XQfGMhYnOW75lAO3QEXIhEIPwivnWn7kh11TxvdB9iCVaV0d74Zs3GSk+4yWHQhfsxveaH04iGA
 Qgc6B43zyL5o5/J0FsRTf75X7Jv8YZdJ7W9Oe3uIBSEvEfp8eFOg3CoU5Wr4D5MlElEfXWRL1ai
 jv3K3ciVTZavQ0G8xTkbynioZLTaCO4zzExp2fpoXB3d/z57DwM9OL0pKQkcdeoumhu0QmU5t/h
 e9o30diob7Dq12Bt00bW4YM2eV2iJXSDVDfwTT7HOXfQG7J52fmMQA5lgIkrc8XxCIGW6q0Z1n/
 gL6qtyzAXt5Mfpu0NyYdZSunKhyhX3z6Q4PLn76W3B0Gy3XZV1LObT4A65zPrhge4y9XbO8uOG0
 wNfJxiV0NV2rJiw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX99D7Aul7/uAU
 D+bAYGpnOs++oAvYTKMOcnJCd7KBIeDtI5FSHvAeAbBtRrseA5zdTcGXwWGl2qqwzSSiCfa6wMN
 k1u/1zgNrj9ARRPaahZQcVPiFhj+DwYbVp7CRFGh5U+M97uKIpIbMtZ/JQFfzL0pB9l0fo1XY3o
 0PBEdtIAq0N3lhYGR5EEk2P6wY2krxxgg397J6LaROJ5K866HktDGhk/t5AYEIjBIaLeBDGmbz2
 GPepEB1UOpdFG8m5y7vgKFc/s8OzNysdJ3OnE0j3zQHZWvXIyyokcowOL/CwxdaPViX3StfHidh
 pehrjxQKR9g5Cvi/zmjGpCHlH8DSs91yy/XXVBnAC4aP5RWqf8h50qT0tqX7Fy0yjC/vnpvfYkp
 ICqC28YHd9/U0lT3+JIKbZWagjGQPPwcL1T8eApEOO2bF19wzP2DLf8WfE+V6TFqZ3Lbtgr2ZCT
 8KRhebJJXZ2ehISTqeA==
X-Proofpoint-ORIG-GUID: 10DjF6FMHifdtpr1by263wgRIcMgPhLo
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX1bC3Wpz2CW/I
 ArfeOnSaI7xL2UXxNDa22lxkKN1qviZKQ7oW53ejk56JcnpPe9v5pv6uQyNrKgARyeTVAJ07XVy
 IhV4yy2mb3o8mj3Vz1KkL+QZmXGzkdk=
X-Proofpoint-GUID: 10DjF6FMHifdtpr1by263wgRIcMgPhLo
X-Authority-Analysis: v=2.4 cv=aaJRWxot c=1 sm=1 tr=0 ts=6a550057 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=CQ4qV2wi1td1G5PDrAEA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 malwarescore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130158

This driver intentionally uses the fine-grained approach to creating
platform devices. It assigns a software node as the primary firmware
node of the device it creates. Ahead of improving the reference counting
of platform device software nodes, switch to using
device_create_managed_software_node(). This way, we create a dynamic
software node whose life-time is tied to the device to which it's
assigned.

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

