Received: from mail-oa2-f11.google.com (mail-oa2-f11.google.com [74.125.231.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F5893594A
	for <driver-core@lists.linux.dev>; Sun, 23 Aug 2026 11:40:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.75
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787485236; cv=none; b=p5L0bWGC6tTPf/NSBT9uATJftGpRJMpcvGIS+p3vm6hY7Bs/WdamWL3mLjnIpuV19yq6SDYuef4OskNLxf+FJVOz+LultfZPrndH09rQxoTbaMnDz8PCPXcC+Y0bLt3LWij/jFgSYokbOO6venfp3tntYKeGV4r3FrIiNAlVdZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787485236; c=relaxed/simple;
	bh=/AmkXrv1iEy0v256EwkurjkDbbv0C9ofTI2xq9bFyzE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=S9p6FO2/583m1atdx6tQOW8zu/21AN1wzMAHmMnOvMt9JxPnDIWTj+LnTnUK5MSHQHMP2wmvJ49LNdNf3+PZ74CUQQ5X16lHlYhIwS4V0XAPQvhylhXTrn/EeecaEUe/3/NZ0mwfGhyXhfriacht48norZ6hXgQVtkvnVTOw+vQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f11.google.com with SMTP id 586e51a60fabf-45958a0c7c4so772122fac.0
        for <driver-core@lists.linux.dev>; Sun, 23 Aug 2026 04:40:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787485233; x=1788090033;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25RzgBS/jWXCDD0bUHgQmMK2zAvOCS1/dAVbaisp5tg=;
        b=ezUCIrUfzd2Qvhoax6MDYyWhONqkmqM1EMwyrJsyowOedACm2VWoyQEdgzt2YayKKQ
         NUEllT6wdhXXv/h3flr1yTD8PQmxDyCtGBn4jlAY3zJj+oBTfGmFMCsBl4pqY07+ZjfW
         ie23WildWUcxmx3uCiKJcTy3M/mxWwJMzqxi+p15Jn4YJji5C09N5yLVtQm5goPUAt/j
         7uLMONvQLqpbe1MoFphDSex02yZwJaExu3JzVm6UM0QljVvsAa5V1Oeshr7pFkb2eQst
         vXKu2NNgx3lmAqeNplcV9xPpBgIAY3qgfvAyLgHUTSGoTRGzqFJZPHiTC0t/umbYsjRI
         4qSg==
X-Forwarded-Encrypted: i=1; AHgh+RqjaCsR5ac/h1SKNpowQ/rSlO0aVhQjI8pKLYGbUaMj+SDUo3sbq2nCV/W0Te0egfKXbsXvrFGB+e8KhA==@lists.linux.dev
X-Gm-Message-State: AFuF++nDq7FRUb6GMeEs1L144jEQabujprFxpcSEOkG/aZEpR+CmViHW
	k37S8E+hQMr3MSztqJhXrHLvW/HPWByDI4bY6tJWJTBU3yYS2vrksEguu9cDaZ16IMAByQCsDtJ
	d8g4pptZfkt4Fq7AhiibREyYn+d1madmLlqXmeQxi1ZaLXLOqMdmV7ltQlbc=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3199:b0:486:45c7:34c5 with SMTP id
 5614622812f47-4b309b7c667mr12874324b6e.17.1787485233138; Sun, 23 Aug 2026
 04:40:33 -0700 (PDT)
Date: Sun, 23 Aug 2026 04:40:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
Subject: [syzbot] [usb?] INFO: task hung in unbind_store
From: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e8bf40d15402 Merge tag 'chrome-platform-firmware-v7.3' of ..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13e9f679580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1941312e3e971b07
dashboard link: https://syzkaller.appspot.com/bug?extid=fd7be5ad9795b7f29df3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14a75679580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7df7b958efe0/disk-e8bf40d1.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cefbf90e524a/vmlinux-e8bf40d1.xz
kernel image: https://storage.googleapis.com/syzbot-assets/37a530b91001/bzImage-e8bf40d1.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com

INFO: task syz.4.23:6285 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.4.23        state:D stack:27592 pid:6285  tgid:6285  ppid:6213   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5510 [inline]
 __schedule+0x17d4/0x5630 kernel/sched/core.c:7239
 __schedule_loop kernel/sched/core.c:7316 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7331
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7388
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0x7c1/0x1550 kernel/locking/mutex.c:821
 device_lock include/linux/device.h:1104 [inline]
 __device_driver_lock drivers/base/dd.c:1170 [inline]
 device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
 unbind_store+0x1a1/0x1d0 drivers/base/bus.c:244
 kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x612/0xba0 fs/read_write.c:687
 ksys_write+0x150/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f223459e0d9
RSP: 002b:00007f223494fae8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f2234825fa0 RCX: 00007f223459e0d9
RDX: 0000000000000008 RSI: 0000200000000040 RDI: 0000000000000007
RBP: 00007f2234635024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f2234825fac R14: 00007f2234825fa0 R15: 00007f2234825fa0
 </TASK>

Showing all locks held in the system:
locks held by kworker/0:1/10: 5, on CPU#0:
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #1: ffffc900000f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #2: ffff88802a2a91d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a2a91d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5907
 #3: ffff888032a2f1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff888032a2f1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff888031c611a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888031c611a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by kworker/u8:1/13: 3, last CPU#0:
 #0: ffff8880b863b2e0 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2d/0x160 kernel/sched/core.c:667
 #1: ffff8880b8624408 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x57/0x7d0 kernel/sched/psi.c:933
 #2: ffff8880b863b2e0 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2d/0x160 kernel/sched/core.c:667
locks held by kworker/1:0/24: 5, on CPU#1:
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #1: ffffc900001e7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #1: ffffc900001e7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #2: ffff88802a0f31d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a0f31d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5907
 #3: ffff88807cdfe1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88807cdfe1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff8880747f51a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff8880747f51a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by khungtaskd/30: 1, last CPU#0:
 #0: ffffffff8eb5a0e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #0: ffffffff8eb5a0e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #0: ffffffff8eb5a0e0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6793
locks held by kworker/1:1/42: 5, on CPU#1:
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #1: ffffc90000b27c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #1: ffffc90000b27c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #2: ffff88802a1ea1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a1ea1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5907
 #3: ffff888079a691d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff888079a691d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff8880588321a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff8880588321a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by kworker/1:2/984: 5, on CPU#1:
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #1: ffffc90004f7fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #1: ffffc90004f7fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #2: ffff88802a7511d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a7511d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5907
 #3: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff888078e851a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888078e851a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by klogd/4966: 1, last CPU#1:
 #0: ffffffff8eb5a0e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #0: ffffffff8eb5a0e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #0: ffffffff8eb5a0e0 (rcu_read_lock){....}-{1:3}, at: sock_def_readable+0xae/0x550 net/core/sock.c:3655
locks held by kworker/1:3/5343: 5, on CPU#1:
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #1: ffffc9000365fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #1: ffffc9000365fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #2: ffff88802a5d91d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802a5d91d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5907
 #3: ffff888077c9a1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff888077c9a1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff8880331671a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff8880331671a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by getty/5363: 2, on CPU#1:
 #0: ffff888035e1e0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900032332e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x45a/0x1360 drivers/tty/n_tty.c:2211
locks held by strace-static-x/5648: 1, last CPU#1:
 #0: ffff8880b873b2e0 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2d/0x160 kernel/sched/core.c:667
locks held by kworker/0:3/5913: 5, on CPU#0:
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #1: ffffc9000336fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #1: ffffc9000336fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #2: ffff888029fac1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029fac1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5907
 #3: ffff8880782161d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff8880782161d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff888057c161a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888057c161a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by kworker/0:4/5986: 5, on CPU#0:
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #0: ffff8880236e6140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #1: ffffc900033efc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #1: ffffc900033efc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #2: ffff88823bfe81d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88823bfe81d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5907
 #3: ffff888057e6f1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff888057e6f1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff888059ed71a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888059ed71a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by syz.4.23/6285: 3, on CPU#0:
 #0: ffff88803140e460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2739 [inline]
 #0: ffff88803140e460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88807ebd1080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.5.24/6364: 3, on CPU#1:
 #0: ffff8880299dc460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2739 [inline]
 #0: ffff8880299dc460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88802bafe480 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.6.25/6390: 3, on CPU#1:
 #0: ffff888032fc6460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2739 [inline]
 #0: ffff888032fc6460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff8880793ec080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.7.26/6411: 3, on CPU#1:
 #0: ffff888025cfc460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2739 [inline]
 #0: ffff888025cfc460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88807b1c9c80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.8.27/6431: 3, on CPU#1:
 #0: ffff888022f8e460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2739 [inline]
 #0: ffff888022f8e460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88807350a480 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.9.28/6457: 3, on CPU#0:
 #0: ffff888057c9a460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2739 [inline]
 #0: ffff888057c9a460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888034d4b880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by kworker/1:7/6460: 3, on CPU#1:
 #0: ffff88801b027140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3297 [inline]
 #0: ffff88801b027140 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0xa1a/0x14c0 kernel/workqueue.c:3405
 #1: ffff8880b8724408 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x57/0x7d0 kernel/sched/psi.c:933
 #2: ffff88807c3dc250 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_work+0x1fd/0x3b0 drivers/net/netdevsim/fib.c:1490
locks held by syz.0.29/6629: 3, on CPU#1:
 #0: ffff888034df8460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2739 [inline]
 #0: ffff888034df8460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888071d22880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff88802c3551d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by dhcpcd-run-hook/6793: 1, last CPU#0:
 #0: ffff8880b863b2e0 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2d/0x160 kernel/sched/core.c:667

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 30 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x274/0x2d0 lib/nmi_backtrace.c:122
 nmi_trigger_cpumask_backtrace+0x17d/0x390 lib/nmi_backtrace.c:65
 trigger_all_cpu_backtrace include/linux/nmi.h:162 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x135/0x170 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:353 [inline]
 watchdog+0xfd7/0x1030 kernel/hung_task.c:561
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 6797 Comm: sed Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:__kernel_text_address+0xd/0x30 kernel/extable.c:79
Code: e8 98 6b a4 00 eb b3 66 0f 1f 44 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 40 d6 53 48 89 fb e8 33 00 00 00 <48> 81 fb 00 b0 c9 91 0f 93 c1 48 81 fb 50 f9 e1 91 0f 92 c2 20 ca
RSP: 0018:ffffc9000414f2f8 EFLAGS: 00000202
RAX: 0000000000000001 RBX: ffffffff8bd42216 RCX: 0000000000000001
RDX: 0000000000000001 RSI: ffffffff8e4b5735 RDI: ffffffff8bd42216
RBP: ffffc9000414f3b0 R08: ffffc9000414fef0 R09: 0000000000000000
R10: ffffc9000414f378 R11: fffff52000829e71 R12: ffff888033f68000
R13: 0000000000000000 R14: dffffc0000000000 R15: 1ffff92000829e6e
FS:  0000000000000000(0000) GS:ffff888124f3f000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f7cd65c2eb8 CR3: 000000002e7c2000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 unwind_get_return_address+0x4d/0x90 arch/x86/kernel/unwind_orc.c:385
 arch_stack_walk+0xfb/0x150 arch/x86/kernel/stacktrace.c:26
 stack_trace_save+0xa9/0x100 kernel/stacktrace.c:122
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x640 mm/slub.c:6692
 tomoyo_realpath_from_path+0x605/0x640 security/tomoyo/realpath.c:286
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x229/0x470 security/tomoyo/file.c:776
 security_file_open+0xa9/0x240 security/security.c:2739
 do_dentry_open+0x4a0/0x1380 fs/open.c:973
 vfs_open+0x3b/0x340 fs/open.c:1101
 do_open fs/namei.c:4837 [inline]
 path_openat+0x1443/0x1d60 fs/namei.c:5000
 do_file_open+0x23e/0x4a0 fs/namei.c:5029
 do_sys_openat2+0x115/0x200 fs/open.c:1417
 do_sys_open fs/open.c:1423 [inline]
 __do_sys_openat fs/open.c:1439 [inline]
 __se_sys_openat fs/open.c:1434 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1434
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7cd68ad0ba
Code: 41 89 f2 48 89 54 24 e0 41 83 e2 40 75 2a 89 f0 f7 d0 a9 00 00 41 00 74 1f 89 f2 b8 01 01 00 00 48 89 fe bf 9c ff ff ff 0f 05 <48> 3d 00 f0 ff ff 77 2e c3 0f 1f 44 00 00 48 8d 44 24 08 c7 44 24
RSP: 002b:00007ffe4b1a1dc8 EFLAGS: 00000206 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007ffe4b1a1e40 RCX: 00007f7cd68ad0ba
RDX: 0000000000080000 RSI: 00007ffe4b1a1e40 RDI: 00000000ffffff9c
RBP: 00007ffe4b1a1e30 R08: 00007ffe4b1a2037 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 000000000000001b
R13: 00007f7cd6881050 R14: 00007ffe4b1a2050 R15: 0000000000000000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
