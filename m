Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C6312D97B7
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 18:33:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774290823; cv=none; b=bmlsEFQjZ+0budFPRvUo98huoz/fWHHHDYkO+neSp8emB7C/gGZXSNBkKmU8SXFa1nCdIyijhF/JVI8N879y9tYyc8FVmOXlOEO+rozS3kLN2Nt+cVUqqxubCSFbBcDwCkYUfbXdVlPSLlyzonIweIt4jrLgdytIdWV3UQIubXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774290823; c=relaxed/simple;
	bh=6I3TCajsnbPhvopolFVK3KO9pDXc1m1XrVrTJSIDMJQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t0cgJQvf4tHniACjE1NBr12Gan6asOQI4undIAaBhU3393ItA4ErALk9bmOXwBZxKHs1blF7lpVzWeGkxwf0mkHQXWWVH8HfABc9X7re+RIc5EpTYW4Tf6rhShO9x7v0sDeNh30qPyI1j97LqSNq8CTcgnJWmgpZxDSJ332L27s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oHJLorRf; arc=none smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oHJLorRf"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12a71ade78cso614441c88.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 11:33:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774290821; x=1774895621; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VnYjc2faOHjkbaG+X0+KOSaQNDxXMdAftkLY6+CZb5k=;
        b=oHJLorRf3ERiG1PyEP8oT/vv3qyTwu5IV5RS/5DY2rnoEy+AvcHnbs5JCxxm7Xyz9U
         SOfiO59twsVRL3CA6Be7Q7IRu5k4eV3us742Bag5zEdD7okV8ca/JH5y/E6Jhn/XYr2R
         3vxiZ2UIskm9xTqoF//2hN3+QSXV/qrp4OfCNAWBNP6rYR3oGv744WFIEaTS+ncnFDCY
         wmW604QPcBxgKZPXAaoFa/8QakTdGekOjO6ZuaeRZeJqMKyhcsA8gyfB1QsRImVmK7qD
         wL6kfoLJxTz5S/H1m4jmWG6sNEgnipgdp6AI7K6x0v5b5xLGqf5ZIEcG+oLIccifssyL
         XxZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774290821; x=1774895621;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VnYjc2faOHjkbaG+X0+KOSaQNDxXMdAftkLY6+CZb5k=;
        b=NCiFjJ/aIqEUZddmhS7MMz+l/fRXO5wiDVB+zftvewraPY8uBTacLAYL+FcgfomnZX
         7DA5IA6TQc8vFlrcTetmNz9aatBl6kHw7Gtr1EET+0Vb5J02L2uEOUaJLVWqvU+FaH4x
         bPzhFdq5giZxjDXdTBgB2BtQ8mf540sqzm9des2qlbdsVif8FbcbfhMm0Nhaq4ObsW1M
         QGfLyZufA73bJJADQwTds/HE5fYOoyI+3gJNwhBPQM7sitbRbI+UQ58DGNTGgUW3wryt
         Kbnf98A5zLrZVltdMVW9wfRTfGOZx3LKOHocRX04HC6NcXsQz8ziKQO85NAveYbjHazt
         BeIg==
X-Forwarded-Encrypted: i=1; AJvYcCUX2BIt+7eDDEbac9HhyXi9/jvF1/Xnjs9yUiP1jgH25yH5Yh526R0Xue7yAhXuwvdKAe5Ri+kByW6e+w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5+x67kPIyHlUrobL+iUZ7dFZDN3YJ92g5jmal68oZPo01p2Ww
	MWMt3xvWOXssDJwJ50zFMdUWdC47sxJ0WS3RrTt83Wj1V5bIGhzhLX8D
