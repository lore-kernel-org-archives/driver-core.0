Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7181B3750C9
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 13:11:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781615485; cv=none; b=OrdkTrl7RbZE2sHc+SK9YxuWRm3K6vuEzEZEcgPER5hX/+W8bk/ZFLgH7HdJJnUQzdQ7wdJLJW4KZaF4y6gHHg7OH7UVbcGTMKx2tiPb775BpG9quqoehEuOwh7hJH2xym4CloaSpQyrVUE3fXZJf7rLJtxOVCE+yge9DFNSn2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781615485; c=relaxed/simple;
	bh=alJW6XhVSirhPZ/H3PJo7Nvd8OtUHJhcRNq6fxhNmdM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=KkBdqMYXBNPcgzdzkES1DMq0MZPKhUFEmToWI5ehE0ERk1UeM3a/OJxh3x3w5H57UA2ZgxfPGExE/yVX6ZrelydhWd+DqbDx0po3C0TQ9ZlNpiQm0kOx0bRqOTQahhq8X4vo2x5DDGZESwMjy5oa/9JPuBe/iUTjf7xiAuqSFJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-48576b309c7so7445032b6e.3
        for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 06:11:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781615482; x=1782220282;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ub33rFvLBxWpib3Zjk9R2ZFWMkX2KPqubvuFRAc1QCk=;
        b=pxETylQZGfJ/3Zr+s0cpADAVTwIu/NpGe5V4tV2fU3t9c6ZVSKCIVyCE4VfOVYp+Xd
         Iwi72ZNdNAcjFYZBhKvFbvg7NEfh8OqvYHDXfYyJFe/FcYZe0dsRrtrJCZjYvwwHFR9O
         iKT/P+dP0chaWhbD/yRBpiwCzdwIpkxuwZkrLCNmlADuYqJjo9LjJ8tim1pTVMtcLNJG
         no3oJyohMMIIURDO+TviZQciPmVyRbXFjR4eRbu7RRKnJujD5BGtPOa1uLr9+dldU+Yq
         Xd+2ybH6kJkpr7datIPlr742ZZkiYVcBBleGBA4ZoE0XxBDwS9PLjNETijcJ2x44/jry
         PgBQ==
X-Gm-Message-State: AOJu0YzP1W0VLAsKM9MmGFK/YsCAUmDzZtDK1IE2KaFGkJ8gcNhdKrqB
	SZtLYq4o2U1sytHS4CgsHEyvVb2G2foBY1ZrCO9NyUTkXO0g8mFGHKRYsHWCNiHJZAz05ILT4zU
	cK1bIX6DSQkwqY8/fDptKMyMLKaco/hUWQjuHC9EJ3Y3thNhG8jCQm3xIoUHcbQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1687:b0:487:4ca0:5b0f with SMTP id
 5614622812f47-4884c115328mr2594981b6e.28.1781615482389; Tue, 16 Jun 2026
 06:11:22 -0700 (PDT)
Date: Tue, 16 Jun 2026 06:11:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a314b7a.4e5c5b30.28fae3.0002.GAE@google.com>
Subject: [syzbot] [kernfs?] KASAN: slab-use-after-free Read in __kernfs_new_node
From: syzbot <syzbot+3942dc5563ea8b96bbbe@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    c425609d6ac4 Add linux-next specific files for 20260612
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=171a0bd2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d7a56b1e89b63439
dashboard link: https://syzkaller.appspot.com/bug?extid=3942dc5563ea8b96bbbe
compiler:       Debian clang version 22.1.6 (++20260514074242+fc4aad7b5db3-1~exp1~20260514074407.73), Debian LLD 22.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7fab9a8df61a/disk-c425609d.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c2577196651b/vmlinux-c425609d.xz
kernel image: https://storage.googleapis.com/syzbot-assets/053557a7471e/bzImage-c425609d.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3942dc5563ea8b96bbbe@syzkaller.appspotmail.com

=========================================[  553.259716][   T10] ==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read include/linux/instrumented.h:82 [inline]
BUG: KASAN: slab-use-after-free in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
BUG: KASAN: slab-use-after-free in kernfs_get fs/kernfs/dir.c:560 [inline]
BUG: KASAN: slab-use-after-free in __kernfs_new_node+0x563/0xa70 fs/kernfs/dir.c:704
Read of size 4 at addr ffff88802991b4b0 by task kworker/0:1/10

