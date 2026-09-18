Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FDB502780
	for <driver-core@lists.linux.dev>; Fri, 18 Sep 2026 13:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789739252; cv=pass; b=BqVTpnVcoj7f+k8m2swAInfnjfR+W6q8SUSxJsZeBwKFnOzSjgN8juARHoiEd1Fy+LQknM8+CYOcfVQiaMcNyxLdPJfJFvOEyJdqQgNYgc6N3a1myKqXeiT9apv5piR78DEG4wdGem7tkK+C/eBMu+VhYJomm6W9ZMUSzpabTQ4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789739252; c=relaxed/simple;
	bh=fudkRpOvqijVuJwy/VHO9zMcAmf9hSjmeOSE6UueqG0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cq92U4h5l1Xhh48tEzYJKjo9RoIN3We4PF/F9jTaH2wJIFq287ubcasVErMVlq+1fc+infN0N4ZDonXCuusN7ciHISfPy3BZ1kaehm9rlM7QmSnMZC2vtiHqwRWZtPB+CYsKfJOCLZ/8tsfNtym4HqROQrncYe1q+5jwZDgpRwM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NveJ+CK4; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NveJ+CK4"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so100334866b.2
        for <driver-core@lists.linux.dev>; Fri, 18 Sep 2026 06:47:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789739249; cv=none;
        d=google.com; s=arc-20260327;
        b=TkMhTn4Ozf0YYs7HMMRUmE7xd4lUk3ti+YWaRC6zNnRmTcHGTaQRNh3y/xibWzAnxz
         ADerYcUTj6tRTBZJP4eg8T/cWhm5TW3c8YbtIbLDvmH/dZtPtC59ZugAwk+QuRlQUR0T
         AuAsxlbhSdc1+3UAI9keqDt9x6D9njLV0/oqIEM306XxODibZJ91HnuunCXOxDFj+lKO
         L+7K3bjdMrnZDaaLAaZ2vIypgdDiA+d+uZeswRbWCpZg9qYAL8uV4k9wodlUObVA7fBN
         oHTJcxehsFxwuMMsthDWdqiMqeN5p019ByPgY525ar1fcB0iQjlcpePyzsNnfR0GU1ZY
         lETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QO8ZLWws9kX6Lxf9eVXFyTYmcZBNVguGNqNy3JkPkOY=;
        fh=cwu1w9wXC4hjtHo2ALxZbYa1Cv9OE2zm9jrZmA5KIOw=;
        b=UMe8iZIqB8ndlNdnlq1K7E1NjU5mCkohdnJ3+fuHGbXnwCb9bPDOcxl6nPshzJRkHk
         wj4HuLvPcFeK8w04Fekig+T7dlgxptItqJF9YABi9dtDwYNWYWkxaafCAvRUb5dC9v/A
         yKI9wXdRbbsJZyWIKeG4QFK1TfIVxLzEPMYoxo0j0MtHgNPtPNjGQvPuL6XU8vwJBXwU
         WBBukULx0e6F2+fmLIlL4AXq+4Zr6v+tlPsZ52I4vzui7DiqD8JTOgePAVl/J8oIepcE
         y+4DLA/5QaWUXnpgY98RHq+KBtHNUrAwXpqK43dF1gEMg4LuVyqWX0Jz/NT1fVHbZlFY
         n7mg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789739249; x=1790344049; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QO8ZLWws9kX6Lxf9eVXFyTYmcZBNVguGNqNy3JkPkOY=;
        b=NveJ+CK4xdwPPvpsqoX55rCUeMf2G2nLmdBXPE8MlJ6Yfh3LUADVz9Er/7QkovJuos
         oUkuUiBrlNpZc0RECRjcPXOIHSCu/8+/fDuAoa9/3ILSDyVb/ufah6dM7BzQn9WVrVvd
         yo1jByaZN9Go9WO+E/IZDf0AwNxLw8EagBOvywQLrdqLXz7LF6W2Mnz7kBwvIugmWEoQ
         KElT2fVOz+82qBAWJ6kQ3I1u1Q49Y9VGAtL8FIho/b3cPNeMqqlk+Km3G6zxim3s8bEL
         dV8sHIUscSsUanfYIMWjNOCwlI9CHsWW/dSS89EAJGPkA6kC9evcwSnK+lj6QYjGhpHS
         dQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789739249; x=1790344049;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QO8ZLWws9kX6Lxf9eVXFyTYmcZBNVguGNqNy3JkPkOY=;
        b=2mvO15xrF3drHhbbtdtrNB4veFjaPcDyNu1WISHtmwUTerorLpKXOe/eEOmtP73CQk
         LXTSSHqPD7NziVuqBeLC8fJXyFoegaLO3708O/X2YId+GnU52snK5/Cas3xT/Jk5emkm
         cQ7KgNQiVgzbF3zSj3F01kFhkkLp7DzBUUV+31U/5fv3Lhs76rJCnmXjHJDkpTpcgUby
         LlUaeovp71w8i2La3OH7ZEU2YYy3XK+naXWEtgF04bdvWEDR25Eq3CXJH5UYFnXGuJcK
         PDm8jnLaKarSQGISjzexllZwGSMAVT8GWkMq2qvLNIQaztdPNepmEv+KsLFQJ88mJKeg
         E1mw==
