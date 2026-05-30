Received: from mail-oa1-f78.google.com (mail-oa1-f78.google.com [209.85.160.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12A8E30E853
	for <driver-core@lists.linux.dev>; Sat, 30 May 2026 04:22:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780114948; cv=none; b=AJ8fNSP/UccnhEKaQThy2EvJIXjqUFGV3MELvs+HWvfdwJEd6tXOskjxkV5Lv2JS8KFv9g1ZUnKj5TvJyekibFsru9ENMEEPcVpThG6slVYMVUBrG21/OFdeTaEOV3qNbMJBoAQ8x77xBVN4s6RoIXuIhGWRplBPslRC3jofE6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780114948; c=relaxed/simple;
	bh=5T7G3GR1qSWZ0e7nk6/rE/YyPSEB1jh7+H08lyjeFPc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=aGV58zjK7ZDk+LXtRiPrC8GtSimrBhDrC31+smjdBLtUbCQehJ5j3E/i7PBQhA80duSecd89zXTnI8HrO+E+S+NG3ocxs0qg+oovDAte1gtV2M/sJNcRqyud0j1HFMZa+dx2rGGlWq9/0NS+wwLTMHJpMIvEtftYDwlglHgYRRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f78.google.com with SMTP id 586e51a60fabf-43b6de00772so5874041fac.2
        for <driver-core@lists.linux.dev>; Fri, 29 May 2026 21:22:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780114946; x=1780719746;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=42FlahS2z8NwJPeA6r5cds+zOPSVoF6zNo3GtoWsUEA=;
        b=b4KKVdW5AsoEmO7u8nb6+5WqKDuNlBhqE7kyLNF9fYpHvSFKJ2Jspd9m97pTQIqXtY
         c5hOuJMTPWr2mxS3BKQU3bRiR3APrQXagHliwPgfliS0Hz6L7whHIyQGfdNvdmgEnH/T
         ARUM260xMmU5jDfvmaFHOaL/UshS/4N521KmryuoyG4qPg4tHWc+lqLNJhF0Ci9Hg0iv
         zZBtuC3cIYszWtWGLUxA2gHurKCoTNAhARl8HKGbviU40ONqx2/fLB3yqtBkJcNYX4Vw
         Esg7eTO8gcKYTPmRXhklEA2TvSqbVlJI5kw+D7tZANqzAjosUf75jQ7Koi5nECjtZqyp
         QGbw==
X-Gm-Message-State: AOJu0YxVmqAceycw0votpUWQhPf57ajSKem9TFEnaADmZ4CfRtnn7dtP
	5zKiKlk/9pt3lds/Ty0FVRP4cYsc+S2bElmmk14EaBnolQlVk9lXpZqL1XtmYC5TSOM9j/gafjz
	567Sdm2/ELXkUVi0Z3iOCZe/wAGOXIYpOUl9C5KsN7sSHGIFig0DM4JWDizcmEg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:80f:b0:694:8c46:e2c3 with SMTP id
 006d021491bc7-69e102c577emr1135765eaf.14.1780114946087; Fri, 29 May 2026
 21:22:26 -0700 (PDT)
Date: Fri, 29 May 2026 21:22:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1a6602.90e69d94.13836c.0003.GAE@google.com>
Subject: [syzbot] [kernfs?] KASAN: slab-use-after-free Read in kernfs_new_node (2)
From: syzbot <syzbot+0434f69906e203124893@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    50897c955902 Merge tag 'linux_kselftest-kunit-fixes-7.1-rc..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a55a73980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4caf64b1ee83dac0
dashboard link: https://syzkaller.appspot.com/bug?extid=0434f69906e203124893
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d355219374fc/disk-50897c95.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f56e3adc859c/vmlinux-50897c95.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ee5374f3e5e8/bzImage-50897c95.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0434f69906e203124893@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in instrument_atomic_read include/linux/instrumented.h:82 [inline]
BUG: KASAN: slab-use-after-free in atomic_read include/linux/atomic/atomic-instrumented.h:32 [inline]
BUG: KASAN: slab-use-after-free in kernfs_get fs/kernfs/dir.c:560 [inline]
BUG: KASAN: slab-use-after-free in kernfs_new_node+0x120/0x210 fs/kernfs/dir.c:751
Read of size 4 at addr ffff888078525a50 by task kworker/0:7/5725

CPU: 0 UID: 0 PID: 5725 Comm: kworker/0:7 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
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
 kernfs_new_node+0x120/0x210 fs/kernfs/dir.c:751
 kernfs_create_dir_ns+0x44/0x130 fs/kernfs/dir.c:1121
 sysfs_create_dir_ns+0x12f/0x2a0 fs/sysfs/dir.c:59
 create_dir lib/kobject.c:73 [inline]
 kobject_add_internal+0x62b/0xd00 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_add+0x163/0x240 lib/kobject.c:426
 class_dir_create_and_add drivers/base/core.c:3234 [inline]
 get_device_parent+0x316/0x3a0 drivers/base/core.c:3285
 device_add+0x2e1/0xbb0 drivers/base/core.c:3615
 fw_load_sysfs_fallback drivers/base/firmware_loader/fallback.c:86 [inline]
 fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:162 [inline]
 firmware_fallback_sysfs+0x2e4/0xa30 drivers/base/firmware_loader/fallback.c:238
 _request_firmware+0x1052/0x1780 drivers/base/firmware_loader/main.c:898
 request_firmware_work_func+0xaf/0x1c0 drivers/base/firmware_loader/main.c:1150
 process_one_work kernel/workqueue.c:3302 [inline]
 process_scheduled_works+0xb5d/0x1860 kernel/workqueue.c:3385
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3466
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 25955:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 unpoison_slab_object mm/kasan/common.c:340 [inline]
 __kasan_slab_alloc+0x6c/0x80 mm/kasan/common.c:366
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4569 [inline]
 slab_alloc_node mm/slub.c:4898 [inline]
 kmem_cache_alloc_noprof+0x2bc/0x650 mm/slub.c:4905
 __kernfs_new_node+0xea/0x970 fs/kernfs/dir.c:664
 kernfs_new_node+0x102/0x210 fs/kernfs/dir.c:748
 kernfs_create_dir_ns+0x44/0x130 fs/kernfs/dir.c:1121
 sysfs_create_dir_ns+0x12f/0x2a0 fs/sysfs/dir.c:59
 create_dir lib/kobject.c:73 [inline]
 kobject_add_internal+0x62b/0xd00 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_add+0x163/0x240 lib/kobject.c:426
 device_add+0x408/0xbb0 drivers/base/core.c:3629
 usb_new_device+0xa08/0x16f0 drivers/usb/core/hub.c:2695
 hub_port_connect drivers/usb/core/hub.c:5567 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x2a1c/0x4f30 drivers/usb/core/hub.c:5953
 process_one_work kernel/workqueue.c:3302 [inline]
 process_scheduled_works+0xb5d/0x1860 kernel/workqueue.c:3385
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3466
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 15:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2689 [inline]
 slab_free mm/slub.c:6250 [inline]
 kmem_cache_free+0x182/0x650 mm/slub.c:6377
 rcu_do_batch kernel/rcu/tree.c:2617 [inline]
 rcu_core+0x7cd/0x1070 kernel/rcu/tree.c:2869
 handle_softirqs+0x22a/0x840 kernel/softirq.c:622
 run_ksoftirqd+0x36/0x60 kernel/softirq.c:1076
 smpboot_thread_fn+0x541/0xa50 kernel/smpboot.c:160
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Last potentially related work creation:
 kasan_save_stack+0x3e/0x60 mm/kasan/common.c:57
 kasan_record_aux_stack+0xbd/0xd0 mm/kasan/generic.c:556
 __call_rcu_common kernel/rcu/tree.c:3131 [inline]
 call_rcu+0xee/0x890 kernel/rcu/tree.c:3251
 kernfs_put+0x259/0x520 fs/kernfs/dir.c:618
 evict+0x61e/0xb10 fs/inode.c:841
 __dentry_kill+0x1a2/0x690 fs/dcache.c:718
 finish_dput+0xc9/0x480 fs/dcache.c:927
 lookup_fast+0x3cb/0x5b0 fs/namei.c:1881
 walk_component fs/namei.c:2274 [inline]
 link_path_walk+0x720/0x18d0 fs/namei.c:2652
 path_openat+0x2c3/0x3860 fs/namei.c:4854
 do_file_open+0x23e/0x4a0 fs/namei.c:4887
 do_sys_openat2+0x113/0x200 fs/open.c:1364
 do_sys_open fs/open.c:1370 [inline]
 __do_sys_openat fs/open.c:1386 [inline]
 __se_sys_openat fs/open.c:1381 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1381
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x15f/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888078525a50
 which belongs to the cache kernfs_node_cache of size 176
The buggy address is located 0 bytes inside of
 freed 176-byte region [ffff888078525a50, ffff888078525b00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x78525
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff888140413b40 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800110011 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5892, tgid 5889 (syz.3.55), ts 105755077984, free_ts 105438971984
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x231/0x280 mm/page_alloc.c:1858
 prep_new_page mm/page_alloc.c:1866 [inline]
 get_page_from_freelist+0x24ba/0x2540 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5226
 alloc_slab_page mm/slub.c:3278 [inline]
 allocate_slab+0x77/0x660 mm/slub.c:3467
 new_slab mm/slub.c:3525 [inline]
 refill_objects+0x339/0x3d0 mm/slub.c:7255
 refill_sheaf mm/slub.c:2816 [inline]
 __pcs_replace_empty_main+0x321/0x720 mm/slub.c:4651
 alloc_from_pcs mm/slub.c:4749 [inline]
 slab_alloc_node mm/slub.c:4883 [inline]
 kmem_cache_alloc_noprof+0x37d/0x650 mm/slub.c:4905
 __kernfs_new_node+0xea/0x970 fs/kernfs/dir.c:664
 kernfs_new_node+0x102/0x210 fs/kernfs/dir.c:748
 __kernfs_create_file+0x4b/0x2e0 fs/kernfs/file.c:1057
 sysfs_add_file_mode_ns+0x238/0x300 fs/sysfs/file.c:313
 create_files fs/sysfs/group.c:82 [inline]
 internal_create_group+0x673/0x1180 fs/sysfs/group.c:189
 internal_create_groups fs/sysfs/group.c:229 [inline]
 sysfs_create_groups+0x59/0x120 fs/sysfs/group.c:255
 device_add_groups drivers/base/core.c:2837 [inline]
 device_add_attrs+0x1bf/0x5b0 drivers/base/core.c:2912
 device_add+0x496/0xbb0 drivers/base/core.c:3645
 netdev_register_kobject+0x178/0x310 net/core/net-sysfs.c:2343
page last free pid 5634 tgid 5634 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1402 [inline]
 __free_frozen_pages+0xbc7/0xd30 mm/page_alloc.c:2943
 __slab_free+0x274/0x2c0 mm/slub.c:5612
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4569 [inline]
 slab_alloc_node mm/slub.c:4898 [inline]
 __do_kmalloc_node mm/slub.c:5294 [inline]
 __kmalloc_noprof+0x316/0x760 mm/slub.c:5307
 kmalloc_noprof include/linux/slab.h:954 [inline]
 kzalloc_noprof include/linux/slab.h:1188 [inline]
 tomoyo_encode2 security/tomoyo/realpath.c:45 [inline]
 tomoyo_encode+0x28b/0x550 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x58d/0x5d0 security/tomoyo/realpath.c:283
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x229/0x470 security/tomoyo/file.c:776
 security_file_open+0xa9/0x240 security/security.c:2739
 do_dentry_open+0x384/0x14e0 fs/open.c:924
 vfs_open+0x3b/0x340 fs/open.c:1079
 do_open fs/namei.c:4699 [inline]
 path_openat+0x2e08/0x3860 fs/namei.c:4858
 do_file_open+0x23e/0x4a0 fs/namei.c:4887
 do_sys_openat2+0x113/0x200 fs/open.c:1364
 do_sys_open fs/open.c:1370 [inline]
 __do_sys_openat fs/open.c:1386 [inline]
 __se_sys_openat fs/open.c:1381 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1381

Memory state around the buggy address:
 ffff888078525900: fb fb fb fb fc fc fc fc fc fc fc fc 00 00 00 00
 ffff888078525980: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff888078525a00: 00 00 fc fc fc fc fc fc fc fc fa fb fb fb fb fb
                                                 ^
 ffff888078525a80: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888078525b00: fc fc fc fc fc fc fc fc 00 00 00 00 00 00 00 00
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
