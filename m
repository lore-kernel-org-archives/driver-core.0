Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611268;
	b=Sxpb8zJ48l65M0IRAcPv/Bf45SH6Xyx8+Spin5X23ZRH31wXVIdmj84kib4ST9a8dYW7
	 zUr82qhLo6Ml/ffE9K3pICEF7Bv2UKRrYSBoXFK2BGKLQxQfL9dJcUoZbt9o7DlObofNj
	 5TC7hYr+rvqDb8LFaiNuB/9chjqmTwTdnDBs7dr9snhKhHKz/YRyRGIXW0KXQInbolSJq
	 J6OY2JGUL3o7Xpr4uxFQfuaZVWyZjE8384aICKRkTbldzFTZGkMnN/HWpWxS4IcQCFOux
	 eBngCzuDjOXUHPRNJnYrLBWX9LK0ARKs80H5nKS05PLRaAKQa4yTYjfjV7VbTRZ1i7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611268;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vNDprfv/6nugGWHCMaZcQUirV98shjwT6CYGrpmc/Mc=;
	b=QBLDxnTpUom7EAcmSkiC/ZNGip8XJZD20M99PSw3bijMa6SKRT9OO1aYHt2IL9tiQX5n
	 zn8+ZtmkNKkEYySnGDPxy6h2NB5WC+NmiCgTcEX77Owp9S91FXyVrmWQ26v+fObTaQisG
	 2OxQH8bJpFCPCo4NnSD/NQFwunGm18XCbu0R2BuJBesfeqOr16Zb6N2Z8wLWlC8bSoXEm
	 oXAVuDBRzEAIRmtClHU9+tysQVLrU4A0cYucP07zU8KL6BUlQnVPnRIehzCWbJLYTIpu8
	 JWoIGUzx4TLdkX3hoGvNrroiIWMZaOZtYaWVyjNOb18Yk26sKTY2TMEpDDk9Q3V4UiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pu8sOEV5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8501606A695
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 12:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Pu8sOEV5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFB91F000D2
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 12:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611268;
	bh=vNDprfv/6nugGWHCMaZcQUirV98shjwT6CYGrpmc/Mc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Pu8sOEV5x4M/9Z7cCFMaL+HQ1/TpFEXRv4NBDaXo/oWbeGX/Mbq1qhN5KPgwooNJB
	 5RFVgnlLWf1cjlh4eYZpBxElP6TCRDCQcrZgduniDXHFbsP/JnTL4TjC3C4AiEF77E
	 8xzwD8EPXkFbNS3d/ylRmX2ZGHnMOYpVWBHFD5mKziE+x2ay4MmuTwLJUbBRGGL3wH
	 18tJpvRbIPZy+yEixjgUSEAoa/jYa5Wc6e7JhvIpVfbUAmiF6hXIe3SjwutPZp9pnx
	 4RoGu/p+QawMqVbuZBzfUA9IndkrT5g3gZPE7z/bsGyo9aitgfc3CPYZB42ErckHNy
	 LUv39DcPkJEMw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5c1479be604so4294482e87.1
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 04:54:28 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGN10pAv7wLWfxW+jGSozrNWRrSCsS3OaPMT6YkXShVxWaKaHFBfTakuO/G5g8QirM7eCYQsZL91RT2eA==@lists.linux.dev
X-Gm-Message-State: APuU4Z84wBL7yBucaMei3W45ZGj8i4+GuJhMScuKI++RUVU+smcZDt3X
	pX59TCg74K10c7uxUbIjs7IGsOjYO1lGSQfXrNa1zLXvIjYF8ksvvG4zNDRdlvLcHM7aX3iVAPi
	X4SscnBvj3AUhe+u04lrCrcjGwxvaMx0=
X-Received: by 2002:a05:6512:6c8:b0:5bf:c619:b088 with SMTP id
 2adb3069b0e04-5c1bc7fe9d6mr5632966e87.20.1795611266648; Wed, 25 Nov 2026
 04:54:26 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123-pm-runtime-summary-v3-0-81a966953a81@kernel.org> <20261123-pm-runtime-summary-v3-1-81a966953a81@kernel.org>
