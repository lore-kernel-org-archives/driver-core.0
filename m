Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5552B47F3C0;
	Sat, 17 Oct 2026 09:49:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792230586; cv=none; b=SKcOwGoPRr+qJyc0ZsdJXfofk4grPcTCtLZr83IfIR21P831LFEyUqOOaCl6EY2JXwBTrPwvsBa97Am07/zGonqXVAWNKz1oeljdzBnueq93Ldv39wYTZnMzpUbdGC8NyzX+wWljamkSQ0Whc6Fy2fJA1LsuLDIgkeizJ2Maguc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792230586; c=relaxed/simple;
	bh=wtw76fpqDTM+645HTWMTwDzD4jLd6YYy/uv1gEpwNQ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HT7rKhmY+hN01KlLPSpK8LdSl41cM8dF3uhBR+5YqTNurCItb2s568Q++RoJXmnSPjqEd/8UDAWEVXZTTONRxM7nMjDtkm8uuP+MgAgOzgZa1suuVrZaiVqljZJ9cVtKU7WFMh12JXJIpr5Z6x4bk7c7NlipQMWjpgZpWM0SoJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QTmb9Evg; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QTmb9Evg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C6B51F000C4;
	Sat, 17 Oct 2026 09:49:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1792230584;
	bh=0v6jDYELEoPMmDXkahCDrZiNmZ8hcnf3dYviNBQoZgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QTmb9EvgaRrUvYbKsI4njaklWsA+IdL+VLYdT42zLNAsKO1I9QaPzv9D07RCDtMGB
	 gOlTBKtsYeX5on5tG9JG+SEfgsasiCNw1HrV/DBXl5asNJ2Dkrsiplcsn1CoS0RRtN
	 Uic32M3fBnFpltK9o8reNx2VcQpes8N4i0/XMQ5o=
Date: Sat, 17 Oct 2026 11:49:41 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver core: unbind only the driver whose unbind file
 was written
Message-ID: <2026101755-mangy-flatterer-3d87@gregkh>
References: <20261017020935.792500-1-nickolai@csail.mit.edu>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017020935.792500-1-nickolai@csail.mit.edu>

On Fri, Oct 16, 2026 at 10:09:35PM -0400, Nickolai Zeldovich wrote:
> unbind_store() checks dev->driver == drv without the device lock and
> then calls device_driver_detach(), which is
> device_release_driver_internal(dev, NULL, dev->parent): with a NULL
> driver that function releases whichever driver is bound once it holds
> the lock.  Between the check and the lock another thread can unbind
> drv and bind a different driver to the same device (a second write to
> the unbind and bind files, a driver_override write followed by
> drivers_probe, or the bus re-probing the device after the first
> unbind), and the write to drv's unbind file then detaches the other
> driver, one the writer never named, and reports success.

bind/unbind now causes a taint, so what is the real problem here?  A
root user is poking around and causing problems, so any error is their
fault for doing this?

> The pattern is as old as the unbind file: the check was never under the
> lock and the release never named the driver.  The locked variant has
> existed since commit 4bdb35506b89 ("driver core: Add a wrapper around
> __device_release_driver()") added the drv argument to
> device_release_driver_internal() for driver_detach(), which has the
> same requirement.

Because this has always been present, and no one has actually reported
this, perhaps it is not really a problem at all?  In other words, what
real-life-use requires this?  Again, bind/unbind is for developers only.

> Pass drv to device_release_driver_internal(): it re-checks dev->driver
> under the lock and releases the driver only when it is still the one
> the file belongs to.  When the driver changed in between, the write
> detaches nothing; drv is no longer bound to the device either way, so
> the write still returns the count.
> 
> Found by formal verification of drivers/base/bus.c.

Where is the formal verification proof?  Please don't have your LLM
claim this without that as it's pointless.

> Fixes: 151ef38f7c0e ("[PATCH] driver core: Add the ability to unbind drivers to devices from userspace")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---
> 
> Notes:
>     The unlocked dev->driver == drv test stays as the fast path (a device
>     bound to another driver still gets -ENODEV there); making the write
>     return -ENODEV when only the locked re-check fails would need a return
>     value from device_release_driver_internal(), which three other callers
>     ignore, and the writer's aim, drv no longer bound to the device, is met
>     in that case. The race window is the time
>     between the test and __device_driver_lock(); it was not hit in testing
>     (no in-tree pair of drivers with a slow probe was raced), the
>     interleaving is described in the message and a userspace racer is in
>     the review material. bind_store() has no such hole: __driver_probe_device()
>     checks dev->driver under the lock.

I don't understand, this is not a place where a "race" can happen.

thanks,

greg k-h
