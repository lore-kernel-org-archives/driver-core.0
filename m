Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792903828;
	b=uE6z6ugWe+1ge2IAvlNdWScq14e57JPu0g0ct2hUG6XjeN27fMLdJwMvBrcd1uu8lpNA
	 D/d8XdjKouLI0Iy+LVOhZ8ycBTa3YRUM7RgwJv2lO/9N6K0vGcDOvHIBenzZeXenaAS1t
	 oOXpoATECjfPX53mR8XEf5PYU3/6YzGI10ZD51BPI9cflj1Q4Bbq5ig5EnFG2tPX0jum3
	 D/DbpPVB4PpqGPxMmt8sfpgzYhoo1tMJ0xknEhyZVnKakzDLWCOGLU2Jx9SKTjpIPyRzW
	 GMA3gT4tVgqA7gSRP59d/YmnMr94rBHitH96pYwyIzyIndnHHeACLD8B3bvFLi9KD1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792903828;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=IP/z0rNamYIBQUJz+uxYPHpPmNG6nFdw74fFJ2J9EKQ=;
	b=EFJK7xx50mbbnVyTZI8GxB43+8rLgGHcDb5YgxGijAqyR/YSWSfoOVjQAyxqsJGn0Ccx
	 s5SOvEZnl2IZncoLkNaDiwAP9uY2c/Iq8IlXexlnlR47XQzYhGZAfSlVSUpvEvUppNMPo
	 Og/aa91qaj7/UECsEy+BiOUj5iH/bKpSs9tVcIzmt7V54rMj/1JlNmXmkY4gJEU23EuTI
	 s6oWRUy2EHRnLYnHprcVwfk2WNKja20lxUOf9ueDX3dYJDrREmUCzx0LztymtKIK0Xr+K
	 65gKIio3kByU+FRRYnVslBwLPO81f3V1GW24W0cv25viMEJ1d/6XYGgtEFvJSdo8wcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.70
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com [209.85.210.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3C3606A31A
	for <driver-core@lists.linux.dev>; Sun, 25 Oct 2026 04:50:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE3C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f70.google.com with SMTP id 46e09a7af769-8468290b866so3236133a34.1
        for <driver-core@lists.linux.dev>; Sat, 24 Oct 2026 21:50:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792903826; x=1793508626;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IP/z0rNamYIBQUJz+uxYPHpPmNG6nFdw74fFJ2J9EKQ=;
        b=2CyeAL0Bk7ngSLgrfLrt26jrXNBlYbX7ZsB+j2zFJYFBpBOo77eGaahbibkhr/kRvI
         Te1q756gd86DmM4STCOcWWTrYH4y/YuO4KH7xMvzpnkL76t1l5wZWKG1Vg57ayY06P+R
         rqg9/jYscgfSwY4aubVs66lECgXSHMnYnGwhuc8sCdWiHWaV+LVT60dC7QBuWpu78j/B
         4kBOErUq0a2dyoLm6G9dvu9XtmBuFhBfnaZafzLrorudRo0ne006q4VZ78USkH3N9fmZ
         bbluv4CdeDQc38Lts78HZ7i9Vj8wrsLtlzSoM0P4Kc42B3RBcS573n9o+iQ3ClxRIDHW
         a9QA==
X-Gm-Message-State: AFq9FYLfjwDTVAVDrbJuvmBtjR7oXrHPw89zO6djJiFtq+aatEvuqgdL
	npTOINsZDR4UwSGL6z1Vh6shfe8nzcfaHJEGDgYi6PL6btlTDMdn00SnWeNjQJ+nXof+b13Lyk1
	3OhUONW+2ZQYvoJ77wAMaRSqtQ5SKt8O9xYsD9HLgRwCPKoG8Uv9gqaXZ2pY=
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:250d:b0:4eb:80c0:f4bc with SMTP id
 5614622812f47-55c0020f4e7mr2003536b6e.10.1792903826673; Sat, 24 Oct 2026
 21:50:26 -0700 (PDT)
Date: Sat, 24 Oct 2026 21:50:26 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6add8a92.67317f00.38c4bc.006d.GAE@google.com>
Subject: [syzbot] [kernfs?] possible deadlock in array_state_store
From: syzbot <syzbot+7657131267c5111921e2@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    3ac032ef6ca8 Merge tag 'for-linus-fwctl' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10b3aee1580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8625c9497ae83f0b
dashboard link: https://syzkaller.appspot.com/bug?extid=7657131267c5111921e2
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-3ac032ef.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c8383c1d288f/vmlinux-3ac032ef.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3c86b9622324/bzImage-3ac032ef.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7657131267c5111921e2@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     Y
------------------------------------------------------
syz.4.1083/10710 is trying to acquire lock:
ffff88804b6d0358 (&mddev->reconfig_mutex){+.+.}-{4:4}, at: mddev_lock drivers/md/md.h:713 [inline]
ffff88804b6d0358 (&mddev->reconfig_mutex){+.+.}-{4:4}, at: array_state_store+0x174/0xcf0 drivers/md/md.c:4705

but task is already holding lock:
ffff888055b11c38 (kn->active#77){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
ffff888055b11c38 (kn->active#77){++++}-{0:0}, at: kernfs_fop_write_iter+0x332/0x5f0 fs/kernfs/file.c:337

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (kn->active#77){++++}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       kernfs_drain+0x4eb/0x600 fs/kernfs/dir.c:534
       __kernfs_remove+0x34c/0xbc0 fs/kernfs/dir.c:1578
       kernfs_remove_by_name_ns+0x7c/0x120 fs/kernfs/dir.c:1796
       kernfs_remove_by_name include/linux/kernfs.h:644 [inline]
       remove_files+0x96/0x1c0 fs/sysfs/group.c:28
       sysfs_remove_group+0x8b/0x1b0 fs/sysfs/group.c:328
       sysfs_remove_groups fs/sysfs/group.c:352 [inline]
       sysfs_remove_groups+0x60/0xb0 fs/sysfs/group.c:344
       __kobject_del+0x89/0x220 lib/kobject.c:595
       kobject_cleanup lib/kobject.c:680 [inline]
       kobject_release lib/kobject.c:720 [inline]
       kref_put include/linux/kref.h:65 [inline]
       kobject_put+0x348/0x640 lib/kobject.c:737
       process_one_work+0xac7/0x1b10 kernel/workqueue.c:3495
       process_scheduled_works kernel/workqueue.c:3578 [inline]
       worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #3 ((work_completion)(&mddev->del_work)){+.+.}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       process_one_work+0xa32/0x1b10 kernel/workqueue.c:3471
       process_scheduled_works kernel/workqueue.c:3578 [inline]
       worker_thread+0x5ef/0xe50 kernel/workqueue.c:3659
       kthread+0x373/0x450 kernel/kthread.c:436
       ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 ((wq_completion)md_misc){+.+.}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       touch_wq_lockdep_map+0xad/0x1c0 kernel/workqueue.c:4272
       __flush_workqueue+0x131/0x1200 kernel/workqueue.c:4314
       md_alloc+0x30/0x10a0 drivers/md/md.c:6334
       md_alloc_and_put drivers/md/md.c:6423 [inline]
       md_probe drivers/md/md.c:6439 [inline]
       md_probe+0x73/0xf0 drivers/md/md.c:6434
       blk_probe_dev+0x149/0x1e0 block/genhd.c:888
       blk_request_module+0x16/0xc0 block/genhd.c:901
       blkdev_get_no_open+0x9b/0xf0 block/bdev.c:870
       blkdev_open+0x141/0x4f0 block/fops.c:671
       do_dentry_open+0x674/0x1470 fs/open.c:1000
       vfs_open_consume+0xcc/0x460 fs/open.c:1131
       do_open fs/namei.c:4845 [inline]
       path_openat+0x1547/0x23f0 fs/namei.c:5010
       do_file_open+0x20e/0x430 fs/namei.c:5039
       do_sys_openat2+0x163/0x1d0 fs/open.c:1442
       do_sys_open fs/open.c:1448 [inline]
       __do_sys_openat fs/open.c:1464 [inline]
       __se_sys_openat fs/open.c:1459 [inline]
       __x64_sys_openat+0x12d/0x210 fs/open.c:1459
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (major_names_lock){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
       blk_probe_dev+0x28/0x1e0 block/genhd.c:885
       blk_request_module+0x16/0xc0 block/genhd.c:901
       blkdev_get_no_open+0x9b/0xf0 block/bdev.c:870
       bdev_file_open_by_dev block/bdev.c:1091 [inline]
       bdev_file_open_by_dev+0x70/0x210 block/bdev.c:1079
       md_import_device+0x120/0x360 drivers/md/md.c:3847
       md_add_new_disk+0xdbf/0x1820 drivers/md/md.c:7656
       md_ioctl+0x2be7/0x36c0 drivers/md/md.c:8499
       blkdev_ioctl+0x5ad/0x6f0 block/ioctl.c:798
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl fs/ioctl.c:583 [inline]
       __x64_sys_ioctl+0x18e/0x210 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&mddev->reconfig_mutex){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
       lock_acquire kernel/locking/lockdep.c:5942 [inline]
       lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
       mddev_lock drivers/md/md.h:713 [inline]
       array_state_store+0x174/0xcf0 drivers/md/md.c:4705
       md_attr_store+0x1c5/0x330 drivers/md/md.c:6158
       sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x6af/0x1050 fs/read_write.c:687
       ksys_write+0x12a/0x250 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &mddev->reconfig_mutex --> (work_completion)(&mddev->del_work) --> kn->active#77

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(kn->active#77);
                               lock((work_completion)(&mddev->del_work));
                               lock(kn->active#77);
  lock(&mddev->reconfig_mutex);

 *** DEADLOCK ***

locks held by syz.4.1083/10710: 5, last CPU#2:
 #0: ffff888040588b70 (&f->f_pos_lock){+.+.}-{4:4}, at: fdget_pos+0x2aa/0x380 fs/file.c:1408
 #1: ffff888037ffa460 (sb_writers#8){.+.+}-{0:0}, at: ksys_write+0x12a/0x250 fs/read_write.c:739
 #2: ffff888037f03908 (&of->prealloc_mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x24d/0x5f0 fs/kernfs/file.c:320
 #3: ffff888037f03880 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x2c2/0x5f0 fs/kernfs/file.c:336
 #4: ffff888055b11c38 (kn->active#77){++++}-{0:0}, at: kernfs_get_active_of fs/kernfs/file.c:73 [inline]
 #4: ffff888055b11c38 (kn->active#77){++++}-{0:0}, at: kernfs_fop_write_iter+0x332/0x5f0 fs/kernfs/file.c:337

stack backtrace:
CPU: 2 UID: 0 PID: 10710 Comm: syz.4.1083 Tainted: G             L     Y syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP, [Y]=FORCED_BIND
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1be kernel/locking/lockdep.c:2087
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2219
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3209
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x1528/0x1f40 kernel/locking/lockdep.c:5288
 lock_acquire kernel/locking/lockdep.c:5942 [inline]
 lock_acquire+0x1d1/0x380 kernel/locking/lockdep.c:5899
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x19f/0x1c10 kernel/locking/mutex.c:821
 mddev_lock drivers/md/md.h:713 [inline]
 array_state_store+0x174/0xcf0 drivers/md/md.c:4705
 md_attr_store+0x1c5/0x330 drivers/md/md.c:6158
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f03a8b9f559
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f03a9a99028 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f03a8e25fa0 RCX: 00007f03a8b9f559
RDX: 0000000000000005 RSI: 0000200000000280 RDI: 0000000000000004
RBP: 00007f03a8c36b20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f03a8e26038 R14: 00007f03a8e25fa0 R15: 00007fffeac25fa8
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
