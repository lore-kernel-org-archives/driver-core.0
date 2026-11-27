Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.156.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795793042;
	b=vgK+epxtqvn97bco5tP+vFqMx47N9ZXhRb23izre5vuXPPkVWfc8yNcGd2WtJWevRzIc
	 a15NceZgbMs8f4dSI8GOsdIbJKFOrIsJqWdTP/AhmmGWsHP8ftnQ+ZGavxDZJyuyvALk8
	 CgUs835dI4QIxDoNo+cxh5oNrYoRTAmSZHtkUUYmCbuPV1qTy0l8AIoVMajWThllHcDoe
	 87Q5gMZmFzVnX/0jH2UF4FIQ64EabPLs9sEX3VF0Z3s3OT3sJlTVSKHintHw2ILw3/bVX
	 fhdkWmxUWm92jhA58+VNc/i6MQE/PTGSdPAQn141wPx4RZ95HJ1L8zBa51oiZA0fvwQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795793042;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-TM-AS-GCONF:X-Proofpoint-Reinject:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=cRsY3dtcvjIWdmB4nfRbZNcTe10C8gXxVSLCeWR4pgk=;
	b=QVagqM1u/CfKpJUOAOVdDD5G0A5DzENVmyqIm13pYSGbra0uiXRan6r9v38rrVTAuAKa
	 9ZsfMjDH7WRc9+LtfqFftwKOXJKIDPtF1ObHNdlyu3TRnKxZ4O6+m1xYIrQjh4yiLA9Ck
	 OwfPuya6F4w6KEvWpD6X+FbAzWgd4Gg3EojVnrvmfYyF7lufi7SacPbe7qRAP8iDOCgKk
	 r4loyHJ8xkzdvtVrEVF5u54CEMWfR2gpExOmGuUuRV8+LBiwDWKV/qRYbYXMVlMrQaAlm
	 GipNn0wIKFSgqiYSLsbTYFKJ8VlCp0eZwOAO2QNkTIhnO8PixELFlxZMsQWa+uUS9RA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jnu83VY5;
	arc=none smtp.remote-ip=148.163.156.1
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 906CE606A31C
	for <driver-core@lists.linux.dev>; Fri, 27 Nov 2026 15:24:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 906CE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=Jnu83VY5
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4puL3419789;
	Fri, 27 Nov 2026 15:23:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=cRsY3dtcvjIWdmB4n
	fRbZNcTe10C8gXxVSLCeWR4pgk=; b=Jnu83VY5KmUc2L38zeHV4IJZq4qcMk1Du
	dMXmjSNXzVQfunZvq6HPCIoI5ZDmKTySGjL6nMKLlXLTSaF7zcXVCZQsk4mi5O+i
	t27i9jvZ/LIp1Zl0SPC0APQNefinkXoq/ALBdn6uka345702UJjG4hf+QrZ8yTGM
	x+9Fp+MGmxFrPLtBzqVT+Tb2sMiMgr6ea/9V7Cx2xQ9mMLRIj/HmpZOe/1dEpchU
	K+bSvEiOK+vbqLZ2FcTMr7KFfJVry+Jl1HGQT3T3qlvO5cYUFjeUmwtUN2+pBOZk
	ghtWH0+N8SKyeW6ktcsHOPAJbUfgEUm0YbuyfHwB0mkeSYy0Ub5iA==
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j34fapfgb-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:23:39 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE4HEv2819254;
	Fri, 27 Nov 2026 15:23:38 GMT
Received: from smtprelay04.fra02v.mail.ibm.com ([9.218.2.228])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 4j5kfaaqh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 27 Nov 2026 15:23:36 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay04.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6ARFNV5515925726
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 27 Nov 2026 15:23:32 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6BD6E2004B;
	Fri, 27 Nov 2026 15:23:31 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DFA0720040;
	Fri, 27 Nov 2026 15:23:25 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.16.105])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 27 Nov 2026 15:23:25 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Cc: sshegde@linux.ibm.com, christophe.leroy@csgroup.eu, ritesh.list@gmail.com,
        tim.c.chen@linux.intel.com, yu.c.chen@intel.com,
        gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, sudeep.holla@kernel.org, peterz@infradead.org,
        tglx@kernel.org, kprateek.nayak@amd.com, srikar@linux.ibm.com
