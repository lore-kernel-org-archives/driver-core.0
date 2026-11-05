Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793887594;
	b=yg3JMZhZYzwZTYU9nciLyoRQ8eOLs6ExN7l5IIvu5SjU3Weiz48irhiDjCAGpvmqI6k7
	 Zg5vzK8o/3pEoXjMPsIvNVvV9m0905U75zbuvKY1oaM54rr5wuYP0nhYfQZEvOmnCo4Hy
	 Om9QURcYh9tWc+U6bAyvCWRfQv9JH7KD4M+MEWj/7FkvFh4/v/L9okUofGGkh6pbuPJbV
	 ziINnPykps/h2sN0xKqmqXvNlUyeyDQbUwhGUYGj/qeUlxbKnErm34MxDfVvPMu8agKeu
	 3nQ8Qk/xsdX6D1OiEowokN9XcWuBxr/be+oIIRzwufytMNozb1QilbqDKmiZBjttodg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793887594;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
	b=cHPkYWlE8aXmDKrfSFdP1ihriFkdgcVvaRFQVZO/QODTYHooSqdlj+u8Kuy2RxUs7Doj
	 RudYSwa4si2IbSlrJH/7Uw3Iv5vgQYtnpt+ODYEeQmki4v8Rbpfd0qt8XVohUDjLUk4Ta
	 7qmFff4D1LjgkaojExfQFkwVhVzwMUwR2INzWpKlZ8tDf+ad8YUUU556iAh7vfeSKeH5n
	 ZZ1bMjZiBg20YJuUL+4f1V3FMYJgNOzQMgZHQCxxwW5TKvv7hOhmoVU2h01ZCXV09p2Zz
	 wVSZRLzC8EXOfAKTpXLilLlg2RkdEyMUyiRJ2NysQexHR49zUkh3HH5A+nmTYVXYByA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MbR957K9;
	arc=none smtp.remote-ip=209.85.222.47
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A70F606A33F
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 14:06:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A70F606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MbR957K9
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-99ac154431bso113581241.0
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 06:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793887593; x=1794492393; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
        b=MbR957K9WRdc9Y60RgNFX5hOVWhtV7AeAr4S/IScatjKgjB8lKb4NivY343RNC6qXK
         GdfsdGZcguxLRvC8cfKuOuEc7LG9UmwHwrk0JUSYPpfyxjzKvwt2y65kDA3D8iMMmuq/
         jbhmXr2de/31BmhgfuZ53j/tq6Of6INt6LOGNOwKujcKENU1Bt0f2OTYW5G3lSRKSS37
         jUcMPoJPdg8nZxVUO3jLluyALbdArsWuoOBD+7hp1U+jupe5VeeemFOXrb/dbQ+6b97r
         hy8kJKchcJSlugumDb2lGhsUGnilUHDnauduUBc3gRgmuKoGqmJFwAXsHIYs3HOKrqPO
         aVLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793887593; x=1794492393;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+bxiPLBqzkOz0GIdUWUmBLaUitvgttuw9ZH2qvbUZkg=;
        b=OqK7AmmgWR2jwN2/6foz0HxHRy9+xPLqq0mQhE049N1dJ++3StUrXAORzcF9WT08kV
         SwBs7CYXUiJIrUP60Ch/+81d5ejGdMXjaX8yf4LgfxLvNYVRp4d7YJGfq/L9bTmnmWFb
         kJz3eF6d6NeSPvQAHyUh5UCKd6OuBJeFRffNz0NOYG0q0kWi/swXmsOUsCvUwkJLoo4P
         LweWP3O3kb92eqqOjBbHSs0lMXu7iiESV0ornyN3BPLr2o5BeGyAjxap0HnfnQ5EpWlX
         S3hA0CvNZzvMR4LUQcX1iRQJJewpMU4DwmJsWCVK4nYmUAnspOW9Yi4r+KWcUOmNHGzC
         L22A==
X-Forwarded-Encrypted: i=1; AKwUvBzvE3P9afHD/UNioIJFo7cvk9jhL4us6E3E9Y2uqv99LQgFOJ9JdmHVGgLMyJYvDMzuOzXjEeDFPvAIJw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8wJJcdd440lNpR0D8kdDgOo4P88728zOVlejPiFwcJfGV3efNp
	tWqSdAEoBCWUNAjCPQVIMgoHo74RTQjmV5DMsmv1hDtLY93TjlAfiOZuAnIHE3HAEbE=
X-Gm-Gg: AYBFou1cpApEnT46uvmh0eGIeq1ZUl6WoaGg7vLi8VvK5OxWKgeEe0xq+4wORFi2C2f
	j7BAP1/nmLEUPDTkb0IemeZVfJ2dB5aybcfMYuvS8rFooILYsikzNeZWKWXW7NhAAk9Jt9Clv+4
	5IftFQ6WUnVQfz4fieywZdUOCZXpVWXDtfYy5V4qhbR7Uz2EQH2Cb++VZpX4aGB13lMq0sfhN+B
	hLqqTxHiNwdrNKqhTNXSv5umobHRT5xgEAHD0LoUSZaakd1b/dlsvd8QSyLj29RXEk4e0pWOy+i
	Wqn3IO+3D5AFQyEKltn4b1KCZ+mMMUgGYF1ijcuhrAth2y6DantzCJGLHQl0lpkGM8Ptt9DgdlA
	JnUrnr+aJH6+GuF3VsaoaqMKmgDKuJ1IFNsbO3uH4pe+BipOwWtFYAZXnhrq5yNX55mbfBmM0hi
	OanUMU2/nywspR88yX0OSrGLR7WgscLvjqERimfO+4KK0HKNQrKzSwfZRibyIwbqNjkypmPe17a
	cU8WI2P/14V/UZC+KfkwV7J1sAgUH/M0h8p5abfuaqLOqdXpu6NMMaKQBDIY/FW3R5HIC5fB9en
	wseABgmTCrKdOpMWeZforrPAwX06rRfzfq61t+iZ4LtWsidZPsS7EEE+LHVdhaGBFq8yT74LzOm
	WHwYyda9Snw==
X-Received: by 2002:a05:6122:4f9f:b0:5ea:389c:51fe with SMTP id 71dfb90a1353d-5ec68949c50mr9274698e0c.17.1793887592873;
        Thu, 05 Nov 2026 06:06:32 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8d9d62bsm4161881e0c.8.2026.11.05.06.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:06:32 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOy6p-00000002ezu-00ao;
	Thu, 05 Nov 2026 10:06:31 -0400
Date: Thu, 5 Nov 2026 10:06:30 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
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
Subject: Re: [PATCH 10/17] driver core: Expose device trust authorization
 through sysfs
Message-ID: <20261105140630.GG3889730@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>
 <2026110514-bunkhouse-handset-6a3a@gregkh>
 <20261105132729.GB8298@unreal>
 <2026110535-engulf-precut-cf10@gregkh>
 <9d896ebb-6892-4cac-a7c5-41def47f0be0@arm.com>
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
In-Reply-To: <9d896ebb-6892-4cac-a7c5-41def47f0be0@arm.com>

On Thu, Nov 05, 2026 at 01:59:20PM +0000, Robin Murphy wrote:
> Yup, and that's true even in the PCI TDISP case - there's a major amount of
> "communication" and "configuration" involved in that. The principle which
> should (hopefully) generalise is that a bus/host controller driver can
> always interrogate its child device to perform whatever attestation and
> general configuration is appropriate, but we won't hand off any _control_ of
> that device to a specific device driver (nor enable potentially-impactful
> bus-level features like DMA, interrupts, etc. if relevant) without the
> requisite agreement between the bus code and the user.

+1, I think that captures the idea very well.

Jason
