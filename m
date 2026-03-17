Received: from mail-oo1-f79.google.com (mail-oo1-f79.google.com [209.85.161.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F590379999
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 17:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773768808; cv=none; b=KbCJMlNaJHvbg5BGegM8Dn9k0hQhbCBGtS7dGSKVQ99ZBJruVYN3SgLQYim0j2shVKB6KRgebYkQ+mSZHwrp816jrrcm6WMNHJYCHQi62PICMeIPShbyOUD0aoP2bj1hhfKGDJoEtLKql+JHkM/uXUbSQDsbsPc4a9WSOiaoLtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773768808; c=relaxed/simple;
	bh=EN1zTLk6mIu171jtTs7VfaCI8tHJu/M7APg+YWmylA4=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=SYlrtOhhHXWmaCw0A5+bx6sJLzYTKyOFxWFI/5PyJoKsVSA0huYWGzbE0694Axcr1CqVjQOOFfuD+Hzm86nvE7dppjMFICwHMCTASv5pwC5XF6w+F2TVL9NJ8O6XkSKid+S0AQwWdrXUwHJbVvOvejzQknjMAPgQ9ZGPU1c+zWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f79.google.com with SMTP id 006d021491bc7-67bb2273d42so98287362eaf.0
        for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 10:33:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773768805; x=1774373605;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0v4gSvfH2MqLRD/pCLg78wBSXRp8ALHAMqSlUlkSeUE=;
        b=iETLTlPOM0aI3OifEviH5K2nV2Q8W0hruDowPA9n766U8qWO07GMfNWpn7HpjQOt7I
         oTpVtI2qtFj8RTww9Ue8CJfnC+zNgmSOrR/cP6oivlya1HuzBB4Wr7zLAKEHv76WPF21
         idJoo9mViyXZUIXkgDfOgUb+GseDQJBAklWsqL3D0vtxOEIyUu570m8n21IlvcqGAp9w
         gNfxWb+AFsnOIQjC3RzsTzNZa5Z60dk4C5oYgfNV45ZiBL0071zIGS+qRoF+/ouUAG6l
         lwoAa/jqZb39yo7FnxjzqtjCY7PiMiUJ8WYNmqIjnR4sQmooG0pA7Ip8lvVT8xS9F+4L
         YfYQ==
X-Gm-Message-State: AOJu0Yys67o7usstWs0JVB6PfN3q0f9AxINvnBh59zBljceYSzS3YDGn
	DRz5PRt7oCu+uEs1VG2Jq0AW8JSG91ooosam8tifkekRQksqbs/RyZUiJFrHZRv2GV0ZaBAOTHX
	Y2DTVREIGFH/IBSpp6v8OgOjUyaox+5c/UlVyIokQ+0Xq3iQnOOtMkxWLHDfiFA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4b17:b0:67b:a77a:e665 with SMTP id
 006d021491bc7-67c0da9375bmr109090eaf.24.1773768805547; Tue, 17 Mar 2026
 10:33:25 -0700 (PDT)
Date: Tue, 17 Mar 2026 10:33:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69b99065.050a0220.248e02.0130.GAE@google.com>
Subject: [syzbot] [kernfs?] possible deadlock in kernfs_link_sibling (2)
From: syzbot <syzbot+dd764a450d93885d847f@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    2d1373e4246d Merge tag 'for-7.0-rc4-tag' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13ab3406580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=45cb3c58fd963c27
dashboard link: https://syzkaller.appspot.com/bug?extid=dd764a450d93885d847f
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b8f9fdb26fea/disk-2d1373e4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/1f20580466c5/vmlinux-2d1373e4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f051fb6711e4/bzImage-2d1373e4.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dd764a450d93885d847f@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
kworker/u9:1/11370 is trying to acquire lock:
ffff888019c4f2c0 (&root->kernfs_iattr_rwsem){++++}-{4:4}, at: kernfs_link_sibling+0x46c/0x540 fs/kernfs/dir.c:394

but task is already holding lock:
ffff888019c4f238 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_add_one+0x41/0x5c0 fs/kernfs/dir.c:796

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #10 (&root->kernfs_rwsem){++++}-{4:4}:
       down_write+0x3a/0x50 kernel/locking/rwsem.c:1590
       kernfs_add_one+0x41/0x5c0 fs/kernfs/dir.c:796
       kernfs_create_dir_ns+0xde/0x130 fs/kernfs/dir.c:1098
       internal_create_group+0x425/0x1180 fs/sysfs/group.c:176
       cpuhp_invoke_callback+0x445/0x860 kernel/cpu.c:194
       cpuhp_issue_call+0x430/0x7a0 kernel/cpu.c:-1
       __cpuhp_setup_state_cpuslocked+0x3d9/0x6b0 kernel/cpu.c:2507
       __cpuhp_setup_state+0x3f/0x60 kernel/cpu.c:2536
       do_one_initcall+0x250/0x8d0 init/main.c:1382
       do_initcall_level+0x104/0x190 init/main.c:1444
       do_initcalls+0x59/0xa0 init/main.c:1460
       kernel_init_freeable+0x2a6/0x3e0 init/main.c:1692
       kernel_init+0x1d/0x1d0 init/main.c:1582
       ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #9 (cpuhp_state_mutex){+.+.}-{4:4}:

-> #8 (cpu_hotplug_lock){++++}-{0:0}:
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read include/linux/percpu-rwsem.h:77 [inline]
       cpus_read_lock+0x42/0x160 kernel/cpu.c:490
       static_key_slow_inc+0x12/0x30 kernel/jump_label.c:190
       tcp_md5_do_add+0x1d4/0x390 net/ipv4/tcp_ipv4.c:1431
       tcp_v6_parse_md5_keys+0x562/0x680 net/ipv6/tcp_ipv6.c:-1
       do_tcp_setsockopt+0x12ee/0x2060 net/ipv4/tcp.c:4134
       do_sock_setsockopt+0x17c/0x1b0 net/socket.c:2322
       __sys_setsockopt net/socket.c:2347 [inline]
       __do_sys_setsockopt net/socket.c:2353 [inline]
       __se_sys_setsockopt net/socket.c:2350 [inline]
       __x64_sys_setsockopt+0x143/0x1b0 net/socket.c:2350
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #7 (sk_lock-AF_INET6){+.+.}-{0:0}:
       lock_sock_nested+0x3e/0x130 net/core/sock.c:3780
       lock_sock include/net/sock.h:1709 [inline]
       inet_shutdown+0x6a/0x390 net/ipv4/af_inet.c:919
       nbd_mark_nsock_dead+0x2e9/0x560 drivers/block/nbd.c:318
       recv_work+0x1c9d/0x1dc0 drivers/block/nbd.c:1021
       process_one_work kernel/workqueue.c:3276 [inline]
       process_scheduled_works+0xb6e/0x18c0 kernel/workqueue.c:3359
       worker_thread+0xa53/0xfc0 kernel/workqueue.c:3440
       kthread+0x388/0x470 kernel/kthread.c:436
       ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #6 (&nsock->tx_lock){+.+.}-{4:4}:
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

-> #5 (&cmd->lock){+.+.}-{4:4}:
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

-> #4 (set->srcu){.+.+}-{0:0}:
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

-> #3 (&q->elevator_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/rtmutex_api.c:533 [inline]
       mutex_lock_nested+0x5a/0x1d0 kernel/locking/rtmutex_api.c:552
       elevator_change+0x1b3/0x450 block/elevator.c:679
       elevator_set_none+0xb5/0x140 block/elevator.c:769
       blk_mq_elv_switch_none block/blk-mq.c:5110 [inline]
       __blk_mq_update_nr_hw_queues block/blk-mq.c:5155 [inline]
       blk_mq_update_nr_hw_queues+0x607/0x1a80 block/blk-mq.c:5220
       nbd_start_device+0x17f/0xb20 drivers/block/nbd.c:1489
       nbd_genl_connect+0x1651/0x1c80 drivers/block/nbd.c:2239
       genl_family_rcv_msg_doit+0x22a/0x330 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x61c/0x7a0 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x232/0x4b0 net/netlink/af_netlink.c:2550
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
       netlink_unicast+0x831/0x9f0 net/netlink/af_netlink.c:1344
       netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1894
       sock_sendmsg_nosec net/socket.c:727 [inline]
       __sock_sendmsg net/socket.c:742 [inline]
       ____sys_sendmsg+0x94c/0x9c0 net/socket.c:2592
       ___sys_sendmsg+0x2a5/0x360 net/socket.c:2646
       __sys_sendmsg net/socket.c:2678 [inline]
       __do_sys_sendmsg net/socket.c:2683 [inline]
       __se_sys_sendmsg net/socket.c:2681 [inline]
       __x64_sys_sendmsg+0x1c3/0x2a0 net/socket.c:2681
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&q->q_usage_counter(io)#75){++++}-{0:0}:
       blk_alloc_queue+0x54e/0x690 block/blk-core.c:461
       blk_mq_alloc_queue block/blk-mq.c:4429 [inline]
       __blk_mq_alloc_disk+0x197/0x390 block/blk-mq.c:4476
       nbd_dev_add+0x499/0xb50 drivers/block/nbd.c:1954
       nbd_genl_connect+0x965/0x1c80 drivers/block/nbd.c:2125
       genl_family_rcv_msg_doit+0x22a/0x330 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x61c/0x7a0 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x232/0x4b0 net/netlink/af_netlink.c:2550
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1318 [inline]
       netlink_unicast+0x831/0x9f0 net/netlink/af_netlink.c:1344
       netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1894
       sock_sendmsg_nosec net/socket.c:727 [inline]
       __sock_sendmsg net/socket.c:742 [inline]
       ____sys_sendmsg+0x94c/0x9c0 net/socket.c:2592
       ___sys_sendmsg+0x2a5/0x360 net/socket.c:2646
       __sys_sendmsg net/socket.c:2678 [inline]
       __do_sys_sendmsg net/socket.c:2683 [inline]
       __se_sys_sendmsg net/socket.c:2681 [inline]
       __x64_sys_sendmsg+0x1c3/0x2a0 net/socket.c:2681
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (fs_reclaim){+.+.}-{0:0}:
       __fs_reclaim_acquire mm/page_alloc.c:4348 [inline]
       fs_reclaim_acquire+0x71/0x100 mm/page_alloc.c:4362
       might_alloc include/linux/sched/mm.h:317 [inline]
       slab_pre_alloc_hook mm/slub.c:4489 [inline]
       slab_alloc_node mm/slub.c:4843 [inline]
       kmem_cache_alloc_noprof+0x44/0x680 mm/slub.c:4873
       __kernfs_iattrs+0xdf/0x340 fs/kernfs/inode.c:36
       kernfs_iattrs fs/kernfs/inode.c:61 [inline]
       __kernfs_setattr fs/kernfs/inode.c:74 [inline]
       kernfs_iop_setattr+0xea/0x3f0 fs/kernfs/inode.c:128
       notify_change+0xc18/0xf60 fs/attr.c:556
       do_truncate+0x1c2/0x250 fs/open.c:68
       handle_truncate fs/namei.c:4279 [inline]
       do_open fs/namei.c:4675 [inline]
       path_openat+0x2fc4/0x38a0 fs/namei.c:4830
       do_file_open+0x23e/0x4a0 fs/namei.c:4859
       do_sys_openat2+0x113/0x200 fs/open.c:1366
       do_sys_open fs/open.c:1372 [inline]
       __do_sys_openat fs/open.c:1388 [inline]
       __se_sys_openat fs/open.c:1383 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1383
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x14d/0xf80 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&root->kernfs_iattr_rwsem){++++}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x15a5/0x2cf0 kernel/locking/lockdep.c:5237
       lock_acquire+0xf0/0x2e0 kernel/locking/lockdep.c:5868
       down_write+0x3a/0x50 kernel/locking/rwsem.c:1590
       kernfs_link_sibling+0x46c/0x540 fs/kernfs/dir.c:394
       kernfs_add_one+0x1ca/0x5c0 fs/kernfs/dir.c:815
       kernfs_create_dir_ns+0xde/0x130 fs/kernfs/dir.c:1098
       sysfs_create_dir_ns+0x12f/0x2a0 fs/sysfs/dir.c:59
       create_dir lib/kobject.c:73 [inline]
       kobject_add_internal+0x631/0xd10 lib/kobject.c:240
       kobject_add_varg lib/kobject.c:374 [inline]
       kobject_add+0x163/0x240 lib/kobject.c:426
       device_add+0x408/0xb80 drivers/base/core.c:3627
       hci_conn_add_sysfs+0xd5/0x210 net/bluetooth/hci_sysfs.c:48
       hci_conn_complete_evt+0x77a/0x11d0 net/bluetooth/hci_event.c:3195
       hci_event_func net/bluetooth/hci_event.c:7784 [inline]
       hci_event_packet+0x805/0x12c0 net/bluetooth/hci_event.c:7838
       hci_rx_work+0x3ee/0x1030 net/bluetooth/hci_core.c:4077
       process_one_work kernel/workqueue.c:3276 [inline]
       process_scheduled_works+0xb6e/0x18c0 kernel/workqueue.c:3359
       worker_thread+0xa53/0xfc0 kernel/workqueue.c:3440
       kthread+0x388/0x470 kernel/kthread.c:436
       ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

Chain exists of:
  &root->kernfs_iattr_rwsem --> cpuhp_state_mutex --> &root->kernfs_rwsem

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&root->kernfs_rwsem);
                               lock(cpuhp_state_mutex);
                               lock(&root->kernfs_rwsem);
  lock(&root->kernfs_iattr_rwsem);

 *** DEADLOCK ***

