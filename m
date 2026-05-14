Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1CA2248867;
	Thu, 14 May 2026 13:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778766597; cv=none; b=ThlLZ/pMNaRJ4n/TzGvp3FkWjDe6K9/kkaajKZ6c9F0uGLggEifAiWAg1KGy/58NQ/XpYncEupk7m8I2tv8jPcZzzC0H1GfpObevGKwxWUDHYSPLeYvBdJvj0g27O7nd26kMn/aGfjUcKHoI1XcD32fkQtjtDPRn/4Bj8CduwZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778766597; c=relaxed/simple;
	bh=ELBN6SwvwFihNqbqf8GHCVnp9QNV3fohvFqFQFtcqas=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MY+uqql941Vtj765/T54yqtaD6HgJopJBHBEViWYEBrp6TJfqF6deg+EpTQfvnkkHBrGzolpfIvgpmWNyLc9n0WQl3EOBTe0JPxZrR2bJSuHU2EUn3OSXas8fJFVkbVL6EH3nQDQ9CeqK+pXkXn0Zq+IR1n/vZMKkqBztWGkMlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tc8rFlQ3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tc8rFlQ3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFDD6C2BCB3;
	Thu, 14 May 2026 13:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778766597;
	bh=ELBN6SwvwFihNqbqf8GHCVnp9QNV3fohvFqFQFtcqas=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tc8rFlQ3Tip8Xyjkcs0setH/0pZui5J7W8jFdp3bMl0zBjdfgM4Xc/pvPljlejZN2
	 K9K8EMlweJXZ/hfgyk76uMtCkjCEgnqCsxDYRp8lsvQcMBKJYDo44TGRfErbcvime+
	 V+N6ehzD7glK0YUHsT48LiH3hiNNopymduEkIONw=
Date: Thu, 14 May 2026 15:50:01 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianlin Lv <iecedge@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rafael@kernel.org,
	dakr@kernel.org, jianlv@ebay.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] driver core: Add cmdline option to force probe type
Message-ID: <2026051406-corridor-equation-c50e@gregkh>
References: <20260514094955.76305-1-jianlv@ebay.com>
 <2026051443-exuberant-important-534f@gregkh>
 <CAFA-uR93Wf2ALpYnnU79kruv7XO=uFePqioaEXNNEfrUtRw2xQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFA-uR93Wf2ALpYnnU79kruv7XO=uFePqioaEXNNEfrUtRw2xQ@mail.gmail.com>

On Thu, May 14, 2026 at 09:35:08PM +0800, Jianlin Lv wrote:
> On Thu, May 14, 2026 at 6:16 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, May 14, 2026 at 05:49:55PM +0800, Jianlin Lv wrote:
> > > From: Jianlin Lv <iecedge@gmail.com>
> > >
> > > Device drivers that use asynchronous probing can cause non-deterministic
> > > device ordering and naming across reboots. A typical example is storage
> > > drivers (like sd/nvme): asynchronous probing can lead to inconsistent disk
> > > logical names after reboot. In scenarios where disk naming consistency is
> > > critical, the probe type should be set to synchronous.
> > >
> > > This patch introduces a driver_probe kernel parameter that overrides any
> > > driver's hard-coded probe type settings and allows runtime control without
> > > requiring kernel recompilation:
> > >
> > >   driver_probe=PROBE_TYPE_SYNC,nvme,sd      # Force specific drivers sync
> > >   driver_probe=PROBE_TYPE_ASYNC,*,usb       # Force all async except usb
> > >   driver_probe=PROBE_TYPE_SYNC,*            # Force all drivers synchronous
> > >
> > > The implementation replaces the limited driver_async_probe parameter with
> > > a more flexible interface that can force either synchronous or asynchronous
> > > probing as needed.
> > >
> > > Signed-off-by: Jianlin Lv <iecedge@gmail.com>
> > > ---
> > >  .../admin-guide/kernel-parameters.txt         | 27 +++++--
> > >  drivers/base/dd.c                             | 71 ++++++++++++++-----
> > >  2 files changed, 74 insertions(+), 24 deletions(-)
> > >
> > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > index 4d0f545fb3ec..b43a8bd20356 100644
> > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > @@ -1377,12 +1377,27 @@ Kernel parameters
> > >                       it becomes active and is searched during signature
> > >                       verification.
> > >
> > > -     driver_async_probe=  [KNL]
> > > -                     List of driver names to be probed asynchronously. *
> > > -                     matches with all driver names. If * is specified, the
> > > -                     rest of the listed driver names are those that will NOT
> > > -                     match the *.
> > > -                     Format: <driver_name1>,<driver_name2>...
> >
> > You can not remove an existing user/kernel api, sorry, that is not
> > allowed as you just broke all systems that were relying on this :(
> >
> Could you provide more suggestions on how to improve this patch?

Not really, sorry, I don't think this is a change that should be done at
all.  disk naming is a long-solved issue, to think that you can fix that
by doing sync/async device probing is not understanding both the issues
involved, and how we solved it already :)

Hint, never count on block device, or any device, names to be the same
across reboots.  That has NEVER been guaranteed on systems built in the
past 20+ years.

Please, just use the existing solutions, no new command line option
should ever be needed here.

thanks,

greg k-h
