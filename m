Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3DD03B9D93
	for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 10:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776852505; cv=pass; b=AIaWk6DYIigWw3NbWz1fCGYKVyzMBlNPPAFAgBaZsreSunZ6JKDAlPNgNYvYcnW7bbOUF5zowMqbgGNi3SiRKwvsgSgMZXXyymjgqJxmlkV95DN0/TEabBQzlDf+BzRhtNiL80w0tmkByQ6i2UN+Nc3efOhvFo4UoPKxXjVVb2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776852505; c=relaxed/simple;
	bh=nCoV49HVym5KpFJq669SmgOv4OUFBlE42Ax7zUUgrZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HInTXhAyKo3OG5uowW2V+HgeHk/m8SCapEzq2GD13PN1U0dUTZB3p21b9aZTcpwr6uIUx8ltROogsqGmQShyhfsb1HGD2c/jEcL0cuaPQMLdl98iCn+DdTx9HY4tdfm9L8D2niZknqLPhnykyaLJrXMmlhCDn0QBKvGKGwlXVCY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NkgIEL1/; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NkgIEL1/"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a402dea4a5so5989417e87.2
        for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 03:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776852501; cv=none;
        d=google.com; s=arc-20240605;
        b=kiY29N+G1rq7OWFYV9kDycVQK9a10RhMArkfPQNF5J7qsMPye8RjdFAyhwsyeffVfD
         MMWITvh5OiufZ3IpZYbgesSXh1XnY34LU2RREdwlKR81Pymr0Tca8+uBJ6FGjYjCZti9
         UIfLj/lQtI7b6qJ8YY0oSOS1aDgtzYSFBJTIwkvQMDmHEqkm8Mx0MzuWSVhjKOw9QiU9
         8F1mgTbwlVwiN6eRa1mlqWnN9sz+D7GrfpEG3BuCOLvZrfQM8rcyLvdlMnmmRgSK/h8/
         XNdlc5o8i7Ry0hV/UXvyJ+YjqjC8G9wCG1XRDU2QrHb3DQ4rYOt4vtLSOMqtIZJB9CEf
         liRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=uTyCSfRMVmFA3LOz4cC7W7FYlOyU1Jx/xl8KZgNvmJM=;
        fh=B3pfMfttrqtBiIHzwB55TdNrsD1x1D5Y4cRI9bU/Xdg=;
        b=gWLq1wu6hWbd4IgsIT/sr9bhR/84skiVj/wTkDPNpiRwtEKje8hEVn249//tpgj9rH
         tmRECzDPFJHg1f8IhxqO5epK0x133XdoPaxmYhvcc7sNaGs/C1VcDGwTSSbeG/NoV3Uw
         Te3TcYYC0+YDz2+NdpEcoNROcc4nFJWx+coAv/uTQJc1vuw8moJAWOW4g1+C7Q6+D5y/
         dWYsAkJNZ82U6iT4TBWeEv/ED0Gpyq62mUDqOwdJqApzB6tOPaB2Ka8RqbHjPUvwFYNs
         ChT1EVHuM8xDYtIter9m6qjVPHu3aNd4doc/8CCpTjxRtxctyR9yVrlRxgL3HEARJEW/
         A6TA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776852501; x=1777457301; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uTyCSfRMVmFA3LOz4cC7W7FYlOyU1Jx/xl8KZgNvmJM=;
        b=NkgIEL1/fX7p0BTNr4YP5XbvlvbxInTdoL7YbpMHIrF7sX54+KeIyGJGhCNjojOzg6
         J+/TWXUd8XY+lUfa0pyj9Njs5+ngFfWmN+Ls01y3oGa19i+Pm41ARluDlv5clAN+flX8
         /ph5MkYvx5Nm4TgCkzHjYqQYMDVZbSqzPqDxbo44fiGnoskQhHD9zFZZBs9DtSsUKAeK
         aGiborihtZeC0A1ezln3RXYHkqstWg/5bpozAcgVQOgJOgR2lD3/N9PbEWQ3C3dZIn+D
         eaX24kWOb8l0YF3fiPvsFSsw45rHlcKjPhO7s30c00t9tJvLCWifFyoq56FcJq82RgTf
         JVug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776852501; x=1777457301;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uTyCSfRMVmFA3LOz4cC7W7FYlOyU1Jx/xl8KZgNvmJM=;
        b=ObzlGZZztGRznOqwPMhbVWEBaAcV3kywH7G6MZ1l4FE4dGCUZZy0cwfJe+omp/DXbb
         2OYmwQeERjS2zq29Eod8PmaCrAP1F7CJV9N53k2LyvoTUZspnLF+lSvAy7Da6w0JiwrO
         yb5u6Jgv7PiolGeLfrUzx8VD493GvNnFpqRQPOA1G3muDrNzmWvjvkCcYaz9zqbBvC7q
         wolmcI4DZ3QwHa7mR7rqkynHIuQe0gzQUHWSVVsgRw91HUg5AmbcDw5FqlsROYHxb41j
         aM+LlwC8XhYsukrXjxYiIU0Tn68WWGnXd1SAl4a77QrLgClW4cjPf1pbJ689Yb1LMA7O
         VaDw==
