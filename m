Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D7973A784F
	for <driver-core@lists.linux.dev>; Tue, 15 Sep 2026 07:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789459117; cv=pass; b=KpK4jE8p+JJJblA4jmeoPoRckYpaZwm/4VX4HPmJ56eQaXPH1Csk7Y8Txh4KSOpSn+GU47Ir+16THV0Utlt5uJou1eacaK+3GhSB6MfKmObSfApkav5eZ6iCGCBelAlsr06Tl8+QH/RXlGygyJrg4IzscFlAWUazOs13qQrYIBA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789459117; c=relaxed/simple;
	bh=m+QNxznO+HXTgUeCgcEy5d2xUE+4TuNok1338BQwzsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JAZcxuH6naIXAFPsuOeUVtnEGejEtGaUkdqhKS27v/YmhgHj2AjHcDo95USX6bknu8dL7fgihkYbzxRNt5sLp/F8bYodvXA3Nolimc193jctTLE68suoqS/i0ckXnUuEw0pR8lBG3f7xXvsxTK8eE87kmKy/UwRgEGquZkfMGPQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Fj5r4R2z; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fj5r4R2z"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f55efe5so430889366b.2
        for <driver-core@lists.linux.dev>; Tue, 15 Sep 2026 00:58:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789459113; cv=none;
        d=google.com; s=arc-20260327;
        b=iDifvaWorpq+gGn9KC+yNTtTLFo/TUZq5LK9A3sg73PM+SuICssfgeYfnUdTWYAb2o
         H0qcfd8svHw9xR4sVQkA8siIaW9Bby13mxNOaaYAXLAYbWIOgx3av26uuEvzxmGzAIYc
         P8oa6pbdq3XpgBMqwF1r6NII5juru+tr/E4DRbePZU8appd5II1nhlMsp50CXK99y2QJ
         xg1yROpgIm+NebaGdr1B7dMeh6+p7kjnEWd+lBm4P9C/mS0rcVs8F22d3AiGYEwsVxyz
         lALM41NSnvRL/Sp8cmxU74Tq9kqv+edtd70x0s0lbfNR0Jkh4EtpHu1CFfsVFxUSmqhr
         4uUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ofwNGJG0cUmDsej5vrEKKI6garptsrxwAcW3JjuPf6A=;
        fh=zqri3dzRSPDQK/33cyMas5ke5n+b1QQZ3QIJhEZkmdQ=;
        b=bJb2US/lsjYSqIvD52mrm9mlpNVlIBHKVJgpiUbC8btTKaBkAvKyQB5Q8NvKogydcX
         MnS15TmgeEGevLhyKBgDZtX0KZnHI5xMrFODsxxB78VFBZzQLQaYDjuUQnvl0+ThwPUT
         ugPPeIJ2RYwNsmEpNueR3BFVeganj+bRIm5Hw0TZo4yl1MmrYoviYcC4VX4oZqMRzbyr
         SXmX4y5ZO02EnfFR8XFWXgdvyCOkX78yMZDEuvvByME45O3k8bB+hLJEANoyJijG7M8z
         FO1SVA+AGTRMy5ZFRRU8gYkuDD9420rfNjEMLziLB+5A3U3WoQgOWbASxCg1iSusoD2x
         AVwg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789459113; x=1790063913; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ofwNGJG0cUmDsej5vrEKKI6garptsrxwAcW3JjuPf6A=;
        b=Fj5r4R2zcQEhVZErFLGt45u6r3PyzBjdhzkRFwHaarwVYDuH9wNbv7oquPh/GMN1Pt
         0U2TcbA8iWFsfUSdT4L91QHKkEoBjac3vaAw7bjF4e3bP/VDxyLChcc0Rpdv39hyt1Tg
         YvLk6JZwiCktyHIbXOnDodjVdIizQBCupFMWdong7CMKxDENsq49C6Mj/AEcSBoMl2F/
         D7DkUxqv43helX65OldLSaJawveUw+M0gSMqoXUdmiGOwHULyFY7Nll18KDki2v+7wyZ
         YsaC8n/2wPsVK6trHOyX7TYF87GSdEKSu7w8AmCXehxh8ha9FK+EbzSY0SD4o1id0T2f
         KXJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789459113; x=1790063913;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ofwNGJG0cUmDsej5vrEKKI6garptsrxwAcW3JjuPf6A=;
        b=D6QgXG0wB2mbAXdIePVCzuZfsQGOlB17QohhdftX5+fgzLHCqXh7X0AN0NkX6jiz7e
         9cUMCmA9aWRyVIsHNJgQhT+mAey4ABj3d7GFe73Sf7MxvxLxDibit2bKuQ9Cg/bwVG7I
         1GX8OYQ1deMIKrK70Clysr4CCYk1E9kPY+RUtBNgVHzcGily8eojSkOpZu8SwtE43///
         pRATEadpX+CibuQWtO3LIS85nKsh2M3+UwXgHrc30r0hU2u1a3opm7PsH1hEwLIKZh/1
         ijmN+gK+T3LTDQbXTnClowZBwxw1SEe44/DFCorMTKCK7onPz4zzm5GfM7jn/507oiBX
         ufOg==
