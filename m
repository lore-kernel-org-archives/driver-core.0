Received: from mail-oi1-f200.google.com (mail-oi1-f200.google.com [209.85.167.200])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19AF5126C02
	for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 12:35:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.200
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790426138; cv=none; b=ZglPzFt04tqDi2Cm6maEoFIooxumeHXsmEilZ8Eq02Fb+eESAytQFY0s5cU1u0lEbPvx+j6R8PqvRZNWBxKQh7T+kI86CUPjCp/n9vgiLZh1EwzDl8Ot4y52oOz77AsTgXuYv3JARAgWNO2imal1spJQBU5T5ELJJrqQDb0Qi+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790426138; c=relaxed/simple;
	bh=slBGIbI3G8ZiTKTUdMCbpKgIfQy7TPzfJ6xzJrssSAQ=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=OS/+hO/yqBDDMBTh0nvtDVCOf62fI/TXNMFTIqTlLuklwgBUkjd7XhB6mgwdGx/VS/mKt1MY1kES69C1vo7q3fh4QK0S3THKioyPMzzGx335WFrskNLG/LHVEki9EZp5p6PDO/fW1Ej6WKVxJncFtaLH0bVhyO8A94g17FvJdw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.200
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f200.google.com with SMTP id 5614622812f47-4b28dbf4197so3458566b6e.2
        for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 05:35:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790426136; x=1791030936;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aVqt2vou1NcEwe72+sENJCcdZ9urh1SIdV7Spebfc2o=;
        b=XbiH98a4A152ddOKhCfNYCGGGGAH4jXBVaMzm4n0hEg6Yw7UWF8ok5wr/HcdkpB++C
         uGhnksY7fE/Vp08TONYmf54hGAv+oK4bz7hiS7KBt5DCpKZvOpWOUj9Wrcc+a8+yPi1w
         dWAkcf83aQwoFpjaqpXH2jUYZRCTUA5mhG+hwMrLbhuJdZhd2jqqKVQZMihbyDgLIfDb
         gDG0BZmoiE7hyahB8LAQJBir12XCRdFD0r1PItKPe5POjqixYBSnJsZXKOm1Cr+rBwvx
         GwnDY0SX0w/ufkTB/adFJaa3vzNCqkQL08L3jL893v2WOI36Xnag92Sv3cyoZ2IvjRk7
         mdvw==
X-Forwarded-Encrypted: i=1; AKwUvBxu+hAXVnPVRfXuLhOxfY+YfgqtEIQIXhVqzwlCz2rcsYz5zPHV3fv5lEAy5AZz3ZyVIZd4GNjEHJg8oQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lvxOLLH4alafUtP/hWBKD+LGBVVgwGFopII9wYmKttpF1caNtg
	B+TJnCaOe+vKPFSRpcijrJgCNtSQXTKaXlW7Yuubv/JLnZllR/fSCvbDfWJ/01ZrpLWxykC+a4D
	sxfcPjR+b9CzXKZYyqOE/tinc7afpwUuP4w1VGn1rzpxirtBfmYmFawy+eyY=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:670f:b0:4d6:90d3:e18c with SMTP id
 5614622812f47-4d72ea5ea92mr9088325b6e.53.1790426136099; Sat, 26 Sep 2026
 05:35:36 -0700 (PDT)
Date: Sat, 26 Sep 2026 05:35:36 -0700
In-Reply-To: <6a85402f.ae6ddae5.3da009.0007.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ab7bc18.e548f532.1ca396.002d.GAE@google.com>
Subject: Re: [syzbot] [kernel?] WARNING in __dynamic_dev_dbg
From: syzbot <syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    e8e60d3ddd25 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=13f66a05580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=375776a45e10c065
dashboard link: https://syzkaller.appspot.com/bug?extid=6102f1c3a0ea8073fd64
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=149b92c9580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6102f1c3a0ea8073fd64@syzkaller.appspotmail.com

