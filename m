Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBF7F3AFCFA
	for <driver-core@lists.linux.dev>; Mon, 31 Aug 2026 05:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788155025; cv=none; b=XnE9ftD3wRAjxqR8EeCi2bGRrAZIx318LCHhmQA1e/bMZpmPqVDf3fBpYNv+EWGPIYHB0nQ6g3MDsgCeiusWUyudXZ3lqWYLBUKZs0Mhrlkvmc4bSxldwk5KfhgIkavUB8/VWR4NUiTZ1DgV+pSR+NkSfeuhB5Mr7kAqS/tEX2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788155025; c=relaxed/simple;
	bh=kcLadk2Z38v7gaYvHSz3XN/7Lv5Ephg49UsBJXMNr0k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Uq4h5BZVr3gQbeICkah86c3zNBpmqYoRpQq9vocQl7V5Qx3ZMkUbBmDL2xzw+Hp+0K5EHXjhyuQylcXgzLCWmMiq6f1a7Zdk3H0k5nScjJJhTJfiouY9qhEQiLCpW3+F9VaDt+nASPKFXDl0Qp5vApqyKuVpxcvhNAUd8mZT2p8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=M8cLKCZW; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DxX8BTl5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="M8cLKCZW";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DxX8BTl5"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67V52T9p2617678
	for <driver-core@lists.linux.dev>; Mon, 31 Aug 2026 05:43:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A0ZhG+vDmZ74SEYobGlTuCd8Sa+5pitgxvkRQkRMcFY=; b=M8cLKCZWmsP7SpdC
	HPYwcY9RHiK/M/b1uKeAHxU5SO0zoyaL3hNqYDaTflqMqvF/HXyfjzVeDaRtkiB3
	+4LrcZhbKglNw8M8m4OvHr7WCEptMeLj5JupOIr3deNN1ZbHBWQQlhSmxO9gOvdb
	Zhrb+e6Jix6gizjCE80UnBWilrL4rMKjI2N8Pb0/pYJqMMFi5Q0ClEorj+FQKCmQ
	yLVmZzgsEwO63SZLpYcwFiIAovYb/XQbOCpNkIDzPK0+IUwdGvSs+TF39GQsuq3t
	1OPi8XIkW5zl0jmDG2SrTj3XFgoVFP2in/EGTF5rzM26122bm8i5+gLWDFsxfWcX
	HMDN4A==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gbqn2mqm6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 31 Aug 2026 05:43:42 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-85326b426c0so4187286b3a.3
        for <driver-core@lists.linux.dev>; Sun, 30 Aug 2026 22:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788155022; x=1788759822; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A0ZhG+vDmZ74SEYobGlTuCd8Sa+5pitgxvkRQkRMcFY=;
        b=DxX8BTl5Ur0CVbptf9NrFxZTOIJHtwNSP5pC9fE+XPYmQCRDM87PVLK7YQOUAY+hV0
         JVspkjNcbGYvSbsanWkdJbTXqxD7d0sVbaBURyPNWA30/lD6IUuD3gJggU4g7rBRdLyL
         t5Gvt/2yWwVJF//4/MP1HANzjmMrKbCunxiXNL7stHrec0Vxh6sIe+dFFvPbcw2Ldk63
         eYhS4ltpbXetCz1K1LBF4t/J3fa3qRApMKNi0LCf5mYjpve8VMYRh8cK3GPaDxCK3PWU
         1sAXVjSS2JeKApOKiSpvs/rOO7kpiB4nZAEBa4WubrrGcAepdJGJ2zHgEublVk+ScYm7
         14UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788155022; x=1788759822;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A0ZhG+vDmZ74SEYobGlTuCd8Sa+5pitgxvkRQkRMcFY=;
        b=mKtg3I6qGXfbi9e0WJhM6JKiU9M300eyc/d8aBKoyRV62+WxXlsOT8K2LYL+rxdWFV
         RIqzsjJ3GT9BEv7oEBu8S7xN2JITdI7dB5vlAA1qhjRWzL8kmiaSJ1Cjxmg94gbgGDjT
         pSAMPB17BC5AJkZvCp4BOk0NUBJrIPNRpLBgU0SNya0uFxJPjwbmUSuIdVGPQJXuCcbO
         Ic6vHfNosTxwN3odRkyPEBtzZDo+wW0zWrO3pL04JmLvA1+iwAuudjOTUk9xfGT6/NcK
         O0BBOr9198zALZs6NOawakbiI56oduSvZo/tHLB+laVhqTpTMqBtBp3nHtk/ZLRAu2l8
         SnpA==
