Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3373DB62A
	for <driver-core@lists.linux.dev>; Tue,  2 Jun 2026 12:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780405082; cv=none; b=H6hJJNaDQvUQGMcTo7UK1umlSFOWs3MTO58V8T2XrkjSO/6cnE7k8CqQbemscJ7K+6ypYdzyeDNr3rGqNMI3pLN7fCzo3ih9asPUxELQBPF955474RljlbA3YrVr6k0eQ1apZ4u2qsbTnXCI2w6V1XpVcJkHv0UXJ8CzdiSxLww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780405082; c=relaxed/simple;
	bh=g3EsPEeclboffoN4RYwwMYX1oGuyBaS6O6dpSTTXey0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pr5EwdV/EohPZqCxg7L88Uhjbix42+WkEHOjkFU5QQFLIeS2yRO/HXiJRq4MNj4J77iaGzv1Ub+u/mFIvkRmBHt57O1lC797Ita5UhDu5ClSuTptgjGMJsyVho9fpnGlOCmIFomB89laerfejugZ6sF3UkUr8t5XRulSes1gFmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QnjuCCXH; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QnjuCCXH"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-9157f7c1c0eso48349685a.1
        for <driver-core@lists.linux.dev>; Tue, 02 Jun 2026 05:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780405080; x=1781009880; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6dnOAmoRyxNthicf1c6w62nXUJx2BXxcSG3avUHO1yI=;
        b=QnjuCCXH0prrQh3W2D4jGki72mRMQ6Yy7Pw0UvPQz4BN3Od0YK7fvC0+2V4oHrNq7U
         UpCTDVKVu0LNqLkfo94E+f8H9AQ9L+AK5JE3kQtEqGeQ9+VlJTwIFRrAux6mA8keL1mV
         gvyYAveyTNsTUvNqqxGnbm4D9qgPX4lcwcLmQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780405080; x=1781009880;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6dnOAmoRyxNthicf1c6w62nXUJx2BXxcSG3avUHO1yI=;
        b=XFa68zr+OYjkcRGdOcB0gM2tookWo212gfb6Xrdt3cbMU5BSe/nbcueshBA1B3hRTT
         tN1n/lxUZRrZkoPQf4ZIcbdFKB/c5oe13VKAvFQg46PSWFU+Hs6CWiHfuigmDhVARlST
         SZ5L0c7Dz23gEsgpFLKPU5+aoyvq3AvBL7kT7rqzq/DNWzRwGObl7oh3KPa8+JJNyx4w
         9kj1hwQxOr/xwLC9VhzfLQ5a6DH+4xd7DRr7yqIwVuP6yx01x778iyVrmq0gpv7MXHec
         3TumlNA8Iahmit848DOf/O0bNS1guGyQuVj6OF5YvsQwvaCvNh8bV+Ao6DUSStfxfkKM
         j3ZQ==
X-Forwarded-Encrypted: i=1; AFNElJ+IRkFFW0RK7UosGGVCUhV/mj0g1l0UfWYhPiSt892X5iYTlZo1kYfD8vMRNqIr4qYVOaIGPiaeqXHMVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyJC7KfbNg/M3o0Y7gDTbdq0da8Y6TUeC3ToieONiII74ZVczza
	gU+3LKqDMtr+TkStOBLKnn/s2bX7LxRww/2MGyIMgT1zJPuu7NOnWGtqld1oMn58luDid34Ua1t
	EFUF7SA==
X-Gm-Gg: Acq92OFHF8v5294TTjWuWrU9V/HPlAztS+5ingvA6q23l03Lgy424YB/aHtVhqoZ2sR
	EUza03YM2rIFckJGlw4lGwtO9WuLEDktnyq4cgrvSMtFMgDVjsFarFbJoYPAc8u1gglkqnWCEqj
	jvjV1RJ8SHx0sjnIEp3PvSCNv8mpimeIkonzkiyEb15FpCG6OdQbVoiLSCQI7wweRP7/J24t6jt
	wfrCoVR9z0Qv2wqEZE4Ums7oz87ePmEXM5MfnMzKFLJ+4iSpqXOp8QzLkWvyg7P/v4/K3Yodem5
	sDWzPHVNnbB5MTTM2VwnaXzgKPK6eiL2yI9HJGELR+2c6YT+j8HYhVsEoVP+KS4S7RmfnNf3nFp
	U+TZjCnfqtoVCDkPHdVaOlVKp+5ONL0udP8RbEnniEmBaUfqeV3/iDyGDxC+z0/YWm76ZLm0Uao
	phxzqvLfbzkqpDZzJ84ZKFGNN0//FcH1Cfh+OcOV6oMxgRMObOkVtSBB9JOwGzIOdKhBALc/+3
X-Received: by 2002:a05:620a:29cb:b0:915:7d5d:bbb2 with SMTP id af79cd13be357-9157d5dc75cmr311833885a.9.1780405079991;
        Tue, 02 Jun 2026 05:57:59 -0700 (PDT)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-91532628f87sm1293627085a.35.2026.06.02.05.57.58
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2026 05:57:58 -0700 (PDT)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-50e61648f10so12881cf.1
        for <driver-core@lists.linux.dev>; Tue, 02 Jun 2026 05:57:58 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+oK68ixah7PRhVki98TU6bKiR0fJff41gCPCq5i+dWtEQWC1Qy0sL8BTkGkeDBlwS1jnmo2FTqYDvUVQ==@lists.linux.dev
