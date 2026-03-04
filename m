Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5716291864
	for <driver-core@lists.linux.dev>; Wed,  4 Mar 2026 02:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772591280; cv=pass; b=WuBvgVyvDTqjGdUaW8C9x2fjjBWmvsjzL6YYndWyupsOGik27+DWx3O78YFQq8P61S5vercHjIY+ljJngeZH8Fk9ZK4LCyznzJK49I5sjSJf3dA8ophs+US4Yjp6QNMUVJOsjmvt71b71DJZ1KXHqtXPQuCPGtf8bW1CMHtQXiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772591280; c=relaxed/simple;
	bh=py3aKKVn93HvEcbikt3U0dk2M/t9J8+imzeqfvnOlMA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EN7haVeu9T+ORJhiYqJH5DD8FgV81FaawVoai9QmMGowmBXLVmDkK4YWwKIr523BxC6+JVk1AIRAobBog72U4YWqqwo/f6vFldDgVxa/fZqKRUawgSZm1K3NqKdso00wpgPyOUQQekIO99bQ+JUdzrEgfvxPaH5uC7Tme32niUE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=byAACM31; arc=pass smtp.client-ip=209.85.167.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="byAACM31"
Received: by mail-oi1-f174.google.com with SMTP id 5614622812f47-4638a18efc2so4473721b6e.3
        for <driver-core@lists.linux.dev>; Tue, 03 Mar 2026 18:27:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772591278; cv=none;
        d=google.com; s=arc-20240605;
        b=PGKlBQcRa7AnvX9zYx0NSFcRqNfIZLbVI1CDKRrq/0328nMYbbR3lzZEn8m/xvUY2L
         f/nLemfwHSot8BhAstIsAaqWP12QgozBnY8jzuWtK+6okiXfk02a1cTXtNGSGyKcDTmO
         QCq8ha5VeiE9Cpi0yCAkYUcirPtTjK5iX45cD0GFI9Md7/6eJOT59yv47ZFngBu0wTUr
         wcmFMk4x7DCaKLofCwXoKYmNXGrjgqkWp7/n+rBeCciECtmr3++hMnVEmHDwIm/DMHNY
         YR0WcBc2oTy2PPnuNLyXcMB9mtWozwXtun7jCjvN52P7gBRKOzpA0YuZqQCqpruz2O0Z
         AGyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6Lcbeb/64UCshEgxWIZnEJ+ommj9WqeVen8Lhvcah74=;
        fh=r9aUgmndF6spn4S6ENaYSDz+PDgNXoZJsELkT79wUb4=;
        b=Gfc/mGOtpCzjeUrWkVlQQeUBHOGsX5DJqxq9qAKgjfRFLyG5rj4u3Ax90k6I3xe5VF
         26TICEIEq8/Uf9wlqPOnQ2PCaA3ZkQr20rGz+/1Nw2XvLLOnmOdNm/wdt6WWLwQKFEEy
         x2MvyRYzg4D0PivXZmSFWoxwUdIR2nEGN7SvzoWE7ixpsuTu6w6RRaEOlq4h9q09jhtM
         O24fFZvHEQZ6kUkxQBcceVR6prkxyRoSRTuYM1SWc0lqlMDPp0F35Ob8U4hBuQvyZ5E/
         odmjZlhQdFhlMWqpws6bB0SkJ3Yy2B0kdoYPYO9jSbAc8OjtjSnTf922L4cwYXU4Hb0d
         5t3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772591278; x=1773196078; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Lcbeb/64UCshEgxWIZnEJ+ommj9WqeVen8Lhvcah74=;
        b=byAACM31PQo/5YwCr9GqxCTgRiBZe2lJ6SxnNnF2nq0xzZZL9m+fbl2j2S6WY6sle9
         R5fpvixkHa9kx+z3hOX8tVDNu4zI3XkFcKhtnKJdgh5xg7K0Ryzh9EHPTy8ndQl+f9d4
         Kb2lDraOPEAsmeyazPu0At44Oda93ce4E5B8VdCWK+KIw89hXMeJtUFU8JPyxwr0uCKI
         5qoAN53W/fvPGKLZSecZjzklFX+S6Fwb2MxuiUCKNCSCF3N/NqawPPsr2f5VgB0g6Ja1
         fRpNhxB1sTD20F68rd13xqbz1FUBX4NU9JxeQ2HnXP+qs3kuBCWYMQBbqopR8YQDHMxn
         Xrig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772591278; x=1773196078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Lcbeb/64UCshEgxWIZnEJ+ommj9WqeVen8Lhvcah74=;
        b=PNIWLQpNhbe8z4swrVa0xe7uysfd/QYqUDcnr4skS1q5EhkPr4FRL//3K2qirj5lx/
         szjAv8GXN7qPSNvflKXKpBW/wPmDgJKcvkbUWxvllTRhtzy9PKCfJdjwrb6Cjn8Ket4Y
         jdoSSsnmyxFk/qdJv6fbNUQ3aesWFhKpoM3knHZ6MtMduCUTRYyL3Fdr43U2jwuFsuFu
         9EdXn2kV3bVC2VKnFR0n7h4Aztu5wvVvPAYIv1wCd7ODUVOyDCJdtW+92ZCPXz6rYAhh
         oUM/CyOJvmOyi6ZhcNdzzukNnOokXX46kCFCoSp99QNJVeN313+froWzGJ2RjLFQwdyS
         oLzg==
