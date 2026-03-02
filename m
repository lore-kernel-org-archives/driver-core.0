Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772D925A2A2
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 01:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772416532; cv=pass; b=CsJzXmUG2JpOgptnNd1/wLlWeAZwx6XzWu9YqXW9bxbiqkpQfi3RlRSRe4/u/EX+C6y5du12Tw6z38lM9E2YKr4+PBCgMUC180duVBGYnsJky6C3eG1MWX1Nn9FZfOsFFS0qLJb6rn3S3Tz+HMSIg8LtoxRyV81PYSIS9fFr0vo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772416532; c=relaxed/simple;
	bh=t+nsomZ0DBZKn7HFm5QgldV45SC09wDLiD4n1gkAkT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MTEGyh4rylh9ffjPE0UZmXlMGcqUyjiyZTfauPi03foza/tCx453IVHzJ6ZJ+6RJWNzELiEBked8YGBOUSw5HW3/Lm4UEHNkrxX3otxzW/8uRIDSY+ZqHtqJIFc49u6DhZ5JLgGMap51sj0M3NGAMjc5+lmBWMhlGFKOnq+ERqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyXfjbYX; arc=pass smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyXfjbYX"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-7d18d02af68so3368160a34.2
        for <driver-core@lists.linux.dev>; Sun, 01 Mar 2026 17:55:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772416530; cv=none;
        d=google.com; s=arc-20240605;
        b=NVuFSdpl/hHNpi6/8iGc6843D9Vj8Ab6s3SeHNpZC5MvSe5IhnRnAw6HUWU2bX8dRA
         qQbNJrruEH02FYBh8Io31wvtv/WiHNYodtpW69eqHGTkdInqpk54TrZ/cKdr7sSa08r2
         R555qRmLTEg5esltacuF8lIaziEAJpFCsQcfiwgnyeF9hLZOCZBpyhc9skXbm3m+uK5Y
         mF0rvDN2qqvskN9ESSYDGJ9yp5+V3qIhT/NugRnOYZHEfKveLh51r5QVwySQXOPLTYIg
         Htuw40Vb4DJLIlv0m//+KJgHwXq7nKDcBUk51l/EmV5HT18NSmUVr+QsO//qkEt9lazx
         /igQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bFqtsWec6969rzAVWjIvePIxvhFOKaCBurwwr/hfobo=;
        fh=2JjvtFbVxkKd9kqfA5H4qqCHtncP5DHvyO5NtaCgmvQ=;
        b=Hw5l5crvYjBS3MENRpOazTclPS0NYNQSdwDeJwFVwK+qsv1k7F1TuojMWdIZHLWEFk
         hxoR/YC00gQDxsTNE5rgEFPq59jjvW4KIL7vmT/JHN8bq01m5I3wkWCb9pHrVVChmgU1
         hpzRayjbBLmsJQ+mF6I53ODQatoxbYcVMT/qLp33+q842n2Q9ZG8DaDzdHHsbNBOath9
         5nT2Y0kek9LqE3HczvGQs0kMmep1hCDpvMZ3zIxOdiax0m+S3T9VeefcTuA5jZCv22/u
         GEGuo0yHeCZboStRgRtNn3KCfZLe+MyoV4iPRR0N96+jAbrRdYLHSndaYdsWFrCK5fOw
         7isg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772416530; x=1773021330; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bFqtsWec6969rzAVWjIvePIxvhFOKaCBurwwr/hfobo=;
        b=FyXfjbYXe/rP8sD/MPUmmPcUpPVaXzXUvPGneSH3RhPgmos0ZN5S99L9is169vHYje
         EB/ItDOZw/n4P3LerzyS4iA05JA22/CR/upuCP2ANK9q2CS1pIRoaz4Fy5Ur6zPE84Zj
         1sytpS4zh+KKQ1rs70TjJl5oRrKc6Clb3uKe8fEPSuadFKi5ybPQR3x1iNC4W+7xPesX
         8dkWO7qUKfVUrhLZMT7foU2KxA56aw1RoQZ1OAvkyy+ArXX8Hr7YicSD9HmJXIHKpuEv
         W75cuMR5YqZw/WKNnjmNrpc3A9fGrgbM+Kdk0CV0FRAi2IPXwuZ/ZmvrG8jESPRIKVa2
         SW0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772416530; x=1773021330;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bFqtsWec6969rzAVWjIvePIxvhFOKaCBurwwr/hfobo=;
        b=xDbLLf/zWv2kGoiLR10KfO6OIKLdQefX9lx14QK9rp5tWjX/0pveG5VUGkJ2ORUH67
         BDMg9JCRVcNOskHttJVn/kREoaGg5tSDo4502ln3+VLwND3C8PxhzW3pNSFV60vqtMMs
         J0jOeqSFhn/J3dQy4iSml1quUcPlCcRi88EWJd8EKBfnYoMl3rOGXvSqTbAmHEffKPpE
         QBojPoy27WeYM9D+i9ORNDGdJgeQpt7aJ4H3hHLdUh1NANMxxavjoycuK2zYo2sHZZr5
         h3A172tLAnb6LVdbg2wkN817JDO4oFJtMVZYp6FSn83XOc/G0bQfjlQQ7Vi2xruMkSmN
         s3Xw==
