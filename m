Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E3EE37187E
	for <driver-core@lists.linux.dev>; Fri, 18 Sep 2026 06:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789712654; cv=pass; b=CVikC6v4u42CogNk+AQcSQcT9eOYwnPI2v1TiZhZXj5qEQM9Sdw8rxfpJqkVOtIYQluN0v9t8MWU9y9aftN8Lg3pSpFDAIKPbfS0JcWwztU1yzYLxD479XxswH01RcB6+q2NSJXdEI9ArYg5lkfiABjJrPKBjXZ49nMTSBXQOLo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789712654; c=relaxed/simple;
	bh=gKWw9x8JTodOcnvmRxh+PRPQHGvF1rrY+vB8Pdy4+pg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=T30WmCP/UzE5Ucc15Pe/ujptss4f1Q1DIgYu2WCej8E1xqh/+fpueZJxRr4gFtBNmtjxZuBsVYF1+s7h7Yxp2VmIsIZeANdvD7JEAqmJwb1U9mzfLGt1e226y8+9HHryx9Mcm/dH2xHK1dhPU1ipxU+hf+uHXR5e4gwfK8VXjKo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=SB4eHUt8; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="SB4eHUt8"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so42197466b.2
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 23:24:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789712651; cv=none;
        d=google.com; s=arc-20260327;
        b=qH4oo9hOunjfL2/B52m8QzVpXuP/pni3z3y2i3Bxx5iSx1kDp0uIcq8B72CcOc0Mde
         H+Ss0RNUpQZF0wvoVqULKPzzl8MrN0NmLrM6yk/lN4W2t0zZFaBtzlqJ9KskhVWWYS7g
         j1SU8M9zeFrwq6tdN58vf2YYbLQCIhCqnxP1Np67Tv45nDbufXD0ZqbYFHn5+N3bubZ+
         03dN3Fo76LaOB/ElRbWp4ylOBrQu0tepvHAiuwKoEF/kHzt1IxhXTAjRFNTM/NND8piO
         R7BLpX7R14zqLAYdPm2iOiKpUKtOSaMpprE9zCf1mTAFqwW59L1wmG+Gj/aO0y2y1JcM
         4V2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kdsDMzj/jYDg+/+97ftsy96QA9ZEuHC8rFxTpWMNjyk=;
        fh=OTEu79coY4BaZHrHuB3hPSN5VuOc5qCd343ewtMnPE8=;
        b=luhX163I2fFlWtS3hDmd8VNilMbZSCwXBm66qNRX5yNESv+MJdBcfLXZMTGIjzJGjl
         RT8tBVtWETgXHEg4NsuZ3tJv6B3hrT7RTq1edjdzfAan7A2xIwUV+YFKgIjCxleWwnps
         ZyDfqjuTR/B8hl5R+ebZZHEmI6xhGtOZJ1WGN/CLs4f+KczpheSpeXtnRaxmuPYIFxm/
         TsZgDAliCRe4RBJNB1yL8AYrsJqcSgJHiTlnWVMjyXFmtjtbxWHjgvcWXczxW02rD8OA
         BU6F+JPe8OGM1CORzzXRhomOjADohO+sYFJXBTYJEsXM+qGxEdqfHyEf1sX7QV0qbc1x
         bIjg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789712651; x=1790317451; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kdsDMzj/jYDg+/+97ftsy96QA9ZEuHC8rFxTpWMNjyk=;
        b=SB4eHUt89hlt/5kV5NKDuV+Xwsu+IW7dAaPVAwnkUNv/ndLTIQeTRrfmkpkEou0dqG
         jLhggeTODqYM/6uyctk0GnghhGg3kUhTyRoyU/hpWSln65EBChno7x5y4xHtWkkD+D6f
         W4SJ+MMHvq4/85x52YocXvm6mewe6BihzyXGrxgf5/ZiFcT/uF4ZSwFGumy7vQa1Griz
         9lGp1+kJUCHKdU0wic9jFBo7eeFWHCOxak5uD6ONIiW5+tDzqNCjr0gvIp38dJigBCtC
         +gTbJWVY+UZxzZGkJoyw9zDG9cAVTI/ckWdIw5bNyPTcIMGlrvHQ9Rb71yfBPb4VOefe
         XnDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789712651; x=1790317451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kdsDMzj/jYDg+/+97ftsy96QA9ZEuHC8rFxTpWMNjyk=;
        b=mlcjvPZQiNVTxTEdijvFqN3ryE8KeEk8XM8mAJxMHm/MUF2ui1AH3y4D73WngDwVVF
         WLNd71fqNFzBW6e78waT/XE+5ocpWs4a0u3CZlLXn43UZW+sP9uwkjCt/opYTKD1vQYz
         jjdBUG7NzZudwjQI7fRt33zsqizn7LiDO+woxRGL1AS0Kul1A+aTUNjsY+gDXDUqH9Py
         FeYZ0cSsA/qxVwM2nddVXDSWSyUdErVSRLM8ltDBhpgNaNgLlE4HmCj26C7F8wGjEYGi
         foJYGZ7tiTaPFdLGOQso6IBnyBf8sSrswr2NOuTyYgi2af2xItOeyHz0x3oKDtOP2qV8
         iFEQ==