4 locks held by kworker/u9:1/11370:
 #0: ffff888033cf8938 ((wq_completion)hci0#2){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3251 [inline]
 #0: ffff888033cf8938 ((wq_completion)hci0#2){+.+.}-{0:0}, at: process_scheduled_works+0xa52/0x18c0 kernel/workqueue.c:3359
 #1: ffffc90005fefc40 ((work_completion)(&hdev->rx_work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3252 [inline]
 #1: ffffc90005fefc40 ((work_completion)(&hdev->rx_work)){+.+.}-{0:0}, at: process_scheduled_works+0xa8d/0x18c0 kernel/workqueue.c:3359
 #2: ffff8880392140b0 (&hdev->lock){+.+.}-{4:4}, at: hci_conn_complete_evt+0xbb/0x11d0 net/bluetooth/hci_event.c:3113
 #3: ffff888019c4f238 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_add_one+0x41/0x5c0 fs/kernfs/dir.c:796

stack backtrace:
CPU: 0 UID: 0 PID: 11370 Comm: kworker/u9:1 Tainted: G             L      syzkaller #0 PREEMPT_{RT,(full)} 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
Workqueue: hci0 hci_rx_work
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
 down_write+0x3a/0x50 kernel/locking/rwsem.c:1590
 kernfs_link_sibling+0x46c/0x540 fs/kernfs/dir.c:394
 kernfs_add_one+0x1ca/0x5c0 fs/kernfs/dir.c:815
 kernfs_create_dir_ns+0xde/0x130 fs/kernfs/dir.c:1098
 sysfs_create_dir_ns+0x12f/0x2a0 fs/sysfs/dir.c:59
 create_dir lib/kobject.c:73 [inline]
 kobject_add_internal+0x631/0xd10 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_add+0x163/0x240 lib/kobject.c:426
 device_add+0x408/0xb80 drivers/base/core.c:3627
 hci_conn_add_sysfs+0xd5/0x210 net/bluetooth/hci_sysfs.c:48
 hci_conn_complete_evt+0x77a/0x11d0 net/bluetooth/hci_event.c:3195
 hci_event_func net/bluetooth/hci_event.c:7784 [inline]
 hci_event_packet+0x805/0x12c0 net/bluetooth/hci_event.c:7838
 hci_rx_work+0x3ee/0x1030 net/bluetooth/hci_core.c:4077
 process_one_work kernel/workqueue.c:3276 [inline]
 process_scheduled_works+0xb6e/0x18c0 kernel/workqueue.c:3359
 worker_thread+0xa53/0xfc0 kernel/workqueue.c:3440
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x51e/0xb90 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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
