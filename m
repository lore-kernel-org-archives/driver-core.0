Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA203168E1
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 14:24:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783434267; cv=none; b=O6JP1cYaWxrqw3f4D70d+i05EOCltDsQeHpE/lIWbx47+4oaAgdIYf2z2m5FFs3FRRNB6YHiIrVx5EKdsgg9znzxrbne8plu1nTh52BE9TZF2QONUeRUcwvje0iI5LNuuNule/ye/8bakcabZMJJMflIYkUk5gSH3KOTVz8XBLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783434267; c=relaxed/simple;
	bh=Ol1IbFrUIbWXelUSa+z3FfjYTOPhx+nR7+tnZPe9iiE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=FDsc4ayST+8McB63zXS/zwTqUa2vjBdudjRLoJXlh1exlz3Tnipxldc7W+WctAvtBreQBdJMxOZ7BRtZYMKVKGx2QO5sc10xLk5dZkB4RhvY2v6asA14ZmfdjSzcnnUpZntFvMSH3iwlw7Sm/8GpLoWGLKNJhO0NvS/6Xnn661U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4959c49e054so2886974b6e.3
        for <driver-core@lists.linux.dev>; Tue, 07 Jul 2026 07:24:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783434263; x=1784039063;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IR/1OtV8z+5h1KGU/iHHp/LzQPFxiYDfCb5lhI27jys=;
        b=KQiCV5ctIR3KMQc6g5OojdqdgOl3s+fF+fSMX7hoP8+j9cqMlbtPSYhHZ+mPBWha2V
         FtcGzhtl3uORK4m7BQHFu8tlxx95nqghv17KUAx3675nEFBGOMWCJFIMzIGr8EtRqTV9
         Akh8As08csoobto2UIedyug+6/l75qpUIwSrrKqq2E8xvr9F/ZQT+3IYFHyaqPFlZdDa
         IoPXw8Qnb4RvkwTZjx+OqXT2hXgcoKgT2d03HPsCOoguBSTu9s56ybDX8dtpLRT4/3i9
         xx3t4gwcudLqH7XSbiJ/+D0Wti/KKZuVwYHvDI9d08KPsnZ7qRuI7ksShzKuGMbjRQ23
         DHLQ==
X-Gm-Message-State: AOJu0YwWVXK+hCGsX8mM9j3GiQgDQPGWjU4AADBiK6HQiByuNCo/5uHF
	y7hwHQp60EgWhOiOLbsYRo97jr3UykhAju5VFKj0ltbAesbP28UrLp9aLIxCo23LXj/xvfBOvUl
	XAS4dvRel9Hmhf9pEsgq6D97EWdiU9bVP44eG6JaJLcs2SDYrjjXY3qgov+iPig==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3a0e:b0:485:5f3f:bd1b with SMTP id
 5614622812f47-49fdbb379f7mr3798337b6e.3.1783434263354; Tue, 07 Jul 2026
 07:24:23 -0700 (PDT)
Date: Tue, 07 Jul 2026 07:24:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a4d0c17.c76b52dc.34afef.000d.GAE@google.com>
Subject: [syzbot] [kernfs?] possible deadlock in kernfs_fop_write_iter (3)
From: syzbot <syzbot+c236d648c8a2fb8dd178@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    87320be9f0d2 Merge tag 'net-7.2-rc2' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=173580d6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d69870d5e052935f
dashboard link: https://syzkaller.appspot.com/bug?extid=c236d648c8a2fb8dd178
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b66380bc19e0/disk-87320be9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7c039967f4a2/vmlinux-87320be9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/71de88cff101/bzImage-87320be9.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c236d648c8a2fb8dd178@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L     
------------------------------------------------------
syz.5.9374/32409 is trying to acquire lock:
ffff88807b14f080 (&of->mutex){+.+.}-{4:4}, at: kernfs_fop_write_iter+0x2c2/0x5f0 fs/kernfs/file.c:336

