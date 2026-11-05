Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793896023;
	b=INODw6+LKy219u/zbpiE8YToEFC1pmsBDcwU9FOp9CYl5smzSbivPIRTSjSJd2Yz2Ul0
	 dNiLF4p6vPiAodrO/sCwTFxitLGb49V/zbgD/VG6K4hAoeHnraemFN8H8i192pa0Xlp+c
	 VjsKfWHuQtQ1A9GqjWjsL3FdsFNS2ukyfeVZj9Wz0bNc2jVoGfHwOhaEiz5eN9pLnKq4j
	 TOVMQuyckckWEvopq7W5AKxiBaOp+wE0bQxmpW3Mj8yuXJtk2QWMillGAF5gR0CQmogrv
	 JRv8eQMbOrItRD/8MA1DD7ygRrF3t9Z8IRRhzk/jj6EoC+T8Oww10/OgDebsV4EtZRQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793896023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
	b=RxngfYjTKMLAezwkygO0tMvOE6vzhaArwPUfs9faS5+ig/heV2HPGiC3fivx+euwlxZ/
	 X1tJhojdL74fVsFQ+sZHUjpt65b5PtMYs3Db/ZLT7K3ePvK3ojFJ3O4TuTypVY24DO6Nc
	 zfdoC9GYBTBymjOt/FkHgg6qy09+xmLR5zEaZ78zQF/isKKCgf+wEizRoGaZyO/ll4C8q
	 t7rffTgQwYCWTvRzI9cXQpowytRDIhV8A4xXPRecJ/DY1R5kfLrFL4BtreBXVTWuZqU7X
	 GRC/tbOo8/pxhJX/T1430qXHvBDOnna27zd7TKnIGPTvxPBno1Stj6lCA2NS62VZ2Wg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=H1OQVHcQ;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9293A606A32E
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 16:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9293A606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=H1OQVHcQ
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7ce77f98658so663018137.3
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 08:27:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793896021; x=1794500821; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
        b=H1OQVHcQ1uAjCjVR8BRgJ48YlfatlDz4giWern+6CduNzr5+DwC1ER44CbAFxGx0Gv
         ToxPmzQ7/J+YZpDH1rNcL+CbPzjbvrtlVGghwQtrdptiawPkP2U9QsW6i15STQcANPjp
         w4viNeXRjgOodbGSjAvkJLEZiyL/bsSJuSDDQNeCa3jDQYbnHCV/uzQMDQ0MQSfKrXUJ
         qu4lYckMSRhMHHXv1v2ChvIJGU/JFtGDF0AejhYQ6ajAmFp11x5kUEysunILL2dD0TLA
         bnkR1dvFpyEOAsYZNxFf78CeltEyOQjkAUnGlkkiWJtqIsVAKQhZlQdnYobqU0Rk2zdP
         uSOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793896021; x=1794500821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=auiIKhbmoRZT4mFY+NhWtro4ChWc0LCFT6CcONkj2hM=;
        b=Y4UPqjAoGm9tpB59jK20NtUmryUtjjOjpU/ISPIgiYYS89En4Y/E9Yh52/CkBUe8ti
         fE505h2NZFcSq9zk41RZhrvjGoIRlLI1rC4hY9Sgi5/kjLIz8vYP7fnG1kvVU+uBFmcj
         XX7ZmNbcUuHULQlEZ/ysg26XKs2oIDH5Jm74I1QBrlN9j1KECTRyHuMAjfczy13AZmLx
         8QDq8JfLXsPEMKGmS5+Wpyf4ebdfPO7EzETzbiPqqXI5qJrPPYGAZUeDWEQm0UsKJaPY
         Pc3QrEj4FJbEulBcLr6Cchv0vUBcM270qOocnyFXm0FtDXOILEYXBNe/dRyGdQTZJoUh
         S/+g==
X-Forwarded-Encrypted: i=1; AKwUvByh6Uplkm7Gs1DCwHt+KATojUDDJXNPyx/73tNl+eSLMBAGwK4sEiOfPUeSh7GntKyA07qWevS5Ts2HKQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+EmePQvwNGh2t5r0fNa0D7j0+YmeU2cC+BdJnoG09HKwJabaut
	FgGALZDm0R0Q5E0ju5EvQa7q8N8W0xjFZQnZgjbpIr5CmbHykaQgA5KlrzAHD64lesM=
