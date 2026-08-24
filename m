Received: from mail-oi2-f1.google.com (mail-oi2-f1.google.com [74.125.231.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9143B2FCA
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 05:35:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787549745; cv=none; b=jAJNSQgJQHv+IYbsFW9bdVDEco3RLATDdZU+XsWzbhrfdnk35KZxAROmz5hB+8Z85ztvIKsNoSggELRjXtiXN4Bbw3Lq/mNce0pJoJDKdz7+pgkD0hZzOWnnU+0ROKXOpOgSyBifWGVtFW18o6a/cuVL0VtV8Xgl0K6g/ITkoo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787549745; c=relaxed/simple;
	bh=s4oUxf8/FRqeUM+IRLPakcNVt7OpZ+1vYtTuFmTiKfA=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=iX//ut8L+rW65Y6bHp5UniRgva0WMsbb9gcOmEtccZlRJ/wjNY7s+sU4xqbIeigA/EpNGQm3Eb2Xi10GjBfgRogpSOzJuOYOaylSIo7HLqUYkHkcamdrNu41WRgZG+4IImztuL4IeEPgfwJck4N8e5MMDW/r2NS2VhuRvzXlN48=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f1.google.com with SMTP id 5614622812f47-4960a23d5e1so1254236b6e.1
        for <driver-core@lists.linux.dev>; Sun, 23 Aug 2026 22:35:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787549738; x=1788154538;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Ol+scttPLAcMFqi9Qiu+WrimNSjWE4h3DL3/P0JDfU=;
        b=CABbkmmSBG/xf8x1seLbeDIiqOkcZmej1NBS94IX+UWj8q5wZ0HHDFn4SXWz0VTvJN
         upxgr760l04/vAyEFlUScwwlu9449/xZ/1h8UQCwM8Uiv5vsmioQ3OXQAIdHYpTHexHs
         OT+i0DCRrC06MSejN3X31aMnnfiLz64msqdk73YA/4/8m9oisgPh7cz2fU2Se6h7XvS6
         sshyXZqjLyBlpo+1mQQ/CVBfQY84Ugh84sOJBO5AQHbDbhkCYf43UzwzOR9ZjFfscckk
         MaQCZ1pNRmi9L6rE3lYYT2JYg2ZRY5BRqY3WdAzhwSRw9b928kz/puZJBZ9/jGg+f5Jb
         IT7g==
X-Forwarded-Encrypted: i=1; AHgh+Rpp+nPknIr08H+EPThOTd7VY/1rv5ua/4F89JLiGjOOn7yWQ+j8C+sENSfWSla78xoU+z2wjEjJiNd3Lw==@lists.linux.dev
X-Gm-Message-State: AFuF++m8XOE9cFegrQjP0+7nsO3iMBuTb+mJdeTydSfvlgb0cClLl4OE
	3cx87K4mjQf34ZylxSkudhCK+yRjVETPxq66P7QNp5vfrLA9whuY5HsCQOjVedn6Vk6vu0PVpkj
	62PyRxJkBVw47gsmzgmYMbTKUO7QyZ+T2PF2kNa/PJPV8TH43SyNSCVIMMjc=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:1029:b0:4b3:1a95:4160 with SMTP id
 5614622812f47-4b31a954e94mr8806975b6e.18.1787549738177; Sun, 23 Aug 2026
 22:35:38 -0700 (PDT)
Date: Sun, 23 Aug 2026 22:35:38 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8bd82a.dbb3a75c.13dd47.0060.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in uevent_store
From: syzbot <syzbot+d164947c037324221043@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    9d2ed026f031 Merge tag 'sysctl-7.03-rc1' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13921e79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=996f19b48f3c7123
dashboard link: https://syzkaller.appspot.com/bug?extid=d164947c037324221043
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=164f5e79580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-9d2ed026.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/dbab070bbde5/vmlinux-9d2ed026.xz
kernel image: https://storage.googleapis.com/syzbot-assets/857014a70033/bzImage-9d2ed026.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d164947c037324221043@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x79d/0x7d0 lib/kobject_uevent.c:200
Read of size 1 at addr ffffffff8d7101be by task syz.0.17/5909

CPU: 3 UID: 0 PID: 5909 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT(full) 
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
 uevent_store+0x46/0x90 drivers/base/bus.c:723
 drv_attr_store+0x74/0xb0 drivers/base/bus.c:125
 sysfs_kf_write+0xf2/0x150 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x3e0/0x5f0 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x6af/0x1050 fs/read_write.c:687
 ksys_write+0x12a/0x250 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x123/0x790 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f044c59e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd04c3e3e8 EFLAGS: 00000246 ORIG_RAX: 0000000000000001
RAX: ffffffffffffffda RBX: 00007f044c825fa0 RCX: 00007f044c59e0d9
RDX: 000000000000003f RSI: 0000200000000300 RDI: 0000000000000003
RBP: 00007f044c635024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f044c825fac R14: 00007f044c825fa0 R15: 00007f044c825fa0
 </TASK>

The buggy address belongs to the variable:
 uevent_helper_sysctl_table+0xde/0x2a0

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xd710
flags: 0xfff00000002000(reserved|node=0|zone=1|lastcpupid=0x7ff)
raw: 00fff00000002000 ffffea000035c408 ffffea000035c408 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner info is not present (never set?)

Memory state around the buggy address:
 ffffffff8d710080: f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9 00 00 00 00
 ffffffff8d710100: 00 00 00 f9 f9 f9 f9 f9 00 07 f9 f9 f9 f9 f9 f9
>ffffffff8d710180: 04 f9 f9 f9 f9 f9 f9 f9 07 f9 f9 f9 f9 f9 f9 f9
                                        ^
 ffffffff8d710200: 07 f9 f9 f9 f9 f9 f9 f9 05 f9 f9 f9 f9 f9 f9 f9
 ffffffff8d710280: 07 f9 f9 f9 f9 f9 f9 f9 00 f9 f9 f9 f9 f9 f9 f9
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
