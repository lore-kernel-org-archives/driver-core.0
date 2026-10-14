Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 581FB560ABE
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:42:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791996166; cv=none; b=AmPT4EP9k8fzPuGb/jQai+0YGUON+K8/F4UbvEEKShP/d6+pir14Kpxf3Fu99zPB7e5Li6WfZxU0UybVYDFjElJU/8SkF3WlCOJq4nEnsFfFstLMI6YX19Q6Bx4kMPzbEDIlvEog4kSiKdSnTnI4qVtvm+b0NxRxk0vf+GW7ELU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791996166; c=relaxed/simple;
	bh=+5ByLKIjfqCvrkCU7NEJqSiloCHsqlgCQOrg6SvYrXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MmYK5RVXZyYi2HFg94wug3U70lErHR4NgZVFHaHmtzT+mWZL8u1TZJtXgErppnic4UeXHwSVEseilsARHsDTtlT0/mAvCiQkYvOs7+c1gNQuQfDTKHo1Sx07Kncx6kBTJqzhUPeSW9xC78Fp3tHW/ojY5hMFzwXqFhbQBKrAlds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ymax4bHa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dWffLCAk; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ymax4bHa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dWffLCAk"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EEbJon3642838
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:42:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iPmSsmPY7WrUMIeP1/fFElJBiwRXXXsL/bHEaVdSks0=; b=Ymax4bHa2o9Fs8Xf
	oMzFjI+CfReWH8It+9q8IN6PxA6f5+p0ncSJ4+4NMHJDIt/uxsJV9pNkr8m+jOxq
	kF/DppZiKZoHtI0Fi30rbnwUgBBQ3wEaj1NItVHcVoD1V9kJk3Gclv1VKZG3DKFr
	8yxS5GfvB8AXfa4IkrSbg9bC4SG9Fxo23kYZk8MXEkIJKa3o+hPWTI15v/Bh5Auk
	PbtzUApcWGg74HxQ+IS3YM/8gpAj9OPlbnaVhj8RdScE6okKFXifLoCmthjEbKzd
	8npKdrjMF3ed0tuGBLHPO1dHRRNQMNl0mQL9edtvK5l3HRbqeqCfUFRa29MyvOdO
	X8h0Gw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ha470aj0u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 16:42:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92eebb130dcso77988985a.1
        for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791996162; x=1792600962; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iPmSsmPY7WrUMIeP1/fFElJBiwRXXXsL/bHEaVdSks0=;
        b=dWffLCAklGVJ+kaKfV8FgCwQx9FkiCOWaDrQoNNg3HwNPP5PrjFcDaLKIEJ7L2IcGI
         mb/2hkQ47nPt8SeDJ6obVSe9bEP81ZRqm//3vj286u2AqR5ndYe0sp7RwfThyi6dxVrP
         +Kign+8JriIT+8/ycEEE5Wo6sZgR0DPKTdpsrsQMqCk7tQ4JWBCluL5Hk0OLbFJATjfQ
         wyVhMo6Nr8+60eqT5bVIZjD4WRRCJ/1ErJ+lY9LrKXb8Qx0J1K9hB8u5gAlprG7zX54d
         FPkE6ezisSKDvBISIyD6P+foP3ipCxchbd3IdcqD918iGVFVVVQfjYz95ibuw7mIcbyL
         ipIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791996162; x=1792600962;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iPmSsmPY7WrUMIeP1/fFElJBiwRXXXsL/bHEaVdSks0=;
        b=rEjMN5eiNPpM24eolGUIqX1YP1vx4VSWkVYeceZ6B8AmpmL1Wtk35jdjag8+of7c6b
         yaLUxwgj/CXNsznKIJYtlXcOtoWAGjYhCAhoITRBeLY1l6j28Ht0rtx2fJtXf/bI4A2c
         VX8Qyaxv5/VmqmFU0iUMDOryEYiSSGUqt6SmSgu+UJnolzCwug8KZN+QFvleLS/5ix1H
         WNTscqHAbkFj8cOk7blAEti71gTSDlaNMwROjeMadU06JzKFE43dlT0REQDJ9xdTMogC
         eMTb9DQX+7gu3ZF6N6CwTACUFKES/b2VDDtkf1zVXqIb/LxJrFuVCNqinr9f811goDvN
         A5mw==
