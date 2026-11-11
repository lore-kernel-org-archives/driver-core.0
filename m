Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399719;
	b=yHpZBT7hcL1iNT75jvD6Tlv8svvXIBlaQ9uNiRdkeCWDol2ZbxyTIsVwt2YFRmBNFhN5
	 Lms+XV1tS3A2jD97vDqQz3bpNGBo6gNqUouCYek3A8ZZ0FUtEyum9TGxdNx42Pqm+Iqc6
	 n6JmUEjlFN+szWmmq/HzkIIowkeFHMROIH2Sx6xodaZ27rTnn7qXbCV+vhYbr9B9TUTul
	 uEdlJvsekae+yuSV2wC0iMKx0QV6xhOnlxqjEldmw3+A+vgauwYQiItS6Oj0lWF9Z0xw4
	 0kmmjV7qS77t5jI6CBmsSnPQNaEGcqOYNOsAzdFmMDyLL5eh2cQU7muQulv0lh99uvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=rEnsFZzlpyzFwAmK5owjX1ORB7VURNjWd4s4pQhdDGM=;
	b=M8lJi11UXu4kdG6nX5Qiu6ys+TSCSFvHUdZjhFK5w4o0v6msro+3bnn0MnMbQqUeKMhK
	 ifI+ee0FXgVDfVibPGycvmYm/4BS+BlJDRC69wzYIT5rO3+8c/e7jWfLe9qPOAFKrnfMN
	 uilxEun8P1z0ZAL6OKFbdc0Jgx9xD/XRoKL6aFtevW6pRmBhfYLiQa+DOILcQVBbJBZkP
	 1ntNPXNyCiGuuhcY0vEO+qQXZ8aB+OLE4D1k+YNTYUuMv20b95Mew/KmEuCpIttir7dWV
	 mmWIPIuGu5I5VuET81qg45Vh02jwyp1EJMlTj5nG96kAf9EySIa897fLtEIRY+1i+Mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyUigaQu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZDf2eAm;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C05606A326
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:21:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85C05606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZyUigaQu;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=HZDf2eAm
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAXOHg2017809
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:21:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=rEnsFZzlpyzFwAmK5owjX1OR
	B7VURNjWd4s4pQhdDGM=; b=ZyUigaQuy41E2c5G19su31Xc/jqb/gKyPXDjcewM
	QwreyS6yEc363VV99LD2H6rJCX8FpJiGd2P4CpYa8q8f0OKgeYtn+nhP7BgtuWZi
	go1ccZmztAwnrFOAY3kg/d+fbLt/ZNSntbPhWuW87S3P2yISkswGgkRBMfFgcpOf
	VxVRbhpAZasJQeAL016IKvrI7SgfodIE8UiApbrxtPn6lqJAiZXcY2Vur4Yj6m0r
	wPKa+0J/Yxj8SIi55sMdehrXNaDn/q0x6JN/m2AaR2TnvGUX4Cz2c9rb0tGBrHp2
	fpGItqBGcD+AwRAhZoYkWdffk/lGeh34/tOPkEHOSMqTow==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hv97cbqmn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:21:57 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso2349434a91.1
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 04:21:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794399716; x=1795004516; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rEnsFZzlpyzFwAmK5owjX1ORB7VURNjWd4s4pQhdDGM=;
        b=HZDf2eAmV4LlUyUCPYZmim19FJaDVwHU8w8UvCV14RmnmKOAVa1TeUE+IH8LOF0Wt6
         jSiTHASHBRPkr+/xnpf4L5FLoa0yFVMHI52FipMkrtwkU0Z40yBJH8pZNymY0YkQInJH
         xF0+3hacK4wd4FHPbZ0NB/1Kli0EGRmhJIOdkIOL0CCQPWEmdXBklD8w+gcCiu+qCScK
         bvTdEsTSQ2baFNAtn7Mu/lE9spPg07u2wt8DClRGtUm4Y0FH4JpdKKrAnbETJiNhv/Fl
         BGKN7njv2Uxr0D5wASlNjDiPv0UygrnChbtwDk3x1BiB7Ufzb8uTDe6eJ4XFT3q968lj
         Ml9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399716; x=1795004516;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rEnsFZzlpyzFwAmK5owjX1ORB7VURNjWd4s4pQhdDGM=;
        b=2XuDfKNdXww1mJHF1wiW0eBt/TzLfHFvScBu7uz5UgYYrgoUZ3v7q1jUxwykbikX+2
         /uPaDv0tVSDLonwuxmuk6yl5VBMhayWtihwsKstYeXiyVtrNEoCobO2EH0E8hXKKS2By
         eaMVAxTJTQkSBqMvtsxKhWbQgPrZuIUk2WqOdGEsWKb1JNJeCGQ1+5DzidX45tfjZONf
         B/jAbmkgNnb9375QIQhcAwqV5ds9tbMKJRS1Ikm3+MyseRjHd2RMy2Klwu4hOtGUgstz
         H6k9XJUFfDLTI6W+/30a5BnumkxelOvEUOZb6F7PWKsExmo8/Ey9NNbyYaNcIMZBOjiw
         JIAA==
