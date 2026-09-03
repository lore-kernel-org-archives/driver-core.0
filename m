Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 90606476042
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 10:20:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788430863; cv=none; b=pKcHfKD1s/cQgPCbecoyfNfhypbCns8UiOEOeQIkTXfHbXwOwndtI7HK95NtP3G9TqUv0vY99wHydYCdfTWriB51tcVQdDUWP+Xnuup/5eelgi8hVVaSfzt1sueG/ECkg+DjymFiA6kAYdNjPPT8MLmWNDdw7+xPUJxsJr6koQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788430863; c=relaxed/simple;
	bh=uqwqtv4HZI5HpMsQoDCGWhq3u2CjHHMNfZIaOXsBz+E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OXUWJVVzoilLjIJKhDbPeD4UFwnhu/lvAhJu7JF9ihmsUXOS3XP6BBCSvq3suX7MXjeLy9XRg8WzL+e5ZL0mR1LtEHtzdnhagmLRQx6UoncnpfHCwQXFhM7qK4W9xm6jwt+DdQWv+/5a3AV7TrC0tVBMXVjeFGFK1mOu9EYhOqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=sIQGTAIK; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="sIQGTAIK"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E772F1596;
	Thu,  3 Sep 2026 03:20:51 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 755B83F673;
	Thu,  3 Sep 2026 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788430855; bh=uqwqtv4HZI5HpMsQoDCGWhq3u2CjHHMNfZIaOXsBz+E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sIQGTAIKcoJmeLHUa3POLXVs5VNl3vDJyyr9w6j6XJtJm2QiMUwsB96ED1BgHPlcI
	 s6d1TCUoVUP771ArHWeq9WhJYUqDEP6tVtNirIWo3UV2sxlV8UMTr3hogmY+ovPukE
	 uZwXYZ1gzsA+XgrC0Bi47ei+EEOXRAyVuIMI1TJ0=
Message-ID: <93eac14a-5ee5-40c8-accf-f623cf0e76de@arm.com>
Date: Thu, 3 Sep 2026 11:20:50 +0100
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
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
 driver-core@lists.linux.dev, Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>, Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yin,

On 11/08/2026 14:30, Yin Li wrote:
> struct resource uses an inclusive end address, so the correct size is
> end - start + 1. The previous calculation of end - start was off by one,
> resulting in a mapped window one byte smaller than the actual resource.
> Use resource_size() which correctly computes end - start + 1.
> 
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>

I just got a kernel ci report for this one which asks for tags:

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/

It doesn't look to give a useful fixes tag though. I'd go with this as that's where the error was
introduced.

Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")

Looks good to me.

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> ---
>  drivers/resctrl/mpam_devices.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 1e082fb60e30..5d1854d97371 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2296,7 +2296,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  			dev_err_once(dev, "Failed to map MSC base address\n");
>  			return ERR_CAST(io);
>  		}
> -		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
> +		msc->mapped_hwpage_sz = resource_size(msc_res);
>  		msc->mapped_hwpage = io;
>  	} else {
>  		return ERR_PTR(-EINVAL);
> 

