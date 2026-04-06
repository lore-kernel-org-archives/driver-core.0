Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0262340DFDC
	for <driver-core@lists.linux.dev>; Mon,  6 Apr 2026 16:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775493971; cv=none; b=lAIgBpqz4un7WO5eklkZGckdzXssKMspQWdxFym1H+o4pfdmpsxj5mgc5NJEyTjgxgywXEin5KpjHrs27i2ui749ccXtJl6NwzBivXhRmA/ZjiiYyiJBI2uJrAkZtYZMRTEDOAyx7QJmn8sJD+durE6Fg0kKME5vr/myyvb/Qds=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775493971; c=relaxed/simple;
	bh=QxqGVqm1i/34YnjblUCjGI4Uj90RXCY/8Zyu2fvQrk0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n0ZxyVB2JZqxQgxllBeiQvLvVfFO4RNlgYA52rbRBsb+KN4vZFXnDbTGP+hlgkVEKIeva4FNQoy/TJv7GaElnP7lfVVMZ98/+nBCYzqhtYN+D3IduKdhv1ST393LU/5Wc/okk5HBbrmSsGywNzXhqY/X7aN0719S9D/EIgZ/RR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iSxflsDq; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iSxflsDq"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8f9568e074so685470366b.0
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 09:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775493968; x=1776098768; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8f9j7kIZ2Uiuc4j2TejWoSS2WCoQZYaehN86Hk6IOxE=;
        b=iSxflsDqDaQ4UEmCCX4gWODSj8PKWTejAeLx31Zv7oiU2CggsEEhR7WnmNT5D/ds5l
         a6y44VkG5I5nO4yCxg4W5ATOydTB0mWIiqEMZ7cYUky8fvE2fVMkA3G7DrjTG6WpA+Ka
         g0pis/f2lqWggRW8bZurCawyb7RdaNYdDpf7g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775493968; x=1776098768;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8f9j7kIZ2Uiuc4j2TejWoSS2WCoQZYaehN86Hk6IOxE=;
        b=UmC4NVAJTe7jYSnjC8UUw5d+pXyu5HnDCFaoluixu8enLgd6KVyZUNpvhD+vClyIHd
         O/JPN565rZP3f7YEWpAOwhM+j+VSj/LXRsnOBG+9m9tNGoyahHALZrMzKgbBCu5JlZqa
         K8lE12LSTM7SVQVGRmSDxVusILPKPe5RcF939PpudIPR9VVLguko8230JcUc9qLff21F
         jkxGEcUipUW7V84DGLdLwciqLzpRkBePXd9T6f3AGHHDGEEjh9NM2JLcWKsXisNqxBYc
         qrVO/phsnvk5q8qJ6wHCnAo/7dfRwC3kTyHEaLiOKC/K19SGI+TI/FRVYaX0v7cRo7Fm
         fj9A==
X-Forwarded-Encrypted: i=1; AJvYcCVzIQndHkrhUctj27dAy8Izfmx48P1ltt3mFqbG8u6YjawVi+OUgcP/E/N1k80IY9YwqGdkVoRTNgIAcA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb/56v7Ryqmp3o8cY9XoNd+EHnpzW5Vp7kdrqwsoMEwT+Kckif
	vFhXG3tzVVP+ZOzTlk7ga1w/34DUQLHjcPpGJTdOz50AeijlOkpPccpzqt0cutkh61sJ50P5XTj
	Z1fx42Cf2
X-Gm-Gg: AeBDievbDVtN9Qw/KysAeiwmjuBCI+kGtjJrPEnLYOwRIilVsuU00jsZHDAGakHkM9m
	3eRTw+B1lndr92iRVf7tuFDK7q55n1nxCcAhF9iZo9Af2ALow/pQFEANdbKPClAq0m4PkrfWpfO
	V4fxvV0RotoJFOIcghY7BZ7ehAp/PFBShGVUaXDLtsBTbuownYTjS+8AswoUWLeKssdtDa4SXQc
	cE+27n9FN+GKZ9zx6FMJ22nFxTFAPc/bWUabJUjhTduk+dbxgSiyaorEpQqXti/lJcHdLEe8SIo
	7t769Gpknz8+Y9snLYLt3U4dGd8J19/YUMcMDEyTvX4qZDr0fazdAFSyDyjlXjDfMtZv21zpgqk
	YgwgZ7pk3eT3e4oPs0Fyq9IuVlgCH2KaIGut5xh3J74wqONE7JsaZGhqsBYVXtOJrexBu2I516L
	VpEIBJObSYYltbPS37aX0dZC7IO8zqmekWLcz9VPklzoYBAJLMB2tFW7SubG/pXw==
