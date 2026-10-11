Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B50B93AEF4E
	for <driver-core@lists.linux.dev>; Sun, 11 Oct 2026 14:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791728210; cv=none; b=ZrPdypMT4gJxR1m3Mu3A2TiSCLZeUdGiK0sybCCOq8VYh2o1pX+dGpyw/C++bnXy/rWKPVT5XaFm6KqXlFqMaznvnvg4pS1i5VfcfDwEKsp37l2K/zteVi3A4iq4vPBK6X3gFrHgbOgRk0tORdSxtp6HbRmJzyCmfL5o4YLcn7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791728210; c=relaxed/simple;
	bh=W7FZNSRbWo6VxKmxkMfSfrz+K/NtHoDLIImLCIZ7IhI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bT/xsAlXX/C8Y8EixkRU5NkXYyU91bbqke5og9jxJpHPAayYWN3QoF2hEgl2eCVcw13xDIMv4SXLljnQ85R6QCb988eUMk9IyPYFTmyCYXxGmytVvm7cKGg596xYhGx08N6r0M1TRN46+MCJ/DM7w4ZW+wiQUKuNOK389fC7nXs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lDsrGf4C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g4m7jxYI; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lDsrGf4C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g4m7jxYI"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69B86bFR2973932
	for <driver-core@lists.linux.dev>; Sun, 11 Oct 2026 14:16:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	M2N1+nLpksf0tEB2SxFBndBmGIzIOlWOd60HbVRm1fA=; b=lDsrGf4CP7iNuKoJ
	eqvpShDixlPtH7LO9lT4tgDs70zd+gIiEMKDQpF9GIjAW6n23e/L2m0fijRff/1y
	Lb2vMCz/Yt9y/yzQQbOoaOILdChgwudSBcfAfQVjoa0srSWjE3iUJ0OY0ebEpda6
	dK/g9Kb2I72jGbxfUjCsgOoV0hVq4oQI/Yc4l9IjbNICyXciKBo/b8aijQTeEj2x
	816xxFTDazdWJjciaBvUxPf3BIKcL49cZSMoPo/CSLfQ2ypSYfQoDhZVK00owE8+
	B9kn+cbgQXUdhH2/uEKFjtTiXah1UJJhL7TRFBDJVSNbSkQHU8xh3xuoB/KP8dES
	1RMN1w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h7dk235aj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Sun, 11 Oct 2026 14:16:46 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-88bbc27f85cso1765703b3a.0
        for <driver-core@lists.linux.dev>; Sun, 11 Oct 2026 07:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791728206; x=1792333006; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=M2N1+nLpksf0tEB2SxFBndBmGIzIOlWOd60HbVRm1fA=;
        b=g4m7jxYIm3VlQHUsmuNsdDRgrSEwmH2FFcocrq92SjHF2C035bkmhIGIqPDl9mR8jV
         ZqF6pUGVn6NZJzGBt+e26qTZG5eBsXyLVHR2EhodniRWfjVYMS6E67vFJzFJnxdiFeEm
         FJMl6rqZ6HzF6NgStf8bePko1+jf0YyCDL72SVvKyfbO0uhk/0dMHIDCtjNQBKgBR8R3
         d/aUgb8FuLyhskSTfMqnKCJFjRkRBQh1my0Ry36E4MqASRkAEGSaIIk/iBKikMwvTe6e
         d5APW7IyzIaJHogOMrdPojISDnKQlCHjt45cl2Ynee3B0uEvk7CH80Hy4j1AzuazzMpe
         SgHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791728206; x=1792333006;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=M2N1+nLpksf0tEB2SxFBndBmGIzIOlWOd60HbVRm1fA=;
        b=ngHlsSWVX+Ff41j9hYff1HMQegDR+DQsvB0DTfJsEPDxW/H/pfw76Q4zasL2sLUMN7
         cGOdgjG1/vd+CxAECqc+Yg7kX4jEtV1EWtjGEIbb5SE7Cykl/f1P4gwkoSc1MBUAY7+I
         t8eIQCJcByl3+0Asq0WqNBYsq78qFqKlhJOHxaNpbX8yQfWa18F5+H0uDyEi0J/uPnHX
         E2BbUbm5SfhMPzJIZFSl6UYELSiYi3jbSBjgthIQYbbzG2w1cYen7y9cCRZbgZmn7uOn
         bPZk0DfIqq/QxobT7aFYYg4g8jf/yIPvB8cMWkWXl2jI+nJwdSXnToJ62t9eyZrF7a6d
         k3fg==
