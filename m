Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A84129B781
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 09:59:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788429563; cv=none; b=BQMIg4HvJSn/dcMCIf3OGyG/9CIU8hfYVYXyl9NCIiz2N+LACJbC4hztxiWesZqFertR/58EtKRaGUciKZmtDUg38GetNLCOW3rB2zFw4S9Nrclj2YJp6lXUGRR594nHq7mvelJ+Qc/xptJVbX5glcm8M+Mm3tBmiriqZopOn2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788429563; c=relaxed/simple;
	bh=pbjog5xmN8riuJFlQ0dfBcbLDgqQgdkXFJF8MxDSFT0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RgLipX2P9MQZOAtu6nA/twD/cFvbcShXNp2pM7EKqMHtx8NOpP3gCJ/Z4X6u/O0RLL08WnhZ5fYVbhXgmbYeNHawZKdTIVPEbzpPH/3v50ePLdko9yVRaY4Rv34zFdTpM4OPtNKektmhGROka91gulX+ipOjLfMyMQfVS9BsgpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bpZHOrO5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XnT5PAi3; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bpZHOrO5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XnT5PAi3"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 683927Ss155517
	for <driver-core@lists.linux.dev>; Thu, 3 Sep 2026 09:59:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f04oX5MQbZvupFil8uMvBtUok17PIJf7LfVOd1JT1YE=; b=bpZHOrO57j5b26D5
	5nHsmTjqlcXb1X/XkBai9ChgC3bYSeNwxF/DnKApRCbxs9dtRYQjcZP9ZuS1zFYE
	69Os+cj5i3WzZHXopLUrNX74qiEF3Iko326JEYW94qP1mN2C/q4VJwGg4Twba882
	anlASfllzLzkyn0TkyRntfWskEjQn0xvAZ3tkmAMUw4UVWZmWuVo/2YrC19S4RQ0
	hRBhUcncg+tleTqHVGytYAdvwMrCOWT92yNK+Ja3vG+lOVrXUJIxEBp3Udl8beID
	HBRs8u+lAPAIYBnlher1DsS+MyF3p5Z1b0lbjgfW2i1xKv9IitG18fwfTRs29wjk
	DExvOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekgn41-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 09:59:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38f283baf1fso3061405a91.3
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 02:59:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788429558; x=1789034358; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f04oX5MQbZvupFil8uMvBtUok17PIJf7LfVOd1JT1YE=;
        b=XnT5PAi3C+XLvwZT2f0p81YQvEhG2LpHYDcbjUAqJ+BJvnXpmT7HMxlIVlzavKwxpy
         9nHhND+wu5X9lO2jQhq/XyyaHefJSLTcFFbKpV5oBzas7uqnYnHwrBmT0lP4mSDsFt9P
         2z4C+i+7uljR/vk5fB2+AYONMLpC4I9nhrqZWjCzkjsItCVbcqLXwJCvmgGjB2Ynga+A
         45xcFGHDe3bPCXHcc4gvx7DpmsauwPmtxzGkn5t0slTHZY6v7Dn0OM27IbOkVZjs/xu2
         +g6jbPweYLlQa7myJfvmCLJRjnZzZpA9lg5yH3PNpHluWjruUH6x3rx0x2gwAUEp6PlJ
         zb0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429558; x=1789034358;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=f04oX5MQbZvupFil8uMvBtUok17PIJf7LfVOd1JT1YE=;
        b=IfIxuL38oXSPjPXlS+RDXUakjTdEsxYFHlYjdLkdTOjtHV9j7ySujXW0fak5sd4fxU
         usYSwJHl7lBtXNYRhRx0ohdJiWy+CzSFQxtWeejG1Bg7zqGCVitbE31JBv7/oqcdcg5U
         EOh8fa7hhm0rH4/8KV2xHWI+g2IiJJlZbP9+8p44WxCHh0CkPmZ8lGgJZUxUiSf4UgiN
         lwNBc4KBfQ5Qz2/AyMdR4sKz9BJANJtE5LRaTXIz5uLdFOjaQhodCdo8By5sfKIptj4J
         jZwMv+30iuAu6Pe3i8fQ/EhhpncOR89CJTXglGCtyR5Ho+Xa8i2PYczhp3+PYrQtiFP9
         HuJg==
X-Forwarded-Encrypted: i=1; AKwUvByNwwEGb40TkUObcPnxFyfwshtEGLUEMIHxF5xFEk0EyEYU73BcZTf9wRB7VMouZz17hsQ5iXEYYr6gzw==@lists.linux.dev
X-Gm-Message-State: AFuF++mWxBxApd7h2VrJHzqyFcHhM9jp2g5fWEEsh5OsOpQQA2gfy/OC
	sGr7Ze3pGK7QDziaDjy579I/xJGJD7CkD7mFZT5ISHWUgiCiU20Ya5U3w3lrHKFkXcUc+8U2El9
	gHGr1Iq1BIpNMnltMs7J24WdYT7SF78J/bwD7kcMxU1Kce2+p2mpQZ2ISsQ1ptBsYWw==
