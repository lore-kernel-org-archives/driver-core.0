Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5018F399018
	for <driver-core@lists.linux.dev>; Wed, 14 Oct 2026 02:38:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791945538; cv=none; b=COXwjqGNq+1aAKZqjBoAOAJ/7MfeBgbo5maY/+E8TSQBy84lnhvHiS2cjbJlhzXg9S012TTHt0TzmJXM4NCHOT0K7avatlrjwqp4If/umdz8rQnRhkyCnZRSChfEHaskQ77b3gC1f82/wXFh95r4d++X5e7uMRS6Y/h4zzIRyos=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791945538; c=relaxed/simple;
	bh=ScelcZyE52ZQd8lA4ACXuwYHHmFqpRNhs5nb7pATNtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=O54GEw7xcvHn7Se37RH2XCIys32PmRusSivoZ2BI8LdygPLZd0h9sSmDiLIoYqtA4SXtAEO/O1ff4GMUZ1ldYI5vBkG87RrEaJdcKLaCEwIfC5yHGO191VuWDaQ6+GBWuwpV9p9U31JiahO5Q6gJySf96wMjZj2H7A2/1M7thgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=GrE2HhWX; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="GrE2HhWX"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-535853983f0so35971231cf.2
        for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 19:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1791945536; x=1792550336; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=81rgxI9/Er4yjHtl/CLpwDXbGoyatzgl1W8u9x4gaMM=;
        b=GrE2HhWXv2V3yOTA9Q6GAdMfH5Mtwf51YXL5ek9jGoCNoRQ9OvNJya3buNJQvDfIAM
         2G9Z+7oDIMdpV8rYs+nV/95s4LRVDZ8TZsWxFdN+C3wT2BXHYzsedeFebYUBfgkLHUMO
         fTIFi3mOnm96jCeZbgs5TIrThCMdBNe0pNDEjc9Zt04drabJJYf7vzMuHP1EsNkYte1h
         LRuiM/QrEGMKkI3vZK8N4rpJmC/ed/RZSASA+be/RM1ebMDBbm7mydzOXnVXh2IpuaFp
         S8+f0d1tM0lw1vASgibFkzc2+sLCe9GFt3jvxbIirhqQfvxPQZVC6Hruj1POAbSrjMqz
         Gmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791945536; x=1792550336;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=81rgxI9/Er4yjHtl/CLpwDXbGoyatzgl1W8u9x4gaMM=;
        b=o21JUb0r/VFy1pGfuyFzs2a8LqSS6ECs6LIX11xy5pFdI/qGB+0sIgwiaIJoAAYBP9
         L/uXwJdwy0PY+yKJxt1ccRY0dMDEHcDiN0B9Xa3njY3eiL3Gj4dxmcmuW44iqV+yYhSC
         luW2LgGNWCLMDZKKq+EDoQT1wIFoLC28Qw1WXMa4CjwmpSrUCZWD/Dey45UicLDwyar6
         0alol4sbS6EKyTg7hlr4wuEp4jgMTmUrTv0Y8xghP5wy6fwQicZNPXVAdvqAbYNjMb4R
         P2nNGgXRhuvNZdKIyaaFgvzDK24qh/gZ4nUexnpRhoBXRiekLImFCEpf8L3lRK8yidoP
         SESQ==
X-Forwarded-Encrypted: i=1; AKwUvBw1tusxif8B+qC/7cc/av04LXf7PFDAuRQi41b4sU7fFAgagIoRLDPMBuoNYkZ9HiXIWQ1dPUF2D66SgQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYLjCMVg1XRuYy7YcakDmQBmw96UrVmBczuDiN6bnLmOXAtGnmzu
	l9NoAldY/DPq9o3oJ1Vp/m+Ev9OJyIUGUcsTTmcr3TlxUSexD+m9H+cwZn2X7sbN9w==
X-Gm-Gg: AYBFou12GNmirbM2xHl5kx0aGnONSjjBm4Y8DI0f3rSe+Qnt3xIiQyuzGxZhFupUeW1
	1YvZqE8Ep2tuqvUgp3M6tum/sgsKdyzlIU1ryKk5fm1ogEJ122G8Q7zce7M/t55lsOfSNuUh7L5
	rgl0eygT6LyZtm1h7EmPFFbHK8P41fOtWsl6Xw0GzjoIB1kjzKIts/gF0FLE95sj+ZErg5NFuNS
	Frgu8PnkynOvCRNr73YiJq+Eme0f0VTPShcJK1inJ7YWOz0h9uVJkMEUvfpMBD7xtdAcW/9rUxd
	Wi7UKEhhuuR3SWrQj7Zpg9ki4CgYd0Z+DKAa3TspOiTmme+dbRaPCPRTrq1CnnP+3bPy46V7n7i
	d2+bHGw3S3aJXARfLaqZ5VLOMomhoM67jBqR9n19Wob4EpvEQCZKOnHFU/Ph2EPFpOW5bWfszub
	jg+HWO30mR04/N1wrhkO3RWWiSSHmKLuStsZh5scANOXgpotmDIRPIRuJaGTcEuTc5QCnMKiI=
