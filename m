Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2050F423788
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378837; cv=none; b=O6VM2tgPe0JlJ4bAfSo74TFZJ9vhV17zhwzdcdhCpCTyd19rCtkhlG5g1b8MzbV3+lX7VXs/e7t/4MdtvAq3X5mGdUHad1KQ3mY5rH+7xCnpLe8Y5+kUdqsgML5EA5KLeTweNraTxaFAk+M81W+c0nbSkImWsu0iC56JoCvDaWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378837; c=relaxed/simple;
	bh=Eup0TFC52Dvb5C0RkUrvytnZqSb5g4QWq/ztKU5w+8Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=P/BVJahGJC0/JeNgs+ZcRs8nnpmlTx3IzuoNVmj8INPOJtjJdIVOR4BFgcddGV8c4m/UmT9Xb5dZrHDWBg+lriTTHIe9TqR+6c48i3q7w3fKoVJ2gt+b6GTlZ03aYvPw7aVwHWLqVhF6n9zcVLoPsu6Tbgq1/Ay6+P+XTSJD67A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GRHBF45z; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FYqcm+7e; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GRHBF45z";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FYqcm+7e"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E8KhAh403854
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=; b=GRHBF45zjkMEa/aQ
	DPBEp39VwMgYCtsR+lOVJ9DVytz9ho4CvOvD5hneLrwyFgr3W3Cnem7dLCCDt6pd
	kzDnJir+5XMq5ZAsk7FiytBnp01hyY3Rwv0xpNUw3pny1PrD9h3CznEqY82yOc9x
	jTe+g4H4p+KbnaJLMcEE1H0i/6RtGRY+2tWwTwVT71Fd/72VC1CDDrlcASX79cnt
	Ijj5W58vhSGpxJYPh7zgfSXUhXteTkvyIWkB4t/Rvf2YFtMGYeBn34ukjlmXGfPc
	CMiEKWNI8zCI3a7UVUSql95BtG9MmWvsVKiTT3rw5kPP90lY0ftZl6an0rW4giS4
	ywIXxQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gpdb5r8s0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:35 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-395543dc382so4194589a91.0
        for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 02:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378834; x=1789983634; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=;
        b=FYqcm+7eDKDDG5GekTjB06nDzAqGtqn4UW5IIAGJNYndLf71LmJU6CxuFZaDrSEn/q
         jF1PZgcQwhoDLbSV+dMQ3yLgaG5lLLxn4JmKlhPsnxDZuh1vzby3Ko9Om2kGiXzcNi7U
         lUGOpfkv7QvlBabHFqWfiMDTJ2OzOuf64PsJkkxAH/6TiywMsqJlij9jhEQI7IHMzVqK
         HmIDVKflivAhG2YHXiSstA6JUyUZh/DeMAdclBQooVJi70R+LqkuG7QI/VpwXauIfHEg
         pRnPKAGF6QmxKzVThbzbzOhxP86omOH++X2EwI+jA73DxSSU//SWy9tTgVagBmlFiZmy
         rOKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378834; x=1789983634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jLEBtgZPD99ESKFnRmQeGhEc0KH9pKzoTmRMAH/wIzI=;
        b=RHmIZfgpyrZ4ulowa8zcPrUTpzeQ+ZS5Ta01xbQGHqMh1m341o387WyGwyiZrQuHMz
         WjDoJJklMuzSmqf+uyLAw2z+IAmNfH6fFMF/68A7kkIHj0CeY6eFFHNSIgQKEE75aHIy
         wZvLwC6syRCPh0oxqa+ouwSHktPo3pKeCD2xc7saKyKwCTaYLk+/Y6REq6X69C7iGUZN
         p5Ha15lxC3sjMTYCxkVTBOEF07I0lppv11KCICzp+9hWZa4uEkB4wNeSZr1LpWZihqs8
         CZvG8h0zMwLR/SH3P7dZwsABdGP6LlhwzAj8dplZebnDI9PdZoWAVPuuVTa3ChSXgwVq
         dwEg==
X-Forwarded-Encrypted: i=1; AKwUvBzHUGcfsBDpYnPbSU0CIhp1RgRwWCEau/zVGdPW6i4jUEbBISmj7uS/lVkeFjuIX7L7hGRagRNEyyZrlw==@lists.linux.dev
X-Gm-Message-State: AFuF++kO4T1GYZbmJX39adVBUqHZ7bMWkoSNbkpHGzPMXtdQq+3cCfdA
	Ii9W1L7g+4v+UNGmQWxc2kjoWJ0SpcPOwIUqEzsIiAV27k13ote5g+wmEgkCg4uFQ7v0WnyFkQl
	JQFoCxVZAiGMruvXsEOHRZVO3CmTEePdlSv3db0JbbjL4wVMMjiteph0uV7PGtJEaSA==
