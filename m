Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5446537BE93
	for <driver-core@lists.linux.dev>; Wed, 19 Aug 2026 19:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787166621; cv=none; b=IPTXVMR8fuQN5HdgtpdgG6ssZlf4NqDk6SiK5V3PS3e1jK5VY0AZhoOaWHcz8Ep7X37SfT5zDvA3IYDEOfZlVySoh92u6Lawwr9Lyo3P00FgHefscQ4hufC6yLkuI5wluRRNiQSGYBFuX8b1kpbh9V0FgrXQqHal1l/aBhFdWjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787166621; c=relaxed/simple;
	bh=Ug6YFwi1z72qwNpqc8SJE0KkmmeZ45W0pyC4FKQyAUc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=km26VKv8O0JwbgF6cUXms2UZZBusJml7FR2bgqbzOujVSFkxH+LOn1D2zkXFXfTxahuSxmYtGuC9/wmr/wqoN8VefYdF2Ly8pjxzBEJ9eHC0XAOvxHpH+u6pNYKUDNAegpVNmvs7h9kWYYYoS7NqyBHRLRMIjue0FRAiJ1cCQEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=LkpRu1Hx; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="LkpRu1Hx"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8CB7514BF;
	Wed, 19 Aug 2026 12:10:14 -0700 (PDT)
Received: from arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 370083F763;
	Wed, 19 Aug 2026 12:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787166618; bh=Ug6YFwi1z72qwNpqc8SJE0KkmmeZ45W0pyC4FKQyAUc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LkpRu1Hxjebwa2J4LjrLTAjBzkDILL/RGcNqUrkoKohPwV7xZS8Ip4npCmOT3G6b4
	 JIUiGCK/aDY1KBJq4BvlszBv5csWOrlBpb3Llnj/G4Io8mjdqAmwUyE34IV8JG8uYB
	 6VCiMmQ5quhA7hRda45tiKJabs7TdkiiYVif6Fro=
Date: Wed, 19 Aug 2026 21:10:06 +0200
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
Message-ID: <aoX_jiuhv3dyMS-g@arm.com>
References: <20260811072830.10028-1-seanwang1@lenovo.com>
 <anrzT-ez3b7uYaCt@arm.com>
 <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
 <anxSsfvpZHHsVnp_@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anxSsfvpZHHsVnp_@arm.com>

On Wed, Aug 12, 2026 at 01:02:37PM +0200, Beata Michalska wrote:
> On Wed, Aug 12, 2026 at 07:34:52AM +0000, Sean Wang1 wrote:
> > On Tus, Aug 11, 2026 at 06:03PM, Beata Michalska wrote:
> > 
> > > > --- a/arch/arm64/kernel/topology.c
> > > > +++ b/arch/arm64/kernel/topology.c
> > > > @@ -175,7 +175,8 @@ void arch_cpu_idle_enter(void)
> > > >
> > > >  	/* Kick in AMU update but only if one has not happened already */
> > > >  	if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> > > > -
> > > time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu)))
> > > > +
> > > time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu))
> > > &&
> > > > +	    topology_is_scale_freq_source(SCALE_FREQ_SOURCE_ARCH, cpu))
> > > >  		amu_scale_freq_tick();
> > > I'm not entirely convinced you gained a lot by that.
> > > It's one additional check per each enter_idle for case where AMUs are the
> > > source vs 2 additional check when it is not.
> > > Will try to figure out smth less 'invasive'.
> > > 
> > 
> > First, I think that the rcu_read_lock_sched()/unlock() in
> > topology_is_scale_freq_source() is unnecessary. arch_cpu_idle_enter()
> > is called from do_idle() after local_irq_disable() at
> > kernel/sched/idle.c:340, which satisfies the rcu_sched grace period
> > requirement. This means we can call rcu_dereference_sched() directly
> > without explicit RCU lock.
> In this particular case RCU locking is not required, though you are exposing
> an API that might be used in other curcumstances, so the least we could do is
> document that.
> > 
> > I have two options to propose:
> > 
> > Option A: Keep the helper, but drop the explicit RCU lock
> > 
> >     bool topology_is_scale_freq_source(enum scale_freq_source source,
> >                                        unsigned int cpu)
> >     {
> >         struct scale_freq_data *sfd;
> >         sfd = rcu_dereference_sched(*per_cpu_ptr(&sft_data, cpu));
> >         return sfd && sfd->source == source;
> >     }
> > 
> > Option B: Drop the helper entirely, check directly in arch_cpu_idle_enter()
> > If a generic exported helper feels too invasive, we can do the
> > check locally within arch_cpu_idle_enter() without touching
> > drivers/base/arch_topology.c at all:
> > 
> >     if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> >         time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, cpu))) {
> >         struct scale_freq_data *sfd;
> >         sfd = rcu_dereference_sched(*this_cpu_ptr(&sft_data));
> >         if (sfd && sfd->source == SCALE_FREQ_SOURCE_ARCH)
> >             amu_scale_freq_tick();
> >     }
> > 
> > This keeps the change entirely in arm64 code and avoids adding
> > a new exported symbol. Which approach would you prefer?
> I do not mind this additional helper. Besides, not my place to either mind it
> or not.
> What I do mind is doing the check in the arch idle enter path. I would rather
> see some notification triggered when the source gets changed so that
> the previous sfd code can do some state transition that would avoid us having
> to run the check in the first place.
> Still pondering on that one.
> Preferably I would drop that 'tick' call from there completely, but apparently
> this was needed on some platforms to make AMU readings more reliable.

How about smth between the lines of:

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index b32f13358fbb1..aff33836488c8 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -250,6 +250,22 @@ int arch_freq_get_on_cpu(int cpu)
 	return freq;
 }
 
+static int amu_fie_source_notifier(struct notifier_block *nb,
+				   unsigned long event,
+				   void *data)
+{
+	const struct cpumask *cpus = data;
+
+	if (event == SCALE_FREQ_SOURCE_ARCH)
+		cpumask_andnot(amu_fie_cpus, amu_fie_cpus, cpus);
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block amu_fie_nb = {
+	.notifier_call = amu_fie_source_notifier,
+};
+
 static void amu_fie_setup(const struct cpumask *cpus)
 {
 	int cpu;
@@ -274,6 +290,8 @@ static void amu_fie_setup(const struct cpumask *cpus)
 
 	topology_set_scale_freq_source(&amu_sfd, cpus);
 
+	if (cpumask_weight(cpus) == cpumask_weight(amu_fie_cpus))
+		topology_register_scale_freq_source_notifier(&amu_fie_nb);
 	pr_debug("CPUs[%*pbl]: counters will be used for FIE.",
 		 cpumask_pr_args(cpus));
 }
@@ -339,9 +357,9 @@ static int cpuhp_topology_online(unsigned int cpu)
 	}
 
 	cpumask_set_cpu(cpu, amu_fie_cpus);
-
 	topology_set_scale_freq_source(&amu_sfd, cpumask_of(cpu));
-
+	if (cpumask_weight(amu_fie_cpus) == 1)
+		topology_register_scale_freq_source_notifier(&amu_fie_nb);
 	pr_debug("CPU[%u]: counter will be used for FIE.", cpu);
 
 	return 0;
diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index 8c5e47c28d9a3..096430a99ee00 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -22,11 +22,14 @@
 #include <linux/rcupdate.h>
 #include <linux/sched.h>
 #include <linux/units.h>
+#include <linux/notifier.h>
 
 #define CREATE_TRACE_POINTS
 #include <trace/events/hw_pressure.h>
 
 static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
+static struct blocking_notifier_head scale_freq_source_change =
+	BLOCKING_NOTIFIER_INIT(scale_freq_source_change);
 static struct cpumask scale_freq_counters_mask;
 static bool scale_freq_invariant;
 DEFINE_PER_CPU(unsigned long, capacity_freq_ref) = 0;
@@ -67,6 +70,18 @@ static void update_scale_freq_invariant(bool status)
 	}
 }
 
+int topology_register_scale_freq_source_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&scale_freq_source_change, nb);
+}
+EXPORT_SYMBOL_GPL(topology_register_scale_freq_source_notifier);
+
+int topology_unregister_scale_freq_source_notifier(struct notifier_block *nb)
+{
+	return blocking_notifier_chain_unregister(&scale_freq_source_change, nb);
+}
+EXPORT_SYMBOL_GPL(topology_unregister_scale_freq_source_notifier);
+
 void topology_set_scale_freq_source(struct scale_freq_data *data,
 				    const struct cpumask *cpus)
 {
@@ -95,6 +110,7 @@ void topology_set_scale_freq_source(struct scale_freq_data *data,
 	rcu_read_unlock();
 
 	update_scale_freq_invariant(true);
+
 }
 EXPORT_SYMBOL_GPL(topology_set_scale_freq_source);
 
@@ -102,8 +118,11 @@ void topology_clear_scale_freq_source(enum scale_freq_source source,
 				      const struct cpumask *cpus)
 {
 	struct scale_freq_data *sfd;
+	cpumask_var_t cleared_mask __free(free_cpumask_var) = CPUMASK_VAR_NULL;
 	int cpu;
 
+	zalloc_cpumask_var(&cleared_mask, GFP_KERNEL);
+
 	rcu_read_lock();
 
 	for_each_cpu(cpu, cpus) {
@@ -112,6 +131,8 @@ void topology_clear_scale_freq_source(enum scale_freq_source source,
 		if (sfd && sfd->source == source) {
 			rcu_assign_pointer(per_cpu(sft_data, cpu), NULL);
 			cpumask_clear_cpu(cpu, &scale_freq_counters_mask);
+			if (cpumask_available(cleared_mask))
+				cpumask_set_cpu(cpu, cleared_mask);
 		}
 	}
 
@@ -124,6 +145,10 @@ void topology_clear_scale_freq_source(enum scale_freq_source source,
 	synchronize_rcu();
 
 	update_scale_freq_invariant(false);
+
+	if (cpumask_available(cleared_mask))
+		blocking_notifier_call_chain(&scale_freq_source_change, source,
+					     cleared_mask);
 }
 EXPORT_SYMBOL_GPL(topology_clear_scale_freq_source);
 
diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.h
index ebd7f8935f969..4c31fd6dff0ef 100644
--- a/include/linux/arch_topology.h
+++ b/include/linux/arch_topology.h
@@ -48,6 +48,8 @@ struct scale_freq_data {
 void topology_scale_freq_tick(void);
 void topology_set_scale_freq_source(struct scale_freq_data *data, const struct cpumask *cpus);
 void topology_clear_scale_freq_source(enum scale_freq_source source, const struct cpumask *cpus);
+int topology_register_scale_freq_source_notifier(struct notifier_block *nb);
+int topology_unregister_scale_freq_source_notifier(struct notifier_block *nb);
 
 DECLARE_PER_CPU(unsigned long, hw_pressure);
 

---

This is just a rough idea, and needs ironing out the wrinkles, which are there,
but that allows leaving the idle enter as is. I also believe this is the right
approach for the interface itself, although I also see some drawbacks and
potential issues (in its current state), especially that the functionality is
being exposed to modules.
Nevertheless, those are my two cents, untested, just sketched.

---
BR
Beata
> 
> > 
> > > Aside: I should have probably asked that earlier, but I am not sure I do fully
> > > understand the case we are trying to fix here.
> > > The topology_set_scale_freq_source prefers arch source to others. So if the
> > > AMUs were chosen to server as the source for the freq scale - I do not see
> > > why the sfd would be changed. That would require calling sequence clear-set
> > > to get a different source in place. I do understand the issue itself, though how
> > > did we end up there in the first place ?
> > 
> > The issue arises when topology_clear_scale_freq_source() is called
> > with SCALE_FREQ_SOURCE_ARCH to explicitly disable AMU-based frequency
> > scaling. This API is exported (EXPORT_SYMBOL_GPL), so it is designed
> > to be used by modules or subsystems that need to replace the frequency
> > invariance mechanism at runtime.
> >  
> So this is the bit I was missing: external module that does the switch
> willingly giving up on arch provided freq scale source.
> The rest is clear. Thanks.
> 
> ---
> BR
> Beata
> 
> > After clearing, the tick path (topology_scale_freq_tick()) correctly
> > skips the AMU update because sft_data is set to NULL. However, the
> > idle path (arch_cpu_idle_enter()) bypasses this check by calling
> > amu_scale_freq_tick() directly, so arch_freq_scale still gets
> > modified by AMU counters.
> >  
> > This creates an inconsistency: the tick path respects
> > topology_clear_scale_freq_source() but the idle path does not.
> >  
> > The goal of this patch is to make the idle path consistent with
> > the tick path, ensuring that topology_clear_scale_freq_source()
> > fully disables AMU updates across all paths.
