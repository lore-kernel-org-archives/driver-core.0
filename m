Received: from mail-oi1-f207.google.com (mail-oi1-f207.google.com [209.85.167.207])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC36237CD59
	for <driver-core@lists.linux.dev>; Wed, 19 Aug 2026 05:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.207
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787117618; cv=none; b=SbrxZ8U1+HAeyMuwSDdQDbvtldwUaFA7bqMvf42TASSCYf3fFOnUl1cWt5eQ3SoOt3dPyllr06dcfEwsEOKQN+QXtI+IsgAdtjIqw01Vx10fnZkwuJG/sy3d3cuMoPY6g75y4FUqrUhx3x6pOTqoOklJSbaujeB0bREmPd/CcN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787117618; c=relaxed/simple;
	bh=nGqXBd1ywz5ZLyuuV9/4d1dqIgNBrOa+76aUutPPE+w=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=DZ12ZH8iztwVEjLrgBJxQoYqjjKhUz7EbLhO1AO9gba+1E32w+sVCtrPGwe7wa04GJCQ+nv7+1Inj4TLtpfwvpgqtYALyRzbJ1gH1MC1algpGzKUX40MCIoNj24PvImqzWZHpTUjQ/qa8sHdNGgqc/KtPDyAA1lmb7i12pagw1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.207
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f207.google.com with SMTP id 5614622812f47-4b28db6c77aso845569b6e.3
        for <driver-core@lists.linux.dev>; Tue, 18 Aug 2026 22:33:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787117616; x=1787722416;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1HCqqJw9VawZ7gbI3jsAGuJwceVNHIhpFH05MwRM+4U=;
        b=McX0OmW7xX/NQmJW73YybJUZ8kAxRkKW5z8sm4psQi6h3hrimN23VMYMC7Wyw33KRH
         gjvrepTi2uqd8dyFDRsHYJJpjguoGdCaUIqVkNS9NuxoI1WAcUM7GQkK7pRZZEUw+MxO
         MrwolH6haU8aIc9bKKftDUfIZ5pr0LNSqrmAHgG4d+bZ8/7Vba5usvcLoEqjRM0dw44l
         VOiTVZ7TdoWXL7LHFKd20kpwWRSlUMpk+Bpz3VVDBU3INb0hXIVmhW/RMbTooZtASDc2
         +LNJxLR+ghLv7r2/e9xI9AXvEppzOy21g57orxWr1NgVAoBKOeA8/8qw/R5jFBypiEOM
         LW7w==
X-Forwarded-Encrypted: i=1; AHgh+Rozq8SPlI9HQ/Pq3xBjOkR+5PjFtGgx9MI+GiRLzFQxjW5aNPEXuHBexCgqgnw0Vlt+7HZ1CNMnrXb6rQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBlO5j2YbBQ30Tc7okvaf+DG2PglzOKD8HpBq1+XhRINl4PW4z
	XRZPaoYzcfEdLNc3q+ymVn2OiPZNBxFAjhhJFsIcrMEPRufMAU3CA+x8Q3t7PqaT/sGMIso1Zrq
	Z3ftuL0aH/Y5PnFkKBvvXkY5xb3uA/CK+XcE4SBXMxY2tyuNarnrFq9aK4SI=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:178b:b0:4a4:ba4a:9ac4 with SMTP id
 5614622812f47-4b2bcabf503mr1698588b6e.13.1787117615788; Tue, 18 Aug 2026
 22:33:35 -0700 (PDT)
Date: Tue, 18 Aug 2026 22:33:35 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a85402f.ae6ddae5.3da009.0007.GAE@google.com>
Subject: [syzbot] [kernel?] WARNING in __dynamic_dev_dbg
From: syzbot <syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    21d6ac051080 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=1022e279580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
dashboard link: https://syzkaller.appspot.com/bug?extid=6102f1c3a0ea8073fd64
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/88380e2ddcb9/disk-21d6ac05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5dba5c2896b7/vmlinux-21d6ac05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/52ac739e37e0/Image-21d6ac05.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com

