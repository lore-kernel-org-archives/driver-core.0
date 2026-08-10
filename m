Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896E739A048
	for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 22:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786401573; cv=none; b=b7+O7IPATbFT7KOmMK3fytubVZSTPF2SV0Q/otCStvzOmeSvT7F1X1XVF5lKIqOi3PnysAzLl2doUKdLF7ReXZGgYCdNkOHwK51LT9Z0qc1C/S/BCtJYYLxoeOkDi1bT95Uggv0ELtqrkzPyyE+KJXii3pLEsKgOKdcqWrWTVJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786401573; c=relaxed/simple;
	bh=1KyMA0fhiMVHmnPJRvulZjtrM5rxJiVIRaYxf1j9zWI=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=uHXSa2uLgTM9ABIkPXePIRGGqLHRD4EI0ThcXCW+EZRiMe88VBpm/5pgHVWoSVVfUo1KhhpSNgncdyQEfD8fEtSkLogOjNJ/jAsJSy6USBWtrRt2Chi/XOfLIm8M35zTV70bwBUiirgKiy4FWZCfQTBfRYoVbAcpLGEaQS0uVac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4ab260600easo534588b6e.1
        for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 15:39:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786401570; x=1787006370;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wHy8pgoXV7rtePiGYUk9X3o1wTiOdn1eKQtIhdj2Jaw=;
        b=FzqXiH5zGdEoSiDxRttCTw8d0L22ZebkKBeQTbb2HzTCiw/KSWAOm4npZs36bfeV7a
         oSxYyl0hJyY3e8wWX3jantwPHFq0kM8qfuwHP91aIvkMYSTEp4vsRRTegZJj9jWm45rU
         6Wr8Cbf+mT4vRaEXBH7/LkDA2TRVYV2DoyEjpVH2vUYIDgkoIXpZ2roQj3DVh1rn8KPg
         Rrn4m0mP7k2tuXgl8DBlM82OAtUoLwBts8P8sAelsKdw/wJDx1i9P3SE3CfGixiQz2Pr
         u/FpZxsy5HVl33HpkpWuUN5dmwUJ+ih23/RA7WGN0FoZIpDe2VZSB0MliEX6dFJ7IvWe
         jrQQ==
X-Forwarded-Encrypted: i=1; AHgh+RoB9wv2cwZMjuyb6+RgKyxhWIIzAGowwCvW4tAZ8Loqzh1iLrgrNKvoz2Uc10n7o60qQoqsS8o1bhgM8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1WpZ3neRtn12fcShKIYL6Ae22j9owj6UjLKUHjoBik4121r6Y
	o4MbSShEE4kLirJOG5Jj38/Bo0d5uAQ83yN0K1aPRiR4gzVgp8L3zdhVlyYQsL2rWgQ8YYEGaZc
	pYcuYvnWsYLfyBjYm0hZ4J57wP1d7WnCa5y4/tjRYUAavx4TZ1CVPtZ2TJhA=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:d4f:b0:485:7c46:b866 with SMTP id
 5614622812f47-4b1f01b1d87mr1023979b6e.16.1786401570534; Mon, 10 Aug 2026
 15:39:30 -0700 (PDT)
Date: Mon, 10 Aug 2026 15:39:30 -0700
In-Reply-To: <6a7919c6.9c11d2ce.289b96.00de.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7a5322.01d0871a.3a0d52.00ae.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Write in bus_for_each_drv
From: syzbot <syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    d58772d8520c Merge tag 'regmap-fix-v7.2-rc7' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=16e012c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6ddb3079499f48cb
dashboard link: https://syzkaller.appspot.com/bug?extid=9cb1ac7fce4944ba9165
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1719d132580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9cb1ac7fce4944ba9165@syzkaller.appspotmail.com

