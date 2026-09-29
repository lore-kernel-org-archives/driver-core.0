Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 077345158A7
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 11:38:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790681922; cv=none; b=H9CVr1JTH5MU0NCpDmyeKYShxFSqKZCakue0G5skY6gbDfX6iEuj8HXQouQsW124ne3edwnq/K6yt0aMr+/OfEeD1NuxBIvGCbw/Zk/aYV8rDvoydpwwLWUMkmXvXV4FqQ1PYdI6/VBp4FCiOCG9dS9s8fTuNdEdvKNF8sD3aII=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790681922; c=relaxed/simple;
	bh=s2r+aG6JBT4mh28miyv4N2FD6h3ZOgckSan+lgljeos=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=a0XXRLOxHoDycqargp5Y/JxGKDxjKUpaMfQMXO87/FiKIpgNU7+8RWRJ/KJ6RonV8cwxD0DgnXW9+hVaurVDqAkS5zWhnaf24VKFiDa9UrOwD+s0P3sp2O4UD/3ynh7+qjQcWLeZ73wFQWnVQV9TF2y8f9ZPNWvBmhC37WvkVSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dx+3tlOm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ih7fbY7K; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dx+3tlOm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ih7fbY7K"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TAj5RT335130
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 11:38:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IRfGyQ6QmoDFDjciGfxzicvIkhMdvju/02K7yq5y6Q8=; b=dx+3tlOmKTiJtfAq
	IZ+k9YfhZkZq81Rsx4HRBB52KU2QKiywiVnVjf42E95j9Q8xFtwOpCSv19dLULda
	rHaeWJBOPWSjMyAULI29KrkhwFfMmMmBqkPjpBUyi/GPJxBb+ln6pu4bI7xX5/Wp
	OcG23cEUu6t91XKhtPwULj9QJ664YH3DsV1nwH6JMfIKRqJRF1coCMUTmFDldSUr
	Rf/f775uHK60qmenEzARHj6Dx1eDi0zDilAj7PAri3e86Db/mZccLwkOptaVW5kC
	QZ/3/BkrFuc4faUKyv/4sz5Mk5yj3CHzjLf5pDIvAha2j0qffPVbp2xpLV2Ciqzi
	VVmyew==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h03ew27er-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 11:38:39 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-34bbf2e3c5cso938232eec.0
        for <driver-core@lists.linux.dev>; Tue, 29 Sep 2026 04:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790681919; x=1791286719; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IRfGyQ6QmoDFDjciGfxzicvIkhMdvju/02K7yq5y6Q8=;
        b=Ih7fbY7KidVCP/CZQYnJKVx6PHpOfrx9YZoo2C/xcUdfQ2m+xhcSLImT8hFz1sgn9n
         Je/Z7M5GOEXP1ApcNEWOJLaC1x3izxsYW54zukJX/gsVliMn9iyWaDfrZyVfQq9Cmt+F
         VY+THEAjvgizOmXH8T88Qb5joLFtx6o1OgcBWMnDI8iEiXcuYmvXSRFUuptciyLgkFDx
         S0q3NVKU4z3sevDQjaq0YH5vCqqen0hc6qkaesr9E3agMc3oKg3FHJJASbRIbLsrYa6X
         dthI8p7yID2be1B9vjcLG0Z8PBv+8fF84l9Eozct1R/I6deNDSz+HfwaATbxdhneLNcA
         O07g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790681919; x=1791286719;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IRfGyQ6QmoDFDjciGfxzicvIkhMdvju/02K7yq5y6Q8=;
        b=lW1GUAdXByljmsfteeqrm6k36+XdihwlNXS3G11/f1/Q0k1YXfxt76Son93IglB5/W
         4GMEQfPJDbBMywgaYaCiSLxv04YgHEMYiD1EAktTR+ghHxQtGd4aA+PlImqUc39wYU1V
         aee299ozwEI2JVBF2Zohr0whBEaULwedihEJHEW+yZoj3do/vcCkR4FCmDzS7yEgfRcx
         OdIcEplKgxxo/xHOWmRFB7ETp+v5Tlw6YeXGrt2feo1MngH+3bUvBrjqUEYnwROUNXHY
         go6g60OlEpwFynF7nkwIvSv6opbIgNLpx3IUxrLV6Eq3npktpqgL+2jeMe4s8LjeUvp2
         Akmw==