In-Reply-To: <20261123-pm-runtime-summary-v3-1-81a966953a81@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 25 Nov 2026 13:54:14 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0hpnoGw89WHyofLr3SxnrJNs99LnhndeOv245y_LgGWXQ@mail.gmail.com>
X-Gm-Features: Aa3M54p2t4ylLxh9M_MrC6tKUAkk8ixuZQCvGXit2a9dVkOrYHTi48PpR2bd03E
Message-ID: <CAJZ5v0hpnoGw89WHyofLr3SxnrJNs99LnhndeOv245y_LgGWXQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] PM: runtime: add additional suspend/resume metrics
To: Joshua Crofts <crofts@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Johan Hovold <johan@kernel.org>, Samuel Wu <wusamuel@google.com>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 23, 2026 at 10:07=E2=80=AFAM Joshua Crofts <crofts@kernel.org> =
wrote:
>
> The current implementation only logs the total accumulated time a device
> spends in suspended or active states.
>
> Add tracking for:
> - resume_count : number of successful transitions to active
> - suspend_count: number of successful transitions to suspended
> - last_suspended_time: duration of the most recent sleep cycle (ns)
> - min_suspended_time / max_suspended_time: shortest and longest sleep
>   cycle durations to help detect power thrashing (ns)

I would mention that they would be only reachable through a debugfs interfa=
ce.

> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
>  drivers/base/power/runtime.c | 93 ++++++++++++++++++++++++++++++++++++++=
+++---
>  include/linux/pm.h           | 16 +++++++-
>  2 files changed, 103 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 4e9c23059a40..17aee68366cf 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -5,6 +5,8 @@
>   * Copyright (c) 2009 Rafael J. Wysocki <rjw@sisk.pl>, Novell Inc.
>   * Copyright (C) 2010 Alan Stern <stern@rowland.harvard.edu>
>   */
> +#include <linux/pm.h>
> +#include <linux/timekeeping.h>
>  #include <linux/sched/mm.h>
>  #include <linux/ktime.h>
>  #include <linux/hrtimer.h>
> @@ -103,11 +105,70 @@ static void update_pm_runtime_accounting(struct dev=
ice *dev)
>                 dev->power.active_time +=3D delta;
>  }
>
> +#ifdef CONFIG_DEBUG_FS
> +static void rpm_account_suspend(struct device *dev)
> +{
> +       dev->power.suspend_time =3D dev->power.accounting_timestamp;
> +       dev->power.suspend_count++;
> +}
> +
> +static void rpm_account_sleep_end(struct device *dev)
> +{
> +       u64 duration;
> +
> +       if (!dev->power.suspend_time)
> +               return;
> +
> +       if (dev->power.accounting_timestamp <=3D dev->power.suspend_time)
> +               return;
> +
> +       duration =3D dev->power.accounting_timestamp - dev->power.suspend=
_time;
> +       dev->power.last_suspended_time =3D duration;
> +
> +       /* Update min/max extrema at the exact same moment as last_suspen=
ded_time */
> +       if (!dev->power.min_suspended_time || duration < dev->power.min_s=
uspended_time)
> +               dev->power.min_suspended_time =3D duration;
> +
> +       if (duration > dev->power.max_suspended_time)
> +               dev->power.max_suspended_time =3D duration;
> +}
> +
> +static void rpm_account_resume_complete(struct device *dev)
> +{
> +       dev->power.resume_count++;
> +       dev->power.suspend_time =3D 0;
> +}
> +#endif /* CONFIG_DEBUG_FS */
> +
>  static void __update_runtime_status(struct device *dev, enum rpm_status =
status)
>  {
> +#ifdef CONFIG_DEBUG_FS
> +       enum rpm_status old_status =3D dev->power.runtime_status;
> +#endif /* CONFIG_DEBUG_FS */
> +
>         update_pm_runtime_accounting(dev);
>         trace_rpm_status(dev, status);
>         dev->power.runtime_status =3D status;
> +
> +#ifdef CONFIG_DEBUG_FS
> +       if (dev->power.disable_depth > 0) {
> +               if (status =3D=3D RPM_ACTIVE)
> +                       dev->power.suspend_time =3D 0;
> +               return;
> +       }
> +
> +       if ((old_status =3D=3D RPM_SUSPENDING || old_status =3D=3D RPM_AC=
TIVE) &&
> +           status =3D=3D RPM_SUSPENDED)
> +               rpm_account_suspend(dev);
> +       else if (old_status =3D=3D RPM_RESUMING && status =3D=3D RPM_SUSP=
ENDED)
> +               dev->power.suspend_time =3D dev->power.accounting_timesta=
mp;
> +       else if (old_status =3D=3D RPM_SUSPENDED && status !=3D RPM_SUSPE=
NDED)
> +               rpm_account_sleep_end(dev);
> +
> +       if ((old_status =3D=3D RPM_RESUMING || old_status =3D=3D RPM_SUSP=
ENDED) &&
> +           status =3D=3D RPM_ACTIVE)
> +               rpm_account_resume_complete(dev);
> +#endif /* CONFIG_DEBUG_FS */

Please move the code under CONFIG_DEBUG_FS in this function to a
separate function called by it and defined as an empty stub if
CONFIG_DEBUG_FS is unset.

>  }
>
>  static u64 rpm_get_accounted_time(struct device *dev, bool suspended)
> @@ -1580,6 +1641,7 @@ EXPORT_SYMBOL_GPL(__pm_runtime_disable);
>  void pm_runtime_enable(struct device *dev)
>  {
>         unsigned long flags;
> +       u64 now;
>
>         spin_lock_irqsave(&dev->power.lock, flags);
>
> @@ -1596,12 +1658,24 @@ void pm_runtime_enable(struct device *dev)
>                 dump_stack();
>         }
>         dev->power.last_status =3D RPM_INVALID;
> -       dev->power.accounting_timestamp =3D ktime_get_mono_fast_ns();
> +       now =3D ktime_get_mono_fast_ns();
>
> -       if (dev->power.runtime_status =3D=3D RPM_SUSPENDED &&
> -           !dev->power.ignore_children &&
> -           atomic_read(&dev->power.child_count) > 0)
> -               dev_warn(dev, "Enabling runtime PM for inactive device wi=
th active children\n");
> +       if (dev->power.runtime_status =3D=3D RPM_SUSPENDED) {
> +#ifdef CONFIG_DEBUG_FS
> +               if (dev->power.suspend_time) {
> +                       if (dev->power.accounting_timestamp
> +                           && now > dev->power.accounting_timestamp)
> +                               dev->power.suspend_time +=3D now - dev->p=
ower.accounting_timestamp;
> +               } else {
> +                       dev->power.suspend_time =3D now;
> +               }
> +#endif /* CONFIG_DEBUG_FS */

Same here.

Plus you can use dev->power.accounting_timestamp as "now" in the new
function after setting it above.

> +               if (!dev->power.ignore_children &&
> +                   atomic_read(&dev->power.child_count) > 0)
> +                       dev_warn(dev, "Enabling runtime PM for inactive d=
evice with active children\n");
> +       }
> +
> +       dev->power.accounting_timestamp =3D now;
>
>  out:
>         spin_unlock_irqrestore(&dev->power.lock, flags);
> @@ -1870,6 +1944,15 @@ void pm_runtime_init(struct device *dev)
>         pm_suspend_ignore_children(dev, false);
>         dev->power.runtime_auto =3D true;
>
> +#ifdef CONFIG_DEBUG_FS
> +       dev->power.resume_count =3D 0;
> +       dev->power.suspend_count =3D 0;
> +       dev->power.suspend_time =3D 0;
> +       dev->power.last_suspended_time =3D 0;
> +       dev->power.min_suspended_time =3D 0;
> +       dev->power.max_suspended_time =3D 0;
> +#endif /* CONFIG_DEBUG_FS */

And here too.

> +
>         dev->power.request_pending =3D false;
>         dev->power.request =3D RPM_REQ_NONE;
>         dev->power.deferred_resume =3D false;
> diff --git a/include/linux/pm.h b/include/linux/pm.h
> index ef3f1310e749..caa4ba4a65de 100644
> --- a/include/linux/pm.h
> +++ b/include/linux/pm.h
> @@ -747,6 +747,12 @@ struct pm_subsys_data {
>   *   state.
>   * @accounting_timestamp: Timestamp in nanoseconds of the last runtime P=
M state
>   *   accounting update.
> + * @resume_count: Number of transitions from suspended -> active
> + * @suspend_count: Number of transitions from active -> suspended
> + * @suspend_time: Timestamp when device entered RPM_SUSPENDED
> + * @last_suspended_time: Residency of the last sleep period (ns)
> + * @min_suspended_time: Shortest sleep duration
> + * @max_suspended_time: Longest sleep duration
>   * @subsys_data: Subsystem-specific power management data.
>   * @set_latency_tolerance: Callback for setting latency tolerance.
>   * @qos: Per-device PM Quality of Service (QoS) constraints.
> @@ -816,7 +822,15 @@ struct dev_pm_info {
>         u64                     active_time;
>         u64                     suspended_time;
>         u64                     accounting_timestamp;
> -#endif
> +#ifdef CONFIG_DEBUG_FS
> +       u64                     resume_count;
> +       u64                     suspend_count;
> +       u64                     suspend_time;
> +       u64                     last_suspended_time;
> +       u64                     min_suspended_time;
> +       u64                     max_suspended_time;
> +#endif /* CONFIG_DEBUG_FS */
> +#endif /* CONFIG_PM */
>         struct pm_subsys_data   *subsys_data;  /* Owned by the subsystem.=
 */
>         void (*set_latency_tolerance)(struct device *, s32);
>         struct dev_pm_qos       *qos;
>
> --
> 2.47.3
>
