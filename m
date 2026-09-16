Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7D40385D68;
	Wed, 16 Sep 2026 17:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789580839; cv=none; b=DsS9gNbPbPRr986fCaHc3h81O+GZtqmooi3tiBVZeiL6/XxJ9lx76QsFeyz4BkP4ADxmV+THPvAZPSYGQ2gLM+wWKUe3s+XWgTOGypso0ES28jnR0XnTDp2/Lcr5u8nqkso6AX1nuOYFqU8CygVZi8Pso7NGQ/IkIp2s2vn3qss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789580839; c=relaxed/simple;
	bh=yTTlFWgSZoB5Ze3ipNIE45cvJqLjK82Ugqk/V+ISEOg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oWU1JqtdNe+PuP30WPSsWx0wCqZafS2xmXl2kGEKvBdDSx91G3e7yWnt/WxQJFFoX4CJwhQTwftI/qo5SqQXCj5nDod6e05ZA6wh1coiHtxaWQDCitL2b9S7VZMF+atcyR1yZcQdu8Ym3B4ArdN9PMsxADXHLZVmQ8+QF+Qcgug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=oZ7GaB3h; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="oZ7GaB3h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BAD9C1F00893;
	Wed, 16 Sep 2026 17:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1789580823;
	bh=kgnCnnBJNB5zTLBV7heTSGHSIlwA6tZYKqAEk5yb6I0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oZ7GaB3h75ah9f0fJoA7jG0FsFJ+psP4QHghuQRMdCySLBRe9asHG2dJzEYg3HxIw
	 2SJiBM+JSQod2TzmZFAvz4iQg6bSiFBz4qhw2rQyLfMk+7XLkpfmb8GWMuRw35+J2B
	 TsYleTd+2mfkxdGXYxO6FL+HDRYRC+I3g/hQMIBQ=
Date: Wed, 16 Sep 2026 18:44:06 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Edward Adam Davis <eadavis@sina.com>
Cc: dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, rafael@kernel.org,
	syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] sysfs: prevent writing excessively large files
Message-ID: <2026091641-tanned-bust-37f2@gregkh>
References: <2026091606-distant-paltry-a3f1@gregkh>
 <20260916101930.962961-1-eadavis@sina.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260916101930.962961-1-eadavis@sina.com>

On Wed, Sep 16, 2026 at 06:19:30PM +0800, Edward Adam Davis wrote:
> From: Edward Aadm Davis <eadavis@sina.com>
> 
> On Wed, 16 Sep 2026 09:17:56 +0200, Greg KH wrote:
> > > Since atomic_write_len is not configured for sysfs_file_kfops_rw, a large
> > > file write via sysfs_kf_write() may result in an out-of-bounds read when
> > > checking for the null terminator of a string element in the kobject_actions
> > > array within kobject_action_type(), potentially hitting:
> > 
> > What sysfs file are you hitting this on?
> Regular sysfs files.

Which one, all?

> > > BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
> > > BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> > > Read of size 1 at addr ffffffff8d72559f by task syz.0.17/5917
> > > Call Trace:
> > >  kobject_action_type lib/kobject_uevent.c:86 [inline]
> > >  kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> > >  bus_uevent_store+0x3d/0x90 drivers/base/bus.c:917
> > >  bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
> > >  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
> > >  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
> > >  new_sync_write fs/read_write.c:595 [inline]
> > >  vfs_write+0x6af/0x1050 fs/read_write.c:687
> > >
> > > Add atomic_write_len for sysfs_file_kfops_rw and sysfs_file_kfops_wo
> > > properly.
> > >
> > > Fixes: f6acf8bb6a40 ("sysfs, kernfs: introduce kernfs_ops")
> > 
> > What changed to suddenly cause this to show up now if this has been
> > present for decades?
> This issue has always existed. It remained undetected simply because the
> buffer lengths typically passed when writing to `/sys/bus/acpi/uevent`
> happened to be reasonably appropriate.

So what changed to cause this to show up now?

thanks,

greg k-h