X-Forwarded-Encrypted: i=1; AHgh+RptxphKSNntjfZMjM6BRsNurwsbMWMOJwTanJFvtTZmNUS5HpeUZkMo3OGBw5ilFk43rPaZveEE1L0VoQ==@lists.linux.dev
X-Gm-Message-State: AFuF++mVY0uUujCb6flB3fzKoYsDeaWVtNseNz0zZljb2t6K/Lv1Jsrw
	rqNyGAZGj0MyOjph+Ad5ZRdVqo5XdnV9zVXwOTkXkKyPB816XBvQIdCcKA5plttdvwzCa7THcVS
	Rq7NTAXsG8o/1jTttv56qHQ3PQrpaIqq/eU6fz5fy8yk7kriPrukEjB1btCuGkrd/MQ==
X-Gm-Gg: AR+sD133KYIlPfWHoPIBZGYzUzrGEuT6CwBaqNLHsybC1qhfnjeotq1znxFObFLbrUO
	NfLA0+8a1ON9U0TG8eKfoVuAc0K16+1BCHdOtNOcE7eLUmtlquJhrLnLJrQ8yTootMA1U7bkyWp
	76dGXiMP4ArBQ9T/soyC39JEsG4Ew9yt7fzFC79z2NWU3BKnAtxeHMxmrn1oLEKc6wi2A2/C+A8
	q1kZl3Tz+qFQN05PrYa5/X/8h+TgafPcIFNxJydPefWaYtIKOS1cTKvwDLCv9VHDeyNQOo1IcBA
	jVV3WXaLHI4S0BsJW6FEyioow4FAtc2Q3GshiT0yCpdHfIeiJvV9vJ4VN0KPJ17KEWKQn9MFSok
	QfkBDYMkoPYCEPxjkkarzuWfnITFOM7tU61+8rAe1ng99avJl4OcdRZ0lhTmDnz4R
X-Received: by 2002:a05:6a00:ad5:b0:848:8619:c149 with SMTP id d2e1a72fcca58-85ad924285amr1374229b3a.2.1788155022310;
        Sun, 30 Aug 2026 22:43:42 -0700 (PDT)
X-Received: by 2002:a05:6a00:ad5:b0:848:8619:c149 with SMTP id d2e1a72fcca58-85ad924285amr1374205b3a.2.1788155021895;
        Sun, 30 Aug 2026 22:43:41 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8569f49e3bfsm3075779b3a.9.2026.08.30.22.43.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Aug 2026 22:43:41 -0700 (PDT)
Message-ID: <0cb5eddd-2422-4ccd-aa42-34b46086491f@oss.qualcomm.com>
Date: Mon, 31 Aug 2026 13:43:34 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 02/15] cacheinfo: Expose the code to generate a
 cache-id from a device_node
To: Drew Fustini <fustini@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-2-ea6397bead59@oss.qualcomm.com>
 <ao3ozXIhNgvb5nuS@gen8>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <ao3ozXIhNgvb5nuS@gen8>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: rU6nIWL-EaOF_J1_RP6hGgandpj570uj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODMxMDA0NyBTYWx0ZWRfX3Bec0Ieah7xV
 KAUYmL2WBqj8fBlBue/FZYsgJxvBCGyPPSzRCvmywwPjOTegpGQJe1Ts+nHww5Hr/5ocQuzK6yU
 Yk0eRNsd1oer/CrZrcAbonnUw7vHpR8IBBueRwWUPRgWpUFPqvYfX0O/RsbGgLNl9CcynzUnsZQ
 xM1ZTMcU0n46ThkCcmLHcDZ73Lvm9KbitsP8r4a0lE4py5SVZskqnzM/ONWJ9688B8sqXAjLqr5
 WOAdcb1bXDpqkLscvgCR2fKfjmLjKOY2VyYW+GwfIrYYBhjhKH9gj/B6PAX+QJyLNScoN7OwTx/
 toQLZmFR29FmopC21drVJjHYp8bnwDaxBq9mHtLRUKRJ3LvDX48QNsazNVK1IRmtAHsQVx/j/Hv
 f+TqYOcoJ2tjHLuQ0/MToyogmpjnliu2nQC/263Jrr0t8GGvNpi9VyaYe4zQ5gjvjjozP2+5YRZ
 Cgil/xpoIGbcUrpjKXg==
