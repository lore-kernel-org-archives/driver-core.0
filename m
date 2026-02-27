Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 353163563F8
	for <driver-core@lists.linux.dev>; Fri, 27 Feb 2026 16:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772211513; cv=none; b=ie6TlXR+CF4r1tIFhO2Xrx/Z1aanGowPLj+xW+KLBSXumlUhTHd4IiOdT+9eBHmc1YtQllRl/i+6czpqC4AOa6SjqFC94iikm6mCrCKWz6H6X4NWpq2oNLVON5/pewe61DGCAwCGijcZ1IUfcW8l0RNGXiWD2Z+pZyETgb8PXu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772211513; c=relaxed/simple;
	bh=8QooufOo4pPMQ94Tm+1S+IKUXQJzBKWDChzX4qil09A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rx7S/oT7DV3qJzTURuzsFfIdM1Exn+1khaLEtBJbbWkNPxa0wVPg/SX460tfpPwD0FZKsiYUGYfX7OKlwoYVb1WLjbrPG5uoPKvRXk1PhRCGYHpwtHYkOZKoVwb0Uelq4ywMT+BfOE+e5MwAD0soINuBgOOWVAaUo9Qe3RWaL14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-824a829f9bbso1140307b3a.0
        for <driver-core@lists.linux.dev>; Fri, 27 Feb 2026 08:58:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772211511; x=1772816311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AIGPgG8NajjCLfKfqfkEsLDhUiGu4xrfbhUgqAmvE/8=;
        b=wS5djywDrhN0pn/aOvXpWn62H1r7qvZl1NYLgDvU3IEyrcdH49oLXzZyMfvb83/MHe
         PPTCalmtvK5aXZU8m2EG6vf7DSJxA8uYRVULJ/zrN7rGAL4unSliqV1ng/GWX3GI3nG5
         t3W7Klx4sas9oizQC61TzeDSbNEZzbu3/C4tldh4gWjO6iH99Lyz3AKkI9YBv1QCqYKw
         J4pGcBSvcGw/oLTwOBwSSiHGK29D8y+Vb3EjoD6Dt1K6HJjnf/LrXrqVDibhVZlwjqSB
         mHlYHu8+iEXi/d5Ko87m6KkGesIevGRq+6ZnKbli0l6SrJbwvt301SFyYPOs1ike3Wmy
         zUSw==
X-Forwarded-Encrypted: i=1; AJvYcCUiiuA2EmDcTBZzkUdoxy2+6Gg4e+SA73i5qBZb4MPW9SiQbF5rF4iZiuaCfmuhR9FY/qQWX7aSklmZfA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJXn+hzjECaLXvjPLa17pRWS1cgMF5g/8BNhwbJnEkb2CLk6ar
	KRLEQ/jBCNuHNDwHSty+bpVLJgz/9Td3Y8wLI7TUXgFAaBjvqsNsxmkf3VOaJ9WRBNw=
X-Gm-Gg: ATEYQzwL7Z5PlhTr7gtO4yUDn0WPrT+prMdqulppTk974/RlvB4c4I/SfZ9xHsBI9T9
	AoFD/cJMpLORAIo9d5Fn6RojZiBUlZcofhU6UufiPqK4vrKbrVNyCLZpqIEg76nfaHTrRr5VB+9
	/QSx09SbMp2FknyptcaNQvT/8l3XLlRb+uEvsgwOmV7oFqzqx06KZVIlj405n+4/hLTvhhbtxXi
	IG9/J6//DyIpaIdxpZhYa1BSLzNsZd912JDSzLOd6D4i2EwffUERZ+Zpi/58oM1ipNUB2jSxfS5
	cfXDburj3Ume+yKSnC3R+7VbhBuY2t0Jc0xLVJClVggHyM9L9w/EciYbNdRn9Y0Fi6cusIEUCpS
	nR6CNPb7W19UVR/GH6YQ1D0xtsc//pBcTjEIbESEsYJKXpCrl1g8CL2HEuP907PSkaeJh6zi0fI
	fVbZdW8KahZ4Q2T1NcSi2Heb6QevNMZl9/flmxWLKXiVeDOY0pYSqa0YWO7ck6RSQ=
X-Received: by 2002:a05:6a00:808e:b0:827:37d5:af51 with SMTP id d2e1a72fcca58-8274d979446mr3372115b3a.26.1772211511270;
        Fri, 27 Feb 2026 08:58:31 -0800 (PST)
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com. [74.125.82.172])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82739ff350asm5266691b3a.35.2026.02.27.08.58.30
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 08:58:30 -0800 (PST)
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2bddf5091c0so2193744eec.1
        for <driver-core@lists.linux.dev>; Fri, 27 Feb 2026 08:58:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW4BvQHjOSa+wERiiWPBCG4NtoL09LHWkBXWDh3wfpuwvlLmGyEe4gF5c5mCY3de1j/fkbtqTo/U8hcjg==@lists.linux.dev
X-Received: by 2002:a05:6102:c01:b0:5f5:33c9:c9b3 with SMTP id
 ada2fe7eead31-5ff32536408mr1676835137.29.1772211026292; Fri, 27 Feb 2026
 08:50:26 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260227135428.783983-1-herve.codina@bootlin.com> <20260227135428.783983-4-herve.codina@bootlin.com>
