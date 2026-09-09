Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 244C63D566F
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 09:25:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788945919; cv=none; b=g7D/SqhNa+RHsECvIH5BBo9ppRXx2eMJTeXkAbw2SwHKh6kzmHhxJ/xmaUXSZS/sF39lQGcOzClIy6+GnZJAUYOzFj7DcleKdnf1bCrtWetEVQcAyQR/sPsvkhhAuBewdLD8cOa1d4hnBDoHRx+40oaXI9JkkXGDCcfturynyww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788945919; c=relaxed/simple;
	bh=WeVwrI2+Jkr2VUL3/gqGBfkdIAvdOkmhP+FSKpZoBBw=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=VTjzsmFjs3OilWEIJcxuBsJDTjtwHStQJvIBRwFYApxAtZ+pT2R0wMeiZY9Jkbik/N7d9DDte2BOYBeqLWc6L5H+k8MqzMFbKZUkY4bj2kUzqyVQ/KBsnYw7sUmR+7z3Hyrw7sRcvdx6O4rPiriLn0PUC5R6ctrhb0KXoC10KxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XqZ1hQ//; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=S8MYzGeZ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XqZ1hQ//";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="S8MYzGeZ"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6893r1jt163731
	for <driver-core@lists.linux.dev>; Wed, 9 Sep 2026 09:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tc0SBEpwSkNTkbEZjm5qcv0kecChT5/5ooeaTb/EmnY=; b=XqZ1hQ//BzUrz5Rj
	3pC0GzoKEa46iRNA+FMF5cs3otH01A14bQHcYsOhjCmvUDTtWoSxZoJBXTwLPv0P
	VWULcQ8PCESnBUueC4D8veHSokRXfdd08cS+6ZIeqAfzCNfOXMuLhDnVME6Kl3R/
	Jde+ViEWWFZscsLNp3WBlx5ZY3DTgC5n+b7HJS2Vpu0VlzDsGZwnp0Gsu1RUGxzD
	etXg7Bc00yijguIC8E6Qz1SzYk6f4osCyaldqbxjcezhakpjD6NgUKq4lggKMw1D
	2uaB6TqNpxQLlcnLmoVbfEjUz+eIryp3ud6e4E1/jR+DmV5jXzmLjwsUfX9Xet3b
	Gx2vwA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjyxm18kd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 09:25:16 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-398ba5404d2so1581783a91.1
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 02:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788945916; x=1789550716; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tc0SBEpwSkNTkbEZjm5qcv0kecChT5/5ooeaTb/EmnY=;
        b=S8MYzGeZuW4gSQ/SpcYS0HdJ4SebB+dwzSsYVJOeEYYgnOvJVkig4/JaC1rEfeuR/d
         1PXJL/hSTGTxFLT6h3s0meXW25Yj0+84ICADcUy7J4BzcjF/Ip/B80GrWrbmxpKVKuyW
         PWQQCGJqIyML5zmLD4BJ+YV9DKb3w/E6LJxokuq6fS20sQyzT5FSvaxIJdtrkt9im3xe
         N8Ht6n+YOo8uhnj53jCxOIMaD+CZhWJRbbeJnRjRxCKNDbHvQgpwUyFKNzr/KF6yizpv
         vYQrigh7cLw9yLlzLSKnlrXHsYBknGHkUSnu/HAgylmbdVl6nbH6Ql2nSapEGBQDc2SW
         /Jzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788945916; x=1789550716;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tc0SBEpwSkNTkbEZjm5qcv0kecChT5/5ooeaTb/EmnY=;
        b=fZJi40IN8LfE5PwuDwV4Xblwgfa4PrSYqelYWUVw5AGRYdBgWJVC3Gc0qx00oaiEUI
         HciCNiKF9GMeGl3H8skN2ikCE1Oh9zFU/O6ZpQt2u6HLX5kU5VNNpfRZjzKgqBIBzieo
         8+Oz2xmcBE2vAWTjXQvergiUabYXIr8A0lptwrN4Vj/Pg1zCC/fAOCkkCT14oHQfST5V
         HAxqo4WhxR0pgYKebndWu9z8fyUNgEhTHNJr6DoC5Nd6Z8GZpKJzZby/Kz7P8lo/gXvb
         y68Oo7aggsN15rNEhfgiVfBAN/JWnGTIbktkLR27GqYgWOsWmFvS0c+vq7ETcDfqwD+v
         M3Ow==
