Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DDB83A9638
	for <driver-core@lists.linux.dev>; Fri, 18 Sep 2026 12:36:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789734993; cv=pass; b=WhAnRWyMOZqXN2aF/SDRhtgjqYgIqrG3UeChaB1AF8GGqM3A9UudHAq9J5iEprSYSuoNSgQSAye3wPPaSwOs8JGyl/wL4esttJYLfTAUBy/sGzQJ8YKgRqDLsC4F2PUTS/02j+Hjy+cAj6UnGGmCDIg7nDG3117sVzBvD4gziks=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789734993; c=relaxed/simple;
	bh=ysnMiBH8a51PedUXUP+ET751iYcNEGGXFcUmatH4p/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnAblOw2XMC6FbQYePoyiPRlQ8+CUd+aKI6sVFXiXU+SjtQobnTI/KYmMhB4fJQVwm+/ExHtXWq2zO9ck2XIteu19lTTmQVm4hcio7VfcVg8BtXM716FcoUlO/XFG+PMPdXt8i86KOtHI1q5lpgpnF0jPcwa+d6tCPUsZeECLlg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=uLQWTrbT; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uLQWTrbT"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c254f6c7a58so87633166b.2
        for <driver-core@lists.linux.dev>; Fri, 18 Sep 2026 05:36:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789734989; cv=none;
        d=google.com; s=arc-20260327;
        b=R6UK77FGnz282xM/Sf5gfkRpZ4dGB5q0rJ+mwlBCaJaKdwN2EGHxzdmogUYo727PEw
         /KiHocbAyXrkLi93RNC7pLejQduOBoYTGqMICvxuf2ysVd86Z3FHXQNMYUWPDElcmplE
         0XGDdbxg3j5GnCD97mdGxMgQt6KlIEkIJ+P5EwN5g0FKFAiyKCG/j6/u38okflSo52pi
         uSOxpWFGmGNSygdcMDx03Y97M3MtgnOssHH+Yvg07Egn9PVP90rpqrNYdTiy89HMEHee
         yBf3dB+LnBGE3m/PeKTtZqVYROF8xT7Qz1NOZBp97BYRNJRbdOzR8hqUEO6HtmuSfCtH
         Gt4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=QKsYx66twfZvJriia1T7NKBKpGPrJrg+q151uNCCMjs=;
        fh=Jr3kQh7pRHC6IJqWAxZHwstb9mpi6HrQHwmtTzT83WA=;
        b=hBnFwbXhyZ7xbcWVuV1yr4fse5D2O0emcMTgRUHlBUmFv4I8rUEhNkpxcVxOJ/C8UW
         VP9SHS/GtHFUGUephiOJ7INxqTXJ+LaOH+k9B6BThGn0rMwaY7d9APTWzmnkYrLOGp4t
         yvUy5r/I4jkR7HI1MYhg3TWwZe3/K7SZK3DrGXdVKSjV5jxKTzbLZubbO+n5sWCSCghI
         if43XLsXcwoKplbWdW4ajYiH1Rd1CNZAgNO3GRds9IxXAGi2lCnWn7ELYyMSFRfUi48z
         0mYjJf3+tVsqrwH06pS2NHJTUGIAHHmP0lJn0k/piD1RWiST1QrUyRbp4GBxs9jBcqwd
         r3/Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789734989; x=1790339789; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=QKsYx66twfZvJriia1T7NKBKpGPrJrg+q151uNCCMjs=;
        b=uLQWTrbT7QU8zTilkkm0EiOOk9Qu7rMYwJJsaL80Ngazq721Jdy56nIr+1WXSKgG0R
         5xUmTHCfBFozXh30nspXXMa23ImJ/ocY0XNn+PGuUmLjxQQ4x98SWdG/4s00irNj870s
         DYQDalQ4ojNqSkUChAvOOA2vyic3Ch7DTckTQ6Ez/ACaelUboSzO/bbXgWP0O8FuwsMk
         njRNjDyTofbNmgfme0lqSKwjHmb4DEwj2DEqL5b5qZGTcba4KJMZSmzPbIv/67ZjAhtH
         lQEwNoxTTsMmzXZ8eMSimCPC9F3J8U5XSSakA5Khm/WRv+Gh0fg65EHa2Mp0V0M6pYF2
         VRrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789734989; x=1790339789;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QKsYx66twfZvJriia1T7NKBKpGPrJrg+q151uNCCMjs=;
        b=h1svS5R1fbRk/vztT6g91FbUArVe7SFEX0JbPVN/XiMyqQJKsgLCMkta5I93+JAdQW
         XsWuDoqAR4JtjTcF9YxWtl+1Q03DJbLOSCQDCBJ81bRIeE/yjGMNBkRkbZeallJoJiHw
         dZSzXi1okZhZyJgwB1gHgyU51u7yAWq0QvkAeckqFRFtNCnovV1+ZkciNJe1JrvQ1j6l
         PliZPZ+Hh7U2Vq4aex58nmILEIO5K4J9JXVLgjoJZ6DqHUpNxjrFnIYzg8U37muWW/QE
         aX+EfwaxbtgPj8SY0T7ojjdI0SkYtpMrvUUWk+V8Edzpdb4ldZQzw8f+EbKSyidWpsTt
         vOJA==