X-Forwarded-Encrypted: i=1; AKwUvBx+MdF+L+UfMNpP+6Lh+UjeR21ZMDaCLpYaCZEkeHVJ9s11v27DorRZsEK8TJxL3HkMUAoyfR8E2Qqt2g==@lists.linux.dev
X-Gm-Message-State: AFq9FYILxBX/8W5zlqUCmA2nDzE0AUIM02siT/7fWvzCg5RySRu6ZC0o
	y8Ie1V/xJYJkhL6k+jz4H/H4pdkULYRjlgn2DRLKfc35Hwb8CxoO/BBwAB2X/uletAk+6zd67Gk
	PvFt3JxDUJcV962ynfPjBjQGLuxtwTsD0oRFLkDQgN+4RvIAFDPxC8QsQC3kwB/WLDw==
X-Gm-Gg: AYBFou1NI+DtOUwfDQPrfwx2DTHlqwvICeJEmr0t8EPflDa9xu4BqiN3BX95HdIAdCf
	Yd3Acaj5qgMRZROKIV0btcvm7ayNX2zTj+Bvtp+Q5zqx3s4jxH0Rvv03HK9dqmqEN54l33u4icI
	kWJruL6amwY/bZFbzzHdvd3vtbrtj2k2T17FnOY4UPguHrOxdxNYFvFfFFUkZ4JV6KG2rjbzfXF
	PhVQji/M6Mpyv18uD+os4oYZBGjZQcoTvlshVxFNUDE2dFmVlceQU0+BZy9HVrYpEq5EcYcgTec
	AqKsxX+gbijfJehd6WJGNnoKUgXL21k1LAvmKIG/rupzQutwbqsAMj1ebydKw5cuKh4AgAhklZ1
	SrBsYoiROl2MJRofOxJ7YHA==
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr3053028485a.1.1791996162216;
        Wed, 14 Oct 2026 09:42:42 -0700 (PDT)
X-Received: by 2002:a05:620a:269a:b0:93a:14c:329c with SMTP id af79cd13be357-93ebd0c2693mr3053021385a.1.1791996161600;
        Wed, 14 Oct 2026 09:42:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3ed963cf98sm4760366b.13.2026.10.14.09.42.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 09:42:40 -0700 (PDT)
Message-ID: <85f24f78-9b30-4394-9899-65e19eef1b16@oss.qualcomm.com>
Date: Wed, 14 Oct 2026 18:42:37 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM RFC 14/16] clk: qcom: Enable clk-dvfs on SM8650
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-14-3041b788e9f7@oss.qualcomm.com>
 <rfcbfy5z45w43ju2qjslrcnxfbhqbcx5fr5bii2icewm5ggihu@lsooj5mc7mpk>
 <bc6a824c-f242-4047-9198-dda53f789704@oss.qualcomm.com>
 <v2ody6fmdt32tv3ldgjews5nvzkwuiyyph5io5jv5nt5wn7qm7@svgijnjzf6y5>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <v2ody6fmdt32tv3ldgjews5nvzkwuiyyph5io5jv5nt5wn7qm7@svgijnjzf6y5>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfXy5lR8jh7hjS0
 7g5xsHLiTcATk1sZE7gZQO+MwFGZi5PpeuOL13bs40HLhEFvdWA07tVMonTtFE6PLGahKIEAbjN
 KbdAhvZwSmiSFrR3aWinqPrSYD4P0RxCZzJKE9ev53UiwuJUzsDGuS8P+mh/Q97ZvimHiK/dVZD
 9sR2ymVCLcKaky4lV7j64uSkTQQaDUJovOSOobfWuC3BMFPwXzNNMrdtjwluuMASH99so+L7R1i
 eNbHBbBAUMPeNWJg2Dq6eDzBj3bmUW/QxNtQjEB7/qltaHdUaoFsbWRUVNyMjU+gQN5SXZ+3nFm
 S9EH9eyVCIMlVEVPAUovjAoEifn2YUOJNVVQHX0zNuLW4Zhy/3hQas43R66jZZJMbUCvNaVJYPB
 t7aJ1AIp+pAiIw8o9OEFupL0FZ8Lrhjcp7V8ZMNvjhbIvtoblQb0boe/oV0awT4pE5dfWOcMf0V
 Fa85tHEhii1Jdxswkfw==
