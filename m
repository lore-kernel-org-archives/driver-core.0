Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763E0222565
	for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 00:23:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786321410; cv=none; b=g7/3k0Vj5rZuL3X5kSrjJoWlZgFP7ZY2zCtiNQPgRGdWPKOTyAaiWfXUOJRcWzL6Cgo6hw5ZVQGro49kgrmvgM9kt13iMlhFpuhymjifyeLFwbW1xq9VER3XiZn/p20xlcjwuL/TCqTTbQoiIrAtF4uy4HQIOyuIYQcUGSstHRQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786321410; c=relaxed/simple;
	bh=YuGahVHRFinUqQx+mO/hB9oyI9B8rcRlUs0FB0jbYec=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=UJNx0VFyzGcAhXVvAiH2SD0frrVjEMNn0eo+dn5XnTQfcZOgM8jDNGN4o14ao/Q0lZVeJ1qnOK9OGEKUVPcgsNjhO7H3y4zw0KkNvmHOR2q7tp93lpYxqMOa083oa6Gwb9Z+DXyM6aottBqMPBz2k9+STnj2O3fyKVU7+Ps3aKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4ab8b4887d4so960116b6e.1
        for <driver-core@lists.linux.dev>; Sun, 09 Aug 2026 17:23:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786321407; x=1786926207;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShGF2KcDYdqwhpn5hmhw33ODEG0xR1Afm1j7vmU+RWk=;
        b=V6Fe7t4Yv5wLjx8S8ifCGozIDGG0zjaUAhqwtaXXCJc7047i1/N/pPzr0o0hvFkHdg
         VzTxLBA5M7Y347lApBojmhyBYCnZZDcR91CjkxlzDs3D3U2UXwo65NHnPayiTrkVJxgD
         pM0T/GLUwtv5XhHsMGqy0fj0Vd6up5Jz7nb8hX/HGsa3gbO2jhgU2A6a7iWmtQRapHaT
         MyZtu4cKIuhBmkoBngBnqMtLPFkNVO1e8ahPE3ZQ4Iyp1ylPX8ycGJAMCg+dLFXLLr9q
         CWTjkyBqeo0LXJi+BcpROVSXBQROg2tMyqDVwiZ2rYkLdHIIdGHZQwnkrBB/NuXwPcRT
         8RoQ==
X-Forwarded-Encrypted: i=1; AHgh+RprgBqW0JlBC0DeS20QynXRQzbcLhnYNa6rq5QTdF0Jgp1+0NmB3rq4fyid71Bjrqqnv0vNdjLf8V4MNg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeOzZj/VFa1JCh85xrBZhBozLlJhyTe6mnqSoa/ndtECBxHxFC
	zrIGVB/Qhhl3mD9yEWQwsNwtxOo91ejh3fB0Qrz8N3o3TrMXkWQ9MrmiNAfLHtD7Hnh3QeMolj8
	70Jt+zI65qs6n0cFJqGChAhHKGHAtA4PubpAYyTBTQLRoFG9iHo0WLZ6oV3U=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:178b:b0:495:ce61:4e0c with SMTP id
 5614622812f47-4b1ab72c113mr9102432b6e.3.1786321407606; Sun, 09 Aug 2026
 17:23:27 -0700 (PDT)
Date: Sun, 09 Aug 2026 17:23:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7919ff.9c11d2ce.289b96.00e1.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in wiphy_unregister
From: syzbot <syzbot+2b175fce6f3a34469a87@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cc2b5f627e8c Add linux-next specific files for 20260714
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=130f9bb9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2290ccbf984c524f
dashboard link: https://syzkaller.appspot.com/bug?extid=2b175fce6f3a34469a87
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6836f8efb1da/disk-cc2b5f62.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0109d3477cc7/vmlinux-cc2b5f62.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c2e49e350bbf/bzImage-cc2b5f62.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+2b175fce6f3a34469a87@syzkaller.appspotmail.com

