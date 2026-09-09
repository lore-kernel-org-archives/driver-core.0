Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC894EBAE5
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 10:28:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788949693; cv=none; b=AO5/HD0VqyU0ELPNvAALPd1EjW/yKwZF47iDCFdjfnwDhCoVwUr/5WO9uYsjqRvLgFlxQ++jRvmMpuXrJupEOFfIvwYvNYjQAOko5K8vgDFynko7LTx7gyOIpjskKWXSQtJ6azj4yVSRHlLoPPIV7FIHc7DyPWy1yZCjrIbMbug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788949693; c=relaxed/simple;
	bh=kGwRs4NcUp0orIRjp0maS3muSlbn5QMvQfdlPtXsTo4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=FQtyIe1OWvyo9T0nJGyNfXLHyaB+gyMJpNcN/lDb1nkcDBwATebzmWF8NNJflxqo91Xv616VDYZ75RMaAgkPKb0gUlAwqshlTjF9CWFnPFeA/sGy9WzH7Ejk+ACczDvQp/nvb5s823Ex10jNxtt2wUkQlXTE4uPEbE+WRljmqRM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IxlwAgBg; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gX9mAlvy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IxlwAgBg";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gX9mAlvy"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 689AS3lj2822778
	for <driver-core@lists.linux.dev>; Wed, 9 Sep 2026 10:28:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hg9xakhJtn7/nEdc5P+jKIAjxWSdEcVFkr6a2Adc9B8=; b=IxlwAgBg6HZmX/7F
	f68ON5Ta2cw8OTXrpwTJAAQKWoUVAVAEOlKfCutmjGftdb6SQyrrAV0qyO8ZgjhU
	WY24O/v6h9RLSzH6s0ff8HFYwt4CDPj296b+fYM/dGNysq18Xhx4LrsgqxFYAY68
	8SsRLVtTtbFilLEl7f4txWGjtloSjGuJwQyUIWSCzkIWZG0azQ16BERKnoOtHSh6
	ApEFw1fT4HJHluPac75IxCRGa3y1wMceHM3AW79JHeaI2UhIb8Zb7XdzcNlMCEF0
	11H7AuEVOuZUXkejY8qHws8uYAfppy0wToSYkGN4W+N2kLLn34NHdlp/V3DxWobK
	+T9kGg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gjqdw3m0y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 10:28:10 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb11535e6a1so6078579a12.0
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 03:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788949690; x=1789554490; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hg9xakhJtn7/nEdc5P+jKIAjxWSdEcVFkr6a2Adc9B8=;
        b=gX9mAlvyv3xeHDq0lde17PzTDAmva8DFAYmdta2G8MSkpZoQA1pAkd6nVjpCWPHf+d
         HLGYR3luy2tkdDWsOxFY2uHkkNTHLl4xUA9P18yTk/9xboGUl59UvSIh0l3bLT6SxXRz
         TJnwJnG5M1qP0oeg6C7ZMe5k8clEJp9Lb8ThCusdJr2/09Q/8XtJxqirYeBtIIrLehTq
         +7ZGO4fMneLOm4ZPs+YwDv4ltQFZdVlCb6nA3gtP6e2TsmZ9kVYa9+lHVyJzQfTLkabB
         qK6BaG1phyLj081Q6Qo/CG4FeayUoaFc/BTCGnx6LNxscGF/Oarz/VOwW+tdcRo4VYyo
         zBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788949690; x=1789554490;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Hg9xakhJtn7/nEdc5P+jKIAjxWSdEcVFkr6a2Adc9B8=;
        b=TT4t5oH42tmPi7X6l/ib8WTPgJ8Tfdn++rOOrTJHeev+CeHVzYkunnIxyhSd17DgFQ
         HjzFJ82a/MAVmgAvEOAyW0cOikVfRbZWUtpSs0h5TphVonIXUfnnYryoIlqT+zdovfb/
         f4oUBILQUXPP+pzsEnLLZ+VowwNfOegjezdHbVw4W4X3vSDENZThBrEYmIzyLPXb7JGy
         lny9A/hwFmMKa1pUrigh5+/EJXzO/8khWQoUfxaxXPvR8aK3Vhk3P0AP4/RrXt7atClG
         ka4hd55E0uFXKi8GJqTBP6a22VgfXoEckLgyAKJHtczn/O/zxvHRFk+uYHa/C9N7Jmgx
         6Jow==
X-Forwarded-Encrypted: i=1; AKwUvBzl1dSlc9afnkKMPQz/5osGn8l/4TT4CMdnef2tLJbb7K5z/yIxUcipksnCekTWw5rJ/vyelACnwzdIhg==@lists.linux.dev
X-Gm-Message-State: AFuF++mCfItmwPRCru6PHXhKd48x1SKJ0Xy0HUOMHmNO8zmLr9/mIeMQ
	/p+pLs3Fw/aGginj8BXMHnvXgZXOl3O/++cOrpfp8MrrWnYlJeoxjlblnlCKzKtrKJT8m4/HE6P
	TEkLjPjMAq1wC+Rh6hNslhgVeSCPmKosQ9WGxSQ2SzsOrOdZYRo3wS1EvViGlbpvRCA==
