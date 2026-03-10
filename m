Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAF543DA46
	for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 09:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773136779; cv=none; b=sAFn79QwNdmmBlVmVMZUxfG6igqmb67++XtxQOtIzZhX7lws1JFII0sKBVV669FK6l2kMboPKnTLk5VzN6XOgCIxXJ7iklYk7dzM3hozXDRhdsuxnnRbxvhr1Yl2ex328TKkHH7uxs+0dlPgzBZZHnicYOSr9eu1HPakxuHU+oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773136779; c=relaxed/simple;
	bh=TDPfe7m1zO4HOHLA+mRXSmC65oJJ46//jYUxV1a9kdc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QiiZBF9Q6A+WUu+G6tpJHAc7CqnH62Hk4AxHStKuwpSKPyVT6NXUBPo3ptIBMUreCQPp7RyVymyRS9SU9CBX7jjaeI77OHFbQPuCf7A/vEVKoSv8w3bwOhfPMJLfioBStNUsmcQmeeWAhEUe2J9+SOswvHyqFowyIG2NO1avjg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xs8tsJIa; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OplxKqgv; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xs8tsJIa";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OplxKqgv"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62A7wJGv3124462
	for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 09:59:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lgUe0TFn6d0vjPmbLxKtIohMDX7uiKOUBiGY0vO4PaI=; b=Xs8tsJIaHuFREk0D
	X0/b6Es/83vmE0IH6BgNgd5sda9mPkmieLyMsDF91whgiJgXQNXYiRb9QkHR88TD
	xoFPVRMob0nwQEJZYcIlCSkPjptYkjXDDlNmqPdsbk5H+Hxasl+ROILF1FMEJZ1j
	OxYjgdH8cK+LX09gX42fk04Fkk5YoGJOsmdYW/Jqngt1old/BEWmTec/7GpG9emm
	YEC4IebUlfSG/DzZlTLx+gNgmlVm6iUjcSNnYpC2cDKWHCjZUK6Yy6FjEXRRf+fz
	xF8VV3ASO7vKPZkyGumge0dPKpyzsutqg2gW/2O1rrH8wWoghWSNZdORS0lPZCv/
	Uc3+aw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ctfcj0fes-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 09:59:36 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-89a0796368eso510881156d6.0
        for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 02:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773136776; x=1773741576; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lgUe0TFn6d0vjPmbLxKtIohMDX7uiKOUBiGY0vO4PaI=;
        b=OplxKqgvVy6HADi4iZa7uVvxwNH4HWlbcnWK8r4sAGFpDT8iW7CKYJjV6z05h7D2Md
         bRF/hvkGvX2s6zmarmpJScmcqZ/5Shgvh9FjO2ia29O/leoISrLHJiNmBG3VTHJgtZyY
         viv8Lrzaprn7ejRpz2XR+teu3QW5lQRXodCOR0CwFkxujp1YSaNsa4+m0qJwdwRkcwnw
         U1/glrtYGP3BMsIS8ujkuQWNdUUjILkiomnUtv7r24mryScb6/5ASnFtVcdptN0SwDOK
         gZKKtlTEpCn/z2/vOrLilUJ+Pd7AdTGPB2gKVd1SlRqEw/CaGpTI+b8K1p4AKuRxSnGS
         1y4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773136776; x=1773741576;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lgUe0TFn6d0vjPmbLxKtIohMDX7uiKOUBiGY0vO4PaI=;
        b=bWrgEZhq5SkYzdB44mMfqCzsgtbUPZSOXQiHQTYg2bM6nUYEdkuyys8kHtqa0kxJAu
         /wxoT1hUdHvH4leCgxgSe/UbVN5bVh9+M+qyMuiheQRRwcdCLtxDXseXmGppH4MIYIN7
         9o6RurBppxdstM6tYmfNcbDmPy/kf6FsH2rLfWF5wPkfVdVvTFZp7pinUfz78wgOv9aF
         YZjgQ6nKukG3D5ZC8pUQEQ/rrVFPAgMmHO2M90NHTh04AMrS93nANqi8HP4BphBPFvqm
         1G+Y9Ido5HF0IaKuWBGLmSt508JWexSE+DORvpasQVXkcy0mIVorDVI2Qz8TOmmGrwvw
         8GUA==
X-Forwarded-Encrypted: i=1; AJvYcCVgKPZ2nyGRZdXErkvbFw9fZkhP4gmS+0ICK4dNJSHc5Q6TlG6nYp21zCXg0zkmcPt+R2b9ZNLsaOj64Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywl6Mov3VmZG3x8kcH2SSrVXr0Q50Q7ryAqQdFfiShS4DpRFxTO
	pvmF5fl7CrN2rWUHIQkVQbe1lJrLd18+QIVWSds1hsELw8qHa64Bh/T4Av5IxfyAH1UwvdVRRFA
	mSSPdNzV8Xq/E0Qjwivf+3FYDjmgRx2MQo3aBwvUfvXof3ca/Mxlj+WHfA8Cd570f0Q==
