Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39EA04EC66A
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 11:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791890921; cv=none; b=k8InLfnIUCqlhyP/8l6kbyZVwY9K148KsIU3eGa3iaY6t779dMtM1zvVdyoSfj8XoXCT96Q3AKf3h8eIVmEwI+PObG/IIIWuRRhlpyzyB4149v9Qayl2YcUqFeSvU+VjBYzC1LEAkPAk01okdLoFwFDM2TbL7RymgGHpfdKU8wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791890921; c=relaxed/simple;
	bh=HN6XptzcoudNzRj4ZXmG0JwPr60rSlO5PO4+/eOdLdI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KBdODgyoTENNvZaQD81yqFXYkWZlnMZmTuHbmbiC00Oj/NdAxFg5BFF3cD07i1RSqSvfhLj9z3SezRl9CKViTY52Dlrkq+5K0t3PWMFsnhSKLWCCD6TAnaiCkDCp1GC/w/U8++1Q5WCkv19ZyT1HTam6vhjmKCvnlSo9NVhiqY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nniA5vjR; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i/VETmaa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nniA5vjR";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i/VETmaa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D6YsUj3208375
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 11:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rcn4mFMnCGkwABHUVZsFsGzh0zOF9QcSjkE0SqwCV14=; b=nniA5vjRz/7Sqnh/
	n2s2MJ5TTbRUcfl7FZMHhIc487f3zmV+fWV2YSPDKoZOZxFILHnYCdoG/VQp8imV
	pOBpj503tejv5N/JeE5kev3PQSZ8WCzP5sbJwvt5NE7MtpGApwpjhrJMDtqTEpzB
	VDyHtNAvvcfsZ/DCSfRwwT5tBYxPHysCuTsd0e2mh7wqzubUU4Cokh8usHXlWvo5
	xtD2PZQLvLagAG69+9hymmaPn5lT+soxbzsSYk0p+lP/VEd+7KmQw9bnf5dQ+fqN
	Tnr2L5qXa6R4eq5KEShVQSAjCet/n39lH5NTkLw+siYbzQBeHXYDrKcqpm6QJjcv
	VgwobA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9fgjh6y4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 11:28:39 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3a89dd31fdaso2496015a91.0
        for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 04:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791890919; x=1792495719; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rcn4mFMnCGkwABHUVZsFsGzh0zOF9QcSjkE0SqwCV14=;
        b=i/VETmaa3MNoe+mbszQS1cXlzv8WLPWtuWA/Hl4VYHjy5sMoOp+hHkWq8/Xa9hDenD
         keazg89FnVzJSxqLXF5dcELbcvvRS/8AA9lCzjnfW3T+0rmzZ47O7r40d39gv0D7IXWB
         gb2GqUnzrJkveQuRfFdSEO+xQ3fZprRiqK4AVMeiaN7K3lfaFHEhwfmVGQTRma1A7RJS
         u/uuJognV3WClrOnxlO7HOm4DrO+eJkhJjgGMsrbDAVZY5aHlIlMBGAEyV54GxxOaZuo
         6H9R/5EFEzaW/M8ek7hrWEYBmF4iC70gGn9LX2yWmIsCVA/Emb8GvZ4YafrlipRX9GZg
         st3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791890919; x=1792495719;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rcn4mFMnCGkwABHUVZsFsGzh0zOF9QcSjkE0SqwCV14=;
        b=PxWpe3bkGgz3rsUHxYJgIY8psigbrn6JsySwXqkLI2tY895BAVBO9oAbh6ACkrBqoh
         Vef0ORMZtE2WIVKoq0kuGNSdwAUpz5dW0YFO/2xouv5FEbgb+Tne3gihEYc5A5Kxz/Nm
         d4ZxJ3SuFXvQaGRZlhN12QwnfG2cDLmVB9ZeGOUxFR8ew9TLiHIRuELVwnEVwHU9mZEe
         iSEmGe3Coy7BugZR5gjXvAhel6IJDKLGQwOuFrCvKhKNgPXB4BHXzh+WHUnY0tPuCURp
         XxNG2aNLeZPOsI8IfgzhVDrHI+0PU91k8H1ZSc41WkMqVIfbAr1ll2AV0q5J+YxScc87
         +gJw==
