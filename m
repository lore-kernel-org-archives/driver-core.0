Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15C0148B389
	for <driver-core@lists.linux.dev>; Wed,  1 Jul 2026 12:53:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782910414; cv=none; b=AKCu1zS2tmgB8c1nDY+1rsbQk2BMZrOItfI9yWlq7slVxJ0S5bgnmtf+s7iGVzYzy5lZ0sQ5b+5AcY0pFfBYHw3iIBIb1QW/jTGBTxZc33Rr4j679IWHwp1acjOU350BOIqUVHIh0IAgAcp1JLlHV6j6ugtqK0jJEECmDkQU8pA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782910414; c=relaxed/simple;
	bh=s4t3G5F4qqktsL4DaLIjyp87DSQDbY/2WsaSTuGkOyI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjb/L+xFB22Tfkst8geD3h6rkQm+Ymno4hsds/r6h+eo5wEys79P7qCcn5XN/EUqN/Gy4XUPbdtV88h50iq7Rrwdrm18edqUcpC+L5C9bAEGThXMHkidCetDFP57pftv40sIJHyjGvocskf8uW4XjctC2fSripDC+IvF4Ck7RpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MufYbjHG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MufYbjHG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F23411F00ADF
	for <driver-core@lists.linux.dev>; Wed,  1 Jul 2026 12:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782910413;
	bh=Uyf3m31VmHN9oNn8pJPThrwZz9OConCR56J0nW8Z1B8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=MufYbjHGJ+AqBMTAq1MSueyWk8NL3FkKrsAoLPKzxFdDo+TS9gw6l/rX12RPLcC7E
	 E/FbdCorOr4Ya9P1ikn4FegBLG5YGr6vE0mMY6Sgza3FaPLOZQSMV317K/0RpAVy6g
	 KdyJVlQtjMgisOJNyISGFM42sUGekcIiHPN09HkBF8YJiiy7+7bHgcBggQJBjKyzHa
	 u+43yGTMBxaqb/IU74okrGaOzI364i0EqU0QEoNxSOiR6sUPQwwtJ366ADRmHFw7+G
	 MtjKQ7/d8kGrob1kKGJUy8MK/0qN5sZZ7iV1wWRO4FF2f61YtfHTlY/R+z99I0h3l7
	 hZu1hOzBiNQvA==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5aebfa21c62so638015e87.3
        for <driver-core@lists.linux.dev>; Wed, 01 Jul 2026 05:53:32 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roua4vCQosMXcgBUjTugnUw4kMa6eiGDJm69ksecENonRYB65if97H7W5K+efy8/KjkYD1yLvAY2sbq/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyH8j+hFU0jD+ZI3FAQK7D/9Ny4dOBTlZVXdaOjCHHNWxOlywlL
	qxhQmpwcNiVeuqCA5prUkDAxS1PSrwMiQoAiS5/A+gulB5Srl59PDqY+1akrfXPW/k66s47gUoa
	K58MZ4cl8J+9zxZFsbMfHE1Fg+BhiciE=
X-Received: by 2002:a05:6512:6382:b0:5ae:b97b:5855 with SMTP id
 2adb3069b0e04-5aec68b4320mr358186e87.40.1782910411374; Wed, 01 Jul 2026
 05:53:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260701045640.3130090-1-tzungbi@kernel.org> <20260701045640.3130090-3-tzungbi@kernel.org>
 <2026070140-rally-prowling-4d66@gregkh>
In-Reply-To: <2026070140-rally-prowling-4d66@gregkh>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Wed, 1 Jul 2026 14:53:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0goFxWOjjm1_JyaORKViEEc99-Tj-Yq4K0guYqZEvU9gg@mail.gmail.com>
X-Gm-Features: AVVi8Cf86nuhzIOE2p8v6g-b6ssqyCv2EsWN9SuC4GrAViSt0kYqBNdtyScE0U4
Message-ID: <CAJZ5v0goFxWOjjm1_JyaORKViEEc99-Tj-Yq4K0guYqZEvU9gg@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] PM: dpm_watchdog: Allow disabling DPM watchdog by default
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, tfiga@chromium.org, senozhatsky@chromium.org, 
	Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 1, 2026 at 9:22=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Wed, Jul 01, 2026 at 04:56:40AM +0000, Tzung-Bi Shih wrote:
> > Introduce the "dpm_watchdog_enabled" module parameter to allow the DPM
> > watchdog to be enabled or disabled at boot time and runtime.
>
> As I say all the time, this isn't the 1990's, please don't add new
> module parameters as they are a pain to manage and maintain over time
> (as you found out with my rejection of patch 1/2 here...)

Let me challenge this though because there are use cases for something
like module parameters AFAICS.

There are things that are "on" by default that people want to turn
"off" and ideally at init time.  If that happens in a loadable module,
the only way to do so I'm aware of is using a module parameter.

There are also diagnostic features that are generally "off", but it is
useful to turn them "on" occasionally, both at run time and at init
time.  Adding a special kernel command line option and a separate
special sysfs switch (for example) for that is kind of a pain and
using a module parameter in such cases appears to be more
straightforward to me, so what really is the problem with that?

Moreover, there are those cases in which updating the kernel command
line is more straightforward than updating user space to write into a
specific file in sysfs after boot, so using a module parameter helps.

So in general, assuming that the underlying use case is good enough,
is a module parameter really worse than a combination of a special
sysfs file and a special kernel command line argument and if so, then
why?

Of course, whether or not the underlying use case is good enough is a
different matter.