Need at least one configuration in g3.
udc dummy_udc.0: failed to start g3: -22
configfs-gadget.g3 gadget.0: probe with driver configfs-gadget.g3 failed with error -22
==================================================================
BUG: KASAN: slab-use-after-free in knode_set_klist lib/klist.c:60 [inline]
BUG: KASAN: slab-use-after-free in klist_release lib/klist.c:201 [inline]
BUG: KASAN: slab-use-after-free in kref_put include/linux/kref.h:65 [inline]
BUG: KASAN: slab-use-after-free in klist_dec_and_del+0x386/0x3d0 lib/klist.c:206
Write of size 8 at addr ffff88803fe920e0 by task syz-executor321/5936

CPU: 1 UID: 0 PID: 5936 Comm: syz-executor321 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
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
 dummy_udc_probe+0x6e1/0x7e0 drivers/usb/gadget/udc/dummy_hcd.c:1121
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
RIP: 0033:0x7f453d1641de
Code: 08 0f 85 f5 e2 ff ff 49 89 fb 48 89 f0 48 89 d7 48 89 ce 4c 89 c2 4d 89 ca 4c 8b 44 24 08 4c 8b 4c 24 10 4c 89 5c 24 08 0f 05 <c3> 90 41 57 41 56 4d 89 c6 41 55 4d 89 cd 41 54 55 53 48 83 ec 08
RSP: 002b:00007f453d106f98 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f453d1076c0 RCX: 00007f453d1641de
RDX: 000000000000000b RSI: 00007f453d1ad1b9 RDI: 0000000000000003
RBP: 0000000000000005 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000003
R13: 0000000000000010 R14: 00007ffca4345660 R15: 00007ffca4345748
 </TASK>

Allocated by task 5940:
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

Freed by task 5940:
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

The buggy address belongs to the object at ffff88803fe92000
 which belongs to the cache kmalloc-512 of size 512
The buggy address is located 224 bytes inside of
 freed 512-byte region [ffff88803fe92000, ffff88803fe92200)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x3fe90
head: order:2 mapcount:0 entire_mapcount:0 nr_pages_mapped:0 pincount:0
flags: 0x80000000000040(head|node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000040 ffff88813ffb3c80 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 0080000000000040 ffff88813ffb3c80 dead000000000100 dead000000000122
head: 0000000000000000 0000000800100010 00000000f5000000 0000000000000000
head: 0080000000000002 ffffffffffffff01 00000000ffffffff 00000000ffffffff
head: 0000000000000000 0000000000000000 00000000ffffffff 0000000000000004
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 2, migratetype Unmovable, gfp_mask 0xd20c0(__GFP_IO|__GFP_FS|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5633, tgid 5633 (syz-executor), ts 102640041714, free_ts 80262861649
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
 mca_alloc net/ipv6/mcast.c:871 [inline]
 __ipv6_dev_mc_inc+0x447/0xa40 net/ipv6/mcast.c:961
 ipv6_add_dev+0xe83/0x1400 net/ipv6/addrconf.c:475
 addrconf_notify+0x771/0x1050 net/ipv6/addrconf.c:3685
 notifier_call_chain+0x1a5/0x3d0 kernel/notifier.c:85
 call_netdevice_notifiers_extack net/core/dev.c:2288 [inline]
 call_netdevice_notifiers net/core/dev.c:2302 [inline]
 register_netdevice+0x18c0/0x1ed0 net/core/dev.c:11484
 __ip_tunnel_create+0x3e8/0x550 net/ipv4/ip_tunnel.c:268
 ip_tunnel_init_net+0x2e5/0x820 net/ipv4/ip_tunnel.c:1150
 ops_init+0x35d/0x5d0 net/core/net_namespace.c:137
 setup_net+0x118/0x350 net/core/net_namespace.c:446
page last free pid 5564 tgid 5564 stack trace:
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
 __kmalloc_cache_noprof+0x351/0x6b0 mm/slub.c:5485
 _kmalloc_noprof include/linux/slab.h:988 [inline]
 single_open+0x5a/0x240 fs/seq_file.c:576
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
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x174/0x580 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Memory state around the buggy address:
 ffff88803fe91f80: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff88803fe92000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88803fe92080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                       ^
 ffff88803fe92100: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88803fe92180: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
