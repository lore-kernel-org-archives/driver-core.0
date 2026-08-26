Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C383747A885
	for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 19:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787772836; cv=none; b=A1bRJ+YEFumgURuncMUxiwYUk+wvyBwWPHH6Wc3Lx40VpqRCwTzU5HW9Lxjyb6LhP3cV1GCmf51iq4HJY+NV6/sXdolcCAW20awE0+CEzpWbxJSMFkn3cZyu2cCpnKGnst7RollEF8ra5Cq6jaODRfX1Wyj3fp5lYOtur1/FOrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787772836; c=relaxed/simple;
	bh=dwJ0Km8xFyUmUJZL1t4W2V0vZXyzbB64Kq7a31wFHx0=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=Z3SgyWxHn5fito4l0d+jkCljwWraH9jiSwJr+NAe9yAoPQ1iTYUdAdke+LFsgeAbiaMyOIA6TnjPkubwgxS2z66IMzdRSwN8QbY0JczHceSEa17IOBZFdE+w99s+ZmxkoEvHG9b9Va8pSRulEhrAFNeUa1F8wB+yzJPk9u2nOiE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28d7ffab1so472381b6e.1
        for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 12:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787772812; x=1788377612;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=EpN6HCY3VuL0wQB5DTOsumBmLAJvh/dVzyOQe0oWPQg=;
        b=WXijU5ppQAhdyumdxJ7vut/yTFo2uELZ+Uj8a8/e1OLLImnW6woYUjLiVeSi/PiGf/
         saxggZ8cjs812l+6vbNPzXm1ifFFYmq3lkz76iBHh6Gs7CfWJB5oYauyOHYtfUiMXMdS
         OVpWockrqAuoXNSRLq9oPjLetpBdQ5WS8x+275dyFowK0C3eGPKauvg3ULgh0AVJ+Y03
         Udh84pBYa/KqIvI57W6/i8R56KCM6A1ONLBlm+bhOa0vsybdWHsDuaJypkWcBxCGJf1Y
         mCm3lzw7Tp4+6Y9krd6jgojAt8bwntEjA7WfJOP890ZhAkfmO6B19FzZILANzl7pLL7C
         7JXQ==
X-Forwarded-Encrypted: i=1; AHgh+RpUyVzmRlgXw2YTtO4bUI49qfA0Ll475LtCImK9nEyVVq64vJKZW01tfMmEJd5UKiWG9UgWt3Ec9xqTaQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lubj3bSlwX86hOaJvF5sO+cdcK8zR7WzYKwqkICe7nObmcArll
	D6H39l2yTEzDIpAnoMxsJNQP6rN3VJOCvSfifed6fvmEm0NGUcbhoL85c8qtZSkxQoA4O5udfcn
	vj6rnB4WeaFbfUqQiVlz4UeB7j2uzslvHSCmp3r7WnkHuDk7MT/T7I7t7+Bo=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c173:b0:492:c9a4:2104 with SMTP id
 5614622812f47-4b37c999474mr1509133b6e.10.1787772811771; Wed, 26 Aug 2026
 12:33:31 -0700 (PDT)
Date: Wed, 26 Aug 2026 12:33:31 -0700
In-Reply-To: <69b99065.050a0220.248e02.0130.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f3f8b.50659fcc.60cd.0005.GAE@google.com>
Subject: Re: [syzbot] [kernfs?] possible deadlock in kernfs_link_sibling (2)
From: syzbot <syzbot+dd764a450d93885d847f@syzkaller.appspotmail.com>
To: bugs@syzkaller.appspotmail.com, davidkrehwinkel@gmail.com, 
	discussions@syzkaller.appspotmail.com, driver-core@lists.linux.dev, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	lore@syzkaller.appspotmail.com, mail@syzkaller.appspotmail.com, 
	syzkaller-bugs@googlegroups.com, tj@kernel.org, 
	vrp-test@vrp-mailer.hetzner-cloud.de
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    818bebeb63dd drm/xe: Don't hand out the flat CCS storage a..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=10059625580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccca94d2c01b9e78
dashboard link: https://syzkaller.appspot.com/bug?extid=dd764a450d93885d847f
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13de8d49580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+dd764a450d93885d847f@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kworker/3:0/34 is trying to acquire lock:
ffff88801d6a5a10 (&root->kernfs_iattr_rwsem){++++}-{4:4}, at: kernfs_link_sibling+0x555/0x850 fs/kernfs/dir.c:411

