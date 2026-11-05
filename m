Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793909063;
	b=fRAvPBokJD51Q1OQVbVGxENswfH9AxDuf9yeTK62xobaMqZJKk9GF0QJvx2RYmiIs/mI
	 dc9GRlNFU+zkN4B5vt/1Cn26mFt0XStpdFG1AycUMY/OWqykjr8mAQj1iGSKSjRxMcngp
	 pdTln7ZmQa2lzxsniAoKXMme/Q0KHtgY3wANxj/8ItLvy7Wq3cjrlsAiO/A2NkCyXw7Po
	 kGo4X3+5ya0A4Ya/JJi/g9W+FPpm1VFxK/tLK+MKKfANJE23ppH6qhXjPND5wp/GW7p/x
	 F+HDBjFZJQHKfTUmUn6DNzK86j3YocQqv8D/OFCf3lrZ0ZB/Of1BW0VooeDwcMW7BKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793909063;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Aw5degZrQHo3V3rpws5+g22RRHe/seP3Fa1C54u6MN0=;
	b=0ND553toYfIlO3W/rgc1Iedmq9kq+TMl6m4yV5H86xJxdwKul1Jhm9qFxx6Cn3NbnMQc
	 QHuX1oWCZvJDcNnW+gylA36/xZKUe9EqMT+V7Jp+2KVWutnqJTkFJmU02fiwHsHYYXFbQ
	 OsAcADUziJxLxPMECMLCJ2Q4NHQDqg2gqNCGWLCr2s9XNRd6irU5GQ5KkIIWnlhQR4C6H
	 yJnfCSuoeLuD1iIs7qPThoEqHPLkUw7AVFACbunmfUmgxBt2rBqVPjzxaaJGq701+tHHv
	 sTsjNXbWpVZB5QJoHNHdv97SzM3e5V1n7CoWc35iQHKZzg0hGLmUI9xFQPNV5hA4u0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=rowland.harvard.edu;
	spf=fail smtp.mailfrom=g.harvard.edu;
	dkim=pass header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=oW8Pm7KW;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F43D606A328
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 20:04:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F43D606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.a=rsa-sha256 header.s=google header.b=oW8Pm7KW
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53397554beaso21893531cf.3
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 12:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1793909062; x=1794513862; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Aw5degZrQHo3V3rpws5+g22RRHe/seP3Fa1C54u6MN0=;
        b=oW8Pm7KWbFyYpX1ChRbjfDIxL/XoQnn4kqQO600FJv3JNU1NQeGTNZVRv+eMclYy1s
         l4zMYL19kKnMiWAllTfWIOITILeU+deZHz1TYVnSiPREFK1IX4fsVgf3SfKG1fxDIrvk
         OaT2iJMA/V2oewcEf/s4nkaZt4O+26Em2f6BkBBwt82v2iIt6DzpaE+pvsTxBtM3USSu
         qrCa8R9Khgeja799CE5PIIacuEFGxEUijPfAfi4wCOKn9s1YlToYWtwWw5nbGt9xZLMW
         /sdCsI2TDpNNN7ReNImPI+OsiVtk1HHMGKYPf49yRjgjSc9WP5Ng9muWjol4UH3KK1cG
         b7QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793909062; x=1794513862;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Aw5degZrQHo3V3rpws5+g22RRHe/seP3Fa1C54u6MN0=;
        b=qXCWSAyrQqtKpXjI5hWpMoLoD5NuD6bUaWPhVbi23G/bpNvM4b27srs1ZG2dwuBUqd
         u8F+FBwUI0X3WX8DHCqbphRx8b0jnfo0JApsYtBn8tHwmYFrGzrpVh9RceVgnv/KTovk
         SuX6nluZsPK+C3gtgG2XoVmW4TLb3djMT5pDunfUOFvPrijlE2YAKaXN00x9NUQ/eZOO
         sDC2SAHlziKluN6Reg0RJh7r6FI7PX/8V3yfnT2skRidMNDYHWBsgVF+goYhtF6g1DQw
         L7tK89XBcW0qxR/XvYM4Rk4CNBDBJMooRi0d2JXRv2b3P6rKbzN0P/8cUOYK9ohfWotV
         SDvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkSjQNVmgzih9s8qH9EWQB34slxMirdIVnHZIPcVxeZ8p4zIvsUYyQWvaxTcPpH/OqUUzu74mOAnHUuQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9KKfaBUDtb9jMEAaM7BWWUxW2oUt4DVuvQiPVCK/GgdFwcAK+S
	qBS3EchGCjqk5bjl2Ins2xAe2Ykqh302Z04Hb5c2K2LZPmsWVp1ZOJcajB/B08avcg==
