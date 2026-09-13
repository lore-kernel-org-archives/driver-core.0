Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484EB36E466
	for <driver-core@lists.linux.dev>; Sun, 13 Sep 2026 15:54:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789314875; cv=none; b=XwfLjQWdgda7+ORr9e6kNz3QoXaRa3cpvKjOp8UJtohwFVQD0hj6eHgI0132lVPoMR9+iaIHJjoxhAjqDDcnbqBPzJwzrv3cUU78VXm05Wj2horOZ9w3lffK9EfU/If3WF1yoTFs0E+2Kjy96hC6UiKHVPQTDPMX3+eMoAqY5yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789314875; c=relaxed/simple;
	bh=RDKaKOuPxS/QzxQFvPQRdgvIU1ShlLWf0Nb+q2Yx5+4=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=RXDbIwEfVjn5X5Z1B5C/YchYucZ9omEE2pHF2TgQm3rntYxUeexB6A7XhgW78t31WRSsro86AsmrZI1QSOZXLfFMLNPPJLtGMurW+PB2eQqFXNvcykSVKU85zS0jz9RG78W3aUutS/Ooo5ToS4KJ6byh6uTguYtIM8lX4UfHx6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-7e99ff505c2so3476220a34.1
        for <driver-core@lists.linux.dev>; Sun, 13 Sep 2026 08:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789314872; x=1789919672;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=XyI7tP6BV3ZQw5PxaOMpv7ruNgnlTIM69B675BjVVIw=;
        b=lOw/oGmz1fjK9XYVDcDdHnJkl26ALlw/deN4gJjcGyGUVdT/q/7qHuT/N5YV3+AGWB
         zEzuYMMiglHq4rKDGaLawBd25d8joLVJpQdHMgRIsvUFBIou0HtOxcs7QcDL0NLxSsJ+
         Os1uGPO/m3MaK3KaqkTSwLboCdS/1oE7t4sqwMqo/fuJRw0P8/XH/6P2LB5h9lEdGGv0
         7ExCj95+mFXvwb98tzjH4oYpo6csJY9YAHNJYZG3jyLaJxA/SdOnx9FFn21p9i5S3QMK
         zBybIA8VESrCQZOxOQf3VupQTVWCSaamFwxTCwlmq5Tg+wSpZSOZbdaIue9B8edFuLH1
         YsRA==
X-Forwarded-Encrypted: i=1; AKwUvBwmaiysLiUc4IeLYx4f2xOBwjlH3jmUgwJwO1fsX5/VOxV1/g0vpYhaXEumMvI+5igz6JmQH9QhD2ALog==@lists.linux.dev
X-Gm-Message-State: AFuF++kokm+go4k3bTA7LDkUZjzVrWgo9uHdiBtlauMgbU8ujVw7XlW/
	J7ZHPL8XZYcElDkLudi+9pSUreUGJRxEQkjhmDlhIfn6JW2O6gdgEr3qLH0mx3zJFgNzEeyal8q
	mK+qzvqTPQCfJEjBECvGQeCr2aBLXXwgujrIxWjMb5smG1xbojDQt57P2Y0o=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1f07:b0:6b1:b867:1a1 with SMTP id
 006d021491bc7-6c0bb2f3cadmr16804045eaf.12.1789314872182; Sun, 13 Sep 2026
 08:54:32 -0700 (PDT)
Date: Sun, 13 Sep 2026 08:54:32 -0700
In-Reply-To: <6a8278d8.dbb3a75c.20434b.0041.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa6c738.f81106d8.2ab401.0037.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: slab-use-after-free Read in disable_device
From: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    2f0c1cf72f46 Merge tag 's390-7.3-3' of git://git.kernel.or..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17ccf615580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15fb19f9580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com

smbdirect: ib_dev[rxe10] removed
======================
==================================================================
BUG: KASAN: slab-use-after-free in kobject_uevent_net_broadcast lib/kobject_uevent.c:415 [inline]
BUG: KASAN: slab-use-after-free in kobject_uevent_env+0x1383/0x18b0 lib/kobject_uevent.c:611
Read of size 8 at addr ffff8880386e9fd0 by task kworker/u33:4/75