------------[ cut here ]------------
rtmutex deadlock detected
WARNING: kernel/locking/rtmutex.c:1698 at rt_mutex_handle_deadlock+0x21/0xb0 kernel/locking/rtmutex.c:1698, CPU#1: kworker/u8:141/6021
Modules linked in:
CPU: 1 UID: 0 PID: 6021 Comm: kworker/u8:141 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Workqueue: netns cleanup_net
RIP: 0010:rt_mutex_handle_deadlock+0x21/0xb0 kernel/locking/rtmutex.c:1698
Code: 90 90 90 90 90 90 90 90 90 41 57 41 56 41 55 41 54 53 83 ff dd 0f 85 81 00 00 00 48 89 f7 e8 16 40 01 00 48 8d 3d af 6d 81 04 <67> 48 0f b9 3a 4c 8d 3d 00 00 00 00 65 48 8b 1d 73 6b 70 07 4c 8d
RSP: 0018:ffffc900067373b0 EFLAGS: 00010286
RAX: 0000000080000000 RBX: 00000000ffffffdd RCX: 0000000000000000
RDX: 0000000000000006 RSI: ffffffff8d98ba58 RDI: ffffffff8fd3e230
RBP: ffffc90006737560 R08: ffffffff8fd0c47f R09: 1ffffffff1fa188f
R10: dffffc0000000000 R11: fffffbfff1fa1890 R12: 1ffff92000ce6e84
R13: ffffffff8b526ec2 R14: ffff888037d60b68 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125af2000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000560e6c0cc950 CR3: 000000000e1b0000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __rt_mutex_slowlock kernel/locking/rtmutex.c:1760 [inline]
 __rt_mutex_slowlock_locked kernel/locking/rtmutex.c:1787 [inline]
 rt_mutex_slowlock+0x73c/0x780 kernel/locking/rtmutex.c:1827
 __rt_mutex_lock kernel/locking/rtmutex.c:1842 [inline]
 __mutex_lock_common kernel/locking/rtmutex_api.c:560 [inline]
 mutex_lock_nested+0x168/0x1d0 kernel/locking/rtmutex_api.c:578
 device_lock include/linux/device.h:1104 [inline]
 device_del+0xa9/0x8f0 drivers/base/core.c:3923
 wiphy_unregister+0x406/0xb10 net/wireless/core.c:1323
 ieee80211_unregister_hw+0x1e2/0x2c0 net/mac80211/main.c:1741
 mac80211_hwsim_del_radio+0x28a/0x4a0 drivers/net/wireless/virtual/mac80211_hwsim_main.c:6227
 hwsim_exit_net+0xea6/0xf70 drivers/net/wireless/virtual/mac80211_hwsim_main.c:7210
 ops_exit_list net/core/net_namespace.c:200 [inline]
 ops_undo_list+0x43d/0x8d0 net/core/net_namespace.c:253
 cleanup_net+0x575/0x810 net/core/net_namespace.c:706
 process_one_work+0xaaf/0x1480 kernel/workqueue.c:3379
 process_scheduled_works kernel/workqueue.c:3462 [inline]
 worker_thread+0xb05/0x10d0 kernel/workqueue.c:3543
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	90                   	nop
   1:	90                   	nop
   2:	90                   	nop
   3:	90                   	nop
   4:	90                   	nop
   5:	90                   	nop
   6:	90                   	nop
   7:	90                   	nop
   8:	90                   	nop
   9:	41 57                	push   %r15
   b:	41 56                	push   %r14
   d:	41 55                	push   %r13
   f:	41 54                	push   %r12
  11:	53                   	push   %rbx
  12:	83 ff dd             	cmp    $0xffffffdd,%edi
  15:	0f 85 81 00 00 00    	jne    0x9c
  1b:	48 89 f7             	mov    %rsi,%rdi
  1e:	e8 16 40 01 00       	call   0x14039
  23:	48 8d 3d af 6d 81 04 	lea    0x4816daf(%rip),%rdi        # 0x4816dd9
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	4c 8d 3d 00 00 00 00 	lea    0x0(%rip),%r15        # 0x36
  36:	65 48 8b 1d 73 6b 70 	mov    %gs:0x7706b73(%rip),%rbx        # 0x7706bb1
  3d:	07
  3e:	4c                   	rex.WR
  3f:	8d                   	.byte 0x8d


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
