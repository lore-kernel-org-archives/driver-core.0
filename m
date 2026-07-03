Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091983D47AE
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 12:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783083551; cv=pass; b=Ok5gZ+eFSp0HLLvmUDrZhTRTx0Wp9dNZBgjkjiKnZtpzHsfhUXRuywHHo/xZ2LFOT00iCzSyfMy7HL+le1/inV1Dadl7fczAy8Lo3PbPQOcgDkyExWnLEdh5woNFtSCh2irWoiejlyz/Lqw4hzsd/Y7qh89aoI5zekbBAN5mc1g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783083551; c=relaxed/simple;
	bh=5nft3AHBmBM/Bxl3hydeIyKsjDil7snVnqIN4LBKVNQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YTo9bwWKfGgtv3FIMty7Z0fvk4DIGaVmgPm7bcPiLYMJyY/eYxHwmNO2RU+d8yRmRe2HKYorKiIA6YSPw8Fie2lQqHTOsl5tZfve9ymMasz1Hronl8atsOER+ngXj5Ui1yo2GSrxP1BXEAPiJ8BScDUDAONxqHYxoOC/ZuzixmM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ck6JVJ8Z; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ck6JVJ8Z"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664cdeab266so736669d50.3
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 05:59:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783083549; cv=none;
        d=google.com; s=arc-20260327;
        b=SG9w+hGvBra36EKBMp3f6AizY5O0ahogY4Z7nFWuCbw/Jt5Am3c9sxL5p4yj/3d/YQ
         jUC+s6qpEuBU55rxwu0Tf05lib56n0oEje9P3UllBiiB027TbUBPx9DMht9z67+shH/6
         Eel9PBQ1X5j+1yn5KEo5D0Ib4bHAyfR6qmmbgSmgWzXxJ5Y0ip+CAouFmnNrBYUnzmAg
         8KeF0dmw+7NS1x23qA5msRgLXWHVJVP1LHcbiF0yslSvbAclwTkyn+DXAH5Op2I+IbfW
         uZzfamjAejydfLl+tuC/SfSgXveVNoQfvw0sTPyrBAn3gyiMUwi8baWQvzihsCt70tTC
         W2rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZpEgYLnkdRe+6URxXdbXlH7fdAucEfU8965vZ1JNkpE=;
        fh=zI2slxpNDdZzp5D8ke/zvc4caVzn+3b4ltD70viLcxU=;
        b=pxYhoSY3nn5wsqnR7Sm9X+YfT7MEL6Gvbavf0EAcv/x69cABAgUdprEQHSVqQvU2mx
         PJn5FbsX0BI9gtZc9dSQiDFFgzZsRTWW/Uy8xEqXgqU4ir6fFKlPQOcX+0Mwwt3GM23o
         roA3rj/2LmCC2jE7BoFxRoUvjRpgnx7qOyqvmK70zN9EPD2E8imOybAFi0k+I00M+cV1
         Kj7KE4dma+M3ypwis+JykMFva2yhp2ap9w5Cul8Am43BPCMYyhsXYVUs/7qBkJopHiXL
         +vuZS5/z4Fm/3/yhQF+iPf5oiRgQVGXq2yoBXqDMXgSJIsBevu2O18RdFnzRCmfbMtxL
         qBlA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783083549; x=1783688349; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZpEgYLnkdRe+6URxXdbXlH7fdAucEfU8965vZ1JNkpE=;
        b=ck6JVJ8ZAnaWU1jJmV7+uCB01c1TMvvxA/c+J6ps0IX59+XMCi810+tNHJNQT6dSFd
         WxufR9WOIJpZ2J4wRLWgNYhuFDOdQew4eolsXIkHK738aYQa0i+7TDl/xTIDntNtiHns
         MXvLP9yz9yanqiTWh/9NcAfPSuenDjnaTm+dE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783083549; x=1783688349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZpEgYLnkdRe+6URxXdbXlH7fdAucEfU8965vZ1JNkpE=;
        b=ZIFebhUkB9DrhcTdGtTA94tyxABwJ2f9RqfE1UzBIMKCMpTGqfZvxfaLwtRxNkCtKe
         5n8U4l6f6Te2g0XzjhQBy5syO4pjfLxp+lX4ovU0OqHbHF9QERCcBPrMy/Dci+3q1vT5
         UFDUzVbZNO4Lp6cYYN7zW/bMhJKaFyhu0eyaL/hmbXs66Coa7sNIz0nbsiU3T8WiyNi8
         P2p1HF/oLmmvUFH10GqhNyoe1UcTZbvZ6wTbySkySLQ5AO050x2y6zX/haB97z8hdFwD
         nk+aLa7VADaRsD8IySWRKTOaD7GPMVh+BiOHdwvOeQP/eLlo1lwAIsnDtwocEJfybaqO
         tE5w==
