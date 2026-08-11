Received: from mail-oi1-f206.google.com (mail-oi1-f206.google.com [209.85.167.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC71D276028
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 12:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786452808; cv=none; b=ipFKX5jqCR+EoskjivELusPApZTijwFYMvE95BlHGu+Qd/ct04qJwbbgLU6pFBrJCE/sms9WNDbUJZfYp9HmvYiznIgoj3fHFmz7FS0xDhwMgYS5UTjgB3CWEjcIhlf/0CFT5BbKss9FzlvLPNIUwzd1DeR8q1LW0bpDN3jS/jQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786452808; c=relaxed/simple;
	bh=XFWIHy6QuGQ5UtkZD5i86rs2cCXDOIRIBawqKDnYW8Q=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ACvaqoJ8NGkhVDcbs24fdCFQhM/x9rHo8gBeBiHnyd0fZ9QKVjGrLPRtvzpnb+AHAJHg1cwLVvI75jepjG5bPXwwUceTm1FDTl4dOiiyjdYUeAViBEhcnn9mvf7ibT/JRk1XoqrBq1b/hBlx8x/fhZNn62LVO4AZg17S2V+K3Rc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f206.google.com with SMTP id 5614622812f47-4a416619e8dso1358005b6e.1
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 05:53:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786452805; x=1787057605;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=noChZkT7g51Z3CosKUKVV3G5GIKROqkR3T7nJW+r8UI=;
        b=Ai4kMCgxDK2DoAYdTXYeovNTqurgoCxKhc2smqcZrGXelug2Ktqng8vDKcqRuAJLJW
         AJapOGIVQsoU0OifHH4QK/ndJ7Pc1apDllEIjfaabjv36yiJHPuLOW6G+J5EXVgGfRwR
         NNm5PGeP747B2UhpGJmyGUPYNQkrHOAOs8pCVuB7znBhbhrWNs8TWB7Teb+5b1q+GaMy
         BCt725S+49DBwi5V8P8+aEA+Bfxp/ryQSIIjElXQHR91r4Ghfu34d7GydmdLO/sJTzE/
         RdMaVvbEnCFZ2f+SZjsDclEPm0ufnDRHpzJsAY2Luh3jbVsgM8nKUWBX3rz8a7Wa+22z
         tylA==
X-Forwarded-Encrypted: i=1; AHgh+RpBIZk0lNOYZLXVY+rWz374I0TIQo4EMh+HWhROhUFnLhRfbkPdaMYZ4xiqtOXzp/wDSq6duEXRyxuwSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyphGQAwpeYiOQwmWv65NdTi/9z9gtbKw8vjqgmppj2ts/xJYMX
	ddUQG/3ypgiwVShgES3/0BgyEHtaxN+s0ddsU6OAUjHuclGchHP0OacGzAHeY/LtJQ4QZ5LcRaV
	1bspuTuS9n6kCHc5Khl2FQ/dt020rCJhzYOVyzRoU+SepwQEWM1Vg4TYHsIM=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1314:b0:492:7abc:422e with SMTP id
 5614622812f47-4b1fe85793emr1900814b6e.13.1786452805630; Tue, 11 Aug 2026
 05:53:25 -0700 (PDT)
Date: Tue, 11 Aug 2026 05:53:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7b1b45.9c11d2ce.289b96.0106.GAE@google.com>
Subject: [syzbot] [usb?] WARNING: kobject bug in pch_udc_remove
From: syzbot <syzbot+3e2e533aa1b2a75525e7@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    d58772d8520c Merge tag 'regmap-fix-v7.2-rc7' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10996149580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=3e2e533aa1b2a75525e7
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17bc2a9e580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17293132580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-d58772d8.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/caffbd0a7ec1/vmlinux-d58772d8.xz
kernel image: https://storage.googleapis.com/syzbot-assets/686d959b6f96/bzImage-d58772d8.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3e2e533aa1b2a75525e7@syzkaller.appspotmail.com

pch_udc 0000:00:03.0: pch_udc_probe: request_irq(23) fail
------------[ cut here ]------------
kobject: '(null)' (ffff888035ce0110): is not initialized, yet kobject_put() is being called.
WARNING: lib/kobject.c:734 at kobject_put+0x252/0x640 lib/kobject.c:734, CPU#0: syz.0.17/5908
Modules linked in:
CPU: 0 UID: 0 PID: 5908 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
RIP: 0010:kobject_put+0x258/0x640 lib/kobject.c:734
Code: 59 f6 48 89 da 48 b8 00 00 00 00 00 fc ff df 48 c1 ea 03 80 3c 02 00 0f 85 5e 03 00 00 48 8d 3d de 47 83 05 48 8b 33 48 89 da <67> 48 0f b9 3a e9 0b fe ff ff e8 b9 a8 59 f6 be 03 00 00 00 4c 89
RSP: 0018:ffffc900035b7918 EFLAGS: 00010246
RAX: dffffc0000000000 RBX: ffff888035ce0110 RCX: ffffffff8bb0c8c4
RDX: ffff888035ce0110 RSI: 0000000000000000 RDI: ffffffff91341290
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff888035ce014c
R13: dffffc0000000000 R14: ffff888035ce1978 R15: ffff888035ce0608
FS:  000055558de32500(0000) GS:ffff8880d5dec000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000557c252125d8 CR3: 0000000040736000 CR4: 0000000000352ef0
Call Trace:
 <TASK>
 put_device+0x1f/0x30 drivers/base/core.c:3880
 pch_udc_remove+0x47/0x510 drivers/usb/gadget/udc/pch_udc.c:2986
 pch_udc_probe+0xcc6/0x1130 drivers/usb/gadget/udc/pch_udc.c:3109
 local_pci_probe+0xdd/0x1b0 drivers/pci/pci-driver.c:332
 pci_call_probe+0x176/0x800 drivers/pci/pci-driver.c:394
 __pci_device_probe drivers/pci/pci-driver.c:455 [inline]
 pci_device_probe+0x1cd/0x370 drivers/pci/pci-driver.c:489
 call_driver_probe drivers/base/dd.c:628 [inline]
 really_probe+0x241/0xa60 drivers/base/dd.c:706
 __driver_probe_device+0x20e/0x450 drivers/base/dd.c:868
 device_driver_attach+0xd1/0x220 drivers/base/dd.c:1203
 bind_store+0xf4/0x190 drivers/base/bus.c:267
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6ac/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x115/0x870 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f60b4b9e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffdce022f28 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f60b4e25fa0 RCX: 00007f60b4b9e0d9
RDX: 000000000000000d RSI: 0000200000000240 RDI: 0000000000000005
RBP: 00007ffdce022f90 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000001
R13: 00007f60b4e25fac R14: 00007f60b4e25fa0 R15: 00007f60b4e25fa0
 </TASK>
----------------
Code disassembly (best guess):
   0:	59                   	pop    %rcx
   1:	f6 48 89 da          	testb  $0xda,-0x77(%rax)
   5:	48 b8 00 00 00 00 00 	movabs $0xdffffc0000000000,%rax
   c:	fc ff df
   f:	48 c1 ea 03          	shr    $0x3,%rdx
  13:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
  17:	0f 85 5e 03 00 00    	jne    0x37b
  1d:	48 8d 3d de 47 83 05 	lea    0x58347de(%rip),%rdi        # 0x5834802
  24:	48 8b 33             	mov    (%rbx),%rsi
  27:	48 89 da             	mov    %rbx,%rdx
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	e9 0b fe ff ff       	jmp    0xfffffe3f
  34:	e8 b9 a8 59 f6       	call   0xf659a8f2
  39:	be 03 00 00 00       	mov    $0x3,%esi
  3e:	4c                   	rex.WR
  3f:	89                   	.byte 0x89


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
