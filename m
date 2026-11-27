Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793018;
	b=4ExQPhU5FfzhPcFIIc9RBm5dJt+l8lO/mJytNpBI8vBLAH+Ek0m0LWrd00DWR/EjkmEJ
	 HuTm0WOUzBCbVC562HksvXYIcqQ06TM3YLr4QoG9HD/NvTWrXeU0E1888DgRlMUIHdSGk
	 hsMAijeC3QR/opURcc2KKJ3aX+l+MMJZFMZc2+cP7+gSBPJ7aLN62DeAn2kTIw7nVApcn
	 +mR/tFKB4+zFBszBaIzLgv9GrEFMzlF4DA1JWOgN1Yq1UgKj/3tRHqcCVkm0AAE+NTkFd
	 cBhR1rURGAb2IJal/5ItZ5UKH1/zD11yu7/k9XB3WSw0Dl1mQZF1E/zMk4b6kBxQWPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793018;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GikI0QYq6+kifLTocGiWuTnJ1tNj32BFxwWIkhXSL4Q=;
	b=jRcz9BXszASXilxZmTPoWLLl2o0MsysZt7aaS+x0zmoT+8LOwh1l/7h+04kLS8O5RELR
	 IyZhVTLARFOV+Se+UKxpr1/OUJ1Wu9eNuISHa5j+xfU8cWdUdk3PkfaFzIuDp4Q0XzZki
	 wmIlCZwAgYuvJYSuLzQ+CWDuZgyB53y5TBiMD8NnpmJwfaM+3nJkxTH9xf8vw8Cn7207W
	 0xisKQGY3aGw9SpbvA9tvvK6C+QYOTLsfQnK5evQMG67kazFhFW55goEto7asREIHkI7P
	 vK+9Ji+Rw3gCff1J6jpMP4sV32iBXGRu23rf/8LsvKFE+Hxd+uiCkW90mVf3nByxYFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EySxQzli;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB33606A327
	for <driver-core@lists.linux.dev>; Fri, 27 Nov 2026 15:23:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABB33606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=EySxQzli
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4fpU3234322;
	Fri, 27 Nov 2026 15:23:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=GikI0QYq6+kifLToc
	GiWuTnJ1tNj32BFxwWIkhXSL4Q=; b=EySxQzlimAdD6fZD0m10kTUB35nEcJE26
	ZgO2Iy8iUT1OFbAv1OPcsHSLKbkZ08ySVviMdD7nWDmJx9T4EaqOKGPVyzq+138j
	UbSAKkOHYzO9YLtcORd/niqqcxttNp18E3K1kJlpXE8PETbXcoEgEiQSuhUwfeeE
	pDx5JOR3ctV66zZIkX9+ESqECKVKQGU/cDKzI1VNZS6d1FaKnY3kux2ukLRlaQWZ
	z90X5+sMHqSXHtEm5cN3lrRffA1HeqWuLTQMY45Zx7jg2Ub7reyhoVE2KuTyV33M
	+2txHQf6AYgnfkrwzqzrc2dZCAtHkPiJj2Pv6+9jIT0l81WA7Cy4g==
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34gvnpm2-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:23:04 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4FLO3892937;
	Fri, 27 Nov 2026 15:23:03 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j6uccu3xs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:23:03 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARFMx8v55575028
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 15:22:59 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A81D22004B;
	Fri, 27 Nov 2026 15:22:59 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5CDB620040;
	Fri, 27 Nov 2026 15:22:54 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.16.105])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 15:22:54 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu, ritesh.list@gmail.com,
        tim.c.chen@linux.intel.com, yu.c.chen@intel.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, sudeep.holla@kernel.org, peterz@infradead.org,
        tglx@kernel.org, kprateek.nayak@amd.com, srikar@linux.ibm.com
Subject: [PATCH v2 1/6] cacheinfo: Allow architectures to provide custom cache IDs
Date: Fri, 27 Nov 2026 20:52:37 +0530
Message-ID: <20261127152242.306333-2-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=CYCdd7rl c=1 sm=1 tr=0 ts=6b09a058 cx=c_pps
 a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8 a=77fLFVlFV3kl4jyPEUwA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MCBTYWx0ZWRfX9k6tSI076u9y
 kRJn5XzhhlKCiq7TWrgWF2T9MYw7Hiuq8QzFJO2Gt4aq+spqEd1cbr3DdDpuvS9NBdx3fFnklvB
 01FMM55CPIaguXfYA0OvVBz3okfY61Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MCBTYWx0ZWRfX1DEpG1BJXs6M
 C5BBydmqls8GefGVnvX3Nqt9dz1OrQvU3wxJl6kgPbuXcjdAsIMeV17a2nZaeFYTQf7vOcAcw0V
 IeSYbzBiN+RwBS5uc0hLW+YKUKP6ZRwIE2VvZsCBqAthDSnIz+5ObQo1na6jXQSWnCr3qewK4P0
 oHOmSAYtGfEzgPd9W96g/MyPgE+HF5zz6qszJC+Ewfpl+suI+EeQC2X557F1c122Zr/q/qU3WN8
 rmHBI2Ltwvcx+YmYkqWigGtnUUkJlbQmP0hEvIgwXHYzh3cAdeeg/neOHsoxXrgm/6G5YIbqXD4
 gL2eAxgAFwkvCHUAJMTqLikLwC9DMA+EMRQotQncJsIMBqrqfxXxAu4pHTN0jaY+V65Ert93g+E
 GzAGsB4SVj/oLetoWJmJdldqHDSXSdEbIcdOtFOITF3q88zwaM/1WVifurvfE0fRUdQZbZucwit
 LA/e5C96PpB/3NZPHkQ==
X-Proofpoint-ORIG-GUID: m5FkjCHmoI9Jt-2mZyLAIHagshm2K40_
X-Proofpoint-GUID: OhHw4PqEfsOWr59Oyi0227E8FFQgzyex
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 clxscore=1015 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270060

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

[Both draft changelog and code are written by LLM under guidance]
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
2.52.0

