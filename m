Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794404831;
	b=eJBuPtvS3VKclGMqZfekziYnne/O7+BgEN5/TsUCxr/Yuhbhx64Jg2lNNKDMMenvgW2d
	 4EQ1I6zoqBJDWKp9T5Zts8ezT6JEpfPAq6zGezrEXT7vTa1QNh0r+0Eg14t8AihJRRrzP
	 wWbXr0eCcweFcyEXMNdzplTEVWyN5/SkdTFHaZ42dvyaUHQDm7/Q5GUKm1VxMC+jLA/dO
	 lnghOOi3gW/57b8KxO7g5L17pIwtd7w1HxRa0pgnKjINF2iuvu+M3fUCLJvQaY0PCESji
	 2s1/ua0CA0xciCoJptM34Mp9H4twHRKYs73yAXKsLHb5Nnkx4IGJG9GHU5csGZda8QA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794404831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=B0t7gR4bEucbc8jZShMdnCoiT4kfG+r/AXQtiP9TGNo=;
	b=CXgGc/JzeS6f7gZ0Up45Nco/Op4g3vFWGwZZYbSsM71bFeG/0H7PPQzF4usUEosxum/d
	 4J29irns0SdAEl6pCnDxhQMEJ9E/XBpEgQgiVKHTiAnK/eWOBQ68OinWcXrnwQkDorZdX
	 OdrDixmA+6WC2tiU90Jnwa4daa8Sp4naKojlnOyWL+HhW6Qnmu3vmqZlFdMngkc+/H2kY
	 4hv29ebNmyKvQp5xzkAnHgv93gF7yArFA72V3IQW9DR9k/Z/vg4O2Bt90qPMsHArZwYsb
	 EspQE0G9vQucaCqSdsITCddHMVqSJfhcRmewzt6RqeVk+AzzaFuKgDWaU0emkB6fFjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1NI9ZXK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbY+Y7k8;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A45C9606A321
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 13:47:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A45C9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=P1NI9ZXK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HbY+Y7k8
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCYtlU1806565
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 13:47:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	B0t7gR4bEucbc8jZShMdnCoiT4kfG+r/AXQtiP9TGNo=; b=P1NI9ZXKpPpLefpB
	T3jRSQKTdCHlEJxCBLZcI8vT3iWGPPydxpLKXAaJhtexVFFrEoWcIMwtEIjJFan3
	FngfDNeafJTexxx7+8fS+CyhF+fidjkTM04SWz9+37XWiMHELmIS0dNjyy3RMv1f
	fyJKo7B2LRVEAcTfr4EwnLyb/0Dglh2Octj0XY6HB1zpipBui9yPL+jYU2paRntD
	gSiwZFC37NRpTAHhcaIB0Rtt/s0zrYvd7FfmVd05fxrOZxAZjSwCmxzxnNzzrVej
	BpHRpbhJPqBQ6cnWyfdaMqrrGKjyIUOSIg+tysqWd0H8NUaG0nTJgbWLoeXmz/Y9
	CdGaXQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawjc1d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 13:47:09 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso2394252a91.1
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 05:47:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794404829; x=1795009629; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B0t7gR4bEucbc8jZShMdnCoiT4kfG+r/AXQtiP9TGNo=;
        b=HbY+Y7k8hF/YtmTC+3XZXLYQ3WrLDhhls3aPAnMDxZyeyqVNfhhHDnerlvGRp4Jiuc
         IpPFxHAAoOKPn09zghwhqpSP4kFm1q5pAcU+1V55XdNXozNACn/Zz71xm4bOW9sdUn1c
         UPz+qr5VdpwNjRs++DGOzWTpmouPFcHb7yEBI0kuamZVAIQp64n8M2lcdSAagemyWHir
         LpFAVN9TWUS/kdNczjk2eY4cRlRjlm3lpbXUSVbua8nwPuRfmtH6V2gZ6RP66yZqWqjn
         x2FkgQUZg1qrQx5fVa7izd6SwZ3pGs5K2X9IBVKQ8LBFdSvEDaZiOncnUrBQH09AcW7o
         5vIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794404829; x=1795009629;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=B0t7gR4bEucbc8jZShMdnCoiT4kfG+r/AXQtiP9TGNo=;
        b=wvzf11cjM4MRsvihNxxd7IXfCvW+zLB0IAvDSt/Zq/I572x+NZahbMxD4aGFbeupB2
         PQEJx8I+fupuTte92Ozb3IPTGdHiixSJ9W/uVkvdYlTnSAkHheDyIfQQqDb+uXpOqLhI
         h4HgfWAsiIJYGjO3yU/35PFYr5aTqGttDkO77y1E9KNGjEU4ggS3G9RaxZQkYRsEupXg
         wG16u63AH0EpKas93OuTH6OWpCNLvZCKroucXyip0KgX9GSA6xlG/YboMKXar9NBz6st
         h01gTa/UaoqLlz47M4vVQgDyNrcbXrRwW67CxnVpV1Cr8A5hDqzkUZxf4k3/k4dO8vs7
         LtqA==