Subject: [PATCH v2 6/6] sched/topology: Remove stale comment around llc_bytes on powerpc
Date: Fri, 27 Nov 2026 20:52:42 +0530
Message-ID: <20261127152242.306333-7-sshegde@linux.ibm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA2MCBTYWx0ZWRfXxo0VPua0VDEz
 m0Z4SVJhlrRbgXR0KfIk58anV17Fue6ogPTnP5SEHB2/L8Vou4ykEbaWPiqUqlwWq5ON2dxOu3M
 onUMb8k6KiwWypnEfJ0lSnpiajdwGbTd0usUpzsqt3zzKJ89SaxmWPKAJcdvdAqZGU+ZZMTKmGU
 oxbUIQtUNRZfKsMuOLaTIgmS56A8BYcnqtW6nx3Nr0hATXe1NvYXnfyfE2L+vbMBeQOB1uI/4yA
 ws4BhN8nWwbSS+OrH/FksSBtLV16bgHOPLRIGd7rhnf3tabvY1ghA1nhvesPDe/WhD5d5DGQLJF
 1DspThaxfLnlwa7oUv2wbKajzG/nDWRGm8G4AWqcZPHbrHL87fj6YzzuUn4j+oneGgN0A8SfnxY
 7y93M7hjP/NNTNtn9fzl5y/EdH6sbpMvVSD9fVzBo2Bgsu4O/YxtkxbIf+4Jnv9gxnyyjam765h
 FbMcPcqsbmcT3alDHbQ==
X-Proofpoint-ORIG-GUID: 45kTP2W-uOIik4ItpkLjrZowhhMp_eaT
X-Authority-Analysis: v=2.4 cv=U6QHnuru c=1 sm=1 tr=0 ts=6b09a07b cx=c_pps
 a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=Do6pITyv6I5m7piumJAA:9
X-Proofpoint-GUID: AH0YBzyTs98VDzf0G1o6gXonMy83hd44
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA2MCBTYWx0ZWRfX9+kxVIGLzARt
 oAAaPodZL9Npge78xG2jR1C3j6qHipUwd7z6HgUvlX+a+fKQSBRGeQtoUZK+ZyV/JbQOa1usrnq
 LTFrH0DDL88N1u2UgiqUkahzJL4fBMs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 spamscore=0 impostorscore=0
 clxscore=1015 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611270060

PowerPC now populates generic cacheinfo, allowing
get_effective_llc_bytes() to obtain the LLC size.

Remove the comment stating that get_effective_llc_bytes() always
returns zero on PowerPC.

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/topology.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
index 528897a58aff..30f2ce374e51 100644
--- a/kernel/sched/topology.c
+++ b/kernel/sched/topology.c
@@ -999,15 +999,8 @@ void sched_cache_active_set(void)
 
 /*
  * Update the bottom sched_domain's llc_bytes for @cpus sharing a physical
- * LLC. Called from cacheinfo_cpu_online() or
- * cacheinfo_cpu_pre_down() with cpu hotplug lock held.
- *
- * Note: get_effective_llc_bytes() returns 0 on PowerPC.
- * thus cache aware scheduling is disabled on PowerPC for
- * now. PowerPC does not use the generic cacheinfo framework --
- * it has its own cacheinfo with a separate struct cache hierarchy
- * and does not populates the per-CPU struct cpu_cacheinfo array
- * that get_cpu_cacheinfo_llc() reads.
+ * LLC. Called from cacheinfo_cpu_online(), cacheinfo_cpu_pre_down(),
+ * cacheinfo_rebuild_all(), cacheinfo_teardown_all with cpu hotplug lock held.
  */
 void sched_update_llc_bytes(const struct cpumask *cpus)
 {
-- 
2.52.0

