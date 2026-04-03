Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8E038945C
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 10:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775213550; cv=none; b=DxoG6wGyY4j+HTVN7utV0V2+A9c2GZ6ukF5pEJugMZgZkcE0YDIeGygQeViNZu5kCdhDQyN6i+vm+Gj2rEyQaRhJIEi/hgrPzl525BbFOfGppcpyPKZm3Mekjj7tGJOuPekXeiNb1ZZGuaHC0yPkSHXffVKeQJ4VPMlsTeV6FNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775213550; c=relaxed/simple;
	bh=P3AjA+cMgeJBqVZ811dYFTk037t4zMmyh/R5bse4Icw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R/SESn5prOqUxLQP7mS/fTjglJbPHWuOejf6y2IcWsAhBlhJYf7IkEO5bkFICBIbEN9s+ORsFKa2hgaAHcKhxPOp49fZzMee9oPpaHrSdROioVe40qtVxG8Is3PInL3RganuJaUhLUd6BMe/KYfqG5bTiLYpG9FU3HjO9H3aDTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pmaec0V7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pmaec0V7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 235AAC4AF09
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 10:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775213550;
	bh=P3AjA+cMgeJBqVZ811dYFTk037t4zMmyh/R5bse4Icw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Pmaec0V7885tsY6wW4ITmBmNGNdUjKxBmIcfT1hLL6dW//4qT88JCi7+cS3Lsf7eK
	 fnCu17dbfM+0Imn3a5oARVTPwCwFV50J7nGmbHlxFI/YgYyJKdQmCQo5XeQ03IhM5s
	 8/1A9cvDuz02FyexBeNs+l20pPDhg7qGnnVQjfQWG2/PZMYiXStrDCMj38rcEEl0cy
	 kpO88NDjsz1UZ7o/aqp7W4HAMXm9+QxC5L732Ndyde4XVmUFbOgIUUYS2cBiRa3Zrn
	 3Wbgl0lZNTvlLgEV+oXZwhe5ftI/VpGBqEBczQvDXYJa0uNsWP2sMNBOTk+0HYwmjt
	 Srpay4qtx+dnw==
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-40427db1300so1373664fac.0
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 03:52:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXqCE2l5bsU05/M4U+M7tUOPDYheC8Co2hnT+H26K+AqGeyFTvY72w+UwEQ8ccQ4N4xND/7sWmVax4Rlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzGIJFZ7vgrc7HgmEjQ1aK2EvKC/hKhT8BftnWPJCIMqRqheKpJ
	HgHPADNKHeL8Dh2KzNGhoM4RB67YhPLoR8gdjooZ2E2ZJVSRWus4sLoIysm8Vw8ETRZvPAgI+dl
	AFblTztVlSwFrSawhoTgfM0PL2tRkYZA=
X-Received: by 2002:a05:6871:4d0:b0:417:7b1d:1b2 with SMTP id
 586e51a60fabf-4231022b7abmr1271157fac.42.1775213549111; Fri, 03 Apr 2026
 03:52:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260403005005.30424-1-dianders@chromium.org> <20260402174925.v3.2.I54b3ae6311ff34ad30227659d91bb109911a4aea@changeid>
In-Reply-To: <20260402174925.v3.2.I54b3ae6311ff34ad30227659d91bb109911a4aea@changeid>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 3 Apr 2026 12:52:16 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0j6WWpUYV8afbfNyf8sYjRGZWXiBs_LFtiyQmXFrc4Qew@mail.gmail.com>
X-Gm-Features: AQROBzBUJZ4qE5h1hmrTEyDefk2EN9bCBlfkcHXxpodf_cwJVnzS3QhxW_tblME
Message-ID: <CAJZ5v0j6WWpUYV8afbfNyf8sYjRGZWXiBs_LFtiyQmXFrc4Qew@mail.gmail.com>
Subject: Re: [PATCH v3 2/9] driver core: Replace dev->can_match with DEV_FLAG_CAN_MATCH
To: Douglas Anderson <dianders@chromium.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Robin Murphy <robin.murphy@arm.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Burton <paul.burton@mips.com>, Saravana Kannan <saravanak@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Eric Dumazet <edumazet@google.com>, 
	Toshi Kani <toshi.kani@hp.com>, Christoph Hellwig <hch@lst.de>, Alexey Kardashevskiy <aik@ozlabs.ru>, 
	Johan Hovold <johan@kernel.org>, Saravana Kannan <saravanak@google.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 2:51=E2=80=AFAM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> In C, bitfields are not necessarily safe to modify from multiple