X-Proofpoint-GUID: rU6nIWL-EaOF_J1_RP6hGgandpj570uj
X-Proofpoint-Spam-Info: AW1haW4tMjYwODMxMDA0NyBTYWx0ZWRfX+KzXB8NB9mdU
 UPB6D/NhJHzfLLVSGy4ss0RGw++1VuSHH3/h/OTMjrVPInV4yEnnQA5BPMSzEjuEWPjZQHBqyvT
 MJtE9cgsvH1nf48LAh4ynv1UXm0/2vQ=
X-Authority-Analysis: v=2.4 cv=a5kAM0SF c=1 sm=1 tr=0 ts=6a95148e cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=NSEGM1D4AEf8_kYA:21 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=z04GtWAkmwoQ-eLwQmwA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-31_02,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 spamscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608310047



On 8/26/2026 3:11 AM, Drew Fustini wrote:
> On Tue, Aug 11, 2026 at 09:30:31PM +0800, Yin Li wrote:
>> From: James Morse <james.morse@arm.com>
>>
>> The MPAM driver identifies caches by id for use with resctrl. It
>> needs to know the cache-id when probe-ing, but the value isn't set
>> in cacheinfo until device_initcall(). Even after device_initcall(),
>> the cache-id is only available if at least one CPU associated with
>> the cache is online.
>>
>> Instead of making the driver wait, expose the code that generates the
>> cache-id. The parts of the MPAM driver that run early can use this to
>> set up the resctrl structures before cacheinfo is ready in
>> device_initcall().
> 
> This patch would also be helpful for resctrl support on RISC-V, too. The
> probe function in the CBQRI capacity allocation platform driver [1] has
> the same problem. The current solution is to scan the online CPUs for a
> cacheinfo leaf whose fw_token is the cache node from the phandle.
> However, that does not work if no cpu sharing that cache is online yet.
> 

Hi Drew,

Thanks for the review.

Good to know that cache_of_calculate_id() could help with the RISC-V
CBQRI driver as well. Since the function is guarded by CONFIG_OF in
cacheinfo.h, it should be available on DT-based RISC-V platforms
without any issue. You're welcome to use it.

> [..]
>> +u32 cache_of_calculate_id(struct device_node *cache_node)
>>   {
>>   	struct device_node *cpu;
>>   	u32 min_id = ~0;
>> @@ -238,15 +237,23 @@ static void cache_of_set_id(struct cacheinfo *this_leaf,
>>   		id = arch_compact_of_hwid(id);
>>   		if (FIELD_GET(GENMASK_ULL(63, 32), id)) {
>>   			of_node_put(cpu);
>> -			return;
>> +			return ~0;
> 
> Maybe this should be U32_MAX instead?
> 

Regarding the ~0 vs U32_MAX point:
You're right that U32_MAX is more appropriate than ~0 here. This is
addressed in patch 06/15 ("arm_mpam: Fix cache ID sentinel from ~0UL
to U32_MAX to match u32 return type").
https://lore.kernel.org/all/20260811-mpam-resctrl-dt-knp-support-v1-6-ea6397bead59@oss.qualcomm.com/

The fix is in a separate patch because this patch is based on James
Morse's original unmerged work — I kept my fixes separate for easier
review. The plan is to fold them back in once James has responded.

> Thanks,
> Drew
> 
> [1] https://lore.kernel.org/all/20260729-dfustini-atl-sc-cbqri-dt-v6-8-7c22b05d461b@kernel.org/

-- 
Thx and BRs,
Yin

