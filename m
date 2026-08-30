Received: from mail-oi1-f205.google.com (mail-oi1-f205.google.com [209.85.167.205])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6D31E1A3D
	for <driver-core@lists.linux.dev>; Sun, 30 Aug 2026 06:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.205
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788070050; cv=none; b=Iw+pirwuxxdHx340fuqB8XzbEt9DHu2eMCbPTJNWpmXu/cLxh6O35NDIfHV+ztHYv1CVqx6MgC41JrG1hNRNSWgodwg4GOsF8mKdtQBwSUql+2f8p7PI25FkJ5rRIvewTnc+NY8U3HCWkT3EVadmfyZjlFwzw8znPiffvV60hzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788070050; c=relaxed/simple;
	bh=XkPbtOqrriHPiCBNvOsmJOASC0BOzzVjchLp+H9zuRg=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=djVvg0EYkcTznep/hHNtQimPNmy10VsjVQEpiZ95HGS/b9uphwG1JbBaki+1Xlzmpo4tiwqjchoruGtL56Lo0Pph9z02dK+w6qUUbdcyAHZuB2tW6e/h1GW9n4RtIdpgN1gY0b5xpyEszwjrMmM+65+undBLWEZ1buHDJlereiA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.205
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f205.google.com with SMTP id 5614622812f47-4b3b05aa29dso2436620b6e.0
        for <driver-core@lists.linux.dev>; Sat, 29 Aug 2026 23:07:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788070047; x=1788674847;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=p5La2iTpV+quS/m9MwVA3ijcOPBPbgelWJbwzyRXVRI=;
        b=NNQNtFeUPVD7QNVeBV8zRixnqECOQ9DUu7ZrIdZi1Rdlk3molXthQ+1zdr1vUEEQoK
         KTbfMQeVPW+OHxqbnkBnKoVlc/J/QWpamW/sAUSg6SP57ErYjoQSIR2U6sJNznm17uvS
         Hklp34/35PbvPTfaHzO+O2cDQQanUYgGqF4Qyv+f7aKpLuzTuYUaIie782aygvIDwZGg
         NTk4WqPrtX9ObQ6eIrWK9pME9pgRTs8iuZ9QJvA1lY23qmD9FdXJMCunPyV4pKFd1aHJ
         uf4PSNoNbSUx/yCnIDl56TKsLDnzVdoIUHhJyV9JYG2VjM94ZoKnukZ9+GYnm79GGQep
         4dwQ==
X-Forwarded-Encrypted: i=1; AHgh+RpAYKRomvhhELnJywrxPt5J1ThwfKXOcOSlrJ/PTH4c5kxFzuO5VcCaktroUQQh+AzbDmx27RGlNmGm2A==@lists.linux.dev
X-Gm-Message-State: AFuF++nMoV0k16Q9zfVo84S5nzAjSYSnBnuVE0B+WnsMdmiKIukTlLgU
	6i8FRWRA4xBPt8SeQOLLK/WdYDrdzpEdidzxgjzUxbrAEjVYKhRvW8zW1GdMSZ6E0vJs4ZYT//T
	YkbG1QJWABPD1ZIBjNAxubZEdvHSLQDP2LuQjczE43kHSNHI9abhssdIwjd8=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:144f:b0:492:c9a4:2104 with SMTP id
 5614622812f47-4b59e8d21afmr386604b6e.10.1788070047659; Sat, 29 Aug 2026
 23:07:27 -0700 (PDT)
Date: Sat, 29 Aug 2026 23:07:27 -0700
In-Reply-To: <6a8bd82a.dbb3a75c.13dd47.0060.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a93c89f.08e933ee.dbf97.00fd.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in uevent_store
From: syzbot <syzbot+d164947c037324221043@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	jeffinphilip14@gmail.com, linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    f1b8fa82cab7 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12e82379580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
dashboard link: https://syzkaller.appspot.com/bug?extid=d164947c037324221043
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12597d79580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16e82379580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/932d85a2bda2/disk-f1b8fa82.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5b6b8fb76e8d/vmlinux-f1b8fa82.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c246b61ee396/Image-f1b8fa82.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+d164947c037324221043@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: global-out-of-bounds in kobject_action_type lib/kobject_uevent.c:86 [inline]
BUG: KASAN: global-out-of-bounds in kobject_synth_uevent+0x1e0/0x730 lib/kobject_uevent.c:200
Read of size 1 at addr ffff800087b429cb by task syz.0.17/4919

CPU: 1 UID: 0 PID: 4919 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_address_description+0xb0/0x238 mm/kasan/report.c:378
 print_report+0x68/0x84 mm/kasan/report.c:482
 kasan_report+0x8c/0xc4 mm/kasan/report.c:595
 __asan_report_load1_noabort+0x20/0x2c mm/kasan/report_generic.c:378
 kobject_action_type lib/kobject_uevent.c:86 [inline]
 kobject_synth_uevent+0x1e0/0x730 lib/kobject_uevent.c:200
 uevent_store+0x54/0x84 drivers/base/core.c:2851
 drv_attr_store+0x80/0xa4 drivers/base/bus.c:125
 sysfs_kf_write+0xe0/0x108 fs/sysfs/file.c:145
 kernfs_fop_write_iter+0x260/0x3b8 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x51c/0xa0c fs/read_write.c:687
 ksys_write+0x12c/0x228 fs/read_write.c:739
 __do_sys_write fs/read_write.c:750 [inline]
 __se_sys_write fs/read_write.c:747 [inline]
 __arm64_sys_write+0x84/0x98 fs/read_write.c:747
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590

The buggy address belongs to the variable:
 .str.34+0x6b/0x80

The buggy address belongs to a vmalloc virtual mapping
The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x21a142
flags: 0x5ffc00000002000(reserved|node=0|zone=2|lastcpupid=0x7ff)
raw: 05ffc00000002000 fffffdffc7685088 fffffdffc7685088 0000000000000000
raw: 0000000000000000 0000000000000000 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff800087b42880: 07 f9 f9 f9 05 f9 f9 f9 07 f9 f9 f9 00 f9 f9 f9
 ffff800087b42900: 05 f9 f9 f9 07 f9 f9 f9 00 02 f9 f9 00 00 00 00
>ffff800087b42980: 00 00 00 00 00 03 f9 f9 f9 f9 f9 f9 00 00 00 00
                                              ^
 ffff800087b42a00: 00 00 01 f9 f9 f9 f9 f9 00 00 00 04 f9 f9 f9 f9
 ffff800087b42a80: 00 00 02 f9 f9 f9 f9 f9 06 f9 f9 f9 00 00 00 00
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