X-Forwarded-Encrypted: i=1; AKwUvBybw8pPN4dRw9Qvh96OXEKOwDYNuYMDfNJE81wQ8ebrz64gMD2Yc15ujpC0ew88/jIiL+ttHpOD1ixq7w==@lists.linux.dev
X-Gm-Message-State: AFuF++nmisTanSTzg7fiTRygYmq7AbGcgrUpDG4iyG+ZxUrNBPBGBgEA
	BxcTQcP0XrEQf7jr6+YonWsIowTHLt6uBuYPECHGCAKxeRusEjah68n4jtyQCOYy3F3tVM5tI/6
	fw5P7V9qihbHN7MIYBbLWKoK+0ry0Ax66kuD71XrAGQ==
X-Gm-Gg: AYBFou0WgbISRFw3t2J4Zq7FgmIiFI4/WEfE6ReLS7eT0tb8stOQMI4lA2hQc8D+ndw
	J9L/tMWZ4/uFpmfkCmDiPch3ckTpT/PM7GK2e14u2g+2O80o5Deb32j4FJez3PW2d+1MJ5U47kz
	vLD6+j0sx3GqYNs9dNKSILesOrl+5bGf+K9sjR5+HLzT06qZ2GdLIViDT2G2Aj4h7x4raVuzvt/
	jHMf0YluJb1NnuR7NRmqhgK9K92BnJH5/WH4ndah30Ut+oGIidchzEF10tAfYbVD2AXCUKPSsv1
	Lg4gA+NDZVnHNP9UFzPsoFP1Kb61i37RCDFA2e2QvcAVmQHZIHY/UiQ7v1egb7wUmlLbj6zyoUm
	PVL5dsHyuheOA
X-Received: by 2002:a17:907:1ca4:b0:c26:1649:47b4 with SMTP id
 a640c23a62f3a-c2a15b992d7mr309203166b.42.1789739248591; Fri, 18 Sep 2026
 06:47:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-1-25312a713699@oss.qualcomm.com>
 <CAJZ5v0jbYHcEWqqO3YSbwyeHBLkYCFn+_nQ9Ktt3yYPPcNH6LQ@mail.gmail.com>
 <CAKfTPtBkv2yG6ne2FG5NUY9QfeY2XTYg=GKnyzoFawkweK-EYA@mail.gmail.com>
 <CAJZ5v0h+ibqtvTyOqG+iy2vOLCXx9WwfHSoUu1URDCvzBYU_sA@mail.gmail.com>
 <CAKfTPtATz-aToAVh4sGsTRKM+0sOoVW4AC6gjufAjrFyZg1zFA@mail.gmail.com> <CAJZ5v0i_QYa-LcrK1U1VZjZZiJ3d-9hPbMdBbaGoqMds0BAU6w@mail.gmail.com>
