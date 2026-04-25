Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24C134A78C
	for <driver-core@lists.linux.dev>; Sat, 25 Apr 2026 16:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777134262; cv=none; b=PY+hbYyObwWAtqxxNlKHRizQV3HfhFDPrrL5U/1g1C1QQmzU7kNLRk40c6sGewyJ/yHppZ+PAHGartEmR6LBj1vwrMK/mMLatDEgOUWlzXRnhQGn9JLyIoSkcxgc62JSBVU39jpETKu48t45UzykmiQUp73so/vBCMRQvl3FKWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777134262; c=relaxed/simple;
	bh=VWy9Kg9mDTOQDkQpdKD/lfret98JGppo3qXkI9nfpyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=secg+3Q0/8Q1BrGO7VHQ4JGw31CQ+Rb4QuyShQiqVAP6sPrvMif9YJlOTql5PWt++4T+85M3LO9E0ioGRWHnwb/Sh81GfyC2Qja5/f0tMnfz8mKaw0J8ez6HScgMsPtPBSGXg8dn606epSCG5yF8FX1iabt19awBJU7IVslM9xo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jRm0M6hu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WGHLntql; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jRm0M6hu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WGHLntql"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63PGNxHQ2175575
	for <driver-core@lists.linux.dev>; Sat, 25 Apr 2026 16:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZzgVikKVem+yKBm9PKQ2pL0LAqojwaDKUW5/SZUQuA=; b=jRm0M6huFizUvkHb
	tZYUdtnmtE2LQE1macTNCd8MjeOQ/jmrtd8i6rVmUi2ynura1X+uSDuMpGOGtMhc
	qK+4Epc530EwLltrtpZ0OZegKQJwLQ8ucfGJAMIAXH/w8N9lElP/thldjCiAKKdp
	nguBbfbmJVWsR/x7LoIYwmAVybriET0q/I2TX6msC3i9vUg0DdJaVAUfFT2VCZLr
	PFHDJlvZEzn7VaskC5AjzbXpDtwuSMAZtXetypupMBydu2h2lZDHID1O51lAde+2
	qUcKbkRcOgG8RBVF+2m+kSHOf392hF0uzxm0p2k+bApZAkdA8cnPpye3Jjmmggra
	BAsXHQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4drnu2s9fq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Sat, 25 Apr 2026 16:24:19 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35da99b90f6so10678585a91.1
        for <driver-core@lists.linux.dev>; Sat, 25 Apr 2026 09:24:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777134259; x=1777739059; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bZzgVikKVem+yKBm9PKQ2pL0LAqojwaDKUW5/SZUQuA=;
        b=WGHLntqlSEj+B8blda6q2wltZY5SVJQoOIEu89MBbpwkmaqZGLlQjlWeFO5eQ5MmGJ
         7Hr+MxXkIKkRuc9SnEKvzNLm3Brni0ar+Ctx4mZt5qk5kLdP60un10dN8xt9YNXb+cW2
         Wu7uIzDqHC5ytN3Zgn8iE0h2lsIM8HhOa8//XgN+ckiPgpjiO05Tg4AnWIz9zNGrs9xJ
         5at0261O28Tnarkeki2KcUQLx2EDhPNplfdvlI2/iUwuC8pDyYq71bCqzemZz+stIwCA
         g4sYVX6YEgmXrGPZ0L21aSQF4cz1jjOWzQujZZlm+UF2ARtL1I+LZrBGKyrELAadotHe
         64LQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777134259; x=1777739059;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bZzgVikKVem+yKBm9PKQ2pL0LAqojwaDKUW5/SZUQuA=;
        b=FJhBldYPooivRiKfAOZgSAT2kACjEv/2xDEHKx63ymGJOTIcbJ9RWWd5PcNz8gEgMX
         +Ci0q6SiJsW9YU6N5gQaOPPLjrAr6HtjYcLTbfJWwdpPInT8IiN+hrUE2AEeY7v+gciU
         571EFyZXp6zGZ907JMGUxpHObkgSxi6BcRFJISReCFnsVYJbNTOVf1QIscEjPaqxGyXH
         W2sJMmK4AC0TOftuzHj3jr0z5HJucNcaywHIeQEhzhrb8Cb8hytFE+t64IUK8Hb96pzH
         j41GdlscDoRzIJifRsBODbfvobwlVxK2DtkVoLrwOXoeDLxQ0jAkO29Fmc4tA2vsAaBn
         4YdQ==
X-Forwarded-Encrypted: i=1; AFNElJ8OimrLmXEEKoJuHMyH1jX00gpmp0ZFhGW+HrdMJj/03v0+pi4W5Db4Qa6heh+j2QP4J6+5Qtx5tyxG2g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwZMIMeFjzcaSolgqGyAtUfVH9Ii8VZiBsNdgfJQQ1VOHN8WXA+
	akZUpMq/GPUb05TyiCGMmWxV3FlKtw5et7yrQNeJG+QRCpNIqWwOWzw/EoQd/f10D+SnJY1LHYC
	3ptpACmXns0TwwygEnLAmrI8yOsUNnBOBcv3OQhImGciXoMNyaL47Rsx58xkwOpT2Rw==
