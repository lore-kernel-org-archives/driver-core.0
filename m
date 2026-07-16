Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1A730276A
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 04:59:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784177954; cv=pass; b=nEsNQr+ofNLJ7gZgx3oZcDo0RhauKp6wLm7DJgTY9ypfpVMbAkSQy32bia/hQ8iOKwQr6W/aoQVs7Q6xMGsCULHrmmBr7paLzNXnE2+gErMro71XgqH1yhqWM0K2kcgxofBlM3apxj6e0ib5ZxcfbpU9iqvryjgqfUZMKJ0LSlg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784177954; c=relaxed/simple;
	bh=wYBaQ8XwVTIMSwIIpuk8mhwuYTe+2pxVToi3w/umSE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LAqWWeAxCzMH0Uxs6OeZ87dLH23ybMCarSHkpi71A5il3fLXCUwRo8kOeEZl7r0ZgjenjqNUE2IgRkqmm59FmLPmW1A/V1BUpug96/0RLlTs5q2lufaGkxHaH47zB8dRn7/0bzRGiDq/pjpXyqiIdeOh6itv3x++dXNPY4/6rAg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VoEdQ9WD; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VoEdQ9WD"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6682259cb3dso401492d50.1
        for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 21:59:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784177952; cv=none;
        d=google.com; s=arc-20260327;
        b=BBFiHHED1Gxx/Iw7W6bVXMtTuUt2CWQbLZbN5QHC4CReG3ssKeFgoJmOrNcjB0tUeK
         4kdi/q0k5EaJEA/jWlO/ULxwF0v7TPGOY7sY++3JXMWEvc75eDr8t2X0Xq+/g9TQ4tu5
         6MahFLPwz7veI6/nKmqcm1J+6dlUzMJMh2c6C0nvCS+jzc1f9S6jdQpDC6jz61HJf/dD
         KHYhy8h/KCrq+FuULWiEwhVMhtdMEgxlwqARFRKz4nO5X0XxGzxaIUcMxXzb4u3i079c
         XMOns4BjpAgZfJO0qX+Vp4A857b3rg8PjL4ZUDKIXL2t6RSAnRyMuswz7It68Xbc0Az/
         bfjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        fh=bCsAEoLpATic/WNZzispEJD1Iql4HZC6FlzIK1f4Z7s=;
        b=kYFSsWvb5kotrOpaqpy5D6Cn31EamUFMVscBpB3UMM/ltNP6RpaO7I/9SMGXZB+hzV
         f7Jkc1eiRRQQUIljEqVBriENQ95dNbYIMqdgrc4qCB4sZ+xtGbkmMQy9DU55Ya50zyve
         X+1kDxm+vgVsEZLHsiqA9+L3aVjZptOKGlIftsv+IEj/yH8+9awscgsH48rcgw3WZj9H
         GJJkIZBkRTvrb2byvG7Y5hRRfwddIMAhulp5OIDUooZHRD9PXn61W5665McdpV2UbalJ
         ezdGRC5A4YUpXKyMwwXi3iY+eAMAacMf7YygRhIZxutujoYdRP7Ew8Yxy6yf/fQL2aqu
         birg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784177952; x=1784782752; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        b=VoEdQ9WDFzUFf9JelxGRxpVMbm5CxG+F53hFuRgi9mjIq4afHGa+y2lSUZ38YhlmDg
         FusGcAkZPQLIsn/zTx0J++MamLbRJt5Fi4p8FQ6lqlQq8bxPVuqlI87+yfRVNPvxYMfF
         3R019lq2qu6isPjfArlrOdi4pqaTHcjxWMgMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784177952; x=1784782752;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Z8dI52NQd5mdA4AuWKzP1mtoK+n7nzP2uY77NXwFDCM=;
        b=KaKc2yk9W2hN7DwblhZMwxeA6lqzhL0C652K8wSBBEE4Aw9pqq0KuUCf/0mJ9NEG+X
         ecYCXIMI3P7QlF16iOmCBgYdn7KC2lm3fzA7nCJ2UGFpBzeVLMw5W//k/eTHM0FIRsdV
         NHxODGdiEHcU6c6YUkbNs2299cErpSsCtnr3oBLIn5iL6NRzbooPIeZw0ljnbXMKBSWA
         v1kODO0JnVsj9UuDkf0LOXqMTFkEwB1ddxp5UQDlv12YWauyyhzZ6x/ttHj1bRaSyovl
         S5hJ2JDgj9QT7aA4ZTv7hU4nO2LBrsNJxmBnM4ERMxx0hoR+GTkgVNHZXO2AmgfpCi1R
         M1gw==