X-Gm-Gg: ATEYQzzhat9D3vpTATVcfTYewVsWwSocvJoZTO9r0EjZTUM6RS5EaZag0y+qoJaaD5c
	rQDZx5CPJHdYsIm3QXgitT97H3YKbM2/RjE4B5S8Uk8IdP+C/rap9calWEhZXaolV0VyHobTc/w
	jFbEiq3T8l0GIa0GnXUts566p+PCZFYuHHe/Lpotq3Q44bqIKl2VnLhIyhbaRoi+cRL+259JaWY
	U9r6ZIsPJjN5NU63G71Dn4Ual3cgg1hVYQNTOEnmrHcY9GO24y0pWyW9eP1d1TJC5Gs4yStNSMc
	XiIRQPsrDNuTH5R2bI9Ws4EkWin5anAwjY35ASwpbLkCDMAoPIY6ugPI6q5V9tPnts2RM5APjgg
	NEoMl9m++yN5BV4RG8e55wKq2QywOfLZYq1pKFQW/+h1o//mG
X-Received: by 2002:ad4:5de1:0:b0:89a:258:c1d5 with SMTP id 6a1803df08f44-89a30ad59bemr219718246d6.50.1773136776369;
        Tue, 10 Mar 2026 02:59:36 -0700 (PDT)
X-Received: by 2002:ad4:5de1:0:b0:89a:258:c1d5 with SMTP id 6a1803df08f44-89a30ad59bemr219717766d6.50.1773136775932;
        Tue, 10 Mar 2026 02:59:35 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485419b8526sm68327405e9.0.2026.03.10.02.59.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Mar 2026 02:59:35 -0700 (PDT)
Message-ID: <9a9cb7f8-54cc-4c43-a5a0-f022394351eb@oss.qualcomm.com>
Date: Tue, 10 Mar 2026 10:59:32 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 01/10] workqueue: devres: Add device-managed allocate
 workqueue
To: Tejun Heo <tj@kernel.org>, Sebastian Reichel <sre@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
        Matti Vaittinen <mazziesaccount@gmail.com>,
        driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev
References: <20260305-workqueue-devm-v2-0-66a38741c652@oss.qualcomm.com>
 <20260305-workqueue-devm-v2-1-66a38741c652@oss.qualcomm.com>
 <aapTSyrkqqZ8j_XL@slm.duckdns.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
Autocrypt: addr=krzysztof.kozlowski@oss.qualcomm.com; keydata=
 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
 cwzYbmi/Et7T2+47PN9NZAOyb771QoVr8A==
In-Reply-To: <aapTSyrkqqZ8j_XL@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=H7fWAuYi c=1 sm=1 tr=0 ts=69afeb88 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=f4WQo65-w8K6TlvLPnkA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: _LpK1LfxK4FeLQvfAQobp__VRkkMpFN8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA4NSBTYWx0ZWRfX7MMqrLHO7leJ
 wuS7p7EGXJTXRivzIHY8BnzeY5KQegNQCAS29P/6f+XorszwH7zCglC+8aOYK9wWtr5oZyMnIsI
 OsjIgef3kZGDs6wwTKX17QilAt5z+CQBL29bxjrJj2vjfNpZg+ZUrN8pZziamJ6iTJEHoMD3AuV
 KJQhKCXHCrSVUuufqKcYDngIX+akbMn5tlgUBfgDH4yZP2G3ptV282PZpnrcdhf+8AdcWhCiyYq
 FSMY/YI4+8daaQXgKC+YbtEcbUl23YKZbG+0ETW0zRNUNjNtpPXY5TjapRdPgsgnDXXTVlpCtUw
 P/0Xkn8bCSAb3Vx5O9cY7eFJeQ/IYh1KtF2OjzrIsenDVo8eDompaV4F0Yl7ZQH2GsAU7MKC2CP
 zSkOYvQxX6ya54JCRaQOzCVxbtlGZd8sZRKr5YP8+fDGh/J73b+bEERhjGGq5/gsCO7h2R+OmpG
 2XwrtJJBCIP3WKvVdWQ==
X-Proofpoint-ORIG-GUID: _LpK1LfxK4FeLQvfAQobp__VRkkMpFN8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603100085

On 06/03/2026 05:08, Tejun Heo wrote:
> On Thu, Mar 05, 2026 at 10:45:40PM +0100, Krzysztof Kozlowski wrote:
>> Add a Resource-managed version of alloc_workqueue() to fix common
>> problem of drivers mixing devm() calls with destroy_workqueue.  Such
>> naive and discouraged driver approach leads to difficult to debug bugs
>> when the driver:
>>
>> 1. Allocates workqueue in standard way and destroys it in driver
>>    remove() callback,
>> 2. Sets work struct with devm_work_autocancel(),
>> 3. Registers interrupt handler with devm_request_threaded_irq().
>>
>> Which leads to following unbind/removal path:
>>
>> 1. destroy_workqueue() via driver remove(),
>>    Any interrupt coming now would still execute the interrupt handler,
>>    which queues work on destroyed workqueue.
>> 2. devm_irq_release(),
>> 3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.
>>
>> devm_alloc_workqueue() has two benefits:
>> 1. Solves above problem of mix-and-match devres and non-devres code in
>>    driver,
>> 2. Simplify any sane drivers which were correctly using
>>    alloc_workqueue() + devm_add_action_or_reset().
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Acked-by: Tejun Heo <tj@kernel.org>
> 
> Please let me know how you wanna route the patch.

Like I described in cover letter, so I propose this going via one tree,
e.g. power supply. The first patch might be needed for other trees as
well, e.g. if more drivers are discovered, so the best if it is on
dedicated branch in case it has to be shared just in case.

Does this look reasonable @Tejun, @Sebastian?

Best regards,
Krzysztof
