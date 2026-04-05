Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C83347081E
	for <driver-core@lists.linux.dev>; Sun,  5 Apr 2026 22:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775428785; cv=none; b=MabT30RRuuR6IWmOrWT0LikQXqvMjaIT14Pe+8wSjpURUfqmaSaTZkmFfcI+LUuehJqi5L3A3fOWqxkymV30vRv/rGc4OepErZhWnmPp6vYadU3IJAgiql0mjS0yj/fdDZi3uFQQbvsWSrzfOEVbKZ6mZ+xBq3u643iQ5lHUMEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775428785; c=relaxed/simple;
	bh=T0JVAUYSB4U6s/hgIINi+Y+L1JiMeDIr2XIwSjoMKcs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdthQKHiT9SZQjpnQOGZzREuKJVZ+N+H1HRQyERHyTPT0RpItHCyhUVXvOBDPAjYZ8wXRV0f5boubLwuuEYmszYMtD4l97FSzjuRj428dMyiRDjXF1IC/ePiD/T5N4RiQwEk1py3tdWuKsxriROm0Vl3ntey36K3NtknX2DR8Rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bq5v+lGx; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bq5v+lGx"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66bb4d4fcb4so6407839a12.2
        for <driver-core@lists.linux.dev>; Sun, 05 Apr 2026 15:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775428780; x=1776033580; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8s8eJ05TLahhUNspYgkZ7HDkIZCDUFKgkov6A8JZIeI=;
        b=bq5v+lGxptcaXuNpSKZOKpCmJ/baWHq2of8UMeYgk+tD4XerugWg40Uu6+2oKzwbIw
         o5qA7GP+49LeyN5t+nFXPgLATUHljY6HbzZca4L2tBu62u0TRhdYyfbOOJkJLhfA9Jq0
         8dpJg7qoD2w8ZosjosKi2p2xQL0OUI4+VN/xo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775428780; x=1776033580;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8s8eJ05TLahhUNspYgkZ7HDkIZCDUFKgkov6A8JZIeI=;
        b=n6UTKlCIw1ML/YvCgwi6+11u9d1Uam3g91pnlrH6tTPsp34j479h2M1FyuOfJk7NWq
         5u1SFszHxEd9Wxy9gu5rDcvq1I2zt4Wuh2GfE4EUN1Wr4r+iMlxWPBL/ATK4xn8jLlHi
         4LQyqjqAwp306PlmgldeSEJn4hnOF+RkZArl+VLrbO3gDwhDyTH3YNXOM6kUKgl2LjP5
         /OcPvxTS9O2489w2omqcg6OXpKmj3J8/REsQ93UB/ls/XF0RSOJ9fsRHmhcbiFPkhbPe
         6tOZJH2SnLIWFizc5OOAEtAE6gJItihZ/1TS07qwFPf/67Bkhi91SrsRh6VUfupQD3k9
         JQzA==
X-Forwarded-Encrypted: i=1; AJvYcCXEeAbIKkNIgRu8IDOvDXnFaEk+ti9rT4NSXRGnB+m3c5Uz0CYZcw69IULzuMQuRXS+crOwkT2R/1VtyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxqaHJzeE4ojRi1cNYwla2rYKz0pC6ibOzed4A3qHmpKYmfLsOe
	Ikxry0EE/Sydyym+5HZlr6D6kSISOyg0XFa70h3my7xwm1B8NMit4LrJYuHd/bogJyaQq+4CaY8
	49qNAMg==
X-Gm-Gg: AeBDieui3aa+4SO6blxjte9ggESYi7hiL1eNZiViQAGp9POEAzD4d2o55yS7KbTThSJ
	gKXMqR9O8vEscAmEhbOLEIcQGmnWUoS+SSf2SFmZ6fYNMhj6PIWq20G8/1gdLcBug6n22GCGgEE
	9nDOnflMy48KYQ8/zlAf0xnTsSQR40HUXwdsskiHVvPtqnKNAaWTIEE2O8C+5UfE/DxlNlCWoFc
	yAJCn8H020vb6ZiSWVA3rTqvxbKOeRDTBU+UH4hKXnRqAedGxrENpo1DXG3YsuG4gn9qtoF138z
	WA3sQDoU6rmwJFG/06/fJ8ZxlAD01R8KJuuHWr1ijPeqK650ACqCZWQqeeK0zAEJF4F/X91IKEM
	CDdcJLbzqziph2KmeWR/5b4IaNLS9GUdDeLE0d77NOmubEhLajCq2X6xkS8jXD/M3FMB3JIPQ3H
	gtvkjBJtCaIVySe14neIZj7/im2uOGJv5V2MWE4jemN+sOyUz0WP2tXwOjPsQb09+0fy+dR/eu
X-Received: by 2002:a17:907:3e99:b0:b97:7d03:68c1 with SMTP id a640c23a62f3a-b9c67957b45mr454797366b.30.1775428780221;
        Sun, 05 Apr 2026 15:39:40 -0700 (PDT)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com. [209.85.128.42])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff19c0sm425490166b.48.2026.04.05.15.39.38
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Apr 2026 15:39:38 -0700 (PDT)
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4888375f735so30506005e9.3
        for <driver-core@lists.linux.dev>; Sun, 05 Apr 2026 15:39:38 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUNwkp2uOn0hTFK89w0neKM5CI61ZCh7FSJxXO2yDM4e1UhpmI05Q8tul0zpZ0uoruJzZJfHuMbt9xyzw==@lists.linux.dev