X-Forwarded-Encrypted: i=1; AKwUvByObzMyPvZ4ZvhYLbqM7I+4zw6I1fJa5pnAoIMZPesSX942pCLlrQeMQKjgdi9KluV8FOzXkLGMsIvIvw==@lists.linux.dev
X-Gm-Message-State: AFuF++mrnZdhBmxEivzVDkAQgPCR7o4H/wh6hg1RhOVc0i7gBehhCTMz
	dz3WPx6xFR2WkSORVzgGVGX5R27llc/5rHeuiGuxoMGEbAJZjeKHYrYZyjB3gtXjrkZcx4cuzT1
	hg8q2ulNqJT2MHnlE0Rkvsi9yU4V9Uk2NT3fC6h4BJ74btmDc8D2Yb1rN9PYabpQ5QkYkBcQPFA
	==
X-Gm-Gg: AYBFou0R/BnDriFOiX1UQSn9uEL2wSmnX9GIlzWmTPlqla+V2nyL0LbGPJd1ZzVKc3T
	wVbEZszN7zfpdMW8KG5ay60rofQ+JZFYtvzmmSEjRr3p6LyWAaZ70lSSgVgCEBmvOPnGI5EbrGG
	AyTRdhcGy6QGUpDZue1metmPkUFLURgoaTHXYJdv0hAxKNrDx4a0xH5AAllkt++rQ2DxgYgxEmR
	2I6zkmNxjXjpfkGGLZw5Fl5pwmuBfgV35JFqMQOarM3aDPXGoBvquH6ts1Bwad+ifB9g5ZELM6f
	kEPH7R6loNP0jfOvnkt5A+5YkAqSNsf4e3Wngb8umARu8w6MhZNnG356lO/asv5EJku3L3j8cMl
	LF1L9NIWfPVVT3p0zOsQx/IaLjra8BRnFcLqHOo8hgR3M9GHWnw==
X-Received: by 2002:a17:90b:1c07:b0:399:149a:3f27 with SMTP id 98e67ed59e1d1-39b2617ed8bmr51222868a91.9.1788945915665;
        Wed, 09 Sep 2026 02:25:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1c07:b0:399:149a:3f27 with SMTP id 98e67ed59e1d1-39b2617ed8bmr51222817a91.9.1788945915147;
        Wed, 09 Sep 2026 02:25:15 -0700 (PDT)
Received: from [10.133.33.59] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b3312f9a8sm28669606a91.2.2026.09.09.02.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 02:25:14 -0700 (PDT)
Message-ID: <db6d6420-c06e-46a1-95a9-b7a7084ebd75@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 17:25:07 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm_mpam: Fix MSC MMIO window size to use
 resource_size() instead of end - start
From: Yin Li <yin.li@oss.qualcomm.com>
To: Ben Horgan <ben.horgan@arm.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        ilpo.jarvinen@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
 <93eac14a-5ee5-40c8-accf-f623cf0e76de@arm.com>
 <74b52fcc-10d0-4d45-8675-4a3431ff4b03@arm.com>
 <8e418149-bde1-46a8-bc82-6baeceb8b1a1@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8e418149-bde1-46a8-bc82-6baeceb8b1a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDEwNCBTYWx0ZWRfX03lPQftYGMND
 INMMZ8/xXPJ8Ne1dRX0oduHo+s3SuTjiAkvnDbpq4p8KUQyiwk+3qYFSD43zqAoeweKa2MtrLXU
 j9NubuWvvWCHUudA2DJY5Oa0rB+dpCVmEzyUterY5FIWskgX6V/jpPcqMn2+h/LVP+irg/jMvJP
 tsOhs6M7EuecHQYAR5V9crvNL7wqHpt0OUhBNUmlNJsOxLLXlPtN56Ebj0pXuHguIXS/C6qZRLo
 n/iOUL1FblbSdLTimkl/3h7tERRIIURoTFzmKvoQp3Lwe8kC4pa9B8+lkCPv+bQMMeXU2OC5cvy
 ZcAqmUZrqrVQUyXN2BY+QfZTZXZPrzkln+TWgGMIu1bMZwC/8NG1vsMrt5XtTwzcj8LfeD6vyhQ
 zmiIy00FxHBznYv24yeaHDUSAfIx778FYpZw2SyX7O7K7y9G1apj+3WuLkADc4DC4KJNlmsqxGS
 fzY7qBoGIKV6Pqo3ORA==
X-Proofpoint-ORIG-GUID: LUxDvrACagyVM2-CF_ghkB7SI4Gwhk2Z
X-Proofpoint-GUID: LUxDvrACagyVM2-CF_ghkB7SI4Gwhk2Z
X-Authority-Analysis: v=2.4 cv=Oc6oyBTY c=1 sm=1 tr=0 ts=6aa125fc cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=7CQSdrXTAAAA:8
 a=bNAQnljyxz1niVXy0fAA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDEwNCBTYWx0ZWRfX4hgUtdU93wIe
 96s5ReZVd42Tgn5b3xU5ATtEaI9aeTCMLziI3cTvbZgObGL3n1+zdf7FOYnbcEojhjvDDGGlf5b
 fBZwGNJNma/LqCR9b46WH7awwWetdbw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609090104



