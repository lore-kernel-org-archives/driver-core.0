Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611675;
	b=DktqJV1sCkDMDgtsxbh8WZ14yzMMMCo0UD9nq8nzL23N4tjQ34DVGF65Hgd8YrpYtM8Z
	 weP7FQTNjMQh4hfJvDJHuZE8d0Mt1Wpplvmn+VlWuXIHLbClbj/AtgHNBOun4+1tcBUJl
	 pOTUoFnVySi+PTMLXNPWg5erdBPOyKs2/BWY3Pj+6e5ZhNGwMCi8MuqqwWLFaF4T1l+ZK
	 nOzFi8qBFDVof1glktGPkYIx700mW3ZUDBn2obzzl6PlXUx5gBGrKUcgvazC7ntzFYLse
	 AyZj29/b9hXYgSUUzD8hG1BPLLq7DOUCFvn6aPNHHVRLRmWIHmS6o1hzd4/3T0bfJyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611675;
	h=Received:DKIM-Signature:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=s4z1Ffojaf9vgBuZCxjV4xyWv+c033IP30jHE3CryFk=;
	b=xflViqwHzsPJBEcNZ/7a+R9PdDB880M5m55tTRChKf6xurP7yfGYO+DWxL0bGxiVrRoH
	 Xj9c4JbpSqJOZL/N7rG40v8iiaiWHjM2Mtrqa0W5kM/+Tzu76qV7jyu0rDHbu1YZInXUQ
	 scV3jDX6r5O6vw9ZKJ0T4RxUhiR3Zmz+jh2R3V4fiDhlwoHF80J4whwmplz4WIhzAUylu
	 AEabCYyLv5c+CtGpgoKfX2St3T/o3U3OlVoxbQmFYb+s6FiA9uxOrOfdFnICD6UigDvD6
	 PgmJsD+lkxIq/2S5SnuBHt3oidq66A/+76A+RQISehByBMoyJoJr6a1H4Y4+HYhYKpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jj7v6ZK8;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EAC1606A326
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jj7v6ZK8
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F35A31F000D4
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 13:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795611675;
	bh=s4z1Ffojaf9vgBuZCxjV4xyWv+c033IP30jHE3CryFk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jj7v6ZK8vjVARoMeNQWH3qgat+zbzdL2pRP0vCtAl8RWHd1H7iwPpNQN2VXsPeB3G
	 ovpgOR1oV86Z+F49E/KBXC75/w1XNIRD6RlMtKUMyBrsKfARecjT9r9Ei4Dkau4Fds
	 /YPJ1K5+VZgnAoAHW6gN/7Xc3qkb+L0+oVsmtejwCkEbICSMr/u0yRp01t2A3A3LIS
	 QfUwT98gLI1P2BvCCn4GNAuApewXZ9mYCpsNzo+/PD6FnS5ejADDEFgRAPXTq0pb0T
	 NxForsRI95MY6m2RsZ6fMYojL0JRlVuCbPt/hn3qkAljdvW+ttZaAO3Y4S8q3/pGhG
	 wxHCSiK65G69w==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c1b8120565so3531268e87.3
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 05:01:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErF6fXYvDwIgdGw8Nnqo7r3VFaEySVsImgVSMZURVgizgBm9n22cM83EVuhK2HagXyyXdmfa0ekmfcBK7g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/bf6JfVg09fIuZvmkcDrH5vsz5A16Hl8aksfUPR6oz7MKqkQdz
	P8RH4IWrUYGo0CxuF1deknc60Mgz+69WtbAmKGsM+wjI80jltqbOwkiQjG5VfhClhrIcTQnDLvQ
	3mVto+LHW1x5sANV/DkIPJBts8FktEm0=
X-Received: by 2002:a05:6512:10cd:b0:5c1:ae60:9b12 with SMTP id
 2adb3069b0e04-5c1bc89ee76mr4870782e87.60.1795611673387; Wed, 25 Nov 2026
 05:01:13 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261123-pm-runtime-summary-v3-0-81a966953a81@kernel.org> <20261123-pm-runtime-summary-v3-2-81a966953a81@kernel.org>
