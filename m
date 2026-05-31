Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54EDD1DDA18
	for <driver-core@lists.linux.dev>; Sun, 31 May 2026 02:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780194521; cv=none; b=fKxsapbiGOoCcVXOZvqA2p3VBOXaZDjP2eWce2EFReeIyi7BI1cZCRLQbERGIWBcFx3KzsmwS26+CnFe5ztExXVyUKs6fK5SUSE/2x8tcyQ1h4DsgrE8klRVIbY8pTw76/4XIodBVzWs6ysxgiF0IE0AhUz2zyDljjz6Fvu0+qU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780194521; c=relaxed/simple;
	bh=traqXVx1vo0Jwba27IJOU5DSbGNn2xNXmP/g/mEwiCc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=pTpUesZntH7pGKEMPkoM2AaolBCFZoHAv4B7i+iL9iEiLM0vh6qC4kFgkMdfteLlhP242cqwFr+dFgZjkq1hidylaUsJPEhmbHzXYR4vNYPeotAiWSqET42dvU8rlpZVX6HVUHtONiArYpwn5wlpavgqcdSfDdiTXTVNg/dNcUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-69d85c328c7so5621518eaf.3
        for <driver-core@lists.linux.dev>; Sat, 30 May 2026 19:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780194519; x=1780799319;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V7/upC7/jIS5o0DT/zIZYwI89ocS62xL016/syNzWFk=;
        b=C22zs6CBFtcpDRkULT2P591lecK8fiikaJsiqghBGwGF+8Yf7zFN59QJt9vc6rYrjL
         tiMr6v1gIZOnvzrM86i0VSiSgorOwg/nyT0x/Vka/7hFNkbmsBDrKrLh7CWngcB85W3c
         J1Y0yDH86NTIEOn9vzgtiYe/H/Qv32JaWLzN/wN/mUqg6SnCi5UNwtqzeA+I4lqx9HBJ
         xc6N+Y2BNUDbOxNzfvvh377Nfm7Ky7IGyATIgLF0engVfWzphaTPoPkff1WjtEz7XPER
         FCGs7LFegtv+uMjTn2c2gpaeZYIOemO9lfPLWufaYDONG8RbGuqhMA2E6gMA2Jt3XZVO
         tAXQ==
X-Forwarded-Encrypted: i=1; AFNElJ8aIJe/yz/ENmayTC0XfFYUD2ZqFC8MdoQGGRA/B9uvxQZ6HC9JJvrNYcJQ/FxR3BehCF0ZUpKS39BCSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywk0RoN+h4zXxyw1iMJBpexMZOHyRC3wO02nBWM9Uye/pbtUdPX
	d6vPNuY6Znh316kN1l4L976pywvEdUKFlj6InXn6B5Bp9EqW4Lhe+x1CidSa/gU0UAGr8KmSkUj
	Aruk516c25/d3GzRY32ghMs1e9VFWH7nWInUNbKeL8NfZn0/V2hqrSOmHdlY=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:200e:b0:69d:f855:b748 with SMTP id
 006d021491bc7-69e1059e2d8mr2858027eaf.34.1780194519407; Sat, 30 May 2026
 19:28:39 -0700 (PDT)
Date: Sat, 30 May 2026 19:28:39 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a1b9cd7.be734480.1c9622.0000.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in fw_devlink_drivers_done
From: syzbot <syzbot+c750936fbcad82cf6da9@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    e7e28506af98 Add linux-next specific files for 20260526
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=169cb92e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e1701da6552dd9b8
dashboard link: https://syzkaller.appspot.com/bug?extid=c750936fbcad82cf6da9
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0060088615f7/disk-e7e28506.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/bee8a0723af7/vmlinux-e7e28506.xz
kernel image: https://storage.googleapis.com/syzbot-assets/040209574106/bzImage-e7e28506.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c750936fbcad82cf6da9@syzkaller.appspotmail.com

------------[ cut here ]------------
class_for_each_device called for class 'devlink' before it was registered
WARNING: drivers/base/class.c:416 at class_for_each_device+0x2d8/0x390 drivers/base/class.c:415, CPU#1: kworker/1:1/37
Modules linked in:
CPU: 1 UID: 0 PID: 37 Comm: kworker/1:1 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/18/2026
Workqueue: events deferred_probe_timeout_work_func
Code: 8d 1d d8 14 0e 0a 4c 89 e8 48 c1 e8 03 42 80 3c 38 00 74 08 4c 89 ef e8 62 ad a5 fc 49 8b 55 00 48 89 df 48 c7 c6 0e 5f 5d 8d <67> 48 0f b9 3a b8 ea ff ff ff eb 1b e8 43 16 3b fc 49 81 c6 90 00
RSP: 0000:ffffc90000ac7a20 EFLAGS: 00010246
RAX: 1ffffffff17868c0 RBX: ffffffff8f986560 RCX: ffff88801e2c9f00
RDX: ffffffff8bc35ac0 RSI: ffffffff8d5d5f0e RDI: ffffffff8f986560
RBP: ffffc90000ac7af8 R08: ffffc90000ac7a7f R09: 0000000000000000
R10: ffffc90000ac7a60 R11: fffff52000158f50 R12: ffffc90000ac7a60
R13: ffffffff8bc34600 R14: 1ffff92000158f48 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff888125fd7000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000000000000000 CR3: 000000000ddb8000 CR4: 00000000003506f0
Call Trace:
 <TASK>
 fw_devlink_drivers_done+0x35/0x50 drivers/base/core.c:1837
 deferred_probe_timeout_work_func+0x21/0x220 drivers/base/dd.c:305
 process_one_work+0x98b/0x1630 kernel/workqueue.c:3318
 process_scheduled_works kernel/workqueue.c:3401 [inline]
 worker_thread+0xb49/0x1140 kernel/workqueue.c:3482
 kthread+0x388/0x470 kernel/kthread.c:436
 ret_from_fork+0x514/0xb70 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	8d 1d d8 14 0e 0a    	lea    0xa0e14d8(%rip),%ebx        # 0xa0e14de
   6:	4c 89 e8             	mov    %r13,%rax
   9:	48 c1 e8 03          	shr    $0x3,%rax
   d:	42 80 3c 38 00       	cmpb   $0x0,(%rax,%r15,1)
  12:	74 08                	je     0x1c
  14:	4c 89 ef             	mov    %r13,%rdi
  17:	e8 62 ad a5 fc       	call   0xfca5ad7e
  1c:	49 8b 55 00          	mov    0x0(%r13),%rdx
  20:	48 89 df             	mov    %rbx,%rdi
  23:	48 c7 c6 0e 5f 5d 8d 	mov    $0xffffffff8d5d5f0e,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	b8 ea ff ff ff       	mov    $0xffffffea,%eax
  34:	eb 1b                	jmp    0x51
  36:	e8 43 16 3b fc       	call   0xfc3b167e
  3b:	49                   	rex.WB
  3c:	81                   	.byte 0x81
  3d:	c6                   	(bad)
  3e:	90                   	nop


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