X-Proofpoint-GUID: 60rs-DRynQv6N6aS4YTUwZuTzU82RXbg
X-Authority-Analysis: v=2.4 cv=P6avFSAu c=1 sm=1 tr=0 ts=6acfb103 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=lNqPBwARffoA8ln7mLoA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: 60rs-DRynQv6N6aS4YTUwZuTzU82RXbg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA2NiBTYWx0ZWRfX8Kv8njcBgBd2
 9j015Q9mLPhvfFdmFXtDd0B6KtamAMmTfGasT8qKWHtp0Hn7CL27BR4qPlzNfxoYs2Yf5a0aXiC
 /RVn/+dQ8J67VJqeyemJ9w2HJGByLz8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140066

On 10/14/26 6:35 PM, Dmitry Baryshkov wrote:
> On Wed, Oct 14, 2026 at 05:22:40PM +0200, Konrad Dybcio wrote:
>> On 10/14/26 4:40 PM, Dmitry Baryshkov wrote:
>>> On Wed, Oct 14, 2026 at 02:19:14PM +0200, Konrad Dybcio wrote:
>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>
>>>> Make use of the clock-dvfs infrastructure and fill in the power
>>>> requirements for SM8650's clocks to ensure the hardware can operate in
>>>> accordance with the specification.
>>
>> [...]
>>
>>>>  #include <dt-bindings/clock/qcom,sm8650-camcc.h>
>>>> +#include <dt-bindings/power/qcom,rpmhpd.h>
>>>
>>> I've commented to the cover letter. For me it feels like the layering
>>> violation.
>>
>> I understand. I still think it's okay given this is a driver only
>> for a specific SoC.
> 
> Then soon we will get MMRM submitted upstream, which (currently)
> randomly imports a set of the clock ids and asks consumers to talk to it
> using the same clock IDS from DT bindings. Doesn't sounds like a good
> idea.

MMRM is more or less clk-powercap. The data it grabs via DT (power
numbers) could as well be put into the clock driver here, in a
similar fashion.

>> [...]
>>
>>>> +static const struct qcom_clk_dvfs_data cam_cc_camnoc_axi_rt_clk_src_dvfs = {
>>>> +	.pd_indices = (const unsigned int[]) { DT_PMDOMAIN_MMCX, DT_PMDOMAIN_MXC },
>>>> +	.num_pd_indices = 2,
>>>> +	.rates = (const struct qcom_clk_dvfs_rate[]) {
>>>> +		{ 300000000, RPMH_REGULATOR_LEVEL_LOW_SVS },
>>>> +		{ 400000000, RPMH_REGULATOR_LEVEL_SVS },
>>>
>>> And does it actually have the same vote on both MMCX and MXC? I'd need
>>> to check the clock tree.
>>
>> In this case the RCG needs VDD_MM and its direct child branch
>> needs MXC for the flipflops.
> 
> My question was "on the same level? Or on different levels? In the OPP
> tables we (should) have 1:1 between scaling PDs and PD votes. 

On the same level.

Konrad
