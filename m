Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EAA58632B
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 00:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783469249; cv=none; b=KwPsF0uT5DEHHmO+oqX1Q3NGHGA+PLRrT1Eg0WCqfAux5VUwqWXh2n9HhaokTziiMxLrNYBnKEWEI50od3D4NMW1ovkdJsv5vO42UOGu5T9xb6vhIfpLhnKPjYw7g09EJAJTOIwJonYxecaIM5nTkXU8XXXH/4zn2ANXuYtFR/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783469249; c=relaxed/simple;
	bh=hRVTaqV7IFkG8iYkyaLF1pb3XueR/oVFJP+zP4x0Go0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=VO4NmBjAdARZX5K1DQ1HB7QHlqGzxWLo6rqBZnUWHjS0dUW2d/pl1xctvRTBC3tp2r3Jyrz0cg33vlHNNRt147nPScLaMvNo54TIV+KXJGsjr7idqmO/tCsJ+N64NF/IpjKuoRLX7QEODaG6DXIXWMTLSLXQRdvpTxZQn8zX4vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-48f680bda84so224138b6e.1
        for <driver-core@lists.linux.dev>; Tue, 07 Jul 2026 17:07:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783469241; x=1784074041;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SGGxjstucQLMLosSH6c+Jj3dXhkAS/EZBfAWGxs2VBQ=;
        b=j7yWv26fFh++KJjihFcrt1e5CRBoGExovtT8ztNJHdf1sDyKv9rCuGMu2b03EvzQ6X
         Z3Mu3JtuF9o08ByroMJhugaR0ru0p/8UGuGz8jKAaA4XU9BS+aB1IQih4yYqXZXOyi/9
         REIharENGt60GWMjhQ6/VPIs+muEEuhP1ZZ0Y7dW6uDbwCMUkw1dRsWomiYlYdKde8V1
         T9AlqKOuIWYVAcIGEVRgYGH8oU1ayxvrVarrersAHUY2CzA3xBWLv0glcx2gRs99hMY6
         vFLk8LkbXCtVm8WLtC3nKaS6U+gEPDrr6J2HfaSAQxdVIizDRsJ642FFqV81Vgi7nA3G
         x1pA==
X-Gm-Message-State: AOJu0YzrgxkEHayL1+L/i3pyVISXqLhqqJFUhQ7+Vqve221uml5mgi6k
	jl9hrG2R8Sze7d4RtxpSyM6e5zp65xTQNvtLl9argQgrClzuNglCb9Ew3F4iMK2qpPyTtJ41g5o
	dCuRrKo9a/OCV0Ni8HiJDqLZYYivCfKok3pVbD18vCHmOuMxT2qOIwkS8DApduw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4706:b0:49e:d43f:1b93 with SMTP id
 5614622812f47-4a2021fa2e1mr121247b6e.13.1783469240942; Tue, 07 Jul 2026
 17:07:20 -0700 (PDT)
Date: Tue, 07 Jul 2026 17:07:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a4d94b8.c76b52dc.34afef.0015.GAE@google.com>
Subject: [syzbot] [kernfs?] KASAN: slab-use-after-free Read in kernfs_get (4)
From: syzbot <syzbot+61d22228f1d777d4a5c1@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d2c9a99135da Merge tag 'device-id-rework' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16dd80d6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5c4196ba0e33631d
dashboard link: https://syzkaller.appspot.com/bug?extid=61d22228f1d777d4a5c1
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/cb55a636c1b2/disk-d2c9a991.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e4bdf13aafbf/vmlinux-d2c9a991.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8388280f1b6e/bzImage-d2c9a991.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+61d22228f1d777d4a5c1@syzkaller.appspotmail.com

usb 4-1: Direct firmware load for ueagle-atm/eagleI.fw failed with error -2
usb 4-1: Falling back to sysfs fallback for: ueagle-atm/eagleI.fw
==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read include/linux/instrumented.h:82 [inline]
BUG: KASAN: slab-use-after-free in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
BUG: KASAN: slab-use-after-free in kernfs_get+0x20/0x90 fs/kernfs/dir.c:560
Read of size 4 at addr ffff8880338825a0 by task kworker/0:0/9

CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/09/2026
Workqueue: events request_firmware_work_func
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 check_region_inline mm/kasan/generic.c:-1 [inline]
 kasan_check_range+0x264/0x2c0 mm/kasan/generic.c:200
 instrument_atomic_read include/linux/instrumented.h:82 [inline]
 atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
 kernfs_get+0x20/0x90 fs/kernfs/dir.c:560
 sysfs_get include/linux/sysfs.h:802 [inline]
 create_dir lib/kobject.c:89 [inline]
 kobject_add_internal+0x6b9/0xcd0 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_add+0x163/0x240 lib/kobject.c:426
 class_dir_create_and_add drivers/base/core.c:3300 [inline]
 get_device_parent+0x316/0x3a0 drivers/base/core.c:3351
 device_add+0x2d4/0xb80 drivers/base/core.c:3681
 fw_load_sysfs_fallback drivers/base/firmware_loader/fallback.c:86 [inline]
 fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:162 [inline]
 firmware_fallback_sysfs+0x2dd/0xa40 drivers/base/firmware_loader/fallback.c:238
 _request_firmware+0x1049/0x1780 drivers/base/firmware_loader/main.c:898
 request_firmware_work_func+0xac/0x2d0 drivers/base/firmware_loader/main.c:1162
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 9:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:340 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:366
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4612 [inline]
 slab_alloc_node mm/slub.c:4945 [inline]
 kmem_cache_alloc_noprof+0x2a0/0x5f0 mm/slub.c:4959
 __kernfs_new_node+0xe6/0x980 fs/kernfs/dir.c:665
 kernfs_new_node fs/kernfs/dir.c:751 [inline]
 kernfs_create_dir_ns+0xfe/0x230 fs/kernfs/dir.c:1120
 sysfs_create_dir_ns+0x12f/0x2a0 fs/sysfs/dir.c:59
 create_dir lib/kobject.c:73 [inline]
 kobject_add_internal+0x622/0xcd0 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_add+0x163/0x240 lib/kobject.c:426
 class_dir_create_and_add drivers/base/core.c:3300 [inline]
 get_device_parent+0x316/0x3a0 drivers/base/core.c:3351
 device_add+0x2d4/0xb80 drivers/base/core.c:3681
 fw_load_sysfs_fallback drivers/base/firmware_loader/fallback.c:86 [inline]
 fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:162 [inline]
 firmware_fallback_sysfs+0x2dd/0xa40 drivers/base/firmware_loader/fallback.c:238
 _request_firmware+0x1049/0x1780 drivers/base/firmware_loader/main.c:898
 request_firmware_work_func+0xac/0x2d0 drivers/base/firmware_loader/main.c:1162
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 15:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2705 [inline]
 slab_free mm/slub.c:6405 [inline]
 kmem_cache_free+0x182/0x650 mm/slub.c:6532
 rcu_do_batch kernel/rcu/tree.c:2645 [inline]
 rcu_core+0x78b/0x10a0 kernel/rcu/tree.c:2897
 handle_softirqs+0x225/0x840 kernel/softirq.c:622
 run_ksoftirqd+0x36/0x60 kernel/softirq.c:1076
 smpboot_thread_fn+0x57c/0xa80 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:57
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
 __call_rcu_common kernel/rcu/tree.c:3159 [inline]
 call_rcu+0xee/0x8b0 kernel/rcu/tree.c:3279
 kernfs_put+0x622/0x820 fs/kernfs/dir.c:618
 __kernfs_remove+0x69a/0x8e0 fs/kernfs/dir.c:1603
 kernfs_remove+0x4c/0x80 fs/kernfs/dir.c:1624
 __kobject_del+0xe0/0x310 lib/kobject.c:604
 kobject_del+0x45/0x60 lib/kobject.c:627
 device_del+0x772/0x8f0 drivers/base/core.c:3981
 usb_disconnect+0x630/0x9a0 drivers/usb/core/hub.c:2376
 hub_port_connect drivers/usb/core/hub.c:5407 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1bbb/0x4d30 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3322 [inline]
 process_scheduled_works+0xa8e/0x14e0 kernel/workqueue.c:3405
 worker_thread+0xa47/0xfb0 kernel/workqueue.c:3486
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880338825a0
 which belongs to the cache kernfs_node_cache of size 176
The buggy address is located 0 bytes inside of
 freed 176-byte region [ffff8880338825a0, ffff888033882650)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x33882
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff888140415280 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800110011 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 8130, tgid 8129 (syz.0.763), ts 244206391995, free_ts 244188026758
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x21fa/0x2270 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3294 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3408
 new_slab mm/slub.c:3454 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7338
 refill_sheaf mm/slub.c:2832 [inline]
 __pcs_replace_empty_main+0x2bf/0x6b0 mm/slub.c:4703
 alloc_from_pcs mm/slub.c:4801 [inline]
 slab_alloc_node mm/slub.c:4933 [inline]
 kmem_cache_alloc_noprof+0x382/0x5f0 mm/slub.c:4959
 __kernfs_new_node+0xe6/0x980 fs/kernfs/dir.c:665
 kernfs_new_node fs/kernfs/dir.c:751 [inline]
 kernfs_create_dir_ns+0xfe/0x230 fs/kernfs/dir.c:1120
 sysfs_create_dir_ns+0x12f/0x2a0 fs/sysfs/dir.c:59
 create_dir lib/kobject.c:73 [inline]
 kobject_add_internal+0x622/0xcd0 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_init_and_add+0x12b/0x1a0 lib/kobject.c:457
 rx_queue_add_kobject net/core/net-sysfs.c:1239 [inline]
 net_rx_queue_update_kobjects+0x247/0x780 net/core/net-sysfs.c:1301
 register_queue_kobjects net/core/net-sysfs.c:2093 [inline]
 netdev_register_kobject+0x21f/0x310 net/core/net-sysfs.c:2341
 register_netdevice+0x1433/0x1eb0 net/core/dev.c:11440
 register_netdev+0x40/0x60 net/core/dev.c:11556
page last free pid 23 tgid 23 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0xc1e/0xd10 mm/page_alloc.c:2950
 __tlb_remove_table_free mm/mmu_gather.c:228 [inline]
 tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:291
 rcu_do_batch kernel/rcu/tree.c:2645 [inline]
 rcu_core+0x78b/0x10a0 kernel/rcu/tree.c:2897
 handle_softirqs+0x225/0x840 kernel/softirq.c:622
 run_ksoftirqd+0x36/0x60 kernel/softirq.c:1076
 smpboot_thread_fn+0x57c/0xa80 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff888033882480: fc fc fc fc fc fc fa fb fb fb fb fb fb fb fb fb
 ffff888033882500: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
>ffff888033882580: fc fc fc fc fa fb fb fb fb fb fb fb fb fb fb fb
                               ^
 ffff888033882600: fb fb fb fb fb fb fb fb fb fb fc fc fc fc fc fc
 ffff888033882680: fc fc fa fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


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
