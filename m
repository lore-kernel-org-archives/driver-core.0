Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44674445AC6
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455451; cv=none; b=cwKW3wgsjqtVYj1sW5EeKAQvPY2Brl6QjLJ9AdV3//tWz8/iWcqh2rmxVVrDkQzm7m0qAaDNiEH5qvEcgcgWDqmF6tStHsg5mHyW66p9zqmx6po5V+GP2uxPQ4Q1mHbLQplsNdSdSoVtdl38bjVN5vnn51ZGTVm9+oKeKpugoU0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455451; c=relaxed/simple;
	bh=ymwbh8u44vkobEnUNavx3BKuZvBYr3sz2YSjbnof65Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S4qRdxdUKqUgimu5gW7TmYqzMh0T/+isZClWRxniCVntVS1L3TVUgL1wTSyUk/1j15a65eRq/WoWxalSnS+TEbSgd9fB3yS30fxYokGCRAzy3kJWzJd5e2U2iLPl0YZ7za/Zd8vlRLz+gvErLrAD83D6OdZh4C4DCjylmVkeDT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iJqiiqhA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=K5VfZFhU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iJqiiqhA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="K5VfZFhU"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDXIYw767424
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7J2v22m35Gt/8OiuOYM3wU1cSpg6q72MrGm4kNkp73Y=; b=iJqiiqhATarmJOw9
	8iOdpfOpCDy4MN9ECNY9xX7cfNVW4PTiSq9fjvjMkAjNjvZXCknyYTo8d0wd0446
	uUw88mq8Sie67XW0AVrzls1hq8Ln8pGcizu1PdBXO6oms5x3EXLB6brbWubx0D+O
	Oadp+fysMKmrgJnE7IK9loaqusH7k8YvpVZVCH7ji86vICnRnCdlcmR0eNJTamL2
	YBRIzOALqQGjgcG/krptYPubJ7a4qzcBb8xYlpQlRtLTAzpoqqcfYT+xHr1RuLyW
	AFDn7RpAswJgHtMshAPS+GGWSTGTN0vh/XFynHu1LI8FMN2+hNxS9uZxyJxkdfLt
	EWkOfw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g01nc0r5k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:36:56 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf1c86963bso8877365ad.0
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:36:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455416; x=1787060216; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7J2v22m35Gt/8OiuOYM3wU1cSpg6q72MrGm4kNkp73Y=;
        b=K5VfZFhUX5n9q0aXJlJyxmHs7eOwPuCjSjrKBCKNmD3t+cVtfE9KzxqiJD6ptvT8nV
         niazzKUxZTqICl+zzQhXCdElmKDwzZCY9T2z7X81/jlflButo8xuChnzbmTSbMypDbOo
         2acb+mfEmxsGrWm6B3lEoP+fF/SV2Nxb+RpaUmiLL4Ftx5DHV1WlTcn3R9bIFl8oXqhK
         Wm/qLN0PwYCaYM4bMukVLiP/PofJRw2F/eXtFt4d4vZa8mU5o2yUePyQkEjyFHQzPYja
         +w96l1JBMi3tXnrkav0qR2zKs6uxiBxv5l5bdeu+V9owHo9+wKkmR7v84HZmHeyzixZX
         13xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455416; x=1787060216;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7J2v22m35Gt/8OiuOYM3wU1cSpg6q72MrGm4kNkp73Y=;
        b=WG5JMx3wInmaC6ZL+y51/XgmOfAhy0n5Ouh0MUDpiMGoeH/79YqzC7vwzz+/OW2SiV
         2q1nof+UnAT/x2+Pje2knP2lgXoCceIrw/+logHqrjB5QFqgN7ThOFgB6WI+1xDBThCV
         yk5+CX/VQiS+ZRvhrrf4tenpcZRHC/7HDZKTeZNJFpBi1sdefrYTGg9UVdBs8mhe0BQQ
         aLXYARnDh5GbhC9/aIaDdDaaxqnX8Hq///Gq9glK2lwP4A2/56bNKdFJc4myQCh8HLOh
         bDbNfVDeulEOLzgDftjgprWdus021o+Snuq4iRRrJrO6/q/2TgRbKvA43I9Ny+mCnrH3
         JIuQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro8xGAfyPEgiKER2TAL2ryLFNohNXJt8r21IWlcNetVJmO9WwJDWJIkZ3dL92n1zneKxngBbdIP+xXiyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzv4nNE1klMoDLniB0h8seTg42gw41YkRGCIi5oFOps7b7tXpog
	CzflBRX6IYr/RE4I6veQlNWDM3655D70wdD1e5++XrqrqMUkVGbxvgpQ1wKIYPuoMjZjmGjw0Pl
	lmGJgZiNFHSRT2R2oZzd311V4mjph100XWCwtyOLH3uJ2fw0tsGy+2TlbmuZRj/CTHA==
