Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793201765;
	b=GqG24hY8Yxuf4FOtaNfyAbDu9KjomVr7/lSZZ5hwheaC6b3FR5fK7NLpSTPFmoKN4JSM
	 nEyiP5UEBUMyXgje03+RMyoMqgDWtcFGCFC0fYccqtpMVNayjnveQPLtG9GFjXvT9DkbU
	 LMFG89+oj1m572sjtVTO1d2V1QS5LIP8ZdbFiB8nUlzyMsjl30/p4g++knFeU45UHKtAf
	 fZ/ht/MkYi/aE5Huc0fu51TuTREhx1prtxHS4ETcX+cHQ3FcyBwvqhSCIRupL5OVVhA7K
	 mriDxr+KWgx6v8FgcdjwD6UXFsJEXoOMoMD2CJLimsKQeH3Rb04PJz71vXKsJP3V6fQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793201765;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
	b=bL+ZKwsJQo1lo6eEAlhP5gGteCXMe9Y5XakjXPVvf4A0a3DGDUPuIR02zwk1IC4M0NT3
	 1F8vsBqgSlIi6nC9cbwf65OdwxzlR1j1EvuPK0XPWMVIcnRvJ5ni5AI416rjbqCqoMtZ6
	 i6gQFAR6Mfr/sGnxUar+Iw9jyctgMDpjwxljV/GXI5ZjHBysDol/S9n5E+av0zo8pdV4a
	 6kgM9sEP9I3KE5Fu8f+Oo6daGV5XxCH0hLvsdFVIbuAWPaf9K4kYaXtSRENoGO3i+lRND
	 43i8tfcbynXzCJXJZCpc1/uvkpMUG1M6QohKMZ8LJuWSxhEoMV7bpfuGZKNID0YkQlg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mf9SYFED;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B9A7606A323
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 15:36:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B9A7606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=mf9SYFED
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-535f598d126so291851cf.1
        for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 08:36:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793201764; cv=none;
        d=google.com; s=arc-20260327;
        b=YlB7l1xMntHUxM8C53k1eevMtoswJD6stvEYBezwtrkKY1hpQJyUPfhh0kN42DY/iv
         jDcg0ds1cSVxp+VZJ/EGg7V/xou4HX4Zy+pXMBoOmtsknDIjJgAZ9f7qQlD+CaMQU2/2
         Ttpajx2Nb22BdyUddH+i7/X4FPSECqXuw32soQoEhlJztP+ZKMtXmW3OY0u8Iz+LBILd
         g5rPWyI70uzfuCKSKvtdQDIFjAmNeRMpuNwolFZIdH0h+k7tWc5J76B/996csU8iaIgM
         fG05CkJnINllkI7PucRNidroDSepWRLSacUsSj1Id09+On+trglzIuUHLvt/UjaZgspJ
         8Yig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        fh=piNeWdPpCHIfKwZCgEAnxzfFRjdyuh/98n6ZhcwbZsc=;
        b=PSm/43d9offJ3AePponx4bo5TSHzcPhwhyFVtkX3GpYSkUnwu5rEe4P+tIPSMF68mi
         cswvrd0Sf97UuglQ1wXmh8EnWDuRga9DQiTzlhiofg+bgYdUY05bJrlM5Lr52h1gQlq4
         7LfFUDatq9FBGR8x4d6zFUdRrFAAxNbW+HwnPKXl1A2zDpMhxOEXnts7C+Hl6dhjATfo
         hM7gUJxFIVEEcFR2vEugCQrcQmLUYCVfcWPAtmXNqt3yd3Q6w9Rl+b/uEa5sGDw+hMsN
         MFkb7aIa4WAjqDDn0q3ERxQVO/rnfFCz+4saG0CNOjgrQ0D+jwE7RAmCbThD0GLokKlg
         1bSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793201764; x=1793806564; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        b=mf9SYFEDsXe9OqSwn09J5QZmBcn15LkHHvtkbfQliSti2e7W19ryef2jG3RkdgBwhI
         IwTjmnxuhDYN+t8bF2Vp5uN2WFqUEyK/rVLKx3VAusaUnJnRl2Ld8KtpwOsQ1lwp0onn
         aLHNtHGVY4EDlwcBMg0jFTAF4129pXjmNmFpxlpG9bV7lvFnEyycQZCvLbVBMOFNMQv2
         1qP8AF71HV61oaAbnYCwFdE+xSTiFYqdqjZZCOcIIfp6jgFGpiCItGna6P6IBA5zyvj8
         gO0liO8+lmOdqMjO7/FIXUCF0nbjWzkQl+TysWuAxtnpf2brbw5BqDTNBZ3YDRsu43Mh
         KPEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793201764; x=1793806564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMDYK1ZjnbIiPQHcJc7SpOjyQ4Wy/ZaG15fuBEkM+6c=;
        b=ViQw0gjLfm2Duutbx5OifSwsrVju5g/c9czNF/0agf1C+8SwyLEb5vzHEb3GowWwDM
         mhc00zKnoYgB3j5tVUxoy+DX8KczBPzwJh1z16GeuyKGL0MegixnlpM+4yclL9PoDZUp
         zbrm1v+ZuQxoJg/0lgZpWrDV24fg3ZABuUfRfrECAc1GbiRia6KL34+bMFNBwYtGY/9l
         7h+x2CHDs2uzBIvR+4pFk0Sx0M2e0bH3LO/l1w3CH8/ZFvTvPDguzw1/E/I4PV6CGjTG
         fnl0gV/zN3JlL4e55EBWaAPag/GSklNhwMyVfEFPUvh00Yf77BzMTohpE6etmSZfcAOw
         S4tw==
