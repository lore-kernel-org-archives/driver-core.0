Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90A44395AC2
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 11:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778587196; cv=none; b=aCdYMBylSAC7LVCuW3x0DWzLAUM4zQn9lB3LcGp1EjqmPY2AX1wAnWkj3xT0QX15LDWuCBZSTmDFdie1/JvYYvHvUMecRYJfnPgApoZ3GJV61Sn51QYJCk0x7N2VSQlFRU66qBHtKzNp+WJz2tTbiVdmvEFPZQillQeMjaewQhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778587196; c=relaxed/simple;
	bh=8YXXx+c7Bfn1zIL1XiDsFM7WtZrjadc3NSaS7UHHFkI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TY2KzDb0AmwW1SnWyNM9FnzK+DdJuHwAgtWI3LZPTY5zF3P8n6fAQSwf5lyYDJf49x6Q5CVlzB/UPOX4xY7nY3cYgv8pzFkSQshJlPQ/Aw2KkvCZUSqlmAby/4UwI6tjQD8NZJpsKRH9EmYqkoxpOrPhmhSji9TSTAUFHjMoIh8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H2s8KL6W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=hLmtsBtn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H2s8KL6W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hLmtsBtn"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64CB6ood2121537
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 11:59:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cgh4QSLn17J1vANVwWglRn08I0SloVcQwiRt7QECtys=; b=H2s8KL6WZl+HFXeA
	XKXCPqgcchtf+ePN5Z7AkIi2zb3bRBytaZ3m10tT4k0iSaxH9O9jgTWcGyu5wRBz
	1VK35Oe4bAPHYnk80bV5mzBRUlRffJLtnnh0zZ8pdVAUymFaz26JyJBakoq0QXMU
	QlWccZTAc8gImxNaQ4XyiQUveLe9qo3mxARjlpDUxeOv6d44DbwlJ8fSM3SuZX1a
	Z9VeD1/2BVLJDKgbekMlbbZGFXMH7TK3UvAaoOrqSMrUDFmOhijobRauKUF5ezXE
	oWIcZTB94JtX9bJvmg6qOl2kmZs2+xOdVdCWibyYcL1uTHBfbs6ZJGjEAbN7bWHt
	OaAOcQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e3nv2ar5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 11:59:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-514b5d6bb45so16168141cf.2
        for <driver-core@lists.linux.dev>; Tue, 12 May 2026 04:59:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778587194; x=1779191994; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cgh4QSLn17J1vANVwWglRn08I0SloVcQwiRt7QECtys=;
        b=hLmtsBtnXV35ZOicC/bXMVgYWRv05fOPcLq50KPMVOeH5IGuYne76hs+tuQAnAoPMP
         xdQyWI/nBoHdKpzM2p7rQcYAUcDTymKwcD5Ww7o8dDtWYAf/yva9rmx/iYoGp7wz2fxq
         i4exMxqhtlqRNvQtlDYZmlj7nR0cqqOOTZJ2d0taCVcGqlBIaWTqvjVX6lrtAyeRXGgQ
         u4zYcnrvGTAuRhbdw5NPHQgjpjtlVskXL+X7yFxHWbGs4KqbPHmV2rHmqYvPBiT9ze9o
         +9aNu4EdXMPrxQqNNwSjqMJjo868t0ANzk6krbFDUrZCo/wnkl3Xi88Jj4BEA3PH4qa7
         jxnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778587194; x=1779191994;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cgh4QSLn17J1vANVwWglRn08I0SloVcQwiRt7QECtys=;
        b=ZzXKkNwepyBvXyJWT7TZi6/7yawnZ5dzKmGKIBEbI4GJ1WHH3FlQer1GLrj2tXTU7S
         oOkiAuGiCEeGMvQoLkNVzJnL3jnZtoOg5iOF6V2N2aggcgsKk7LaBmCXkc6P5rPevMeE
         Z/ziLEQNzxIOQ+JAZDTYVI0OxZaHqMTZx5z9uC2pHU1bKbEzrvRCkClhNPA2PV6/JpVQ
         h/T0Sf8xF25WZ+aLiYCPms0Nuz/esYSnX/8KSV4nyJ+CPPsX0fssKz8TphbkXAvp4AAl
         nr/9oyot7l2yeYojR8WH7wslXpaYZFFdk4H39FrWPAl8mwGvWRHwDO7NKlAob+kbN+P+
         Iymw==
X-Forwarded-Encrypted: i=1; AFNElJ86qvmnwVVTgVuDfq75aeqcVtPPKhk5/98jXoIFgyiDcstiDZtk08tw9784Zm+kFkY9i1gmYQHhZkaAsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzR18TBW6v6GQQTBkyIxDDAF92gIa8LyitVJsXYwkKGy9eR3qI9
	k5mFZMONE9WrMxjcE6hB3MLi5o/2n3nDa0Ss83fZQ9pGkriSIeXhLOuLUgOC5gEYhwfs0o4v0cp
	WS1eXJuJBayASwGGAGowG5HT+TOgjRpbN2A7mCGRBnu6v/YMzAFUkWlw5IOs29jWkDcyc/I7VuQ
	==
X-Gm-Gg: Acq92OEYAISS9T7bHOQFosAXigNz4J9Kzz4pjl3gHaVtsDrkzqj+Fdcop36DSEJuNWg
	sTj7rH+pKJl61MygqDjFHuo1Ly+MMf+34p0IjfGX+GJE1h5wwAq5/S1EEJr4ZSDveBIjRr04uHK
	mFMZcxgNrxhNNaSupXzSDE+uAZsdeBh++bYsuMYzTm6EGOscu3zXQ5gjWCWdIy/djS+xEztYKnC
	fHPs3l8nuTIyg+vpXnzvKLqEIGQuHIETOSQQkZKV59VxLFSenlARcWI/n7PReAnfnKeKeqD/l0G
	7rsGMSFAhCdmS24cL0MDw1fMFzPA2LEs6pOqnwdBknUH5oeusrzp95hQcKNC3d3k0xArHxqRjH0
	RrB3VfXTj7wOk7wUN1splpTxzgyOFgI6c4GyIKoXc32xNwkFsfSQ=
