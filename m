Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A8E3BAD92
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 09:11:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778490695; cv=pass; b=sqJIa8alfXj90YJAjfC9m5a1kBU/IDXuoJ540uCn24GfrGUX9R1ATiN7VLhsaumFRijnhPtFnAqSau0RrZ8Udv+Pqyd3ASCwQANYWOG5XIFXVEuDUdqlVezHMkBwXjC1EPZOEHbcNOgWuaNprTgcvh3Itm2Pom7NnosWdPAZNX4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778490695; c=relaxed/simple;
	bh=MRJbumH1Qj2PiCHvDxYaH3WtUhljSOS/HFExYbHcY30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnN8quGy6F/xYjshKv1I7lE36LAihNy1clS07H4MSOXHfoznsqP9Kqnhx75tJV7rKFcetiCJOfkOXsKKCPgVEG9qwFnXWgTA/4jMgCmGdkuDUkviSc6uqqXhHGDIej7t21WxUTxMdI0VWPXYo0dLRjVrRnziWIdEDxSR77Ugc54=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ins3vBgk; arc=pass smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ins3vBgk"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5a884ebba7dso4153624e87.0
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 02:11:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778490691; cv=none;
        d=google.com; s=arc-20240605;
        b=VmhhW0Vm6tvZFO3MslHIar4+J3g7EjL9Hs+vwN7tv/flX0uFsp5EFryt8rcpW/2uYP
         uD318opaZfHFjMfOuwGYyRiPk1ZfPbIYKd3ngWIpaRSuqTK5LXFhAMfIRnTbpkBh385M
         Fc1jWTFyRFktROsVrAOegSJYnc4a+7kv/1Zo3d/QnP3cPK/65VruvsUddOiKh+iBNcwc
         dhc89G2c7Z3DkqNYP1Sf7FNPvl6KzSLbnuqbg7vmYVV4RuhsFIvLVXNs3Zv6KPp6P393
         ZlgBRvc21Uf9iUEEIbg2TAH10qagDu1cknhWD4nKCDMm3y3AFo/+URrXo0jDELQNUBJL
         1WbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+uAedvwPnfb2fItLrrMcsYtMN0ti5L4NDxTX7XDN5FA=;
        fh=Rn0pR1Mzl36FCU/ujEpN1k1NRX/MlsgIPiY7obUdjiQ=;
        b=Q8a6r6KTUh5iPM4xcHnJyS+r/CofmuMNEW6WECJ8In5OieL9DqaaIZRvOLgT3rCj/i
         S0sMMU4ndkIqm150PkCeEbubtW8fcVXpmDD9SZA7hruVgCAjoGZakT+5yIeHmoclTatR
         oZwU5b2jIbkmWKhm1s8bQTj+ELO6jz8P7So7kZP6s9t5T6GlkGvkqRCjpdFIpg8/YmBk
         KIPH+t6J7UwNBSoizAbDBdedmfa1R2Jg/xTsUJSqUE8xfdeSEjAL6DCF74utYa7egNva
         xBT7S9KaTb5Xe169VVfCTRLMv9Sd+CIfVI2YFFzICRtXdwCLJtnP8ts7O/V1k5Tw+5Yg
         Jb1w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778490691; x=1779095491; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+uAedvwPnfb2fItLrrMcsYtMN0ti5L4NDxTX7XDN5FA=;
        b=ins3vBgkhAZgHl3JYxGj0YHUqLkS9EAmStBymtOBH4Q/uCXss34YyK80/q0cfKUECy
         G3jDdYtLnyERxbTa4NjY7/HyzFpx1X01Crf13u1d55oVy/oF8h4iHabo31uQIZxg3lAR
         8EwyFOeGkfs7139VI5HSrdWWd37Lf9TJ6Xue8WKJL4ECx/+U2nYaBQCcF5OtUL20XPTr
         DEOVDKU6JNGywPhSWk1Z0xOrrwzh9aKWAnMVwGCDNchrVoWOjvqtvNDZHmh0ullZ9MrW
         WzL62eIrL4sYiyOVIFzA+8QLeoxqK89o3tcx394zw0ykwl9oZIxR671bqi9XPUIxX/B2
         OCbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778490691; x=1779095491;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uAedvwPnfb2fItLrrMcsYtMN0ti5L4NDxTX7XDN5FA=;
        b=T2OvH0eTYwQsg/fxPUXyW5Xt0KbWhHncb0DLmea3VajhHayES5npmTXqvw6J7BPeYM
         Y/KpIO2LBQdEcvvnOdKlmh9caCUahbXPc8VeXXsLl1b3RxCePKtEUvdXPn/UIEoxwV5C
         wtabJ9dKi5jlS9IJWV0ImucnsK7DDV1YYCjchPKqNKUnXHz07eebcjyJg6i1R5CFg582
         K1FFSgLEnVPJuYoerztXStVVoknEc6qioOSFjdgGYnKPehF5nQglcre6pP6njB+Oos74
         ZUveSIHP2u94pZM3QiNvk1+XeC6XIfjrkWZUjaa4nCEZBXfyhIqiyLH9hqcA3wEXbeAY
         Ywkw==
