Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25E85424D6D
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789378814; cv=none; b=OuZUMkhnLUoQKWPRF5YaCA8Es/Gr0X6rEUi2XWtRsB+JePQ5trhZN0wnnSXmxKyPeSTizS3IrfcOO8JclCOZbakG43pbsDZYiiblVBNGTjmDjJ+WBz9HB5iBjG6tg4ksPBFr4QIEcXdH3hLz/CPrelZ+cuGmHtVKsFLdX5RHQS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789378814; c=relaxed/simple;
	bh=N3m1XL0qPMrLpj2KyTA3YfQe/8CjzIGFh9rILUSGz/Y=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ShHo3OOYwP5KdvC6zS8taLbo0MnXZvawxz6g57lz0qorWocng2KU1PDBNBDYlxpftCGh4PmwCaT3bP0ag7JRzjrAXbORcN8GwyR2YxlwiKrDQskpe78X/adjFLImWsmYuOndYyLNzIl5WleLhL8HCSDnKGZ4q3gv8BQ2SughoTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MswalhPg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=P5m/y8Gt; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MswalhPg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="P5m/y8Gt"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68E5j5Au543471
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=; b=MswalhPgXrq7Zixl
	19P1QCywTTO7ETPIfcQHUw5E+pkNsUCPGnxHt83C8u5AixNCxAujo9U0EK/S1YqJ
	R9mgDmpFP7C0Lj+6d+q7nOhrPhxkHOGiBDWnnvr2Z2pbYmMYGkk7F6JOYbUYW8rv
	n1wMKRaKP56+G+XOIm4W7Ga2EJ8aWUhZMh90Cj89dGc9PhV9LVF/YTr7NVjpTbuE
	InVUxHn8xHfuUdlDbrTWJVOMVCuETDPjYHnsxTKUTaEjgxQ2VV6RVEHMXew21JXU
	I3n8mzOgseiLsTRSiwTGS5ga1NpqjbNJ9L1wSVHsfoCcVpsdnTxuwLSN4CkuNAg0
	TvelBA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3k09tqt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:40:10 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-399311947f6so5963378a91.0
        for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789378810; x=1789983610; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=;
        b=P5m/y8Gtr31lYgRlSsJFVpHOrChiCf/kf0Ez8T3TO7EqzdFf1YmCAepulXld/B5yRd
         WXTqzYFRIpr1wJMTUgw/SbiF2rVxJ3GuwcnEy9zFNfDXD0VGmJ9pVYnHlzOalOxdxs1n
         WmYw4U843mQ18Wkhk6ZrkBmCBfU80UJyDqRvsK4lo1rlciZbXbjAbGrGDKtbbpGsa3M+
         UnmhsvFsOnk7CWCaug35aucIAxG0EMOtBdL+Dgf9fxgETCPVPmqjLS7NVdjgiskeSnn0
         ghnrC/LoFsOsLnaQqWC86fffhuufRVRqTPTYFS+IeiqynDBJE2+ccqOLCLlHmMRsz/rs
         7wXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789378810; x=1789983610;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7DvmSimw6MjnY/L40N+LcEDCs6VLUnTtNUZQ4Z7jK70=;
        b=AbQRKsnKHAs70SLnI5UZu/LkDXbSg8Orpyr1XG4wMZzoyuunlTY1e3dUSL5fddUwHo
         D2H6I2W8tx2ZPxUEkaKKgup0HRBrAYtu7gkNd1tUwaeBxEAMd9U1M9JeqyrZyZ3LMo7s
         bhhNPl8zWX7u2Xg2j0u2+EFAdhGWqJPAjtMfg29gLYfn5OdfuDLbdTGnF4heF+mGcHkw
         DGwj4jWpDcXvleBu/8DBuXwbhLwaCztyHoBvykaUJuYQXiL4/hfmaUMTjT5f3tmB3fik
         GQxlRZ4dtVGfgyjwPXy81LlqzKorx+MA94157akVs748lkFHkag3abweQzg8/MMZLWhW
         KI/g==
X-Forwarded-Encrypted: i=1; AKwUvBwQNPUFY7xX/Sr0Bq5eDirt/0zIdRhyc2dgTDzjjarVdVETVQhkkerIWTGkWpXhnG5kPYEMKgwCCvfDfg==@lists.linux.dev
X-Gm-Message-State: AFuF++lMdt5HnbvYXvrU0Q7yUasuHouI88zS6bFZT6DjCcxoTOsT8q3U
	qQ1k8zsFKHM1LpA/DGW2316owudciLaEdB9m2E6zq36HEAgmAg/Nfmt/Ad4RmFY8vUpKoEtFdon
	heZML30OCsZNM1MiaHhq/2uMdpcRjvruvPZ6+c9Q/C/DQHfRnrRQp9IKlRhZw3gX9cw==
