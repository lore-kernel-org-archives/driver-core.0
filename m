Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793910900;
	b=QdMlRihBY5Yv95a/bswco+khpMZ3SodWMviEplXdsIbb9GqcTdwwShtm3airJ/uEZlf9
	 oLqpQI6hYDuqvUY4L6ERJgvTj9LksIsaqYJeegA6R42lfsnpYJRSC7X93R83kcaZYYboy
	 MkHFojNESyelCMv6z09WspT5nrmie6LEnJsFU3HiR33+fXrhnn3uqKLfWN0bZr0vtvtcx
	 Zx6ZixGFcpTGzgJr+V4AQtyZUYqlka/ZXXfXfTA32D8FgTQXoptnO6D4tN8EMnLj6R12L
	 nkq9kp0JSK1wLrXTNlGVRhZKDAYO0tHR1P4ao/rswLZVFpjUKC2azG5RbjDSghf0ljA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793910900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aFjl/l4WKV+VfugNVUlnSUSxj2ZFcfM53muFdv6vcfQ=;
	b=Bz41KC8iTHisT6lZvfAWXQfShOxSMX4eNCqSb5yXvZ9LfS+aWmz0kcBYVKpvjsnAagwP
	 PkpDgKJML4ymqzdyR2ltjOQHh5O1sr/YQRrvbFzaImstI/nqXDV9p7m+otiemEVa4XzyL
	 Fdw4OWwS+MbJkwSJzKKM3aIXsWDoHAvgwga2EIjORIp56252Tmjtq8GcMz1UC4AHEPI3d
	 jU67OmcMa5wFi14RXs1pv5BqrIVdrPDV4zdF5511/wbosY7IsZjmhxs3Vxhb9gO71IvFc
	 9n64lLMe2/jrGnZ+HUbCTRlGvCsBIbQNgkjnlHJPSM6lJKVcXhJwhnx/5MJ4YNPIcdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9tRp2Ql;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C17E9606A32F
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 20:34:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C17E9606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=y9tRp2Ql
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1a3c08d6928so636c88.0
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 12:34:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793910899; x=1794515699; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aFjl/l4WKV+VfugNVUlnSUSxj2ZFcfM53muFdv6vcfQ=;
        b=y9tRp2QlnJZOxg2xzvaAXeJWaX8ASQis8B5nbD8rESEO+ZhLyTFHMTN2cYi7JJmtUQ
         veiAHnEzkrKVkuKTDD4IWrYSYG01DOMRuCHdbTpiZvQ1INQEVryxnFYsMsksvTFZEn66
         C27R7xgFNUCIXsc2yNk08MV25utLuGEsvR00X7TIL1njS2mpmk9m+1buq7w7k9u3naBw
         fbrU10LTynbvULOZ5SCGwDdPoGx/SKQLdbhtNxv1wsPORsVPO9Q2bANuBCfkt2sMKFUU
         3hdDSlAyn0Ga4yGqZUbUA2c9BXi91bqCIVFY4iwsAIMet2GXlt0dqRNVNsui6yxuvbYE
         8wBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793910899; x=1794515699;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aFjl/l4WKV+VfugNVUlnSUSxj2ZFcfM53muFdv6vcfQ=;
        b=yut17JFCNXjzxdkcKjFV8LcxjJl0ZeVxDQsuNyWeTO7F7ujOZ6mWVTVRK8p63vlqUD
         g9RZkd+Dy+nCBnVeG212bjJLKjX+xcpdK/il/Pi6vlGuneZSQvqCdkNAovbVeBep2YLS
         RvhwWN1qq00ONoP3B1lNyzxMMAJ/iLGqSGqjEPoitvYNXd/n69NktWpvYk6NbldC3DoK
         vZmvFCa6cW7FpHjE1FMn9ZLa/tt7lz26uqHA6AfTEhFb6aeRHxuR4yQKFxVLBO9mfhZ8
         xUEzCcDjnnaTUb3uUqQLcRhihoESr0BXdPUcViTcWDYxMhbK6l1DommWaCRzSk/nJdi+
         TQXA==
X-Forwarded-Encrypted: i=1; AKwUvBwlh9x/siU35PycurC+Qlw5DX/DsLwu2Lds9xU8dp3Ftcq8czk9G8mWwAKKzxvCVjWOSHKdHVRpSReOoQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/PsdVNAhfuDgMSnw/gzUvfMnvhr+hRolUyw1AZce9nKjhgIzoK
	w5Vb7u4eOAGPoYL6Rd8+YLBnILq07I2gNHSeNKGaVl4FeITK9SI4nIAq
