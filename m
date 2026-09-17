Received: from r3-19.sinamail.sina.com.cn (r3-19.sinamail.sina.com.cn [202.108.3.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7BD3C4B79
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 07:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.108.3.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789631787; cv=none; b=dBTDGWUAD6nkUW7tkgYFEtzDxePFbex+ufNCJTBAdahD5JI1VKsSZ5nbBFkgt7wX2zVeBrsKHagpHn/77J/gU714XLIgEklqru71azRLzVzSiizP0/r/2xhv5SaX/AuYLlN043JWxQ8hYKAW07AlFnDSGOFrJ/d48y8pjBxIuNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789631787; c=relaxed/simple;
	bh=x32Qc0P7qsWK8MrpsAMcFRVB4WZJoVWs5hu0Vgudiwc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U4HxWxDTMRkNmk8n22hrSgTjl8yiRjtV84SbguRPkF3m3ML4deSZ0BNiNzFzJIncRtdbPZNo0Wwgf4iNiBNLlofBRyqoo5KyGdnU8se4vLY6tA+kUXzApFMFgpkZ9nzVhQX1GC6dBRfib/lnTJUc037Mij5Wm/TWxCEp/79CI60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=n7rN5y/z; arc=none smtp.client-ip=202.108.3.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="n7rN5y/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789631782;
	bh=trvgEDEgxPoaEwmC+Huf355zv9XeQczIH01PQwemXGk=;
	h=From:Subject:Date:Message-ID;
	b=n7rN5y/ztf4Onu4m5ejrvsbTAhaZU+7iBXQYCa5h0LONQB/JV/xHUCqHTB6WHxzNQ
	 n9KzkvgFy85+Z1y1iYVXttwfr5FNVbK6cy64kq0AEpoPIx1puk3KtGHDRnpfuYUyhR
	 O8jWJrWprYVybIB6TNLs0fEpe49e7sAmUuIjLW+4=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AAB9D1F00006431; Thu, 17 Sep 2026 15:56:17 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 9644904456882
X-SMAIL-UIID: 3300EC19EF2148FAA5648D35E957C770-20260917-155617-1
From: Edward Adam Davis <eadavis@sina.com>
To: gregkh@linuxfoundation.org
Cc: dakr@kernel.org,
	driver-core@lists.linux.dev,
	eadavis@sina.com,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com,
	syzkaller-bugs@googlegroups.com
Subject: Re: [PATCH] sysfs: prevent writing excessively large files
Date: Thu, 17 Sep 2026 15:56:15 +0800
Message-ID: <20260917075615.999497-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026091700-baritone-clapping-685d@gregkh>
References: <2026091700-baritone-clapping-685d@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

On Thu, 17 Sep 2026 08:34:46 +0100, Greg KH wrote:
> > Since atomic_write_len is not configured for sysfs_file_kfops_rw, a large
> > file write via sysfs_kf_write() may result in an out-of-bounds read when
> > checking for the null terminator of a string element in the kobject_actions
> > array within kobject_action_type(), potentially hitting:
> >
> > BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
> > BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> > Read of size 1 at addr ffffffff8d72559f by task syz.0.17/5917
> > Call Trace:
> >  kobject_action_type lib/kobject_uevent.c:86 [inline]
> >  kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> >  bus_uevent_store+0x3d/0x90 drivers/base/bus.c:917
> >  bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
> >  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
> >  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
> >  new_sync_write fs/read_write.c:595 [inline]
> >  vfs_write+0x6af/0x1050 fs/read_write.c:687
> >
> > Add atomic_write_len for sysfs_file_kfops_rw and sysfs_file_kfops_wo
> > properly.
> >
> > Fixes: f6acf8bb6a40 ("sysfs, kernfs: introduce kernfs_ops")
> > Reported-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
> > Tested-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com
> > Signed-off-by: Edward Adam Davis <eadavis@sina.com>
> > ---
> >  fs/sysfs/file.c | 2 ++
> >  1 file changed, 2 insertions(+)
> >
> > diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> > index cd5bb0f9fee6..a63130d18680 100644
> > --- a/fs/sysfs/file.c
> > +++ b/fs/sysfs/file.c
> > @@ -228,10 +228,12 @@ static const struct kernfs_ops sysfs_file_kfops_ro = {
> >  };
> >
> >  static const struct kernfs_ops sysfs_file_kfops_wo = {
> > +	.atomic_write_len	= PAGE_SIZE,
> >  	.write		= sysfs_kf_write,
> >  };
> >
> >  static const struct kernfs_ops sysfs_file_kfops_rw = {
> > +	.atomic_write_len	= PAGE_SIZE,
> >  	.seq_show	= sysfs_kf_seq_show,
> >  	.write		= sysfs_kf_write,
> >  };
> > --
> > 2.43.0
> >
> 
> Are you sure this will not break those sysfs files that want larger page
> sizes?  Given the age of this "issue" it's really worrying to me to
> change it now...
Perhaps it would be better to make a decision after delving deeper into
the details.

cheers,
Edward
