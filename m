Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5EA42048D
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378830; cv=none; b=uIEjvNjQTyC9IK6LQC9TxqSXtVfsw1pP2qqdsjKDhmMRxDhgZyO49oE9FLRWuKSYKkwbPq7wER+Kxp0VNH9+evtr/AQ55PHc9GCZjfX0BCuqIUtfav2aMScvotUdx0LnNmavte8YYp4xb56ca6otyJPFI2ipY9N90ou9O2BitNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378830; c=relaxed/simple;
	bh=1RQ7P/dWp7OBey0lplY8RLtPZF/1STFcgfAyWMzstnU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YLnVs+rhiTYQbG1ZkmW1V5MGyXA/5B7M7gTxuMZx/LRb2avi6BmzokIuNVuuPVxcdmN4u3tnEVXBdl+MsgvWrOXoe2l1gE310HDPzcmFaIYvLooyWF5/m0/9vQrLubQvnueDISGQpiuNPAjY//ejQXRqf1Y0VCluT8AxMufZFNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SLuri/ZG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EqLhXCjY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SLuri/ZG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EqLhXCjY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E803TN3490518
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iVYpLMQ75Ps+YlBbbpsUx3nDLsFWRA7tNL5NlwEkWCA=; b=SLuri/ZGxlWJF7WO
	maL/CdBolq//hxWNOy/ChbIIXq8R0VX0rsEvYTiBIIT3jtev4t6mkEXZaK94t1WT
	RU/DFLTTQdoqev8ym3QpxGm5gzFg6tZM2fLSFMCnAkjzsrwWT5XniJCwCZGaLQav
	upIESA8kkAhfpsTMQnc8co02rV+W/hDA/AzcfIOj9HeIQt80bvrrNjdUhgV19B/+
	FZ+rqFRwwG/OrPHmaob4PSCbkbqtX3hyFse/uFoNXKY4Q5gMQO1WZHU5ULxul9/+
	E7nRVjk1tW+k/W2jr5Gbj9GYoPOGRGFLMrMBPhnZt+XCvDc+fX3k/lb2qhG0QgGi
	CvU8qA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpd1f0b6g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:27 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398dcfabbf8so8029012a91.0
        for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 02:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378826; x=1789983626; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iVYpLMQ75Ps+YlBbbpsUx3nDLsFWRA7tNL5NlwEkWCA=;
        b=EqLhXCjYQb3Sqj9oDdXHx6w6p9lNGQtEQt63GDS0010JC2ylVi+oFro6aoMe8spnjl
         RkXRaMQCWjHesVc5ppPAWAAv37yb/YLyZSoypy0RJYZT8kVqNteXycnUK/g1GXJ7aZlX
         g9AxCHsVq5vGsS98ho3Hf/YMovkdCqyh18Yw5fjBrx16sRoAMel5MgAlPQsnGSLi22vR
         YNbIiCYHWwXfFBgnDZY93tvHLU2RpCeub+ik5bNw0nCD0SfYG+5NMqJWpRKev/Qpf4Jv
         yIo+ms4l5agZaiIMfGNwlwNAbCB47JJKYCOselddvuceKjTcu4kXwQkcsBj1HQBeTCIY
         fabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378826; x=1789983626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iVYpLMQ75Ps+YlBbbpsUx3nDLsFWRA7tNL5NlwEkWCA=;
        b=ltD9mS2Xslf5pfdm5QLGUdPLNzBcrmPOeop7MY3gQQLmYmws5tsgaqqDYjF8xGjfbn
         hMDrqOdAnR8AIpPrkThPLz4vOZ/4/SiZZcN9eAfwlngW2+7xYucJnoCkf+6bt9+j4a6B
         g7IuapC0s9GQZOb5cXxUNtD8mB/Hlf8U4d/oZRa7NdlmiM6K2qLQZSL8XY992c4LfWhN
         8UFaA1UeL6uPcNueNj8It34+oCxPTFpxjUUhDCtnqL4++UIPLyntG8wogUOqaJg718dW
         Q2rAcTVUQLN0tsHfZu80oKuocsJAiKbwb85+a2B3SNNGRUQqvWO+C1juHZoXTBNSfFtz
         nThw==
X-Forwarded-Encrypted: i=1; AKwUvByJmauOzU5/o1E6hHL+GjtiWeIP8sFbgsMO7XB4nGBvfR7o4pAKkYWds51LCnH9+OADZKencM7ffvqNcg==@lists.linux.dev
X-Gm-Message-State: AFuF++n3oRIX86rKq/lFdw737lDeWRM52HEefIWJyHDWWnGDVt8AFKlJ
	0fAhi1PMXTphawh+iA7PNCVGNqyjz++hzvVxXWn2HWGn6nTSIPWPsLneaAkXzd+8hhrg5qdcdlF
	0Te54Ncjpk/0enefKzRmmzO5oRbTYVW+iYthMXUZFrYg4hWtrEEOhF7Ql27gMnXh/fQ==