X-Received: by 2002:a05:622a:388:b0:50f:135d:9508 with SMTP id d75a77b69052e-514d225c22amr37873271cf.55.1778587193946;
        Tue, 12 May 2026 04:59:53 -0700 (PDT)
X-Received: by 2002:a05:622a:388:b0:50f:135d:9508 with SMTP id d75a77b69052e-514d225c22amr37872951cf.55.1778587193505;
        Tue, 12 May 2026 04:59:53 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:74a7:1c82:3f14:b431])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e9067811dsm73933355e9.9.2026.05.12.04.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 04:59:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Tue, 12 May 2026 13:59:23 +0200
Subject: [PATCH v5 1/7] platform/surface: gpe: use
 platform_device_register_full()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260512-swnode-remove-on-dev-unreg-v5-1-0035eff63812@oss.qualcomm.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2217;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=8YXXx+c7Bfn1zIL1XiDsFM7WtZrjadc3NSaS7UHHFkI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqAxYtcXF6G/xuyy8RtzElKbdbTBCAfD+hSfb4t
 0KxvO28gjyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCagMWLQAKCRAFnS7L/zaE
 w9yxD/wIWDQ8zdf046svG3gh5zyszGE0IvUtkRLErbl5T1mDwUk27Xj+Cl1PJQGfe1dUeM0Mr2F
 TAzUuFEXRTFbQTH6Z8ryvlpOlwsLgeNzJFf4ocozKHuVN+QAf5JziOPwC+6HhyXRjYY59LVgAvq
 JDckPBkta6Qm/k5cuLcwCj2/4bGhlcmPjITx+N7al6zVeAchlVBYhBZrx0+XQOPnphz+yg8iKnK
 dwcPzEyOPIq09ktmVw8p1IFzBWj2tgZe9X/vWzBfW2UBVQy/HAVRPx0vwhzH2RZx6Nk9a4kpWCT
 /UNAPFfzf/ELEOyQ84wHrpgeKlnmMtvblYksAqCfJZb+5uLd7vYo1+w8XtgQbAIcOk/iIz3EM3R
 fPUrE5EZxgd0thEWW4pSjLu53reA55ZDY/zccIRLrS4EY+gti8vXbMx6AD07BS41s71F+wYXmbh
 CDs7uLHF74wBANoKRTqqJWMPjsVtWBWHj8RpzmlnCVNCmfqySgdO3upQYbzYAjQOqE7W4DQqD2r
 7upy1d70M96ahVCNlnIzh7LrKi7avXRM4nrYFAZuf7IfnNeNi5IESLkvCKnPOIzs4R/YhpTTsgH
 1NMawU77ISaubzBsHHMTzsOFrdJA9B9KPlq4LkiR/YZ0XRixU+fftXYa84Jcgdtolkkv056cYgL
 UJa4iUJAnqGU4NQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: hthquj-YxkI5f_S_0teNWEUGiDJQSJfP
X-Authority-Analysis: v=2.4 cv=Mv9iLWae c=1 sm=1 tr=0 ts=6a03163a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vKDqCkOE6BQjc6v61vgA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: hthquj-YxkI5f_S_0teNWEUGiDJQSJfP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTEyMDEyNCBTYWx0ZWRfXxZTG4oEtNUDv
 ukiSX9kcOL46oa8XK2qkS0bjWAw41kT61P48e6HLmr8vuQUtkSFPowuLErqL1CZswryE2TIJHgq
 hcrTiw0Mjvm5qp6g2UEj33Cuzy0G781OwzDyjnUw5qG7TgPdoLEHZITGSTdOqoHDe7DERJTqz5E
 J6ubRgtTOviCyLcAiL8iCoC/0dW1gBgsCzuzvBwIEGuU5NG7nR0/9zxkQxdH/+UxO47MdCx3+0O
 PwNjCIL07FSbE8i35Wq32yk61iVqP1QARbirIpXEGmSlxexoEB8iaS/CHYhDNVVYNeNGErcHWto
 7Bva5pQmg0pNJqizj1nnhhqzY6LUJ0xcGgQGZWvvBlnzYyUUkmJI0Gn3CF9hEsdBOY9WN12Jv3V
 sg3kqtQ9S19t6aBB7FBH2yzTbEByPsvuipK12u/cpU7i01XkqypTV9tpnQqjQA09OZ0QJ5/5azF
 pbT8yM+g5l05TB1wZwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_05,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 phishscore=0 spamscore=0 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605050000 definitions=main-2605120124

Creating a software node for a given set of properties and adding it to
a platform device can be achieved with a single call to
platform_device_register_full(). There's nothing in this driver that
suggests using the more fine-grained interfaces was intentional so
switch to using the high-level helper.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/surface/surface_gpe.c | 36 +++++++++++-----------------------
 1 file changed, 11 insertions(+), 25 deletions(-)

diff --git a/drivers/platform/surface/surface_gpe.c b/drivers/platform/surface/surface_gpe.c
index b359413903b13c4f8e8b284ef7ae6f6db3f47d72..b8bb47b0d91f036ee5073d21534f8f26a4d5ed15 100644
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
@@ -305,34 +305,20 @@ static int __init surface_gpe_init(void)
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
 
-	pdev->dev.fwnode = fwnode;
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
 

-- 
2.47.3

