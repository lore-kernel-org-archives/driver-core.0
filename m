Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A32223DD4
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 09:21:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787563283; cv=pass; b=GJeOMtmzKF61N26GcmLyHQo1DiHY1U5HyR3LcV+fwhtgz0f6mT5uc17nl1jWkOPoLJ+9YwTiL8T+aRb6jPcxh4iKFJRz1PpWE2Kko5DS7b6gsW1UOoHdse9TJkvMEXU8b20rN+qocUEHvFlubqA50Ay362TNtz+5K9qWKmRtqX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787563283; c=relaxed/simple;
	bh=2WW8ByPwCe0PPq0I8XsUIFoHgdmeOx6fgoKKs7h6BQU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ktcGP0NRexDv6tkl63ps3NyX5Gxs/nZFfgGhxGsWOWajuvud++iyZpBXjG9OLItOzaLKvonV/0wFVlGXYK6dXLSG+Mj2zzmj0rPJgmf5I6RR196cfRRi+aarXXpKBWCzg7xRC4bAs/SkeBD5Wqxj0KJszd/zyX6Z1Trz9hv+4uA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LIurSPiW; arc=pass smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LIurSPiW"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-526f963372aso22499141cf.1
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 02:21:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787563275; cv=none;
        d=google.com; s=arc-20260327;
        b=jazsB8Pt3OxdliWibyfH1ivSiNVJdVq6Gtd15IBI7ZFoZ7XU+FxoErYsRsPkxDI32Y
         Or+daA75FM4vxjnIvhiBbSICQ/jIYy0aDpL3sNhQfoMJvEMkFHOJTLqr+87cOC1+Br3U
         fcrl78N5oaEyAywKblmsvbWKogBAcKSOZzpnO/Ym14kTJeACAXHjpD06Nzy07wG066U3
         trlUhYPXeWS/yvVUo6iegEG+i4gIGUzozkZkqGfQmIi3yXZM6IhHj2DWF8L3Uzl0bcNR
         cAcZ2muJgrSApa4Bs3gRsjQrUHlqxn9jGEI8+0ztpMUDMoSrAu02oesh6H6bHeq81NK5
         7BqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s2dhbwUU2Acnt8iDl/i5Fl7McccZzULDySa0x9EcInY=;
        fh=pDTyjOHn0Fx7tgiwGZENbYcoOOYiEEqIEJBWyy3AClI=;
        b=iClybU8tpwv6MyDx7e6EiW9TVXolYgDCUMilQ3GkzWEMM6EmbTPikYuMSJeJxHAIT9
         KJbOg04Nx4KkE4hV7agvr5cFkvPkzHRAaYMpdgm0QzVUscdjMS7Biiq49mJmAYCriaL4
         PMG4Tzs7PNMUBixwd7R+xUJRlSAMx8QZZMwoZtwFcHFRkgl8tiE0bGYL+scBMGkgy4ce
         Kc/YtADg+nRBcND2ti2fhCml/lK0RToX70MyX/F8ae+iVZ/frwaImYuZ0nsFXthtK1xK
         d3JGQ0FhS3r+jd8XT1Ids86Mm1x1FNQKzNjf7F+abu/pzJGGUtn9rLNZ42uGe/A+Y4vP
         N98Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787563275; x=1788168075; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s2dhbwUU2Acnt8iDl/i5Fl7McccZzULDySa0x9EcInY=;
        b=LIurSPiWfSKnOuxt3UwMnzDCk4V4q1XJJa0u7YrU1W5S8E1mHXz877AKl5ReM29i4Y
         NwP1pcypa2lKl7tXqaN21YkPOmnyprbwIkVd42g6wPRt2N44AeeFh8o/kB8zhBb4aSzM
         lhFkCaVVYzVU7l3cM0M9bEX5o1E7XPf8PzIh69oofCRRtO0XuzMpWv0TdwaGJ4o57/wo
         5WoBqbTRsuPynbIyvQiVSQjMTJfHojtaRR87YCI4GLZn+4fvWdwxCB2yx4ktmGO2YxPe
         pHande75THTuBGflqBIwCQXKcjI10nH2mhQXZNEYXJ+bWPv5Z/EJBRIXSmhMvY2D8cl3
         PxMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787563275; x=1788168075;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s2dhbwUU2Acnt8iDl/i5Fl7McccZzULDySa0x9EcInY=;
        b=OQ7ZThwugVUDlYTvp8a41QTF+jwhsNoHdYvQ5DKtqoj8/tc1rngX51XsGs9k8P0SjF
         0PY1P9GAy2Iz3jkBbj/azaSuGwPKL18Vu6hRc4OAqvYSle5ltWOeXzycG3QXlxF5cNs8
         1vJr8s1E+1frZBKot/5vxtSFJAovqaRu4TpHgTc+C7MNrF36x9vNA5pcLK/f/gValPDH
         3K3/wCwW04niPE7q1dF5gSnWXiy3NY8mZaD0Aksq9aweRjAUmC38+FVg4xYQX1walmv3
         GIjAgoNajGsgELTXxYj69drdWMbJOxpoX7AiThFok+boAQExZaXrHFyCKNgVXu0tFG2l
         Il+A==
