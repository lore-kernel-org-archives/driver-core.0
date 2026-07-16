Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5323AE6F3
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 09:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784194773; cv=pass; b=gcyKF66YrpK+P9JRljwuUvKLA0BvGJjPTvPywniWq0sUPcl4TqEFanAywyygAgfdmgKnMhYhPNe6gYt0sp7shxKCApir6AZ0qKy6wWsRGL03qCQrkD4Sax2CugO1K3MBHXoIpHjZ9/vTUkCLwoOeFIi03Do68LlJGuCtytKnHOc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784194773; c=relaxed/simple;
	bh=r+ToMI4+W+lt99JNWQfbUojCN1C49muMQY3/rKthzsg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=txwcd0oj+KwK/IqVrrAHLvwhWEJ8M0931G7vaUYef7BYiQ4HErgYyDimGn/1FY1zTeenNKIejOCKwjlOMcsG2VCYtH7UP7DHBATeLPV9PMmUP2HrD+AAbAbjacalHy9UsDZXA3pH+C91o/SLYDD3wc63SgOCYDjxaQTXF1TYglg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=KOwxQ0yu; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KOwxQ0yu"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664c6304683so2851587d50.2
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 02:39:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784194770; cv=none;
        d=google.com; s=arc-20260327;
        b=so6l+NOhmQpue5p1BOUmsV6ZJkj6Bn20wIiMkrxPQorc65zrAPQUGXTxaA4ZZOLTlU
         O317GmC4+J6WHbuNh7wqTYBhlPhxpInL0BA7vgjlL1yFCXjYlGoEmlWVAnsAX84jpU4E
         LrxmMAF+pHzVzf5+Pe/GkJE1wJzn145PPIM2+zDDEzB9QGdfZcn3zOHA8u72cies06G0
         KUQe4kDiJr6Q/PsIlAZf7ZVs3vioVBnMYivJuo2o2Yh2+OnGH+S1RQDfX3otF1pTquRx
         E3ZzLnYJ5KzEq76An0ZPLkR8YRBFpUvswLney9Y1LZj/LHx9KeRL16qcYyUHaYtxvTbI
         ElhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0CHRQwxG2g8NAYPuVqgPl5XkBCDxSDwrk5H6G4V1gVk=;
        fh=ivkM0hG3n8FWJlLtX5W6IT9mifFKNpy/HoUn2KFnXMM=;
        b=VAPjHlE9o8xxp334YFAyiEcaWvh7JkTKyIMhduU/6SLebhuLZ7TKeA41Bf8oJwPi5C
         e/yXbOqhNmjWiwHjjc3qEnuO4stVhx3mhj/zpsMKIcZNGyu2aeWU5SKATz7op3UiIvtM
         gqE5rO1WRz0zZDosSBZd+03E6t1tgLdWyLTh9hamlOTUCoNQGnHcLNeYZGDf3grF0dgA
         DJnerEKWABy8Lq+Cbq7l+UAsk9+zpBDdegCASAAP5CvNVd/olew8iXsY1oPcGs6lUU6i
         SQ9lHyeoXlKHF2Kw9tgjIfoYJ0m+JUL0vXoYJjIe45el7Z5Ruw62nAgp4nJ9V2mEZDwT
         pjag==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784194770; x=1784799570; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0CHRQwxG2g8NAYPuVqgPl5XkBCDxSDwrk5H6G4V1gVk=;
        b=KOwxQ0yuhb7tW6KrgLyW0WMTERr/sY+OlB3LLs5KzEyPPvH4zE6mdBI18H1ORdp+xO
         e6C3gC2biRnQc9BhxUYtDRDMqZnmooUsrAF/ZM6fU5v5UsdNPSVTmAhdhzGkcXYfyQq5
         zG24av+GWNYYudInxPBOkJd2HL/hyEVJLNu8g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784194770; x=1784799570;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0CHRQwxG2g8NAYPuVqgPl5XkBCDxSDwrk5H6G4V1gVk=;
        b=PEY8pXjAR8PGbKwKUHV+T8aikWLJ0wIkXQCIeH6PkFMF7vXj0nyRs2Lxd+AjuBGJlE
         7E6ShwZXLOGwcehfxeBnjX4ZoSSMKsc5N+Auyr7vDDAmNUnb/GugH7VJp8Ow2WdZ2TDj
         DOgDOXfETici31Ya7wg+5ESxzh2rs8RarkZGLyExep1bD0vSlmn/HyGnB3Vh9qupJ628
         SPj6/eU2YgIUXKV+7hzeGrYV0yzamgxP7riBj+Y45cYuSS0UY1tSPY4ule8lVCS8iUgV
         ulvRJKYz84HGdhhIQdBeSuYFin9kZfNBE4dgiTz5XBDbZK7q7bWj3lk2nt7TIaPbrLuL
         mvSg==