X-Forwarded-Encrypted: i=1; AKwUvBzHNke5Qz+M4cZCzFYGij/CuC0utUX5alWOh2bB07eaz/as9hfdMTjlwKwbHJCpG9CuiI6Djnuc5n3voA==@lists.linux.dev
X-Gm-Message-State: AFuF++nkfz+7mhD3gnH+rLn/hdY42ZNigtbcBHbt/1EcHfVbr0EaQ4F0
	5u3LUy8K6yREho5VBFjQeuSX2loxKwJ2TzZpC1T9HF8b6eigrHOIiohPasHrF9QQRlJsDxszCyf
	P6bU+PK3MfI5JGT2kDczfwlAcZNWlNXRneTZ0gCgfvA==
X-Gm-Gg: AYBFou3sNPU03thqaBkoIibWkDFeR5/ZCHmUOU0oXWriyh+OxDt2BYwiFFe2XmJfgNS
	heLe5/YtvPwmZH5MAfpT8HbOjcdxi22+y1p0zn0QKbqcDWZciW5hq56urv8vaUUbszy0QUEw5m5
	URUREGZKp8rz4OWhrTqNOkuDPx0Z7fKaiv7KY2fNsnhGxB1HFNTZFimpxQ+BWGhNSwa/XMPS4Fs
	GJAK8xjqKn7+muqkdR/NbC5hRosgQT0TUVb0Dyjm9ZJKWZNRQ8YJ+wk2gurHx5gPw+E95d5Zwno
	VMzkIG/6JL/wdzMbpnq811FmOw/n5GtrZ0iNo8Jrk7ervd/HBELbPaj4I+DwMCIWK80WU3ZK5CF
	Z0UuDZtmz7M8=
X-Received: by 2002:a17:907:1ca7:b0:c24:87e3:b8b8 with SMTP id
 a640c23a62f3a-c29b85faa3bmr386122266b.17.1789459113184; Tue, 15 Sep 2026
 00:58:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-1-25312a713699@oss.qualcomm.com>
