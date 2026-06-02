Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A2A3C2BAA
	for <driver-core@lists.linux.dev>; Tue,  2 Jun 2026 08:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780389454; cv=none; b=UfIspEvxu6EGoUt+swigyJfINS1y0ps7z4QMZTu5Y7uYpLlzntlPeEUG0PtBtoPRw1RLonB13AaKot1hNPUbSZtIXkBHc74EMl56nB6t+DYPu6uOWn33qWJ7bbTPu/MaJ9jyf0S6uV9/53OjeTouaMm97LGwg3p7J29xoOthYEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780389454; c=relaxed/simple;
	bh=poHSp7k/wRwcxK6tvRyRthUfYkyEmfrgLwiq0NjfV98=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uurOigBKJffXp76Zzl4owQA2RzWh9j6w/8FSYF1iQEP9RgzpiGov1xJWnS1uu+oOq6Bh4958zH9kRRW5oTKDSuxXn5TNkKZ8J/Pp8EfBd1lFBDLUr+l/mypcYsoH5ZlM1R+vUgA0qOZpJirM53cnTomNkznFN9PiTW9qq4j4X6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=eX6LUk4t; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eX6LUk4t"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-915671abd29so159856685a.0
        for <driver-core@lists.linux.dev>; Tue, 02 Jun 2026 01:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780389452; x=1780994252; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N2pO+fzMv1bHxu8FRKBOMPKrC8LbuYvxk/rUchVdGVI=;
        b=eX6LUk4tRp+HkTG/ZAUUAoVv8tiSRLjm1dgt8vfqGR8SIU3DnQanMhtYoS2+lWvytn
         7EOJwoFQBnbQn4Ddy7AmatAn7pBvbnjlcI2vpfQ3L8VZGkvVmoNClVHJEi7figKnj1wq
         e6HocQT0Kk+Ue88sxE61J60Bc298kfZk9samY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780389452; x=1780994252;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=N2pO+fzMv1bHxu8FRKBOMPKrC8LbuYvxk/rUchVdGVI=;
        b=V3XIRrLO9aKasmKYdrMD5yCQHK873vB3a6ynIU38hPmaP8yT7I8JfQoV0/rN7mK86X
         neFuOZsVrDSI7WmsUAFWQnn/DKpxpSVzmL9j6CO2a1etSsWyZAQbuC921GqoGcfREjgj
         +XJU3fhDn5yt6nFAubsOpZqyGHeQWI607dseqd5Wbf7JFJFDJtslT/5piKpHGYjMWrl7
         GJsmk3X+wNeEG3kLv6IDr3B3uHsvPuzoJ5Cba0+5wvIZ8LWnGjdLFflG/8hJZO0n9hSb
         KGxufmcGyPAkaG/SmVS/4rRL6v3rAKH/B6p0jTl3LBhfAM38NdPjvoWPx3uXma7UEr5F
         Z12A==
X-Forwarded-Encrypted: i=1; AFNElJ+eqP2ZtNY+M/HSvyjxMoLrM72j+odz2C5nlxH4XuY3pGGv8PxkQX/VySgy26dcQBl+uu7Vw/NNUJNOJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaqO1piBOS7Z73t3ulMewheXsmXXJ3kBUQPgnJ6UoMUbAR1VS5
	UdlU11lu6/CM2HGeN1+0z74o/CUicUHIsk5Ih4LeNNAQUroUsywCsVXx7VQ9llOYWyJFJLTZZN1
	Ax7ov8w==
X-Gm-Gg: Acq92OFgFqwU8iUTIe4evaDcXaypZonqiQjdpk2SMC4FnkvNBeWxSCMBm8PlPebg+kT
	mpO+lGZG6x3NCihy7EzKdubhwe4mUXLBel8H+oDahCP/EGDNRqxE8+yf4sAjW75qZxhgAONvLFT
	F/m3iiF1eVEMLELCvY8qYDs1EKpnFtpcwyNk620JhShcWw32yufIcJZdQCfNhnxEet5GuieadsU
	OMbr74Ywme1xlj0thSTuvfpO6k6rvFljsgdklq/f8caJOvpf/Hs//uWyi3cS6JjuECYI2CTXQw1
	ODb4FNDMdLhJTFHfZSfxdQLQLJSFFzn50hyJXXc5l1ziA6vm0XUCMmxXA4qfhkuKgyCo46nB3D8
	026rMWHfOWLWY456tumNCH6XTAUBBw+L6jF7HhkngjyIFxtUoPnCKq7Q00EsmariBZ2pRGIZ++S
	XX/o+m2FN9v78XkEYck4/WWoFhttdFkh9uHlJE+XWZROeTcOE15BIocp22yMLAlKcZVhLEZ/ZU
