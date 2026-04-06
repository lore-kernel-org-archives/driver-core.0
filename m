Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405C02517A5
	for <driver-core@lists.linux.dev>; Mon,  6 Apr 2026 14:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775486487; cv=none; b=uETT860PaFcHYa+7GBADoaRuYceWYjtnxy7ksVLNY0rtVRQK9Y9jh4yR1p1xvQQ9DkWQXCieUMvEyA3vQ45ZVd6FurRd2ugCAxie0qvrG/Tu91So15cQWmilaUPiozIO8uW+IyAMS19eQ14B+lwK/8PG44Plp0pd2mqN+OjNQ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775486487; c=relaxed/simple;
	bh=7oNzeFfYFgQWoRDQJKiCyaff80r1S13ZgndAkYlmils=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PnYl4q5SqX8uZMkzJR1fiJE5V9NLg9hskzFG1A/Rk5pCoQ2hkK4Lx1k63V1Ko7yj5zZi5pEoHpswhl+Mk4VO/rYup7G7bkeOM2JBZ6iN/rsHmUOmI9KePc5X4J584/fn2His1Qev6MrmIhmN4BgnB0CbBRilzuZ02WylejU2CjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oLUeiorK; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oLUeiorK"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b9c755b2cdeso361913966b.2
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 07:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775486482; x=1776091282; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cgzwoDGM2saCO6xG8KTBFI42La8jnMppIEczXuZm8oI=;
        b=oLUeiorK5KgVMDPGVy2J1yJ+Fd6v/SaNTa4jif2AOf0YhBJqP26Y2dtbpV5tkH7cKP
         YkwjygVQapxjd8+QpUP0jjtSMDVBvKh6GCkhb1OqawRRGm9Gcnr0kyf288u87B1ppedr
         fbcGNlidVjaFvIKmFSrrJIptoRzr6iYEyrdAs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775486482; x=1776091282;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cgzwoDGM2saCO6xG8KTBFI42La8jnMppIEczXuZm8oI=;
        b=Ae5fe8EmTU3UtYbVxhAw/xOGYFxTPBPwq8ykBkDwlXijdBXdgjH0kwE694Q1+/rMPH
         wd6OfrOBz7Wg7B33Ua9FZZLzs2YXVxkPNps/Tl1142KI8r2X71NFRV4F4CH5tDX6nqlh
         4+copED0PTOJFxDgMP9djM95JH4U8OO4fRInX9Zyay3K0GNHsVHTpY0ZxHwopCnAy1rz
         ZVF/HaKlJmGGq6ffQcNeSHSdA2T2Xl9wIJuE8sT4hiH2bhhLbjN9IJ3kXFL304g3Tav8
         +thREw8p7Cqf1Br/Wue+ZsTbhtMjSHSfhI+mHCH1SiRzAY+4votnjzcWaCqYawWfBKX9
         BOFw==
X-Forwarded-Encrypted: i=1; AJvYcCVJKxcz0aA1kBtWF32LPaLuo4KbX0kbAeoezKvMrET6QWilhUcshCH7Kr4TFIsJj3BvmwAzVTIohnFXjg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzb1zmEYa29GfqhqdaGlyecc0LA3F+d0NmQM+WpmdD+D95rfj4t
	K9f5vgJ+izYjXvmoQx1V6+YTKLcm+p0uKmPocoIjq233s00nqix3ORxnFxzKgjftCFxji1eP4JS
	MMgAXyCDN
X-Gm-Gg: AeBDietGmkYMcBmJdCEEcMFdZ7zifxzEDeyNc0B72Fmze19P2COFY9hY3De1ywHnldg
	dCBtXMlrabxLQeC2g8IF4PjonQLj9gru0kbuyBwmTxXNqXDb4qO/qKQ7X96x50UXgYUfP0XwgqL
	4N67rZniHhTjXrcY/4vSx4q+QSOGgSAf/LouQBeXlnMvT5OjXi3TtPp3DmmwZjg9h8b1hNKEHNt
	p7+g2G1sM2RINtlnMPbugn2WS11T4o6ytmoLCtORGE7JxPN5DDO8rwAACp9CghcJ/RkSTKwyKyY
	+wjZTKbd1/X/tIhf3MOFT1TBQG51Rlbd1mBlI3ASHqJVyKo0DI20juulLDar2CmslUwPdsB4lKG
	BT2aiFcM/LOvpPlFq1Pwzc8Dj24dxga4GJXrHEbh6NfX4mDtWcAr4JiB2F6bkCxbvoXEruC76Gf
	xFWrhbpJel+Pi6m3nTxYX8oQHaFTQfc/SAcb7EQJLJAoBFLVQqTFgdyUMFzOpk6A==
