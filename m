Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6030B39BFE3
	for <driver-core@lists.linux.dev>; Wed,  8 Apr 2026 08:10:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775635823; cv=none; b=ZoY232yI+T97A2esEKQupQGHMsP9UUwN70blUNY+iVz5Quqy6bMkVdUaJUkrheGEQ7/9hEh8CUao/Xhgdfb8arVzHPiRrM7Py5F4nPAEkylVGp+cPHg4Sb+9+zpvmv8CbTct6nyGptOVUibuu+MGBXUScd0Bkygi0WQlT8mv+Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775635823; c=relaxed/simple;
	bh=qgkECxzGSpnuq07rnxhj52qCBc/KBJvowuMtgBzyENM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rORAsBbn0kKz7d1KpERSdYKxLVqvvCvLWN5xnBX+084kPChi2+kCNGBeMJak/wJaA6noC70r8zZ14Ayd1ZL5z3bfEe60MK9bXkW0AyQZUD4qLocpmxRPdxzOB99aGd/zgdOQdyPUafAdkRuBWty8yrswlUXtvBAX++EB4NSOc0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a871daa98fso44283345ad.1
        for <driver-core@lists.linux.dev>; Wed, 08 Apr 2026 01:10:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775635822; x=1776240622;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dgSjrs+bZCBNPvbS97WPj5GTT7jaQlR+JpRwd/gT2+Y=;
        b=Mg0K1G4DpclVD3ecD5c06XApaKvi1tTW/4I6YmJ8EkIdCPSWTXBgBbfUiv3E3pw0CK
         Qq2ZNuDEVfpLrjG5G9zxCtxELwZPDGJJOUG3hwR6FTzBl4pk1cqXJZvsUwOKC6IrfJsk
         XpiJf0plBNHlRE/22USE8edJQEhJxLwmw+1mJIF8C2rkIoQbxmrMVU4uByEohtUbKkQr
         ae9M1GE1KRgZCA4K7WCG2uaCDkx4gticx++kd9oT0OumGPrDltUsctakQvDu0umBm1ge
         bSW/5EgCH8GH2btP4/z56VELLVb7ft4TDZS5Lj3dmxqRoFD0BCHrwnUii7IF2OW3GUQm
         2vLQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/LFuCO49LqKgTCqg7ya+nG5u6dPKu4g9zrjN3rzplZ+skBFUww4ofmMl+65Wx9MNLXfZ0OXrM+3JN1A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYMXN8uKOrv8iCOdx9zyR0VnOpSn7embmEj5B/bEvwWiUcArvC
	MeEObeEn9fnR1KfR4uZlMbhC09mhOQx2nn2erO5EYk6ZioWzyGmXGdL5jQKGCOIF
X-Gm-Gg: AeBDietMdfj5HuFNSpzfBpSBdbtFEXaT6H0hSW6ud5ae7P+idhz8rg10wEH2wPjIBW3
	orlaFqxqTp7LS62HlQBpaCrZCjqRcoTbv3/3e+AFdCTr9uapJQOqfWi9xRAj8pzRnp4euXozDZR
	3KGCAZwSeiBGIapUmkdcsDzhrgpmSPMSOwiN7HRk1TyloA/x7Kq0DeOxng9sNazg9IpErkHyIfL
	qCc1IwNNkYaI4oL0C0YsZkWwI4HH/HgZAcD/so0hi5x61LoYt7Yn/eoHUeJcjP3TlP10qT+c0kj
	oa4ojWLrAZYALbLWuz999vBANqlPJyUmuyWcNnUIc1b4dzlr1X+BbewsTHTOaYdAYDFciNVjF0w
	E7UztCcGG88HVm9OyxtgWwTy0AhqMU09FA2q71wOcN0X60nr+LDqT+JkBdXAsXd0U+pOpTOr1uP
	0DOYIs/7PDLii03T9KZh3WEy9xQDXLw8Dx/GUpvwyhi2FFOs5nFm0yDMfIR21T3iwB
X-Received: by 2002:a17:903:22d1:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2b28188a0b6mr217108845ad.41.1775635821491;
        Wed, 08 Apr 2026 01:10:21 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com. [209.85.215.172])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2749cdc61sm196926275ad.80.2026.04.08.01.10.21
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Apr 2026 01:10:21 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c766cf593daso4213857a12.3
        for <driver-core@lists.linux.dev>; Wed, 08 Apr 2026 01:10:21 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU9VfJ67aANEWzubDyDQtXoFlWXj4OWq3xREbWwdxV/FKAqpVS1J7jPkqJk1OLSzouyXUz2VSsAg0LQPg==@lists.linux.dev
X-Received: by 2002:a05:6102:688e:b0:607:9b47:81f2 with SMTP id
 ada2fe7eead31-6079b478f09mr649179137.20.1775635395263; Wed, 08 Apr 2026
 01:03:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260325143555.451852-1-herve.codina@bootlin.com> <20260325143555.451852-2-herve.codina@bootlin.com>
In-Reply-To: <20260325143555.451852-2-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 8 Apr 2026 10:03:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVh2gFQf16AarJCY+2y+24bOgaQyTUv6opPqVKCoUwMag@mail.gmail.com>
X-Gm-Features: AQROBzDnP0FsdrSe7kiaKBzgO-Rt21-zwjAE4PjirQbwD7WYIqJw4iFM_IJ47Kw
Message-ID: <CAMuHMdVh2gFQf16AarJCY+2y+24bOgaQyTUv6opPqVKCoUwMag@mail.gmail.com>
Subject: Re: [PATCH v6 01/27] Revert "treewide: Fix probing of devices in DT overlays"
To: Herve Codina <herve.codina@bootlin.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>, 
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

On Wed, 25 Mar 2026 at 15:36, Herve Codina <herve.codina@bootlin.com> wrote:
> From: Saravana Kannan <saravanak@google.com>
>
> This reverts commit 1a50d9403fb90cbe4dea0ec9fd0351d2ecbd8924.
>
> While the commit fixed fw_devlink overlay handling for one case, it
> broke it for another case. So revert it and redo the fix in a separate
> patch.
>
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8x6=9F9rZ+-KzjOg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Link: https://lore.kernel.org/lkml/20240411235623.1260061-2-saravanak@google.com/
> Signed-off-by: Herve Codina <herve.codina@bootlin.com>
> Acked-by: Mark Brown <broonie@kernel.org>

> --- a/drivers/bus/imx-weim.c
> +++ b/drivers/bus/imx-weim.c
> @@ -327,12 +327,6 @@ static int of_weim_notify(struct notifier_block *nb, unsigned long action,
>                                  "Failed to setup timing for '%pOF'\n", rd->dn);
>
>                 if (!of_node_check_flag(rd->dn, OF_POPULATED)) {
> -                       /*
> -                        * Clear the flag before adding the device so that
> -                        * fw_devlink doesn't skip adding consumers to this
> -                        * device.
> -                        */
> -                       rd->dn->fwnode.flags &= ~FWNODE_FLAG_NOT_DEVICE;
>                         if (!of_platform_device_create(rd->dn, NULL, &pdev->dev)) {
>                                 dev_err(&pdev->dev,
>                                         "Failed to create child device '%pOF'\n",

Note that all these removals no longer apply cleanly due to commit
f72e77c33e4b5657 ("device property: Make modifications of fwnode
"flags" thread safe") in driver-core-next, which is gonna complicate
backporting to stable.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