> > Additionally, introduce the CONFIG_DPM_WATCHDOG_ENABLED Kconfig option
> > to set default value of the module parameter at compile time.
> >
> > This provides flexibility for systems that want the watchdog code
> > compiled in but inactive by default, allowing it to be enabled only whe=
n
> > needed.
> >
> > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > ---
> > v5: No changes.
> >
> > v4: https://lore.kernel.org/all/20260611021219.2093476-2-tzungbi@kernel=
.org
> > - Rewrite the commit message to indicate the module parameter is the
> >   main change in the patch.
> > - DPM_WATCHDOG_DEFAULT_ENABLED -> DPM_WATCHDOG_ENABLED.
> >
> > v3: https://lore.kernel.org/all/20260608021526.1023248-3-tzungbi@kernel=
.org
> > - Add "PM" tag (was missing).
> > - Update the format and specify dependencies in kernel-parameters.txt.
> > - Update the help message in Kconfig to reflect that dpm_watchdog_enabl=
ed
> >   can be set at runtime as well.
> >
> > v2: https://lore.kernel.org/all/20260604090756.2884671-3-tzungbi@kernel=
.org
> > - Use module parameter and bool for dpm_watchdog_enabled.
> > - Use IS_ENABLED().
> >
> > v1: https://lore.kernel.org/all/20260528103215.505795-1-tzungbi@kernel.=
org
> > ---
> >  Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
> >  drivers/base/power/main.c                       | 11 +++++++++++
> >  kernel/power/Kconfig                            | 10 ++++++++++
> >  3 files changed, 28 insertions(+)
> >
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Document=
ation/admin-guide/kernel-parameters.txt
> > index b5493a7f8f22..46c20e1b5f05 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -47,6 +47,7 @@
> >       PCI     PCI bus support is enabled.
> >       PCIE    PCI Express support is enabled.
> >       PCMCIA  The PCMCIA subsystem is enabled.
> > +     PM      Power Management support is enabled.
> >       PNP     Plug & Play support is enabled.
> >       PPC     PowerPC architecture is enabled.
> >       PPT     Parallel port support is enabled.
> > @@ -5354,6 +5355,12 @@ Kernel parameters
> >       pm_debug_messages       [SUSPEND,KNL]
> >                       Enable suspend/resume debug messages during boot =
up.
> >
> > +     pm_sleep.dpm_watchdog_enabled=3D
> > +                     [PM] Enable or disable the DPM watchdog.  Require=
s
> > +                     CONFIG_PM_SLEEP and CONFIG_DPM_WATCHDOG enabled.
> > +                     Format: <bool>
> > +                     Default value is set by CONFIG_DPM_WATCHDOG_ENABL=
ED.
> > +
> >       pnp.debug=3D1     [PNP]
> >                       Enable PNP debug messages (depends on the
> >                       CONFIG_PNP_DEBUG_MESSAGES option).  Change at run=
-time
> > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > index c6a3300cfb7a..f58945758868 100644
> > --- a/drivers/base/power/main.c
> > +++ b/drivers/base/power/main.c
> > @@ -535,6 +535,11 @@ module_param(dpm_watchdog_all_cpu_backtrace, bool,=
 0644);
> >  MODULE_PARM_DESC(dpm_watchdog_all_cpu_backtrace,
> >                "Backtrace all CPUs on DPM watchdog timeout");
> >
> > +static bool __read_mostly dpm_watchdog_enabled =3D
> > +                             IS_ENABLED(CONFIG_DPM_WATCHDOG_ENABLED);
> > +module_param(dpm_watchdog_enabled, bool, 0644);
> > +MODULE_PARM_DESC(dpm_watchdog_enabled, "Enable DPM watchdog");
> > +
> >  static unsigned int __read_mostly dpm_watchdog_timeout =3D CONFIG_DPM_=
WATCHDOG_TIMEOUT;
> >  static unsigned int __read_mostly dpm_watchdog_warning_timeout =3D
> >                                               CONFIG_DPM_WATCHDOG_WARNI=
NG_TIMEOUT;
> > @@ -630,6 +635,9 @@ static void dpm_watchdog_set(struct dpm_watchdog *w=
d, struct device *dev)
> >  {
> >       struct timer_list *timer =3D &wd->timer;
> >
> > +     if (!dpm_watchdog_enabled)
> > +             return;
> > +
> >       wd->dev =3D dev;
> >       wd->tsk =3D current;
> >       wd->fatal =3D dpm_watchdog_timeout =3D=3D dpm_watchdog_warning_ti=
meout;
> > @@ -648,6 +656,9 @@ static void dpm_watchdog_clear(struct dpm_watchdog =
*wd)
> >  {
> >       struct timer_list *timer =3D &wd->timer;
> >
> > +     if (!dpm_watchdog_enabled)
> > +             return;
> > +
> >       timer_delete_sync(timer);
> >       timer_destroy_on_stack(timer);
> >  }
> > diff --git a/kernel/power/Kconfig b/kernel/power/Kconfig
> > index 530c897311d4..508ceabc4d2e 100644
> > --- a/kernel/power/Kconfig
> > +++ b/kernel/power/Kconfig
> > @@ -268,6 +268,16 @@ config DPM_WATCHDOG
> >         captured in pstore device for inspection in subsequent
> >         boot session.
> >
> > +config DPM_WATCHDOG_ENABLED
> > +     bool "Enable DPM watchdog by default"
> > +     depends on DPM_WATCHDOG
> > +     default y
>
> Only do this if you can not boot without the option enabled, which I do
> not think is the case here.

So in this particular case, there is a way to adjust the watchdog
timeout and if it is set to a very large value, the watchdog gets
effectively disabled for all purposes.

I'm not entirely sure if another switch to disable/enable it is needed
in addition to that TBH.