X-Forwarded-Encrypted: i=1; AKwUvBxineNPr+YEgvBuUMtBcV6EPrcNKy5y2gNqYJC1pubLHr/zGEks8cfV09q8rh++Yk8dfinkHOoehRsN2Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYI+5TJ/jrK9TLSMrOZ/q9vnw+ABi4j5lKPmZg8GSaD0NV+LXd6z
	ij3hJpHBtpnAN3zBUsRwWwADM1qB7MLUo3JJS+bslXGU3f5zzGXeR9L5C+SaK8EGgtzKivJ21M3
	aofqQY3ERlOGbozP0PjuN5BGPq6Wtlx98NkX8oY8HCItq7tHWW7adt5LI8EU=
X-Gm-Gg: AYBFou06eTUgAX91Gjr8ZNu04RA1wETLAt5sU6ZG9JekOPb4UPfiHgY7YrWJn8vCiOD
	JWE4gOE4o8a0fcMEnEjA6Q0SCWqsVDp2Sk/LHggcAbkn0nnIxc+H0yYPybWFXKcCGBTd/yDZt8n
	8URxw7F/CBQZGQVKfmVtG45HwbEfMY6lWWCr8dQXAaMl2Aqn545nRLYFD0KCuXdBFHueM8do2Dm
	dgsxUm1qGZVR4lEaftvndwd0HvI7I9gEH2veGovcM5jGHeIEZRvti+Lxltw2ey9INMyxnauKTtK
	kixU4F0ZRaj0Fqd+HX0Q+WB/EOsASpeLoBeZ9Eqv7FOiYSfFEmjJZQp0d0bVR4HJQC8pKXkvhTO
	+nRUqstmREBUYJ0mVdOnk8Ju2qU5Z5fVqHfnLlvUenMgPgOespES0e3OfVQU=
X-Received: by 2002:a05:622a:22a9:b0:536:97c0:dcd0 with SMTP id
 d75a77b69052e-53fc2aa1fa2mr21345071cf.4.1793201763129; Wed, 28 Oct 2026
 08:36:03 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261027223847.652884-1-irogers@google.com> <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
In-Reply-To: <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 Oct 2026 08:35:50 -0700
X-Gm-Features: AclHuK8Z1SdNi4k8-UQceLsnqDJD6d9aTo0cl8IQ7vlO1Fmucv2n8goL0VFX4iw
Message-ID: <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Kees Cook <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Zhihao Cheng <chengzhihao1@huawei.com>, Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>, 
	Sumanth Korikkar <sumanthk@linux.ibm.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev, llvm@lists.linux.dev, 
	linux-hardening@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-pm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-sh@vger.kernel.org, linux-s390@vger.kernel.org, gfs2@lists.linux.dev, 
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org, 
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 28, 2026 at 4:39=E2=80=AFAM Rafael J. Wysocki (Intel)
<rafael@kernel.org> wrote:
>
> On Tue, Oct 27, 2026 at 11:39=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
> >
> > Export cpufreq_dbs_data_release() and set .kobj_type.release statically
> > in the ondemand and conservative governors so their gov_attr_set
> > kobjects have a valid release callback statically initialized, matching
> > cpufreq_governor_dbs. Remove the redundant runtime assignment in
> > cpufreq_dbs_governor_init().
> >
> > This prepares for annotating struct kobj_type::release with
> > __must_init.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
>
> Do you want stuff to be picked up by maintainers, or do you want to
> route it yourself?

Hi Rafael,

