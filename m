Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374A326D4C3
	for <driver-core@lists.linux.dev>; Sat, 12 Sep 2026 00:55:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789174534; cv=none; b=a/GikhRyIeUr+wzPkmR0mm5y4v1CZrOPyRiL7eyAes87D1vWJDQOaHIYqBhaOWOVJwOKWc2WjBzBC239gf0caQf03e7kVlikjIVaU8UoRFjiN9cJLZ2+/GwrpaazfpUAzH+eUKTVT7n9xhQFOinvF3dhnuuuxnXjh+MyDx4jG7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789174534; c=relaxed/simple;
	bh=zgMYemYJf+nra3NgLmztzLjupl6y5L0a2pMQlK6ootE=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RCHr6/gHwX2u3heTo3G2IRLV7poDW+2FsOZgxfYy1pQGbC7Pq0M0/O4n9Rm8EQK6t0Y/77dr0UkYONSUdPVKykgEajqfWBLTb+iLhYHrqToCRKZR/Ty1FJjs2q2uMavdDYaQ1aJufYPTePqc8EdFOQibq0NCgDzstwBrsdhEvIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d6VQVyQR; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d6VQVyQR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789174531; x=1820710531;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zgMYemYJf+nra3NgLmztzLjupl6y5L0a2pMQlK6ootE=;
  b=d6VQVyQRY0DOCqvP4uZKf/A0c+52DLphVHnuhbYHBYUiodHyssWay9Qt
   c5OleEWHlmcddcOIi08aMucOgF/syOu1pMRvTKUrKPeIzlCmocvo4MGRq
   Qdc98WlYM/DClvnvCtIhKJfWRPA56Zk0pP8riTuOdmGSoK15XomuRsVbI
   w4pFB4soPAW1lpgxvB++t+frWbmLv01ITcynxAqAr5fH3PlZSFDNEg48j
   B69uAbX0WR/CQ0vlhTn39S6I/A25k364UK5+6mutuB1HDUVwd+rGVtSye
   CDgEV+Eg+K+rLxnAm4d0dOeW3vMmdaYTrEs2k7A8eZUKDjSEhf9yqfuqD
   A==;
X-CSE-ConnectionGUID: UM7KAILbSmKP8dqew36YcA==
X-CSE-MsgGUID: PWysDt5jTsaMS0W4uj/UGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11902"; a="112410015"
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="112410015"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:55:31 -0700
X-CSE-ConnectionGUID: AcBHsqDGRNKWDuv8DXddqw==
X-CSE-MsgGUID: ULa/oeTOS+WX7M85NIUxag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,98,1787036400"; 
   d="scan'208";a="301967444"
Received: from schen9-mobl4.amr.corp.intel.com (HELO [10.125.108.51]) ([10.125.108.51])
  by orviesa002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:55:30 -0700
Message-ID: <8da2c1b91baf26b89b37e9cb6ea38af8c4f807cf.camel@linux.intel.com>
Subject: Re: [PATCH v2] sched/cache: Refresh LLC capacity across CPU hotplug
From: Tim Chen <tim.c.chen@linux.intel.com>
To: Davi Chaves Azevedo <davichazbh@gmail.com>, peterz@infradead.org, 
	mingo@redhat.com
Cc: Chen Yu <yu.c.chen@intel.com>, Vincent Guittot
 <vincent.guittot@linaro.org>,  Valentin Schneider	 <vschneid@redhat.com>, K
 Prateek Nayak <kprateek.nayak@amd.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich	 <dakr@kernel.org>, chen.yu@linux.dev,
 driver-core@lists.linux.dev, 	linux-kernel@vger.kernel.org
Date: Fri, 11 Sep 2026 17:55:30 -0700
In-Reply-To: <20260911220229.1368887-1-davichazbh@gmail.com>
References: <20260911134825.420748-1-davichazbh@gmail.com>
	 <20260911220229.1368887-1-davichazbh@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Fri, 2026-09-11 at 19:02 -0300, Davi Chaves Azevedo wrote:
> The scheduler scales LLC capacity by the fraction of cache-sharing CPUs
> covered by a domain:
>=20
>   llc_bytes =3D cache_size * span_weight / shared_weight
>=20
> During CPU teardown, sched_cpu_deactivate() rebuilds scheduler domains
> before cacheinfo_cpu_pre_down() removes the CPU from shared_cpu_map. The
> new domains therefore use the old sharing weight. The later call to
> sched_update_llc_bytes() looks up the departing CPU's sd_llc, which has
> already been detached, and returns without correcting the surviving CPUs.
>=20
> On a Ryzen 5 7535U with twelve logical CPUs sharing a 16 MiB LLC,
> offlining one SMT sibling left the remaining CPUs with:
>=20
>   llc_bytes =3D floor(16777216 * 11 / 12) =3D 15379114 bytes
>=20
> The correct capacity is still 16777216 bytes. On systems with active
> cache-aware scheduling, an underestimated capacity can cause
> exceed_llc_capacity() to reject aggregation for a process whose footprint
> would fit. Unchanged cpuset partitions sharing the physical cache can
> also retain stale capacity when a CPU comes online in another partition.
>=20
> Pass the cache-sharing mask already retained by cacheinfo to the
> scheduler update. Refresh every surviving CPU using its own LLC domain
> so that each partition receives the correct share. This also preserves
> the correction needed as cache-sharing maps grow during boot.
>=20
> Keep the existing CPU-hotplug and scheduler-domain synchronization. The
> update remains on the hotplug path; no steady-state scheduling operation
> or persistent allocation is added.
>=20


Thanks.  The patch looks good to me.

Tim

