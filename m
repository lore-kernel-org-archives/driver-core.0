Received: from mail-oa1-f79.google.com (mail-oa1-f79.google.com [209.85.160.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA4D459AF4
	for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 10:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786703856; cv=none; b=rIWjhGm+BZfU5ei82OfYAbwMgG/ChyFUdAuDlel7cn9KDuKORInWEwzFRsrPSWKFLx0I+5QrxbnuJEnTf+T4RxXPSWbgLBlvQ1QFuE4aBCb4zwI45V++rNiWSbjEZWLQdpuTUHGHHIBH8EGVqgudg/t31ocqGH5hQymzV9iXcUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786703856; c=relaxed/simple;
	bh=iLm6yHdgH9uTz6XEjQZ4K0e0vkLBndFd2jp/Lxiobpo=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=LnTaCFeBwJXR5Y7GwU1b12roU/HyD1myO8AVTPscDTZfzD0PikbfflsqOIj9x6N8trH66bZSEbXf1geIk8HlPfRqJCRlQCz1+/6uPEDtzVlTS2NwjiVNAEuoOyCMyQhE5D2klFn6d6jCHY390fU0AuH/63U7aAm2iku6eQ9A2Gk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f79.google.com with SMTP id 586e51a60fabf-456ab1a7f2cso996339fac.3
        for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 03:37:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786703846; x=1787308646;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V8h9rcswZfmF0SHe0JimNyQe+xhlf/jwvw/S/NcoY/Q=;
        b=ifsSdJ7RlGKwT6rdEbarpUo3suggFhsa7nSzcPbXgiw37iU/MJomvWktjbVK1ah2zU
         dG7Mnry1b1lCsGD+MDOGgrr6LrQoe+x+lNzg+hE5gYOwFtIhHmaqMlPA0kEpKu/HDcCF
         Sgj+rTl2CqivoTFJHeeO+oDJw99i/0yfWcSA0TQIWjP/q1G1qlRfRjgB4dD+7Por1MhZ
         MJCKnSj8pUQkXKOOYXCvQ78q5tWwSP/o2GTONa2uJgnXGAoOkJCbs1mBMykBQf8ghmuZ
         frs5/gLb7hU8OCXWyIeUYB40+UozJ0kYaLGzCYNyQeiZobfdmRYL7H0VMtO/i/y3kmHo
         PUsA==
X-Forwarded-Encrypted: i=1; AHgh+RqnpvMwkkUnHTJ7X714wYR4VjiBAcBCT2CEx1vc8iSLpaxGAmDBwsqozydUF5CE5VTs3p2lq7QQY76wWA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxfqxWQijlp0lQQDWR3t2KiwV5Mg+eiLANUa+rvPxzZvyQy2nsA
	ZWqtaeZXhIyEFkUeHfLu/EVMKAY40owd483l9yqVntUb+AOQJ0NkX0MtdXzUq1M2XrkrZzTB45m
	ucy6jlP9s49ZNwOfgydbM4DhXO9IsFsFFqOVq9ZvirxDAx2IiNfMW7RHacZE=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b82:b0:6a1:8b23:d4c8 with SMTP id
 006d021491bc7-6b0d5fa52bemr4170435eaf.3.1786703846321; Fri, 14 Aug 2026
 03:37:26 -0700 (PDT)
Date: Fri, 14 Aug 2026 03:37:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7eefe6.f7a79266.2f965f.0001.GAE@google.com>
Subject: [syzbot] [kernel?] INFO: task hung in usb_disable_device (2)
From: syzbot <syzbot+5cf28d3643d94bfb0821@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, mcgrof@kernel.org, 
	rafael@kernel.org, russ.weight@linux.dev, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5d5fd841c346 Merge 7.2-rc5 into usb-next
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-testing
console output: https://syzkaller.appspot.com/x/log.txt?x=14fbca9e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ec4d592e55f7960
dashboard link: https://syzkaller.appspot.com/bug?extid=5cf28d3643d94bfb0821
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2ed536ae4daf/disk-5d5fd841.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ab40098ccbf1/vmlinux-5d5fd841.xz
kernel image: https://storage.googleapis.com/syzbot-assets/66d5c395f47c/bzImage-5d5fd841.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5cf28d3643d94bfb0821@syzkaller.appspotmail.com

INFO: task kworker/1:1:28 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/1:1     state:D
 stack:19176 pid:28    tgid:28    ppid:2      task_flags:0x4208060 flags:0x00080000
Workqueue: usb_hub_wq hub_event
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5510 [inline]
 __schedule+0x1325/0x47d0 kernel/sched/core.c:7234
 __schedule_loop kernel/sched/core.c:7311 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7326
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:7383
 __mutex_lock_common kernel/locking/mutex.c:726 [inline]
 __mutex_lock+0xccc/0x1bd0 kernel/locking/mutex.c:821
 device_lock include/linux/device.h:1102 [inline]
 device_del+0xa0/0x9b0 drivers/base/core.c:3923
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2350
 hub_port_connect drivers/usb/core/hub.c:5412 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5712 [inline]
 port_event drivers/usb/core/hub.c:5876 [inline]
 hub_event+0x1d0c/0x4af0 drivers/usb/core/hub.c:5958
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x69a/0xc80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
INFO: task kworker/0:2:247 blocked for more than 144 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/0:2     state:D stack:20520 pid:247   tgid:247   ppid:2      task_flags:0x4288060 flags:0x00080000
Workqueue: events request_firmware_work_func
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5510 [inline]
 __schedule+0x1325/0x47d0 kernel/sched/core.c:7234
 __schedule_loop kernel/sched/core.c:7311 [inline]
 schedule+0xdd/0x2c0 kernel/sched/core.c:7326
 lbs_wait_for_firmware_load+0x11e/0x1e0 drivers/net/wireless/marvell/libertas/firmware.c:117
 lbs_remove_card+0x84/0x390 drivers/net/wireless/marvell/libertas/main.c:913
 if_usb_disconnect+0xc5/0x270 drivers/net/wireless/marvell/libertas/if_usb.c:317
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:618 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:610
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 usb_driver_release_interface drivers/usb/core/driver.c:643 [inline]
 usb_forced_unbind_intf+0x1a4/0x240 drivers/usb/core/driver.c:1137
 usb_reset_device+0x411/0xaa0 drivers/usb/core/hub.c:6409
 if_usb_reset_device.isra.0+0x21e/0x290 drivers/net/wireless/marvell/libertas/if_usb.c:400
 if_usb_prog_firmware+0x626/0xef0 drivers/net/wireless/marvell/libertas/if_usb.c:889
 lbs_fw_loaded drivers/net/wireless/marvell/libertas/firmware.c:23 [inline]
 helper_firmware_cb drivers/net/wireless/marvell/libertas/firmware.c:80 [inline]
 helper_firmware_cb+0x1f7/0x2d0 drivers/net/wireless/marvell/libertas/firmware.c:64
 request_firmware_work_func+0x13f/0x440 drivers/base/firmware_loader/main.c:1164
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x69a/0xc80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
5 locks held by kworker/1:1/28:
 #0: 
ffff888106aa4540
 (
(wq_completion)usb_hub_wq){+.+.}-{0:0}, at: process_one_work+0x12b1/0x1940 kernel/workqueue.c:3297
 #1: ffffc900001e7d18 ((work_completion)(&hub->events)){+.+.}-{0:0}, at: process_one_work+0x988/0x1940 kernel/workqueue.c:3298
 #2: ffff88810af571d8
 (
&dev->mutex
){....}-{4:4}
, at: device_lock include/linux/device.h:1102 [inline]
, at: hub_event+0x1bd/0x4af0 drivers/usb/core/hub.c:5904
 #3: 
ffff8881158cd1d8
 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1102 [inline]
 (&dev->mutex){....}-{4:4}, at: usb_disconnect+0x10a/0x9a0 drivers/usb/core/hub.c:2341
 #4: ffff8881158c81a0 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1102 [inline]
 #4: ffff8881158c81a0 (&dev->mutex){....}-{4:4}, at: device_del+0xa0/0x9b0 drivers/base/core.c:3923
1 lock held by khungtaskd/30:
 #0: ffffffff896e2b40 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:300 [inline]
 #0: ffffffff896e2b40 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:840 [inline]
 #0: ffffffff896e2b40 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x3d/0x184 kernel/locking/lockdep.c:6775
3 locks held by kworker/0:2/247:
 #0: ffff88810006b140 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x12b1/0x1940 kernel/workqueue.c:3297
 #1: 
ffffc90001af7d18
 (
(work_completion)(&fw_work->work)
){+.+.}-{0:0}
, at: process_one_work+0x988/0x1940 kernel/workqueue.c:3298
 #2: 
ffff8881158c81a0
 (
&dev->mutex
){....}-{4:4}
, at: device_lock include/linux/device.h:1102 [inline]
, at: __device_driver_lock drivers/base/dd.c:1171 [inline]
, at: device_release_driver_internal+0xb2/0x620 drivers/base/dd.c:1369
2 locks held by getty/2918:
 #0: 
ffff888115d290a0
 (
&tty->ldisc_sem
){++++}-{0:0}
, at: tty_ldisc_ref_wait+0x24/0x80 drivers/tty/tty_ldisc.c:243
 #1: 
ffffc900000452e8
 (
&ldata->atomic_read_lock
){+.+.}-{4:4}
, at: n_tty_read+0x419/0x14e0 drivers/tty/n_tty.c:2211
2 locks held by kworker/0:5/5267:
2 locks held by kworker/0:11/11531:

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 30 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 nmi_cpu_backtrace.cold+0x12d/0x151 lib/nmi_backtrace.c:122
 nmi_trigger_cpumask_backtrace+0x21c/0x2a0 lib/nmi_backtrace.c:65
 trigger_all_cpu_backtrace include/linux/nmi.h:162 [inline]
 __sys_info lib/sys_info.c:157 [inline]
 sys_info+0x141/0x190 lib/sys_info.c:165
 check_hung_uninterruptible_tasks kernel/hung_task.c:353 [inline]
 watchdog+0xcb1/0x1030 kernel/hung_task.c:561
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x69a/0xc80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 9069 Comm: kworker/0:9 Not tainted syzkaller #0 PREEMPT(lazy) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: events legacy_dvb_usb_read_remote_control
RIP: 0010:__sanitizer_cov_trace_pc+0xb/0x70 kernel/kcov.c:213
Code: 5f 00 be 03 00 00 00 5b e9 e2 72 23 01 66 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 f3 0f 1e fa 65 8b 05 e5 9b 4a 0b <48> 8b 34 24 65 48 8b 15 c1 9b 4a 0b a9 00 01 ff 00 74 1b f6 c4 01
RSP: 0018:ffffc900125cf238 EFLAGS: 00000216
RAX: 0000000000000001 RBX: ffffffff878ae180 RCX: ffffffff87788dd0
RDX: 0000000000000063 RSI: 000000000000002a RDI: ffff88811567bc00
RBP: ffffc900125cf2e0 R08: 0000000000000001 R09: 000000000000002a
R10: 0000000000000063 R11: 0000000000b421c8 R12: 0000000000000063
R13: ffffffff878ae181 R14: ffffc900125cf370 R15: 0000000000000033
FS:  0000000000000000(0000) GS:ffff888268636000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055556db20908 CR3: 00000001175ac000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 format_decode+0x32f/0xdd0 lib/vsprintf.c:2739
 vsnprintf+0x1c0/0x1300 lib/vsprintf.c:2887
 snprintf+0xc7/0x100 lib/vsprintf.c:3043
 print_caller kernel/printk/printk.c:1368 [inline]
 info_print_prefix+0x134/0x350 kernel/printk/printk.c:1387
 record_print_text+0x143/0x3c0 kernel/printk/printk.c:1434
 printk_get_next_message+0x2d1/0x6c0 kernel/printk/printk.c:3072
 console_emit_next_record kernel/printk/printk.c:3137 [inline]
 console_flush_one_record+0x67c/0xe50 kernel/printk/printk.c:3269
 console_flush_all kernel/printk/printk.c:3343 [inline]
 __console_flush_and_unlock kernel/printk/printk.c:3373 [inline]
 console_unlock+0x103/0x260 kernel/printk/printk.c:3413
 vprintk_emit+0x407/0x6b0 kernel/printk/printk.c:2479
 _printk+0xcf/0x110 kernel/printk/printk.c:2504
 legacy_dvb_usb_read_remote_control.cold+0x11/0x16 drivers/media/usb/dvb-usb/dvb-usb-remote.c:124
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x69a/0xc80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
