Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794901355;
	b=EC01lo+KgEbDj6Rh8P+o4eq0BvrnazEmJPAvzcI5HPaS60sMvgoyk391enuzyTnUHCK5
	 Gaz+FyTFNR/GusNqdrep8cIFA6nMWG6KsJW6qU9PtAZDmJ+hH9oAfaU7eW2Pr0YNXk+EY
	 EKmvZ0jG8Sb4CM8u5dPum/Tu7R4875Y0XH5yYgi0XAciaRyTTJBII7o3QkZbM5NrczPaT
	 sEOIhzFKe8jLpTsJgYqh4rG9unuZ2hHuKITvT9QIgcxiLkNqq179RrhDv0rRKx3yMOzaP
	 QXHZ6WtoAXKYLPFK64dObqrzUpsWhnZGAlK9a2To+iyNZ8LXPNutu/qChkwZ1oXLokg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794901355;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:Content-Transfer-Encoding:In-Reply-To:
	 Organization;
	bh=dMx+tOseMam46SgmfM9cvERzRhYAz0pOaNb4GxykaIk=;
	b=UZjNBkoQ7dHvownNWdFPFawuxeDvFUgMuRH3Ho1PGGH9wGGTliWk6vh/XOMyvTB6dCyD
	 GIYzW2S4moq14w3r74qzFW11AQnvPcjrrOyxX18m02jOZNjUDTgGXLHfsqx+Hx4NEY/00
	 6o3zxR3jxrJATOcyEX12d6/kqR637L9BSE0WuBpOkfNfBoQg4RUKWb37+pdFjvtgYPFGW
	 TBF3UU1g5eT2sWpUydJBq+M1bR1I6qsGa8jM8IyWbx82TqXtm71GuRY4LyTWR98FieAWV
	 DhqJuPQubN1VPKTv/WsQZs4w4OvLbqtiHxiCP7QA/WoSGx0XTz9jAquoWadS4OcKDYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.intel.com;
	spf=pass smtp.mailfrom=linux.intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fv+gQFSm;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01119606A332
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 07:42:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 01119606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fv+gQFSm
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794901355; x=1826437355;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=AsTisYS88CyF1D2XKlMoI1xuwTYcxN5zMHAD5L3nQVs=;
  b=fv+gQFSm0lMPokE2MttipV2ZVFMndDGqwYjCdcO0JshW4TPuPkwibiHZ
   ro666Tbu2jysSxsOV4drqfCl9inJnRKZ9Q1b+dBo25ZFKmymQNgjy55xQ
   xV5X5kUw0wICT9wUTwtG0isZRHW+IYs8ISs/6z+Imw03akGBcJAGlPTjP
   tSYrvCOA2m+0FY7/kRAYlbmgVAbcIqO45SNVUnia9YR2kf6Jw0hUUo5AQ
   N2TtRBvS5v9sZQeOaQYvfYbgr09de6EkzqE/EKWlV8UwdTfz3RTrC35XR
   jZudeGeqngDFuLKpLkHa7K27nEXkpREnb2aG5PmAWdZfdypMhD9whOhsX
   w==;
X-CSE-ConnectionGUID: HCR0XvqjTqGafvcTF7tEBw==
X-CSE-MsgGUID: bwRUvTiwTban0B4iEFuDLg==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3675287"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3675287"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 23:42:34 -0800
X-CSE-ConnectionGUID: +ZzAkOxcQvm+yatLfSznfw==
X-CSE-MsgGUID: BQJbNDbeRgmT9vPLE3XTJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9985124"
Received: from ettammin-mobl3.ger.corp.intel.com (HELO localhost) ([10.245.245.254])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 23:42:27 -0800
Date: Tue, 17 Nov 2026 09:42:24 +0200
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Leo Yan <leo.yan@arm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Jeremy Linton <jeremy.linton@arm.com>,
	Marc Zyngier <maz@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@arm.com>,
	James Clark <james.clark@linaro.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Al Grant <al.grant@arm.com>, "Johnny.Fan" <johnny.fan@cixtech.com>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org
Subject: Re: [PATCH 1/8] device property: Add firmware node IRQ affinity
 callbacks
Message-ID: <avwFYMdr7g4r6Z9y@ashevche-desk.local>
References: <20261116-acpi_arm_pmu_registration_hmp-v1-0-0371d4eca626@arm.com>
 <20261116-acpi_arm_pmu_registration_hmp-v1-1-0371d4eca626@arm.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261116-acpi_arm_pmu_registration_hmp-v1-1-0371d4eca626@arm.com>
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6
 krs, Bertel Jungin Aukio 5, 02600 Espoo

On Mon, Nov 16, 2026 at 06:21:28PM +0000, Leo Yan wrote:
> Platform IRQ affinity lookup currently selects the OF or ACPI helper
> directly. Add fwnode_irq_get_affinity() and an irq_get_affinity operation
> implemented by both firmware types.
> 
> Use the new helper for platform devices, preserving the existing fallback
> to cpu_possible_mask when affinity information is unavailable.

From this commit message it's unclear why we do that. Is it any helpful in the
future? If yes, for what?

...

> static const struct cpumask *get_irq_affinity(struct platform_device *dev,

>  {
>  	const struct cpumask *mask = NULL;
>  #ifndef CONFIG_SPARC

> -	struct fwnode_handle *fwnode = dev_fwnode(&dev->dev);
> -

Might be unneeded churn — you can leave these two lines being untouched.

> -	if (is_of_node(fwnode))
> -		mask = of_irq_get_affinity(to_of_node(fwnode), num);
> -	else if (is_acpi_device_node(fwnode))
> -		mask = acpi_irq_get_affinity(ACPI_HANDLE_FWNODE(fwnode), num);

> +	mask = fwnode_irq_get_affinity(dev_fwnode(&dev->dev), num);

	mask = fwnode_irq_get_affinity(fwnode, num);

>  #endif

>  	return mask ?: cpu_possible_mask;

But I understand the point as we have only a single user left. So I am not
objecting the proposed approach, just pointed out on an alternative.

...

> +++ b/include/linux/fwnode.h

>  struct fwnode_operations;
>  struct device;
> +struct cpumask;

Yes, it's a bit disordered, can you place the new one before the 'device'
to follow alphabetical order?

-- 
With Best Regards,
Andy Shevchenko


