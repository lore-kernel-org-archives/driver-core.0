Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6E93265623
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 03:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491537; cv=none; b=X0bMi9Z1kTLnPcW0k7AhhCzP2HwEU1yBZ/54bneTsj2KdawjOzyIljoUX70bWXzSmagt5h1FNI/NC6WzW22ZpQjb5ujUES+ZIDxFChmXtwadyaKBIieGMtNbHt39hEhYRt4wtfM+20DpE+nhTp6ODaR1DEUfYpz9x7p6p3eXl/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491537; c=relaxed/simple;
	bh=Y95yniYLVZizFK9LcvuTZpHxT3C+HIs4lMFSHQEGUeU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kcgxKOKWu7nX4j6satHHuj+2CWlkxZdmlmopoxWe8D2QfUK7ZU4LUmEqObT5Dq5HcakeGFDCwgkA4Gg/y0pAxAdCZQIqi3vsUOB76vw2/k+pLZu4+DjTIQuBwqkQF2eqpgBSAm2ZowaHy4ViLgg2ojyW019SofJH4Bkz2Pwymh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=YXa1PWzk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZeHLR/wR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="YXa1PWzk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZeHLR/wR"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6842lBAH2473961
	for <driver-core@lists.linux.dev>; Fri, 4 Sep 2026 03:12:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JYxawr2n1gJxIiwBliti1lTRD1HZQn72h83Vvz9XPv8=; b=YXa1PWzkYa+PpBQn
	yuthV/+n/nwhMJa97ivv9cQNpOyPlzFI4yiMZgzn/I0VF0eweO1V5+DnPLtAaUHK
	DPnMlBRjPKq/U+m7OsqL+aNtLw6vBIrhkqkHtqFJIFyVEwsuQmZhtmsQV+uUxXBJ
	bmr/tAoa8/orQHhesVqwOmd3u7b0W0ltF5ysnAFmZY6OmRNJ1qUURWrkHz1EOybZ
	CzNdYgCQ9nOrLUd7pQZvZ0BGNVI2el1i85dk1XUkCedwr7lxitiOgDQ/2DAaLJZW
	jVp6tWNi9jcJM0HWZ2ZXZFlTZXpV66rpR7SKgFQh2f1O8N3TZjfFCv/904R6QMYu
	paJcJw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf4ekmryx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 03:12:14 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cc39363cc88so710220a12.0
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 20:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788491533; x=1789096333; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JYxawr2n1gJxIiwBliti1lTRD1HZQn72h83Vvz9XPv8=;
        b=ZeHLR/wROaBSDgMAGufge1K4w+C9eQueOcSFBy1ZSCXXZIG0roLS43jKaSlmioj/Eq
         DcMFoVCPkL6AQfjxuzXnGY3ZsUFyk9fvuTXkpbSs7/hLmBCL4JC7OzdI/0d1QaD5edsw
         AbNVdVxiR9iBTZJf1DdSJv1gy4+RMpkyguWhYDwujhECH/9/cEQYhwHiM2r8es8R/kZt
         XgTP7+/xUNVwc/hshNiNQBiEXe7dCJZLJe4Qhft0oeHIaejmvzFWtGRmmQ23RLuLhekh
         fD7CPqKIda5NvApJCyAS3dIRf7Bk/Qw2FmRQb+TDBKQ6aqiNt1uYfC6gs+Cy7wbD1hYK
         nVMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491533; x=1789096333;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JYxawr2n1gJxIiwBliti1lTRD1HZQn72h83Vvz9XPv8=;
        b=aBMwvGwuM7ybUBnwSPKX0UCiNYS6NAAyLo00PgrrILkwbLe9hOogHkqShtzGq5VkAO
         V7UT5Ph0df5LwfXe4x3WSfRYrrZeSN7sQmvyjkUF+9FbSM9ZM078mGFk6zsncX/Fkww+
         7z5KHYJ3A9lVnd11SQFtXEqpE7Gk17SbSwks7ly4iiUpVIGLzpbx1bia7ZLrGwDcMtHV
         i9PSxHwoLDVVQiUIZxKUyYAv9eLNKH98DHAyrJ6jTkidKv2LUSjWt23s+UtDROjGMvu5
         I1fArpxeM/VAzYT9wmYYTdDd/ElB9z422Cdrm7/4yK7PV+bh5iR8+ECbw9xx+rFWenqf
         ABLQ==
