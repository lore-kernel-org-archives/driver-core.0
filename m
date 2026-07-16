Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782AD43F4D5
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 18:51:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784227912; cv=none; b=cHE0zKgnuSNa0LFBwXrEbqFBEBtRHVOno1+DZADODqzDAuCqM8uW9aaRiXBgJDoXS+EK2/0Eb7hgxItsTfjbCEOraaEA1oizfLDHrDFLEG4bBSehHdcJX0avEQh7A09LCMG0dVN3QdtDmeyUdRkUyt+zZl/dD1JCPTzeYtFKne8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784227912; c=relaxed/simple;
	bh=4bJIgiE3HonejqKK7Vjawe+q2GD14loCayvk2h1zWhc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MrA3Q9QBhvH1sfed/7VJXG355vQyKCOgTBM97NKx7mQnTcxOocd1n5j/jawipDxqoM98ZrtAC9tLewmmzE7bzQs+02ZU86tDFaMjSy+Oji01gDOg50s1ZHIHSfTYVdQWOgMOKVhP1V1iU0wn4AEu533DUy1VZFb9K9V8qu5WaoI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=Ew8fXoUx; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="Ew8fXoUx"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e5b048375so480595285a.1
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 11:51:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1784227909; x=1784832709; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OAkrfDnB3prGpVSnx0B1oizbRH8N6Nto1hj4Nx1zHR0=;
        b=Ew8fXoUx8Fvw3+h7LBbPPdpexzDq3xRhxbsRErvjl93F0f80owexEv0aLJaDr3hhqk
         0Wkn49SJkLLMqRb0vluRX95AXKo+A72YET1ZAajq3u7kjEL0PbkN8cpe5GqbIz8aakGs
         wvImrAZrXWT2yxQ2eL/E/vgP5SOHC7i6/7OwWuLhDSe5PBLP5YznQccWNdMteyl7jDY+
         YyTOIoV8GNZyLUclPnl4RjCungM2DmJ5lcwAGCJTYqkOudLkZafvh0AC78ZNC0AuvfMF
         HK6XYHwcgOXaTEmkb5u3m73wr3UA4wfqSciro9GM63kBLmNjFuTwua8NTIsoQiCuSuyM
         ZXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784227909; x=1784832709;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OAkrfDnB3prGpVSnx0B1oizbRH8N6Nto1hj4Nx1zHR0=;
        b=jroFQKW/Vo7JahGIgvp1C7glZVvUjbgNl8eJrQkGeyjrdPF9HCtGdXk3SaSMDG2jg/
         NOlyaggQx6eaDCBR/TBtBtW3kqqXy9LprZKMhg6HUWKtKlPOFrnNeuk3Qg0VDXzLyuCY
         aXifHve/FSLsiJcol0QsWFAjVbxlHJfkeIb8oWn+bboiLp56KbdzplmsCZR0TJfYWDHi
         fkL4mwtuD0NwE+l45obyUHnhAlgJ5vJ8jmeFJBM7jCZfb3e2X+ixJvX9Y3L8fiBFFzzM
         Zr/r096k1/pc93+u17ksmjRHbbqcBG3LacS5BbRXFO++nqsbvjZKlsQX+YyIiWGOvQOf
         VTAw==
X-Forwarded-Encrypted: i=1; AHgh+RqvM6eQL7Z9HdVVRe8o6PRsm/w3ivaM2ILUNlE4jpF4ppi+WfqmzBlp0YkU68wKVEJ9oo8CLGFg091HDw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzks2uxLFqQ97PrIliPUU+P5X3GFtSAqNNABvcvLxT8gvWKmHuw
	M7op61PSEN1aCf/3R6PvEOP4n3DLkfh5qSEB55+oHcR/SeGTrXbBuqFUrInfl5e74QY=
X-Gm-Gg: AfdE7clpfyjyjGvmXh1w51y/SBpebROkZJDoeLzOxQq+2ihboZsPuw3GVg8DE6Iv//S
	SEGtmrFx+Xg01l7PjXoYnAdNMLcVsElPPUHnQrMhodC8t+vC5zlbqJ1gJVC9B4i+p5ux191vBq4
	EIUy+nZ4z50uVccIzIfpKtM1W4wguESTKKT34G/nHPBrrtBV6UaW0uMISS+vsS5Ui7ehALAFLth
	24hjSTVSQP4nTDlcquRf8yUIU8MOUhGhEi04l6ccT9cpdnNHHQw6jcsXT6DffL0tQxCXdB1FEyq
	X0ujVFsl65l2JiCeVQSIytkc5aHa266uQHxd6zXp1Otxbcaifkcvz9h9ITjUV7sMHOkmc44ZBSA
	PHJk4ffRj9ar+OmirJJ6uqkcqOrbW8sSnNXoAqURsAXhkAYCsRq+I6PQks1LM
