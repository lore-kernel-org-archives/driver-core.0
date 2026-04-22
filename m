Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC383EF670
	for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 19:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886875; cv=none; b=n9XAl4efxpoJ70kFDC/veM4jQtHeIYN6t5ZnN/LUDT/KymD0lh9WkOv35DO+cqtGAijZatM8Djhlf1KrazMdwqNMus0+lgZ2bXs/INfSlNoKbWrg3L9WQPBfm9GyKfWvewdjLfxetLixjTFbObwrGUEAKYY4vmrQjqHyMcG6rT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886875; c=relaxed/simple;
	bh=1jDHS3//SVF2/A/vC8oT6/lwq+kdzpM3dPjKRF+cWNI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=loTu4AGbV9FL+t/3fYr60MfSgDxlfGHV3bdjs5J+MI1gPjf7haD6WaI2OJV8IZEkjOzjJ4CcqWrh8xQdA2CYuC8/bJjyWlODGrdjKInXnfLIuJWLzVeexcxAexrapbCDDG2aWiX8EN9Snt1RSv2UxWhcxgFSa0CLxWCgYIrMX0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=QHOITFnT; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="QHOITFnT"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-671dad7cac8so8693103a12.0
        for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 12:41:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776886871; x=1777491671; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A8JHz3Efp15Ndyc9pOP3Ax7qZyPD4IXnQM3cK5pq58E=;
        b=QHOITFnTnHLVdzsfsxZNiMwmLRx9dh8POEhoFtvLN89iI0I7LVBMSH/zjBDRSdDZBQ
         yx3EEZuJbiyVg+FO1fPm/W3j0Y4v4V9+5bj/MM2ajK5Bu4rMMKuMm2H4IM++1AEDs1KI
         ZBeM5JVea3X0kfN185gQ4CqL+k9WGvnxu/9BE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776886871; x=1777491671;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=A8JHz3Efp15Ndyc9pOP3Ax7qZyPD4IXnQM3cK5pq58E=;
        b=ZiAUQf9PiAsFrCiQPkGQXuABFxNllb+9fzEHvir+oFgwVguqlvtWk0hK4dke6FT9Hw
         FfAi3E9TL93KFiT80BNEnUa4KabZ5ZG76jQ5Co39sJDKCJrURBRnI3HmxjQzuGxALLKR
         AX4Sfjga1HLGYLGTrp9m/ArZH6j+xWhxpyb99DoOtHvyRUSe5UeU6eRDpVbjOXj6eqAi
         nHWZM49TXv8EqMh9ZYTJ0va0RMp/9YO4T0NfyamYVl/q9hhpcgYgO5SpFc1fVJ9p9DI8
         uwK4WhKxdbZrcTp0pXQrwYi2NvskCsjipVDiRVswKGDSCFpdVQ3W8eUAtIVPqfxWUnw4
         7FSQ==
X-Forwarded-Encrypted: i=1; AFNElJ//d8d/lko8JEoVNX/8PLiT6e9DlZLeOxJQYzP+2d4Cusu2XgY5EwDuUBZbkZJzJZEm8g/ctACwt48WTA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6l+Sx3dBe4gGmyKxbHV3PCrpYeahq6LZeSfiWrv0E4Ko1RuWl
	/WMVClf8hD3xx1feOOM9DyWHAtrXXELCUw+vGXNwhmBWE9HJ8kCympIdKy+8qfPFfv5sq4DX/IU
	ty3bdBs96
X-Gm-Gg: AeBDietH4mYH0SPAqBfg2ryNfg8X7gzv9rNc7DbmDhYMVZ1xyaDmqSPARB4jQh983Hr
	OXo69b/LzTlT1HDPz1OGaDS0GtX9PSZF6rtLH5rZjDgb+y+H4utswSGDzAVIQE0Tr/TgY2LYw0L
	9fxLBAE3sYdVA03LgWMvJT8rkSxgl61XYW4aYkBv4snf15n6LHG9VV0MU6Ye1Et6jnVXU0WiCKo
	K2ZGtV9/CE7xNyv86Da6VE5qCYnnIQb6URlbM7ltIyScTvcjIhIKrVSQeDw7mw0MZ0sD4GfWk5s
	EwQJNjMOqWzC6tzwGC4NpgsItpQyonvPeg7MJBHQ/BLNbVDydOpzIaBDer3ZghxQPW1hCDKx7rJ
	tcNsq7Earcz7UGRu62p1QITUzddwIKsvZE/DHrPecPHltqTPBBRM3O/Zs/Kkp2yjBa+BMDS53J6
	mK3osu5Y/PeYlZAS0GG5NwHbmLUiOhwJOHyHJ7Pe3ZungNQyUGNgIsJjLICa8NEb/E/KDuthuu
