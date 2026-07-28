Received: from mail-oi1-f208.google.com (mail-oi1-f208.google.com [209.85.167.208])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F08F415F0D
	for <driver-core@lists.linux.dev>; Tue, 28 Jul 2026 13:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.208
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246761; cv=none; b=FuNV9i8kYFF/dDgux7lv0wZm5zcARH5Tx98I67G9w7hPfquZcT+Hg6Tbi+UAIXBkCzP0jJTMV6pUuYHaYSBncdCKbLx4z65FrxWn/oViimGbiM5Z7tLVekBCo3xrUPDwGkT0y0Iln2gXzGALUhNv1CQdndExxGe7mctLryuq7ZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246761; c=relaxed/simple;
	bh=VjN375xNsYITYnTRt42h+7wtO5ND0L78c5UlEkNrA3o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Vx7uezy1TJ6XbgyGYTPYOH5nlY56CdKIgDKbSWASXcC1GDqkET0kc+rDGjASgT2cbPrdpzje69G0g1oFSSAcnROh8GaVY4T2pf84ejQdJFFk4bx8rG56wiAG1mfYmC5SELwnJYX5UlQL4t8E0+3WTZQAh/x8FxFZ/xSKEeA9rcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.208
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f208.google.com with SMTP id 5614622812f47-4ab4f78b9f4so5455799b6e.2
        for <driver-core@lists.linux.dev>; Tue, 28 Jul 2026 06:52:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246758; x=1785851558;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Mu7+3XgaXMksuJmmev6OMdLT0jHl/7Bmv74uvPcSWBU=;
        b=ZDWZo5ZsxI7LWBFWg5S4wW120I1cIuj44f+SfyZPUqasrNhd/wZaHRXBbDYbc/z0qM
         o5wNBRdD/Q5rj6S9lQDPgSqO/cqJXYU6wJg2ULx9/T5RttELRSzFDyLt3qBlAD9mxI6B
         9eiDCcvX37zCxjW3v90pBEG/aVKhy6g88788gptFuVOnUMIctMv/nolBsr/q84bwHa8O
         sel9V3+LK680gq9hXMaN+Ms5E7v9WG4Nhml1/hLnjniub3KpWTCT2RMDZ3v+4pYzAMRF
         nF5p5mPuBmaFwibCePZ6iCcP88R9HUfuizAzLxPCHr+kaV5Jo8vnt3Xq9hInml/ZRVIF
         FgOw==
X-Forwarded-Encrypted: i=1; AHgh+Ro7L8nO38kWSnhHQ4pmHUWs1D47Ru93ybGwqkmKaFXHcNj1V2ac89WlJYV8foNdVSFuaPWhCj1R4k0E8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwtWLvKl8/WnFO8sjmqSh2YCo+E4P0Q9Yu9ZhEeQROtQ8ZjV7K8
	GAh2g6LtJJ4TBTFWfB6joZoV95B//P5owW7A49u/X0kcdRe1rcfeuX+W+lCA99k2djzE63ft9il
	RGptO1KAtXL7mEYnY85Gbp+rDJ9lca4FJpKAVsc39m6N52vCb1rjTQ0VN3vw=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a9:b0:4aa:cad:cb4c with SMTP id
 5614622812f47-4ad5b59f5c6mr1548776b6e.1.1785246758646; Tue, 28 Jul 2026
 06:52:38 -0700 (PDT)
Date: Tue, 28 Jul 2026 06:52:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a68b426.b6659fcc.241ab8.00ea.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: slab-use-after-free Read in raw_process_ep0_io
From: syzbot <syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0ce37745d4bf Merge tag 'block-7.2-20260724' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14712232580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=9aacea11bc70c3ddaff2
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/19521188f055/disk-0ce37745.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/2f7922f1fe08/vmlinux-0ce37745.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1a7a0ce66cfa/bzImage-0ce37745.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648 [inline]
BUG: KASAN: slab-use-after-free in string+0x471/0x4d0 lib/vsprintf.c:730
Read of size 1 at addr ffff88802c5cd440 by task syz.0.4111/18826

CPU: 0 UID: 0 PID: 18826 Comm: syz.0.4111 Tainted: G             L      syzkaller #0 PREEMPT(full) 
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
 raw_process_ep0_io.cold+0x65/0x7f drivers/usb/gadget/legacy/raw_gadget.c:730
 raw_ioctl_ep0_write drivers/usb/gadget/legacy/raw_gadget.c:767 [inline]
 raw_ioctl+0x1369/0x2b80 drivers/usb/gadget/legacy/raw_gadget.c:1313
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcac599db2b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007fcac683af50 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007fcac599db2b
RDX: 00007fcac683afd0 RSI: 0000000040085503 RDI: 0000000000000003
RBP: 00007fcac683afd0 R08: 0000000000000002 R09: 0000000000000409
R10: 0000000000000003 R11: 0000000000000246 R12: 00007fcac683afd8
R13: 00002000000011c0 R14: 00007fcac5c25fa0 R15: 00007ffc38c0ce58
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
 dummy_udc_probe+0x69e/0x960 drivers/usb/gadget/udc/dummy_hcd.c:1103
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
 dummy_hcd_init+0x803/0xc00 drivers/usb/gadget/udc/dummy_hcd.c:2880
 do_one_initcall+0x11d/0x700 init/main.c:1347
 do_initcall_level init/main.c:1409 [inline]
 do_initcalls init/main.c:1425 [inline]
 do_basic_setup init/main.c:1445 [inline]
 kernel_init_freeable+0x6ea/0x7b0 init/main.c:1658
 kernel_init+0x1f/0x1e0 init/main.c:1548
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

Freed by task 18849:
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

The buggy address belongs to the object at ffff88802c5cd440
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 freed 16-byte region [ffff88802c5cd440, ffff88802c5cd450)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2c5cd
flags: 0xfff00000000000(node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000000 ffff88813fe22640 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 26, tgid 26 (kdevtmpfs), ts 9777113351, free_ts 0
 create_dummy_stack mm/page_owner.c:103 [inline]
 register_dummy_stack+0x74/0xb0 mm/page_owner.c:109
 init_page_owner+0x42/0xa10 mm/page_owner.c:127
 invoke_init_callbacks mm/page_ext.c:152 [inline]
 page_ext_init+0x71d/0x780 mm/page_ext.c:490
 mm_core_init+0x229/0x270 mm/mm_init.c:2741
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802c5cd300: 00 01 fc fc 00 04 fc fc 00 04 fc fc 00 04 fc fc
 ffff88802c5cd380: 00 04 fc fc 00 04 fc fc 00 04 fc fc 00 04 fc fc
>ffff88802c5cd400: 00 01 fc fc 00 01 fc fc fa fb fc fc 00 05 fc fc
                                           ^
 ffff88802c5cd480: 00 01 fc fc 00 00 fc fc 00 07 fc fc 00 01 fc fc
 ffff88802c5cd500: 00 01 fc fc 00 01 fc fc 00 00 fc fc 00 01 fc fc
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
