Received: from mail-yx1-f52.google.com (mail-yx1-f52.google.com [74.125.224.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E228B3D091D
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 13:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783084650; cv=pass; b=PNPXoxmpYpkx5VwIEf3sm24TSlz+pbjsDickljxo4XjXFl7qhhhOky/oXwG5lY6HZQmzYyj5ZUnX53SfcDrrO1TVGi5OHx0qqwJ6YEuvC7hX40SQh9oXJ/JUet1ReU7ictGRFVDww5h+nxz1Y5Uu1NwYHxhg1Re+qybS6XcpgSU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783084650; c=relaxed/simple;
	bh=3AQ8P2Il+2wWlMlJMTJ9+9roF3hePCnmEzgS9nHgr5c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R5C3JS5+qw+f7YjrFJ78xcC4KpCzDtIDl4XKLnUt4qHwCwabZDVnN3OSW9WyTeu3BT08py7GG2GfKFG5VAq2+e1uYKoxajOAYn3E9bc1y0h0XEtKRDIAt4shjyT9i0ExqJLkk/vUVxvgyUlFsNXStbwmWAaZRsL2ipK/IeddYqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D63C9/xw; arc=pass smtp.client-ip=74.125.224.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D63C9/xw"
Received: by mail-yx1-f52.google.com with SMTP id 956f58d0204a3-664b84118d5so847393d50.3
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 06:17:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783084648; cv=none;
        d=google.com; s=arc-20260327;
        b=WD0eYxr+6ZxFkcgkqHPIvojFCKDbHy/EsgCfmQdrXTrK92BkCTxIi/X3EBERzdBOkh
         h3l5LUep8jy23q54bFY+xcv3L2XgBTC5UXDs65mukTJgww8ZSCCFHdBy+21bDEQ1tKQ0
         prk5sKQv+AQ0fADVqAT9ExQZjVq6PT+yGYzkTaHLmGTYe1WhzkREf/lU/aQgtOmBTnyV
         Sp4314LtnivSYeZS03NtYhzjWYdeCcRIvn2Mtp/i9KQWdGApCQm6WmDxzL1eh51uxzQN
         o44c1G8QeGWgfRELYRp12fyoBhEfwmj7Kf1+aDBcaltEeyNjlNIlcllozFLMutsRUge6
         nlBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        fh=TB5QrDi0NUjuGtVaaxshn2wnDaYlgYvyTLv4zWiSefY=;
        b=NVPmjfnRtYWkygf2t20dxrhYF9ibpwaCEPElNc8HaQd8yayS4KnPqWpTBPRcfLV9qP
         g9PU9/t8mKM91WVdqVSyw9pIqHFTVZFoury/+3tuJn2f83IqqDgQXpKt+pufJ4ab/89W
         b7vdbOuuxxFJLvnWOfwfjGKS2NqOlmy/WyX0Z72FpXP3opzAoW5i2b5ZMj2f9HuWWOR+
         VsfpTHR2eTKug8fFPfwmHlYqdbsjrwECQgsANdjOcyD2SIG7Tl67emYY8QfJYe53IybF
         pMNL7NxcoFxW8/dUdMEWHBry5HqXLwQdycGGgePPweV2ZLGmvRQqa0OOmZhN1er6stKm
         lBvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783084648; x=1783689448; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        b=D63C9/xwfdWCJhQgx08UZ+OY+wPff0uwJHnYJZ8WcQuGWeeuZNNmSf8qNwV1577O1v
         K5RZXUROWkX7P5IpRSJjN77H3vFw94Xc9yW373m9mE04tnUeLK1Y1+AJVrMwHFbMYBVH
         68ZbSAF598j8Q4YIXuuG/djCN5BJgppO48lI0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783084648; x=1783689448;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nyHYQJiH0grz6FfspPAI6IMD2L9btQY/X/z4yRA/W0Q=;
        b=BPTIf03ciICQEeSGM1UNwkF9v2HO0ps754ahkCr6u4vgb8ewQHOEbdjIxo5L4SOFTk
         PSiCRwwQcBCGFtXO+9dJeN55485GEf3tgIatv4vI10SAK+UE5YZK7OuA9mqJa7Q4Dtvi
         H6Syf7TvAEkAwqCNheSaaH573HQID/hux0NsLz4ItGmrH2xfQM4lLjU9nd5/Dp0LJsJD
         DLzE8H3KG6epdmdAkF/ita6dFmgRRvhl274pPER0IZ0VXC5ByWNcawwMS1iUEb1tfgqU
         ONDel4GRhWATY1RitCmoWwrdhjSd8T4rI7eM9SF1uD+djctZzu45sfeavt8IHEmIDBL2
         Ihkw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/5oLLDiUbR3k0qEhty6v5baj4XVrRSxNkZNpdvJbvOnZ/CcS2CxlYODeqCz5YEam1cZ3sBC1HMThkpQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YypN8f1Xeg2AwUb+ZRx9qTkZkbft1MzrU+tLcsZ2qrFAmzkEE4W
	9gEOw0DDTnEpaVXmJKLVopz/GVy6j5JEayC4JLDT0uvLcHnz4Qqri87tDo1N6W9dYfZyUX7JYNz
	V30ssTODsYYB5eD0hCMcf4fVQlC7kudy2VT7ltqYJ
X-Gm-Gg: AfdE7ck01zH+62xLgF/Zbe+ZAamQaYELdY1bUFHAsP/QKy7hQSIoTKhL57QRygxx1HV
	uYRsxKyD2VnSxI7rBQUsArlm9lQ2BCi8Po47ObfAlrIvyfOJeE3TqW1mQFWM64YzBd6JRznWL2v
	ushgWN9frrGJ506SWokVgRkH8zU3AiZMQcO2zsoMP+YiuGLAx8eFnTV5T1Eb7h7sTbVklxmVrze
	erPY9qzdUg2irjZ+KrI5XlrzPFFKpWhhJ1wZ7edqOJWTHMgoUpx3Clka3zTJC1LH4xwBxEaETqq
	cszt3HLHlv0AVqHZHFxPu1syrDU=
X-Received: by 2002:a05:690e:4805:b0:664:de7a:a014 with SMTP id
 956f58d0204a3-66521a07484mr6637877d50.34.1783084648062; Fri, 03 Jul 2026
 06:17:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260703110317.1283411-1-wenst@chromium.org> <20260703110317.1283411-7-wenst@chromium.org>
 <ake09vk4fEv1D9QC@ashevche-desk.local>
In-Reply-To: <ake09vk4fEv1D9QC@ashevche-desk.local>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 3 Jul 2026 21:17:16 +0800
X-Gm-Features: AVVi8CfejZEcwq-X4tSLhB9B5zlOpwIE7AknFvssi26xknUZgb1hl9QfxXck8os
Message-ID: <CAGXv+5GNucSXrhL=YxarSJHD2ezzYDK3EovFu-zy012KgZ+ZBg@mail.gmail.com>
Subject: Re: [PATCH v3 06/13] usb: hub: Pass |struct usb_port*| to usb_port_is_power_on()
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <brgl@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 9:11=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Fri, Jul 03, 2026 at 07:03:07PM +0800, Chen-Yu Tsai wrote:
> > usb_port_is_power_on() currently takes |struct usb_hub*|, but only need=
s
> > it to tell if the hub/port is SuperSpeed or not.
> >
> > In a subsequent change, usb_port_is_power_on() needs access to a pwrseq
> > state tracking field in |struct usb_port|. Either structure can be used
> > to identify whether a port/hub is SuperSpeed or not, as the field in
> > |struct usb_port| is inherited from the hub:
> >
> >     port->is_superspeed =3D hub_is_superspeed(hub)
> >
> > Replace usb_port_is_power_on()'s |struct usb_hub*| parameter with
> > |struct usb_port*| so a subsequent change can use it.
>
> At a brief look this will be the only function that takes usb_port
> instead of usb_hub in the entire hub.h (I don't count container_of()
> as a function). With that being said I would rather see it to be moved
> to port.c altogether (yes, it's more invasive change, but looks more
> consistent).  I would even dare to move struct usb_port (and container_of=
()
> accompanied with that) and this function to port.h. This might require
> a separate patch, though.

I agree with the reasoning, especially given the function name. However
I wonder if it would cause problems given the linking order. I'll give
it a try nevertheless and report back.

ChenYu

> Perhaps something like: 1) "move struct usb_port and associated APIs to p=
ort.h";
> 2) "...this patch...".
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