X-Forwarded-Encrypted: i=1; AHgh+RppYFSQW8cZLoNxYiYtL+7cAhE7pkD8TLNL5MpU+Sa9q8uq/Bi4cEugUuwXnLAEE+hw6uNA+fcssHCK2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyw8E7DB071udLwg/gjdZ8W9EeHUeXLUlCKfmk/Z8A3Anc24YiV
	NuE3cqk9hO1QmpJ1O2YZqEpRBwJvx29iQck1p1WosFrhdZaE/Ft+QXC8x0cKibrQYqcB6m+GJRz
	OfS80RpS+oY9y/qWGOvQcgQxdYsuOuM1o3oYTmndl
X-Gm-Gg: AfdE7ckKF1dBBjhF/ABHAkRC2/3GJCpevifaxstBh6iS9hRrcvNEx8u13Mn1otcoPF/
	gf5fcq21tn/BgQ6VLb0AQLPTN5lPC1IAni0deIumyYogKS0s+aWywTk5wTChAjdpjAOXPro4zBq
	0i1Z7vY7O6QAPHLeFUXG66rEXbc1uYDooiSB/kTpGCePqfMhJu30DOoKgcFuFi+TzlgvILHVOkL
	vOACtkhBXZ1qzfjHkuJJBGIrqMLyumno+h1jIAfAcBJzb8OOzs+RZ53zvXozUYOG+k90G2TLAbO
	D2zGTSNzt9a+ibpb50QEq311FdE=
X-Received: by 2002:a05:690e:1908:b0:664:ef34:33 with SMTP id
 956f58d0204a3-66521d1c65emr9453570d50.74.1783083548882; Fri, 03 Jul 2026
 05:59:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-9-wenst@chromium.org>
 <CAMRc=MdMhr6qAnAtUePbuBbsH=3MzRC+BrL5GssbNTwGjp_ayA@mail.gmail.com>
In-Reply-To: <CAMRc=MdMhr6qAnAtUePbuBbsH=3MzRC+BrL5GssbNTwGjp_ayA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 20:58:56 +0800
X-Gm-Features: AVVi8CeKAFgvldQwkCHupVnLS-0_fUDpMC-9BOMhYWR8u-1abjmchaeDfiY7p3M
Message-ID: <CAGXv+5GHFnMj3qr5BcpLCQk25rWYOgnMKUX079ScELs4uqEdVg@mail.gmail.com>
Subject: Re: [PATCH v3 08/13] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 8:41=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.org=
> wrote:
>
> On Fri, 3 Jul 2026 13:03:09 +0200, Chen-Yu Tsai <wenst@chromium.org> said=
:
> > The new M.2 E-key connector can have a USB connection. For the USB devi=
ce
> > on this connector to work, its power must be enabled and the W_DISABLE2=
#
> > signal deasserted. The connector driver handles this and provides a
> > toggle over the power sequencing API.
> >
> > This feature currently only supports a directly connected (no mux in
> > between) M.2 E-key connector. Existing USB connector types are not
> > covered. The USB A connector was recently added to the onboard devices
> > driver. USB B connectors have historically been managed by the USB
> > gadget or dual-role device controller drivers. USB C connectors are
> > handled by TCPM drivers.
> >
> > The power sequencing API does not know whether a power sequence provide=
r
> > is not needed or not available yet, so we only request it for connector=
s
> > that we know need it, which at this time is just the E-key connector.
> >
> > On the USB side, the port firmware node (if present) is tied to the
> > usb_port device. This device is used to acquire the power sequencing
> > descriptor. This allows the provider to tell the different ports on one
> > hub apart.
> >
> > This feature is not implemented in the onboard USB devices driver. The
> > power sequencing API expects the consumer device to make the request,
> > but there is no device node to instantiate a platform device to tie
> > the driver to. The connector is not a child node of the USB host or
> > hub, and the graph connection is from a USB port to the connector.
> > And the connector itself already has a driver.
> >
> > Power sequencing is not directly enabled in the connector driver as
> > that would completely decouple the timing of it from the USB subsystem.
> > It would not be possible for the USB subsystem to toggle the power
> > for a power cycle or to disable the port.
> >
> > Also rewrite the existing set_bit() and clear_bit() branches with
> > assign_bit() to make it cleaner.
> >
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v2:
> > - Expanded subject to mention power sequencing API
> > - Dropped commit message bit about power sequencing Kconfig symbol chan=
ge
> >   to bool
> > - Added optional dependency on POWER_SEQUENCING to USB
> > - Split out pwrseq_power_*() calls into separate helpers
> > - Rewrote set_bit() and clear_bit() branches with assign_bit()
> > - Dropped the pwrseq_power_off() before pwrseq_put(): pwrseq_put() does=
 it
