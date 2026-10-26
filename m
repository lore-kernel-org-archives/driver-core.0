Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793055307;
	b=d+hIZe++SK1D7J82QaSeBP1KGyPMvAZvEsZQ9j6QiRUJq4B6naZwa7UhS0xduey0u0UK
	 FWw+JCP8cFtLVHjTEAtcEHr8HFqxHbySSq8tSMQQmjgmoq2u4eaueVVDlGcl6gVV4Yywd
	 MsUe7X2ftRSdDZYat7c43ApB0vKa0hfVyWP+Ukc9GMak7/+iegucsFr4T82Ga3mFddp+S
	 wMR3zSiYqk4VY5RQPCYwmrbadosqW1x1ArlM3SzZjpVbAlhxZrEy28Yo2VYTMlO4X/Oxu
	 yWyXbu5yDehhFQien09UYS08IQ2SlBVkErTes1vtHxvBqF8VBsfKLOBIbLLQrrE3lNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793055307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Qv4yXz9mBS7TK9aKYpPIFfG0d3O9zFyQxnBKda+GG2U=;
	b=ZBgW6X9X1HgF43p0/2sOCAcUj+IBwiOv+ryeWRiyAqE3l910BQklGQ/Im058I4nh20mb
	 ip7UM8ebjpbw82NDe3i4fytZ/lQeRcIDwfNCwW23UXfGQixcbsW8jsKSk/zzTo2q8yNlt
	 9geOuSISOIrhNUXVE8j0iTB4z0NfEmdw8fKp9lMr3OHrUz5Bld0tkn120ZmXbkfTXV0x9
	 ykEz2cync7ybQyiNr9hWYRzczp370LqWh54A3IuY3NdnLZsxwmKnB023ioB5YeBqR0XLQ
	 8QMt5Mh0jVfSDqA3UcMfpLApHq0vm3irR1n14LNYXUJhB1mlUcm56VPAYNYmqRWzPgQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FuqVittV;
	arc=none smtp.remote-ip=209.85.160.180
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AC18606A31F
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 22:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5AC18606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=FuqVittV
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-5364c951da4so32191831cf.1
        for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 15:55:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793055306; x=1793660106; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Qv4yXz9mBS7TK9aKYpPIFfG0d3O9zFyQxnBKda+GG2U=;
        b=FuqVittVePHS4CZvhS1+kQYFgQ7nEfHnbWQxU1GbGQvX5VsDvwf073kpe82F4Wq9kI
         QM9BSBOQlhap4lJ0pIV+IDtF7+uHT5tofjefC7m4bIBGg6vbQGsIf1HHY3RE+RClKnJ1
         +jKEybGt+x1FYb8j58hjCMB1puoNtVAyR2sZAj3gZXNTgidcxiSP8AXqjByy+WlhZCFF
         ekDvxpemT0ees/sbywoTS3Hw/Aj/Bzdu11tWsKZ+OXDyQZo6VHcVWOGJOkuN+YAm5pKt
         7ccQ9loyVNZ88mtXViKEPseTIiS2eqaYXCG/QL/lCEUgnhdy4VknFogX0xap6OYjxurx
         jj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793055306; x=1793660106;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Qv4yXz9mBS7TK9aKYpPIFfG0d3O9zFyQxnBKda+GG2U=;
        b=UAtTILXTPWfRe3W8C5Whl/PPZHWZuND3bZj0cwA7ii+jJF3JLZgU97tnfm43OEhJNM
         rgRcnk8AAJr9XkmjU4vP6OGywEFmDDnGP6lgJknvRAAworUEEz5LO8hzcVh9lCcV5dYy
         oc2KPQdbSAlpmSACp5833Sgg9Tb/m+MQibCrulv433Ima3DRcwptUhsL50r+0Xpc9rrU
         M/sRPqcwk/uJexBQu2ki17nxIh3OyVxOAYppY8FBphMuOLSce+8mvLLkXWshN8DxBpnv
         s7eB45y1tL9OP42ptiGpM6HT3x9qlxcr82uRYHjMu6PE6uxaFnCwAPgWJ7Y+8jrMU0RP
         FkvQ==
X-Forwarded-Encrypted: i=1; AKwUvBwpRuq9+z2jMcQzg8WikHSH50KE2SI5VpDCUHkoXFYA9Adm+HIxwVLsvcKd5XWeSGZOdHMMwa7EMAt/kQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYK0JH7hhgkNCrZxFPRwqHW3Y8rPfsoL7pxnNcIVqGfTgvnPr3au
	dJ84lo24iYGdkwtCU2Wr3/b+LNfImmZcAECIDSaV/WAk9vrHfZWxvTqKq+Bb9dCdl70=