X-Forwarded-Encrypted: i=1; AJvYcCVR/c8TGkwQ3eEmxu1YnTWVb2nK1SWh7xX7eoYLxBdDcKSH17pgCLCUSBhDgZNRwgr4Kuc+sDwDuFLDPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzONcvnGM+jFJS2mMFx7ifbQkggC+lAL6VIHgzFhM/vRHdjY2ve
	rxr81P2288zhPspD/4iYXQQQQ9gqYyfjXfak5APa60kzZbPEsaH9z31MciTNNzagUSF3VqO2vEp
	ED8A9Dyy0JyjVwmHWhGJButLdFLkKLL4=
X-Gm-Gg: ATEYQzykNcyIFC5vqWeOdYI1h6iph2QyJvi5DvgeutIaN+aRt8NMKhPNTRFNFvLbZ2d
	S1kpTeyx/aSR/oA+zIrxy2j+LhiDlzxeRwHgi6EwvpEDlvJI9DVu8SjCL4QydJdbArY02QdNGPJ
	PWHM+wzxIfQhOYA4exXAcMAdMwu/M7Wfc7qYxfNF/OfWAnMWeqFVXmZuWe2w96uqKX14LpdNIZz
	rP+LpwIYMrkXUUh8KWiwyieTc7mG4FLGDHTv5/3GsKaUgnMpTfyg95bg7HhfPC+yL5DzaVpG2zh
	v25DYM4w9CD17Iei6f4wV8R/y64/LhdgHguHpP76oXSdZll8K/Fp3Djgy3wUntFW1C4Cbo8dlA=
	=
X-Received: by 2002:a05:6808:30a1:b0:463:f9ad:a4cf with SMTP id
 5614622812f47-4651abb472dmr293614b6e.23.1772591277687; Tue, 03 Mar 2026
 18:27:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303115720.48783-1-dakr@kernel.org> <20260303115720.48783-2-dakr@kernel.org>
In-Reply-To: <20260303115720.48783-2-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 4 Mar 2026 10:27:49 +0800
X-Gm-Features: AaiRm50ScKkUps_9Yhs72XBQaSHbpuEPqc11o2wDZQVrApNZde3wmBwc1fLjihM
Message-ID: <CALbr=LaR0B4BhEQ6md0nBe=7KtPHJYPq6i_p9Gn+s8zcoFAW6A@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] driver core: generalize driver_override in struct device
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 7:57=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Currently, there are 12 busses (including platform and PCI) that
> duplicate the driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate
> lock, solving this in the driver-core generically results in less (and
> cleaner) changes overall.
>
> Thus, move driver_override to struct device, provide corresponding
> accessors for busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(),
> device_has_driver_override(), device_match_driver_override() and a
> helper, DEVICE_ATTR_DRIVER_OVERRIDE(), to declare the corresponding
> sysfs store() and show() callbacks.
>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D220789 [1]
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kern=
el.org/ [2]
> Co-developed-by: Gui-Dong Han <hanguidong02@gmail.com>
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Tested this on QEMU PCI with various debug options enabled.
Everything looks good so far, no issues found.

Will keep testing.