X-Gm-Gg: AYBFou3NpEtIKTJTqkWbeCqbuiK4df5feM1i9JKJ4b3Ai57DDTAMtdGr1BPt+1H2eHv
	K9/rTZRLjELKFxiqIh3VbFsq4GXlIIOyw8/kFeQDcqpeo+tk1tdnX8PxWajM87FcORlq7549HBH
	vtANIvTbsKy/FWGnuibvw4Be8suxZONFFIaT+ehDtyyATLnBZKlWmdojzkv1sGqsUFG0XL6TNjy
	37r5UBWZrJTvl+EUdBAm3W/lYx1DJyu9/ylkw7P7ykWqKEf+j4Z9G+nBUW5SP/Aj1ysUI/VnWu1
	7clQsXOre+QwK9vzmRfAu79Cwm4hcn1fa8NonKcF0Qx45z+0U7QtvkbpWS4tVtY5wZQn/ABVxMQ
	X5OGKwdtiA2bdkQTrjjHNPVv7aa9lrf2mel3leMcSmjHxZQ0eYR+NN0FNUJWwTaz5r0MMIAWS/W
	tI4CNO5wES8WRuvFjO5HmqzCoS1Ghvt7+sBC4ARAYz4GGaVtbcn+1PwP308gG6tryCmAbD2IT0I
	o2CIedX/8LYolNcXx9OW3CNkLE/wVolk3RYR6ZXVEBx66UtUbeprPyGj1DFRfF4brEusQkRhNCY
	BLzXdWJiFUg0HIURtL61Pa10//5T
X-Received: by 2002:a05:622a:418d:b0:536:60e1:c87d with SMTP id d75a77b69052e-54e14266a2dmr6509601cf.35.1793909061778;
        Thu, 05 Nov 2026 12:04:21 -0800 (PST)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::66b0])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54e270167afsm1403061cf.25.2026.11.05.12.04.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 12:04:21 -0800 (PST)
Date: Thu, 5 Nov 2026 15:04:18 -0500
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
Message-ID: <bf756e50-c77e-40f2-916d-e88887426806@rowland.harvard.edu>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-5-1e536825b4eb@nvidia.com>
 <bb83fe3c-cebb-4bc8-bfc9-24df1cf72b0b@rowland.harvard.edu>
 <20261105184442.GF8298@unreal>
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
In-Reply-To: <20261105184442.GF8298@unreal>

On Thu, Nov 05, 2026 at 08:44:42PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 05, 2026 at 12:24:33PM -0500, Alan Stern wrote:
> > On Thu, Nov 05, 2026 at 01:42:18PM +0200, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > Interface claims hold the USB device lock, but device_bind_driver()
> > > requires the target interface lock. Without it, trust-policy writes can
> > > race admission.
> > 
> > This says nothing about usb_driver_release_refused_claim() and the code 
> > related to it.  It is an incomplete description of the patch.
> > 
> > Note that nothing prevents drivers from using an interface they claim 
> > before that interface is registered.  For your scheme to work properly, 
> > you should make sure the claim is authorized when 
> > usb_driver_claim_interface() is called, not when the interface is 
> > registered.
> 
> This patch is unrelated to authorization;