X-Forwarded-Encrypted: i=1; AKwUvBw4i8ndqp2TvPIZ40HfvjmQ81Hyg8hfsMC0WZpxwhDlja/hs2eOyI7dx7FrQ0JMvupukVHeupuXfd7whA==@lists.linux.dev
X-Gm-Message-State: AFq9FYIGJcacmVGRWa+eSAB/DZQiiM5CSpPTDzLmnTmh0xZHIgaqyTVr
	Ud47YAIg3zTUEe14hq5jzSTpthNny7Cua276bN0GawoU9K9hf0fvWbHHGvyPyw+JRKoVhf2TGkf
	0hMfKhzZJhjBEZUcAq14wnTYgalASS/q9J/XnfTRAwRmgZFr6/LhKD/L58LPyAVW+kA==
X-Gm-Gg: AYBFou2smsSJVRF7VdX1PAPI+F1KtN7ibVkcar9jLLA5ZOS7DX9mwAwqWYiElK+nyuA
	WazIJ03QMaFebfUDj1YYyZ5xMM3BVDTjYSth2AvcWGKIisN+IfEQGmi75gWR5f4byn2RAiy2FiG
	d0n3uFBOJhFLxQjvbqGH73UjKCJWxUiujwSXMKHOKnCw+jmIF+O2rdc/534YJJlBc129kunYLid
	w1sEMn8JfNZavRN7zCUyAfpQmXue/dTVR/JZOZIdN1L4/m5ELWWtr6AKkYJzlGmJZuNb43FrKCM
	sasDSLe8oMGt5Rn+X5a+SZ1cqVJKOvr/oiT7w0PQx7QISTeYzun1dK/D1DoamxfFECw4eNC2tyZ
	0uNQeB3tH/AEyBOzWpyiBrZ+H0ojGV9SOQpDGyRI66jJlboqan0R1n0IJ8VM7x8RuD7BsKIYO
X-Received: by 2002:a17:90b:4c4f:b0:3ab:27eb:338e with SMTP id 98e67ed59e1d1-3ab3ac54a33mr9617231a91.52.1791890918311;
        Tue, 13 Oct 2026 04:28:38 -0700 (PDT)
X-Received: by 2002:a17:90b:4c4f:b0:3ab:27eb:338e with SMTP id 98e67ed59e1d1-3ab3ac54a33mr9617204a91.52.1791890917770;
        Tue, 13 Oct 2026 04:28:37 -0700 (PDT)
Received: from [10.133.33.242] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab393efd88sm12249694a91.3.2026.10.13.04.28.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 04:28:37 -0700 (PDT)
Message-ID: <77749e58-84d6-43c1-bd37-98d0046231a1@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 19:28:31 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] arch_topology: seed capacity_freq_ref with highest
 available frequency
To: Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Ananthu C V <ananthu.cv@oss.qualcomm.com>,
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
 <fbd7fe35-5e14-4589-a072-909e49a92e76@oss.qualcomm.com>
 <cfb79ffe-41b7-4e58-b3f5-fc9a28a4e413@arm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <cfb79ffe-41b7-4e58-b3f5-fc9a28a4e413@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: h_w4twJG1Jx7hraLALzDYMytA7ZWBP3q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX+8CWVWv7P06k
 mjyxOD8fhd1IwU+OkZ1YdUqGKCv4c6jj0lSFL7csffIGV05ueAOYJ5PmzzkfyqiKwA3FgOxmbAj
 HdCK9Ri4K4SJNvUvhmdz6KNBMB0FYy65qVJU0SBCQkHLZBD/fK7B4UlrO4a/105v7quO3wlSGkR
 RC97rNtOtbVdPrp2WOOR5HT2hVqwjnjo83ZiNEgIq9NdiDWzI1JwPkZepXJAK+5c7KHkbS2TxwL
 lriixxEqscJYHJF6f+K1+1NVHI8190YwsYRLLotiF7ybkpOR7C8xOoaW7rlqgmCEziijHstpvWw
 bVsp+Mh7qabWQ246sZD0HAtUA84zAtjx82/wRZMf1ZKOYq1QWImugVPphFVqZMRYNvcmFzNXKPJ
 tDn/TgUiyjcEdP+8dL7GbTBiudNKjww7v/WFpqk1O2gEfnwvWbEsfBBOC/NEcbkW0EAM4vSjRvQ
 5EojhWRGJmupisH1CwQ==
