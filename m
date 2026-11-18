Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795004959;
	b=QVvNH9xPkSebMOPBiHNHOD+PX0+hRVpuGDAQciztNAEM4RaBHDIJhjcwIJfVJrY7bRLj
	 W//PWRYflqweYn93C2YufrivCkVrIBzF+oKGclOPGkkX5wJ59NClM0dRmpF21bmns+R5g
	 Q/EExlvd/KALCErIi+lFqYBOGrq6yiPhiSrzJKafdQqElXYEnbnDb49vUpvwaAOSKa1HG
	 /ky3f139IBxjXuT7oCmVtHBTZM2Hg+OU/QyXi0OiZepE8FsJtQJ2vFKOpYWi7ZG8mwwnK
	 6aO7cef2aZnYVnJyNt74yQuMftFiwiBNTap7SzJTq9X/MXgABd/L4tNjHg64dbLLJdA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795004959;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r1aEh9iw/n3stMcXke9+RzCCoMnaI0siNAVC+UxOzus=;
	b=aBcANybgF16URU7j/WzXXx863wfLF4vIuNXwLn1Rf3Mjj2S6/gd8CA+w0MhKLPrSTJym
	 YcSj85oQA7lO5v9sC2EbbSjibgekNWxeXcWeq6hxQqPw7NtcghI+YrB+y1dS/gVZvFrAq
	 bFx74Ycx5ZxaJ99bzZBISNfEpu6s8beCEl9TwozL/F6rJnjHF+yUQOAa5hE2RfdQA+Gx2
	 2wjqOPX3v8LWFBbRbAPLPlAutwJczkqij6Kjg/FOwyf6QCJbrUNsdGM+BcWWDw8ja0txh
	 Lxxrvjab0I5W+JhPHnFjEB/rpbpiIq7FTi/BllFZdMVaAUBZI/HI03lg2pnZ/sTNv2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQm0MQ5V;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="htE7C/bw";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA2A5606A32A
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 12:29:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA2A5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CQm0MQ5V;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=htE7C/bw
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AICLSw91178452
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 12:29:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r1aEh9iw/n3stMcXke9+RzCC
	oMnaI0siNAVC+UxOzus=; b=CQm0MQ5VZHhrIvKijDhSQge1uHiB8pqJN7Ja80Pj
	6EPizmuw1wK89eTY9NepxLXkWTZeyO0sLnpExq3VYsiWYn7HLnbrh9Uai7SMHV0S
	cfiSARmryPqJMnuaMhiqUwt7U1bAcy/4mrY4lz2EGEfwqVGK0hhSQPu3PrCL0Qvf
	2f+ntDSrXhW/nQCoYhe2bi1oqQALiZXLQPYYRvb/Jv/+H860E1kEKbUj3YAy11wR
	XpzszwHLz9Z5Kn46VdJKNFTi2ehgHrKYQ/XaEIAeq3cw7TxsApPz+qarZo/R6c2z
	7wq5orjQpK5i09Z1d9I2ZdbuR4g2+qg788qj2INu0vp5OA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yvcjyk5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 12:29:17 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2e9501034c4so11778115ad.0
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 04:29:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795004956; x=1795609756; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r1aEh9iw/n3stMcXke9+RzCCoMnaI0siNAVC+UxOzus=;
        b=htE7C/bweSlpRjZLjsOoRLBtmHcSFQdnF4ujD5Gg6lqkoTCWqY8XmICFdFxdfqjmhz
         ZXpEcLSLxiXCN7btCQoTU3Ih6EFaLBrLdEm6N/b/+B2f0vwdSpTEMAk/aczZ8h6Pg34x
         wQNeACfzgC/fGCGn+h4jIICeFSXvSRzN7jYzgHOWoHHL0e7ZYLtrsh4bSNdVi89lQ0pK
         9LhXKu4dYrPSXG7JDTeh33PfQ3LQfrj1kezlkB516Rx/sGGQwM/F/PmRUe64nQLGSMe6
         St8TupPMcTVTVYw7GoDz3cUavPjf1waXOJ72HzBpVuNbOJurOnfyuCOChg7rVrwl5ukJ
         izRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795004956; x=1795609756;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r1aEh9iw/n3stMcXke9+RzCCoMnaI0siNAVC+UxOzus=;
        b=FVf6WJoSTJ4FTVxnbpKmp0QMC9bJ5rS6ryDOQqZ7dW1gvtlngxhQVT0kIHpg9Ppwnt
         OzlEF3IqIiWd3j92DiT48Jv0SyWjovFHs6uCtkvtLO0Y2JOHqjzVk5MVwb+/3XU+fvJf
         pW7+ggaOj6R3ijf80JA1t2wsgP698TqaF5BtZUNJQnf8KMUfimmSfX+iTN7q/uCol73e
         LkjetSx6MVibI3h810RZD7mafxPL4Xo54qg8dtVGHJptQAAJ2KkVyZgnm+SVK64Iw7Lz
         a8kxafiIMYgO1YhiMMJqT6pY9NWZ0F0O3MYwnhhj0HOJYxPqLaDjSZA4JTvnXaNeyo98
         yokQ==
