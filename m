Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5787349B20B
	for <driver-core@lists.linux.dev>; Wed,  2 Sep 2026 13:16:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788354987; cv=none; b=qiJLiK8OVqKsfRxw6XjJfhkbDsi2XQhwUEvAFZgqixZwJ3c2XZyqHbqyUeSXrBDzoqhfP/N/v96IqoAvqFMgSN4/8fGVSJOfLEJaxP+Mpuaz5/nX7GTm1eaWu/oU6FzaWGuiu6mui244oUewP24HAsSM1QVbahWSyijfQQFELbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788354987; c=relaxed/simple;
	bh=nZM6a7sRN8nf5e2sER84BlR+c03HLKK34Enpqkes2GM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t4FDaNWTQbU10hcizx2gybJWU6UXz4Fz6wFvu4h7QyV2g46SRD3C5qoTDNRFt4hupkIFMBxs+vXYiJ87tPirf4auixKYBq9zJaKKLReQ+qyMgwDYamGvz7cCi4oQgM94ntpcDpN1fc0RSfQBFl3rV3Nu0G+QJHikBEP/n+db+Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=FrinuvsG; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="FrinuvsG"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DCD83165C;
	Wed,  2 Sep 2026 06:16:20 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A30C93F85F;
	Wed,  2 Sep 2026 06:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788354984; bh=nZM6a7sRN8nf5e2sER84BlR+c03HLKK34Enpqkes2GM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FrinuvsGBjiqHG1fKHbjKVEc/tKXqp0wtshEmnfvUjyjLyTELzodoJkGmRzzJ1gFw
	 dlS+RVttkI/+NxV494zJEE89bioVbeUa4vQhe3Ebb2Ig0xYg7U5M3KyG5GBlWufJeX
	 S4urs7c71875WgziJfgKtHzFPOLDU09DaekDR3kY=
Message-ID: <bd59c8b4-6b29-494d-b540-8feed38d0955@arm.com>
Date: Wed, 2 Sep 2026 15:16:19 +0200
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
 Ben Horgan <ben.horgan@arm.com>, Bjorn Andersson <andersson@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
 driver-core@lists.linux.dev, Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>, Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/11/26 15:30, Yin Li wrote:
> struct resource uses an inclusive end address, so the correct size is
> end - start + 1. The previous calculation of end - start was off by one,
> resulting in a mapped window one byte smaller than the actual resource.
> Use resource_size() which correctly computes end - start + 1.

Yes, thanks for catching this and making a patch. We found this 
independently during other MPAM work, but no one got around to make a 
patch ;-)

> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

So this patch is independent from and non-conflicting with the DT work, 
so either Ben or James pick this one directly, or you put those kind of 
fixes first in the series, when you repost.

Cheers,
Andre

> ---
>   drivers/resctrl/mpam_devices.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 1e082fb60e30..5d1854d97371 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2296,7 +2296,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   			dev_err_once(dev, "Failed to map MSC base address\n");
>   			return ERR_CAST(io);
>   		}
> -		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
> +		msc->mapped_hwpage_sz = resource_size(msc_res);
>   		msc->mapped_hwpage = io;
>   	} else {
>   		return ERR_PTR(-EINVAL);
> 

