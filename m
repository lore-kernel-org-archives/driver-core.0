Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B8FF223DFB
	for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776777361; cv=none; b=LTgyQosz0aarjTLAq7S9OJdihfJ5dEteP90tMlzcT9AKG9Nb0IkbXgtitVyE3dDAImxbu/AfC3DPyG8KcG98tbFi7XHesEW3kJ4w01Gxuz9Sl4Lf6aal7fL0CSFsBYZtJyJJorv+ScqHeXczhUN/uny2rLVqPraiYxp4CR017Qc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776777361; c=relaxed/simple;
	bh=RQ2yoPpjP8YT72MxrSXikSZPmXtmBoSAA16pYuFWu30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VO3VYeLzlvdI2NPmjWe6w8f6Wjr3/gbgKq2YyrCJzg4ousAOYDbBNy/HFADd4xT3lrhbcS8uetsU+67h/7ftAjNcR08TPnDN6BE7ceHecZCKgqEs83z6BGF8CgvgMUqa+t+KGZU2Cu6r1jS5lvR6yI2ZvpGB92mpXWNu1i9C8Tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuWlQ9Tv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuWlQ9Tv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8445C2BCB0
	for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 13:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776777360;
	bh=RQ2yoPpjP8YT72MxrSXikSZPmXtmBoSAA16pYuFWu30=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QuWlQ9Tvb4K03tXCP9IzaPYDCu1R3brVo/jYsZ4wW+8oWK46c82iBriFbKSS9/HiD
	 7G8QW9xqaj9zhmb7Lr4Jik4sJonfVMvjnES6l+QCmCx6fM5PC5n/bmki/XRTNIRr//
	 R5J/IdsSBr10LEzCx/a8Qw5zbbNldE1T9BKx3Ra0pxCmoqc4+xSLp+ud1wBbc05URq
	 WUqBIDObZkQmhHG4fb5cxqtEsWvDxWW85vuFrVmzv8n2TMbQB3QV6t2EXzs+BOEGjp
	 SYbEIHYIsY2INyvgIgKUfK8n/iN8nLg5lTHMGbL/tndK/BZ3XEEmDOpf/diMNxZiUz
	 of3tOi2ZxaBSg==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5a283c44478so7354244e87.3
        for <driver-core@lists.linux.dev>; Tue, 21 Apr 2026 06:16:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/1bnUFkdH7daO6Ylq05Mu3eKtM2ZnUZJ9GdNuyjqOjlY0z8DmiMfrOTqqdJtNwBXBBQeCVZc1w+vQMAA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzUHWWd6ucdm1B8maOLpf3g0hk12rRTOA5ekRxRFzx4S+F0MdK3
	98l7wmB946Qk6H0FRAHTnVK+a6+yeT3V3Q9cYiLbfKpqAnC2h8RdPmQv4D8fqDxBEWEJvYnnJ0l
	oBPWH6DIuSZk24yfwZaT+ukq04hQ+bC8=
X-Received: by 2002:a05:6512:3ca0:b0:5a2:b979:4b06 with SMTP id
 2adb3069b0e04-5a4172b7ae4mr5904511e87.4.1776777359287; Tue, 21 Apr 2026
 06:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260420234153.2898532-1-dakr@kernel.org>
In-Reply-To: <20260420234153.2898532-1-dakr@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 21 Apr 2026 15:15:46 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0hPkacyxnTMGnbb9WSwHED+16zvfWznx7aCDmkHsnD-xA@mail.gmail.com>
X-Gm-Features: AQROBzBvaPq58gaXCme4oONTdrBzIRl8R2Mz3eA8xL52mpaPmd-4ErGCM4cp82g
Message-ID: <CAJZ5v0hPkacyxnTMGnbb9WSwHED+16zvfWznx7aCDmkHsnD-xA@mail.gmail.com>
Subject: Re: [PATCH] driver core: move dev_has_sync_state() to drivers/base/base.h
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 1:41=E2=80=AFAM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> All callers of dev_has_sync_state() are in drivers/base/ and any attempt
> to use it outside of driver-core should require good justification, so
> there is no need to have it defined in include/linux/device.h.
>
> Thus, move it to drivers/base/base.h.
>
> Suggested-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
> Link: https://lore.kernel.org/driver-core/CAJZ5v0jkm9K9=3D-U_51FMsyxN2msd=
ouRnz4sEjmxG0Btd6Hmw0w@mail.gmail.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
> Goes on top of [1].
>
> [1] https://lore.kernel.org/driver-core/20260418162221.1121873-1-dakr@ker=
nel.org/
> ---
>  drivers/base/base.h    | 14 ++++++++++++++
>  include/linux/device.h | 14 --------------
>  2 files changed, 14 insertions(+), 14 deletions(-)
>
> diff --git a/drivers/base/base.h b/drivers/base/base.h
> index 1af95ac68b77..f3c615c9198b 100644
> --- a/drivers/base/base.h
> +++ b/drivers/base/base.h
> @@ -185,6 +185,20 @@ static inline int driver_match_device(const struct d=
evice_driver *drv,
>         return drv->bus->match ? drv->bus->match(dev, drv) : 1;
>  }
>
> +static inline bool dev_has_sync_state(struct device *dev)
> +{
> +       struct device_driver *drv;
> +
> +       if (!dev)
> +               return false;
> +       drv =3D READ_ONCE(dev->driver);
> +       if (drv && drv->sync_state)
> +               return true;
> +       if (dev->bus && dev->bus->sync_state)
> +               return true;
> +       return false;
> +}
> +
>  static inline void dev_sync_state(struct device *dev)
>  {
>         if (dev->bus->sync_state)
> diff --git a/include/linux/device.h b/include/linux/device.h
> index 4c1c9cb8570a..82823f807f56 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -1016,20 +1016,6 @@ static inline void device_lock_assert(struct devic=
e *dev)
>         lockdep_assert_held(&dev->mutex);
>  }
>
> -static inline bool dev_has_sync_state(struct device *dev)
> -{
> -       struct device_driver *drv;
> -
> -       if (!dev)
> -               return false;
> -       drv =3D READ_ONCE(dev->driver);
> -       if (drv && drv->sync_state)
> -               return true;
> -       if (dev->bus && dev->bus->sync_state)
> -               return true;
> -       return false;
> -}
> -
>  static inline int dev_set_drv_sync_state(struct device *dev,
>                                          void (*fn)(struct device *dev))
>  {
> --
> 2.53.0
>