X-Gm-Gg: AYBFou1bUiplW/eodCl4mL/iGLGi/Hdl1Bw2EIZjg5KQL67DH489jBcx9+nvNuqjRNk
	Y3r1xgBekr6OOR9QaPvusPqsuMB6oB/LSWXqdIUrENCesX2DGM4IKRzLANTgbNDforMK9AJj95g
	n4AX907cBOF8CyCberYTiS59VBY//j3TybwC4+Q4OamodLovlHK7VwzLgzuKnf18TqvntdZcjP8
	NCXCwZQGCtwcAH2UxcDx6eGfhTGZk0oBLo++MWB6tLi/lY7uTGgTvHruYJxYpjM7M6lkPF+YHw+
	9HIA0b+cwbuIeprBcNr80/zrf5lDmDEdXbJPgVwEd1Y2mj8KkF5TglQ9cjGlynJUmwccZxbeJFB
	A7S8nb3Hy+BAcmIYnJA==
X-Received: by 2002:a05:6a21:111:b0:3cc:92d9:80cb with SMTP id adf61e73a8af0-3d9adec692bmr18368205637.12.1788429558358;
        Thu, 03 Sep 2026 02:59:18 -0700 (PDT)
X-Received: by 2002:a05:6a21:111:b0:3cc:92d9:80cb with SMTP id adf61e73a8af0-3d9adec692bmr18368156637.12.1788429557887;
        Thu, 03 Sep 2026 02:59:17 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc43d47e5fbsm703336a12.31.2026.09.03.02.59.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 02:59:17 -0700 (PDT)
Message-ID: <0e2d4957-cef2-4553-9035-70b9f1796e4c@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 17:59:09 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/15] arm_mpam: Fix get_cpumask_from_cache() to clear
 mask on error
To: Andre Przywara <andre.przywara@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-12-ea6397bead59@oss.qualcomm.com>
 <2ffd1231-2f59-446b-94c6-000fb987980d@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <2ffd1231-2f59-446b-94c6-000fb987980d@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: ywf1sFc2TCizpLOe-0UMclprjOTygPY-
X-Proofpoint-GUID: ywf1sFc2TCizpLOe-0UMclprjOTygPY-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA4NiBTYWx0ZWRfX07IFuPA4B4By
 sYBj7aHdaQXxqxAiwag8+v5kreO+rZhtIqe6HiJ31cfx740r4VfslgKZGB9+lK2OG7UUGNflubx
 Kj9c/ySTPT1KrsTgBmaXAzvWdkMpDjyJslu1Jf3ro9DoeTLBlprAfAxfp97D9zRT6P5LKfgDPJ+
 q0/sSXD7F0yuB4tEBsVKdcpeT6FGUekepYjURjkbw+LOpnGgC15ZXkCBbPhOxITe78hrQn7q5Rf
 MfTbN7kp3CJPSEETDYEVlzeFLrVahA4tdKALB1RXY8asCHkELgjjXggq1SculMdr67Tp4tpgYAq
 kE8YOxw/Ba/eaQNcaapGC6W/eEpuN5K+fdfeBliaMVFYIS9CvRz9ykqwCjbPsnXu1Fa3Aa800Mn
 8ogAh+FnM6+Zzbla2tkgq2fKkuzG3ib7W81Bw0/371pdbwQ+E7LzkYIZPzwUR6tGdMr+b1cblMY
 JzL70h/mkwIsJjzFa9A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA4NiBTYWx0ZWRfX/C5hVocdJdMD
 /47IPfVzjwpoF5aly5sWAQm8vyh69Qxlc9ByuwrT3uzKah138kRFzxSZBWN6NXpDQJsCGF1wobU
 ZvkF37Z2qJ2Gjt6w0FEHbmH3V82sYu0=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9944f7 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=oN0nXjMPxspDpnDYFegA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030086



On 9/3/2026 12:03 AM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> If mpam_get_cpumask_from_cache_id() fails, the affinity mask may have
>> been partially filled before the error occurred. The caller has no way
>> to distinguish a partial mask from a valid one, so it may misuse the
>> incomplete result.
> 
> But it returns an error, in which case any caller should ignore what's 
> in the affinity pointer?
> I am not sure that clearing the mask in necessarily the right solution.
> Either we leave it untouched (which might be tricky), or we check that 
> the callers restore or discard the affinity mask when the function 
> returns an error.
> 
> Did this trigger any real problem, or was it some bored^Woverzealous AI 
> review tool pointing that out?
> 

Hi Andre,

Thanks for the review, and for the honest question.

This came out of internal review with AI-assisted checking — it didn't
trigger a real problem, just the observation that the mask could be left
partially filled on the error path.

You're right that a caller should ignore the affinity contents when the
function returns an error, so clearing the mask isn't strictly 
necessary. I'll drop it.


> Cheers,
> Andre
> 
>> Clear the affinity mask before returning the error so the caller always
>> receives either a fully valid mask or an empty one.
>>
>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>> ---
>>   drivers/resctrl/mpam_devices.c | 7 ++++++-
>>   1 file changed, 6 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index eac3bc695fd1..d8856864e89a 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -243,7 +243,12 @@ static int get_cpumask_from_cache(struct 
>> device_node *cache,
>>           return -ENOENT;
>>       }
>> -    return mpam_get_cpumask_from_cache_id(cache_id, cache_level, 
>> affinity);
>> +    err = mpam_get_cpumask_from_cache_id(cache_id, cache_level, 
>> affinity);
>> +    if (err)
>> +        /* Don't leave a partially-filled mask for the caller to 
>> misuse */
>> +        cpumask_clear(affinity);
>> +
>> +    return err;
>>   }
>>   static int mpam_dt_count_msc(void)
>>
> 

-- 
Thx and BRs,
Yin

