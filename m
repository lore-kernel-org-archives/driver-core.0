Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F64D3E63B2
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 20:59:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788469181; cv=none; b=lw5QzZeKMG3d1A0PAK4eX+KtpN3rhrvz3gtByJugHC8YTgTSD7RDfHIt0IZ6Bxsnmyq0jGMxG9qmeumcHiNMun8VQtZYvQ7v3TiUm0jdmTMH1DX4y5DZEE3AdzHX251kIV2EQBY/bhSN3Oqv0yJ7OCWmC+dVs7itWiPwue+Wj7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788469181; c=relaxed/simple;
	bh=uuuDftWEtW1qFHxqtnhvjsGxPJjeQoFDiGsEqX6vzhk=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iBzHjokIA4JVbC/Ci7cyjCI6LSjj4ao0CiC49T6SmmxzoHX3+X6HsNAy3crNSpIedpZ5qtQCHfGmRaRM2j3sJ5HovU0i+MGTgrJow51bvxc2Qqof3dEtzSvQToZnVPqgcF3oALlhTep8yWe+ic/XkYKn2n4nfliNjr2MA7lWHw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f11.google.com with SMTP id 006d021491bc7-6b1b7b6ac7fso57506eaf.0
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 13:59:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788469171; x=1789073971;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yMC1/2CRu6w8oyeK+QAGBB/5FTYZSuHpWHz9c0PCyIo=;
        b=R/IbFZS3WOXB2C7PKeROMG6dvBSAtfoJSnluaRd1grNU+8F88gdfWL264Lm3551/ki
         1Mha+cuZ1UwSLoOEBTCaQC6kZ0buSzzyd+mZklsAN3ICXL6NymBxz3AgX629u7ptWrlZ
         S2WHQRQQnhbnlX6P48jRSpeWxGMsScKKLnk7rPEkHIfcvHTE5n8uiqBkd+sJPIbTiA4y
         UdWFi33EkK0XNgGcyXf0LIp8Kt7pLb01ahJZz2PrW+EI73vRDxaE8g/Xdpytj6ydcKv2
         tcNKGb+Quc9yTKXgFeNS8SiVN5+BF39b2e0T4YavRkNh1+/Uz9PX7K9kNumlwa7hpnbp
         j/xg==
X-Gm-Message-State: AFuF++mNRbshkaZCJeyOcbryTgy5/Oyz4LwHT1QlJla6HQs2YHrUNLX5
	bibXPKEX/VfxR0iuQyITQCFALCD75i+7g2gVlAUjUfknnQGZs/VAJGJEy/qnXBbPTok0Z9z0ojs
	ePAjuEgysqlrmIwqILTNve4LpH5WK1+Sf479d8TnwYeAYbFr9M5L6SJiUM7YJ6g==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:614:b0:6b1:9e75:6fe2 with SMTP id
 006d021491bc7-6b6fa3ddf94mr1334769eaf.12.1788469170902; Thu, 03 Sep 2026
 13:59:30 -0700 (PDT)
Date: Thu, 03 Sep 2026 13:59:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a99dfb2.9266084e.bf0d7.027d.GAE@google.com>
Subject: [syzbot] [kernfs?] possible deadlock in location_store
From: syzbot <syzbot+ab46e65f9ffd10729c79@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cee9395acd80 Linux 7.3-rc1
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1036139e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=ab46e65f9ffd10729c79
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=14634b49580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11412125580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3bd9f0104cfb/disk-cee9395a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/299da4fc0246/vmlinux-cee9395a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bf81ecd32215/Image-cee9395a.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ab46e65f9ffd10729c79@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
syz.0.59/5099 is trying to acquire lock:
ffff0000d0d54358 (&mddev->reconfig_mutex){+.+.}-{4:4}, at: mddev_lock drivers/md/md.h:713 [inline]
ffff0000d0d54358 (&mddev->reconfig_mutex){+.+.}-{4:4}, at: mddev_suspend_and_lock drivers/md/md.h:1019 [inline]
ffff0000d0d54358 (&mddev->reconfig_mutex){+.+.}-{4:4}, at: location_store+0xb8/0x938 drivers/md/md-bitmap.c:2636

