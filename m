Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818B3332637
	for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 08:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214687; cv=none; b=NrVQWb49Opr92mW69uan2Ex3oIrrKL37Zk60LZrd0ew9bFaAVnzRGshFf4n+43ZqhiknPeAvnrDtoIgpxX9leuSw9lJ9Ay0UYy5ZVFPAsrRs3rswYQEQ6/xkK+qf69Xoc3kkn0aKwVRs8T3IdKZMm+tKpIDCIpnri2agShYCTfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214687; c=relaxed/simple;
	bh=WkQUuLjrSE4gGYzPHU/H1OszhlI1sFWrcb1oylijtpE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=PPM8kgr3S9tKdQdr17iO8d/gL0v+b38O/edVW1spnANqZODOmD3+gZAWBmM/nQcImaxHBz49szelude9RJ2H2kOTelB7HQJk6BRV1DOPKLqnYFiqI7eezX0yq8R6bvvrFvlFCA3NA1ZVmIwIPXTqEZZBJhxCY8Gh6rjuwCa2UbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4a49f09233fso594557b6e.0
        for <driver-core@lists.linux.dev>; Thu, 20 Aug 2026 01:31:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787214684; x=1787819484;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afYItfKwrwBt8GSigW+1huMAnBQHocGGCPG0wXSD/r8=;
        b=fiJxoIQuuY39nJ6SvHsUeClKOEqtBSqxq4Ds7DkjhZuWeMWu0XW8kXc5LepY4wxwCA
         LRy72UDt7u/TiF+rqDXRVHGcVqudxS/AHUDrX4cKFYaW8ON1+Lgs6T20mR0eyw5VIwcl
         D5TeU7CpQlpDGU5Xh5yNNeHh18WhUjU/mrMXNScI+EOgALsqUuFyjhKiWk1Ndrn/QIhD
         cbH6m3NqMX+0bOa4BwZnvBPk4kup4kn7WH3ceqcetQXklGBUII4K3+Xvt4von1/YV0ay
         l8R81RWYr5xMhO3tZj4neoJG533hV5CWvPsOLDWxl6d0fYk/Zmx+tS7U/qkLguYwpkNr
         yxNA==
X-Forwarded-Encrypted: i=1; AHgh+RoJYkqMAxE6Hv/05dmV833EDmoW25I/WDWHNWOH65esgZM+sUUSJyd+K+tEMAX6deuQ5BmWrofC4mwiRQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxXcB30SK2s4aadtmE9a2bJV6IYKTt+z0clQBtnxZIfXZE3tbYE
	mKcUoE8+csAmILLD5Y5s1EO0gHP8LfFIHefp+bcgSusiE4QKtvbnorRaS6RoebxKyHiZ4EMalRG
	aTTeMm3zdNeJiD3ULZqjyKnYbxHQBGfbuT1Xfq3VmW9xJ6Qsr7d3iURj9fJE=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:10c6:b0:496:117b:1f04 with SMTP id
 5614622812f47-4b2cdabc304mr4631376b6e.2.1787214684314; Thu, 20 Aug 2026
 01:31:24 -0700 (PDT)
Date: Thu, 20 Aug 2026 01:31:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a86bb5c.4d75e56a.c9a88.0039.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING: refcount bug in bnep_session (2)
From: syzbot <syzbot+98baa83c342e86a836d7@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5d6919055dec Linux 7.1-rc3
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=165f7bce580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=59da38148f3a3d24
dashboard link: https://syzkaller.appspot.com/bug?extid=98baa83c342e86a836d7
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/dd917153d1cc/disk-5d691905.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f40450ccdad7/vmlinux-5d691905.xz
kernel image: https://storage.googleapis.com/syzbot-assets/91d021f99576/bzImage-5d691905.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+98baa83c342e86a836d7@syzkaller.appspotmail.com

------------[ cut here ]------------
refcount_t: underflow; use-after-free.
WARNING: lib/refcount.c:28 at refcount_warn_saturate+0xf4/0x130 lib/refcount.c:28, CPU#1: kbnepd bnep0/6521
Modules linked in:
CPU: 1 UID: 0 PID: 6521 Comm: kbnepd bnep0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
RIP: 0010:refcount_warn_saturate+0xf4/0x130 lib/refcount.c:28
Code: cc e8 30 3b 0f fd 48 8d 3d 89 d1 e8 0b 67 48 0f b9 3a e8 1f 3b 0f fd 5b 5d e9 58 4f 94 06 e8 13 3b 0f fd 48 8d 3d 7c d1 e8 0b <67> 48 0f b9 3a e8 02 3b 0f fd 5b 5d c3 cc cc cc cc e8 f6 3a 0f fd
RSP: 0018:ffffc900059ff958 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff888052bcdc78 RCX: ffffffff84f96b3b
RDX: ffff888020be8000 RSI: ffffffff84f96bcd RDI: ffffffff90e23d50
RBP: 0000000000000003 R08: 0000000000000005 R09: 0000000000000004
R10: 0000000000000003 R11: 0000000000000000 R12: ffff88802b509000
R13: ffff888052bcdc78 R14: ffffffff86352db0 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888124472000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fea969ea4c0 CR3: 000000005c73e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 __refcount_sub_and_test include/linux/refcount.h:400 [inline]
 __refcount_dec_and_test include/linux/refcount.h:432 [inline]
 refcount_dec_and_test include/linux/refcount.h:450 [inline]
 kref_put include/linux/kref.h:64 [inline]
 klist_dec_and_del lib/klist.c:206 [inline]
 klist_put+0x18a/0x1d0 lib/klist.c:217
 device_del+0x1b8/0x9b0 drivers/base/core.c:3872
 unregister_netdevice_many_notify+0x179e/0x24f0 net/core/dev.c:12453
 unregister_netdevice_many net/core/dev.c:12481 [inline]
 unregister_netdevice_queue net/core/dev.c:12291 [inline]
 unregister_netdevice_queue+0x30b/0x3c0 net/core/dev.c:12281
 unregister_netdevice include/linux/netdevice.h:3444 [inline]
 unregister_netdev+0x1f/0x60 net/core/dev.c:12499
 bnep_session+0x223f/0x2d90 net/bluetooth/bnep/core.c:532
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	cc                   	int3
   1:	e8 30 3b 0f fd       	call   0xfd0f3b36
   6:	48 8d 3d 89 d1 e8 0b 	lea    0xbe8d189(%rip),%rdi        # 0xbe8d196
   d:	67 48 0f b9 3a       	ud1    (%edx),%rdi
  12:	e8 1f 3b 0f fd       	call   0xfd0f3b36
  17:	5b                   	pop    %rbx
  18:	5d                   	pop    %rbp
  19:	e9 58 4f 94 06       	jmp    0x6944f76
  1e:	e8 13 3b 0f fd       	call   0xfd0f3b36
  23:	48 8d 3d 7c d1 e8 0b 	lea    0xbe8d17c(%rip),%rdi        # 0xbe8d1a6
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	e8 02 3b 0f fd       	call   0xfd0f3b36
  34:	5b                   	pop    %rbx
  35:	5d                   	pop    %rbp
  36:	c3                   	ret
  37:	cc                   	int3
  38:	cc                   	int3
  39:	cc                   	int3
  3a:	cc                   	int3
  3b:	e8 f6 3a 0f fd       	call   0xfd0f3b36


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
