Received: from mail-vs1-f41.google.com (mail-vs1-f41.google.com [209.85.217.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64AEF395DB6
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 08:36:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773736588; cv=none; b=bO4yA9dbK97N13e02IdC2/X8v066336hC0NEUjIa6M2kRItcj4PEBE2AHM1SDiTQCJgOzD0+Jn0K7OPJYGwYjiVHAwcj1Z4/8SC166YCEMgyEzCLyY3ey6spB7hSSdIvg4PyY2ep/52ATDQp42KKxStoP4OmG0fZtSvk1a5sx00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773736588; c=relaxed/simple;
	bh=1IbAI1LF70M+Kjw+h3BaLZwBsh7cf418N6PFDl+oOnk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R7nfew/Uo9R/y/VMisq1r08MUZtqU2p9PxGfRheWaU2euCcop1Hlew+TMcGx0xoAs8DkCVy/vtFtECFyh25GWCYQg6BnIHg4pz/zN1wDOM+LQes+IwhbV11GjUKLKzVUBlFhVklC6SqKH+k+jYLFQnPMtnDTdTw0fX4W2sO5c5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f41.google.com with SMTP id ada2fe7eead31-5fff77ff69bso1155003137.2
        for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 01:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773736586; x=1774341386;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=idH2bB7nbOzzZw2WFTC74GwVow5g1kiitlzGsuFZK5o=;
        b=VBZVh8VwFQaAY7Gvr7RIU2n3yh3MT5uTSo+qBDn6h/1DKAGpgg2so/ZQ2A+x1vJ09a
         Gec4GtR6KaSRpIOyBoi0j/KsDqBU8aBbTBiPsteUic/08apbOtqocss+zowCNbTBHWC+
         XcnQiZItgWtzVAQGi4eXpzqD046hXfOBgp/sSUeTz3aq6XQwrvhua9h9qTZCDcOBjPG1
         L5OevSY523LENYYMY5SNhGXpehHrJ2ipqeNVeOAaJf7PqPf+7kvs2JflHlTgKyanljY7
         IOXFdiHgCmqTQFHgDKp8qh9bog665s513bORkO4rRW6/2w1NY3cvDrOwbEdXdJB0LL+a
         LyDg==
X-Forwarded-Encrypted: i=1; AJvYcCVxKZK5lPUyG+Aogm9BQCM2DW8UVDF28sfiIel8FTIIwy8jMo6IB5FlnIlBXaaEQYO4bnRRXUUtzmvCJw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYrZKFr+P5p1sa4JW/JlzaiEUQCHakX61wiGu+QYR63/KJm39A
	WYum4XNY1SIy2PCo+X8/XH8ycB1xwXyaDUbwgCXoXu0zuMlHxiEmDErRcHj28fOY
X-Gm-Gg: ATEYQzzbA++bq7YXtYr49wucgaWojuqMFxEvrE+7LUEmLKJzUcRxlGn1ev0vAZwQ9MO
	xptZN4JOf6+uFsCmVdWD0GkM+zKoPwi6FYgPLLVuk/EfOgIdc4ohHtl4FiKBLh2BnRYvO2QpYfJ
	8ES9e8vNr67YJ3UmWZBTTWXKnakCVZWIJydktU8qsajqQhId1Qw5yy92deLjKk3ZvvxQ92zfpTY
	rtT2DKip+vKE4sQCkKIe48uw62VhBqRNcBf9YlYIxMjqib72gizesJcrG6/B0+pDT2gDWtT6E/h
	i7M8N+fl8auhH9zxwBgft2OU0Jd0bR/KZOKbyOd0Mw0A+uHc3azDI1CgHHMQaxoQ2OfKXVOoUAo
	/lbmzcI1i80OruRSsbkh4zTtiUDSUZoWFbQv4fIxm+yNWgkkoTSRQYJ4lpkRyPowQvjREi7lAtM
	MAaEHEFjYKhGeECHxbjgRjtc6+6ytIpnGOSxct/kYg+bKFdkH5wgGubIqXakhR
X-Received: by 2002:a05:6102:3a12:b0:5ff:c831:b986 with SMTP id ada2fe7eead31-6020e1a90ecmr6002309137.8.1773736586334;
        Tue, 17 Mar 2026 01:36:26 -0700 (PDT)
Received: from mail-vs1-f53.google.com (mail-vs1-f53.google.com. [209.85.217.53])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-601deb0278csm7797176137.11.2026.03.17.01.36.24
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2026 01:36:25 -0700 (PDT)
Received: by mail-vs1-f53.google.com with SMTP id ada2fe7eead31-5fff77ff69bso1154999137.2
        for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 01:36:24 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXzkS0JWCdXkR1vBQLZ7bA2FxPK5721a8pPQ47Wt+6TXuAAtxsD00XAbjeJQ4LV+UZPrXIsqkDYmMJ25Q==@lists.linux.dev
X-Received: by 2002:a05:6102:5127:b0:5ff:2569:cfe7 with SMTP id
 ada2fe7eead31-6020e2129e6mr6024902137.10.1773736584585; Tue, 17 Mar 2026
 01:36:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303115720.48783-1-dakr@kernel.org> <20260303115720.48783-5-dakr@kernel.org>
 <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
In-Reply-To: <DH4M3DJ4P58T.1BGVAVXN71Z09@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 17 Mar 2026 09:36:13 +0100
X-Gmail-Original-Message-ID: <CAMuHMdW=hfK82_QKXL=n-nMos-HjScKuw9jNTy4xsxJ2qnPYyA@mail.gmail.com>
X-Gm-Features: AaiRm50LJFP1R3ITAUSRjqb1napf13plX5N5KjefHP89RPorlF5H9VKuGn2urAs
Message-ID: <CAMuHMdW=hfK82_QKXL=n-nMos-HjScKuw9jNTy4xsxJ2qnPYyA@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] driver core: platform: use generic driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	ysato@users.sourceforge.jp, dalias@libc.org, glaubitz@physik.fu-berlin.de, 
	abelvesa@kernel.org, srini@kernel.org, s.nawrocki@samsung.com, 
	nuno.sa@analog.com, brgl@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
	linux-sound@vger.kernel.org, linux-sh@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Tue, 17 Mar 2026 at 00:57, Danilo Krummrich <dakr@kernel.org> wrote:
> On Tue Mar 3, 2026 at 12:53 PM CET, Danilo Krummrich wrote:
> > diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> > index 143747c45206..3cd17bb0be67 100644
> > --- a/arch/sh/drivers/platform_early.c
> > +++ b/arch/sh/drivers/platform_early.c
> > @@ -25,10 +25,12 @@ static int platform_match(struct device *dev, struct device_driver *drv)
> >  {
> >       struct platform_device *pdev = to_platform_device(dev);
> >       struct platform_driver *pdrv = to_platform_driver(drv);
> > +     int ret;
> >
> >       /* When driver_override is set, only bind to the matching driver */
> > -     if (pdev->driver_override)
> > -             return !strcmp(pdev->driver_override, drv->name);
> > +     ret = device_match_driver_override(dev, drv);
> > +     if (ret >= 0)
> > +             return ret;
> >
> >       /* Then try to match against the id table */
> >       if (pdrv->id_table)
>
> I was just about to pick up this series, but then noticed that checking for
> driver_override in the platform_early case doesn't make sense in the first place
> and was accidentally added when the platform_match() callback was copied over in
> commit 507fd01d5333 ("drivers: move the early platform device support to
> arch/sh").
>
> Thus, I'm going to drop this hunk and add in the following patch; please let me
> know if there are any concerns.
>
> commit 39cae4095efda4b00b436c0fc46f21de84128969
> Author: Danilo Krummrich <dakr@kernel.org>
> Date:   Tue Mar 17 00:37:15 2026 +0100
>
>     sh: platform_early: remove pdev->driver_override check
>
>     In commit 507fd01d5333 ("drivers: move the early platform device support to
>     arch/sh") platform_match() was copied over to the sh platform_early
>     code, accidentally including the driver_override check.
>
>     This check does not make sense for platform_early, as sysfs is not even
>     available in first place at this point in the boot process, hence remove
>     the check.
>
>     Fixes: 507fd01d5333 ("drivers: move the early platform device support to arch/sh")
>     Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> diff --git a/arch/sh/drivers/platform_early.c b/arch/sh/drivers/platform_early.c
> index 143747c45206..48ddbc547bd9 100644
> --- a/arch/sh/drivers/platform_early.c
> +++ b/arch/sh/drivers/platform_early.c
> @@ -26,10 +26,6 @@ static int platform_match(struct device *dev, struct device_driver *drv)
>         struct platform_device *pdev = to_platform_device(dev);
>         struct platform_driver *pdrv = to_platform_driver(drv);
>
> -       /* When driver_override is set, only bind to the matching driver */
> -       if (pdev->driver_override)
> -               return !strcmp(pdev->driver_override, drv->name);
> -
>         /* Then try to match against the id table */
>         if (pdrv->id_table)
>                 return platform_match_id(pdrv->id_table, pdev) != NULL;

Nice catch!
Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