but task is already holding lock:
ffff0000d04efb48 (kn->active#62){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
ffff0000d04efb48 (kn->active#62){++++}-{0:0}, at: kernfs_fop_write_iter+0x1f0/0x3b8 fs/kernfs/file.c:337

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #1 (kn->active#62){++++}-{0:0}:
       kernfs_drain+0x1cc/0x4d0 fs/kernfs/dir.c:532
       __kernfs_remove+0x354/0x718 fs/kernfs/dir.c:1579
       kernfs_remove_by_name_ns+0x70/0xd0 fs/kernfs/dir.c:1797
       kernfs_remove_by_name include/linux/kernfs.h:644 [inline]
       remove_files+0x90/0x184 fs/sysfs/group.c:28
       sysfs_remove_group+0x98/0x160 fs/sysfs/group.c:328
       md_bitmap_sysfs_del drivers/md/md.c:707 [inline]
       md_bitmap_destroy+0x1b0/0x230 drivers/md/md.c:6635
       __md_stop+0x54/0x154 drivers/md/md.c:7089
       do_md_stop+0x284/0xe6c drivers/md/md.c:7193
       array_state_store+0x6ac/0xce8 drivers/md/md.c:-1
       md_attr_store+0x304/0x438 drivers/md/md.c:6158
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
       el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
       el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590

-> #0 (&mddev->reconfig_mutex){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3181 [inline]
       check_prevs_add kernel/locking/lockdep.c:3300 [inline]
       validate_chain kernel/locking/lockdep.c:3924 [inline]
       __lock_acquire+0x1600/0x2a6c kernel/locking/lockdep.c:5254
       lock_acquire+0x150/0x370 kernel/locking/lockdep.c:5908
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x164/0xf14 kernel/locking/mutex.c:821
       mutex_lock_interruptible_nested+0x24/0x30 kernel/locking/mutex.c:899
       mddev_lock drivers/md/md.h:713 [inline]
       mddev_suspend_and_lock drivers/md/md.h:1019 [inline]
       location_store+0xb8/0x938 drivers/md/md-bitmap.c:2636
       md_attr_store+0x304/0x438 drivers/md/md.c:6158
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
       el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
       el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
       el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590

other info that might help us debug this:

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(kn->active#62);
                               lock(&mddev->reconfig_mutex);
                               lock(kn->active#62);
  lock(&mddev->reconfig_mutex);

 *** DEADLOCK ***

locks held by syz.0.59/5099: 4, last CPU#1:
 #0: ffff0000d7577970 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x100/0x144 fs/file.c:1259
 #1: ffff0000c5cac460 (sb_writers#6){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2753 [inline]
 #1: ffff0000c5cac460 (sb_writers#6){.+.+}-{0:0}, at: vfs_write+0x248/0xa0c fs/read_write.c:683
 #2: ffff0000d89ad480 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x1b0/0x3b8 fs/kernfs/file.c:336
 #3: ffff0000d04efb48 (kn->active#62){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #3: ffff0000d04efb48 (kn->active#62){++++}-{0:0}, at: kernfs_fop_write_iter+0x1f0/0x3b8 fs/kernfs/file.c:337

stack backtrace:
CPU: 1 UID: 0 PID: 5099 Comm: syz.0.59 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/14/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 print_circular_bug+0x328/0x330 kernel/locking/lockdep.c:2059
 check_noncircular+0x158/0x174 kernel/locking/lockdep.c:2191
 check_prev_add kernel/locking/lockdep.c:3181 [inline]
 check_prevs_add kernel/locking/lockdep.c:3300 [inline]
 validate_chain kernel/locking/lockdep.c:3924 [inline]
 __lock_acquire+0x1600/0x2a6c kernel/locking/lockdep.c:5254
 lock_acquire+0x150/0x370 kernel/locking/lockdep.c:5908
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x164/0xf14 kernel/locking/mutex.c:821
 mutex_lock_interruptible_nested+0x24/0x30 kernel/locking/mutex.c:899
 mddev_lock drivers/md/md.h:713 [inline]
 mddev_suspend_and_lock drivers/md/md.h:1019 [inline]
 location_store+0xb8/0x938 drivers/md/md-bitmap.c:2636
 md_attr_store+0x304/0x438 drivers/md/md.c:6158
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
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590


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