X-Forwarded-Encrypted: i=1; AL+hErEBHxZY5gsWt9U/AbtBR9ymZqB6s05o2TtowBKkjiKEj+So0/K6adWRzUrr6wh/WmcbvAIFiBr9d2lGYg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/69mHqgmo51BqOEsL80QuTQ5nWdlYoEx6h8Z0rJzvDb2RpSlGb
	GtPa5WU1BrPN4v9W7D47s9r2P2DN0CYjoIG7/S+HJt1vmH6rCOqDqbiYe6qmpfs4u41PgXW0WWh
	gFf9jMaNfEigbyreG930X8cGr5g05TS96TNZVCjtO26fIHH46hrBz5z6RGWm/skq7ew==
X-Gm-Gg: AZFdTZc/nzrgPwcAxYjmCymm5Z0HlmmaaTG1ANyhRbelvz0fYvRH28MSFy8yLfcn6HY
	Zuh1fJ1KCmobYcBmOukE9TZyULEsaqV4L/5j3pOsTJazeKfqvWG742j0945RltS/KqpqsUVrxom
	Ejihiteb39fQOMBIPYj2pvY79whqISXxQ3UiDwCCtuaaFhqxrEGypq/+PWfUW1Ci4/IhgOARWyf
	+6ixAOeIXrAsNWvq0tFh2HEvfLDXviCHk8DplBOXFj9LAzd2uoSwjahfkG9HH7Y4kZWaeSuI58E
	GjDFI5L9HZ4b/5HXBqZBCy6gcxTEoxQS6nSC2v1utCxn7HGCuli57/11wcmxGkgqYhzwyxaSpmV
	dHkqQXwIqGUlO51RcGJ9kd6VKLvLBCdBuKf0YDBpdSvUcB+94rJNRSqSk66CbozZTVd8ppW3DNF
	+1T+BlZ7jBQG4Tao9IkvO9qGEeuQl2OncSY/04rx7TRPGWQSbNTVs5bwseGxXDer3r
X-Received: by 2002:a17:903:4547:b0:2ef:da24:e76d with SMTP id d9443c01a7336-2eff752e549mr23380125ad.35.1795004955889;
        Wed, 18 Nov 2026 04:29:15 -0800 (PST)
X-Received: by 2002:a17:903:4547:b0:2ef:da24:e76d with SMTP id d9443c01a7336-2eff752e549mr23379855ad.35.1795004955369;
        Wed, 18 Nov 2026 04:29:15 -0800 (PST)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff5ed0d2esm13113715ad.10.2026.11.18.04.29.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 04:29:14 -0800 (PST)
Date: Wed, 18 Nov 2026 17:59:09 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to
 non-boost freq on boost disable
Message-ID: <av2aFWw3kh11U68A@hu-anancv-blr.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
 <avRiWsxCEAuBouBZ@hu-anancv-blr.qualcomm.com>
 <avwtsmp7Mqacbbtl@vireshk-B250M-D3H>
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
In-Reply-To: <avwtsmp7Mqacbbtl@vireshk-B250M-D3H>
X-Authority-Analysis: v=2.4 cv=R5OWitRX c=1 sm=1 tr=0 ts=6afd9a1d cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=53p13Wp-lvFfL8JyHH4A:9 a=CjuIK1q_8ugA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: k03MxPly35oQkp1mBjC8cR8mXd2Fd-6e
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDA0OSBTYWx0ZWRfX1TDXytMQFI4V
 zLTRqt159bt9HDz8Tgj40xhvX7ZgaeYOY0G0osy204eJn+Oxs4OdRN8186elZcgWw4w6ktxfmEi
 yB4bg42HBnHkz0URMWwJ2QPLEP50DSE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDA0OSBTYWx0ZWRfXwpxfc2EYDBzc
 NRkhe49wQD7vz49IxRmANv1F15XSNnn7vwfQ0pDHsQy/BSkmR3S0b0uB4666CrTEhWe8zMT4rPm
 h4XKZNfNhaiKbp5ZscEifuVjmeZrYOj18QJlqQEunJADh6plVrBUig205Dne+i8gFEluA9Ngx/l
 wIR+0K4Jc2vZcyxTfcVSet5mmjt5O+lcNn3l2byUVEqVvDXrCNjpTACxW5IHoAfFj8e90MYzjtZ
 9rj5OoYYYm/M6/A3q9iAAsLD+yHgmBH48/7+HyICuGEo2k519n4QNB1m7wvwKRosppN1ViF/AUK
 W7VW3e3UBa3K8tCZpyZCF1BOjaCPKmHYL8sIFfd9aCKbdygwkNL9LdBJx6rw1M92bXJfgcetamP
 Ols5lnZLXlH9SHV3AwFrp549YUyIuA6OfF/a95zrRmAWYKpL4H9VaANx7uflhM83gtx5TBdSWLL
 5FaewT3Xz2u90JimmZA==
