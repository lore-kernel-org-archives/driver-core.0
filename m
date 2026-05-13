Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E31C47D951
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 15:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778684729; cv=none; b=mUGlkDbPo9HVHV3JakAVC1PzPxD0NwaOz24hEVZUwRCZUu6UXbIEC44rh40uFHCiMcruq/mqfsjVHqdZse7DKZ9u4PYbSVpvYnrXp/jWmFEpPjwKOTNRf4dlE/0AFntzbrr5W0lubXAThg3vDTGnjXvSnJEBY47Q41g3IM8kjNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778684729; c=relaxed/simple;
	bh=r5CorKpog6XK7Xw7AuHmiWjyB7Vw/HEf5JCJbVrapGo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FXSl94k5HpcXHKug5SGacaMFYV5AY609LK0x2qacHlXipLm/vpY0KIxDmW2RtStTXOb3wmBRC77r/OPvekXVqPOq7Rx7SKEOrgdOOwzhDvIUWg5dqXkic/THJWVtGPSrAbQSD7hlY6iOmU3Ch97QL4F+tJ4kB+dvyZwBmL2fGvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jjREzhdY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SOqIT4GL; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jjREzhdY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SOqIT4GL"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64DCU60p2965303
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 15:05:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZ7Vcm/EN9v/uD2FdliZJtDXsSCe0ecblDQ1EGsR2pc=; b=jjREzhdYcb6VMRDW
	G+ocrXt1WcQle1bA+brk7Wxm8ClbOhn7+U3wGMUH+OVNAWgEK0s9k7/u23yLWp/T
	RVym+iK3PAoAVY78FwDOnqD7wWCFFGjHeUPdjAV31HymQdLGvgV91zbeR3NQfuvR
	gvTe7EdwlaQ64Wsg+NTGYeCRfVD2x9TbMXeP6z3neJDaPulHTS03/P6Z/VUKCMxy
	R6Ax7yoRrxQMEZAHP3L4dMRoZG+NtCir+YYAxH/VyC1TqNePT8M01ohXuN7ZUzu+
	hxjjVC4doAGWcN//vEKlSY0Hi8A9QpX+j6bK3ON3+5/WdTFC/J/+iIzKg91Se2vR
	9eaM9g==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e4ma59yhd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 13 May 2026 15:05:26 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-439a7f1b8abso3975022fac.1
        for <driver-core@lists.linux.dev>; Wed, 13 May 2026 08:05:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778684726; x=1779289526; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zZ7Vcm/EN9v/uD2FdliZJtDXsSCe0ecblDQ1EGsR2pc=;
        b=SOqIT4GLR5CP37XtGyNmrALSSXIOqRlTA10AP2NThmFgcD4sQrGnnGeZ4yaw+81Agu
         oritRIogzjPx/E5p1E7ZdYZPOaqbuQe0yr+eAeXwXZnfiTWIwNN62kMBUBl84/KG4h/R
         9RBqUTk79UI1qyCGYYKOTs1iEGXj2feQGsl32vqQVGcrRfaU9asfYwyGkbNFWbPT/Bxv
         GHKiOOH++joFP2pRdZc4peNp4D61MU889ufHKtX2iRUdIyxooMnQ+cFP72+Ng3nBw6em
         1f/x+P7hOCaFQDkW9By1teFOstm+AZ+/+htVeHymOEVHtad2xoYyUoQ+EjXF7oJUXVn+
         IOdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778684726; x=1779289526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zZ7Vcm/EN9v/uD2FdliZJtDXsSCe0ecblDQ1EGsR2pc=;
        b=P35F8QLENufKmw9js21lO4ipMjZ+ODVHFdSqlVLa7YBiYKaPEfxULVwN9YuZ1sg/pv
         B9ncfNb59/84G5F1fS+DRrGUoPBdYYqlir2ZbEh5s08lvKmrCG5yIkVsOcQ0xWOPrzYM
         mMJ6b3u8RwdqtcE9FEq9qddjEVv8Voskfyht1NdW/RQKsMoYhSCfz5rmCfFNTsRrjRR2
         x3p2XH/FuGyJUntLLRC7Yv4sbh+9DkS7ZgJP/uiBV6DL1uRcPM302Nz4Pi5V+IBV50Dj
         jcUTh1+nVb2dcqpnh7jN/B4v1oFi3lE9ivzwMdeyR31qheZnYF9Upc4j2M9W8WvW0pfg
         IVbw==
X-Forwarded-Encrypted: i=1; AFNElJ9qeHLUPko56tzW8me+iYY1dN5gRIVFYnJQqQmoJGP8y6bujuUYj7gGppubpweGWkALgw4RpyOc779RzQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrcnJ03ORb518WOKcEp9f1mfI+REEGqvXWuNIH4sE25BIyc0fA
	aqr8mIewHjwcHQZvp+t9a7EX8G4dlrNqhQ30NRseSimXbH3BH6H/lNyDMS0vBO60Jdcf+/H6StN
	tn2XRzIkoOgtCNH+uU1uUt1Dw1ud7cuzWu9AD8C/OVWMencL1GRv2rbazWSze53lNcQ==
X-Gm-Gg: Acq92OGO1N8Ctc8Gy9WBWO5VaD42GAj4RIMlrSPbiu//2AGLLhkDjq9QAh/yzK82id6
	gc8CgSYbNwnQAIOc2ICbHj9Qkja7j2XshNJ7c7xb1KhDXDDdM4TIKQVHUo3L11RA0l7CvJgaYms
	gKEgI16V9upnePrdTPDaSCJPFU0Qhwx9gh+GKFlKDWl5GIW4mWxBq1jrLf1NDBtfOtcwDYfI93u
	U/5Dt+M7A5hQtyoQ3JGdA8X/Jpdr1JqnS+LkXuTc0l7W4j+2KgfOESmDeLyhx+76AinsJmWlZAY
	qonfjKcd/8QpvsqhgMAlWizRtzUQNwWpVOMyV9ZJ5m+qWYRP66dNSbjrebngKAY1/8CjDvON/Hk
	WKJz5GqmZeeg0jmnwiKWWYn41zA9yqM9upop8nd3lAWwyFcEA8Q==
