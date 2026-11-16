Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855860;
	b=SZO4UlPM/+RS36p4uzHz582wQ5SXr/LifvESoFDszAH3HGCFjNrBPsMBVBjZ9WaJaCjS
	 ZgKZv9zdgikxXZ4U9FuacoPYU+MHM2+Sz8wIHWSsdIFKeB0PP78t3zOiPl9l7Ls6px/SH
	 BViJpFSItuONxFb/8TuuCdJxStPEvSXyWgYm3CNvvXMW4so2dD/Nax0fBIOMGcQ6a3g0Z
	 hF1dwE4igP37hJ9UjmdkoJgYINv1R6zowgqSoLLl1FD7v6OE53t7wd1F1v+Hgc+bLbmSO
	 hlHAqEX3BFINjbwldffXNkFTbuveRNOUrtvgS8rlzWKifWyC5gbTVaeUhc5yZxlyxWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855860;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=WvOfbKHC1YhEa2QpW290x7cG/RSkj9nU3s9Pf1uScWc=;
	b=vVzueZ7lSCYU2HVzKsRkDeEtNzi8yE1wY0m8bPhGR8cxmNUeFOa6x7s8hbBETR9487RP
	 la+0UZd58S2k/wuJ7zW1+Ej4iAG2Ew3I6CIuuvTyYUyXtdKckinw/HRtO0Qbxd+JRtEuK
	 gcaSBHE76p5MT7cNPbC9mQZFyPJNJlRrd3Wx1a/kOSMsmMC5Ri9tWfJR+FW1EdYHXdx+y
	 VbxNcDo7UIBH7YpIDXGamDbdouFHMikDC+N/2Izo4FcWfHuD3MQ5LmDvVQkxhbRYgAvsh
	 O//HSWvzKjWvRVRaOUeRd6lWBDI2gR3XZaisNgXfM9nXOmOZHNgo16Z4qPgFXv/z7yg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="c0FDCiO/";
	arc=none smtp.remote-ip=209.85.160.174
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE484606A32A
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 19:04:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE484606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=c0FDCiO/
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-53664b4860bso48830271cf.1
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 11:04:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794855859; x=1795460659; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WvOfbKHC1YhEa2QpW290x7cG/RSkj9nU3s9Pf1uScWc=;
        b=c0FDCiO/SvHUN1oSXSerEuk/f9oAOPDd4xb5+sWGRVeAusTyr6TCni/+V7wq4DkYo2
         wyHGD38JVt/kNbDRUmHgzuoEbVlugnG3HWsyfBqVvGtWcEvySSCgGG51WBBo7mrsh5lG
         S/YviV77x6EshDEdufdQHwfEjp/9tiJBWUatgQIFpabgPHZdj05TFS/aasqgqA48igGu
         DTWgG2Jxr/ZhLzSOsNrVcF1e/MidQ1iwDLI9tR1tKz134Gx+uByw+yiLZua4UNMqScJZ
         A0GhGzyDtkaf2Fi9n864eeB3x736O68GPa8lyvDB92WwSC4mQuowod6APA69SYb5RWK4
         idIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855859; x=1795460659;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WvOfbKHC1YhEa2QpW290x7cG/RSkj9nU3s9Pf1uScWc=;
        b=WyMckQV83OzdyQuoRBODeeyNZelNfEUpn1COxpbptdyMqA3+sLBA3SCtdwTEI5NB0o
         cFCyucX/KywsX8yJSClRQXlek789JQwMFhg6p9xsBf7rdmJ0LF9eqozCYXDUOwGimC2/
         yRAfK+x6+QVJbdy8x/k19sgkCVpwv36VHusDa4UkzDnh5IGYYygdQ8K7tQLhc8FRqHFL
         hfz94lclZDIM61IK179OHBCa1P017p4t4uZ+Fv4XCzBPuj3xbY9Qt1ubACI5fXTsZ3ou
         TXH0SUWVAgJc2/b569AvEOqwLTGKYPj5OpeQ7nzPPrHCiv8wfiijPC+0EXXlbyvAwsud
         2eFQ==
X-Forwarded-Encrypted: i=1; AL+hErEAMKJ9KFKMd83bt+Rt7eOx5m0U3wKn6goc4RMEVimujEFsA9Xtnmpi6DOsUiXOtwFfaRkYUvinAwm87A==@lists.linux.dev
X-Gm-Message-State: APuU4Z8091H6P9do7qT+FZyWBh8uN3YdkuM1OmUPLJHbjU+nXQuhwxUS
	eOdnAGEZ7nF/JbwYoLSCYmQlWF2VHhLKWMeROgFcGxyGU3woLLw/kQSCUqRNLG/2uKk=
