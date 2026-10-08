Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926553C4553
	for <driver-core@lists.linux.dev>; Thu,  8 Oct 2026 06:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791442071; cv=none; b=ARh1roLQg/RfeLiDhd+zoHqE3F928ZpvshJXtDp+APA1o4/idF+VFptneiwzdbS3+9XNqO52292P0lRvKaY0iEY+ukpmP0k+MLCJkgnc6gWIibFw+9i0InFay7+4MGBk514ycIvxFzKPSnFmXHnM1yrnLcJq7oLlmKBzJaq+MaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791442071; c=relaxed/simple;
	bh=80u2pAh3kUz7aM3k22MQUDFGQu6/eDakd11zKkQnXlg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e0jSxoPx3yAqUTEQDTz/GHnvp50u5n40pLGDv2vJHQ4tqqNnNStFWX9gv0b2sSd7YwEW/Gx6rVJFV4NreD1FQq3xe75O5hVgtS1oGsFGGK0292HeT36nJ7x+ISbotCJCmLNt4Th7aWMmudAWHxTWugj8w1awm4DoNWAzUG5iUKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nllrtFmY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C42zXDyX; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nllrtFmY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C42zXDyX"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6984BYPg1157842
	for <driver-core@lists.linux.dev>; Thu, 8 Oct 2026 06:47:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=; b=nllrtFmYxX0K4LxO
	opRde25RZOXQpTiWhKsra0U1rovwhlB2fBW0igQUgaWB2cxV3pVEH3pNKFhi8S5S
	8MlqNg+QqKVnoHbCRIP1ad7PJ+5B1lvgHCDhF3etz9STYjSaxLxJZ8UgUYTFf23w
	2lvpb8SICblKu2ZddsrCFFR6MGqq12ZD7uYMkAWXmccComSBfomwbTGjq6lPdGme
	MTDkRSMQJKu3h+ECr8GF0mntrKkZqOQ42s4r3ASZgsa615ZoEoxzCOdxneX+fIAn
	oP8Gs/et04veczNvi9y42zVjBfymkj7/IGr53XuoLqRz1N+dMWedeqMHDJDtP+8G
	UFMScA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5xe51hga-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 08 Oct 2026 06:47:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39deb05ef51so5208849a91.3
        for <driver-core@lists.linux.dev>; Wed, 07 Oct 2026 23:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791442069; x=1792046869; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=;
        b=C42zXDyXWrmuFGZmGir+cX+vFSPhe35SmlJtasrkvfSmqA4q+JTWr9ybrxOZycV0RA
         0nbHFyYtz4kdSX2AiG/mkaFqP5lJVyhiejG2IZDvTl4xhSy7j33Oco8JV6IFtmr/5f8S
         ggaFi7YTS1Ya8r0DJ4dMJICubt8usBhOq8Xrm/EVzbrxoNk8RVqwbbrrwtA7cvMG0ZXa
         EKVJfkhbG3dnjv+LuGM8AKHo2jzpj3Hu1uGYGaixeug7bQuAXxRxgJfpzBOUooYeWfOE
         g18d6d7X2pq9XXSU5rlj9RmiESml2O5YyVyeoXg73o36ubCavDYFDtFnMYqMWLX4PGYo
         RzTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791442069; x=1792046869;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1/7KZsbA/bBQI4vWmdVz2CaKKWJjD6gB5SHU1QsuvkI=;
        b=biBo2zk0a3Y2+hdALmuCQKqj6W84hQrmizBcb48apOCGgI3HHyFIaDb67MKZ1uxQtC
         a17W2ptO2b32nJ4VX/Mz9S9HW9M8A3/+6Ti+BatjMsGAL/flKProWgmb9ddw3Eb9/NNj
         ZVtIBnT4BsXkTH+7FxApSt2t270kNtjBT1+2o5DsxqkBcMVG2sLI0U9UAE0OdHZu28jX
         21fdQwGsMdStrruZKMKyZZTGsS1TbCelPruDhJ0gAQa2Q8c7N5jy6aLWJXYS+Dc1xv4d
         +HpdGB18rmRzghSQqqKOYzKJpLajvieBOb3qvHDfMTqOQeDul6x0kUKGwPEOxJUjHlXe
         wTQw==
X-Forwarded-Encrypted: i=1; AKwUvBxS67qTMZu+JSNyjiJSBExiifSMx9iuR12GOqVofdQuRJN6HPHL+9IN/5Hyg43TXjCxD/muegUwl89dCA==@lists.linux.dev
X-Gm-Message-State: AFq9FYLOApIdDebRlyrJbNdLwMTWVbiZlIpGvj8l2NZQqnvtA1pvPFzv
	RgZzdnjx4QzNTIHg9DpuAFFBYFCjo8x+oMct55m1LFxFIMCYz5QmbnBZfM+R0Ew6UHuVhvvedVZ
	ubJqrHK8dvxbb1XUtehZTPiTncFdLilClwlqDFYqARxVy+nMjCcRmnAgnWZrSbyCcPg==
