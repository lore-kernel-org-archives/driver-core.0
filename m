Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835249;
	b=3chYPC/9sZRTzTrAqXaT6hfIXvp192mQ8RhEOQqITAXG0nj84KFP2nHmqmpLAOAdEyJw
	 z5q0n23UvML/HcKKm2CYSfYx+tlp19RkxFR7pr5VVKvFhM5M+rGEE0P7rDMYqhxLpy/C1
	 +Zce6p+0lnhpuxsNrcsAiIJxSD+ZdeiRLZlsc4lmlVHP2/Zaw0F6j21EU47eQ19dVKmg2
	 INCn22dJfq+ZtlOd5gYjfPFn/nA+XdJApqcqpATaw702+ptmG7hjk28CbO1PeNkDqIhiT
	 ZNgV4B1pvdJiWqf9rnWZRjHXnsoLhjxl5XVT/1PLVfoMGvK5iklpcxozd6G8kvM9txw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835249;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pW6Ljdl+VPjn0HqbJ5aXeG19kylCTPtUMbKY6fBA+PE=;
	b=gylDCyY/dBKf5d1me4bn+vsfXVpufDSBKiJZb43IPPFC7OVcRuRzeK30i7AUBUGOAu5Z
	 WQQcsqfYWcXGHQYmqseL/FMoe/6Tsu3mTgVidYPYo+dzJiJVyekprnCxz81NzVNZCflxd
	 ego6Qlslp/kiAilNHHX5/WNP2WZ+SBP65C5XNxBtwyALzaxMAer6azhqbm1HW1svxPoZ2
	 uTjai8lP0SYOZDMLShgjrHjex2sbx8k/gFLsP+ob/Oy+06V1mbFPnd8N5mgtikEcYtqFO
	 5nbXeCjN118KvMbnE5ty7U+JYkaNNutCl2jGLmd+9s6R+MejlhWYDkiGX2GMcPNE6Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="bopOo/Mz";
	arc=none smtp.remote-ip=209.85.219.52
Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45993606A332
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 13:20:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45993606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=bopOo/Mz
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91f1e3dd08cso13821776d6.3
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 05:20:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794835248; x=1795440048; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=pW6Ljdl+VPjn0HqbJ5aXeG19kylCTPtUMbKY6fBA+PE=;
        b=bopOo/Mzq7ySDNj/Zr8bVV9LCsaeSWwuU+C3SuF/f1K+3JGvkFVtiV6QbyS2xso80Z
         HihaREdtgjCOGPbAKwP12V7CeKqVTdlhIrm5d3YmhOVBcAQiUZ4FYtOoEn3QRn5D2f5u
         D2q5LISfFxkGD80I5ph9O0BXEcG7LWBlLfq0nFPu9kaxyd3nK/D7GdLtHFNJetRmpnI7
         Au+OxkSNljjCh7HsHBBXesOAmxNu4nG1OroBiTiLFFfnS0lRpcVVq9tYR/h8bPg/9+ot
         0eu+6GqSeaugqdSj7udORaibsbajRco1m0rZLrdm3QV3ZVXn/+1Fq3nHRrTaT4ZiGp8P
         RQ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794835248; x=1795440048;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pW6Ljdl+VPjn0HqbJ5aXeG19kylCTPtUMbKY6fBA+PE=;
        b=OanpyS3WXBkGDpHkXptbj0oYZnaf2V1kyjlsm9C+VCjFOKBG0oDFq8ptw+EU7xnxJl
         gr6kGGXjl73/g8ucVFMAZ8FzLnO/3WWhwhU67YIOgSCfhbxTAv+rTJMYyF08ZE2soC4f
         Jn/mg0p9G3TUKHiqahrLzp0tws8tAnzZhYoXags+7sL5UarfiVBz6caUFiCif+l0H7+4
         SBdnO58SwLHbGK/yUpTz6YCSaAECChSMLsge9FKOQsQ5MG59QhVZT+qzb6shkDvauUmV
         l37pEsPT5nUnI8OwT6pDATLX4hWBloEinC4vnyH7BwPm3iDISSY5cznH44pMg2h8Wl50
         lWyA==