In-Reply-To: <20260227135428.783983-4-herve.codina@bootlin.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 27 Feb 2026 17:50:14 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUAHXNbGfJFcUMQbzPqRS0S_RErU8u7t=AdmX0ZFQMjhQ@mail.gmail.com>
X-Gm-Features: AaiRm53ZqgozcqNHytSHwR_CUbVuY8sQSeRMANHqThlNEOeyZsxQir9SPbAYLBo
Message-ID: <CAMuHMdUAHXNbGfJFcUMQbzPqRS0S_RErU8u7t=AdmX0ZFQMjhQ@mail.gmail.com>
Subject: Re: [PATCH v5 03/28] of: dynamic: Fix overlayed devices not probing
 because of fw_devlink
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
Content-Transfer-Encoding: quoted-printable

Hi Herv=C3=A9,

On Fri, 27 Feb 2026 at 14:56, Herve Codina <herve.codina@bootlin.com> wrote=
:
> From: Saravana Kannan <saravanak@google.com>
>
> When an overlay is applied, if the target device has already probed
> successfully and bound to a device, then some of the fw_devlink logic
> that ran when the device was probed needs to be rerun. This allows newly
> created dangling consumers of the overlayed device tree nodes to be
> moved to become consumers of the target device.
>
> Fixes: 1a50d9403fb9 ("treewide: Fix probing of devices in DT overlays")
> Reported-by: Herve Codina <herve.codina@bootlin.com>
> Closes: https://lore.kernel.org/lkml/CAMuHMdXEnSD4rRJ-o90x4OprUacN_rJgyo8=
x6=3D9F9rZ+-KzjOg@mail.gmail.com/
> Closes: https://lore.kernel.org/all/20240221095137.616d2aaa@bootlin.com/
> Closes: https://lore.kernel.org/lkml/20240312151835.29ef62a0@bootlin.com/
> Signed-off-by: Saravana Kannan <saravanak@google.com>
> Link: https://lore.kernel.org/lkml/20240411235623.1260061-3-saravanak@goo=
gle.com/
> [Herve: Rebase on top of recent kernel and use get_device_from_fwnode()]
> [Herve: Add the call to driver_deferred_probe_trigger()]

Thanks, that last change did the trick, finally!

> Signed-off-by: Herve Codina <herve.codina@bootlin.com>

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -235,6 +235,79 @@ static void __fw_devlink_pickup_dangling_consumers(s=
truct fwnode_handle *fwnode,
>                 __fw_devlink_pickup_dangling_consumers(child, new_sup);
>  }
>
> +static void fw_devlink_pickup_dangling_consumers(struct device *dev)
> +{
> +       struct fwnode_handle *child;
> +
> +       guard(mutex)(&fwnode_link_lock);
> +
> +       fwnode_for_each_available_child_node(dev->fwnode, child)
> +               __fw_devlink_pickup_dangling_consumers(child, dev->fwnode=
);
> +       __fw_devlink_link_to_consumers(dev);
> +}
> +
> +/**
> + * fw_devlink_refresh_fwnode - Recheck the tree under this firmware node
> + * @fwnode: The fwnode under which the fwnode tree has changed
> + *
> + * This function is mainly meant to adjust the supplier/consumer depende=
ncies
> + * after a fwnode tree overlay has occurred.
> + */
> +void fw_devlink_refresh_fwnode(struct fwnode_handle *fwnode)
> +{
> +       struct device *dev;
> +
> +       /*
> +        * Find the closest ancestor fwnode that has been converted to a =
device
> +        * that can bind to a driver (bus device).
> +        */
> +       fwnode_handle_get(fwnode);
> +       do {
> +               if (fwnode->flags & FWNODE_FLAG_NOT_DEVICE)
> +                       continue;
> +
> +               dev =3D get_device_from_fwnode(fwnode);
> +               if (!dev)
> +                       continue;
> +
> +               if (dev->bus)
> +                       break;
> +
> +               put_device(dev);
> +       } while ((fwnode =3D fwnode_get_next_parent(fwnode)));
> +
> +       /*
> +        * If none of the ancestor fwnodes have (yet) been converted to a=
 device
> +        * that can bind to a driver, there's nothing to fix up.
> +        */
> +       if (!fwnode)
> +               return;
> +
> +       WARN(device_is_bound(dev) && dev->links.status !=3D DL_DEV_DRIVER=
_BOUND,
> +            "Don't multithread overlaying and probing the same device!\n=
");
> +
> +       /*
> +        * If the device has already bound to a driver, then we need to r=
edo
> +        * some of the work that was done after the device was bound to a
> +        * driver. If the device hasn't bound to a driver, running thing =
too

things

> +        * soon would incorrectly pick up consumers that it shouldn't.
> +        */
> +       if (dev->links.status =3D=3D DL_DEV_DRIVER_BOUND) {
> +               fw_devlink_pickup_dangling_consumers(dev);
> +               /*
> +                * Some of dangling consumers could have been put previou=
sly in
> +                * the deferred probe list due to the unavailability of t=
heir
> +                * suppliers. Those consumers have been picked up and som=
e of
> +                * their suppliers links have been update. Time to re-try=
 their

updated

> +                * probe sequence.
> +                */
> +               driver_deferred_probe_trigger();
> +       }
> +
> +       put_device(dev);
> +       fwnode_handle_put(fwnode);
> +}
> +
>  static DEFINE_MUTEX(device_links_lock);
>  DEFINE_STATIC_SRCU(device_links_srcu);
>

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
