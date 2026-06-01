Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 293C53D891C
	for <driver-core@lists.linux.dev>; Mon,  1 Jun 2026 15:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780326508; cv=none; b=m5ZxeJQ7B7EA6cEEVqVe3oDa97l7hDTB6ac8UCYrTibKSvey0X82FdqhsS5b0Hy/ILedumDHS9+oZ2HoyR5zXr1QjeRW+hRLWhq89vEpO3Y0NSJ30t123W2/iBOj++zqENx28KicjVIxaRnGpNW0mXKRJlPmxTFKsA2g9o08Ny8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780326508; c=relaxed/simple;
	bh=Z4v3V7t/Rqjq4B0IsQoIu4TeNWqPHbcqSPmZM/jdPkY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=HPImtKfhqIpGHVyhFluypv4GsVSCOKZN3vRSKcY7WE/KO6xcFzF5F+RNnRj7Ha7yv5LwUVjyUlOQ8rba8qV9QKXXI9VFJHEYmy1HjnaFSeVoekMj4IGeHxspzkC/wE0SbjVT+zZUrnW0pQJBJhZjVN15OKipqIdLpsmu/cFJhSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4863a55600aso286258b6e.1
        for <driver-core@lists.linux.dev>; Mon, 01 Jun 2026 08:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780326505; x=1780931305;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=c2nWVp4PNHWWi3GvsHFOTS16+CKRfsYQOKXCP06IiSc=;
        b=n8euNb/flCjtHV5MkP6WL63SNyXDHx18JFY5bocyxY6DJcgyxDGHweJiJAhZKJmhb0
         +Qay9IitMQ7Mlw2tcgTQJR0VS0YPnu7rQwhlKENzG7kKcWCUiPbCslATnkdLpZOJq6LS
         xxsQpHP9Lr8u+/qtbhtoi6SU6D+RTl/x+JGl9AZ3IUN11I4cI7usEo5ED2FZnwf4KHqE
         JJPJFC/8+utS2M7wi/zkvxsUL4ggGO1I3OQhIHq4PlXurZVRBeVG0RJ0WQBOZMliRgVM
         TFsv7w5b+r7RlPbMbNUHbkKEmDOasjUghQwu37re8y9m5cdGzCcqPYOnJFhzcy1K93cq
         mshA==
X-Forwarded-Encrypted: i=1; AFNElJ91LyyKLsrwojA1cne1w7twLnRH1uZu6b2EKO9tLzLlTsGzEnF55MRmBnZgEpHFpH9+rLYIyIQqB9j/ng==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywc3D7EY5WAa5bSsXSoSBaTJWnNnBCjOYOx4L+gYerDRhBGTcWN
	Fz76E+RM/ym03QvI89GCBwt+nVi8JfhPKsiPgf1/X8ZKPUHgChC/+NenYEbzrRm+dTEdNvYslE9
	JcmNSDPJfxupiJa8QH40fGsgypnMiqoOfD/vXPzcynwv8YWHkbRH5vXX7iUI=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1781:b0:479:fca7:4662 with SMTP id
 5614622812f47-485fb24dcf0mr5617667b6e.9.1780326504836; Mon, 01 Jun 2026
 08:08:24 -0700 (PDT)
Date: Mon, 01 Jun 2026 08:08:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1da068.bd48a97d.14881d.0003.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: slab-use-after-free Read in
 netdev_register_kobject (2)
From: syzbot <syzbot+fed5dce4553262f3b35c@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    4cbfe4502e3d Merge tag 'v7.1-rc5-ksmbd-server-fixes' of gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11419cec580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=58acee1ac5406016
dashboard link: https://syzkaller.appspot.com/bug?extid=fed5dce4553262f3b35c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-4cbfe450.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/45e57d38df99/vmlinux-4cbfe450.xz
kernel image: https://storage.googleapis.com/syzbot-assets/fe2428a7711a/bzImage-4cbfe450.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fed5dce4553262f3b35c@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in kobject_get+0x136/0x150 lib/kobject.c:639
Read of size 1 at addr ffff88804be10d1c by task syz.2.2484/16757

