Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A5C36D517
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455406; cv=none; b=X2Rm5+v5L55+vZt1CUqKHPyQ7FWm9vVk8G2Dbjk1OuO52JZlpfcy0f0otuu+DFTS2nbF/T3Rx4fwbeqzKKD4sYPaNBoC5NomXeqRDD3mMhVjMt25/AJwpYzg1d/Ypogr1V7k5sn6fWn7qNPo4974JudgjTIsCZj1+bv+EEFIYG4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455406; c=relaxed/simple;
	bh=N3m1XL0qPMrLpj2KyTA3YfQe/8CjzIGFh9rILUSGz/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=q0k5a1/sbEFerv1oa+eBIoYKZw9KOIq4Bl0HcRwnuLKdUd6BYFhTyJZ5drjqQRWxHZrw0HRIXKgLcd0edWb5pB5YvT50BIl4iB7XiICeKlW/qtYgtJdfZHMsOUFt8ULAvpBGBv2ehXMk0kf9PVKQMVI6mDxBz2oIedga6ebw8Ls=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pp5HpowA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VbpKL1yy; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pp5HpowA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VbpKL1yy"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWigK3718141
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=; b=pp5HpowAMbgw8XdN
	eTRCiktsKj+M4AUVnmlr4Ynh4R2fkZal+MF4jaJh75PD+rku+wMTVXiAcCBBIQp/
	4qb4z1JUHmrzKUah7TT+dF78K1p883uQMyMPCVduVb3AhdwT1/Cs4PfkA1JYXQsy
	YlKt/HJXuFMycAn1XybF/aZpcmdmGGKnOrEIl1Db8SEnbR7N0CI7Yi/4ALld637f
	fO8oM5J1dq3KBqhUr3ZBfI1k7X90u7J2kQX29RMaXsRikf6bLtEf1snyY1MTEtwQ
	290K+amicVP0mfBsoRX9tV1e8LWkay5p+QWg18z0VfI/MjLyNwCq5E9URUpoCAJk
	Lp8IgA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fyxwesfhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:33 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cfa55c9430so29977415ad.0
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455392; x=1787060192; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=;
        b=VbpKL1yyUbMLatmRH/MhXHvv+5LYDu62mS/7FzFGVOp4a23HrUIxF8cG7cb9uvf0bY
         qURmlV7GhH94N0tJYFgrCCrET4FWp25ncJpB/mrpgfcUo5NCuUc0EeTkrzdZmuUwgkT2
         CW2346SSKbJ4KS9xHYTPuVdF4mMe/EEjG8NcyIX4oF4fMhIB73DfUG8whkPDsKkBh4nl
         Qe7Q209m0EKR7TxAzGtcxshnNqmSMLfHcGbDIMFQKKTs6inw99eNQnjfBi8+WCFg5OOz
         ZYsg29Xw9IVkJUtTFWMNkxdWeAdACEsl439zcMIvm7tGcSIwZDcSRcbYvnFMDnEHzLjJ
         9a3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455392; x=1787060192;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=;
        b=qOZ/DsnfTLYIisRETZXtf57OutE5zIX4EcaGPDhjcMQOGESglDJQ/7tr8ekRV9QSnX
         OVud9WwiVY/NA+J4rn3WhJ4woJsldwnDyvFD47X6cd65VynYZEFbI/ahtBZhNG7SwQwG
         /G0k1PDSB06ZnEF/g9J4e/MnehaX5/2cR9W4Kl7p4Xa2Adl8tuCd7xJrJ9+3wWOiQBLO
         5fZpgjnGdzTqp1+QJCBY0n1o9WGudlEXTXzAAYqVv6VYOWmaM6QzjsmvCBwJCUgj7Kkn
         huYNbgzSPm91JixyDKEBD6qJdlR6WR1pvFVxtrUTBvq6RhJw17AxcENzAJ0EuKVSyw8r
         aaUQ==
X-Forwarded-Encrypted: i=1; AHgh+RpHAafQacwqYGG++i//Sk8vq/J6cKP0VbzfbE7yarE6oa1ajwcarUWvvqGJkHY3g8EpaQy7fndQnABfdQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDZykKMctAlD0QCzlvnYgX0b6VLZL3gBDJrzYzlmV74GnV2CZx
	ZZov/NCUzvO0rL2yfN/6JAlNkZlLSgY4L7RXi9aH3lwJv/WzBQxpR5lMZ8rK3WQebNLM2SZQ4+W
	fdOK/pCe3kV4NfsDMa1q/Fqyhc1qQpxnHhzB9dVdEKFx3P5QA+GxuW5b7eSpKnDaTqg==