X-Received: by 2002:a05:622a:2483:b0:534:b7b2:6353 with SMTP id d75a77b69052e-5359fdcab5bmr204146021cf.56.1791945536079;
        Tue, 13 Oct 2026 19:38:56 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::4791])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5359b7c0214sm116472561cf.25.2026.10.13.19.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 19:38:54 -0700 (PDT)
Date: Tue, 13 Oct 2026 22:38:51 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Johan Hovold <johan@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	driver-core@lists.linux.dev, linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Peter <mario.peter@leica-geosystems.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] driver core: take parent lock on deferred probe
Message-ID: <9803935c-11d9-48a0-8d4c-95c478a724a8@rowland.harvard.edu>
References: <20261013140615.1226992-1-johan@kernel.org>
 <DM3WA69YX6WE.2Q4DY9MIU7A0L@kernel.org>
 <ba24846a-7403-4bb1-a0cb-869cf1d44e05@rowland.harvard.edu>
 <DM40HVOBKMFI.3W1DK371ZWI80@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM40HVOBKMFI.3W1DK371ZWI80@kernel.org>

On Tue, Oct 13, 2026 at 11:01:16PM +0200, Danilo Krummrich wrote:
> On Tue Oct 13, 2026 at 9:11 PM CEST, Alan Stern wrote:
> > On Tue, Oct 13, 2026 at 07:43:08PM +0200, Danilo Krummrich wrote:
> >> On Tue Oct 13, 2026 at 4:06 PM CEST, Johan Hovold wrote:
> >> > +void bus_probe_device_deferred(struct device *dev)
> >> > +{
> >> > +	if (dev->parent && dev->bus->need_parent_lock)
> >> > +		device_lock(dev->parent);
> >> 
> >> This looks like it has the same potential UAF as the other patch.  It's quite
> >> unfortunate we need the whole need_parent_lock thing just for USB.  IIUC the
> >> main reason USB needs this is because interface devices share resources of USB
> >> devices and we need to keep the locking order to avoid inversions, right?  Is
> >> there more to this from the USB side of things?
> >
> > That's pretty much it.
> >
> >> I think we can probably do something like this
> >> 
> >> 	struct device *parent = NULL;
> >> 
> >> 	scoped_guard(device, dev) {
> >> 		if (dev->p->dead)
> >> 			return;
> >> 	
> >> 		if (dev->bus->need_parent_lock)
> >> 			parent = get_device(dev->parent);
> >> 	}
> >> 
> >> to avoid the problem, but it's still a bit ugly.
> >> 
> >> > +	__bus_probe_device(dev);
> >> > +	if (dev->parent && dev->bus->need_parent_lock)
> >> > +		device_unlock(dev->parent);
> >> > +}
> >
> > Wouldn't it be simpler just to make each USB interface take a reference 
> > to its parent device?  And likewise for USB devices, if needed?
> 
> The driver core already holds a reference count of the parent between
> device_add() and device_del(), which is where a "parent" is technically defined.
> But the deferred retry can extend beyond device_del().

There could be another reference that extends all the way to the child's 
release.

> USB interfaces already take an additional reference to their USB device in
> usb_set_configuration() and drop it in usb_release_interface(), so they should
> already be protected against this particular UAF.
> 
> The issue concerns a USB device and its parent hub's USB device.  (This makes me
> wonder whether probing a USB device actually requires the parent USB HUB
> device's lock to be held, or whether this is just a consequence of sharing the
> same usb_bus_type?)

The latter.

> In theory a USB device could also keep a reference count to its parent, but then
> the driver core code would rely on an implementation detail of its users; I'd
> prefer not to make driver core's access to dev->parent depend on references
> maintained by individual subsystems.
> 
> I'd even go a step further any say that if subsystems try to keep this pointer
> valid beyond what's guaranteed by the driver core, they should do this with a
> separate bus specific pointer.  The reason is that otherwise the lifetime and
> ownership definition of this pointer does not depend on API contracts, but on
> individual implementation details, which is a very common source for all kinds
> of bugs.

I was going to suggest that the driver core could acquire and release 
these extra references automatically for devices on a bus with 
need_parent_lock set, but it looks like that can't be done because the 
bus_type might not yet be set when device_initialize() runs.

However, is there any real reason why the driver core wouldn't want to 
guarantee that dev->parent will be a valid pointer up until the time 
when dev is released?  For every device that has a parent, not just USB?

On the other hand, there's something a bit weird about this whole thing.  
The problem arises when you want to probe a device whose parent has been 
deleted.  Isn't there some sort of protection to prevent that from ever 
happening?  I mean, doesn't deleting a device imply that all its 
descendants have been (or are in the process of being) deleted?  And of 
course, deleting and probing are mutually exclusive -- they can't race, 
right?

Alan Stern