X-Forwarded-Encrypted: i=1; AL+hErFulP80Kr0dqoUZ44eh2lQXsdQppbRNlU2IzyTxfhw+MAhaAZBKQeTNSMbEMBseBMVFxBNSEIhCZ38BQQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/Rbqik90kWLydfimYf3ZgA+WcmxeE8/wGejazCXPxjHsappcG/
	NdkwdFECXTJ2tVUy53yAUj5V8qrj6gTYkrOJ+1/ZObt92XICZ+4xKOFMsSenAfr0sik0F1Z9lXp
	yk1/qgei6XHtLsjjBxfSJ0czKDUsVxPfafrO78YYOEIMVuM2pyJ4wrrCcmmD7l8HDiA==
X-Gm-Gg: AYBFou1BYU8hR1FS0aqPF17v4OytKprgcaTQqZRODGW74wnH8Rzs1B4mfr+Ob3/tt5z
	f3VWsKlIiYQeKaYQyDU8HoV+ZGg5gU0X+jOfsmgxwedJ08hzIbNQZhcYTUbHUYXZpZhR2wSgIx3
	3bpOHZKG0kwUC1TESink4QmP9vJzm8GsR3zeSzQVne93OkN6u8THvJ+I/xGRFd3PD3NnP3mGQTZ
	4q1YAQ1OozsLPUCfw4XNlmc8I5w+f0kBG3Dk5oATlcT1nVm5BlHof3SUhvETPP3OwR9lZ8Vqvym
	J7fkDJoiSwl+y1s7E6js1vvky+kwnNbwgXefiN50D+OOIHzGJVSvEW4YCqugUUST+yVLxNayYSc
	nIJh/LuqI3/pD6wBPviEEQbuM2p8gEb7AIPQRAPtzhIsvIX6VM0jbpXHve8DZj5BBEIgnWSTXT/
	S2oLvNx3cOm/ldLcQdalfs+5JL+E4n53D7XiyEtuQWmL1iXVeOvEB1J3BOvg61Abc=
X-Received: by 2002:a17:90b:5345:b0:3b0:e388:d9c9 with SMTP id 98e67ed59e1d1-3b182edecf2mr1500141a91.12.1794399716181;
        Wed, 11 Nov 2026 04:21:56 -0800 (PST)
X-Received: by 2002:a17:90b:5345:b0:3b0:e388:d9c9 with SMTP id 98e67ed59e1d1-3b182edecf2mr1500126a91.12.1794399715646;
        Wed, 11 Nov 2026 04:21:55 -0800 (PST)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17e0d550dsm4315816a91.8.2026.11.11.04.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:21:55 -0800 (PST)
Date: Wed, 11 Nov 2026 17:51:49 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
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
        Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to
 non-boost freq on boost disable
Message-ID: <avRd3YVDXs26hrow@hu-anancv-blr.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <41f328b2-0825-4023-b86c-48136ba6ecd2@oss.qualcomm.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <41f328b2-0825-4023-b86c-48136ba6ecd2@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX3gt3Nw09TwRT
 gBCBnVEuKR6dZtWmGbPzrIK3AR+0JTH5z2T/p7frbl+lGzi7OI2UxewrVCj1uIoQxvead1EZAmh
 erSgseTuZm4o7hUB4mjBueDtooZgcB8HSfNnOpZwMO3fmhN4PN15AZ5dqsYeCDLiShx5a9GQf7t
 Qo0N5eIS/uIZgqdCr4TgSEKTRW0pOMzDsRmIKWljoe6ufWcH8zNkXJfbHUNLb0zRNiuWS61A+Eq
 ERbWFmJl4mDj/LhGnn6yyB1h9yoQ1YS+AvBgkslWsix2EsK9KhJxIvwIC06lOAi0MaxT8ferI45
 p3vbixED6RGelR/LNGQD7ICEddoTM4rDEJo11t0x0bMkXuOTuDVQ2eNJv8ZzRpa0HshAw0x2ngA
 YIfuZT3+DQbKk3Q6bAvL4A/NRowu6QZTYVKmrQpD1MiiEJq3gTJqjzaYUgu5lfteE0zZndGtMer
 iT6pg83WX6srilCkdKA==