X-Gm-Gg: AR+sD131GMLDjAeIV7DCuyovP4w7yZEBWCSMrXAH6OfwcSPh2njtrPkXLgnl+gI/NRG
	InSOhUuWg9k/z/TOdH3wwRIPSr4W9EwJxkZ3gXAyS6AsZHuSQ6L5PIFqrZk/4n5N4fzX15ppICS
	671qsmNIae/Awclepg+DHjvdpxDW95FoTXu5807Q1oOnl88F+hSozhVd4j48RwYQnp/i0dTAsYw
	3zyUda68QkBphyeSDGWoFZ1LEVL2FTkOs3m9waddMEJ/eVjQz+ddkriuXDb9s7wWePkzh9VFGDa
	/DGo7dTQDo72E71izJ1FyabKSIEXtfILn3o+12UZ+ZaH4fmmHypBui8CqORTq4IJhfVQol16kFq
	Ai/Q5o8p9E/vPuZJU+zBAZA/d8KGfKogo7WP5t2khMQ/WY/n7UsVq37yL
X-Received: by 2002:a17:903:1988:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d32da51aeamr2670835ad.10.1786455415630;
        Tue, 11 Aug 2026 06:36:55 -0700 (PDT)
X-Received: by 2002:a17:903:1988:b0:2cf:af20:4254 with SMTP id d9443c01a7336-2d32da51aeamr2669955ad.10.1786455415094;
        Tue, 11 Aug 2026 06:36:55 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:36:54 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:35 +0800
Subject: [PATCH RFC 06/15] arm_mpam: Fix cache ID sentinel from ~0UL to
 U32_MAX to match u32 return type
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-6-ea6397bead59@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455322; l=5227;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=ymwbh8u44vkobEnUNavx3BKuZvBYr3sz2YSjbnof65Q=;
 b=+LZYGi8ewx6eKunxSNDZIGYha1pAL9rpkB9MS92MpHT7MW7vvdt4r3E1WySGSvZ08nniNkj07
 kKFIGeFJdeyC0cDkG+Zk7KdN6XIXAC564d/70sj0l0u9omQoynZwz1D
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfXxfiz4bKBB3nD
 HrEtN2G0ufEZ/kBCCkNqH21NBAG/O4pAiesqPKDrrqhAFoWxjKg5rNuWxXWfTM5hVgFRZmsDKgd
 NEvvdvy6AUR8Ho5SmEIiC74cLEyjjb4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX/r5T2yfiNTTw
 RdUd+zLX+6WlPko/6EwHO9V7xJ7Sy5hcS69iFYlljym2CQ9blFnyDifnFdJa3hanc0WgfEpIodb
 CwhOCIWXoqZ0+AiAAGe3HWMwzeQHAFflBVZb5hunlzk7mDaBD3RhBhwKYwQl5yJuCMLyr9mZbrB
 T3YkXrm5ygkyZ8DWZc2elzK1Fj/NIOcHC1RDlgjUyEa00niHyjyXHDQchgOeQd49XoBMhOBOv5C
 qk9gHNMGLm3OSBl6yo4b384U9yMoss0xDT8nhwIkNJ8fDnSCDli0xN4WhTp169cmfXkItgYRYZ2
 8OVTYVs3OGkIbnsCaTszAgVFhsj3arym/z8VrlEFld4d6hbBWIdSA1HPIEj7x+Ug7XJfQnZNLCE
 eWvwYdw59mx0eJwQ3RkY/pZ95Bnz4Vh/cB1l1/yJRLHsH7jigSQ+SLzWJfoQ9e4/sOmvmlBdzwl
 jI2SbUxoqtB5j8aee+g==
X-Authority-Analysis: v=2.4 cv=RY6gzVtv c=1 sm=1 tr=0 ts=6a7b2578 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=SLaofbU1Rv5Q4-V7Ds8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: QLw0_p7LCELMmLmas3KNvfMqWixrueG4
X-Proofpoint-GUID: QLw0_p7LCELMmLmas3KNvfMqWixrueG4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 adultscore=0 suspectscore=0 spamscore=0
 malwarescore=0 clxscore=1011 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608110114

cache_of_calculate_id() returns u32, but callers stored the result in
unsigned long variables and compared against ~0UL. On 64-bit systems,
U32_MAX (0xffffffff) assigned to unsigned long becomes 0x00000000ffffffff,
which does not equal ~0UL (0xffffffffffffffff), so invalid cache IDs are
silently accepted instead of being rejected.