CPU: 1 UID: 0 PID: 16757 Comm: syz.2.2484 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1d0 mm/kasan/report.c:595
 kobject_get+0x136/0x150 lib/kobject.c:639
 get_device drivers/base/core.c:3802 [inline]
 device_add+0x19f/0x1950 drivers/base/core.c:3614
 netdev_register_kobject+0x1a9/0x3d0 net/core/net-sysfs.c:2343
 register_netdevice+0x151c/0x24b0 net/core/dev.c:11423
 register_netdev+0x34/0x50 net/core/dev.c:11539
 bnep_add_connection+0x723/0xd30 net/bluetooth/bnep/core.c:631
 do_bnep_sock_ioctl.isra.0+0x3ac/0x5b0 net/bluetooth/bnep/sock.c:83
 bnep_sock_compat_ioctl+0x87/0x1d0 net/bluetooth/bnep/sock.c:168
 compat_sock_ioctl+0x179/0x760 net/socket.c:3632
 __do_compat_sys_ioctl fs/ioctl.c:695 [inline]
 __se_compat_sys_ioctl fs/ioctl.c:638 [inline]
 __ia32_compat_sys_ioctl+0x2cf/0x360 fs/ioctl.c:638
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xe7/0x950 arch/x86/entry/syscall_32.c:307
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf705ef7c
Code: d2 74 05 c1 e8 0c 89 02 8b 5d fc 31 c0 c9 c3 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 0f 1f 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 2e 8d b4 26 00 00 00 00 8d b4 26 00 00 00 00 58 b8
RSP: 002b:00000000f540b50c EFLAGS: 00000292 ORIG_RAX: 0000000000000036
RAX: ffffffffffffffda RBX: 0000000000000007 RCX: 00000000400442c8
RDX: 0000000080000340 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000292 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

Allocated by task 12930:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kmalloc_noprof include/linux/slab.h:950 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 __hci_conn_add+0x1f4/0x1da0 net/bluetooth/hci_conn.c:1030
 hci_conn_add_unset+0x76/0x120 net/bluetooth/hci_conn.c:1157
 hci_conn_request_evt+0xa58/0xbb0 net/bluetooth/hci_event.c:3333
 hci_event_func net/bluetooth/hci_event.c:7796 [inline]
 hci_event_packet+0x8e9/0xcd0 net/bluetooth/hci_event.c:7847
 hci_rx_work+0x451/0xfc0 net/bluetooth/hci_core.c:4077
 process_one_work+0xa0e/0x1980 kernel/workqueue.c:3314
 process_scheduled_works kernel/workqueue.c:3397 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3478
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 16742:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2689 [inline]
 slab_free mm/slub.c:6251 [inline]
 kfree+0x223/0x6c0 mm/slub.c:6566
 device_release+0xd2/0x270 drivers/base/core.c:2566
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3814
 hci_conn_put include/net/bluetooth/hci_core.h:1673 [inline]
 hci_disconnect_all_sync.constprop.0.isra.0+0x15d/0x430 net/bluetooth/hci_sync.c:5790
 hci_suspend_sync+0x8b7/0xa70 net/bluetooth/hci_sync.c:6265
 hci_suspend_dev+0x31d/0x540 net/bluetooth/hci_core.c:2850
 hci_suspend_notifier+0x21e/0x330 net/bluetooth/hci_core.c:2421
 notifier_call_chain+0x99/0x400 kernel/notifier.c:85
 notifier_call_chain_robust kernel/notifier.c:120 [inline]
 blocking_notifier_call_chain_robust kernel/notifier.c:345 [inline]
 blocking_notifier_call_chain_robust+0xc8/0x160 kernel/notifier.c:333
 pm_notifier_call_chain_robust+0x27/0x60 kernel/power/main.c:172
 snapshot_open+0x189/0x2a0 kernel/power/user.c:77
 misc_open+0x26d/0x450 drivers/char/misc.c:163
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6d8/0x1660 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1079
 do_open fs/namei.c:4699 [inline]
 path_openat+0x208c/0x31a0 fs/namei.c:4858
 do_file_open+0x20e/0x430 fs/namei.c:4887
 do_sys_openat2+0x10d/0x1e0 fs/open.c:1364
 do_sys_open fs/open.c:1370 [inline]
 __do_compat_sys_openat fs/open.c:1432 [inline]
 __se_compat_sys_openat fs/open.c:1430 [inline]
 __ia32_compat_sys_openat+0x12d/0x210 fs/open.c:1430
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xe7/0x950 arch/x86/entry/syscall_32.c:307
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