X-Received: by 2002:a17:907:7b92:b0:ba5:391e:20f0 with SMTP id a640c23a62f3a-ba5392d6e53mr1076966766b.42.1776886870689;
        Wed, 22 Apr 2026 12:41:10 -0700 (PDT)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bd24sm571704766b.32.2026.04.22.12.41.10
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 12:41:10 -0700 (PDT)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b941762394aso807426166b.1
        for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 12:41:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ87K/9C8MC6XOSj+1XBHRDSy1JCi1JSaH/+3s/qFdnv4TCnqICdQkGsU7PAXFqZ/5nj1GZ8BH0PZRvM1Q==@lists.linux.dev
X-Received: by 2002:a05:600c:4714:b0:48a:5574:3a5b with SMTP id
 5b1f17b1804b1-48a55743d05mr122645615e9.27.1776886533988; Wed, 22 Apr 2026
 12:35:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-3-herve.codina@bootlin.com> <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
 <CAD=FV=UK3NQKQN7FXyG4nGdDKO=LQYhnL4ZweomQ_4R9-EAYag@mail.gmail.com> <aekg_IELc65BFrWp@ashevche-desk.local>
In-Reply-To: <aekg_IELc65BFrWp@ashevche-desk.local>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Apr 2026 12:35:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XTvvq11y7kxmrfBe3dZsKro7N9=i-Hj9aqsLBay2Q9Rw@mail.gmail.com>
X-Gm-Features: AQROBzBA2DSdR2HBaIYSKp4MrG-iWYSiPDxUw6OYCOPyJYNxN20LzPXgyZNheJI
Message-ID: <CAD=FV=XTvvq11y7kxmrfBe3dZsKro7N9=i-Hj9aqsLBay2Q9Rw@mail.gmail.com>
Subject: Re: [PATCH v6 02/27] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Herve Codina <herve.codina@bootlin.com>, 
	Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kalle Niemi <kaleposti@gmail.com>, Matti Vaittinen <mazziesaccount@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Andi Shyti <andi.shyti@kernel.org>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, Peter Rosin <peda@axentia.se>, 
	Arnd Bergmann <arnd@arndb.de>, Saravana Kannan <saravanak@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Charles Keepax <ckeepax@opensource.cirrus.com>, 
	Richard Fitzgerald <rf@opensource.cirrus.com>, David Rhodes <david.rhodes@cirrus.com>, 
	Linus Walleij <linusw@kernel.org>, Ulf Hansson <ulf.hansson@linaro.org>, 
	Mark Brown <broonie@kernel.org>, Len Brown <lenb@kernel.org>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Davidlohr Bueso <dave@stgolabs.net>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Dave Jiang <dave.jiang@intel.com>, Alison Schofield <alison.schofield@intel.com>, 
	Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Shawn Guo <shawnguo@kernel.org>, Wolfram Sang <wsa@kernel.org>, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-i2c@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-sound@vger.kernel.org, 
	patches@opensource.cirrus.com, linux-gpio@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-spi@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-cxl@vger.kernel.org, 
	Allan Nielsen <allan.nielsen@microchip.com>, Horatiu Vultur <horatiu.vultur@microchip.com>, 
	Steen Hegelund <steen.hegelund@microchip.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 22, 2026 at 12:27=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Apr 22, 2026 at 11:51:36AM -0700, Doug Anderson wrote:
> > On Wed, Apr 22, 2026 at 10:44=E2=80=AFAM Geert Uytterhoeven
> > <geert@linux-m68k.org> wrote:
> > > On Wed, 25 Mar 2026 at 15:36, Herve Codina <herve.codina@bootlin.com>=
 wrote:
>
> ...
>
> > > > +               if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
> > >
> > > After commit f72e77c33e4b5657 ("device property: Make modifications
> > > of fwnode "flags" thread safe"), this must be changed to:
> > >
> > >     if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
> > >
> > > With this change my DT overlays are working again.
> > >
> > > I guess keeping the FWNODE_FLAG_* names, but changing their values
> > > from bit masks to bit numbers was probably not such a good idea,
> > > as it fails to catch missing conversions...
> >
> > Crud, I should have thought about that. :( Do you think it's worth it
> > to do a rename at this point to catch future problems?
>
> You can try locally with allyesconfig / allmodconfig and see the outcome.
> If there are missed cases, and their amount reasonably low, I won't bothe=
r
> in this case.

I believe I caught all of them at the time of my CL, but the problem
is in-flight stuff, right? I think the problem Geert is pointing out
isn't something I missed in my original patch but rather an
interaction between my patch and this in-flight patch.

> But for the future it's kinda rule of thumb to rename when
> semantics changed.

Noted. I've certainly done that before, but I didn't think about it in
this case.

-Doug
