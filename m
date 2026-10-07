Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D910D495AE9
	for <driver-core@lists.linux.dev>; Wed,  7 Oct 2026 12:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791374440; cv=none; b=Zq9h7Natyj/Sy6hXEoi6T5xs4lSkHvjyeOE/ghjG1NOw0Eg901hB9N0S53EuLYIXyj0VPMEIoR5KlVlkKA7STojbUXywZ1kY7VVxwzwxjreFDmd/8jstZVs4eUx/ac4hzfzYH8NFjy6uytdcPE0su9uWtLeG8mta1HGz51ODTgE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791374440; c=relaxed/simple;
	bh=+1ZIUDEH1UMPylr8k3iwVs3/zYxLWFNlciH52DbTlUc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=MLQy/L584Kv8ZjIkvPqgd0wnqfZ3sYFVufs54zIxN1nJ4EOE2SU0hReL7laXF55kyRENaD0Re9aoZ06PlpeL7Kc7k0eSrwomqXcSY99s0GYwEF1es35Q/NNwzsxr/8rtG/pwWtH25QLhjfldUQkMQfGhis/hGU9hqeno5af4il4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4ab260600easo2494625b6e.1
        for <driver-core@lists.linux.dev>; Wed, 07 Oct 2026 05:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791374430; x=1791979230;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cPL7LsU0XdV5dZnyY11Ue59c/gkO7XrdWcOIpHOg7mM=;
        b=s3FaaK7ldeqG/HpGEK4jbBMksB10sMBh+9FvDKyonFjxgQW3RZRh6PF0pxMHbKqkz2
         CpzmlDh6fdBbFgnETNiEs4X3UW2A3+RLj6B6iDJRgsSvZoC+iDDG71TmNeb8X8ICZ3N3
         LdpBiS/LfCQ2B4bCxGK2icd5Z9thkhEtrze+t+z0GjmmSmfk+4ohGKzGcU81Td8bpMoF
         vdwG+0Tb4lskAoWM/21tjY1iJQVP2UJB2/uX6I7bHV/jTjH6XbP9F8rw11XajJxVayLS
         bZ7sNU/qFR5KIJxHbbcRbSvodh1izV4V4ovnuVR8YPUeZbeGghrRC8t/FKBNlrtACrvo
         1V0A==
X-Forwarded-Encrypted: i=1; AKwUvByi6hXxqTg6pVqeZwVB/PwYbsgiv6ZYGiauO13fedxIEhNGX0JBUox1DZjtoy5BzsmYUEaX66qSk4CqfA==@lists.linux.dev
X-Gm-Message-State: AFuF++mNu64lu5jBNk4actF7G4+y7zgQUJbrEEbz1wSx1obMDGu01zOx
	Tm6dDMW4J/WN34cdo0wPCSBKyz+rlkvck5kMc4JqbOFtG8owrjpnDvLFOM99FTkdSXDlshyRnXv
	hcD6c1tOFZcaNXoVZnTrwVDzb85JgBO+yBJOuoWelpl8YjsJyipLGnGAberI=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1493:b0:4d6:9133:cfe2 with SMTP id
 5614622812f47-4faaf252cc0mr4967039b6e.39.1791374429738; Wed, 07 Oct 2026
 05:00:29 -0700 (PDT)
Date: Wed, 07 Oct 2026 05:00:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ac6345d.d03902a3.74d6f.0006.GAE@google.com>
Subject: [syzbot] [usb?] BUG: unable to handle kernel paging request in usb_driver_release_interface
From: syzbot <syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    602042bf29f6 Merge tag 'wq-for-7.3-rc6-fixes' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=155ae00d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=929e4854a828f434
dashboard link: https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10bd6715580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14ae21c9580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-602042bf.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/c804d2e9b640/vmlinux-602042bf.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d6cd162ae59e/bzImage-602042bf.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+863936f50214e843ae0c@syzkaller.appspotmail.com

wwan wwan1: port wwan1mbim0 disconnected
Oops: general protection fault, probably for non-canonical address 0xdffffc000000000b: 0000 [#1] SMP KASAN NOPTI
KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
CPU: 0 UID: 0 PID: 9 Comm: kworker/0:0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Workqueue: usb_hub_wq hub_event
RIP: 0010:klist_put+0x4d/0x1d0 lib/klist.c:212
Code: c1 ea 03 80 3c 02 00 0f 85 74 01 00 00 48 b8 00 00 00 00 00 fc ff df 4c 8b 23 49 83 e4 fe 49 8d 7c 24 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 43 01 00 00 4c 89 e7 4d 8b 74 24 58 e8 cc ef 0c
RSP: 0018:ffffc900000c7450 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888035673c80 RCX: 0000000000000000
RDX: 000000000000000b RSI: ffffffff8bc8e645 RDI: 0000000000000058
RBP: 0000000000000001 R08: 0000000000000000 R09: fffffbfff224ec84
R10: ffffffff91276423 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000001 R14: ffffffff912763e0 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880d5b4e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffcc2839000 CR3: 000000003938c000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 klist_del lib/klist.c:230 [inline]
 klist_remove+0x14c/0x2e0 lib/klist.c:249
 __device_release_driver drivers/base/dd.c:1357 [inline]
 device_release_driver_internal+0x4fb/0x620 drivers/base/dd.c:1372
 usb_driver_release_interface+0x10e/0x190 drivers/usb/core/driver.c:643
 cdc_ncm_unbind+0x2ac/0x350 drivers/net/usb/cdc_ncm.c:1019
 usbnet_disconnect+0x1e2/0x300 drivers/net/usb/usbnet.c:1692
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:461
 device_remove drivers/base/dd.c:618 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:610
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3965
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1484
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2355
 hub_port_connect drivers/usb/core/hub.c:5425 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5725 [inline]
 port_event drivers/usb/core/hub.c:5889 [inline]
 hub_event+0x1bb1/0x4420 drivers/usb/core/hub.c:5971
 process_one_work+0xac7/0x1b10 kernel/workqueue.c:3396
 process_scheduled_works kernel/workqueue.c:3479 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3560
 kthread+0x373/0x450 kernel/kthread.c:436
 ret_from_fork+0x730/0xd60 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:klist_put+0x4d/0x1d0 lib/klist.c:212
Code: c1 ea 03 80 3c 02 00 0f 85 74 01 00 00 48 b8 00 00 00 00 00 fc ff df 4c 8b 23 49 83 e4 fe 49 8d 7c 24 58 48 89 fa 48 c1 ea 03 <80> 3c 02 00 0f 85 43 01 00 00 4c 89 e7 4d 8b 74 24 58 e8 cc ef 0c
RSP: 0018:ffffc900000c7450 EFLAGS: 00010202
RAX: dffffc0000000000 RBX: ffff888035673c80 RCX: 0000000000000000
RDX: 000000000000000b RSI: ffffffff8bc8e645 RDI: 0000000000000058
RBP: 0000000000000001 R08: 0000000000000000 R09: fffffbfff224ec84
R10: ffffffff91276423 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000001 R14: ffffffff912763e0 R15: dffffc0000000000
FS:  0000000000000000(0000) GS:ffff8880d5b4e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055557a2d0a28 CR3: 000000002c457000 CR4: 0000000000352ef0
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
  3d:	cc                   	int3
  3e:	ef                   	out    %eax,(%dx)
  3f:	0c                   	.byte 0xc


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
