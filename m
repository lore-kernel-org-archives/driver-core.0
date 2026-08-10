Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321BE2222D0
	for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 00:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786321352; cv=none; b=kIiyMqk/yZEQPbedXeZRRyX/yhFWv9pq/FYJTIrDvAjVMtDTra5kP82p3yCy1jHV+fLXyQzPaCHCVinT/i+4xe0x7PCiR8YIAQ5ZoaGRn1Ng0dLv/NPTnMALQp7HeD9SikR6Y+5ECe2fl7HJ9Bl1KLSvlHYfP/3IYsprVGpetE0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786321352; c=relaxed/simple;
	bh=X3k0W0GohjsLjUpXUxnCVIKPKSnVN57VkAlxGuYlFc0=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qvPP8JCIboX+plaUylSu0gbZOPbiDR1sszA8uHbtATCcXhXRDNozORErN4aAx6urWJ+68tgCVJ8FuLLekovRpVgsFhlnFwXowmugyKeWmcaf75G1iJqV8qZJXruFX+duCLCRy1KM5hv1jOuLNNJUDGLO8AOEWsg103cBArwpzjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a416619e8dso2488742b6e.1
        for <driver-core@lists.linux.dev>; Sun, 09 Aug 2026 17:22:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786321350; x=1786926150;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rajyD8qixus2xucay1Dv+oifmACO6dyX4HcRklTJxBA=;
        b=ojuwigf1hdxYxopggp7mIzS8SnPlRVzhRTfdhvjwerUZDrXLVBu8veCPACX4sU4xiT
         C2SnxpnCfW/T3PaiDn+PpGhfnecN341lG5Nc5fMjYB7OpyC60tqQ0ANN5KaltqAbiza1
         mxMG3iB/SIKefP6H6uvmkyIZSMqWkdtp++oebUeoEg1mHCKLApinP+Y623MzsOZaLwV4
         eIzAN4fnXbJ0GnG1O7RukwpFEUQLpWxU5/Weqp+Nau/2tr1b74rsJ+wU22+ocqhY4kQq
         0Bfie/TjLE3VsGgYQ42P4wMCagNR/AUh02/VvcOxFWOVHosHLaDgZAEyknLqtqpm49ed
         ENEw==
X-Forwarded-Encrypted: i=1; AHgh+Rph6KmKk2u3GPzxMr3YgenHM//eCGt2ssRWP60v9LYb1NrW3VnqvWoF+QnpUcF654878Sks4pZFLccadg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyWULgNRq2Mui1lu83//zfQH1pGE23bqoaGmQ98nNDw9Csc/rE8
	9ssAf2gZt55s4JLUeaD7ZvNuuVyF6BkJ3wAgZdU2wztmGpXM8L8m1bQ6zPzWiuTrAbx+Vg7+ejL
	OdwzZrcOS9MW3qZ4qEVcESHY+p0F2rBF9GlatiQYvTSzS7n2JH5+YE13JIco=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2381:b0:492:c9a4:2104 with SMTP id
 5614622812f47-4b1af83fae5mr7851927b6e.10.1786321350209; Sun, 09 Aug 2026
 17:22:30 -0700 (PDT)
Date: Sun, 09 Aug 2026 17:22:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7919c6.9c11d2ce.289b96.00de.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: slab-use-after-free Write in bus_for_each_drv
From: syzbot <syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1109be32580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cb17729fb04b1e3a
dashboard link: https://syzkaller.appspot.com/bug?extid=9cb1ac7fce4944ba9165
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/375d27e96ecb/disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4ba19a656b9d/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/7c2a17aaee7c/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com

Need at least one configuration in g1.
udc pcspkr: failed to start g1: -22
configfs-gadget.g1 gadget.33: probe with driver configfs-gadget.g1 failed with error -22
==================================================================
BUG: KASAN: slab-use-after-free in knode_set_klist lib/klist.c:60 [inline]
BUG: KASAN: slab-use-after-free in klist_release lib/klist.c:201 [inline]
BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:65 [inline]
BUG: KASAN: slab-use-after-free in klist_dec_and_del+0x386/0x3d0 lib/klist.c:206
Write of size 8 at addr ffff8880329628e0 by task syz.4.45/5977