X-Forwarded-Encrypted: i=1; AKwUvBxfrS15zTGnjWccpEqm84ldKYscq4NmyZyEmF/n8ynzLnOIa7STbA7wXDsX0CJdzMMl1iSphqMl/+jxZQ==@lists.linux.dev
X-Gm-Message-State: AFuF++kV5PhrbRI/CKhBMDCOYHNGwUmmd3v2MKKOmVRMGcBdy/JdvZnY
	haDuIx6lL6+NRTSjmrscLbIgZ4Oqy37yH7oxjbp/l38Hp1YHCzo6uBsbs5ozZTGwO8cPH0k7AIY
	HrBwbxhtenVscnqNLZXpuLP4myGmcXXRtr1G35xkfmVgDV6INdy20qbzeaOiNUXsI/g==
X-Gm-Gg: AYBFou07vaP16c+D1vd7jpJMiQI+UNJO//mn1/Qq3c5JjECzsH06vzB4jtj1fD1udB3
	et68t0FSFhgL9JdGjH1KNJWzkTShrFjlR/rfRK1mScYGhGUwCOMvbhI0yR0deGfffvN2uhyP1/L
	6+NtUS0Nkpt3l9ve8SYYri6nOqEoJyWoqNtH0T3zsG/8z9+8F+vvfQadLBksp0c5V09NOAOJfKz
	6D4ck0s6SQqY4h9Fc3ArA+KjuTCaXQpyxFuZyBL3mI5Ba5hs6dMTnmr6qGoyxykAUeP50m+puom
	C3MywD5BL1vB7IHuAsUzFP+NcrVrTYHqGIMzP0gt0mIM4cvCzz5RW5WZEOSgBg71cY2lzbWfcY1
	UewaxhHXuz42JM/xOOM7uJgbpxsHkAAN96H7AQgeGWQfI3dVyaRsFzJzN6cKPmxrB
X-Received: by 2002:a05:6a00:8c11:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-861662d4cd9mr5413461b3a.2.1788491533045;
        Thu, 03 Sep 2026 20:12:13 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c11:b0:847:9aa8:d3ce with SMTP id d2e1a72fcca58-861662d4cd9mr5413384b3a.2.1788491532557;
        Thu, 03 Sep 2026 20:12:12 -0700 (PDT)
Received: from [10.133.33.207] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152e2f1e0sm581870b3a.36.2026.09.03.20.12.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 20:12:12 -0700 (PDT)
Message-ID: <460cc3a2-c9f8-493b-9958-9e0c9a80fdd6@oss.qualcomm.com>
Date: Fri, 4 Sep 2026 11:12:05 +0800
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
 <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
 <93eac14a-5ee5-40c8-accf-f623cf0e76de@arm.com>
 <74b52fcc-10d0-4d45-8675-4a3431ff4b03@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <74b52fcc-10d0-4d45-8675-4a3431ff4b03@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: kDF435k21YDW84XRqEj7pTuPnoIAN2qP
