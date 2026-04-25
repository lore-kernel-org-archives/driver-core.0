Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40E61382396
	for <driver-core@lists.linux.dev>; Sat, 25 Apr 2026 09:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777111032; cv=none; b=cSjysH3VdBPWE0vRMEOTyRasWcqRxwNHg0bGF44DR5Q0yOxO9HfIfnBU1ve8gQGpwLAzzt7JahroT6IdUKDn8XFuGyLcT8iyOt1zNtcNY4IJTveYdL3ufNDL/qbow5UNYGqMyEqnhRdy5xio4jNNcmNCb0DlgVeTa1KBFKqwSj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777111032; c=relaxed/simple;
	bh=GZbR2ACVh9+gp+nilqqxNsrf904ahFQUCCu4bpKzwYQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agYg8Z6Tj+RlBoV/LT7v/eC1/d4mCv6qT0BY/qGozP5Wr0PGv4OtNETywpXtVKCMsfNnsK0n9n786YOkunainOT4WgxPPc+OViLHXHuxgESFbGmBbPbjQ3OmpiA/kWIlSaMHM4iJQWh5KDz5K6qVDKqhrDnsdh2hYR6dMSzDAKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OzUj1w8Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DHyZnBAv; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OzUj1w8Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DHyZnBAv"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63P3QwiX470932
	for <driver-core@lists.linux.dev>; Sat, 25 Apr 2026 09:57:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=; b=OzUj1w8Q2ssnZpj3
	HLB3WZSeCEilZsnigNWyXXkh2qTKpaa2IkdQCRhjOIUUAWvrBAqoSEUC/rQ9/4qj
	doNf0Ue666/ghX/bdSgXlNM0VGqXwWpU/D2bCrbQN9qXTw5SOzJmzjEm5wJidG22
	o/DuhbsmWOY2hqgjSysxpSkQg9ZvcjYFB1V615nULS1UvlujcZWe6HHD4xEZqG/o
	1cBWGGkWjxRTxn35TktvymcPnVMi1y5QtfzKmovJ8cgtjdAHoBjrp30TfspJIuGd
	B0KR7OJcUmVFQNklk3+zaIkkHMrtCo6kA0GE+k9zRO1L6nYxacv2F6QzfFmhJMA2
	Zd6KxA==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnq5rmty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Sat, 25 Apr 2026 09:57:10 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-82fa366fb79so8334249b3a.2
        for <driver-core@lists.linux.dev>; Sat, 25 Apr 2026 02:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777111030; x=1777715830; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=;
        b=DHyZnBAvyJIQEwy9TfHEH37IpQNKGdNPk/VwAISffqdZVoo/NI4r6m4/IigGt1wbGP
         h6f8E0qCVMDhqxjkjKc1qZBPQyKaKUI7Nh4WmEP0nnA+T/dQnUyhwMmiMdTNSb+h/mFN
         i648VRYM59PXAHFNY1JNxlF+cPZdAmxHCoD442IeJX+SZLe9XxJFzW05H68zye4HWdRE
         e1hx8p3i7N8sfZfg3F94snFU/AfbCeWPUNqlPeq2bqZRwj+e7x1+LkGk5Lx+Gn5FF9oG
         COHtChWa/HQ+RcVOuoWttkUvrwyW97jau/IGalM7hxdJd0DR6ZPlVUumazpApC2+RbuK
         bQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777111030; x=1777715830;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AZExIZavOwKLJirxIZDH3BFh2jY1Vt1v0FLp3r7lz1g=;
        b=WX1rFEk+i5gscDAGbZi/KPoQ7ysZjMSnIC6w5Y9dZ4JBsZGSOJe9ym/vj/yEHwJzsq
         cCHL7NpLep///nibcJaSotrx91g0DcalAlnQpG0e11QUKtJdjJig58wGzXfK5FTjYtYg
         sXsgHhQYYMIHrvB/7qaXDbrtsJrRHXno4Sty/sfzNs3D2HneE/YNg9UKHpGg7nThw1Bl
         zHaPkwkkOqeuqH3AHxrWR27ky+IoApq4BkDVFy++l/68aFag84Oq4tlHjz02yL1+qODf
         ON7N7c1LW/qowKDoA/mNNdx3+IGHgzT9brOx1me/7CFqD5TCoTbBVrM49pQPzNudrrSV
         qTwA==
X-Forwarded-Encrypted: i=1; AFNElJ8VuHZ769xFJgiT4k+etyed6843blpmap05QljLyUIvoNBSMtpV7V9b4jEbhwH/QIlSyQ7CPjZ3xbIZUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzvSweQXwvv34wGpwBkC5D62irh1vOCdKnpDiSiKuSoxMjSElTO
	UUyyt0l6SAMTPBhkH8f3TYfFt5tf55WLeE4DtYWiLR7BYzLaAlBeeTjL17N+FMa7uWves9vKo/H
	KVI2wqjm6ADiGGu752A2jXk1cvQUg0anhZFzmi/EAJHq5G7vnak6boTbjSsUWzAZFVQ==
