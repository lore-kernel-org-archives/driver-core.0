Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D773B362142
	for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 09:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774000093; cv=none; b=ajSqyawNl3FGtj1GBOyM+ChOCWMqwetzL/kNqnI9VdFa019A4V6jlCA451h1LBEXQT/RJ5VJCWhkB6dbzA+OkND9Twn6nuJD9r0BEYbEnSMyEihz4DQjN/Xlvj8nOod7V2PjN0riZXwB8AExDeSl1G5rBCoeeUSpCYYRICcJ1/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774000093; c=relaxed/simple;
	bh=7APFMvqa0gCQJ5T8+qHwOHyoZaMkXMNBK/5TVY+s4UI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z0Qe4U4OdApIBokOAW2Bn/MbqqVYx7KVdChRT1qcD8i4gJQZ887oswBQKqaj0qEBy3aLgnKF+OE9xgnbDcUyA99kkUE0pJGLYH0NMKDvz4sLgqPxUUfTZ7bvNcuGeWNvVVSaAKsgss+WEFI+KBgZcE3rHvl6lvVfAAoiJhqRGkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5fff77ff6ddso515083137.1
        for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 02:48:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774000091; x=1774604891;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2iGUIJ7TvYbGTB2SBBw+JWXRbj4mLmqq0A0KfQHtxXA=;
        b=Q9xvORq8+Y4ldaDvKxuN/bIKqGpo7VbgLjqRiw2AQfHJoQCP48joLCewljtfKsOVtU
         0Wx/TOtufds630EIHvi0lLB2eMOUYc+ECePtEO/f4alPS1FdKvrOwFqAZzJCaa6Hf1/4
         Ob0rCwxXfsDoaB0x17Wes6EOSqXueT+sOBWlshgENLVt7bCkS8fYiyd5rfNYSOuQ2ogu
         yNYEr+bMwZZtsL7JACPi3PaUVuP2P+aUXw0FrAV6MuzLtlrP6EPkJShSQNCB06SKFLnN
         WhTkFJvtDXC6PUOmbFAsd04oFwibbe5yfk0x0ocQsADO1OwrlRz667TljA7C6OcYhn+G
         +JDA==
X-Forwarded-Encrypted: i=1; AJvYcCWIuMpSbA0+bJfndVv0iZfG9fFOvygPHqxcu0OdNDpTgoX6DJqbp5PzTN05N1CocRXiAJ609FiMatq3GA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzRxUy3MXycKlc9aLqP1pvNgwegGWkb4DDeZ94F3w85gkFPBlxe
	1IPUFQpyYbZPrWaILPreQ6yyr0fqlGctQZ819UGGl/ywE9vT0T8wT9O35+31WOGPVLQ=
X-Gm-Gg: ATEYQzwHFS8uEetJXw839v3flAv0Sv1CGPeIYewvVvDjANlzOeoUmSVHlZE2PcbSbqL
	XVa4e/+yzCOYI+t11bifqCbiwH6EdGXLx0B8mtbuoXeGrPkno1ZRm/4OzO1jFdnwd2uGY5aqA6M
	dqqfhrOa4WAbhRfW5Mmys+/8KtJ8izlU2YebZIigdY61wtCxZMkI5VQEYZ/AU3nPBGbtfFoZhi1
	b3yf05hTRYQ3HcSRODajNXF8NHtU25mxkP+Nwv9LV+wepe3EWhMyB6VkR0tSJI6SasHgVl/gnVu
	xaH4DxbmHeoqt9wz5jozV8ONw08AskGHoaRwhv25fKM00LXzzuE6d6azXJgXB9Dyoa81OZr7h7q
	NLFW6gGxgsZZoC2Vf06u5waslOzy758BchdR8fYKx6gslSo0zPc56Ov0GljDCr5RGluVSqObAI8
	g4/4Fj9lMTWKudokay6lL70H05imHyQCGKmT3gsDFngvH0ogSuegKYFC6ZCkSw
X-Received: by 2002:a05:6102:3581:b0:5f5:514f:4e59 with SMTP id ada2fe7eead31-602aed0d48bmr1142270137.27.1774000090748;
        Fri, 20 Mar 2026 02:48:10 -0700 (PDT)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-602b549fff7sm459924137.7.2026.03.20.02.48.09
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 02:48:10 -0700 (PDT)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-602947681ccso542948137.2
        for <driver-core@lists.linux.dev>; Fri, 20 Mar 2026 02:48:09 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUvJX5kxNrEyIxPcL0NYjWTidGx40SogiyxxjW+NBmC54SC25i6QtOIC+H2KSi3/Q8Zn/t1GGcTlul+bA==@lists.linux.dev