> >   automatically.
> > - Removed pwrseq_power_on() from usb_hub_create_port_device(); it will
> >   get called through usb_hub_set_port_power() in hub_activate().
> > - Added checks for port->pwrseq in hub_is_port_power_switchable()
> >
> > - Use separate pwrseq descriptors for HighSpeed and SuperSpeed ports.
> >   This makes things simpler. On the other hand to power cycle a port
> >   userspace needs to toggle it on both the HS and SS ports together.
> > - Dropped pwrseq state tracking again
> >   The power sequencing consumer API already tracks the state internally=
;
> >   doing it again in |struct usb_port| is not necessary especially now
> >   that the descriptors aren't shared.
> >
> > It's unclear to me how actual hubs reconcile USB_PORT_FEAT_POWER settin=
gs
> > from the HS side and SS side. One hub chip vendor said that VBUS_EN for
> > a port is on if the flag is set on either side; however actually testin=
g
> > on one of their hubs showed that VBUS was cut as soon as the flag is
> > cleared on the HS port. Maybe it could be different if a SS device was
> > connected? That scenario was not tested. Testing on another retail
> > bought hub seemed to work exactly as described though: USB_PORT_FEAT_PO=
WER
> > needed to be clear on both HS and SS ports to turn off VBUS.
> >
> > Under this scheme, I'm not sure how the power cycle in hub_port_connect=
()
> > would work correctly.
> >
> > - Link to v2:
> >   https://lore.kernel.org/all/20260610084053.2059858-1-wenst@chromium.o=
rg/
> >
> > Changes since v1:
> > - Switch to fwnode instead of OF
> > - Tie port@ fwnode to usb_port device
> > - Move remote node compatible checking to separate helper
> > - Use usb_port device to request power sequencing descriptor
> > - Drop "index" parameter from pwrseq_get()
> > - Do not get pwrseq descriptor for SuperSpeed port; share one for one
> >   physical port
> > - Add pwrseq state tracking
> > - Link to v1:
> >   https://lore.kernel.org/all/20260515090149.3169406-1-wenst@chromium.o=
rg/
> > ---
> >  drivers/usb/Kconfig     |  1 +
> >  drivers/usb/core/hub.c  | 44 +++++++++++++++++++++++++++++-----
> >  drivers/usb/core/hub.h  | 10 +++++++-
> >  drivers/usb/core/port.c | 52 ++++++++++++++++++++++++++++++++++++++++-
> >  4 files changed, 99 insertions(+), 8 deletions(-)
> >
> > diff --git a/drivers/usb/Kconfig b/drivers/usb/Kconfig
> > index abf8c6cdea9e..ef1959363fb1 100644
> > --- a/drivers/usb/Kconfig
> > +++ b/drivers/usb/Kconfig
> > @@ -44,6 +44,7 @@ config USB_ARCH_HAS_HCD
> >  config USB
> >       tristate "Support for Host-side USB"
> >       depends on USB_ARCH_HAS_HCD
> > +     depends on POWER_SEQUENCING if POWER_SEQUENCING
> >       select GENERIC_ALLOCATOR
> >       select USB_COMMON
> >       select NLS  # for UTF-8 strings
> > diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
> > index 8ae97e8c26aa..dfa0f5dd75e8 100644
> > --- a/drivers/usb/core/hub.c
> > +++ b/drivers/usb/core/hub.c
> > @@ -32,6 +32,7 @@
> >  #include <linux/mutex.h>
> >  #include <linux/random.h>
> >  #include <linux/pm_qos.h>
> > +#include <linux/pwrseq/consumer.h>
> >  #include <linux/kobject.h>
> >
> >  #include <linux/bitfield.h>
> > @@ -871,6 +872,30 @@ static void hub_tt_work(struct work_struct *work)
> >       spin_unlock_irqrestore(&hub->tt.lock, flags);
> >  }
> >
> > +static int usb_hub_set_port_pwrseq(struct usb_port *port, bool set)
> > +{
> > +     int ret =3D 0;
> > +
> > +     if (set)
> > +             ret =3D pwrseq_power_on(port->pwrseq);
> > +     else
> > +             ret =3D pwrseq_power_off(port->pwrseq);
> > +
> > +     return ret;
> > +}
> > +
> > +static int usb_hub_restore_port_pwrseq(struct usb_port *port, bool set=
)
> > +{
> > +     int ret =3D 0;
> > +
> > +     if (set)
> > +             ret =3D pwrseq_power_off(port->pwrseq);
> > +     else
> > +             ret =3D pwrseq_power_on(port->pwrseq);
> > +
> > +     return ret;
> > +}
> > +
> >  /**
> >   * usb_hub_set_port_power - control hub port's power state
> >   * @hdev: USB device belonging to the usb hub
> > @@ -886,20 +911,24 @@ static void hub_tt_work(struct work_struct *work)
> >  int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hu=
b,
> >                          int port1, bool set)
> >  {
> > +     struct usb_port *pwrseq_port =3D hub->ports[port1 - 1];
> >       int ret;
> >
> > +     ret =3D usb_hub_set_port_pwrseq(pwrseq_port, set);
> > +     if (ret)
> > +             return ret;
> > +

As Sashiko pointed out, the stub function returns -ENOSYS. I need to add
something to handle that case properly in the helper functions above.

    if (!IS_ENABLED(POWER_SEQUENCING))
        return 0;

seems to be more straightforward.

> >       if (set)
> >               ret =3D set_port_feature(hdev, port1, USB_PORT_FEAT_POWER=
);
> >       else
> >               ret =3D usb_clear_port_feature(hdev, port1, USB_PORT_FEAT=
_POWER);
> >
> > -     if (ret)
> > +     if (ret) {
> > +             usb_hub_restore_port_pwrseq(pwrseq_port, set);
> >               return ret;
> > +     }
> >
> > -     if (set)
> > -             set_bit(port1, hub->power_bits);
> > -     else
> > -             clear_bit(port1, hub->power_bits);
> > +     assign_bit(port1, hub->power_bits, set);
> >       return 0;
> >  }
> >
> > @@ -3249,7 +3278,10 @@ int usb_port_is_power_on(struct usb_port *port, =
unsigned int portstatus)
> >                       ret =3D 1;
> >       }
> >
> > -     return ret;
> > +     if (!port->pwrseq)
> > +             return ret;
> > +
> > +     return ret && pwrseq_power_is_on(port->pwrseq);
>
> So this is only needed to not have to track the state in a separate field=
?

Correct. Reading the field is not the problem. Updating it is, as the
fields are packed bitfields, and Sashiko suggested that locking would
be needed, though it may have been for the peer port, which has since
been removed.

[...]

> Looks good to me.
>
> Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

Thanks
ChenYu
