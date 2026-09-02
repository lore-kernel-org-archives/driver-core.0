Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C079E4A3841
	for <driver-core@lists.linux.dev>; Wed,  2 Sep 2026 14:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788360645; cv=none; b=NaFjjsri+81hJD0p67pbi9iVPdifg49Mg3RXYf2KPzsOxMq28IO/WPRbYcncaSdNvfUSIPb1ZKQ/nz5fhRzvP6VxBRc1WhLCQg+8314Z/P3hPeQP60xosEYdpqkR2qzUB7jIfkny5F88mAJnuMPh1Bl5K7QXpE9yrUKNBG2dRnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788360645; c=relaxed/simple;
	bh=m0jny4wcFlIbbROvQ/Pj/W5LQgowElOjxlCFyylSeC8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IXXhpwKya3pLlZ0weZ81OVN7VsQK84mDow1H4plPiR3Sb9RH5QVbVqY5guAY9evkg35rvGJ9S782D//87cNCo7c4tMx3Tzf9/O0gYkY27e+rboXmBeXCsIhMrFYJrj4wKjZ+c0NOBlUjQpxaUauiZ8Z9ARsfPB0w4kbyy2LYUDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=WqrA6gTO; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="WqrA6gTO"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 25E4C165C;
	Wed,  2 Sep 2026 07:50:39 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 57F573F882;
	Wed,  2 Sep 2026 07:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788360642; bh=m0jny4wcFlIbbROvQ/Pj/W5LQgowElOjxlCFyylSeC8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WqrA6gTOlzJu3CsI2jdMMJr2Zts4so8JmcOtZeyDeE6DL33REl/Qmy2Af7HOUIwQb
	 IAvjxc2+B0rwmtJM+I6wdqkMb7OPbVx2of9wpdfd1lMW93gQuPBIbPSp7gLa3nQse2
	 K5GpLsD+hTyvUtDi5zTx8wJnApH8jtGs3Cwp46jE=
Message-ID: <99e2cbcb-993e-4f83-b7ec-c333407aabf9@arm.com>
Date: Wed, 2 Sep 2026 16:50:38 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/15] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
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
 <20260811-mpam-resctrl-dt-knp-support-v1-7-ea6397bead59@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-7-ea6397bead59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/11/26 15:30, Yin Li wrote:
> The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
> which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
> is defined as 16, so the check should use >= to reject index 16 and
> above. The previous > check incorrectly accepted index 16 as valid.

Indeed. Either the maintainers pick this one independently, or put it up 
front in any repost.

And add:
Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures 
for firmware described ris")

> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
>   drivers/resctrl/mpam_devices.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index ddc15249ec1e..cc9fa1d78925 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -725,7 +725,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>   
>   	lockdep_assert_held(&mpam_list_lock);
>   
> -	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
> +	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>   		return -EINVAL;
>   
>   	if (test_and_set_bit(ris_idx, &msc->ris_idxs))
> 

