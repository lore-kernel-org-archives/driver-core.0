Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B13E32701C4;
	Wed, 29 Apr 2026 11:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777462404; cv=none; b=WNHpSOjg/gxUwbSc+z/djzvFfcB4uXc9FbzxMQjJB4AK9V2z4rwQxwoRLqIVf30qNnxq1O5Ti8wc7HYRyaxt0Hu1vUbIt9lCqqib+0uZQCOClJ85FSNENSu7WhYM9QomJzY5dt6ISlPm3T6HktAvvyt2+qz+6hxzomOGTx6igFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777462404; c=relaxed/simple;
	bh=lOlOp1v12Z1/RWZKLhuO3eKL8iTY0MHiXh40WE3cpTE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d+pNLwJ8EaQqp+2uvt8M6n1iXAt6+2egDJxU90K6mSL/NwJVdADkzeU/z/oF+VswMCfmAttSxsw4s0IigszV+/bL4r2FRqDCxwUXqhKpfjfnfaS1LKxiFXcdoVYYKAf0L1o0XQobuYblC63DOcPOyZ/B8y5RlZiZk24j1MAmIpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRK80Ifo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRK80Ifo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E47DC19425;
	Wed, 29 Apr 2026 11:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777462404;
	bh=lOlOp1v12Z1/RWZKLhuO3eKL8iTY0MHiXh40WE3cpTE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GRK80IforZJ75sPcUW5zH++ekHBwziLXY8Lv4I969ADGv/4fpg+SKdV/dqLvaGjFz
	 qjcw2KQP9/dp3MQec8XRDyGpYfaTSrb7mZj+xJaJTljvbtMunEGUsrNJ2JsOUmuJFt
	 9UisFcxVSXc4fGcTeDp65/RdvUvm/N/J5YU0SITTHYOA5/1qMNfQt+OK6MiB+xsQKV
	 xXXPWh1WkZJ0fkSKO2bBUpD1lXawHWNKnZu6okSfpYd4n+TvlA1F/lZVh/8BmB9kAP
	 FJOgk0oAZ/8NmSy0UK0xiXXVRjaMW2EIlUh6oDQO9FTCfMhxTRpR/3btDRqeiCf84y
	 0sK478xoB2ZBA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wI3AQ-00000000izu-0pnY;
	Wed, 29 Apr 2026 13:33:22 +0200
Date: Wed, 29 Apr 2026 13:33:22 +0200
From: Johan Hovold <johan@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] driver core: reject devices with unregistered buses
Message-ID: <afHsgv9SUqfn-G1x@hovoldconsulting.com>
References: <20260427102852.2174-1-johan@kernel.org>
 <DI50WG9XK1I4.1R6DXSZSWFRDC@kernel.org>
 <afHZWasOhRaeBCnt@hovoldconsulting.com>
 <DI5LDIQW45PE.LPIWCARJV7WC@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DI5LDIQW45PE.LPIWCARJV7WC@kernel.org>

On Wed, Apr 29, 2026 at 01:11:44PM +0200, Danilo Krummrich wrote:
> On Wed Apr 29, 2026 at 12:11 PM CEST, Johan Hovold wrote:
> > On Tue, Apr 28, 2026 at 09:09:04PM +0200, Danilo Krummrich wrote:
> >> On Mon Apr 27, 2026 at 12:28 PM CEST, Johan Hovold wrote:
> >> > Trying to register a device on a bus which has not yet been registered
> >> > used to trigger a NULL-pointer dereference, but since the const bus
> >> > structure rework registration instead succeeds without the device being
> >> > added to the bus.
> >> >
> >> > Reject devices with unregistered buses to catch any callers that get
> >> > the ordering wrong and to handle bus registration failures more
> >> > gracefully.
> >> >
> >> > Fixes: 5221b82d46f2 ("driver core: bus: bus_add/probe/remove_device() cleanups")
> >> > Cc: stable@vger.kernel.org	# 6.3
> >> 
> >> Hm...this sounds like hardening and not like a "real" bug fix. Do you have a
> >> specific reason why you added Cc: stable?
> >
> > It's certainly a bug fix and this change in behaviour was clearly
> > unintended.
> >
> > Any caller getting the ordering wrong would now succeed in registering
> > devices, but no driver would ever be bound which is harder to detect
> > than the earlier crashes. 
> >
> > Whether any offenders have snuck in since 6.3 I don't know, but I still
> > think this warrants a backport.
> 
> I see where you are coming from, and I agree that having an explicit error print
> is an improvement over "the device just never got probed".
> 
> However, this isn't an actual bug -- it just happens to make a "real" bug less
> obvious to catch.

It seems we have differing definitions of "bug", but to me this is
clearly a bug in driver core. Whether anyone will hit it, is a separate
issue.

But if we have any racing subsystem vs device registrations this would
allow us to catch and fix those more easily. And the fix is straight
forward and only turns a silent breakage into a properly logged error.

> That said, I don't see how this warrants a stable backport, i.e. it doesn't even
> fall under the "this could be a problem" or "theoretical bug" category, which
> typically are not accepted either.

Yeah, under the documented rules it may be a bit of a stretch unless you
consider it a "oh, that's not good" issue.

> As mentioned in the other thread, if this was relaxed, I'm happy to hear about
> it.

It has been in practice as I mentioned there.

Johan
