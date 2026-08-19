Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DCBF48EBEA
	for <driver-core@lists.linux.dev>; Wed, 19 Aug 2026 17:18:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787159933; cv=none; b=Ww/YHGXOcee45g2rM8sjZ6Y2/D6LTosZVGP69c6JJrjkcTqeGyBxA/qbuuE45p9USX++FsSRn6IxLBXOcbrjKt4DybzFe16UCHw9Hz43WTYBTt2PcCsaBMfZVK0csqpKy04HMCVa6rs5kcMCFBgKhsnH1DlJdyd4xnFBVwr4khs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787159933; c=relaxed/simple;
	bh=us+SEeujoTGLyuvbfgmOwPmfxI85neAIP6WKlZDKv4A=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MVm5xehTSZXX18aTFO63uBCmlf0aWYJqlRnth4k8eyKCMHYiZP0ijn0sHLIH6VHwMN0efiZJORziCeRe4EiyftPi7NU6z9yb4rVJN6A7l8GKNjRRj1/MRsgwcVr6uy2o4LII5HGDABZTcKwJyJbTpoS4v0snTyaiGb/TaaGCufk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4ad778bacbeso1645021b6e.1
        for <driver-core@lists.linux.dev>; Wed, 19 Aug 2026 10:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787159926; x=1787764726;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1hmUOyv2zS057iLMKlIppxbaLAbSot00YxR6lPnh3v8=;
        b=AltdKaPkOgk25IfxuiSJ4WrpkGtdfEUS6i90aebUpJwPjtgtMxg1vKh+NZ6+wTGEib
         nTMx8QpH6y7sste+wL2eEXfHcDk3HkX5Z0zTi67sS5Mjkl8N9zxP8xa3uAVtU+IINMoA
         wrv/gGsVZtJhYPy90M/WUZmoAMg1n+OovhwNo1hesZp/Ba9bwKriyEUT5XtKvCJ1p5Kk
         lRr2sbMeNzovFM46lk0jnrNw2yAyPqb83HQNc8kbQ9b4YUK/gM4HqS/xjyMlAUhyzy09
         Q71fpLR0lcbn7eqnXPwOkwtwvhS5lh2V7DpLiU7KjYH0TzsldCoTeOlpwdyCREYuilDV
         l37A==
X-Forwarded-Encrypted: i=1; AHgh+RpJ2ZGq3BCW0XnunSk8SR7lF7YZcV3/UEYW82rV0r1uCCsI/59+imGVE7zKZQqgNJLZTzkjsPhUXWK5ww==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHI+USY9OqmBvuDVb3qnGXKYEsGWm0IYD7HR9+pzsfhofORdfv
	dKfpNfkOEtxlf5WhV6tAA2XPOKhSSs4hmH3HlgSYycToYcWE2g57v4pheKyOCWLa3cQUlyktK8e
	6oot8e5rkshMPmIRFAdl7bNrb5zocb0JV9WVFPcnmPZ8ZbJX+wN0EpIN+w+M=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:bc4:b0:496:a36:b5e5 with SMTP id
 5614622812f47-4b2bcac63e5mr6842994b6e.17.1787159926444; Wed, 19 Aug 2026
 10:18:46 -0700 (PDT)
Date: Wed, 19 Aug 2026 10:18:46 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a85e576.f7a79266.2f965f.003f.GAE@google.com>
Subject: [syzbot] [usb?] general protection fault in bus_remove_device
From: syzbot <syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    15ef2f78c49d Merge tag 'input-for-v7.2-rc7' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11b16949580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1d67342c314f228d
dashboard link: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1198b279580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1598b279580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-15ef2f78.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/dc9c417e94c9/vmlinux-15ef2f78.xz
kernel image: https://storage.googleapis.com/syzbot-assets/db592e5f65db/bzImage-15ef2f78.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com

usb 5-1: selecting invalid altsetting 0
usb 5-1: USB disconnect, device number 2
Oops: general protection fault, probably for non-canonical address 0xdffffc000000000b: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
CPU: 1 UID: 0 PID: 29 Comm: kworker/1:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:klist_put+0x4d/0x1d0 lib/klist.c:212
Code: c1 ea 03 80 3c 02 00 0f 85 74 01 00 00 48 b8 00 00 00 00 00 fc ff df 4c 8b 23 49 83 e4 fe 49 8d 7c 24 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 43 01 00 00 4c 89 e7 4d 8b 74 24 58 e8 7c 10 0d
RSP: 0018:ffffc90000687620 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888036142880 RCX: 0000000000000000
RDX: 000000000000000b RSI: ffffffff8bb263a5 RDI: 0000000000000058
RBP: 0000000000000001 R08: 0000000000000000 R09: fffffbfff2247f98
R10: ffffffff9123fcc3 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000001 R14: ffffffff9123fc80 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880d5cde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff41160ff4 CR3: 0000000033bb7000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 klist_del lib/klist.c:230 [inline]
 klist_remove+0x14c/0x2e0 lib/klist.c:249
 __device_release_driver drivers/base/dd.c:1357 [inline]
 device_release_driver_internal+0x4fb/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3961
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5415 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5715 [inline]
 port_event drivers/usb/core/hub.c:5879 [inline]
 hub_event+0x1bb1/0x4420 drivers/usb/core/hub.c:5961
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:klist_put+0x4d/0x1d0 lib/klist.c:212
Code: c1 ea 03 80 3c 02 00 0f 85 74 01 00 00 48 b8 00 00 00 00 00 fc ff df 4c 8b 23 49 83 e4 fe 49 8d 7c 24 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 43 01 00 00 4c 89 e7 4d 8b 74 24 58 e8 7c 10 0d
RSP: 0018:ffffc90000687620 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888036142880 RCX: 0000000000000000
RDX: 000000000000000b RSI: ffffffff8bb263a5 RDI: 0000000000000058
RBP: 0000000000000001 R08: 0000000000000000 R09: fffffbfff2247f98
R10: ffffffff9123fcc3 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000001 R14: ffffffff9123fc80 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880d5cde000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fff41160ff4 CR3: 000000002ccae000 CR4: 0000000000352ef0
----------------
Code disassembly (best guess):
   0:	c1 ea 03             	shr    $0x3,%edx
   3:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   7:	0f 85 74 01 00 00    	jne    0x181
   d:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
  14:	fc ff df
  17:	4c 8b 23             	mov    (%rbx),%r12
  1a:	49 83 e4 fe          	and    $0xfffffffffffffffe,%r12
  1e:	49 8d 7c 24 58       	lea    0x58(%r12),%rdi
  23:	48 89 fa             	mov    %rdi,%rdx
  26:	48 c1 ea 03          	shr    $0x3,%rdx
* 2a:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1) <-- trapping instruction
  2e:	0f 85 43 01 00 00    	jne    0x177
  34:	4c 89 e7             	mov    %r12,%rdi
  37:	4d 8b 74 24 58       	mov    0x58(%r12),%r14
  3c:	e8                   	.byte 0xe8
  3d:	7c 10                	jl     0x4f
  3f:	0d                   	.byte 0xd


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
