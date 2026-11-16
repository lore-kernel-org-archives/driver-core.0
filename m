Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794844785;
	b=j13mVrXkxnBB2nHuI+ZesqHrlNdhW8ct84oSS0k1TVe29DdTYgEH7JGkMOlX0FZSXZ63
	 x+gFZBu16NZHDKaR4DZkLmyabLIVbQs6cnevpmIODLnZxVODOKO9RHLNm7kqFcM8FNCv5
	 7uwq+w3SmLPszQDZoiLxp7JYRraiHkZGjNlo01oH+A06w0dQxaRMB+ySiAvwhcmTfEc37
	 l0qttP2opEv1mtLPu8MzQRPxFbhFTtrAezbvd//I4dur1Uv2fTYSL+88W/ZLoJfgmrIm/
	 r0Go14GKQ17zDOWcGs6AiQk1m68twIB7dMz1898evVnJpt7PI4/Hlg4oPsBhqpYeqGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794844785;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
	b=BlnKepB0V4TTcc8+rnnffV2LKx9JsoZvu+yThO++rcL4SAffCCnqvBeLYoBlW0BVBcSI
	 u7dWYFsbHToRuxPqFswtgVEkkFqepmo1u6rswHUgI7sY9me7bQ284sz/snnbJgBGIXRBH
	 FH9b8+IH1KM3F19SYscWRxt7Iaoqyq8gyaKobEgvLpC3AqCe28PlwBYDJ0qse6VxP0QwL
	 JJ56ttcCxDW3WlclYjjHngL691UCWFdR+SvFaPS9z1vdI2v7Vz0m1AUWHKiGI2ycBdgxD
	 StsiQWmHH+z8IC2A20jcP6owQV/cdp2sY0yB+Xw7n+fYgU9kepkMF4bj6xk1dAdk7OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Kj3HZZm6;
	arc=none smtp.remote-ip=209.85.219.47
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055A8606A330
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 15:59:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 055A8606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Kj3HZZm6
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-91ea16d8072so36765176d6.2
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 07:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794844784; x=1795449584; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
        b=Kj3HZZm6VsiSY2VSh5xuqQ5FztNq0RICtlckv9INxNJSdQDs2r1hvpg0FORIpLcTKY
         Y9Lv0SWDdO8tW+84wu7+VFeOUThglEPk2adIUO/kV+T6cbXdSlVtnme+Y5DtWxq6nOnt
         rEahO7bRz4syTLL+2fDv8rPUfy6E3cZmaOIkI7NJNUhED5rcAf6WiU3JngRpezjBNISK
         yb7S9WcYQLMGnDieKnbNGCmWNIQgDXcQYb37kRll3p0+5dBluY3ZwdMqWdnGwQEPoFuk
         3JWfpf9cRBpOpi7cwYuKGNuu/b87V5MZ1PlxqDzAS21evghQTjRq0c8NdXcYlepTyNVY
         7PZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794844784; x=1795449584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zt6BKnr5OMQnoN+jLF5J5ZxUIjEZ6DGHzLguvsf5vs=;
        b=y/VqS+dU3k+W8DrdZC/SPr8+DzvoivM13ULZSlb6n5ilju01ekmgf0dtDQRZrLLHkr
         TyA+kqIp8t8t7GLiZ+5DvCAw7OEJr+/DLtJGJ29Ms/VgQMXqJGA/S0Nj2WJoAQVNbZDI
         hyvcpEEC3bFYc29PDKtCkMH8cqQoGyh+s+lRB73TEwkjwRZ0swluBjlFdrbdpNzifO/I
         qsaqZX2sTSnP2g+3bz9qK84sR0TJjD9qrLVF1x4P0fEbkrOhPDQbYXmQ+VoIHdIse1U+
         Sr+SgG0X3C2xCcm7hQCOeWlIZbfD03x4If0sblFZe1dy5B8s0tLU5Hn8n2RZUfNpZRuj
         H5ZQ==
X-Forwarded-Encrypted: i=1; AL+hErFe3QkZ51mDUclEswVwagttzLt954qqoYRnJhQz2gRg0UvGDHAwlP+snREt+Kz2ipUW8HR/yXfvC8fbKA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/x8YIW/mZmJnRrQ5+9QFXGCikbntHjQrWSCINjVIx3mactV1WX
	8TLEM/7xOEoPhpNrmW4iaxwzuMTN8CwsI/BCgWbdab3ZlkkwaLy+c6PtdKOTNj/UAVo=
X-Gm-Gg: AZFdTZeTgezfPjIyPN5rNVdRTC7hlGwaQcqpoKzphK0t7QON9DP4tpbZGpUaoJYd88B
	SAuD5fwzoyP0lE5JV/H9rPOEjxk2io0Kg6R5X/gBaLdiMYrwTE67eGzPDBvuOZrgShDsJ0k9Lxe
	FacyBbDHGslPKbWzABFmr+4I7hwlelLV6WMSwcWCju57h/plwnHqd3ocOEsE7QLMgvIbbaa+Eaw
	9HsIyMQTMZcgf0s70yO+5k6K6mAd6OoZMV5xFKjE4SZMEfDQ/wfA/uhnWzbTG6dWks/jG4/K6hB
	5m0y2oH/Fu+c4UXsuABfq1xYTnGHmCr8GziGgTtLZZIuYkinNi+/Go226DyaDBei7ArdzcXWeBP
	hrTnmsTtPhvVzugOw1Vhbmex9RJZMgA32KF5HPcTlvTbaUdhx8aMOtUitbKUr79HOiwThgRtscU
	qz9qkhNzhzEhE0m1Ai1mOLhkKcVlhRKa1Z/YdudNzKsZnw70zRM7+SYRNoGuw/UGzW6VxR//h8A
	Q7+CnxnAOWXc00O3NbIMW9LbiZiIFzRu3NIwVG1fnN97bkdwzoVjbTbmzBmr7X7/wkMtsctL/6K
	Nttoag==
X-Received: by 2002:a05:6214:2467:b0:91c:7f1f:2c9e with SMTP id 6a1803df08f44-91f24209db6mr171122396d6.55.1794844783992;
        Mon, 16 Nov 2026 07:59:43 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d93f10sm87735096d6.30.2026.11.16.07.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 07:59:43 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xSz7O-00000009eOI-3Mx3;
	Mon, 16 Nov 2026 11:59:42 -0400
Date: Mon, 16 Nov 2026 11:59:42 -0400
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
Message-ID: <20261116155942.GA2299285@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <yq5amrr8yldi.fsf@kernel.org>
 <20261116132046.GI2532299@ziepe.ca>
 <yq5aa4n8ydsk.fsf@kernel.org>
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
In-Reply-To: <yq5aa4n8ydsk.fsf@kernel.org>

On Mon, Nov 16, 2026 at 09:22:11PM +0530, Aneesh Kumar K.V wrote:
> > Once you turn on TDISP you effectively activate DMA, just like turning
> > on the IOMMU.
> 
> We considered two options for doing this:
> 
> 1. Via the ->accept() callback in pci_tsm_ops.
> 2. Via pci_dma_configure(), based on a combination of device trust and device acceptance.
> 
> If I understand correctly, you are suggesting that we stick with the
> former?

It should still be done in #2, just with nothing to do with device
trust.

You can't run a TDISP run device at all if DMA_ENABLE is not done,
there is no half step here so it has nothing to do with device trust.

Jason
