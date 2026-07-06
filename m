Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CCC0340417
	for <driver-core@lists.linux.dev>; Mon,  6 Jul 2026 13:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783345535; cv=none; b=iSYB6QENU6Hb8kinsleaV9FgtzD83764n7Cd70ZCRu4QOwXxmOGREDH/zfBR2+t81WjDTHYJCZ8Cb37QPL610AWXjX+ATGZb7/tA0VHoWGxowjBSQ9qrzg7aR55Y+1DFz+ccdixI/c1C2OCHaB9WSxvATIfJOToJiuA+YLb5eIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783345535; c=relaxed/simple;
	bh=X2/xLz9f00ZteupBUVAyQDX4EmH5JlTROPHXFAocQHg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Q0U/hcneoSF5jo2jPo9jkmSf0DZ++/zG+A+Ibbvk+MeH4DCSRHca245qQuBs3Br9E8qSoeeRc2Ef3I8HfkhtWUacDioBktq3ck7zMlle/Janv2q1EDyyJ/EOMa2I0/g6KUYDzqGlVD+C92HA5x3Mafi/BrkVklKHJ3/WMYiXAiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=gCqjih0J; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="gCqjih0J"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-92e65e18969so195601685a.1
        for <driver-core@lists.linux.dev>; Mon, 06 Jul 2026 06:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1783345530; x=1783950330; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vSJ+2o+DU64Ct4lPSKlFPGtLgqM3IIcjx5unu2xlDoY=;
        b=gCqjih0Jmq9+Wa4eD/ORi0YUNYo7kndSRSFJC3WtMpC8XiLj/GuRFFFc4qhdC5JJs0
         kt0aoweII4UIg+ZEjBPNyjpPeWUymSn5PvJtOjtcw7myRCm9OF9idt6j3hjo9T0mrF4o
         5/UWHNR3YlZnNJ8c/Dnpwq3nbSj04YXtYNbjuCl2nvEoh19IJQGmSHQ99gTWVr7Ft+xq
         WJjwH4Gto+8i2hlXS7+69iuByjxdyOdklnk66St3X9c5hPkoobyuSDDZvwsRz4e4k4rJ
         WrR769Mp/FKfqmcg6P6XGeYFs7lU49Pr2Cc3N3wOKfZPHt+UNMvkpPE52tMtugDU7aGn
         csUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783345530; x=1783950330;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vSJ+2o+DU64Ct4lPSKlFPGtLgqM3IIcjx5unu2xlDoY=;
        b=RQTNKNl96E2dtuLrBfyD9Y+LwqF2VrQ0B+M35MYWYKKzDUGDeNudxv7aR19imK7pBN
         EJ1Am4uREkDlnoEeoBN/b2uvWcklHVTzwVOBmnYyqzGatL+ugT7t9i7oJ2m5Tz5UCx2d
         xhxwSzauSZiFkBlwliHpJkhImEXpWNxpTsM4dTGwagsJ+KKZpJaXOqauXfV6dleIqN6h
         t/2pzVPHo56dzobt2iyT9VErGSZXp3o2sh3Omg9qH7/n4kzCOBXuXtwVPigFEjInHx4V
         v3CIiNfbZp5TXBw3UENX+m6qxb8MJ5koUNmcZ95n87iwPq8Wh67EMDQ09Zx/5md4i2fZ
         NStA==
X-Forwarded-Encrypted: i=1; AHgh+Ro/YdtATxwm9N6TRKy6/Sgo2MWJXUTqIu+SqXc32yvZ6ciBzEi8FvLLdQsCxkdNeTlS7/b87o6S4nXSrg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzgf49gT/LwPPDns+5N0TPoj9k2ZpOp6/opX0VZLlDZ9x3n/jac
	OKOMaHP3s2JsRuIKtcRZXYR8acGQMl5x4+OCsKPly8G+1jQRQLXidkj9LPZD+Fw/580=
