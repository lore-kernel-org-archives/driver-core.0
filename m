Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93910377AB5
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455433; cv=none; b=YUqN7GpRGOCNxgWPvmKVjPGxhbqNvkMEV9Nc1TZ+E0lBcLx1waBUR8ckrnhiMyYNzBCMJh7WIeKC2sxiZHBAFt9/pjQt9NruK1RUOJgpZyefMx0O7aO/2ueM3IeddJnT7RS/9+G1tk2gLu6rBjWh8KfdU23ratC/9L1AnmkTxqw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455433; c=relaxed/simple;
	bh=lZ3hVt+WlwklbdtG7M89GyTP4rgmy4YOt5B8YbrfdC0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Lh537R85Ui15+DFWGxo3icYk73mSu81FmYmOeudBBBlffZT7p9CpgWlYN/b2aRlK562wQkQ7v6gIpG3vDw1xVTWzwjWTo9T+W9BaqnwdUfyz796aPF0RR4DXbRVZXJvphvXUWtKZJi/UkySrCOpyOcIU9BMRvpiEtYVT5e9MzMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C+rt6qog; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DSTsuOTv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C+rt6qog";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DSTsuOTv"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWiTo453689
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3a2o8hU2NX4G4KDjEtUlg8W2ms8vxwfj3DwVKsft2S4=; b=C+rt6qogYBOLcBHe
	+pBmbA6KVFNnsZjDlllr/6iyK7T5kZHtu5nqzomPVRe11lbm+yQmk+1ItnCtq9Bh
	03Qus4Fa9u+jmqLEKETOdv3eu8m9xMZNg+Ir/1YV/0TjRRpWVzvw/gZFfBUFBqpn
	vgUR09FFaK8UtAllSCNo6vDk/VsqcCW0TwOXL+7twLiXfW65q0vzPpjdA4vIloDQ
	L05qnc8haaT+koP79OY8LHFcj2LpbfTjGiX7OvtRNFwZFM1e2dWNX1A8kMbwhkiy
	yeQi88lyMPy4B3wCXk2Qajt4hhGh4HkWH5widIyAVAiioBet+fyhEEIutaOaFkif
	uwVouA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049kg5bn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:44 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cf7dd9fd91so30913995ad.1
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:36:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455404; x=1787060204; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3a2o8hU2NX4G4KDjEtUlg8W2ms8vxwfj3DwVKsft2S4=;
        b=DSTsuOTvROxZzgNurB81X67PaZIWPFyHQLbN6z86xidG6lnZny1GaknRRNlBdeuZa1
         Qot8vWyBpiN3mUVsRtuJ+4bzlrHoGoPriMYkR+JrUePW4u4YjVW5SIK6+RLsUM/aXndX
         8GzGv2FdrTuOxVmM6APK0DlMa3lnvh5FDFRMKH/dCtDjFhU/Y21RQlvgfhTaI/GtGLNd
         EThcMxiJqQA4opuxJ9TLZE/t4MHye/MrhSrnEx1SSp9mZAkEJ39NpktvwhapBPYZa5Iv
         8TJCM8uK+rX1X71WGc0+DYT3xHq4HJii9L0Imwo45B3dvoqkLiLPgMcyniFiw9hxTYML
         8qIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455404; x=1787060204;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3a2o8hU2NX4G4KDjEtUlg8W2ms8vxwfj3DwVKsft2S4=;
        b=UrsyMp14ZPamQCbVhkKFvPQalIYfrJ7wizN+WYH0p8BWYey4pBEz+moCGpDQQCJxpP
         dahJiYgT9Qys3EkKb0yLXaCOMZUdrq8WFJ34C4Dx6wGTAp/QjwNCL8WXfYJmv17TfgKf
         ObG8MoVfYGXa+L8PXeN9Ov+Tg2VcID88rjuxCgin4uVfxLmKBANKVkvggtFElfaelJo4
         jcvzOWXfQB6vwMNZfsBembw47eJZRIUW9kXQoVzD+cYbIxTgqjCMPkH93UWtA8iuNp15
         ZBoslGpW48e9z+RAUdqsFUWXiLTpcOxvBEP4mVKI+/F5+xkDhhZOy5Dg14ej/8jAdcjY
         +rRQ==
