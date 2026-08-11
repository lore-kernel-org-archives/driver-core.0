Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 01EED4314B5
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 10:03:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786442597; cv=none; b=GHAysglCv5EPOvjXHuCms1WH4zs3NAGmhZkf4Rx4m8MDEqjmtOilq035u6YklhNVzwexdWUrYgIqof7tZKnCTR41dprsfCL+kwixPgdnW+8x0s+lpK3tEJwj+iEcjkuJ4XYBxa2+7dZTZcGykMl01QI9B8thn6NcdOIsNUmLJss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786442597; c=relaxed/simple;
	bh=kYPhLWKxR3+5jaSK8JPDXB+JKQ0jVQZ+rr8T0uNd6ak=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b+MwUlmrqyuHlqs+vRjQe4n5gOR4t2yYnTwbVhyRwhnb6twqBxM+jsD8JZ9oV9cqkYh2EbKX+hzvud9ND4oxc7HHweFTEEo7Iy/DNozCqHHCjiGfvaW8NulbXhR4WHFkjBddGmKoWX40iQfdq6WkatryohLPxRObO+wthvKYz4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=G7ZbLBmz; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="G7ZbLBmz"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AFC9014BF;
	Tue, 11 Aug 2026 03:03:03 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 651363F86F;
	Tue, 11 Aug 2026 03:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786442587; bh=kYPhLWKxR3+5jaSK8JPDXB+JKQ0jVQZ+rr8T0uNd6ak=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=G7ZbLBmzr2DWSirU7DLFNV/N2RKZb+F9Rz2obnyV/Zp7k0JBTIqmiM4dRAwbz+fDk
	 QWl8tZ1bAkow8brr4gY8owcEu7m2l0HnaNUYkmW0P2GDwOhWm2gAgcRqT15o2GUi9t
	 w0oQVv5RGBJeCdMzUTbX/giAbnDq/yjNbX+Ox5Qw=
Date: Tue, 11 Aug 2026 12:02:55 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Sean Wang <seanwang1@lenovo.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Xuewen Yan <xuewen.yan@unisoc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sumit Gupta <sumitg@nvidia.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v3] arm64: topology: add source check in
 arch_cpu_idle_enter()
Message-ID: <anrzT-ez3b7uYaCt@arm.com>
References: <20260811072830.10028-1-seanwang1@lenovo.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811072830.10028-1-seanwang1@lenovo.com>

On Tue, Aug 11, 2026 at 03:28:30PM +0800, Sean Wang wrote:
> arch_cpu_idle_enter() directly calls amu_scale_freq_tick() to update
> arch_freq_scale when a CPU enters idle. This bypasses the sft_data
> pointer check that topology_clear_scale_freq_source() relies on.
> 
> As a result, even after calling topology_clear_scale_freq_source()
> with SCALE_FREQ_SOURCE_ARCH to disable AMU-based frequency scaling,
> the arch_freq_scale value can still be modified by AMU counters when
> the CPU goes idle through the arch_cpu_idle_enter() path.
> 
> Add topology_is_scale_freq_source() helper to check whether a specific
> frequency scaling source is currently registered for a CPU. Use it
> in arch_cpu_idle_enter() to verify that AMU is the active source
> before calling amu_scale_freq_tick().
> 
> This ensures that topology_clear_scale_freq_source() properly
> disables AMU updates in both the tick path (already handled by
> topology_scale_freq_tick()) and the idle path.
> 
> Co-developed-by: Xuewen Yan <xuewen.yan@unisoc.com>
> Signed-off-by: Xuewen Yan <xuewen.yan@unisoc.com>
> Signed-off-by: Sean Wang <seanwang1@lenovo.com>
> ---
>  arch/arm64/kernel/topology.c  |  3 ++-
>  drivers/base/arch_topology.c  | 13 +++++++++++++
>  include/linux/arch_topology.h |  1 +
>  3 files changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index b32f13358fbb..1dbd8f4c3178 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -175,7 +175,8 @@ void arch_cpu_idle_enter(void)
>  
>  	/* Kick in AMU update but only if one has not happened already */
>  	if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> -	    time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))
> +	    time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)) &&
> +	    topology_is_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpu))
>  		amu_scale_freq_tick();
I'm not entirely convinced you gained a lot by that.
It's one additional check per each enter_idle for case where AMUs are the
source vs 2 additional check when it is not.
Will try to figure out smth less 'invasive'.

Aside: I should have probably asked that earlier, but I am not sure I do fully
understand the case we are trying to fix here.
The topology_set_scale_freq_source prefers arch source to others. So if the AMUs
were chosen to server as the source for the freq scale - I do not see why the
sfd would be changed. That would require calling sequence clear-set to get a
different source in place. I do understand the issue itself, though how did we
end up there in the first place ?

---
BR
Beata
>  }
>  
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a..6049e77bbe1d 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -127,6 +127,19 @@ void topology_clear_scale_freq_source(enum scale_freq_source source,
>  }
>  EXPORT_SYMBOL_GPL(topology_clear_scale_freq_source);
>  
> +bool topology_is_scale_freq_source(enum scale_freq_source source, unsigned int cpu)
> +{
> +	struct scale_freq_data *sfd;
> +	bool ret;
> +
> +	rcu_read_lock_sched();
> +	sfd = rcu_dereference_sched(*per_cpu_ptr(&sft_data, cpu));
> +	ret = (sfd && sfd->source == source);
> +	rcu_read_unlock_sched();
> +
> +	return ret;
> +}
> +
>  void topology_scale_freq_tick(void)
>  {
>  	struct scale_freq_data *sfd = rcu_dereference_sched(*this_cpu_ptr(&sft_data));
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
> index ebd7f8935f96..fb7c1fe74808 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -48,6 +48,7 @@ struct scale_freq_data {
>  void topology_scale_freq_tick(void);
>  void topology_set_scale_freq_source(struct scale_freq_data *data, const struct cpumask *cpus);
>  void topology_clear_scale_freq_source(enum scale_freq_source source, const struct cpumask *cpus);
> +bool topology_is_scale_freq_source(enum scale_freq_source source, unsigned int cpu);
>  
>  DECLARE_PER_CPU(unsigned long, hw_pressure);
>  
> -- 
> 2.25.1
> 
