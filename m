Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F03153DC4C6
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 19:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774294541; cv=none; b=j8ePRYs6O9opTDXa07nA2wRIIASWej7qjPg4cu0xrTe3pii268MsBcxPCidTmgeKPhpcuWDJ2Sh23MGHzEMVoBLKoXD7CrPMwSMIxAfJzmzN/YKxBv7RnReqf4v0ynaxonZQ9cNr9ttwybvXh63QkkGKfev5Xe47C/jNLSkAReg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774294541; c=relaxed/simple;
	bh=kvZQfR6Ka8WnuKuT7mVazzZOQdLKZWJfub3aSBzO8AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N2aRnqOJhBiLNLc3X3IQINeCgi+y1ABNX5bEiUMP9gCv7nn97pzFlXO+IqE5sq+MZmg0ZSykus8MFMNxEI6szeQHDOXmYPiO57bJqimQS6tA/V1IsyI0CrnCOCgaj4HDdRAmwlEIibu0mCpZ1PlfZw8HnQz4k8RuC7XsI+pOdvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aucXrk2q; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aucXrk2q"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12a747e7b2fso1066279c88.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 12:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774294535; x=1774899335; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hsALcZ16tevmJ3ng05DYY6tY5JjgfE8hJRfdYF/sgZQ=;
        b=aucXrk2qEnh65SS4EVjneXi3OHvjD41KA12Ph9t8/N1tAmQMyUVB6WtbZn4Yj8GksA
         heRvKP3QhvhRX+TYpVgm5H7Kgu9AbAV6q3FPF/SIze4KadF3/8Wz3kr0LiqPT+NUzT4i
         kUs5NHeF8wDz0LodpwtXbwp5JyfktjLnuZEVdWcSY6POdBz1BLhHMPjRj8TeXuz4c/SO
         UnDD+BAatiVMJxfIrg20XYF3XAW3tJqzNwpjLcqbOcFXpaH3K/dNQb+DAuAA0a+YKg6L
         41IPN8JnbyNpbUE+fwTDpLMLskIp1TwVWqXyMcBlKW9qHfBYqJojbya6qcybwDfrxCSL
         /+Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774294535; x=1774899335;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hsALcZ16tevmJ3ng05DYY6tY5JjgfE8hJRfdYF/sgZQ=;
        b=KpmtyQ2p+D6DzRdHM/pib9qfzjHjI4JnDgNkMd/rMMGTCSDRocXUeiZcP56pKxL3R/
         JLNwbAsNhZhGP3LQPTkF+yGfLgDZDSlIJdDILPJ76GuIWJ3Cwc0kJ9Tq2ICJkGl9d+vU
         n9eT8IJUSkWHbwZ3G3NzNH61TNCoqqmddR0lbiAus4lER9+3sZ8tBhmVM2mlnECBgDRV
         kKipOI7FdlpWj+mr4zeQugOhyYj6Nr6SrIOgzAVLV72/+MFG4bTktvsT7ABTOFnRd15n
         Xf4qtAMQ46N7iAqmlrmPPbFV4vloCqr7nzKm+Rl8kE/tHwjRX+A4bZoxbNXup8g/O/Q9
         Tidw==
X-Forwarded-Encrypted: i=1; AJvYcCWCh98WuGGxuB/hwVmUQwFSqwlNb6lQWswoxs+22hR3bzm+kWDRKsRoj7oeZh2VrjwHUkq0Rox5NhPrCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7jQjbKn+bcMrMwqekIzd9T+gT/8eOXc5ggwv475O68sz3zp2L
	wI9Ot6R4eG8a3jPiJXLOERkJuugVXmoOlhZZoNXER7K2yK+0rhZHSz9H
X-Gm-Gg: ATEYQzz8/79Z6kUaJbs2YxJBNgeeOs4TJjSJX06ETA3FSZTsc8L/irtUQN5YOoRP5rK
	qvROLIOwIt0D+vc28GD1PIKod2O47eS08RVQ8I+lM1BbSfJpkDvdqplLQGugZMmi+zy8k8wyPv6
	ePQr7CnW1tBIwfhgAL8B/3badfrqRbthvFiXCdmauidBIeAv/OoKHdpOTU+CR17g8xE3VsofsoJ
	z/a8I2klz5D+m4zHq+u3aFOeYKd6NrW17QBbayQPR/B22tJXhoGW1S1sbbNVFirIpo9b4os2LTf
	iBAFKYgWAXO0vP0MBb1oXg+GsO6UfHdUvq9IYfrlZc9Nu8SzW6KYcj7SKF4SQkJJFNZOCOZJLT+
	5f2f70GfrreJwEaNiK0dIcV3NmGXOdLpVqf01ByDO4nHV3DQtZBAVsqTYqCN7JlLCiwP8MAGwS3
	slLNanqTSn4/HjyJfb5/qQ8O+xY7zBj3rvq/r7ZVs6saSez+ALJ1uOhv1gG6GC84eO