X-Proofpoint-ORIG-GUID: h_w4twJG1Jx7hraLALzDYMytA7ZWBP3q
X-Authority-Analysis: v=2.4 cv=PedqFShd c=1 sm=1 tr=0 ts=6ace15e7 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=9bVTjAMtGWzbgpHzqb8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0NSBTYWx0ZWRfX6qDnw7UyZmJ7
 X4+uMo1oTiMflBNrT5JaVC74lDhCyDWm+VVmnaNT2tDzgOPXsRPxCWX3QNZ8ZZS8QYkkhp5C8q2
 6M3ljzH+5LnartTK8V3G/N6tXqFiAn0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130045

On 10/13/2026 2:45 AM, Dietmar Eggemann wrote:
> On 11.10.26 16:16, Zhongqiu Han wrote:
>> On 9/29/2026 7:38 PM, Ananthu C V wrote:
> 
> [...]
> 
>> Besides, could you comment patch v2 Dietmar's comments? It seems that
>> patch 1/2 exposes a pre-existing ordering issue. On DT systems,
>> cpu_scale is normalized only from the CPUFREQ_CREATE_POLICY notification
>> of the last policy, so the cpufreq pressure of every other policy is
>> computed in cpufreq_init_policy() from the raw, not yet normalized,
>> capacity, and stays cached until the next cpufreq_set_policy() for that
>> policy. So far this was harmless because capacity_freq_ref == policy-
>>> max at boot, so the pressure was 0 regardless of the capacity. With
>> 1/2, capacity_freq_ref covers the boost frequencies while boost is
>> disabled at boot, so policy->max < capacity_freq_ref becomes the common
>> case and the stale value becomes visible (102 vs 79 on Juno R0, as
>> reported by Dietmar). Perhaps the limits of all policies could be
>> refreshed once from parsing_done_workfn(), after the capacities have
>> been normalized?
>>
>> --- a/drivers/base/arch_topology.c
>> +++ b/drivers/base/arch_topology.c
>> @@ -454,9 +454,27 @@ core_initcall(register_cpufreq_notifier);
>>
>>   static void parsing_done_workfn(struct work_struct *work)
>>   {
>> +    int cpu;
>> +
>>       cpufreq_unregister_notifier(&init_cpu_capacity_notifier,
>>                        CPUFREQ_POLICY_NOTIFIER);
>>       free_cpumask_var(cpus_to_visit);
>> +
>> +    /*
>> +     * The cpufreq pressure of all policies but the last one has been
>> +     * computed before topology_normalize_cpu_scale(), so refresh it now
>> +     * that cpu_scale is final.
>> +     */
>> +    for_each_possible_cpu(cpu) {
>> +        struct cpufreq_policy *policy __free(put_cpufreq_policy) =
>> +            cpufreq_cpu_get(cpu);
>> +
>> +        if (!policy || cpu != policy->cpu)
>> +            continue;
>> +
>> +        guard(cpufreq_policy_write)(policy);
>> +        refresh_frequency_limits(policy);
>> +    }
> Yes, IMHO, something like this is needed.
> 
> [    1.169158] cpufreq_notifier_max(): current=[kworker/u26:0 46] policy->related_cpus=[]												(1)
> [    1.169209] init_cpu_capacity_callback(): current=[kworker/u26:0 46] policy->related_cpus=[0,3-5]
> [    1.169992] cpufreq_update_pressure(): current=[kworker/u26:0 46] policy->related_cpus=[0,3-5] policy->max=700000 pressure=102 max_capacity=578 capped_freq=700000 max_freq=850000
> [    1.170203] cpufreq_update_pressure(): current=[kworker/2:2 67] policy->related_cpus=[0,3-5] policy->max=700000 pressure=102 max_capacity=578 capped_freq=700000 max_freq=850000 	(2)
> [    1.170835] cpufreq_notifier_max(): current=[kworker/u26:0 46] policy->related_cpus=[]												(1)
> [    1.170872] init_cpu_capacity_callback(): current=[kworker/u26:0 46] policy->related_cpus=[1-2]
> [    1.174516] cpufreq_update_pressure(): current=[kworker/u26:0 46] policy->related_cpus=[1-2] policy->max=800000 pressure=280 max_capacity=1024 capped_freq=800000 max_freq=1100000
> [    1.175261] cpufreq_update_pressure(): current=[kworker/2:2 67] policy->related_cpus=[1-2] policy->max=800000 pressure=280 max_capacity=1024 capped_freq=800000 max_freq=1100000	(2)
> [    1.187698] cpufreq_update_pressure(): current=[kworker/2:0 28] policy->related_cpus=[0,3-5] policy->max=700000 pressure=79 max_capacity=446 capped_freq=700000 max_freq=850000	(3)
> [    1.187847] cpufreq_update_pressure(): current=[kworker/2:0 28] policy->related_cpus=[1-2] policy->max=800000 pressure=280 max_capacity=1024 capped_freq=800000 max_freq=1100000	(3)
> 
> The work scheduled in (1) also still operates on raw capacity (2).
> 
> (3) shows your extension in parsing_done_workfn() work function which
>      gets scheduled when all CPUs are initialised, so
>      topology_normalize_cpu_scale() had been called.
> 
> Not sure whether we can call cpufreq_update_limits(cpu) there instead
> (maybe extended with a 'only do this for policy->cpu'?). So we won't
> have to expose cpufreq internals in /drivers/base/arch_topology.c.

Thanks for the test verification and the discussion.

Unless I'm missing something, it seems to me that
cpufreq_update_limits() is mainly intended for platform limit changes.
When a driver implements ->update_limits(), it is up to the driver
whether the policy gets refreshed at all (it seems that amd-pstate only
updates the preferred core ranking). Otherwise, it goes through
cpufreq_policy_refresh(), which calls ->get() first and WARNs and skips
the refresh if that returns 0, for example when the policy goes inactive
under us.

In comparison, refresh_frequency_limits() seems to match what we need
here more closely: it simply re-applies the limits and therefore
recomputes the pressure, without going through any of the above.

However, calling refresh_frequency_limits() directly from drivers/base
arch_topology.c does expose some cpufreq internals there. I wonder if it
would make sense to add a wrapper around cpufreq_update_pressure()
directly, something like:

--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -454,9 +454,19 @@ core_initcall(register_cpufreq_notifier);

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
+	 * computed before topology_normalize_cpu_scale(), so update it now
+	 * that cpu_scale is final.
+	 */
+	for_each_possible_cpu(cpu)
+		cpufreq_refresh_pressure(cpu);
  }