X-Received: by 2002:a05:622a:568d:b0:4ff:bfd9:dd31 with SMTP id
 d75a77b69052e-5176aa0bfc0mr7185061cf.5.1780405077197; Tue, 02 Jun 2026
 05:57:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528103215.505795-1-tzungbi@kernel.org> <CAJZ5v0gc7AtOjWd+cg6tFgzPBovu=wmYmavjaRRjTdNNd8q-0g@mail.gmail.com>
 <ah47N8Ng9zfcASmk@google.com> <CAAFQd5Drvq0iPAb2Ly=K7WLOmbRAcLY4TzZxHmhzarK4cvx1xA@mail.gmail.com>
 <ah607VQjZeVKqOP0@google.com>
In-Reply-To: <ah607VQjZeVKqOP0@google.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 2 Jun 2026 21:57:40 +0900
X-Gmail-Original-Message-ID: <CAAFQd5A-b0_de2RenHER-U8jHB+oX1HCjdwOe97KXrnAvZDaaQ@mail.gmail.com>
X-Gm-Features: AVHnY4Jg3-atKcicTbx0VLmhOWxiVCwzSMZnJZPxPioqRbNAthQJ4WJBPWSyNbI
Message-ID: <CAAFQd5A-b0_de2RenHER-U8jHB+oX1HCjdwOe97KXrnAvZDaaQ@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Allow disabling DPM watchdog by default
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 7:48=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org> w=
rote:
>
> On Tue, Jun 02, 2026 at 05:37:13PM +0900, Tomasz Figa wrote:
> > On Tue, Jun 2, 2026 at 11:09=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.o=
rg> wrote:
> > >
> > > On Mon, Jun 01, 2026 at 08:39:42PM +0200, Rafael J. Wysocki wrote:
> > > > On Thu, May 28, 2026 at 12:32=E2=80=AFPM Tzung-Bi Shih <tzungbi@ker=
nel.org> wrote:
> > > > > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.=
c
> > > > > index e1b550664bab..4f92905f3edf 100644
> > > > > --- a/drivers/base/power/main.c
> > > > > +++ b/drivers/base/power/main.c
> > > > > @@ -527,6 +527,20 @@ module_param(dpm_watchdog_all_cpu_backtrace,=
 bool, 0644);
> > > > >  MODULE_PARM_DESC(dpm_watchdog_all_cpu_backtrace,
> > > > >                  "Backtrace all CPUs on DPM watchdog timeout");
> > > > >
> > > > > +#ifdef CONFIG_DPM_WATCHDOG_DEFAULT_ENABLED
> > > > > +static unsigned int __read_mostly dpm_watchdog_enabled =3D 1;
> > > > > +#else
> > > > > +static unsigned int __read_mostly dpm_watchdog_enabled;
> > > > > +#endif
> > > > > +
> > > > > +static int __init dpm_watchdog_setup(char *str)
> > > > > +{
> > > > > +       if (kstrtouint(str, 0, &dpm_watchdog_enabled) =3D=3D 0)
> > > > > +               return 1;
> > > > > +       return 0;
> > > > > +}
> > > > > +__setup("dpm_watchdog_enabled=3D", dpm_watchdog_setup);
> > > >
> > > > You might as well use a module parameter to allow this to be set or
> > > > clear at run time.  Is there a particular reason why you only want =
it
> > > > to be enabled or disabled via the kernel command line?
> > >
> > > Thanks for the suggestion.  Mainly because in our use cases, we only =
need
> > > to set it once at boot time.
> > >
> > > Also, I was wondering if we need to consider potential races if the f=
lag
> > > can be set at runtime.  E.g.:
> > > 1) The flag is set.
> > > 2) dpm_watchdog_set() is called and the timer is started.
> > > 3) The flag is then unset.
> > > 4) The subsequent dpm_watchdog_clear() isn't stop the timer.
> > >
> > > Given this, would you still suggest providing the module parameter fo=
r
> > > completeness?
> >
> > Would that lead to anything bad, though? If I'm remembering correctly,
> > would that mean that any already ongoing PM operations would still be
> > subject to the timer, but not any new ones.
>
> I was overthinking the race.  All userspace programs should be frozen whe=
n
> the DPM watchdog is active.  The race I was concerned about isn't possibl=
e.

Right. Somehow I was convinced that the DPM watchdog is also used for
runtime PM, but after checking the code it doesn't look like so.

>
> Would you still suggest providing the module parameter for completeness?

I'd also vote for a module parameter. Being able to toggle this at
runtime would be useful for troubleshooting problems without needing
to change the command line arguments (which isn't trivial on some
systems).

>
> >
> > My suggestion would also be to actually make the timeout and warning
> > timeout configurable at runtime.
>
> I'm working on that and I think that should be in a separate patch.

Great, thanks. I'll leave the splitting and other logistics to the maintain=
ers.

Best,
Tomasz