X-Received: by 2002:a17:907:a688:b0:b98:2496:1b0f with SMTP id a640c23a62f3a-b9c6768722emr599754166b.20.1775486482550;
        Mon, 06 Apr 2026 07:41:22 -0700 (PDT)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com. [209.85.221.48])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6c11sm483912066b.30.2026.04.06.07.41.21
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Apr 2026 07:41:21 -0700 (PDT)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-43cfd1f9fd1so2109210f8f.3
        for <driver-core@lists.linux.dev>; Mon, 06 Apr 2026 07:41:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXBJwumUaLHEGSV84KN23PkxUW11MPdCuwLGE0fCrRfyyxfyEvQr82U5QXB0H8rsLn+Z2po+6cPPJOBRg==@lists.linux.dev
X-Received: by 2002:adf:f10e:0:b0:43d:2ffc:4794 with SMTP id
 ffacd0b85a97d-43d2ffc47fdmr11005477f8f.0.1775486480662; Mon, 06 Apr 2026
 07:41:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260404000644.522677-1-dianders@chromium.org>
 <20260403170432.v4.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid> <873418d2fz.wl-maz@kernel.org>
In-Reply-To: <873418d2fz.wl-maz@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 6 Apr 2026 07:41:08 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WV2SJwiC7CHEzG=XQJ=tG0P7JSLzU16f0px4j1qmwxUw@mail.gmail.com>
X-Gm-Features: AQROBzD_yK60R7hoa5tSGTXqMdhnXFgJKJJYeHosMoKRuVf_v6EpbCc2RzT9xS4
Message-ID: <CAD=FV=WV2SJwiC7CHEzG=XQJ=tG0P7JSLzU16f0px4j1qmwxUw@mail.gmail.com>
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

On Sun, Apr 5, 2026 at 11:32=E2=80=AFPM Marc Zyngier <maz@kernel.org> wrote=
:
>
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
> I think this lacks some ordering properties that we should be allowed
> to rely on. In this case, the 'ready_to_probe' flag being set should
> that all of the data structures are observable by another CPU.
>
> Unfortunately, this doesn't seem to be the case, see below.

I agree. I think Danilo was proposing fixing this by just doing:

device_lock(dev);
dev_set_ready_to_probe(dev);
device_unlock(dev);

While that's a bit of an overkill, it also works I think. Do folks
have a preference for what they'd like to see in v5?


> > @@ -675,8 +691,34 @@ struct device {
> >  #ifdef CONFIG_IOMMU_DMA
> >       bool                    dma_iommu:1;
> >  #endif
> > +
> > +     DECLARE_BITMAP(flags, DEV_FLAG_COUNT);
> >  };
> >
> > +#define __create_dev_flag_accessors(accessor_name, flag_name) \
> > +static inline bool dev_##accessor_name(const struct device *dev) \
> > +{ \
> > +     return test_bit(flag_name, dev->flags); \
> > +} \
> > +static inline void dev_set_##accessor_name(struct device *dev) \
> > +{ \
> > +     set_bit(flag_name, dev->flags); \
>
> Atomic operations that are not RMW or that do not return a value are
> unordered (see Documentation/atomic_bitops.txt). This implies that
> observing the flag being set from another CPU does not guarantee that
> the previous stores in program order are observed.
>
> For that guarantee to hold, you'd need to have an
> smp_mb__before_atomic() just before set_bit(), giving it release
> semantics. This is equally valid for the test, clear and assign
> variants.
>
> I doubt this issue is visible on a busy system (which would be the
> case at boot time), but I thought I'd mention it anyway.

Are you suggesting I add smp memory barriers directly in all the
accessors? ...or just that clients of these functions should use
memory barriers as appropriate?

In other words, would I do:

smp_mb__before_atomic();
dev_set_ready_to_probe(dev);

...or add the barrier into all of the accessor?

My thought was to not add the barrier into the accessors since at
least one of the accessors talks about being run from a hot path
(dma_reset_need_sync()). ...but I just want to make sure.

-Doug
