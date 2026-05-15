Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A26CA372698;
	Fri, 15 May 2026 08:05:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778832332; cv=none; b=QJCt9/O76gFG3aVdftKyZIN8OnFR420xgUmD25PadlxNc8FwXQEJTqqjIWyTc22pnOI7DW/hBxJoZOfwEqmbZdYfE1Gb4MRS7W9IG2cM4uHiiqBCrWqb0565GfrEDdpuD5Is18SqObUcxgOErRPYKXz76sjy/QSSikY+gx/fDYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778832332; c=relaxed/simple;
	bh=YC+m8abWFopx+Nm486DLqohl3gVgRQtOHlTAMvs/kk0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tkApnlyFQbgdJkKepZzIJBJW0sj9l39mNGgYfQ0bkZqwXET6Ci1RhIaPCs5YfumDL7XHgWy7Vtldri4qBx5ARGwV+iFrOC9zD0hLznsvHI+cAwzEyiBWpk26kOu101/6f5zqSHFkT50M6+JPQd6J9gwVI10WmMa6cht3cQZNlzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=pLnyVZ8R; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="pLnyVZ8R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3F6C2BCB0;
	Fri, 15 May 2026 08:05:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1778832332;
	bh=YC+m8abWFopx+Nm486DLqohl3gVgRQtOHlTAMvs/kk0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pLnyVZ8R4I7HF0X54h1Yu3TMm34hPVVkkKDkv2wFVxL/fdm/bBgi/Eu2mw+WgeFq3
	 ilqTA+Dj4oLvtvXLOHm7wt4nTatOWl5AwU1FlkednCKQUsb/wdR+b6OVa5t1whFSWE
	 /I4rEDN2WMiGvUN4z2HbTQLNSVTy5oWpVNEw/ZbM=
Date: Fri, 15 May 2026 10:05:36 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Jianlin Lv <iecedge@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rafael@kernel.org,
	dakr@kernel.org, jianlv@ebay.com, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] driver core: Add cmdline option to force probe type
Message-ID: <2026051558-spiffy-same-f3bb@gregkh>
References: <20260514094955.76305-1-jianlv@ebay.com>
 <2026051443-exuberant-important-534f@gregkh>
 <CAFA-uR93Wf2ALpYnnU79kruv7XO=uFePqioaEXNNEfrUtRw2xQ@mail.gmail.com>
 <2026051406-corridor-equation-c50e@gregkh>
 <CAFA-uR9=rHPbiVFYgDBAdRHCoujKjqtTxsMVupEwGhGmXoLw8w@mail.gmail.com>
 <2026051532-pettiness-gave-1127@gregkh>
 <CAFA-uR8Jj+MJaauAeEUoS+OfuudrV8C4mG2we-nd7-Cvofokhw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFA-uR8Jj+MJaauAeEUoS+OfuudrV8C4mG2we-nd7-Cvofokhw@mail.gmail.com>