CPU: 1 UID: 0 PID: 5977 Comm: syz.4.45 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 knode_set_klist lib/klist.c:60 [inline]
 klist_release lib/klist.c:201 [inline]
 kref_put include/linux/kref.h:65 [inline]
 klist_dec_and_del+0x386/0x3d0 lib/klist.c:206
 klist_next+0xc3/0x2f0 lib/klist.c:386
 next_driver drivers/base/bus.c:457 [inline]
 bus_for_each_drv+0x268/0x2f0 drivers/base/bus.c:499
 __device_attach+0x2c7/0x450 drivers/base/dd.c:1098
 device_initial_probe+0xa1/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x12d/0x220 drivers/base/bus.c:620
 device_add+0x7d7/0xb80 drivers/base/core.c:3772
 usb_add_gadget+0x47d/0x700 drivers/usb/gadget/udc/core.c:1461
 usb_add_gadget_udc_release+0x1a4/0x1f0 drivers/usb/gadget/udc/core.c:1517
 vudc_probe+0x89f/0x9d0 drivers/usb/usbip/vudc_dev.c:613
 platform_probe+0xf9/0x190 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 device_driver_attach+0xe0/0x1d0 drivers/base/dd.c:1203
 bind_store+0x1d3/0x220 drivers/base/bus.c:267
 kernfs_fop_write_iter+0x3a5/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fabe65ee019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fabe4846028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007fabe6875fa0 RCX: 00007fabe65ee019
RDX: 0000000000000006 RSI: 0000200000000140 RDI: 0000000000000004
RBP: 00007fabe668500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fabe6876038 R14: 00007fabe6875fa0 R15: 00007ffeb7f127b8
 </TASK>

Allocated by task 5978:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x3d2/0x6b0 mm/slub.c:5489
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 bus_add_driver+0x165/0x670 drivers/base/bus.c:747
 driver_register+0x23a/0x320 drivers/base/driver.c:174
 usb_gadget_register_driver_owner+0xf9/0x270 drivers/usb/gadget/udc/core.c:1752
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5978:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x1c5/0x6c0 mm/slub.c:6692
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x222/0x550 lib/kobject.c:737
 bus_remove_driver+0x248/0x320 drivers/base/bus.c:834
 usb_gadget_register_driver_owner+0x223/0x270 drivers/usb/gadget/udc/core.c:1774
 gadget_dev_desc_UDC_store+0x1c9/0x2f0 drivers/usb/gadget/configfs.c:300
 flush_write_buffer fs/configfs/file.c:207 [inline]
 configfs_write_iter+0x33a/0x430 fs/configfs/file.c:229
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff888032962800
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 224 bytes inside of
 freed 512-byte region [ffff888032962800, ffff888032962a00)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x32960
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ffb2c80 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ffb2c80 dead000000000100 dead000000000122
head: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 0080000000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5832, tgid 5822 (syz.0.1), ts 126620428538, free_ts 125246166491
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0x262a/0x26a0 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x18d/0x380 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab+0x79/0x5e0 mm/slub.c:3380
 new_slab mm/slub.c:3426 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x330/0x690 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __kmalloc_cache_noprof+0x468/0x6b0 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 _kzalloc_noprof include/linux/slab.h:1309 [inline]
 userio_char_open+0x51/0x1b0 drivers/input/serio/userio.c:76
 misc_open+0x2de/0x350 drivers/char/misc.c:163
 chrdev_open+0x4dc/0x600 fs/char_dev.c:411
 do_dentry_open+0x849/0x1420 fs/open.c:947
 vfs_open+0x3b/0x350 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2e60/0x3850 fs/namei.c:4863
 do_file_open+0x23e/0x4a0 fs/namei.c:4892
 do_sys_openat2+0x115/0x200 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1385
page last free pid 4960 tgid 4960 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x10e7/0x11c0 mm/page_alloc.c:2950
 __slab_free+0x252/0x2a0 mm/slub.c:5741
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x99/0x100 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x148/0x160 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x22/0x80 mm/kasan/common.c:350
 kasan_slab_alloc include/linux/kasan.h:253 [inline]
 slab_post_alloc_hook mm/slub.c:4584 [inline]
 slab_alloc_node mm/slub.c:4917 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kmalloc_noprof+0x3b6/0x780 mm/slub.c:5359
 _kmalloc_noprof include/linux/slab.h:992 [inline]
 tomoyo_realpath_from_path+0xef/0x640 security/tomoyo/realpath.c:251
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_check_open_permission+0x229/0x470 security/tomoyo/file.c:776
 security_file_open+0xa9/0x240 security/security.c:2739
 do_dentry_open+0x4be/0x1420 fs/open.c:924
 vfs_open+0x3b/0x350 fs/open.c:1052
 do_open fs/namei.c:4700 [inline]
 path_openat+0x2e60/0x3850 fs/namei.c:4863
 do_file_open+0x23e/0x4a0 fs/namei.c:4892
 do_sys_openat2+0x115/0x200 fs/open.c:1368
 do_sys_open fs/open.c:1374 [inline]
 __do_sys_openat fs/open.c:1390 [inline]
 __se_sys_openat fs/open.c:1385 [inline]
 __x64_sys_openat+0x138/0x170 fs/open.c:1385
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94

Memory state around the buggy address:
 ffff888032962780: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff888032962800: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff888032962880: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                       ^
 ffff888032962900: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff888032962980: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
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