but task is already holding lock:
ffff8880566b1060 (&pipe->mutex){+.+.}-{4:4}, at: pipe_lock fs/pipe.c:91 [inline]
ffff8880566b1060 (&pipe->mutex){+.+.}-{4:4}, at: pipe_lock+0x69/0x80 fs/pipe.c:88

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (&pipe->mutex){+.+.}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       pipe_lock fs/pipe.c:91 [inline]
       pipe_lock+0x69/0x80 fs/pipe.c:88
       iter_file_splice_write+0x1fd/0x10b0 fs/splice.c:682
       backing_file_splice_write+0x27b/0x820 fs/backing-file.c:318
       ovl_splice_write+0x328/0x610 fs/overlayfs/file.c:433
       do_splice_from fs/splice.c:936 [inline]
       do_splice+0x109c/0x1f90 fs/splice.c:1349
       __do_splice+0x33b/0x370 fs/splice.c:1431
       __do_sys_splice fs/splice.c:1634 [inline]
       __se_sys_splice fs/splice.c:1616 [inline]
       __x64_sys_splice+0x187/0x250 fs/splice.c:1616
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (sb_writers#6){.+.+}-{0:0}:
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read_freezable include/linux/percpu-rwsem.h:83 [inline]
       __sb_start_write include/linux/fs/super.h:19 [inline]
       sb_start_write include/linux/fs/super.h:125 [inline]
       mnt_want_write+0x6f/0x410 fs/namespace.c:494
       ovl_create_object+0x12b/0x3b0 fs/overlayfs/dir.c:706
       lookup_open fs/namei.c:4508 [inline]
       open_last_lookups fs/namei.c:4608 [inline]
       path_openat+0x341f/0x4280 fs/namei.c:4856
       do_file_open+0x20e/0x430 fs/namei.c:4888
       do_sys_openat2+0x10f/0x1e0 fs/open.c:1368
       do_sys_open fs/open.c:1374 [inline]
       __do_sys_open fs/open.c:1382 [inline]
       __se_sys_open fs/open.c:1378 [inline]
       __x64_sys_open+0xfe/0x1d0 fs/open.c:1378
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&ovl_i_mutex_dir_key[depth]){++++}-{4:4}:
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       down_read+0x99/0x4c0 kernel/locking/rwsem.c:1574
       inode_lock_shared include/linux/fs.h:1039 [inline]
       lookup_slow+0x42/0x70 fs/namei.c:1935
       walk_component fs/namei.c:2282 [inline]
       lookup_last fs/namei.c:2789 [inline]
       path_lookupat+0x5e8/0xc40 fs/namei.c:2813
       filename_lookup+0x202/0x590 fs/namei.c:2842
       kern_path+0x37/0x50 fs/namei.c:3036
       lookup_bdev+0xd8/0x280 block/bdev.c:1208
       resume_store+0x1d6/0x460 kernel/power/hibernate.c:1278
       kobj_attr_store+0x58/0x80 lib/kobject.c:840
       sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
       kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:595 [inline]
       vfs_write+0x6ac/0x1050 fs/read_write.c:687
       ksys_write+0x12a/0x250 fs/read_write.c:739
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&of->mutex){+.+.}-{4:4}:
       check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3165
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain kernel/locking/lockdep.c:3908 [inline]
       __lock_acquire+0x136c/0x1a40 kernel/locking/lockdep.c:5237
       lock_acquire kernel/locking/lockdep.c:5868 [inline]
       lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
       kernfs_fop_write_iter+0x2c2/0x5f0 fs/kernfs/file.c:336
       iter_file_splice_write+0x830/0x10b0 fs/splice.c:736
       do_splice_from fs/splice.c:936 [inline]
       do_splice+0x109c/0x1f90 fs/splice.c:1349
       __do_splice+0x33b/0x370 fs/splice.c:1431
       __do_sys_splice fs/splice.c:1634 [inline]
       __se_sys_splice fs/splice.c:1616 [inline]
       __x64_sys_splice+0x187/0x250 fs/splice.c:1616
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &of->mutex --> sb_writers#6 --> &pipe->mutex

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&pipe->mutex);
                               lock(sb_writers#6);
                               lock(&pipe->mutex);
  lock(&of->mutex);

 *** DEADLOCK ***

2 locks held by syz.5.9374/32409:
 #0: ffff888035990450 (sb_writers#8){.+.+}-{0:0}, at: __do_splice+0x33b/0x370 fs/splice.c:1431
 #1: ffff8880566b1060 (&pipe->mutex){+.+.}-{4:4}, at: pipe_lock fs/pipe.c:91 [inline]
 #1: ffff8880566b1060 (&pipe->mutex){+.+.}-{4:4}, at: pipe_lock+0x69/0x80 fs/pipe.c:88

stack backtrace:
CPU: 1 UID: 0 PID: 32409 Comm: syz.5.9374 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/10/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_circular_bug.cold+0x178/0x1c7 kernel/locking/lockdep.c:2043
 check_noncircular+0x146/0x160 kernel/locking/lockdep.c:2175
 check_prev_add+0xeb/0xe60 kernel/locking/lockdep.c:3165
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain kernel/locking/lockdep.c:3908 [inline]
 __lock_acquire+0x136c/0x1a40 kernel/locking/lockdep.c:5237
 lock_acquire kernel/locking/lockdep.c:5868 [inline]
 lock_acquire+0x1b9/0x370 kernel/locking/lockdep.c:5825
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x1a4/0x1bd0 kernel/locking/mutex.c:821
 kernfs_fop_write_iter+0x2c2/0x5f0 fs/kernfs/file.c:336
 iter_file_splice_write+0x830/0x10b0 fs/splice.c:736
 do_splice_from fs/splice.c:936 [inline]
 do_splice+0x109c/0x1f90 fs/splice.c:1349
 __do_splice+0x33b/0x370 fs/splice.c:1431
 __do_sys_splice fs/splice.c:1634 [inline]
 __se_sys_splice fs/splice.c:1616 [inline]
 __x64_sys_splice+0x187/0x250 fs/splice.c:1616
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fa20679de59
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fa2049f6028 EFLAGS: 00000246 ORIG_RAX: 0000000000000113
RAX: ffffffffffffffda RBX: 00007fa206a26180 RCX: 00007fa20679de59
RDX: 0000000000000009 RSI: 0000000000000000 RDI: 0000000000000004
RBP: 00007fa206833e6f R08: 000000000000bfd1 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fa206a26218 R14: 00007fa206a26180 R15: 00007ffeeeb4de38
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