X-Gm-Gg: AYBFou3rrYcxmCRzwr2uTZ1vDaxtgNR4KX8uxs1uI5EllQmdbt8sGpC5MXVdbwxqKAO
	UQSODIbzqapMkyXCcR9FG3GEzcoi3RNxHrn0xDIzYAlT+q3nJEmngO5ji3JJ19r+xmOj4vtcNAR
	tsMf5f7AT0AMYLqWxlQ28sE9SCzb7jq7vSDIP4lkzYXQOf1lwkOm9UGgGosHcc3PePXqbwa7p3G
	GgNg1TyXl3TMqTw9v+Qftp8AuNmZz0xL+5ynlSyf2Ovg2SMaaLBXWI7xp9p8MZIHu1irnGKQvAK
	lkwaLzxhb10P5+yJ4zWDDPL2ewiDN4rztjlRse5s5oq6F3ryLYzcwtjBC8PUtAEN10+AQbXqA9Z
	RaALwM8lwfOr9goofRqlu1k+umoPIFhxeTMEdvVDvyY9FL4hOLiqL6Ygra7NYCbRapc1nBlnAIm
	B/B4K01lIpaPiHg4Ve6IlLPS7tLsuZvwi6SySsvTZEjcm37m75IYhtCnyXK3bSdpxYGYOzqBh3P
	5X4qcRveZctf5hQRpnESo2qcemBRKOaqOHoyw86Lkqh/HCIy07rL31IGJf2NYjgNp8VeKa2GIbr
	vFUb+EVp7d/Xm10jZYehcw26P8XiSN1t2kA004YWOnduRiRy8+lEOM8CejMYzfQYKyy3Qto=
X-Received: by 2002:a05:701b:2050:20b0:166:5552:780a with SMTP id a92af1059eb24-1b25d31e5a2mr163714c88.8.1793910898553;
        Thu, 05 Nov 2026 12:34:58 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36f722ed274sm649631eec.18.2026.11.05.12.34.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:34:57 -0800 (PST)
Date: Thu, 5 Nov 2026 12:34:53 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	"David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Joerg Roedel (AMD)" <joro@8bytes.org>, Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>, 
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, David Woodhouse <dwmw2@infradead.org>, 
	Lu Baolu <baolu.lu@linux.intel.com>, Johan Hovold <johan@kernel.org>, 
	Eric Dumazet <edumazet@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>, Nipun Gupta <nipun.gupta@amd.com>, 
	Nikhil Agarwal <nikhil.agarwal@amd.com>, Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, linux-input@vger.kernel.org, 
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-pci@vger.kernel.org, iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 02/17] Input: serio - attach manual drivers through the
 driver core
Message-ID: <auzno3uoL5Pfojfl@google.com>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-2-1e536825b4eb@nvidia.com>
 <auy2plYVi723Qt42@google.com>
 <20261105191940.GI8298@unreal>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261105191940.GI8298@unreal>

On Thu, Nov 05, 2026 at 09:19:40PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 05, 2026 at 09:05:29AM -0800, Dmitry Torokhov wrote:
> > On Thu, Nov 05, 2026 at 01:42:15PM +0200, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > Manual serio binding connects a driver before driver core can admit the
> > > device. A rejected binding therefore arrives after functional setup.
> > > 
> > > Keep the port ID check and use device_driver_attach() for the existing bus
> > > probe path. Driver core then serializes admission and handles probe failure
> > > before publishing the binding.
> > > 
> > > Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> > > ---
> > >  drivers/input/serio/serio.c | 24 +++---------------------
> > >  1 file changed, 3 insertions(+), 21 deletions(-)
> > > 
> > > diff --git a/drivers/input/serio/serio.c b/drivers/input/serio/serio.c
> > > index 54dd26249b027..604440244c1ca 100644
> > > --- a/drivers/input/serio/serio.c
> > > +++ b/drivers/input/serio/serio.c
> > > @@ -81,28 +81,10 @@ static int serio_match_port(const struct serio_device_id *ids, struct serio *ser
> > >  
> > >  static int serio_bind_driver(struct serio *serio, struct serio_driver *drv)
> > >  {
> > > -	int error;
> > > -
> > > -	if (serio_match_port(drv->id_table, serio)) {
> > > -
> > > -		serio->dev.driver = &drv->driver;
> > > -		if (serio_connect_driver(serio, drv)) {
> > > -			serio->dev.driver = NULL;
> > > -			return -ENODEV;
> > > -		}
> > > +	if (!serio_match_port(drv->id_table, serio))
> > > +		return 0;
> > >  
> > > -		error = device_bind_driver(&serio->dev);
> > > -		if (error) {
> > > -			dev_warn(&serio->dev,
> > > -				 "device_bind_driver() failed for %s (%s) and %s, error: %d\n",
> > > -				 serio->phys, serio->name,
> > > -				 drv->description, error);
> > > -			serio_disconnect_driver(serio);
> > > -			serio->dev.driver = NULL;
> > > -			return error;
> > > -		}
> > > -	}
> > > -	return 0;
> > > +	return device_driver_attach(&drv->driver, &serio->dev);
> > 
> > I am not sure how safe it is, serio (and gameport) have pretty elaborate
> > structure and locking rules because they can recurse into themselves (to
> > support case of Synaptics touch-pads with pass-through PS/2 ports).
> > 
> > But this call is for user-initiated probing anyways, I am not sure if it
> > even needs "trust" handling.
> 
> This patch does not change the locking; the lock was already held on paths such
> as the rescan path. This change makes that explicit.

Does this enforce synchronous probing?

Anyway, I would like to get rid of this special probing in serio core.
Given that the code path is only triggered by explicit user request I do
not believe we need to worry about supporting trust notion here, so
please drop it from the series.

Thanks.

-- 
Dmitry