X-Forwarded-Encrypted: i=1; AKwUvBwzKE1E+Zp99V4GULwsGo6h2Kllz7SiP58VOuvQn7d2R8hcZhqtdwVdwS5OFJWhW2Do708chac3H2c2fw==@lists.linux.dev
X-Gm-Message-State: AFuF++nDek6l00KrvtuJjrTEhs+pRM+mj3ulS7F5RLEFEA8s6wxZ8mK1
	EG8oOAjDd2RtfcDx1pHa9yRAIEf/Xs25WOfuMIJa9qCS5bfnC9CAYEvbmltN2qgeqgY2Ck0cxEU
	3NDDMC4b9FkKa8hV9CCVA61OSR5tnwqol3dtR+YH9KjMeSoignJY4ov0=
X-Gm-Gg: AYBFou1yAybVlt8rqlWGqHi+lTt2TwrAdiogRWkQA4NyyV6KN90wXG0X+j4HZTZFA0J
	TIWd5/BeTz9lKPapV590of3svCVZurZzQWOsoRq+3rM2WPYHrH+ajs1bKhIQ+VcV9wT/vB5bZc5
	OaysWzagDwZOgznVvjPNnNIe1iL8KlemlHdKdA+7JMwM2bXkmoBcaUpOYDS2SJuTIsMyAOxNipB
	uZ333Q2JHvRttUDHNpAMCYFCOYz6WOmJ77+oVr1yL/EL6Vrr4MldX/Z3xyR0vFA6HWDRhe5hwRf
	Ix/BMcWcHQI+19PaYSy7MkNfuNlz6KneCrqevDw77Lxa3bHC+o6irxHrFUP5gnbfAoKwpBHVUdh
	rEgxMeb+zWeiR
X-Received: by 2002:a17:907:a88f:b0:c29:f0a4:a4f8 with SMTP id
 a640c23a62f3a-c2a1547f700mr254964066b.0.1789734989460; Fri, 18 Sep 2026
 05:36:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260908-schedutil-boost-frequency-handling-v2-0-25312a713699@oss.qualcomm.com>
 <20260908-schedutil-boost-frequency-handling-v2-1-25312a713699@oss.qualcomm.com>
 <CAJZ5v0jbYHcEWqqO3YSbwyeHBLkYCFn+_nQ9Ktt3yYPPcNH6LQ@mail.gmail.com>
 <CAKfTPtBkv2yG6ne2FG5NUY9QfeY2XTYg=GKnyzoFawkweK-EYA@mail.gmail.com> <CAJZ5v0h+ibqtvTyOqG+iy2vOLCXx9WwfHSoUu1URDCvzBYU_sA@mail.gmail.com>
