Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACC3433DEFE
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 15:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783955543; cv=none; b=O/5lWKDCgV/hA4zbqZQpfj4zj+bZtEiJNdx1gPyhTTuM/NO0mCx4yLYTAb7oz1thDvtaWaU5tSKNzVE7aIWysiCHfPAeWjRD8Qzl/8sYcVcMJ28E/XhgfnmvuHq8p0zKHFJv7bDhIZRvFyG18+DbJvUbutki0O3QH4Lhi9+MWvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783955543; c=relaxed/simple;
	bh=LQm6Ev5CsTQhlRz56Fas/rrihp1CyWWC4kaoHOMynUQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SvVriw72wPeVDV8e4Fd5zfAS58LfQ8UJhwFrRNE1lRKPpvO8Tw4uC1k5KH8UDcgbyweFzYv1LqaulBQg9cWsNc/rVuAKIyq34Nn9KEZpxOwpFvfEoD/9qWS4tU2zcW7WXcIdTlwGFswX2VsmjeyfvRB8mxIH4ZtbyFO/tkN5aMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kVhFl7OE; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CSuGE7Cd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kVhFl7OE";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CSuGE7Cd"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DF8ASn1900456
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 15:12:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	eOoTW+/8NGpy+8ODEceEWrPqGZMK7q4zSL4q7/aA1IE=; b=kVhFl7OEgk96yjT0
	mVa7TQ1oKGQVR5q7Z5d4fj/0gvy90stsr5AfLefa0T/l7KlaefyYpWa0WmBtfu+E
	zqF7CklezR/HLnVyafxC/A5ziJlbtdPJhYPHDYJcOcl2skPAPWU0+e3Uv9BtI8p1
	QwOVi88Eg+VNAyoujSh63u86B1jd6OSNCluOen+U2twkPTsJ0tw7HHkGCcTDSI75
	tafXva+tO9SgZkl0XanV/Es/3IlVulUIlB7U3uY2BSGAXlLjfKGYPJtYHnSNeamk
	JwQBpf8mItV1BETpKA5mSrSXTdTCGOtk5AOWg4kw0Qz8Fer+LwC5Nx6QlNdHkuXh
	FaW4aA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fcjnm37dn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 15:12:20 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c083f1818so45721561cf.0
        for <driver-core@lists.linux.dev>; Mon, 13 Jul 2026 08:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783955540; x=1784560340; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eOoTW+/8NGpy+8ODEceEWrPqGZMK7q4zSL4q7/aA1IE=;
        b=CSuGE7Cdb1mluIsrA1Wo6Zh/V+Nm8NQNrWdaCAJErGh8iLzSo2YCm8bxlT/OFNlgZ8
         2Dm5/tzMzSTALO9b31rU9rmrANPoXQFkeTTHSMpAEwiywABSBA+AOzIFTOnt6cOqIUSj
         sJedGMWURklX3IggYsqDmfYfOi0g2yY5mMh7GmD+3iC0EOJPZpAzZj1DerMAND8AlEIV
         46z3oIDyUen/aJOszjJnPn9BJ/50Z5LkxFlYwPb96W0hIPwnAKthSrVKPpHIuSUbaaQl
         CtgcQZjc2JUQP8us86UOAA6ZZKYvf7LrdQ6DyBmiFNaam+kKQJxz2ukaETsNO+kuj+d6
         3Utg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783955540; x=1784560340;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eOoTW+/8NGpy+8ODEceEWrPqGZMK7q4zSL4q7/aA1IE=;
        b=ZpQEeEFJVURB9njFlFyqkX6y6MwNRdTKtGOK3L1be6s+c2lRV03QHL5aiZLWUw0U9t
         x6csSAH1PJiiKkxHhz0TYTqU80OKOOyu4d9OpGGAqasreOTzLAcuVCk+M0R+BhOzGna8
         0AsYLnPqMO4AJ0zJ1kaVtY0YHQb+OVSgDOgsU5Rg/zQlRPVn69vRljaYK+iquESyJEBi
         DifN9VE7eHhYN6ni1CX0zZ5/Lu0/aCEjHSObGAqComKT36AJjLHAIOgvesoXPD6kjb1c
         cCANT5Nkch7GgONdXU67wITk31SLYdsiPBr5hBrDExIAMCy3Amr58i2HA+Wksjxy+MkY
         PnYg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2VLZRxTntaWsUH4q0DNcxuJePzD+mTjVuiJwG3f933G5fjvgGzrvxIp21iJzx6FDZ+IRnngaroDwmNQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJTGZlzKSWqWax8xhLJhpd0H7vT67FPYlnxhv0FW8+yFDgWy2U
	WtbZsiKAr/67NLhWC/1gHsHMDNDgUnqlEKnDI3X8rI3XSCx+ye6D+P8LwgnMl9yHy8lvscx/NKi
	hobwQgNPsAQje+ynWqL5o/v8MbXfkEMxWUeiwehhw280NlQMjh6vBQ5XsTHAQMFETrA==
