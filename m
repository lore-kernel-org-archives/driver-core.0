Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793054781;
	b=z/3DkdZjd9/lgEysYZyinhWNLxmQChVk8vStjlp27mYHeXhK1hjIYwxNAeu9bObqYz0e
	 8ojQiphjz86FL8PVcTyu735TE5GKJ3KOXo+1z+UI7IEkN+HzkRZNISMIbSyUY7rsqC/1g
	 XBCz1wN+NkAwEfQP0nCp2N/WVCj7rN64yb41NIRjmof//ul1eM+QQzdIi2vD9JoEXA7SX
	 mE0PZGOjvLwe+A+f0XYYtEVDcQP4VTbPFFyV7NDDdLKCW0/ItkLyEmqrVmEcBmMn/To84
	 fVppsqCCfPk/JCgDl4hCVnyo/q9ZFtL0W2sVlw1WjU850G/O4UWVrVzw32iIzYwyH9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793054781;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=+Idt4XOOJiJpLeVn+jwc4zJtq10BdWV/RKYdo6dVBsA=;
	b=MkDfA1jnszfN15Pvfetf+wcBN7GKJYenSobY+XZi67jwuMoA03kswsjBN/rmfes4uiT4
	 5L0+2nqpC+AxNGvrYsr68WEK/E1XaDg1IrPzVqezy8ONtYE9eCB/xM/TX8PLzPjSFNznY
	 HI5BhaGFwKIwosBWOEzEV6V4C2PvoxMoYP+aWpOCeG7h4qTT5XxUwdG94FgbRpcAFESEb
	 av/G5hTrGd6MyGThMPCvOLbFbgs+B0tnOCHL46voehPMkaFC9g89ALN+bPRPuw8Dtc1ha
	 abF2IfnHT3C3wbmE2eeZ0X6JiFZN3soRcxMMjsi8Z6XnmH44nWpbiNQjo7AdRtTYKsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.222.171
Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 517EE606A31B
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 22:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 517EE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-93e63ee7b4cso450900185a.2
        for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 15:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793054775; x=1793659575; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+Idt4XOOJiJpLeVn+jwc4zJtq10BdWV/RKYdo6dVBsA=;
        b=gcc1aCvhAdLlX09WN2psVH+ILgS9urPxyXEFP2Qt6XHeZ/1HUtAhEXsGhqcjTzQiCz
         SCcFqYEXOkhlKPUrOgF980uKhmexThaC0c4whmjOdUQDt0uaiYkfcK4eCrylPmAFapt8
         sqbJAZXQn9mxN/EvaXpATQcyNh/GF4XzoX8yySVcPPH2VOgzSRpziTCPdAwIr0Lufn7b
         IOABmUefWy5F/Ug/+eX8nmcmpOvvslb2lSInz0zi6OnWR3xPfrohqcruI1LE0m3SpxnJ
         m5cXdagtI7lkFPIdbXl49bTaiWnfvqnUzy5iBXcBGzwInIekPZGyPdv3qq9RDqsgU9T7
         3thQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793054775; x=1793659575;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+Idt4XOOJiJpLeVn+jwc4zJtq10BdWV/RKYdo6dVBsA=;
        b=wdYMC8zJL8TFtqP+Tb8ZMcVwbQmG3fGPIsUwMqYOPehtJnFVua01fS81MdsSaZbcu3
         wxeiiIKqC8SyKKvvsLV6SFL8p4ZJsgmlit12khAV4h/qiTcwBi9Jx2w2g8/TJQ8BbSka
         wCo+eOvSxLiR/81WBbOWe96/4yDdt3QTHmD6d90gxW2cg4bzhxLPesSSsQscKCbvuNks
         +pj1H4blhBEHyvGgzczBF1/1G4zzzD/LQKkXhmVtSK/5Vi2eP4iiJJopeVspUwx7K9O+
         9J9I0YKZdy4ML3zZkOsbD4C1MY3ereBicsFcG0Ugby1Sw934uLq7RvmMSuB4AemqLtfg
         +afQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFwyaIyn92uMDmJONdtVDS3+UzmJ3JIRCXSSVaY0pOmY/T3vgzEu4CdACTO11RxlHhkLovFLKhB2Ozog==@lists.linux.dev
X-Gm-Message-State: AFq9FYKhlKMgH+iSkpgT3hTxONiO/fBT4H270aSL2PklFSKCOdYcs2kr
	9OdeUTYO/I9QPzO/Sz+59WBaXo1D2RyCJOMTeAdHMLCXCXqljaRP82N0qYJJ4nES44g=