------------[ cut here ]------------
field width 67108864 out of range
WARNING: lib/vsprintf.c:2650 at set_field_width lib/vsprintf.c:2650 [inline], CPU#0: syz.6.1148/9267
WARNING: lib/vsprintf.c:2650 at vsnprintf+0xb9c/0xd10 lib/vsprintf.c:2914, CPU#0: syz.6.1148/9267
Modules linked in:
CPU: 0 UID: 0 PID: 9267 Comm: syz.6.1148 Tainted: G             L      syzkaller #0 PREEMPT 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
pstate: 634000c5 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : set_field_width lib/vsprintf.c:2650 [inline]
pc : vsnprintf+0xb9c/0xd10 lib/vsprintf.c:2914
lr : set_field_width lib/vsprintf.c:2650 [inline]
lr : vsnprintf+0xb9c/0xd10 lib/vsprintf.c:2914
sp : ffff8000946e6b10
x29: ffff8000946e6b60 x28: 00000000007fffff x27: ffff800087471e82
x26: 0000000004000000 x25: ffff8000946e6bd8 x24: 0000000000000402
x23: ffff8000946e6f18 x22: ffff800087b3ed00 x21: ffff8000946e6bf0
x20: ffff8000946e6ecb x19: dfff800000000000 x18: 0000000000000000
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000020000040
x14: 0000000000000000 x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000080000 x9 : d2e0bfbdf6510800
x8 : d2e0bfbdf6510800 x7 : ffff80008048c5b8 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000000 x3 : ffff8000802f6830
x2 : 0000000100000000 x1 : ffff0000f664d7c0 x0 : 0000000000000001
Call trace:
 set_field_width lib/vsprintf.c:2650 [inline] (P)
 vsnprintf+0xb9c/0xd10 lib/vsprintf.c:2914 (P)
 va_format lib/vsprintf.c:1725 [inline]
 pointer+0x5e8/0x6b4 lib/vsprintf.c:2573
 vsnprintf+0x618/0xd10 lib/vsprintf.c:2949
 vprintk_store+0x344/0xb94 kernel/printk/printk.c:2307
 vprintk_emit+0x1bc/0x514 kernel/printk/printk.c:2455
 dev_vprintk_emit+0x2ec/0x3b4 drivers/base/core.c:4996
 dev_printk_emit+0xe0/0x130 drivers/base/core.c:5007
 __dynamic_dev_dbg+0x1b4/0x254 lib/dynamic_debug.c:904
 dtv_property_process_get+0x26bc/0x2838 drivers/media/dvb-core/dvb_frontend.c:1594
 dvb_get_property drivers/media/dvb-core/dvb_frontend.c:2396 [inline]
 dvb_frontend_handle_ioctl+0x1644/0x2424 drivers/media/dvb-core/dvb_frontend.c:2477
 dvb_frontend_do_ioctl+0x124/0x278 drivers/media/dvb-core/dvb_frontend.c:2100
 dvb_usercopy+0x2a4/0x4d4 drivers/media/dvb-core/dvbdev.c:996
 dvb_frontend_ioctl+0x68/0x8c drivers/media/dvb-core/dvb_frontend.c:2114
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __arm64_sys_ioctl+0x154/0x1cc fs/ioctl.c:583
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590
irq event stamp: 150
hardirqs last  enabled at (149): [<ffff80008690f4e0>] irqentry_exit_to_kernel_mode_after_preempt include/linux/irq-entry-common.h:507 [inline]
hardirqs last  enabled at (149): [<ffff80008690f4e0>] __arm64_exit_to_kernel_mode+0x64/0x78 arch/arm64/kernel/entry-common.c:60
hardirqs last disabled at (150): [<ffff80008048f368>] vprintk_store+0x13c/0xb94 kernel/printk/printk.c:2287
softirqs last  enabled at (114): [<ffff80008013b050>] local_bh_enable include/linux/bottom_half.h:33 [inline]
softirqs last  enabled at (114): [<ffff80008013b050>] put_cpu_fpsimd_context arch/arm64/kernel/fpsimd.c:251 [inline]
softirqs last  enabled at (114): [<ffff80008013b050>] fpsimd_restore_current_state+0x39c/0x9c8 arch/arm64/kernel/fpsimd.c:1797
softirqs last disabled at (112): [<ffff80008013acf8>] local_bh_disable include/linux/bottom_half.h:20 [inline]
softirqs last disabled at (112): [<ffff80008013acf8>] get_cpu_fpsimd_context arch/arm64/kernel/fpsimd.c:234 [inline]
softirqs last disabled at (112): [<ffff80008013acf8>] fpsimd_restore_current_state+0x44/0x9c8 arch/arm64/kernel/fpsimd.c:1790
---[ end trace 0000000000000000 ]---


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