X-Gm-Gg: AfdE7cmPKiuYVHwhivK9Xm01GYqKsICz3+zkO+EIYkICNm9+3ZSQ2J93aeoY+FKn5Ve
	d0Bq8+osJS+lcdGsjuRDQk1USKO89ypVijHG5s5b5JUqA5SdD9mX6RWRWwhigWtiQjKfthIvSmX
	yg+D8qei0Yf5/KOplvHmkw6+kK5Ejqo33Jm7leJSb+2sKSpm2coNkbRrYxQg151oJbySMy/Bwea
	HSZvap5tW3P0GhjII28WeQx2Pu3bj7TPvaFW0QJsjfezWLvZ/fSy9/+rjeJ2sJObs7AOBoBxATY
	5/b0DcGhV+nvHowx7P9pYhbHry1h4/lUKWnrMvE5d/SDS2NNfF2NRJZy1tkKDBRN28HbvSbY2oy
	vQ7qXqJ7sV7yk8T5tOzFyp5mlfyrVgyWbz+3q6dCUG+wI7HPKH816vi6sF2hv
X-Received: by 2002:a05:620a:608c:b0:92b:67e6:4b79 with SMTP id af79cd13be357-92ebb30952emr83798985a.35.1783345530033;
        Mon, 06 Jul 2026 06:45:30 -0700 (PDT)
Received: from ziepe.ca ([159.2.72.92])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cfdefasm943428385a.47.2026.07.06.06.45.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 06:45:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1wgjdY-00000000Szh-370N;
	Mon, 06 Jul 2026 10:45:28 -0300
Date: Mon, 6 Jul 2026 10:45:28 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dan Williams <djbw@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	driver-core@lists.linux.dev, ankita@nvidia.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Dexuan Cui <decui@microsoft.com>
Subject: Re: [PATCH 08/15] device core: Initial device trust infrastructure
Message-ID: <20260706134528.GC107792@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <20260705220819.2472765-9-djbw@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260705220819.2472765-9-djbw@kernel.org>

On Sun, Jul 05, 2026 at 03:08:12PM -0700, Dan Williams wrote:
> Introduce a per-device trust concept [1]. To start, it plumbs "auto" and
> "none" levels to enable a scheme of requiring explicit opt-in to operate a
> device. This supports a Confidential Computing use case of operating a
> limited / vetted device and driver set to bootstrap the environment. It
> leans on module policy to effect changes to device's trust level.
> 
> The motivations for using module policy to effect trust are:
> 
> 1/ It exists, no new ABI needed to inject "device firewall" policy into the
>    kernel [2].
> 2/ Trust is a function of how the device is operated. A driver can be
>    trusted to carefully operate an untrusted device.
> 
> It may prove too coarse for some situations, like a driver that talks to a
> mix of trusted and untrusted devices, or a module that contains multiple
> drivers, but it is a place to start.

I'm a little confused what this is is for?

Is this how we bootstrap enough drivers to get into the initrd? Ie
is it only relavent for key boot time things like CLOCK, IRQ and IOMMU
drivers?

Once we get to the initrd eveything should be driven on a per-device
basis without anything to do with modules. We already have cases for
mlx5 where it will have to drive trusted and untrusted devices in the
same system.

> Specifically this "module trust" scheme allows for only attaching drivers
> from built-in modules by default, or modules that explicitly pass a
> "trust=auto" option by building with CONFIG_DEVICE_TRUST_NONE=y. Modules
> can also be configured to skip device attach by default by setting
> /sys/module/module/parameters/require_trust.

So I'd imagine most systems would make all modules have
require_trust=1 and some userspace compoment in the initrd will
evaluate and assign trust to devices to trigger binding and module
loading?

> The new dev->p->trust level is the operational trust level of a device. It is
> only in effect after device_add(). It is private to the device core because
> the "tcb" level is not suitable to be changed while a driver is attached to
> the device. The result force_dma_unencrypted() must be stable while the
> device is attached to its driver. That core coordination responsibility is
> not suitable to export to non-core code.

I don't think force_dma_unencrypted() should be driven from the trust
level.. It is a property of the interconnect, the trust level sits on
top of that.