X-Forwarded-Encrypted: i=1; AHgh+Rpq0wMGLS6bwhLKIhASDF920eAjNkp1bsZ0iv+tltEWPfG3giWRfK1JkQotCq3sz+2ByMfZMKikRw5VVQ==@lists.linux.dev
X-Gm-Message-State: AFuF++n24csnxAus200WZsGpXO37PccxJoP2GpUBiIgZU9bnVBN9LAJZ
	1hYKRvHmthAuS8QtT42qQS/qW3W0ke4WqviCRbKBgnxbEB4PM4HVxvxW1OqYetFxQYHYBFoLYzl
	bQ4M5ZQWqW8G3rR6Q/qFKssMxs8S1xLY=
X-Gm-Gg: AR+sD13gki8GOXvQyb4dATF37brtBll4YK4w3hcVm0igbW2m4Fd4wtLjFnl2zYaBaJg
	arFr+hXgjNgq8aTluGcmZfdJwEFIGxwLZD2DLOmzvSlYYUMW26IVJ2QTHZf5Bfjs0PkiOFRnWzw
	0/dGpyvOwVvWNhtHc2WIJYM97rL6FAJXzkoVofK+oR0j56Wx3Jcy7Z/kYFlMMMA6Xy6minyt/rR
	2g2Q0d+7SYZUrnCWpvJgzZ0Rq260yLxywpS8hZCAGTmm3GSHAzW/X86ZxhyakGP3Cke4iXUY1Oq
	a/D9Aj3ua0atHnc/FJCUK/LJDWKAxPMJXQPDR9F2oJ1ExlbhTtOhE2iHMw==
X-Received: by 2002:a05:622a:1cc7:b0:51a:896c:9ab0 with SMTP id
 d75a77b69052e-52e09b9c641mr167385421cf.10.1787563275220; Mon, 24 Aug 2026
 02:21:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811072830.10028-1-seanwang1@lenovo.com> <anrzT-ez3b7uYaCt@arm.com>
 <SI2PR03MB6688D1DC0796AC6F6A373C2E93DC2@SI2PR03MB6688.apcprd03.prod.outlook.com>
 <anxSsfvpZHHsVnp_@arm.com> <aoX_jiuhv3dyMS-g@arm.com>
In-Reply-To: <aoX_jiuhv3dyMS-g@arm.com>
From: Xuewen Yan <xuewen.yan94@gmail.com>
Date: Mon, 24 Aug 2026 17:21:03 +0800
X-Gm-Features: AcwNN1WASJD0Uyy8E8St9ZJzbOmEzEbrEYrP-LIm_bk-HpFm5Pmi7KhDCWL_9SI
Message-ID: <CAB8ipk_4Zbhb=azTDGQEQ1S=n2Zhzvqs7pYr6ZfOOWL8meE_4Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3] arm64: topology: add source check in arch_cpu_idle_enter()
To: Beata Michalska <beata.michalska@arm.com>
Cc: Sean Wang1 <seanwang1@lenovo.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "rafael@kernel.org" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Lifeng Zheng <zhenglifeng1@huawei.com>, 
	Xuewen Yan <xuewen.yan@unisoc.com>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Sumit Gupta <sumitg@nvidia.com>, Yunhui Cui <cuiyunhui@bytedance.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"driver-core@lists.linux.dev" <driver-core@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2026 at 3:11=E2=80=AFAM Beata Michalska <beata.michalska@ar=