X-Forwarded-Encrypted: i=1; AKwUvBzH6rx5j5EVx/kZ2WgXX8v7MJJd48VQpag1iaiBblmXwiJYxZdKOdANnCVvPrPD73Dt9F4p082uxpWO0g==@lists.linux.dev
X-Gm-Message-State: AFuF++nDgqJ4UEs6ZdkODgSj7vBYSTSzzECVIsnONEC90cS0kl9h2rFO
	dTYppnTL1IrE48FH1EfhLVt0/9/t4+4njw6nBmxMeugOlDxYe7UKD6caxi2eXzx6VvfhjXF7IpJ
	IYMPJ7bifaczn27BxDTPoZLADCJex7ycDhFbiTWRFSQ==
X-Gm-Gg: AYBFou2RdBbByXO6Mfjm30w1H4YktAeOfTks4xNin5lZJvFq3Uk1o/cZyGLNQW6SbCR
	KxaKrgYt3SqZPMZ7J27qHvPmjgb33kAlyELGM/kks6oX5eZU3mREIKgEs+D5gKI6VtFVt3J5Ugx
	IehD4mfwOkGOVNwtWRmo4icYkxjsViXAZvexYLVcULJAfsz1/psINeVEgevjzryb1ORbfOd33S5
	I53KV3ybeE11oUVHfJBhWx8vl/rsONLtX4PQD81IwckjyD/vVZs0vfR5GJAIMeyFv8jwxPKy1fu
	/ruNTUyu+6+tz2EtjW0AhYlrfGI4hq6ZxYhohF50KxTXiQ259MUPnzoAVN+KdbhKTK2yul0fCKZ
	CrmelqOxJazG35uCw/alh0JM=
X-Received: by 2002:a17:907:80a:b0:c29:41d1:a0d5 with SMTP id
 a640c23a62f3a-c2a157da402mr160549766b.18.1789712651224; Thu, 17 Sep 2026
 23:24:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-1-25312a713699@oss.qualcomm.com>
 <CAJZ5v0jbYHcEWqqO3YSbwyeHBLkYCFn+_nQ9Ktt3yYPPcNH6LQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0jbYHcEWqqO3YSbwyeHBLkYCFn+_nQ9Ktt3yYPPcNH6LQ@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 18 Sep 2026 08:23:59 +0200