X-Forwarded-Encrypted: i=1; AHgh+RoBPGAGr+Hl9sKwYAbkLfc0gePApPgKAOV+NV1nbHhNNDmk0kIbQ8YWZd38ksEtThG4dCTlEOiaGrbWOw==@lists.linux.dev
X-Gm-Message-State: AOJu0YygpEc0JZrLsgR/2/SuSag5PUdwnqv7PV1caWBBKfTQGaiqVlly
	FVlQ/jeB8N14RsnLpAdxj0FtW7mS1U2WmDKmIFCou8bpaIQQDXnOKZMeK/jrJ2q/vsHKgtWZfs6
	OViEuXqIzG8YlGvzYsvyQP/DQhL4lQw+NfQISA6EC
X-Gm-Gg: AfdE7cmvL6kpbn/4zAzHuEVwj1i7eEm1hJvNlHDg8SQ2PJYIc/MFN/koTOU5GFNoC0s
	g2j8MEut+AikiRTZt2+8qXIHAbST5YETWnYjFGpAdNhuXIfblwlgOM4jqEuHUUPeDfc1uuEFmDz
	WtvhkheR6wdXbk0Mwd3MMvn25B5H1YCmaCYz9JIz64/9aB3SIm+2EBZi5Knl6mbpbNy5PltKmTY
	i0uRmfgVFALOouDeIc1PZ0wLb3o7r4WwMrT+mEudfGZthNS+2eCIfVHo7z4QLV43CBMo7MX4fOW
	7y2WAg5SopVQDsrL
X-Received: by 2002:a53:b784:0:b0:664:b559:d524 with SMTP id
 956f58d0204a3-66829f39e58mr611543d50.4.1784177951944; Wed, 15 Jul 2026
 21:59:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260715085348.3457359-1-wenst@chromium.org> <20260715085348.3457359-4-wenst@chromium.org>
 <aldS3qTympJuVXYj@ashevche-desk.local> <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
In-Reply-To: <CAMRc=MfHmejks83bPfe3fKzAzFySGXk2GHMA9oZdMQj0f44eTA@mail.gmail.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 16 Jul 2026 12:59:01 +0800
X-Gm-Features: AUfX_myfMUyRbxWwYQRsbuThILT6idiwmNtqsd830qG3sUgPLjemD-RPoobAiuo
Message-ID: <CAGXv+5HGjGTrqqzJrpiQhLrCn3C6H20LXq3niPnoujQLOwgqPw@mail.gmail.com>
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

On Wed, Jul 15, 2026 at 8:10=E2=80=AFPM Bartosz Golaszewski <brgl@kernel.or=
g> wrote:
>
> On Wed, 15 Jul 2026 11:29:02 +0200, Andy Shevchenko
> <andriy.shevchenko@linux.intel.com> said:
> > On Wed, Jul 15, 2026 at 04:53:33PM +0800, Chen-Yu Tsai wrote:
> >> The power sequencing consumer API already does power on state tracking
> >> internally. Expose the state to consumers through pwrseq_power_is_on()
> >> so that they don't have to reimplement it locally.
> >
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> >
> > ...
> >
> >> +/**
> >> + * pwrseq_power_is_on() - Queries the last requested state of the pow=
er sequencer.
> >> + * @desc: Descriptor referencing the power sequencer.
> >> + *
> >> + * This returns the last requested state of the power sequencer.
> >> + *
> >> + * Returns:
> >> + * On success, 1 for on or desc is NULL (optional) and 0 for off;
> >> + * negative error number on failure.
> >
> > I would rephrase it a bit.
> >
> >  * On success, 1 for on and 0 for off; negative error number on failure=
.
> >  * If desc is NULL (means optional) return 1.
> >
> > And this rises a question: why 1? Shouldn't it be some "unknown" state?
> > (But since Bart Acked this, this doesn't prevent the patch to go, you
> >  got my tag above.)
> >
>
> No, this is good feedback. Maybe we should prefer an enum like so:
>
> enum pwrseq_state {
>         PWRSEQ_POWER_UNKNOWN,
>         PWRSEQ_POWER_ON,
>         PWRSEQ_POWER_OFF
> };

Well I think the crux of it is whether the API considers the descriptor
optional. The power on/off functions suggest that is the case.

I modeled this on reset_control_status(). I believe the rationale is that
if the reset control or pwrseq is optional, then either there is some
other mechanism to deal with the reset (GPIO) or pwrseq (GPIO + regulator),
or it's always on and operational.

In such cases and the rare case where one has to query the state, the
queries are possibly chained together and I think it makes sense to
assume the "operational" state as the fallback.

If this returns an enum, then I think the previous approach of returning
an error value for an invalid descriptor is better. One doesn't need to
learn a new set of return values.

I'm fine either way. I would just move the checks over to the consumer
side. But I think the principles guiding the overall API design is
something you need to provide:

  - Is the descriptor optional? What should the action functions
    (power on / off , or query status) return when NULL is given?
  - Is the subsystem optional? Should the stub functions besides
    pwrseq_get() return 0 instead of -ENOSYS?

Right now the API feels like the descriptor is optional but the
subsystem is not. One has to add IS_ENABLED(CONFIG_POWER_SEQUENCING)
around the consumer API to make it an optional feature.


Thanks
ChenYu