> ---
>  drivers/base/bus.c         | 43 ++++++++++++++++++++++++++-
>  drivers/base/core.c        |  2 ++
>  drivers/base/dd.c          | 60 ++++++++++++++++++++++++++++++++++++++
>  include/linux/device.h     | 54 ++++++++++++++++++++++++++++++++++
>  include/linux/device/bus.h |  4 +++
>  5 files changed, 162 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> index bb61d8adbab1..c734e7162b74 100644
> --- a/drivers/base/bus.c
> +++ b/drivers/base/bus.c
> @@ -504,6 +504,36 @@ int bus_for_each_drv(const struct bus_type *bus, str=
uct device_driver *start,
>  }
>  EXPORT_SYMBOL_GPL(bus_for_each_drv);
>
> +static ssize_t driver_override_store(struct device *dev,
> +                                    struct device_attribute *attr,
> +                                    const char *buf, size_t count)
> +{
> +       int ret;
> +
> +       ret =3D __device_set_driver_override(dev, buf, count);
> +       if (ret)
> +               return ret;
> +
> +       return count;
> +}
> +
> +static ssize_t driver_override_show(struct device *dev,
> +                                   struct device_attribute *attr, char *=
buf)
> +{
> +       guard(spinlock)(&dev->driver_override.lock);
> +       return sysfs_emit(buf, "%s\n", dev->driver_override.name);
> +}
> +static DEVICE_ATTR_RW(driver_override);
> +
> +static struct attribute *driver_override_dev_attrs[] =3D {
> +       &dev_attr_driver_override.attr,
> +       NULL,
> +};
> +
> +static const struct attribute_group driver_override_dev_group =3D {
> +       .attrs =3D driver_override_dev_attrs,
> +};
> +
>  /**
>   * bus_add_device - add device to bus
>   * @dev: device being added
> @@ -537,9 +567,15 @@ int bus_add_device(struct device *dev)
>         if (error)
>                 goto out_put;
>
> +       if (sp->bus->driver_override) {
> +               error =3D device_add_group(dev, &driver_override_dev_grou=
p);
> +               if (error)
> +                       goto out_groups;
> +       }
> +
>         error =3D sysfs_create_link(&sp->devices_kset->kobj, &dev->kobj, =
dev_name(dev));
>         if (error)
> -               goto out_groups;
> +               goto out_override;
>
>         error =3D sysfs_create_link(&dev->kobj, &sp->subsys.kobj, "subsys=
tem");
>         if (error)
> @@ -550,6 +586,9 @@ int bus_add_device(struct device *dev)
>
>  out_subsys:
>         sysfs_remove_link(&sp->devices_kset->kobj, dev_name(dev));
> +out_override:
> +       if (dev->bus->driver_override)
> +               device_remove_group(dev, &driver_override_dev_group);
>  out_groups:
>         device_remove_groups(dev, sp->bus->dev_groups);
>  out_put:
> @@ -607,6 +646,8 @@ void bus_remove_device(struct device *dev)
>
>         sysfs_remove_link(&dev->kobj, "subsystem");
>         sysfs_remove_link(&sp->devices_kset->kobj, dev_name(dev));
> +       if (dev->bus->driver_override)
> +               device_remove_group(dev, &driver_override_dev_group);
>         device_remove_groups(dev, dev->bus->dev_groups);
>         if (klist_node_attached(&dev->p->knode_bus))
>                 klist_del(&dev->p->knode_bus);
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 791f9e444df8..09b98f02f559 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -2556,6 +2556,7 @@ static void device_release(struct kobject *kobj)
>         devres_release_all(dev);
>
>         kfree(dev->dma_range_map);
> +       kfree(dev->driver_override.name);
>
>         if (dev->release)
>                 dev->release(dev);
> @@ -3159,6 +3160,7 @@ void device_initialize(struct device *dev)
>         kobject_init(&dev->kobj, &device_ktype);
>         INIT_LIST_HEAD(&dev->dma_pools);
>         mutex_init(&dev->mutex);
> +       spin_lock_init(&dev->driver_override.lock);
>         lockdep_set_novalidate_class(&dev->mutex);
>         spin_lock_init(&dev->devres_lock);
>         INIT_LIST_HEAD(&dev->devres_head);
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 0354f209529c..697e36e63cab 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -381,6 +381,66 @@ static void __exit deferred_probe_exit(void)
>  }
>  __exitcall(deferred_probe_exit);
>
> +int __device_set_driver_override(struct device *dev, const char *s, size=
_t len)
> +{
> +       const char *new, *old;
> +       char *cp;
> +
> +       if (!s)
> +               return -EINVAL;
> +
> +       /*
> +        * The stored value will be used in sysfs show callback (sysfs_em=
it()),
> +        * which has a length limit of PAGE_SIZE and adds a trailing newl=
ine.
> +        * Thus we can store one character less to avoid truncation durin=
g sysfs
> +        * show.
> +        */
> +       if (len >=3D (PAGE_SIZE - 1))
> +               return -EINVAL;
> +
> +       /*
> +        * Compute the real length of the string in case userspace sends =
us a
> +        * bunch of \0 characters like python likes to do.
> +        */
> +       len =3D strlen(s);
> +
> +       if (!len) {
> +               /* Empty string passed - clear override */
> +               spin_lock(&dev->driver_override.lock);
> +               old =3D dev->driver_override.name;
> +               dev->driver_override.name =3D NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +               kfree(old);
> +
> +               return 0;
> +       }
> +
> +       cp =3D strnchr(s, len, '\n');
> +       if (cp)
> +               len =3D cp - s;
> +
> +       new =3D kstrndup(s, len, GFP_KERNEL);
> +       if (!new)
> +               return -ENOMEM;
> +
> +       spin_lock(&dev->driver_override.lock);
> +       old =3D dev->driver_override.name;
> +       if (cp !=3D s) {
> +               dev->driver_override.name =3D new;
> +               spin_unlock(&dev->driver_override.lock);
> +       } else {
> +               /* "\n" passed - clear override */
> +               dev->driver_override.name =3D NULL;
> +               spin_unlock(&dev->driver_override.lock);
> +
> +               kfree(new);
> +       }
> +       kfree(old);
> +
> +       return 0;
> +}
> +EXPORT_SYMBOL_GPL(__device_set_driver_override);
> +
>  /**
>   * device_is_bound() - Check if device is bound to a driver
>   * @dev: device to check
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 0be95294b6e6..e65d564f01cd 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -483,6 +483,8 @@ struct device_physical_location {
>   *             on.  This shrinks the "Board Support Packages" (BSPs) and
>   *             minimizes board-specific #ifdefs in drivers.
>   * @driver_data: Private pointer for driver specific info.
> + * @driver_override: Driver name to force a match.  Do not touch directl=
y; use
> + *                  device_set_driver_override() instead.
>   * @links:     Links to suppliers and consumers of this device.
>   * @power:     For device power management.
>   *             See Documentation/driver-api/pm/devices.rst for details.
> @@ -576,6 +578,10 @@ struct device {
>                                            core doesn't touch it */
>         void            *driver_data;   /* Driver data, set and get with
>                                            dev_set_drvdata/dev_get_drvdat=
a */
> +       struct {
> +               const char      *name;
> +               spinlock_t      lock;
> +       } driver_override;
>         struct mutex            mutex;  /* mutex to synchronize calls to
>                                          * its driver.
>                                          */
> @@ -701,6 +707,54 @@ struct device_link {
>
>  #define kobj_to_dev(__kobj)    container_of_const(__kobj, struct device,=
 kobj)