X-Gm-Gg: AYBFou2WwJ8pwtbQwaoi2xMKimNH78aI1G5jYmrqtczAF5rHjy+Z/CaSVNYFgJ1EwzG
	aEWVmDfCCOrr1gbyNZhFZB1caPxzWxaTacwj7ooqpbXb4wZcRDc8bevknTwTbf4wddLkMGtSBC1
	mvMgPh1CoojLUcLU034GELjvrnC5SJum3wJzIYLu3VqUUXZcgtEKHgXAPs1R9AT8jllegmw/OeK
	/1CEEATvGwZR0wPT6lXy5vx8Pf4N/xlhnN3A2Cnmcce6p1+k39x1IBGJOEUFTylbRWVylAb1V7e
	upyWhsIJeAW790kgSnxZEodof49n5jonNGnPYpasqfvkH9JVVq0uL7cf/s/1eAfFlnKDOovQbX+
	7tyW9lt7DM96minP2QV2dlVJ1g/S9ZUoXdh0sY2LOcgwvwz900eANsfdU
X-Received: by 2002:a17:90b:39cc:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39debf94eefmr4068715a91.8.1789378834165;
        Mon, 14 Sep 2026 02:40:34 -0700 (PDT)
X-Received: by 2002:a17:90b:39cc:b0:36d:9e0b:3801 with SMTP id 98e67ed59e1d1-39debf94eefmr4068644a91.8.1789378833728;
        Mon, 14 Sep 2026 02:40:33 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:33 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:55 +0800
Subject: [PATCH RFC v2 07/10] arm_mpam: Fix mpam_dt_create_foundling_msc()
 to create MSC platform devices
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-7-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378765; l=1946;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=Eup0TFC52Dvb5C0RkUrvytnZqSb5g4QWq/ztKU5w+8Q=;
 b=fXbWfUPGaOjktIrRdd0qWh/gG9DAXYutlr2e3ZmvjdmcsduoOF8c4KLO90VZPV33CVNCkTVC1
 Rxwgo62tnAQBpp4OtifMAO9MA/mDvKp/0V6F38k1t2gH4Muaj3j3HEI
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX+7nW7azSZYCQ
 KWTtAp2yy06+OlQfnHdCpVt9Mri/Ed9xEpajrbiYDU+JlZoF+inCWVaGUJLlCUzQEsegJGQmRO9
 ZdNoSMkeNsjd6VkQe1SHfgm43bPN6Dc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX9hicsPwy4+tp
 +70s+0Zr+Elm8baBybO3Us/XR80a9DyNSww6BqQHxql+0qwCnbspEsdD9OUUg3Ra2Sd457I1Nlo
 +Yvsn5+PmWS33pc/cpcn+f4zNd9n8U0Y1AaRHvhYSIA7N15ldLbC5Ufn6EQEALi69UGLoNDoEiK
 ngE8zsMLPue7ge8wDJhZ1judvB45o5s3MU/mAghQfrXc3FDnl5l/90W96cFRnHEkJFQ0y5XEzI7
 90h/3ZbQAAIwt8ROiiOn5brNBpSsZGSF+2krQ8INHB5YsZ79elw/uTpLHftuci7wtCZL+VipRut
 twoon9oQJvFplylDAZRQ00zn3RGl4TSolDoOumxp2h8S6ENjF3/u6DrmSrNAxeT4R6sYjN7AVVS
 /iAyoms+e5Szuzm9yRFc9twzaTPtIKcuYtRdbbYq3B1r23rgRjcF52HsyNnJMyRMOKTRdes35Qm
 uBbnKQ5oraB8HEo7pEA==
X-Proofpoint-GUID: y3XgbJDXgiwkT82IekEV3FG9PNW3GkP6
X-Authority-Analysis: v=2.4 cv=Ie4Symqa c=1 sm=1 tr=0 ts=6aa7c113 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=rtFuv77GRgtEkpuRCi4A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: y3XgbJDXgiwkT82IekEV3FG9PNW3GkP6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 impostorscore=0 phishscore=0 adultscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609140137

The original code created a platform device for the cache node itself
rather than for the MSC, so the MSC was never created. Instead, walk
the cache's children using for_each_child_of_node_scoped() and create
the platform device for the MSC child node, skipping cache parents
that firmware has marked disabled.

Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 480e38cfa86d..7ef3ed55b066 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2366,23 +2366,20 @@ static struct platform_driver mpam_msc_driver = {
  */
 static void mpam_dt_create_foundling_msc(void)
 {
-	struct platform_device *pdev;
-	struct device_node *cache;
-
-	for_each_compatible_node(cache, NULL, "cache") {
-		struct device_node *cache_device;
-
-		if (of_node_check_flag(cache, OF_POPULATED))
-			continue;
-
-		cache_device = of_find_matching_node_and_match(cache, mpam_of_match, NULL);
-		if (!cache_device)
+	for_each_compatible_node_scoped(cache, NULL, "cache") {
+		if (!of_device_is_available(cache))
 			continue;
-		of_node_put(cache_device);
 
-		pdev = of_platform_device_create(cache, "cache", NULL);
-		if (!pdev)
-			pr_err_once("Failed to create MSC devices under caches\n");
+		for_each_child_of_node_scoped(cache, child) {
+			if (!of_match_node(mpam_of_match, child))
+				continue;
+			if (!of_device_is_available(child))
+				continue;
+			if (of_node_check_flag(child, OF_POPULATED))
+				continue;
+			if (!of_platform_device_create(child, NULL, NULL))
+				pr_err("Failed to create MSC device for %pOF\n", child);
+		}
 	}
 }
 

-- 
2.34.1

