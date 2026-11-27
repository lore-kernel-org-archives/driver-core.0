Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793014;
	b=d+qWQw289/9AnTgIwf1WqAinYQP67qFCyEiJCS/2yYl/4IRzZ2jvST9PH1n3Q88uQCn9
	 q0WvjwQgsiwM4w4FScaUEh95Vz84IFLBdPvAG43vHjg7faaQnT6e0M/gzrESPzs67hK9F
	 u1A1bOi8l7YR/zd2qWVE0zKXosc8K4Zuotxa9fEA/ANag25h1geWMGR1wuQnp0UdkFhOJ
	 x0lmMRKbcj+5fETeK/K6zsk8TONKndzvaOmmy+ZY28ioW374ppOVCnUKGZkQAr1F9KvXK
	 tNU3ASerk8hW8HJFR2yYnqSwc975udi2CCHt6WyB7IHEwd287Zrk1AmWef/bKIO972A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793014;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=+fupf6lvO00F5v0Mc4Ym4lHQfcOxw66+HeSzTfZRHb8=;
	b=xsRCk4bOsQKRwG6li8LsTQGeDVvmdolUWYLUmh3I0eisTiF2hvqRZxfr5zXE3Dk0JTVj
	 giKgjo0uDVjReqYTp73vWG0rhaMkL/uY0NyioDIrAI4E/crWgOpLH5/4uw3nLETqg+Sek
	 qz/2IEf9DiL62MeGWobZVsOWiIZBBd2d2KeQT1oJR4sC5hc+uEadyQwfF2d7Kzo2rLKu1
	 koTtF3bp/HtCRbxUzbPrdRta0MnQsh2ljiOiKH7hZubRCfuGoaaGXGv7LEGzly1m+dMJe
	 BC1WvfNNm9ePkefAvYB0jQEMtEXekT5Ae5jmdfQ8CWQnmdVs5rQ5YiGuRACoeVeX5Sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b="fMdgU/V6";
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8006B606A31C
	for <driver-core@lists.linux.dev>; Fri, 27 Nov 2026 15:23:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8006B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=fMdgU/V6
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4r283266648;
	Fri, 27 Nov 2026 15:23:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=+fupf6lvO00F5v0Mc
	4Ym4lHQfcOxw66+HeSzTfZRHb8=; b=fMdgU/V6s/HCosDjUoQzos+hQs1whF73U
	akPMHje6Xeq0NkpMaRZhSJ5Slws9xVxBoBqErnqwCjXmr8LXLH5CtSxfiKILeUQw
	D32pIKTnBMnNMhFYhsmzwlk+VsbN5jLDtkk4CLadRs8xn5k5WfWAHxsi1iD/vWeq
	1a4neTQbf7ykVGalO9n5heFcVEtGSdkgUKxQGu+e4OAnuPuP7X50gOIJrgiEPU7B
	9qGLNQPEGIHXjS0AfpjVLr4PWgDP+7LzgrcUnZptwHGU1M6VTXuLYmEnBYDnki1h
	Ej8CTXsoBoJHg78E1Orl/bq3orLXbvhV/CogQ2EtYNDKda05z+ZKQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fkxdjt-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:23:11 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4ENm1180971;
	Fri, 27 Nov 2026 15:23:10 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j6rhckr61-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:23:10 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARFN6an53412098
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 15:23:06 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E468B2004F;
	Fri, 27 Nov 2026 15:23:05 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 30D3020040;
	Fri, 27 Nov 2026 15:23:00 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.16.105])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 15:22:59 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu, ritesh.list@gmail.com,
        tim.c.chen@linux.intel.com, yu.c.chen@intel.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, sudeep.holla@kernel.org, peterz@infradead.org,
        tglx@kernel.org, kprateek.nayak@amd.com, srikar@linux.ibm.com
Subject: [PATCH v2 2/6] cacheinfo: Support unified caches described by d-cache properties
Date: Fri, 27 Nov 2026 20:52:38 +0530
Message-ID: <20261127152242.306333-3-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261127152242.306333-1-sshegde@linux.ibm.com>
References: <20261127152242.306333-1-sshegde@linux.ibm.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MCBTYWx0ZWRfX7A/2KmqAbOdk
 lqlvw18444F9iqfmDKXp4+mDdsvlFf/TLM8yfM2T5D7gAqgFGaEz26sjssO/q1fcy8pKS+xaA1G
 maENqq5c8AtDaIBIpj2xNA3NZrJmrlAdPHtjI9+3Q2X6BgfHdqLKu/1eamJ0iI1QZ99K556oEv/
 mYW4L4qs8Qk1IoaJ7k9QA6ggWBlyejVnr0zR7wFeAp5HpnaNbfihF8oEy6Yw2dh9N3Y5ekKvQX8
 IBaZQODGbsoUVn5sOrbeaLvUSZBVxtkxsMGOYFaCFlrXzMG5o+frpAmPVtCqnzqzM665tsVISzx
 nni15/5cHQ66DS04zQh0Hxz5F1MR1XrbsNvHKfEC21Q+UhcbOqIMGsyXrLntsw4+3RrfGMmeG7Q
 IiKja4tOky7YAonVdpc6KVWi8oHrs+esb1xv4kLMnx0wy2VTD3DjhiCUIDsx7jRuoA/3BsmO0RU
 XzCKJfBaSiFJrKfQkaQ==
