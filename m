Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793110786;
	b=3fVRh3em7ABE/0ZZTLd4VuKKbHKAFhVeu5TAwiUTGb9lc5xRclHgdgAPH4rO348mvbWK
	 hsufoPb+zGAJvKZOChRqvZfCcgZdCRYRVbSB5IHS3Lv2YkqAJJXowISC49BwrhMOSiDpB
	 gdsdQjRCQqmbowwCVv3SX1tQxpF+cZgpK9Lg1YGm2wB31gkM9qni11hnuaPLB5QCaNNg3
	 eJiI8nmMia/q80Z1fddl3jGRU2EK97E1pnE86zDmbcZURvS8yUCHBeNx9MFSEDwBFuKqB
	 0oH9anYxE9ryfgoPpAX7Nl4e8Y+J3w8ue64Cd76joKdyMbosbr848uSOTwfcIcvscxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793110786;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=Xxb2C5AQj0rr/VWvQ2QcIPd2Z1Ta2Cke0WrVR0vejOw=;
	b=HDrU4Lh5QKDY/fFyszhUpVV6Cp761/6QKrU3byCysMATf33ju0H/IwWWby4fTzzGeEuV
	 X3McQ+rjx/E71wPQWS+QqjTDY9WCiiNSoLVs+rGM+6pnQXvKBfY6QQRIPAT3a9amlYM/P
	 DyzK8J5ZN9TJEYC40+HduC5p9aGUfUSTfezM+JS0Jamb6/Yq4pahre7xr33QVsZIJfxUp
	 bS6tVaw1egJ/G9pzbnDuf8XN/HeOkexyVHkq9Tr4jkHJ38LRKClUQe9iDxBaaBGzIQQLW
	 4+83O9WgyxjP2IH8rMiHenCupOvQ+Qz3JU4558NrNSaASW4ZUDtb5vaoExd7eZHYQ7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FDD7606A31A
	for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 14:19:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2FDD7606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4a45b3f0bdfso6163762b6e.1
        for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 07:19:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793110785; x=1793715585;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Xxb2C5AQj0rr/VWvQ2QcIPd2Z1Ta2Cke0WrVR0vejOw=;
        b=2Ny5hCx9RN3mtbFwhG9+/c5YXzhT3Lw8npIiLx58lOUFs29XpgldrzoPzY/0eNRomn
         ScNw5IPtSMukkFrrWO7iecxESY86IXFVST4s55mgJqed7JWeeaap/BDgEWCXc906mCOw
         8ecQXu2t5qQCZF676Hhf79Dmqluo9u+/LFP4F40WhQz+G4SB/i7YmPwlkSVFDiuYJ2SM
         PW6WcocMjqCkFQ8B7Pmqbk7+4/g+KAzL12qo65rgQM3EPgZHwFc1T6ANsr+G0JhzlOm/
         ZBW9AtDQys168/IwPr8kWpx2oIQrFSFUS+D038rGK8G1UghQyJeWrd/plRZSSV95dBNk
         d3Hg==
X-Forwarded-Encrypted: i=1; AKwUvByv6806Dt26KMIiu4eoAyav8dJ5iJfxi1lCkUzs3lm/CM+wdVBp31j1rmVTluEXb9lWwx5OYlxUYwBB0Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKJbOD3ngxKIEUirEwc0CTaO1CvZCTEhCVqdp2Uy8wb00lEKg/j
	R2MURvu0MEDPX2VD2qW5dvOmklFgn9+pUn2sR4DjZfSvFPNrCmHumM3MMVAptL6Bfzr3sUFMqpC
	mafD5JRICsSQi5saMOglJCJaubJHoW0LCp7nr8ZYsoTEjQpfN5ZWqRKuCJLo=
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1b08:b0:4f6:a430:1822 with SMTP id
 5614622812f47-55bfff6a71fmr6397452b6e.7.1793110785123; Tue, 27 Oct 2026
 07:19:45 -0700 (PDT)
