Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F36DB3451B2
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 10:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784196172; cv=pass; b=AWbksmtDuZ5a0gbe/p3xgFhKWuMyZ0nBCZznMUA61LxZDjBn9Cua0hq1NyUyPaGJsN4rT2EXIjQsvuW58R1PwemjrawbEFwEjTZIUa1cnOzzk0oHwShTqvmsULyD2tJbTGbza7Qu9bKh0qCu0qdWR95EE2uxOVyED4O+cHf2MiU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784196172; c=relaxed/simple;
	bh=wwzrrNyzpEPOxzsqP0CMmVuHMipqp7uhFBCNZZJQtZg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p/7ED9P/lMgQgyKQ+uQLqI1aG/RGmaqsCthlrl1UsJNImrgOL8mMWa7LfPywL2pbTzhiQVCMPpH/+awU4N2+4qR/IyikA43b/ZXQusQvbx16Kg+DtNy0o0gfjU9iAdKidq0e4ZuECGuMUOd0/9zNdHWq+wzKM6WzwToWhH074gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ab87JKxR; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ab87JKxR"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-6682e2729d7so236347d50.0
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 03:02:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784196170; cv=none;
        d=google.com; s=arc-20260327;
        b=O9qXh/lbPmteIEvqvZrOOm8vIyiZbj8pwj50Lbs6RxGIrchXhrczWJQBGDDcY/tGXE
         JkSLjA6Hzc5YdwIVUut9brzPF9o6eou/y05VJ6oUusOrOYr1b3a5GPVsh5ibTM2eqeg0
         eYzcRZzn67bFfwIrYb67Kf+TdOtFRiI7G6wvytNkM40VHEy37Ky2mrvdk44WaHXLQ5gK
         Ve6IF35aUupr7AfgZosB16cj2psOIQ6n0DI7RN37L+1MNG6vEGxtIrYRCpYkqs5lX3h6
         SEAaFIY4D0LX+hKy6k8rct5xeAlLjswLQWSU+HcdopUELYe4QM5TYwtpciW5xDQdj8C3
         3Lnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        fh=59kJHiMg8/x2aUpAzoTzfPlMsxxFWIyLIH/EHv1hr58=;
        b=ppdE0oIU6S7CYZzKJSk7yTCH2LGIirZN5jI1nNrW8l7E212WeQbkkTFxOYzeND0el3
         eMoyyxI6laMq06Wc5C4S7Eec0iCSHVgsh7ZbL9CGp7FZ3CgSPClp+xfVKVVQvXzZzmU6
         JJI0kcGau5f9uzGnIbeiIESFf48VQwFyPjHega5jCIUlHk5ja2e+Fqor0IhL0pgsVX4d
         XCKejQsKd7KMaddvnz5nD3OGyGdF/jbbrb0p7t1qQ3xhDwY+4GkURatueIi5awuK3ZDI
         EXYNsxpd399tlyIR83dWZ3g8tzZWHLDVvRijAbCKlLts6VtZDy15xxKw6DpWywipPSXi
         TpaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784196170; x=1784800970; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        b=Ab87JKxRns2oXHCgJj1ful295ecNsDErxeQWC2+d8hMH/QuEbcPuf6w2T5RIX3FVtH
         y0lFy2wv9lkKKE24unE5jDMzYH42fZselqIIaeAPuhd/5VchwYtig/UuQNgAOBQ5IgqA
         1Cyzjf1//muXDC9CB591kuoH18eDGpaf1Qlf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784196170; x=1784800970;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R96tNKpQ1InkbXm6qFatnXomzIHe/efCkhtTBmjY1zk=;
        b=ihlcYV5AEyEx5W2rzQsKHG/awUqitrHKQohtoP/WcxvA8SEqdV9b/6uT25ZziFbdcY
         hgU16kZgoUbb9HjBW2LvEHt5T3f+sFI8GP9Q0aVC6OgAnEwUm6xkGSR5HLFWuf+cRLT0
         JYYcIMZx0lm8C7IpGN/u72UqebxuDXZL+EIvFWLMTJK6P2aEBbzwxoI+1Xv6GTrDZ6es
         0ERNIszqjcmamEfSiQ/2vn2w3nadulhGASHISB1EaNwknle44gDBOMkw/M1chXCmXPGA
         rxh033ySjaPtxRQaWfClnNQWbctQV5O74p27ogvjEJbDz/SPsT7UWyItW8MEfzQ1nhrS
         AVKA==
X-Forwarded-Encrypted: i=1; AHgh+RoSFG+2Z3wd6sB4g5R62rKAi/SZyKCvgpN6DI3OtoT3y3LKFrLJaNPosxtmOJ3weheGHbVk3ACvkF5QyA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXvMk0dVFgEkdMcF+hzuILWab96BPuE0mE3l4UhAi/Qr33PI9Z
	IlF6LCEHu/3j0qYuuE65ZDZS3I+SN7iDGBup/7H8utfcEhP7xQpbQxjGLEMuv8ReavZCNfIYOCp
	F1FHL3nJfrev4+9TRh9nZ3IR7j8ql9oN8L2kTscz8
X-Gm-Gg: AfdE7clvc23IjDgxdC7lb9GZ7rC86SCht8M7IAA/MFeQB+xCl12sIaq/W+tFcZ9eHe/
	A4NB8MNov+4aciiQxD6vpwuDyB0kAD8n3s6swYcJd5jsAejtH8V+wawweWN58viZg7Bt7GN3xYH
	0z3mI81yLyBOHc+E7we5gM97GZn200Lm7n0/IdDGvoMZqj5HXha/LdhLlFb/FfrQw3AY/4zv/FJ
	xfQO3Ff6RxlhPh1+sICXNlE0FKM6K9uTrdc/Nqm8aiNnV/CgcXCOEpF2zaWph9oPlnf3cvg/zTG
	ApUJRYBgp7Gi+WNa
X-Received: by 2002:a05:690e:d02:b0:668:15cc:bcc4 with SMTP id
 956f58d0204a3-66815ccc501mr4350974d50.53.1784196169785; Thu, 16 Jul 2026
 03:02:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <aleKQKH2V-ck-SX6@ashevche-desk.local>
In-Reply-To: <aleKQKH2V-ck-SX6@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 18:02:38 +0800
X-Gm-Features: AUfX_mxuW_5D4-j7y5auPPMU8fitwu4GAwXYmX14uCHTJY4CutBJo0OlCAdX-_s
Message-ID: <CAGXv+5Ed9Cn-NeHiXJ58er7NJs1P2ZUMrjqYac-gSky-TNV8Lw@mail.gmail.com>
Subject: Re: [PATCH v5 10/16] usb: hub: Power on connected M.2 E-key
 connectors with power sequencing API
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Wei Deng <wei.deng@oss.qualcomm.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 15, 2026 at 9:25=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jul 15, 2026 at 04:53:40PM +0800, Chen-Yu Tsai wrote:
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
>
> ...
>
> > static void usb_port_device_release(struct device *dev)
>
> >       fwnode_handle_put(dev_fwnode(dev));
> > +     /* usb_hub_create_port_device() could leave an error value */
> > +     if (!IS_ERR(port_dev->pwrseq))
> > +             pwrseq_put(port_dev->pwrseq);
>
> Hmm... I would rather make pwrseq_put() NULL and error pointer-aware, so
> it will be no-op in such cases. But I think Bart has his own opinion abou=
t
> this.
>
> >       kfree(port_dev->req);
> >       kfree(port_dev);
> >  }
>
> >               put_device(&port_dev->dev);
> > +             hub->ports[port1 - 1] =3D NULL;
> >               return retval;
> >       }
>
> ...
>
> > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
>
> > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > +     if (IS_ERR(port_dev->pwrseq)) {
> > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port_dev=
->pwrseq),
> > +                                    "failed to get power sequencing de=
scriptor\n");
> > +             goto err_put_kn;
>
> OTOH, how pwrseq can be non-NULL and at the same time port be created?

I assume by non-NULL you mean returning an error?

device_register(&port_dev->dev) is called some lines above this.

usb_port is weird in that usb_hub_create_port_device() does a bunch
of stuff that is normally done in a driver's probe function. However
usb_port's driver is just a stub driver add for userspace compatibility
reasons. See commit d99f6b4130877 ("usb: rename usb_port device objects").

So at this point the usb_port device has been added to the driver model.
Or we can just zero out port_dev->pwrseq instead? I guess that is cleaner
than having some weird check in the release function.


ChenYu
