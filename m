Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794320737;
	b=E+jI28/bdLqP6vAds+TRHB7igfc3X95kDBWbKtsdCfvxGygDybrAZjjIrU6JdzSKVOOg
	 lLSJ3K3/Y0MNyzr6dL1c7veDjj+AXcT6nYOi7F8GhchUD38ZXMEv2OwHYwKzQF/0PMWUN
	 //ILJLiThYo2Vkup8qe1bce+NEmzQm1FQ/qg2mRlFmymOxBBKFexObcvBbfh66o7PA4kN
	 kW6/xk9A0PB4b2Rjog318suhwRgguBkhUAyeGvj3DTPLit43dYzjYkJy+0Fi/XEY2fkUi
	 kGDWMnD2WpR1AA1+uyNggajUDNltidSULQzRGw+Zy9DMFU49IkVIgoXfc5mQ0LIStFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794320737;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=lkAP1m7U86A6D3jq5FI3LtbBiJBALHf/XTrdqm7iRv0=;
	b=YAewxVAuLuOjWnwc/aO01VSArpLyOmhEu1EQ+VlX9B4dUlcWdfmCsxz7Nxlsi9rH2Bvg
	 Yw9ivBVAeqFC0OKPqInO6VQLLNM+I9dYtx0Qby2Ny6BHftlCUFezmYMFC2cnt5jRcLM4M
	 ABDA7zQD30e8xu+8jBMe+1LdSu90IJ611o2h+cjNLFSWVzIwtrtn1Yqu8nCA0KRjDpxqF
	 WwLs2UrJjpDFZc73w6DCxMuz5Ec6Ol15a/Xmwu688zVi0vC8U1G+4UhVw7VY9ZSEpOyfj
	 WyCLrH5wDtJxaX0Rj8n8UyNuWzZ7VH3odZlVOIJthk8MSCpA1Hg3Y58QllxBCNImH3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Tb1L0E98;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2635606A9B7
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 14:25:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E2635606A9B7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Tb1L0E98
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ecdaf14beso20152116d6.3
        for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 06:25:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794320736; x=1794925536; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lkAP1m7U86A6D3jq5FI3LtbBiJBALHf/XTrdqm7iRv0=;
        b=Tb1L0E9852ZJOf8HrktZE2M3O82TtXr8fiLkmwjMSS9xr9mXkLAZ+fND6JJZE2QQ+B
         o48kWp196qj85pg1NPBjjt/r6L7XO5tjDPISlNhXoDJRLQnsbSfVRbrwWz34LtPfGjRa
         quoLiZjblE98/qXpZQcGK0aY0CuDZEj9tdgpIJmufWD3hMUrYLcoHT7Mtsm0pJQJXt4o
         LBTsMKIFsDSR7iJ69SmMleyV0XAYjqv9iqzH8UQeCRaeXEiEI806uL9uZrheuuDBtW5F
         6hFeUH6iSEUHTN60mRGwfTwisERFcrlvR2biKxC/VTU4tfoLPoYUkce3OUsk+fPV215+
         ZvmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794320736; x=1794925536;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lkAP1m7U86A6D3jq5FI3LtbBiJBALHf/XTrdqm7iRv0=;
        b=ZtEY80nsCl34OivhsGq936O21aPd7Pw64b0kKVw0QUDex4c8BZFc5vQSNtxw5lRBLa
         rp/SNN81ku0B7pADFRW9wT3/hyCY9TTJioy1yjWAaBC5Lq1rVQZ4NwVqxjQeOT2Ytvqe
         laxUmw4+0pQGK67kifBzl0sDgvVUBmrl8DC/F4n8JgxIXoqPku+dowfe5OCITkhpxf9M
         bNi2A+oGIvR56DYsIDn5pUrid+BinyHij4CLfIlw56I70kTmFSB/PsKqSdOR2MpM7Fyw
         sbI8IHthXWYmfZ/xzZCN6Zt+2vHpz+V1mdh5kjpRcx2w/ztpgMfVwx1xeKTZxhBdeuCZ
         o0Mw==
X-Forwarded-Encrypted: i=1; AL+hErFi6C1sXCoLI4U/2AAcBa20t5O4MZLKW6oIMcR4pbWqopNWHixYZawxYadOpP3OOKCYAUiJm/ayOE3GxA==@lists.linux.dev
X-Gm-Message-State: APuU4Z95d2zkS8/hsYLiUCfW6mPXvlGHz799+YbHL54mE7E3CX+TIvsO
	75hXzGXXftbS8V1I+g3+MAHSPa1I9sf5CLzcADopd17sIIuhQafiGbxQ6aL/eys0gVc=
X-Gm-Gg: AYBFou3tiYuh80j5GcXi56k0zgWHHcQFrhqf4tToTF+kF28AS5tJBuvprxaQgAoec+Q
	+yKO4sVFNcw48IX0EZK1Stq7xF7CpRrIZABR025Bx0yoMe0JhkC9qHN9xSs6Y5FXTv481hgHLGC
	DxwowmSuWzZq1+xOCWnKvT2ElhfAxEFQKdI/jwF2C8Q+G6DQwm/y8SgujAyRlb4Y+yWyoxusCJR
	4bg/cNxCkA6SWVQ03G1YaAl6pedcWowLOtekSsFskmGDfkEudD9EEjQlbjuPVK3AXBIMdTSqtF1
	TeuHuRQaqRUMBZuTzeUqv/CQBxAnT9Ay3tWAg0JINFEbpKqQuT1uKrFKvECbm/geJ5Usc/VgThw
	MDUkAgzJie5A2V9vwlPmpo+LTaEpPZyRyJNckRxULIE0wcxOFPZZA/W57s7r+uzugnzhxSmtx4I
	2qvYCVbk8poZbkZSDtS7KPY4o+JwRKvzDequIviFkxZW3b3EebCnsUbTMupMeFJ3cL/ZmHHHDfy
	HA6d7WlLX9YZlBF/Uz1FPxr/0kE8LR5JlRiOZSGO/1U3HInorNmGzRwy/xZes7VutMqH83FfMlq
	yDqEWlLXU14Z9cTZuOTSQ4BWSdQzsFfgeYvA9ED9snSmqJSARSkEfOE6KurBV1m+AJjfjq/hGaA
	9cgbmfjK2jGOR
