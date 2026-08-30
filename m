Received: from mail-oa2-f1.google.com (mail-oa2-f1.google.com [74.125.231.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC28385D7F
	for <driver-core@lists.linux.dev>; Sun, 30 Aug 2026 15:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788102212; cv=none; b=Ign4ariGlL1iXn9sWzK5n1gb5/GhIvYrMjFir3S+L/Ey4yOFikjbpNkp33Xc78oH+NjXIoYVWXSpSNTeoF6obq0gDDXJxpl9PJJNZzlqY77pFjbkV7Qct8LU4CSkz02LpTJ7ZndFa3kmnDbbHoboTQpDxbF2N0ac6qZVO8A7mYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788102212; c=relaxed/simple;
	bh=U4H9BqySYPL0L7p7XIhAHlXpgN2X7ZypyBq+Buw8xwc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=Ee1GaPu07mf3XHP/I2vPlTHc6QTtMixtnsyBIFdP9HXeO/7NIIF90F4CNlts0fZrUiNb/ovkKvz4TCPx9KKi0/PRT/TPGnzBRvDEKF3dy/m1YC3Zd2KYxxP54B6fVUmjmmnTS544fd5eEoHU6AetM1P2zvKw++JKHwriqpCpgaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa2-f1.google.com with SMTP id 586e51a60fabf-4489b7aa0e7so721157fac.1
        for <driver-core@lists.linux.dev>; Sun, 30 Aug 2026 08:03:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788102209; x=1788707009;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6wtiGisHmTSw2KWwt9Wk+GviNuqppzh3TCDJTsgBRGo=;
        b=p+L0wllTaxnvE0GFQc9UUF8vW7cXoOS3Pr6pzqpEkHB+vvN5feCZu72xEJPEFmXsK3
         dwq9GVfyKLBfQOMMfXF040IGFZq7GK8WMFSWScRJn1KqxXu6mWlrR6AQn5CAIe2lttMW
         McYTZYShduACw+5I614YSSv4XO4E4w6tkRlgMD79QbPMQ8NuOOW5icpM4pNaUIteBw8N
         WRw+G6unlQCkt7Zxm/SGwTSWTCvwSllblk8TYJqaX58Mj9yeDxbFE1eAzVPABl0kdfhO
         1Z9dDSwScqzmsDQ6peNsH7+5Y14+ubROF5r1HSLhKNrKb/dq3cSLRokmxv2rx4nM5v83
         NU6g==
X-Gm-Message-State: AFuF++lgeFMW2uef6vgER+vy8JTPZbs91CAzIp1EHQLAtX241spR1Af7
	k96Mlo2dqIXOti0KUf4tp27jKTCL7uJE9+LGVSdlNUoteNfJEkxVnt6cGBb28UuZobqJfiAy6yz
	W+zsNXymCqvXxYIDBYwnyr1Dvk/9qjEDWgHFzXdjJrw/naLrrw5ngDHCTgSAGWQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c197:b0:4b3:89ae:df60 with SMTP id
 5614622812f47-4b398342e94mr21728714b6e.16.1788102209400; Sun, 30 Aug 2026
 08:03:29 -0700 (PDT)
Date: Sun, 30 Aug 2026 08:03:29 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a944641.4d659fcc.734b4.003b.GAE@google.com>
Subject: [syzbot] [kernfs?] WARNING in generic_access_phys
From: syzbot <syzbot+fafc2cbca26ad7368aae@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    45c13f3f9e3b Merge tag 'hwlock-v7.3' of git://git.kernel.o..
git tree:       https://kernel.googlesource.com/pub/scm/linux/kernel/git/torvalds/linux master
console output: https://syzkaller.appspot.com/x/log.txt?x=173c5d79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d6a4e008e57a0e64
dashboard link: https://syzkaller.appspot.com/bug?extid=fafc2cbca26ad7368aae
compiler:       aarch64-linux-gnu-gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
userspace arch: arm
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=11d7ac15580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17320349580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/fa3fbcfdac58/non_bootable_disk-45c13f3f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f88d9fecef79/vmlinux-45c13f3f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/87ae79a5d86d/zImage-45c13f3f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fafc2cbca26ad7368aae@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: ./arch/arm64/include/asm/io.h:283 at rcu_read_unlock include/linux/rcupdate.h:878 [inline], CPU#0: syz.2.18/3678
WARNING: ./arch/arm64/include/asm/io.h:283 at pte_unmap include/linux/pgtable.h:117 [inline], CPU#0: syz.2.18/3678
WARNING: ./arch/arm64/include/asm/io.h:283 at follow_pfnmap_end mm/memory.c:7077 [inline], CPU#0: syz.2.18/3678
WARNING: ./arch/arm64/include/asm/io.h:283 at generic_access_phys+0x26c/0x344 mm/memory.c:7126, CPU#0: syz.2.18/3678
Modules linked in:
CPU: 0 UID: 0 PID: 3678 Comm: syz.2.18 Tainted: G        W           syzkaller #0 PREEMPT 
Tainted: [W]=WARN
Hardware name: linux,dummy-virt (DT)
pstate: 20000005 (nzCv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : ioremap_prot arch/arm64/include/asm/io.h:283 [inline]
pc : generic_access_phys+0x26c/0x344 mm/memory.c:7116
lr : rcu_read_unlock include/linux/rcupdate.h:882 [inline]
lr : pte_unmap include/linux/pgtable.h:117 [inline]
lr : follow_pfnmap_end mm/memory.c:7077 [inline]
lr : generic_access_phys+0xcc/0x344 mm/memory.c:7111
sp : ffff8000a1d37830
x29: ffff8000a1d378f0 x28: ffff8000a1d37870 x27: 0000000000000000
x26: 0000000000000001 x25: ffff700010ef8fd0 x24: 0000000000001000
x23: ffff8000877c7e80 x22: 0000000000000000 x21: 0160000000000f92
x20: ffff000017a38a00 x19: 0000000010042000 x18: 0000000000000000
x17: ffff800080c267fc x16: ffff800080e49be0 x15: ffff800080e496d8
x14: ffff800080a8ead0 x13: ffff800089e66530 x12: ffff600003cfbfbd
x11: 1fffe00003cfbfbc x10: ffff600003cfbfbc x9 : dfff800000000000
x8 : ffff00001e7dfde0 x7 : 0000000000000001 x6 : ffff600003cfbfbc
x5 : ffff00001e7dfde0 x4 : 0000000000000000 x3 : 1fffe000025ac430
x2 : 0000000000000000 x1 : 0000000000001000 x0 : 000000003fffffff
Call trace:
 rcu_read_unlock include/linux/rcupdate.h:878 [inline] (P)
 pte_unmap include/linux/pgtable.h:117 [inline] (P)
 follow_pfnmap_end mm/memory.c:7077 [inline] (P)
 generic_access_phys+0x26c/0x344 mm/memory.c:7126 (P)
 kernfs_vma_access+0x14c/0x1f0 fs/kernfs/file.c:437
 __access_remote_vm+0x3dc/0x600 mm/memory.c:7194
 access_remote_vm+0x10/0x20 mm/memory.c:7241
 mem_rw+0x16c/0x580 fs/proc/base.c:912
 mem_read+0x14/0x20 fs/proc/base.c:940
 vfs_read+0x190/0xa18 fs/read_write.c:572
 ksys_read+0xf0/0x1e0 fs/read_write.c:716
 __do_sys_read fs/read_write.c:725 [inline]
 __se_sys_read fs/read_write.c:723 [inline]
 __arm64_sys_read+0x70/0xa0 fs/read_write.c:723
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x74/0x240 arch/arm64/kernel/syscall.c:49
 el0_svc_common.constprop.0+0xac/0x230 arch/arm64/kernel/syscall.c:121
 do_el0_svc_compat+0x40/0x58 arch/arm64/kernel/syscall.c:146
 el0_svc_compat+0x54/0x264 arch/arm64/kernel/entry-common.c:909
 el0t_32_sync_handler+0x88/0xac arch/arm64/kernel/entry-common.c:927
 el0t_32_sync+0x19c/0x1a0 arch/arm64/kernel/entry.S:595
irq event stamp: 2118
hardirqs last  enabled at (2117): [<ffff8000859a8084>] irqentry_exit_to_kernel_mode_after_preempt include/linux/irq-entry-common.h:507 [inline]
hardirqs last  enabled at (2117): [<ffff8000859a8084>] __arm64_exit_to_kernel_mode+0x38/0x98 arch/arm64/kernel/entry-common.c:60
hardirqs last disabled at (2118): [<ffff8000859a81d0>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:445
softirqs last  enabled at (2112): [<ffff80008023b5b8>] softirq_handle_end kernel/softirq.c:491 [inline]
softirqs last  enabled at (2112): [<ffff80008023b5b8>] handle_softirqs+0xa98/0x1048 kernel/softirq.c:673
softirqs last disabled at (2101): [<ffff8000800103d4>] __do_softirq+0x14/0x20 kernel/softirq.c:679
---[ end trace 0000000000000000 ]---


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
