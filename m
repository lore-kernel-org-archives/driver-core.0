Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44FD4457E73;
	Thu,  8 Oct 2026 21:29:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791494947; cv=none; b=DnvUZP0e1ljM5Mn30KOkiGznHAA4plsv9OZs++/gy8KQQzMNp4dF7Gb358jkwOFfPTTeMCOdN7cJZTojxqYoTuatHu/UQ8dOpH5FGIWBKkNUQhwrd6PfzrqPKvtuVIMgX8HdhV1SQocsbjncyTjLaj/un4Zsv1tToc23WQJiLLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791494947; c=relaxed/simple;
	bh=9BKg/bdILzELsR+B9gKHwEiKv+1K14ZPOpKFKEaHjZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TaE/fOcc5iniLx1B1HM9cTd8ZmQTUFjkHwWOSnoTerg09Rst7dqHIz+BkKbaH2WBUWxY1k3MJIo/tnn6g6qa8c/pM6IGQOwP8r6NLSBPHuMmkYWBAQM0C+LPySK44bumxC1KTb7JUtHcKAKduOMpsoVEttbfU9hZyiyk7CPulYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IazY9BWx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IazY9BWx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857AC1F000FF;
	Thu,  8 Oct 2026 21:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791494945;
	bh=8SA4/opENARrAagoJJT4/rXaDAIsl8p7wApmg0/2tAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=IazY9BWxH7Zc1jEXIEH9+UwooFCDZbmACjxhARxBnigGPSArZGb6gGxH0N8hhcjyH
	 UC3zPmPUS5K+WYyiT+zXe4PLgx6KRmfpT1lrvj/G/auBe42xeJwf2hqWNZ10xxfxb+
	 BRNVrzkeC8JxMwbthz9Q1TVmznSppMTv2RoOGhjWgSxAMS9XjKpae7SR9AZtfuGr3C
	 e99DUxJvA15TnDwiurpAPQ3XvO0rAhInl41lE+i15c3h1xkQGD/h51Snl2/tTdQwm/
	 YzTbi2Dp8bit+w2KHEh2CZRElS7fXZvwZeBiiIXkBkvcloeqX6Lj0cVx0WfzG3r/Uj
	 nW+tnYfABaHuQ==
Date: Thu, 8 Oct 2026 16:29:04 -0500
From: Rob Herring <robh@kernel.org>
To: Yin Li <yin.li@oss.qualcomm.com>
Cc: James Morse <james.morse@arm.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Jonathan Cameron <jic23@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Gavin Shan <gshan@redhat.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Drew Fustini <fustini@kernel.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
	ganapatrao.kulkarni@oss.qualcomm.com,
	Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
	Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
	linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v3 6/8] arm_mpam: Add support for memory controller MSC
 on DT platforms
Message-ID: <20261008212904.GA1450868-robh@kernel.org>
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-6-35196c2b43bf@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261008-mpam-resctrl-dt-knp-support-v3-6-35196c2b43bf@oss.qualcomm.com>

On Thu, Oct 08, 2026 at 02:41:15PM +0800, Yin Li wrote:
> From: Shanker Donthineni <sdonthineni@nvidia.com>
> 
> The MPAM DT path only handles cache MSCs. Memory-controller MSCs
> cannot be probed yet.
> 
> Add support to discover memory-controller MSCs from the device tree:
> derive the component id from the NUMA node and create a 'memory' class
> RIS, and treat a memory parent as accessible from all CPUs.

Where's an actual user?

> Signed-off-by: Shanker Donthineni <sdonthineni@nvidia.com>
> [ morse: split out of a bigger patch, added affinity piece ]
> Signed-off-by: James Morse <james.morse@arm.com>
> [ Yin Li: fix context offset conflicts; use of_node_get() for the memory
>   parent to avoid a refcount underflow; use u32 instead of unsigned long
>   for component_id and compare against ~0U ]
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 55 ++++++++++++++++++++++++++++++------------
>  1 file changed, 40 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 0640690eae2c..048d32e69f55 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -263,10 +263,12 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>  				  u8 ris_idx)
>  {
>  	int err = 0;
> -	u32 level = 0;
> -	u32 cache_id;
> +	u32 class_id = 0;
> +	u32 component_id = 0;
>  	struct device *dev = &msc->pdev->dev;
> +	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
>  	struct device_node *cache __free(device_node) = NULL;
> +	struct device_node *memory __free(device_node) = NULL;
>  	struct device_node *parent __free(device_node) = of_get_parent(np);
>  
>  	if (of_device_is_compatible(np, "arm,mpam-cache")) {
> @@ -275,27 +277,48 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>  			dev_err_once(dev, "Failed to read phandle\n");
>  			return -EINVAL;
>  		}
> +		type = MPAM_CLASS_CACHE;
> +
>  	} else if (of_device_is_compatible(parent, "cache")) {
>  		cache = of_node_get(parent);
> +		type = MPAM_CLASS_CACHE;
> +	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
> +		memory = of_parse_phandle(np, "arm,mpam-device", 0);
> +		if (!memory) {
> +			dev_err_once(dev, "Failed to read phandle\n");
> +			return -EINVAL;
> +		}
> +		type = MPAM_CLASS_MEMORY;
> +	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
> +		memory = of_node_get(parent);
> +		type = MPAM_CLASS_MEMORY;
>  	} else {
> -		/* For now, only caches are supported */
> -		cache = NULL;
> -		return err;
> -	}
> -
> -	err = of_property_read_u32(cache, "cache-level", &level);
> -	if (err) {
> -		dev_err_once(dev, "Failed to read cache-level\n");
> +		/*
> +		 * For now, only caches and memory controllers are
> +		 * supported.
> +		 */
>  		return err;
>  	}
>  
> -	cache_id = cache_of_calculate_id(cache);
> -	if (cache_id == ~0U) {
> -		dev_err_once(dev, "Failed to calculate cache-id\n");
> -		return -ENOENT;
> +	/* Determine the class and component ids, based on type. */
> +	if (type == MPAM_CLASS_CACHE) {
> +		err = of_property_read_u32(cache, "cache-level", &class_id);
> +		if (err) {
> +			dev_err_once(dev, "Failed to read cache-level\n");
> +			return err;
> +		}
> +		component_id = cache_of_calculate_id(cache);
> +		if (component_id == ~0U) {
> +			dev_err_once(dev, "Failed to calculate cache-id\n");
> +			return -ENOENT;
> +		}
> +	} else if (type == MPAM_CLASS_MEMORY) {
> +		err = of_node_to_nid(np);
> +		component_id = (err == NUMA_NO_NODE) ? 0 : err;
> +		class_id = MPAM_CLASS_ID_DEFAULT;
>  	}
>  
> -	return mpam_ris_create(msc, ris_idx, MPAM_CLASS_CACHE, level, cache_id);
> +	return mpam_ris_create(msc, ris_idx, type, class_id, component_id);
>  }
>  
>  static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
> @@ -2169,6 +2192,8 @@ static void update_msc_accessibility(struct mpam_msc *msc)
>  	} else {
>  		if (of_device_is_compatible(parent, "cache"))
>  			get_cpumask_from_cache(parent, &msc->accessibility);
> +		else if (of_device_is_compatible(parent, "memory"))
> +			cpumask_copy(&msc->accessibility, cpu_possible_mask);
>  		else
>  			dev_err_once(dev, "Cannot determine accessibility of MSC.\n");
>  	}
> 
> -- 
> 2.34.1
> 