Date: Tue, 27 Oct 2026 07:19:45 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae0b301.6200f071.51519.0f5c.GAE@google.com>
Subject: [syzbot] [driver-core?] possible deadlock in device_register (2)
From: syzbot <syzbot+a246ab421a728c78b4ad@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7a19f0cc94ad Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=17ba5fc9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6602d83d2f34eb80
dashboard link: https://syzkaller.appspot.com/bug?extid=a246ab421a728c78b4ad
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10b04a95580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a246ab421a728c78b4ad@syzkaller.appspotmail.com

block nbd0: reconnected socket
======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz-executor796/5066 is trying to acquire lock:
ffff800089aea6a0 (fs_reclaim){+.+.}-{0:0}, at: might_alloc include/linux/sched/mm.h:316 [inline]
ffff800089aea6a0 (fs_reclaim){+.+.}-{0:0}, at: slab_pre_alloc_hook mm/slub.c:4636 [inline]
ffff800089aea6a0 (fs_reclaim){+.+.}-{0:0}, at: slab_alloc_node mm/slub.c:4974 [inline]
ffff800089aea6a0 (fs_reclaim){+.+.}-{0:0}, at: kmem_cache_alloc_node_noprof+0x64/0x604 mm/slub.c:5068

but task is already holding lock:
ffff80008ae5fb20 (uevent_sock_mutex){+.+.}-{4:4}, at: uevent_net_broadcast_untagged lib/kobject_uevent.c:317 [inline]
ffff80008ae5fb20 (uevent_sock_mutex){+.+.}-{4:4}, at: kobject_uevent_net_broadcast+0x24c/0x53c lib/kobject_uevent.c:410

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #7 (uevent_sock_mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x164/0x1078 kernel/locking/mutex.c:821
       mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
       uevent_net_broadcast_untagged lib/kobject_uevent.c:317 [inline]
       kobject_uevent_net_broadcast+0x24c/0x53c lib/kobject_uevent.c:410
       kobject_uevent_env+0x518/0x944 lib/kobject_uevent.c:611
       kobject_uevent+0x2c/0x3c lib/kobject_uevent.c:659
       device_add+0x4d0/0x9e0 drivers/base/core.c:3742
       device_register+0x28/0x38 drivers/base/core.c:3858
       register_cpu+0x28c/0x57c drivers/base/cpu.c:431
       arch_register_cpu+0x160/0x224 arch/arm64/kernel/smp.c:535
       acpi_processor_hotadd_init drivers/acpi/acpi_processor.c:248 [inline]
       acpi_processor_get_info drivers/acpi/acpi_processor.c:370 [inline]
       acpi_processor_add+0x8f0/0x13f0 drivers/acpi/acpi_processor.c:441
       acpi_scan_attach_handler drivers/acpi/scan.c:2325 [inline]
       acpi_bus_attach+0x398/0x778 drivers/acpi/scan.c:2374
       acpi_dev_for_one_check+0xa0/0xb4 drivers/acpi/bus.c:1172
       device_for_each_child+0xf4/0x184 drivers/base/core.c:4105
       acpi_dev_for_each_child+0x98/0xe4 drivers/acpi/bus.c:1184
       acpi_bus_attach+0x540/0x778 drivers/acpi/scan.c:2390
       acpi_dev_for_one_check+0xa0/0xb4 drivers/acpi/bus.c:1172
       device_for_each_child+0xf4/0x184 drivers/base/core.c:4105
       acpi_dev_for_each_child+0x98/0xe4 drivers/acpi/bus.c:1184
       acpi_bus_attach+0x540/0x778 drivers/acpi/scan.c:2390
       acpi_bus_scan+0x104/0x310 drivers/acpi/scan.c:2740
       acpi_scan_init+0x168/0x3cc drivers/acpi/scan.c:2866
       acpi_init+0x15c/0x1f4 drivers/acpi/bus.c:1499
       do_one_initcall+0x274/0x9f8 init/main.c:1362
       do_initcall_level+0x12c/0x1c4 init/main.c:1424
       do_initcalls+0x70/0xd0 init/main.c:1440
       do_basic_setup+0x7c/0x90 init/main.c:1460
       kernel_init_freeable+0x258/0x398 init/main.c:1675
       kernel_init+0x28/0x1e0 init/main.c:1565
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854