X-Authority-Analysis: v=2.4 cv=cJl1IVeN c=1 sm=1 tr=0 ts=6af45de5 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=CKxPtk3aFwTzAyx1bQcA:9 a=CjuIK1q_8ugA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-GUID: 54eVtVy9qp-50u0IGH1DRK7Y83YnGSWo
X-Proofpoint-ORIG-GUID: 54eVtVy9qp-50u0IGH1DRK7Y83YnGSWo
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX1fJjkw9YpT1j
 sU89loG2T0vxOZfnBpmjEy2TDhkkL7JMo/v6BOgjQrzJ93XAw69CRpNn+SZaWw6WT4VNjj6Nv9s
 76Bh1eFTypBKY08wMP3TtZ3MPJbYP9M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 malwarescore=0 phishscore=0 suspectscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110049

Hi Zhongqiu,

On Sun, Oct 11, 2026 at 10:17:14PM +0800, Zhongqiu Han wrote:
> Patch 2/2 currently depends on a helper introduced by patch 1/2, which
> prevents it from being backported independently. Since 2/2 is an
> independent fix that should be backported to stable on its own, I think
> it should be placed before patch 1/2 in the series and kept self
> contained.

The idea was that currently patch 2/2 would serve no actual value without the
fix in patch 1/2, and that is why it was the second one. But yes, we cannot
fix 1/2 and leave 2/2 as is, which would turn the current benign issue to an
actual problem, so the order should be probably reversed. I'll work on that.

> To avoid introducing a new member that is only used by frequency-table
> drivers, please consider the following implementation instead:
> 
> If there are boost entries in the frequency table, the table is the only
> source of cpuinfo.max_freq, so let cpufreq_frequency_table_cpuinfo() set
> it unconditionally in that case.
> 
> 
> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
> index ea99464..8c8bad2 100644
> --- a/drivers/cpufreq/freq_table.c
> +++ b/drivers/cpufreq/freq_table.c
> @@ -33,14 +33,17 @@ int cpufreq_frequency_table_cpuinfo(struct
> cpufreq_policy *policy)
>  	struct cpufreq_frequency_table *pos, *table = policy->freq_table;
>  	unsigned int min_freq = ~0;
>  	unsigned int max_freq = 0;
> +	bool has_boost = false;
>  	unsigned int freq, i;
> 
>  	cpufreq_for_each_valid_entry_idx(pos, table, i) {
>  		freq = pos->frequency;
> 
> -		if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
> -		    && (pos->flags & CPUFREQ_BOOST_FREQ))
> -			continue;
> +		if (pos->flags & CPUFREQ_BOOST_FREQ) {
> +			has_boost = true;
> +			if (!cpufreq_boost_enabled() || !policy->boost_enabled)
> +				continue;
> +		}
> 
>  		pr_debug("table entry %u: %u kHz\n", i, freq);
>  		if (freq < min_freq)
> @@ -50,17 +53,20 @@ int cpufreq_frequency_table_cpuinfo(struct
> cpufreq_policy *policy)
>  	}
> 
>  	policy->cpuinfo.min_freq = min_freq;
> +
> +	if (min_freq == ~0)
> +		return -EINVAL;
> +
>  	/*
>  	 * If the driver has set its own cpuinfo.max_freq above max_freq, leave
> -	 * it as is.
> +	 * it as is.  This does not apply to tables with boost entries, because
> +	 * the table is the only source of cpuinfo.max_freq then and it needs
> +	 * to go down again when boost is disabled.
>  	 */
> -	if (policy->cpuinfo.max_freq < max_freq)
> +	if (has_boost || policy->cpuinfo.max_freq < max_freq)
>  		policy->cpuinfo.max_freq = max_freq;
> 
> -	if (min_freq == ~0)
> -		return -EINVAL;
> -	else
> -		return 0;
> +	return 0;
>  }
> 
>  int cpufreq_frequency_table_verify(struct cpufreq_policy_data *policy)
> 
> 
> >   	/* in 10^(-9) s = nanoseconds */
> >   	unsigned int		transition_latency;
> > @@ -791,6 +792,8 @@ struct cpufreq_frequency_table {
> >   int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy);
> > +bool policy_has_boost_freq(struct cpufreq_policy *policy);
> > +
> >   int cpufreq_frequency_table_verify(struct cpufreq_policy_data *policy);
> >   int cpufreq_generic_frequency_table_verify(struct cpufreq_policy_data *policy);

I wanted more discussion on this part regarding finer implementation details
and hence went with a working version, and I think I asked in the last revision
thread regarding what are people's thoughts on this added field. I am also not
keen on adding more fields, so this is useful suggestion. If we are to continue
this implementation route, I'll keep this in mind, thanks.

> Thx and BRs,
> Zhongqiu Han

Best,
Ananthu
