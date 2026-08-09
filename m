Received: from mail-ot1-f77.google.com (mail-ot1-f77.google.com [209.85.210.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38E7339A4B3
	for <driver-core@lists.linux.dev>; Sun,  9 Aug 2026 19:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786302770; cv=none; b=VAMyWw2pGmTi3Jm/w8Aqe7vFYlWfbNSzhtQzldkFVXwT4TROgERtSy/1V5RipAu6XA3glC5mVxFOxCggWhZdZknoFhqRcFcatn4dPmhhMRQ+n+cZuX6h/uJ/FYV9i9X85pY/dbETzaW8+vbelZeE6kmD9JpdTvFskQTmI/DzXUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786302770; c=relaxed/simple;
	bh=QZ+LDMAmLF3k2EVZBQ9Ma+ncAVqVRIhd5TQucPrCMxE=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=qDEYXlCD20BA2Z9VFVZECYasd9F01xLAVjQaUChw5h5SS4OGoo+mM96xW5I62+SxGt63l4acrMFaIQmsUYQ+/7SRx4mwNyXCT7x7BiJinlyt3uyrGA1jmCafL7JfpeWGLdLaTRgTAiYo3ny8cZ83xB1SGU8S5DUEAMVKB/yYGoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f77.google.com with SMTP id 46e09a7af769-7f36427abfdso2071584a34.3
        for <driver-core@lists.linux.dev>; Sun, 09 Aug 2026 12:12:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786302764; x=1786907564;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PbOwH8zfT+TouAG4yn0mvVVB7CIzeZLDErpOsblOR/s=;
        b=dqnwQATle5v989kq4LOPDl6ApHxrQgmQQ/naFNl5yrn+vg1agLqr/Qo66V9k7Qo6I3
         uxTr/a3/eZ4E4vykgas90ohjYlj2EiuEPcBfs3KV4G3M7rndOdYBUzX37jVYXWfTszhh
         j793kNy8AFhMoQO0A6DCs5CunAyB5Gd9UKLlQvazKoIsZrjk5M/Xs0kRG5ODq6TqVnIn
         WSjw6UyNsEDpdl16BoDEMNpJGBp5lfiUfT8QAJqnZmMFKmyxuqJOD3+IOMKgg6P1Wjcb
         zsG6gS3Yz0JEQjRizQCTrzTm/TM1Xbz0nBP4h6rKB8F+laWF4tF0CeCA2oG+fX7V5wLJ
         q8xA==
X-Forwarded-Encrypted: i=1; AHgh+Rq3iCimxVh0f5ZYoLWlqyQBjn4L5kJmM3A4CWzq9GSGZLMAj+CEamuaRbaeqjSQbp3FHAmKDxnKQY6G4w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yztqq26OJOrIut1qKPpb3lVg9cop0OTLGSW7RpJsjoHLV8g8IQu
	/+dUyEHK+vQfYu2+FL+bPm+kngxH/hYgLRTDhoR6YNFZ8FvmtASfXbWSlgvaYYBYnfNhblDZIs/
	F/uaJ88f8qpb6rk4/cA3LI00Z2LUfZdwq2PczONbKdsdw14vGzB9zrsw+9FQ=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c88:b0:6ac:a8ef:9a86 with SMTP id
 006d021491bc7-6ae96cf7403mr20299995eaf.15.1786302763971; Sun, 09 Aug 2026
 12:12:43 -0700 (PDT)
Date: Sun, 09 Aug 2026 12:12:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a78d12b.01d0871a.3a0d52.008e.GAE@google.com>
Subject: [syzbot] [usb?] WARNING in i2c_unregister_device
From: syzbot <syzbot+3fb7629cfd12d04beeab@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    a59f57e2aa12 Merge tag 'watchdog-for-v7.2-rc7' of git://gi..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=14e28079580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c44651ea7dd2f307
dashboard link: https://syzkaller.appspot.com/bug?extid=3fb7629cfd12d04beeab
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12349fb9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1793bfb9580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6e78675a9575/disk-a59f57e2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8214e30981cd/vmlinux-a59f57e2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/44559008ddee/bzImage-a59f57e2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3fb7629cfd12d04beeab@syzkaller.appspotmail.com

------------[ cut here ]------------
Device '2-002c' does not have a release() function, it is broken and must be fixed. See Documentation/core-api/kobject.rst.
WARNING: drivers/base/core.c:2638 at device_release+0x1da/0x270 drivers/base/core.c:2638, CPU#1: kworker/1:3/4450
Modules linked in:
CPU: 1 UID: 0 PID: 4450 Comm: kworker/1:3 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Workqueue: usb_hub_wq hub_event
RIP: 0010:device_release+0x1dd/0x270 drivers/base/core.c:2638
Code: df 48 89 fa 48 c1 ea 03 80 3c 02 00 0f 85 93 00 00 00 48 8b 6b 50 48 85 ed 74 19 e8 6d 94 af fb 48 8d 3d d6 1a d3 0a 48 89 ee <67> 48 0f b9 3a e9 eb fe ff ff e8 54 94 af fb 48 89 da 48 b8 00 00
RSP: 0018:ffffc90010427548 EFLAGS: 00010293
RAX: 0000000000000000 RBX: ffff88807d9c3020 RCX: ffffffff8bb0ba12
RDX: ffff888036a3ca80 RSI: ffff888022a8dc00 RDI: ffffffff912deb50
RBP: ffff888022a8dc00 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: ffff888038298400
R13: dffffc0000000000 R14: ffff888022a8dc00 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888123eec000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000200000000000 CR3: 000000002aaa6000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 kobject_cleanup lib/kobject.c:689 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x1f7/0x640 lib/kobject.c:737
 put_device drivers/base/core.c:3880 [inline]
 device_unregister+0x2f/0xe0 drivers/base/core.c:4003
 i2c_unregister_device+0xf5/0x270 drivers/i2c/i2c-core-base.c:1075
 i2c_deregister_clients+0x255/0x460 drivers/i2c/i2c-core-base.c:1782
 i2c_del_adapter+0x124/0x2d0 drivers/i2c/i2c-core-base.c:1820
 i2c_tiny_usb_disconnect+0x43/0xe0 drivers/i2c/busses/i2c-tiny-usb.c:282
 usb_unbind_interface+0x1dd/0x9e0 drivers/usb/core/driver.c:458
 device_remove drivers/base/dd.c:618 [inline]
 device_remove+0x12a/0x180 drivers/base/dd.c:610
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x44e/0x620 drivers/base/dd.c:1372
 bus_remove_device+0x2bc/0x560 drivers/base/bus.c:664
 device_del+0x376/0x9b0 drivers/base/core.c:3961
 usb_disable_device+0x367/0x810 drivers/usb/core/message.c:1478
 usb_disconnect+0x2e2/0x9a0 drivers/usb/core/hub.c:2345
 hub_port_connect drivers/usb/core/hub.c:5407 [inline]
 hub_port_connect_change drivers/usb/core/hub.c:5707 [inline]
 port_event drivers/usb/core/hub.c:5871 [inline]
 hub_event+0x1c4f/0x4a60 drivers/usb/core/hub.c:5953
 process_one_work+0xa23/0x1940 kernel/workqueue.c:3322
 process_scheduled_works kernel/workqueue.c:3405 [inline]
 worker_thread+0x5ef/0xe50 kernel/workqueue.c:3486
 kthread+0x370/0x450 kernel/kthread.c:436
 ret_from_fork+0x72b/0xd50 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
----------------
Code disassembly (best guess):
   0:	df 48 89             	fisttps -0x77(%rax)
   3:	fa                   	cli
   4:	48 c1 ea 03          	shr    $0x3,%rdx
   8:	80 3c 02 00          	cmpb   $0x0,(%rdx,%rax,1)
   c:	0f 85 93 00 00 00    	jne    0xa5
  12:	48 8b 6b 50          	mov    0x50(%rbx),%rbp
  16:	48 85 ed             	test   %rbp,%rbp
  19:	74 19                	je     0x34
  1b:	e8 6d 94 af fb       	call   0xfbaf948d
  20:	48 8d 3d d6 1a d3 0a 	lea    0xad31ad6(%rip),%rdi        # 0xad31afd
  27:	48 89 ee             	mov    %rbp,%rsi
* 2a:	67 48 0f b9 3a       	ud1    (%edx),%rdi <-- trapping instruction
  2f:	e9 eb fe ff ff       	jmp    0xffffff1f
  34:	e8 54 94 af fb       	call   0xfbaf948d
  39:	48 89 da             	mov    %rbx,%rdx
  3c:	48                   	rex.W
  3d:	b8                   	.byte 0xb8


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