but task is already holding lock:
ffff88801d6a5980 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_add_one+0x38/0xaa0 fs/kernfs/dir.c:825

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #9 (&root->kernfs_rwsem){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       down_write+0x8b/0x1f0 kernel/locking/rwsem.c:1631
       kernfs_add_one+0x38/0xaa0 fs/kernfs/dir.c:825
       kernfs_create_dir_ns+0x157/0x2b0 fs/kernfs/dir.c:1130
       internal_create_group+0x36f/0xfb0 fs/sysfs/group.c:176
       cpuhp_invoke_callback+0x3b4/0x9a0 kernel/cpu.c:194
       cpuhp_issue_call+0x1b8/0x970 kernel/cpu.c:2354
       __cpuhp_setup_state_cpuslocked+0x431/0x880 kernel/cpu.c:2507
       __cpuhp_setup_state+0xf7/0x2f0 kernel/cpu.c:2536
       do_one_initcall+0x11c/0x6f0 init/main.c:1353
       do_initcall_level init/main.c:1415 [inline]
       do_initcalls init/main.c:1431 [inline]
       do_basic_setup init/main.c:1451 [inline]
       kernel_init_freeable+0x6ea/0x7b0 init/main.c:1666
       kernel_init+0x21/0x1e0 init/main.c:1556
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #8 (cpuhp_state_mutex){+.+.}-{4:4}:

-> #7 (cpu_hotplug_lock){++++}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read include/linux/percpu-rwsem.h:77 [inline]
       cpus_read_lock+0x42/0x170 kernel/cpu.c:490
       static_key_slow_inc+0x12/0x30 kernel/jump_label.c:190
       nbd_genl_reconnect_sock_cb+0x39f/0x990 drivers/block/nbd.c:1377
       nbd_genl_foreach_sock+0x2ab/0x3e0 drivers/block/nbd.c:2152
       nbd_genl_reconfigure+0x861/0xde0 drivers/block/nbd.c:2477
       genl_family_rcv_msg_doit+0x214/0x300 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x560/0x800 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x159/0x420 net/netlink/af_netlink.c:2556
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
       netlink_unicast+0x585/0x850 net/netlink/af_netlink.c:1345
       netlink_sendmsg+0x8b0/0xda0 net/netlink/af_netlink.c:1900
       sock_sendmsg_nosec net/socket.c:800 [inline]
       __sock_sendmsg net/socket.c:815 [inline]
       __sys_sendto+0x48b/0x4e0 net/socket.c:2281
       __do_sys_sendto net/socket.c:2288 [inline]
       __se_sys_sendto net/socket.c:2284 [inline]
       __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2284
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #6 (&nsock->tx_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bc0 kernel/locking/mutex.c:821
       nbd_handle_cmd drivers/block/nbd.c:1143 [inline]
       nbd_queue_rq+0x42d/0xfa0 drivers/block/nbd.c:1207
       blk_mq_dispatch_rq_list+0x428/0x1e60 block/blk-mq.c:2117
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xcea/0x1620 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x1c0 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x135/0x380 block/blk-mq.c:2531
       process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
       process_scheduled_works kernel/workqueue.c:3470 [inline]
       worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #5 (&cmd->lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bc0 kernel/locking/mutex.c:821
       nbd_queue_rq+0xba/0xfa0 drivers/block/nbd.c:1199
       blk_mq_dispatch_rq_list+0x428/0x1e60 block/blk-mq.c:2117
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xcea/0x1620 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xd7/0x1c0 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x135/0x380 block/blk-mq.c:2531
       process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
       process_scheduled_works kernel/workqueue.c:3470 [inline]
       worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #4 (set->srcu){.+.+}-{0:0}:
       lock_sync kernel/locking/lockdep.c:5934 [inline]
       lock_sync+0x9d/0x110 kernel/locking/lockdep.c:5922
       srcu_lock_sync include/linux/srcu.h:199 [inline]
       __synchronize_srcu+0xa2/0x300 kernel/rcu/srcutree.c:1481
       blk_mq_wait_quiesce_done block/blk-mq.c:284 [inline]
       blk_mq_wait_quiesce_done block/blk-mq.c:281 [inline]
       blk_mq_quiesce_queue block/blk-mq.c:304 [inline]
       blk_mq_quiesce_queue+0x149/0x1c0 block/blk-mq.c:299
       elevator_switch+0x17b/0x7e0 block/elevator.c:576
       elevator_change+0x352/0x530 block/elevator.c:681
       elevator_set_default+0x29e/0x360 block/elevator.c:754
       blk_register_queue+0x48e/0x630 block/blk-sysfs.c:992
       __add_disk+0x73f/0xe40 block/genhd.c:524
       add_disk_fwnode+0x118/0x480 block/genhd.c:593
       add_disk include/linux/blkdev.h:798 [inline]
       nbd_dev_add+0x779/0xb10 drivers/block/nbd.c:2026
       nbd_init+0x2c5/0x2e0 drivers/block/nbd.c:2743
       do_one_initcall+0x11c/0x6f0 init/main.c:1353
       do_initcall_level init/main.c:1415 [inline]
       do_initcalls init/main.c:1431 [inline]
       do_basic_setup init/main.c:1451 [inline]
       kernel_init_freeable+0x6ea/0x7b0 init/main.c:1666
       kernel_init+0x21/0x1e0 init/main.c:1556
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #3 (&q->elevator_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bc0 kernel/locking/mutex.c:821
       elevator_change+0x1bc/0x530 block/elevator.c:679
       elevator_set_none+0x92/0xf0 block/elevator.c:769
       blk_mq_elv_switch_none block/blk-mq.c:5102 [inline]
       __blk_mq_update_nr_hw_queues block/blk-mq.c:5147 [inline]
       blk_mq_update_nr_hw_queues+0x4c1/0x15f0 block/blk-mq.c:5212
       nbd_start_device+0x1a6/0xbd0 drivers/block/nbd.c:1530
       nbd_genl_connect+0xfc2/0x1760 drivers/block/nbd.c:2310
       genl_family_rcv_msg_doit+0x214/0x300 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x560/0x800 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x159/0x420 net/netlink/af_netlink.c:2556
       genl_rcv+0x28/0x40 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
       netlink_unicast+0x585/0x850 net/netlink/af_netlink.c:1345
       netlink_sendmsg+0x8b0/0xda0 net/netlink/af_netlink.c:1900
       sock_sendmsg_nosec net/socket.c:800 [inline]
       __sock_sendmsg net/socket.c:815 [inline]
       __sys_sendto+0x48b/0x4e0 net/socket.c:2281
       __do_sys_sendto net/socket.c:2288 [inline]
       __se_sys_sendto net/socket.c:2284 [inline]
       __x64_sys_sendto+0xe0/0x1c0 net/socket.c:2284
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&q->q_usage_counter(io)#49){++++}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       blk_alloc_queue+0x610/0x790 block/blk-core.c:504
       blk_mq_alloc_queue+0x174/0x290 block/blk-mq.c:4420
       __blk_mq_alloc_disk+0x29/0x120 block/blk-mq.c:4467
       nbd_dev_add+0x491/0xb10 drivers/block/nbd.c:1996
       nbd_init+0x2c5/0x2e0 drivers/block/nbd.c:2743
       do_one_initcall+0x11c/0x6f0 init/main.c:1353
       do_initcall_level init/main.c:1415 [inline]
       do_initcalls init/main.c:1431 [inline]
       do_basic_setup init/main.c:1451 [inline]
       kernel_init_freeable+0x6ea/0x7b0 init/main.c:1666
       kernel_init+0x21/0x1e0 init/main.c:1556
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #1 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
       fs_reclaim_acquire+0xc4/0x100 mm/page_alloc.c:4389
       might_alloc include/linux/sched/mm.h:314 [inline]
       slab_pre_alloc_hook mm/slub.c:4539 [inline]
       slab_alloc_node mm/slub.c:4899 [inline]
       kmem_cache_alloc_noprof+0x63/0x6a0 mm/slub.c:4933
       __kernfs_iattrs+0x126/0x450 fs/kernfs/inode.c:36
       kernfs_iattrs fs/kernfs/inode.c:60 [inline]
       __kernfs_setattr+0x4d/0x3c0 fs/kernfs/inode.c:73
       kernfs_iop_setattr+0xda/0x130 fs/kernfs/inode.c:127
       notify_change+0xb25/0x1330 fs/attr.c:556
       do_truncate+0x1df/0x240 fs/open.c:68
       handle_truncate fs/namei.c:4300 [inline]
       do_open fs/namei.c:4841 [inline]
       path_openat+0x1e6d/0x2440 fs/namei.c:5000
       do_file_open+0x20e/0x430 fs/namei.c:5029
       do_sys_openat2+0x10f/0x1e0 fs/open.c:1417
       do_sys_open fs/open.c:1423 [inline]
       __do_sys_openat fs/open.c:1439 [inline]
       __se_sys_openat fs/open.c:1434 [inline]
       __x64_sys_openat+0x12d/0x210 fs/open.c:1434
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&root->kernfs_iattr_rwsem){++++}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3181
       check_prevs_add kernel/locking/lockdep.c:3300 [inline]
       validate_chain kernel/locking/lockdep.c:3924 [inline]
       __lock_acquire+0x1492/0x1ec0 kernel/locking/lockdep.c:5253
       lock_acquire kernel/locking/lockdep.c:5886 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
       down_write+0x8b/0x1f0 kernel/locking/rwsem.c:1631
       kernfs_link_sibling+0x555/0x850 fs/kernfs/dir.c:411
       kernfs_add_one+0x1e7/0xaa0 fs/kernfs/dir.c:844
       kernfs_create_dir_ns+0x157/0x2b0 fs/kernfs/dir.c:1130
       sysfs_create_dir_ns+0x13a/0x2b0 fs/sysfs/dir.c:59
       create_dir lib/kobject.c:73 [inline]
       kobject_add_internal+0x2c8/0x930 lib/kobject.c:240
       kobject_add_varg lib/kobject.c:374 [inline]
       kobject_add+0x16a/0x1e0 lib/kobject.c:426
       device_add+0x294/0x1970 drivers/base/core.c:3699
       hid_add_device+0x2bf/0x440 drivers/hid/hid-core.c:3065
       uhid_device_add_worker+0x3a/0x70 drivers/hid/uhid.c:73
       process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
       process_scheduled_works kernel/workqueue.c:3470 [inline]
       worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
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