X-Gm-Gg: AYBFou0S5yY3x7WCmPA5FzexeHCr831S/9fIg5hMh2wCrcj5EKPwiPLDmqvHw2w/ZW3
	ye9sWwr8zWtJFjwtHJzmF0oVv8xwLwq2ywFWkjhP85enmmjsNfLi0TjD6rOmGO7nIzRctD9fxOH
	ddWc2PMoRSMjSHtlO+HnnuyUoxB3kDMncePGnC0o5R+L31kZePjjJ5UrC+S+SYHmqNWzHILW3Nt
	7eCFXBsba3L5WVFIRbXUZUeSdl2tS899NIzTln+U8uqZVknTS5XDdG2FtwKjmrF00GJXWJkVMRP
	ju1E8vDJMfo2xhU5yghuhnEx2+9gumC6uVXrvdLRdPrxqZZwsi+qh3lWBANlKK+IglOPnhWLWgC
	Zaah6CIlTMBgH+1lXLEubWWWAuTG1NewEIWUckQLsBc/QYBOL+hFfim5y
X-Received: by 2002:a17:90b:5784:b0:39d:f7dc:61e4 with SMTP id 98e67ed59e1d1-39df7dc6273mr246894a91.9.1789378810107;
        Mon, 14 Sep 2026 02:40:10 -0700 (PDT)
X-Received: by 2002:a17:90b:5784:b0:39d:f7dc:61e4 with SMTP id 98e67ed59e1d1-39df7dc6273mr246764a91.9.1789378809464;
        Mon, 14 Sep 2026 02:40:09 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d98e60484sm19488728a91.4.2026.09.14.02.40.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 02:40:09 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 17:37:52 +0800
Subject: [PATCH RFC v2 04/10] cacheinfo: Expose the code to generate a
 cache-id from a device_node
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-mpam-resctrl-dt-knp-support-v2-4-bf6645bb2f65@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789378762; l=2592;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=MXjxI8aXZOve7L6eY3Z0pfsNkIuJWimjX2RUSvdJo0s=;
 b=JQcH8p0AqmKiGfmEXtpcideR+t4riLV9L99EgGdmABEku5BckK3T4ae3bI4+e/TEVktBRzg2Q
 NpvKlDoiqZKC3MJi40P/aObfObcm4D3qRrfHXjEaX4rezR4jLu254fx
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX6GuBQFF32Lls
 wSxxCSOhL491VMspbYao/SMSG682ovqCjpQjRcWo525jDXDA4JJhGswC29977jr/S0j/fpYDqMk
 qbUcTlqWohM8G0NsKHzLOLFz+T/4O2k=
X-Proofpoint-GUID: YbVt0u89d803yShtssNF9xx_ogKGb7a-
X-Proofpoint-ORIG-GUID: YbVt0u89d803yShtssNF9xx_ogKGb7a-
X-Authority-Analysis: v=2.4 cv=BtAIUoX5 c=1 sm=1 tr=0 ts=6aa7c0fa cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8 a=YGyWITW8jF7qUHxv7J4A:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDEzNyBTYWx0ZWRfX5+FsnRDVLK2P
 416xUT1nxamQcf44z06N3oZFyNP1taKf4FcVZ0QZSEbhVWscWh+R8yygSTdccTSjCGtnIZANqyV
 XubLnEKPy7x66cNXhyHuZY34KJzU3OZtuvw6m0nYpsETpahgNRYZkHuV1NK2p29NmgOdkP4KJGp
 PlNj2cmPHojv6QkwBlwWgcKHxG/9+oZzcMddUTTYyz9DqQgphy4YMkBfJhI1YMAJjGajFxco2EO
 v4tUp2/pSpNTg6pCcfNpPaMyc55jwHvZrDa4/CbOvLKiAyian2d7ttei1uE5qcnn/jLvxLNUhj7
 o2v3bT5PJh7xVjG+9rntmmzZt0VBHTeY+oQsVXdhgm712TIRC7nWW4dI3IzLxEzFPFhZCsBByS8
 SgfjHnBslwtIiA2UM3aXMPsR5u2EcoYWopedFLtyI7cIVTtSHq2tnUFC5evI7I0Ncl5AFaspjOP
 E+7BirehJ9zr0iEw9TA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_02,2026-09-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140137

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

