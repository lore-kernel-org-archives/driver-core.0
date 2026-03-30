Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC882BDC2A
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 14:31:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774881098; cv=none; b=DN2Mh3/Cz34ikuAOS3RyaunZybZz39VrlCxqG/E9O21POqDxHA9ow6zzpQnaOh3JfTddVzFdBIx1jhYGLquqmK8Zgrl366UxIdwtI8GzgjdCJnvATxS8Mhhptnid6QVb7OIsyKPZ7Vz/j5jkyMnZqf2xbsVqppLiakNhBsbzcTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774881098; c=relaxed/simple;
	bh=h3FGVwRTPYOfB0zDSRnMIsrHoO/wxz/4EbZYgSdFw2c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mBXdUslue+4NL0rMnTeISXFX8EIHCQMlF/8iBIdEJ66cGMtvUUWEBzLuEUM2CXCF57wBqm+qa7qQJKsdwe/HOv4mlCOYAs5wucvdXqPqqtM8Ckl4YzPoId8RMoDFiCRUDb/EnDsd4oiwQy/fepoewgj2yD5rNE3SxB+BIyUbFbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GJ+JIP29; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GJ+JIP29"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b98133bdc4bso556737966b.0
        for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 07:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774881091; x=1775485891; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/cqMaBn41Rar9mtlb33z9M/+19lyrnvUNl4CHgOmrTM=;
        b=GJ+JIP29sRHTA7pohrVLS9Ijs1ErFGZlIzplzQpXSCXgGbvmJnL4BzZE4Ei+9j/qGn
         arycKp5A3uzWbaMATRQIJgTxZw9yQXdfkVQ6gRpNrtF1P+coWVQqUlm3I7CcsdpGlIW6
         RNnXKTru2xI04V12Ygi4FaXZ2msPcFac7D8EY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774881091; x=1775485891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/cqMaBn41Rar9mtlb33z9M/+19lyrnvUNl4CHgOmrTM=;
        b=BoyO/d3sxJoH0OW5I96JvHguO3MdUav9OyC6sIjwSdcWhOg4YsTCD6QjZwzlbGTUdi
         RJTctfO68Sv5lC2/0bOIxyyEpFLKCte85Zt76Xb21K24dQo6yS/YgJxIZ9rxp+x+tUDD
         MTG2xO5VD0AK8EbgBdlHlwAdmWPFThrQrTKwkTr0JdB1tFklWtMlfqjICfz48y/ftEo1
         jhQp0mvHS6ZNvgawFiNzh7ThuZ76J4SZeHAkP9ZP2URxv5Y91567BeGiEzTccyXDDNwY
         PaP4hbO5d7vCqutn0WFP+Y0spVNMdGiD7h/F9mCcyLQ11HDV5hPAV/9vaA7xEs5spwoA
         xUTg==
X-Forwarded-Encrypted: i=1; AJvYcCWnTGzhfd1Mg7GY/e3Vr2y17BcKFLac4lrh/0IKPfNEcUf6mL78pvIubwCOC4F6VPRhk7DjVc3fuLcttg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+HH+D3635Dw0FOB/QoM6cxIhQ4TiKwydscbYTJvABYNOPkqUF
	/c7AuZvMFCZtT9AIoQuL7NhIwhyuDz7YurOwanvBxlTjW6U0XKV0JS0meDMC5Ha4J8vzxQo4Bo8
	n2zleOQ==
X-Gm-Gg: ATEYQzySLRX/Cw9VPU1KD2fMuIeJbb8uG8W7fstmbg/r0hMy4AtBxErO7ylNroAtb1z
	SG/Qv1t0Lik4dSTBhyvD+O+79atsChGj3CnpbsFIH4M+0COkn1mUX5HPIj8962kW+NUEPrYn3hx
	27GECPZiX+5z4BDTdCtyOls2NIY2LuUulck8u7gKbtgw8zv5h68j15sAQMQmwhPcA3+247jr/bb
	ytfjDlKZMNLMeUtLC/leBtMFt5IPaupQBJD+UVxVx6ltfU9YTAr5gV2Vq+axSkhe1KeupCBYYRP
	td2uElfUUvmllfkiFMpBrm0pngfcz8/NYPgh/P4ZhMwzeVYSNC/ivyiZ01Ivj1w0hmg51FK4lLK
	lCrBp5HB2S5iziJfr0Zz6orjbEHOHHQQJhi18PFdyFE21KC6VUV3q5SpXHISXfU3lSHzEUGgqcQ
	1f0mXYbE5beG9DDyMJWmHDpI0f89fIdbDURqL7EPl/+HywLUvQpqV9Ra0Y1N0+eA==
