Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D5322DB7BE
	for <driver-core@lists.linux.dev>; Fri, 18 Sep 2026 09:15:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789722916; cv=none; b=DRt8TYF8FQjGeBofvAwj02+fxDLEX7G9wAPVauK44TWBrsGNrowFjyFou4+MSLUROJhIIzZf0S9vklWiJG+a49zSPVCidPpYPpEo4K6OxJSk7vQcyVPYOtki2YjtTccVrLVmgD9eiq4m0UzrR1ZkJdAmzUMjejex2b4lIpGB/9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789722916; c=relaxed/simple;
	bh=+MboOVSEobXqJz6TQMVlFxGzcxCRJenA8pUb+DqcaFg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tutP9dHYPcV46GvHNpA7U9Jxt4wnGRsa1+BAe1JOp/S+KKAKFhscmrw5dHSdBYAbwQmIL2rwRXZiT7zu04Np/umT9RHEf4NyH8cr8Gq+b9ixbItIXlU/frNkiPHk8q3pkoxOF3Qvm+Wdnirl4P6q/zh8K75VDsKkW1vYW1Ul/bY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ap3JfkEK; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LMNRgI3p; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ap3JfkEK";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LMNRgI3p"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68I5xw5P716997
	for <driver-core@lists.linux.dev>; Fri, 18 Sep 2026 09:15:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KDT0ugqoECRFmTPbHuBTsR7qxE0OvJsq8TFAdRff2lo=; b=Ap3JfkEKsAPJITVP
	lCDoOLN+d3tqkAhynWnFYrdCsTmwEGhNk72QbIGmGdA4fumUu1tlyphNvbUYiY3i
	spAY7RMJjqZeFPdwDdiTHq/CVedcNNDEZ1vhu85JTq8/tYa3sUpBx4bYNpTE2FnD
	gZWViNLm74V7bBHuBo6j8ft2jw5onqYWWlqicrG5+O/pjxFniJGgCZXVamrCh2yk
	hLfbyT3e4iPnfHQJl+PBooTU8lb0Rjmstcq/TtJdXbebOo+X9MUY3l6iKrw1D+tJ
	NFm9/U7u1Qzz/dBCvoFLSZAJp+L5rsNuTImFFuBiZ05hNMMd5iYzDyp50OO0mpXN
	IpSJLA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4grrg42drx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 18 Sep 2026 09:15:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfa4e4684bso13840125ad.2
        for <driver-core@lists.linux.dev>; Fri, 18 Sep 2026 02:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789722913; x=1790327713; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KDT0ugqoECRFmTPbHuBTsR7qxE0OvJsq8TFAdRff2lo=;
        b=LMNRgI3pwouGnEV4VHp5CANP+XoOcNKAigvlCEwhOcrczWbqw/lV8hei2zLvshA1Hq
         XgTIVREQUm7zMb2R+PiBKuw7T5gAzBsIr46ZDyhFRKoRb/5qi14hns1tu+rGsHOTLVqT
         4NExHZTSvyx3PgOML82bsYHQo52rXkAgU9S7cKe5/R8Wu68xVQYSUrX8zYdpHi9jdG5i
         apem5ZmYK8ceq2SdnQaJt97PwzKDiFCxC5FiqkbopHScYoyz86W+brm0CBzxCRqWl2Eu
         PTAL5AihaXJ4FY2N4QkJcXhc4dFGcBaYwsobn81F5Is5URVDaZEQt7Oi7XA795yU3fsg
         VAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789722913; x=1790327713;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KDT0ugqoECRFmTPbHuBTsR7qxE0OvJsq8TFAdRff2lo=;
        b=oOedVdtBGASp5SR893v4xABUM12ojK9W48WoZtDz1d8ZxcXZMUJNeDZokevG0QTW6p
         BaW8KmMYda29OeL91WkdLuMEOPZVAxHdttIDXPNrR5747LoInMeYauiOlVC5X7RBCnOw
         JXMsYbFtNq0bNOKXSOWr2FtfrAk6tnEymeDmUwdXClm3FcWJ9SNHGfxJluO6qp2mV0ZM
         qcMXxrfi29VoLVS6+rTP+wO/YwFT9yEevMhDV4mW2opYVzVXmuMrlYtHLqgLQ2s3+b0F
         sC2axDRpagq153D6sqDaTxgkoavzytBKDkM+qwdIlzALQrx/cIsbNHzPKut+Rw2wBYT7
         UNIA==