X-Forwarded-Encrypted: i=1; AJvYcCW7UL90Mwj/0WcE9QUz7c6ggJ9YawCHplj/cZRakWeJSRSi1r6ffAjPZEKwC2RHUu3DlB4rTVGplOEFYw==@lists.linux.dev
X-Gm-Message-State: AOJu0YweQUtVsDiFZL+U3eE3NzR3u73j8Xq8KZw20pcltEYzU4AemWJX
	rmfvwjzDkHxynEkGfQ06wHKgTR//u2vIfi7xEMKxVaiomhfu6TDgkwXnCGd0iPLP0Lgk6o1RAs2
	pN3j3IS+pOizpha9tZHaWF3KoF+XXs04=
X-Gm-Gg: ATEYQzwOD+TgWdoKudj/Xij7QgG7n+lU78Nc5sE/sOm+o+7j36Vv7fDsMRKJmeGEb10
	Ozkn6xHkLGmjdPH4p4JVmktg3G3flmmtn11I9HKegDUQva2ax1wCBPpB7qLpGLjRXZ2CmoRl7Mq
	ErtQMO0q9LEY+TWPQdCt78I3S34djyTy+qO1jO4q/M+GaeutTaKu5Jf5T0HAk0QOSEopHxBPlMY
	OLEgXTmgR7baaiq1ELoywUgAP+NkZ4dZEFi2OPdDJofVLwyvVX6RKfHzP2L0lt0cXGficPCDp5g
	CKkTGvaWmJAuUQ8PdqdC9qcMcYDLYxPazEiBHZaEBWTAoi+uc4TRLQzT2nr7l4x9appHxzh56E8
	=
X-Received: by 2002:a05:6870:f2a9:b0:40e:dadc:49f5 with SMTP id
 586e51a60fabf-416270a4501mr6642634fac.51.1772416530174; Sun, 01 Mar 2026
 17:55:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260302002545.19389-1-dakr@kernel.org>