X-Received: by 2002:a17:907:6c0f:b0:b97:98e9:1b17 with SMTP id a640c23a62f3a-b9b507b2d00mr747334166b.28.1774881090894;
        Mon, 30 Mar 2026 07:31:30 -0700 (PDT)
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com. [209.85.218.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7b1e472dsm299136466b.50.2026.03.30.07.31.28
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 07:31:30 -0700 (PDT)
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b936331786dso495655166b.3
        for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 07:31:28 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVMj2laE0scHX1Rx3KcWYrP/GMB2iOx7wKr4tMGxsrFeFC4HbSPDsgvHlLmhSEpZd6bMmOrJA86IiI8FA==@lists.linux.dev
X-Received: by 2002:a17:907:e158:b0:b98:32c1:2465 with SMTP id
 a640c23a62f3a-b9b5094ea6emr617512066b.48.1774881088102; Mon, 30 Mar 2026
 07:31:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026032114-unlocked-unmoving-091b@gregkh> <CAD=FV=WPD5DueD5iGvsxZYUGy7XAQ2NQ2BTJTyVSVNtYYrWOHQ@mail.gmail.com>
 <6ff1444b-f83e-47f6-ab0d-6745738523ba@rowland.harvard.edu>
 <CAD=FV=Vco+hRBNxGpUDf-YofEwTR13ht=nTnjvUvT+3_76+1MA@mail.gmail.com>
 <6511a5b9-ac67-49a1-8336-3d2afaaab593@rowland.harvard.edu>
 <CAD=FV=WBgKN2MNO-xBHZ3tRN91M82vk3h1AEAXtpBQ-nQocKCQ@mail.gmail.com>
 <bfd4e1f5-7bc5-448d-aa33-1a977bf00733@rowland.harvard.edu>
 <CAD=FV=WeeBoQAoPgNq+5ocZas+mOn1RuNto3k57ag4ODo2vOLw@mail.gmail.com>
 <852cd509-4ce1-4b22-ab1f-b9b9bbf6a52e@rowland.harvard.edu>
 <CAD=FV=UroO1vQYJDkrp86D475F8b-RStUXYejWwTQ0NqP1a_ew@mail.gmail.com> <5ea67deb-e669-4faa-be47-b1b225f1194a@rowland.harvard.edu>
In-Reply-To: <5ea67deb-e669-4faa-be47-b1b225f1194a@rowland.harvard.edu>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 30 Mar 2026 07:31:16 -0700
X-Gmail-Original-Message-ID: <CAD=FV=VPRchnWroMXtjdiMoGwz8JvO1aZFPEioOO54LoY3Cw2g@mail.gmail.com>
X-Gm-Features: AQROBzD_XzWh9fcI0DGus-Fi8sX9sgc08LM_4d2MoOacxTHrOysvfL0PhdVqk6E
Message-ID: <CAD=FV=VPRchnWroMXtjdiMoGwz8JvO1aZFPEioOO54LoY3Cw2g@mail.gmail.com>
Subject: Re: [RFC PATCH] driver core: Don't link the device to the bus until
 we're ready to probe
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Mar 27, 2026 at 6:35=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> On Fri, Mar 27, 2026 at 12:30:47PM -0700, Doug Anderson wrote:
> > > But why just in that one case?  That's what I don't understand.  If i=
t's
> > > not okay to bind at this time on the driver-load path, why is it okay=
 to
> > > bind on other pathways (such as bus.c:bind_store())?
> >
> > Ah, I see!
> >
> > Yeah, OK. I spent more time, and I think I've a patch that will
> > address things. I still like adding the "ready_to_probe" flag and
> > setting it in device_add() right before bus_probe_device(). ...but
> > I've changed where I'm testing this flag. Now I've got the test in
> > __driver_probe_device(), where I simply do:
> >
> >   /*
> >    * In device_add(), the "struct device" gets linked into the subsyste=
m's
> >    * list of devices and broadcast to userspace (via uevent) before we'=
re
> >    * quite ready to probe. Those open pathways to driver probe before
> >    * we've finished enough of device_add() to reliably support probe.
> >    * Detect this and tell other pathways to try again later. device_add=
()
> >    * itself will also try to probe immediately after setting
> >    * "ready_to_probe".
> >    */
> >   if (!dev->ready_to_probe)
> >     return dev_err_probe(dev, -EPROBE_DEFER, "Device not ready_to_probe=
");
> >
> > I think that is more inline with your intuition that we should return
> > some sort of "try again" code when we end up with this situation. This
> > should also block _all_ probe paths safely by adding to the deferral
> > list (just in case) or returning -EAGAIN (in the case of
> > device_driver_attach()).
> >
> > Does that sound like what you're looking for?
>
> Yes, that's exactly what I was asking about.  Let's see the complete
> patch!

Yay! Thank you for your patience / reviews / help. As always, it's
much appreciated!

I ran tests over the weekend and things look really good, so I've
posted v2 here:

https://lore.kernel.org/r/20260330072839.v2.1.Id750b0fbcc94f23ed04b7aecabce=
ad688d0d8c17@changeid

-Doug
