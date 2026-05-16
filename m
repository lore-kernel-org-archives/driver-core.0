Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11A564A8C
	for <driver-core@lists.linux.dev>; Sat, 16 May 2026 00:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778890296; cv=none; b=KqLKehai6XTKNjattZp4u5ebm0BD94xdTRzMJJkFXeKd4jqv3mqzdsTxQ/F/vf83t9qjw5rfHjC4fAaE8PnSFSdvssUL+OwgToggE5A0fxMilofRsWzJaz5SpfLLhqRt5cJk6cAWbtIWL1mGNFWlCyb8cc7m+x5XRWqL6akraFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778890296; c=relaxed/simple;
	bh=cidIbkNFOHOkDfFWa9HG7cJ3qg0ztKZpQiF90IFPWuk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=YgyZwzczLcoIYb8ti8fAYWAKSAc1ML8INGNgfVSc/K1m1IPlghfUFild7/zMUbN9sIMWm6ej3e2Q+GLCzckEo5v9d6ZW7vHP/9N5szlFy6vK6Yyppe53s13vta/OkPkCUcTo4CAM9Jm63L8CpAqIngiD6T/cVcEa2YRxZbpyc0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7deb9de359bso742390a34.3
        for <driver-core@lists.linux.dev>; Fri, 15 May 2026 17:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778890293; x=1779495093;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MoFHbJUNPhTk8UOPibnU4/XIYfLwFDiyI4kWnVUA2LQ=;
        b=XD6CXK4cChzPusP3YLysL+DBCcugE3KL5m/8WdDi5Dxo7D5yKLtIiy7qeVprGNMcwl
         3EBx1oPBqZJnYlwu8Lu7pxqIkOQ5AfpPCrWCXkPwIQslODvRA+oAUp4xbavEfxK75KwT
         UG0RfX9J9yfv+NzYH7ZsjZktTPcP5NgL6tmIH/QNp+oPB9SGK/mQUMJgv8h1Ua57m0sj
         XSc09z2sa+8jtjRlIC9/+OzXpud9hjRplLs7hhwma3Wm4+nnbNeUUrZQv1Rzs4Noba6R
         7EAY/+Lmy/9OY+Sb+Cr/dMbmyrqSJd68xMgrAcwMLILU77k6IV17dikJgjVCSJpMjcfX
         KjUw==
X-Forwarded-Encrypted: i=1; AFNElJ+SRmECDIzYHX4mwL4CHcCZmcaScb/6/y/OshQKsOGaAe632lfN9npKQsEyu8SWJEHRcjzI0rZc8+RSXg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy8tyKY48tHnrlNag3Z7qD2PqPzIOY/TixE7QMX5M77qQnN5NM9
	FH4ldXTwYeW/EyAIoq/e5pYtxPM/s2/N7TXGK/kco0/eUH+VK1LhRp1/MnYwtgMOA+9dM1+2idO
	Ec4mSToHma7V9dPEayu8oD8hGV2fizt3P27mluKpB8tyBgR5zf34PsyQE16M=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:290e:b0:696:2674:8a07 with SMTP id
 006d021491bc7-69c9437a0e0mr4155869eaf.33.1778890293616; Fri, 15 May 2026
 17:11:33 -0700 (PDT)
Date: Fri, 15 May 2026 17:11:33 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a07b635.170a0220.df43.0000.GAE@google.com>
Subject: [syzbot] [kernel?] INFO: task hung in nsim_bus_dev_del
From: syzbot <syzbot+1cf303af03cf30b1275a@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5cbb61bf4168 arm64/fpsimd: ptrace: zero target's fpsimd_st..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=165db76c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a834c6344141a58b
dashboard link: https://syzkaller.appspot.com/bug?extid=1cf303af03cf30b1275a
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12c4d56a580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115db76c580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/04156ec16593/disk-5cbb61bf.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6bfa041e2c79/vmlinux-5cbb61bf.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a92d82d8a79e/Image-5cbb61bf.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1cf303af03cf30b1275a@syzkaller.appspotmail.com