X-Gm-Gg: AYBFou3mx7/rQvxIQOCrMPWMQHpgznDdvLxiuy9eAzhGA6UgK/OJYBDOuANeTZ1dG74
	8DoKrA5KWRuwikjnRrIoXMg2cEQoa8eiYMnd2mdXoWSTR3+VzDRjWU0O6xfQ/K+CXDC2t4AKp+k
	Tm+ju9niyxg3jIN2p3jMag5KntFYsM7Qb/z86RJpo5gPJOtOAQ/KiSAN2Xe0I2C9HBnd7Rn0I7j
	xr+w82qUVo9EaIHuqqYvC3zhprgYMrqqwvE5i1cCnnnAzzCTIHGHSKz+fcxmVvSEs9uqejoPgUO
	OpBonAOvRdNRRyqfNZDMgnTrFzkw+6NURTlbZgbVEKbk+RMFrikPJJ7rhLI+1/9taCe3ycCkBE8
	ggp9+5tE4wKs4HjV/OWgYU6XFwLMQ7fHaViYlNuXUW0B79bVwLDbOjQsm7kJxF+rFzXUV9GL0S4
	e3x+kre8QXca1lPQsZ+iredjgT0Z1/r8g+3iYVs23h+CtV8VpphL9YLOLG/gPKmnOjscX4PFb5L
	Qc25bwkXUwBesbFzyb0/O6J/ANz3/zAYXDHGdQar8F75RrpxGwlP8Q+7N/bhvsOgWobKU958KbL
	XL0CBw==
X-Received: by 2002:a05:622a:124b:b0:536:9140:e2be with SMTP id d75a77b69052e-55ac948cc41mr174359441cf.74.1794855858824;
        Mon, 16 Nov 2026 11:04:18 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55ad1b13917sm87667361cf.29.2026.11.16.11.04.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:04:17 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT201-0000000AFsj-03Yl;
	Mon, 16 Nov 2026 15:04:17 -0400
Date: Mon, 16 Nov 2026 15:04:17 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Kameron Carr <kameroncarr@linux.microsoft.com>
Cc: Leon Romanovsky <leon@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
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
Subject: Re: [PATCH v2 18/19] PCI: Replace untrusted state with device trust
Message-ID: <20261116190417.GD2299285@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <193e4130-9c2f-4a0f-b218-f5fcf0b3d508@linux.microsoft.com>
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
In-Reply-To: <193e4130-9c2f-4a0f-b218-f5fcf0b3d508@linux.microsoft.com>

On Mon, Nov 16, 2026 at 10:46:25AM -0800, Kameron Carr wrote:
> > @@ -1738,24 +1738,24 @@ static void set_pcie_cxl(struct pci_dev *dev)
> >  
> >  }
> >  
> > -static void set_pcie_untrusted(struct pci_dev *dev)
> > +static void pci_set_default_trust_policy(struct pci_dev *dev)
> >  {
> > -	struct pci_dev *parent = pci_upstream_bridge(dev);
> > +	struct pci_dev *parent = pci_physfn(dev);
> > +
> > +	if (parent == dev)
> > +		parent = pci_upstream_bridge(dev);
> >  
> >  	if (!parent)
> >  		return;
> 
> Hi Leon,
> 
> The default policy here works for physical hierarchies, but there's no
> opportunity for a paravirtual host bridge to participate in the trust
> resolution when the host bridge driver itself knows the appropriate
> trust level for a device.

HW doesn't really "know" the trust level, it can suggest a default but
the kernel command line and userspace should always be able to
override it.

> My scenario is pci-hyperv in a confidential VM with a paravisor. The
> paravisor is inside the guest's trust boundary and owns TDISP. It locks,
> attests and accepts the device, then answers a VMBus query describing
> which BAR ranges are private and whether the device's DMA may target
> private memory. Before a driver can bind pci-hyperv has to:

Sounds like a user in such an environment just wouldn't use the trust
level mechanism at all.

What use do you see for enabling trust level but having all the
devices unattestable and accepted already?

Your bigger issue is the below:

>   - query the paravisor,
>   - refuse to operate the device if the query failed or if the response
>     is invalid,
>   - decide whether the device may operate.
> 
> The modular host bridge driver in this scenario needs a hook to be able
> to participate in trust resolution.
> 
> I'm also looking for the right place to setup MMIO and configure DMA
> in my scenario. Let me know if you have guidance.

Well, you are very far outside what Linux expects for a CC flow, and
these special requests conflict with the arch code flows we need to
have.

So, I don't know. Maybe somewhere in the arch code hyperv can hook and
say the device is special? You'll have to see when we get more of the
CC stuff layed out.

Though, FWIW, I don't like it at all as a model. Denying the tenant
the ability to directly attest the HW is far away from what I'd
consider as necessary for CC.

Jason