On Fri, May 15, 2026 at 03:54:17PM +0800, Jianlin Lv wrote:
> On Fri, May 15, 2026 at 2:13 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, May 14, 2026 at 11:09:03PM +0800, Jianlin Lv wrote:
> > > On Thu, May 14, 2026 at 9:49 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Thu, May 14, 2026 at 09:35:08PM +0800, Jianlin Lv wrote:
> > > > > On Thu, May 14, 2026 at 6:16 PM Greg KH <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Thu, May 14, 2026 at 05:49:55PM +0800, Jianlin Lv wrote:
> > > > > > > From: Jianlin Lv <iecedge@gmail.com>
> > > > > > >
> > > > > > > Device drivers that use asynchronous probing can cause non-deterministic
> > > > > > > device ordering and naming across reboots. A typical example is storage
> > > > > > > drivers (like sd/nvme): asynchronous probing can lead to inconsistent disk
> > > > > > > logical names after reboot. In scenarios where disk naming consistency is
> > > > > > > critical, the probe type should be set to synchronous.
> > > > > > >
> > > > > > > This patch introduces a driver_probe kernel parameter that overrides any
> > > > > > > driver's hard-coded probe type settings and allows runtime control without
> > > > > > > requiring kernel recompilation:
> > > > > > >
> > > > > > >   driver_probe=PROBE_TYPE_SYNC,nvme,sd      # Force specific drivers sync
> > > > > > >   driver_probe=PROBE_TYPE_ASYNC,*,usb       # Force all async except usb
> > > > > > >   driver_probe=PROBE_TYPE_SYNC,*            # Force all drivers synchronous
> > > > > > >
> > > > > > > The implementation replaces the limited driver_async_probe parameter with
> > > > > > > a more flexible interface that can force either synchronous or asynchronous
> > > > > > > probing as needed.
> > > > > > >
> > > > > > > Signed-off-by: Jianlin Lv <iecedge@gmail.com>
> > > > > > > ---
> > > > > > >  .../admin-guide/kernel-parameters.txt         | 27 +++++--
> > > > > > >  drivers/base/dd.c                             | 71 ++++++++++++++-----
> > > > > > >  2 files changed, 74 insertions(+), 24 deletions(-)
> > > > > > >
> > > > > > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > > > > > > index 4d0f545fb3ec..b43a8bd20356 100644
> > > > > > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > > > > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > > > > > @@ -1377,12 +1377,27 @@ Kernel parameters
> > > > > > >                       it becomes active and is searched during signature
> > > > > > >                       verification.
> > > > > > >
> > > > > > > -     driver_async_probe=  [KNL]
> > > > > > > -                     List of driver names to be probed asynchronously. *
> > > > > > > -                     matches with all driver names. If * is specified, the
> > > > > > > -                     rest of the listed driver names are those that will NOT
> > > > > > > -                     match the *.
> > > > > > > -                     Format: <driver_name1>,<driver_name2>...
> > > > > >
> > > > > > You can not remove an existing user/kernel api, sorry, that is not
> > > > > > allowed as you just broke all systems that were relying on this :(
> > > > > >
> > > > > Could you provide more suggestions on how to improve this patch?
> > > >
> > > > Not really, sorry, I don't think this is a change that should be done at
> > > > all.  disk naming is a long-solved issue, to think that you can fix that
> > > > by doing sync/async device probing is not understanding both the issues
> > > > involved, and how we solved it already :)
> > >
> > > Do you mean referencing disks via by-path/by-id?
> >
> > No, use something that does not change, like filesystem labels or
> > serial numbers, or something else that is guaranteed unique.
> >
> > > In our production env
> > > they can also be unstable; this is an example I encountered before:
> > > https://lore.kernel.org/all/CAFA-uR_jk6jCmf9DTebSVBRwtoLuXuyvf1Biq+OObqRVAOZbBw@mail.gmail.com/
> >
> > Yes, paths can, and will, change.  Don't use them.
> >
> > Why not use a UUID, that is explicitly what those are designed for.
> 
> For cloud deployment, the local volume provisioner detects
> and creates PVs for each local disk on the host, and it cleans up
> the disks when they are released.
> The local volume provisioner is deployed in the cluster as
> DaemonSet.  For the same SKU, it uses a single, unified configuration
> file to initialize local disks. In this scenario, UUIDs are not applicable.
> In our case, logical names are used to identify the disk.

Ok, but again, there is NEVER a guarantee that those logical names are
going to be the same across boots.  Please NEVER rely on them if you
wish to mount things properly.  Use a label on the filesystem instead.
Or something else, you have loads of possibilities here.  Attempting to
manipulate driver sync/async order is not going to solve your problem at
all.

> > > I understand that device naming in the kernel can change at any time. However,
> > > Is it necessary to provide an interface that allows users to choose
> > > the probe mode themselves?
> >
> > It's not going to solve your problem, so I wouldn't worry about it.  And
> > you can't remove it, although I really would like to :)
> 
> OK，Is the reason we can’t change the priority of driver_async_probe setting that
> the original logic has changed, i.e. it would alter the original behavior?

Because it is a user api that people might be relying on for various
unknown reasons.

thanks,

greg k-h