X-Forwarded-Encrypted: i=1; AHgh+RooiaDxNSJiJvJudGpnD9syvpw/9OeaagFvcvYQqyDl9BjG5ayeRMevCXXX2FfaCYWAuljI+K6js2Bzog==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMZSHw/QITlTTL4tFFD4FDASKIWQ4+WF6LQuGU84gcMn7raXLU
	NcGCw0yaiiBc/mGXr4gr3Nv1AWY0Woju40r4/G0OCwRQC56pS3i9/F0t04OnADz4Vn9lpu3k6BH
	gD3ntG0Ah+QwaSvxs079dF2Jz+2mW2RXwNCZoRYFG
X-Gm-Gg: AfdE7ckm8a/qwQG9kTdtH4ot7gExdjtv7ZaMs2j6mBjC5k1/36wy9JN7HKLM+sH6+o2
	6TSo8CEEA3elCeNy9KWTp+ZMkHCEBXoKLY/UgKs204UQvUt+8TBkAjYuGqJKZAiULetSN4Txo9c
	xaPZYOo7ucLTxVguMHNk7Vt09oXEY+dUKwqhQwiGId5n7RpbV/G+Fv+bAhC7eYkfa9165e64pKl
	g1mNErOze45PKPVkw/4fg4aGBerhUe4oJ0IpYWXuQvFIux5vxVkokE+VNgPRrKzO37TOP7JplZ9
	9bn398H1H4+poyJG
X-Received: by 2002:a53:c80e:0:b0:667:bb38:d969 with SMTP id
 956f58d0204a3-667d7b0060amr9599454d50.16.1784194770410; Thu, 16 Jul 2026
 02:39:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-4-wenst@chromium.org>
 <aldS3qTympJuVXYj@ashevche-desk.local> <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
 <CAGXv+5HGjGTrqqzJrpiQhLrCn3C6H20LXq3niPnoujQLOwgqPw@mail.gmail.com> <CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com>
In-Reply-To: <CAMRc=Mefxn81d0VUwmQgwFtffkL1=Er_1VQZCbC1Sa-Qph4t1w@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 17:39:19 +0800
X-Gm-Features: AUfX_mzbe7WMgo0cPdR-Yi-m3qfqJETc7DH9Y1NWKQqSMqgCgHS_ReKsQ1v2DI0
Message-ID: <CAGXv+5G0Ffrh-8UohJuGPQ0e7KGpy11=X7t1JtDYLTJ_tZgMCA@mail.gmail.com>
Subject: Re: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
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