X-Received: by 2002:a05:620a:8804:b0:914:c226:ecb5 with SMTP id af79cd13be357-9153d936c33mr2300764185a.2.1780389452469;
        Tue, 02 Jun 2026 01:37:32 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91532473bb9sm1222538985a.11.2026.06.02.01.37.31
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 01:37:31 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50e61648f10so2491cf.1
        for <driver-core@lists.linux.dev>; Tue, 02 Jun 2026 01:37:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ9oSAyVbhhNhNHEYVydKZBGm0ZDgFIp+/CpNnHTHBcjTVK2qEwd47ZuimcgrGin5y7pFFVMQzQpd3pjyw==@lists.linux.dev
X-Received: by 2002:ac8:7209:0:b0:516:4f62:85e7 with SMTP id
 d75a77b69052e-517670f60e6mr7875761cf.18.1780389450588; Tue, 02 Jun 2026
 01:37:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528103215.505795-1-tzungbi@kernel.org> <CAJZ5v0gc7AtOjWd+cg6tFgzPBovu=wmYmavjaRRjTdNNd8q-0g@mail.gmail.com>
 <ah47N8Ng9zfcASmk@google.com>
In-Reply-To: <ah47N8Ng9zfcASmk@google.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 2 Jun 2026 17:37:13 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Drvq0iPAb2Ly=K7WLOmbRAcLY4TzZxHmhzarK4cvx1xA@mail.gmail.com>
X-Gm-Features: AVHnY4IK1BCekzEUvFQ7W25XhRgP5hRYDeCrICdpzLPF12YauXFtWy2YZIHikXM
Message-ID: <CAAFQd5Drvq0iPAb2Ly=K7WLOmbRAcLY4TzZxHmhzarK4cvx1xA@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Allow disabling DPM watchdog by default
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 11:09=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> On Mon, Jun 01, 2026 at 08:39:42PM +0200, Rafael J. Wysocki wrote:
> > On Thu, May 28, 2026 at 12:32=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.=
org> wrote:
> > > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > > index e1b550664bab..4f92905f3edf 100644
> > > --- a/drivers/base/power/main.c
> > > +++ b/drivers/base/power/main.c
> > > @@ -527,6 +527,20 @@ module_param(dpm_watchdog_all_cpu_backtrace, boo=
l, 0644);
> > >  MODULE_PARM_DESC(dpm_watchdog_all_cpu_backtrace,
> > >                  "Backtrace all CPUs on DPM watchdog timeout");
> > >
> > > +#ifdef CONFIG_DPM_WATCHDOG_DEFAULT_ENABLED
> > > +static unsigned int __read_mostly dpm_watchdog_enabled =3D 1;
> > > +#else
> > > +static unsigned int __read_mostly dpm_watchdog_enabled;
> > > +#endif
> > > +
> > > +static int __init dpm_watchdog_setup(char *str)
> > > +{
> > > +       if (kstrtouint(str, 0, &dpm_watchdog_enabled) =3D=3D 0)
> > > +               return 1;
> > > +       return 0;
> > > +}
> > > +__setup("dpm_watchdog_enabled=3D", dpm_watchdog_setup);
> >
> > You might as well use a module parameter to allow this to be set or
> > clear at run time.  Is there a particular reason why you only want it
> > to be enabled or disabled via the kernel command line?
>
> Thanks for the suggestion.  Mainly because in our use cases, we only need
> to set it once at boot time.
>
> Also, I was wondering if we need to consider potential races if the flag
> can be set at runtime.  E.g.:
> 1) The flag is set.
> 2) dpm_watchdog_set() is called and the timer is started.
> 3) The flag is then unset.
> 4) The subsequent dpm_watchdog_clear() isn't stop the timer.
>
> Given this, would you still suggest providing the module parameter for
> completeness?

Would that lead to anything bad, though? If I'm remembering correctly,
would that mean that any already ongoing PM operations would still be
subject to the timer, but not any new ones.

My suggestion would also be to actually make the timeout and warning
timeout configurable at runtime.

Best,
Tomasz

>
> >
> > > +
> > >  /**
> > >   * dpm_watchdog_handler - Driver suspend / resume watchdog handler.
> > >   * @t: The timer that PM watchdog depends on.
> > > @@ -570,6 +584,9 @@ static void dpm_watchdog_set(struct dpm_watchdog =
*wd, struct device *dev)
> > >  {
> > >         struct timer_list *timer =3D &wd->timer;
> > >
> > > +       if (!dpm_watchdog_enabled)
> > > +               return;
> > > +
> > >         wd->dev =3D dev;
> > >         wd->tsk =3D current;
> > >         wd->fatal =3D CONFIG_DPM_WATCHDOG_TIMEOUT =3D=3D CONFIG_DPM_W=
ATCHDOG_WARNING_TIMEOUT;
> > > @@ -588,6 +605,9 @@ static void dpm_watchdog_clear(struct dpm_watchdo=
g *wd)
> > >  {
> > >         struct timer_list *timer =3D &wd->timer;
> > >
> > > +       if (!dpm_watchdog_enabled)
> > > +               return;
> > > +
> > >         timer_delete_sync(timer);
> > >         timer_destroy_on_stack(timer);
> > >  }
