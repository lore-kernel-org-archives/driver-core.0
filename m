Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D572DE6FF
	for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 18:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776883920; cv=none; b=okQXcQfDhDY+5m9Jflx349LbsC+/kfid0NK+Jr/Lu2P8i4b1i+JYEay9wzvmPECpclIyZyAloHK6C92sXFvn3aC8DoSj9kFooLo++UzaDAh9erb1BeXBXDa1vfy7gFnYdLlWM7OqbFQ9D6MG54sBzkbUfamdKoK+NFcvofthHL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776883920; c=relaxed/simple;
	bh=W3gJGhETv1i99hgZ4Qzxlq7+a/rqAi15n3RaJvZubfA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EOuxUAPqRjbOcHayLYj8iaXYptpwJwbCRfloJVSmYTGuPK6GTPmrYDji8FaVl7AeX+oiFqAjDdFaM6HKBdNm3dL9iR22B176jiAwfhMWzj6xvTBHvO57QJYxl4LeI6n0dHnpZkf8RZ4Y2fVq37MCRnVpyYdWZMKkTNETI1PB0xg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZYSCbuEN; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZYSCbuEN"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-67845996252so195436a12.3
        for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 11:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776883912; x=1777488712; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R4vBmmJ5gC2QCrFlTLiSjZ3SPsY2SAKP5dBxbzswxUI=;
        b=ZYSCbuEN/bM7uo9ZqEPqx0HPh01x9fL0+M6sNHau7pqYUMGhNquFMdLOv/+99gPMK3
         DH08RDe/CjHDsXGnZxxIKLromLOo9/haEHTe//rmSQJLXyiSJMfX8xTmNHG42cIY9KY+
         wU+GDaH3k4SXWhIINXm4Gar2AAfh9K/k0TirQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776883912; x=1777488712;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R4vBmmJ5gC2QCrFlTLiSjZ3SPsY2SAKP5dBxbzswxUI=;
        b=quTfwvfqEdQj7+gUVBt63HuYZ9zaYr/zdEls8Vq13kBV9KtlDtYqoxzL/OLwCPCWUy
         ++F8oGuJ6sTd3I6vkGlm/80wWF0RxgkS7SzF03trR4Q4q/seo7dpMK2ECpz/WtoTRzsA
         ccfNvAQq2zFoxZEcIhqmuQxRYIsw1PygthShzGW50GtuAuHmuIwbqxJPdpvGB7cy7S7W
         hpnbKVF5Ryfz9r7+4Pne7XE6SyC6laB2RZUF0uA51vhwsSQk/6BE9k1bxUxlWDJo39Ey
         syZREkvXrvR1lfgVerHLuPbpuntPbAE9I7C6EZKtf2rlqu3H4gi5Uv0zQ6PX8D3x3nWY
         m7Hg==
X-Forwarded-Encrypted: i=1; AFNElJ+wWSyXuNOWjC2Y/GMa6oX++/uRvdXrU6fXvE8gmyj4mn69y0HKNz+A1yvbdrE7XlSHbxlfDpMC8JaLtQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeIUf506c6Y3mNPDIr29RDXMoW44xMpjXXv2adh0/DAtgP2iqS
	2Ub/IoqcuNB9IJZH4F5md5M1wLOZUV1emb5uwjk15XkaRWQ9XoGF8VtCPZtVXAk8ySQq/SGGs4F
	m8/HnPQ==
X-Gm-Gg: AeBDieu8Vo17hoogIQ6AoxVgSgBoRCblG4hikPlw7FSstyE84+KIBEtgfv7gq6fO6dp
	r20V/HsMgLWgeskPlvLV6xaSuLzx8TrRnODNyO/PjbbhRjaKHe0C/w+lj+GMT6Cl3ckExNRLMMk
	lSAKcPPOGgtsfZ2agcX0YlrzV6iycbjrJKmbor/UugBWoi21769LCeVv9U0Qx+xpeHZ9K3Zs0gi
	ZvnAQlYIu7nPhsJY5N/k8kODIcUCXkgz66gDQiG/yh/3LkbDoPia8Cal+KoDceejNJKAUsLt57W
	1UszrP6TI+IKgV6y2Bjo1paZck6ywZcjlN1kMtsrd4ymLeX1mi0B/a2wN0zA39Tcg2zlcAsWi0X
	4jQXDJ8sEvcBwqD3cpFJZsTLSckMsucb9fjvP2lPA2lgpwwsREyCMdIWNncb6t+nnMiN56HM39m
	V1p1Lg2RyHcNzg0+v0bDVKU5LfDalrRvjzMFtXrJHiH+aGw8kZ2+MqAI1L73Zf/+BQP3DnYdar
X-Received: by 2002:a17:907:3d09:b0:ba4:afcc:4a9 with SMTP id a640c23a62f3a-ba4afdb4b75mr1070601666b.45.1776883912187;
        Wed, 22 Apr 2026 11:51:52 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba455926c61sm566451666b.63.2026.04.22.11.51.50
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2026 11:51:51 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d43e09de5so3305546f8f.1
        for <driver-core@lists.linux.dev>; Wed, 22 Apr 2026 11:51:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+3qAKRV7DyTqFTAKfg4QY934XcxLe1+f+kg4RYImJfd0r3iXmucp+ejMzaL4ikuL1z7hNp9ZzolDfXAA==@lists.linux.dev
