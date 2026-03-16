Received: from mail-ot1-f78.google.com (mail-ot1-f78.google.com [209.85.210.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E3D3392C20
	for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 12:02:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773662545; cv=none; b=t0m4c4bOAOtoj4/pYtsXyRzAvShk2JUQAEZbKwuAp2Edw19OwNJfegXzNyJg/570bUrZXZpf6mzqrx/qivkE7V/IDfT7v+ldYOmo98lPzb7HKmbuYdzoG9mehJy/HopAxW13cCr/UCwJmtvNvxRBj0+QtAuQeDzgbAV9NVVzKMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773662545; c=relaxed/simple;
	bh=igZw+d46yvbJOsjKBjv40MT1n0Qwt/+a3rH6JKFK/7w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ew2wFuUBP4KI9jt83LYOFsGYKeuFWqmspkgubiZyfQWvUVDecGUT0DyBawvs9T2ioElxmMdUm3EIn/A+QRpf8ZX2N+oqsP0VULNmkMZYbSjkhOgCIW+E1DOzkqJUcRYxLU8g1ivuLZpMc3B4bWImtUj7SeQdHzBGz1HoKHxp5II=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f78.google.com with SMTP id 46e09a7af769-7d74cd19998so61102920a34.2
        for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 05:02:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773662542; x=1774267342;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lxLpN4U3Cphxh4Wh3bfLWg5im4cwZ1APokA6M9ffMEY=;
        b=gSRAg22GoG/rMWbxMfj71ZdeZeNmsx6wtGhj8V4zOyg7OsI6HJUZ0h+76GsOC8Xile
         b4DoZ1m6a8ik8Rhco45hapi8LTLkeLMKwrVv4O7OwOgujgs9B/j1LXm96Obzen6kD3RV
         HvC2fKRbNaBbl7IJiUsaOXlcq5xQxRWoibyXU5yLspTS6Yacq2IyixRzY8loUYcqFbPq
         Zxo4+nlb1j37gL5KKIv26zmLof2yHOBoipcOQldOrL1lHiOriJjsuLcaK30l6CxQQpEu
         C8nj7EDzDUzg4711jJQ+Ov2PtJdXFxAcvwfPdEyWJSSje9M9sOaMjyNSJgxvZCifkD2d
         ZK8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWVw0J5ofWJqUGp4YxVvdsPW0qCAwNo1T9XGnIgTEo3E7446TUT+18jj0YOCCH28bJhQ+f/nf9RikIfWw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+/kvBp/Izeilz+HDuRPPoTf85h5aMSiAxH3jSvE8iBlaBw2zm
	Y0ki8HEo7xBlgv6QjtrPFk0N40JFwPEE7ehOLc5yE6Cb+ZGzsjMcPqJmBj8HGI/7Jpsej8cle0k
	NCBcgtNyd8kXo1CI5vFIc/0BDaJAWv1X3R/A8F/jsyn58CRBavXzAS7sgA5M=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:5186:b0:467:3f4:907c with SMTP id
 5614622812f47-46757402a73mr6690598b6e.47.1773662541977; Mon, 16 Mar 2026
 05:02:21 -0700 (PDT)
Date: Mon, 16 Mar 2026 05:02:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69b7f14d.050a0220.12d28.015e.GAE@google.com>
Subject: [syzbot] [kernel?] possible deadlock in device_create (3)
From: syzbot <syzbot+4ba8a624812f10a13c48@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    0257f64bdac7 Merge tag 'pm-7.0-rc4' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17f444d6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2b9fbb898accd2e4
dashboard link: https://syzkaller.appspot.com/bug?extid=4ba8a624812f10a13c48
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fe2c2d3a356f/disk-0257f64b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/814567bbd30d/vmlinux-0257f64b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/5cecf46c0268/bzImage-0257f64b.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4ba8a624812f10a13c48@syzkaller.appspotmail.com

Dev nbd6: unable to read RDB block 0
 nbd6: unable to read partition table
ldm_validate_partition_table(): Disk read failed.
Dev nbd6: unable to read RDB block 0
 nbd6: unable to read partition table
======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
udevd/17714 is trying to acquire lock:
ffffffff8deedda0 (fs_reclaim){+.+.}-{0:0}, at: might_alloc include/linux/sched/mm.h:317 [inline]
ffffffff8deedda0 (fs_reclaim){+.+.}-{0:0}, at: slab_pre_alloc_hook mm/slub.c:4493 [inline]
ffffffff8deedda0 (fs_reclaim){+.+.}-{0:0}, at: slab_alloc_node mm/slub.c:4846 [inline]
ffffffff8deedda0 (fs_reclaim){+.+.}-{0:0}, at: kmem_cache_alloc_node_noprof+0x4b/0x6e0 mm/slub.c:4921

but task is already holding lock:
ffffffff8f50f6f8 (uevent_sock_mutex){+.+.}-{4:4}, at: uevent_net_broadcast_untagged lib/kobject_uevent.c:317 [inline]
ffffffff8f50f6f8 (uevent_sock_mutex){+.+.}-{4:4}, at: kobject_uevent_net_broadcast+0x281/0x560 lib/kobject_uevent.c:410

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #9 (uevent_sock_mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/rtmutex_api.c:533 [inline]
       mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:552
       uevent_net_broadcast_untagged lib/kobject_uevent.c:317 [inline]
       kobject_uevent_net_broadcast+0x281/0x560 lib/kobject_uevent.c:410
       kobject_uevent_env+0x55f/0x9e0 lib/kobject_uevent.c:608
       device_add+0x557/0xb80 drivers/base/core.c:3670
       device_create_groups_vargs drivers/base/core.c:4371 [inline]
       device_create+0x269/0x300 drivers/base/core.c:4410
       msr_device_create+0x33/0x50 arch/x86/kernel/msr.c:251
       cpuhp_invoke_callback+0x445/0x860 kernel/cpu.c:194
       cpuhp_thread_fun+0x36b/0x780 kernel/cpu.c:1109
       smpboot_thread_fn+0x541/0xa50 kernel/smpboot.c:160
       kthread+0x388/0x470 kernel/kthread.c:436
       ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #8 (cpuhp_state-up){+.+.}-{0:0}:
       cpuhp_lock_acquire kernel/cpu.c:103 [inline]
       cpuhp_thread_fun+0x127/0x780 kernel/cpu.c:1086
       smpboot_thread_fn+0x541/0xa50 kernel/smpboot.c:160
       kthread+0x388/0x470 kernel/kthread.c:436
       ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #7 (cpu_hotplug_lock){++++}-{0:0}:
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read include/linux/percpu-rwsem.h:77 [inline]
       cpus_read_lock+0x42/0x160 kernel/cpu.c:490
       static_key_slow_inc+0x12/0x30 kernel/jump_label.c:190
       fl_create net/ipv6/ip6_flowlabel.c:457 [inline]
       ipv6_flowlabel_get net/ipv6/ip6_flowlabel.c:637 [inline]
       ipv6_flowlabel_opt+0x160a/0x2340 net/ipv6/ip6_flowlabel.c:740
       do_ipv6_setsockopt+0xda7/0x31c0 net/ipv6/ipv6_sockglue.c:936
       ipv6_setsockopt+0x59/0x170 net/ipv6/ipv6_sockglue.c:973
       do_sock_setsockopt+0x17c/0x1b0 net/socket.c:2322
       __sys_setsockopt net/socket.c:2347 [inline]
       __do_sys_setsockopt net/socket.c:2353 [inline]
       __se_sys_setsockopt net/socket.c:2350 [inline]
       __x64_sys_setsockopt+0x143/0x1b0 net/socket.c:2350
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #6 (sk_lock-AF_INET6){+.+.}-{0:0}:
       lock_sock_nested+0x3e/0x130 net/core/sock.c:3780
       lock_sock include/net/sock.h:1709 [inline]
       inet_shutdown+0x6a/0x390 net/ipv4/af_inet.c:919
       nbd_mark_nsock_dead+0x2e9/0x560 drivers/block/nbd.c:318
       recv_work+0x1c9d/0x1dc0 drivers/block/nbd.c:1021
       process_one_work kernel/workqueue.c:3275 [inline]
       process_scheduled_works+0xb02/0x1830 kernel/workqueue.c:3358
       worker_thread+0xa50/0xfc0 kernel/workqueue.c:3439
       kthread+0x388/0x470 kernel/kthread.c:436
       ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #5 (&nsock->tx_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/rtmutex_api.c:533 [inline]
       mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:552
       nbd_handle_cmd drivers/block/nbd.c:1143 [inline]
       nbd_queue_rq+0x37b/0x1100 drivers/block/nbd.c:1207
       blk_mq_dispatch_rq_list+0xa77/0x1910 block/blk-mq.c:2148
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xddb/0x1610 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xda/0x1a0 block/blk-mq-sched.c:329
       blk_mq_run_hw_queue+0x368/0x520 block/blk-mq.c:2386
       blk_mq_dispatch_list+0xd1f/0xe20 include/linux/spinlock_rt.h:-1
       blk_mq_flush_plug_list+0x48d/0x570 block/blk-mq.c:2997
       __blk_flush_plug+0x3ed/0x4d0 block/blk-core.c:1230
       blk_finish_plug block/blk-core.c:1257 [inline]
       __submit_bio+0x28d/0x580 block/blk-core.c:649
       __submit_bio_noacct_mq block/blk-core.c:722 [inline]
       submit_bio_noacct_nocheck+0x2f4/0xa70 block/blk-core.c:753
       submit_bh fs/buffer.c:2826 [inline]
       block_read_full_folio+0x599/0x830 fs/buffer.c:2444
       filemap_read_folio+0x137/0x3b0 mm/filemap.c:2501
       do_read_cache_folio+0x2bf/0x560 mm/filemap.c:4101
       read_mapping_folio include/linux/pagemap.h:1028 [inline]
       read_part_sector+0xb8/0x2b0 block/partitions/core.c:723
       adfspart_check_ICS+0xa5/0xa40 block/partitions/acorn.c:360
       check_partition block/partitions/core.c:142 [inline]
       blk_add_partitions block/partitions/core.c:590 [inline]
       bdev_disk_changed+0x7ba/0x1550 block/partitions/core.c:694
       blkdev_get_whole+0x2e5/0x480 block/bdev.c:764
       bdev_open+0x31e/0xcc0 block/bdev.c:973
       blkdev_open+0x485/0x620 block/fops.c:697
       do_dentry_open+0x83d/0x13e0 fs/open.c:949
       vfs_open+0x3b/0x350 fs/open.c:1081
       do_open fs/namei.c:4671 [inline]
       path_openat+0x2e43/0x38a0 fs/namei.c:4830
       do_file_open+0x23e/0x4a0 fs/namei.c:4859
       do_sys_openat2+0x113/0x200 fs/open.c:1366
       do_sys_open fs/open.c:1372 [inline]
       __do_sys_openat fs/open.c:1388 [inline]
       __se_sys_openat fs/open.c:1383 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1383
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #4 (&cmd->lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/rtmutex_api.c:533 [inline]
       mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:552
       nbd_queue_rq+0xc6/0x1100 drivers/block/nbd.c:1199
       blk_mq_dispatch_rq_list+0xa77/0x1910 block/blk-mq.c:2148
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xddb/0x1610 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xda/0x1a0 block/blk-mq-sched.c:329
       blk_mq_run_hw_queue+0x368/0x520 block/blk-mq.c:2386
       blk_mq_dispatch_list+0xd1f/0xe20 include/linux/spinlock_rt.h:-1
       blk_mq_flush_plug_list+0x48d/0x570 block/blk-mq.c:2997
       __blk_flush_plug+0x3ed/0x4d0 block/blk-core.c:1230
       blk_finish_plug block/blk-core.c:1257 [inline]
       __submit_bio+0x28d/0x580 block/blk-core.c:649
       __submit_bio_noacct_mq block/blk-core.c:722 [inline]
       submit_bio_noacct_nocheck+0x2f4/0xa70 block/blk-core.c:753
       submit_bh fs/buffer.c:2826 [inline]
       block_read_full_folio+0x599/0x830 fs/buffer.c:2444
       filemap_read_folio+0x137/0x3b0 mm/filemap.c:2501
       do_read_cache_folio+0x2bf/0x560 mm/filemap.c:4101
       read_mapping_folio include/linux/pagemap.h:1028 [inline]
       read_part_sector+0xb8/0x2b0 block/partitions/core.c:723
       adfspart_check_ICS+0xa5/0xa40 block/partitions/acorn.c:360
       check_partition block/partitions/core.c:142 [inline]
       blk_add_partitions block/partitions/core.c:590 [inline]
       bdev_disk_changed+0x7ba/0x1550 block/partitions/core.c:694
       blkdev_get_whole+0x2e5/0x480 block/bdev.c:764
       bdev_open+0x31e/0xcc0 block/bdev.c:973
       blkdev_open+0x485/0x620 block/fops.c:697
       do_dentry_open+0x83d/0x13e0 fs/open.c:949
       vfs_open+0x3b/0x350 fs/open.c:1081
       do_open fs/namei.c:4671 [inline]
       path_openat+0x2e43/0x38a0 fs/namei.c:4830
       do_file_open+0x23e/0x4a0 fs/namei.c:4859
       do_sys_openat2+0x113/0x200 fs/open.c:1366
       do_sys_open fs/open.c:1372 [inline]
       __do_sys_openat fs/open.c:1388 [inline]
       __se_sys_openat fs/open.c:1383 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1383
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #3 (set->srcu){.+.+}-{0:0}:
       srcu_lock_sync include/linux/srcu.h:199 [inline]
       __synchronize_srcu+0xca/0x3e0 kernel/rcu/srcutree.c:1505
       elevator_switch+0x1e8/0x7a0 block/elevator.c:576
       elevator_change+0x2cc/0x450 block/elevator.c:681
       elevator_set_default+0x36c/0x430 block/elevator.c:754
       blk_register_queue+0x366/0x430 block/blk-sysfs.c:946
       __add_disk+0x677/0xd50 block/genhd.c:528
       add_disk_fwnode+0xfb/0x480 block/genhd.c:597
       add_disk include/linux/blkdev.h:785 [inline]
       nbd_dev_add+0x72c/0xb50 drivers/block/nbd.c:1984
       nbd_init+0x168/0x1f0 drivers/block/nbd.c:2692
       do_one_initcall+0x250/0x8d0 init/main.c:1382
       do_initcall_level+0x104/0x190 init/main.c:1444
       do_initcalls+0x59/0xa0 init/main.c:1460
       kernel_init_freeable+0x2a6/0x3e0 init/main.c:1692
       kernel_init+0x1d/0x1d0 init/main.c:1582
       ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 (&q->elevator_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/rtmutex_api.c:533 [inline]
       mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:552
       elevator_change+0x1b3/0x450 block/elevator.c:679
       elevator_set_none+0xb5/0x140 block/elevator.c:769
       blk_mq_elv_switch_none block/blk-mq.c:5110 [inline]
       __blk_mq_update_nr_hw_queues block/blk-mq.c:5155 [inline]
       blk_mq_update_nr_hw_queues+0x607/0x1a80 block/blk-mq.c:5220
       nbd_start_device+0x17f/0xb20 drivers/block/nbd.c:1489
       nbd_start_device_ioctl drivers/block/nbd.c:1548 [inline]
       __nbd_ioctl drivers/block/nbd.c:1623 [inline]
       nbd_ioctl+0x57b/0xe40 drivers/block/nbd.c:1663
       blkdev_ioctl+0x5e6/0x750 block/ioctl.c:804
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&q->q_usage_counter(io)#53){++++}-{0:0}:
       blk_alloc_queue+0x54e/0x690 block/blk-core.c:461
       blk_mq_alloc_queue block/blk-mq.c:4429 [inline]
       __blk_mq_alloc_disk+0x197/0x390 block/blk-mq.c:4476
       nbd_dev_add+0x499/0xb50 drivers/block/nbd.c:1954
       nbd_init+0x168/0x1f0 drivers/block/nbd.c:2692
       do_one_initcall+0x250/0x8d0 init/main.c:1382
       do_initcall_level+0x104/0x190 init/main.c:1444
       do_initcalls+0x59/0xa0 init/main.c:1460
       kernel_init_freeable+0x2a6/0x3e0 init/main.c:1692
       kernel_init+0x1d/0x1d0 init/main.c:1582
       ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #0 (fs_reclaim){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x15a5/0x2cf0 kernel/locking/lockdep.c:5237
       lock_acquire+0xf0/0x2e0 kernel/locking/lockdep.c:5868
       __fs_reclaim_acquire mm/page_alloc.c:4348 [inline]
       fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4362
       might_alloc include/linux/sched/mm.h:317 [inline]
       slab_pre_alloc_hook mm/slub.c:4493 [inline]
       slab_alloc_node mm/slub.c:4846 [inline]
       kmem_cache_alloc_node_noprof+0x4b/0x6e0 mm/slub.c:4921
       __alloc_skb+0x1d0/0x7d0 net/core/skbuff.c:702
       alloc_skb include/linux/skbuff.h:1383 [inline]
       alloc_uevent_skb+0x7d/0x230 lib/kobject_uevent.c:289
       uevent_net_broadcast_untagged lib/kobject_uevent.c:326 [inline]
       kobject_uevent_net_broadcast+0x2fd/0x560 lib/kobject_uevent.c:410
       kobject_uevent_env+0x55f/0x9e0 lib/kobject_uevent.c:608
       nbd_config_put+0x14e/0x580 drivers/block/nbd.c:1440
       nbd_release+0x101/0x140 drivers/block/nbd.c:1756
       bdev_release+0x541/0x660 block/bdev.c:-1
       blkdev_release+0x15/0x20 block/fops.c:705
       __fput+0x461/0xa90 fs/file_table.c:469
       fput_close_sync+0x11f/0x240 fs/file_table.c:574
       __do_sys_close fs/open.c:1509 [inline]
       __se_sys_close fs/open.c:1494 [inline]
       __x64_sys_close+0x7e/0x110 fs/open.c:1494
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  fs_reclaim --> cpuhp_state-up --> uevent_sock_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(uevent_sock_mutex);
                               lock(cpuhp_state-up);
                               lock(uevent_sock_mutex);
  lock(fs_reclaim);

 *** DEADLOCK ***

3 locks held by udevd/17714:
 #0: ffff8880265394c8 (&disk->open_mutex){+.+.}-{4:4}, at: bdev_release+0x1af/0x660 block/bdev.c:1144
 #1: ffff888026357a48 (&nbd->config_lock){+.+.}-{4:4}, at: refcount_dec_and_mutex_lock+0x30/0xa0 lib/refcount.c:118
 #2: ffffffff8f50f6f8 (uevent_sock_mutex){+.+.}-{4:4}, at: uevent_net_broadcast_untagged lib/kobject_uevent.c:317 [inline]
 #2: ffffffff8f50f6f8 (uevent_sock_mutex){+.+.}-{4:4}, at: kobject_uevent_net_broadcast+0x281/0x560 lib/kobject_uevent.c:410

stack backtrace:
CPU: 1 UID: 0 PID: 17714 Comm: udevd Tainted: G             L      syzkaller #0 PREEMPT_{RT,(full)} 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/27/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e1/0x300 kernel/locking/lockdep.c:2043
 check_noncircular+0x12e/0x150 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x15a5/0x2cf0 kernel/locking/lockdep.c:5237
 lock_acquire+0xf0/0x2e0 kernel/locking/lockdep.c:5868
 __fs_reclaim_acquire mm/page_alloc.c:4348 [inline]
 fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4362
 might_alloc include/linux/sched/mm.h:317 [inline]
 slab_pre_alloc_hook mm/slub.c:4493 [inline]
 slab_alloc_node mm/slub.c:4846 [inline]
 kmem_cache_alloc_node_noprof+0x4b/0x6e0 mm/slub.c:4921
 __alloc_skb+0x1d0/0x7d0 net/core/skbuff.c:702
 alloc_skb include/linux/skbuff.h:1383 [inline]
 alloc_uevent_skb+0x7d/0x230 lib/kobject_uevent.c:289
 uevent_net_broadcast_untagged lib/kobject_uevent.c:326 [inline]
 kobject_uevent_net_broadcast+0x2fd/0x560 lib/kobject_uevent.c:410
 kobject_uevent_env+0x55f/0x9e0 lib/kobject_uevent.c:608
 nbd_config_put+0x14e/0x580 drivers/block/nbd.c:1440
 nbd_release+0x101/0x140 drivers/block/nbd.c:1756
 bdev_release+0x541/0x660 block/bdev.c:-1
 blkdev_release+0x15/0x20 block/fops.c:705
 __fput+0x461/0xa90 fs/file_table.c:469
 fput_close_sync+0x11f/0x240 fs/file_table.c:574
 __do_sys_close fs/open.c:1509 [inline]
 __se_sys_close fs/open.c:1494 [inline]
 __x64_sys_close+0x7e/0x110 fs/open.c:1494
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f8673677407
Code: 48 89 fa 4c 89 df e8 38 aa 00 00 8b 93 08 03 00 00 59 5e 48 83 f8 fc 74 1a 5b c3 0f 1f 84 00 00 00 00 00 48 8b 44 24 10 0f 05 <5b> c3 0f 1f 80 00 00 00 00 83 e2 39 83 fa 08 75 de e8 23 ff ff ff
RSP: 002b:00007ffde0577e70 EFLAGS: 00000202 ORIG_RAX: 0000000000000003
RAX: ffffffffffffffda RBX: 00007f8673589880 RCX: 00007f8673677407
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000008
RBP: 00007f86735896e8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000000000002
R13: 0000560ef6049190 R14: 0000000000000008 R15: 0000560ef607f370
 </TASK>


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
