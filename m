Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1786D2580CF
	for <driver-core@lists.linux.dev>; Wed, 29 Jul 2026 03:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785295528; cv=none; b=qCK9tpR6pdy9BbBkZiLmudC6ESRBEnFiGUYRd98Zpeeue8q2at0TSHEuiVz2dTeN0J90OO1kKyfmi56KZZlxpvmJCNd5XCFD3xRsLiwXDhiPsTOOf51j1ZSlNGTrvhMJmXaHh4TqJxv0j4dsfBG1gH0Kx8OVYvpgIw6Mwmrn8G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785295528; c=relaxed/simple;
	bh=jqfvC/OwR0ZI42QHVb+S115eN3e4EvcSweLLmkHv40c=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=r7K6mdZ8zLuX77jdWW+3LE9m9pDvsOTj6hRSt9nN6xZ4R60vB/hGPcEtiXaLEzI1Dwynnc4gaA3KZZfENQA24ro9TJqkSXOwtUZKTDGVQXChHHkcqJx1atfBkEnPnN0TtV5u5iR9KH9f4AWCZd1YHvNtflAydlTCF0c5T5Aq4/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4a45997664aso615582b6e.1
        for <driver-core@lists.linux.dev>; Tue, 28 Jul 2026 20:25:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785295526; x=1785900326;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I9zIfaKpT1PygDCdzFMC03oG0INhPI0diIzxJAIQ3qU=;
        b=ELF8ysxuIw0DdBztj21coBYrqDNzo4vMUUbiaO8LbGNCBYJyvAnblx3YZgxWwNrwKV
         vTc3PEll80G9YM6r3yphjUzhVogSmO0rUdFP0s68Fe5fuQzfmI9t1F+q0bjLXx7jzaIy
         LWLKPv3Em4hpdSfmekEEImHJdTz3E7y6p1OL22mO5opFNYOAbtKpBU2g1Dt9CCxh9ur/
         XfEEFSx08q3KLcLs19IAkywKWbdlh3Lcn1z2LFbOvA+Q2G7zPwAgdol9Kv4qHR5lRYBd
         KOeT8vA2Rv8ETKhitNoVUgOSkmNZmHt2EjVAkcJQpBmV5tmMflfPUVH7XGZG+ioy+hBX
         RFMA==
X-Forwarded-Encrypted: i=1; AHgh+Rq+0JV/pexYbKnZaYG78qBWQS9h2HxoP7bbs/D3STl6+k48Mw2RA4mYn8u1Xt6GqpPa4pZEBvtXoPX/vw==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvA8t+8C82w3npM/8hjApS8swBNKx+v4D/L9U3xNIkHrab+aEk
	cMWMtbbKX3h5UesO4MvF0qqBK0VY6eGJL2NxJ04JFn6cSIlDJG9CoIYs+yv3akSjhkcy4r/yWCk
	KROLObcdtDULIeaZRX8l2oxGp88BldbbhcazhT1C8UA7UWs0i28URNKkMvV8=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:4feb:b0:495:f230:a340 with SMTP id
 5614622812f47-4ad5bb4428bmr3656055b6e.28.1785295525973; Tue, 28 Jul 2026
 20:25:25 -0700 (PDT)
Date: Tue, 28 Jul 2026 20:25:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a6972a5.d9e86bb5.297b12.004f.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: slab-use-after-free Read in
 raw_process_ep_io (2)
From: syzbot <syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d326f83e819c Merge tag 'net-7.2-rc5' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=118d5ca9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d69870d5e052935f
dashboard link: https://syzkaller.appspot.com/bug?extid=596b59aea1a9deaaab67
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b579ac560ac6/disk-d326f83e.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f1d14922156b/vmlinux-d326f83e.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5cca8ce9b203/bzImage-d326f83e.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+596b59aea1a9deaaab67@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648 [inline]
BUG: KASAN: slab-use-after-free in string+0x471/0x4d0 lib/vsprintf.c:730
Read of size 1 at addr ffff888034f293e0 by task syz.0.210/6386

CPU: 0 UID: 0 PID: 6386 Comm: syz.0.210 Not tainted syzkaller #0 PREEMPT(full) 
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
RIP: 0033:0x7f5831b9db2b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007f5832aadf60 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000005 RCX: 00007f5831b9db2b
RDX: 00007f5832aadfe0 RSI: 0000000040085507 RDI: 0000000000000003
RBP: 0000000000000003 R08: 00007f5831f50320 R09: 0000000000000000
R10: 0000000000000003 R11: 0000000000000246 R12: 0000200000002340
R13: 000000000000000a R14: 00007f5831e25fa0 R15: 00007ffd1da71278
 </TASK>

