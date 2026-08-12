Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 484DC432BC2
	for <driver-core@lists.linux.dev>; Wed, 12 Aug 2026 11:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786532562; cv=none; b=RZVwweZvpaYwulgJoq5aS8HsGqDlSdiSSdBn2KsxfHXB+tBx9c5IMKRq1uQoy0hxSi5iMNPebk7aeKgc/gBY6DBngLERZEoaPLGy9kR6BKrZwqzAuYkFX5UHojLVGmqYzN3NqokEIEkUKAyPEf0/pzp4l3lVryo4gqziK5RYTSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786532562; c=relaxed/simple;
	bh=mdrIGZjICmq0LxOwQ6YiH5ZpPrFH3mTO0IlhyWlkIDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aKF00+d6YXdCd6jR8oCJ89LuyPun6OUxVNv67D6lG3ds6emH6EPj+ovqAUC7SfOXfTJ+Mdaro8OqoP7hbuZ2ePSxvBHdJ/HckNuepeUKsrY44hMFOkDLXh2hDa/gu/h7Mkv5g431DRnzJy7fUjS1Xg44dB2Jpjm99SwPBzFEZTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ZGpV5YRL; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ZGpV5YRL"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 875641596;
	Wed, 12 Aug 2026 04:02:33 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BEBBE3F86F;
	Wed, 12 Aug 2026 04:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786532557; bh=mdrIGZjICmq0LxOwQ6YiH5ZpPrFH3mTO0IlhyWlkIDA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZGpV5YRLI7rdNyFSqiLdfEanSElpwuTSW6u+h99x0+n0OsN0F8HVFSj4UAyLA6Pdr
	 sgDWFHZc6Qoqx9qryjKj6NH9tlbT1SuUH+l3IuXwRQHxJvHRiW9/eB53dmlXfVCZFU
	 87t+L3949mhkIpaQVEw0nW09yC8WGZUpPbJTkjFw=
Date: Wed, 12 Aug 2026 13:02:09 +0200
From: Beata Michalska <beata.michalska@arm.com>
To: Sean Wang1 <seanwang1@lenovo.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"rafael@kernel.org" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Xuewen Yan <xuewen.yan@unisoc.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Sumit Gupta <sumitg@nvidia.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>
Subject: Re: [External] Re: [PATCH v3] arm64: topology: add source check in
 arch_cpu_idle_enter()
Message-ID: <anxSsfvpZHHsVnp_@arm.com>
References: <20260811072830.10028-1-seanwang1@lenovo.com>
 <anrzT-ez3b7uYaCt@arm.com>
 <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>

On Wed, Aug 12, 2026 at 07:34:52AM +0000, Sean Wang1 wrote:
> On Tus, Aug 11, 2026 at 06:03PM, Beata Michalska wrote:
> 
> > > --- a/arch/arm64/kernel/topology.c
> > > +++ b/arch/arm64/kernel/topology.c
> > > @@ -175,7 +175,8 @@ void arch_cpu_idle_enter(void)
> > >
> > >  	/* Kick in AMU update but only if one has not happened already */
> > >  	if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> > > -
> > time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))
> > > +
> > time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu))
> > &&
> > > +	    topology_is_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpu))
> > >  		amu_scale_freq_tick();
> > I'm not entirely convinced you gained a lot by that.
> > It's one additional check per each enter_idle for case where AMUs are the
> > source vs 2 additional check when it is not.
> > Will try to figure out smth less 'invasive'.
> > 
> 
> First, I think that the rcu_read_lock_sched()/unlock() in
> topology_is_scale_freq_source() is unnecessary. arch_cpu_idle_enter()
> is called from do_idle() after local_irq_disable() at
> kernel/sched/idle.c:340, which satisfies the rcu_sched grace period
> requirement. This means we can call rcu_dereference_sched() directly
> without explicit RCU lock.
In this particular case RCU locking is not required, though you are exposing
an API that might be used in other curcumstances, so the least we could do is
document that.
> 
> I have two options to propose:
> 
> Option A: Keep the helper, but drop the explicit RCU lock
> 
>     bool topology_is_scale_freq_source(enum scale_freq_source source,
>                                        unsigned int cpu)
>     {
>         struct scale_freq_data *sfd;
>         sfd = rcu_dereference_sched(*per_cpu_ptr(&sft_data, cpu));
>         return sfd && sfd->source == source;
>     }
> 
> Option B: Drop the helper entirely, check directly in arch_cpu_idle_enter()
> If a generic exported helper feels too invasive, we can do the
> check locally within arch_cpu_idle_enter() without touching
> drivers/base/arch_topology.c at all:
> 
>     if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
>         time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu))) {
>         struct scale_freq_data *sfd;
>         sfd = rcu_dereference_sched(*this_cpu_ptr(&sft_data));
>         if (sfd && sfd->source == SCALE_FREQ_SOURCE_ARCH)
>             amu_scale_freq_tick();
>     }
> 
> This keeps the change entirely in arm64 code and avoids adding
> a new exported symbol. Which approach would you prefer?
I do not mind this additional helper. Besides, not my place to either mind it
or not.
What I do mind is doing the check in the arch idle enter path. I would rather
see some notification triggered when the source gets changed so that
the previous sfd code can do some state transition that would avoid us having
to run the check in the first place.
Still pondering on that one.
Preferably I would drop that 'tick' call from there completely, but apparently
this was needed on some platforms to make AMU readings more reliable.

> 
> > Aside: I should have probably asked that earlier, but I am not sure I do fully
> > understand the case we are trying to fix here.
> > The topology_set_scale_freq_source prefers arch source to others. So if the
> > AMUs were chosen to server as the source for the freq scale - I do not see
> > why the sfd would be changed. That would require calling sequence clear-set
> > to get a different source in place. I do understand the issue itself, though how
> > did we end up there in the first place ?
> 
> The issue arises when topology_clear_scale_freq_source() is called
> with SCALE_FREQ_SOURCE_ARCH to explicitly disable AMU-based frequency
> scaling. This API is exported (EXPORT_SYMBOL_GPL), so it is designed
> to be used by modules or subsystems that need to replace the frequency
> invariance mechanism at runtime.
>  
So this is the bit I was missing: external module that does the switch
willingly giving up on arch provided freq scale source.
The rest is clear. Thanks.

---
BR
Beata

> After clearing, the tick path (topology_scale_freq_tick()) correctly
> skips the AMU update because sft_data is set to NULL. However, the
> idle path (arch_cpu_idle_enter()) bypasses this check by calling
> amu_scale_freq_tick() directly, so arch_freq_scale still gets
> modified by AMU counters.
>  
> This creates an inconsistency: the tick path respects
> topology_clear_scale_freq_source() but the idle path does not.
>  
> The goal of this patch is to make the idle path consistent with
> the tick path, ensuring that topology_clear_scale_freq_source()
> fully disables AMU updates across all paths.
