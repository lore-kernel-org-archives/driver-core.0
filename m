Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336B43B4EB7
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 14:07:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774274841; cv=none; b=UTVj7MamMt8csiPfDCbhvTPLwO7Tem/N3ForRwUCe8Tz5Yu7sh3r9a6Jz0pHKHmUJIqm+OzL86LcjYpy4GgBo4HbonIgCNBFxMZm3u5Ba99KoBS2qjJNX6FeWfHOa8GaelYcWxOoRiSKjQNVxe2K1p/Fq7QwRTv/RTBNC/SuRGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774274841; c=relaxed/simple;
	bh=+hOefeJCWgR/U+foUT9+hsW2imWT1SNNShlzGWxMfH4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SSv/jM7XwOOUmsO+G0Nx5TOlY3ZuKxTbEN695c6TG//gfqwuR0EHQ1sovME7O8kdPmKRiyJuoaqZK7XIoz3VCgU2obdkPckg6+c7u67KbLzGmz2ncQhH8lEKCjkMlS1BpILY3bq6TbSziXiTOpf70Yfz/2ecacPonfuNUlIui8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WP3zBSkJ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WP3zBSkJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774274839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UEFtNkvxGGVpP1A5Fdy0Wlxh3FGV7miNzvBe6PrAo68=;
	b=WP3zBSkJU1gJbhwp6xRDWjRhG/DaD7F9ud4ifeKSKREAht94X5oYbheTcOeuhC/Cr/VqQh
	gMZAKRJxJoNp8ETg0ZI2emAe1Rd5I4t84CntHKDM6B2JEh6MDqP2efOebqE7r2aJtqBaxX
	mqZAURKO1SUeOU9zlGf8LtmcLg/Oi+w=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-156-6hFmEMFnOi-7dbWXz2_x_w-1; Mon, 23 Mar 2026 10:07:16 -0400
X-MC-Unique: 6hFmEMFnOi-7dbWXz2_x_w-1
X-Mimecast-MFC-AGG-ID: 6hFmEMFnOi-7dbWXz2_x_w_1774274834
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-38c22faefe4so888651fa.2
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 07:07:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774274834; x=1774879634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=UEFtNkvxGGVpP1A5Fdy0Wlxh3FGV7miNzvBe6PrAo68=;
        b=Fe1WbZzcBgyM31tgRPfuP5Mexf3blHkCSKUIIUzrIDZ3ABoZmgIsl4t91WE/9W6B/h
         CE3m0oMBBZSIfJ7Mrd98XT1zHgPE6RXyBemb71G+7lXYNDrF1nU0aQ/GXtLBbWFFgmUY
         /WI/BRyt5rKEHm+/htiM8WPfTOwDNvA4n668y4OS2TI4lmXmgZKPD452JS0YKg0hFLan
         ehE50+BT9F48R2NG7XAEK/ptJ5UhFdTAad9zKnv5/TtlIuAzMLM4FC+WiLus81eVhmpV
         GaiPee7vpEWZiKj+5jBXb4eMGbCdpJgBuBfFzYAOCPfJ0Q7PGBR1hC2pib6ZwZDD4H3E
         0jcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUU1wEfnG+EHNvLDTvh8ItscMaBtKFbeSN6i3Kt4kgA0/8OVqTB8UJHhK8bjUp7rMPlDI/6UtRvIHJLxw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVWSkrATIqNDhPw+f+MXWitkgm9jMM5IkQVkL/5XjafUPzolOt
	RF8lJ/+8tGv+omkA0Xs8K06AY0ElqTMEnAB1m4PySZsGtAn/FAzHFRcovlOYoS3d2EzecTkCnsM
	ZqzAyFmoG9Cz6CUZ27vDI9bqcFn1eye/QVm3CMUkIrTDS9n0otH34Fxcr2ajejq+u6bB11DVHWF
	pfUQrXwZKo/f7Jt0CdupO1LFYAYOlctS/xSwxCSSI=
X-Gm-Gg: ATEYQzySKX+33B5R7Yht1KjyjbLKms+uO+69ysV25py+5mdaLGHiIkZYCVEUZYksBMz
	uqOANaOGqKqEZvL6sUAtaVpyVy1MNgL/zV5j5L+E6H9QdpSpH+kS1NI8+3GVoxR0/YacB0VxTrD
	eBbmNCjESMB9rwAg+pyc7dXWJxQaG4ZskuOkGqzT0GYNF4RooSdaaNKdQaU8IbhBA51zFJm6Bic
	qK9
X-Received: by 2002:a2e:8a96:0:b0:385:f547:1842 with SMTP id 38308e7fff4ca-38bf973a260mr42601111fa.30.1774274834254;
        Mon, 23 Mar 2026 07:07:14 -0700 (PDT)
X-Received: by 2002:a2e:8a96:0:b0:385:f547:1842 with SMTP id
 38308e7fff4ca-38bf973a260mr42600771fa.30.1774274833522; Mon, 23 Mar 2026
 07:07:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260319141142.5781-1-djeffery@redhat.com> <20260319141142.5781-4-djeffery@redhat.com>
 <DHA2BZE56U6E.3V6HEWOPLHAXX@arkamax.eu>