------------[ cut here ]------------
field width 1163001896 out of range
WARNING: lib/vsprintf.c:2654 at set_field_width lib/vsprintf.c:2654 [inline], CPU#1: syz-executor257/5017
WARNING: lib/vsprintf.c:2654 at vsnprintf+0xb9c/0xd10 lib/vsprintf.c:2918, CPU#1: syz-executor257/5017
Modules linked in:
CPU: 1 UID: 0 PID: 5017 Comm: syz-executor257 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/14/2026
pstate: 634000c5 (nZCv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : set_field_width lib/vsprintf.c:2654 [inline]
pc : vsnprintf+0xb9c/0xd10 lib/vsprintf.c:2918
lr : set_field_width lib/vsprintf.c:2654 [inline]
lr : vsnprintf+0xb9c/0xd10 lib/vsprintf.c:2918
sp : ffff8000950d6b10
x29: ffff8000950d6b60 x28: 00000000007fffff x27: ffff8000873d6422
x26: 0000000045520028 x25: ffff8000950d6bd8 x24: 0000000000000402
x23: ffff8000950d6f18 x22: ffff800087abd600 x21: ffff8000950d6bf0
x20: ffff8000950d6ecb x19: dfff800000000000 x18: 0000000000000000
x17: ffff8000839f990c x16: ffff800083a13a68 x15: 0000fffff4c1bf60
x14: 0000000000000747 x13: 0000000000000001 x12: 0000000000000003
x11: 0000000000000000 x10: 0000000000000002 x9 : a322e52aa42a7400
x8 : a322e52aa42a7400 x7 : ffff8000804823d8 x6 : 0000000000000000
x5 : 0000000000000001 x4 : 0000000000000000 x3 : ffff8000802f3e90
x2 : 0000000100000000 x1 : ffff0000d38bd880 x0 : 0000000000000000
Call trace:
 set_field_width lib/vsprintf.c:2654 [inline] (P)
 vsnprintf+0xb9c/0xd10 lib/vsprintf.c:2918 (P)
 va_format lib/vsprintf.c:1725 [inline]
 pointer+0x5e8/0x6b4 lib/vsprintf.c:2577
 vsnprintf+0x618/0xd10 lib/vsprintf.c:2953
 vprintk_store+0x344/0xb94 kernel/printk/printk.c:2307
 vprintk_emit+0x1bc/0x514 kernel/printk/printk.c:2455
 dev_vprintk_emit+0x2ec/0x3b4 drivers/base/core.c:5000
 dev_printk_emit+0xe0/0x130 drivers/base/core.c:5011
 __dynamic_dev_dbg+0x1b4/0x254 lib/dynamic_debug.c:904
 dtv_property_process_get+0x26bc/0x2838 drivers/media/dvb-core/dvb_frontend.c:1595
 dvb_get_property drivers/media/dvb-core/dvb_frontend.c:2397 [inline]
 dvb_frontend_handle_ioctl+0x1644/0x2424 drivers/media/dvb-core/dvb_frontend.c:2478
 dvb_frontend_do_ioctl+0x124/0x278 drivers/media/dvb-core/dvb_frontend.c:2101
 dvb_usercopy+0x2a4/0x4d4 drivers/media/dvb-core/dvbdev.c:996
 dvb_frontend_ioctl+0x68/0x8c drivers/media/dvb-core/dvb_frontend.c:2115
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl fs/ioctl.c:583 [inline]
 __arm64_sys_ioctl+0x154/0x1cc fs/ioctl.c:583
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:796
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:815
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
irq event stamp: 7442
hardirqs last  enabled at (7441): [<ffff80008688206c>] __raw_spin_unlock_irqrestore include/linux/spinlock_api_smp.h:210 [inline]
hardirqs last  enabled at (7441): [<ffff80008688206c>] _raw_spin_unlock_irqrestore+0x38/0x98 kernel/locking/spinlock.c:221
hardirqs last disabled at (7442): [<ffff800080485188>] vprintk_store+0x13c/0xb94 kernel/printk/printk.c:2287
softirqs last  enabled at (7400): [<ffff8000801382ec>] local_bh_enable include/linux/bottom_half.h:33 [inline]
softirqs last  enabled at (7400): [<ffff8000801382ec>] put_cpu_fpsimd_context arch/arm64/kernel/fpsimd.c:251 [inline]
softirqs last  enabled at (7400): [<ffff8000801382ec>] do_sve_acc+0x32c/0x4b8 arch/arm64/kernel/fpsimd.c:1332
softirqs last disabled at (7398): [<ffff8000801380cc>] local_bh_disable include/linux/bottom_half.h:20 [inline]
softirqs last disabled at (7398): [<ffff8000801380cc>] get_cpu_fpsimd_context arch/arm64/kernel/fpsimd.c:234 [inline]
softirqs last disabled at (7398): [<ffff8000801380cc>] do_sve_acc+0x10c/0x4b8 arch/arm64/kernel/fpsimd.c:1308
---[ end trace 0000000000000000 ]---
==================================================================
BUG: KASAN: slab-out-of-bounds in hex_st


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