X-Received: by 2002:a05:7022:6981:b0:12a:6ab7:3f9e with SMTP id a92af1059eb24-12a72671127mr5823640c88.10.1774294535335;
        Mon, 23 Mar 2026 12:35:35 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17d1ddsm12967046eec.11.2026.03.23.12.35.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 12:35:34 -0700 (PDT)
Date: Mon, 23 Mar 2026 12:35:30 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Mark Brown <broonie@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Peter Rosin <peda@axentia.se>, Heiner Kallweit <hkallweit1@gmail.com>, 
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-spi@vger.kernel.org, linux-leds@vger.kernel.org, 
	linux-fpga@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH net-next 07/10] net: phy: switch to using
 class_find_device_by_fwnode()
Message-ID: <acGTaZcF6GwkmC03@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
 <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
 <acDLzK8vpptTUMf1@google.com>
 <acEBCBgMV3RrGKiU@shell.armlinux.org.uk>
 <acGGWTmSMuc5h3Od@google.com>
 <acGI4PI3MHML9Pce@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acGI4PI3MHML9Pce@shell.armlinux.org.uk>

On Mon, Mar 23, 2026 at 06:39:28PM +0000, Russell King (Oracle) wrote:
> On Mon, Mar 23, 2026 at 11:33:36AM -0700, Dmitry Torokhov wrote:
> > On Mon, Mar 23, 2026 at 08:59:52AM +0000, Russell King (Oracle) wrote:
> > > On Sun, Mar 22, 2026 at 10:17:15PM -0700, Dmitry Torokhov wrote:
> > > > On Mon, Mar 23, 2026 at 03:54:09AM +0100, Andrew Lunn wrote:
> > > > > > -	d = class_find_device_by_of_node(&mdio_bus_class, mdio_bus_np);
> > > > > > +	d = class_find_device_by_fwnode(&mdio_bus_class,
> > > > > > +					of_fwnode_handle(mdio_bus_np));
> > > > > 
> > > > > When you look at this, why is it better?
> > > > 
> > > > I think we should move as much as possible towards firmware-agnostic
> > > > APIs and use fwnode_handle instead of device_node or software_node or
> > > > ACPI companion. To discourage this I think we better remove
> > > > firmware-specific APIs where we have firmware-agnostic ones and
> > > > eventually clean up drivers that use OF- or ACPI-specific APIs.
> > > 
> > > Basically, no. This is wrong.
> > > 
> > > It may sound like a good goal, but there's an underlying issue. This
> > > goal assumes that the firmware description in OF and ACPI are
> > > indentical.
> > 
> > If they are different then drivers will make allowance for this, like
> > I2C core or SPI core does. But most of the modern drivers use
> > firmware-agnostic APIs (device_property_*()).
> 
> What is appropriate is up to the standards bodies responsible for
> the firmware. ACPI has a separate body, and we can't just dump
> the structure we use for networking into ACPI. So no, you can't
> just switch to firmware-agnostic APIs for networking.

So I believe there is a difference between deciding:

1. What schema is being used on a particular system - it may be
OF-compatible, or ACPI compatible one, and ACPI may support
OF-compatible schemes for certain subsystems or individual devices, and

2. What is the API to access the properties.

There is no harm to use device_property_read_*() universally as well as 
not having OF-specific APIs at the driver core level. What matters is
schema matches the system type.

> 
> For infrastructure where we lookup stuff by some kind of firmware
> node, I have no problem with converting that to fwnode APIs,
> because that doesn't transfer the DT description into other
> firmwares without prior agreement of the appropriate firmware
> standards bodies.
> 
> This is not "foreign territory" - ACPI in general doesn't want to
> describe e.g. the individual components of a network card, unlike
> DT.

I think we actually broadly agree? What you are arguing against is
saying that OF schema is guaranteed to work on ACPI systems and vice
versa, but I am not saying that (although for some things it may). But
still most OF schema can be handled by generic APIs (either
device_property_read_*() or fwnode ones).

Thanks.

-- 
Dmitry
