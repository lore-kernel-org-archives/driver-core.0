Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336655;
	b=mILBBfwK7GQHTLKVyQh0LtEfadlWHUhR7vjzXapotdzvTepkcp17FHcGyCqY+Hl7VRP+
	 onaGHGPycFpPfhTER0yG95XnYzVxaGeia414n41yj91AZAsaiJU4/a+7kRt/SzvfLYcX3
	 HnvkrV3r8+wMUFyVpK6iK7Y3UATDvlmtgTjhrmUhdUMMOnyTIaKKKw2ZrVrNztpXVZGwK
	 3SSr5DyCcDklUwpQOoFnEmHtpw6bor9s0Vndatrw70CmFWzmLTyniU4E8nL8hgPkVg9vk
	 hIxlI+dLa52Vw1OX7JFhDBJqQusrJs/Nyxp7U/EjKstuQHlXVsp0OBdgOCXfJZbJGMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336655;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=TLIEKiLnj0Svc8OLuV26uLTBvGAIcklYqv2MJo7h/Pk=;
	b=5OUfjC/cKDjAcmZkJWybKKITb1oZma4BQk7OFOiUzXOgH72XeB45mYSBoSdvtZBeSxgV
	 IQqFtjV0AV//9IWelCIqom2Sxb+LwpfYHjVj4l/8tSk8uBzReXe0z8lZ3zXsDQ7GnvnQ6
	 kSI0Ssbso88PVneqGTx0S1kIpDdhNF5j67Kw6mPRaNL7RrcXQ0poDeP8UL/NVbP2G0x3E
	 WKqDgEmQcjw9iIJvKCAwOrBISHxcI+jjsrekZBBDyWdt7pVaJ1NFtLl/416hsrIXw6myV
	 HacbMJIjxiUbFci4vGOYNC16cRGuq6TSBrRXPosueAuaOZmfrEowqdXgTwOE7gxEoRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FlALCbgf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8083606A321;
	Tue, 10 Nov 2026 18:50:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=FlALCbgf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CD611F008A1;
	Tue, 10 Nov 2026 18:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1794336654;
	bh=TLIEKiLnj0Svc8OLuV26uLTBvGAIcklYqv2MJo7h/Pk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FlALCbgfGObjh4irUhwOyiSTPhH1aRRBibuJpKB+AKB79sQBZowZT3DQb5apVEm2w
	 Anr8OI5d32pB6DL+0FZ1LEOHIQiM07xLeVAcKpSYxJ4kUd1scYhpKcYpi9aFR85z73
	 hfQbWCjrFpF6laGAE916rq0okbSTiOEQ8Gris2bA=
Date: Tue, 10 Nov 2026 13:50:49 -0500
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	linux-mtd@lists.infradead.org, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v2 02/58] driver core: retain the owner of device release
 callbacks
Message-ID: <2026111037-stir-hermit-cb21@gregkh>
References: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-0-9137d08f05df@gmail.com>
 <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-2-9137d08f05df@gmail.com>
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
In-Reply-To: <20261110-submit-rawnand-retained-handle-lifetime-v1-v2-2-9137d08f05df@gmail.com>

On Tue, Nov 10, 2026 at 12:44:05AM -0700, James Hilliard wrote:
> Device references can outlive the driver or subsystem operation that
> unregistered the device. A modular release callback needs its code to
> remain loaded until it returns. Dropping its last module reference inside
> the callback permits concurrent unload before the function epilogue has
> finished.
> 
> Add an optional release_owner to struct device. device_initialize() takes
> the reference before the device can be published. The built-in device
> core caches the owner before invoking the release callback and drops the
> reference after the callback returns, allowing the callback to free the
> device itself. This also covers initialized devices that were never added
> and device_add() failures.

Please no, we have tried this in the past and it's not good.  Devices
are data, which is different from code.

> MTD will use this to keep its release callback available after retained
> device references outlive driver unbind.

This isn't a good idea, dig through the archives and see what went wrong
before please.

As a hint, look at networking, no module reference counts anywhere!
That's the proper way to do it.

thanks,

greg k-h