Allocated by task 6384:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5362 [inline]
 __kmalloc_node_track_caller_noprof+0x331/0x830 mm/slub.c:5497
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
 device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
 bind_store+0xf4/0x190 drivers/base/bus.c:267
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6412:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2705 [inline]
 slab_free mm/slub.c:6405 [inline]
 kfree+0x22b/0x6c0 mm/slub.c:6720
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

The buggy address belongs to the object at ffff888034f293e0
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 freed 16-byte region [ffff888034f293e0, ffff888034f293f0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff888034f29b80 pfn:0x34f29
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88813fe22640 ffffea00015409d0 ffffea00007fb6d0
raw: ffff888034f29b80 000000080080007b 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5610, tgid 5610 (syz-executor), ts 101676951155, free_ts 101676872118
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1859
 prep_new_page mm/page_alloc.c:1867 [inline]
 get_page_from_freelist+0xf48/0x3530 mm/page_alloc.c:3946
 __alloc_frozen_pages_noprof+0x299/0x2dc0 mm/page_alloc.c:5304
 alloc_slab_page mm/slub.c:3294 [inline]
 allocate_slab mm/slub.c:3408 [inline]
 new_slab+0xa2/0x650 mm/slub.c:3454
 refill_objects+0xe3/0x410 mm/slub.c:7338
 refill_sheaf mm/slub.c:2832 [inline]
 __pcs_replace_empty_main+0x376/0x680 mm/slub.c:4703
 alloc_from_pcs mm/slub.c:4801 [inline]
 slab_alloc_node mm/slub.c:4933 [inline]
 __do_kmalloc_node mm/slub.c:5361 [inline]
 __kvmalloc_node_noprof+0x793/0x970 mm/slub.c:6933
 xt_jumpstack_alloc net/netfilter/x_tables.c:1449 [inline]
 do_replace_table+0x1c5/0x760 net/netfilter/x_tables.c:1486
 xt_replace_table+0x2e/0x130 net/netfilter/x_tables.c:1545
 __do_replace+0x1cf/0x980 net/ipv4/netfilter/ip_tables.c:1062
 do_replace net/ipv4/netfilter/ip_tables.c:1139 [inline]
 do_ipt_set_ctl+0xa53/0xcf0 net/ipv4/netfilter/ip_tables.c:1634
 nf_setsockopt+0x8d/0xf0 net/netfilter/nf_sockopt.c:101
 ip_setsockopt+0xcb/0xf0 net/ipv4/ip_sockglue.c:1424
 tcp_setsockopt+0xa7/0x100 net/ipv4/tcp.c:4179
 do_sock_setsockopt+0xf3/0x1d0 net/socket.c:2368
 __sys_setsockopt+0x195/0x220 net/socket.c:2393
page last free pid 5610 tgid 5610 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 __free_pages_prepare mm/page_alloc.c:1406 [inline]
 __free_frozen_pages+0x79f/0x1090 mm/page_alloc.c:2950
 ___free_pages_bulk mm/kasan/shadow.c:333 [inline]
 __kasan_populate_vmalloc_do mm/kasan/shadow.c:385 [inline]
 __kasan_populate_vmalloc+0x164/0x210 mm/kasan/shadow.c:424
 kasan_populate_vmalloc include/linux/kasan.h:580 [inline]
 alloc_vmap_area+0x95d/0x2bb0 mm/vmalloc.c:2123
 __get_vm_area_node+0x1ca/0x330 mm/vmalloc.c:3226
 __vmalloc_node_range_noprof+0x228/0x1630 mm/vmalloc.c:4042
 __vmalloc_node_noprof+0xad/0xf0 mm/vmalloc.c:4143
 xt_counters_alloc+0x4c/0x70 net/netfilter/x_tables.c:1474
 __do_replace+0x97/0x980 net/ipv4/netfilter/ip_tables.c:1044
 do_replace net/ipv4/netfilter/ip_tables.c:1139 [inline]
 do_ipt_set_ctl+0xa53/0xcf0 net/ipv4/netfilter/ip_tables.c:1634
 nf_setsockopt+0x8d/0xf0 net/netfilter/nf_sockopt.c:101
 ip_setsockopt+0xcb/0xf0 net/ipv4/ip_sockglue.c:1424
 tcp_setsockopt+0xa7/0x100 net/ipv4/tcp.c:4179
 do_sock_setsockopt+0xf3/0x1d0 net/socket.c:2368
 __sys_setsockopt+0x195/0x220 net/socket.c:2393
 __do_sys_setsockopt net/socket.c:2399 [inline]
 __se_sys_setsockopt net/socket.c:2396 [inline]
 __x64_sys_setsockopt+0xbd/0x160 net/socket.c:2396
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94

Memory state around the buggy address:
 ffff888034f29280: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
 ffff888034f29300: fa fb fc fc fa fb fc fc 00 05 fc fc fa fb fc fc
>ffff888034f29380: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
                                                       ^
 ffff888034f29400: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
 ffff888034f29480: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
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
