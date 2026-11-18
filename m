Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019825;
	b=kTzBI7hb54ucaLxOyI2LBRuuUVixZ5lAuzhiK2EpgN2XO+2egsyt585c1FcAA5X4qMur
	 3fetleminL61I8rrcqbcaCgv/lVj3SW45JFqXn3ylb+4mOoyhnAevh/X+DqCz4xsRmdEE
	 /rGlscl2IoTGDv2ub2pUlSsZSPB8/paDltfd2cutAU6irnwlB9gFGu5vi4pGQ9zydKaWW
	 qWWLAHTRTTpLheYRbyLM6ocK5CIH2w1DHfB+ngV5E5MqJorJLYW96Qa47R2RFSIaehvPG
	 85NPrpUQxGc8KvPFu7Tp56iNHf/yM/QC3BN+BflKgziS8fsyzKSePCJkwv8kmMunR2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=vPbld+jRy+ImvL9aJUl1cUIrs+dNprkcUncfJ+YpnEs=;
	b=rzC1n+yzkVotgZBmg+MCctiC0cJ2oFELcwQmLRyNKUN8JqITuMRps2ArrH8JCm3R1+k6
	 vSJeT2yxAD3QPMFOgTzNo1a9tFionADfEbhX3U2zUIjfQ7ZlNmP/mtoiDOcWCp1ngwRUR
	 s3SNVuL7+SReegNIQGJ/ZYqQmh7AjGf1SmJ1AhHodvO2W11fIzPvw3wXdFljJ2M6oE5oc
	 VxpSb60/bPzfqCBUmcLzpQ+wSAEILqWPKDwzVgYsh1mSf7T/CFZb19f/0LWPCKh09D1RY
	 9PEKuYpESjTyQrmkdC8m1dFbN48oQiThYhSihlpPSF/tCcRVs2K4rz9izJlMx6h+57A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OG16lIdV;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FD260A2601
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 16:37:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91FD260A2601
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=OG16lIdV
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQKWi1211367;
	Wed, 18 Nov 2026 16:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=vPbld+jRy+ImvL9aJ
	Ul1cUIrs+dNprkcUncfJ+YpnEs=; b=OG16lIdV8SfLS5SCnUcOi37PHE9yecBI6
	C2GhwUGErZMm/rx0Ecbgt+24a8CfyfFxhixHpsqhV72D+WT0sEVV7qT60Haj+yL0
	lxgRDA7bLe5gJsrgkgydF86e4lGtGpJZPzSRXrvQmBTA+zYYsqmKzhvHB7uzjjWy
	NBtGELpXC7+6fdMmSL+s3apoow6dS9XyOcbm3kKaNN/yk/VeBDG8S9oEWgjfRIFq
	aYTZTMWAiXhruwdAHmV2U+hQQeVt/3290IC/MdM1JpW+9pfrMsyCTBAVBMi7HcW8
	jLyXXh+ThYy15PX6ZHvybKMGulMovqjad4cId773EYBA5VHWojPwQ==
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105t3f2p-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 16:36:57 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDYufP2135407;
	Wed, 18 Nov 2026 16:36:56 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j1bb58wcq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 16:36:56 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AIGaqti40567246
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2026 16:36:52 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B689D20049;
	Wed, 18 Nov 2026 16:36:52 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 19E402004B;
	Wed, 18 Nov 2026 16:36:48 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.19.105])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Nov 2026 16:36:47 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, sudeep.holla@kernel.org, ritesh.list@gmail.com,
        tim.c.chen@linux.intel.com, yu.c.chen@intel.com
Subject: [PATCH 1/5] cacheinfo: Allow architectures to provide custom cache IDs
Date: Wed, 18 Nov 2026 22:06:35 +0530
Message-ID: <20261118163639.890546-2-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20261118163639.890546-1-sshegde@linux.ibm.com>
References: <20261118163639.890546-1-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=IouL47/g c=1 sm=1 tr=0 ts=6afdd429 cx=c_pps
 a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=77fLFVlFV3kl4jyPEUwA:9
X-Proofpoint-ORIG-GUID: LDKm0yIWHluatvcqXtTtPjJLc8zIET1R
X-Proofpoint-GUID: Ujf-KMzeesSMAVgwtZLBhxzo5hpPJ323
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX8ZHH0xn71Dah
 Z7n2dTwJtU56+Ft2aODGxrsQ3Feh8B0KqSlAkA5Dd6WF8ANjIO2d6x35OgaTcrhs3V8W38A6gY9
 te8e/QE7bIqfjO7Bo3An1mbCfwu+xFXo+vXrD3lva/PerCdB7A4zS/z7QPDIK4s74etjoF1RPj5
 UJrqFZoWfyD+8XAfApvJn07NF8DLrBJC0TcydsyRY1qaQo2KLuQWljwlqSgsKjH+t+ETe7qKOz+
 3UJUe+yJxLD+JyFlGhow4FE/V8EMEwzNrUzBH5KOvVfoNQ7wB8mL3Uv3LPKCURHb1ZLkvlSp08d
 mDgLOdGqxNYv+OKTmb9gbltkClbZOYKRl/0ObPzmGBWUGbg2RFg1SQYAto3xbmbSIvKQvpQuy6n
 JNKfUipHWddbNY4w9iM9IMXX7KgiR9sesI6WqAKhs5ekbYu3X2JhZl3oLexn8XVPPld0CGwsjgO
 ufSzLhn+T4t5I0arlKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX4wXEZvet/Cqh
 N9xl3BA8muwK0H2l0HahrZ3Lr8gUry+yl/yNeGw/xJetUE1BUYM38O1AW6tDV3mXSEmZ8Epk/I4
 8G1oiwZPvrfBiTz0gzGpU3pzCOrWsUE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180065

