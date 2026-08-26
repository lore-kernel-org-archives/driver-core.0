Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1653296BD2
	for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 14:51:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787755900; cv=none; b=Hq0s2yIQCD6I7j60LjBK5p8eG5r4frHNuh3W+H07ElDlXgRo2vM/HBSG9AY8jtHWv/vm86vQ/niAxAlLkiaAjRxuOxWaTFLuckEvaX/kuupjeJlu/n/qaN733wohAJX6UbzAvozBPkCSySJF6KTaAqfV4JaLAo6qNGg0FkQ8bl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787755900; c=relaxed/simple;
	bh=Ec1hgLaytU4sTvvSpQT1+8yYZutkFX26yGgf+RPbKNI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=GKZ9r+uyc8ryYWIMKqO8ZbOztPjCsvRs5hOA0pCBTlX6YdxFPQyEbEjl94U4d+ejMCo99R0dtqfd3ALkIeo+amw2s0OPCS3t+47iP3sHAw6xw/rLWVulPQrbH750ZV7LtmSP6iHPFkr8xCna8TreXkiAiGcJk1V6hQ+AjEEhjlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-451c1431f18so552727fac.1
        for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 07:51:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787755895; x=1788360695;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JR8oQHkXHYU9FmGFfPrSXCo6KktNalWj+A68bV5cXc4=;
        b=ktjBJM+sb9vJL5ugr9Vqh4qeGiva3bOLfRD2g/hcUGChVdZSKJPdEay9sOoo/V8QyO
         OuWfbop16LuEevbMx3Nn5+st7IwJQ5/E0QZGr/JIDFNS3/ioiUYMZD4Tu0q6PRWOW4+0
         lEeKCy3O6r3Kahn8Sca6ANbI5pj6Y+9mWhGylWZXxY0pkhG9V9amEwTCWDM3tcgE+l/V
         Uax8nils1SwalSvmNqXqDs5gvf5Ig1tVdnVyKl3xjIbKlzumGzan6SdW/rZrJXjUoHHC
         Pk1z0mekXIUAwLmTCpX5sK+9CWIoFiyeQkyfLMXXmbtMfEN1wBf+/0Y7qWH19PM/FFo9
         hxKw==
X-Forwarded-Encrypted: i=1; AHgh+RopSwQ/2nR33TRUqoPI6ffZvKnKX95YYTXhyeMOz8jiO3lAflGA1M3lFAbORFTrlSdaws9IinfduqO0Ng==@lists.linux.dev
X-Gm-Message-State: AFuF++lvtOAYXBlCaV/WcKLKY7z4flJCkTz+glSY1hErM6a2Hglnwl15
	hxIK4oy4n+hxFYdze1i2t+PQNOgTy4Nme0h0Z2RCbjL5FLnphxYQtdMu0rpyBsY/G7+ST+lHNsU
	Re8pLfK5cBTJ0YwrtQCG4bRUUSwePdH3VJf9W/UcGKyJ6p4S3S2JuVXk1PbQ=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1186:b0:4a0:d9a1:1a95 with SMTP id
 5614622812f47-4b366b57fbemr7439078b6e.14.1787755895602; Wed, 26 Aug 2026
 07:51:35 -0700 (PDT)
Date: Wed, 26 Aug 2026 07:51:35 -0700
In-Reply-To: <6a8adc31.ae6ddae5.3da009.0064.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8efd77.50659fcc.60cd.0001.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
From: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, rafael@kernel.org, 
	stern@rowland.harvard.edu, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    45c13f3f9e3b Merge tag 'hwlock-v7.3' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15e60579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2210e2522d526007
dashboard link: https://syzkaller.appspot.com/bug?extid=fd7be5ad9795b7f29df3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13c0e979580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1359d979580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/72f453f907ce/disk-45c13f3f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ad3f311ccc44/vmlinux-45c13f3f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b961263a3eca/bzImage-45c13f3f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com

