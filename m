Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518643D0C09
	for <driver-core@lists.linux.dev>; Wed, 22 Jul 2026 09:01:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784710894; cv=pass; b=NqbWNWqXGwJOIOp5xnTiYDAjpLRJZ0f/RnHsr/eCiAnIoNCU4fWMh805+8UANGV0b1pZW9V4hiZQvFqYeRn7EotwcWKcDbky+oT+oV0FO+xpOKt9Qrj1eh81OB7MshzdtYEUEw31yqnEofIzx0yav9dGg3YHg7UzXzh99f0g62w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784710894; c=relaxed/simple;
	bh=kjMhhSUJeM58LyEBWOqNhoBXbBuuVqDLE8DYLHYzEqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENGgagBCBuFYbDcnE7835/NEZPLyFabLk3p/0ItPddRjRrUwpQsRrWHsRgOUdYMoTfGCe+hsxYb7X948YN+K/2X0ai1UnrCsyt7Ftu+Iw9twGNqCPPv2tJEfsH/Sgdg7S3FtZRKtZgIaE9MZyvitQYwGxoj9Bbc7rYDuBYGMaqA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZG0yG4ar; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZG0yG4ar"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-81e69a2db34so74316977b3.0
        for <driver-core@lists.linux.dev>; Wed, 22 Jul 2026 02:01:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784710891; cv=none;
        d=google.com; s=arc-20260327;
        b=N2ojoUve5F4kgvkCpNJN1JVzb/CLWHF4N3/K0HXt6TH2nhDljI98N5/4oOWGqm5Ep2
         2e3xyhnM8m4ipN0nrNkWquXakXY+2VP8oi9DxxP8LPHY1Uyu6P1RkHy0AgB6efhRj37Z
         1C6sIp5nKIgfaMjgXv1xvLakyvJ83Ye9i1o9MwUJJ0nJMAzZfm7Wg2pBIwh6S+/dMUgb
         up5h1ihKOLwJC6cV74ns1avlvJUrEgZoM9tSutVXWqUvE4fI8mwa/CnUpcyGDFfjgOas
         tT44hnIY9R7HQEZLy1t9kUKkXw60pYLLHWPTxfnnzG0/tw9Tcm+aoWePGwYGb/jXJTzi
         J7aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        fh=9NnmKSzZM3C18J1QBanx1h7V4h8Zi9RqsfsPCbQj10Q=;
        b=WZVdfky77mVSDzCxQaLWUxR1Y2nGh6GX9/Xx+9wZBzmpH++E8y3iBn+xoHC6jC6pYQ
         s1s//LYGGaJvlXt5+UNobiKk51ihCAktSBYygc1rzoV842aS3coBKCcTDluXZkjiB9XE
         QqB3vjKmqUiinJ/NllihajwZRqs8fvz0Jl+kWtVKSz2gCwVqOx3bXezWw6i4dwauMWzC
         MRFrVSR0i93gd2sLcYfUdwCGzEnpKD38ohfnse04UJOf43R6KyLWzbLH7EhX2UfTDGA0
         xSIn9iLigTfhgipbTTFFitwjTDdvZBh7P6yaxY8/Rdktk4JMD+9MfuGCglEV549xn2s0
         rHPw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784710891; x=1785315691; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        b=ZG0yG4arDbZiE1nnwoKHrmiG342RscJrSUj4a6zRZNCnxd9hoIRn5lb0ht8LlT2bzB
         qmAIMZ6Yac1IOO4ghySyfa7a4VX5IeyvpPuTx6CO5m1P7dRF7524IVWV9Su85DHk85Nn
         ZZFgANjEIC1xOHhIznJqxwdpjTiQrcUztStWI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784710891; x=1785315691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BVQ32j56Dr60NJMwmM+X8AwJaAcbdmT9panK+KSnLpY=;
        b=Z739QRmvjndK7rZoLWcTxj5L3L02+qKzkZDKfP+VBxud0MxgRl3xIoo2h07g+x3sL1
         rx8ignCA61m8cZeDIYITLXth6eUws1WIVI7rxO9xL51ge/KP2hAM4vl6bnnkqx30AEng
         9cQbWeenObmp+wJ8V5zupBFzcyREBR1Ch0yb6wEO/O8ESfVdYwNmr+p3/QLpep8XtEV8
         Kux6H14+YqPvOV2XoGzJFs9rIOgOx7yIoyl4NUGkBNwCsOhEXEDuWA5ggs3Po0ghlI2X
         uNNii47c6mHECbIq2mLlVj5/Z136PCKPr8Lw+NyFKkOtMnUCSXECaUXeBa209e2fXtZ4
         Cseg==
