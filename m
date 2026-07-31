Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B1C32EB874
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 01:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785461742; cv=none; b=rkRZxopgGx+kLSTSPtuwf3MXR939YJQN06O4eRZw8kpysCvVs15xBM9WI4BSMtuKwqEKNuPE4+tTF3GhW0ocVobB3hKyIdEbiZI05V1BHhm2ksGC3PNgosmakpdLHgnf3fh9qpO1tsXv44tQxCBZPJEqR49eIciELO+/+XlmWlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785461742; c=relaxed/simple;
	bh=eSpxb4pxm5qAGK2TGdMUYWeS1d76pVMBtFwE7eehSzY=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=GP2qAkEQ8he/MNAw1XAHRMXPgpwqUgFRSGpZVYxHeOTf7uIbC99vi+oce8/FKJRrKY3FFztc1Lqc1YyRp7J9zJou80shQC5wpNiI86Jps0eQ8YeE6N4ZBJs3TKETg2oH7YOLBo87x8bB1RcVBL8b3j1gs7tTSCfXjaJ6LDVlzak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4a41f46d629so642877b6e.3
        for <driver-core@lists.linux.dev>; Thu, 30 Jul 2026 18:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785461739; x=1786066539;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QwlWcgkEqR+3C090wQuoiMqnwDPz9M68QVdov0+/g7g=;
        b=Jhd8FEcrF/lv5YR7oLv4IWKBk0AKn6Q4VgNjZBWkTdhJDrJeDb8GIBDFxsk15x+iFu
         waSEdYf3s/INkIIFdq5TyCiYBq0Md6OzVntdJV7xvu1cUWtGumKSWJZcFHl9Rs0xnz47
         3SiFFtgeB8xFnVeCxtz8vXgyWYXldofberO1+DIrX2o9XFxSpNoh392hCCIa6EjCqMtM
         ziYpOQ3jQ8Xpiohf9hJN93ENGaCdr+Xx1gHB1EHV+QLUGlYvp/TiiPkshoZFgsHkjLMb
         Y8jjO91C/jfcwEwSgvSwmPSmToqz+3xuhYUOec1t8++IQHYI8c6LnbovkiZZzYCwWwHy
         PLOw==
X-Forwarded-Encrypted: i=1; AHgh+RoWEJ+YOaquCHfaf0sJ7MNUmTJMmCGA+jnQvLlAXgYIAAyEVx/Nohg51Z0gcJG+je+UG8V5yFLnJHX08Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YzAFmz7YW6mNHGJVsG5/PnlcqsbLWavuiMjgrQ3nySqMLSWvvQT
	WmxfVU7OHnYn5Bx07CzVG5qFczijsMn+3CSgtqo1is7O4uZ0ypQJh3r63tMA5iXfH0f2df1Yzui
	QZ9KAH3HThMEd6yMUkZ53q/4lWVIgbNE7YD4ct82F8EVbeKDh6qnzVaXFjbM=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:509e:b0:4a4:934:4232 with SMTP id
 5614622812f47-4ad879d8ff5mr4201192b6e.39.1785461739432; Thu, 30 Jul 2026
 18:35:39 -0700 (PDT)
Date: Thu, 30 Jul 2026 18:35:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6bfbeb.5cf34cee.28a846.0004.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: slab-use-after-free Read in raw_ioctl
From: syzbot <syzbot+d65a1f23d3bb8e21ffb5@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3b5f4b83c4ab Merge tag 'for-7.2-rc5-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1214003e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=d65a1f23d3bb8e21ffb5
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f99ca00b02a2/disk-3b5f4b83.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5caff5208bfc/vmlinux-3b5f4b83.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c0e941f5f816/bzImage-3b5f4b83.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d65a1f23d3bb8e21ffb5@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648 [inline]
BUG: KASAN: slab-use-after-free in string+0x471/0x4d0 lib/vsprintf.c:730
Read of size 1 at addr ffff88802c7ca0c0 by task syz.0.3761/21621

CPU: 0 UID: 0 PID: 21621 Comm: syz.0.3761 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
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
 raw_ioctl_ep0_stall drivers/usb/gadget/legacy/raw_gadget.c:827 [inline]
 raw_ioctl.cold+0x5d/0x3a6 drivers/usb/gadget/legacy/raw_gadget.c:1340
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f0dead9db2b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007f0debcfef50 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f0dead9db2b
RDX: 0000000000000000 RSI: 000000000000550c RDI: 0000000000000003
RBP: 00007f0deae33eaf R08: 0000000000000003 R09: 0000000000000409
R10: 0000000000000003 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f0deb025fa0 R15: 00007ffdb01d8f78
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

Freed by task 21629:
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

The buggy address belongs to the object at ffff88802c7ca0c0
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 freed 16-byte region [ffff88802c7ca0c0, ffff88802c7ca0d0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2c7ca
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88813fe23640 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 11136665373, free_ts 0
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
 kvasprintf+0xbc/0x150 lib/kasprintf.c:25
 kvasprintf_const+0x66/0x1a0 lib/kasprintf.c:49
 kobject_set_name_vargs+0x5a/0x140 lib/kobject.c:274
 dev_set_name+0xc7/0x100 drivers/base/core.c:3560
 usb_hub_create_port_device+0x3a4/0xe60 drivers/usb/core/port.c:783
 hub_configure drivers/usb/core/hub.c:1734 [inline]
 hub_probe.cold+0x2974/0x2eda drivers/usb/core/hub.c:2001
 usb_probe_interface+0x303/0x8f0 drivers/usb/core/driver.c:396
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802c7c9f80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88802c7ca000: 00 04 fc fc 00 04 fc fc 00 04 fc fc 00 01 fc fc
>ffff88802c7ca080: 00 00 fc fc 00 01 fc fc fa fb fc fc 00 04 fc fc
                                           ^
 ffff88802c7ca100: 00 04 fc fc 00 00 fc fc fa fb fc fc 00 00 fc fc
 ffff88802c7ca180: 00 00 fc fc fa fb fc fc 00 04 fc fc 00 04 fc fc
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