CPU: 3 UID: 0 PID: 75 Comm: kworker/u33:4 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: ib-unreg-wq ib_unregister_work
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 kobject_uevent_net_broadcast lib/kobject_uevent.c:415 [inline]
 kobject_uevent_env+0x1383/0x18b0 lib/kobject_uevent.c:611
 device_del+0x605/0x9b0 drivers/base/core.c:3983
 remove_one_compat_dev drivers/infiniband/core/device.c:1036 [inline]
 remove_compat_devs drivers/infiniband/core/device.c:1047 [inline]
 disable_device+0x1ea/0x280 drivers/infiniband/core/device.c:1339
 __ib_unregister_device+0x2b4/0x480 drivers/infiniband/core/device.c:1571
 ib_unregister_work+0x19/0x30 drivers/infiniband/core/device.c:1683
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Allocated by task 6226:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0xaa/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f8/0x6d0 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 uevent_net_init+0xd3/0x330 lib/kobject_uevent.c:782
 ops_init+0x1e2/0x5f0 net/core/net_namespace.c:137
 setup_net+0x118/0x3a0 net/core/net_namespace.c:443
 copy_net_ns+0x345/0x7a0 net/core/net_namespace.c:582
 create_new_namespaces+0x3ea/0xac0 kernel/nsproxy.c:132
 unshare_nsproxy_namespaces+0xf2/0x220 kernel/nsproxy.c:234
 ksys_unshare+0x4a2/0xa70 kernel/fork.c:3292
 __do_sys_unshare kernel/fork.c:3356 [inline]
 __se_sys_unshare kernel/fork.c:3354 [inline]
 __x64_sys_unshare+0x31/0x40 kernel/fork.c:3354
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 5751:
 kasan_save_stack+0x30/0x50 mm/kasan/common.c:57
 kasan_save_track+0x14/0x30 mm/kasan/common.c:78
 kasan_save_free_info+0x3b/0x70 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5f/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6508 [inline]
 kfree+0x22b/0x6d0 mm/slub.c:6801
 ops_exit_list net/core/net_namespace.c:200 [inline]
 ops_undo_list+0x2ee/0xab0 net/core/net_namespace.c:253
 cleanup_net+0x499/0x920 net/core/net_namespace.c:706
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

The buggy address belongs to the object at ffff8880386e9fc0
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 16 bytes inside of
 freed 32-byte region [ffff8880386e9fc0, ffff8880386e9fe0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff8880386e9980 pfn:0x386e9
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88801c042780 ffffea0000d14c90 ffffea0000dfb110
raw: ffff8880386e9980 000000000040003e 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 4516, tgid 4516 (kworker/u33:10), ts 10789616045
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0xfd/0x120 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x110d/0x35d0 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x2eb/0x3300 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab mm/slub.c:3462 [inline]
 new_slab+0xa9/0x6e0 mm/slub.c:3513
 refill_objects+0xe3/0x410 mm/slub.c:7417
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x35e/0x650 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __kmalloc_cache_noprof+0x4f4/0x6d0 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 slab_free_hook mm/slub.c:2700 [inline]
 slab_free mm/slub.c:6508 [inline]
 kmem_cache_free+0x40f/0x6c0 mm/slub.c:6635
 __cleanup_sighand kernel/fork.c:1723 [inline]
 __cleanup_sighand+0x6a/0xa0 kernel/fork.c:1715
 __exit_signal kernel/exit.c:222 [inline]
 release_task+0xcb8/0x1b80 kernel/exit.c:272
 exit_notify kernel/exit.c:812 [inline]
 do_exit+0x13ba/0x2ae0 kernel/exit.c:1023
 call_usermodehelper_exec_async+0x35d/0x4b0 kernel/umh.c:120
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
page_owner free stack trace missing

Memory state around the buggy address:
 ffff8880386e9e80: 00 00 00 00 fc fc fc fc fa fb fb fb fc fc fc fc
 ffff8880386e9f00: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>ffff8880386e9f80: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
                                                 ^
 ffff8880386ea000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff8880386ea080: fb fb fb fb fb fb fb fb fc fc fc fc fc fc fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