X-Forwarded-Encrypted: i=1; AHgh+RpH8WeIoYIWEnkzP8ewOitdbX+2YC4tGE9Rbqi9/nhRjGiMaUqmf1/Vf3/pImQyrZ4dIdW0uS7HNo3kMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywz1yGaF83Ylb/fnpDXp4LdaJ/Lt+AxLyPkiej07T1VUbd+ddn8
	uCkr+kLUD+Egb3YQRFE/wBSbjUxDwMdbuQu7i3gCkGqw8z/lhnIFuN2GeQ0pAKrQ+gBXK7ej0pb
	tKw9fR46bDKIkmA1n454on4Sa//gjawy1uwshjS1J
X-Gm-Gg: AR+sD131lA015itgEzlKOO96MEVMOxHgHWD05CGUoGRr2gKJpVYpyU+5OmdL7DW2MDj
	Jc2EP9Qg4OC/Nlu+TziVeGdKaHBgp2NFKSdwEYGyNIqVe5lPJhanlAmzpf/M2x2RS8W5B86QZrF
	FXypkVjOJi+mBay2QwgLvQVESINhhF5l6J+cQSQyq01xDK3kzhj/Doafi63b0UNeCY1rqStezSt
	0PAW/iVjkXFJ7pniwaP9+xTL+yWHdoZjMpL5p2AzvrLnUdBAg8q349EuNkbv6HZFoeKikzlm1nN
	uNdS2jh8YcwLAIsf
X-Received: by 2002:a05:690c:e0c:b0:81e:6a1c:e30b with SMTP id
 00721157ae682-81ef28da7b0mr69266347b3.67.1784710891191; Wed, 22 Jul 2026
 02:01:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260721065413.2306137-1-wenst@chromium.org> <20260721065413.2306137-4-wenst@chromium.org>
 <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
In-Reply-To: <CAMRc=McsCRBxXMj0xC8H0cgdZZ=Z9_4u_DS9b2z0pLE0=gZr+g@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Wed, 22 Jul 2026 17:01:20 +0800
X-Gm-Features: AUfX_mzymMOrnzz3ZSisQQjvbDECVUbqfaXF7TwtpwvIT3XYymwiPHVmpWvFgt8
Message-ID: <CAGXv+5H_V+J0cvrYjMFdKAQVrPKxPdtimXMc+hwHenwxhb9mDQ@mail.gmail.com>
Subject: Re: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Manivannan Sadhasivam <mani@kernel.org>, Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
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

On Tue, Jul 21, 2026 at 5:08=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Tue, 21 Jul 2026 08:53:58 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > The power sequencing consumer API already does power on state tracking
> > internally. Expose the state to consumers through pwrseq_power_is_on()
> > so that they don't have to reimplement it locally.
> >
> > Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> > ---
> > Changes since v5:
> > - Reverted back to returning -EINVAL if descriptor is NULL
> >
> > Changes since v4:
> > - Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
> >   the descriptor is optional, matching the other pwrseq consumer APIs
> >
> > Changes since v3:
> > - Added missing stub function for !POWER_SEQUENCING
> >
> > Changes since v2:
> > - New patch
> >
> > Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
> > as it is a build time dependency. Bartosz wants the change on an
> > immutable branch to pull into the pwrseq tree.
> > ---
> >  drivers/power/sequencing/core.c | 18 ++++++++++++++++++
> >  include/linux/pwrseq/consumer.h |  6 ++++++
> >  2 files changed, 24 insertions(+)
> >
> > diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing=
/core.c
> > index 02f42da91598..72b96d36920e 100644
> > --- a/drivers/power/sequencing/core.c
> > +++ b/drivers/power/sequencing/core.c
> > @@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
> >  }
> >  EXPORT_SYMBOL_GPL(pwrseq_power_off);
> >
> > +/**
> > + * pwrseq_power_is_on() - Queries the last requested state of the powe=
r sequencer.
> > + * @desc: Descriptor referencing the power sequencer.
> > + *
> > + * This returns the last requested state of the power sequencer.
> > + *
> > + * Returns:
> > + * On success, 1 for on and 0 for off; negative error number on failur=
e.
> > + */
> > +int pwrseq_power_is_on(struct pwrseq_desc *desc)
> > +{
> > +     if (!desc)
> > +             return -EINVAL;
> > +
> > +     return desc->powered_on;
> > +}
> > +EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
> > +
>
> Didn't we agree on introducing an enum to make it future-proof for when w=
e
> also pull in pwrseq_is_controllable() from Loic?

My bad. I misunderstood and thought it wasn't needed yet.

> I think this should work like so:
>
> enum {
>         PWRSEQ_STATE_UNKNOWN,
>         PWRSEQ_STATE_ON,
>         PWRSEQ_STATE_OFF,
> };
>
> int pwrseq_get_state(struct pwrseq_desc *desc)
> {

I think you still want this here?

          if (!desc)
                    return -EINVAL;


>         /* Only once this is upstream. */
>         if (!pwrseq_is_controllable(desc))
>                 return PWRSEQ_STATE_UNKNOWN;
>
>         return desc->powred_on ? PWRSEQ_STATE_ON : PWRSEQ_STATE_OFF;
> }
>
> Bart


Thanks
ChenYu