In-Reply-To: <DHA2BZE56U6E.3V6HEWOPLHAXX@arkamax.eu>
From: David Jeffery <djeffery@redhat.com>
Date: Mon, 23 Mar 2026 10:07:01 -0400
X-Gm-Features: AQROBzCwdHjXflR3qUAR1ggq6kqqMMNrczgzxRgCKQ9x05zGx_1djDn3Vs4FNkE
Message-ID: <CA+-xHTFzajQP+_OWs=-OF-J0rGM3iOYpgL5q9S4Rra5q==Qg2Q@mail.gmail.com>
Subject: Re: [PATCH 3/5] driver core: async device shutdown infrastructure
To: Maurizio Lombardi <mlombard@arkamax.eu>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <tatashin@google.com>, =?UTF-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bjorn Helgaas <helgaas@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: KT-gT53_iIg7rPVf9NC4Ek2wrvC2qPs3WWTgTS-Rfy4_1774274834
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 23, 2026 at 5:50=E2=80=AFAM Maurizio Lombardi <mlombard@arkamax=
.eu> wrote:
>
> On Thu Mar 19, 2026 at 3:11 PM CET, David Jeffery wrote:
> > Patterned after async suspend, allow devices to mark themselves as want=
ing
> > to perform async shutdown. Devices using async shutdown wait only for t=
heir
> > dependencies to shutdown before executing their shutdown routine.
> >
> > Sync shutdown devices are shut down one at a time and will only wait fo=
r an
> > async shutdown device if the async device is a dependency.
> >
> > Signed-off-by: David Jeffery <djeffery@redhat.com>
> > Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> > Tested-by: Laurence Oberman <loberman@redhat.com>
> > ---
> >  drivers/base/base.h    |   2 +
> >  drivers/base/core.c    | 104 ++++++++++++++++++++++++++++++++++++++++-
> >  include/linux/device.h |  13 ++++++
> >  3 files changed, 118 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/base/base.h b/drivers/base/base.h
> > index 79d031d2d845..ea2a039e7907 100644
> > --- a/drivers/base/base.h
> > +++ b/drivers/base/base.h
> > @@ -113,6 +113,7 @@ struct driver_type {
> >   * @device - pointer back to the struct device that this structure is
> >   * associated with.
> >   * @driver_type - The type of the bound Rust driver.
> > + * @complete - completion for device shutdown ordering
> >   * @dead - This device is currently either in the process of or has be=
en
> >   *   removed from the system. Any asynchronous events scheduled for th=
is
> >   *   device should exit without taking any action.
> > @@ -132,6 +133,7 @@ struct device_private {
> >  #ifdef CONFIG_RUST
> >       struct driver_type driver_type;
> >  #endif
> > +     struct completion complete;
> >       u8 dead:1;
> >  };
> >  #define to_device_private_parent(obj)        \
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 2e9094f5c5aa..53568b820a13 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -9,6 +9,7 @@
> >   */
> >
> >  #include <linux/acpi.h>
> > +#include <linux/async.h>
> >  #include <linux/blkdev.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/cpufreq.h>
> > @@ -37,6 +38,10 @@
> >  #include "physical_location.h"
> >  #include "power/power.h"
> >
> > +static bool async_shutdown =3D true;
> > +module_param(async_shutdown, bool, 0644);
> > +MODULE_PARM_DESC(async_shutdown, "Enable asynchronous device shutdown =
support");
> > +
> >  /* Device links support. */
> >  static LIST_HEAD(deferred_sync);
> >  static unsigned int defer_sync_state_count =3D 1;
> > @@ -3538,6 +3543,7 @@ static int device_private_init(struct device *dev=
)
> >       klist_init(&dev->p->klist_children, klist_children_get,
> >                  klist_children_put);
> >       INIT_LIST_HEAD(&dev->p->deferred_probe);
> > +     init_completion(&dev->p->complete);
> >       return 0;
> >  }
> >
> > @@ -4782,6 +4788,37 @@ int device_change_owner(struct device *dev, kuid=
_t kuid, kgid_t kgid)
> >       return error;
> >  }
> >
> > +static bool wants_async_shutdown(struct device *dev)
> > +{
> > +     return async_shutdown && dev->async_shutdown;
> > +}
> > +
> > +static int wait_for_device_shutdown(struct device *dev, void *data)
> > +{
> > +     bool async =3D *(bool *)data;
> > +
> > +     if (async || wants_async_shutdown(dev))
> > +             wait_for_completion(&dev->p->complete);
> > +
> > +     return 0;
> > +}
> > +
> > +static void wait_for_shutdown_dependencies(struct device *dev, bool as=
ync)
> > +{
> > +     struct device_link *link;
> > +     int idx;
> > +
> > +     device_for_each_child(dev, &async, wait_for_device_shutdown);
> > +
> > +     idx =3D device_links_read_lock();
> > +
> > +     dev_for_each_link_to_consumer(link, dev)
> > +             if (!device_link_flag_is_sync_state_only(link->flags))
> > +                     wait_for_device_shutdown(link->consumer, &async);
> > +
> > +     device_links_read_unlock(idx);
> > +}
> > +
> >  static void __shutdown_one_device(struct device *dev)
> >  {
> >       device_lock(dev);
> > @@ -4805,6 +4842,8 @@ static void __shutdown_one_device(struct device *=
dev)
> >               dev->driver->shutdown(dev);
> >       }
> >
> > +     complete_all(&dev->p->complete);
> > +
> >       device_unlock(dev);
> >  }
> >
> > @@ -4823,6 +4862,58 @@ static void shutdown_one_device(struct device *d=
ev)
> >       put_device(dev);
> >  }
> >
> > +static void async_shutdown_handler(void *data, async_cookie_t cookie)
> > +{
> > +     struct device *dev =3D data;
> > +
> > +     wait_for_shutdown_dependencies(dev, true);
> > +     shutdown_one_device(dev);
> > +}
> > +
> > +static bool shutdown_device_async(struct device *dev)
> > +{
> > +     if (async_schedule_dev_nocall(async_shutdown_handler, dev))
> > +             return true;
> > +     return false;
> > +}
> > +
> > +
> > +static void early_async_shutdown_devices(void)
> > +{
> > +     struct device *dev, *next, *needs_put =3D NULL;
> > +
> > +     if (!async_shutdown)
> > +             return;
> > +
> > +     spin_lock(&devices_kset->list_lock);
> > +
> > +     list_for_each_entry_safe_reverse(dev, next, &devices_kset->list,
> > +                                      kobj.entry) {
> > +             if (wants_async_shutdown(dev)) {
> > +                     get_device(dev->parent);
> > +                     get_device(dev);
> > +
> > +                     if (shutdown_device_async(dev)) {
> > +                             list_del_init(&dev->kobj.entry);
> > +                     } else {
> > +                             /*
> > +                              * async failed, clean up extra reference=
s
> > +                              * and run from the standard shutdown loo=
p
> > +                              */
> > +                             needs_put =3D dev;
> > +                             break;
> > +                     }
> > +             }
> > +     }
> > +
> > +     spin_unlock(&devices_kset->list_lock);
> > +
> > +     if (needs_put) {
> > +             put_device(needs_put->parent);
> > +             put_device(needs_put);
> > +     }
> > +}
> > +
> >  /**
> >   * device_shutdown - call ->shutdown() on each device to shutdown.
> >   */
> > @@ -4835,6 +4926,12 @@ void device_shutdown(void)
> >
> >       cpufreq_suspend();
> >
> > +     /*
> > +      * Start async device threads where possible to maximize potentia=
l
> > +      * parallelism and minimize false dependency on unrelated sync de=
vices
> > +      */
> > +     early_async_shutdown_devices();
> > +
> >       spin_lock(&devices_kset->list_lock);
> >       /*
> >        * Walk the devices list backward, shutting down each in turn.
> > @@ -4859,11 +4956,16 @@ void device_shutdown(void)
> >               list_del_init(&dev->kobj.entry);
> >               spin_unlock(&devices_kset->list_lock);
> >
> > -             shutdown_one_device(dev);
> > +             if (!wants_async_shutdown(dev) || !shutdown_device_async(=
dev)) {
> > +                     wait_for_shutdown_dependencies(dev, false);
> > +                     shutdown_one_device(dev);
> > +             }
> >
> >               spin_lock(&devices_kset->list_lock);
> >       }
> >       spin_unlock(&devices_kset->list_lock);
> > +
> > +     async_synchronize_full();
> >  }
> >
> >  /*
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index 0be95294b6e6..da1db7d235c9 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -551,6 +551,8 @@ struct device_physical_location {
> >   * @dma_skip_sync: DMA sync operations can be skipped for coherent buf=
fers.
> >   * @dma_iommu: Device is using default IOMMU implementation for DMA an=
d
> >   *           doesn't rely on dma_ops structure.
> > + * @async_shutdown: Device shutdown may be run asynchronously and in p=
arallel
> > + *           to the shutdown of unrelated devices
> >   *
> >   * At the lowest level, every device in a Linux system is represented =
by an
> >   * instance of struct device. The device structure contains the inform=
ation
> > @@ -669,6 +671,7 @@ struct device {
> >  #ifdef CONFIG_IOMMU_DMA
> >       bool                    dma_iommu:1;
> >  #endif
> > +     bool                    async_shutdown:1;
> >  };
> >
> >  /**
> > @@ -824,6 +827,16 @@ static inline bool device_async_suspend_enabled(st=
ruct device *dev)
> >       return !!dev->power.async_suspend;
> >  }
> >
> > +static inline bool device_enable_async_shutdown(struct device *dev)
> > +{
> > +     return dev->async_shutdown =3D true;
> > +}
>
> Shouldn't this function just return void?

Yes, it should just be changed to a void.

David Jeffery