X-Gm-Gg: AR+sD10SIJR2MbsKvKTWwEc2qADOvXIf9I8w8AgowKpI7Oi/uCxDlaCrzQF2y5IIIjF
	Z0vD9YfB9+HjAE8QnYH5qh9ajnNdrAFmo+Ly9illr7uBpUk9DB83NwIHroqBiKaIGgAqThh1nie
	a1ecYtnndNPvSg4UrvjPfEnuwmT8LjoLtpN7T44ZIO0h4RjMWV9tOrDs4i96QD1GHWiPoL7G+Up
	Tk6m0PLr6hdOan1nafUPgf/OXMW2bwT/AW1Fzh1C7LQ7VOJsJBJKLby995AdPBHgno5I0p0ikks
	j2HCIllYBhXF9dPG1BmSHSttzwtHZHZxbqrD6d3PzhPnL9m35AwipbPf5SzU4A1M/bZq+fcW+ht
	mJjdM7kUFeZK5VhoWLwgfDkeXAWEYhDOcyB+o+iRCj2bPzDb6eNeOnVVw
X-Received: by 2002:a17:903:3806:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2d317980936mr42837035ad.21.1786455392005;
        Tue, 11 Aug 2026 06:36:32 -0700 (PDT)
X-Received: by 2002:a17:903:3806:b0:2c0:e2ea:6b0c with SMTP id d9443c01a7336-2d317980936mr42836205ad.21.1786455391438;
        Tue, 11 Aug 2026 06:36:31 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.36.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:36:31 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:31 +0800
Subject: [PATCH RFC 02/15] cacheinfo: Expose the code to generate a
 cache-id from a device_node
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-2-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455318; l=2592;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=MXjxI8aXZOve7L6eY3Z0pfsNkIuJWimjX2RUSvdJo0s=;
 b=tFvguMHAOvkvqMWbftI7gnFeyKM08znnE0fHHSS1YnhpWLICqjPJfxeyU9haSU0Ald7wq36s/
 iaEcEDz8J/TA41xAWG0xgBTzt24tbfixOhDF892Zf1EP6Wq2tJuCwpY
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-GUID: 5dSd_I0fU0qQKdTKk-raUBqzdF9Yxfkw
X-Authority-Analysis: v=2.4 cv=K8QS2SWI c=1 sm=1 tr=0 ts=6a7b2561 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YGyWITW8jF7qUHxv7J4A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: 5dSd_I0fU0qQKdTKk-raUBqzdF9Yxfkw
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX+Xs/REAL8Szz
 aL9s2TjifPnpUus2Ktj8X5VFR5tPks3HsbDoeZFmrkBWa8WZNtoMKyGY49NI6IGDlrbSDdI8bB9
 wD7xCzTW5S4d87rztL4xUMsYxnSJnF4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX/AQYMUlAOLA3
 XurvayIRy58bYjfwS2IBRFlUYv0A2Z71i5IrDQabqnz0JTZuB6yE7ZKCNjpIFoAH74SqbyKNHbj
 foDRV4vCJNnhcrwY5IJVB9yGcbflPIWtf4n9iJIyqDpa9HVYt8UwAL0L5fZ1vVY/Igr64ziAfCA
 owqARPrl5km4bcD0KiHX2D2/F/W5xUT9P5tGQek9NYbpE6yX7yJZWgWC42jWHLhYyGovBmKU0MK
 CmBBIbjMhSPgXW2SQ0JkeIQb8WgG2OGYeH8/6qhHVfktOlDNmpxZYBIt6J8tmWAeU2NIAdsKAt5
 Cvcjjlq5ZG2JmWbvDr9FqZ8pp8N7ICnIAaRpl0pFkmEcSNTfxBwIVpq0dEA++c5+9SxC5wCQFBc
 DfV/hTT99LcvICFI1ObvjjjtbhUY2IKISL8i4YUdEW1BMeN3R85ZHafzB+W8ETIOqrTMf+5JxZH
 b4S0nTe1JGweErsLSZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 spamscore=0 priorityscore=1501 bulkscore=0
 clxscore=1015 phishscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

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
[ Yin Li: fix context conflicts in cacheinfo.c and cacheinfo.h; guard the
  cache_of_calculate_id() declaration with CONFIG_OF to prevent build
  errors when CONFIG_OF is not set ]
Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c  | 17 ++++++++++++-----
 include/linux/cacheinfo.h |  3 +++
 2 files changed, 15 insertions(+), 5 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 9f9c72727a05..f75e7f64038b 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -226,8 +226,7 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
-static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
 	u32 min_id = ~0;
@@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
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
index fc879ac4cc4f..c33bb3c8bd63 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -113,6 +113,9 @@ int acpi_get_cache_info(unsigned int cpu,
 #endif
 
 const struct attribute_group *cache_get_priv_group(struct cacheinfo *this_leaf);
+#ifdef CONFIG_OF
+u32 cache_of_calculate_id(struct device_node *np);
+#endif
 
 /*
  * Get the cacheinfo structure for the cache associated with @cpu at

-- 
2.34.1