X-Proofpoint-GUID: kDF435k21YDW84XRqEj7pTuPnoIAN2qP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA0MDAyNyBTYWx0ZWRfXxnwHjfYx52Ap
 WKb5zKR1FYA5hg6qLxvTziGgI9i8+KwnMhsT2T3WbRt0nerpzeoPJc6s7UH5VatPHy4WaUm3Xab
 Qzsykv1CNtbN27mC4jOhyqFyOF2oUg3DcNXMG33/uZusLSSvdlcx/ULSXGBRhHjJr5o9lNgUV+D
 5Wp0aww8YoDIU3pA5I0DulJrj4GZJIHRwwTVwQt6w6MV85rXWFFXREu4ZVf1XOzB7S2smXGW/gS
 FMYFRxgY68QWkgm7cDKq5Z3IpIczc2vhyZEWJWAO5p4po4Si0u+Q4oU3qDT+VcDsY5TgzL1eBPV
 d5DaoKCHPGkA6hOhIbdwTieTu9jUBfK/DEhmiF82Pv7eEszZ2EOrn0ZdstN/5ykcj6WKCMlQv7G
 sqc4AxZQVfxjjlvxCiqmZxI9KdAsGvkH0Wcyhx+QWeb272Sz/CRQJqseDry4YL/hpj4I0yCI6cW
 pC3+nuwFMC4r32PBjEw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA0MDAyNyBTYWx0ZWRfX4od7TU5ZrUbk
 y7aDIq6fZN6BANUwhcyrotb2e3I8vYfrLLTWOlzT01JaNGi9wjx8Y7dw0EzxmBlT9oeUw8nqA6S
 83b6D3qywYiU4MsXYkm3lTOXHhzJqZY=
X-Authority-Analysis: v=2.4 cv=PKc/P/qC c=1 sm=1 tr=0 ts=6a9a370e cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=7CQSdrXTAAAA:8 a=EUspDBNiAAAA:8
 a=ZptWdTKgE_tpimiw5rkA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-04_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1015 phishscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609040027



On 9/3/2026 9:23 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 03/09/2026 11:20, Ben Horgan wrote:
>> Hi Yin,
>>
>> On 11/08/2026 14:30, Yin Li wrote:
>>> struct resource uses an inclusive end address, so the correct size is
>>> end - start + 1. The previous calculation of end - start was off by one,
>>> resulting in a mapped window one byte smaller than the actual resource.
>>> Use resource_size() which correctly computes end - start + 1.
>>>
>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>
>> I just got a kernel ci report for this one which asks for tags:
>>
>> Reported-by: kernel test robot <lkp@intel.com>
>> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
>>
>> It doesn't look to give a useful fixes tag though. I'd go with this as that's where the error was
>> introduced.
>>
>> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
>>
>> Looks good to me.
>>
>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> 
> Scratch that. As Ilpo points out,[1], there is no functional bug but just some misleading naming
> which never the less would be good to fix. This does require > in the warnings becoming >= though
> and there would be no need for fixes tag. Do you agree with this analysis?
> 
> Thanks,
> 
> Ben
> 
> [1]
> https://lore.kernel.org/lkml/03055fbc-281f-4ed9-9282-4853d560e17f@arm.com/T/#mdb57d40c888ff4ce656a9d9a00ecf5d99466530c
> 
> 

Hi Ben,

Thanks, and thanks to Ilpo for the detailed analysis.

Agreed — the current code is functionally correct because 
mapped_hwpage_sz holds the last mapped byte (end - start) rather than 
the real size, and the ">" check matches that.
My patch switched it to resource_size() but left the check as ">", which 
actually breaks that balance and introduces a real off-by-one — the ">" 
needs to become ">=" once the size is accurate. So there's no functional 
bug in the original code, and no Fixes tag is needed.

I'll update the patch to switch to resource_size() and change the
corresponding ">" checks to ">=" together, so the naming becomes
accurate while keeping the behaviour unchanged. I'll also reword the
commit message to describe this as a naming/readability cleanup rather
than a bugfix.


>>
>> Thanks,
>>
>> Ben
>>
>>> ---
>>>   drivers/resctrl/mpam_devices.c | 2 +-
>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>>> index 1e082fb60e30..5d1854d97371 100644
>>> --- a/drivers/resctrl/mpam_devices.c
>>> +++ b/drivers/resctrl/mpam_devices.c
>>> @@ -2296,7 +2296,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>>   			dev_err_once(dev, "Failed to map MSC base address\n");
>>>   			return ERR_CAST(io);
>>>   		}
>>> -		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>>> +		msc->mapped_hwpage_sz = resource_size(msc_res);
>>>   		msc->mapped_hwpage = io;
>>>   	} else {
>>>   		return ERR_PTR(-EINVAL);
>>>
>>
> 

-- 
Thx and BRs,
Yin