X-Forwarded-Encrypted: i=1; AKwUvBwEqz7jwRUtMdHmFEywxu+HcW3bhOTDt6jhLSLU4XkIJJvq2ylRt89u63teb/1t/Aa22EjFxoSZEGeVzg==@lists.linux.dev
X-Gm-Message-State: AFuF++mDd9B6IhGphyWK880Ho5FOHzitZ7QyoxKTzW8OxG24KDylJ6HE
	BAG/azaBOPXs1g2tv9dQdhl+Liom+vKr7/XeW7Y/a/BvZ2LgfG0PgLn2tdNp2lNDSuMGH3SKW4p
	/Xk8cHzvNWrc9yHqG0rm432/QA0pXuysZucss6B3WvRW6hDU2vqXRR/V/k/T1DiSVqZsJdaWdtQ
	==
X-Gm-Gg: AYBFou38WfUbZzu59t5tA5SCKUClVLmarcc96N6A9izWpHrzBhHPccw+lv4THCwcWcd
	ar+yRveSnmnY/4t9V/fuTKTtMAJ4AIurGq41SM9z8aFAvnIkFhta700z2x49Xb6bgPvLmamvYrw
	IUs6HtsDlxbUhx43gWh23KemwZf1m+e/QIwhDts9cF46hgMYDvnTsPN745KqhMQPttekOfI55Ua
	HECTjFVGyX6etTi7Cx/ngB61Uf47xP0iJqwQBZwnCJMN0T+2zYx5fCkERZB17Hb/OyygQxCVHng
	O+eFUkQfNUkcIgJ+v6UoDmrZGXLPnnSYcGjG+nxxkWnwpAkV4wtbHGL54/fGsohd9IjcrxJJTmS
	5HbsaisSqm74xp029OEFglWW8x5GVcdWQLsDWFD3S+hHpJvpBSDGQ4GMre/ZHvSU+ZvcCq3A=
X-Received: by 2002:a17:903:2343:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2ddb1ab4ee9mr41636075ad.1.1789722912845;
        Fri, 18 Sep 2026 02:15:12 -0700 (PDT)
X-Received: by 2002:a17:903:2343:b0:2d9:b60d:7755 with SMTP id d9443c01a7336-2ddb1ab4ee9mr41635405ad.1.1789722912341;
        Fri, 18 Sep 2026 02:15:12 -0700 (PDT)
Received: from [10.133.33.171] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddb7525b2asm4784555ad.19.2026.09.18.02.15.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Sep 2026 02:15:11 -0700 (PDT)
Message-ID: <05c00750-7fc2-49d4-9336-7beb33fd9380@oss.qualcomm.com>
Date: Fri, 18 Sep 2026 17:15:07 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] cpufreq: fix schedutil not returning to non-boost
 freq when boost is disabled
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, zhongqiu.han@oss.qualcomm.com,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-2-25312a713699@oss.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260908-schedutil-boost-frequency-handling-v2-2-25312a713699@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: oNW5TGSTaWxS4yf8ml3ukt1rmpLZeZMw
X-Authority-Analysis: v=2.4 cv=ZO9CCn7b c=1 sm=1 tr=0 ts=6aad0121 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=yaB9tev9RX6Wa8ZHx44A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: oNW5TGSTaWxS4yf8ml3ukt1rmpLZeZMw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE4MDEyNyBTYWx0ZWRfXwQR2gaE6PXJR
 7MlQVybeoTXaVvjfrgyqfZGFEG/zsVIq8mrMLH+9wvsFhZuRDPrIGpRi7T0/e7H5lHgYvQqYJLN
 U6oDxQ8mYRxfSvv2BT6PlowjWAkVRnCOYji3Lc850kQWI5ldN3iyx0s8RU28eamv+sJqKHUUipS
 C8tFzFLxZrU2cPKsfnVWjfv0SqTBATdDiIfen80HPmSHOIJbrofjMtHf8mT2xtReA51xUErAwTT
 aq8JlIWbihOm6zth8tM9Vm7pAQbqrawc2io/ORGbrvPXtYXLWB/84xoffZl+FuIo3aRJeNrIigm
 bN1jLGRkphrbkYN3eGdTq9u3odDVEe2e9PLNBHydDtm0iBPTqU2bXTnPKXBb5fh9gZSZtf14SkT
 jumfjej50ifrowOBp3bIVsbtJi64NvFoNnCzCFggynoSB2rPQ6DEE4sdLOL+F+ZbqgK9+/EZijl
 XhXv/2RBgO+yVAt78Ww==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE4MDEyNyBTYWx0ZWRfX9z2hmYrszHDE
 Jv98/tgyQsJNHnuKUcAeQC6zZsPIsT7Ta+CgRgWCp059QXNBuJOIa8M2MvUmPSMZeMwg5Gapj2j
 G8EXwx1mbqSPcjHhXa46ut3fLlAR2es=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-18_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609180127

Hi Ananthu,

