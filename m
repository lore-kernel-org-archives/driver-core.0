Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8382D3FF1CB
	for <driver-core@lists.linux.dev>; Wed,  5 Aug 2026 22:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785970001; cv=none; b=mMvAYUps1vHAx6lD9poWfPH6M7W+zjH+K8Vw6k20Ql2IXwPVY36O9uI+QRqg3OmmdawYjuRCNhHR9XNzPqRJMjPB8SbaUxEkXh2aKPIriIHNcnAxDpZyvqGoAvWzHnaZcCJVBsc76LAcCYHeOdRRbUb1Fi7LDvhp+Lb8uPiJFOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785970001; c=relaxed/simple;
	bh=QoYUBdFWimbBdtZOdXIwLgeVeQFvZQEJ6C67Ry45HKs=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ejpSr6s5Zd7HmNOx7WBH62CmBzaLm3f8vhsOfKHjMXODEN7rsKq/gr1yr33Vo1Zd9TGe+8pKWbEJaRBAozMGN10eE+fi95ZjG1cI009egjRyX8beAWXGF8JYE4AwV92HACzqBX9Hc1SN6igD6Fx4FPeDduLquuEZRMItFZuAHZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4a45997664aso1699027b6e.1
        for <driver-core@lists.linux.dev>; Wed, 05 Aug 2026 15:46:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785969998; x=1786574798;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=W9wGtsTczoFx/e+Ir/a8hLSmHxBvMLFIuJ2a71e5PXM=;
        b=KDIK8OZ8FOTTCo8Xuzl5rvKOomWj6NugKbzWq3ITFhfgcH/Gq2YvjFXA6XRkw2WEQx
         aFMcp6A3tpmbDQ3s6SPduooBn8yeOFeneXekY9maH9xz2a7jIJW5ZvfSThqLn7jVoncm
         ljwvCHQNUtpux5uKJ2JIlt1HBXd1/eyj5dKeBmPMFDI/kfUW73jW30xcgmzm6YiGGUlT
         qvYuzMvsOtPQs4WUgMGkqAgvG/RIb5tVCyQF+GjEC3iTV1M8B72zyJ+3PjX3AdUHcNxo
         UvkIKBOGKFCUuelX0E/QoQUh8Wtoupoxy4Cv5RnizMahiiJXNj0lZB3+knxS7M4qWXl4
         MVZw==
X-Forwarded-Encrypted: i=1; AHgh+RqWNhsWammpk2JtqcrW8zZondUy8jyy0KCoiYCnWKuiSfLtiHS5Znl6twKsCaBon4e3SfO/OoujQOzCIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKZssp2etpo99b35WspxeCSbQK2GDWQrg5QnJ8e8j3NsQ4Uajq
	uBshn6O4kpzaDNjIEt8ET+W8xxNk7rXV+WCvGrWDnSIE1sPoGYp9mKy7Ppbu81Yc6AJXviBy56T
	tXO/enYqythesKuyieC21hbktiAbksBU4/1iPcCMqgjdy8mw2kf2IPcVDWw0=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1ca0:b0:6ac:a994:8794 with SMTP id
 006d021491bc7-6ae96c3a350mr5679561eaf.7.1785969998153; Wed, 05 Aug 2026
 15:46:38 -0700 (PDT)
Date: Wed, 05 Aug 2026 15:46:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73bd4e.01d0871a.3a0d52.0006.GAE@google.com>
Subject: [syzbot] [kernel?] general protection fault in regmap_get_i2c_bus
From: syzbot <syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com>
To: broonie@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev, 
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    848acc8ffe1b Merge tag 'fsverity-for-linus' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=155113b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=145fa60d73086782
dashboard link: https://syzkaller.appspot.com/bug?extid=6c7e68b141ebd3a2cadf
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1446acc6580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12905bb9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-848acc8f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6fb497cc0c8d/vmlinux-848acc8f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/663ccee34982/bzImage-848acc8f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6c7e68b141ebd3a2cadf@syzkaller.appspotmail.com