X-Received: by 2002:a05:6214:5281:b0:91b:87cc:6d3e with SMTP id 6a1803df08f44-91eef628900mr47274136d6.1.1794320735682;
        Tue, 10 Nov 2026 06:25:35 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ef0501c1csm21854426d6.30.2026.11.10.06.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 06:25:35 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xQmn0-00000005tbF-1WYc;
	Tue, 10 Nov 2026 10:25:34 -0400
Date: Tue, 10 Nov 2026 10:25:34 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <20261110142534.GY663069@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <d0999161-3b27-4c3b-9d66-1d117c4836fd@arm.com>
 <20261110122237.GG8635@unreal>
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
In-Reply-To: <20261110122237.GG8635@unreal>

On Tue, Nov 10, 2026 at 02:22:37PM +0200, Leon Romanovsky wrote:
> On Mon, Nov 09, 2026 at 01:53:02PM +0000, Robin Murphy wrote:
> > On 09/11/2026 7:33 am, Leon Romanovsky wrote:
> > [...]
> > > diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> > > index b486b8bbd1fcd..8be2a246d4903 100644
> > > --- a/drivers/iommu/iommu.c
> > > +++ b/drivers/iommu/iommu.c
> > > @@ -1879,7 +1879,7 @@ static int iommu_get_def_domain_type(struct iommu_group *group,
> > >   static int iommu_get_default_domain_type(struct iommu_group *group,
> > >   					 int target_type)
> > >   {
> > > -	struct device *untrusted = NULL;
> > > +	struct device *restricted = NULL;
> > >   	struct group_device *gdev;
> > >   	int driver_type = 0;
> > > @@ -1901,14 +1901,15 @@ static int iommu_get_default_domain_type(struct iommu_group *group,
> > >   		driver_type = iommu_get_def_domain_type(group, gdev->dev,
> > >   							driver_type);
> > > -		if (dev_is_pci(gdev->dev) && to_pci_dev(gdev->dev)->untrusted) {
> > > +		if (dev_is_pci(gdev->dev) &&
> > > +		    pci_dev_default_is_restricted(to_pci_dev(gdev->dev))) {
> > 
> > I think this should be the generic device_is_adversarial(gdev->dev) now - in
> > fact probably all the dev_is_pci()/to_pci_dev() stanzas aren't conceptually
> > PCI-specific, just an artefact of the current "untrusted" flag being so.
> 
> I wanted to do the same, but iommu_get_default_domain_type() may be called
> before the PCI device's trust level has been set. At that point, we are
> still in "disabled" mode, whereas device_is_adversarial() checks for
> "adversarial" mode.
> 
> The below is from AI, I asked to present me the path for that:
> --------------------------------------------------------------------------------
> For a newly discovered PCI device with an available IOMMU and a new IOMMU group:
> pci_scan_single_device()
>   pci_device_add()
>     device_add()
>       bus_notify(dev, BUS_NOTIFY_ADD_DEVICE)
>         blocking_notifier_call_chain()
>           notifier_call_chain()
>             iommu_bus_notifier()
>               iommu_probe_device(dev)
>                 __iommu_probe_device(dev, NULL)
>                   iommu_setup_default_domain(group, 0)
>                     iommu_get_default_domain_type(group, 0)
> 
> For a device whose initial policy is adversary, its state during that call is:
> dev->trust_policy          = DEVICE_TRUST_POLICY_ADVERSARY
> dev->trust_level           = DEVICE_TRUST_DISABLED
> dev->trust_committed_level = DEVICE_TRUST_DISABLED
> dev->driver               = NULL
> 
> device_is_adversarial(dev) = false
> 
> The active level changes later, during binding:
> really_probe()
>   device_trust_prepare()
>     __device_trust_prepare()
>       WRITE_ONCE(dev->trust_level, DEVICE_TRUST_ADVERSARY)
>   dev->bus->dma_configure()
>   call_driver_probe()

The ordering here is wrong, this is a consequence of splitting this
into different series. I don't think we need to fix it in this series,
but as a followup. For now I would aim to make 'no functional change'
and still follow the ACPI selection during default domain creation.

The long term goal is to detect that the trust level is disabled
during iommu_probe_device() (ie we are running in a secure booting
mode), attach the device to BLOCKED (which should be a NOP) and defer
allocating the default domain.

This would preserve the DRTM iommu & ATS blocked behavior through
until driver binding, giving userspace a chance to do an attestation,
turn on link ide and so on before exposing the system to DMA from the
device.

Once userspace sets the trust level and binds a driver then we can
allocate a default domain using the user set trust level and avoid the
above problem.

For the CC VM use case today there won't be a vIOMMU, and there is an
indepenent control for DMA ENABLE in the TSM driver so this doesn't
matter right now for CC.

Probably put this detail in the commit message

Jason
