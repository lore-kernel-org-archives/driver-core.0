Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795019839;
	b=1Xjs/8OH5JIK/YsvgAekCRZ2a5oPVAK94oViMEcApwOnLdliW9RkzgyJ625rrRKriY+h
	 lj59YoT7bfmc+xuT3ZOjQq9DOkVtEJtwabTbfXCW0Iw5UNDE44MNmT4xf1tXPQhtgdV9D
	 zW/M/m0aJWMQLHbk5wVJ930b3Eu+FF7RYgAhmWFoWyGV5/b7coTMeUk2B4t3RhCYA1tAl
	 zO1X+AK0/Q8WVN+z5hwAV+FEubOGAoBTKSl5uQKz2cBzgnjiy4mp1PabQpDeW1g6Z9stJ
	 /ASrLuyw39fQF9YPgGkIya/Nl9B79++Ue7h141DO4IbS+zAoIJ9s9/gOaQDaTbFLjeQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795019839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8dSRrfeQC0zmxEtH8R5afGXKN9r47oz3+HGJMCUcOFA=;
	b=4/gAoPsirFLsKyjH2RPdL7zmG+yWHN8UpolUwwJw7RHzSNurHzJ5WrtmLo/HGGBCZ2zY
	 ZmvnS97qR8S6oL9EdFY6IjqIavR95y8FmMa63Dzx553DQSme1tSwMbu04IxxDrzktUZXv
	 /np6q3H8HUTLF875zL446qCeaRJQLhbBx1QVicVHrVIAkII447jUISR2nl4bacgX1lAO0
	 d9afXTFAF73G439j+z12p1+U3bWlAIZSrNIMudZWHIs+ERgCUQf7cl4+YFThQO2UcMCxw
	 IhAGQB8oPlC7m3xsuVdA3+A6MIC97b5OoSdIMMr9v0dIuxVWeC0VT1W4qmG7eupysHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rCTvOupe;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01FD4606A337
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 16:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01FD4606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=rCTvOupe
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDQSkX1211558;
	Wed, 18 Nov 2026 16:37:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=8dSRrfeQC0zmxEtH8
	R5afGXKN9r47oz3+HGJMCUcOFA=; b=rCTvOupeje0thInjFOU/HLCEy8H9ltjXe
	knlGWQYf77eHOlnkVwzbcsFQuUQRjc+rxArdZv9haAMEa9WivQDq3TZhpUyGJ1/M
	hucRusuMWj2i9tLQ1dDXu8cpHCeR95xHgsYhR+l6K0Kru3Rnkp8hmk1BEx7MPGhH
	kwpfMq4YALcxiHkQ2LxeI5/N2CrauBshjo8mUojebZpP3B+L8cThYwEhoymrh1vC
	48sXex4Pse4uu3xmt5t8bjwM/yICnjFcGqvVregB1T5WL9i6pHbeGgZD2NLeCdYL
	fdZ21NDz2mc3ZdSlqX+WrR26IMXo5ixryBdBS1P0Ne5BH0D2YKRPQ==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105t3f3m-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 16:37:07 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AIDZ0aR3180184;
	Wed, 18 Nov 2026 16:37:06 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j02jugw6g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 18 Nov 2026 16:37:06 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AIGb2qO14352770
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 18 Nov 2026 16:37:02 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8D7AD2004F;
	Wed, 18 Nov 2026 16:37:02 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id EBD4220040;
	Wed, 18 Nov 2026 16:36:57 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.19.105])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 18 Nov 2026 16:36:57 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu, maddy@linux.ibm.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, sudeep.holla@kernel.org, ritesh.list@gmail.com,
        tim.c.chen@linux.intel.com, yu.c.chen@intel.com