Fix by changing all cache ID and component ID variables that receive the
return value of cache_of_calculate_id() to u32, and replace all ~0 and
~0UL sentinel comparisons with U32_MAX.

Also fix the sentinel values in cache_of_calculate_id() itself for
consistency.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/base/cacheinfo.c        |  6 +++---
 drivers/resctrl/mpam_devices.c  | 16 ++++++++--------
 drivers/resctrl/mpam_internal.h |  2 +-
 3 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index f75e7f64038b..a4e0d1d47e71 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -229,7 +229,7 @@ static bool match_cache_node(struct device_node *cpu,
 u32 cache_of_calculate_id(struct device_node *cache_node)
 {
 	struct device_node *cpu;
-	u32 min_id = ~0;
+	u32 min_id = U32_MAX;
 
 	for_each_of_cpu_node(cpu) {
 		u64 id = of_get_cpu_hwid(cpu, 0);
@@ -237,7 +237,7 @@ u32 cache_of_calculate_id(struct device_node *cache_node)
 		id = arch_compact_of_hwid(id);
 		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
 			of_node_put(cpu);
-			return ~0;
+			return U32_MAX;
 		}
 
 		if (match_cache_node(cpu, cache_node))
@@ -252,7 +252,7 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
 {
 	u32 id = cache_of_calculate_id(cache_node);
 
-	if (id != ~0) {
+	if (id != U32_MAX) {
 		this_leaf->id = id;
 		this_leaf->attributes |= CACHE_ID;
 	}
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 559fa09128b4..ddc15249ec1e 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -166,13 +166,13 @@ static void mpam_free_garbage(void)
 
 /* Called recursively to walk the list of caches from a particular CPU */
 static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_node,
-					     unsigned long cache_id,
+					     u32 cache_id,
 					     u32 cache_level,
 					     cpumask_t *affinity)
 {
 	int err;
 	u32 iter_level;
-	unsigned long iter_cache_id;
+	u32 iter_cache_id;
 	struct device_node *iter_node __free(device_node) = of_find_next_cache_node(cache_node);
 
 	if (!iter_node)
@@ -187,7 +187,7 @@ static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_
 	 * during device_initcall(). Use cache_of_calculate_id().
 	 */
 	iter_cache_id = cache_of_calculate_id(iter_node);
-	if (iter_cache_id == ~0UL)
+	if (iter_cache_id == U32_MAX)
 		return;
 
 	if (iter_level == cache_level && iter_cache_id == cache_id)
@@ -202,7 +202,7 @@ static void __mpam_get_cpumask_from_cache_id(int cpu, struct device_node *cache_
  * The cacheinfo structures are only populated when CPUs are online.
  * This helper walks the device tree to include offline CPUs too.
  */
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
+int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
 				   cpumask_t *affinity)
 {
 	int cpu;
@@ -229,7 +229,7 @@ static int get_cpumask_from_cache(struct device_node *cache,
 {
 	int err;
 	u32 cache_level;
-	unsigned long cache_id;
+	u32 cache_id;
 
 	err = of_property_read_u32(cache, "cache-level", &cache_level);
 	if (err) {
@@ -238,7 +238,7 @@ static int get_cpumask_from_cache(struct device_node *cache,
 	}
 
 	cache_id = cache_of_calculate_id(cache);
-	if (cache_id == ~0UL) {
+	if (cache_id == U32_MAX) {
 		pr_err("Failed to calculate cache-id from cache node\n");
 		return -ENOENT;
 	}
@@ -264,7 +264,7 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 {
 	int err = 0;
 	u32 class_id = 0;
-	unsigned long component_id = 0;
+	u32 component_id = 0;
 	struct device *dev = &msc->pdev->dev;
 	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
 	struct device_node *cache __free(device_node) = NULL;
@@ -308,7 +308,7 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
 			return err;
 		}
 		component_id = cache_of_calculate_id(cache);
-		if (component_id == ~0) {
+		if (component_id == U32_MAX) {
 			dev_err_once(dev, "Failed to calculate cache-id\n");
 			return -ENOENT;
 		}
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index def0e3a65c23..aa45d00bcd07 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -470,7 +470,7 @@ int mpam_msmon_read(struct mpam_component *comp, struct mon_cfg *ctx,
 		    enum mpam_device_features, u64 *val);
 void mpam_msmon_reset_mbwu(struct mpam_component *comp, struct mon_cfg *ctx);
 
-int mpam_get_cpumask_from_cache_id(unsigned long cache_id, u32 cache_level,
+int mpam_get_cpumask_from_cache_id(u32 cache_id, u32 cache_level,
 				   cpumask_t *affinity);
 
 #ifdef CONFIG_RESCTRL_FS

-- 
2.34.1

