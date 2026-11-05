Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793898126;
	b=yk/xNDEgc9VeooMJAWNrxskuPa3N4UuHmsw0U8ArWV6ZSXptuDg6m6Y0OhFpVUUv6uB0
	 qgQfQZM6Lz8sWVa8v1nn+URX6ldR8Af6nABxleq4aQzX6uMnS/16ZYJc8+FhUEXt7ubuS
	 LQ+Wrhq9fs8cwPBfbl4IhRHmZFrnhhstvpgBac76Bgd+eVaxSo4s4s2SHJW4t1uOeAmHT
	 aQ/2U1ukuBkhiMBkssRTo0DJLfUGhEJZA4fDLK6lFOmHqN85CBnmUPQdvAvr1vCdZbRTv
	 JKjCbbKvlKAPSdX52ihNMaHiH/d0lhD8v8G78nVuBbd3W4yPoqJlJPlHq0wDI9aDRUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
	b=bAxGhFugluQlVmQsCDUgdfCrN3XnZWSEktd5kCriNMHo6MefINecrJ88c5cZD96I/iG8
	 8F9LjZDoXb5iRYj3E+qHAxJ+70fLouKKJMDR1qCDnib9ARwzjWmQNaFo82E309K+fPput
	 FJyukdN17c9/WuJuWjx1sFwkG+Sxg4EXGOh1d7P4oHUk7mqZ2XaQ/q7Ibm/mePs7hiOu+
	 hyW3U0t3pxH0MulMMPeBmW1kGDMBKfjlZV4EvIin+7FwMAtJv1EY5mICa4iSoG5l23YGh
	 AMFtGKziVaWUw/IVrZImddgDLL9MyNL21BHQ97fSD4/kq6BSmm9guWv5/upAgyXiiZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RUc5cObO;
	arc=none smtp.remote-ip=209.85.217.48
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com [209.85.217.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F47606A333
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 17:02:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 11F47606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=RUc5cObO
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7cc365db987so1379056137.0
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 09:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793898125; x=1794502925; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
        b=RUc5cObOZ6O6+D0a7KmTBU3AgOTc8WE4LovmEw4x1QzzS7/ypDDyx2ySHcf5lla+CA
         5GBimoidWQT5MDI4ePZMyzVDUqUG1M3x/y8BwdQJ4GFzS2amN+YlDPwqvvlpXaKIlves
         V/CGe2OhW4agWFM0S7Tg4TynGn7JQuvpY4aZCO0YIXG51LJBORD1C5VvK88gNg+WdqA3
         XnHMji08194InHapylomPTlsgpazU3tAn1q0+7jM0Bud1hVUGx1nLQ85+19r3w6/S+qG
         TMFTxnLEsuC3m8sfZEXFzIvzWGm692mFY72FwTzjE4y+k4BUtaReyzAur5++rxtIHrxX
         6VOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898125; x=1794502925;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=E1zVtHMFtNJFSrWULrvIbtVVqDsU9/hCEAvj/Fm4m+Y=;
        b=Ns0H5kkFaWyfxgpJ/026YfWmVhMKNIozxJwqU2zSS6Pl6KLY5dyOJ77MTKJHlUwNMh
         cZsFGgnEcys+TR5nqoU/Z7LQhf21NKWySINhIVs+9nw8pikUrR7kfNK9d9/QW4IAugku
         sDgzmW9umtQWRggM2MVBCYjohkWvQmmFW7syDXdeFrf0TvZAO+mc7CoCxzk8gVOUdY/u
         FTN92kJxAxzEcUoJiEJUPcYoanSLeeIdhrNyIkGQ7jcAWWd5WYEgqcRd0xuewNuKhU6v
         6OPe4CusVIVqBtEFtcIQ5eVyDw0r2VE0mSMj4fSbC3oLpMhl2dFWzqCUNX7dYB0xQ3Jg
         dlIg==
X-Forwarded-Encrypted: i=1; AKwUvBw2YbkV+BayVWPjyUwHzMy1FYQOQtTFX8Im/JXnceWD0jjFSV2B3xbOtTqrN/0raedGU4dGzNTZit0vTw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9/yeTfOdxqN1XFcHA9jJE1KjnmFzgpKAf5IUZ7HBIpzJdG7kfw
	lOsesRMvlKRIk8/6Z2xPqFOaxwoyzia0kgBeJ+6Bg/qFJ06vN+HKdzqGlxXbi5AGhHI=
X-Gm-Gg: AYBFou2SHjUP5BUkZfaVdqZlPB88TqGU0DuxUEwaEXeZOXLH6kQlC111nwJ0Z2XV4by
	/6yeLD9dRgszRJycUiUoTs5fS7knjkIPqfZvlgL++xrUOK8vA9cUeZIWRp1dbQYgIHfVBgaz8xR
	CIz9Ao0JGdp5Qx0hcXcwEqikz4Bz54GBfbik+riwc1MbfgZoDpnKzRJPuvGxKqrRE/Wos1BoAJ2
	gtj5F3ExQEaB9WwlmWrqduNhfOrW+aebpd3ZF8P6rDggQD7j6BDBeJkMeUHcI+MLtrddBLWP5Rx
	PVuf4bmkR1ZHh73r7skABWIpV5taJ4/efI7+9GWVNlceFRpex15Ob30YqcSgyezW5wJk08+MIaQ
	CnX1O2vS12fgntRWQF5px5vJVq4pnBkmYSpx0EGnf4ThIUsf494vvnXazytXaI74hQ5QNpyoPLq
	lYGmCnC9iokwRjo7S4L7cTdL1CIprrG/vFSrJscNnvDmn+G3C4RzPMn9txuH2zJhkTC0AOGaurF
	JPGsvEOond356kgloS1Eonsbgbvbf64RaKFbGt4gJ+ZvMyXFQrQ5K6pd1tjofsrPGk/z+eiIKtO
	GgShYK+P+6nONty890frdchrbp9EqjvKDcWpAzWaXhsrqCs58d7P7/uIlHuchV4UnXLfOQm0tEM
	mHtUiDCBm4PhEvq/XDcDIKcA9RhSKXJg=
X-Received: by 2002:a05:6102:2c1b:b0:7cc:2bb7:1335 with SMTP id ada2fe7eead31-7d2a16c7f35mr120203137.33.1793898124846;
        Thu, 05 Nov 2026 09:02:04 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fd3e101sm4619225137.3.2026.11.05.09.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:02:04 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xP0qh-0000000388I-28Zd;
	Thu, 05 Nov 2026 13:02:03 -0400
Date: Thu, 5 Nov 2026 13:02:03 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH 10/17] driver core: Expose device trust authorization
 through sysfs
Message-ID: <20261105170203.GC663069@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>
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
In-Reply-To: <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>

On Thu, Nov 05, 2026 at 01:42:23PM +0200, Leon Romanovsky wrote:
> +		(RW) The requested trust policy for the device. The initial
> +		value may be selected by the bus before the device is
> +		registered; otherwise it is "default". The policy is resolved
> +		to an active trust level before the device is probed.
> +
> +		The values are "default", "disabled", "adversary", and
> +		"full". "default" lets the bus select the active trust level.
> +		"disabled" prevents a functional driver from binding.

For making this more general:

"disabled" prevents a driver from binding and informs the kernel to
provide containment of the device. For example a PCIe device should be
unable to DMA to memory.

> +		"adversary" requests operation with the restrictions that the
> +		bus and DMA layers can enforce for a potentially malicious
> +		device; it does not isolate DMA by itself. "full" requests
> +		normal operation.


"adversary" informs the kernel that the userspace wants to opt into
any security defenses the kernel may have to restrict and further
validate interactions with the device. This may have a performance or
functional cost compared to "full". As an example the DMA API and
IOMMU layers will avoid exposing unrelated nearby memory to the device
during DMA.

> +		Successful resolution to an allowed level commits policy
> +		and operating level before driver or DMA setup. Both remain

"before driver startup"

> +		fixed for the device object's lifetime, including through
> +		failed or deferred probes, unbind, reset, and driver reload.
> +		Later binds must resolve to the same level, including when
> +		the policy is "default". A resolver error or disabled result
> +		before commitment leaves the policy's writability unchanged.

Not sure what "resolver error" is.

Jason