X-Received: by 2002:a05:620a:4456:b0:92e:c117:5ee6 with SMTP id af79cd13be357-93086c5518bmr1250174485a.82.1784227909170;
        Thu, 16 Jul 2026 11:51:49 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5b93387sm2219740985a.16.2026.07.16.11.51.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:51:47 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wkRBT-00000002uUu-0oRt;
	Thu, 16 Jul 2026 15:51:47 -0300
Date: Thu, 16 Jul 2026 15:51:47 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: "Dan Williams (nvidia)" <djbw@kernel.org>, linux-coco@lists.linux.dev,
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev,
	ankita@nvidia.com, Aaron Tomlin <atomlin@atomlin.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Petr Pavlu <petr.pavlu@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <20260716185147.GA643346@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <20260706125140.GB107792@ziepe.ca>
 <6a4c163072c60_174db6100c4@djbw-dev.notmuch>
 <20260707124321.GF118978@ziepe.ca>
 <6a4d95fcc92c2_2f05d5100f7@djbw-dev.notmuch>
 <20260708143153.GH118978@ziepe.ca>
 <6a4f0b35683b4_353c8910011@djbw-dev.notmuch>
 <20260709133601.GJ118978@ziepe.ca>
 <0cc44c9e-fc2a-4c95-a574-de833117f6dc@amd.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cc44c9e-fc2a-4c95-a574-de833117f6dc@amd.com>

On Wed, Jul 15, 2026 at 07:04:44PM +1000, Alexey Kardashevskiy wrote:
> On 9/7/26 23:36, Jason Gunthorpe wrote:
> > On Wed, Jul 08, 2026 at 07:45:09PM -0700, Dan Williams (nvidia) wrote:
> > > > force_dma_unencrypted() does not *prevent* device access to private
> > > > memory and provides no security properties on its own. It's only
> > > > purpose is to inform the DMA API what the HW restrictions are for
> > > > doing DMA.
> > > 
> > > Right, to be clear, this mode's security properties come from never
> > > asking the TSM to enable private DMA while the device is in RUN.
> > 
> > Ok, that's a twist I hadn't thought about. I don't see a reason to
> > support a driver probed with RUN but T=1 DMA disabled by the TSM.
> 
> afaik you cannot have RUN and T=0 DMA at the same time.

Right, that's a great point. The devices we are making simply won't
do T=0 DMA once they are in RUN, I expect that to be the norm.

So if you disable T=1 DMA at the TSM then the device doesn't work
anymore because there was no standard way to tell the device it
shouldn't do T=1.

> I configure my hw to allow "accept" (== T=1 for DMA and MMIO) but
> still only allow unencrypted guest memory for DMA (set vTOM to 0 to
> say "all unencrypted) if the driver was loaded with "trust" other
> than "full" (and this series does not call the enable_dma() hook if
> not "full", Dan is changing it though) so the module parameter
> works...

Yeah, this would be an interesting configuration from the TSM -
support T=1 but change the T=1 translation so that only shared memory
is mapped. vTOM on AMD and other tricks on other arches.

But AFIAK this isn't generally supported so I'd just leave it out for
now.

> > I guess
> >   - The active trust level should be RO visible to the driver, iommu, etc
> >     It should be stable under a bound driver
> > 
> >   - The "dma require unencrypted" property needs to RO visible to the
> >     DMA API and stable under a bound driver. This would input where
> >     force_dma_unecrpyted() is in the flow [the name should align with
> >     all the other per-device DMA API specific properties like seg
> >     limit, boundary, mask, etc]
> > 
> >   - The requested trust policy should be internal to the driver core and
> >     be converted to the active trust level right before probe
> > 
> >   - We should have ways to enable/disable all DMA before/after probe,
> 
> "echo 1 > unlock" should do that (but also stops encrypted MMIO) or we want a finer knob?

You shouldn't be able to unlock while a driver is bind. I'm aruging we
should also be able to keep the device in run and block all DMA
through the TSM.

> > TSM is sensitive to accept, not the trust level
> 
> This makes the module's "trust" parameter useless, right?

Yes, ideally it should act based on callbacks I think

Jason