In-Reply-To: <20260908-schedutil-boost-frequency-handling-v2-1-25312a713699@oss.qualcomm.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Tue, 15 Sep 2026 09:58:21 +0200
X-Gm-Features: AcwNN1URr28u1JIvo7rjZT7TO6K2gihzqmBU2b4Y5-nAgC1kqqegrh2tO_zRhII
Message-ID: <CAKfTPtCR8SnQwpxzE-=WXenhTU=Hv5hrf7Vz22tMipX7uP_xxA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arch_topology: seed capacity_freq_ref with
 boost-aware max freq
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 8 Sept 2026 at 10:31, Ananthu C V <ananthu.cv@oss.qualcomm.com> wrote:
>
> capacity_freq_ref, the per-CPU frequency-invariance reference used by
> schedutil, is seeded from policy->cpuinfo.max_freq at policy creation.
> If boost frequencies are filtered out of the frequency table because
> boost isn't yet enabled at boot, max_freq only reflects the non-boost
> ceiling, so capacity_freq_ref never learns about boost frequencies for
> the policy's lifetime. Enabling boost later raises policy->max, but
> capacity_freq_ref stays stale, leaving schedutil unable to scale
> utilization or target a frequency above the non-boost maximum.
>
> Track the highest frequency in the table regardless of boost state
> (max_table_freq) and seed capacity_freq_ref with max(cpuinfo.max_freq,
> max_table_freq), so the invariance reference is boost-aware from boot
> regardless of whether boost is currently enabled. Runtime enforcement,
> still handled by policy->max, is unaffected.
>
> Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  drivers/base/arch_topology.c | 3 ++-
>  drivers/cpufreq/freq_table.c | 6 ++++++
>  include/linux/cpufreq.h      | 1 +
>  3 files changed, 9 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
> index 8c5e47c28d9a..da94f77441da 100644
> --- a/drivers/base/arch_topology.c
> +++ b/drivers/base/arch_topology.c
> @@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_block *nb,
>         cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->related_cpus);
>
>         for_each_cpu(cpu, policy->related_cpus) {
> -               per_cpu(capacity_freq_ref, cpu) = policy->cpuinfo.max_freq;
> +               per_cpu(capacity_freq_ref, cpu) = max(policy->cpuinfo.max_freq,
> +                                                     policy->cpuinfo.max_table_freq);

I will let cpufreq maintainer comment about the need for a
policy->cpuinfo.max_table_freq field or not but otherwise you can use
something similar to [1] to find your max table freq:
[1] https://lore.kernel.org/all/CAKfTPtBji8dkr5ixhtZjkyrWLA68TF-KHLrNYWoewPWLyuUd4A@mail.gmail.com/

diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topology.c
index da94f77441da..92966be712d5 100644
--- a/drivers/base/arch_topology.c
+++ b/drivers/base/arch_topology.c
@@ -405,7 +405,7 @@ init_cpu_capacity_callback(struct notifier_block *nb,

        for_each_cpu(cpu, policy->related_cpus) {
                per_cpu(capacity_freq_ref, cpu) = max(policy->cpuinfo.max_freq,
-
policy->cpuinfo.max_table_freq);
+
cpufreq_frequency_table_max(policy));
                freq_inv_set_max_ratio(cpu,
                                       per_cpu(capacity_freq_ref, cpu)
* HZ_PER_KHZ);
        }
diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
index 419c71ccff7c..e40f915b7119 100644
--- a/include/linux/cpufreq.h
+++ b/include/linux/cpufreq.h
@@ -1109,6 +1109,17 @@ static inline int
cpufreq_frequency_table_target(struct cpufreq_policy *policy,
        return idx;
 }

+static inline unsigned int cpufreq_frequency_table_max(struct
cpufreq_policy *policy)
+{
+       int idx;
+
+       if (!policy->freq_table)
+               return policy->cpuinfo.max_freq;
+
+       idx = cpufreq_frequency_table_target(policy, UINT_MAX, 0,
UINT_MAX, CPUFREQ_RELATION_H);
+       return policy->freq_table[idx].frequency;
+}
+
 static inline int cpufreq_table_count_valid_entries(const struct
cpufreq_policy *policy)
 {
        struct cpufreq_frequency_table *pos;

>                 freq_inv_set_max_ratio(cpu,
>                                        per_cpu(capacity_freq_ref, cpu) * HZ_PER_KHZ);
>         }
> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
> index ea994647abc8..4984142dc08a 100644
> --- a/drivers/cpufreq/freq_table.c
> +++ b/drivers/cpufreq/freq_table.c
> @@ -33,11 +33,15 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>         struct cpufreq_frequency_table *pos, *table = policy->freq_table;
>         unsigned int min_freq = ~0;
>         unsigned int max_freq = 0;
> +       unsigned int max_table_freq = 0;
>         unsigned int freq, i;
>
>         cpufreq_for_each_valid_entry_idx(pos, table, i) {
>                 freq = pos->frequency;
>
> +               if (freq > max_table_freq)
> +                       max_table_freq = freq;
> +
>                 if ((!cpufreq_boost_enabled() || !policy->boost_enabled)
>                     && (pos->flags & CPUFREQ_BOOST_FREQ))
>                         continue;
> @@ -57,6 +61,8 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>         if (policy->cpuinfo.max_freq < max_freq)
>                 policy->cpuinfo.max_freq = max_freq;
>
> +       policy->cpuinfo.max_table_freq = max_table_freq;
> +
>         if (min_freq == ~0)
>                 return -EINVAL;
>         else
> diff --git a/include/linux/cpufreq.h b/include/linux/cpufreq.h
> index 35ce665edfd8..3f3b1380251a 100644
> --- a/include/linux/cpufreq.h
> +++ b/include/linux/cpufreq.h
> @@ -45,6 +45,7 @@ enum cpufreq_table_sorting {
>  struct cpufreq_cpuinfo {
>         unsigned int            max_freq;
>         unsigned int            min_freq;
> +       unsigned int            max_table_freq; /* Highest valid frequency in the table */
>
>         /* in 10^(-9) s = nanoseconds */
>         unsigned int            transition_latency;
>
> --
> 2.43.0
>