X-Gm-Gg: AeBDievmmYznr+47sZ8IPOax+m9wGY2yOqgkTZX7MApQLuhJQnZCPzDpQZBJqBVAr+s
	TqZmwymxVUZqEn+ZfUlCOmOs9jkIOUQXGbf4C8FjYaOHbVt7oWuxS+KCPx+uEOuCKQ8S4gPpdBo
	Re+cBSHM5a/Nq+jyPSGaBLkR8CVCGRcWI5AYJXS4I/JDeHSMIrapu0w94MPI8y+E/Zky05RKz8t
	4fIFdsnmAXc4cFD6Te4N6+iPZsEYZ73ZHHF6y8/FY24jebT08yKi0PDRZWXo+zd1GhApAY0dicj
	ewZRTljYEGktGD/k1zWCFtu+KTlfrvGJbDvAhk+dx8AlcqRH92CTVWweU5Zi452MWiCh9zMLMcY
	Itur17euMEAPLnJYkIjKQkcrnk7+TaZoCS0zG9gBXiEbA7hnC3AvxBmubT/Vsd9XCvw==
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr36788728a91.6.1777134259143;
        Sat, 25 Apr 2026 09:24:19 -0700 (PDT)
X-Received: by 2002:a17:90b:5543:b0:35f:bddd:3860 with SMTP id 98e67ed59e1d1-361403b18f5mr36788694a91.6.1777134258606;
        Sat, 25 Apr 2026 09:24:18 -0700 (PDT)
Received: from [192.168.29.100] ([49.43.194.239])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36141990bb6sm27919380a91.17.2026.04.25.09.23.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 25 Apr 2026 09:24:17 -0700 (PDT)
Message-ID: <6d5516ab-f693-e605-77ad-e3f7d0bf579e@oss.qualcomm.com>
Date: Sat, 25 Apr 2026 21:53:48 +0530
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
 <b89eabd9-3d0d-0128-eb56-99ab2ead2257@oss.qualcomm.com>
 <0d68b3a6-576c-4073-9df0-802f909e439f@kernel.org>
Content-Language: en-US
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
In-Reply-To: <0d68b3a6-576c-4073-9df0-802f909e439f@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: tehzndeYbBj_yMUB-4pFWZxPJ_S_pfjL
X-Authority-Analysis: v=2.4 cv=cbriaHDM c=1 sm=1 tr=0 ts=69eceab3 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=gkiTcqCCC2T/77GpOVv7Jg==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=Hbe3yhC3yqVD2gJYGagA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: tehzndeYbBj_yMUB-4pFWZxPJ_S_pfjL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI1MDE2OSBTYWx0ZWRfX8SXMVOBHbzGz
 5OkypoXBEc4rITvGaH7S5UUux7tkQt6OKcbITUvajKPb7+2N/HjlpKOX/b+vDM66RqG9wKMArSH
 RmA3G+jZYIg1dV1PWlZfC7tOU0FhueoAToeasNCI497cg7UVyw1TUmq0ksduZY+NGmjfj1+g6KB
 6fb4vbKm0ahsRnWZB3Ecww7lLJHhwg4WYrnXgB871g4DVRUiNnbKTDFBax1F7e4yUGTQJfQzs8H
 FXZUich01BfhEPyHTDYY3bwxG9891YCH1pSCePH0Qj+vO9je0xBUqIOizFbugmVA5floiZvftMx
 9A8XTj8rJaCjna0DGoiKnQYCSWerfajQt+N9/vjLohIKO5PbeRV24X2Sju2E6cTNDSW8W1MLVlZ
 6BxYf1EZciNF3J02aE7LVbyj/GaVermfZSAvlmIuepP0ls2O5W3GWieBKddMJltCs5Q95kcEurN
 EMS//KNWPWRhPhWnx9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-25_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 priorityscore=1501 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604250169


On 4/25/2026 4:10 PM, Krzysztof Kozlowski wrote:
> On 25/04/2026 11:56, Vishnu Reddy wrote:
>> On 4/24/2026 10:39 PM, Krzysztof Kozlowski wrote:
>>> On 23/04/2026 15:29, Vishnu Reddy wrote:
>>>> +required:
>>>> +  - compatible
>>>> +  - reg
>>>> +  - clocks
>>>> +  - clock-names
>>>> +  - dma-coherent
>>>> +  - interconnects
>>>> +  - interconnect-names
>>>> +  - interrupts
>>>> +  - iommus
>>>> +  - memory-region
>>>> +  - power-domains
>>>> +  - power-domain-names
>>>> +  - resets
>>>> +  - reset-names
>>>> +
>>>> +unevaluatedProperties: false
>>>> +
>>> I think I commented around here but probably not specific enough. You
>>> miss here either reference to venus or usage of additionalProperties
>>> instead of unevaluatedProperties.
>>>
>>> If you intend not to use qcom,venus-common.yaml, then explain WHY in
>>> commit msg and switch to additionalProperties: false.
>>>
>>> Otherwise, you miss $ref.
>>>
>>> Rest looked good.
>> Iris glymur platform have more clocks and power domains, which exceed
>> the maxItems limits defined in qcom,venus-common.yaml. Inheriting from
>> it would cause dt-schema validation failures, so I have chosen not to
>> reference it.
> Instead, you should extend the common schema. It's already flexible, so
> what is the problem here?
>
> You then need to duplicate all of the common properties...

Ack, I'm fine to update qcom,venus-common.yaml to relax the maxItems
constraints for clocks and power domains, so that the Glymur Iris binding
can properly inherit from it.

>
> Best regards,
> Krzysztof
