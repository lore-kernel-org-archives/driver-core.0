Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A1762F5A0E;
	Sun, 23 Aug 2026 17:29:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787506192; cv=none; b=nB5KUyheQanneQwnQUZEUBEfu8X/b4JeUzJ/1psC3ZNZFtEC6x3r8pSjXsQbmePKhotBkqdDHcoVU1Q5qGelvVCctxyd6Yuu3PjlgLJ/8BBBh8XpSohvpwM0QsBOoidgbR+HVd1JvAXGMAgKvUrCu9ab/Sy7Hqu9DfMLP9isS7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787506192; c=relaxed/simple;
	bh=jmM5SXJ1QM0unKtzepjLGi1QGthhDRbAYwRI3IPLqc8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BQCoikiLGLAYPNNEP5V7w2R9EC9DavJnVaqe7r4btbOO2W1dbFlOd58AAJKQ/Esr51Hg0cFxATJZg/nw+8YnAHMlC9heJLRxEyJj4OS2Byr5J/1ivEB+Euh/1taGikvZRYb2hFujIN45lnU0WGy1BGb0P42uLJy1kNgO04r8nec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kvh+riaE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kvh+riaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787561F000E9;
	Sun, 23 Aug 2026 17:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787506190;
	bh=s/X4uoXU1lSsTreDd4JtMNx12If+u9/RDGV3FNS1Sf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kvh+riaE8ySP8Sxq6Bnm0tgug2Dnral/1xux4lVSi8SpNWlha1TTyIWZ4d8gfjB2+
	 PFlPQECbSReptY31ls86nTuvE8507LN3tjCUyrYeqiQI0WYgXqZj0dFbyXl5U2bgVW
	 6FSknV/FAM1rKNKxGrVqHlCH9JdP6fjhP4Nv49K0=
Date: Sun, 23 Aug 2026 19:28:10 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>,
	dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <2026082333-persuader-overturn-8205@gregkh>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
 <2026082307-negligent-lusty-750a@gregkh>
 <2ce6496d-6166-4470-b424-2b187908f2ba@rowland.harvard.edu>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ce6496d-6166-4470-b424-2b187908f2ba@rowland.harvard.edu>

On Sun, Aug 23, 2026 at 10:40:03AM -0400, Alan Stern wrote:
> On Sun, Aug 23, 2026 at 01:46:43PM +0200, Greg KH wrote:
> > On Sun, Aug 23, 2026 at 04:40:33AM -0700, syzbot wrote:
> > > Hello,
> > > 
> > > syzbot found the following issue on:
> > > 
> > > HEAD commit:    e8bf40d15402 Merge tag 'chrome-platform-firmware-v7.3' of ..
> > > git tree:       upstream
> > > console+strace: https://syzkaller.appspot.com/x/log.txt?x=13e9f679580000
> > > kernel config:  https://syzkaller.appspot.com/x/.config?x=1941312e3e971b07
> > > dashboard link: https://syzkaller.appspot.com/bug?extid=fd7be5ad9795b7f29df3
> > > compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a75679580000
> > > 
> > > Downloadable assets:
> > > disk image: https://storage.googleapis.com/syzbot-assets/7df7b958efe0/disk-e8bf40d1.raw.xz
> > > vmlinux: https://storage.googleapis.com/syzbot-assets/cefbf90e524a/vmlinux-e8bf40d1.xz
> > > kernel image: https://storage.googleapis.com/syzbot-assets/37a530b91001/bzImage-e8bf40d1.xz
> > > 
> > > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > > Reported-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com
> > > 
> > > INFO: task syz.4.23:6285 blocked for more than 143 seconds.
> > >       Not tainted syzkaller #0
> > > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > > task:syz.4.23        state:D stack:27592 pid:6285  tgid:6285  ppid:6213   task_flags:0x400140 flags:0x00080002
> > > Call Trace:
> > >  <TASK>
> > >  context_switch kernel/sched/core.c:5510 [inline]
> > >  __schedule+0x17d4/0x5630 kernel/sched/core.c:7239
> > >  __schedule_loop kernel/sched/core.c:7316 [inline]
> > >  schedule+0x164/0x2b0 kernel/sched/core.c:7331
> > >  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7388
> > >  __mutex_lock_common kernel/locking/mutex.c:726 [inline]
> > >  __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
> > >  device_lock include/linux/device.h:1104 [inline]
> > >  __device_driver_lock drivers/base/dd.c:1170 [inline]
> > >  device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
> > >  unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244
> > 
> > Ok, I'm going to add a new TAINT flag for when unbind is written to as
> > that is obviously not a normal operation and is only for debugging
> > things by kernel developers.  Adding loads of work-arounds in the kernel
> > for this not-real-workload-path is just not required.
> > 
> > If syzbot could stop hitting this path, that would be great, as it's a
> > root-only thing for debugging and not something "real".
> 
> Actually, I could imagine people wanting to use unbind for a real 
> purpose -- you could consider it to be a more specific form of modprobe 
> blacklisting.

If you want to do that, just don't load the module :)

> The bind attribute is the one which really should taint the kernel, 
> because it bypasses the normal matching checks.  Also, all the numerous 
> syzbot bug reports coming out lately have involved weird bind 
> operations, not unbind.  Unbind should pretty much always work.

"always work" is tough due to the races that can, and will, happen for
many non-hotplugged bus devices, as syzbot is finding now.  We shouldn't
require this, as again, it's a debugging thing.

bind is used by the virtio people for some reason, but yes, I will be
glad to taint at that point as well.  I'll look into doing that after
-rc1 is out.

thanks,

greg k-h