>
> +int __device_set_driver_override(struct device *dev, const char *s, size=
_t len);
> +
> +/**
> + * device_set_driver_override() - Helper to set or clear driver override=
.
> + * @dev: Device to change
> + * @s: NUL-terminated string, new driver name to force a match, pass emp=
ty
> + *     string to clear it ("" or "\n", where the latter is only for sysf=
s
> + *     interface).
> + *
> + * Helper to set or clear driver override of a device.
> + *
> + * Returns: 0 on success or a negative error code on failure.
> + */
> +static inline int device_set_driver_override(struct device *dev, const c=
har *s)
> +{
> +       return __device_set_driver_override(dev, s, s ? strlen(s) : 0);
> +}
> +
> +/**
> + * device_has_driver_override() - Check if a driver override has been se=
t.
> + * @dev: device to check
> + *
> + * Returns true if a driver override has been set for this device.
> + */
> +static inline bool device_has_driver_override(struct device *dev)
> +{
> +       guard(spinlock)(&dev->driver_override.lock);
> +       return !!dev->driver_override.name;
> +}
> +
> +/**
> + * device_match_driver_override() - Match a driver against the device's =
driver_override.
> + * @dev: device to check
> + * @drv: driver to match against
> + *
> + * Returns > 0 if a driver override is set and matches the given driver,=
 0 if a
> + * driver override is set but does not match, or < 0 if a driver overrid=
e is not
> + * set at all.
> + */
> +static inline int device_match_driver_override(struct device *dev,
> +                                              const struct device_driver=
 *drv)
> +{
> +       guard(spinlock)(&dev->driver_override.lock);
> +       if (dev->driver_override.name)
> +               return !strcmp(dev->driver_override.name, drv->name);
> +       return -1;
> +}
> +
>  /**
>   * device_iommu_mapped - Returns true when the device DMA is translated
>   *                      by an IOMMU
> diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
> index 99c3c83ea520..cda597812324 100644
> --- a/include/linux/device/bus.h
> +++ b/include/linux/device/bus.h
> @@ -63,6 +63,9 @@ struct fwnode_handle;
>   *                     this bus.
>   * @pm:                Power management operations of this bus, callback=
 the specific
>   *             device driver's pm-ops.
> + * @driver_override:   Set to true if this bus supports the driver_overr=
ide
> + *                     mechanism, which allows userspace to force a spec=
ific
> + *                     driver to bind to a device via a sysfs attribute.
>   * @need_parent_lock:  When probing or removing a device on this bus, th=
e
>   *                     device core should lock the device's parent.
>   *
> @@ -104,6 +107,7 @@ struct bus_type {
>
>         const struct dev_pm_ops *pm;
>
> +       bool driver_override;
>         bool need_parent_lock;
>  };
>
> --
> 2.53.0
>
