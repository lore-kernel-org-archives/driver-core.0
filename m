Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3849731ED83;
	Sun, 23 Aug 2026 11:48:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485705; cv=none; b=MOyUxmDz6N/pEH+H+vFMxcdcj/nd5tFf98TKYK+8piAGFpTvcu58q01aXbrX6AG6JN1bsfr+slqfKW3cF8UI4lb0rvky4S9DGkSB8ArFd4Qn8fsFo/tu8hOwsYudxU2uIvJl5vxcULw5wfO+6ar37o218Ix7Fyk+sNo2AE7RV78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485705; c=relaxed/simple;
	bh=6ct0qj1+D4Oyz2D9fNsOOPpl6RnmhIlFP9uj18Ozjn0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sWED7lxNwcehkryLDkyDkmq+Jb1DaQhwHaa7xSFXd1O5WMZLFO9q57ONJGdNTTX4MEJEiIC5Jtn17/5RnA3UQtG5WWQ3lXi+824UZ/RFRdyxmToKOidseIui9v0UBwcDQyfWmg36W7EmNAw3M+rXwCg2pF/vkLixREgSSYHJLew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ixo23Nz0; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ixo23Nz0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A381F000E9;
	Sun, 23 Aug 2026 11:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787485703;
	bh=Kf12DRObSBFv1CspFHy/sUm74JFT+Ouecqhr1g5Di1A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ixo23Nz0MgQcbOgT61iv2HiwXOLYuTP07jWZGVcy3jIT7D3pkXrvGGrf8Kh6gd2PN
	 992RK0sW1U0O6R/qK4bAkwh6a7HxwpEgrl6Ijyt52hS8cZALd26WccydoexkeCR7l1
	 Y2kgo/cuCzc2Fz2M/F+W8ganFDl7rkSCRUvWdhgA=
Date: Sun, 23 Aug 2026 13:46:43 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>
Cc: dakr@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
Message-ID: <2026082307-negligent-lusty-750a@gregkh>
References: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>

On Sun, Aug 23, 2026 at 04:40:33AM -0700, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    e8bf40d15402 Merge tag 'chrome-platform-firmware-v7.3' of ..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=13e9f679580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=1941312e3e971b07
> dashboard link: https://syzkaller.appspot.com/bug?extid=fd7be5ad9795b7f29df3
> compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a75679580000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/7df7b958efe0/disk-e8bf40d1.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/cefbf90e524a/vmlinux-e8bf40d1.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/37a530b91001/bzImage-e8bf40d1.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com
> 
> INFO: task syz.4.23:6285 blocked for more than 143 seconds.
>       Not tainted syzkaller #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:syz.4.23        state:D stack:27592 pid:6285  tgid:6285  ppid:6213   task_flags:0x400140 flags:0x00080002
> Call Trace:
>  <TASK>
>  context_switch kernel/sched/core.c:5510 [inline]
>  __schedule+0x17d4/0x5630 kernel/sched/core.c:7239
>  __schedule_loop kernel/sched/core.c:7316 [inline]
>  schedule+0x164/0x2b0 kernel/sched/core.c:7331
>  schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7388
>  __mutex_lock_common kernel/locking/mutex.c:726 [inline]
>  __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
>  device_lock include/linux/device.h:1104 [inline]
>  __device_driver_lock drivers/base/dd.c:1170 [inline]
>  device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
>  unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244

Ok, I'm going to add a new TAINT flag for when unbind is written to as
that is obviously not a normal operation and is only for debugging
things by kernel developers.  Adding loads of work-arounds in the kernel
for this not-real-workload-path is just not required.

If syzbot could stop hitting this path, that would be great, as it's a
root-only thing for debugging and not something "real".

thanks,

greg k-h