X-Forwarded-Encrypted: i=1; AFNElJ/xyB0ygNgsDMnjfTkWPZzpxBCyNjQ8B1zQpvaVt6AP8pCfwqDx6/knbmU1+CE0zc30Zyd/rxQBOzE2DQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxhYZjjWg1M1rnZqqPh/qw6p5m9ahjOQoeBzoWb4M4snWqNwEXf
	xV2w+/WA9+KZLpwl47g/mEIU/F+XGb1tOt4+TEKXIk5dX/wqa54kjlKQIfBlodzLOyoNE9SSffj
	q4kRk/DoE1fs18lQazb11Nj4tce1Kp33HgaseVrM3cg==
X-Gm-Gg: AeBDiev4t58TTpShcDS95AX49fWPcvdWj11kS+cr8tPYomPTgMGDLiqE0VZHuGgz86y
	4Prp5uNyErxUIHJiWtwjSdcyGuUkRNdHyYTTYVKLseRJnC005o0xi3Gps/nzByNjN2fh3x2SxFX
	TLNGu/r/HEnK4LwgkeSeZqU1pB8MfHo7sjLwwsScdRfML/ti2DtdYclQYO8iDtrX9k79RA3XDOQ
	davkc8buq2fAjsY6lGqedyItGlu0MX0BVaaA9tActVsSUZkB/rCIRotiOfUBMuTJ7kB3v7+5iFg
	RAiDcb1SdFuUzQyLEnU=
X-Received: by 2002:ac2:4c4b:0:b0:5a4:b0:a072 with SMTP id 2adb3069b0e04-5a4172ca655mr6734556e87.4.1776852500411;
 Wed, 22 Apr 2026 03:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260410104058.83748-1-ulf.hansson@linaro.org>
 <20260410104058.83748-2-ulf.hansson@linaro.org> <DHW8QPU1VU1F.3P6PH69HLFBYC@kernel.org>
In-Reply-To: <DHW8QPU1VU1F.3P6PH69HLFBYC@kernel.org>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Wed, 22 Apr 2026 12:07:44 +0200
X-Gm-Features: AQROBzC5eJAyDlpSocEWC79YWE17Iafg8A3OHcUQDEnYvf-zjcf7j-wZjMNN0Zk
Message-ID: <CAPDyKFqMDPiqvqJrq5Qs6Tw4Sc7szG4G-=y0NFkNSPoNd9kdVA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] driver core: Enable suppliers to implement fine
 grained sync_state support
To: Danilo Krummrich <dakr@kernel.org>
Cc: Saravana Kannan <saravanak@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-pm@vger.kernel.org, 
	Sudeep Holla <sudeep.holla@kernel.org>, Cristian Marussi <cristian.marussi@arm.com>, 
	Kevin Hilman <khilman@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Bjorn Andersson <andersson@kernel.org>, 
	Abel Vesa <abel.vesa@oss.qualcomm.com>, Peng Fan <peng.fan@oss.nxp.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maulik Shah <maulik.shah@oss.qualcomm.com>, Konrad Dybcio <konradybcio@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Sat, 18 Apr 2026 at 13:23, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Fri Apr 10, 2026 at 12:40 PM CEST, Ulf Hansson wrote:
> > The common sync_state support isn't fine grained enough for some types of
> > suppliers, like power domains for example. Especially when a supplier
> > provides multiple independent power domains, each with their own set of
> > consumers. In these cases we need to wait for all consumers for all the
> > provided power domains before invoking the supplier's ->sync_state().
> >
> > To allow a more fine grained sync_state support to be implemented on per
> > supplier's driver basis, let's add a new optional callback. As soon as
> > there is an update worth to consider in regards to managing sync_state for
> > a supplier device, __device_links_queue_sync_state() invokes the callback.
> >
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
> > ---
> >  drivers/base/core.c           | 7 ++++++-
> >  include/linux/device/driver.h | 7 +++++++
> >  2 files changed, 13 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 09b98f02f559..4085a011d8ca 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -1106,7 +1106,9 @@ int device_links_check_suppliers(struct device *dev)
> >   * Queues a device for a sync_state() callback when the device links write lock
> >   * isn't held. This allows the sync_state() execution flow to use device links
> >   * APIs.  The caller must ensure this function is called with
> > - * device_links_write_lock() held.
> > + * device_links_write_lock() held.  Note, if the optional queue_sync_state()
> > + * callback has been assigned too, it gets called for every update to allowing a
>
> s/allowing/allow/
>
> > + * more fine grained support to be implemented on per supplier basis.
> >   *
> >   * This function does a get_device() to make sure the device is not freed while
> >   * on this list.
> > @@ -1126,6 +1128,9 @@ static void __device_links_queue_sync_state(struct device *dev,
> >       if (dev->state_synced)
> >               return;
> >
> > +     if (dev->driver && dev->driver->queue_sync_state)
> > +             dev->driver->queue_sync_state(dev);
>
> This seems to be called without the device lock being held, which seems to allow
> the queue_sync_state() callback to execute concurrently with remove(). This
> opens the door for all kinds of UAF conditions in drivers.

If that were the case, this whole function would be unsafe even before
this change. I assume this isn't because of how the function is being
called, but I may be wrong.

Anyway, let me add a get/put_device() here somewhere, to ensure we
prevent this from happening. I assume that is what you are proposing?

>
> This also made me aware that the above dev_has_sync_state() is probably broken,
> as it also performs the following check without the device lock being held.
>
>         dev->driver && dev->driver->sync_state
>
> I think nothing prevents dev->driver to become NULL concurrently; in this case
> READ_ONCE() should be sufficient though as it doesn't execute the callback.
>
> I will send a patch for this.

Okay, thanks!

>
> > +
> >       list_for_each_entry(link, &dev->links.consumers, s_node) {
> >               if (!device_link_test(link, DL_FLAG_MANAGED))
> >                       continue;
> > diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
> > index bbc67ec513ed..bc9ae1cbe03c 100644
> > --- a/include/linux/device/driver.h
> > +++ b/include/linux/device/driver.h
> > @@ -68,6 +68,12 @@ enum probe_type {
> >   *           be called at late_initcall_sync level. If the device has
> >   *           consumers that are never bound to a driver, this function
> >   *           will never get called until they do.
> > + * @queue_sync_state: Similar to the ->sync_state() callback, but called to
> > + *           allow syncing device state to software state in a more fine
> > + *           grained way. It is called when there is an updated state that
> > + *           may be worth to consider for any of the consumers linked to
> > + *           this device. If implemented, the ->sync_state() callback is
> > + *           required too.
>
> What happens if this is not the case? Maybe worth to check and warn about this
> in driver_register().

Good point!

I believe I should also add a check in dev_set_drv_queue_sync_state()
that is added in patch2.

>
> >   * @remove:  Called when the device is removed from the system to
> >   *           unbind a device from this driver.
> >   * @shutdown:        Called at shut-down time to quiesce the device.
> > @@ -110,6 +116,7 @@ struct device_driver {
> >
> >       int (*probe) (struct device *dev);
> >       void (*sync_state)(struct device *dev);
> > +     void (*queue_sync_state)(struct device *dev);
> >       int (*remove) (struct device *dev);
> >       void (*shutdown) (struct device *dev);
> >       int (*suspend) (struct device *dev, pm_message_t state);
> > --
> > 2.43.0
>

Thanks for reviewing!

Kind regards
Uffe