X-Gm-Gg: AYBFou3CTvw3uoJ1++Vj1fzKEU91VL6DALtfgsrCYNvBHyaLmhJ+plMBvpKCz/thV8G
	uAAUBK8efB+srr0gSeuCW4ofODLrchgWuchs/ObpH1f1JxueFkjUrAUSPbKXQya/NmrVtLUp/IU
	O2Gj1v00RRt/V4sxr++Kdhq/KItxrTz4DxO/Dwf4LRTeqG13teFNJPTV6d3TkAb7BV1pGAR5zXh
	R5rB+otqjTaIo9vS6RhmEY1M3k+K6CYEvcSY0+6N9o4/lhoW7VqnQb8vx+YvgK9WhCGiZ864/fR
	OvPcdOvZxFQIjcUSXy+8K7AYv7qoG3DL1i0czarVkNcOmyOzK+zuC8pvHrlCDXj0unzS12BsLBu
	4kAlSwa4DJ2gYP6VlY+2dkAUprGiIPXXHYh8y/19KqwoKQYM/S+iib5gx4B01Asc=
X-Received: by 2002:a17:90b:1c0a:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39b2623abfemr49576240a91.21.1788949689494;
        Wed, 09 Sep 2026 03:28:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1c0a:b0:398:d132:ba76 with SMTP id 98e67ed59e1d1-39b2623abfemr49576184a91.21.1788949688960;
        Wed, 09 Sep 2026 03:28:08 -0700 (PDT)
Received: from [10.133.33.37] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260cd2aasm30979894a91.3.2026.09.09.03.28.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Sep 2026 03:28:08 -0700 (PDT)
Message-ID: <2d1eee2f-31b0-4303-b9f5-8e0c5c598d5a@oss.qualcomm.com>
Date: Wed, 9 Sep 2026 18:28:01 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm_mpam: Fix MSC MMIO window size to use
 resource_size() instead of end - start
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
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
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
 <db6d6420-c06e-46a1-95a9-b7a7084ebd75@oss.qualcomm.com>
 <4d33f2da-8f56-407c-b0cc-805a3ab1d145@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <4d33f2da-8f56-407c-b0cc-805a3ab1d145@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: _IEdHHn0yGFxPOCdo1pru4_H2Yzc__jt
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA5MDExNiBTYWx0ZWRfXyYkdoc1ye7k6
 7LENSSWwcXCEBZVvRgjY/6xzPt5Ln+k36eefJBuvIngWhqpyByo9MhA5Sv5ZGFjREMh7KMpn9Rn
 rJI43heAkhNq0HHc7NrgrwVsP7IdIRs=
X-Proofpoint-GUID: _IEdHHn0yGFxPOCdo1pru4_H2Yzc__jt
X-Authority-Analysis: v=2.4 cv=Bo2tB4X5 c=1 sm=1 tr=0 ts=6aa134ba cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=3sz6X1dgABYS5Q3AtFkA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA5MDExNiBTYWx0ZWRfX0ToT1ev2W+cG
 5GKk+EM0dc+oDZZxWhzj65/0X1xkNcYk/Zie5B1/e/9q8YubPRcjLr5ifa6tkkdrslgDOMUC6De
 aM3xM0E7RyhxaC1iVFSIrXTk2Pj0bixpxd4xcVOtmMPcliqDHlIaxrUKae4TCv+KiR75czFop0g
 8xRghLwug0BILPZxVUHM17+OSBNp0Es3XWVtItGeJ7mhw+GK9Yg4mNFxNK+YoXp6igmkDDeWDVZ
 6liMlQKTPaJAtE5uIuhbvy9lFdJ9FaI9mrsyyLQhVZXV1+iT7Q4egO7QRzwFmC2xDS3SgrWouDC
 t46knGkN5O4t+3W5QNQ5rkgIkngHMxZv9gCtnE/zST+wiMjNfjw52O93IojIuwmXG/6UcOXEOnj
 SUts6kNnr6ofNbVvJozTx2ZBPfs2C6I4WBiUI7Pig18+u8yf99EiIBXHehFdZtYWR6YcYXOZ/Kz
 1f4WY55nZJ3Eh2KTvFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-08_03,2026-09-08_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 impostorscore=0 adultscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609090116



