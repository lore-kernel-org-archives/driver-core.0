Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB41A4B1268;
	Wed, 14 Oct 2026 12:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791980206; cv=none; b=kpQk5eI+pB+ur5+/CEVHk0P2xmrkh2bu2NFI5nRWvI4FCoCRfcD+SaaulJ5X0u63WACA/JrgpGCv/lTij4EEhbInNf6rKHptI+x2m+/E7cPH1z5QweAlmmF8JmvqkN3f/OMIuGKrkOpSGuADAIr38MuMwOAMwVLv12PW6zKS+dI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791980206; c=relaxed/simple;
	bh=5/frXZ7UOZQdL6ibWfMYkce8h2DlCNYYPRx3fNHjyYc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oESheDr37f2bStVgrhR54YVG/h2EWPx7/1mjPToKCI5dFCULWgQrOhyihw8WrmJ5lE6o+QKEkVXQIJSeUEHdgpoCdT6B7W7OjSDLQgJfS8bgabkEaXd/lSNIw5vP3ivr4pKXytcoXVaEr9+NFvYPtyhRiEgZQSdojYwuP73v+iQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=dyKFVv2R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="dyKFVv2R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E62581F000FF;
	Wed, 14 Oct 2026 12:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791980205;
	bh=ILPfYtQPedwqe7pxPK+WTNwjSrNL2MxBpD5pByW5Pwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dyKFVv2Rzlyv+dsX53HxsgHCJwNjYCXUOfOIdcC9vhtC2yep/hvlOiCV+u6N/ZMIA
	 KpPCdBzGRdfz+Ua2BFZIGT8T9Y/MsXS0oyAX0r7+UAAS1l2RvnhEMoeHnJs3CuNuoN
	 hNflmR/dax2hdz3gbw0mt4A34dtEl9BRJKZ868o8=
Date: Wed, 14 Oct 2026 14:16:50 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: fix race between bus_remove_driver() and
 dev_driver_uevent()
Message-ID: <2026101409-unkind-ablaze-08a3@gregkh>
References: <as71DkwHeLGNDsPv@google.com>
 <2026101444-unnoticed-caliber-21d5@gregkh>
 <as8dAu4R99pP1GHD@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <as8dAu4R99pP1GHD@google.com>

On Tue, Oct 13, 2026 at 11:11:33PM -0700, Dmitry Torokhov wrote:
> On Wed, Oct 14, 2026 at 07:31:19AM +0200, Greg Kroah-Hartman wrote:
> > On Tue, Oct 13, 2026 at 08:24:20PM -0700, Dmitry Torokhov wrote:
> > > When a device driver is being removed, bus_remove_driver() removes the
> > > driver from the bus klist before detaching it from bound devices. If
> > > dev_driver_uevent() runs concurrently on another CPU, it may acquire the
> > > bus klist lock after the driver has been removed from the list, read the
> > > still-valid driver pointer from the device, and access the driver's name
> > > while bus_remove_driver() proceeds to free the driver structure.
> > > 
> > > To close this race window, acquire and immediately release the bus
> > > drivers klist lock after all devices have been detached. This ensures
> > > that any in-flight uevent generation that observed the driver pointer
> > > before device detachment completed finishes reading the driver name
> > > before the driver structure is destroyed.
> > > 
> > > Fixes: 18daa52418e7 ("driver core: fix potential NULL pointer dereference in dev_uevent()")
> > > Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > ---
> > > 
> > > Extremely unlikely to hit so I would not worry about backporting to
> > > stable.
> > > 
> > >  drivers/base/bus.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > > 
> > > diff --git a/drivers/base/bus.c b/drivers/base/bus.c
> > > index d17bd91490ee..8b3aaf451e4f 100644
> > > --- a/drivers/base/bus.c
> > > +++ b/drivers/base/bus.c
> > > @@ -830,6 +830,15 @@ void bus_remove_driver(struct device_driver *drv)
> > >  	driver_remove_file(drv, &driver_attr_uevent);
> > >  	klist_remove(&drv->p->knode_bus);
> > >  	driver_detach(drv);
> > > +
> > > +	/*
> > > +	 * Ensure that any concurrent dev_driver_uevent() that observed
> > > +	 * dev->driver before driver_detach() cleared it, finishes
> > > +	 * accessing drv->name.
> > > +	 */
> > > +	scoped_guard(spinlock, &sp->klist_drivers.k_lock) {
> > > +	}
> > 
> > Shouldn't the compiler just no-op this away into nothing?
> 
> It better not. Why would it?

Sorry, early morning before my coffee had kicked in, I was thinking a
simple lock/unlock pair without any data in the middle might be compiled
away...

Still feels odd though I don't have a better idea.

greg k-h