In-Reply-To: <20260302002545.19389-1-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Mon, 2 Mar 2026 09:55:19 +0800
X-Gm-Features: AaiRm51BX0l9zG1GrqOcQnqwRbeUT5CP2N7qKUQFI7H5d6W3hjZwFIILiu7yhRE
Message-ID: <CALbr=LaS5vcjpipij8Vn+GFOxBW-3sngk-GMd-3pGJt7oP+T_Q@mail.gmail.com>
Subject: Re: [PATCH] Revert "driver core: enforce device_lock for driver_match_device()"
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 2, 2026 at 8:25=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> This reverts commit dc23806a7c47 ("driver core: enforce device_lock for
> driver_match_device()") and commit 289b14592cef ("driver core: fix
> inverted "locked" suffix of driver_match_device()").
>
> While technically correct, there is a major downside to this approach:
>
> When a device is already present in the system and a driver is
> registered on the same bus, we iterate over all devices registered on
> this bus to see if one of them matches. If we come across an already
> bound one where the corresponding driver crashed while holding the
> device lock (e.g. in probe()) we can't make any progress anymore.
>
> However, drivers are typically the least tested code in the kernel and
> hence it is a case that is likely to happen regularly. Besides hurting
> developer ergonomics, it potentially decreases chances of shutting
> things down cleanly and obtaining logs in production environments as
> well. [1]
>
> This came up in the context of a firewire bug, which only in combination
> with the reverted commit, caused the machine to hang. [2]
>
> Thus, revert commit dc23806a7c47 ("driver core: enforce device_lock for
> driver_match_device()") and add a brief note clarifying that an
> implementer of struct bus_type must not expect match() to be called with
> the device lock held.
>
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kern=
el.org/ [1]
> Link: https://lore.kernel.org/all/67f655bb-4d81-4609-b008-68d200255dd2@da=
vidgow.net/ [2]
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/driver-core/CAHk-=3DwgJ_L1C=3DHjcYJotg_zr=
ZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

This aligns with our previous analysis:
https://lore.kernel.org/lkml/CALbr=3DLZ4v7N=3DtO1vgOsyj9AS+XuNbn6kG-QcF+Pac=
dMjSo0iyw@mail.gmail.com/

Enforcing the device_lock here amplifies the impact of an oops during
probe, so moving to a separate lock for driver_override is definitely
a better approach.

The revert looks good to me.

As a minor note, it might be worth adding a tag for the initial Tegra
issue where this lock stall was first observed. No big deal if you
decide to leave it as is, though.

Reviewed-by: Gui-Dong Han <hanguidong02@gmail.com>

> ---
>  drivers/base/base.h        | 11 +----------
>  drivers/base/dd.c          |  2 +-
>  include/linux/device/bus.h |  2 ++
>  3 files changed, 4 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 79d031d2d845..1af95ac68b77 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -179,19 +179,10 @@ void device_release_driver_internal(struct device *=
dev, const struct device_driv
>  void driver_detach(const struct device_driver *drv);
>  void driver_deferred_probe_del(struct device *dev);
>  void device_set_deferred_probe_reason(const struct device *dev, struct v=
a_format *vaf);
> -static inline int driver_match_device_locked(const struct device_driver =
*drv,
> -                                            struct device *dev)
> -{
> -       device_lock_assert(dev);
> -
> -       return drv->bus->match ? drv->bus->match(dev, drv) : 1;
> -}
> -
>  static inline int driver_match_device(const struct device_driver *drv,
>                                       struct device *dev)
>  {
> -       guard(device)(dev);
> -       return driver_match_device_locked(drv, dev);
> +       return drv->bus->match ? drv->bus->match(dev, drv) : 1;
>  }
>
>  static inline void dev_sync_state(struct device *dev)
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 0354f209529c..bea8da5f8a3a 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -928,7 +928,7 @@ static int __device_attach_driver(struct device_drive=
r *drv, void *_data)
>         bool async_allowed;
>         int ret;
>
> -       ret =3D driver_match_device_locked(drv, dev);
> +       ret =3D driver_match_device(drv, dev);
>         if (ret =3D=3D 0) {
>                 /* no match */
>                 return 0;
> diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
> index 99c3c83ea520..63de5f053c33 100644
> --- a/include/linux/device/bus.h
> +++ b/include/linux/device/bus.h
> @@ -35,6 +35,8 @@ struct fwnode_handle;
>   *             otherwise. It may also return error code if determining t=
hat
>   *             the driver supports the device is not possible. In case o=
f
>   *             -EPROBE_DEFER it will queue the device for deferred probi=
ng.
> + *             Note: This callback may be invoked with or without the de=
vice
> + *             lock held.
>   * @uevent:    Called when a device is added, removed, or a few other th=
ings
>   *             that generate uevents to add the environment variables.
>   * @probe:     Called when a new device or driver add to this bus, and c=
allback
>
> base-commit: 78437ab3b769f80526416570f60173c89858dd84
> --
> 2.53.0
>