X-Gm-Gg: ATEYQzxFjV1uKP+Ksq3Xj3Yz+4/vWhELjaR2W79ga7J8gCahWysMvvPit4l3ddX1bZB
	6MrKJ7BHmqP+gy0Xfndd7oSGc/9m/Jou4H0rpUim9zgTvHZFKTow20nBND+4oy5n5haYyExgW41
	HDMc7LozVTL8uS3xuB7S3Qhc4jvtaYxy6LRlT/NXV5Jrg6sILI69whQ9RuArSeeFRKA4mhZHQbq
	XrDKPUchjhjP1EABLjyV7G+D2qCiZvsqFmwt8NbVlySo8z6L1HcPZWs0PZuHTJzkGfVxxnXvth0
	C2fLR6ccRzb8eDkt5X6tUOIdEMrY/7z63c8hG4mWG4stowKvayAx7YvEr6FDQR8O0CwmDT0Cd31
	eQqScVVvsg128rM6joAaetljDPsY0HliwqnPBrFxjSWcz2mHeTgovZ5oZRDJKunHJDIhHwcmUgt
	wfisZGE2pj60hQUvZYpr6q2NMDyoS2jbObef6OdTsj6NuSSi1ppX6ZGfGV0dOo0m+p
X-Received: by 2002:a05:7022:4199:b0:12a:6c7e:bef2 with SMTP id a92af1059eb24-12a72671ad6mr6133919c88.7.1774290821078;
        Mon, 23 Mar 2026 11:33:41 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733d199asm9391030c88.4.2026.03.23.11.33.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 11:33:40 -0700 (PDT)
Date: Mon, 23 Mar 2026 11:33:36 -0700
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
Message-ID: <acGGWTmSMuc5h3Od@google.com>
References: <20260322-remove-device-find-by-of-node-v1-0-b72eb22a1215@gmail.com>
 <20260322-remove-device-find-by-of-node-v1-7-b72eb22a1215@gmail.com>
 <32679fc0-c388-4cd7-a030-5f5ed5abab78@lunn.ch>
 <acDLzK8vpptTUMf1@google.com>
 <acEBCBgMV3RrGKiU@shell.armlinux.org.uk>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <acEBCBgMV3RrGKiU@shell.armlinux.org.uk>

On Mon, Mar 23, 2026 at 08:59:52AM +0000, Russell King (Oracle) wrote:
> On Sun, Mar 22, 2026 at 10:17:15PM -0700, Dmitry Torokhov wrote:
> > On Mon, Mar 23, 2026 at 03:54:09AM +0100, Andrew Lunn wrote:
> > > > -	d = class_find_device_by_of_node(&mdio_bus_class, mdio_bus_np);
> > > > +	d = class_find_device_by_fwnode(&mdio_bus_class,
> > > > +					of_fwnode_handle(mdio_bus_np));
> > > 
> > > When you look at this, why is it better?
> > 
> > I think we should move as much as possible towards firmware-agnostic
> > APIs and use fwnode_handle instead of device_node or software_node or
> > ACPI companion. To discourage this I think we better remove
> > firmware-specific APIs where we have firmware-agnostic ones and
> > eventually clean up drivers that use OF- or ACPI-specific APIs.
> 
> Basically, no. This is wrong.
> 
> It may sound like a good goal, but there's an underlying issue. This
> goal assumes that the firmware description in OF and ACPI are
> indentical.

If they are different then drivers will make allowance for this, like
I2C core or SPI core does. But most of the modern drivers use
firmware-agnostic APIs (device_property_*()).

ACPI has allowance for device tree properties (via PRP0001 HID
entries), and drivers should work with them.

> 
> Sure, looking up devices by fwnode handle makes sense, but looking up
> anything that is described in firmware is not suitable for this kind
> of conversion, because in doing so, you effectively "port" the DT
> bindings to ACPI, and it may not be suitable for ACPI.
> 
> So, please don't make wholesale changes that transfer the DT bindings
> into ACPI.
> 

I am not "transferring" anything, but I want to make sure the code works
even if we augment OF with software nodes or if DT properties are used
in ACPI.

Thanks.

-- 
Dmitry
