Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793890796;
	b=bImKoNfLjNpvlPMHuxBwxvySl1yFQX3TlPwVPezN6hrDcxjH/oWFkQaQ0hPqqTB47Ger
	 RKaoWs7+6g0On21NZKDX4s2U3XO8Pw6joXBjHeGIHUB41pGUScdIjaBj2imasBmHQwn6s
	 oidnxLlkQpMGQuvIaQWpM2ON+OS/lfL0CYnjsPv0qwIXiTk296aByhpC8ojZxYkbiT7nU
	 EPdxFe1/c+0ulcnHEPNeHr9jpYectlAvRIAxXpme94k/9y1FofnSU2Vetiq8B7UJAjkxK
	 ocXRGuZXqYy0g/Vs83pIx+Ll4eGPJhYeneTDg2au8g0oE4UGFdraIdLBvw/R/EGMw0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793890796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=sv1GqJtGOVxD2bg62FKkDXwLV7ybcH0/LrV/szN48RM=;
	b=idPymkLfFoF3zpC3In11z2U2pVPzseOR66++awFSuuimatrI/ZuQDjdQyQJv/zLMfTLP
	 jw/OK6u+7rOv75lONmgveaUWVgjf3kc5/4td6yGIQl7LAoAZr4Ef+qysw3z41AtnZnoBM
	 TEc2fSGz68c1pFLAVB9H60dOZ7QM2jVYsStZ0ipUNmUDChVgSUGzu26w4Rr6ZRwD+Fib+
	 LwsFg39h31ECufFTnVdFzasdffQixFji0eqaqecYRyKJneG3CZl8jqhJNbfyNjKqXj2zN
	 9uRDmY66sWKm1floAaleFE4r6tAqgIAS75obK3UJNZ+w+nt6jRiQXhlrh6vzcG4Tjkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CNC3Wu8P;
	arc=none smtp.remote-ip=209.85.221.172
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com [209.85.221.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DABC8606A339
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 14:59:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DABC8606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CNC3Wu8P
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-5ec3561b07dso620950e0c.1
        for <driver-core@lists.linux.dev>; Thu, 05 Nov 2026 06:59:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793890795; x=1794495595; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sv1GqJtGOVxD2bg62FKkDXwLV7ybcH0/LrV/szN48RM=;
        b=CNC3Wu8PHpHFOGw8+zRbAhXStxCs0FaZ37Wrjj34KR5LM6IIffVv3muoBALrogufI8
         OnrrdQEs5hOdCRwrrGVj4kGRPPnsGUCptRUh8SLIQZseOS6QQZVfpahMN7hq4l29r7Ur
         ZyqxeOXSRIv8lZxq06tVccYr/bfoPNFcUhJA7SSIKN/Exrx7QEoC//LULTh+EEW4EKqD
         agOe1zUar/ben3ti5iWJduSKTqN3k1w/Ol9/rH/BCZVOYFBoK35vpb0NtHtbH1EXthzy
         YrsCPLr5aSe0tQaAacqEnlwrbebLwsJMMjgp4Ymv6U+D0yq3o/3NaJyt9hq+orEaeDn1
         Dl1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793890795; x=1794495595;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sv1GqJtGOVxD2bg62FKkDXwLV7ybcH0/LrV/szN48RM=;
        b=ERcX0wfvbkPCm5BryGcPPjzt56iowaAee6eHXTdC1H356qliJedRveVCILr2ZuORjD
         mnLGXNNupgepIeWsalYZ4dDYk8c1tUmC8jHsSu1uiO+167AyN3WW+rFtqhu1VKeabTXZ
         1L9Q4zPQAUxyxvRcxor8jbH+xL2h1ZsAecNvoukAnDOuQf4/ru8ORt1hU3lR3cag4Bgo
         l8ghzwG8mqOdsPP5ITbgKxqGbNmPPxKKeRmCbs0+4MOMEMrSZPyOoQwVgPG1KNI3Y33x
         CAEjBEkLky19iv8LJTOgdn5Vo9MI2ZkHVelb9YoWveEVlhkKsheTZ3HebK6vbhJCIZGJ
         obNA==
X-Forwarded-Encrypted: i=1; AKwUvBwZTA7t1S9Gq7ZDCksjCDiDqlWYrMkedzbnjwph9kT1HGN4T8xWy4cqOjAdfLr/qamIWdxduagnmCB98g==@lists.linux.dev
X-Gm-Message-State: APuU4Z/PQ1GxjtExS3cxMuinwHR0CkT0C4McwLj0a2ibudjmH37Ngoy9
	qCXiJfPoR1VcMrYX3Z1eUU8r9Mbd4gtYx5l7wPx7MNJS1tq8sSjXfxh5ps8ZeMKL9lE=
X-Gm-Gg: AYBFou3b1aC0+sYLungOe4VB8vvSyJ/GGmk6MPpOTVLfcVoXZscRcrurEICsfhFvdNu
	kWxWyLPLUm0NCOF+EiTcZCOUgF/42EgN8/zsrXM+q6FyBICeixi+Pf1rpxEJvW5t0yoggrhsfn3
	WIJqcnBd9L/FGcMQM61ViWbIHDtDa8pi1SN1REHXQ7WhK6ulb0bKF9B/J6hvg2g2nFHAqkJkj/x
	VdD6kq3yT671gE+iP3MckkT52pYvGUgZmtVyHXcEcBaKez+Lh5zi5YWoopm0N6YEHiQkl1+/7ge
	CS5qc/CBVsFfrqG3YwnI7KkAZmqch0VbaR/bvArWkdV1UU6iW0PvgO+yibREUuXmh7ciKSo0Pwk
	kHuQOn862elf/Zxp1Im4v6qhwKRaK0OV/y6ZQi+nPQmPGr2Nxq5Tp7K3mnVRqcnNV1pFfQb3Uag
	33xhPYuBBCXoBZpjf6f/aqCtqMlq8evAEJ6+5jJGi43UgNGmUVzn0iF6lsf6Hx/uaKdlmEIZJfl
	Q4VLvxX141FJ+rAH/YO4V92p9j0BBfZMWBWIONRoiCtHWG+1vKQxcJwwvcLV4+n2Jlom96R2/bg
	qQAZ8uEwGOVpNeGOEdwjsDWFKd1hvLqoqm6YlGupx9593Fd5aT2kAiRH8QHoncnK9RYEFeTb47D
	E7lqzRyD2uzA=
X-Received: by 2002:a05:6122:6c0a:b0:5d9:302a:8243 with SMTP id 71dfb90a1353d-5ecb429571cmr1423011e0c.12.1793890794801;
        Thu, 05 Nov 2026 06:59:54 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5eca8df2a38sm4234612e0c.16.2026.11.05.06.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 06:59:53 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOywS-00000002o7b-2oaN;
	Thu, 05 Nov 2026 10:59:52 -0400
Date: Thu, 5 Nov 2026 10:59:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Andrew Lunn <andrew@lunn.ch>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Leon Romanovsky <leon@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
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
Message-ID: <20261105145952.GA663069@ziepe.ca>
References: <20261105-device-trust-core-v1-0-1e536825b4eb@nvidia.com>
 <20261105-device-trust-core-v1-10-1e536825b4eb@nvidia.com>
 <2026110514-bunkhouse-handset-6a3a@gregkh>
 <20261105132729.GB8298@unreal>
 <2026110535-engulf-precut-cf10@gregkh>
 <9d896ebb-6892-4cac-a7c5-41def47f0be0@arm.com>
 <54c9476c-9f76-4ea1-a73a-c9937d6b463c@lunn.ch>
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
In-Reply-To: <54c9476c-9f76-4ea1-a73a-c9937d6b463c@lunn.ch>

On Thu, Nov 05, 2026 at 03:43:53PM +0100, Andrew Lunn wrote:
> > Yup, and that's true even in the PCI TDISP case - there's a major amount of
> > "communication" and "configuration" involved in that. The principle which
> > should (hopefully) generalise is that a bus/host controller driver can
> > always interrogate its child device to perform whatever attestation and
> > general configuration is appropriate, but we won't hand off any _control_ of
> > that device to a specific device driver (nor enable potentially-impactful
> > bus-level features like DMA, interrupts, etc. if relevant) without the
> > requisite agreement between the bus code and the user.
> 
> Maybe it would be good to list subsystems which the bus driver can
> use, and cannot use.
> 
> You list interrupts as potentially being dangerous. What about reset
> controllers, GPIOs, regulators? At least in the embedded world, the
> bus driver might need to enable power, set a clock ticking, and take
> the device out of reset via a GPIO, before the device pops into
> existence and will enumerate on the bus.
>
> I don't see why interrupts are dangerous, which makes it hard for me
> to determine if GPIOs and clocks, and regulators are also dangerous?

IMHO we shouldn't try to over think this.

The overall point is to give the userspace a place to inject policy.

Bus drivers should try as hard as they can to contain their child
devices. Like PCIE should activate the iommu, disable ATS. USB should
limit the messages it exchanges, and so on.

When userspace accepts the bus driver it also accepts its containment
capability. So if it accepts one that uses gpio, etc then that's fine.

We are not the point of trying to describe what threat models various
kernel drivers can support. Userspace has to figure that out on their
own.

Jason
