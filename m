Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24AAB3E4C73
	for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 08:32:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784277180; cv=pass; b=eMYWPV6B44uG0YhfSDOEU/DiLzsieuNyobPx5v1Sx1e9bti/xbskZCi3zgsNp2LIPJNM+sLFWqcFKYWACvztTdKQHRx78P+m8bb/WPhk+hIn7+hZeL0K/20Z1LRehJlogXKPnBh67UPCN01ycyQdhhdWv+c4f2WcyN0b09j59Pw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784277180; c=relaxed/simple;
	bh=K1k6G6+5zpiLdWHibg60JQFt+WiCSRiOFiAgjC0rwxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GysQWkhr2ZxzaSdk3PNd/+qRLhE49c1depQvtz7g4pwYZ6M24WkILQJrUtfZMf5r4pukt3JTABUfosekg8dDsI+xRldbynzDgnGn7IgYtJrgSIpP7aiujHls9gj1UFcffeyoWD+Wkc2OdQ5wE7NIGo6I140RC+5UA5qzgob6LmA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hGLqw2KR; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hGLqw2KR"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-664ce3000e6so3690206d50.0
        for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 01:32:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784277177; cv=none;
        d=google.com; s=arc-20260327;
        b=hoAX8w5lz8WLTJ97RSmkGDfPqBhnAF5Z5Al4wCj1zXpRbQwiOP8+GS+m7Q+UXTOm4O
         s4VOP82eHXE2B9QKLT8wh94Yi61MX0xLtIPszfHi9Qo69jSeIULXuLGTYIh44sgtRE0V
         Icc3BZqps1/xgDd0QrqR+nqGvFakpMHxJjIOB3UP0vwu2YHE8rJH9cjbC38OoqduRrWL
         j3m9Jbc7T73RD9AEB8NStE3ih3Ls+dkeijajCRZnLoRHIsn9Ca3jc/5ETRIVnRXG9UaA
         QTmwWWxaJq0k32uSqwCW36Cy1sihD01q5dIC29KhmgLTfS9h6oeXx1xaa73/63MkMpwC
         0iXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        fh=v27XgYHats0jQQiAxzUFKoQuEW+gRBTQ5zFaKJVHyIA=;
        b=bp1E5pSSvGgfd97FSiYfTRBN43SkgcCwblucngV+OMqcnOgLWI65yd6xwxBD9IqyT5
         /R+o65bCySySQXaqIaTeUUhdnCKKK0trZ50KtO3cLV7Xds4eGSgA8cDk5NM5Zpqj/Vyv
         eP9sO0hOOU8O2LDsCuc9Q+6cmX6A7wH2Qe2iE1TEMkk9RDdpmelrnnTAc7Y3lunC3K3D
         zENteBxtH1Rhd2FTo/tIJfssfauKh2lsrq6rGD7/vSWa9ErDdyR3qqRs8MbGWFVuSlEP
         pPbqwRvWdLACb1BzCYr7MKIyWehcgUlVPval82b9h6bryF4/Moa2sofbaUvlFgiZ7e5E
         vllA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784277177; x=1784881977; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        b=hGLqw2KRhrq/tqHFvKVzsXnGMcv1JNgltjmRq5QyzDB4Zkk9iN661bIPz17+nUMUaE
         pio7NsQrjvtyUMnztMP4cFpwafBfzNwubSsKQb0TQVbr5k/l+WDeQEOH8R+zisBZcd6E
         mfN/BDMaaH+U2YEro1mmKi9X0X95+aLAGvdWw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784277177; x=1784881977;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1UhkOJ+I5quk7xrKkpQoT029NfPFJUjtkpwNCEPA8Ig=;
        b=rKJf1UTdvc1SsYqjguVXh5aSKeODEu90iyIywdWAeUYphZ+niQ/vuI5SIDFEDDTj5E
         /v8UHH0Z3F3AArVmr54i2+QSh0tAeo2RaGs/1ayrPtA963XIda5oks/XCD9Mg3mKSse+
         b4D0dpqXIrlH3i5gZT3Eeqrr8b6GiMtIoe/pZ2Sfpt7FWiypjgxiDKJaJfi459ESrQ4U
         QI2xzRZZN6l/v1q77OQb+Nc8aUse3e4bPNmplEEhPPzA0fZHjlZwVjALHquLikiz7wsA
         bNohJsXqIRTfIparc0VfVs1z75bFkKo9BIv2sqTGvf0Qe0IhD/K/ULF/qpqR0ofO8ATb
         gJtA==