X-Gm-Gg: AYBFou1H33FUOzAmu4kjQxouGkLIF6tOKY5QwsfiioPC/igVZExx+xAp5Hz8BXJWc8y
	eF0aevnDc0yy+Lq7bN1WXFrLzoZ0AZjYSkbXTy34qVL8sOzxoWmtnlLx4HONvgJmB6L/pMMMp+q
	jH87MaHtv9U7yc77ED6ES77CBCJ1Jly8TdhMsBNVF5bjKLp0Z8Rd7o172ch/SspmuXELeEmr+wY
	hv17QySiazGhc5UgsoT68OX9bepWgQjanFbqe5lBj2+N4Mreh2UTs+jIH8u24jVcPIpqL+eRDFb
	vAlcCXsBiPS0ls66cjwiaWinp2txtoFTL5EB9bhaIIVSBChvY301qJzWZZWkoDStGRDJn4xGMYM
	3N8zvFAzqTS2yFIVyQDnBCDmBo7Q4OAAyeUIkf18BBdk2x4kJndYnP/4BVMl3YUO2n5uLG7KAhR
	lxOZWirCO5MoLuPs4uOEL8b138RkStT2DHxNv/d+EhmXco6vNNFsbVXuU67lS//wbwusovwyoDz
	BHYm0TVLHJSEepnJC+7dw44xPDGuVJXw/uhiO9ImmE8A2zPOXQUCm9VVkqy2pRwT7hsakIn3CYf
	8rpAcp13+TbqcBuO1K3Gct1vuseJEcS6DxFVUbcHzqtBZdnojWxWeOz/yBLZazQzPzgYxr4U7rk
	2lNV66paxIeedTfRVrVQ55GHDxPU5y3Y=
X-Received: by 2002:a05:6102:3f9f:b0:7cc:174b:f7bc with SMTP id ada2fe7eead31-7d2a15715c3mr29296137.15.1793896021174;
        Thu, 05 Nov 2026 08:27:01 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fef4ed3sm4667110137.11.2026.11.05.08.27.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:27:00 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP0Il-000000032XP-37xT;
	Thu, 05 Nov 2026 12:26:59 -0400
Date: Thu, 5 Nov 2026 12:26:59 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>,
	Vasant Hegde <vasant.hegde@amd.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	Johan Hovold <johan@kernel.org>, Eric Dumazet <edumazet@kernel.org>,
	Marcel Holtmann <marcel@holtmann.org>,
	Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
	Nipun Gupta <nipun.gupta@amd.com>,
	Nikhil Agarwal <nikhil.agarwal@amd.com>,
	Pieter Jansen van Vuuren <pieter.jansen-van-vuuren@amd.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-input@vger.kernel.org, netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-bluetooth@vger.kernel.org, linux-acpi@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-pci@vger.kernel.org,
	iommu@lists.linux.dev
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261105162659.GB663069@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <2026110526-aerobics-correct-4c06@gregkh>
 <20261105131856.GA8298@unreal>
 <20261105140352.GF3889730@ziepe.ca>
 <2026110558-tartar-juicy-036a@gregkh>
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
In-Reply-To: <2026110558-tartar-juicy-036a@gregkh>

On Thu, Nov 05, 2026 at 10:43:00AM -0500, Greg Kroah-Hartman wrote:

> > But I supposed Greg is asking about /sys/bus/usb/devices/DEVICE/authorized ..
> 
> Yes, that is exactly what I am asking about.

It looks like that does the same basic idea of delaying driver binding
that this series does. Hopefully Leon can harmonize it to use the
shared trust level flag instead of a usb specific flag and retain all
the uABI around it.

But, even with this v1 the user can choose to use the generic trust
level and ignore the USB specific authorized and get the same
functional outcome.

> And I know there are other types of devices that will want to use this
> type of thing (i.e. SPDM seems to be spreading to other new bus types),
> so it's good to have and get right.

Yes, we are investing alot of time right now in trying to get SPDM
uAPI right when we bring the general framework into the
kernel. Everyone needing SPDM should be able to re-use it.

Jason