On PowerPC, a firmware cache node does not always correspond to a single
hardware cache instance.

For example, a Power11 CPU device-tree node can describe eight threads
and refer to one L2 and L3 cache-node chain:

  CPU node (0-7)
    l2-cache = <L2 node>

  L2 node
    l2-cache = <L3 node>

At the same time, the ibm,thread-groups property divides those threads
into two groups, such as:

  0,2,4,6
  1,3,5,7

Each group represents a separate hardware cache instance, even though
both groups refer to the same firmware L2 and L3 cache nodes.

Generic cacheinfo currently derives the cache ID from the firmware cache
node. It would therefore assign the same ID to both groups and incorrectly
represent all eight threads as sharing one cache.

Allow an architecture to provide the cache ID for a CPU and cache level.
When the architecture supplies an ID, use it instead of deriving one from
the firmware cache node. Otherwise, retain the existing generic behavior.

[Both draft changelog and code are written by LLM]
Assisted-by: LLM 
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 drivers/base/cacheinfo.c  | 43 +++++++++++++++++++++++++++++++--------
 include/linux/cacheinfo.h |  1 +
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index eb8a907f6d50..10a9bbce899e 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -243,22 +243,46 @@ static bool match_cache_node(struct device_node *cpu,
 #define arch_compact_of_hwid(_x)	(_x)
 #endif
 
+/*
+ * Return an architecture-specific cache ID for @cpu and @level.
+ *
+ * Return 0 and store the ID in @id when the architecture provides the
+ * cache identity. Return an error to use the generic firmware-derived
+ * cache ID instead.
+ *
+ * The ID must uniquely identify a cache among caches of the same level
+ * and type.
+ */
+int __weak cacheinfo_get_arch_id(unsigned int cpu, unsigned int level,
+				 unsigned int *id)
+{
+	return -ENOENT;
+}
+
 static void cache_of_set_id(struct cacheinfo *this_leaf,
-			    struct device_node *cache_node)
+			    struct device_node *cache_node,
+			    unsigned int cpu)
 {
-	struct device_node *cpu;
+	struct device_node *cpu_node;
 	u32 min_id = ~0;
+	unsigned int arch_id;
+
+	if (!cacheinfo_get_arch_id(cpu, this_leaf->level, &arch_id)) {
+		this_leaf->id = arch_id;
+		this_leaf->attributes |= CACHE_ID;
+		return;
+	}
 
-	for_each_of_cpu_node(cpu) {
-		u64 id = of_get_cpu_hwid(cpu, 0);
+	for_each_of_cpu_node(cpu_node) {
+		u64 id = of_get_cpu_hwid(cpu_node, 0);
 
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
-			of_node_put(cpu);
+			of_node_put(cpu_node);
 			return;
 		}
 
-		if (match_cache_node(cpu, cache_node))
+		if (match_cache_node(cpu_node, cache_node))
 			min_id = min(min_id, id);
 	}
 
@@ -269,7 +293,8 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 }
 
 static void cache_of_set_props(struct cacheinfo *this_leaf,
-			       struct device_node *np)
+			       struct device_node *np,
+			       unsigned int cpu)
 {
 	/*
 	 * init_cache_level must setup the cache level correctly
@@ -283,7 +308,7 @@ static void cache_of_set_props(struct cacheinfo *this_leaf,
 	cache_get_line_size(this_leaf, np);
 	cache_nr_sets(this_leaf, np);
 	cache_associativity(this_leaf);
-	cache_of_set_id(this_leaf, np);
+	cache_of_set_id(this_leaf, np, cpu);
 }
 
 static int cache_setup_of_node(unsigned int cpu)
@@ -309,7 +334,7 @@ static int cache_setup_of_node(unsigned int cpu)
 			if (!np)
 				break;
 		}
-		cache_of_set_props(this_leaf, np);
+		cache_of_set_props(this_leaf, np, cpu);
 		this_leaf->fw_token = np;
 		index++;
 	}
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index 56fa646df0d1..d3557a1b464b 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -93,6 +93,7 @@ bool last_level_cache_is_shared(unsigned int cpu_x, unsigned int cpu_y);
 struct cacheinfo *get_cpu_cacheinfo_llc(unsigned int cpu);
 int fetch_cache_info(unsigned int cpu);
 int detect_cache_attributes(unsigned int cpu);
+int cacheinfo_get_arch_id(unsigned int cpu, unsigned int level, unsigned int *id);
 #ifndef CONFIG_ACPI_PPTT
 /*
  * acpi_get_cache_info() is only called on ACPI enabled
-- 
2.54.0

