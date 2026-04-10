Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABAF73644D3
	for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 20:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775852846; cv=none; b=ucP0llHRqS3Adk9bHm5xmIyzhE3RvCoR+DrhptM7PTLzXq2P4JK32MCNexCtV2YkSE0gtxcIsER4eNiQTRNbU3gR6dhRpuK47tyaZeaZP0V2uvRQsQ/8PapLc36IJt6LC603rbk5e8cbYSAn6rjsB7KZZ0f626e7X9HbgcMpdn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775852846; c=relaxed/simple;
	bh=V4lN9NmG5Pidm5BUOOPIERyDM0BYGPSoAFHypKp4BEM=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=RLJ1QgAe1m7YtsvDQMPfnszmjhXCAZH3dqBe1uDtW4qYOi7Mf6mrdrXl7gvgM/gka8MMRmkes18BxOMHrU/qDZWvtLx4+krxhSzmYfa0Otf4tKkX4/SWg/R/9FedmJzeBtC+HMGXhx9HmZ3Y95+TCpuP00SVhzND3GLn7yN5LNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-6850890ec96so2227962eaf.1
        for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 13:27:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775852844; x=1776457644;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TXpWDB8nNV2yhSw++8KxIhIDrUI7imNBORjrmfUqvr4=;
        b=Fp8qVOotU/enAdiQD+372BfXuzmVuFuiNB96EMR9Zer1mDxm43Usu06Ys5Py2g5s8F
         HV4Kl7vLjTTkALiegFpv5hDx1j5Dy4wqXxa3fmEtEf1t9Gd6aO7r5Me0/0GS4ERO9XTY
         c9fOinAd8x0RqzPcYfPL7Aco5UK1Cj2QbmY16OAYXXZFO0sUZM6TXM2DzcASnQlsUFnq
         bGSuNWfKBJxDWm7zTNkJpRw9Figz3f58efOTpZCNV2FoT/60L9UmyfTTkITov6/pG7d2
         1vRgBgYs+GzEUc73HNF908hgjck6h0P4lVOY0XSlrCBhtsRPrgG4OOihaHOiphLiRjue
         hhOA==
X-Gm-Message-State: AOJu0YyZCLrz5JHMPbI3B7lSiWVY3hm7Gd4D6tb3D15a1kLJnPPSgZOw
	iLg3PX0YJn/Py/8sdtOvm7kvFsqmWvqdNv2EkH0LwHTSn3hVsP+YtiFdR/v0PUSHB0WQsz844Nd
	99FWssBHxiYZjH2R6XVr899nPLz9cuuqK6//ZMjCTONLt1pnxIVj0JhjQ0b/AvA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2d04:b0:68c:1689:6967 with SMTP id
 006d021491bc7-68c16896d02mr2031328eaf.44.1775852843739; Fri, 10 Apr 2026
 13:27:23 -0700 (PDT)
Date: Fri, 10 Apr 2026 13:27:23 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69d95d2b.050a0220.3030df.0031.GAE@google.com>
Subject: [syzbot] [kernfs?] WARNING: suspicious RCU usage in kernfs_put
From: syzbot <syzbot+0dfe499ea713e0a15bec@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    591cd656a1bf Linux 7.0-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1439a302580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=64e78d99d9bf8b4c
dashboard link: https://syzkaller.appspot.com/bug?extid=0dfe499ea713e0a15bec
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bf0f027c93ec/disk-591cd656.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/60d829be17f4/vmlinux-591cd656.xz
kernel image: https://storage.googleapis.com/syzbot-assets/673c009c7550/bzImage-591cd656.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0dfe499ea713e0a15bec@syzkaller.appspotmail.com

=============================
WARNING: suspicious RCU usage
syzkaller #0 Tainted: G             L     
-----------------------------
fs/kernfs/dir.c:579 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
2 locks held by kswapd0/78:
 #0: ffffffff8e9aa8a0 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0x1db/0x1ca0 mm/vmscan.c:6968
 #1: ffff888033c040e0 (&type->s_umount_key#57){.+.+}-{4:4}, at: super_trylock_shared fs/super.c:565 [inline]
 #1: ffff888033c040e0 (&type->s_umount_key#57){.+.+}-{4:4}, at: super_cache_scan+0x98/0x550 fs/super.c:198