INFO: task syz.0.23:5988 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.23        state:D stack:27344 pid:5988  tgid:5988  ppid:5772   task_flags:0x400140 flags:0x08080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17d4/0x5820 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
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
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x27a/0x6a0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf6fef0ec
RSP: 002b
RSP: 002b:00000000ffc9978c EFLAGS: 00000206 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 0000000080000040
RDX: 0000000000000008 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task syz.4.21:5989 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.4.21        state:D stack:26520 pid:5989  tgid:5989  ppid:5791   task_flags:0x400140 flags:0x08080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17d4/0x5820 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
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
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x27a/0x6a0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf709f0ec
RSP: 002b:00000000fffb5ddc EFLAGS: 00000206 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 0000000080000040
RDX: 0000000000000008 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task syz.1.18:5990 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.18        state:D stack:26920 pid:5990  tgid:5990  ppid:5777   task_flags:0x400140 flags:0x08080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17d4/0x5820 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
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
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x27a/0x6a0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7f390ec
RSP: 002b:00000000ffd913ac EFLAGS: 00000206 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 0000000080000040
RDX: 0000000000000008 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task syz.3.24:5993 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.3.24        state:D stack:26184 pid:5993  tgid:5993  ppid:5774   task_flags:0x400140 flags:0x08080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17d4/0x5820 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
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
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x27a/0x6a0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf6fef0ec
RSP: 002b:00000000ffd8e92c EFLAGS: 00000206 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 0000000080000040
RDX: 0000000000000008 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>
INFO: task syz.2.25:5994 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.2.25        state:D stack:27480 pid:5994  tgid:5994  ppid:5780   task_flags:0x400140 flags:0x08080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5520 [inline]
 __schedule+0x17d4/0x5820 kernel/sched/core.c:7270
 __schedule_loop kernel/sched/core.c:7347 [inline]
 schedule+0x164/0x2b0 kernel/sched/core.c:7362
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7419
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
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x27a/0x6a0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x33/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf7f580ec
RSP: 002b:00000000ffe699ac EFLAGS: 00000206 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 0000000080000040
RDX: 0000000000000008 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000206 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