--- a/drivers/cpufreq/cpufreq.c
+++ b/drivers/cpufreq/cpufreq.c
@@ -2611,6 +2611,27 @@ static void cpufreq_update_pressure(struct 
cpufreq_policy *policy)
  		WRITE_ONCE(per_cpu(cpufreq_pressure, cpu), pressure);
  }

+/**
+ * cpufreq_refresh_pressure() - Recompute cpufreq pressure for a CPU's 
policy.
+ * @cpu: CPU whose policy's cpufreq pressure is to be recomputed.
+ *
+ * To be called when arch_scale_cpu_capacity() of @cpu has changed while
+ * the limits of its policy have not.
+ *
+ * Takes the policy rwsem, so the caller must not hold it.
+ */
+void cpufreq_refresh_pressure(unsigned int cpu)
+{
+	struct cpufreq_policy *policy __free(put_cpufreq_policy) = 
cpufreq_cpu_get(cpu);
+	if (!policy)
+		return;
+
+	guard(cpufreq_policy_write)(policy);
+
+	if (!policy_is_inactive(policy))
+		cpufreq_update_pressure(policy);
+}
+

--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -251,6 +251,7 @@ u64 get_cpu_idle_time(unsigned int cpu, u64 *wall, 
int io_busy);
  void refresh_frequency_limits(struct cpufreq_policy *policy);
  void cpufreq_update_policy(unsigned int cpu);
  void cpufreq_update_limits(unsigned int cpu);
+void cpufreq_refresh_pressure(unsigned int cpu);
  bool have_governor_per_policy(void);
  bool cpufreq_supports_freq_invariance(void);
  struct kobject *get_governor_parent_kobj(struct cpufreq_policy *policy);


-- 
Thx and BRs,
Zhongqiu Han
