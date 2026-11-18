Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795021964;
	b=lglYtU8NmkrBsJbhCl6Ir8GkJvTOdPAeTefI7ad3km3VlU51YBpFljoXQmGKNepYL66e
	 sJyINudPnSiXR/rA0BZqsjPjztoHJEhUO/iTh5GvQeNpNzYZKCjo3N13Xki225kyKNb/O
	 pI+EP85SAxhz4fTYAw/YBiKa/Fk3+rYmA3JhymGlsdBKWu4okjVd0Qa7vs7SI5lcMiLb2
	 JiKkOO8GXTWrvvJIBWdpv58Nrc88asevrmnGd1eb6EQBMcntoP6+rHCPg5zKjDvBpcYLy
	 OETpoJUPbHUNJOS88uDIrr9q20b/WkK2fe0xu8y51PEbfTDUp2WUYegUdp20XQebzOw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795021964;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=kj5IcdHjs/z1V+/LJdG1g61ItzctekOK1S6KD/iqV70=;
	b=EXRPP54SWpr6YQskLBT5vIlmr0k4f4L54tCEUOGEUkahLbcsqQNWBZalSsoZyWC4Gxgw
	 eWShoX08MuYUlh/55EGvJoNrKQAaGuByS8nB4XqXMWZa8Ux1acWDwz9MqCGCQzj2ch/Iz
	 jPZilqYa0xxdJoHe3lxaYB2Rr7V0NNbpm6t/+l/l0HlTG0mDgK3ZFROoUcSTjePw69ofb
	 MoFc3LUa2vQQs611/PNHVMABjDNoJ/9kjN0j/za8PZH7fPfFWq4htPDqLG00zdHSAU7UC
	 aqmzpCAOHhQVTtqSk9o4DxtJQkwkItvKakOzxW0IZwnmVc+IbwBrPXNRPdrbw38H7iw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ICsgp9Rn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF1606A32F
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 17:12:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9FEF1606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ICsgp9Rn
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-54492d8a988so347841cf.0
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 09:12:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795021962; cv=none;
        d=google.com; s=arc-20260327;
        b=JKlOiGdbSGnpP8IAONO6/QJiEx+qxSEpgbJdba5KKcCjCtU5BtqLteVmEnzWfK08A0
         cBmMqs8PeYGt2xcPweA3JE5pgZib/9rM184wYMe6m5l+tMiNnobykvtEjtPb7vOmuul+
         CkgYTN8JN+x3hLJ+ISV+M17msyJxrd7JLtnMUJrHospkUXt3Y5qsf00k7IojxjaX1saJ
         25AJQ6DT3ZBdQEqsB3LugwNF0C7F0AQ++fYVA/RBKSwcgH9qYSBU7/FILzMAaAvdKf7Z
         N8sBxJFOxL13esOedDzHtTQUIeC5iSgxr53zhAK2TMfXMsa4G5ZSnpNoXc2RGi5xcpjN
         A04g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kj5IcdHjs/z1V+/LJdG1g61ItzctekOK1S6KD/iqV70=;
        fh=GsU775YAhcD87MbsS/jNQUY0o3Pf4DlglGwPeGjC1Og=;
        b=YsPrJoZ58ecEiPTag2UYiNeDktLi/sJl4w5SySl1Fp22RIi9Os7clKt5Ny8w8FsDG9
         zr4XJsQ175NwxO/u4KM83CLcKAxedqFB8UvEhsq/bXC00RB5bWR+ULt2a+nH7SmuSwpu
         qAE/BaLZKSdmtHZ37sckZOpOeMF0xnTIZt4D3ChVRvMQysLWxgP7Snl3h11XVlKeXm61
         N/fKAY4Qjmp0j6vIbZEK9Ygps3jg8nOjFqV7T8MHI4QMHc4geD1B1q/oEa/hEXYvk/p5
         1lxiyV+C8d29lUEwRonL4lLGE0+v6qPcCRpN1kD93v+t98d4DaJ9MIQb08oCLDNP3Om/
         bKuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795021962; x=1795626762; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kj5IcdHjs/z1V+/LJdG1g61ItzctekOK1S6KD/iqV70=;
        b=ICsgp9Rn/JS9ANs0PcstaHnOjVey8/JvzcWCxvQwkzoTmIGpq0ocZv9lX2Ic1Fof7q
         6se/6O2TEND8UZk/JHr7TJx2UtDd0z82v4rfW7sqL06JwyzIw7L4tH/Q8lU8s6z/PnWu
         YsGpCA/YIa8yDUgEBzJPw8vX3UkMnjufWqXnxEHoQj+lC6NDViPEdqffRd8+i8TzzdXy
         I3EGQIeUfYATDS6A51hB40Ke5qbzWiIWpG70MVDWm14d1HMixnnDhSg3+XZJZ49Awkbv
         3/H41XaACl9PHUD0JYy7RdvOAj72Rw8tvsRofCn4wIY/PWqHlUO7DpWARwyLwB0c5+St
         tl9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795021962; x=1795626762;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kj5IcdHjs/z1V+/LJdG1g61ItzctekOK1S6KD/iqV70=;
        b=kOgiGxaPFQ4fIFc5loipoqLMPre0LE/jIQvGS7I76dY7aLYXQ6EFpdBSs7PKLgStFA
         0Fwq3QKeiaklzitJS6ThgBY9F4cKBdYWMdc9mVNZn/xfKKrcId6DybRmc9Au9Eys6/Pf
         tjn7mvkRflL7lxSWxvKtbGvY82vznZB/8dE1h0GgyHywtslfuDzbjppHeWGVio35xPqE
         jl8njjrFDdOIFhcIQRSNvJGXwcoBFVln2GoqLFUBruYG+JKk/UdMM62gpVlRkGWf0Awc
         0wndnyAEx0lVkatmfSCJKUTUAX+XxQ+EOxzfZL7yJNtFZgdW4h3zItlBbDXHgulCq1Lc
         fzXw==