X-Received: by 2002:a4a:e649:0:b0:694:96ea:dc7c with SMTP id 006d021491bc7-69b6788d9fbmr3446738eaf.38.1778684725998;
        Wed, 13 May 2026 08:05:25 -0700 (PDT)
X-Received: by 2002:a4a:e649:0:b0:694:96ea:dc7c with SMTP id 006d021491bc7-69b6788d9fbmr3446719eaf.38.1778684725508;
        Wed, 13 May 2026 08:05:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:63ec:4acc:c4f6:423])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e8f542e56sm43216455e9.34.2026.05.13.08.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 08:05:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 13 May 2026 17:04:50 +0200
Subject: [PATCH v6 3/6] drm/xe/i2c: use
 device_create_managed_software_node()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260513-swnode-remove-on-dev-unreg-v6-3-f9c58939df27@oss.qualcomm.com>
References: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
In-Reply-To: <20260513-swnode-remove-on-dev-unreg-v6-0-f9c58939df27@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Brendan Higgins <brendan.higgins@linux.dev>,
        David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>,
        Andy Shevchenko <andy@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Matthew Brost <matthew.brost@intel.com>,
        =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com,
        platform-driver-x86@vger.kernel.org, intel-xe@lists.freedesktop.org,
        dri-devel@lists.freedesktop.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3054;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=r5CorKpog6XK7Xw7AuHmiWjyB7Vw/HEf5JCJbVrapGo=;
 b=owEBbAKT/ZANAwAKAQWdLsv/NoTDAcsmYgBqBJMmq9JW0v7kRFlCKa3cQX1e7fyvU+j31gEFo
 GPWtnshMziJAjIEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagSTJgAKCRAFnS7L/zaE
 w0kcD/j2A0ewkNS2bCevVPmTc7c9OKJ+dLjh+eBcqW93BRugn0nF19BZeEPkdpJ4d8JfXxJOl2R
 0yRABxbWvBbxIAvu5Ciq0Q/lk32XMa6eIgh9i+LRRwbdDc7j4i3L8TQVUz1e/OtOJI3UuAEx8Hf
 5IW8XAZDv2Unf9peA+4En+gRC9RdwpQ1GRG49SGchp6jLdr64eWzMpf1kz8WQQbuTfZGPcq2ZRT
 9WmLXhdT8d7rwlOPBCkaQADhzAcNNOJDAdv+PPXi6P7nH0NObPzaYPBiSbKG/c1fo3OZT6hTDUI
 f2TMra/TKercmXMDbU96CPWQJunrpCUNvQsvD0y9yWpDo3F5S4yE2vjeYQBd3EdBOCcHtEHjX40
 TVsIMjUcQbKJAQdGI0Q8UP5BQoCYOGn1rUFBqRQROZ2D4UOyLzAiPQHqN6sKbAvHrT8xSxUOrRi
 IvDG2wJbh0FzEW4RtFzrEqwBiOotHHKQ03U8da25RuETsDGT/vEMmw1/Ua4JuNVPtC7DIsJvVWB
 zCtYAHUcHDnJ3CP7KR/wIJFcozrxpsLv8fX745KgB25rR8Zlg5i19BqJhRlEOLoIJg6pbkzXepT
 WLDnxY0wJWesAgedGNBSuY2MBYkfToT7EPADVSY9o30rdCXsBTr4c5QeYu4cGDyVAbq92CJVCDU
 9ZFoM9pKhvtc4
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEzMDE1NCBTYWx0ZWRfXxrvWh0KIcdE9
 bLS6/dBHOS/6ry90k1tSlrs9FwpT4Li4AY8L/WTUiyo8k6Yfqrq6TV3SSvTB3a63ZHFQw8URHKI
 l64HG3W1BR4ZfebTuNxSzCNDFVhLywYqD+yxpWOfMKPgbT8HsHuoNaBq7sldsj4fAtkwFyTQkIi
 zl7vplMKnSlhf68kqbKUM041YIcG0vIeiez4g+bX509IcaPKVzsbnfiLM8YJboMa4QX9A3D5Abs
 3TuUq9yLjmRhtAZlO1/6jX5W23wO0n8ioOTTUdikUiFOew5VNRqLR93TvGDcADgvM09vJAYY2e1
 Nq+72RQy8CmDML8JVZ/VHSQTlw+YyIoYsrSwfBSherxnZJTef/Of0OhZ+G4mcsHu1ndId2vz0+P
 4DBcoXMue/oZRcfu0kdcwVkvpLUsW5aATtaFKeLnIF32ig2dOcSzh9lfvJwTLKUMPq+t2F7TkKw
 5D5c4c05E74Q23aNfZg==
X-Proofpoint-ORIG-GUID: o-ivwBDxI79ZOUMA26n6tEuog-NwatV9
X-Authority-Analysis: v=2.4 cv=TJZ1jVla c=1 sm=1 tr=0 ts=6a049337 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=CQ4qV2wi1td1G5PDrAEA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
X-Proofpoint-GUID: o-ivwBDxI79ZOUMA26n6tEuog-NwatV9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-13_01,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605130154

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
index 706783863d07d66b4685005d6649b3cd143ecc3b..5b0026bdb1c609bac12cfa1453c685846f3b731b 100644
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
-	pdev->dev.fwnode = fwnode;
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