X-Forwarded-Encrypted: i=1; AKwUvBzAstI1vjV1OmnaPEmRrmnrwi0i/XgHB+8Ipby0fOJnpEEu+abu0EUAIcT9/mCpjk/g0KxzxzGmfDqm0g==@lists.linux.dev
X-Gm-Message-State: AFq9FYJdO2XnAqJFlc5zPun1/nTItYuTsN2i9m1kM7qaKx9gWDLDn/4C
	95BYxKYG7VCfqu+gBa+wWiuh1FYNNIVK0PxUGT4djP8zvGo3UmqmQbpJqsvNwMHkL9IpSlFzDiy
	UJ5nxTkeCyMWlGVBTI73MXOetgF0Yk/YZXLJNS2i0KqvaoE3EDRfw5FVpjnX0jXOr+c24MgIMvA
	==
X-Gm-Gg: AYBFou01gZCNCbUnDVvewuJI6qdTgWtl7YfreszkzmMAXeqn/63e+398ULWXfAAvo00
	lQhr3SneWw9Pa+E2qTZMp01bTH9Si7auhhuvfFG32KoZmVkvhDZMLVoUfQsQLtbyP/4qOWmB9wN
	YxHpDvZQwzZim43bDGJ7J/0fJSqZRilyBWrHMcVOKvzE9GP30wdNPNTpvzuttjP1ytzdPu1UVL5
	M1pwZAYx4+rNM1wUHqk+PcydAXfG/uqMdeXuiiZpzlZtusebr2wKxafFJMgR3T7VWFiA946Mbz6
	7BDBG6u3KD7+4XglNVT6ShmL/pO05iqmWvITAOonTebg9+lVAJ5+hxZuwrQBq1kNWtYAM9mVise
	OD5GXjde+TWKvGjgjGb/r0TVjCD4eyenWmPo7rMVoXjBurG3UZQJVuW/EAyQPqQc=
X-Received: by 2002:a05:6a00:4209:b0:891:6d3e:3999 with SMTP id d2e1a72fcca58-897c701082bmr5887959b3a.9.1791728205963;
        Sun, 11 Oct 2026 07:16:45 -0700 (PDT)
X-Received: by 2002:a05:6a00:4209:b0:891:6d3e:3999 with SMTP id d2e1a72fcca58-897c701082bmr5887934b3a.9.1791728205389;
        Sun, 11 Oct 2026 07:16:45 -0700 (PDT)