INFO: task syz-executor:4797 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:0     pid:4797  tgid:4797  ppid:4796   task_flags:0x400140 flags:0x00800000
Call trace:
 __switch_to+0x2b0/0x6e0 arch/arm64/kernel/process.c:810 (T)
 context_switch kernel/sched/core.c:5387 [inline]
 __schedule+0x1b74/0x2d24 kernel/sched/core.c:7188
 __schedule_loop kernel/sched/core.c:7267 [inline]
 schedule+0xa4/0x140 kernel/sched/core.c:7282
 schedule_preempt_disabled+0x18/0x2c kernel/sched/core.c:7339
 __mutex_lock_common+0x98c/0x20f4 kernel/locking/mutex.c:726
 __mutex_lock kernel/locking/mutex.c:820 [inline]
 mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:873
 device_lock include/linux/device.h:1040 [inline]
 device_del+0xa0/0x710 drivers/base/core.c:3857
 device_unregister+0x2c/0xf0 drivers/base/core.c:3936
 nsim_bus_dev_del+0x60/0x88 drivers/net/netdevsim/bus.c:491
 del_device_store+0x248/0x2d0 drivers/net/netdevsim/bus.c:244
 bus_attr_store+0x80/0xa4 drivers/base/bus.c:172
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:142
 kernfs_fop_write_iter+0x264/0x3c0 fs/kernfs/file.c:352
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x52c/0xa14 fs/read_write.c:688
 ksys_write+0x12c/0x224 fs/read_write.c:740
 __do_sys_write fs/read_write.c:751 [inline]
 __se_sys_write fs/read_write.c:748 [inline]
 __arm64_sys_write+0x7c/0x90 fs/read_write.c:748
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xe8/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x25c arch/arm64/kernel/entry-common.c:723
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:742
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
INFO: task syz-executor:4805 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:0     pid:4805  tgid:4805  ppid:4801   task_flags:0x400140 flags:0x00800000
Call trace:
 __switch_to+0x2b0/0x6e0 arch/arm64/kernel/process.c:810 (T)
 context_switch kernel/sched/core.c:5387 [inline]
 __schedule+0x1b74/0x2d24 kernel/sched/core.c:7188
 __schedule_loop kernel/sched/core.c:7267 [inline]
 schedule+0xa4/0x140 kernel/sched/core.c:7282
 schedule_preempt_disabled+0x18/0x2c kernel/sched/core.c:7339
 __mutex_lock_common+0x98c/0x20f4 kernel/locking/mutex.c:726
 __mutex_lock kernel/locking/mutex.c:820 [inline]
 mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:873
 del_device_store+0xd8/0x2d0 drivers/net/netdevsim/bus.c:234
 bus_attr_store+0x80/0xa4 drivers/base/bus.c:172
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:142
 kernfs_fop_write_iter+0x264/0x3c0 fs/kernfs/file.c:352
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x52c/0xa14 fs/read_write.c:688
 ksys_write+0x12c/0x224 fs/read_write.c:740
 __do_sys_write fs/read_write.c:751 [inline]
 __se_sys_write fs/read_write.c:748 [inline]
 __arm64_sys_write+0x7c/0x90 fs/read_write.c:748
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xe8/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x25c arch/arm64/kernel/entry-common.c:723
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:742
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
INFO: task syz-executor:4809 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:0     pid:4809  tgid:4809  ppid:1      task_flags:0x400140 flags:0x00800001
Call trace:
 __switch_to+0x2b0/0x6e0 arch/arm64/kernel/process.c:810 (T)
 context_switch kernel/sched/core.c:5387 [inline]
 __schedule+0x1b74/0x2d24 kernel/sched/core.c:7188
 __schedule_loop kernel/sched/core.c:7267 [inline]
 schedule+0xa4/0x140 kernel/sched/core.c:7282
 schedule_preempt_disabled+0x18/0x2c kernel/sched/core.c:7339
 __mutex_lock_common+0x98c/0x20f4 kernel/locking/mutex.c:726
 __mutex_lock kernel/locking/mutex.c:820 [inline]
 mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:873
 del_device_store+0xd8/0x2d0 drivers/net/netdevsim/bus.c:234
 bus_attr_store+0x80/0xa4 drivers/base/bus.c:172
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:142
 kernfs_fop_write_iter+0x264/0x3c0 fs/kernfs/file.c:352
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x52c/0xa14 fs/read_write.c:688
 ksys_write+0x12c/0x224 fs/read_write.c:740
 __do_sys_write fs/read_write.c:751 [inline]
 __se_sys_write fs/read_write.c:748 [inline]
 __arm64_sys_write+0x7c/0x90 fs/read_write.c:748
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xe8/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x25c arch/arm64/kernel/entry-common.c:723
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:742
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
INFO: task syz-executor:4812 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor    state:D stack:0     pid:4812  tgid:4812  ppid:1      task_flags:0x400140 flags:0x00800001
Call trace:
 __switch_to+0x2b0/0x6e0 arch/arm64/kernel/process.c:810 (T)
 context_switch kernel/sched/core.c:5387 [inline]
 __schedule+0x1b74/0x2d24 kernel/sched/core.c:7188
 __schedule_loop kernel/sched/core.c:7267 [inline]
 schedule+0xa4/0x140 kernel/sched/core.c:7282
 schedule_preempt_disabled+0x18/0x2c kernel/sched/core.c:7339
 __mutex_lock_common+0x98c/0x20f4 kernel/locking/mutex.c:726
 __mutex_lock kernel/locking/mutex.c:820 [inline]
 mutex_lock_nested+0x2c/0x38 kernel/locking/mutex.c:873
 del_device_store+0xd8/0x2d0 drivers/net/netdevsim/bus.c:234
 bus_attr_store+0x80/0xa4 drivers/base/bus.c:172
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:142
 kernfs_fop_write_iter+0x264/0x3c0 fs/kernfs/file.c:352
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x52c/0xa14 fs/read_write.c:688
 ksys_write+0x12c/0x224 fs/read_write.c:740
 __do_sys_write fs/read_write.c:751 [inline]
 __se_sys_write fs/read_write.c:748 [inline]
 __arm64_sys_write+0x7c/0x90 fs/read_write.c:748
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xe8/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x25c arch/arm64/kernel/entry-common.c:723
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:742
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594