m.com> wrote:
>
> On Wed, Aug 12, 2026 at 01:02:37PM +0200, Beata Michalska wrote:
> > On Wed, Aug 12, 2026 at 07:34:52AM +0000, Sean Wang1 wrote:
> > > On Tus, Aug 11, 2026 at 06:03PM, Beata Michalska wrote:
> > >
> > > > > --- a/arch/arm64/kernel/topology.c
> > > > > +++ b/arch/arm64/kernel/topology.c
> > > > > @@ -175,7 +175,8 @@ void arch_cpu_idle_enter(void)
> > > > >
> > > > >         /* Kick in AMU update but only if one has not happened al=
ready */
> > > > >         if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> > > > > -
> > > > time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, c=
pu)))
> > > > > +
> > > > time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_update, c=
pu))
> > > > &&
> > > > > +           topology_is_scale_freq_source(SCALE_FREQ_SOURCE_ARCH,=
 cpu))
> > > > >                 amu_scale_freq_tick();
> > > > I'm not entirely convinced you gained a lot by that.
> > > > It's one additional check per each enter_idle for case where AMUs a=
re the
> > > > source vs 2 additional check when it is not.
> > > > Will try to figure out smth less 'invasive'.
> > > >
> > >
> > > First, I think that the rcu_read_lock_sched()/unlock() in
> > > topology_is_scale_freq_source() is unnecessary. arch_cpu_idle_enter()
> > > is called from do_idle() after local_irq_disable() at
> > > kernel/sched/idle.c:340, which satisfies the rcu_sched grace period
> > > requirement. This means we can call rcu_dereference_sched() directly
> > > without explicit RCU lock.
> > In this particular case RCU locking is not required, though you are exp=
osing
> > an API that might be used in other curcumstances, so the least we could=
 do is