In-Reply-To: <CAJZ5v0i_QYa-LcrK1U1VZjZZiJ3d-9hPbMdBbaGoqMds0BAU6w@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 18 Sep 2026 15:47:15 +0200
X-Gm-Features: AcwNN1W01KcSqUZt1AGSU22f1iJKGB9-Hw3ulW0-SUdG6V6LxuDXDp0Zb6T8r5k
Message-ID: <CAKfTPtB2YZDy11sXgu06v9WBORBeMQ6z5riCfajyqvC_kAfXLg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arch_topology: seed capacity_freq_ref with
 boost-aware max freq
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Ananthu C V <ananthu.cv@oss.qualcomm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Sept 2026 at 15:34, Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Fri, Sep 18, 2026 at 2:36=E2=80=AFPM Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > On Fri, 18 Sept 2026 at 14:05, Rafael J. Wysocki (Intel)
> > <rafael@kernel.org> wrote:
> > >
> > > On Fri, Sep 18, 2026 at 8:24=E2=80=AFAM Vincent Guittot
> > > <vincent.guittot@linaro.org> wrote:
> > > >
> > > > On Thu, 17 Sept 2026 at 21:07, Rafael J. Wysocki (Intel)
> > > > <rafael@kernel.org> wrote:
> > > > >
> > > > > On Tue, Sep 8, 2026 at 10:31=E2=80=AFAM Ananthu C V <ananthu.cv@o=
ss.qualcomm.com> wrote:
> > > > > >
> > > > > > capacity_freq_ref, the per-CPU frequency-invariance reference u=
sed by
> > > > > > schedutil, is seeded from policy->cpuinfo.max_freq at policy cr=
eation.
> > > > > > If boost frequencies are filtered out of the frequency table be=
cause
> > > > > > boost isn't yet enabled at boot, max_freq only reflects the non=
-boost
> > > > > > ceiling, so capacity_freq_ref never learns about boost frequenc=
ies for
> > > > > > the policy's lifetime. Enabling boost later raises policy->max,=
 but