X-Forwarded-Encrypted: i=1; AL+hErGKBd1HASFlF7VqLVzsL5kaVz8YVWyNVE5LOCpUQL/XS+EAsTAvWLX+Qu5BpYuZj//e6Ay9dCltDd7iyQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8MqXoYIV0jLWJ/T66UeJuQ1ub8xBxvg9DY1G2LW4R6t8Fj/8NK
	/sNFwKqYtFqFspGEYLdF5lqTcuR1yBtsvpZJiYHLvMcoUhHIoPeRVMqylxktlmewy51ee8wPEAu
	7EG7hntJjqyxr36A/ElPf6NNojVtoI1k96KfWW7hM0/M5wO5yY/XokEG4C0JuIkst7Q==
X-Gm-Gg: AYBFou2ahjOMl4KmHgFTYs27YuJ+RNyP2DKmDt/juiLPMW9PikRX09vf/bc5Mag/ANL
	vDgAImv0/3eXKdw9SCTpvn73xursO6lxnSz2/N9hC028WgdH+qPsOmENP7fSuAtrYW/Hy7KPEWQ
	DzJpQ4lJw1pVJxv3pL7PnkKfBeTC6bWm5m2gguATA2eHdz6fwDzsHQ0RQ+GCqWh8r3I/4z78jMK
	qufF7IL8dyskMjuO9lgcXtBMJi9O80nwMnvGTYCTjz/iWfwFK1OOrIR15WsIO0Ogb2ryTycqiHo
	WOP2fl4jqt91uH4LoiD3O72G9VTq67oUqPdNZFquVXRmV+IKkWcNVvBpnOIYEVyDk2WpNnUC/aw
	Ur3RbhP4Xx1+M1NTdLEStOjJTiJ00ZYOlhMpCnaou2GS5jDDt0gFUucj/fLcqA0cOftgAonkbV4
	Q0DGt7G2mLkYfjK0K8LcgN5zzaxMzrXLGj
X-Received: by 2002:a17:90b:3886:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b182f2570fmr1699707a91.23.1794404828629;
        Wed, 11 Nov 2026 05:47:08 -0800 (PST)
X-Received: by 2002:a17:90b:3886:b0:3a6:d850:bf16 with SMTP id 98e67ed59e1d1-3b182f2570fmr1699688a91.23.1794404828126;
        Wed, 11 Nov 2026 05:47:08 -0800 (PST)
Received: from [10.133.33.220] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17dfb9827sm4890431a91.1.2026.11.11.05.47.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 05:47:07 -0800 (PST)
Message-ID: <18db783d-afef-4cd7-8192-00f1970da7ae@oss.qualcomm.com>
Date: Wed, 11 Nov 2026 21:47:01 +0800
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to non-boost
 freq on boost disable
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>,
        Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <41f328b2-0825-4023-b86c-48136ba6ecd2@oss.qualcomm.com>
 <avRd3YVDXs26hrow@hu-anancv-blr.qualcomm.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <avRd3YVDXs26hrow@hu-anancv-blr.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfX9oBGQ+2F6RFJ
 JtzZcR84GYKqolruncIcbQQb5ircHXpPcYEQlICvyXW2tBELtzc5u27RJjYOl1S7IcQSJOulq9u
 jq9tya0fOwq9DGY1qin4R4id6IlXNJs=
X-Proofpoint-ORIG-GUID: pxDDOR9UJefnxLbJ0nFNClvvjegjzA4b
X-Proofpoint-GUID: pxDDOR9UJefnxLbJ0nFNClvvjegjzA4b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1NCBTYWx0ZWRfX9RE8xUeStPYj
 vaufvU+a8jd5U/1egbWiSVuBQGz3zYV2gRgCX1ROJZ9vN7IQo0OD4JwLWLDJlED7mFqJPAM1mMs
 UhoOdHyS9qe/U2meZ5RlnlzJahAxcSlVwZ8mAYMLjhNi2BQvfWHrc3VwjpNKYRjxT6W3fPJ+iFi
 n9BIz5wndakLBpeZr847LSmB/2mDw6UmujGkMuMIAUmzxNDRKIzUR1xSiz3FR16/IsF6QlEoWXy
 vw2a0Hh4fxiu5NIMq/6UrGbev3UUdTIWa7C6OawYH7yjOxIS6ppUjIs1KMvGJLpxCBh36WKYK3y
 Gx2m6RDJVEzfRrWK2DkCSlPuaBM3yctau8TYCAbgm82ShtUkjiRnRu83OWUP+xqw62U7W0X3nJX
 zKAUd0jiRS+UKyVb2vZl2pvCHDlUVzR7+SDSpGcdqxFZEklB7t/nyNbgKQrICLkOzVv2p2Huj3h
 n0PWtIjgeweaBtqzFww==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af471dd cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=qZlHrcwyowrLkl4W26AA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110054