stack backtrace:
CPU: 0 UID: 0 PID: 78 Comm: kswapd0 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 lockdep_rcu_suspicious.cold+0x4f/0xb1 kernel/locking/lockdep.c:6876
 kernfs_put.part.0+0x59c/0x610 fs/kernfs/dir.c:579
 kernfs_put+0x53/0x60 fs/kernfs/dir.c:602
 evict+0x3c2/0xad0 fs/inode.c:846
 iput_final fs/inode.c:1966 [inline]
 iput.part.0+0x605/0xf50 fs/inode.c:2015
 iput+0x35/0x40 fs/inode.c:1981
 dentry_unlink_inode+0x2a1/0x490 fs/dcache.c:467
 __dentry_kill+0x1d0/0x600 fs/dcache.c:670
 shrink_kill fs/dcache.c:1147 [inline]
 shrink_dentry_list+0x180/0x5e0 fs/dcache.c:1174
 prune_dcache_sb+0xea/0x150 fs/dcache.c:1256
 super_cache_scan+0x328/0x550 fs/super.c:223
 do_shrink_slab+0x416/0x11e0 mm/shrinker.c:437
 shrink_slab+0x171/0x12b0 mm/shrinker.c:664
 shrink_one+0x398/0x7f0 mm/vmscan.c:4928
 shrink_many mm/vmscan.c:4989 [inline]
 lru_gen_shrink_node mm/vmscan.c:5067 [inline]
 shrink_node+0x26a2/0x3e20 mm/vmscan.c:6047
 kswapd_shrink_node mm/vmscan.c:6894 [inline]
 balance_pgdat+0xbb7/0x1ca0 mm/vmscan.c:7070
 kswapd+0x556/0xba0 mm/vmscan.c:7343
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x754/0xd80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

=============================
WARNING: suspicious RCU usage
syzkaller #0 Tainted: G             L     
-----------------------------
fs/kernfs/dir.c:579 suspicious rcu_dereference_check() usage!

other info that might help us debug this:


rcu_scheduler_active = 2, debug_locks = 1
2 locks held by kswapd0/78:
 #0: ffffffff8e9aa8a0 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat+0x1db/0x1ca0 mm/vmscan.c:6968
 #1: ffff888033c040e0 (&type->s_umount_key#57){.+.+}-{4:4}, at: super_trylock_shared fs/super.c:565 [inline]
 #1: ffff888033c040e0 (&type->s_umount_key#57){.+.+}-{4:4}, at: super_cache_scan+0x98/0x550 fs/super.c:198