I meant "authorization" in its generic sense.  When you don't trust 
something, you don't authorize it to do anything.  Pretend I had written 
"the interface being claimed is trusted" in place of "the claim is 
authorized" above.

>  it ensures that the lock is
> acquired when the driver is bound.

That may have been your intention when the patch was created, but if you 
read the patch you'll see that it includes a whole bunch of material 
not related to locking during binding.  Namely, this part:

> > > +/*
> > > + * The driver core refused to bind an interface that a sibling claimed before
> > > + * it was registered, and dropped the claim. Let the claimant release the
> > > + * interface instead of operating it with a bound interface but no driver.
> > > + */
> > > +void usb_driver_release_refused_claim(struct usb_interface *iface,
> > > +				      struct device_driver *claimant)
> > > +{
> > > +	struct device *dev = &iface->dev;
> > > +
> > > +	device_lock(dev);
> > > +	if (!dev->driver && iface->condition == USB_INTERFACE_BOUND) {
> > > +		dev->driver = claimant;
> > > +		usb_unbind_interface(dev);
> > > +		dev_set_drvdata(dev, NULL);
> > > +		dev->driver = NULL;
> > > +	}
> > > +	device_unlock(dev);
> > > +}
> > > +
> > >  /* returns 0 if no match, 1 if match */
> > >  int usb_match_device(struct usb_device *dev, const struct usb_device_id *id)
> > >  {
> > > diff --git a/drivers/usb/core/message.c b/drivers/usb/core/message.c
> > > index a738d03c23eac..d35a7710c8ef4 100644
> > > --- a/drivers/usb/core/message.c
> > > +++ b/drivers/usb/core/message.c
> > > @@ -2264,6 +2264,7 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
> > >  	 */
> > >  	for (i = 0; i < nintf; ++i) {
> > >  		struct usb_interface *intf = cp->interface[i];
> > > +		struct device_driver *claimant;
> > >  
> > >  		if (intf->dev.of_node &&
> > >  		    !of_device_is_available(intf->dev.of_node)) {
> > > @@ -2277,7 +2278,14 @@ int usb_set_configuration(struct usb_device *dev, int configuration)
> > >  			dev_name(&intf->dev), configuration,
> > >  			intf->cur_altsetting->desc.bInterfaceNumber);
> > >  		device_enable_async_suspend(&intf->dev);
> > > +		claimant = intf->dev.driver;
> > > +		if (claimant && !try_module_get(claimant->owner))
> > > +			claimant = NULL;
> > >  		ret = device_add(&intf->dev);
> > > +		if (!ret && claimant && !intf->dev.driver)
> > > +			usb_driver_release_refused_claim(intf, claimant);
> > > +		if (claimant)
> > > +			module_put(claimant->owner);
> > >  		if (ret != 0) {
> > >  			dev_err(&dev->dev, "device_add(%s) --> %d\n",
> > >  				dev_name(&intf->dev), ret);
> > > diff --git a/drivers/usb/core/usb.h b/drivers/usb/core/usb.h
> > > index a9b37aeb515be..293340a48b6c5 100644
> > > --- a/drivers/usb/core/usb.h
> > > +++ b/drivers/usb/core/usb.h
> > > @@ -49,6 +49,8 @@ extern int usb_set_isoch_delay(struct usb_device *dev);
> > >  extern int usb_get_bos_descriptor(struct usb_device *dev);
> > >  extern void usb_release_bos_descriptor(struct usb_device *dev);
> > >  extern int usb_set_configuration(struct usb_device *dev, int configuration);
> > > +void usb_driver_release_refused_claim(struct usb_interface *iface,
> > > +				      struct device_driver *claimant);
> > >  extern int usb_choose_configuration(struct usb_device *udev);
> > >  extern int usb_generic_driver_probe(struct usb_device *udev);
> > >  extern void usb_generic_driver_disconnect(struct usb_device *udev);

Was this meant to be two separate patches that somehow got combined into 
one?

Alan Stern