X-Gm-Features: AcwNN1WhgIxSpocDyghjtGrojLm9grxaZjWOAuwhdngiTrD_2aaRj1QPhPIvXvw
Message-ID: <CAKfTPtBkv2yG6ne2FG5NUY9QfeY2XTYg=GKnyzoFawkweK-EYA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arch_topology: seed capacity_freq_ref with
 boost-aware max freq
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Ananthu C V <ananthu.cv@oss.qualcomm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 17 Sept 2026 at 21:07, Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Tue, Sep 8, 2026 at 10:31=E2=80=AFAM Ananthu C V <ananthu.cv@oss.qualc=
omm.com> wrote:
> >
> > capacity_freq_ref, the per-CPU frequency-invariance reference used by
> > schedutil, is seeded from policy->cpuinfo.max_freq at policy creation.
> > If boost frequencies are filtered out of the frequency table because
> > boost isn't yet enabled at boot, max_freq only reflects the non-boost
> > ceiling, so capacity_freq_ref never learns about boost frequencies for
> > the policy's lifetime. Enabling boost later raises policy->max, but
> > capacity_freq_ref stays stale, leaving schedutil unable to scale
> > utilization or target a frequency above the non-boost maximum.
> >
> > Track the highest frequency in the table regardless of boost state
> > (max_table_freq) and seed capacity_freq_ref with max(cpuinfo.max_freq,
> > max_table_freq), so the invariance reference is boost-aware from boot
> > regardless of whether boost is currently enabled. Runtime enforcement,
> > still handled by policy->max, is unaffected.
> >
> > Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  drivers/base/arch_topology.c | 3 ++-
> >  drivers/cpufreq/freq_table.c | 6 ++++++
> >  include/linux/cpufreq.h      | 1 +
> >  3 files changed, 9 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.=
c
> > index 8c5e47c28d9a..da94f77441da 100644
> > --- a/drivers/base/arch_topology.c
> > +++ b/drivers/base/arch_topology.c
> > @@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_block *n=
b,
> >         cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cp=
us);
> >
> >         for_each_cpu(cpu, policy->related_cpus) {
> > -               per_cpu(capacity_freq_ref, cpu) =3D policy->cpuinfo.max=
_freq;
> > +               per_cpu(capacity_freq_ref, cpu) =3D max(policy->cpuinfo=
.max_freq,
> > +                                                     policy->cpuinfo.m=
ax_table_freq);
>
> So isn't capacity_freq_ref supposed to correspond to the CPU capacity
> returned by arch_scale_cpu_capacity()?

capacity_freq_ref is the frequency that has been used when computing
the capacity at boot and it should not change at runtime wether the
boost is enabled or not, otherwise you will have some fluctuation on
the system capacity that will create issue with PELT and scheduler

>
> If that's the case and boost was disabled when the CPU capacity was
> computed, how can cpuinfo.max_table_freq correspond to that capacity?
>
> >                 freq_inv_set_max_ratio(cpu,
> >                                        per_cpu(capacity_freq_ref, cpu) =
* HZ_PER_KHZ);
> >         }
> > diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.=
c
> > index ea994647abc8..4984142dc08a 100644
> > --- a/drivers/cpufreq/freq_table.c
> > +++ b/drivers/cpufreq/freq_table.c
> > @@ -33,11 +33,15 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_=
policy *policy)
> >         struct cpufreq_frequency_table *pos, *table =3D policy->freq_ta=
ble;
> >         unsigned int min_freq =3D ~0;
> >         unsigned int max_freq =3D 0;
> > +       unsigned int max_table_freq =3D 0;
> >         unsigned int freq, i;
> >
> >         cpufreq_for_each_valid_entry_idx(pos, table, i) {
> >                 freq =3D pos->frequency;
> >
> > +               if (freq > max_table_freq)
> > +                       max_table_freq =3D freq;
> > +
> >                 if ((!cpufreq_boost_enabled() || !policy->boost_enabled=
)
> >                     && (pos->flags & CPUFREQ_BOOST_FREQ))
> >                         continue;
> > @@ -57,6 +61,8 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_po=
licy *policy)
> >         if (policy->cpuinfo.max_freq < max_freq)
> >                 policy->cpuinfo.max_freq =3D max_freq;
> >
> > +       policy->cpuinfo.max_table_freq =3D max_table_freq;
> > +
> >         if (min_freq =3D=3D ~0)
> >                 return -EINVAL;
> >         else
> > diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> > index 35ce665edfd8..3f3b1380251a 100644
> > --- a/include/linux/cpufreq.h
> > +++ b/include/linux/cpufreq.h
> > @@ -45,6 +45,7 @@ enum cpufreq_table_sorting {
> >  struct cpufreq_cpuinfo {
> >         unsigned int            max_freq;
> >         unsigned int            min_freq;
> > +       unsigned int            max_table_freq; /* Highest valid freque=
ncy in the table */
> >
> >         /* in 10^(-9) s =3D nanoseconds */
> >         unsigned int            transition_latency;
> >
> > --
