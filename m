Received: from mail-oo2-f11.google.com (mail-oo2-f11.google.com [74.125.231.139])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2493147ECCF
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 16:38:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.139
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789403907; cv=none; b=YlP5ERJikURAR45hbMbAWln4Lfgadqn8R0FQoJYTv4hICGhShTH9xeMLqyyLlJvNPvnuYJyrl/FQv5DJjXYqAPTAkozPH20zDoGd/DBUxQV+41He669iDG1itjY8rGY9hbpdU6DTt0jhxtJ+j4XJBZNshowLOiPOsO6ASRAORS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789403907; c=relaxed/simple;
	bh=x6SqZ9Bnlp7yK7hFGhAkybXar8lsgtKvbSy4K/3aM7o=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=bTxPWHEcavw1fW/YOgrCLy7Ibk5INoVCV1zPYSQOMGxvpLDeB87xkdSVDDSsPE9x6Of0obMAtkUF/t0Xd92D1wfKHWKrDujFIVenIkzfFEK1RZoi1Css+l9AYDdDpDVdfr43XgEKpYVkCq0CuL0n3ZyX7Md17YngIROCluEq0uQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.139
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo2-f11.google.com with SMTP id 006d021491bc7-6aaf6076546so1896308eaf.1
        for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 09:38:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789403905; x=1790008705;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=12sDc1dvbHhFyr+KZsnVGB1XgTrOLqUuU3x0ZaD5uXk=;
        b=oH5gF7pQR3iy5wmR/yA4BZZ4b9LouDfFoVvfmIfEXY/XmRrzcZAgnyi8lvG6+hVcNl
         YmNJEuW1+F8AKUqPUpDuKMv/tphMHK88j3rEifBKWOyH58Vr9uAIsNAPmPfCO21VAEdO
         64dmIjw5BqW6PoniUs3AXypysbPhZmjvzgL+0WE1n1rrzDN8NB0ZeS2IAycdNTC/vFZ6
         p6C4xNfhBCMO+ZBrzMMhVwF9JANtLoUOuOKdwpHDDsSbo+uapO0AJTJO6gvIk6waNZXQ
         8oSc0XuKrT44Jd+q9zKF08TrjUarJ+oBJJ5FnxTUmg/K0mdOAXE7vtryiQnV9Ql2XpVT
         5rdQ==
X-Forwarded-Encrypted: i=1; AKwUvBwWeo47ek8JqGyis361lkd6Ha9cUGk9R01lqqJYnxZfSUyrDHv2DJw1Ukx1a8w+m6B0rVOvnMv3Nc5+Ig==@lists.linux.dev
X-Gm-Message-State: AFuF++lt+yYri/32bU/ez2/DABZxh61/YyAW4Nqykro2Dg4suTWrK0bT
	2N6Xsb0sgAB9OzxW7Ym9DrpE+A5Qgd2RwHV5cTlwGbYFNjyHN0vANO7peoFt4O9bDtRCe0Rrn6v
	fvrEgheLfOAkiCDhWx5m6h0HzDhkICC6z88xBXCjUt6WqJkvKt6JI8Ayuy7Y=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:f013:b0:6c1:d6a4:9268 with SMTP id
 006d021491bc7-6c54214b30cmr1842072eaf.5.1789403905073; Mon, 14 Sep 2026
 09:38:25 -0700 (PDT)
Date: Mon, 14 Sep 2026 09:38:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa82301.a211d2ce.1a5198.0296.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in bus_uevent_store
From: syzbot <syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    50d05c7c76c9 Merge tag 'landlock-7.3-rc3' of git://git.ker..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15489c8e580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=85bc5cc2fc7394d9
dashboard link: https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: i386
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17de9905580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=11f042d1580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-50d05c7c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/303a0ade8f9e/vmlinux-50d05c7c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/70b8ca71442b/bzImage-50d05c7c.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9a321aea9d851b299486@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
Read of size 1 at addr ffffffff8d72559f by task syz.0.17/5917

CPU: 2 UID: 0 PID: 5917 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x100/0x190 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x13d/0x4b0 mm/kasan/report.c:482
 kasan_report+0xdf/0x1c0 mm/kasan/report.c:595
 kobject_action_type lib/kobject_uevent.c:86 [inline]
 kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
 bus_uevent_store+0x3d/0x90 drivers/base/bus.c:917
 bus_attr_store+0x74/0xb0 drivers/base/bus.c:172
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_32_irqs_on arch/x86/entry/syscall_32.c:79 [inline]
 __do_fast_syscall_32+0x13a/0x8b0 arch/x86/entry/syscall_32.c:291
 do_fast_syscall_32+0x32/0x70 arch/x86/entry/syscall_32.c:316
 entry_SYSENTER_compat_after_hwframe+0x84/0x8e
RIP: 0023:0xf702efec
Code: Unable to access opcode bytes at 0xf702efc2.
RSP: 002b:00000000ffa3eb5c EFLAGS: 00000296 ORIG_RAX: 0000000000000004
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 0000000080000280
RDX: 000000000000ff0a RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000
 </TASK>

The buggy address belongs to the variable:
 kobject_actions+0xdff/0x4e80

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xd725
flags: 0xfff00000002000(reserved|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000002000 ffffea000035c948 ffffea000035c948 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner info is not present (never set?)

Memory state around the buggy address:
 ffffffff8d725480: f9 f9 f9 f9 00 06 f9 f9 f9 f9 f9 f9 00 06 f9 f9
 ffffffff8d725500: f9 f9 f9 f9 00 00 01 f9 f9 f9 f9 f9 00 00 02 f9
>ffffffff8d725580: f9 f9 f9 f9 00 06 f9 f9 f9 f9 f9 f9 00 07 f9 f9
                            ^
 ffffffff8d725600: f9 f9 f9 f9 00 00 06 f9 f9 f9 f9 f9 00 04 f9 f9
 ffffffff8d725680: f9 f9 f9 f9 00 06 f9 f9 f9 f9 f9 f9 00 05 f9 f9
==================================================================


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