X-Forwarded-Encrypted: i=1; AKwUvBxI9Y4pOUnScqwn0tIkwb+gd667DryI3Qpj+29NoM5/cRZDvF2dxWhw59I+yNETlQY63NZZlplsU/wfrQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLpsZqhKLS4Hax2jT5IrmRGzo08kfrRN2gXv/5ZJagMiuDkzmrn
	obAmipML5SDnsXXgXOqjkzU8gzG1ICvqdcM/GhahWJWbaZ0XgfhVKELOl8RgN53QgOd/orQMTL/
	hfMT9cLX6ZDUSZ/5k5lgvv/we9WL4A+nX/lUkSAxN8J/iBc2D3kvFZBSUwxN2el1wkg==
X-Gm-Gg: AYBFou0zGFFkRcaLY7i+bTfQG5kdS+OFlkB7PT1FMAAqjCr3wc706Vf9DP5CJtbE9Vs
	JyWwHPo3ddhbh9R+3I2riPloQSaBs4mnBZTn2j+fVl3lAmjzM4vqCTQ4pwqRGtbvqM/9nTozLWy
	9MR9EeK0CWE93FGSv+RfSUKG9+cODYGUVaoG9zKov4D+ErVufCzsyB7e3EwrBmvqAF41PLvMlCP
	6SyZaWnjRso58jzBzzcOu5rHQaGV4W3WH6oc00xU+VT0aASZCl5hfxVM2mnc0VeCvFdvxQukwZw
	JRt0TBLeD9UbzoO8Y97STRkvhG4AnVQ9+8KNeZfZqb9T+SMWvIY/2d9wlgI59gr7+r0Dw5vzfAw
	l/3mFu4ITfuQYha4lvbsqh5G//zrEH2NcA+P0TrX2chLLdQTQ1iIMm7mJZRsPDnSvV2Ph8ydyNj
	o3b22yw/jbJJPqDNE=
X-Received: by 2002:a05:7300:cc1b:b0:33c:e61:e201 with SMTP id 5a478bee46e88-34271d88c7emr19475314eec.22.1790681917701;
        Tue, 29 Sep 2026 04:38:37 -0700 (PDT)
X-Received: by 2002:a05:7300:cc1b:b0:33c:e61:e201 with SMTP id 5a478bee46e88-34271d88c7emr19475242eec.22.1790681916682;
        Tue, 29 Sep 2026 04:38:36 -0700 (PDT)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34145d0fc9fsm37145604eec.25.2026.09.29.04.38.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 04:38:36 -0700 (PDT)
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 17:08:06 +0530
Subject: [PATCH v3 1/2] arch_topology: seed capacity_freq_ref with highest
 available frequency
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-schedutil-boost-frequency-handling-v3-1-68de169498c7@oss.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
In-Reply-To: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
To: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790681906; l=2363;
 i=ananthu.cv@oss.qualcomm.com; s=20260903; h=from:subject:message-id;
 bh=s2r+aG6JBT4mh28miyv4N2FD6h3ZOgckSan+lgljeos=;
 b=O7WoFXnsTUsk2s8fvmjrluM8lOpqTZ9CMzCp15IpnizoPU+j/11mbcZ2lJ76R6dmTW+w99Kj0
 yGTuGu2rDepCe1WHfncMt/kiL5AruEdmdtgNMr5dW5ZMezcIzMkSAGH