X-Forwarded-Encrypted: i=1; AL+hErHt92fhzoPjnKPT8iZDsLm2mwGtu4cT6v6EiX0dv2395RVoH+Ja/GxpXA2EeCjVR0/AnMPt+kGIOXfqNg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8XFwEyiUJ3n+lWvoGdjbPK7TKzE0GMoRe/kFKxkS5LNmLZlXYx
	mR2Uvh5d/DkiVGA7TFUxcbnsOumt0+sd9sW+mn42WKQ799YHbbPqdf11+fmRg9WdLA66bmkQGCH
	EOFD4y80Musq/nR+NMqAcAHJKn8nxzfsg/RsAbxUK
X-Gm-Gg: AYBFou1ZeLb4pvGLqOHmxtiG8f3DLICrafRCupPr1T1ivGnuUI40+sMHvgH5dZniGUK
	EaP7/GD6eE6U3ktUgxJncyX3aQaxIGkCStAL54/ucOp9k/PeIeiL9VWtZmjOuYZBi1B97eXFOja
	xaWDjQSsue8f93F+hKRH6v6Ssx6xunS+RZe69XguyHoIr3FRkg6dzCcI0vfJWV4ijwgeYcxGU1P
	9EZCIfEZtRplConbW6+1/G5byq9MGJ1SnPUOCoWhYKT0dxf/dS2Yl9AM3CDbb1LTdrd7oDnuhwo
	xT/+0srjGx2Ba6ZmgavTGf3X/mPrEQlY65IRYBac6JwJbIy8oKyrgOOt1hNraVjQWm7SvwsDg9L
	CCBncmdf3f3tBm0rvERkyceiDP3WSQ4ZRsdb2/Iif20AL6yL2PjtrZtrjnae2YKRVQIxqTxqQAl
	xEf+1lX0vEQVA=
