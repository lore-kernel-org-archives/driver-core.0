Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629403F7A97
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 16:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775148028; cv=none; b=nd6XqzqqTbzL61IwCtbPDR5weRC+ZU6NqOu6dq3opPKQrM986JHb0MSRJ/kKK8T8IDjamK0g2nPEafMhCpqgMpjLeaLrptSCDIrQRJUmEohI5qIMkWVfafmZ5lbtHWt7Um5vYPXA8hKMjaYqWNBM5KwWkcNjWe8lYx394G7kmi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775148028; c=relaxed/simple;
	bh=PHhMkTf2PU2A/KjRZXugaP//8msg3BdPHebsYhl2y/8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwaQQfqXFeYjumXPGpIipZVfDa4+cXZd/JoqlqgzHKS8SAGSAyPvV7UFAYOyGowrNXwPxnxpz9aka75BTnvFFuEfgz1UbUjCtR75yk9QiUxzwvar+leXZ94/YFUpBvZsyp5el7hF8QowOgZ3YpZzJ6laQDVON62KNaMDmDJHjL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TsMCPL7t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TsMCPL7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3B85C2BCB5
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 16:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775148027;
	bh=PHhMkTf2PU2A/KjRZXugaP//8msg3BdPHebsYhl2y/8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=TsMCPL7tghpd8b6T1aKbMzE8xyfe4lMsnJ5NglogqhkgZy3r/PY6/f+HleR/T5xf4
	 u8+mLB/6DnKyKLGcoH2+hr4J0E/HPGvQCqDbRH42waBiTVavcqBIaLDahdPoK7brOz
	 Nn/ld5trd9dmDFKMHU4G8Zrf2DhW/RmFLLdkA+TcRz03K7hoDRvgsTN0Ho4wKe+eYP
	 mOAhrUsfiVeozHlaq8O4S2+9jgzshuHzUaiyXO2ohjvjZU7lDlZg1Ur5/+r6sJAtL0
	 GGH0xMyc16QmcQ84zpwlxLsleoMHiqAhBBco4YVBidWq9BCbVib1yR8bOFrnzGrxnx
	 RGFGCF5xt5qgQ==
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5a2c77c62d7so1000012e87.0
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 09:40:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXcaRUos1G7IsYgSjzFgINfN9tSH1LsIzkLWPcUmKVYvSjMvINp/dMQ2EYKNHHa1PA7VremmvlpEH+d3A==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw55ODNJPd+GCCih0n52nmKWgTbXgTBiNFjbncm47BYps9oDD7L
	yIsa8b+lvlqAB0QWXVLGS1/+KZgBZheG77UwQbq2lW6m0qEqfIcu9PrApRFvywO/HXxek6aNdsY
	V/1Xv3gkBwGiCY9tzPom9y5teIkd48cn3Gp+lEMN5wQ==
X-Received: by 2002:a05:6512:3d0f:b0:5a2:ad98:366f with SMTP id
 2adb3069b0e04-5a2c1f195c1mr2697582e87.20.1775148026537; Thu, 02 Apr 2026
 09:40:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260402-nokia770-gpio-swnodes-v5-0-d730db3dd299@oss.qualcomm.com>
 <20260402-nokia770-gpio-swnodes-v5-1-d730db3dd299@oss.qualcomm.com> <DHITFGL3J4IE.2WZU3K2CSYL7I@kernel.org>
In-Reply-To: <DHITFGL3J4IE.2WZU3K2CSYL7I@kernel.org>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 2 Apr 2026 18:40:13 +0200
X-Gmail-Original-Message-ID: <CAMRc=MfAet449-uH9P-wz1FMLbsmNGCwtwWLRh7=RBrO+v3p-g@mail.gmail.com>
X-Gm-Features: AQROBzAduHOivprlKvhzUpkoRpQrf9dg2jV6hNu93i72s7Oqo9MWAkjXkw22YpE
Message-ID: <CAMRc=MfAet449-uH9P-wz1FMLbsmNGCwtwWLRh7=RBrO+v3p-g@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] kernel: ksysfs: initialize kernel_kobj earlier
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 6:39=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Thu Apr 2, 2026 at 4:15 PM CEST, Bartosz Golaszewski wrote:
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0f258aeeacba184d2025b932d90280cf2aabf4b0..8bc934162e712cf8ddf033e=
53bf3481054cfb7fe 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -7843,6 +7843,7 @@ F:      include/linux/debugfs.h
> >  F:   include/linux/device.h
> >  F:   include/linux/fwnode.h
> >  F:   include/linux/kobj*
> > +F:   include/linux/ksysfs.h
>
> Currently, kernel/ksysfs.c is not listed in the driver core entry (it is =
not in
> any entry), but I guess that would make sense.
>
> So, we should probably also add kernel/ksysfs.c. :) But this can be a sep=
arate
> patch independent of this series.

Ok, I take it no need to resend this?

Bart