Showing all locks held in the system:
locks held by kworker/0:0/9: 5, on CPU#0:
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc900000e7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc900000e7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff888029c441d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029c441d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88807ef701d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88807ef701d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88807f6901a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88807f6901a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by kworker/0:1/10: 3, last CPU#0:
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88801b06b140 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc900000f7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc900000f7c40 ((work_completion)(&data->fib_event_work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff88804b13e250 (&data->fib_lock){+.+.}-{4:4}, at: nsim_fib_event_work+0x1fd/0x3b0 drivers/net/netdevsim/fib.c:1490
locks held by pr/ttyS0/16: 2, last CPU#1:
 #0: ffffffff8ec36278 (console_srcu){....}-{0:0}, at: rcu_try_lock_acquire include/linux/rcupdate.h:314 [inline]
 #0: ffffffff8ec36278 (console_srcu){....}-{0:0}, at: srcu_read_lock_nmisafe include/linux/srcu.h:439 [inline]
 #0: ffffffff8ec36278 (console_srcu){....}-{0:0}, at: console_srcu_read_lock+0x30/0x60 kernel/printk/printk.c:291
 #1: ffffffff9ad250d8 (&port_lock_key){-.-.}-{3:3}, at: __uart_port_lock_irqsave include/linux/serial_core.h:613 [inline]
 #1: ffffffff9ad250d8 (&port_lock_key){-.-.}-{3:3}, at: univ8250_console_device_lock+0x67/0xc0 drivers/tty/serial/8250/8250_core.c:413
locks held by kworker/1:0/25: 5, on CPU#1:
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc900001f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900001f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900001f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc900001f7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff888029d0f1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029d0f1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff8880270791a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff8880270791a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by khungtaskd/32: 1, last CPU#0:
 #0: ffffffff8ed5c6a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffffffff8ed5c6a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8ed5c6a0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6793
locks held by kworker/u8:6/143: 2, on CPU#1:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc90002dc7c40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90002dc7c40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90002dc7c40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc90002dc7c40 ((work_completion)(&sub_info->work)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
locks held by kworker/0:3/4945: 5, on CPU#0:
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc9001002fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9001002fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9001002fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc9001002fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff888029cba1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029cba1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88802ad751d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88802ad751d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88801db001a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88801db001a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by udevd/4984: 4, last CPU#0:
 #0: ffff8880508752d8 (&p->lock){+.+.}-{4:4}, at: seq_read_iter+0xa4/0xca0 fs/seq_file.c:183
 #1: ffff8880476f3480 (&of->mutex#2){+.+.}-{4:4}, at: kernfs_seq_start+0x5d/0x420 fs/kernfs/file.c:165
 #2: ffff88807805e2d8 (kn->active#5){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #2: ffff88807805e2d8 (kn->active#5){.+.+}-{0:0}, at: kernfs_seq_start+0xb2/0x420 fs/kernfs/file.c:166
 #3: ffffffff8ed5c6a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #3: ffffffff8ed5c6a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #3: ffffffff8ed5c6a0 (rcu_read_lock){....}-{1:3}, at: class_rcu_constructor include/linux/rcupdate.h:1216 [inline]
 #3: ffffffff8ed5c6a0 (rcu_read_lock){....}-{1:3}, at: unwind_next_frame+0x8f/0x2550 arch/x86/kernel/unwind_orc.c:495
locks held by getty/5372: 2, on CPU#0:
 #0: ffff888035ceb0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000322b2e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x45a/0x1360 drivers/tty/n_tty.c:2211
locks held by kworker/0:4/5775: 5, on CPU#0:
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc900033b7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc900033b7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc900033b7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc900033b7c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff8880296c21d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff8880296c21d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff888032f1c1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff888032f1c1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff8880335d01a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff8880335d01a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by kworker/1:5/5893: 5, on CPU#1:
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc90002e87c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90002e87c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90002e87c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc90002e87c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff888029bce1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029bce1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88802707f1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88802707f1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff8880299051a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff8880299051a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by kworker/1:6/5894: 5, on CPU#1:
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc90002e77c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90002e77c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90002e77c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc90002e77c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff888029cc31d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029cc31d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88807b0441d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88807b0441d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff88802a19f1a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff88802a19f1a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by kworker/1:7/5918: 5, on CPU#1:
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc9000206fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000206fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000206fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc9000206fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff888029cf31d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029cf31d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88807d32d1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88807d32d1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff8880363ba1a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff8880363ba1a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by kworker/0:5/5980: 2, last CPU#0:
 #0: ffff88805c8f0d40 ((wq_completion)wg-crypt-wg1#20){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff88805c8f0d40 ((wq_completion)wg-crypt-wg1#20){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff88805c8f0d40 ((wq_completion)wg-crypt-wg1#20){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff88805c8f0d40 ((wq_completion)wg-crypt-wg1#20){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffff8880b8624408 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x57/0x7d0 kernel/sched/psi.c:933
locks held by kworker/0:6/5982: 5, on CPU#0:
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc90004187c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90004187c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90004187c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc90004187c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff888029b711d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029b711d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff888032abc1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff888032abc1d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff888028b511a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888028b511a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by kworker/0:7/5987: 5, on CPU#0:
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc90004027c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc90004027c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc90004027c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc90004027c40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff888029dad1d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888029dad1d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88807bf271d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88807bf271d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff888032f1b1a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888032f1b1a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by syz.0.23/5988: 3, on CPU#1:
 #0: ffff888029f56460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888029f56460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88805a9ffc80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.4.21/5989: 3, on CPU#1:
 #0: ffff88807916a460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88807916a460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88805a9ff480 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.1.18/5990: 3, on CPU#1:
 #0: ffff888028ef0460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888028ef0460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88805a9fc880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.3.24/5993: 3, on CPU#1:
 #0: ffff88802b28c460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88802b28c460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88805aa39080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.2.25/5994: 3, on CPU#1:
 #0: ffff888079820460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888079820460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88802a1fd880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by kworker/0:9/6125: 5, on CPU#0:
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #0: ffff888020afd140 ((wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #1: ffffc9000451fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #1: ffffc9000451fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #1: ffffc9000451fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3352 [inline]
 #1: ffffc9000451fc40 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_scheduled_works+0x97a/0x1630 kernel/workqueue.c:3470
 #2: ffff8880298031d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff8880298031d8 (&dev->mutex){....}-{4:4}, at: hub_event+0x184/0x4d30 drivers/usb/core/hub.c:5912
 #3: ffff88807ef901d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #3: ffff88807ef901d8 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
 #4: ffff888079a981a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #4: ffff888079a981a0 (&dev->mutex){....}-{4:4}, at: __device_attach+0x88/0x450 drivers/base/dd.c:1073
locks held by syz.8.29/6209: 3, on CPU#1:
 #0: ffff88807b964460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88807b964460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88805634e880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.5.26/6211: 3, on CPU#0:
 #0: ffff88807e082460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88807e082460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88807c4f2880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.9.30/6213: 3, on CPU#1:
 #0: ffff88807c748460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88807c748460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888073dd6480 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.6.27/6214: 3, on CPU#0:
 #0: ffff888055434460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888055434460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88807b72fc80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.7.28/6215: 3, on CPU#1:
 #0: ffff888022bba460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888022bba460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888057f94080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.1.32/6372: 3, on CPU#1:
 #0: ffff888054d88460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888054d88460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88805c9a2c80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.0.31/6381: 3, on CPU#1:
 #0: ffff888032d0e460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888032d0e460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88807e112880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.3.34/6402: 3, on CPU#1:
 #0: ffff8880534be460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff8880534be460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88807ee69c80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.2.33/6403: 3, on CPU#1:
 #0: ffff888053118460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888053118460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888056b3d880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.4.35/6405: 3, on CPU#0:
 #0: ffff888032bea460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888032bea460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88802ccbc480 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.5.36/6546: 3, on CPU#0:
 #0: ffff88804e17c460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88804e17c460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88802903f080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.8.37/6584: 3, on CPU#0:
 #0: ffff888033874460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888033874460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88807c2fe080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.9.40/6604: 3, on CPU#0:
 #0: ffff88804f4a2460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88804f4a2460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88805c9be480 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.7.39/6618: 3, on CPU#1:
 #0: ffff888033476460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888033476460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888032f34080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.6.38/6619: 3, on CPU#0:
 #0: ffff88804e248460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88804e248460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888030ab0080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.1.41/6676: 3, on CPU#0:
 #0: ffff8880594f0460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff8880594f0460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff8880720f6c80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.0.42/6784: 3, on CPU#1:
 #0: ffff888057d90460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888057d90460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88802b9a6080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.2.43/6792: 3, on CPU#0:
 #0: ffff88801c318460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88801c318460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888049342080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.3.44/6801: 3, on CPU#1:
 #0: ffff88804b8d8460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88804b8d8460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff88805aa37880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.4.45/6807: 3, on CPU#1:
 #0: ffff888025df0460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888025df0460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888048c18c80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.5.46/6849: 3, on CPU#1:
 #0: ffff888052192460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888052192460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888049519c80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz-executor/6907: 3, last CPU#0:
 #0: ffffffff902bd968 (cb_lock){++++}-{4:4}, at: genl_rcv+0x19/0x40 net/netlink/genetlink.c:1217
 #1: ffffffff902bd7a0 (genl_mutex){+.+.}-{4:4}, at: genl_lock net/netlink/genetlink.c:35 [inline]
 #1: ffffffff902bd7a0 (genl_mutex){+.+.}-{4:4}, at: genl_op_lock net/netlink/genetlink.c:60 [inline]
 #1: ffffffff902bd7a0 (genl_mutex){+.+.}-{4:4}, at: genl_rcv_msg+0x10b/0x7a0 net/netlink/genetlink.c:1208
 #2: ffffffff9024ccc0 (rtnl_mutex){+.+.}-{4:4}, at: wiphy_register+0x1faf/0x2ff0 net/wireless/core.c:1157
locks held by syz.8.47/6997: 3, on CPU#0:
 #0: ffff888053c24460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff888053c24460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888045790880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by syz.9.48/7022: 3, on CPU#0:
 #0: ffff88802a15a460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88802a15a460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888044fcbc80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by kworker/u8:12/7040: 4, last CPU#0:
 #0: ffff88801b0ac140 ((wq_completion)events_unbound){+.+.}-{0:0}, at: raw_spin_rq_lock_nested+0x2d/0x160 kernel/sched/core.c:677
 #1: ffff8880b8624408 (psi_seq){-.-.}-{0:0}, at: psi_task_switch+0x57/0x7d0 kernel/sched/psi.c:933
 #2: ffff888048d207a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: class_wiphy_constructor include/net/cfg80211.h:6906 [inline]
 #2: ffff888048d207a0 (&rdev->wiphy.mtx){+.+.}-{4:4}, at: cfg80211_wiphy_work+0xb4/0x420 net/wireless/core.c:527
 #3: ffffffff8ed5c6a0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:309 [inline]
 #3: ffffffff8ed5c6a0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #3: ffffffff8ed5c6a0 (rcu_read_lock){....}-{1:3}, at: ieee80211_sta_active_ibss+0xc7/0x330 net/mac80211/ibss.c:628
locks held by syz.6.49/7046: 3, on CPU#0:
 #0: ffff88807b966460 (sb_writers#7){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2754 [inline]
 #0: ffff88807b966460 (sb_writers#7){.+.+}-{0:0}, at: vfs_write+0x22b/0xba0 fs/read_write.c:683
 #1: ffff888046aaf480 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1d8/0x540 fs/kernfs/file.c:336
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1104 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: __device_driver_lock drivers/base/dd.c:1170 [inline]
 #2: ffff888034e661d8 (&dev->mutex){....}-{4:4}, at: device_release_driver_internal+0x93/0x880 drivers/base/dd.c:1369
locks held by modprobe/7050: 1, last CPU#0:
 #0: ffff88801b094378 (&mm->mmap_lock){++++}-{4:4}, at: mmap_write_lock_killable include/linux/mmap_lock.h:562 [inline]
 #0: ffff88801b094378 (&mm->mmap_lock){++++}-{4:4}, at: vm_mmap_pgoff+0x1dd/0x4e0 mm/util.c:579

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 32 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x274/0x2d0 lib/nmi_backtrace.c:123
 nmi_trigger_cpumask_backtrace+0x17d/0x390 lib/nmi_backtrace.c:66
 trigger_all_cpu_backtrace include/linux/nmi.h:164 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x135/0x170 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:353 [inline]
 watchdog+0xfd7/0x1030 kernel/hung_task.c:561
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 16 Comm: pr/ttyS0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
RIP: 0010:io_serial_out+0x7c/0xc0 drivers/tty/serial/8250/8250_port.c:416
Code: 52 57 fc 44 89 f9 d3 e5 49 83 c6 40 4c 89 f0 48 c1 e8 03 42 80 3c 20 00 74 08 4c 89 f7 e8 4c 05 c7 fc 41 03 2e 89 d8 89 ea ee <5b> 41 5c 41 5e 41 5f 5d c3 cc cc cc cc cc 44 89 f9 80 e1 07 38 c1
RSP: 0000:ffffc90000157900 EFLAGS: 00000002
RAX: 0000000000000032 RBX: 0000000000000032 RCX: 0000000000000000
RDX: 00000000000003f8 RSI: 0000000000000000 RDI: 0000000000000020
RBP: 00000000000003f8 R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: ffffffff85705b30 R12: dffffc0000000000
R13: 0000000000000032 R14: ffffffff9ad25100 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888124de6000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f95bafb9e9c CR3: 000000007b81a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 serial_port_out include/linux/serial_core.h:817 [inline]
 serial8250_console_putchar drivers/tty/serial/8250/8250_port.c:3287 [inline]
 __serial8250_console_fifo_write+0x1e6/0x3e0 drivers/tty/serial/8250/8250_port.c:3359
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3378 [inline]
 __serial8250_console_write drivers/tty/serial/8250/8250_port.c:3429 [inline]
 serial8250_console_write+0xaa1/0x1200 drivers/tty/serial/8250/8250_port.c:3493
 nbcon_emit_next_record+0xef5/0x1a90 kernel/printk/nbcon.c:-1
 nbcon_emit_one kernel/printk/nbcon.c:1157 [inline]
 nbcon_kthread_func+0x679/0x880 kernel/printk/nbcon.c:1271
 kthread+0x38b/0x480 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