Last potentially related work creation:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_record_aux_stack+0xa7/0xc0 mm/kasan/generic.c:556
 insert_work+0x36/0x230 kernel/workqueue.c:2226
 __queue_work+0x9a2/0x1270 kernel/workqueue.c:2393
 __queue_delayed_work+0x357/0x450 kernel/workqueue.c:2560
 queue_delayed_work_on+0x180/0x1e0 kernel/workqueue.c:2612
 queue_delayed_work include/linux/workqueue.h:713 [inline]
 hci_conn_drop include/net/bluetooth/hci_core.h:1712 [inline]
 hci_conn_drop include/net/bluetooth/hci_core.h:1686 [inline]
 l2cap_chan_del+0x649/0x930 net/bluetooth/l2cap_core.c:672
 l2cap_conn_del+0x395/0x710 net/bluetooth/l2cap_core.c:1802
 l2cap_connect_cfm+0x9bb/0xf80 net/bluetooth/l2cap_core.c:7374
 hci_connect_cfm include/net/bluetooth/hci_core.h:2139 [inline]
 hci_conn_failed+0x188/0x360 net/bluetooth/hci_conn.c:1409
 hci_abort_conn_sync+0x7d9/0xb20 net/bluetooth/hci_sync.c:5766
 hci_disconnect_all_sync.constprop.0.isra.0+0x155/0x430 net/bluetooth/hci_sync.c:5789
 hci_suspend_sync+0x8b7/0xa70 net/bluetooth/hci_sync.c:6265
 hci_suspend_dev+0x31d/0x540 net/bluetooth/hci_core.c:2850
 hci_suspend_notifier+0x21e/0x330 net/bluetooth/hci_core.c:2421
 notifier_call_chain+0x99/0x400 kernel/notifier.c:85
 notifier_call_chain_robust kernel/notifier.c:120 [inline]
 blocking_notifier_call_chain_robust kernel/notifier.c:345 [inline]
 blocking_notifier_call_chain_robust+0xc8/0x160 kernel/notifier.c:333
 pm_notifier_call_chain_robust+0x27/0x60 kernel/power/main.c:172
 snapshot_open+0x189/0x2a0 kernel/power/user.c:77
 misc_open+0x26d/0x450 drivers/char/misc.c:163
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6d8/0x1660 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1079
 do_open fs/namei.c:4699 [inline]
 path_openat+0x208c/0x31a0 fs/namei.c:4858
 do_file_open+0x20e/0x430 fs/namei.c:4887
 do_sys_openat2+0x10d/0x1e0 fs/open.c:1364
 do_sys_open fs/open.c:1370 [inline]
 __do_compat_sys_openat fs/open.c:1432 [inline]
 __se_compat_sys_openat fs/open.c:1430 [inline]
 __ia32_compat_sys_openat+0x12d/0x210 fs/open.c:1430
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xe7/0x950 arch/x86/entry/syscall_32.c:307
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e

The buggy address belongs to the object at ffff88804be10000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 3356 bytes inside of
 freed 8192-byte region [ffff88804be10000, ffff88804be12000)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88804be14000 pfn:0x4be10