stack backtrace:
CPU: 0 UID: 0 PID: 78 Comm: kswapd0 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 lockdep_rcu_suspicious.cold+0x4f/0xb1 kernel/locking/lockdep.c:6876
 kernfs_put.part.0+0x515/0x610 fs/kernfs/dir.c:579
 kernfs_put+0x53/0x60 fs/kernfs/dir.c:602
 evict+0x3c2/0xad0 fs/inode.c:846
 iput_final fs/inode.c:1966 [inline]
 iput.part.0+0x605/0xf50 fs/inode.c:2015
 iput+0x35/0x40 fs/inode.c:1981
 dentry_unlink_inode+0x2a1/0x490 fs/dcache.c:467
 __dentry_kill+0x1d0/0x600 fs/dcache.c:670
 shrink_kill fs/dcache.c:1147 [inline]
 shrink_dentry_list+0x180/0x5e0 fs/dcache.c:1174
 prune_dcache_sb+0xea/0x150 fs/dcache.c:1256
 super_cache_scan+0x328/0x550 fs/super.c:223
 do_shrink_slab+0x416/0x11e0 mm/shrinker.c:437
 shrink_slab+0x171/0x12b0 mm/shrinker.c:664
 shrink_one+0x398/0x7f0 mm/vmscan.c:4928
 shrink_many mm/vmscan.c:4989 [inline]
 lru_gen_shrink_node mm/vmscan.c:5067 [inline]
 shrink_node+0x26a2/0x3e20 mm/vmscan.c:6047
 kswapd_shrink_node mm/vmscan.c:6894 [inline]
 balance_pgdat+0xbb7/0x1ca0 mm/vmscan.c:7070
 kswapd+0x556/0xba0 mm/vmscan.c:7343
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x754/0xd80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
------------[ cut here ]------------
kernfs_put: tty/ptyd1: released with incorrect active_ref 0
WARNING: fs/kernfs/dir.c:579 at kernfs_put.part.0+0x478/0x610 fs/kernfs/dir.c:579, CPU#0: kswapd0/78
Modules linked in:
CPU: 0 UID: 0 PID: 78 Comm: kswapd0 Tainted: G             L      syzkaller #0 PREEMPT(full) 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/18/2026
RIP: 0010:kernfs_put.part.0+0x483/0x610 fs/kernfs/dir.c:579
Code: 89 c6 89 44 24 1c e8 5c 2d 51 ff 8b 44 24 1c 85 c0 75 21 e8 9f 32 51 ff 48 8d 3d 88 21 29 0e 48 8b 54 24 10 44 89 f9 4c 89 e6 <67> 48 0f b9 3a e9 3a fc ff ff e8 7e 32 51 ff e8 d9 f0 34 ff 31 ff
RSP: 0018:ffffc9000236f2d8 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888023738000 RCX: 0000000000000000
RDX: ffff888022f9cea0 RSI: ffffffff8c2cde20 RDI: ffffffff90e03230
RBP: ffff88801facbc30 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000001 R11: 0000000000000001 R12: ffffffff8c2cde20
R13: dffffc0000000000 R14: ffff88801c6b5868 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888124340000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055923cfd5ee8 CR3: 000000000e598000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 kernfs_put+0x53/0x60 fs/kernfs/dir.c:602
 evict+0x3c2/0xad0 fs/inode.c:846
 iput_final fs/inode.c:1966 [inline]
 iput.part.0+0x605/0xf50 fs/inode.c:2015
 iput+0x35/0x40 fs/inode.c:1981
 dentry_unlink_inode+0x2a1/0x490 fs/dcache.c:467
 __dentry_kill+0x1d0/0x600 fs/dcache.c:670
 shrink_kill fs/dcache.c:1147 [inline]
 shrink_dentry_list+0x180/0x5e0 fs/dcache.c:1174
 prune_dcache_sb+0xea/0x150 fs/dcache.c:1256
 super_cache_scan+0x328/0x550 fs/super.c:223
 do_shrink_slab+0x416/0x11e0 mm/shrinker.c:437
 shrink_slab+0x171/0x12b0 mm/shrinker.c:664
 shrink_one+0x398/0x7f0 mm/vmscan.c:4928
 shrink_many mm/vmscan.c:4989 [inline]
 lru_gen_shrink_node mm/vmscan.c:5067 [inline]
 shrink_node+0x26a2/0x3e20 mm/vmscan.c:6047
 kswapd_shrink_node mm/vmscan.c:6894 [inline]
 balance_pgdat+0xbb7/0x1ca0 mm/vmscan.c:7070
 kswapd+0x556/0xba0 mm/vmscan.c:7343
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x754/0xd80 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	89 c6                	mov    %eax,%esi
   2:	89 44 24 1c          	mov    %eax,0x1c(%rsp)
   6:	e8 5c 2d 51 ff       	call   0xff512d67
   b:	8b 44 24 1c          	mov    0x1c(%rsp),%eax
   f:	85 c0                	test   %eax,%eax
  11:	75 21                	jne    0x34
  13:	e8 9f 32 51 ff       	call   0xff5132b7
  18:	48 8d 3d 88 21 29 0e 	lea    0xe292188(%rip),%rdi        # 0xe2921a7
  1f:	48 8b 54 24 10       	mov    0x10(%rsp),%rdx
  24:	44 89 f9             	mov    %r15d,%ecx
  27:	4c 89 e6             	mov    %r12,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	e9 3a fc ff ff       	jmp    0xfffffc6e
  34:	e8 7e 32 51 ff       	call   0xff5132b7
  39:	e8 d9 f0 34 ff       	call   0xff34f117
  3e:	31 ff                	xor    %edi,%edi


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