X-Proofpoint-ORIG-GUID: c-0GeN-vVU-5ogbCifPbbxvHpe5sxh5A
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MCBTYWx0ZWRfX+GRTnyrVbpjR
 8Dv/xwEmwzw+4v0rYJbza/zsgMAs3c8Q/Y5TfPy/nl5fDhEHAfJf8UOvFHRhUnUJT42TXNlZTWq
 hZZ0rLulStqbctovcyASOZKopmkOPHw=
X-Authority-Analysis: v=2.4 cv=A9z5rKWG c=1 sm=1 tr=0 ts=6b09a060 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=t_fYOQ62Ex-2Ni1ZEtoA:9
X-Proofpoint-GUID: RuOKydFePPLanC_e1rO2aHKrnu8v2VEX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 phishscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270060

PowerPC device trees commonly describe a unified cache using d-cache-*
properties.

For example, Power11 L2 and L3 cache nodes have cache-unified together
with properties such as:

  d-cache-size
  d-cache-line-size
  d-cache-sets

They do not provide the corresponding cache-size, cache-line-size and
cache-sets properties expected by generic cacheinfo for a unified cache.

When a unified cache node does not contain cache-size but contains
d-cache-size, select the data-cache property set. This only changes which
device-tree properties are read. The cache leaf remains
CACHE_TYPE_UNIFIED.

[Both draft changelog and code are written by LLM under guidance]
Assisted-by: LLM
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
A Subsequent optimization if the series is in an acceptable shape.

Cache the idx first and then use it in cache_size, cache_get_line_size
and cache_nr_sets.

 drivers/base/cacheinfo.c | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 10a9bbce899e..4a23377e9312 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -148,11 +148,21 @@ static const struct cache_type_info cache_type_info[] = {
 	},
 };
 
-static inline int get_cacheinfo_idx(enum cache_type type)
+static inline int get_cacheinfo_idx(enum cache_type type, struct device_node *np)
 {
-	if (type == CACHE_TYPE_UNIFIED)
-		return 0;
-	return type;
+	if (type != CACHE_TYPE_UNIFIED)
+		return type;
+
+	/*
+	 * Some device-tree bindings describe unified caches using
+	 * d-cache-* properties. Select the data-cache property set
+	 * without changing the cache leaf type.
+	 */
+	if (!of_property_present(np, "cache-size") &&
+	    of_property_present(np, "d-cache-size"))
+		return CACHE_TYPE_DATA;
+
+	return 0;
 }
 
 static void cache_size(struct cacheinfo *this_leaf, struct device_node *np)
@@ -160,7 +170,7 @@ static void cache_size(struct cacheinfo *this_leaf, struct device_node *np)
 	const char *propname;
 	int ct_idx;
 
-	ct_idx = get_cacheinfo_idx(this_leaf->type);
+	ct_idx = get_cacheinfo_idx(this_leaf->type, np);
 	propname = cache_type_info[ct_idx].size_prop;
 
 	of_property_read_u32(np, propname, &this_leaf->size);
@@ -172,7 +182,7 @@ static void cache_get_line_size(struct cacheinfo *this_leaf,
 {
 	int i, lim, ct_idx;
 
-	ct_idx = get_cacheinfo_idx(this_leaf->type);
+	ct_idx = get_cacheinfo_idx(this_leaf->type, np);
 	lim = ARRAY_SIZE(cache_type_info[ct_idx].line_size_props);
 
 	for (i = 0; i < lim; i++) {
@@ -194,7 +204,7 @@ static void cache_nr_sets(struct cacheinfo *this_leaf, struct device_node *np)
 	const char *propname;
 	int ct_idx;
 
-	ct_idx = get_cacheinfo_idx(this_leaf->type);
+	ct_idx = get_cacheinfo_idx(this_leaf->type, np);
 	propname = cache_type_info[ct_idx].nr_sets_prop;
 
 	of_property_read_u32(np, propname, &this_leaf->number_of_sets);
-- 
2.52.0