X-Received: by 2002:a05:600c:6085:b0:488:b239:77ec with SMTP id
 5b1f17b1804b1-488b2397962mr13831405e9.17.1775428778171; Sun, 05 Apr 2026
 15:39:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260404000644.522677-1-dianders@chromium.org>
 <20260403170432.v4.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid> <DHLITCTY913U.J59JSQOVL0NH@kernel.org>
In-Reply-To: <DHLITCTY913U.J59JSQOVL0NH@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Sun, 5 Apr 2026 15:39:26 -0700
X-Gmail-Original-Message-ID: <CAD=FV=Wgw7kU+Xse6dwjE+U06_A_tWcA93UXu6TTf0Erh+Mt8Q@mail.gmail.com>
X-Gm-Features: AQROBzDf0YIRXtcswLwNrYUqFXTDhkD4ap27KBOAGZqirfMvG0HLFLXaEuaI0tM
Message-ID: <CAD=FV=Wgw7kU+Xse6dwjE+U06_A_tWcA93UXu6TTf0Erh+Mt8Q@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] driver core: Don't let a device probe until it's ready
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Saravana Kannan <saravanak@kernel.org>, 
	Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, Johan Hovold <johan@kernel.org>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Alexey Kardashevskiy <aik@ozlabs.ru>, Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sun, Apr 5, 2026 at 1:58=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Sat Apr 4, 2026 at 2:04 AM CEST, Douglas Anderson wrote:
> > Instead of adding another flag to the bitfields already in "struct
> > device", instead add a new "flags" field and use that. This allows us
> > to freely change the bit from different thread without holding the
> > device lock and without worrying about corrupting nearby bits.
>
> I was just about to pick up this patch series (Greg mentioned to pick it =
up next
> week, but we agreed offlist that I will pick it now, so it gets a few mor=
e
> cycles in linux-next).
>
> Due to this, taking a second glance at the code, I noticed the below issu=
e.
>
> > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > index 09b98f02f559..f07745659de3 100644
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -3688,6 +3688,19 @@ int device_add(struct device *dev)
> >               fw_devlink_link_device(dev);
> >       }
> >
> > +     /*
> > +      * The moment the device was linked into the bus's "klist_devices=
" in
> > +      * bus_add_device() then it's possible that probe could have been
> > +      * attempted in a different thread via userspace loading a driver
> > +      * matching the device. "ready_to_prove" being unset would have
> > +      * blocked those attempts. Now that all of the above initializati=
on has
> > +      * happened, unblock probe. If probe happens through another thre=
ad
> > +      * after this point but before bus_probe_device() runs then it's =
fine.
> > +      * bus_probe_device() -> device_initial_probe() -> __device_attac=
h()
> > +      * will notice (under device_lock) that the device is already bou=
nd.
> > +      */
> > +     dev_set_ready_to_probe(dev);
>
> By converting this to a bitop, we now avoid races with other bitfields (s=
uch as
> dev->can_match), but I think we still need to take the device lock for th=
is one
> specifically:
>
>         Task 0 (device_add):            Task 1 (__driver_probe_device):
>
>         dev->fwnode->dev =3D dev;
>                                         device_lock(dev);
>         device_lock(dev);                       if (dev_ready_to_probe())
>         dev_set_ready_to_probe()                        access(fwnode->de=
v);
>         device_unlock(dev);             device_unlock(dev);
>
> Otherwise, nothing prevents the above dev->fwnode->dev =3D dev assignment=
 to be
> re-ordered with dev_set_ready_to_probe() and we are back to the problem t=
he
> commit attempts to solve in the first place.

Ah, that sounds like a reasonable concern, and I agree that taking the
device_lock() here seems like the cleanest solution.


> > @@ -848,6 +848,18 @@ static int __driver_probe_device(const struct devi=
ce_driver *drv, struct device
> >       if (dev->driver)
> >               return -EBUSY;
> >
> > +     /*
> > +      * In device_add(), the "struct device" gets linked into the subs=
ystem's
> > +      * list of devices and broadcast to userspace (via uevent) before=
 we're
> > +      * quite ready to probe. Those open pathways to driver probe befo=
re
> > +      * we've finished enough of device_add() to reliably support prob=
e.
> > +      * Detect this and tell other pathways to try again later. device=
_add()
> > +      * itself will also try to probe immediately after setting
> > +      * "ready_to_probe".
> > +      */
> > +     if (!dev_ready_to_probe(dev))
> > +             return dev_err_probe(dev, -EPROBE_DEFER, "Device not read=
y to probe\n");
> > +
> >       dev->can_match =3D true;
>
> Focused on ordering from the above, I also noticed that this ordering of
> dev_ready_to_probe() and dev->can_match =3D true is actually pretty subtl=
e and we
> should add the following comment.
>
>         /*
>          * Set can_match =3D true after calling dev_ready_to_probe(), so
>          * driver_deferred_probe_add() won't actually add the device to t=
he
>          * deferred probe list when dev_ready_to_probe() returns false.
>          *
>          * When dev_ready_to_probe() returns false, it means that device_=
add()
>          * will do another probe() attempt for us.
>          */

Sure. That seems useful for future readers.


> As it would be nice to land this for v7.1-rc1, I can apply both changes o=
n
> apply, i.e. not need to resend AFAIC.

Thanks! I'm happy to resend a new version if need be, but I'm also
happy if you want to make changes when applying.

-Doug