X-Gm-Gg: AYBFou1sGsO3+snp0hv2loTitzibtwIJ6GsmOvNWAmniopGWWIYZRtIHa2sxdvw9Lk2
	fHO3tRudol2pgZmiXWhJGoHvWavU9JGl6zb+CmG+XtIFlasrJrNSA6x4Gzwj4pKAEcEswlvfSFh
	C8RSF9oeGv7V7tNIxTadBhl7zVa6x7F+4hCcNS2X2RiWqtoo+IwEFvdqyLDVaYoh1bZnz4uv1E6
	CixQwXYj+g+Ko7DCIfNFOu0BpFQx2rCP9sGR58KMCsY6gY/qG6Io1WcLc3u3w1H1gRj26RadipF
	Apnvc+fTMZzRiLgjIQ5iX+coxt6iRzZj+vuEfgROeFVuaDyWMZC1NjvmkJNcJdrLTJ2YoMgkItK
	T02OmQXF3X432FyVV9LyTupMvyyCvRMsnDTAvN83/qQLlKFSl7WL4199D
X-Received: by 2002:a17:90b:2541:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-39debf6bb19mr3764517a91.4.1789378826193;
        Mon, 14 Sep 2026 02:40:26 -0700 (PDT)
X-Received: by 2002:a17:90b:2541:b0:396:61f1:da5c with SMTP id 98e67ed59e1d1-39debf6bb19mr3764448a91.4.1789378825789;
        Mon, 14 Sep 2026 02:40:25 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:25 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:54 +0800
Subject: [PATCH RFC v2 06/10] arm_mpam: Add support for memory controller
 MSC on DT platforms
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-6-bf6645bb2f65@oss.qualcomm.com>
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
To: James Morse <james.morse@arm.com>, Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Yin Li <yin.li@oss.qualcomm.com>, Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378764; l=4057;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=+NDfa41WasI9nPmv5C8GV9yjkaezFDn6xOh3LjQQb2o=;
 b=nndB5WmbB/5Rn2HufOKANj4QsiBTb2AeSx7P12aYsgZMX7fASXgh9AggBJb1dAxvoBx3dsxT9
 nqcLEqfHz3aAmOqUgtuzElXzhj7LhNQOHqwbkckULfU4KRlR8BwVQV3
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: IgvjsCV-qcM7yhO6qP_Cz7gF_NRc2pzN
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX7aOPluKvwjf1
 f2lPEjCGJ4sqt2J8Irg4Wf+rgq1Z/gXWUVifNHZS7uDJHbHa5jk5FKMh6wT/bYrXMSUIfMaMtkk
 O7O3VzkKitz1vp3XsfEWCTz45gmbURo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfXwjNipAX7ZIZ3
 5qwKQENSqe94sCeC/uli8gkLZBUx281DXRZkVeaRB5ed4ltwOZIfRb+Aa4NQHo1lggWmQa3giJc
 wfxCZJANsoCeqNtMyId0K7S9XmDAdXZsJnZSs2lgkPgas7U25/WP8xluGfxl/8aqUtbWi5i0ytc
 dDhqflUVS6SzpSaE2hgoH7G/bnT28UPMIcxR+VE5BCtWuMWqa2W1BBP5Vlg2c0Z03b9PN7/8iUE
 nLajz2ZicyDSRijzxEGvC9VpE7MHkRc0BUAQhTbkgWWfJhozM87W+Nb9AUvhOvYksaLA4xdw0VS
 7pAqmm74VTiEHi4tuvjPk/5czY185Xiwaudy6AkH0jNtgVdxanmVGmpv3c6LOCOaPkipR1QCfpa
 1+EHlVn8dzGiKgVerpLAx9BvKy4lcOyIsRdSNvS87wOhl3/VCIOLaUbuBTLxh0ZHOTuHJ7Xfhgu
 7o7OMvrMl0J53GdguiA==
X-Authority-Analysis: v=2.4 cv=XKel2ghE c=1 sm=1 tr=0 ts=6aa7c10b cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=Ikd4Dj_1AAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YM9RNYZJZtWq5EK5GGEA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: IgvjsCV-qcM7yhO6qP_Cz7gF_NRc2pzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 spamscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 clxscore=1015
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137

From: Shanker Donthineni <sdonthineni@nvidia.com>

The MPAM DT path only handles cache MSCs. Memory-controller MSCs
cannot be probed yet.

Add support to discover memory-controller MSCs from the device tree:
derive the component id from the NUMA node and create a 'memory' class
RIS, and treat a memory parent as accessible from all CPUs.

Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
[ morse: split out of a bigger patch, added affinity piece ]
Signed-off-by: James Morse <james.morse@arm.com>
[ Yin Li: fix context offset conflicts; use of_node_get() for the memory
  parent to avoid a refcount underflow; use u32 instead of unsigned long
  for component_id and compare against ~0U ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 55 ++++++++++++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 7a5b27e87759..480e38cfa86d 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -263,10 +263,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 				  u8 ris_idx)
 {
 	int err = 0;
-	u32 level = 0;
-	u32 cache_id;
+	u32 class_id = 0;
+	u32 component_id = 0;
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
 		cache = of_node_get(parent);
+		type = MPAM_CLASS_CACHE;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
+		memory = of_parse_phandle(np, "arm,mpam-device", 0);
+		if (!memory) {
+			dev_err_once(dev, "Failed to read phandle\n");
+			return -EINVAL;
+		}
+		type = MPAM_CLASS_MEMORY;
+	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
+		memory = of_node_get(parent);
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
-	if (cache_id == ~0U) {
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
+		if (component_id == ~0U) {
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
@@ -2169,6 +2192,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
 	} else {
 		if (of_device_is_compatible(parent, "cache"))
 			get_cpumask_from_cache(parent, &msc->accessibility);
+		else if (of_device_is_compatible(parent, "memory"))
+			cpumask_copy(&msc->accessibility, cpu_possible_mask);
 		else
 			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
 	}

-- 
2.34.1

