Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCE5C369D4F
	for <driver-core@lists.linux.dev>; Sun, 23 Aug 2026 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787496009; cv=none; b=l6Q/aX/W74p8YGEkbQhkKfjh38RuJUCbS0HtiMMJSyxqAFmA19m6App0KdddJUYWE81K73DjHgMh+990PMq1UZ5ZZXwr9en3DyERxr81lbqrZO2z5rl3xG4FSwCcBWLA9u1hVvKobrCSyV3fteL4VyvUfi8aAkalPFd0NaLkwQ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787496009; c=relaxed/simple;
	bh=mdUGm8U13JxZwr3ZnxRwt3yi6FvYTBdNA5OUPUKmQyU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IF8vbIj4Nq+RurVMekagqNmiv0BMEiuyMibNNzB2CYon73Ugl0CEp5NdoI+msqMRJQxxXa2S0epoxGGtPZ1l9W/Y77S1a2vPUzTnptHORc/Vsnz7c09DMP+4r56CtlioBXGRE1LHUW2JNuyHl7xpPD+m+IdYhBxxeDCFGMp6o0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=EFux0XWA; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="EFux0XWA"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-908934450cdso21486936d6.1
        for <driver-core@lists.linux.dev>; Sun, 23 Aug 2026 07:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1787496007; x=1788100807; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kP+6mVlmxhfGWx9Sj9mX/wiFGcmQa2FtLQoZIAd5BpA=;
        b=EFux0XWAjndFZrxY1U3I9Wxt0xPuFABaBWIiVaG0u9ApHTW835D8MHRTecLu4mJycg
         W4+8cfkPnwlz/E5SVUo2+lz/7IdTKGKGNXokY0dVEmpuowFyAjn1YbbjMBX1tQjAq7Hj
         zPxN9KXqMp3pNpwfYiWkEeCOnPexnBoXpPlSZ/BWu1vF7CT+cxzCcpUw6Bep2OrHiNOR
         wZx26fnvcUDSEXCtBROB3UOhKTOve2iKZflx279eRbXvoXgHvULMXIUuYvwfC3WQk/Ll
         voKyqAZK0pCNKEQuUWIKLi/CxQnMZEofacILWERQVKlUk2WCgaz6Plh6NbCbBDV2KVH2
         n6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787496007; x=1788100807;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kP+6mVlmxhfGWx9Sj9mX/wiFGcmQa2FtLQoZIAd5BpA=;
        b=Ws/4lh3vY2RmuyQgPrWYGvw5dkqFhMgxrsTkYvo802W43VS3uvt3Ppu+D44hjmFw89
         bYiZK7VD8v4Hyo8aj+mhIk7Lr566ouWMO6bxY8lkzw8Ep3eTSEoiE1hNFteHFSC2iYdt
         YVXCHnH05HRR8Mfsw46VluoZ03rlqktki95g/T8sNJHiOd2DQcQmoTxotkuXgpzkRKny
         q6cUMHKO6AZDKodMfTRlxgUP6+EzKd90a/ze0Ae8TtqbglEkqtva0jiqNZSOw2SI2PUP
         xIeQIK79zzGSexN8AET2d65KtDaHHj3L+TqkiCYKmAfDX3st3K663w6Etklt24TVqJdx
         sK2w==
X-Forwarded-Encrypted: i=1; AHgh+RqQTa78In7Mzhp/9xe+miZYlnqTU5ol7gGZOsy8/QxfMIKNTgGVROkfSx76oS7m/hZPzXsskKcQ9MXY2w==@lists.linux.dev
X-Gm-Message-State: AFuF++kJceoYXOtfIHj6CG159KnV8MaLnOJGl875CCqif1xuEVwin80b
	qoYQvNV0G9RckpB/swQXaM5u7820Sig/V5lzBZSZ43EJT0tvPcF/qQ7gFggeQlO1gg==