Subject: [PATCH 3/5] cacheinfo: Add teardown and rebuild helpers
Date: Wed, 18 Nov 2026 22:06:37 +0530
Message-ID: <20261118163639.890546-4-sshegde@linux.ibm.com>
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
X-Authority-Analysis: v=2.4 cv=IouL47/g c=1 sm=1 tr=0 ts=6afdd434 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=U7nrCbtTmkRpXpFmAIza:22 a=VnNF1IyMAAAA:8 a=UriLzxzIPnuFfNHfWGkA:9
X-Proofpoint-ORIG-GUID: 8SPgeAsSDoYiDbiFFpPwLuwWWKI-ReMg
X-Proofpoint-GUID: 3kPqrC-Gx6Ywr6_EzIE3YIsmWJ3xcaa2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfX3WMdASs8bJjZ
 wioOHBc7XMNYD4lTp6crxO4dwZJF+EakX0XpsJBYMzdahTiwFf07VassLGLRvepK+DemRZZ831E
 oBzC0NfLFD9Mhq40HX+4AhTkQ//kBEGXxhj0X13gFlBa2UvdQkh0AEg692UnMKkjjlUvXKUUEY6
 nfJKKWJmhF9dZUCHjaFWftGey//phGUS+V2k2U6O48xfznp3x9Ir2NuzU372B73MiINCN5Ix8C6
 vK2D92WssUcT11a0Ms2Rr6eLJfzKfPGO3wghZkIOi8BDtJwZaPigSRvvIub5HvRvAuCg+K8NLUe
 /Rv4x+c3xoaCqei35gYCT+hsKvK5v5Pip3NMC8d8SVx4s3wQaOqh1a+Kyj1UfCoLMsZnEOwWThR
 rUSxKYhv+Cx6oojFhzt2Qkl64bFWG1zeI+h+4YX+5OrJVPVGQ1I3L3hO2GVMZjgSbBIwikNMN2t
 cD95v7qupUENoFZioGQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA2NSBTYWx0ZWRfXxnLBevDIrwKh
 jhiwXoaPHrXnHIRiLjvrSN1ZWj4AAW5AD+CGSSS3cLeTXQNGLFXDWVle1lfJ5tl+PACnJHkcBAu
 pnUQaq6/cfOPKQbIWOisq3E4jIJHh7U=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_04,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 clxscore=1015 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611180065

The PowerPC cacheinfo implementation provides teardown and rebuild
operations for pSeries mobility.

During partition migration, firmware cache nodes may be replaced as part
of the device-tree update. Cacheinfo must first remove its sysfs objects
and release references to the old firmware nodes. After the device tree
has been updated, it must discover the new cache hierarchy and recreate
the cache information for each online CPU.

Provide equivalent helpers in generic cacheinfo so architectures moving
from private cacheinfo implementations can retain this behavior.

Both helpers require the CPU hotplug lock to be held. The teardown helper
removes cache sysfs devices and sharing-map membership before freeing the
per-CPU cache leaves. The rebuild helper rediscovers and recreates
cacheinfo for every online CPU.

[Both draft changelog and code are written by LLM]
Assisted-by: LLM
Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 drivers/base/cacheinfo.c  | 44 +++++++++++++++++++++++++++++++++++++++
 include/linux/cacheinfo.h |  2 ++
 2 files changed, 46 insertions(+)

diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
index 4a23377e9312..b13046863ea3 100644
--- a/drivers/base/cacheinfo.c
+++ b/drivers/base/cacheinfo.c
@@ -1120,6 +1120,50 @@ static int cacheinfo_cpu_pre_down(unsigned int cpu)
 	return 0;
 }
 
+void cacheinfo_teardown(void)
+{
+	unsigned int cpu;
+
+	lockdep_assert_cpus_held();
+
+	/*
+	 * Remove sysfs entries and detach online CPUs from the
+	 * cache-sharing maps before releasing cache leaves that may
+	 * reference firmware nodes.
+	 */
+	for_each_online_cpu(cpu)
+		cacheinfo_cpu_pre_down(cpu);
+
+	for_each_possible_cpu(cpu) {
+		struct cpu_cacheinfo *ci = ci_cacheinfo(cpu);
+
+		kfree(ci->info_list);
+		ci->info_list = NULL;
+		ci->num_levels = 0;
+		ci->num_leaves = 0;
+		ci->per_cpu_data_slice_size = 0;
+		ci->cpu_map_populated = false;
+		ci->early_ci_levels = false;
+	}
+}
+
+int cacheinfo_rebuild(void)
+{
+	unsigned int cpu;
+	int first_err = 0;
+	int ret;
+
+	lockdep_assert_cpus_held();
+
+	for_each_online_cpu(cpu) {
+		ret = cacheinfo_cpu_online(cpu);
+		if (ret && !first_err)
+			first_err = ret;
+	}
+
+	return first_err;
+}
+
 static int __init cacheinfo_sysfs_init(void)
 {
 	return cpuhp_setup_state(CPUHP_AP_BASE_CACHEINFO_ONLINE,
diff --git a/include/linux/cacheinfo.h b/include/linux/cacheinfo.h
index d3557a1b464b..89f2f9fcc88d 100644
--- a/include/linux/cacheinfo.h
+++ b/include/linux/cacheinfo.h
@@ -94,6 +94,8 @@ struct cacheinfo *get_cpu_cacheinfo_llc(unsigned int cpu);
 int fetch_cache_info(unsigned int cpu);
 int detect_cache_attributes(unsigned int cpu);
 int cacheinfo_get_arch_id(unsigned int cpu, unsigned int level, unsigned int *id);
+void cacheinfo_teardown(void);
+int cacheinfo_rebuild(void);
 #ifndef CONFIG_ACPI_PPTT
 /*
  * acpi_get_cache_info() is only called on ACPI enabled
-- 
2.54.0