In-Reply-To: <20261123-pm-runtime-summary-v3-2-81a966953a81@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 25 Nov 2026 14:01:00 +0100
X-Gmail-Original-Message-ID: <CAJZ5v0iJ2ytkT2-JJTONCvYx3s-kOOtxopFkdbtGzHNQWOwJgg@mail.gmail.com>
X-Gm-Features: Aa3M54rBrqs5vJZYDvCdW7zNfFxUBVdg8rbR2V3HBHj6z7GBr6vpKn8rCF1Z5qc
Message-ID: <CAJZ5v0iJ2ytkT2-JJTONCvYx3s-kOOtxopFkdbtGzHNQWOwJgg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] PM: runtime: add debugfs entry for pm_runtime_summary
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
> Add a debugfs entry for showing the runtime statistics for devices with
> PM runtime enabled.
>
> Signed-off-by: Joshua Crofts <crofts@kernel.org>
> ---
>  drivers/base/power/runtime.c | 86 ++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 86 insertions(+)
>
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 17aee68366cf..cf657251633e 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -14,6 +14,8 @@
>  #include <linux/pm_runtime.h>
>  #include <linux/pm_wakeirq.h>
>  #include <linux/rculist.h>
> +#include <linux/debugfs.h>
> +#include <linux/seq_file.h>
>  #include <trace/events/rpm.h>
>
>  #include "../base.h"
> @@ -2223,3 +2225,87 @@ bool pm_runtime_need_not_resume(struct device *dev=
)
>  }
>
>  #endif /* CONFIG_PM_SLEEP */
> +
> +#if defined(CONFIG_DEBUG_FS) && defined(CONFIG_PM_SLEEP)

Why do you want to make it depend on CONFIG_PM_SLEEP?

There's nothing related to system sleep in it AFAICS.

> +static void rpm_summary_show_dev(struct device *dev, void *data)
> +{
> +       struct seq_file *s =3D data;
> +       unsigned long flags;
> +       u64 active_time, suspended_time;
> +       u64 last_sleep, min_sleep, max_sleep;
> +       u64 resumes, suspends;
> +       const char *status_str;
> +       bool enabled;
> +
> +       spin_lock_irqsave(&dev->power.lock, flags);
> +
> +       enabled =3D pm_runtime_enabled(dev);
> +       if (!enabled && !dev->power.resume_count && !dev->power.suspend_c=
ount) {
> +               spin_unlock_irqrestore(&dev->power.lock, flags);
> +               return;
> +       }
> +
> +       update_pm_runtime_accounting(dev);
> +
> +       switch (dev->power.runtime_status) {
> +       case RPM_ACTIVE:
> +               status_str =3D "active";
> +               break;
> +       case RPM_SUSPENDED:
> +               status_str =3D "suspended";
> +               break;
> +       case RPM_SUSPENDING:
> +               status_str =3D "suspending";
> +               break;
> +       case RPM_RESUMING:
> +               status_str =3D "resuming";
> +               break;
> +       default:
> +               status_str =3D "unknown";
> +               break;
> +       }
> +
> +       active_time =3D dev->power.active_time;
> +       suspended_time =3D dev->power.suspended_time;
> +       resumes =3D dev->power.resume_count;
> +       suspends =3D dev->power.suspend_count;
> +       last_sleep =3D dev->power.last_suspended_time;
> +       min_sleep =3D dev->power.min_suspended_time;
> +       max_sleep =3D dev->power.max_suspended_time;
> +
> +       spin_unlock_irqrestore(&dev->power.lock, flags);
> +
> +       do_div(active_time, NSEC_PER_MSEC);
> +       do_div(suspended_time, NSEC_PER_MSEC);
> +       do_div(last_sleep, NSEC_PER_MSEC);
> +       do_div(min_sleep, NSEC_PER_MSEC);
> +       do_div(max_sleep, NSEC_PER_MSEC);
> +
> +       seq_printf(s, "%-32s %-12s %8llu %8llu %12llu %12llu %10llu %10ll=
u %10llu\n",
> +                  dev_name(dev), enabled ? status_str : "disabled",
> +                  resumes, suspends, active_time, suspended_time,
> +                  last_sleep, min_sleep, max_sleep);
> +}
> +
> +static int pm_runtime_summary_show(struct seq_file *s, void *unused)
> +{
> +       seq_printf(s, "%-32s %-12s %8s %8s %12s %12s %10s %10s %10s\n",
> +                  "Device", "Status", "Resumes", "Suspends",
> +                  "Active(ms)", "Suspend(ms)", "Last(ms)", "Min(ms)", "M=
ax(ms)");
> +       seq_puts(s, "----------------------------------------------------=
----------------------------------------------------------------------\n");
> +
> +       dpm_for_each_dev(s, rpm_summary_show_dev);
> +
> +       return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(pm_runtime_summary);
> +
> +static int __init pm_runtime_debugfs_init(void)
> +{
> +       debugfs_create_file("pm_runtime_summary", 0444, NULL, NULL,
> +                           &pm_runtime_summary_fops);
> +
> +       return 0;
> +}
> +late_initcall(pm_runtime_debugfs_init);
> +#endif /* defined(CONFIG_DEBUG_FS) && defined(CONFIG_PM_SLEEP) */
>
> --
> 2.47.3
>