X-Gm-Gg: AR+sD12qGdaNqhIBCMWGisEBeNtKCu51tlGoKd96jeJzxVZ+OpZxKv/dHrexj7olXJi
	FLs5Y/HITEVFS2lCKfC+CEmia1xgPH20AQD7mqw67YBawtz1TYVfbtSP2V0SPW1lkfbOX5hSCZq
	St904T7cCRBNcZCbgk8AS8zEibLYS3nBDv29Zfc1pglcM7LspFJaIMecAoERy43HXUXl/q1+dT1
	pxt7DaoNdO6Tqf1jajIBJC40Z7EvVamsWtWGIa6y7sOqxnBflL0LiYu3nSEcw1AHsWkS4F+sLyP
	Wxu7rIqEuZ2Z0vUeX0cl8zdXRyFGAQJTLy8T+B+r+fgseWB2UoXVTST0kqdpl6FQZeOAhYp8EWs
	1ACWaU+mezoiNw98GBgnE/PBPItQkggwvNSEmSbRoBSVn2OQyCt8qHVrFfewS4QY/yYwlid6PxE
	45QeyIn+vam/wcU8XhWyX/Q/c2+f38aSkv62UdnA0D+lnUERKdTv0ruwzbr/cr6CoU+aHZcL4g
X-Received: by 2002:ad4:5d67:0:b0:8f7:43f4:fe8d with SMTP id 6a1803df08f44-90c8fa5ed5emr118052316d6.29.1787496006573;
        Sun, 23 Aug 2026 07:40:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::dfd8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c93a4f093sm39231026d6.37.2026.08.23.07.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Aug 2026 07:40:05 -0700 (PDT)
Date: Sun, 23 Aug 2026 10:40:03 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>,
	dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <2ce6496d-6166-4470-b424-2b187908f2ba@rowland.harvard.edu>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
 <2026082307-negligent-lusty-750a@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026082307-negligent-lusty-750a@gregkh>

On Sun, Aug 23, 2026 at 01:46:43PM +0200, Greg KH wrote:
> On Sun, Aug 23, 2026 at 04:40:33AM -0700, syzbot wrote:
> > Hello,
> > 
> > syzbot found the following issue on:
> > 
> > HEAD commit:    e8bf40d15402 Merge tag 'chrome-platform-firmware-v7.3' of ..
> > git tree:       upstream
> > console+strace: https://syzkaller.appspot.com/x/log.txt?x=13e9f679580000
> > kernel config:  https://syzkaller.appspot.com/x/.config?x=1941312e3e971b07
> > dashboard link: https://syzkaller.appspot.com/bug?extid=fd7be5ad9795b7f29df3
> > compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> > syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a75679580000
> > 
> > Downloadable assets:
> > disk image: https://storage.googleapis.com/syzbot-assets/7df7b958efe0/disk-e8bf40d1.raw.xz
> > vmlinux: https://storage.googleapis.com/syzbot-assets/cefbf90e524a/vmlinux-e8bf40d1.xz
> > kernel image: https://storage.googleapis.com/syzbot-assets/37a530b91001/bzImage-e8bf40d1.xz
> > 
> > IMPORTANT: if you fix the issue, please add the following tag to the commit:
> > Reported-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com
> > 
> > INFO: task syz.4.23:6285 blocked for more than 143 seconds.
> >       Not tainted syzkaller #0
> > "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> > task:syz.4.23        state:D stack:27592 pid:6285  tgid:6285  ppid:6213   task_flags:0x400140 flags:0x00080002
> > Call Trace:
> >  <TASK>
> >  context_switch kernel/sched/core.c:5510 [inline]
> >  __schedule+0x17d4/0x5630 kernel/sched/core.c:7239
> >  __schedule_loop kernel/sched/core.c:7316 [inline]
> >  schedule+0x164/0x2b0 kernel/sched/core.c:7331
> >  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7388
> >  __mutex_lock_common kernel/locking/mutex.c:726 [inline]
> >  __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
> >  device_lock include/linux/device.h:1104 [inline]
> >  __device_driver_lock drivers/base/dd.c:1170 [inline]
> >  device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
> >  unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244
> 
> Ok, I'm going to add a new TAINT flag for when unbind is written to as
> that is obviously not a normal operation and is only for debugging
> things by kernel developers.  Adding loads of work-arounds in the kernel
> for this not-real-workload-path is just not required.
> 
> If syzbot could stop hitting this path, that would be great, as it's a
> root-only thing for debugging and not something "real".

Actually, I could imagine people wanting to use unbind for a real 
purpose -- you could consider it to be a more specific form of modprobe 
blacklisting.

The bind attribute is the one which really should taint the kernel, 
because it bypasses the normal matching checks.  Also, all the numerous 
syzbot bug reports coming out lately have involved weird bind 
operations, not unbind.  Unbind should pretty much always work.

Alan Stern