Showing all locks held in the system:
3 locks held by kworker/u8:0/12:
1 lock held by khungtaskd/31:
 #0: ffff800088ac66e0 (rcu_read_lock){....}-{1:3}, at: __ll_sc_atomic64_fetch_or arch/arm64/include/asm/atomic_ll_sc.h:-1 [inline]
 #0: ffff800088ac66e0 (rcu_read_lock){....}-{1:3}, at: arch_atomic64_fetch_or arch/arm64/include/asm/atomic.h:86 [inline]
 #0: ffff800088ac66e0 (rcu_read_lock){....}-{1:3}, at: raw_atomic64_fetch_or include/linux/atomic/atomic-arch-fallback.h:3816 [inline]
 #0: ffff800088ac66e0 (rcu_read_lock){....}-{1:3}, at: raw_atomic_long_fetch_or include/linux/atomic/atomic-long.h:1090 [inline]
 #0: ffff800088ac66e0 (rcu_read_lock){....}-{1:3}, at: arch_test_and_set_bit include/asm-generic/bitops/atomic.h:42 [inline]
 #0: ffff800088ac66e0 (rcu_read_lock){....}-{1:3}, at: test_and_set_bit include/asm-generic/bitops/instrumented-atomic.h:72 [inline]
 #0: ffff800088ac66e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire+0x0/0x44 kernel/sched/sched.h:3869
8 locks held by kworker/u8:3/40:
4 locks held by pr/ttyAMA-1/41:
3 locks held by kworker/u8:5/1188:
3 locks held by kworker/u8:6/1389:
3 locks held by kworker/u8:7/1910:
1 lock held by klogd/4292:
3 locks held by udevd/4303:
3 locks held by dhcpcd/4359:
2 locks held by getty/4451:
 #0: ffff0000d3bfb0a0 (&tty->ldisc_sem){++++}-{0:0}, at: ldsem_down_read+0x3c/0x4c drivers/tty/tty_ldsem.c:340
 #1: ffff80009228b2e8 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x354/0xf84 drivers/tty/n_tty.c:2211
3 locks held by kworker/1:3/4670:
 #0: ffff0000c002b540 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work+0x640/0x173c kernel/workqueue.c:3276
 #1: ffff8000966d7be0 (reg_work){+.+.}-{0:0}, at: process_one_work+0x6a4/0x173c kernel/workqueue.c:3276
 #2: ffff800089b85900 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock+0x20/0x2c net/core/rtnetlink.c:80
