Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794859754;
	b=EZ4UhDoE08xTVsBE9oApMQX9XSuyiL+ZQQJGpsG0PIDU5Y/9rg7IShTGhW1ea78eLAo9
	 H1L79/pv4sUDj9cLNkWnjlcvNZ0uQ1LP1QGeBPKIvKzEghQbsl/D75rqqUG1HRdlAswGo
	 Fs/GN4mY5UFPEH+g0CFlKUtWexTRPFcqa6qdqAx1kf1nrm51nqSOfkpG5a7VUqX1/W+nr
	 RFIRhR9jHFXmfcDiDXJfnFgrnrmmv3y2tObTrOtKoQNFRPkTqPEhldyobRCwZUn4zd/dN
	 y02JtwiNbZgJesvMLL0E0K1SalfnnttXJBnBZrhWNWwl2tALp16gpHPh06iNN/ZBAnQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794859754;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
	b=Iogg+qCfo1gEdGA0KRXN8f2cru3nTkJKomYAjYJ5Tx479TE5tdWsWa5r7kwxE/s/artR
	 ROSo7zo8zH2+QC6gXAVui+saFOESgwC2yOBZ6oTaoiaAiOriBJ5oesNslGzsUex0R47TN
	 rUjA34UY/AdhdTMIWIvCTR0yRxMUbFYIzHcJPPW/tycFc9sQvCFCry1TMGg9KN48ZmcPw
	 Z3fPVGMRpRxOtQWQF5BMVfwWECppOQxtKh+sy7WlQqTXXluMw5o+9OGTfAfrRike3lKUj
	 4sE/Fg9QdjU52o5XAZddbsLtwMUTsFnVAo2uwbp0kxK1WAL+bL3kXWdehiU3n7BNNxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kgB6aQig;
	arc=none smtp.remote-ip=209.85.160.171
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com [209.85.160.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53DFF606A334
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 20:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53DFF606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=kgB6aQig
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5365d725440so42301001cf.0
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 12:09:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794859753; x=1795464553; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=kgB6aQigMTtdRvvKH8bjYfrDN1EUjGPSV6bPlrkOct4wIco8x+8GEmVoolqNR6guFH
         L4k3oy/ndEBZj6CDJO4hKt3dy01ethJAIXq0Z/WifA/2fqfoehVfsf2Eklo06aioSMvb
         vYF0bEW+dj/jIYayrJ0wFl/oMVyihDP2ndc8ucqkIoGH8MAy5NxY52ayRYgXjaZ1YZ22
         HIJX+vcFqlUNL1/NXja/xLNLazveprCJKFGQ0qOFJcINB1lTjjzJIBynP6mzzgV5uBvz
         IhuTMM5Ep7tzEuym0acjMdkECJno0+CC19moxKJysDpVHheBU8UmlkbCcbiT29r0uBQB
         yS3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794859753; x=1795464553;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rIDjnnpHadC4roO6Pjzwfgg43uG+Y6jCh2hpR36q9WA=;
        b=LdjdPE9S7SRflYYo0/RSHen1tjtZsnETDNImKT2qZ0KVnyzQaJsWMoXh/fWIttnBTT
         ISxXyI3Bhh/Asrlo01Y4IbkZ8Kl+ek4tmWbIp/A0Ppb6lMrql410XNxTlrLMWVQ3kErH
         hHhylrfIOThq108GRflffJbvQcfbMzPn7vOhpSqBUIlFv8cNekBE3/7l9MjOi4SuQuz6
         24qAL9kLH/XCjdwHugBUU1dMkXEt3TxB7NfH0G5SvVq8biITx5hSMwOWhfFyT2kcsnLt
         dnva7xhYeOUhZk50UAljmC9OjfX84oTqgTc33GeM4gVK24LJ6rYSbS5kFTDLxeROhZ7k
         Pzng==
X-Forwarded-Encrypted: i=1; AL+hErEuvLO8yKAFpiSLRByC/bQyjIYtOZhKibBtWoTcRsqMVOdrBajuIz2Ym3rD5xY2Ku0y09KCyUir9Z5v6g==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Q81wdfEe7ON3LS6KH2eeiGdpCwGqDjWWV5cQpR37o9MCTGi9H
	KcoOns62IXhruBBlUmfb9kunjd1W7uQSJN/gL024Jo0VNnUaqlPigrZCWEncgkyrjAo=
X-Gm-Gg: AYBFou3LS117OreV0P4Iy1WiCIn3PDHkrNbw4BEtPJu5WymWzf5eO97C9lkU20K4jCI
	blAbtVvpBwYoLC0ez3pvDIRlwttg+cNNizBj0S9VH5y9sQqaHDPy4BjEJVjGksIwFDl+3YdjXAz
	Yzh8Uf2zQel6NPoqtXwdnaLxTG0KZ0e5QBpBYg7IwMTGhMoTsVT512FRfPR7gwqzLvMFLRqcPay
	zPLcnpGHg6BoouNeVyrMmIGgXAvqxWGfT/QOanxYjDshWs55WR7MS+1dBL4hsAeR4wkP8HBbiAa
	MmiONFD9Bd8y3dDYUFdsvQsqyAsCJNw85QJol6CVynV7lT7LmvID1OtFUNCJNG3jHF+FXdbzPqB
	WUHVoUV8nTAOKDisBqTdHJSTjYolFs8c4kyv8khjtFJyVZY9gIs+BQU190ebFULwVZjux7pN5LX
	NiacHZs6qWIXWjraNDBe1acLELXrsuzYOtQ5Xj9OENYebAtzS5l/ctZhwWZ2sfTxqiUSLSY2bwC
	HoxUhfx2egwrj4aDB4+Vw6Fts5x/54fshKYFHMBngoui8Zw/a8WD9+24tvT2xJZlI+U0YEn15B4
	lI8Uag==
X-Received: by 2002:a05:622a:5144:b0:536:98da:f790 with SMTP id d75a77b69052e-55ac43909femr187873791cf.6.1794859753196;
        Mon, 16 Nov 2026 12:09:13 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d445d1sm92856046d6.8.2026.11.16.12.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 12:09:12 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT30p-0000000ANtb-30lh;
	Mon, 16 Nov 2026 16:09:11 -0400
Date: Mon, 16 Nov 2026 16:09:11 -0400
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
Message-ID: <20261116200911.GA2473219@ziepe.ca>
References: <20261109-device-trust-core-v2-0-3b12d9a9f861@nvidia.com>
 <20261109-device-trust-core-v2-18-3b12d9a9f861@nvidia.com>
 <193e4130-9c2f-4a0f-b218-f5fcf0b3d508@linux.microsoft.com>
 <20261116190417.GD2299285@ziepe.ca>
 <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>
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
In-Reply-To: <2965c691-82fc-49f3-abdb-383860f6e82f@linux.microsoft.com>

On Mon, Nov 16, 2026 at 11:24:17AM -0800, Kameron Carr wrote:
> >> My scenario is pci-hyperv in a confidential VM with a paravisor. The
> >> paravisor is inside the guest's trust boundary and owns TDISP. It locks,
> >> attests and accepts the device, then answers a VMBus query describing
> >> which BAR ranges are private and whether the device's DMA may target
> >> private memory. Before a driver can bind pci-hyperv has to:
> > 
> > Sounds like a user in such an environment just wouldn't use the trust
> > level mechanism at all.
> > 
> > What use do you see for enabling trust level but having all the
> > devices unattestable and accepted already?
> 
> Previous iterations of device trust used the trust level to make
> decisions around DMA bounce buffering, etc. Is that no longer the
> case?

It is not, this is now just about userspace attestation really.

> I am looking for good hook candidates. I was hoping that trust levels
> would end up directing DMA behavior, etc. but maybe I am
> misunderstanding the design direction for these trust levels.

I don't know, I broadly expect some flag in the struct device to
indicate that it can access private memory, but how and when hyper-v
could get involved to set that flag I don't know.

Jason