locks held by kworker/3:0/34: 3, last CPU#3:
 #0: ffff88801c0aa940 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x1466/0x1b10 kernel/workqueue.c:3362
 #1: ffffc900006dfd08 ((work_completion)(&uhid->worker)){+.+.}-{0:0}, at: process_one_work+0xa2c/0x1b10 kernel/workqueue.c:3363
 #2: ffff88801d6a5980 (&root->kernfs_rwsem){++++}-{4:4}, at: kernfs_add_one+0x38/0xaa0 fs/kernfs/dir.c:825

stack backtrace:
CPU: 3 UID: 0 PID: 34 Comm: kworker/3:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: events uhid_device_add_worker
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1be kernel/locking/lockdep.c:2059
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2191
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3181
 check_prevs_add kernel/locking/lockdep.c:3300 [inline]
 validate_chain kernel/locking/lockdep.c:3924 [inline]
 __lock_acquire+0x1492/0x1ec0 kernel/locking/lockdep.c:5253
 lock_acquire kernel/locking/lockdep.c:5886 [inline]
 lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5843
 down_write+0x8b/0x1f0 kernel/locking/rwsem.c:1631
 kernfs_link_sibling+0x555/0x850 fs/kernfs/dir.c:411
 kernfs_add_one+0x1e7/0xaa0 fs/kernfs/dir.c:844
 kernfs_create_dir_ns+0x157/0x2b0 fs/kernfs/dir.c:1130
 sysfs_create_dir_ns+0x13a/0x2b0 fs/sysfs/dir.c:59
 create_dir lib/kobject.c:73 [inline]
 kobject_add_internal+0x2c8/0x930 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_add+0x16a/0x1e0 lib/kobject.c:426
 device_add+0x294/0x1970 drivers/base/core.c:3699
 hid_add_device+0x2bf/0x440 drivers/hid/hid-core.c:3065
 uhid_device_add_worker+0x3a/0x70 drivers/hid/uhid.c:73
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3387
 process_scheduled_works kernel/workqueue.c:3470 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3551
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
input: shield Haptics as /devices/virtual/input/input5
shield 0003:0955:7214.0002: Registered Thunderstrike controller
shield 0003:0955:7214.0002: : USB HID v0.00 Gamepad [shield] on 


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
