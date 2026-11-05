Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887436;
	b=EaagVFVWUmaWDSTQOMm6SUT8JXdhHh7MSo7CUDLKLzXHeDUAB/DioI5l299njg/04NKe
	 G73cZVOvkE0s9wwFgGU3USklO6LTCOZxwGWGeKNCDB8wt9X6Eb80cVCp8eWD0aKwmnDex
	 oVVGr0rISgokPHaCaIUX3UcTiiHj5wZHU3qdR882CfCzNHNMlsXIJqa05qf3XaoBvVwZm
	 QsamVOQQiX57uaWdZwn7eUVghfCXBj5NTiWUbTRL5m0VQA5DrM1kc/q7OwEvzzf6eKnSE
	 59/FrCw2obo6UTLieHGs0tUiHz6eruV49z8qi3pIT32JPFhm6NIZ+UqCBqV98Jh4NjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887436;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aHvVt/C+p86HW0thhKORyrpJuSX9G1Rk+ExvThy6OxA=;
	b=kZb+bpOuPk4cB+/pfHrhpAzymumglSsqcPYIzIsLR5ky3nrR5VSwlL+12PMT5RZHiyl9
	 NqlJ1gqyYG/ZmXli/nrD3vxz2czi8MEGTJzh6bJn7sVgn5EmjZix7wpZ2sCFO0YJtUWyM
	 1oCcc2WXaqgRGXpVKaSc0sDOtRnylzYAQrUzQxvdyffRUbIPklOdPVCX7Hf74hQ7vKIWW
	 OEKPBz6gyLYgNhrJ1R2CMnuaX4hENZNF9IzYP/j8TOUz3ouI4HmnvnLxBHkBvfIyIyHM3
	 xan34bNctbh99YCOxCTy9ptnaxfa2mlRPWdOmiPKvYjicgxTucZUdjU3SVNss296s7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.221.182
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 501D1606A328
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 14:03:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 501D1606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5eac319a6c2so689458e0c.0
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 06:03:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793887434; x=1794492234; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aHvVt/C+p86HW0thhKORyrpJuSX9G1Rk+ExvThy6OxA=;
        b=DsXYl0ez/ZuuC/c7V6/g0Fz33P+t7s6OAAdfJUljWhRCbmL2t0lTZSyT5gGByiEfmb
         8YlBsy4ideERvikNKgfR5ZbgoXvYXSbe9S3J35EXRYQJG6Vv2sRKT96it9FDDtEXaQsE
         0mIIeyEzjXF5z69A1cfJ1tqCmobPYxYweuyvMKsHCvTiAZgHvii+uugqTktv+umGvZXJ
         K5M0JC5KQjKvkx6i2BuVNmjZy/DcWX/ASL464nG/WY7MdwSx6oLYvuImhUmNg747ntwH
         03dW78hScbCmItqEngOgOAVGYWCb6VWNljf9T0vN/wdLbDu/pjBuIPZhHT5dZK7JiN9l
         4f6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887434; x=1794492234;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aHvVt/C+p86HW0thhKORyrpJuSX9G1Rk+ExvThy6OxA=;
        b=U0ny53D7dLzckBHXuc1ILy5jO7OEsFQOkP3bE7QpehowbbxOlL9NgYKPZ64ndnfCNb
         P7EBfs0st1qOYteMcNnyxVpqQJ8OJR8LuL6s37ozf+GtaJc0xa5DgiuiMuvYUVaEEa1r
         HAzqB7jVJcFgymy+d76KgkYr6FIbNcIN9lkpXCWt2tTamicNObTZjKyfbyYkdyT4YOg5
         SfngnwzdoFNcxQvJwTKEI/NXWkHSdnmFBWChttrcZceYQnSGzjx/98dCKtNkIxRaCAe3
         4iY0oNKH36JJq4pKKy1hNEOpkS5uhvrPklMvE5kbKqcCYa+Ft/s5J8RcTJrjdaSsuRCK
         grnw==
X-Forwarded-Encrypted: i=1; AKwUvBzngcsMAUgDEswoaHXULVTs7DxB+4Mc5ux9E5EfHZL7OIAy6DTKYtWYWHxV/5vyK/eUNVP3d2/+YGu8sA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+nhKbAOqsYlHBu5T1eVCwOn9rzSpOcjigA+dUTWB9Ppq898uuK
	7PVwJFJGmwuZ4RiQG7C5aiG0gQD1cvl67cd/Pnj9+cjid5Q7s7hB/tqbCvigoH7msVw=
X-Gm-Gg: AYBFou3TSFJANDd8uilwvnqAO9txtNGWQ3wfDnmIZsWz+Ut4jqlbKbfuGjY7Ty8Mzjc
	FoWEYie5nqUwqGafPYTiNhOdw+Fk2zU3XNsjh5wtG7xsM/ixVa+dqC8yaYk7te0wtWMub35m8aW
	dMNtCwCOswmqlkdAtb4q2+4e+qzlsMo4Jg/e1aglcZ+bS/rcQ/gV9doqd0qQ5NuV1nvSSW4lsbb
	Zm4i4YXm1nRQ1ri+1WxKQp83iMX72p5ySWGlPHotdXYfVHR1xcOcsO9qvnPhuky+mhzYhBv7Yw8
	DTOhAVG1iHE1ONg8ZcUGFESSSzEOC4Ht7/DiNHC2L+IlnmqdA1DERykC3ZJnZuvHFWV+/mf3Km9
	vX4mRzZew+BHTQ1+qP47lDL8OGpkp7av48AifaCt+5T4xPDXA9wqKguj4vjUTdscrVKmZHnPLZA
	87TyacON70uD3VsaLa0/RaM3v0fSg4nhS2cYY0Siarpl3U2w8OiD5brwRm5PxPvOiWzWrAV+wdv
	Ah+fwsAG4pL8qibvjLHmkAYOYyFz1SawQQtlW1FPC4dYKwOzE5yLNqTLUooFjZZwOPATDbQtQzz
	IYSpzbUhShEHZhqc/OFFK4YOJC9RN6Q5eM6isVJbivxf/uYAxYDlCI1KRiOA9hsi7Ki53YyJPLs
	uthUsdrQDcA==
X-Received: by 2002:a05:6122:8f88:b0:5ea:cfd9:8fbd with SMTP id 71dfb90a1353d-5ec689b0f30mr9760208e0c.17.1793887433885;
        Thu, 05 Nov 2026 06:03:53 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8de4908sm4235128e0c.15.2026.11.05.06.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:03:53 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOy4G-00000002ecj-0pCb;
	Thu, 05 Nov 2026 10:03:52 -0400
Date: Thu, 5 Nov 2026 10:03:52 -0400
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
Subject: Re: [PATCH 17/17] PCI: Replace untrusted state with device trust
Message-ID: <20261105140352.GF3889730@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-17-1e536825b4eb@nvidia.com>
 <2026110526-aerobics-correct-4c06@gregkh>
 <20261105131856.GA8298@unreal>
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
In-Reply-To: <20261105131856.GA8298@unreal>

On Thu, Nov 05, 2026 at 03:18:56PM +0200, Leon Romanovsky wrote:
> On Thu, Nov 05, 2026 at 08:12:51AM -0500, Greg Kroah-Hartman wrote:
> > On Thu, Nov 05, 2026 at 01:42:30PM +0200, Leon Romanovsky wrote:
> > > From: Leon Romanovsky <leonro@nvidia.com>
> > > 
> > > Convert the PCI specific untrusted to use the common device trust
> > > level. Adversarial means the same thing untrusted does.
> > 
> > What about for USB?  Will that "move" to use this common trust level?
> > If not, I don't think it's very "common" :)
> 
> It supposed to work for all buses out-of-the box, at least this is the
> intention.

You mean DISABLED/FULL should work with this patch series on USB
right? Meaning the core code will not bind a USB driver when DISABLED?

I was wondering if some of the broader things we are doing on PCIe
also apply to USB, like device authentication. I don't know alot about
USB, but I got AI to help me find some relavent spec information.

 https://usb.org/authentication

This looks like the parallel to PCIe SPDM device authentication. I
would expect it to work broadly the same way as PCIe if anyone wanted
to implement it:

1) USB discovery discovers authentication support and creates an
   attestation subsystem device for it
2) The struct device starts up with trust = DISABLED
3) Userspace runs the crypto flow through attestation subsystem. This
   is extremely similar looking to PCIe SPDM:
    1. GET_DIGESTS -> device returns a hash for each certificate chain
       slot it has.
    2. GET_CERTIFICATE -> device returns its certificate chain, read
       in pieces.
    3. CHALLENGE (nonce) -> device returns CHALLENGE_AUTH: the chain
       hash, a salt, a hash of its descriptors, and a signature over the
       challenge and the response.
4) Userspace inspects the above and approves the device
5) trust = FULL, driver is probed.

But I supposed Greg is asking about /sys/bus/usb/devices/DEVICE/authorized ..

Jason