On Thu, Jul 16, 2026 at 4:14=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Thu, 16 Jul 2026 06:59:01 +0200, Chen-Yu Tsai <wenst@chromium.org> sai=
d:
> > On Wed, Jul 15, 2026 at 8:10=E2=80=AFPM Bartosz Golaszewski <brgl@kerne=
l.org> wrote:
> >>
> >> On Wed, 15 Jul 2026 11:29:02 +0200, Andy Shevchenko
> >> <andriy.shevchenko@linux.intel.com> said:
> >> > On Wed, Jul 15, 2026 at 04:53:33PM +0800, Chen-Yu Tsai wrote:
> >> >> The power sequencing consumer API already does power on state track=
ing
> >> >> internally. Expose the state to consumers through pwrseq_power_is_o=
n()
> >> >> so that they don't have to reimplement it locally.
> >> >
> >> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >> >
> >> > ...
> >> >
> >> >> +/**
> >> >> + * pwrseq_power_is_on() - Queries the last requested state of the =
power sequencer.
> >> >> + * @desc: Descriptor referencing the power sequencer.
> >> >> + *
> >> >> + * This returns the last requested state of the power sequencer.
> >> >> + *
> >> >> + * Returns:
> >> >> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
> >> >> + * negative error number on failure.
> >> >
> >> > I would rephrase it a bit.
> >> >
> >> >  * On success, 1 for on and 0 for off; negative error number on fail=
ure.
> >> >  * If desc is NULL (means optional) return 1.
> >> >
> >> > And this rises a question: why 1? Shouldn't it be some "unknown" sta=
te?
> >> > (But since Bart Acked this, this doesn't prevent the patch to go, yo=
u
> >> >  got my tag above.)
> >> >
> >>
> >> No, this is good feedback. Maybe we should prefer an enum like so:
> >>
> >> enum pwrseq_state {
> >>         PWRSEQ_POWER_UNKNOWN,
> >>         PWRSEQ_POWER_ON,
> >>         PWRSEQ_POWER_OFF
> >> };
> >
> > Well I think the crux of it is whether the API considers the descriptor
> > optional. The power on/off functions suggest that is the case.
> >
>
> True. That may be an inconsistency of the API contract on my part. There'=
s no
> such thing as an optional variant of pwrseq_get() so perhaps pwrseq_power=
_on()
> and pwrseq_power_off() should be converted to returning -EINVAL on NULL
> descriptor.

OK. I guess the other resource subsystems allowed it more as a convenience
to consumers.

> > I modeled this on reset_control_status(). I believe the rationale is th=
at
> > if the reset control or pwrseq is optional, then either there is some
> > other mechanism to deal with the reset (GPIO) or pwrseq (GPIO + regulat=
or),
> > or it's always on and operational.
> >
> > In such cases and the rare case where one has to query the state, the
> > queries are possibly chained together and I think it makes sense to
> > assume the "operational" state as the fallback.
> >
> > If this returns an enum, then I think the previous approach of returnin=
g
> > an error value for an invalid descriptor is better. One doesn't need to
> > learn a new set of return values.
> >
> > I'm fine either way. I would just move the checks over to the consumer
> > side. But I think the principles guiding the overall API design is
> > something you need to provide:
> >
> >   - Is the descriptor optional? What should the action functions
> >     (power on / off , or query status) return when NULL is given?
> >   - Is the subsystem optional? Should the stub functions besides
> >     pwrseq_get() return 0 instead of -ENOSYS?
> >
> > Right now the API feels like the descriptor is optional but the
> > subsystem is not. One has to add IS_ENABLED(CONFIG_POWER_SEQUENCING)
> > around the consumer API to make it an optional feature.
> >
>
> There's one more use-case where the power state trully can be *unknown*.
> Please look at the proposed new function from Loic[1]. Here we deal with
> targets over which linux has no direct power control even though it may s=
till
> control some of its dependencies. This is where an UNKNOWN state may make
> sense.
>
> This is where I also floated an idea of renaming pwrseq_power_on/off() to
> pwrseq_vote_on/off() for better clarity of their purpose.

OK. Would it make sense to revert to returning -EINVAL if the descriptor
is NULL now, and then add a different error return value if !controllable
in the future?


Thanks
ChenYu

> Thanks,
> Bartosz
>
> [1] https://lore.kernel.org/all/20260710-monza-wireless-v3-3-46253587af64=
@oss.qualcomm.com/