-> #6 (cpu_hotplug_lock){++++}-{0:0}:
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read include/linux/percpu-rwsem.h:77 [inline]
       cpus_read_lock+0x54/0x1c8 kernel/cpu.c:490
       static_key_slow_inc+0x1c/0x40 kernel/jump_label.c:190
       sk_set_memalloc+0x6c/0xa0 net/core/sock.c:307
       nbd_genl_reconnect_sock_cb+0x32c/0x72c drivers/block/nbd.c:1377
       nbd_genl_foreach_sock+0x204/0x3c8 drivers/block/nbd.c:2152
       nbd_genl_reconfigure+0x714/0x9e8 drivers/block/nbd.c:2477
       genl_family_rcv_msg_doit+0x1e4/0x2d4 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x43c/0x620 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2575
       genl_rcv+0x38/0x50 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1338 [inline]
       netlink_unicast+0x600/0x7f8 net/netlink/af_netlink.c:1364
       netlink_sendmsg+0x648/0x948 net/netlink/af_netlink.c:1919
       sock_sendmsg_nosec net/socket.c:800 [inline]
       __sock_sendmsg+0xc8/0x17c net/socket.c:815
       __sys_sendto+0x250/0x328 net/socket.c:2281
       __do_sys_sendto net/socket.c:2288 [inline]
       __se_sys_sendto net/socket.c:2284 [inline]
       __arm64_sys_sendto+0xec/0x10c net/socket.c:2284
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
       do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
       el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:796
       el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:815
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606

-> #5 (&nsock->tx_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x164/0x1078 kernel/locking/mutex.c:821
       mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
       nbd_handle_cmd drivers/block/nbd.c:1143 [inline]
       nbd_queue_rq+0x1f4/0xbac drivers/block/nbd.c:1207
       blk_mq_dispatch_rq_list+0x3d4/0x13a8 block/blk-mq.c:2130
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xa48/0x10e8 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xa8/0x158 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x154/0x2e4 block/blk-mq.c:2545
       process_one_work kernel/workqueue.c:3396 [inline]
       process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
       worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
       kthread+0x304/0x3d4 kernel/kthread.c:436
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854

-> #4 (&cmd->lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x164/0x1078 kernel/locking/mutex.c:821
       mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
       nbd_queue_rq+0xb0/0xbac drivers/block/nbd.c:1199
       blk_mq_dispatch_rq_list+0x3d4/0x13a8 block/blk-mq.c:2130
       __blk_mq_do_dispatch_sched block/blk-mq-sched.c:168 [inline]
       blk_mq_do_dispatch_sched block/blk-mq-sched.c:182 [inline]
       __blk_mq_sched_dispatch_requests+0xa48/0x10e8 block/blk-mq-sched.c:307
       blk_mq_sched_dispatch_requests+0xa8/0x158 block/blk-mq-sched.c:329
       blk_mq_run_work_fn+0x154/0x2e4 block/blk-mq.c:2545
       process_one_work kernel/workqueue.c:3396 [inline]
       process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3479
       worker_thread+0x798/0xbd0 kernel/workqueue.c:3560
       kthread+0x304/0x3d4 kernel/kthread.c:436
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854

-> #3 (set->srcu){.+.+}-{0:0}:
       srcu_lock_sync include/linux/srcu.h:210 [inline]
       __synchronize_srcu+0xc8/0x268 kernel/rcu/srcutree.c:1462
       synchronize_srcu+0x280/0x2e0 kernel/rcu/srcutree.c:-1
       blk_mq_wait_quiesce_done+0x88/0xac block/blk-mq.c:284
       blk_mq_quiesce_queue+0x70/0x8c block/blk-mq.c:304
       elevator_switch+0x128/0x38c block/elevator.c:576
       elevator_change+0x204/0x35c block/elevator.c:681
       elevator_set_default+0x190/0x2b0 block/elevator.c:754
       blk_register_queue+0x304/0x3dc block/blk-sysfs.c:992
       __add_disk+0x5c8/0xbdc block/genhd.c:531
       add_disk_fwnode+0xd4/0x340 block/genhd.c:600
       device_add_disk+0x38/0x4c block/genhd.c:630
       add_disk include/linux/blkdev.h:798 [inline]
       nbd_dev_add+0x594/0x884 drivers/block/nbd.c:2026
       nbd_init+0x174/0x19c drivers/block/nbd.c:2743
       do_one_initcall+0x274/0x9f8 init/main.c:1362
       do_initcall_level+0x12c/0x1c4 init/main.c:1424
       do_initcalls+0x70/0xd0 init/main.c:1440
       do_basic_setup+0x7c/0x90 init/main.c:1460
       kernel_init_freeable+0x258/0x398 init/main.c:1675
       kernel_init+0x28/0x1e0 init/main.c:1565
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854

