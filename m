Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89E8937E5D9
	for <driver-core@lists.linux.dev>; Sat,  8 Aug 2026 18:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786212028; cv=none; b=Um3DPP9T66XxKHyS7dvinlDjpC/sbho/ui0ChU6O7rWVCm2VGgzvBGdINEZLe+D+WhST8oVgq7Noxb9BpY1Ry8vZZtb4IkWmSH528rkaFegVxGd+FmkCCRnk0PYyUp/PwYY0aAyx3B71di6BIFPKO79S8riZPodLc59oxACpycM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786212028; c=relaxed/simple;
	bh=bTBN7jJB0j0HTDJHdXkdAYWLGfLK+FGH0s+BjKcAb4o=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=f4il+awHAlPOyAYLTq1G8pdH/OrSIqbXN0n20P/P009Osbl/aeAsYKkyPl2VVR+0CWZz/dkfkB2Ze4aXCawdyUwIUm9VRtyQbutfRU/Aouia8haned29AP1lR1TUVGJGEZNsOZU5x+FEVerwdM7/6yZz6neKpUZVy5dzie+kuks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4b19ce23e5cso204828b6e.1
        for <driver-core@lists.linux.dev>; Sat, 08 Aug 2026 11:00:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786212024; x=1786816824;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x2lWIhQrvQTeEFjZeRdcrbugy5N1hkyNPILt95AflSM=;
        b=Lln++uwfVl7HjM4ZvNjTQSvicZfuuo97YtXg175hGPE8eKbrZEHeOiGOnOVPneULYU
         JGQCEcVL5a/+6vC4ftUCYeWVBVowTrTaRoSlZd+J/KRTIlv2iif17D1z2ELJbGV0J4se
         c+HEo1YEMupjBsvAx4ubusmKDHWJx2SYOP3r1m3BQtHHri7I4bKYjsKObwWwX2a2UbMo
         5VaO64uVDULZn9ypOvBzRE9a06L2W2EZHDwBmUZ20h6dR5PjdOP8DojIZN5c10msvThi
         nigeHl1fpo2+jotXNLxJBmA7tfCUaI6UoyskejyrcSp5PO62gj6ISxdQsFHG8+oK2LDQ
         Opug==
X-Forwarded-Encrypted: i=1; AHgh+RpeiuC1kJXQA4iTCgTOSivqoboFIhM76EUHA75H7LtZ5NCfcPkU8gXb9om1bJtROFHq7cftKus6Afz5jg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVpq9qm6aUnFSbehpxrRJZ6P17vzL5JtztEbwLn4p6VlOgUUyl
	mXkEC0Sqd6pkT00V+l79OiyXRavj/lk9hhZFaSfvU6ErgYSVcAcXOAVRCYLBINn2xBExoNtgD9X
	17tSgWKMnG/KLnuoAvtJDwYejNE/CMzQe07oc6BgoufJgHxgBYlAGP7c2MBE=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:6716:b0:495:f79d:b08e with SMTP id
 5614622812f47-4afae1af074mr18251167b6e.21.1786212023905; Sat, 08 Aug 2026
 11:00:23 -0700 (PDT)
Date: Sat, 08 Aug 2026 11:00:23 -0700
In-Reply-To: <6a6972a5.d9e86bb5.297b12.004f.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a776eb7.9c11d2ce.289b96.00b5.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in
 raw_process_ep_io (2)
From: syzbot <syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    a7c7074b58d2 Merge tag 'fbdev-for-7.2-rc7' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1638bfb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=796ae00d900071fb
dashboard link: https://syzkaller.appspot.com/bug?extid=596b59aea1a9deaaab67
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17d742c6580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com

raw-gadget.0 gadget.0: fail, usb_ep_enable returned -108
raw-gadget.0 gadget.0: fail, usb_ep_enable returned -108
raw-gadget.0 gadget.0: fail, usb_ep_enable returned -108
==================================================================
BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648 [inline]
BUG: KASAN: slab-use-after-free in string+0x471/0x4d0 lib/vsprintf.c:730
Read of size 1 at addr ffff88802c217340 by task syz-executor384/5947

CPU: 1 UID: 0 PID: 5947 Comm: syz-executor384 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 string_nocheck lib/vsprintf.c:648 [inline]
 string+0x471/0x4d0 lib/vsprintf.c:730
 vsnprintf+0x422/0x1300 lib/vsprintf.c:2945
 snprintf+0xc7/0x100 lib/vsprintf.c:3043
 set_dev_info drivers/base/core.c:4984 [inline]
 dev_vprintk_emit+0x375/0x3e0 drivers/base/core.c:4994
 dev_printk_emit+0xd2/0x10d drivers/base/core.c:5007
 __dev_printk+0xcb/0x100 drivers/base/core.c:5019
 _dev_err+0xef/0x127 drivers/base/core.c:5062
 raw_process_ep_io.cold+0x43/0x83 drivers/usb/gadget/legacy/raw_gadget.c:1116
 raw_ioctl_ep_write drivers/usb/gadget/legacy/raw_gadget.c:1153 [inline]
 raw_ioctl+0x25a/0x2b80 drivers/usb/gadget/legacy/raw_gadget.c:1325
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fc86effa5eb
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007ffcab99fea0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007fc86effa5eb
RDX: 00007ffcab99ff14 RSI: 0000000040085507 RDI: 0000000000000003
RBP: 0000000000000004 R08: 0000000000000000 R09: 0000000000000000
R10: 00007ffcab99fec0 R11: 0000000000000246 R12: 0000000000000003
R13: 00007ffcab99ff08 R14: 00007fc86f07dcc0 R15: 0000000000000002
 </TASK>

