Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DBCF94AF9EB
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788441819; cv=none; b=Gb+HeJABCmjRlgYQnwn6YIEIGXm13j9bpokvS1YjArR3bnc3vr2ul5RliSRPf4UYEah+ZD8cyDg8OeDoKvA4yNptoeQUlZGsXw+HVZkMieEmUPkPPkJ1kWKA/Xe+bu2ncddzRy2MQg4hK2WVCt3ifWCI1N2azKTsUXqcbbz6LUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788441819; c=relaxed/simple;
	bh=O8sMn2ppI91Y754osbjuCyzH8ECqdf9tWjhkxKKHf8A=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=GO8kldIIUqI9Rs7WIY63N3MN20Dwp5q+hQ0NZ3TDTQwY5yPBrTdskopFG24BNQrK0srFjrQfo8oEwRdEVWT9ptM0hcz86RA5+jSZX5b6QciON0vP4ZFexycBhD726SlJ60SF4Q4theRZFUFjLEiMiUxg4RzbncIKvHJ/Su/x1Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=bLuBPrnc; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="bLuBPrnc"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DA8341596;
	Thu,  3 Sep 2026 06:23:20 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 957483F7D8;
	Thu,  3 Sep 2026 06:23:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788441804; bh=O8sMn2ppI91Y754osbjuCyzH8ECqdf9tWjhkxKKHf8A=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=bLuBPrncZsHnsNJ2WV8V/ss0nMCIR7afcbnhB2t046JK2pNV5kRYGOm0AwvuZkckW
	 suyBneKVBSXUKTGuGBa9agBpNaLwmTJs94OARrEDhyEP26vjChc+OnbgiEqEl1m6Pz
	 EhaVWbIHQhwViXP51OpDCqZxqj4kdFESqrjkX5y4=
Message-ID: <74b52fcc-10d0-4d45-8675-4a3431ff4b03@arm.com>
Date: Thu, 3 Sep 2026 14:23:20 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 09/15] arm_mpam: Fix MSC MMIO window size to use
 resource_size() instead of end - start
From: Ben Horgan <ben.horgan@arm.com>
To: Yin Li <yin.li@oss.qualcomm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>, James Morse <james.morse@arm.com>,
 Bjorn Andersson <andersson@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
 driver-core@lists.linux.dev, Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>, Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
 <93eac14a-5ee5-40c8-accf-f623cf0e76de@arm.com>
Content-Language: en-US
In-Reply-To: <93eac14a-5ee5-40c8-accf-f623cf0e76de@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yin,

On 03/09/2026 11:20, Ben Horgan wrote:
> Hi Yin,
> 
> On 11/08/2026 14:30, Yin Li wrote:
>> struct resource uses an inclusive end address, so the correct size is
>> end - start + 1. The previous calculation of end - start was off by one,
>> resulting in a mapped window one byte smaller than the actual resource.
>> Use resource_size() which correctly computes end - start + 1.
>>
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> 
> I just got a kernel ci report for this one which asks for tags:
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
> 
> It doesn't look to give a useful fixes tag though. I'd go with this as that's where the error was
> introduced.
> 
> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
> 
> Looks good to me.
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Scratch that. As Ilpo points out,[1], there is no functional bug but just some misleading naming
which never the less would be good to fix. This does require > in the warnings becoming >= though
and there would be no need for fixes tag. Do you agree with this analysis?

Thanks,

Ben

[1]
https://lore.kernel.org/lkml/03055fbc-281f-4ed9-9282-4853d560e17f@arm.com/T/#mdb57d40c888ff4ce656a9d9a00ecf5d99466530c


> 
> Thanks,
> 
> Ben
> 
>> ---
>>  drivers/resctrl/mpam_devices.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 1e082fb60e30..5d1854d97371 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -2296,7 +2296,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>>  			dev_err_once(dev, "Failed to map MSC base address\n");
>>  			return ERR_CAST(io);
>>  		}
>> -		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
>> +		msc->mapped_hwpage_sz = resource_size(msc_res);
>>  		msc->mapped_hwpage = io;
>>  	} else {
>>  		return ERR_PTR(-EINVAL);
>>
> 

