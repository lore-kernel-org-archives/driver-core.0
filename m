Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B8C3793B5;
	Fri, 15 May 2026 06:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778825612; cv=none; b=nZL3twL7bV3X3/DVj/rQvuQscWaOz+FBreDjO4y3b+/SxVNpklT5HdxEhD55v6Ivwg9H3Ntqsma+mNz4AyYgWJrAdqbYoMCNzC/8PISrvl5cd4eqF5cN7/KCvvfQagcwCWJ/JzsEA9imJwJYPDPLQOBeh8V+zNPHMtbs/DDBPio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778825612; c=relaxed/simple;
	bh=bxFauuEhZecKkG3eAvSIZ8iTW+w0AxyuKsgl03YOim4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QdczuYiF2BptgDGzdeJ8E3oT5YmFah2T89F6Yk3IBHfm3mG1pLqIj7QI+jgq4u5T910MCscJP9gihavFGr9SqWXcstI4Q3Zwas4HL8BkD2QWBuCqTDynZVSxHebqBsGaydfpIJhLqPF2VRAB8xWk1w5KbIR9yPS3upwVdO2LbX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=JQg+Nz5C; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="JQg+Nz5C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4484DC2BCB0;
	Fri, 15 May 2026 06:13:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778825611;
	bh=bxFauuEhZecKkG3eAvSIZ8iTW+w0AxyuKsgl03YOim4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JQg+Nz5CbLKxaBKCU4pdHIC+38UlFr0QsyjY6Y83S+mHAoznL5Chm5CkJa6LUHKPG
	 tXFE3OcCWKG8FQJfQUWJxsxHL3CgYJNm1SrjNWgG5jsddSFqJBXPZoiprrVmx6Ivx5
	 zEHwwuT29YEN0V5CcOFmBBdXotcOekLATvjWeoVM=
Date: Fri, 15 May 2026 08:13:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianlin Lv <iecedge@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rafael@kernel.org,
	dakr@kernel.org, jianlv@ebay.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] driver core: Add cmdline option to force probe type
Message-ID: <2026051532-pettiness-gave-1127@gregkh>
References: <20260514094955.76305-1-jianlv@ebay.com>
 <2026051443-exuberant-important-534f@gregkh>
 <CAFA-uR93Wf2ALpYnnU79kruv7XO=uFePqioaEXNNEfrUtRw2xQ@mail.gmail.com>
 <2026051406-corridor-equation-c50e@gregkh>
 <CAFA-uR9=rHPbiVFYgDBAdRHCoujKjqtTxsMVupEwGhGmXoLw8w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFA-uR9=rHPbiVFYgDBAdRHCoujKjqtTxsMVupEwGhGmXoLw8w@mail.gmail.com>

On Thu, May 14, 2026 at 11:09:03PM +0800, Jianlin Lv wrote:
> On Thu, May 14, 2026 at 9:49 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, May 14, 2026 at 09:35:08PM +0800, Jianlin Lv wrote:
> > > On Thu, May 14, 2026 at 6:16 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, May 14, 2026 at 05:49:55PM +0800, Jianlin Lv wrote:
> > > > > From: Jianlin Lv <iecedge@gmail.com>
> > > > >
> > > > > Device drivers that use asynchronous probing can cause non-deterministic
> > > > > device ordering and naming across reboots. A typical example is storage
> > > > > drivers (like sd/nvme): asynchronous probing can lead to inconsistent disk
> > > > > logical names after reboot. In scenarios where disk naming consistency is
> > > > > critical, the probe type should be set to synchronous.
> > > > >
> > > > > This patch introduces a driver_probe kernel parameter that overrides any
> > > > > driver's hard-coded probe type settings and allows runtime control without
> > > > > requiring kernel recompilation:
> > > > >
> > > > >   driver_probe=PROBE_TYPE_SYNC,nvme,sd      # Force specific drivers sync
> > > > >   driver_probe=PROBE_TYPE_ASYNC,*,usb       # Force all async except usb
> > > > >   driver_probe=PROBE_TYPE_SYNC,*            # Force all drivers synchronous
> > > > >
> > > > > The implementation replaces the limited driver_async_probe parameter with
> > > > > a more flexible interface that can force either synchronous or asynchronous
> > > > > probing as needed.
> > > > >
> > > > > Signed-off-by: Jianlin Lv <iecedge@gmail.com>
> > > > > ---
> > > > >  .../admin-guide/kernel-parameters.txt         | 27 +++++--
> > > > >  drivers/base/dd.c                             | 71 ++++++++++++++-----
> > > > >  2 files changed, 74 insertions(+), 24 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > > > index 4d0f545fb3ec..b43a8bd20356 100644
> > > > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > > > @@ -1377,12 +1377,27 @@ Kernel parameters
> > > > >                       it becomes active and is searched during signature
> > > > >                       verification.
> > > > >
> > > > > -     driver_async_probe=  [KNL]
> > > > > -                     List of driver names to be probed asynchronously. *
> > > > > -                     matches with all driver names. If * is specified, the
> > > > > -                     rest of the listed driver names are those that will NOT
> > > > > -                     match the *.
> > > > > -                     Format: <driver_name1>,<driver_name2>...
> > > >
> > > > You can not remove an existing user/kernel api, sorry, that is not
> > > > allowed as you just broke all systems that were relying on this :(
> > > >
> > > Could you provide more suggestions on how to improve this patch?
> >
> > Not really, sorry, I don't think this is a change that should be done at
> > all.  disk naming is a long-solved issue, to think that you can fix that
> > by doing sync/async device probing is not understanding both the issues
> > involved, and how we solved it already :)
> 
> Do you mean referencing disks via by-path/by-id?

No, use something that does not change, like filesystem labels or
serial numbers, or something else that is guaranteed unique.

> In our production env
> they can also be unstable; this is an example I encountered before:
> https://lore.kernel.org/all/CAFA-uR_jk6jCmf9DTebSVBRwtoLuXuyvf1Biq+OObqRVAOZbBw@mail.gmail.com/

Yes, paths can, and will, change.  Don't use them.

Why not use a UUID, that is explicitly what those are designed for.

> I understand that device naming in the kernel can change at any time. However,
> Is it necessary to provide an interface that allows users to choose
> the probe mode themselves?

It's not going to solve your problem, so I wouldn't worry about it.  And
you can't remove it, although I really would like to :)

thanks,

greg k-h