-> #2 (&q->elevator_lock){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x164/0x1078 kernel/locking/mutex.c:821
       mutex_lock_nested+0x24/0x30 kernel/locking/mutex.c:874
       elevator_change+0x188/0x35c block/elevator.c:679
       elevator_set_none+0xa8/0x13c block/elevator.c:769
       blk_mq_elv_switch_none block/blk-mq.c:5113 [inline]
       __blk_mq_update_nr_hw_queues block/blk-mq.c:5158 [inline]
       blk_mq_update_nr_hw_queues+0x4c4/0x11e0 block/blk-mq.c:5223
       nbd_start_device+0x15c/0xa44 drivers/block/nbd.c:1530
       nbd_genl_connect+0xde4/0x12b0 drivers/block/nbd.c:2310
       genl_family_rcv_msg_doit+0x1e4/0x2d4 net/netlink/genetlink.c:1114
       genl_family_rcv_msg net/netlink/genetlink.c:1194 [inline]
       genl_rcv_msg+0x43c/0x620 net/netlink/genetlink.c:1209
       netlink_rcv_skb+0x238/0x414 net/netlink/af_netlink.c:2575
       genl_rcv+0x38/0x50 net/netlink/genetlink.c:1218
       netlink_unicast_kernel net/netlink/af_netlink.c:1338 [inline]
       netlink_unicast+0x600/0x7f8 net/netlink/af_netlink.c:1364
       netlink_sendmsg+0x648/0x948 net/netlink/af_netlink.c:1919
       sock_sendmsg_nosec net/socket.c:800 [inline]
       __sock_sendmsg+0xc8/0x17c net/socket.c:815
       __sys_sendto+0x250/0x328 net/socket.c:2281
       __do_sys_sendto net/socket.c:2288 [inline]
       __se_sys_sendto net/socket.c:2284 [inline]
       __arm64_sys_sendto+0xec/0x10c net/socket.c:2284
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
       do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
       el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:796
       el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:815
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606

-> #1 (&q->q_usage_counter(io)#33){++++}-{0:0}:
       blk_alloc_queue+0x488/0x590 block/blk-core.c:504
       blk_mq_alloc_queue+0x148/0x284 block/blk-mq.c:4431
       __blk_mq_alloc_disk+0x38/0x10c block/blk-mq.c:4478
       nbd_dev_add+0x3d0/0x884 drivers/block/nbd.c:1996
       nbd_init+0x174/0x19c drivers/block/nbd.c:2743
       do_one_initcall+0x274/0x9f8 init/main.c:1362
       do_initcall_level+0x12c/0x1c4 init/main.c:1424
       do_initcalls+0x70/0xd0 init/main.c:1440
       do_basic_setup+0x7c/0x90 init/main.c:1460
       kernel_init_freeable+0x258/0x398 init/main.c:1675
       kernel_init+0x28/0x1e0 init/main.c:1565
       ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854