> > document that.
> > >
> > > I have two options to propose:
> > >
> > > Option A: Keep the helper, but drop the explicit RCU lock
> > >
> > >     bool topology_is_scale_freq_source(enum scale_freq_source source,
> > >                                        unsigned int cpu)
> > >     {
> > >         struct scale_freq_data *sfd;
> > >         sfd =3D rcu_dereference_sched(*per_cpu_ptr(&sft_data, cpu));
> > >         return sfd && sfd->source =3D=3D source;
> > >     }
> > >
> > > Option B: Drop the helper entirely, check directly in arch_cpu_idle_e=
nter()
> > > If a generic exported helper feels too invasive, we can do the
> > > check locally within arch_cpu_idle_enter() without touching
> > > drivers/base/arch_topology.c at all:
> > >
> > >     if (housekeeping_cpu(cpu, HK_TYPE_TICK) &&
> > >         time_is_before_jiffies(per_cpu(cpu_amu_samples.last_scale_upd=
ate, cpu))) {
> > >         struct scale_freq_data *sfd;
> > >         sfd =3D rcu_dereference_sched(*this_cpu_ptr(&sft_data));
> > >         if (sfd && sfd->source =3D=3D SCALE_FREQ_SOURCE_ARCH)
> > >             amu_scale_freq_tick();
> > >     }
> > >
> > > This keeps the change entirely in arm64 code and avoids adding
> > > a new exported symbol. Which approach would you prefer?
> > I do not mind this additional helper. Besides, not my place to either m=
ind it
> > or not.
> > What I do mind is doing the check in the arch idle enter path. I would =
rather
> > see some notification triggered when the source gets changed so that
> > the previous sfd code can do some state transition that would avoid us =
having
> > to run the check in the first place.
> > Still pondering on that one.
> > Preferably I would drop that 'tick' call from there completely, but app=
arently
> > this was needed on some platforms to make AMU readings more reliable.
>
> How about smth between the lines of:
>
> diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
> index b32f13358fbb1..aff33836488c8 100644
> --- a/arch/arm64/kernel/topology.c
> +++ b/arch/arm64/kernel/topology.c
> @@ -250,6 +250,22 @@ int arch_freq_get_on_cpu(int cpu)
>         return freq;
>  }
>
> +static int amu_fie_source_notifier(struct notifier_block *nb,
> +                                  unsigned long event,
> +                                  void *data)
> +{
> +       const struct cpumask *cpus =3D data;
> +
> +       if (event =3D=3D SCALE_FREQ_SOURCE_ARCH)
> +               cpumask_andnot(amu_fie_cpus, amu_fie_cpus, cpus);

Should we distinguish between events?

> +
> +       return NOTIFY_OK;
> +}
> +
> +static struct notifier_block amu_fie_nb =3D {
> +       .notifier_call =3D amu_fie_source_notifier,
> +};
> +
>  static void amu_fie_setup(const struct cpumask *cpus)
>  {
>         int cpu;
> @@ -274,6 +290,8 @@ static void amu_fie_setup(const struct cpumask *cpus)
>
>         topology_set_scale_freq_source(&amu_sfd, cpus);
>
> +       if (cpumask_weight(cpus) =3D=3D cpumask_weight(amu_fie_cpus))
> +               topology_register_scale_freq_source_notifier(&amu_fie_nb)=
;
>         pr_debug("CPUs[%*pbl]: counters will be used for FIE.",
>                  cpumask_pr_args(cpus));
>  }
> @@ -339,9 +357,9 @@ static int cpuhp_topology_online(unsigned int cpu)
>         }
>
>         cpumask_set_cpu(cpu, amu_fie_cpus);
> -
>         topology_set_scale_freq_source(&amu_sfd, cpumask_of(cpu));
> -
> +       if (cpumask_weight(amu_fie_cpus) =3D=3D 1)
> +               topology_register_scale_freq_source_notifier(&amu_fie_nb)=
;
>         pr_debug("CPU[%u]: counter will be used for FIE.", cpu);
>
>         return 0;
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a3..096430a99ee00 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -22,11 +22,14 @@
>  #include <linux/rcupdate.h>
>  #include <linux/sched.h>
>  #include <linux/units.h>
> +#include <linux/notifier.h>
>
>  #define CREATE_TRACE_POINTS
>  #include <trace/events/hw_pressure.h>
>
>  static DEFINE_PER_CPU(struct scale_freq_data __rcu *, sft_data);
> +static struct blocking_notifier_head scale_freq_source_change =3D
> +       BLOCKING_NOTIFIER_INIT(scale_freq_source_change);
>  static struct cpumask scale_freq_counters_mask;
>  static bool scale_freq_invariant;
>  DEFINE_PER_CPU(unsigned long, capacity_freq_ref) =3D 0;
> @@ -67,6 +70,18 @@ static void update_scale_freq_invariant(bool status)
>         }
>  }
>
> +int topology_register_scale_freq_source_notifier(struct notifier_block *=
nb)
> +{
> +       return blocking_notifier_chain_register(&scale_freq_source_change=
, nb);
> +}
> +EXPORT_SYMBOL_GPL(topology_register_scale_freq_source_notifier);
> +
> +int topology_unregister_scale_freq_source_notifier(struct notifier_block=
 *nb)
> +{
> +       return blocking_notifier_chain_unregister(&scale_freq_source_chan=
ge, nb);
> +}
> +EXPORT_SYMBOL_GPL(topology_unregister_scale_freq_source_notifier);
> +
>  void topology_set_scale_freq_source(struct scale_freq_data *data,
>                                     const struct cpumask *cpus)
>  {
> @@ -95,6 +110,7 @@ void topology_set_scale_freq_source(struct scale_freq_=
data *data,
>         rcu_read_unlock();
>
>         update_scale_freq_invariant(true);
> +
>  }
>  EXPORT_SYMBOL_GPL(topology_set_scale_freq_source);
>
> @@ -102,8 +118,11 @@ void topology_clear_scale_freq_source(enum scale_fre=
q_source source,
>                                       const struct cpumask *cpus)
>  {
>         struct scale_freq_data *sfd;
> +       cpumask_var_t cleared_mask __free(free_cpumask_var) =3D CPUMASK_V=
AR_NULL;
>         int cpu;
>
> +       zalloc_cpumask_var(&cleared_mask, GFP_KERNEL);
> +
>         rcu_read_lock();
>
>         for_each_cpu(cpu, cpus) {
> @@ -112,6 +131,8 @@ void topology_clear_scale_freq_source(enum scale_freq=
_source source,
>                 if (sfd && sfd->source =3D=3D source) {
>                         rcu_assign_pointer(per_cpu(sft_data, cpu), NULL);
>                         cpumask_clear_cpu(cpu, &scale_freq_counters_mask)=
;
> +                       if (cpumask_available(cleared_mask))
> +                               cpumask_set_cpu(cpu, cleared_mask);
>                 }
>         }
>
> @@ -124,6 +145,10 @@ void topology_clear_scale_freq_source(enum scale_fre=
q_source source,
>         synchronize_rcu();
>
>         update_scale_freq_invariant(false);
> +
> +       if (cpumask_available(cleared_mask))
> +               blocking_notifier_call_chain(&scale_freq_source_change, s=
ource,
> +                                            cleared_mask);
>  }
>  EXPORT_SYMBOL_GPL(topology_clear_scale_freq_source);
>
> diff --git a/include/linux/arch_topology.h b/include/linux/arch_topology.=
h
> index ebd7f8935f969..4c31fd6dff0ef 100644
> --- a/include/linux/arch_topology.h
> +++ b/include/linux/arch_topology.h
> @@ -48,6 +48,8 @@ struct scale_freq_data {
>  void topology_scale_freq_tick(void);
>  void topology_set_scale_freq_source(struct scale_freq_data *data, const =
struct cpumask *cpus);
>  void topology_clear_scale_freq_source(enum scale_freq_source source, con=
st struct cpumask *cpus);
> +int topology_register_scale_freq_source_notifier(struct notifier_block *=
nb);
> +int topology_unregister_scale_freq_source_notifier(struct notifier_block=
 *nb);
>
>  DECLARE_PER_CPU(unsigned long, hw_pressure);
>
>
> ---
>
> This is just a rough idea, and needs ironing out the wrinkles, which are =
there,
> but that allows leaving the idle enter as is. I also believe this is the =
right
> approach for the interface itself, although I also see some drawbacks and
> potential issues (in its current state), especially that the functionalit=
y is
> being exposed to modules.
> Nevertheless, those are my two cents, untested, just sketched.

As an aside, could we verify the functionality of the AMU's
SYS_AMEVCNTR0_CONST_EL0 in the current CPU before enabling amu_file?
To my knowledge, many chips currently have inaccurate errata in this counte=
r.
Alternatively, could we introduce a command line that allows users to
dynamically disable this feature?

Thanks!
>
> ---
> BR
> Beata
> >
> > >
> > > > Aside: I should have probably asked that earlier, but I am not sure=
 I do fully
> > > > understand the case we are trying to fix here.
> > > > The topology_set_scale_freq_source prefers arch source to others. S=
o if the
> > > > AMUs were chosen to server as the source for the freq scale - I do =
not see
> > > > why the sfd would be changed. That would require calling sequence c=
lear-set
> > > > to get a different source in place. I do understand the issue itsel=
f, though how
> > > > did we end up there in the first place ?
> > >
> > > The issue arises when topology_clear_scale_freq_source() is called
> > > with SCALE_FREQ_SOURCE_ARCH to explicitly disable AMU-based frequency
> > > scaling. This API is exported (EXPORT_SYMBOL_GPL), so it is designed
> > > to be used by modules or subsystems that need to replace the frequenc=
y
> > > invariance mechanism at runtime.
> > >
> > So this is the bit I was missing: external module that does the switch
> > willingly giving up on arch provided freq scale source.
> > The rest is clear. Thanks.
> >
> > ---
> > BR
> > Beata
> >
> > > After clearing, the tick path (topology_scale_freq_tick()) correctly
> > > skips the AMU update because sft_data is set to NULL. However, the
> > > idle path (arch_cpu_idle_enter()) bypasses this check by calling
> > > amu_scale_freq_tick() directly, so arch_freq_scale still gets
> > > modified by AMU counters.
> > >
> > > This creates an inconsistency: the tick path respects
> > > topology_clear_scale_freq_source() but the idle path does not.
> > >
> > > The goal of this patch is to make the idle path consistent with
> > > the tick path, ensuring that topology_clear_scale_freq_source()
> > > fully disables AMU updates across all paths.
>