Oops: general protection fault, probably for non-canonical address 0xdffffc0000000003: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000018-0x000000000000001f]
CPU: 0 UID: 0 PID: 5929 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:regmap_get_i2c_bus+0xbe/0xc60 drivers/base/regmap/regmap-i2c.c:360
Code: 89 c6 e8 f5 8b a3 fb 45 85 e4 0f 85 84 01 00 00 e8 77 91 a3 fb 4c 8d 73 1c 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 <0f> b6 14 02 4c 89 f0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 a2
RSP: 0018:ffffc900042ef568 EFLAGS: 00010207
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff8666d35b
RDX: 0000000000000003 RSI: ffffffff8666d369 RDI: ffff88802be1a540
RBP: ffff8880552ba000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff8880552ba018 R14: 000000000000001c R15: ffff8880552ba000
FS:  000055558b984500(0000) GS:ffff8880d5dd8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b33263fff CR3: 000000004714c000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 __devm_regmap_init_i2c+0x28/0x80 drivers/base/regmap/regmap-i2c.c:439
 stusb160x_probe+0xe4/0x1ae0 drivers/usb/typec/stusb160x.c:649
 i2c_device_probe+0x658/0xd10 drivers/i2c/i2c-core-base.c:592
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 driver_probe_device+0x4a/0x140 drivers/base/dd.c:898
 __device_attach_driver+0x1df/0x320 drivers/base/dd.c:1026
 bus_for_each_drv+0x159/0x1e0 drivers/base/bus.c:500
 __device_attach+0x1e4/0x4d0 drivers/base/dd.c:1098
 device_initial_probe+0xaf/0xd0 drivers/base/dd.c:1153
 bus_probe_device+0x64/0x160 drivers/base/bus.c:620
 device_add+0x121d/0x1970 drivers/base/core.c:3772
 i2c_new_client_device+0x660/0xd30 drivers/i2c/i2c-core-base.c:1019
 new_device_store+0x20f/0x420 drivers/i2c/i2c-core-base.c:1307
 dev_attr_store+0x58/0x80 drivers/base/core.c:2505
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f143eb9e019
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc13e63168 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f143ee25fa0 RCX: 00007f143eb9e019
RDX: 000000000000000f RSI: 0000200000000300 RDI: 0000000000000003
RBP: 00007f143ec3500c R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f143ee25fac R14: 00007f143ee25fa0 R15: 00007f143ee25fa0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:regmap_get_i2c_bus+0xbe/0xc60 drivers/base/regmap/regmap-i2c.c:360
Code: 89 c6 e8 f5 8b a3 fb 45 85 e4 0f 85 84 01 00 00 e8 77 91 a3 fb 4c 8d 73 1c 48 b8 00 00 00 00 00 fc ff df 4c 89 f2 48 c1 ea 03 <0f> b6 14 02 4c 89 f0 83 e0 07 83 c0 03 38 d0 7c 08 84 d2 0f 85 a2
RSP: 0018:ffffc900042ef568 EFLAGS: 00010207
RAX: dffffc0000000000 RBX: 0000000000000000 RCX: ffffffff8666d35b
RDX: 0000000000000003 RSI: ffffffff8666d369 RDI: ffff88802be1a540
RBP: ffff8880552ba000 R08: 0000000000000005 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: ffff8880552ba018 R14: 000000000000001c R15: ffff8880552ba000
FS:  000055558b984500(0000) GS:ffff8880d5dd8000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000001b33263fff CR3: 000000004714c000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	89 c6                	mov    %eax,%esi
   2:	e8 f5 8b a3 fb       	call   0xfba38bfc
   7:	45 85 e4             	test   %r12d,%r12d
   a:	0f 85 84 01 00 00    	jne    0x194
  10:	e8 77 91 a3 fb       	call   0xfba3918c
  15:	4c 8d 73 1c          	lea    0x1c(%rbx),%r14
  19:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  20:	fc ff df
  23:	4c 89 f2             	mov    %r14,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	0f b6 14 02          	movzbl (%rdx,%rax,1),%edx <-- trapping instruction
  2e:	4c 89 f0             	mov    %r14,%rax
  31:	83 e0 07             	and    $0x7,%eax
  34:	83 c0 03             	add    $0x3,%eax
  37:	38 d0                	cmp    %dl,%al
  39:	7c 08                	jl     0x43
  3b:	84 d2                	test   %dl,%dl
  3d:	0f                   	.byte 0xf
  3e:	85                   	.byte 0x85
  3f:	a2                   	.byte 0xa2


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