X-Gm-Gg: AfdE7cnbSIPXSjjIXkGqndg9vtmudErL2W9wcybezAof95AwXxYxWeAl6+t2FWApfX9
	yIY2oR04Ht/u5Mh5j8cltK4/lBPgAcCan4vZR8oFAEEPNBQ7nSGHZSZH/Ogn7dx9foI4DTZ8ryd
	GlONCdm9g+PIwwnCh9XehdiTv/A+RpxuXWgil0coURaQXlvpCwjgkTArjwRNm6JIG3ga7geftVG
	jorAZmgPZ9ewbT8BwoeNZ8dr6udXL/Z/O9oMnYFZEpQhc2wIdtkxqVm+IwlZgshszS8adfo7AIm
	ZzC9uTxi3c8ii9xjd5lx9aOZVzujaHCmjS54XQNiu//ub4K3JhUNhP8B2/Cu3thnVWsqVhV4uhw
	EbKpehSZt1DW1s/HB2nn5VlP9wBvyMNQrrgtsHXEi
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5ff7 with SMTP id d75a77b69052e-51cbf3fe1femr91662251cf.83.1783955539996;
        Mon, 13 Jul 2026 08:12:19 -0700 (PDT)
X-Received: by 2002:ac8:7f13:0:b0:51c:7b12:5ff7 with SMTP id d75a77b69052e-51cbf3fe1femr91661821cf.83.1783955539511;
        Mon, 13 Jul 2026 08:12:19 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8881:83b8:89fa:1a2a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47aa0a558easm87956664f8f.27.2026.07.13.08.12.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 08:12:18 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 17:11:57 +0200
Subject: [PATCH v7 1/4] platform/surface: gpe: use
 platform_device_register_full()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260713-swnode-remove-on-dev-unreg-v7-1-6d6bc448427a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2532;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=LQm6Ev5CsTQhlRz56Fas/rrihp1CyWWC4kaoHOMynUQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqVQBKTlNOxz9cwYCiWhHNVnX+m3dvLDS8Snmnt
 ETAtF4KuRqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCalUASgAKCRAFnS7L/zaE
 w9NMD/wPsPGJwatR1rnJxCsUwV8L2KnB0IOZCNjGmdn84DwM3P/LtTWySo2BWVUdFlYN2CT4C/4
 qrALrOWSlxzHLkMEPGkh0MoMgPmKjiYBkP0oQv/KxaLYSHUPHlWe4bq2Bvr2eO+JhDlCp9QHCaI
 LbqLglT5jrB6MurGhsFyEG8JkvB2pQRRi6qeipTPCFKhb0xQDx9xYbr/YRo4d1rU6t6duVDPj2S
 5IikQmv2kkx18DfbXcTAajxBl/vwwaUtxgL5S96fjKPnDsS8oj18iqwl+dcsOYDuei69Q9G99Nt
 d9aleGx1WW9Cs1vkgJbYYNx/224EdKSPh53xAPSBJQFeDN8Nb+JwkJrTbkc5HdeOOrELH0A5sBR
 hZ/Gh79aWzuh7wVaprBxLAZ8qaRlCm/sUwO53O1gqYOzGoiOGEi1SKNvcVer1jxB2L4EAx3RiOY
 K5kUWFHarCHNYYLbDfTYx/ih07WFJ7Er1LBkD0Ad/GwsxZXwZaAETTRq/7gSxhw812Wmy24UZwa
 AaFmkkAIOahLpJv8+0rvCXfvdLMS9OY6nF53BBnivWQSeAPRAT68B2A2GDcG+0U+WPuxXDTgv/d
 GfqrTmQ6PQo+Mo+NQhZAzHVOCqFpZRuiS3MWrfByGlLAl/Y4mUe+YUw3LtSRR65BUC/NVXeiOAC
 SXu9YrBLHre1Veg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: hrBEXCBVxJQ5J5dd_tpsw-Tr87KhW8Oi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfX073biHMqE+mQ
 +5eG+VxMuwHrdSbgcYoEtmMfmzmIKZfhHWjfNtAspu0cSp5RSDpkTFF9UpKtQfFUNRMza4/vZ0g
 xfnl1ie+bLz+UbyBW09MMG8LCdO5LgB9hSouPIVWVzuftEZaTtoRKcJ1upZHYZQJKH+0aa5ARXf
 nvDsGE5iT9qSAgcBYY5RkVQQ9etQjYpE2wohAnMIqaQdUqTiM9oyAZ7tB9gzEWKPVUqUGadEYQX
 3aGcdSBDQ7tq9K8yi/M0gBm6l/sdbGhPo2ZLL3teO1VjKUBk21DvOlcX2UlUdLQNd3K7E/AyZz8
 NDthxqcdXXkVuZXgYQdEUx4s1eVEKv27+XzrRuQ5f+4l0aYIUv1V1uYs9fHnBOOljZRG5JYGaez
 L/j4VUK4bbF+OagIXAmMtZ3TRebaIrwhSNDu+SNNmCHRs/+wqm+A56IKVWaUORPzYJ8w/mTmNQ8
 x3jNd8U/NTnETl1+v/Q==
X-Proofpoint-GUID: hrBEXCBVxJQ5J5dd_tpsw-Tr87KhW8Oi
X-Authority-Analysis: v=2.4 cv=AfmB2XXG c=1 sm=1 tr=0 ts=6a550054 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=vKDqCkOE6BQjc6v61vgA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDE1OCBTYWx0ZWRfXwZ8UGQxHenkf
 YANgk3uD5Rx/RchbeQpeBH7PhZ8xpEIGyng7Ntx4EVYSusENaRPFHatdP+n3vdGXTa+FwcW4ji0
 7F+Lp8FyBcpfYzBfphNx0r2OvU6QzQc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_04,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607130158

Creating a software node for a given set of properties and adding it to
a platform device can be achieved with a single call to
platform_device_register_full(). There's nothing in this driver that
suggests using the more fine-grained interfaces was intentional so
switch to using the high-level helper.

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

