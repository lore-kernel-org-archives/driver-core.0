Received: from smtp153-163.sina.com.cn (smtp153-163.sina.com.cn [61.135.153.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 536A2302155
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 04:24:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=61.135.153.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789619059; cv=none; b=pJnfdqaOLTV3O3DYBPDJjxaCMuxTM5Z81+/b+XvabNPq7IUNpO4BcB28UH+8bQPj6EDT25tCo9SWodVZD9w/3ER/kq9MD0tkuLjUN/gKc99CljlVpe3dvWehEcBU1wv6KvYEew+YUz3rDsmr71umitaKIXAdnaRtlRD+9aevVxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789619059; c=relaxed/simple;
	bh=NCd1M4BYCsVVcnfJn7CPMrWRew8MFVBraGEWWKIOQSU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BJBAXzLBl4mw/QS7JgdS86Y87RdS2+VSDcsdRFg9rhghQZPHri4gi+s5ultVupZ6byC6of6sraz9Sh4GpGOiQmsg64fwYuL07+UmNQqCqaoxNjrzqqODSJOeWIvigfgB48EjR/kc9P5IbuwUbis1RRKVuHUkrtLJurtno34UiNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com; spf=pass smtp.mailfrom=sina.com; dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b=ThhMmKXk; arc=none smtp.client-ip=61.135.153.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sina.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sina.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sina.com header.i=@sina.com header.b="ThhMmKXk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sina.com; s=201208; t=1789619053;
	bh=XIDlTScOG9QnL6L081k6czMCkrQnIa7NpQIs6PMtKVY=;
	h=From:Subject:Date:Message-ID;
	b=ThhMmKXkW21fxDmwATCGnoiq9qjNZhyYH/dca9gEN1wys2ihq57zszPdaU6v5iYKi
	 1dShuuo/gtR33kl9yC+nLS8oi5i4SRJO57caiGIhQX/ux2yKXDsvzm2sDlhsiO19nc
	 3v1f58EMz4W6tYz1qDlSI9VrqDqYLZ+F6GBHyKlE=
X-SMAIL-HELO: lxu-ped-host..
Received: from unknown (HELO lxu-ped-host..)([111.198.231.89])
	by sina.com (10.54.253.32) with ESMTP
	id 6AAB6B6000003938; Thu, 17 Sep 2026 12:24:02 +0800 (CST)
X-Sender: eadavis@sina.com
X-Auth-ID: eadavis@sina.com
Authentication-Results: sina.com;
	 spf=none smtp.mailfrom=eadavis@sina.com;
	 dkim=none header.i=none;
	 dmarc=none action=none header.from=eadavis@sina.com
X-SMAIL-MID: 9779204456617
X-SMAIL-UIID: BC0889522A6D4250A62018007C6511F2-20260917-122402-1
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
Date: Thu, 17 Sep 2026 12:24:00 +0800
Message-ID: <20260917042400.985424-1-eadavis@sina.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026091641-tanned-bust-37f2@gregkh>
References: <2026091641-tanned-bust-37f2@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Edward Aadm Davis <eadavis@sina.com>

On Wed, 16 Sep 2026 18:44:06 +0100, Greg KH wrote:
> On Wed, Sep 16, 2026 at 06:19:30PM +0800, Edward Adam Davis wrote:
> > From: Edward Aadm Davis <eadavis@sina.com>
> >
> > On Wed, 16 Sep 2026 09:17:56 +0200, Greg KH wrote:
> > > > Since atomic_write_len is not configured for sysfs_file_kfops_rw, a large
> > > > file write via sysfs_kf_write() may result in an out-of-bounds read when
> > > > checking for the null terminator of a string element in the kobject_actions
> > > > array within kobject_action_type(), potentially hitting:
> > >
> > > What sysfs file are you hitting this on?
> > Regular sysfs files.
> 
> Which one, all?
/sys/bus/acpi/uevent
> 
> > > > BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
> > > > BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> > > > Read of size 1 at addr ffffffff8d72559f by task syz.0.17/5917
> > > > Call Trace:
> > > >  kobject_action_type lib/kobject_uevent.c:86 [inline]
> > > >  kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
> > > >  bus_uevent_store+0x3d/0x90 drivers/base/bus.c:917
> > > >  bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
> > > >  sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
> > > >  kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
> > > >  new_sync_write fs/read_write.c:595 [inline]
> > > >  vfs_write+0x6af/0x1050 fs/read_write.c:687
> > > >
> > > > Add atomic_write_len for sysfs_file_kfops_rw and sysfs_file_kfops_wo
> > > > properly.
> > > >
> > > > Fixes: f6acf8bb6a40 ("sysfs, kernfs: introduce kernfs_ops")
> > >
> > > What changed to suddenly cause this to show up now if this has been
> > > present for decades?
> > This issue has always existed. It remained undetected simply because the
> > buffer lengths typically passed when writing to `/sys/bus/acpi/uevent`
> > happened to be reasonably appropriate.
> 
> So what changed to cause this to show up now?
Starting from f6acf8bb6a40.

cheers,
Edward
