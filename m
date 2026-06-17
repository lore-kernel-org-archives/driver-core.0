Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D5223AFD01
	for <driver-core@lists.linux.dev>; Wed, 17 Jun 2026 06:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781677822; cv=none; b=lLjBjsEZtp7ASk2oWXT7G44C+Mj6QHd8Dpy3lhopa+Qdovr2tFWXMfhL8oJ8tkxj3RY9UUZ/Rd7JOQG5pwFiuEUGt4i90RTa+sHuGEWGfLstM+Dss7usa8C3XH5GsimwzAqDsc/MqMwNTwO71QAbcwKHXthV5YdMuWgnzwwki0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781677822; c=relaxed/simple;
	bh=Zsk+Ve3CVPvQMuYioPGt6G10GOhmnoljUvMkAZFWYSU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=XeOpJ0ECGIvQPfxhDbnQL4Z1B89lCq1WkG67uaBMcg0KKSPeMpzEcsAc9+tlIJuwYWOj/MX3z18v9auz8U0eO0CrzHlW5DOAXv39QwXBvNTf1qFZtWGrYfECEWjPUKN4RSXljcwh5shCO6wSP0Lmg3bwMrmzQHxGrTrilEDHmuw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-486db2bf46eso7212068b6e.3
        for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 23:30:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781677820; x=1782282620;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yfm5IcI0ChgAuw5g0Ex87FXqhtkJfXVNcb6vMCo83WA=;
        b=MHvl67kFkZ2AYM4gCPRfNf55QMVyuqaOcn5ew0AFJcrbeph9jR2eZEc1OBppPaSu8j
         o4Gq/TlOgmYVmddZU4CLuBUmL4e89081bsjTGr/BqZGMarXLN46WfhuWHW0cOCi8sn0r
         /KJl6rMv4tGU6BsLjTDF7YMjxE8wYfSLcbxX9TgPdWRyAejvt8bKW3z65Ry9UZughG/F
         nO9jaGCsurrHukehfDBWhADYHxkoEJ5ljXi+R2QkRbqAM/7PxltmN7d38F4tlh4slDbP
         AqnJ6XE+J/wWEDp8e9P2iUC3HGFYEzNmJr1qe2C8ZB5eyWWK7L48sj2oHIU5S3B21nlw
         kTUA==
X-Gm-Message-State: AOJu0YxFQgCkjhHNxkj1JahbTMMjxLiVwmdLocreOki5fs+Mw9XyUxfw
	bn+uDkMjyiurxlhlVjq4ITVB2arvCYsiYaa1Xf1pfqjPndhta14vcTarQC45Bec3Ii3s4B79Ous
	CpEJaU3HeXgK32lduyy6BG4b1r3F0BTV+TxPWswHc5WchyLymmCYqa/MtAZyx2Q==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:3445:b0:486:3537:2193 with SMTP id
 5614622812f47-489428a47d0mr2640018b6e.11.1781677820114; Tue, 16 Jun 2026
 23:30:20 -0700 (PDT)
Date: Tue, 16 Jun 2026 23:30:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a323efc.b0403584.28d0ff.0008.GAE@google.com>
Subject: [syzbot] [kernfs?] WARNING in __kernfs_new_node
From: syzbot <syzbot+ed4cf6ba7dd6164eb4ff@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    ec039126b7fa Add linux-next specific files for 20260611
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1733d9ee580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d0d1fa2afcbce17c
dashboard link: https://syzkaller.appspot.com/bug?extid=ed4cf6ba7dd6164eb4ff
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/be809c32a471/disk-ec039126.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/13ea1053e3b5/vmlinux-ec039126.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1bcdab47ddc8/bzImage-ec039126.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ed4cf6ba7dd6164eb4ff@syzkaller.appspotmail.com

------------[ cut here ]------------
!atomic_read(&kn->count)
WARNING: fs/kernfs/dir.c:560 at kernfs_get fs/kernfs/dir.c:560 [inline], CPU#0: kworker/0:2/820
WARNING: fs/kernfs/dir.c:560 at __kernfs_new_node+0x8b8/0xa70 fs/kernfs/dir.c:704, CPU#0: kworker/0:2/820
Modules linked in:
CPU: 0 UID: 0 PID: 820 Comm: kworker/0:2 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/09/2026
Workqueue: events request_firmware_work_func
RIP: 0010:kernfs_get fs/kernfs/dir.c:560 [inline]
RIP: 0010:__kernfs_new_node+0x8b8/0xa70 fs/kernfs/dir.c:704
Code: 08 e9 44 fb ff ff e8 77 2d 59 ff e8 e2 c6 27 ff e9 8f fa ff ff e8 68 2d 59 ff e8 a3 e0 c6 fe e9 26 fb ff ff e8 59 2d 59 ff 90 <0f> 0b 90 e9 d1 fc ff ff e8 db 55 d1 08 89 f9 80 e1 07 80 c1 03 38
RSP: 0018:ffffc90003bbf440 EFLAGS: 00010293
RAX: ffffffff826c9e47 RBX: 0000000000000000 RCX: ffff88802655dd00
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: ffffc90003bbf598 R08: 0000000000000000 R09: 0000000000000000
R10: dffffc0000000000 R11: ffffed10064cbc1f R12: ffff88803265e0f0
R13: 1ffff92000777e94 R14: dffffc0000000000 R15: ffff88805cc1b3c0
FS:  0000000000000000(0000) GS:ffff888125a6b000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000110c272190 CR3: 000000003404a000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 kernfs_new_node fs/kernfs/dir.c:751 [inline]
 kernfs_create_dir_ns+0xfe/0x230 fs/kernfs/dir.c:1120
 sysfs_create_dir_ns+0x12f/0x2a0 fs/sysfs/dir.c:59
 create_dir lib/kobject.c:73 [inline]
 kobject_add_internal+0x631/0xd10 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_add+0x163/0x240 lib/kobject.c:426
 class_dir_create_and_add drivers/base/core.c:3300 [inline]
 get_device_parent+0x31d/0x3a0 drivers/base/core.c:3351
 device_add+0x2e1/0xb90 drivers/base/core.c:3681
 fw_load_sysfs_fallback drivers/base/firmware_loader/fallback.c:86 [inline]
 fw_load_from_user_helper drivers/base/firmware_loader/fallback.c:162 [inline]
 firmware_fallback_sysfs+0x2e4/0xa30 drivers/base/firmware_loader/fallback.c:238
 _request_firmware+0x1052/0x1780 drivers/base/firmware_loader/main.c:898
 request_firmware_work_func+0xba/0x2e0 drivers/base/firmware_loader/main.c:1162
 process_one_work+0x98b/0x1630 kernel/workqueue.c:3326
 process_scheduled_works kernel/workqueue.c:3409 [inline]
 worker_thread+0xb49/0x1140 kernel/workqueue.c:3490
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
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