X-Forwarded-Encrypted: i=1; AL+hErEyk91pAoXpLnrFeJMTuNkqfWFlJZhNJk5OckpKbCZTJaKBgdBhdLElYXOZd2BULsIDw3YdR3uxp1qdrA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/c5d7zMGcmEwTayTM1EVdVMc+17aO09zwpuRj6m3+oD9LQcmpw
	ZneU6Y0bPTDbic1StXbb502NDRnFowFuD+nwgKhPWmoLPOybYfNmsweG3r6gwl6KkNo=
X-Gm-Gg: AZFdTZflueEgmTXPuozVuvTAFZunjlr/lH7ZvE6lxV0U9vdWmJS+tmOG4KHOFfKRg84
	5qkM7TSEtXaVh2kv62iQt8COMt4dB0c4UUZ0YRN1MTOqSR1TGJc43eRY+pMBQQwc5gZYCO+n9wB
	fEXXXoUXkD7QQ2k1LtDbmx301fVnWVQwVUkw+JDvCbAULO9ggIusLtbyyohNPrzyiCL0PFKFf+7
	30jsffeA/eihA2/P0FtjpUPFFL4jqYBvJUn2vcCGub+fZpsX/VjzcK4A65KDHZsH2sT2RzlefvP
	B/9C8pjCnn+oqJb+ZMxjatHDVwuPkIcNa3kE+07wwkCIdYbKwQMzhmBR1z6CjWz9v9vC5Owlfsk
	JIvkO1qQJtGYzmVFRPiFMc4gbCszEInsjZ5HT781LlzJr3OQwCnZMLnAd0oRRB/lRKlQC3fM2aH
	eLOFwWht+1ZxuO5xrfbjA1V2D3KHqTXLSWkUalpTAkG8rc4m1H3XUCdex1Tekj6yA9CtV/bvyza
	CZhwKqYBt5Sv0VxuQoN7Me+CDh0uX8wZ4phaMtzDdBuNBO0ww/boqWp5N2UxnYWKCWokUcFXHt3
	LaOKIg==
X-Received: by 2002:ad4:5744:0:b0:91f:3230:2a4 with SMTP id 6a1803df08f44-91f32300351mr126741416d6.53.1794835247815;
        Mon, 16 Nov 2026 05:20:47 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm85758876d6.28.2026.11.16.05.20.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 05:20:47 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSwda-00000009KhK-1awf;
	Mon, 16 Nov 2026 09:20:46 -0400
Date: Mon, 16 Nov 2026 09:20:46 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
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
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261116132046.GI2532299@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
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
In-Reply-To: <yq5amrr8yldi.fsf@kernel.org>

On Mon, Nov 16, 2026 at 06:38:25PM +0530, Aneesh Kumar K.V wrote:
> > +static inline bool
> > +pci_dev_default_is_restricted(const struct pci_dev *pdev)
> > +{
> > +	enum device_trust_policy policy = READ_ONCE(pdev->dev.trust_policy);
> > +
> > +	return policy == DEVICE_TRUST_POLICY_DISABLED ||
> > +	       policy == DEVICE_TRUST_POLICY_ADVERSARY;
> > +}
> > +
> 
> Could you clarify how this series will work alongside device acceptance
> and private-memory access?
> 
> In particular, what should callers of device_cc_accepted() use under
> this model?

Who is calling device_cc_accepted? I thought we were keeping that
internal to the DMA PI?

> My understanding is that trust describes the operating
> policy, not TDISP acceptance or DMA access to private memory.

Right.

> Therefore,
> neither FULL nor ADVERSARY alone indicates whether a device can access
> private memory?

Right.

Once you turn on TDISP you effectively activate DMA, just like turning
on the IOMMU.

Userspace then gets to choose how the rest of the system behavess. You
can still run a strict viommu with an adversarial driver even if you
enabled TDISP and can DMA to all memory.

I don't know if many people would choose that combination, but it is
there.

> You also mention that once a trust level other than DISABLED is set, it
> cannot be changed during the device's lifetime. If a device initially
> operates in ADVERSARY mode and later attestation justifies FULL
> operation, is that transition intentionally unsupported for the existing
> device object? As documented, unbind/rebind and reset preserve the
> committed level.

I think it should only be for the duration of a bound driver?

> It would help to describe how the trust framework fits together with
> those separate mechanisms, including which pieces are left for follow-up
> series.

The main thing it brings is the pause to allow userspace to measure
the device and put it into RUN if it so chooses before any driver is
bound.

It doesn't change how any of the DMA or TDSIP flows work.

Jason