X-Gm-Gg: AYBFou0Bc/1X/Aw2xj1CajTH6Ad0RtXRLNSD3SjyEUUWR2upSUAGtlZs+GwgqmnTJk2
	P2fGoV7vWBMd4JusILnHaZIhuqMh1AZRT681dqfyh/PkBobyparKncfFgW8bsRFZ873wGRXpdK4
	exZvDsW59/qpvGvFFAjkQ3kxO38nPfXxm7Y0w7ZDmunaF7gGzNnDdZAvF6Day7l6ujo2gIBuka9
	8JwtnoW2jb19OcTVYF6TYJF7qYgtHweUnt3Qp5QFMndlBQq3W/IRNATvvhrHxFHO7wPqtMk6pSc
	defMd1SEIHKdPC/EZPx0VUn8L4OjfqnByMN57AAp5wnxmLZf24XpccHxlYlH6FydCZF4/zylpow
	pS5eDmwvwFxZM4KdLX1wSeY5mKZ6mdPZ3+Oc8RYsLAzMIlBXDjZ9NeiNBh+EeEEt/wmBUrt1O3W
	DYuoOAfiNYIRebBoAskfeHmDmrEK2ESPme0ztownqIPesnjkj/WEhV5aqnvR87v80mViO1jG1mB
	8yEp63p6DXl3ozIfJNk8aE0DajIGEQAw/AhJalwHYT/AaziynSL2xa9rW7cKGkOYXF0rsG2cDLA
	DakzAeoMSu4Aq1/lUWe9L+vWk3bUAbNoqVcHxA==
X-Received: by 2002:a05:620a:4728:b0:93f:2eaf:64cc with SMTP id af79cd13be357-940ef942794mr1259449285a.44.1793054775098;
        Mon, 26 Oct 2026 15:46:15 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-940f05b20e0sm810207185a.3.2026.10.26.15.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 15:46:12 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLTSF-000000087nJ-1Z9f;
	Mon, 26 Oct 2026 19:46:11 -0300
Date: Mon, 26 Oct 2026 19:46:11 -0300
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
Message-ID: <20261026224611.GB1685504@ziepe.ca>
References: <arIvG0nx4LXG9nlW@monoceros>
 <defb3953-7516-437e-b70b-d57de55b91bf@baylibre.com>
 <9bd3a34b-5e98-4038-80d6-da2c3b1948dd@gmx.de>
 <2026092321-province-yearly-44aa@gregkh>
 <arOfHEsGGglNse7T@monoceros>
 <2026092348-victory-erased-0e5a@gregkh>
 <20261023181326.0dc2f7ed@shazbot.org>
 <20261026122243.GA28851@unreal>
 <20261026184312.GA1685504@ziepe.ca>
 <2026102604-tint-catcall-433e@gregkh>
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
In-Reply-To: <2026102604-tint-catcall-433e@gregkh>

On Mon, Oct 26, 2026 at 09:05:06PM +0100, Greg Kroah-Hartman wrote:
> On Mon, Oct 26, 2026 at 03:43:12PM -0300, Jason Gunthorpe wrote:
> > On Mon, Oct 26, 2026 at 02:22:43PM +0200, Leon Romanovsky wrote:
> > 
> > > This is needed for two reasons: to save hardware and software resources
> > > when creating a large number of VFs, and to allow the PCI config space to
> > > be configured *before* the driver starts using it.
> > > 
> > > There is no in-kernel alternative.
> > 
> > Having userspace involved in driver binding has also always been the
> > plan for confidential computing needs. We cannot have a device driver
> > bound across some of the HW transitions like TDISP shared/private, so
> > there has always been an expectation of bind/unbind.
> 
> What, why?  What forces that decision?  What's wrong with the proper
> driver for the hardware being bound automatically to the device?

It would be a proper driver, with a real match. I would expect this to
be done with sysfs driver_probe, which is like bind, except it doesn't
override the matches, AFAIK.

There are two sort of related isues. Userspace is in charge of
sequencing the new PCI features like link encryption and TDISP. They
have complex authentication policies tied to them so the kernel can't
reasonably do it. These features change how the CPU does address
translation, effectively it adds/removes the iommu - and that can't be
changed while the DMA API is active or it breaks every translation in
effect.

So.. We need a gap a system boot when the driver is not bound so the
PCI stuff can be done prior to driver_probe, and a gap if there is a
PCIe error of some kind to do error recovery and go back to the start
to reauthenticate and reload.

> > For this case the existing sysf drivers_probe is good enough for bind,
> > but we must have taint-free unbind for PCI devices too.
>
> Why?

See above. That should be the easiest thing to ask for! PCI is hot
plug, disabling unbind makes zero sense from any way you look at it.

> > I think this patch should be reverted ASAP, it is a pretty major
> > regression for a lot of users.
> 
> But this use case hasn't even happened yet, so what would regress?

I'm reflecting the other commentators, I care about VFIO too. I think
tainting every hypervisor is unacceptable.

But for CC I find myself one of the maintainers for that now and many
people have been diligently working on this bind/unbind direction for
a long time now. If it goes away I have no idea what could replace it.

Jason