X-Forwarded-Encrypted: i=1; AHgh+RrtnG7Ju/zwbi6xO2mp7OP+L20NAHl9SFwUhLo+AQtnT2VUrTZwpxU4dxmyojg98tMhMUfyuHpMdjGrvg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy7Eby1FYmKWi58rHF1S9PkvpNANZe0LgZq8cB14PALPx3cd3A9
	WITKKG3wdKbNQWG58w/YDIHpzYPJhVYZZeIApZ181MXM/mgj8nlCDaBNNX2rTwTmbfWx/Oh4KG7
	GGosyB1sByu1MN9WOGd6dsmrRsOXe0h74vigAp8EPSQV+8ggvAkAKZSiWnaTfrzyKgQ==
X-Gm-Gg: AR+sD13/1LaP9xajk5eANJFrbWFaoQLt0pJbjY1Lg49ByIcLGRrSNo6nH/tzmoNSDDm
	+cxqwb/dEPj/ri4a1Mtffjdr7yG94p/V68lISn/Ak5pKxptpq39KzDuj0dYWWQaDZTD8n6D0KN2
	o8KWxE+pEuRnzehivC94bSqE5YQaeAQEL0StYEzZamoOtwim9tQgIy3PO81mBzhpZirkS8H7/S2
	3nGZyWzbnuQl+mAj81WZvLt1u2XYXAzruyXUA9goZruZUV49yKQWsMCPwN5IV6SNwntfjHJEUTD
	ta/MsjfqLoeJgs7vCMD/1fqsIvI3ahKb/Ud3+eNYHFU1658NIjS7HrlYf+5xbCR7aQSX2MGWeUq
	17fohcr+f2TKNWnPg1XSJ9QuoAyMCQbxhhSMp/AHm311CZqaFHh8TuIhm
X-Received: by 2002:a17:903:32c6:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d3175febe2mr38800315ad.0.1786455403834;
        Tue, 11 Aug 2026 06:36:43 -0700 (PDT)
X-Received: by 2002:a17:903:32c6:b0:2b2:67ca:5ff9 with SMTP id d9443c01a7336-2d3175febe2mr38799355ad.0.1786455403331;
        Tue, 11 Aug 2026 06:36:43 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.36.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:36:43 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:33 +0800
Subject: [PATCH RFC 04/15] arm_mpam: Add support for memory controller MSC
 on DT platforms
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-4-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455320; l=3976;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=dBj5JCOxP3rf9d7IdKGScOUu5ViYOzUHU9ubBeXQiVU=;
 b=UMkZ/PiLK7HaCVXNkKsyMh7zObjnHBSVbUWTXOxX14bK7Nn2MjCEFtKUfu3LjK5epD3f4g0HT
 Q+SWA++VVfCCaGEd/gnTrimB6Z+uYEb0gU4W2Kr/TJR33ZE3+7ZkBM/
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: TDN_pV4amJpWs34YJjqpMX6NFk9u6JVf
X-Authority-Analysis: v=2.4 cv=IO4yzAvG c=1 sm=1 tr=0 ts=6a7b256c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YM9RNYZJZtWq5EK5GGEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXyIqx6oFHwnER
 ldv9S2Aw/Wdm7awKuI53fcVp1lgE2kLa03hYFXEFyETGrfkvJ2b6bFYnL6E3wTkAN48O7GkuzvC
 Hb48Me9Fz6tMaz57zX/iZ87IOBuqkcsuLXjtMcZsDaBassWotaNclYXHX1kPijM/+MX+xFxvLX6
 e+BsWyRjV2qrW4Ykg9bFdyybULRrArzO1Bxieb3Hh5RULOn2fNYz5VT09UJCkttOGwuSGuZJanQ
 Pf3itsev4lULtVlbqLB0LipCrQ8RBRafXRTqVqo+S+r6bvU4P7PP3aaMHNEnlWCT3j0xxE1zyxR
 DgTIFiTIWJTAjN5q6ORYKhR2sMgEA2m8X9E9btK7rLw86C4Zku+bgEcVVfceUNLhWrIB6F+saxl
 w2wGXILyXYx9jrd9xYHJPwppO810kw2tl1jqh6veoo0E3ZQkQTUHpqkYUdcW6HK0Lc9YH5lkgQ4
 CFxLxRUsZ/t+V9ziIdg==