X-Received: by 2002:a17:907:d08f:b0:b98:2462:959d with SMTP id a640c23a62f3a-b9c67979ee5mr672843966b.31.1775493967843;
        Mon, 06 Apr 2026 09:46:07 -0700 (PDT)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com. [209.85.221.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3c971f03sm484562366b.7.2026.04.06.09.46.06
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 09:46:06 -0700 (PDT)
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfac48bc7so2195956f8f.0
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 09:46:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVYYQEPpb6aGe5eiQ8LDAA4/xSg+eev5feFb511vghJe5RBnpEjPFvBsKQkv1QIOPcJpwKAZtEpojXMdg==@lists.linux.dev
X-Received: by 2002:a5d:5d0f:0:b0:43d:184:8a9b with SMTP id
 ffacd0b85a97d-43d2929d8fcmr19296227f8f.16.1775493965616; Mon, 06 Apr 2026
 09:46:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260404000644.522677-1-dianders@chromium.org>
 <20260403170432.v4.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <873418d2fz.wl-maz@kernel.org> <CAD=FV=WV2SJwiC7CHEzG=XQJ=tG0P7JSLzU16f0px4j1qmwxUw@mail.gmail.com>
 <871pgscaj0.wl-maz@kernel.org>
In-Reply-To: <871pgscaj0.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Apr 2026 09:45:54 -0700
X-Gmail-Original-Message-ID: <CAD=FV=U4RidHw2_DUJxtk6gu3jwoQ52gJ_wbW80f6oO-4Z-uZQ@mail.gmail.com>
X-Gm-Features: AQROBzC--h3fG6U2sMXoOepON7HkR62IdBT7YOau8_qAOR5fD2anVtbUJRhii8c
Message-ID: <CAD=FV=U4RidHw2_DUJxtk6gu3jwoQ52gJ_wbW80f6oO-4Z-uZQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/9] driver core: Don't let a device probe until it's ready
To: Marc Zyngier <maz@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Saravana Kannan <saravanak@kernel.org>, Christoph Hellwig <hch@lst.de>, Eric Dumazet <edumazet@google.com>, 
	Johan Hovold <johan@kernel.org>, Leon Romanovsky <leon@kernel.org>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Alexey Kardashevskiy <aik@ozlabs.ru>, 
	Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 6, 2026 at 9:35=E2=80=AFAM Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 06 Apr 2026 15:41:08 +0100,
> Doug Anderson <dianders@chromium.org> wrote:
> >
> > Hi,
> >
> > On Sun, Apr 5, 2026 at 11:32=E2=80=AFPM Marc Zyngier <maz@kernel.org> w=
rote:
> > >
> > > > +      * blocked those attempts. Now that all of the above initiali=
zation has
> > > > +      * happened, unblock probe. If probe happens through another =
thread
> > > > +      * after this point but before bus_probe_device() runs then i=
t's fine.
> > > > +      * bus_probe_device() -> device_initial_probe() -> __device_a=
ttach()
> > > > +      * will notice (under device_lock) that the device is already=
 bound.
> > > > +      */
> > > > +     dev_set_ready_to_probe(dev);
> > >
> > > I think this lacks some ordering properties that we should be allowed
> > > to rely on. In this case, the 'ready_to_probe' flag being set should
> > > that all of the data structures are observable by another CPU.
> > >
> > > Unfortunately, this doesn't seem to be the case, see below.
> >
> > I agree. I think Danilo was proposing fixing this by just doing:
> >
> > device_lock(dev);
> > dev_set_ready_to_probe(dev);
> > device_unlock(dev);
> >
> > While that's a bit of an overkill, it also works I think. Do folks
> > have a preference for what they'd like to see in v5?
>
> It would work, but I find the construct rather obscure, and it implies
> that there is a similar lock taken on the read path. Looking at the
> code for a couple of minutes doesn't lead to an immediate clue that
> such lock is indeed taken on all read paths.

Yeah, it's definitely taken on all read paths. It is only accessed in
__driver_probe_device(). __driver_probe_device() is called in two
places.

1. From device_driver_attach(), it's called with
"__device_driver_lock()" held, which includes the device lock.

2. From driver_probe_device().

...then we look at driver_probe_device(). That's called from three places.

1. From __driver_attach_async_helper, it's called with
"__device_driver_lock()" held, which includes the device lock.

2. From __driver_attach(), it's called with "__device_driver_lock()"
held, which includes the device lock.

3. From __device_attach_driver()

...then we look at __device_attach_driver(). That's called from two places:

1. From __device_attach_async_helper(), which holds the device lock.

2. From __device_attach(), which holds the device lock.

...assuming I didn't mess up, that covers them all.


> > Are you suggesting I add smp memory barriers directly in all the
> > accessors? ...or just that clients of these functions should use
> > memory barriers as appropriate?
> >
> > In other words, would I do:
> >
> > smp_mb__before_atomic();
> > dev_set_ready_to_probe(dev);
> >
> > ...or add the barrier into all of the accessor?
> >
> > My thought was to not add the barrier into the accessors since at
> > least one of the accessors talks about being run from a hot path
> > (dma_reset_need_sync()). ...but I just want to make sure.
>
> I don't think this needs to be inflicted on all flags, specially the
> ones you are simply moving into the bitmap and that didn't have any
> particular ordering requirements. 'ready_to_probe' is a bit different,
> as it is new and tries to offer ordering semantics.

OK, cool. Just wanted to make sure I was understanding!


> So an open-coded barrier on both sides would do the trick, unless you
> go for the lock and can convince yourself that it is indeed always
> acquired on all the read paths.

I'm pretty convinced it's acquired on all read paths. :-)

-Doug
