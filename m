Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A36823E8C77;
	Tue,  6 Oct 2026 15:01:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791298897; cv=none; b=nItibpRxeWxwHGe3sb2A4zpUYqjMwEOp4Wx1FgqRPEa8F1hh7I6A2Vvh4HAGxQ6SEm5aNZdUtSuObVNn++YTUTHWFwLlgpKmLEe8HylOFKvt6i908JeFdrf/Ta2M26wFn78CW7StCpa4tFoSmu1h3Ac0UFNJtLWiZxtKYwue54A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791298897; c=relaxed/simple;
	bh=AawIuNNuAdZmKEotUJLIOKE8pXpFWRNIYA/39Sn99WY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hBscE5IJa69DM9SoQU/EUjNQ5r18H9o4lf33DjsGtccvQopsfUvP2rproP5zQEzP2X6szHcDoIFIVOQzS0cLhF0jpHZErBJrZHouW4iW5xlUo/IgLk+JF8JaSaff+SYBBJj4j8LyLZsLKC3w3+1pGwjnJNKpi8Hzhqyipo26vjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=SAHF3URF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="SAHF3URF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAA5B1F0089B;
	Tue,  6 Oct 2026 15:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791298895;
	bh=OGKvTKGfYMz2Mi1hTbuVKuDdNpjudbrA/okQD5pP910=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=SAHF3URFjrrJvuaN7niGhBM8e/rsm+w6A8pKVK+2I8i7lSLwHI5syi8G7axYpfzC3
	 SHglXGqnTwUGxayIVwv1dy7Ev0Lwb+duAf5ujVoUmNDj/kwMizcfEpV1tYEyvvg2nw
	 5N9MYI9c/BVIxgFbk3an9MiR3lnpDZUDbNaaf/RU=
Date: Tue, 6 Oct 2026 16:38:26 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Mario Peter <mario.peter@leica-geosystems.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>, driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] driver core: Take parent lock in async device attach
Message-ID: <2026100658-stoic-unread-22c6@gregkh>
References: <20261006132335.4014316-1-mario.peter@leica-geosystems.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261006132335.4014316-1-mario.peter@leica-geosystems.com>

On Tue, Oct 06, 2026 at 01:23:35PM +0000, Mario Peter wrote:
> On buses with need_parent_lock set (only USB), probe() must run with the
> parent device locked. A synchronous attach after device_add() gets this
> from the caller, e.g. usb_set_configuration() holds the udev lock while
> adding interfaces. __device_attach_async_helper() runs the probe from an
> async worker instead, where that lock isn't held, and only takes
> device_lock(dev).
> 
> With async probing enabled for USB drivers (driver_async_probe=*,
> module.async_probe=1), hub_probe() of a multi-TT hub then races with
> usb_set_configuration() and both create the interface's endpoint
> devices. On an i.MX8MM board this hit 11 of 100 boots:
> 
>   sysfs: cannot create duplicate filename '.../1-1/1-1:1.0/ep_81'
>   Call trace:
>    sysfs_warn_dup
>    usb_create_ep_devs
>    create_intf_ep_devs
>    usb_set_interface
>    hub_probe
>    usb_probe_interface
>    really_probe
>    __device_attach_async_helper
>    async_run_entry_fn
> 
> Take the parent lock there as well, like __driver_attach_async_helper()
> does, and move __device_driver_lock/unlock() up for that. With this the
> warning was gone in 300 boots.
> 
> Fixes: 765230b5f084 ("driver-core: add asynchronous probing support for drivers")
> Assisted-by: LLM
> Signed-off-by: Mario Peter <mario.peter@leica-geosystems.com>
> ---
> Seen and tested on 6.16.y, which has the same code here. On mainline
> only build-tested.

Please verify this on the latest tree, 6.16.y is _VERY_ old and
obsolete, lots has changed in the year it was released.

> Not covered: deferred_probe_work_func() also re-probes via
> __device_attach() without the parent lock.
> 
> Analysis and patch done with the help of Claude Code.

This feels really wrong, what bus is the host controller on for these?

thanks,

greg k-h