X-Forwarded-Encrypted: i=1; AFNElJ/bmSKL30P3apma09ioUrTk/+D6b16EHDUCWouPJiZ2MtCWz64Egz98XKFg96EaRNM3gvhXnGYtk8b63w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxc8Dq6rn+qm9CGgOIwmAHkio2eEcktedtpuTql8y7Yd6lkKKpf
	6dEW1l9ZVw65vAe8Z6CvEyh2kASmoBRF/gDAHLO5Wm2ZNUr6UlvOM+sftDsTSunOBfThV9KMZcs
	Ky1GoTqa9qu3LGtc/hT78MN303ImD68RHWm3E3xe6YA==
X-Gm-Gg: Acq92OG0vap5coLWDgXmk5HQcxrUI4AyYR0jpSFanW10a66+b3NhEUOX9XF0IJwj0rY
	Hs3m1ZA2kEDo6yntzWaMhhnhrmeTVPyyE3guTBaeSr6R7K8pFgVMm7h5vNB7i8bELuXKlDoPcVF
	li3Uwn0aRJKlPTW8ixSC79aHe4brgj35TNpetDhzqoTdHi4ItYETn9q9gKK6Y/mLejIpZ0mXdY8
	pb/tnmiYYlhFpsJ/w2pqCACon3XERRmTARYeoDGqLsoCzGTcolaJUsje8QdXHvCdVokUynrpWnn
	EtPDF2g0
X-Received: by 2002:a05:6512:2386:b0:5a4:194c:d897 with SMTP id
 2adb3069b0e04-5a887ae2025mr7537077e87.12.1778490691163; Mon, 11 May 2026
 02:11:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
 <20260508123910.114273-3-ulf.hansson@linaro.org> <DIDI6UCUFTWA.3GANQE923DAP9@kernel.org>
In-Reply-To: <DIDI6UCUFTWA.3GANQE923DAP9@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 11 May 2026 11:10:54 +0200
X-Gm-Features: AVHnY4LZfAVNtlYlp8J8g6MEIDVkGfD08Ggh7z8GEXqctAp9-Wl133JAWYXxmAE
Message-ID: <CAPDyKFrju3R1t9-a=N6j6qmWoULFq07bfkWhg5g6ZdOvYD3MOA@mail.gmail.com>
Subject: Re: [PATCH v3 02/13] driver core: Enable suppliers to implement fine
 grained sync_state support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, Sudeep Holla <sudeep.holla@kernel.org>, 
	Cristian Marussi <cristian.marussi@arm.com>, Kevin Hilman <khilman@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abel.vesa@oss.qualcomm.com>, 
	Peng Fan <peng.fan@oss.nxp.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Fri, 8 May 2026 at 20:23, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Fri May 8, 2026 at 2:38 PM CEST, Ulf Hansson wrote:
> > diff --git a/drivers/base/base.h b/drivers/base/base.h
> > index 30b416588617..c8be24af92c3 100644
> > --- a/drivers/base/base.h
> > +++ b/drivers/base/base.h
> > @@ -196,6 +196,24 @@ static inline void dev_sync_state(struct device *dev)
> >               dev->driver->sync_state(dev);
> >  }
> >
> > +static inline bool dev_has_queue_sync_state(struct device *dev)
> > +{
> > +     struct device_driver *drv;
> > +
> > +     if (!dev)
> > +             return false;
> > +     drv = READ_ONCE(dev->driver);
> > +     if (drv && drv->queue_sync_state)
> > +             return true;
> > +     return false;
> > +}
> > +
> > +static inline void dev_queue_sync_state(struct device *dev)
> > +{
>
> Let's add device_lock_assert(dev), as this function requires it to be held.
>
> > +     if (dev->driver && dev->driver->queue_sync_state)
> > +             dev->driver->queue_sync_state(dev);
> > +}
>
> <snip>
>
> > @@ -1175,6 +1188,25 @@ static void device_links_flush_sync_list(struct list_head *list,
> >
> >               put_device(dev);
> >       }
> > +
> > +     if (!q_list)
> > +             return;
> > +
> > +     list_for_each_entry_safe(dev, tmp, q_list, links.queue_sync) {
> > +             list_del_init(&dev->links.queue_sync);
>
> Hm...this is called without the device_links_write_lock() held, so this looks
> like this could this race with the list_del_init() from
> device_links_driver_cleanup() and create an infinite loop.
>
> (The other list iterator above might have the same issue.)

Yes, you are right!

I was trying to follow the existing implementation for the regular
sync_state, but it certainly looks like we need a separate lock to
protect the lists.

Let me fold in a patch that fixes this for the regular ->sync_state()
code first.

>
> > +
> > +             if (dev != dont_lock_dev)
>
> This is pre-existing, but I think it would be good to add a device_lock_assert()
> call for this as well.

Makes perfect sense.

Again, I will fold in a patch that start by adding this for the
regular ->sync_state().

>
> > +                     device_lock(dev);
> > +
> > +             device_links_write_lock();
> > +             dev_queue_sync_state(dev);
> > +             device_links_write_unlock();
> > +
> > +             if (dev != dont_lock_dev)
> > +                     device_unlock(dev);
> > +
> > +             put_device(dev);
> > +     }
> >  }

Thanks for reviewing!

Kind regards
Uffe
