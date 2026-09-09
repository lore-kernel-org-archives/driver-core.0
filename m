Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BE60382395
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 10:11:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788948711; cv=none; b=CJkhuiz/IibP1zMACsEl8/tz/BvAlqH2GvlZjfsI55dLyjQMeE/2Ve2Y6TU2LxPKCKMKYAvF6vJEg5JN9r4p5DvPYAzcflYIT63VBRMi49HSlOgz71ExYvmgR9lpQP0UGT6T2au5rjne+92rw2mc6pxgHvtOPhe+tOXbBNmWSxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788948711; c=relaxed/simple;
	bh=Pm90fqTN/bT3nf+Km9eoOWQzRoC+9Q+m+Ct1x/Gi07o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AYIwvAsHRVe1KDnIvvTCACJ4Q+bNzA4Ub73w+NmqRLc3aKetkfBBGEKQ/JS7oUbWfPfpOsJKVGINALkB96gj5rF+UB6bRocWtBTsQNCb973rj4lOypVuzERsb7Ezu/GuCDb9Ug+cfHGU4LNiPmazgXNVNOIyL5CYOruNcwh1a7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=RQTqi4WR; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="RQTqi4WR"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8BB61691;
	Wed,  9 Sep 2026 03:11:44 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A9A653F528;
	Wed,  9 Sep 2026 03:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788948708; bh=Pm90fqTN/bT3nf+Km9eoOWQzRoC+9Q+m+Ct1x/Gi07o=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RQTqi4WRSF/Yk7OLtXkRqVkw+YoTNlYYaDp/VCtTgPCfxJnWPdzhtKt1Xr3cfkY5c
	 r1xRfvXW3+zu9Tyq57j5y4pbABEJK0lCgrY/0gBjgZAqrbTtEMXaLyfQcCHNBesCGs
	 Jk6lASSFon7hLW0NvFOx/OCc4nl/i2QGNvdqb77c=
Message-ID: <4d33f2da-8f56-407c-b0cc-805a3ab1d145@arm.com>
Date: Wed, 9 Sep 2026 11:11:44 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm_mpam: Fix MSC MMIO window size to use
 resource_size() instead of end - start
To: Yin Li <yin.li@oss.qualcomm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>, James Morse <james.morse@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 ilpo.jarvinen@linux.intel.com
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
 driver-core@lists.linux.dev, Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>, Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
 <93eac14a-5ee5-40c8-accf-f623cf0e76de@arm.com>
 <74b52fcc-10d0-4d45-8675-4a3431ff4b03@arm.com>
 <8e418149-bde1-46a8-bc82-6baeceb8b1a1@oss.qualcomm.com>
 <db6d6420-c06e-46a1-95a9-b7a7084ebd75@oss.qualcomm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <db6d6420-c06e-46a1-95a9-b7a7084ebd75@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Yin,

