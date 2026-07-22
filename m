Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E75B30ACF2;
	Wed, 22 Jul 2026 08:41:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784709719; cv=none; b=IK6z2U/nNecET1uvRSO9GJm5Xm8gPigvwwClp1oPWMcUPiq15JVOOYQwNWffQT+pCNCRTpIEhAf18bH2vCfY1pkjNdLZuxw1D0sZB7o1O3vVTAmDr6eHDmmJLEGmZHZJGhmna0xg7Rrzh+ebjeA9lRmHznPp0sKQZNwciBhQzho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784709719; c=relaxed/simple;
	bh=BRiZ9DcGHURuXz5vVW0tD3GiZDSePQom8Ja02WMMpjw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBDBib3X9OxU/PSxUOlZ2ouuTXabJvpZN2K21TZ7Meh9q6paus8bqXPIZmNtvsmyzy40YZyU9nPwEmwSSiHqIomVlmhlaxyXISjXoUyroJm9AyxpgR2W/95Ry/hVHSJ4kM9seHaggYqKD+9+73xjraBQibg0/GtFoXQcN0n11Zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VP95E+Gz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VP95E+Gz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F161F00A3A;
	Wed, 22 Jul 2026 08:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784709718;
	bh=pC3pNoC1tcfmBHiXrIw4UOSeNbRBDVwZSay1+VQy/N0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VP95E+GzotTi7wthlKVGwEZajCQM+zsZDrztI0pkT+Zeh2njyBlbM2TJ1OYjzoJjO
	 VikdJMx836C7QfmUIks7ALHoWry0aHK6kbUqUAdxPPU4QmJbUvP+3YDBpKBVm9v16z
	 mOwAwuxJMytOIgZTtoXD+jawAx3mj6yhwgKrDsOFuVgrjtnNmR7KGFhy1oIScCRoRT
	 MFaYZ4ds8E7ATCThljbrDohEJKUSrB+aQR7YiUTjfH8GRixHM8QhQjwDmHnvFbx+vM
	 F3z/2SQganKi1Psewi7HWq2BcllD8sHWiH7ztnZC6HFtrwj4XiNxkaljt/+lPfU6XV
	 uw4+U5mkMZQmQ==
Date: Wed, 22 Jul 2026 09:41:54 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Feng Tang <feng.tang@linux.alibaba.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2] arch_topology: Introduce nr_possible_packages
Message-ID: <20260722-wakeful-lemming-of-snow-04fe9d@sudeepholla>
References: <20260714054317.73219-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714054317.73219-1-feng.tang@linux.alibaba.com>

On Tue, Jul 14, 2026 at 01:43:17PM +0800, Feng Tang wrote:
> For multi-sockets platforms kernel or driver code may need the number
> of packages to chose different code directions. Some architecture
> already provides such kind of interface like x86, which is being used
> in its architecture code and drivers.
> 
> Add similar interface 'nr_possible_packages' for platforms which can
> get package topology information by parsing ACPI tables in boot phase,
> which was verified to show the correct number of packages on some
> 1-socket and 2-sockets production arm64 servers from different vendors.
> 
> It has been used locally by some arm64 PMU driver, and cross-socket
> timer-consistency check code, which are to be posted.
> 
> Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
> ---
>   since v1:
>       * fix the potential overflow issue for 32b package ID (Sudeep)
> 	  * add real use case in commit log (Sudeep)
> 
>   since RFC:
>       * use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL (Greg)
> 	  * change the possible max package ID to 2047 (Greg)
> 	  * remove the CONFIG_ARM64/RISCV limit for 'nr_possible_packages' (Greg)
> 
>   v1:  https://lore.kernel.org/lkml/20260515144435.93035-1-feng.tang@linux.alibaba.com/ 
>   RFC: https://lore.kernel.org/lkml/20260512150505.43871-1-feng.tang@linux.alibaba.com/ 
> 
> 
>  drivers/base/arch_topology.c  | 26 ++++++++++++++++++++++++++
>  include/linux/arch_topology.h |  5 +++++
>  2 files changed, 31 insertions(+)
> 
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a..2ee27cc05b6b 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -850,6 +850,29 @@ static bool __init acpi_cpu_is_threaded(int cpu)
>  	return !!is_threaded;
>  }
>  
> +unsigned int nr_possible_packages __ro_after_init;
> +EXPORT_SYMBOL(nr_possible_packages);
> +
> +static int package_ids[1 << CONFIG_NODES_SHIFT] __initdata;

Since all you need is just the total number of packages, this whole
array may not be required.

static unsigned int topology_count_packages(const struct cpumask *cpus)
{
	unsigned int cpu, prev, count = 0;
	int package_id;

	for_each_cpu(cpu, cpus) {
		package_id = cpu_topology[cpu].package_id;
		if (package_id < 0)
			continue;

		for_each_cpu(prev, cpus) {
			if (prev == cpu) {
				count++;
				break;
			}

			if (cpu_topology[prev].package_id == package_id)
				break;
		}
	}

	return count;
}

Something like this would suffice, no ?

-- 
Regards,
Sudeep