> > > > > > capacity_freq_ref stays stale, leaving schedutil unable to scal=
e
> > > > > > utilization or target a frequency above the non-boost maximum.
> > > > > >
> > > > > > Track the highest frequency in the table regardless of boost st=
ate
> > > > > > (max_table_freq) and seed capacity_freq_ref with max(cpuinfo.ma=
x_freq,
> > > > > > max_table_freq), so the invariance reference is boost-aware fro=
m boot
> > > > > > regardless of whether boost is currently enabled. Runtime enfor=
cement,
> > > > > > still handled by policy->max, is unaffected.
> > > > > >
> > > > > > Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > > > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > > > > > ---
> > > > > >  drivers/base/arch_topology.c | 3 ++-
> > > > > >  drivers/cpufreq/freq_table.c | 6 ++++++
> > > > > >  include/linux/cpufreq.h      | 1 +
> > > > > >  3 files changed, 9 insertions(+), 1 deletion(-)
> > > > > >
> > > > > > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_t=
opology.c
> > > > > > index 8c5e47c28d9a..da94f77441da 100644
> > > > > > --- a/drivers/base/arch_topology.c
> > > > > > +++ b/drivers/base/arch_topology.c
> > > > > > @@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_=
block *nb,
> > > > > >         cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->re=
lated_cpus);
> > > > > >
> > > > > >         for_each_cpu(cpu, policy->related_cpus) {
> > > > > > -               per_cpu(capacity_freq_ref, cpu) =3D policy->cpu=
info.max_freq;
> > > > > > +               per_cpu(capacity_freq_ref, cpu) =3D max(policy-=
>cpuinfo.max_freq,
> > > > > > +                                                     policy->c=
puinfo.max_table_freq);
> > > > >
> > > > > So isn't capacity_freq_ref supposed to correspond to the CPU capa=
city
> > > > > returned by arch_scale_cpu_capacity()?
> > > >
> > > > capacity_freq_ref is the frequency that has been used when computin=
g
> > > > the capacity at boot
> > >
> > > I get it, and so it is what I wrote above: The frequency of the CPU
> > > when running at the arch_scale_cpu_capacity() performance level.
> > > Isn't it?
> >
> > Original it was not strictly tight to arch_scale_cpu_capacity but to a
> > ref capacity but it ended up being arch_scale_cpu_capacity
>
> OK
>
> > >
> > > > and it should not change at runtime wether the
> > > > boost is enabled or not, otherwise you will have some fluctuation o=
n
> > > > the system capacity that will create issue with PELT and scheduler
> > >
> > > So the capacity should be constant and consequently, capacity_freq_re=
f
> > > should be constant.
> > >
> > > Also, if boost is not enabled when capacity_freq_ref is set and there
> > > are frequency levels marked as "boost" in the table, it cannot be the
> > > maximum frequency in the table because that's not what is used for
> > > computing the capacity.
> >
> > I'm not sure I follow your last point above. It's not because boost
> > isn't enabled at boot time that we can't the highest boost OPP in the
> > table as a ref freq to compute  arch_scale_cpu_capacity. In this case,
> > the CPU will have a pressure on its capacity until the boost is
> > enabled. Do I miss something ?
>
> Well, I'm not sure if my understanding is correct.
>
> Suppose that the cpufreq driver has a frequency table which is
> processed by cpufreq_table_validate_and_sort(), right after the
> driver's ->init() has returned.
>
> That function calls cpufreq_frequency_table_cpuinfo() for the first
> time and policy->cpuinfo.max_freq is set.  However, if boost is not
> enabled (that is, cpufreq_boost_enabled() returns false or
> policy->boost_enabled is false), it only takes frequency table entries
> without CPUFREQ_BOOST_FREQ into account, so policy->cpuinfo.max_freq
> is one of those frequencies.
>
> I would think that the CPU capacity has already been set at this point
> and now the question arises whether or not it corresponds to
> policy->cpuinfo.max_freq because that is what is assumed by
> init_cpu_capacity_callback() invoked subsequently (via the
> cpufreq_policy_notifier_list chain).

init_cpu_capacity_callback() will normalize the capacity of all CPUs
once all cpufreq drivers have been probed and it will then trigger a
rebuild of the sched domain with these final CPUs' capacity

>
> The $subject patch seems to suggest that the answer is "no" and the
> capacity really corresponds to the highest frequency in the table
> which may be flagged with CPUFREQ_BOOST_FREQ.  Is that always the case
> though and if not, then how can we tell?
>
> > Can the boost OPP be added later?
>
> Not really.  It is already there in the frequency table, but the
> question is if that's the capacity OPP.  I guess we need to assume so?

okay, I was just to confirm that this can't happen

>
> > We keep taking the max between freq table and cpuinfo.max_freq fo the
> > case where the boost freq is not listed is the freq table or there
> > isno freq table. Or there is another way to get teh boost freq in thsi
> > later case ?
>
> No, I think it's the only way.
>
> So init_cpu_capacity_callback() should find the highest frequency in
> the table (regardless of whether or not the "boost" flag is set) and
> set capacity_freq_ref to that one for each CPU UUIC.

yes

>
> That's roughly what the patch does, but it can get away without adding
> a new field to struct cpufreq_policy.

Yes, That was my point: we don't need a new field to find the highest
frequency in the table (including Boost OPP)

Thanks

>
> And the changelog needs to be rewritten to tell the true story.