On 09/09/2026 10:25, Yin Li wrote:
> 
> 
> On 9/4/2026 11:05 AM, Yin Li wrote:
>>
>>
>> On 9/3/2026 9:23 PM, Ben Horgan wrote:
>>> Hi Yin,
>>>
>>> On 03/09/2026 11:20, Ben Horgan wrote:
>>>> Hi Yin,
>>>>
>>>> On 11/08/2026 14:30, Yin Li wrote:
>>>>> struct resource uses an inclusive end address, so the correct size is
>>>>> end - start + 1. The previous calculation of end - start was off by one,
>>>>> resulting in a mapped window one byte smaller than the actual resource.
>>>>> Use resource_size() which correctly computes end - start + 1.
>>>>>
>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>
>>>> I just got a kernel ci report for this one which asks for tags:
>>>>
>>>> Reported-by: kernel test robot <lkp@intel.com>
>>>> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3- lkp@intel.com/
>>>>
>>>> It doesn't look to give a useful fixes tag though. I'd go with this as that's where the error was
>>>> introduced.
>>>>
>>>> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
>>>>
>>>> Looks good to me.
>>>>
>>>> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
>>>
>>> Scratch that. As Ilpo points out,[1], there is no functional bug but just some misleading naming
>>> which never the less would be good to fix. This does require > in the warnings becoming >= though
>>> and there would be no need for fixes tag. Do you agree with this analysis?
>>>
>>> Thanks,
>>>
>>> Ben
>>>
>>> [1]
>>> https://lore.kernel.org/ lkml/03055fbc-281f-4ed9-9282-4853d560e17f@arm.com/T/
>>> #mdb57d40c888ff4ce656a9d9a00ecf5d99466530c
>>>
>>>
>>
>> Hi Ben,
>>
>> Thanks, and thanks to Ilpo for the detailed analysis.
>>
>> Agreed — the current code is functionally correct because the off-by-one
>> in "end - start" is cancelled out by the ">" checks, since
>> mapped_hwpage_sz effectively holds the last mapped byte rather than the
>> size. So there's no functional bug and no Fixes tag is needed.
>>
>> I'll update the patch to switch to resource_size() and change the
>> corresponding ">" checks to ">=" together, so the naming becomes
>> accurate while keeping the behaviour unchanged. I'll also reword the
>> commit message to describe this as a naming/readability cleanup rather
>> than a bugfix.
>>
>>
> 
> Hi Ben,
> 
> I looked into this more closely, and I think the situation is a bit
> different from previous analysis — could you and Ilpo double-check?
> 
> All three bounds checks have the access width included on the left-hand
> side, e.g.:
> 
>       WARN_ON_ONCE(reg + sizeof(u32) > msc->mapped_hwpage_sz);
> 
> Here "reg + sizeof(u32)" is the one-past-the-end offset of the write, so
> a legal access needs "reg + 4 <= size", i.e. the out-of-bounds condition
> is correctly "> size".
> 
> Take a 0x1000-sized window (valid offsets 0x000..0xFFF):
> 
>     - With the old value, mapped_hwpage_sz = end - start = 0xFFF (size - 1).
>     A write at reg = 0xFFC touches bytes 0xFFC..0xFFF — exactly the last
>     4 bytes, which is legal. But the check computes 0xFFC + 4 = 0x1000 >
>     0xFFF → true, so it falsely warns on a valid access. That's a real
>     off-by-one.
> 
>     - With resource_size() = 0x1000 (true size), the same access gives
>     0x1000 > 0x1000 → false, so it correctly passes, while an access at
>     reg = 0xFFD (0x1001 > 0x1000 → true) is correctly rejected.
> 
> So resource_size() fixes a genuine off-by-one here, and the ">" checks
> should stay as ">". Changing them to ">=" would break the reg = 0xFFC
> case (0x1000 >= 0x1000 → true) and wrongly reject a legal access.
> 
> So for the next version I plan to keep the resource_size() change, keep
> the ">" checks unchanged, and describe it as an off-by-one fix rather
> than a naming cleanup. Does this match what you and Ilpo see?

Yes. Thank you very much for taking the time and looking into this more closely.
It looks like I introduced the functional bug whilst upstreaming James' patches.

Ben

> 
> Best regards,
> Yin Li
> 
> 
> 
> 
>>>>
>>>> Thanks,
>>>>
>>>> Ben
>>>>
>>>>> ---
>>>>>   drivers/resctrl/mpam_devices.c | 2 +-
>>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ mpam_devices.c
>>>>> index 1e082fb60e30..5d1854d97371 100644
>>>>> --- a/drivers/resctrl/mpam_devices.c
>>>>> +++ b/drivers/resctrl/mpam_devices.c
>>>>> @@ -2296,7 +2296,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>>>>               dev_err_once(dev, "Failed to map MSC base address\n");
>>>>>               return ERR_CAST(io);
>>>>>           }
>>>>> -        msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>>>>> +        msc->mapped_hwpage_sz = resource_size(msc_res);
>>>>>           msc->mapped_hwpage = io;
>>>>>       } else {
>>>>>           return ERR_PTR(-EINVAL);
>>>>>
>>>>
>>>
>>
> 