5 locks held by syz-executor/4797:
 #0: ffff0000d3e0c410 (sb_writers#6){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2724 [inline]
 #0: ffff0000d3e0c410 (sb_writers#6){.+.+}-{0:0}, at: vfs_write+0x240/0xa14 fs/read_write.c:684
 #1: ffff0000e8fb8880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1b4/0x3c0 fs/kernfs/file.c:343
 #2: ffff0000c922fd28 (kn->active#55){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:80 [inline]
 #2: ffff0000c922fd28 (kn->active#55){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x1f4/0x3c0 fs/kernfs/file.c:344
 #3: ffff800089383240 (nsim_bus_dev_list_lock){+.+.}-{4:4}, at: del_device_store+0xd8/0x2d0 drivers/net/netdevsim/bus.c:234
 #4: ffff0000d7b8a128 (&dev->mutex){....}-{4:4}, at: device_lock include/linux/device.h:1040 [inline]
 #4: ffff0000d7b8a128 (&dev->mutex){....}-{4:4}, at: device_del+0xa0/0x710 drivers/base/core.c:3857
4 locks held by syz-executor/4805:
 #0: ffff0000d3e0c410 (sb_writers#6){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2724 [inline]
 #0: ffff0000d3e0c410 (sb_writers#6){.+.+}-{0:0}, at: vfs_write+0x240/0xa14 fs/read_write.c:684
 #1: ffff0000eca42080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1b4/0x3c0 fs/kernfs/file.c:343
 #2: ffff0000c922fd28 (kn->active#55){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:80 [inline]
 #2: ffff0000c922fd28 (kn->active#55){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x1f4/0x3c0 fs/kernfs/file.c:344
 #3: ffff800089383240 (nsim_bus_dev_list_lock){+.+.}-{4:4}, at: del_device_store+0xd8/0x2d0 drivers/net/netdevsim/bus.c:234
4 locks held by syz-executor/4809:
 #0: ffff0000d3e0c410 (sb_writers#6){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2724 [inline]
 #0: ffff0000d3e0c410 (sb_writers#6){.+.+}-{0:0}, at: vfs_write+0x240/0xa14 fs/read_write.c:684
 #1: ffff0000eca0f880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1b4/0x3c0 fs/kernfs/file.c:343
 #2: ffff0000c922fd28 (kn->active#55){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:80 [inline]
 #2: ffff0000c922fd28 (kn->active#55){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x1f4/0x3c0 fs/kernfs/file.c:344
 #3: ffff800089383240 (nsim_bus_dev_list_lock){+.+.}-{4:4}, at: del_device_store+0xd8/0x2d0 drivers/net/netdevsim/bus.c:234
4 locks held by syz-executor/4812:
 #0: ffff0000d3e0c410 (sb_writers#6){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2724 [inline]
 #0: ffff0000d3e0c410 (sb_writers#6){.+.+}-{0:0}, at: vfs_write+0x240/0xa14 fs/read_write.c:684
 #1: ffff0000cd063c80 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1b4/0x3c0 fs/kernfs/file.c:343
 #2: ffff0000c922fd28 (kn->active#55){.+.+}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:80 [inline]
 #2: ffff0000c922fd28 (kn->active#55){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x1f4/0x3c0 fs/kernfs/file.c:344
 #3: ffff800089383240 (nsim_bus_dev_list_lock){+.+.}-{4:4}, at: del_device_store+0xd8/0x2d0 drivers/net/netdevsim/bus.c:234
3 locks held by kworker/u8:11/4904:
 #0: ffff0000ce706140 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_one_work+0x640/0x173c kernel/workqueue.c:3276
 #1: ffff8000995f7be0 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_one_work+0x6a4/0x173c kernel/workqueue.c:3276
 #2: ffff800089b85900 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_lock+0x20/0x2c net/core/rtnetlink.c:80
2 locks held by kworker/u8:12/4906:
2 locks held by kworker/u8:13/4908:
2 locks held by syz-executor/4913:
2 locks held by syz-executor/4914:

=============================================



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