> +config DEVICE_TRUST
> +	bool "Device core support for specifying trust levels for devices"
> +	help
> +	  Enable support for generic device trust levels when building a kernel
> +	  that needs to operate in the presence of potentially adversarial
> +	  devices. This is selected by buses that want to operate devices with
> +	  reduced privileges, like externally connected devices, and it is a
> +	  pre-requisite for operating devices with access to private memory in a
> +	  Confidential Computing VM. See
> +	  Documentation/ABI/testing/sysfs-kernel-iommu_groups for the type of
> +	  IOMMU enforcement in effect.
> +
> +choice
> +	prompt "Default device trust"
> +	default DEVICE_TRUST_AUTO
> +	depends on DEVICE_TRUST
> +	help
> +	  Specify the device trust level at initial attachment. Any choice other
> +	  than "Auto" assumes auditing the built-in driver set for trusted
> +	  drivers, and an enlightened userspace modprobe policy for other
> +	  devices + drivers.
> +
> +config DEVICE_TRUST_NONE
> +	bool "None"
> +	help
> +	  Devices are disallowed from attaching to a driver, and where
> +	  possible, the device is blocked by an IOMMU from accessing
> +	  assets.

It is a confusing what devices this applies to? I guess it is all
devices that are not built in?

I think it should also be in a kernel commandline, we should be able
to support a single kernel image that works for CC VM and non CC VM, I
think. You'd want the CC VM to have a kernel command line to turn on
some of this stuff.

> +choice
> +	prompt "Trust devices with built-in drivers"
> +	default BUILTIN_DEVICE_TRUST_AUTO
> +	depends on DEVICE_TRUST
> +	help
> +	  Built-in drivers always bind to devices they match. Only
> +	  select a setting other than "Auto" when building a kernel image
> +	  targeted for use in Confidential Computing or other known
> +	  adversarial environments.
> +
> +config BUILTIN_DEVICE_TRUST_AUTO
> +	bool "Auto"
> +	help
> +	  Typical historical driver model, devices eagerly attempt to attach to
> +	  a driver and deploy all available mechanisms to allow performant
> +	  direct memory access This trust level does not grant TCB privileges.

So what's the other choice?

Is this "AUTO" or is it just all builtin devices?

I think it does grant TCB privileges in some cases, ie the VIOMMU
driver that binds is in the TCB and does have T=1 equivilent DMA
access.

What we want for a CC VM is a curated set of pre-initrd devices can
auto probe:
 - Drivers internally have some kind of attestation, eg on ARM the
   VIOMMU driver is going to have to ask the RMM to prove the VIOMMU is
   legitimate
 - Drivers that don't do any DMA at all, and have approved drivers
 - Drivers that are known to be hardened for untrusted DMA


Maybe these options should be named a bit differently?

config DEVICE_TRUST  <-- If the device trust framework is compiled in at all.

DEVICE_TRUST_BUILTIN_DEFAULT = ALL, AUTO
  Decide how pre-initrd devices are handled. ALL is current Linux,
  every built in driver binds and runs, AUTO follows some module policy?

DEVICE_TRUST_MODULE_DEFUALT = AUTO, NONE
  Decide how post-initrd devices are handled. AUTO is current Linux,
  follow the ACPI/etc. NONE means the initrd must run a policy agent
  to assign trust.

> +/* SPDX-License-Identifier: GPL-2.0 */
> +/* Copyright (C) 2026 NVIDIA Corporation & Affiliates */
> +#ifndef __DEVICE_TRUST_H__
> +#define __DEVICE_TRUST_H__
> +
> +/**
> + * enum device_trust - Level of restrictions and privileges for a
> + * device. Trust is initially assigned by the bus, and the bus is
> + * responsible for coordinating transitions between trust levels with
> + * DMA/IOMMU and its own device security mechanisms.
> + *
> + * @DEVICE_TRUST_UNSET: Unregistered device object with no current bus
> + * @DEVICE_TRUST_NONE: Blocked when idle, cannot bind
> + * @DEVICE_TRUST_AUTO: All typical privileges granted

I expect there would be two enums, the policy - eg from the sysfs/etc
which is possibly this, and then the actual in-effect trust level on
the actual device which should only be DISABLED/FULL/ADVERSARY ?

So maybe call this enum device_trust_policy ?

Jason