X-Received: by 2002:a05:6000:2f8a:b0:43d:7a08:a5e6 with SMTP id
 ffacd0b85a97d-43fe3e073c9mr39087653f8f.29.1776883909243; Wed, 22 Apr 2026
 11:51:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com>
 <20260325143555.451852-3-herve.codina@bootlin.com> <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
In-Reply-To: <CAMuHMdU7x7LWFkD9xiq+wyOqnn0bdzr+JLfvbBexoiWyv8kftA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 22 Apr 2026 11:51:36 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UK3NQKQN7FXyG4nGdDKO=LQYhnL4ZweomQ_4R9-EAYag@mail.gmail.com>
X-Gm-Features: AQROBzAV3w_CPq4qi5veiP_uOv4VWrOsaTYpBbypDAKqTbu6jiZzeNsnLIn0Vds
Message-ID: <CAD=FV=UK3NQKQN7FXyG4nGdDKO=LQYhnL4ZweomQ_4R9-EAYag@mail.gmail.com>
Subject: Re: [PATCH v6 02/27] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Herve Codina <herve.codina@bootlin.com>, Andrew Lunn <andrew@lunn.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
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
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Daniel Scally <djrscally@gmail.com>, 
	Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Davidlohr Bueso <dave@stgolabs.net>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Dave Jiang <dave.jiang@intel.com>, 
	Alison Schofield <alison.schofield@intel.com>, Vishal Verma <vishal.l.verma@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Dan Williams <dan.j.williams@intel.com>, 
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
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Saravana Kannan <saravanak@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 22, 2026 at 10:44=E2=80=AFAM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
>
> Hi Herv=C3=A9,
>
> CC Douglas
>
> On Wed, 25 Mar 2026 at 15:36, Herve Codina <herve.codina@bootlin.com> wro=
te:
> > From: Saravana Kannan <saravanak@google.com>
> >
> > When an overlay is applied, if the target device has already probed
> > successfully and bound to a device, then some of the fw_devlink logic
> > that ran when the device was probed needs to be rerun. This allows newl=
y
> > created dangling consumers of the overlayed device tree nodes to be
> > moved to become consumers of the target device.
> >
> > Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> > Reported-by: Herve Codina <herve.codina@bootlin.com>
> > Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgy=
o8x6=3D9F9rZ+-KzjOg@mail.gmail.com/
> > Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com=
/
> > Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.co=
m/
> > Signed-off-by: Saravana Kannan <saravanak@google.com>
> > Link: https://lore.kernel.org/lkml/20240411235623.1260061-3-saravanak@g=
oogle.com/
> > [Herve: Rebase on top of recent kernel]
> > [Herve: Add the call to driver_deferred_probe_trigger()]
> > Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> > Tested-by: Kalle Niemi <kaleposti@gmail.com>
> > Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> > --- a/drivers/base/core.c
> > +++ b/drivers/base/core.c
> > @@ -235,6 +235,79 @@ static void __fw_devlink_pickup_dangling_consumers=
(struct fwnode_handle *fwnode,
> >                 __fw_devlink_pickup_dangling_consumers(child, new_sup);
> >  }
> >
> > +static void fw_devlink_pickup_dangling_consumers(struct device *dev)
> > +{
> > +       struct fwnode_handle *child;
> > +
> > +       guard(mutex)(&fwnode_link_lock);
> > +
> > +       fwnode_for_each_available_child_node(dev->fwnode, child)
> > +               __fw_devlink_pickup_dangling_consumers(child, dev->fwno=
de);
> > +       __fw_devlink_link_to_consumers(dev);
> > +}
> > +
> > +/**
> > + * fw_devlink_refresh_fwnode - Recheck the tree under this firmware no=
de
> > + * @fwnode: The fwnode under which the fwnode tree has changed
> > + *
> > + * This function is mainly meant to adjust the supplier/consumer depen=
dencies
> > + * after a fwnode tree overlay has occurred.
> > + */
> > +void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
> > +{
> > +       struct device *dev;
> > +
> > +       /*
> > +        * Find the closest ancestor fwnode that has been converted to =
a device
> > +        * that can bind to a driver (bus device).
> > +        */
> > +       fwnode_handle_get(fwnode);
> > +       do {
> > +               if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
>
> After commit f72e77c33e4b5657 ("device property: Make modifications
> of fwnode "flags" thread safe"), this must be changed to:
>
>     if (fwnode_test_flag(fwnode, FWNODE_FLAG_NOT_DEVICE))
>
> With this change my DT overlays are working again.
>
> I guess keeping the FWNODE_FLAG_* names, but changing their values
> from bit masks to bit numbers was probably not such a good idea,
> as it fails to catch missing conversions...

Crud, I should have thought about that. :( Do you think it's worth it
to do a rename at this point to catch future problems?

-Doug
