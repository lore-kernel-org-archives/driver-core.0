Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FFF8377EA4;
	Wed, 29 Apr 2026 16:00:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777478411; cv=none; b=qQGG+fz7XxPOT/o7v35csB3eNndPunJn5YCvyRoL7Zz2WRd/tTJU6pgBEpQJ5O6dsuRh5dxxL/5MKeRIhOqp+JFG0EWYFQgw1PFmOEAEe/uGMRHbMqDhDkJWk1Ga5vZU7gGeNBJ9Js40vuFhJY74R5aStNkfuLlAAEPx+Eqk2aQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777478411; c=relaxed/simple;
	bh=sMdRm/RbUZiy8RJgxiX/P1sf/lsJ0+eeYeKKQlydboM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9/5mK0MQQeCi3lxzWBiXIs6IP9Dm+JKksEMz0ztL/nCRU2J5vpHyhV7MZoyz5H5nNdW/HuvETUGtA0YW/7pEYpSLrkkdgIqLb83WK0QR6RdsNrgN6gdGuM2EJsH5ZN4QIQn6bDp+8imQ0dmneySy//v2V19QNzYnNFL7+00I8k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s0zAt8us; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s0zAt8us"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91431C19425;
	Wed, 29 Apr 2026 16:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777478410;
	bh=sMdRm/RbUZiy8RJgxiX/P1sf/lsJ0+eeYeKKQlydboM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0zAt8us7Zav7/LvN+zL6WEHDAM8SWvHCYqTrCOf1YSqzVcYmYEzMLvXj6BbrcG3G
	 oGiD4SbWTkiizGsoWc75YFpF0rzWHToF0ZKuKKBBiTgZvEKslazY7Kouj0WQvggdUF
	 v1Zod08XxS+u3jVwnUJlLHRnxypqDL5jn0bwOXSiPM9iQRFrPTfssArygBIYaIK4Sr
	 UM1Ri9VA9p9VmpVxd7V0JkjbLOLc4CqMPJ213wewMynlK4DVOD7qfEVKs0IOTOrr59
	 qB/s9tKVjOPCDXsx5j96zdPGCvDejZPI1c0e/NcoFaHHb7W19qgLJ8omkdhlErz/wL
	 KLKgvFXkqX4CQ==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wI7Ka-00000000mHH-15b1;
	Wed, 29 Apr 2026 18:00:08 +0200
Date: Wed, 29 Apr 2026 18:00:08 +0200
From: Johan Hovold <johan@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] driver core: reject devices with unregistered buses
Message-ID: <afIrCO3QSL3hx10S@hovoldconsulting.com>
References: <20260427102852.2174-1-johan@kernel.org>
 <DI50WG9XK1I4.1R6DXSZSWFRDC@kernel.org>
 <afHZWasOhRaeBCnt@hovoldconsulting.com>
 <DI5LDIQW45PE.LPIWCARJV7WC@kernel.org>
 <afHsgv9SUqfn-G1x@hovoldconsulting.com>
 <DI5Q29QMNVNH.1B2N4VBA2ZVQW@kernel.org>
 <afIe495IbAe7EeDt@hovoldconsulting.com>
 <DI5QUINEJC6U.32I161SD0KU76@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI5QUINEJC6U.32I161SD0KU76@kernel.org>

On Wed, Apr 29, 2026 at 05:29:02PM +0200, Danilo Krummrich wrote:
> On Wed Apr 29, 2026 at 5:08 PM CEST, Johan Hovold wrote:
> > No, I'm saying that it's a bug in driver core to silently treat a device
> > that is registered before its bus as a bus-less device.
> 
> This is an argument that I can buy into, but in the previous discussion (and in
> the commit message) the whole motivation evolved around "reject devices with
> unregistered buses to catch any callers that get the ordering wrong", i.e. catch
> other people's bugs.
>
> What you are raising now is "the driver core is conflating no bus with
> unregistered bus handling". However, the commit message does not reflect that at
> all.

The commit message already explains the issue:

	Trying to register a device on a bus which has not yet been
	registered used to trigger a NULL-pointer dereference, but since
	the const bus structure rework registration instead succeeds
	without the device being added to the bus.

namely that

	 registration [...] succeeds [but] without the device being
	 added to the bus.

> Can you please adjust the commit message accordingly?

Perhaps I can add "(i.e. as if it were a bus-less device)" to stress it
more but I'm not sure it's needed.

Johan