In-Reply-To: <CAJZ5v0h+ibqtvTyOqG+iy2vOLCXx9WwfHSoUu1URDCvzBYU_sA@mail.gmail.com>
From: Vincent Guittot <vincent.guittot@linaro.org>
Date: Fri, 18 Sep 2026 14:36:17 +0200
X-Gm-Features: AcwNN1X-haI5NlBDtJXpiUSlIDI7Ing7knQH9apUE4h3FDeBzBoyuWxWIfi5Cts
Message-ID: <CAKfTPtATz-aToAVh4sGsTRKM+0sOoVW4AC6gjufAjrFyZg1zFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] arch_topology: seed capacity_freq_ref with
 boost-aware max freq
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Ananthu C V <ananthu.cv@oss.qualcomm.com>, Sudeep Holla <sudeep.holla@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 18 Sept 2026 at 14:05, Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Fri, Sep 18, 2026 at 8:24=E2=80=AFAM Vincent Guittot
> <vincent.guittot@linaro.org> wrote:
> >
> > On Thu, 17 Sept 2026 at 21:07, Rafael J. Wysocki (Intel)
> > <rafael@kernel.org> wrote:
> > >
> > > On Tue, Sep 8, 2026 at 10:31=E2=80=AFAM Ananthu C V <ananthu.cv@oss.q=
ualcomm.com> wrote:
> > > >
> > > > capacity_freq_ref, the per-CPU frequency-invariance reference used =
by
> > > > schedutil, is seeded from policy->cpuinfo.max_freq at policy creati=
on.
> > > > If boost frequencies are filtered out of the frequency table becaus=
e
> > > > boost isn't yet enabled at boot, max_freq only reflects the non-boo=
st
> > > > ceiling, so capacity_freq_ref never learns about boost frequencies =
for
> > > > the policy's lifetime. Enabling boost later raises policy->max, but
> > > > capacity_freq_ref stays stale, leaving schedutil unable to scale
> > > > utilization or target a frequency above the non-boost maximum.
> > > >
> > > > Track the highest frequency in the table regardless of boost state
> > > > (max_table_freq) and seed capacity_freq_ref with max(cpuinfo.max_fr=
eq,
> > > > max_table_freq), so the invariance reference is boost-aware from bo=
ot
> > > > regardless of whether boost is currently enabled. Runtime enforceme=
nt,
> > > > still handled by policy->max, is unaffected.
> > > >
> > > > Suggested-by: Vincent Guittot <vincent.guittot@linaro.org>
> > > > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > > > ---
> > > >  drivers/base/arch_topology.c | 3 ++-
> > > >  drivers/cpufreq/freq_table.c | 6 ++++++
> > > >  include/linux/cpufreq.h      | 1 +
> > > >  3 files changed, 9 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/base/arch_topology.c b/drivers/base/arch_topol=
ogy.c
> > > > index 8c5e47c28d9a..da94f77441da 100644
> > > > --- a/drivers/base/arch_topology.c
> > > > +++ b/drivers/base/arch_topology.c
> > > > @@ -404,7 +404,8 @@ init_cpu_capacity_callback(struct notifier_bloc=
k *nb,
> > > >         cpumask_andnot(cpus_to_visit, cpus_to_visit, policy->relate=
d_cpus);
> > > >
> > > >         for_each_cpu(cpu, policy->related_cpus) {
> > > > -               per_cpu(capacity_freq_ref, cpu) =3D policy->cpuinfo=
.max_freq;
> > > > +               per_cpu(capacity_freq_ref, cpu) =3D max(policy->cpu=
info.max_freq,
> > > > +                                                     policy->cpuin=
fo.max_table_freq);
> > >
> > > So isn't capacity_freq_ref supposed to correspond to the CPU capacity
> > > returned by arch_scale_cpu_capacity()?
> >
> > capacity_freq_ref is the frequency that has been used when computing
> > the capacity at boot
>
> I get it, and so it is what I wrote above: The frequency of the CPU
> when running at the arch_scale_cpu_capacity() performance level.
> Isn't it?

Original it was not strictly tight to arch_scale_cpu_capacity but to a
ref capacity but it ended up being arch_scale_cpu_capacity

>
> > and it should not change at runtime wether the
> > boost is enabled or not, otherwise you will have some fluctuation on
> > the system capacity that will create issue with PELT and scheduler
>
> So the capacity should be constant and consequently, capacity_freq_ref
> should be constant.
>
> Also, if boost is not enabled when capacity_freq_ref is set and there
> are frequency levels marked as "boost" in the table, it cannot be the
> maximum frequency in the table because that's not what is used for
> computing the capacity.

I'm not sure I follow your last point above. It's not because boost
isn't enabled at boot time that we can't the highest boost OPP in the
table as a ref freq to compute  arch_scale_cpu_capacity. In this case,
the CPU will have a pressure on its capacity until the boost is
enabled. Do I miss somethign ? Can the boost OPP be added later? We
keep taking the max between freq table and cpuinfo.max_freq fo the
case where the boost freq is not listed is the freq table or there
isno freq table. Or there is another way to get teh boost freq in thsi
later case ?
