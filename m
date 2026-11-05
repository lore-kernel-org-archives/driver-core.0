Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793899480;
	b=g1ooPEDavoREaARmhWj/Z8YtZenrG788e1j3gdDXtFHZqw0bH/NCdChXG3Ecq/ZsAYIA
	 zJ2A+vjNygT9NaGHef4q/42Q/u0Cx4tiD3s3vqjQpQjlKHFCfGEkW5qGminBxCAKp4NPN
	 X+EwbsIf2YX6GPAZdk4DvFteuRqQp2FVQL13Ty6yxvnsVsRpNGGGQxcka3jI1HKX37y4O
	 hx0EYeo38s1KY7LBgUuWZn6dnPpKONkHjixPt8irYAh6QEAHkDDxKz5M0MKUWuU6HQfZP
	 qzHRkmPJOIhg3eRtwF5UGFGh1Qz0Tj8cHvCAGEAalrlCamw7V4KwBUmH/eq/NzALUsw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793899480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+Sc9yPGaNTmoDAc39XzEsbXpXvtl7Fk3dFBI/g/ZPmw=;
	b=KTwpcqb/fQkaanzfCyJmCfr64S6n1W7JZiOZQZTxJe4kdoEnlQCrhEaP2eK7MeuLAEqP
	 uC8DqzxuZS+woUAmv7MigAoA3xIXU9GkhpeUdZnQA+vqXD71NNfUjpogudKxktCgRHC1r
	 G8v044ZTqkK7WuEN6KhApZi4ArHXEXyLu3NylcoEQQISSgAkssA3fnrQ2SWNIG7bcZTgN
	 iCejzyMAXqJELYse1t4AzUAl7UfSVkFCFs3FGxsdlBjHTkn210WwlCWB8NTwLGwJuI0T/
	 q8LmRfj9goZVRoaAo7+fJAn6jTs2x8TwB+bBQgb0QgUvG9WR5oZfCyEor2K436T5mTQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=wB0U56+d;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88D35606EE81
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 17:24:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88D35606EE81
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=wB0U56+d
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-533778ab0bdso23563731cf.3
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 09:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793899478; x=1794504278; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Sc9yPGaNTmoDAc39XzEsbXpXvtl7Fk3dFBI/g/ZPmw=;
        b=wB0U56+dnYBxAhJZFcxp3M39nx4FSrFxtybQsmVG9510aidN1tTt2xu21n0Z8XZUl9
         +tAANCx1VKfE25ZiSElnEP3niYVUgWlPhnfIeYrHpueGCSwuhRwqofAAV0Zg2XqWgcgV
         MRTkgzQ0sVKh/we+x3qoAaqL8e7zQ1yFg8iugG1Cta+wXy5QIPvBpf+ddNexlD3Ikh8Y
         rkPSCCgKXv16KXdM3lvKvhh215QThS7LW/nhLJA1jmhpyLFsPYmYL2GyMC3q0hNQNB2o
         9vGU96QdPvzaMQlEfcPEBqvJXZKr/QW4cFzjtb+jUdPoRsVI/RBBBQZYmWCfetdbCI5l
         BuvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793899478; x=1794504278;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Sc9yPGaNTmoDAc39XzEsbXpXvtl7Fk3dFBI/g/ZPmw=;
        b=dSnEWppJt/hwDPtaLKhNscS88eqxrgCJIt+64TX25mf46VWbFjjRM+YY2FCpXBQPjU
         kuvuuP0Ssh96sUx8pZoGBn4+4xSsFdbyhQ0WVt1unFqV578zxxBMzIi8VzUx3lufZtiy
         wdRlhRqb1WAfpVS+IbJZD7OyTnTeHr1p0Giduzp8miUZyPstCMZkk8Kl+OjIKqzh34op
         eyLK+k+iwlHGae5hytdNuPKWCxokCq9B47EoULx/JIWWbgecX8QjPUPsz3aVG0NEjhi0
         Hvejb+rs7Y/t9zRkcQ6DabFqgkJereqgrYC8KY/r1+FupNNT+trnbcrAHgfs8g92+CXw
         jBFw==
X-Forwarded-Encrypted: i=1; AKwUvBwIC2B0xt2iR3HVC+tSyyDWn9/wSOyRvYrBiQQP0R/VELAQeS7NGZPT+3wmQqDRP/jCmeSyh3EJqfhMcQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/uxYauwR1TZPxDNQVuLHPiDv6h5ZAB5Z/RenmGBvH5WDym/9E7
	43y9bQbvjw9FqJlBEnctsHcVCxTPsFLzSz6Mnsjd8TmhU9NLlU4fzW9uzdoIbSFmTQ==
X-Gm-Gg: AYBFou3SWu5I2aUWhr/bx5EVrYLjTGGA9l1flaK2QL30ypnogsad0nleKZTrhCdiOn3
	a4KC5BrjMs4Ycme+cDOxTfV3ZAy7ZW9Rga5tC7hXIr0rlpT4cLIBpWwAPPvgXAHwOrrqTVvij6K
	5pv4rWNz4juyC75OwMklgYz84KI4TwIjHnWUEtMUr58ASWmHCR2hRYtl207TtgCEWCIaRrncjuH
	Ev8Uu9DZPYH87pCFqbN5zOLnZzKfQKbq+Yf2Ped0VcQD29NpImDbnA3/uC1Fegnru4x5c23NvKo
	hiBRD+bZZH3i20EYmsk6zHd+e7o+PMzadTdMwPCNVT40ag58HtZIDPgVRcxEWerXu4L1Luqw37T
	GsZTUAe/IcX1a+lmAnyYR5UrRexVqybw6DTSpYCFWr+TVUp6P7tSNPQ4xApkzsXkZKJeAZLoQk8
	QF+2UqZ+Ji9VgiLkeYahqntrRFADl6tBtpGbQ0zT+c7ndfMvPN6q0HPPiXdNb/PQvkrlbVRYVWE
	9vLES0CHHAGhBgE2E07WeuArye8JsjXZbC4BTWrlMiT7ER2yWygD88F5uGgD2lIRs8WlVERBOeX
	RKgdUO8+aMeLxWjAsW1LkuCcFhpl
X-Received: by 2002:a05:622a:2515:b0:536:52ae:d92c with SMTP id d75a77b69052e-542b6e55bebmr328898701cf.35.1793899478212;
        Thu, 05 Nov 2026 09:24:38 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10a6ca24sm57130131cf.14.2026.11.05.09.24.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 09:24:37 -0800 (PST)
Date: Thu, 5 Nov 2026 12:24:33 -0500
From: Alan Stern <stern@rowland.harvard.edu>
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
	iommu@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH 05/17] USB: Lock registered interfaces during manual
 driver binding
Message-ID: <bb83fe3c-cebb-4bc8-bfc9-24df1cf72b0b@rowland.harvard.edu>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-5-1e536825b4eb@nvidia.com>
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
In-Reply-To: <20261105-device-trust-core-v1-5-1e536825b4eb@nvidia.com>

On Thu, Nov 05, 2026 at 01:42:18PM +0200, Leon Romanovsky wrote:
> From: Leon Romanovsky <leonro@nvidia.com>
> 
> Interface claims hold the USB device lock, but device_bind_driver()
> requires the target interface lock. Without it, trust-policy writes can
> race admission.

This says nothing about usb_driver_release_refused_claim() and the code 
related to it.  It is an incomplete description of the patch.

Note that nothing prevents drivers from using an interface they claim 
before that interface is registered.  For your scheme to work properly, 
you should make sure the claim is authorized when 
usb_driver_claim_interface() is called, not when the interface is 
registered.

Alan Stern

> +/*
> + * The driver core refused to bind an interface that a sibling claimed before
> + * it was registered, and dropped the claim. Let the claimant release the
> + * interface instead of operating it with a bound interface but no driver.
> + */
> +void usb_driver_release_refused_claim(struct usb_interface *iface,
> +				      struct device_driver *claimant)
> +{
> +	struct device *dev = &iface->dev;
> +
> +	device_lock(dev);
> +	if (!dev->driver && iface->condition == USB_INTERFACE_BOUND) {
> +		dev->driver = claimant;
> +		usb_unbind_interface(dev);
> +		dev_set_drvdata(dev, NULL);
> +		dev->driver = NULL;
> +	}
> +	device_unlock(dev);
> +}
> +
>  /* returns 0 if no match, 1 if match */
>  int usb_match_device(struct usb_device *dev, const struct usb_device_id *id)
>  {
> diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> index a738d03c23eac..d35a7710c8ef4 100644
> --- a/drivers/usb/core/message.c
> +++ b/drivers/usb/core/message.c
> @@ -2264,6 +2264,7 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>  	 */
>  	for (i = 0; i < nintf; ++i) {
>  		struct usb_interface *intf = cp->interface[i];
> +		struct device_driver *claimant;
>  
>  		if (intf->dev.of_node &&
>  		    !of_device_is_available(intf->dev.of_node)) {
> @@ -2277,7 +2278,14 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
>  			dev_name(&intf->dev), configuration,
>  			intf->cur_altsetting->desc.bInterfaceNumber);
>  		device_enable_async_suspend(&intf->dev);
> +		claimant = intf->dev.driver;
> +		if (claimant && !try_module_get(claimant->owner))
> +			claimant = NULL;
>  		ret = device_add(&intf->dev);
> +		if (!ret && claimant && !intf->dev.driver)
> +			usb_driver_release_refused_claim(intf, claimant);
> +		if (claimant)
> +			module_put(claimant->owner);
>  		if (ret != 0) {
>  			dev_err(&dev->dev, "device_add(%s) --> %d\n",
>  				dev_name(&intf->dev), ret);
> diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
> index a9b37aeb515be..293340a48b6c5 100644
> --- a/drivers/usb/core/usb.h
> +++ b/drivers/usb/core/usb.h
> @@ -49,6 +49,8 @@ extern int usb_set_isoch_delay(struct usb_device *dev);
>  extern int usb_get_bos_descriptor(struct usb_device *dev);
>  extern void usb_release_bos_descriptor(struct usb_device *dev);
>  extern int usb_set_configuration(struct usb_device *dev, int configuration);
> +void usb_driver_release_refused_claim(struct usb_interface *iface,
> +				      struct device_driver *claimant);
>  extern int usb_choose_configuration(struct usb_device *udev);
>  extern int usb_generic_driver_probe(struct usb_device *udev);
>  extern void usb_generic_driver_disconnect(struct usb_device *udev);
> 
> -- 
> 2.56.0