X-Gm-Gg: AeBDiesBEb8SxsibyEIDDNV6d9rlZHpMLqN6JyV6g3dLcbiAUo+xTMvzlmZmr64q6qu
	d66StQPRl0sirbvRivz4Evti+fC7e6xLk1aS2X9RXIocTW8tXMuPj+IH05Wfi9fYfbS1Ic/jhUr
	LLEIOCP/bCeOZLL2CeU6fbAnB3EMTHPUxcpTPpObYrE17QeDGhEi1PmtkY/RaDwN3l0oTYGT2Bb
	nvR8uzATmGTXvXdsLQmcQFgizrcWOz5+XBS64YsAKRIvnWvedimyRriwHBZVRLYDgDAZm6dib9b
	WcwF7+mTB1LuLBrruDSVoCGa3W/nrNrpSIxN3qWRzeXft4EPrpFpypl8MwExg35qe5YmhfFLcqN
	xCT9ndKT+dYCET4WF2R4q4FhNlzAvZuWX/nEc9rIjuFC2aRNjoW1cZdA6PYvwYrKCaQ==
X-Received: by 2002:a05:6a00:2da2:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82f8c86b594mr36379968b3a.17.1777111029798;
        Sat, 25 Apr 2026 02:57:09 -0700 (PDT)
X-Received: by 2002:a05:6a00:2da2:b0:829:8942:2c85 with SMTP id d2e1a72fcca58-82f8c86b594mr36379925b3a.17.1777111029289;
        Sat, 25 Apr 2026 02:57:09 -0700 (PDT)
Received: from [192.168.202.18] ([106.192.38.78])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ec037e1sm31035140b3a.54.2026.04.25.02.56.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 02:57:08 -0700 (PDT)
Message-ID: <b89eabd9-3d0d-0128-eb56-99ab2ead2257@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 15:26:51 +0530
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 04/13] dt-bindings: media: qcom,glymur-iris: Add glymur
 video codec
To: Krzysztof Kozlowski <krzk@kernel.org>, Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Thierry Reding <thierry.reding@kernel.org>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, driver-core@lists.linux.dev,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20260423-glymur-v2-0-0296bccb9f4e@oss.qualcomm.com>
 <20260423-glymur-v2-4-0296bccb9f4e@oss.qualcomm.com>
 <a9cacc9d-c7da-4803-8950-97511f8d927a@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <a9cacc9d-c7da-4803-8950-97511f8d927a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=QNxYgALL c=1 sm=1 tr=0 ts=69ec8ff6 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=zt2h8jT1BUEQU1rgsTrZfQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=yXM0pRxr-LgjvrZoWBMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-GUID: j8r5Md5pzqd85dEvzuFsne9VFzq8SgVm
X-Proofpoint-ORIG-GUID: j8r5Md5pzqd85dEvzuFsne9VFzq8SgVm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDA5OCBTYWx0ZWRfX1yYjOe6ge1xr
 dSaM+I+DDf/MBVTJs/cnVVMDgBa719BGvFq7Gv1rI3J08vauboMbVu83RtS9omROH6Axq9TbP/b
 Yx9FlpPo1uFLDY2z7bak79MvS4u7n6CyprqK31B5jgwMLlZP8L+eaQFNjfM5pdCq8lcLZKN7izO
 F04swv4RUUd8B9jaIKAm0XJGsJduGnqftKA4Y5KfGRLYBsUZTFw/ySOusCZjUrLFcfAaNusEWbw
 lFi3w7uLttSRASXO3tyfHfoOmUT2nFbVRHLZzHa5xrQ4nmXmhz63FC5r3nvASsS1sEYTZXRMVtA
 YIm/Cgp+kVCyg9TXUo4MEJ49Z1dyt43/p20/Rh5Y5m1w9RAL58wgGG/AFfFvAKZZF6fjMKOD8vB
 ctODFrPXC0zlVDey+YVULi6TUtwAw15DdSyOxPKLueWMLHPzvqfj6HGvFB2DHp879bIIEDcyt95
 8+WIeyc9vIQYRMJbHUA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 adultscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604250098


On 4/24/2026 10:39 PM, Krzysztof Kozlowski wrote:
> On 23/04/2026 15:29, Vishnu Reddy wrote:
>> +required:
>> +  - compatible
>> +  - reg
>> +  - clocks
>> +  - clock-names
>> +  - dma-coherent
>> +  - interconnects
>> +  - interconnect-names
>> +  - interrupts
>> +  - iommus
>> +  - memory-region
>> +  - power-domains
>> +  - power-domain-names
>> +  - resets
>> +  - reset-names
>> +
>> +unevaluatedProperties: false
>> +
> I think I commented around here but probably not specific enough. You
> miss here either reference to venus or usage of additionalProperties
> instead of unevaluatedProperties.
>
> If you intend not to use qcom,venus-common.yaml, then explain WHY in
> commit msg and switch to additionalProperties: false.
>
> Otherwise, you miss $ref.
>
> Rest looked good.

Iris glymur platform have more clocks and power domains, which exceed
the maxItems limits defined in qcom,venus-common.yaml. Inheriting from
it would cause dt-schema validation failures, so I have chosen not to
reference it.

I will add this information in the commit message explaining this, and
switch from unevaluatedProperties: false to additionalProperties: false
as you suggested. Will address in the next version.

Thanks,
Vishnu Reddy.

>
> Best regards,
> Krzysztof