X-Gm-Gg: AYBFou391RHPiUTXg8vrSQIUCN6Q8Jlepfl1h1gTNhDgJndrYirLP8JGDjcn2lBT76M
	FTreuiMxpcmfEnM5Baltp8CTFm1Oh4SyFmVr+RnmC/rB68pJ2dmhl6LCyVaPY0jdFeVxdorQdI+
	S9mM4Wg8p4X+R3nCYA4VnT/h4VwMXXAEtGWa69pLnyImPqhxaBWcx2aS8P4nBaAr07dOozGBGzj
	wbgSVLNIPboNySuZXqiBtpn8GUA2sWUR0/cc5C1SimMjIZP4RuSEr3yFBWtHh5IGblRz8VSn/O9
	3ylSuAcD5p2SpXLNEfPrhcAF8KRaIqQs5NlOh0AQakI7Ia8zkGUoUwCvrSM8I7d6bfEjzii6+NN
	gIhruYYg2WQdsvaUDvpgBEkb/k2iH2hJK9v6wZmk9xtTvwLsHAF2C1Qzpzrj7sa7qBTJuHRquBU
	89XbyXgPindxVgl/xLTfTUseufVrsbUH9h2ZWV8z8dMzICdF2VcjUgR8Giap1m9yW8zYdLdMIsU
	BYKOLGgi5mG1nr03hWEyEvM+59jz7xJWc4elCrsUu6tQanO1KrNGPaQ3V2bBUMeV+J7MLizIgA1
	AXX9N1Fu1bH7dRa0/+IM+GUSMJkoZaeD5SMlPQ==
X-Received: by 2002:a05:622a:4b18:b0:535:80b:9911 with SMTP id d75a77b69052e-5383b4b0e1dmr122069761cf.24.1793055306222;
        Mon, 26 Oct 2026 15:55:06 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-538394c565esm66284051cf.6.2026.10.26.15.55.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:55:05 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLTaq-000000088rN-3CrV;
	Mon, 26 Oct 2026 19:55:04 -0300
Date: Mon, 26 Oct 2026 19:55:04 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Leon Romanovsky <leon@kernel.org>, Alex Williamson <alex@shazbot.org>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Armin Wolf <W_Armin@gmx.de>, David Lechner <dlechner@baylibre.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Petr Pavlu <petr.pavlu@suse.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Aaron Tomlin <atomlin@atomlin.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Bradley Morgan <brads@mainlining.org>,
	Aleksandr Nogikh <nogikh@google.com>, linux-modules@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-usb@vger.kernel.org, driver-core@lists.linux.dev,
	linux-trace-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>,
	Richard Weinberger <richard@nod.at>,
	Thierry Reding <thierry.reding@kernel.org>,
	Bjorn Helgaas <helgaas@kernel.org>, linux-pci@vger.kernel.org
Subject: Re: [PATCH v4 0/3] driver core: add TAINT_FORCED_BIND for when
 userspace manually messes with devices and drivers
Message-ID: <20261026225504.GC1685504@ziepe.ca>
References: <DLIL9H50MALI.3JROXYEEUM3KU@kernel.org>
 <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <20261026122243.GA28851@unreal>
 <2026102654-enlighten-perkiness-193c@gregkh>
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
In-Reply-To: <2026102654-enlighten-perkiness-193c@gregkh>

On Mon, Oct 26, 2026 at 09:27:25PM +0100, Greg Kroah-Hartman wrote:
> > > Sorry, late to the party, but this isn't a few user scripts that rely
> > > on this behavior.  Effectively every use case of vfio relies on this
> > > behavior.  We rely on unbinding the default driver from the device
> > > before using driver_override and drivers_probe.  That means every
> > > hypervisor with device assignment and every userspace driver use case
> > > now experiences a tainted kernel. That seems like a significant
> > > regression.
> > 
> > Sorry, I was on vacation and missed this change earlier. This change will
> > affect SR-IOV deployments around the world, which *rely* on being able to
> > bind a driver manually *after* virtual functions are created but before
> > they are used.
> 
> Why can't a real driver bind to those virtual functions?  Like is
> happening in the rust apis?

Most people using SRIOV will bind the VFs to the VFIO driver.

The rest, it is the same as the CC case, there needs to be a gap after
creating the PCI VF functions and before binding a real driver, with a
proper match and a correct id.

This is usually managed by clearing drivers_autoprobe

Ie look at commit b8c5cec23d5c ("Driver core: udev triggered
device-<>driver binding") from 2007 explaining this workflow.

The taint on sysfs unbind makes zero sense here because we can trigger
unbind of those VFs just by disabling SRIOV through sysfs. Should we
taint that too?

> > This is needed for two reasons: to save hardware and software resources
> > when creating a large number of VFs, and to allow the PCI config space to
> > be configured *before* the driver starts using it.
> 
> How is hardware and software resources an issue here at all? 

If you create a 1024 VFs, which is what people on big servers seem to
do, then that can use 1024 x megabytes of resources to load all those
drivers which will memory exhaust a hypervisor.

This is a real case actual users run into, I saw the support requests
go by :|

> And you can write to PCI config space from userspace today, 

Not allowed in lockdown, triggered by secure boot, which pretty much
every server uses.

> > There is no in-kernel alternative.
> 
> Then just don't have a in-kernel driver for the device and all is good?

What? How do you use the HW then? Is this a serious reply?

Jason