X-Received: by 2002:a05:622a:1dc5:b0:55b:ce7e:e65 with SMTP id
 d75a77b69052e-55d5c29fda9mr23970181cf.12.1795021960454; Wed, 18 Nov 2026
 09:12:40 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261108223913.3624571-1-irogers@google.com>
In-Reply-To: <20261108223913.3624571-1-irogers@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 18 Nov 2026 09:12:29 -0800
X-Gm-Features: Aa3M54qyzLQ2yGg7ApijI1zPo5xfsOEZjqndSHZFPBok7AO4SwuYd0EVkVosTyY
Message-ID: <CAP-5=fXEk-ommviDYeD6hMvsESJMHfajina4kjMw6NMuRfQmTg@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] Add __must_init and require explicit kobj_type::release
To: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Kees Cook <kees@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 8, 2026 at 2:39=E2=80=AFPM Ian Rogers <irogers@google.com> wrot=
e:
>
> Clang supports the 'require_explicit_initialization' attribute on struct
> fields to enforce that the field is explicitly initialized when an
> aggregate object is constructed, emitting -Wuninitialized-explicit-init
> (enabled by default) if the field is omitted.
>
> Following discussion at the Linux Plumbers Conference [1], patch 1 adds
> the attribute to include/linux/compiler_attributes.h as __must_init. In
> v1 it was called __require_explicit_initialization. Kees picked up that
> patch with a first seq_file user [2], and in that thread Greg suggested
> the shorter __must_init spelling, which Kees and Miguel agreed to. As
> the attribute did not land in the v7.4 merge window, Kees asked that
> this series carry the renamed attribute.
>
> As Documentation/core-api/kobject.rst notes:
>   "One important point cannot be overstated: every kobject must have a
>   release() method, and the kobject must persist (in a consistent state)
>   until that method is called. If these constraints are not met, the
>   code is flawed."
>
> Annotating struct kobj_type::release caught struct kobj_type definitions
> across the tree that omitted .release:
> - Patches 2-8 fix struct kobj_type definitions where dynamically
>   allocated kobjects, ksets, or enclosing structures were either leaked
>   on kobject_put(), freed prematurely before kobject release, or missing
>   proper static initializers.
> - Patch 9 annotates struct kobj_type::release with __must_init and
>   explicitly sets .release =3D NULL (with explanatory comments prefixed
>   with "Pre-existing:") on the remaining legacy struct kobj_type
>   definitions whose kobjects are static, per-CPU, permanent firmware
>   structures, or embedded in devm- or parent-managed allocations.
>
> Danilo Krummrich offered to route the series as a whole through the
> driver-core tree [3]. Subsystem maintainer Acked-by tags are still
> needed (and would be much appreciated!) for the following three patches:
> - Patch 2: powerpc/secvar: Add missing kobject release callback to secvar=
_ktype
> - Patch 3: sh: sq: Add missing kobject release callback to ktype_percpu_e=
ntry
> - Patch 6: xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_typ=
e
>
> Note on tool use: An LLM coding assistant was used to help audit the
> compiler diagnostics across the tree, draft the fixes and changelog
> descriptions, and verify builds and review feedback.
>
> Changes in v3:
> - Rebased on v7.4-rc1.
> - Note in cover letter that patches 2 (powerpc/secvar), 3 (sh: sq), and
>   6 (xen/sys-hypervisor) are still awaiting subsystem Acked-by tags for
>   merging through the driver-core tree, and CC those maintainers on the
>   cover letter.
> - Patch 1: Add Reviewed-by from Kees Cook; clarify that LLVM issue
>   #232483 affects Clang versions prior to its upstream fix (pointed out
>   by Nathan Chancellor).
> - Patch 4 (cpufreq): Drop obsolete reference to cpufreq_governor_dbs in
>   the commit message per Zhongqiu Han; add Reviewed-by from Zhongqiu Han
>   and Acked-by from Rafael J. Wysocki and Viresh Kumar.
> - Patch 5 (dlm): Add Acked-by from Alexander Aring.
> - Patch 8 (drm/amdkfd): Add Reviewed-by from Felix Kuehling.
> - Patch 9 (kobject): Fix omapfb manager-sysfs.c and overlay-sysfs.c
>   comments to describe managers[] and overlays[] as dynamically
>   allocated rather than static and note the CONFIG_DEBUG_KOBJECT_RELEASE
>   hazard, fix a struct-vs-member wording nit in usnic_ib_sysfs.c, and
>   generalize the commit message note on CONFIG_DEBUG_KOBJECT_RELEASE
>   (reported by Sashiko).
>
> Changes in v2:
> - Rebased on v7.3-16928-g83f32c773255 (v7.4 merge window).
> - Patch 1: Rename __require_explicit_initialization to __must_init per
>   Greg Kroah-Hartman; document the Clang >=3D 20 requirement per Miguel
>   Ojeda; note the Clang gap for file-scope objects without an
>   initializer reported by Kees Cook; add tags from v1 and from Kees's
>   posting.
> - Move LLM assistance attribution from Assisted-by tags to this cover
>   letter per commit 1e035297ffda ("docs: remove Assisted-by
>   references").
> - Patch 4 (cpufreq): Use "cpufreq: governor:" prefix, drop Fixes tag,
>   fix typo, and remove the redundant runtime assignment in
>   cpufreq_dbs_governor_init() per Zhongqiu Han.
> - Dropped v1 patch 5 (ACPI: CPPC), already fixed upstream by
>   commit 27954e29d7de ("ACPI: CPPC: Release CPC descriptors through
>   kobject").
> - Patch 5 (dlm): Call kobject_del() before dlm_recoverd_stop() in
>   release_lockspace() and the new_lockspace() error path, and wait on a
>   new ls_kobj_done completion before freeing the lockspace or dropping
>   the module reference, avoiding races with delayed kobject release.
> - Dropped v1 patch 8 (s390/sclp_mem) per Sumanth Korikkar: the
>   /sys/firmware/memory/memoryX kobjects are permanent, so sclp_mem.c is
>   folded into patch 9 with .release =3D NULL.
> - Patch 7 (ubifs): Add Tested-by and Reviewed-by from Zhihao Cheng.
> - Patch 8 (drm/amdkfd): Check q->kobj.state_in_sysfs before
>   kobject_del() in kfd_procfs_del_queue().
> - Patch 9 (kobject): Cover sclp_mem.c and the new amdgpu_ualink.c
>   ualink_xcp_info_ktype, fix the overlay-sysfs.c comment, and prefix
>   legacy .release =3D NULL comments with "Pre-existing:".
> - Patch 9 (kobject): The ioat, kunpeng_hccs and omapfb display comments
>   now say that the existing teardown can use-after-free under
>   CONFIG_DEBUG_KOBJECT_RELEASE (reported by Sashiko). Fixing those
>   drivers is left to follow-up patches.
>
> v2: https://lore.kernel.org/all/20261027223847.652884-1-irogers@google.co=
m/
> v1: https://lore.kernel.org/all/20261013223946.1836757-1-irogers@google.c=
om/
> [1] https://lpc.events/event/20/contributions/2392/
> [2] https://lore.kernel.org/lkml/20261014225811.i.852-kees@kernel.org/
> [3] https://lore.kernel.org/all/DMLWX8NY1N1N.2OMQMQCIVRR18@kernel.org/
>
> Ian Rogers (9):
>   Compiler Attributes: Add __must_init macro
>   powerpc/secvar: Add missing kobject release callback to secvar_ktype
>   sh: sq: Add missing kobject release callback to ktype_percpu_entry
>   cpufreq: governor: Initialize kobj_type release callback statically
>   dlm: Free dlm_ls in kobject release callback
>   xen/sys-hypervisor: Add release callback to hyp_sysfs_kobj_type
>   ubifs: sysfs: Use kset_create_and_add() for ubifs_kset
>   drm/amdkfd: Free queue in procfs_queue_type kobject release callback
>   kobject: Require explicit initialization of struct kobj_type::release

Hi Danilo,

Just a quick heads-up that all three remaining subsystem ACKs have now
arrived on the v3 thread:
 - 2/9 (powerpc/secvar): Acked-by Madhavan Srinivasan, Reviewed-by
Srish Srinivasan
 - 3/9 (sh: sq): Acked-by John Paul Adrian Glaubitz
 - 6/9 (xen/sys-hypervisor): Reviewed-by Juergen Gross

v3 still applies cleanly to driver-core-next (and b4 picks up all the
tags). Sashiko did flag more accurate Fixes: SHAs on 5/9
(8a4cf500f1dd) and 7/9 (2e3cbf425804) =E2=80=94 happy to send a quick v4 wi=
th
those and the new tags folded in if you prefer, otherwise v3 is ready
as-is.

Thanks,
Ian

>  Documentation/conf.py                         |  1 +
>  arch/arm64/kernel/cpuinfo.c                   |  5 ++++
>  arch/powerpc/kernel/secvar-sysfs.c            |  6 +++++
>  arch/sh/kernel/cpu/sh4/sq.c                   |  6 +++++
>  drivers/acpi/sysfs.c                          |  2 ++
>  drivers/cpufreq/cpufreq_conservative.c        |  5 +++-
>  drivers/cpufreq/cpufreq_governor.c            |  4 +--
>  drivers/cpufreq/cpufreq_governor.h            |  1 +
>  drivers/cpufreq/cpufreq_ondemand.c            |  5 +++-
>  drivers/dma/ioat/sysfs.c                      |  7 +++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ualink.c    |  5 ++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_xcp.c       | 10 +++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_process.c      | 12 ++++++---
>  drivers/gpu/drm/amd/amdkfd/kfd_queue.c        |  5 +++-
>  drivers/infiniband/hw/hfi1/sysfs.c            |  5 ++++
>  drivers/infiniband/hw/usnic/usnic_ib_sysfs.c  |  5 ++++
>  drivers/parisc/pdc_stable.c                   |  5 ++++
>  drivers/power/supply/ab8500_fg.c              |  5 ++++
>  drivers/s390/char/sclp_mem.c                  |  2 ++
>  drivers/soc/hisilicon/kunpeng_hccs.c          | 21 +++++++++++++++
>  .../fbdev/omap2/omapfb/dss/display-sysfs.c    |  7 +++++
>  .../fbdev/omap2/omapfb/dss/manager-sysfs.c    |  8 ++++++
>  .../fbdev/omap2/omapfb/dss/overlay-sysfs.c    |  8 ++++++
>  drivers/xen/sys-hypervisor.c                  |  6 +++++
>  fs/dlm/dlm_internal.h                         |  1 +
>  fs/dlm/lockspace.c                            | 26 ++++++++++++++-----
>  fs/erofs/sysfs.c                              | 10 +++++++
>  fs/f2fs/sysfs.c                               | 15 +++++++++++
>  fs/ocfs2/cluster/masklog.c                    |  5 ++++
>  fs/ubifs/sysfs.c                              | 24 +++++------------
>  include/linux/compiler_attributes.h           | 12 +++++++++
>  include/linux/kobject.h                       |  2 +-
>  scripts/checkpatch.pl                         |  1 +
>  tools/lib/python/kdoc/xforms_lists.py         |  1 +
>  34 files changed, 211 insertions(+), 32 deletions(-)
>
>
> base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
> --
> 2.56.0.455.g6c5a503b38-goog
>