X-Proofpoint-GUID: TDN_pV4amJpWs34YJjqpMX6NFk9u6JVf
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX0eeKvCZ0Y9bj
 s+GA8Pr+XuvDLjPOnEDUL3aac6RNlFlJmO+ULNmeuzlD0I4PTutPzbCi7E8Et93c4qOyXasr/eI
 qhAx4V7CfgonOMcqbgx6Rqp64/aXXOU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

From: Shanker Donthineni <sdonthineni@nvidia.com>

The MPAM DT path only handles cache MSCs. Memory-controller MSCs
cannot be probed yet.

Add support to discover memory-controller MSCs from the device tree:
derive the component id from the NUMA node and create a 'memory' class
RIS, and treat a memory parent as accessible from all CPUs.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: split out of a bigger patch, added affinity piece ]
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context offset conflicts caused by line number mismatches ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 56 +++++++++++++++++++++++++++++++-----------
 1 file changed, 41 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 6f2854fe08ca..975ddab771b4 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -263,10 +263,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 				  u32 ris_idx)
 {
 	int err = 0;
-	u32 level = 0;
-	unsigned long cache_id;
+	u32 class_id = 0;
+	unsigned long component_id = 0;
 	struct device *dev = &msc->pdev->dev;
+	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
 	struct device_node *cache __free(device_node) = NULL;
+	struct device_node *memory __free(device_node) = NULL;
 	struct device_node *parent __free(device_node) = of_get_parent(np);
 
 	if (of_device_is_compatible(np, "arm,mpam-cache")) {
@@ -275,27 +277,48 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 			dev_err_once(dev, "Failed to read phandle\n");
 			return -EINVAL;
 		}
+		type = MPAM_CLASS_CACHE;
+
 	} else if (of_device_is_compatible(parent, "cache")) {
 		cache = parent;
+		type = MPAM_CLASS_CACHE;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
+		memory = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!memory) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+		type = MPAM_CLASS_MEMORY;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
+		memory = parent;
+		type = MPAM_CLASS_MEMORY;
 	} else {
-		/* For now, only caches are supported */
-		cache = NULL;
-		return err;
-	}
-
-	err = of_property_read_u32(cache, "cache-level", &level);
-	if (err) {
-		dev_err_once(dev, "Failed to read cache-level\n");
+		/*
+		 * For now, only caches and memory controllers are
+		 * supported.
+		 */
 		return err;
 	}
 
-	cache_id = cache_of_calculate_id(cache);
-	if (cache_id == ~0) {
-		dev_err_once(dev, "Failed to calculate cache-id\n");
-		return -ENOENT;
+	/* Determine the class and component ids, based on type. */
+	if (type == MPAM_CLASS_CACHE) {
+		err = of_property_read_u32(cache, "cache-level", &class_id);
+		if (err) {
+			dev_err_once(dev, "Failed to read cache-level\n");
+			return err;
+		}
+		component_id = cache_of_calculate_id(cache);
+		if (component_id == ~0) {
+			dev_err_once(dev, "Failed to calculate cache-id\n");
+			return -ENOENT;
+		}
+	} else if (type == MPAM_CLASS_MEMORY) {
+		err = of_node_to_nid(np);
+		component_id = (err == NUMA_NO_NODE) ? 0 : err;
+		class_id = MPAM_CLASS_ID_DEFAULT;
 	}
 
-	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
+	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
 }
 
 static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
@@ -2163,6 +2186,9 @@ static int update_msc_accessibility(struct mpam_msc *msc)
 		if (of_device_is_compatible(parent, "cache")) {
 			err = get_cpumask_from_cache(parent,
 						     &msc->accessibility);
+		} else if (of_device_is_compatible(parent, "memory")) {
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
+			err = 0;
 		} else {
 			err = -EINVAL;
 			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");

-- 
2.34.1