-> #0 (fs_reclaim){+.+.}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1660/0x2b08 kernel/locking/lockdep.c:5288
       lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
       __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
       fs_reclaim_acquire+0x90/0x110 mm/page_alloc.c:4389
       might_alloc include/linux/sched/mm.h:316 [inline]
       slab_pre_alloc_hook mm/slub.c:4636 [inline]
       slab_alloc_node mm/slub.c:4974 [inline]
       kmem_cache_alloc_node_noprof+0x64/0x604 mm/slub.c:5068
       kmalloc_reserve+0xc4/0x214 net/core/skbuff.c:615
       __alloc_skb+0x230/0x610 net/core/skbuff.c:715
       alloc_skb include/linux/skbuff.h:1384 [inline]
       alloc_uevent_skb+0x78/0x1ec lib/kobject_uevent.c:289
       uevent_net_broadcast_untagged lib/kobject_uevent.c:326 [inline]
       kobject_uevent_net_broadcast+0x2d4/0x53c lib/kobject_uevent.c:410
       kobject_uevent_env+0x518/0x944 lib/kobject_uevent.c:611
       kobject_synth_uevent+0x25c/0x730 lib/kobject_uevent.c:207
       uevent_store+0x34/0x84 drivers/base/core.c:2847
       dev_attr_store+0x6c/0x90 drivers/base/core.c:2509
       sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x51c/0xa0c fs/read_write.c:687
       ksys_write+0x12c/0x228 fs/read_write.c:739
       __do_sys_write fs/read_write.c:750 [inline]
       __se_sys_write fs/read_write.c:747 [inline]
       __arm64_sys_write+0x84/0x98 fs/read_write.c:747
       __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
       invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
       el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
       do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
       el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:796
       el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:815
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606

other info that might help us debug this:

Chain exists of:
  fs_reclaim --> cpu_hotplug_lock --> uevent_sock_mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(uevent_sock_mutex);
                               lock(cpu_hotplug_lock);
                               lock(uevent_sock_mutex);
  lock(fs_reclaim);

 *** DEADLOCK ***

locks held by syz-executor796/5066: 5, last CPU#1:
 #0: ffff0000d2c57270 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x100/0x144 fs/file.c:1259
 #1: ffff0000d0736460 (sb_writers#6){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2756 [inline]
 #1: ffff0000d0736460 (sb_writers#6){.+.+}-{0:0}, at: vfs_write+0x248/0xa0c fs/read_write.c:683
 #2: ffff0000d1ef6c80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1b0/0x3b8 fs/kernfs/file.c:336
 #3: ffff0000c76cd2d8 (kn->active#4){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #3: ffff0000c76cd2d8 (kn->active#4){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x1f0/0x3b8 fs/kernfs/file.c:337
 #4: ffff80008ae5fb20 (uevent_sock_mutex){+.+.}-{4:4}, at: uevent_net_broadcast_untagged lib/kobject_uevent.c:317 [inline]
 #4: ffff80008ae5fb20 (uevent_sock_mutex){+.+.}-{4:4}, at: kobject_uevent_net_broadcast+0x24c/0x53c lib/kobject_uevent.c:410

stack backtrace:
CPU: 1 UID: 0 PID: 5066 Comm: syz-executor796 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/23/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_circular_bug+0x328/0x330 kernel/locking/lockdep.c:2087
 check_noncircular+0x158/0x174 kernel/locking/lockdep.c:2219
 check_prev_add kernel/locking/lockdep.c:3209 [inline]
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x1660/0x2b08 kernel/locking/lockdep.c:5288
 lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
 __fs_reclaim_acquire mm/page_alloc.c:4375 [inline]
 fs_reclaim_acquire+0x90/0x110 mm/page_alloc.c:4389
 might_alloc include/linux/sched/mm.h:316 [inline]
 slab_pre_alloc_hook mm/slub.c:4636 [inline]
 slab_alloc_node mm/slub.c:4974 [inline]
 kmem_cache_alloc_node_noprof+0x64/0x604 mm/slub.c:5068
 kmalloc_reserve+0xc4/0x214 net/core/skbuff.c:615
 __alloc_skb+0x230/0x610 net/core/skbuff.c:715
 alloc_skb include/linux/skbuff.h:1384 [inline]
 alloc_uevent_skb+0x78/0x1ec lib/kobject_uevent.c:289
 uevent_net_broadcast_untagged lib/kobject_uevent.c:326 [inline]
 kobject_uevent_net_broadcast+0x2d4/0x53c lib/kobject_uevent.c:410
 kobject_uevent_env+0x518/0x944 lib/kobject_uevent.c:611
 kobject_synth_uevent+0x25c/0x730 lib/kobject_uevent.c:207
 uevent_store+0x34/0x84 drivers/base/core.c:2847
 dev_attr_store+0x6c/0x90 drivers/base/core.c:2509
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x51c/0xa0c fs/read_write.c:687
 ksys_write+0x12c/0x228 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __arm64_sys_write+0x84/0x98 fs/read_write.c:747
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:796
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:815
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup
