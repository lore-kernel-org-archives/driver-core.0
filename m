Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D2FD3C2BB4;
	Tue, 12 May 2026 15:51:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778601081; cv=none; b=RWhBHAYBxvdsTv+KL6xnqoHH3zVDztsTK6BYJGljoe1wizfIVaWSpxaMiwAMEMa+HlxHQEK8oqpUNVDsKtUrBoOiMwVWgZZWoT+DCUhyZe3dMEIk2p93JM4VhibNliM+4gsWe/Ph44EtZm4HWO38WBIOjDld5+4AkpTdbdHBW8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778601081; c=relaxed/simple;
	bh=OZdk7I5/tOC4M+HaFenANpPQ6VqaTc1ncZYoupPLnxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nB7FEp1ZCll6NhhIWIZCtPlSKy0tnK2kC3iWw3G/lszaSEV/7oUsBiYY8rtvTEAhr0FvFZq1PHrxztvG6FuKXFCss8aWT5BAW6AcpOiKX0R+bjmMGP7hNdK1IDWYVm/dR/UjrVx/KT/fQKMpI/ygkHdt/uabA7sDBYWfvJ9vUpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=MjEHQCBp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="MjEHQCBp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E0B6C2BCB0;
	Tue, 12 May 2026 15:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778601080;
	bh=OZdk7I5/tOC4M+HaFenANpPQ6VqaTc1ncZYoupPLnxs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MjEHQCBp+A0R0KVJCJPFLtmLpi8kKhNPsa+gzK09mVKNV/0zsE7/HIQebVmoNYV2n
	 KIz3TmHnMI7sDk6G3aQfoQU0vyIJ51u3ucNRCzg5Iudu5gv+tHCkLqYeqzczqZCl7K
	 ox8idSy3FoL+klcQOXreckSpZyC/DwSW8+52BYMY=
Date: Tue, 12 May 2026 17:51:25 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH RFC] arch_topology: Introduce nr_possible_packages
Message-ID: <2026051214-supermom-brim-4608@gregkh>
References: <20260512150505.43871-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260512150505.43871-1-feng.tang@linux.alibaba.com>

On Tue, May 12, 2026 at 11:05:05PM +0800, Feng Tang wrote:
> In multi-sockets platform, kernel or driver code may need the number
> of packages for chosing different code directions. Some architecture
> already provide such kind of interface like x86, which is being used
> in some architecture code and drivers.
> 
> Add similar interface 'nr_possible_packages' for platforms which can
> get package topology information by parsing ACPI tables in boot phase.
> 
> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> ---
>  drivers/base/arch_topology.c  | 21 +++++++++++++++++++++
>  include/linux/arch_topology.h |  5 +++++
>  2 files changed, 26 insertions(+)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a..796d8a7aceea 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -850,6 +850,16 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>  	return !!is_threaded;
>  }
>  
> +unsigned int nr_possible_packages __ro_after_init = 1;
> +EXPORT_SYMBOL(nr_possible_packages);

EXPORT_SYMBOL_GPL() please?

And you don't have a user for this, so we can't verify how it actually
works :(

thanks,

greg k-h

> +/*
> + * Assuming silicon has a sane package ID decoding method to not have
> + * an ID bigger than 255 (1 byte).

Is that a valid assumption?  What about packages bigger than 255?  Don't
we have those today?

> + */
> +#define MAX_PACKAGE_ID	255
> +DECLARE_BITMAP(package_id_mask, MAX_PACKAGE_ID + 1);
> +
>  /*
>   * Propagate the topology information of the processor_topology_node tree to the
>   * cpu_topology array.
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
>  	/*
> @@ -927,6 +944,10 @@ __weak int __init parse_acpi_topology(void)
>  
>  	cpu_smt_set_num_threads(max_smt_thread_num, max_smt_thread_num);
>  	xa_destroy(&hetero_cpu);
> +
> +	/* Count the number of possible packages in system */
> +	nr_possible_packages = bitmap_weight(package_id_mask, MAX_PACKAGE_ID + 1);
> +	pr_info("ACPI: System has %u Package(s) detected\n", nr_possible_packages);

Why "P" and not "p"?


>  	return 0;
>  }
>  
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index ebd7f8935f96..dee076cc9c7a 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -111,4 +111,9 @@ static inline bool topology_core_has_smt(int cpu) { return false; }
>  
>  #endif /* CONFIG_GENERIC_ARCH_TOPOLOGY */
>  
> +
> +#if defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
> +extern unsigned int nr_possible_packages;
> +#endif

Why the ifdef?

thanks,

greg k-h