On 11/11/2026 8:21 PM, Ananthu C V wrote:
> Hi Zhongqiu,
> 
> On Sun, Oct 11, 2026 at 10:17:14PM +0800, Zhongqiu Han wrote:
>> Patch 2/2 currently depends on a helper introduced by patch 1/2, which
>> prevents it from being backported independently. Since 2/2 is an
>> independent fix that should be backported to stable on its own, I think
>> it should be placed before patch 1/2 in the series and kept self
>> contained.
> 
> The idea was that currently patch 2/2 would serve no actual value without the
> fix in patch 1/2, and that is why it was the second one. But yes, we cannot
> fix 1/2 and leave 2/2 as is, which would turn the current benign issue to an
> actual problem, so the order should be probably reversed. I'll work on that.
> 

As I mentioned before, patch 2/2 addresses a separate issue that should
be fixed in its own right and backported to stable kernels, because with
policy->max stuck at the boost ceiling, scaling_max_freq keeps reporting
the boost frequency after boost is disabled (as shown in the cover
letter), and governors such as performance can still select boost
frequencies. Anyway, please go ahead.


>> To avoid introducing a new member that is only used by frequency-table
>> drivers, please consider the following implementation instead:
>>
>> If there are boost entries in the frequency table, the table is the only
>> source of cpuinfo.max_freq, so let cpufreq_frequency_table_cpuinfo() set
>> it unconditionally in that case.
>>
>>
>> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
>> index ea99464..8c8bad2 100644
>> --- a/drivers/cpufreq/freq_table.c
>> +++ b/drivers/cpufreq/freq_table.c
>> @@ -33,14 +33,17 @@ int cpufreq_frequency_table_cpuinfo(struct
>> cpufreq_policy *policy)
>>   	struct cpufreq_frequency_table *pos, *table = policy->freq_table;
>>   	unsigned int min_freq = ~0;
>>   	unsigned int max_freq = 0;
>> +	bool has_boost = false;
>>   	unsigned int freq, i;
>>
>>   	cpufreq_for_each_valid_entry_idx(pos, table, i) {
>>   		freq = pos->frequency;
>>
>> -		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
>> -		    && (pos->flags & CPUFREQ_BOOST_FREQ))
>> -			continue;
>> +		if (pos->flags & CPUFREQ_BOOST_FREQ) {
>> +			has_boost = true;
>> +			if (!cpufreq_boost_enabled() || !policy->boost_enabled)
>> +				continue;
>> +		}
>>
>>   		pr_debug("table entry %u: %u kHz\n", i, freq);
>>   		if (freq < min_freq)
>> @@ -50,17 +53,20 @@ int cpufreq_frequency_table_cpuinfo(struct
>> cpufreq_policy *policy)
>>   	}
>>
>>   	policy->cpuinfo.min_freq = min_freq;
>> +
>> +	if (min_freq == ~0)
>> +		return -EINVAL;
>> +
>>   	/*
>>   	 * If the driver has set its own cpuinfo.max_freq above max_freq, leave
>> -	 * it as is.
>> +	 * it as is.  This does not apply to tables with boost entries, because
>> +	 * the table is the only source of cpuinfo.max_freq then and it needs
>> +	 * to go down again when boost is disabled.
>>   	 */
>> -	if (policy->cpuinfo.max_freq < max_freq)
>> +	if (has_boost || policy->cpuinfo.max_freq < max_freq)
>>   		policy->cpuinfo.max_freq = max_freq;
>>
>> -	if (min_freq == ~0)
>> -		return -EINVAL;
>> -	else
>> -		return 0;
>> +	return 0;
>>   }
>>
>>   int cpufreq_frequency_table_verify(struct cpufreq_policy_data *policy)
>>
>>
>>>    	/* in 10^(-9) s = nanoseconds */
>>>    	unsigned int		transition_latency;
>>> @@ -791,6 +792,8 @@ struct cpufreq_frequency_table {
>>>    int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy);
>>> +bool policy_has_boost_freq(struct cpufreq_policy *policy);
>>> +
>>>    int cpufreq_frequency_table_verify(struct cpufreq_policy_data *policy);
>>>    int cpufreq_generic_frequency_table_verify(struct cpufreq_policy_data *policy);
> 
> I wanted more discussion on this part regarding finer implementation details
> and hence went with a working version, and I think I asked in the last revision
> thread regarding what are people's thoughts on this added field. I am also not
> keen on adding more fields, so this is useful suggestion. If we are to continue
> this implementation route, I'll keep this in mind, thanks.
> 
>> Thx and BRs,
>> Zhongqiu Han
> 
> Best,
> Ananthu


-- 
Thx and BRs,
Zhongqiu Han