X-Proofpoint-ORIG-GUID: k03MxPly35oQkp1mBjC8cR8mXd2Fd-6e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180049

On Tue, Nov 17, 2026 at 04:04:26PM +0530, Viresh Kumar wrote:
> On 11-11-26, 18:10, Ananthu C V wrote: 
> > I am pretty sure we can maintain the policy->min status quo and only touch the
> > policy->max updation; which from a passing glance simply seems inconsequential.
> > Potential side effects, if any, aside, this would at least fix the issue at
> > hand, which is the frequency getting stuck on a higher value without being able
> > to come down. What do you think about this?
> 
> So a change like this also fixes the issue ?
> 
> @@ -49,15 +49,16 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>                         max_freq = freq;
>         }
> 
>         policy->cpuinfo.min_freq = min_freq;
> +       policy->max = max_freq;
>         /*
>          * If the driver has set its own cpuinfo.max_freq above max_freq, leave
>          * it as is.
>          */
>         if (policy->cpuinfo.max_freq < max_freq)
> -               policy->cpuinfo.max_freq = max_freq;
> +               policy->max = policy->cpuinfo.max_freq = max_freq;

This does fix the issue of policy->max not being able to drop down back
to non-boost values after boost disable, but I found another caveat.

The commit 8c83947c5dbb added the following change a few months ago;

 static int cpufreq_policy_init_qos(struct cpufreq_policy *policy)
 {
+       unsigned int min_freq, max_freq;
        int ret;

+       /* Use policy->min/max set by the driver as QoS requests. */
+       min_freq = max(FREQ_QOS_MIN_DEFAULT_VALUE, policy->min);
+       if (policy->max)
+               max_freq = min(FREQ_QOS_MAX_DEFAULT_VALUE, policy->max);
+       else
+               max_freq = FREQ_QOS_MAX_DEFAULT_VALUE;

this max_freq is then subsequently used to update max_freq_req constraint
for the policy. This means, assigning a value to policy max in freq table
directly will cause the same to be kept as the max_freq_req, which if
boost is not enabled will be stuck at a non-boost value. The boost will
still work, as policy max is set directly, but the value will be above
the allowed qos max;

# echo 1 > ../boost 
cpufreq: cpufreq: policy12 boost=1 policy->max=4723200 qos_max=4454400
cpufreq: cpufreq: policy6 boost=1 policy->max=4723200 qos_max=4454400

This also means if at any later point any limit refresh happens, the
value will be brought back to that qos max, which is a non-boost value,
even when boost is enabled;

(e.g. here with a refresh_frequency_limits(policy); call after the boost)

# echo 1 > ../boost 
cpufreq: cpufreq: policy12 boost=1 policy->max=4454400 qos_max=4454400
cpufreq: cpufreq: policy6 boost=1 policy->max=4454400 qos_max=4454400

tldr; is that it will fix the issue of the freq not dropping down from
boost, but it will introduce a new potential problem of boost state
potentially dropping back to non-boost freq while still in boost.

So this alone can't be a fix at the very least. At the bare minimum it
will need update to how max_freq_req is calculated/updated, etc. If
nobody assigns values to policy->max before cpufreq_policy_init_qos
is called, max_freq_req can simply use FREQ_QOS_MAX_DEFAULT_VALUE,
which is S32_MAX, as its value, and not cause this problem, so the
solution proposed in the current series will not run into this.

> Also, can you please explain the issue again in detail. I am not very
> sure how you are reaching to this issue over current mainline (without
> the first patch).

There are two issues the series is trying to address;
1. freq can go upto boost values, but they cannot be actually used
2. once a policy is using a boost value, that value cannot go back to a
   non boost value.

So with or without patch 1, which addresses the first issue, the freq
can still go to boost values, which can trigger the second issue. The
logs relevant to the second issue, reusing from the cover letter, is;

\# cd /sys/devices/system/cpu/cpufreq/
\# ls
boost  policy0  policy12  policy6
\# cat boost
0
\# cat policy6/scaling_max_freq
4454400
\# echo 1 > boost
\# cat policy6/scaling_max_freq
4723200
\# echo 0 > boost
\# cat policy6/scaling_max_freq
472320

The reason why this is happening is;

from freq_table.c:

if (policy->cpuinfo.max_freq < max_freq)
    policy->cpuinfo.max_freq = max_freq;

and from cpufreq.c:

freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);

so cpuinfo.max_freq is only updated upwards, and that value is used to update
boost_freq_req, which is a FREQ_QOS_MAX request. On boost enable and disable
the cpuinfo.max_freq value stuck at the top will be used to update the qos
max, and the value never comes down.

> -- 
> viresh

Best,
Ananthu