head: order:3 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x4fff00000000240(workingset|head|node=1|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 04fff00000000240 ffff88801b843180 ffffea00012f7c10 ffffea000132a210
raw: ffff88804be14000 0000000800020001 00000000f5000000 0000000000000000
head: 04fff00000000240 ffff88801b843180 ffffea00012f7c10 ffffea000132a210
head: ffff88804be14000 0000000800020001 00000000f5000000 0000000000000000
head: 04fff00000000003 fffffffffffffe01 00000000ffffffff 00000000ffffffff
head: ffffffffffffffff 0000000000000000 00000000ffffffff 0000000000000008
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 16670, tgid 16669 (syz.3.2439), ts 1231348900296, free_ts 1230410524617
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1858
 prep_new_page mm/page_alloc.c:1866 [inline]
 get_page_from_freelist+0x11a6/0x33b0 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x27c/0x2bc0 mm/page_alloc.c:5226
 alloc_slab_page mm/slub.c:3278 [inline]
 allocate_slab mm/slub.c:3467 [inline]
 new_slab+0xa6/0x6c0 mm/slub.c:3525
 refill_objects+0x277/0x420 mm/slub.c:7272
 refill_sheaf mm/slub.c:2816 [inline]
 __pcs_replace_empty_main+0x375/0x650 mm/slub.c:4652
 alloc_from_pcs mm/slub.c:4750 [inline]
 slab_alloc_node mm/slub.c:4884 [inline]
 __do_kmalloc_node mm/slub.c:5295 [inline]
 __kmalloc_noprof+0x688/0x850 mm/slub.c:5308
 kmalloc_noprof include/linux/slab.h:954 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 snd_seq_oss_readq_new+0x9b/0x290 sound/core/seq/oss/seq_oss_readq.c:41
 snd_seq_oss_open+0x476/0xa10 sound/core/seq/oss/seq_oss_init.c:226
 odev_open+0x6f/0x90 sound/core/seq/oss/seq_oss.c:128
 soundcore_open+0x2e3/0x5a0 sound/sound_core.c:594
 chrdev_open+0x234/0x6a0 fs/char_dev.c:411
 do_dentry_open+0x6d8/0x1660 fs/open.c:947
 vfs_open+0x82/0x3f0 fs/open.c:1079
 do_open fs/namei.c:4699 [inline]
 path_openat+0x208c/0x31a0 fs/namei.c:4858
 do_file_open+0x20e/0x430 fs/namei.c:4887
page last free pid 16136 tgid 16136 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_frozen_pages+0x747/0x1040 mm/page_alloc.c:2943
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x47/0xf0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x1a0/0x1f0 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x69/0x90 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4570 [inline]
 slab_alloc_node mm/slub.c:4899 [inline]
 __do_kmalloc_node mm/slub.c:5295 [inline]
 __kvmalloc_node_noprof+0x316/0xa00 mm/slub.c:6833
 xt_alloc_table_info+0x44/0xa0 net/netfilter/x_tables.c:1286
 compat_do_replace+0x19b/0x500 net/ipv4/netfilter/ip_tables.c:1514
 do_ip6t_set_ctl+0x562/0xb00 net/ipv6/netfilter/ip6_tables.c:1641
 nf_setsockopt+0x8d/0xf0 net/netfilter/nf_sockopt.c:101
 ipv6_setsockopt+0x135/0x170 net/ipv6/ipv6_sockglue.c:970
 tcp_setsockopt+0xa7/0x100 net/ipv4/tcp.c:4182
 do_sock_setsockopt+0xf3/0x1d0 net/socket.c:2381
 __sys_setsockopt+0x119/0x190 net/socket.c:2406
 __do_compat_sys_socketcall net/compat.c:491 [inline]
 __se_compat_sys_socketcall net/compat.c:423 [inline]
 __ia32_compat_sys_socketcall+0x556/0x770 net/compat.c:423
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:83 [inline]
 __do_fast_syscall_32+0xe7/0x950 arch/x86/entry/syscall_32.c:307
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:332

Memory state around the buggy address:
 ffff88804be10c00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88804be10c80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88804be10d00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                            ^
 ffff88804be10d80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88804be10e00: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================
----------------
Code disassembly (best guess):
   0:	d2 74 05 c1          	shlb   %cl,-0x3f(%rbp,%rax,1)
   4:	e8 0c 89 02 8b       	call   0x8b028915
   9:	5d                   	pop    %rbp
   a:	fc                   	cld
   b:	31 c0                	xor    %eax,%eax
   d:	c9                   	leave
   e:	c3                   	ret
   f:	90                   	nop
  10:	90                   	nop
  11:	90                   	nop
  12:	90                   	nop
  13:	90                   	nop
  14:	90                   	nop
  15:	90                   	nop
  16:	90                   	nop
  17:	90                   	nop
  18:	90                   	nop
  19:	90                   	nop
  1a:	90                   	nop
  1b:	90                   	nop
  1c:	90                   	nop
  1d:	90                   	nop
  1e:	0f 1f 00             	nopl   (%rax)
  21:	51                   	push   %rcx
  22:	52                   	push   %rdx
  23:	55                   	push   %rbp
  24:	89 e5                	mov    %esp,%ebp
  26:	0f 34                	sysenter
  28:	cd 80                	int    $0x80
* 2a:	5d                   	pop    %rbp <-- trapping instruction
  2b:	5a                   	pop    %rdx
  2c:	59                   	pop    %rcx
  2d:	c3                   	ret
  2e:	90                   	nop
  2f:	2e 8d b4 26 00 00 00 	cs lea 0x0(%rsi,%riz,1),%esi
  36:	00
  37:	8d b4 26 00 00 00 00 	lea    0x0(%rsi,%riz,1),%esi
  3e:	58                   	pop    %rax
  3f:	b8                   	.byte 0xb8


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