CPU: 0 UID: 0 PID: 10 Comm: kworker/0:1 Tainted: G             L      syzkaller #0 PREEMPT_{RT,(full)} 
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
 kernfs_get fs/kernfs/dir.c:560 [inline]
 __kernfs_new_node+0x563/0xa70 fs/kernfs/dir.c:704
 kernfs_new_node fs/kernfs/dir.c:751 [inline]
 kernfs_create_dir_ns+0xfe/0x230 fs/kernfs/dir.c:1120
 sysfs_create_dir_ns+0x12f/0x2a0 fs/sysfs/dir.c:59
 create_dir lib/kobject.c:73 [inline]
 kobject_add_internal+0x62c/0xce0 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_add+0x163/0x240 lib/kobject.c:426
 class_dir_create_and_add drivers/base/core.c:3300 [inline]
 get_device_parent+0x31d/0x3a0 drivers/base/core.c:3351
 device_add+0x2d4/0xb80 drivers/base/core.c:3681
 fw_load_sysfs_fallback drivers/base/firmware_loader/fallback.c:86 [inline]
 fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:162 [inline]
 firmware_fallback_sysfs+0x2dd/0xa40 drivers/base/firmware_loader/fallback.c:238
 _request_firmware+0x1049/0x1780 drivers/base/firmware_loader/main.c:898
 request_firmware_work_func+0xac/0x2d0 drivers/base/firmware_loader/main.c:1162
 process_one_work+0x93a/0x12b0 kernel/workqueue.c:3326
 process_scheduled_works kernel/workqueue.c:3409 [inline]
 worker_thread+0xb05/0x10d0 kernel/workqueue.c:3490
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 5753:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:340 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:366
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4610 [inline]
 slab_alloc_node mm/slub.c:4943 [inline]
 kmem_cache_alloc_noprof+0x348/0x6b0 mm/slub.c:4957
 __kernfs_new_node+0xe7/0xa70 fs/kernfs/dir.c:665
 kernfs_new_node fs/kernfs/dir.c:751 [inline]
 kernfs_create_dir_ns+0xfe/0x230 fs/kernfs/dir.c:1120
 sysfs_create_dir_ns+0x12f/0x2a0 fs/sysfs/dir.c:59
 create_dir lib/kobject.c:73 [inline]
 kobject_add_internal+0x62c/0xce0 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_add+0x163/0x240 lib/kobject.c:426
 device_add+0x3fa/0xb80 drivers/base/core.c:3695
 usb_new_device+0x98d/0x1610 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x28cf/0x4cf0 drivers/usb/core/hub.c:5953
 process_one_work+0x93a/0x12b0 kernel/workqueue.c:3326
 process_scheduled_works kernel/workqueue.c:3409 [inline]
 worker_thread+0xb05/0x10d0 kernel/workqueue.c:3490
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 29:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2703 [inline]
 slab_free mm/slub.c:6402 [inline]
 kmem_cache_free+0x187/0x6c0 mm/slub.c:6529
 rcu_do_batch kernel/rcu/tree.c:2645 [inline]
 rcu_core kernel/rcu/tree.c:2897 [inline]
 rcu_cpu_kthread+0x950/0x1480 kernel/rcu/tree.c:2985
 smpboot_thread_fn+0x57c/0xa80 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:57
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
 __call_rcu_common kernel/rcu/tree.c:3159 [inline]
 call_rcu+0xee/0x8b0 kernel/rcu/tree.c:3279
 kernfs_put+0x625/0x820 fs/kernfs/dir.c:618
 evict+0x624/0xb50 fs/inode.c:825
 dentry_kill+0x1b9/0x880 fs/dcache.c:826
 finish_dput+0x1a/0x260 fs/dcache.c:1001
 lookup_fast+0x3d0/0x5d0 fs/namei.c:1886
 walk_component fs/namei.c:2278 [inline]
 link_path_walk+0x71f/0x1910 fs/namei.c:2656
 path_openat+0x23c/0x3850 fs/namei.c:4855
 do_file_open+0x23e/0x4a0 fs/namei.c:4888
 do_sys_openat2+0x115/0x200 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802991b4b0
 which belongs to the cache kernfs_node_cache of size 176
The buggy address is located 0 bytes inside of
 freed 176-byte region [ffff88802991b4b0, ffff88802991b560)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2991b
flags: 0x80000000000000(node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000000 ffff88801be88b40 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800110011 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 9436, tgid 9436 (syz-executor), ts 355931337322, free_ts 355813181360
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x2639/0x26b0 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3292 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3406
 new_slab mm/slub.c:3452 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7335
 refill_sheaf mm/slub.c:2830 [inline]
 __pcs_replace_empty_main+0x330/0x690 mm/slub.c:4701
 alloc_from_pcs mm/slub.c:4799 [inline]
 slab_alloc_node mm/slub.c:4931 [inline]
 kmem_cache_alloc_noprof+0x465/0x6b0 mm/slub.c:4957
 __kernfs_new_node+0xe7/0xa70 fs/kernfs/dir.c:665
 kernfs_new_node+0xea/0x140 fs/kernfs/dir.c:751
 __kernfs_create_file+0x4b/0x2e0 fs/kernfs/file.c:1050
 sysfs_add_file_mode_ns+0x237/0x300 fs/sysfs/file.c:316
 create_files fs/sysfs/group.c:82 [inline]
 internal_create_group+0x679/0x1180 fs/sysfs/group.c:189
 internal_create_groups fs/sysfs/group.c:229 [inline]
 sysfs_create_groups+0x59/0x120 fs/sysfs/group.c:255
 netdev_queue_add_kobject net/core/net-sysfs.c:1982 [inline]
 netdev_queue_update_kobjects+0x2a4/0x6b0 net/core/net-sysfs.c:2035
 register_queue_kobjects net/core/net-sysfs.c:2098 [inline]
 netdev_register_kobject+0x258/0x310 net/core/net-sysfs.c:2341
 register_netdevice+0x1455/0x1ed0 net/core/dev.c:11437
page last free pid 21 tgid 21 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x10de/0x11c0 mm/page_alloc.c:2950
 __tlb_remove_table_free mm/mmu_gather.c:228 [inline]
 tlb_remove_table_rcu+0x85/0x100 mm/mmu_gather.c:291
 rcu_do_batch kernel/rcu/tree.c:2645 [inline]
 rcu_core kernel/rcu/tree.c:2897 [inline]
 rcu_cpu_kthread+0x950/0x1480 kernel/rcu/tree.c:2985
 smpboot_thread_fn+0x57c/0xa80 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Memory state around the buggy address:
 ffff88802991b380: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
 ffff88802991b400: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc
>ffff88802991b480: fc fc fc fc fc fc fa fb fb fb fb fb fb fb fb fb
                                     ^
 ffff88802991b500: fb fb fb fb fb fb fb fb fb fb fb fb fc fc fc fc
 ffff88802991b580: fc fc fc fc 00 00 00 00 00 00 00 00 00 00 00 00
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