Just a quick note: I agree with Zhongqiu's feedback and the commit
message needs a fix.

Regarding merging the patches, the issue with maintainers picking up
fixes is that the series will break the clang/llvm build without them.
So the maintainers need to either merge the patches (and the series be
rebased on top of them) or merge the series as a unit. Perhaps since
the patches align, merge conflicts won't happen, so maintainers
merging and landing the series is okay. I don't have the experience to
know.

Thanks,
Ian

> > ---
> >  drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
> >  drivers/cpufreq/cpufreq_governor.c     | 4 ++--
> >  drivers/cpufreq/cpufreq_governor.h     | 1 +
> >  drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
> >  4 files changed, 11 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/c=
pufreq_conservative.c
> > index 02bfd46543e9..146a2353b1a2 100644
> > --- a/drivers/cpufreq/cpufreq_conservative.c
> > +++ b/drivers/cpufreq/cpufreq_conservative.c
> > @@ -318,7 +318,10 @@ static void cs_limits(struct cpufreq_policy *polic=
y)
> >
> >  static struct dbs_governor cs_governor =3D {
> >         .gov =3D CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
> > -       .kobj_type =3D { .default_groups =3D cs_groups },
> > +       .kobj_type =3D {
> > +               .release =3D cpufreq_dbs_data_release,
> > +               .default_groups =3D cs_groups,
> > +       },
> >         .gov_dbs_update =3D cs_dbs_update,
> >         .alloc =3D cs_alloc,
> >         .free =3D cs_free,
> > diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufr=
eq_governor.c
> > index f3bd3dbe7c41..f8b5aca09b6b 100644
> > --- a/drivers/cpufreq/cpufreq_governor.c
> > +++ b/drivers/cpufreq/cpufreq_governor.c
> > @@ -419,7 +419,7 @@ static void free_policy_dbs_info(struct policy_dbs_=
info *policy_dbs,
> >         gov->free(policy_dbs);
> >  }
> >
> > -static void cpufreq_dbs_data_release(struct kobject *kobj)
> > +void cpufreq_dbs_data_release(struct kobject *kobj)
> >  {
> >         struct dbs_data *dbs_data =3D to_dbs_data(to_gov_attr_set(kobj)=
);
> >         struct dbs_governor *gov =3D dbs_data->gov;
> > @@ -427,6 +427,7 @@ static void cpufreq_dbs_data_release(struct kobject=
 *kobj)
> >         gov->exit(dbs_data);
> >         kfree(dbs_data);
> >  }
> > +EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
> >
> >  int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
> >  {
> > @@ -488,7 +489,6 @@ int cpufreq_dbs_governor_init(struct cpufreq_policy=
 *policy)
> >         policy->governor_data =3D policy_dbs;
> >
> >         gov->kobj_type.sysfs_ops =3D &governor_sysfs_ops;
> > -       gov->kobj_type.release =3D cpufreq_dbs_data_release;
> >         ret =3D kobject_init_and_add(&dbs_data->attr_set.kobj, &gov->ko=
bj_type,
> >                                    get_governor_parent_kobj(policy),
> >                                    "%s", gov->gov.name);
> > diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufr=
eq_governor.h
> > index 806d8fb4dff1..1026712bb79b 100644
> > --- a/drivers/cpufreq/cpufreq_governor.h
> > +++ b/drivers/cpufreq/cpufreq_governor.h
> > @@ -150,6 +150,7 @@ static inline struct dbs_governor *dbs_governor_of(=
struct cpufreq_policy *policy
> >  }
> >
> >  /* Governor callback routines */
> > +void cpufreq_dbs_data_release(struct kobject *kobj);
> >  int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
> >  void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
> >  int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
> > diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufr=
eq_ondemand.c
> > index 9942dbb38dae..7386d043c665 100644
> > --- a/drivers/cpufreq/cpufreq_ondemand.c
> > +++ b/drivers/cpufreq/cpufreq_ondemand.c
> > @@ -374,7 +374,10 @@ static struct od_ops od_ops =3D {
> >
> >  static struct dbs_governor od_dbs_gov =3D {
> >         .gov =3D CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
> > -       .kobj_type =3D { .default_groups =3D od_groups },
> > +       .kobj_type =3D {
> > +               .release =3D cpufreq_dbs_data_release,
> > +               .default_groups =3D od_groups,
> > +       },
> >         .gov_dbs_update =3D od_dbs_update,
> >         .alloc =3D od_alloc,
> >         .free =3D od_free,
> > --
> > 2.56.0.313.g2479322e68-goog
> >
> >