On 9/8/2026 4:30 PM, Ananthu C V wrote:
> Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
> max boost is known") introduced a guard for cpuinfo max updates to only
> increase, to preserve driver-set values above the freq table maximum,
> causing cpuinfo max to be stuck at boost frequency even when boost is
> disabled.
> 
> Unconditionally track the highest non-boost frequency (max_base_freq)
> in the freq table. When a freq table is available, use max_table_freq/
> max_base_freq instead of cpuinfo->max_freq to control boost values, so
> the value can decrease again when boost is disabled.

This issue does not appear to be limited to schedutil, so the subject
seems too restrictive.

> 
> Fixes: 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if max boost is known")

I already commented on the Fixes: tag in v1.
https://lore.kernel.org/all/3a20b69e-b072-4723-925f-514d8162e259@oss.qualcomm.com/#t

IMO it should be: 6e39ba4e5a82 ("cpufreq: Add boost_freq_req QoS
request")

Could you please comment on this?

> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>   drivers/cpufreq/cpufreq.c    | 14 +++++++++++++-
>   drivers/cpufreq/freq_table.c |  5 +++++
>   include/linux/cpufreq.h      |  1 +
>   3 files changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> index 0d0df986fa3d..a13e72711597 100644
> --- a/drivers/cpufreq/cpufreq.c
> +++ b/drivers/cpufreq/cpufreq.c
> @@ -574,6 +574,7 @@ static ssize_t show_local_boost(struct cpufreq_policy *policy, char *buf)
>   
>   static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
>   {
> +	unsigned int max_freq;
>   	int ret;
>   
>   	if (policy->boost_enabled == enable)
> @@ -587,7 +588,18 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
>   		return ret;
>   	}
>   
> -	ret = freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);
> +	if (policy->freq_table) {

acpi-cpufreq has a freq table but never sets CPUFREQ_BOOST_FREQ, so
max_table_freq == max_base_freq == _PSS P0 here, and the real boost
ceiling kept in cpuinfo.max_freq is lost. It seems that the condition
needs to be "does the freq table list boost frequencies" rather than "is
there a freq table" — e.g. recorded during the table scan, the same way
boost_supported is derived from the flags in
cpufreq_table_validate_and_sort(). And then:

if (policy->cpuinfo.boost_in_table) {
     xxx;
}

> +		max_freq = enable ? policy->cpuinfo.max_table_freq :
> +				    policy->cpuinfo.max_base_freq;
> +
> +		if (!max_freq)
> +			/* when the freq table contains only boost frequencies */
> +			max_freq = policy->cpuinfo.max_table_freq;
> +	} else {
> +		max_freq = policy->cpuinfo.max_freq;
> +	}
> +
> +	ret = freq_qos_update_request(&policy->boost_freq_req, max_freq);
>   	if (ret < 0) {
>   		policy->boost_enabled = !policy->boost_enabled;
>   		cpufreq_driver->set_boost(policy, policy->boost_enabled);
> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
> index 4984142dc08a..7e183e16162d 100644
> --- a/drivers/cpufreq/freq_table.c
> +++ b/drivers/cpufreq/freq_table.c
> @@ -34,6 +34,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>   	unsigned int min_freq = ~0;
>   	unsigned int max_freq = 0;
>   	unsigned int max_table_freq = 0;
> +	unsigned int max_base_freq = 0;
>   	unsigned int freq, i;
>   
>   	cpufreq_for_each_valid_entry_idx(pos, table, i) {
> @@ -42,6 +43,9 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>   		if (freq > max_table_freq)
>   			max_table_freq = freq;
>   
> +		if (!(pos->flags & CPUFREQ_BOOST_FREQ) && freq > max_base_freq)
> +			max_base_freq = freq;
> +
>   		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
>   		    && (pos->flags & CPUFREQ_BOOST_FREQ))
>   			continue;
> @@ -62,6 +66,7 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>   		policy->cpuinfo.max_freq = max_freq;
>   
>   	policy->cpuinfo.max_table_freq = max_table_freq;
> +	policy->cpuinfo.max_base_freq = max_base_freq;
>   
>   	if (min_freq == ~0)
>   		return -EINVAL;
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 3f3b1380251a..419c71ccff7c 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -46,6 +46,7 @@ struct cpufreq_cpuinfo {
>   	unsigned int		max_freq;
>   	unsigned int		min_freq;
>   	unsigned int		max_table_freq; /* Highest valid frequency in the table */
> +	unsigned int		max_base_freq; /* Highest non-boost frequency in the table */
>   
>   	/* in 10^(-9) s = nanoseconds */
>   	unsigned int		transition_latency;
> 


-- 
Thx and BRs,
Zhongqiu Han
