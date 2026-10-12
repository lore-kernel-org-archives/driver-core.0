Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D13BE3CF1E7;
	Mon, 12 Oct 2026 12:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791809405; cv=none; b=ZX4036yMILGtq3nb4GUM1kPqKscpOGp485BsVLhFWP41eX+uWY/vuEmKtoM+ciox0qAphHueJr+UFPwiXZygvgyHdLo68jjpatbJ9NLecgkFOEoLDfq2P46l08zWUHcZz7ANbxtliYf068ArHuydjbBOXM79gqcGUqAs5c/pvgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791809405; c=relaxed/simple;
	bh=BnJGsHy+Nyu+Z0ldnQD7hMN9gYlR5W/4ZwuCOIzhZB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U6ATwmeOVMgkSOxGoxuwEhBWUoi9j5bzLeOc7ZQgP2b7gzbBd+gzY+oMZaeT/KpB+wSEZlgjCFig/P8F3w9S91/iqJ1QWtmprfsI2aeNbqGEtxfGbdPIbUzC/cdHh/+9mOeB4lMS/K80Cbzbt4Kfcw/ri7xWDgUIt1zUOCIFlOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZUEZ5DWh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZUEZ5DWh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71EA01F0089B;
	Mon, 12 Oct 2026 12:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791809404;
	bh=usrK00+yIeppSNB/bkICt3pKdfB0YN2fANbR2z8ZIE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZUEZ5DWhtYGWHk61zrtuRpow95NxuaaWnJ23UEnieef5qJzrIXU6qKzPmE5GawfS4
	 FJqrWzUODbkraE7CcPbT/xUzv6Z8vt3abdQY4JpOOXegSW0Z98+/wceYODxmsUn81g
	 Th5MdX1UnmbAU0W/eMysHq2vhHftuBHOiJHB9de0zg1qyRVWFVXWWR+lvq9S3AGeff
	 vEPAObstNeV+mtAxXSWwQOnWSdiz5SHwLmAG0ftuJ39YTl0LEiI9ZMFDz+K5XtUezS
	 Km8K5Lh/OMKbMXVrkQRaaYGWO8xVisVyindfxYIqjRcFZmf8n/wr7ZgJOEM8KELzJq
	 zdzIvf12j8a+A==
Received: from johan by xi.lan with local (Exim 4.99.5)
	(envelope-from <johan@kernel.org>)
	id 1xGFTe-00000004Ce4-0tHk;
	Mon, 12 Oct 2026 14:50:02 +0200
Date: Mon, 12 Oct 2026 14:50:02 +0200
From: Johan Hovold <johan@kernel.org>
To: Mario Peter <mario.peter@leica-geosystems.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>, driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] driver core: Take parent lock in async device attach
Message-ID: <aszXeki0LK1LYL6P@hovoldconsulting.com>
References: <20261007131514.1260696-1-mario.peter@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261007131514.1260696-1-mario.peter@leica-geosystems.com>

On Wed, Oct 07, 2026 at 01:15:14PM +0000, Mario Peter wrote:
> On buses with need_parent_lock set (only USB), probe() must run with the
> parent device locked. A synchronous attach after device_add() gets this
> from the caller, e.g. usb_set_configuration() holds the udev lock while
> adding interfaces. __device_attach_async_helper() runs the probe from an
> async worker instead, where that lock isn't held, and only takes
> device_lock(dev).

> Take the parent lock in __device_attach_async_helper() as well, like
> __driver_attach_async_helper() does, and move
> __device_driver_lock/unlock() up for that. With this the warning was
> gone in 300 boots on the board and in 6000 iterations in QEMU.
> 
> Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for drivers")
> Assisted-by: LLM
> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> ---
> v2:
> - Describe the race in more detail
> - Keep the multi-TT detail, but say why the hub has to be multi-TT
>   for this symptom
> - Reproduce and test on v7.3-rc6 in QEMU
> 
> In the same QEMU setup, a debug-only device_lock_assert(&udev->dev) in
> usb_probe_interface() fired on every async probe of a hub interface
> without this patch (52 of 52) and never with it (0 of 102). The hub
> emulator and the test scripts are small, I can post them if that helps.

Thanks for fixing this, USB interfaces should indeed always be probed
with the parent lock held:

Reviewed-by: Johan Hovold <johan@kernel.org>

I believe we want this in stable too:

Cc: stable@vger.kernel.org

> Not covered: deferred_probe_work_func() also re-probes via
> __device_attach() without the parent lock.

Thanks for reporting this as well. I've started preparing a patch to
address it.

Johan