X-Developer-Key: i=ananthu.cv@oss.qualcomm.com; a=ed25519;
 pk=gutNfLSMVTRkB+MxVviMFq9I07C5qPe9xHY2J5XCMpo=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX7DdwvCPOwzw9
 ZecCygOCgoqFCC4jgwfuvuCR3vPBu0Kp9IK5id989ZeIAdfZBJrt6Xa2Gw1FkZYrXWvl8XIChnV
 Y6BfCqCah9EMcMeQJ7pDXbVn/WP5OsM=
X-Authority-Analysis: v=2.4 cv=IIOXmQvG c=1 sm=1 tr=0 ts=6abba33f cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=TcNSCKXCNKdZ_9qoEdwA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA0NiBTYWx0ZWRfX0DWX9ay/E9IN
 qv1tM01UQGPqI+L+ZAn1WP1nHm4288si0IjtWYntsGv+ao8P+44VZJ68I0rPIKxw2GOJefOOv0r
 WEyocvXcckCvza2mcMfRDh6Vvmdu+96zm3yE5EWVAJ8XaNhaYnsiBhCQCbm0gTCqZZD39G1hT8e
 rcLVpZkm5UDJINKMJQbzAVClPIpwS9PRfyleSd0XNhiRY9YeqoAhqknmH6DXKTTkMUomPnbyqU1
 JNjdtgPj+fYt6PcFI2ioG/GHsPBSNfLjaodut/HGRYFWVP8JdPHqXGVV5n7cvalPlrV2fTVRQsH
 6vJ+VXVIDT55zbmalpAf4km45EdIvPATOxe5MocHsmoe0afI+pn8C9438FHuY2fH3+STrhJ3NqY
 dOoi8b9C1jdj6jUT3xNwQYxt5bX2OPLu1hhxfHcfys8Q/okSI0pnm8WsFHFrxCjqxRffMrk1RbW
 BTiUMzLTjMIXJA4Avmg==
X-Proofpoint-GUID: gFlXQe97UB2w0ZlecvKeeR5cFbjEjAjV
X-Proofpoint-ORIG-GUID: gFlXQe97UB2w0ZlecvKeeR5cFbjEjAjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 bulkscore=0 malwarescore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290046

capacity_freq_ref, the per-CPU frequency-invariance reference used by
schedutil, is seeded from policy->cpuinfo.max_freq at policy creation.
If boost isn't enabled yet at boot, max_freq reflects only the
non-boost ceiling, so capacity_freq_ref never learns about boost
frequencies for the policy's lifetime. Enabling boost later raises
policy->max, but capacity_freq_ref stays stale, leaving schedutil
unable to scale utilization or target a frequency above the non-boost
maximum.

Seed capacity_freq_ref with the highest available frequency regardless
of whether boost is enabled. Runtime enforcement, still handled by
policy->max, is unaffected.

Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
---
 drivers/base/arch_topology.c |  3 ++-
 include/linux/cpufreq.h      | 13 +++++++++++++
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a..92966be712d5 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_block *nb,
 	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
 
 	for_each_cpu(cpu, policy->related_cpus) {
-		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
+		per_cpu(capacity_freq_ref, cpu) = max(policy->cpuinfo.max_freq,
+						      cpufreq_frequency_table_max(policy));
 		freq_inv_set_max_ratio(cpu,
 				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
 	}
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 35ce665edfd8..f048c925fd98 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1107,6 +1107,19 @@ static inline int cpufreq_frequency_table_target(struct cpufreq_policy *policy,
 	return idx;
 }
 
+static inline unsigned int cpufreq_frequency_table_max(struct cpufreq_policy *policy)
+{
+	int idx;
+
+	if (!policy->freq_table)
+		return policy->cpuinfo.max_freq;
+
+	idx = cpufreq_frequency_table_target(policy, UINT_MAX, 0, UINT_MAX,
+					 CPUFREQ_RELATION_H);
+
+	return policy->freq_table[idx].frequency;
+}
+
 static inline int cpufreq_table_count_valid_entries(const struct cpufreq_policy *policy)
 {
 	struct cpufreq_frequency_table *pos;

-- 
2.43.0