Received: from ?IPV6:240e:400:e20:12c6:a578:1ef6:8335:64b6? ([240e:400:e20:12c6:a578:1ef6:8335:64b6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-897fb87c459sm2827960b3a.50.2026.10.11.07.16.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 07:16:44 -0700 (PDT)
Message-ID: <fbd7fe35-5e14-4589-a072-909e49a92e76@oss.qualcomm.com>
Date: Sun, 11 Oct 2026 22:16:37 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arch_topology: seed capacity_freq_ref with highest
 available frequency
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
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
        Oleg Keri <okerixx@gmail.com>, zhongqiu.han@oss.qualcomm.com
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-1-68de169498c7@oss.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260929-schedutil-boost-frequency-handling-v3-1-68de169498c7@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nfUIHCpEpRkv8yLdJZRf8HYs0BUF0yOl
X-Proofpoint-GUID: nfUIHCpEpRkv8yLdJZRf8HYs0BUF0yOl
X-Authority-Analysis: v=2.4 cv=E6hYNqdl c=1 sm=1 tr=0 ts=6acb9a4e cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=mPL7UwSLHth3KX_UYEUA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDExMDA1NiBTYWx0ZWRfXwNfSRklwrvKL
 oNgU9YCIR0mkPIt9DeO1NT4QWhtKbzrnHNUaItueTixFKO9OIQSSE8WI06lODqPQZpAUsGftvBh
 e351I8sYASkkIIZQBEUbusWF875kn5YCdWG/FBgh26TP8n6CtB7Xq0JiDHMF0V8WWuvJ87iWnWd
 s1yVPXtDsv/2+iFshxzUm55JnAvuJ2y+PN47MLql93G7zukyEy9eVGxcJZj3vc4OpLClUGgc5H9
 GNxmaD1Nj+ahpAsmtcXIdCpDHPZ/0FOuzOhggvm575zBYz9T81mYXLaENDfRzu2NLkJVZPZy8pE
 etMsixbgvceVMrCWfyDraOYON4CjqnPE2DpcZWimZ8cmtxtwa0WbTNuUuGBOY/QjrGgZ39sn+7Z
 u72G3/UaXw8dsrWcguVI1KVGtRb4EuJ7EVTLOMxJ1OuZbvLKgESKNuN5cIsouYYR5bVSLW+xuNm
 8isMoZjLdUM3K+mnNCw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDExMDA1NiBTYWx0ZWRfX8nJAbzkECwlU
 Rd7zqeYr2KB3+/lLqTRBDpZoDanHFBTCkVyD7w6Ftq37BdLo1kiRdX3mFqDV2BTAJMvtJnW++jO
 Zns1pP/RoXc6jMm03UY1MxqwAJYyS0E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-11_03,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 impostorscore=0 phishscore=0
 bulkscore=0 spamscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610110056

On 9/29/2026 7:38 PM, Ananthu C V wrote:
> capacity_freq_ref, the per-CPU frequency-invariance reference used by
> schedutil, is seeded from policy->cpuinfo.max_freq at policy creation.
> If boost isn't enabled yet at boot, max_freq reflects only the
> non-boost ceiling, so capacity_freq_ref never learns about boost
> frequencies for the policy's lifetime. Enabling boost later raises
> policy->max, but capacity_freq_ref stays stale, leaving schedutil
> unable to scale utilization or target a frequency above the non-boost
> maximum.
> 
> Seed capacity_freq_ref with the highest available frequency regardless
> of whether boost is enabled. Runtime enforcement, still handled by
> policy->max, is unaffected.
> 
> Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>   drivers/base/arch_topology.c |  3 ++-
>   include/linux/cpufreq.h      | 13 +++++++++++++
>   2 files changed, 15 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a..92966be712d5 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_block *nb,
>   	cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
>   
>   	for_each_cpu(cpu, policy->related_cpus) {
> -		per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
> +		per_cpu(capacity_freq_ref, cpu) = max(policy->cpuinfo.max_freq,
> +						      cpufreq_frequency_table_max(policy));
>   		freq_inv_set_max_ratio(cpu,
>   				       per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
>   	}
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 35ce665edfd8..f048c925fd98 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -1107,6 +1107,19 @@ static inline int cpufreq_frequency_table_target(struct cpufreq_policy *policy,
>   	return idx;
>   }
>   
> +static inline unsigned int cpufreq_frequency_table_max(struct cpufreq_policy *policy)
> +{
> +	int idx;
> +
> +	if (!policy->freq_table)
> +		return policy->cpuinfo.max_freq;
> +
> +	idx = cpufreq_frequency_table_target(policy, UINT_MAX, 0, UINT_MAX,
> +					 CPUFREQ_RELATION_H);
> +
> +	return policy->freq_table[idx].frequency;
> +}
> +

The current implementation looks correct and works well. That said, we
might be able to optimize it with a simpler implementation as shown
below:

+/**
+ * cpufreq_frequency_table_max - Get the highest frequency in a 
policy's table
+ * @policy: the &struct cpufreq_policy to inspect
+ *
+ * Boost entries (%CPUFREQ_BOOST_FREQ) are taken into account regardless of
+ * whether or not boost is currently enabled.
+ *
+ * Return: the highest valid frequency in @policy->freq_table, or 0 if 
there
+ * is no frequency table.
+ */
+static inline unsigned int
+cpufreq_frequency_table_max(const struct cpufreq_policy *policy)
+{
+	struct cpufreq_frequency_table *pos;
+	unsigned int max_freq = 0;
+
+	if (!policy->freq_table)
+		return 0;
+
+	cpufreq_for_each_valid_entry(pos, policy->freq_table)
+		max_freq = max(max_freq, pos->frequency);
+
+	return max_freq;
+}
+


>   static inline int cpufreq_table_count_valid_entries(const struct cpufreq_policy *policy)
>   {
>   	struct cpufreq_frequency_table *pos;
> 


Besides, could you comment patch v2 Dietmar's comments? It seems that 
patch 1/2 exposes a pre-existing ordering issue. On DT systems, 
cpu_scale is normalized only from the CPUFREQ_CREATE_POLICY notification 
of the last policy, so the cpufreq pressure of every other policy is 
computed in cpufreq_init_policy() from the raw, not yet normalized, 
capacity, and stays cached until the next cpufreq_set_policy() for that 
policy. So far this was harmless because capacity_freq_ref == 
policy->max at boot, so the pressure was 0 regardless of the capacity. 
With 1/2, capacity_freq_ref covers the boost frequencies while boost is 
disabled at boot, so policy->max < capacity_freq_ref becomes the common 
case and the stale value becomes visible (102 vs 79 on Juno R0, as 
reported by Dietmar). Perhaps the limits of all policies could be 
refreshed once from parsing_done_workfn(), after the capacities have 
been normalized?

--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -454,9 +454,27 @@ core_initcall(register_cpufreq_notifier);

  static void parsing_done_workfn(struct work_struct *work)
  {
+	int cpu;
+
  	cpufreq_unregister_notifier(&init_cpu_capacity_notifier,
  					 CPUFREQ_POLICY_NOTIFIER);
  	free_cpumask_var(cpus_to_visit);
+
+	/*
+	 * The cpufreq pressure of all policies but the last one has been
+	 * computed before topology_normalize_cpu_scale(), so refresh it now
+	 * that cpu_scale is final.
+	 */
+	for_each_possible_cpu(cpu) {
+		struct cpufreq_policy *policy __free(put_cpufreq_policy) =
+			cpufreq_cpu_get(cpu);
+
+		if (!policy || cpu != policy->cpu)
+			continue;
+
+		guard(cpufreq_policy_write)(policy);
+		refresh_frequency_limits(policy);
+	}



-- 
Thx and BRs,
Zhongqiu Han
