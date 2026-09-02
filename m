Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 04BF54AA1E9
	for <driver-core@lists.linux.dev>; Wed,  2 Sep 2026 16:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788366157; cv=none; b=P1AIDAYiQ2ytd8ncaMy3DuiSJXkonZAoShApu56U7bnw0UjWu7+lkABNzyAhv9DXeBH+3sYVT2UaBYWREZVWHD48/qeBkqdoqI35oFgIJZRrASh2MffKyvS3LSZ5r9gYmW5feWMQEu1pnfnET4YQUXqSiY4OL2PPF5hczO42sOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788366157; c=relaxed/simple;
	bh=f7So4PD3SpWVkcMTym/ALZ8vV33+GGiW9Tn+04kGdXs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jTLW5OYN8nrdYEinZU7IdI5IMaYI1e/XmfJ9a/3hlelzANh4T9W9himhCBbm0+JtlH/ZYquZt0RHVgYoE2XbwaLNBxj+7skSD4fFyvQprcu0z+B6TBTMp9bmoNoC+WGjdNHcFYwRQfZA83ZPHiuCwa9m8ZTGHjOTFEwQT2kZRAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pwcrpkTi; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pwcrpkTi"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 97372165C;
	Wed,  2 Sep 2026 09:22:30 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 595503F882;
	Wed,  2 Sep 2026 09:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788366154; bh=f7So4PD3SpWVkcMTym/ALZ8vV33+GGiW9Tn+04kGdXs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pwcrpkTi9XgUFwKtd7d8RetimOzgVqcjPRL0NQ7xqfCWiXec1X48RdCTgwWyfhGrV
	 b3RmIXXPF7I1HV7pLvAh7Xi5Yf5njXs+9Nzkk8Bhx4BRJBF01z2/k3mEofMu0rkYl6
	 33K+d7vi9eoLsgjbxGeiWHqmBQn8Vo/gX5FrXtPU=
Message-ID: <bca22f76-4fc0-4a99-8648-4f148de7246d@arm.com>
Date: Wed, 2 Sep 2026 18:22:29 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 08/15] arm_mpam: Fix ris_idx type to prevent range
 check bypass on truncation
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
 <20260811-mpam-resctrl-dt-knp-support-v1-8-ea6397bead59@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-8-ea6397bead59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/11/26 15:30, Yin Li wrote:
> The RIS index is read from device tree as u64 via of_property_read_reg(),

what does it do that using an u64, actually? Do you refer to the reg 
property of the ris subnode, which has a limit of 0xf in the DT binding? 
So shouldn't it be an u8 all along, and we fix the types up at the 
sources, rather than widening everything needlessly to u64?

Cheers,
Andre

> but was narrowed to u32 when passed to mpam_dt_parse_resource() and
> further to u8 when passed to mpam_ris_create(). A value exceeding
> MPAM_MSC_MAX_NUM_RIS could be silently truncated to a small index that
> passes the range check in mpam_ris_create_locked(), leading to incorrect
> RIS creation.
> 
> Widen the ris_idx parameter through mpam_dt_parse_resource(),
> mpam_ris_create_locked(), and mpam_ris_create() to u64 so the value
> is preserved until the range check in mpam_ris_create_locked() rejects
> out-of-range indices.
> 
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 6 +++---
>   include/linux/arm_mpam.h       | 4 ++--
>   2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index cc9fa1d78925..1e082fb60e30 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -260,7 +260,7 @@ static int mpam_dt_count_msc(void)
>   }
>   
>   static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
> -				  u32 ris_idx)
> +				  u64 ris_idx)
>   {
>   	int err = 0;
>   	u32 class_id = 0;
> @@ -712,7 +712,7 @@ static int mpam_ris_get_affinity(struct mpam_msc *msc, cpumask_t *affinity,
>   	return 0;
>   }
>   
> -static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
> +static int mpam_ris_create_locked(struct mpam_msc *msc, u64 ris_idx,
>   				  enum mpam_class_types type, u8 class_id,
>   				  int component_id)
>   {
> @@ -799,7 +799,7 @@ static void mpam_ris_destroy(struct mpam_msc_ris *ris)
>   		mpam_vmsc_destroy(vmsc);
>   }
>   
> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>   		    enum mpam_class_types type, u8 class_id, int component_id)
>   {
>   	int err;
> diff --git a/include/linux/arm_mpam.h b/include/linux/arm_mpam.h
> index f92a36187a52..30461cd71199 100644
> --- a/include/linux/arm_mpam.h
> +++ b/include/linux/arm_mpam.h
> @@ -39,10 +39,10 @@ static inline int acpi_mpam_count_msc(void) { return -EINVAL; }
>   #endif
>   
>   #ifdef CONFIG_ARM64_MPAM_DRIVER
> -int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
> +int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>   		    enum mpam_class_types type, u8 class_id, int component_id);
>   #else
> -static inline int mpam_ris_create(struct mpam_msc *msc, u8 ris_idx,
> +static inline int mpam_ris_create(struct mpam_msc *msc, u64 ris_idx,
>   				  enum mpam_class_types type, u8 class_id,
>   				  int component_id)
>   {
> 