On 9/4/2026 11:05 AM, Yin Li wrote:
> 
> 
> On 9/3/2026 9:23 PM, Ben Horgan wrote:
>> Hi Yin,
>>
>> On 03/09/2026 11:20, Ben Horgan wrote:
>>> Hi Yin,
>>>
>>> On 11/08/2026 14:30, Yin Li wrote:
>>>> struct resource uses an inclusive end address, so the correct size is
>>>> end - start + 1. The previous calculation of end - start was off by 
>>>> one,
>>>> resulting in a mapped window one byte smaller than the actual resource.
>>>> Use resource_size() which correctly computes end - start + 1.
>>>>
>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>
>>> I just got a kernel ci report for this one which asks for tags:
>>>
>>> Reported-by: kernel test robot <lkp@intel.com>
>>> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3- 
>>> lkp@intel.com/
>>>
>>> It doesn't look to give a useful fixes tag though. I'd go with this 
>>> as that's where the error was
>>> introduced.
>>>
>>> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver 
>>> and kbuild boiler plate")
>>>
>>> Looks good to me.
>>>
>>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
>>
>> Scratch that. As Ilpo points out,[1], there is no functional bug but 
>> just some misleading naming
>> which never the less would be good to fix. This does require > in the 
>> warnings becoming >= though
>> and there would be no need for fixes tag. Do you agree with this 
>> analysis?
>>
>> Thanks,
>>
>> Ben
>>
>> [1]
>> https://lore.kernel.org/ 
>> lkml/03055fbc-281f-4ed9-9282-4853d560e17f@arm.com/T/ 
>> #mdb57d40c888ff4ce656a9d9a00ecf5d99466530c
>>
>>
> 
> Hi Ben,
> 
> Thanks, and thanks to Ilpo for the detailed analysis.
> 
> Agreed — the current code is functionally correct because the off-by-one
> in "end - start" is cancelled out by the ">" checks, since
> mapped_hwpage_sz effectively holds the last mapped byte rather than the
> size. So there's no functional bug and no Fixes tag is needed.
> 
> I'll update the patch to switch to resource_size() and change the
> corresponding ">" checks to ">=" together, so the naming becomes
> accurate while keeping the behaviour unchanged. I'll also reword the
> commit message to describe this as a naming/readability cleanup rather
> than a bugfix.
> 
> 

Hi Ben,

I looked into this more closely, and I think the situation is a bit
different from previous analysis — could you and Ilpo double-check?

All three bounds checks have the access width included on the left-hand
side, e.g.:

       WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);

Here "reg + sizeof(u32)" is the one-past-the-end offset of the write, so
a legal access needs "reg + 4 <= size", i.e. the out-of-bounds condition
is correctly "> size".

Take a 0x1000-sized window (valid offsets 0x000..0xFFF):

     - With the old value, mapped_hwpage_sz = end - start = 0xFFF (size 
- 1).
     A write at reg = 0xFFC touches bytes 0xFFC..0xFFF — exactly the last
     4 bytes, which is legal. But the check computes 0xFFC + 4 = 0x1000 >
     0xFFF → true, so it falsely warns on a valid access. That's a real
     off-by-one.

     - With resource_size() = 0x1000 (true size), the same access gives
     0x1000 > 0x1000 → false, so it correctly passes, while an access at
     reg = 0xFFD (0x1001 > 0x1000 → true) is correctly rejected.

So resource_size() fixes a genuine off-by-one here, and the ">" checks
should stay as ">". Changing them to ">=" would break the reg = 0xFFC
case (0x1000 >= 0x1000 → true) and wrongly reject a legal access.

So for the next version I plan to keep the resource_size() change, keep
the ">" checks unchanged, and describe it as an off-by-one fix rather
than a naming cleanup. Does this match what you and Ilpo see?

Best regards,
Yin Li




>>>
>>> Thanks,
>>>
>>> Ben
>>>
>>>> ---
>>>>   drivers/resctrl/mpam_devices.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>>>> mpam_devices.c
>>>> index 1e082fb60e30..5d1854d97371 100644
>>>> --- a/drivers/resctrl/mpam_devices.c
>>>> +++ b/drivers/resctrl/mpam_devices.c
>>>> @@ -2296,7 +2296,7 @@ static struct mpam_msc 
>>>> *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>>>               dev_err_once(dev, "Failed to map MSC base address\n");
>>>>               return ERR_CAST(io);
>>>>           }
>>>> -        msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>>>> +        msc->mapped_hwpage_sz = resource_size(msc_res);
>>>>           msc->mapped_hwpage = io;
>>>>       } else {
>>>>           return ERR_PTR(-EINVAL);
>>>>
>>>
>>
> 

-- 
Thx and BRs,
Yin

