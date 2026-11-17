Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794873921;
	b=ncsO1ds+DmiSiuotwVLfAEh7GMQT4D4+qxKWFnS3S/16seNO7+aCRX9TgHjj9qbsuIOb
	 3XaXfsB19dZOqKKuhuru7u4C3SnAxv208Z0ZmuXCxMvNb4hKhrqY/LDDNd9FLSJZOi/Z4
	 5BXORZNIr7upK+feWjZkX99bJh75cil/l6UZXFOVlgBLAlRLacxB+wIBfx7R1ez+49J8n
	 keGwYmSGNNUC5Ey0S9cl015TNq/N5A+OphfwuRs3bJ8SQEncsVAXkDFFcrZaKB2RD9Aw+
	 Uy6R4ermEyVheUa1q7WWx0UPlWA8JvvQZF69u/Cw/raCZhCjbYiYGjV1aU0jHusFMlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794873921;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
	b=SsOT2YGGAEXbuD58BMefGAnAAfQpoGJVTYmGcOUhXnpYvc6HnugWhikBpQYxuTRw/dCJ
	 Z7y/ORinxi4l2iN+YIIIs2c/JSn/hLmOrXhp5FPEZ1jLxOrL6yyH5iX1gV4NdblixRXwI
	 igfSorsnVyXbYSWUWDrozcQFvtxnapyuvqNDsJhK2ilnw50/xgm91gI7R0kVVjmX4UYv1
	 CFT6VhLVpil/VrvzF/A3vQn1G30CbMqwZrY+fQ6bZVDj4oH9LQUXocRdikDkk3zajiLum
	 //FLMxkVcqEz3yeg7FblBxgTwXWYx3bAuilGxk9FsNtdYzMDZXTqnsb8TIIH4cGD4XA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Zj78psXz;
	arc=none smtp.remote-ip=209.85.222.169
Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BE7606A331
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 00:05:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 29BE7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Zj78psXz
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-94937a33cfbso433827985a.0
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 16:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794873920; x=1795478720; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
        b=Zj78psXz04qLq58LGKt198o3T4FAbqXZ/y89h3KR7fpGQ1hU6rGoOTe18Apzc+22ga
         DvMiwwoc9EwC0HgoznHV3HqUwEUvtiWc14KwgNjs9kCTPQua55iCuYSRcsZea9HZcUvi
         kFgXcmNVL2d15KoP+coMdUQs5hqI9ACZvQoesIzcE6ygVQJnyZ6/DXeTqoppU9qxe+OX
         CnzPdPwMJbLc9vEbkgeNBMxuwA9KQTsu0R/F+fFGa9jddkYkosqmrDclej3+Z2FtUA1S
         bhlDW7JakK/pjai56NYfUbcLMz3qOmBfauRPnApgeZ5iibvGKctCvJAToTRAAZjbVnRD
         zW+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794873920; x=1795478720;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eMx+CTkXv1VoOtSvi+6D1nYsmWu0vpvPd8N8huVVt6c=;
        b=o2edF4xDQ1S3aNNg48adFMd5lJWPkfp6Xs9wVPGzJ5NQ/ksL8hiLhpU9ALzDWb2v1n
         n7PvuvTJdKXyEDpKpTlCvhqGnOVnuapmOLbWi9Qcax6QRZ48spuo551BycwwNoXnDpjt
         0JvcIWCn0du227JNhqxpEMuh65TH7r4bzgzVC7SGTA7sbVlTV4ZsGx/usOrgpPomuxe+
         XFru6hQYBj34YRcsXC0IBYl1a18QhyXQqoiWlhvrxF57j+OSRxSJWTJrDPlQVWZnBqH5
         I3EOdfQzhiAwgIQd2ERRi/g0WaDSQr2PaeO72+hvLyrR/WKWy3ZxMX6bAZUlgRgdVYCW
         vcIw==
X-Forwarded-Encrypted: i=1; AL+hErGdedGGxkOP3sa6YkyKb8yCq1JBl7gAo1GXBMjZY3dBSG0OZcRu4Ap5Vvt16fpSVl5orMfL0Wzla7JTBQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z9hno04UViDBdE4Ic6ccJ4kQWsh29ohdO1F/PSevBS3Qlr4+gXH
	1SkZdw7cVp52Znlnj/NounaJqJcVl01eptSrfwAt49R6nOuHAUZrl5AD21+/VwtEYwY=
X-Gm-Gg: AYBFou0UpMcv3n8Kt7QaFX++g9UB0mQKLK4yawPKh1KB+m8Dny95vzImat8DxAkTTm5
	1hnhs6dI3+TsSdAyFb+34nJYJvi2SHLUdQwZJUhiAYMUH321zRxGzif1lyj5CuZz8Ddvv+5e4JW
	1o+psZCZmmY8IhPKULVTb4aDtCHwvb4iZpWi54Ltyd93iLxqSvYsIhdRF6sOA0NuVsShCiw2dHw
	2uxMdlWANNBy2WRPTouF0nY4HcPw9xEcjRCw5F9xsNBSyvPigPOMX9IsdwvKmkZj/Sw5DfXRsBO
	k8R2e6bqb6b3ITN/hDO/mBoHjif68w59L1Qqqbkg7PLeE/9oJI8sOY7hmIexkEfWZo7a/xFzGPI
	9y7v+DRiMPn7fMtMLhGuFrYaqIfWuhuoxxDcL5tMx98sndZyvDa2sXtLwuDf4rnK9G3MyoFfYZz
	iy9BLxiYAU8kXXjFv6uMisQwi6S8Cj/OKEhLDFOGXC3BrReHdowXutuk8W51/gzWRGyWJCkbaXD
	8S//76WwMKVo0x/NawXdQNAbGqD0ivIzA0klKdE0sx9CdrXFuoPg4Fwp+vJCx1xp5bJjeF+CNEm
	WT0U2g==
X-Received: by 2002:a05:620a:aa0b:b0:949:7473:b1a5 with SMTP id af79cd13be357-9497473c077mr807892285a.55.1794873920005;
        Mon, 16 Nov 2026 16:05:20 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9494c8b889csm969866585a.32.2026.11.16.16.05.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 16:05:10 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT6h7-0000000Apgy-1pGN;
	Mon, 16 Nov 2026 20:05:05 -0400
Date: Mon, 16 Nov 2026 20:05:05 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
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
Message-ID: <20261117000505.GA2488304@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <d0999161-3b27-4c3b-9d66-1d117c4836fd@arm.com>
 <20261110122237.GG8635@unreal>
 <b4c2538f-8021-4abc-be2e-fcd1596f84ca@arm.com>
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
In-Reply-To: <b4c2538f-8021-4abc-be2e-fcd1596f84ca@arm.com>

On Mon, Nov 16, 2026 at 05:13:59PM +0000, Robin Murphy wrote:
> Even with the slightly dubious argument that this series only intends to
> shuffle the existing PCI code around rather than fully introduce the generic
> abstraction that it claims to, if the PCI behaviour is still just based on
> propagating the internal "untrusted" flag plus the new global override, both
> of which *are* known at add_device time into the common trust state, then
> there seems little excuse for not doing that up-front so that the new API
> *can* just work as expected.

The desired iommu flow is to start out as blocking and create the
default domain only right before driver binding when we have the
correct trust level.

If we try to do that without this series then we have to do it all the
time, which I'm really scared will break some embedded thing that
expects scanout to work or something like that. My hope was this
becomes opt-in based on the new command line stuff in this series.

On the other hand this series works properly on systems without an
iommu, which is pretty much all CC VMs today.

There are probably around 15 series to complete all of this PCI device
attestation. Without everything it isn't really usable, IMHO. I'm not
that worried about the series ordering.
> > We have two levels: policy - that describes the default of all devices
> > for that bus. level - actual decision on how that device is going to be
> > operated.
> > 
> > "Disabled" prevents driver probing until the device is authorized,
> > "Adversary" permits probing and requests the available protections
> > for operating an untrusted device.
> > 
> > Both need conservative initial IOMMU setup: a disabled device may later
> > be authorized as adversary, and authorization does not rebuild its IOMMU
> > domain.
> 
> Urgh, I can be absolutely certain I'm not the only one who is going to be
> confused this way... I see "disabled" and instinctively take it to mean
> disabling the device_trust *mechanism*, as the logical thing that people
> will reach for in terms of "I don't care what this new thing is, just get it
> out of my way and let my drivers work like they always used to; I want to
> disable the new thing."

Maybe "isolated" is a better word?

Jason