> threads without locking. Switch "can_match" over to the "flags" field
> so modifications are safe.
>
> Cc: Saravana Kannan <saravanak@google.com>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
> Not fixing any known bugs; problem is theoretical and found by code
> inspection. Change is done somewhat manually and only lightly tested
> (mostly compile-time tested).
>
> Changes in v3:
> - New
>
>  drivers/base/core.c    | 10 +++++-----
>  drivers/base/dd.c      |  8 ++++----
>  include/linux/device.h |  8 ++++----
>  3 files changed, 13 insertions(+), 13 deletions(-)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 8d4028a2165f..cbdfee887833 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -1011,7 +1011,7 @@ static void device_links_missing_supplier(struct de=
vice *dev)
>
>  static bool dev_is_best_effort(struct device *dev)
>  {
> -       return (fw_devlink_best_effort && dev->can_match) ||
> +       return (fw_devlink_best_effort && test_bit(DEV_FLAG_CAN_MATCH, &d=
ev->flags)) ||

I'm wondering if these test_bit(DEV_FLAG_..., &dev->flags) can be put
behind a set of static inline functions, like for example in this case
dev_can_match() or device_can_mach().  The above would become

      return (fw_devlink_best_effort && dev_can_match(dev)) ||

(and analogously below).

That would at least make the code somewhat easier to follow.

>                 (dev->fwnode && (dev->fwnode->flags & FWNODE_FLAG_BEST_EF=
FORT));
>  }
>
> @@ -1079,7 +1079,7 @@ int device_links_check_suppliers(struct device *dev=
)
>
>                         if (dev_is_best_effort(dev) &&
>                             device_link_test(link, DL_FLAG_INFERRED) &&
> -                           !link->supplier->can_match) {
> +                           !test_bit(DEV_FLAG_CAN_MATCH, &link->supplier=
->flags)) {
>                                 ret =3D -EAGAIN;
>                                 continue;
>                         }
> @@ -1370,7 +1370,7 @@ void device_links_driver_bound(struct device *dev)
>                 } else if (dev_is_best_effort(dev) &&
>                            device_link_test(link, DL_FLAG_INFERRED) &&
>                            link->status !=3D DL_STATE_CONSUMER_PROBE &&
> -                          !link->supplier->can_match) {
> +                          !test_bit(DEV_FLAG_CAN_MATCH, &link->supplier-=
>flags)) {
>                         /*
>                          * When dev_is_best_effort() is true, we ignore d=
evice
>                          * links to suppliers that don't have a driver.  =
If the
> @@ -1758,7 +1758,7 @@ static int fw_devlink_no_driver(struct device *dev,=
 void *data)
>  {
>         struct device_link *link =3D to_devlink(dev);
>
> -       if (!link->supplier->can_match)
> +       if (!test_bit(DEV_FLAG_CAN_MATCH, &link->supplier->flags))
>                 fw_devlink_relax_link(link);
>
>         return 0;
> @@ -3708,7 +3708,7 @@ int device_add(struct device *dev)
>          * match with any driver, don't block its consumers from probing =
in
>          * case the consumer device is able to operate without this suppl=
ier.
>          */
> -       if (dev->fwnode && fw_devlink_drv_reg_done && !dev->can_match)
> +       if (dev->fwnode && fw_devlink_drv_reg_done && !test_bit(DEV_FLAG_=
CAN_MATCH, &dev->flags))
>                 fw_devlink_unblock_consumers(dev);
>
>         if (parent)
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 3aead51173f8..66df31696349 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -132,7 +132,7 @@ static DECLARE_WORK(deferred_probe_work, deferred_pro=
be_work_func);
>
>  void driver_deferred_probe_add(struct device *dev)
>  {
> -       if (!dev->can_match)
> +       if (!test_bit(DEV_FLAG_CAN_MATCH, &dev->flags))
>                 return;
>
>         mutex_lock(&deferred_probe_mutex);
> @@ -860,7 +860,7 @@ static int __driver_probe_device(const struct device_=
driver *drv, struct device
>         if (!test_bit(DEV_FLAG_READY_TO_PROBE, &dev->flags))
>                 return dev_err_probe(dev, -EPROBE_DEFER, "Device not read=
y to probe\n");
>
> -       dev->can_match =3D true;
> +       set_bit(DEV_FLAG_CAN_MATCH, &dev->flags);
>         dev_dbg(dev, "bus: '%s': %s: matched device with driver %s\n",
>                 drv->bus->name, __func__, drv->name);
>
> @@ -1006,7 +1006,7 @@ static int __device_attach_driver(struct device_dri=
ver *drv, void *_data)
>                 return 0;
>         } else if (ret =3D=3D -EPROBE_DEFER) {
>                 dev_dbg(dev, "Device match requests probe deferral\n");
> -               dev->can_match =3D true;
> +               set_bit(DEV_FLAG_CAN_MATCH, &dev->flags);
>                 driver_deferred_probe_add(dev);
>                 /*
>                  * Device can't match with a driver right now, so don't a=
ttempt
> @@ -1258,7 +1258,7 @@ static int __driver_attach(struct device *dev, void=
 *data)
>                 return 0;
>         } else if (ret =3D=3D -EPROBE_DEFER) {
>                 dev_dbg(dev, "Device match requests probe deferral\n");
> -               dev->can_match =3D true;
> +               set_bit(DEV_FLAG_CAN_MATCH, &dev->flags);
>                 driver_deferred_probe_add(dev);
>                 /*
>                  * Driver could not match with device, but may match with
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 5b7ace5921aa..7e5737c6d7d1 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -465,9 +465,13 @@ struct device_physical_location {
>   *
>   * @DEV_FLAG_READY_TO_PROBE: If set then device_add() has finished enoug=
h
>   *             initialization that probe could be called.
> + * @DEV_FLAG_CAN_MATCH: The device has matched with a driver at least on=
ce or it
> + *             is in a bus (like AMBA) which can't check for matching dr=
ivers
> + *             until other devices probe successfully.
>   */
>  enum struct_device_flags {
>         DEV_FLAG_READY_TO_PROBE,
> +       DEV_FLAG_CAN_MATCH,
>  };
>
>  /**
> @@ -552,9 +556,6 @@ enum struct_device_flags {
>   * @state_synced: The hardware state of this device has been synced to m=
atch
>   *               the software state of this device by calling the driver=
/bus
>   *               sync_state() callback.
> - * @can_match: The device has matched with a driver at least once or it =
is in
> - *             a bus (like AMBA) which can't check for matching drivers =
until
> - *             other devices probe successfully.
>   * @dma_coherent: this particular device is dma coherent, even if the
>   *             architecture supports non-coherent devices.
>   * @dma_ops_bypass: If set to %true then the dma_ops are bypassed for th=
e
> @@ -673,7 +674,6 @@ struct device {
>         bool                    offline:1;
>         bool                    of_node_reused:1;
>         bool                    state_synced:1;
> -       bool                    can_match:1;
>  #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
>      defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
>      defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
> --
> 2.53.0.1213.gd9a14994de-goog
>
>