On 9/9/2026 6:11 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 09/09/2026 10:25, Yin Li wrote:
>>
>>
>> On 9/4/2026 11:05 AM, Yin Li wrote:
>>>
>>>
>>> On 9/3/2026 9:23 PM, Ben Horgan wrote:
>>>> Hi Yin,
>>>>
>>>> On 03/09/2026 11:20, Ben Horgan wrote:
>>>>> Hi Yin,
>>>>>
>>>>> On 11/08/2026 14:30, Yin Li wrote:
>>>>>> struct resource uses an inclusive end address, so the correct size is
>>>>>> end - start + 1. The previous calculation of end - start was off by one,
>>>>>> resulting in a mapped window one byte smaller than the actual resource.
>>>>>> Use resource_size() which correctly computes end - start + 1.
>>>>>>
>>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>>
>>>>> I just got a kernel ci report for this one which asks for tags:
>>>>>
>>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3- lkp@intel.com/
>>>>>
>>>>> It doesn't look to give a useful fixes tag though. I'd go with this as that's where the error was
>>>>> introduced.
>>>>>
>>>>> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
>>>>>
>>>>> Looks good to me.
>>>>>
>>>>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
>>>>
>>>> Scratch that. As Ilpo points out,[1], there is no functional bug but just some misleading naming
>>>> which never the less would be good to fix. This does require > in the warnings becoming >= though
>>>> and there would be no need for fixes tag. Do you agree with this analysis?
>>>>
>>>> Thanks,
>>>>
>>>> Ben
>>>>
>>>> [1]
>>>> https://lore.kernel.org/ lkml/03055fbc-281f-4ed9-9282-4853d560e17f@arm.com/T/
>>>> #mdb57d40c888ff4ce656a9d9a00ecf5d99466530c
>>>>
>>>>
>>>
>>> Hi Ben,
>>>
>>> Thanks, and thanks to Ilpo for the detailed analysis.
>>>
>>> Agreed — the current code is functionally correct because the off-by-one
>>> in "end - start" is cancelled out by the ">" checks, since
>>> mapped_hwpage_sz effectively holds the last mapped byte rather than the
>>> size. So there's no functional bug and no Fixes tag is needed.
>>>
>>> I'll update the patch to switch to resource_size() and change the
>>> corresponding ">" checks to ">=" together, so the naming becomes
>>> accurate while keeping the behaviour unchanged. I'll also reword the
>>> commit message to describe this as a naming/readability cleanup rather
>>> than a bugfix.
>>>
>>>
>>
>> Hi Ben,
>>
>> I looked into this more closely, and I think the situation is a bit
>> different from previous analysis — could you and Ilpo double-check?
>>
>> All three bounds checks have the access width included on the left-hand
>> side, e.g.:
>>
>>        WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
>>
>> Here "reg + sizeof(u32)" is the one-past-the-end offset of the write, so
>> a legal access needs "reg + 4 <= size", i.e. the out-of-bounds condition
>> is correctly "> size".
>>
>> Take a 0x1000-sized window (valid offsets 0x000..0xFFF):
>>
>>      - With the old value, mapped_hwpage_sz = end - start = 0xFFF (size - 1).
>>      A write at reg = 0xFFC touches bytes 0xFFC..0xFFF — exactly the last
>>      4 bytes, which is legal. But the check computes 0xFFC + 4 = 0x1000 >
>>      0xFFF → true, so it falsely warns on a valid access. That's a real
>>      off-by-one.
>>
>>      - With resource_size() = 0x1000 (true size), the same access gives
>>      0x1000 > 0x1000 → false, so it correctly passes, while an access at
>>      reg = 0xFFD (0x1001 > 0x1000 → true) is correctly rejected.
>>
>> So resource_size() fixes a genuine off-by-one here, and the ">" checks
>> should stay as ">". Changing them to ">=" would break the reg = 0xFFC
>> case (0x1000 >= 0x1000 → true) and wrongly reject a legal access.
>>
>> So for the next version I plan to keep the resource_size() change, keep
>> the ">" checks unchanged, and describe it as an off-by-one fix rather
>> than a naming cleanup. Does this match what you and Ilpo see?
> 
> Yes. Thank you very much for taking the time and looking into this more closely.
> It looks like I introduced the functional bug whilst upstreaming James' patches.
>

Hi Ben,

Glad we got to the bottom of it. For the next version I'll treat it as a 
proper off-by-one fix: keep the ">" checks unchanged, use 
resource_size(), and add the tags:

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and 
kbuild boiler plate")
Reported-by: kernel test robot <lkp@intel.com>
Closes: 
https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/

Along with your Reviewed-by.

Thanks,
Yin

> Ben
> 
>>
>> Best regards,
>> Yin Li
>>
>>
>>
>>
>>>>>
>>>>> Thanks,
>>>>>
>>>>> Ben
>>>>>
>>>>>> ---
>>>>>>    drivers/resctrl/mpam_devices.c | 2 +-
>>>>>>    1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>>
>>>>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ mpam_devices.c
>>>>>> index 1e082fb60e30..5d1854d97371 100644
>>>>>> --- a/drivers/resctrl/mpam_devices.c
>>>>>> +++ b/drivers/resctrl/mpam_devices.c
>>>>>> @@ -2296,7 +2296,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>>>>>                dev_err_once(dev, "Failed to map MSC base address\n");
>>>>>>                return ERR_CAST(io);
>>>>>>            }
>>>>>> -        msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>>>>>> +        msc->mapped_hwpage_sz = resource_size(msc_res);
>>>>>>            msc->mapped_hwpage = io;
>>>>>>        } else {
>>>>>>            return ERR_PTR(-EINVAL);
>>>>>>
>>>>>
>>>>
>>>
>>
> 

-- 
Thx and BRs,
Yin