> Fixes: 7030513a0877 ("sched/cache: Calculate the LLC size and store it in=
 sched_domain")
> Signed-off-by: Davi Chaves Azevedo <davichazbh@gmail.com>
> Reviewed-by: Chen Yu <yu.c.chen@intel.com>
> ---
> Changes in v2:
>   - Restore the original boot-time shared_cpu_map explanation, as Chen Yu
>     suggested, alongside the CPU-offline and cpuset-partition rationale.
>     No functional changes from v1.
>   - Add Chen Yu's Reviewed-by tag and document his multi-LLC testing.
>=20
> v1:
> https://lore.kernel.org/r/20260911134825.420748-1-davichazbh@gmail.com
> Review:
> https://lore.kernel.org/r/a3433e6a-0d1f-44a8-99bd-bc63d1a15913@intel.com
>=20
> The issue was identified by tracing the scheduler/cacheinfo teardown
> ordering, then checking live llc_bytes values using the running kernel's
> BTF layout and /proc/kcore.
>=20
> Local validation performed for v1 (no functional changes in v2):
>   - Reproduced the stale value on 7.2.3-arch1-3 on the Ryzen system above=
.
>     The patched kernel retained 16777216 bytes on every surviving CPU.
>   - Ten SMT-thread and ten whole-core hotplug cycles passed on the patche=
d
>     kernel, including capacity checks after each removal and restoration.
>     The existing limited CPU-hotplug selftest also passed.
>   - Source-level state fixtures: five failures in eight scenarios before
>     the fix, eight passes after it. These cover partition changes, unequa=
l
>     spans, sparse CPU IDs and boot-time map growth, but not concurrency.
>   - Full x86-64 baseline and patched bzImage/modules builds passed with
>     matched configs apart from LOCALVERSION. Focused ARM64, x86 without
>     CONFIG_SCHED_CACHE, and x86 UP builds also passed.
>=20
> Thanks to Chen Yu <yu.c.chen@intel.com> for the additional verification
> and review. He reproduced the issue and confirmed that v1 restored the
> expected sd->llc_bytes on:
>   - AMD Ryzen 8945HX: two LLCs, eight cores per LLC.
>   - Xeon: four LLCs per node.
>=20
> The local tests used a single-LLC host; Chen Yu reported the multi-LLC
> results above. These checks validate LLC accounting.
> Builds and hotplug tests were not rerun for this comment revision.
>=20
>  drivers/base/cacheinfo.c       | 11 ++++++-----
>  include/linux/sched/topology.h |  4 ++--
>  kernel/sched/topology.c        | 22 +++++++++++++---------
>  3 files changed, 21 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/base/cacheinfo.c b/drivers/base/cacheinfo.c
> index 9f9c72727a05..7a47a392568a 100644
> --- a/drivers/base/cacheinfo.c
> +++ b/drivers/base/cacheinfo.c
> @@ -1040,9 +1040,10 @@ static int cacheinfo_cpu_online(unsigned int cpu)
>  	rc =3D cache_add_dev(cpu);
>  	if (rc)
>  		goto err;
> -	if (cpu_map_shared_cache(true, cpu, &cpu_map))
> +	if (cpu_map_shared_cache(true, cpu, &cpu_map)) {
>  		update_per_cpu_data_slice_size(true, cpu, cpu_map);
> -	sched_update_llc_bytes(cpu);
> +		sched_update_llc_bytes(cpu_map);
> +	}
>  	return 0;
>  err:
>  	free_cache_attributes(cpu);
> @@ -1059,10 +1060,10 @@ static int cacheinfo_cpu_pre_down(unsigned int cp=
u)
>  		cpu_cache_sysfs_exit(cpu);
> =20
>  	free_cache_attributes(cpu);
> -	if (nr_shared > 1)
> +	if (nr_shared > 1) {
>  		update_per_cpu_data_slice_size(false, cpu, cpu_map);
> -
> -	sched_update_llc_bytes(cpu);
> +		sched_update_llc_bytes(cpu_map);
> +	}
> =20
>  	return 0;
>  }
> diff --git a/include/linux/sched/topology.h b/include/linux/sched/topolog=
y.h
> index b5d9d7c2b8ad..f96812d71c51 100644
> --- a/include/linux/sched/topology.h
> +++ b/include/linux/sched/topology.h
> @@ -281,9 +281,9 @@ static inline int task_node(const struct task_struct =
*p)
>  }
> =20
>  #ifdef CONFIG_SCHED_CACHE
> -extern void sched_update_llc_bytes(unsigned int cpu);
> +extern void sched_update_llc_bytes(const struct cpumask *cpus);
>  #else
> -static inline void sched_update_llc_bytes(unsigned int cpu) { }
> +static inline void sched_update_llc_bytes(const struct cpumask *cpus) { =
}
>  #endif
> =20
>  #endif /* _LINUX_SCHED_TOPOLOGY_H */
> diff --git a/kernel/sched/topology.c b/kernel/sched/topology.c
> index 0248227d983a..3dab0253976f 100644
> --- a/kernel/sched/topology.c
> +++ b/kernel/sched/topology.c
> @@ -985,8 +985,8 @@ void sched_cache_active_set(void)
>  }
> =20
>  /*
> - * Update the bottom sched_domain's llc_bytes for @cpu and all its
> - * LLC siblings. Called from cacheinfo_cpu_online() or
> + * Update the bottom sched_domain's llc_bytes for @cpus sharing a physic=
al
> + * LLC. Called from cacheinfo_cpu_online() or
>   * cacheinfo_cpu_pre_down() with cpu hotplug lock held.
>   *
>   * Note: get_effective_llc_bytes() returns 0 on PowerPC.
> @@ -996,17 +996,13 @@ void sched_cache_active_set(void)
>   * and does not populates the per-CPU struct cpu_cacheinfo array
>   * that get_cpu_cacheinfo_llc() reads.
>   */
> -void sched_update_llc_bytes(unsigned int cpu)
> +void sched_update_llc_bytes(const struct cpumask *cpus)
>  {
>  	struct sched_domain *sd, *sdp;
>  	unsigned int i;
> =20
>  	sched_domains_mutex_lock();
> =20
> -	sdp =3D rcu_dereference_sched_domain(per_cpu(sd_llc, cpu));
> -	if (!sdp)
> -		goto unlock;
> -
>  	/*
>  	 * ci->shared_cpu_map is built incrementally as CPUs come
>  	 * online, so the first CPU in an LLC initially sees
> @@ -1014,14 +1010,22 @@ void sched_update_llc_bytes(unsigned int cpu)
>  	 * get_effective_llc_bytes().  Re-evaluating every LLC
>  	 * sibling on each online event corrects this once the full
>  	 * shared_cpu_map is known.
> +	 *
> +	 * The departing CPU's domains have already been detached when
> +	 * cacheinfo removes it. Use the surviving cache siblings instead.
> +	 * They may belong to different cpuset partitions, so use each CPU's
> +	 * own LLC domain to scale its share of the physical cache.
>  	 */
> -	for_each_cpu(i, sched_domain_span(sdp)) {
> +	for_each_cpu(i, cpus) {
> +		sdp =3D rcu_dereference_sched_domain(per_cpu(sd_llc, i));
> +		if (!sdp)
> +			continue;
> +
>  		sd =3D rcu_dereference_sched_domain(cpu_rq(i)->sd);
>  		if (sd)
>  			sd->llc_bytes =3D get_effective_llc_bytes(i, sdp);
>  	}
> =20
> -unlock:
>  	sched_domains_mutex_unlock();
>  }
> =20
> base-commit: 50d05c7c76c96b90462f24debacca971d2e86713