X-Gm-Gg: AYBFou1041kZ/O73vVK3QWSW44L2E+7L57TaT0q/QkKPEDdQXwjuYSYGPCoedYzpmNq
	kVU25Moh9v56mEmCeezRByEhlfYO6Z8Q5uS8Vz4olwTRQlR7vK7QJazJkm0c1qLy+AVHkQJxt9J
	QX6aO1G7KoeWWDAP170i4I+s0ZvIbF1EM/QqicW6t7YxLTmEj0elfPrmNRm6KWvjVEEiux6CWRq
	vjc1xXBtjI7rv08GoAxOV7qzcDCz3llNI6PIrX93DzfHn/Xo5yWVH3J99B56HioLwLBhjwKsKul
	OfiO7HRj42Pdufu+7GU+ua7wHe5A3Rz11W/mWE7BBZEBU0LZBJPCgOhHRau4kIrPixXgwkcPMfX
	ASj89rJMPA3b/XFpW0LssgFK8d+PLd6ySzNDar2wR2JiUKpF8sHz0SFU=
X-Received: by 2002:a17:90b:1a8a:b0:3a8:21e4:9584 with SMTP id 98e67ed59e1d1-3a8a15314eemr3245393a91.60.1791442068742;
        Wed, 07 Oct 2026 23:47:48 -0700 (PDT)
X-Received: by 2002:a17:90b:1a8a:b0:3a8:21e4:9584 with SMTP id 98e67ed59e1d1-3a8a15314eemr3245366a91.60.1791442068213;
        Wed, 07 Oct 2026 23:47:48 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a9f1a254b3sm3313925a91.2.2026.10.07.23.47.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 23:47:47 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Thu, 08 Oct 2026 14:41:13 +0800
Subject: [PATCH v3 4/8] cacheinfo: Expose the code to generate a cache-id
 from a device_node
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-mpam-resctrl-dt-knp-support-v3-4-35196c2b43bf@oss.qualcomm.com>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791442023; l=2378;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=treBZjfgVIBmtiVlLTsGxNxSnTktJbBCCAsYZ43ZZlE=;
 b=3SxhVsOuGeNgSvPZ92pETLYV0aGE3Lrja1mLwS8TGb1jJE+U8AFQP9fekEsXMRiNzDPorHWcu
 NsTLPixLPkKAmXzZ9LTTdmipd90gcTa2KYFnIBj5anxhOUkg4ybZpuZ
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-ORIG-GUID: f8mXsnNyGbXKjdEcGrbotoA-DAX670ZY
X-Authority-Analysis: v=2.4 cv=E4dYNqdl c=1 sm=1 tr=0 ts=6ac73c95 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=2UMQdz91M6SPgPM9X00A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXw1HS11srsni9
 ZrNT/SjJTbQeCqi8oQ6nOxYCMrTwW4MXo9E4CutQVJlG73Q76hz/g7smgUbtqMaSoC9a2hqea/t
 snMUZ9zrj0QOs6vl2L3mW7BNWU0cIb4=
X-Proofpoint-GUID: f8mXsnNyGbXKjdEcGrbotoA-DAX670ZY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA4MDAyNiBTYWx0ZWRfXzdPBV2dC3wFh
 L/7oTfYQuuxVgVtx4WqlNF9zkvZ8l1k6vB6O74C+Wq8eoLAcH5pnkPPvJzw76o7ihn+wuCVcFnC
 OqOipF1C8cFFnlJDJdtK/5s50FghmcfVlcO1yvc7whXNaSnTNUEdJXr2zadErnwhtVcjWaXRXvl
 NCc7Ji/ZDXtK21nbLZS/9w2Fp+kxIYmFLNrbiBRMsuK2NZVtrwo3fn9EmEYg6ZBZmp7zszlneIS
 O8o5Y5XZviVaTD4ex7VVM/ElsYI/YZ3L5p5jaecQ7wFidcU7EjDjahxYqrjaszFwmioN4sFOyoU
 auUBO+l4j+KKXQOKDcm81v8Gh27B+d8U/AhRMB5/hP93BuIl4Af+SCMsTSQBiHW2XDh/UcA7OKj
 d4VI8mhavxiTrn1IIOmkKCXFUHK4Z+LhB+coIf4ugHCIAIVQWZ+OhhX6eaJogb2OF5X7xR+UUIs
 K5cj4wy0iO2sCMKh54g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-08_02,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 phishscore=0 spamscore=0 impostorscore=0
 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610020000 definitions=main-2610080026

From: James Morse <james.morse@arm.com>

The MPAM driver identifies caches by id for use with resctrl. It
needs to know the cache-id when probe-ing, but the value isn't set
in cacheinfo until device_initcall(). Even after device_initcall(),
the cache-id is only available if at least one CPU associated with
the cache is online.

Instead of making the driver wait, expose the code that generates the
cache-id. The parts of the MPAM driver that run early can use this to
set up the resctrl structures before cacheinfo is ready in
device_initcall().

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  1 +
 2 files changed, 13 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index c4394baa7e53..5187535c8338 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -243,8 +243,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -255,15 +254,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return;
+			return ~0;
 		}
 
 		if (match_cache_node(cpu, cache_node))
 			min_id = min(min_id, id);
 	}
 
-	if (min_id != ~0) {
-		this_leaf->id = min_id;
+	return min_id;
+}
+
+static void cache_of_set_id(struct cacheinfo *this_leaf,
+			    struct device_node *cache_node)
+{
+	u32 id = cache_of_calculate_id(cache_node);
+
+	if (id != ~0) {
+		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
 }
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 56fa646df0d1..469d490968ac 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -114,6 +114,7 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+u32 cache_of_calculate_id(struct device_node *np);
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1

