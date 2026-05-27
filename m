Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B79B31A062;
	Wed, 27 May 2026 13:53:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779890010; cv=none; b=TCCa55h/Wk51tfiIvDlvrdnod7fCxq99pE7m/TSyR9SStCIs98sK4Jno+1AYKzTREmURUZgHh0N7yR2zGy/Xx4yQ98uFW+b+Wc/qK7FjiBoUG+OSOoJMCLFK/opdFbuolwzZwI7y6/KgNiOBotThp2iDMVTQAyd2RD4/idop55E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779890010; c=relaxed/simple;
	bh=wQrDYwwXUzlC3owq5kczjhRMPdZageEFu6sAV19f5ew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iLHScW7qaUEfItCF7ypUZXf3a4uff694nudtgzTOCAegO8eAFuioxiN+OYCdkHN2GCzdNxEPxbWtUHGZXIznuFvcMxtiEzU7ioi5bUgACIXpzeeUfIbbIwevpQ2FkTcJtCve7alQ0F3BB5dBlXWdqKeJqrJF06wV6H/YxjQEquM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sqs7zpoI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sqs7zpoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5448C1F000E9;
	Wed, 27 May 2026 13:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779890008;
	bh=Ln0K5gJCQsINMaMJ94HhY61SjAdGq2kFmWabbHVyqm0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sqs7zpoI74g5sxlHBJal9M2fKPvgH+c+IaCKdsbkxdF9PInumsgzZSXPerYw3mmPU
	 42lmuAnW2i7wUkSOAIxN07+lR4+KKyqADqetTkRxiPg264q7cuQYR16xxeWylWcE7z
	 i8jWIs3iNzOrBflMBXxzjjJSVTQ90OLYPkyKn7MrqLjjur//fixZMZXwLM+iaN/I+P
	 ZVZAZV/ERjE1DSk4hqEj6urVIN5uI9Cbm6/RUwnSVbDO6EENnIJFH3FFEchD+dIKPl
	 I+D1ZRFf13l3gdJOorYavA36XVq37p5uyYboCUeRubFNP7JvRW3XIFhi5DdEMQSrpj
	 CoJ0o0VDK1J2g==
Date: Wed, 27 May 2026 14:53:24 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v1] arch_topology: Introduce nr_possible_packages
Message-ID: <20260527-organic-tentacled-ostrich-857e0d@sudeepholla>
References: <20260515144435.93035-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260515144435.93035-1-feng.tang@linux.alibaba.com>

On Fri, May 15, 2026 at 10:44:35PM +0800, Feng Tang wrote:
> In multi-sockets platform, kernel or driver code may need the number
> of packages for chosing different code directions. Some architecture
> already provide such kind of interface like x86, which is being used
> in some architecture code and drivers.
> 
> Add similar interface 'nr_possible_packages' for platforms which can
> get package topology information by parsing ACPI tables in boot phase,
> which was verified to show the correct number of packages on some
> 1-socket and 2-sockets production arm64 servers from different vendors.
> 

Sorry, but without a clear demonstration of how and where you plan to use
this, it is very difficult to provide meaningful feedback or review this patch
in isolation.

I am concerned that this approach may be based on another architecture, while
arm64 might have a better alternative due to how the firmware description is
structured.

Please provide more details so I can review this properly.

> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> ---
> Changelog:
> 
>   since RFC:
>       * use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL (Greg)
> 	  * change the possible max package ID to 2047 (Greg)
> 	  * remove the CONFIG_ARM64/RISCV limit for 'nr_possible_packages' (Greg)
> 	
>   RFC: https://lore.kernel.org/lkml/20260512150505.43871-1-feng.tang@linux.alibaba.com/ 
> 
>  drivers/base/arch_topology.c  | 21 +++++++++++++++++++++
>  include/linux/arch_topology.h |  1 +
>  2 files changed, 22 insertions(+)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a..d799ba808b43 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -830,6 +830,16 @@ void remove_cpu_topology(unsigned int cpu)
>  	clear_cpu_topology(cpu);
>  }
>  
> +unsigned int nr_possible_packages __ro_after_init = 1;
> +EXPORT_SYMBOL_GPL(nr_possible_packages);
> +
> +/*
> + * Assuming silicon has a sane package ID decoding method to not have
> + * an ID bigger than 2047
> + */
> +#define MAX_PACKAGE_ID	2047
> +DECLARE_BITMAP(package_id_mask, MAX_PACKAGE_ID + 1);
> +
>  #if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
>  struct cpu_smt_info {
>  	unsigned int thread_num;
> @@ -912,6 +922,13 @@ __weak int __init parse_acpi_topology(void)
>  		cpu_topology[cpu].cluster_id = topology_id;
>  		topology_id = find_acpi_cpu_topology_package(cpu);
>  		cpu_topology[cpu].package_id = topology_id;
> +
> +
> +		if (topology_id >= 0 && topology_id <= MAX_PACKAGE_ID)
> +			bitmap_set(package_id_mask, topology_id, 1);
> +		else
> +			pr_warn("ACPI: abnormal package ID: %d !\n",
> +				topology_id);
>  	}
>

MAX_PACKAGE_ID is set to 2047 yet it reads from PPTT which has no such
restriction. So it completely falls apart there as UID is just 32-bit
number IIUC. If UID is not present we compute offset which is sparse
and even that can be > 2047.

>  	/*
> @@ -927,6 +944,10 @@ __weak int __init parse_acpi_topology(void)
>  
>  	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>  	xa_destroy(&hetero_cpu);
> +
> +	/* Count the number of possible packages in system */
> +	nr_possible_packages = bitmap_weight(package_id_mask, MAX_PACKAGE_ID + 1);
> +	pr_info("ACPI: System has %u package(s) detected\n", nr_possible_packages);
>  	return 0;
>  }

IIUC x86 does not expose raw firmware package IDs as an array bound.  It builds
topology domain bitmaps and derives dense logical package IDs from them.

>  
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index ebd7f8935f96..960045e6ac05 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -105,6 +105,7 @@ static inline bool topology_core_has_smt(int cpu)
>  	return cpu_topology[cpu].thread_id != -1;
>  }
>  
> +extern unsigned int nr_possible_packages;

It does not provide a logical package ID mapping corresponding to the count.
A consumer that uses nr_possible_packages for allocation and
topology_physical_package_id(cpu) for indexing can still index out of bounds
on sparse ACPI Processor IDs or on PPTT offset-based IDs.

-- 
Regards,
Sudeep