X-Received: by 2002:a05:6102:4b85:b0:602:8ad9:1f6f with SMTP id
 ada2fe7eead31-602aeabedb1mr1161798137.5.1774000089201; Fri, 20 Mar 2026
 02:48:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <15510cee649959281d9554965cacd0c06531c1f3.1773308898.git.geert+renesas@glider.be>
 <CAPDyKFrMtsp5tRSAOx=ytfQ0xSONtRbC24gq2v4QdSh2wWSw1A@mail.gmail.com>
In-Reply-To: <CAPDyKFrMtsp5tRSAOx=ytfQ0xSONtRbC24gq2v4QdSh2wWSw1A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 20 Mar 2026 10:47:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXupFRDV7AQUwem7Jd2MJyepyONUtTXr8Xdow=zB_qcYg@mail.gmail.com>
X-Gm-Features: AaiRm53jo1Kzi6wdd9BDyM25xGy57mtBCx3HvMxUoZBMKfg4MkiWLGZ43AKoUH4
Message-ID: <CAMuHMdXupFRDV7AQUwem7Jd2MJyepyONUtTXr8Xdow=zB_qcYg@mail.gmail.com>
Subject: Re: [PATCH/RFC] PM: domains: Call pm_runtime_barrier() before dev_pm_domain_{attach*,detach}()
To: Ulf Hansson <ulf.hansson@linaro.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>, 
	Marek Vasut <marek.vasut@mailbox.org>, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-renesas-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Ulf,

On Thu, 19 Mar 2026 at 11:59, Ulf Hansson <ulf.hansson@linaro.org> wrote:
> On Thu, 12 Mar 2026 at 10:54, Geert Uytterhoeven
> <geert+renesas@glider.be> wrote:
> > If a device has multiple PM Domains, dev_pm_domain_detach() is called
> > multiple times on unbind or probe failure.  If the PM Domain is also a
> > Clock Domain, and thus calls pm_clk_destroy() from its .detach()
> > callback, dev_pm_put_subsys_data() will set dev->power.subsys_data to
> > NULL when psd->refcount reaches zero.
> >
> > Later/in parallel, default_suspend_ok() calls dev_gpd_data():
> >
> >     static inline struct generic_pm_domain_data *dev_gpd_data(struct device *dev)
> >     {
> >             return to_gpd_data(dev->power.subsys_data->domain_data);
> >     }
> >
> > which may trigger a NULL pointer dereference.
> >
> > All dev_pm_domain_{at,de}tach*() functions document that callers must
> > ensure proper synchronization of these functions with power management
> > callbacks.  Unfortunately no callers seem to actually do so.  This
> > includes dev_pm_domain_attach_list() and dev_pm_domain_detach_list():
> > they call dev_pm_domain_{attach*,detach}() internally, which means they
> > should take care of this synchronization themselves.
> >
> > Add synchronization to dev_pm_domain_{at,de}tach_list() by calling
> > pm_runtime_barrier() before dev_pm_domain_{attach*,detach}(), and drop
> > the now obsolete comments.
>
> My apologies for not being able to respond earlier to your
> suggestions/questions. I have started looking into this now, and I
> will follow up with more replies and perhaps a patch shortly.
>
> Anyway, the principle is that callers of dev_pm_domain_detach() must
> manage the runtime PM enabling/disabling for its device. If runtime PM
> was enabled, it must typically be disabled before calling
> dev_pm_domain_detach().
>
> What makes this a bit more complicated is that we have two different
> scenarious to consider.
>
> 1) The legacy case, attachment via dev_pm_domain_attach() for the
> single PM domain case. Runtime PM should be enabled/disabled for the
> device, from its corresponding driver/bus. I assume this isn't the
> problem you are facing, right?

No, this is not the problem I am facing.

> 2) Attachment via dev_pm_domain_attach_by_id|name() (which is called
> for the *attach_list() case too), for the single/multi PM domain
> cases. In these cases, runtime PM is enabled in
> genpd_dev_pm_attach_by_id().
>
> For 2), I am inclined to think that the proper action is to call
> pm_runtime_disable() in genpd_dev_pm_detach() before it calls
> genpd_remove_device(). Although, I need to check more closely how
> suitable that would be.

Thanks, that sounds reasonable: genpd_dev_pm_attach_by_id() calls
pm_runtime_enable(), but there is no pm_runtime_disable() call to
balance that...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