Allocated by task 1:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5334 [inline]
 __kmalloc_node_track_caller_noprof+0x331/0x830 mm/slub.c:5471
 kvasprintf+0xbc/0x150 lib/kasprintf.c:25
 kvasprintf_const+0x66/0x1a0 lib/kasprintf.c:49
 kobject_set_name_vargs+0x5a/0x140 lib/kobject.c:274
 dev_set_name+0xc7/0x100 drivers/base/core.c:3560
 usb_add_gadget+0x520/0x920 drivers/usb/gadget/udc/core.c:1459
 usb_add_gadget_udc_release drivers/usb/gadget/udc/core.c:1517 [inline]
 usb_add_gadget_udc+0x26/0x70 drivers/usb/gadget/udc/core.c:1564
 dummy_udc_probe+0x69e/0x960 drivers/usb/gadget/udc/dummy_hcd.c:1121
 platform_probe+0x106/0x1d0 drivers/base/platform.c:1439
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 platform_device_add+0x35a/0x800 drivers/base/platform.c:762
 dummy_hcd_init+0x803/0xc00 drivers/usb/gadget/udc/dummy_hcd.c:2894
 do_one_initcall+0x11d/0x700 init/main.c:1347
 do_initcall_level init/main.c:1409 [inline]
 do_initcalls init/main.c:1425 [inline]
 do_basic_setup init/main.c:1445 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1658
 kernel_init+0x1f/0x1e0 init/main.c:1548
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 5947:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2677 [inline]
 slab_free mm/slub.c:6377 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6692
 kfree_const+0x5a/0x70 mm/util.c:46
 kobject_cleanup lib/kobject.c:695 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x218/0x640 lib/kobject.c:737
 put_device+0x1f/0x30 drivers/base/core.c:3880
 platform_remove+0x5f/0x80 drivers/base/platform.c:1456
 device_remove+0xcb/0x180 drivers/base/dd.c:616
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 unbind_store+0xf8/0x110 drivers/base/bus.c:244
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802c217340
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 freed 16-byte region [ffff88802c217340, ffff88802c217350)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2c217
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88801c022640 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 12119187705, free_ts 0
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf48/0x3530 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3266 [inline]
 allocate_slab mm/slub.c:3380 [inline]
 new_slab+0xa2/0x640 mm/slub.c:3426
 refill_objects+0xe3/0x410 mm/slub.c:7310
 refill_sheaf mm/slub.c:2804 [inline]
 __pcs_replace_empty_main+0x376/0x680 mm/slub.c:4675
 alloc_from_pcs mm/slub.c:4773 [inline]
 slab_alloc_node mm/slub.c:4905 [inline]
 __do_kmalloc_node mm/slub.c:5333 [inline]
 __kmalloc_node_track_caller_noprof+0x679/0x830 mm/slub.c:5471
 __kmemdup_nul mm/util.c:64 [inline]
 kstrdup+0x51/0xe0 mm/util.c:84
 kstrdup_const+0x63/0x80 mm/util.c:104
 __kernfs_new_node+0x9b/0xa10 fs/kernfs/dir.c:661
 kernfs_new_node+0x117/0x150 fs/kernfs/dir.c:751
 kernfs_create_link+0xcc/0x240 fs/kernfs/symlink.c:39
 sysfs_do_create_link_sd+0x90/0x140 fs/sysfs/symlink.c:44
 sysfs_do_create_link fs/sysfs/symlink.c:80 [inline]
 sysfs_create_link+0x61/0xc0 fs/sysfs/symlink.c:92
 bus_add_device+0x1f9/0x6c0 drivers/base/bus.c:583
 device_add+0x9d4/0x1970 drivers/base/core.c:3714
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802c217200: 00 04 fc fc 00 04 fc fc 00 04 fc fc 00 04 fc fc
 ffff88802c217280: 00 04 fc fc 00 04 fc fc 00 00 fc fc 00 00 fc fc
>ffff88802c217300: 00 01 fc fc 00 01 fc fc fa fb fc fc 00 04 fc fc
                                           ^
 ffff88802c217380: 00 04 fc fc fa fb fc fc fa fb fc fc 00 04 fc fc
 ffff88802c217400: 00 05 fc fc 00 05 fc fc 00 05 fc fc 00 05 fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