X-Forwarded-Encrypted: i=1; AHgh+RppbOC/sYVanfWFIjyZD3W0BKM78stfhnnNB9viNg4lQubrTsSj1AY9TI/AN0k6A1vQ8b+6PyDnh/Q+uQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzd/s1hE6MPkgb1mYVrfTEo/Lp0NBAPfmyuG3+CYayjgrW0jdbJ
	hKc4sY/aIKC4JxE1Qwjn6VSNjKq/LHHjfPPtmyuGGWAqWfAOuG9dsckVRJoNvcdnXJJ0RQjnawn
	z9I18ZQz+qBnII4CFlgdsYwbnn3KaNvZb/6XJMnXT
X-Gm-Gg: AfdE7cl7lf6OACnDEMNW4yFkgvDxJNtF5YV/VqNW0L/atf2JJjOtdFxpBXpfJqpNIeP
	eiEgy1hWicnqx5DL3EOx/9xHxTMPaFFNNyz6N+GfvCuV2LvZmpl8uA6Uvg15LDEiGdxzm8Sp+pY
	f0+PEqaWsbqr02Y7OsrBAcIbx9bZAHwj0V/6g2AAWPcodlHcDPnxg1HlDDtKUddHtbFnBI2cx3X
	tw7/6NOidhi7cU+IUeJ4lUvpo9qpmYnALhQjfXjNFGXJY4Ho9FJ2+eawbEQOVIF5bx0WBO/11Cd
	dm0Y4924o3to
X-Received: by 2002:a05:690e:1644:b0:667:af05:2e8d with SMTP id
 956f58d0204a3-6683bde30b0mr341998d50.79.1784277176987; Fri, 17 Jul 2026
 01:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-11-wenst@chromium.org>
 <aleKQKH2V-ck-SX6@ashevche-desk.local> <CAGXv+5Ed9Cn-NeHiXJ58er7NJs1P2ZUMrjqYac-gSky-TNV8Lw@mail.gmail.com>
 <alkWE-bQ9gGIXIJj@ashevche-desk.local>
In-Reply-To: <alkWE-bQ9gGIXIJj@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Jul 2026 16:32:46 +0800
X-Gm-Features: AUfX_mzoGIeMcv7EV_g3RqR3VRvLvguofP9ZSODwjiLGO0JAlL2g0unPo14vZls
Message-ID: <CAGXv+5FJkmOJgpwRBp4nAea6_moF=gH6wGmNpP+g8URNd--jbQ@mail.gmail.com>
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

On Fri, Jul 17, 2026 at 1:34=E2=80=AFAM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jul 16, 2026 at 06:02:38PM +0800, Chen-Yu Tsai wrote:
> > On Wed, Jul 15, 2026 at 9:25=E2=80=AFPM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > > On Wed, Jul 15, 2026 at 04:53:40PM +0800, Chen-Yu Tsai wrote:
>
> ...
>
>
> > > >       fwnode_handle_put(dev_fwnode(dev));
> > > > +     /* usb_hub_create_port_device() could leave an error value */
> > > > +     if (!IS_ERR(port_dev->pwrseq))
> > > > +             pwrseq_put(port_dev->pwrseq);
> > >
> > > Hmm... I would rather make pwrseq_put() NULL and error pointer-aware,=
 so
> > > it will be no-op in such cases. But I think Bart has his own opinion =
about
> > > this.
> > >
> > > >       kfree(port_dev->req);
> > > >       kfree(port_dev);
> > > >  }
> > >
> > > >               put_device(&port_dev->dev);
> > > > +             hub->ports[port1 - 1] =3D NULL;
> > > >               return retval;
> > > >       }
>
> ...
>
> > > > int usb_hub_create_port_device(struct usb_hub *hub, int port1)
> > >
> > > > +     port_dev->pwrseq =3D usb_hub_port_pwrseq_get(port_dev);
> > > > +     if (IS_ERR(port_dev->pwrseq)) {
> > > > +             retval =3D dev_err_probe(&port_dev->dev, PTR_ERR(port=
_dev->pwrseq),
> > > > +                                    "failed to get power sequencin=
g descriptor\n");
> > > > +             goto err_put_kn;
> > >
> > > OTOH, how pwrseq can be non-NULL and at the same time port be created=
?
> >
> > I assume by non-NULL you mean returning an error?
> >
> > device_register(&port_dev->dev) is called some lines above this.
> >
> > usb_port is weird in that usb_hub_create_port_device() does a bunch
> > of stuff that is normally done in a driver's probe function. However
> > usb_port's driver is just a stub driver add for userspace compatibility
> > reasons. See commit d99f6b4130877 ("usb: rename usb_port device objects=
").
> >
> > So at this point the usb_port device has been added to the driver model=
.
> > Or we can just zero out port_dev->pwrseq instead? I guess that is clean=
er
> > than having some weird check in the release function.
>
> So, why do we need to assign the error pointer to the field directly then=
?
> Make a local variable and assign it if and only if there is no error poin=
ter
> in it. Would it work?

That's the next thing to do on my list. :)


ChenYu
