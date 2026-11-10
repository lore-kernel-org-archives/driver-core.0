Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794277913;
	b=k6l4/w9TuvJiTT3l/ehohUdLku2Cj06dMh1LFu+oaV/5FdsunZgza7wazkKVmfw/nEQG
	 B5/Irz217jtyCnxGekGa/cMPVPKWPgr5LRNzI/Bq8XmfqJJAA9ptK2oNsAzbmchnpiIZS
	 YGW88ImgazxK4B80S7BjA/5ujksHrotsXQ4U2242jPGmSBUtlU24Hi1FvO7IvFVlOvIu7
	 lGdBmUW/PBIWbPkIt9t37luCg5wdWTjfP8u9oRD55M6sFoAHVZtMU2Gm2mN7pi9x+HJ3Z
	 DXcwrw3Jkvn9sZ7k0/WcLc+hGCbMAJZsQF7+CTe4kCa/l3FDtdWZxSPjUWFDoSX36jA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277913;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=DWBISPiP/YqrkQrFe/8Fqhl1lcVsGran7Mt4jN7DHzA=;
	b=pR5T6AD/VuoOUsxmKQFb4+I8fyhSb6CxypXNuHpJBlVqzPdb4spS5hJyu7i1i+n8VHTp
	 YRYRWfn19SEpN9jS9fXzsg835EowlQbvrEPWH8+cCDEhbWHTzuB/hfy4IobgLxl4DUYvq
	 EwkchkO3UaCnsznc/2wLi+FqpzZQOVhbqt7a5AEnfjNXlotbPFNg2ZdexYdhcG6WhtREH
	 Awoq/n/HK3MoyYUoUzp5/q/u9n9k3Gn+z+YkkLOkHXBPXzGEhHwNoJ3Ml//aUx8tx9yKf
	 QF53V9+D1zmHzqNB6YOzzcBTd8jdZHjIKDjeKwNHp2HWMjKIr0v4zKFXC0d0Ki4mCHA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.72
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com [209.85.210.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1164D606A31C
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 02:31:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1164D606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f72.google.com with SMTP id 46e09a7af769-823d73ffca1so1985432a34.2
        for <driver-core@lists.linux.dev>; Mon, 09 Nov 2026 18:31:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794277912; x=1794882712;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWBISPiP/YqrkQrFe/8Fqhl1lcVsGran7Mt4jN7DHzA=;
        b=yZEWrEoJMgVkzHieNFVrVjKq8XNKTUftqvrt4/hkQpd8G6gyvOfmQUFRDMqN5Rb+uC
         LTDtvQ+7A4WyEMLWBxemHGtajUBWO/dGNFij1AaFryvS+qkjsarhVOFR44v9Tubr6fRg
         /rfCzPD99TsyJLaeZhGk8TybGHmndANz6qRdVQ+END8VyQAV8gBBXeoiq384asVd7yBi
         KIVddv05IChWkBghnLVZ8b40mVjTNX3R72ITXsyoZW2LkFJlF3wMVOp96l/UC34FfI3x
         JYhEisCYj53Bm1cFyWOx+FDwuPAj+t0pvZUiuBu9ZoQwZPWU9bu+bo7JBdm81PqxiqCl
         qJbw==
X-Forwarded-Encrypted: i=1; AL+hErGiZ4dEM7qsb1hYcSTqV9duK4FhyfPOa9ThzIP4GfZdMzMshfwU8QlyLNlEaHXk4qVYF47F6+ivBfspMg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8qL6AiMf6SWf2YCHYS4zTP3/f+8QrhIYaaZJaLMR5Ix7/EFMIy
	B/r14AkpVG/w+j9wqpWIUtuX/uxqg95szE8YQnNyd364cYJie4WSRBeUAzB8XJI5aLUJjbRXeGb
	VjFJlijJmlECXb0gxta+VAhfWFq3kghvucnskINqfxd5DOhYd7nGLiBdEDZM=
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:11d0:b0:4b9:a8ac:47c with SMTP id
 5614622812f47-5683cc6aa75mr1098088b6e.26.1794277912004; Mon, 09 Nov 2026
 18:31:52 -0800 (PST)
Date: Mon, 09 Nov 2026 18:31:51 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af28217.44d55313.247daf.0005.GAE@google.com>
Subject: [syzbot] [driver-core?] INFO: trying to register non-static key in devres_for_each_res
From: syzbot <syzbot+b9c9ce24fd884c28ede4@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	johan@kernel.org, linux-kernel@vger.kernel.org, mcgrof@kernel.org, 
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    58c1eb84e977 arm64: sdei: Preserve the interrupted context..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10aaf8ad580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=b9c9ce24fd884c28ede4
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b1ec47537e12/disk-58c1eb84.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3bca0c2b1169/vmlinux-58c1eb84.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0a7c49594d5a/Image-58c1eb84.gz.xz

AI-generated root cause summary:
During power management hibernation preparation triggered by snapshot_open(),
fw_pm_notify() calls device_cache_fw_images(), which iterates across all
registered devices on dpm_list using dpm_for_each_dev(). For each device,
devres_for_each_res() is invoked to search for firmware cache resources,
attempting to acquire &dev->devres_lock and traverse &dev->devres_head via
list_for_each_entry_safe_reverse(). A device on dpm_list had
uninitialized/zeroed devres_lock and devres_head fields, causing lockdep to warn
on the unregistered lock key and devres_for_each_res() to read
dev->devres_head.prev as NULL. Attempting to evaluate list_prev_entry() on the
resulting NULL devres_node dereferenced offset 0x8, triggering a fatal
NULL-pointer dereference (KASAN: null-ptr-deref).

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=b9c9ce24fd884c28ede4

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b9c9ce24fd884c28ede4@syzkaller.appspotmail.com

random: crng reseeded on system resumption
INFO: trying to register non-static key.
The code is fine but needs lockdep annotation, or maybe
you didn't initialize this object before use?
turning off the locking correctness validator.
CPU: 0 UID: 0 PID: 6639 Comm: syz.7.332 Tainted: G   M                syzkaller #0 PREEMPT 
Tainted: [M]=MACHINE_CHECK
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 dump_stack+0x1c/0x28 lib/dump_stack.c:129
 assign_lock_key+0xcc/0xdc kernel/locking/lockdep.c:1028
 register_lock_class+0xf8/0x31c kernel/locking/lockdep.c:1343
 __lock_acquire+0x140/0x2b08 kernel/locking/lockdep.c:5162
 lock_acquire+0x13c/0x320 kernel/locking/lockdep.c:5942
 __raw_spin_lock_irqsave include/linux/spinlock_api_smp.h:155 [inline]
 _raw_spin_lock_irqsave+0x5c/0x7c kernel/locking/spinlock.c:181
 class_spinlock_irqsave_constructor include/linux/spinlock.h:643 [inline]
 devres_for_each_res+0x54/0x1a8 drivers/base/devres.c:223
 dev_cache_fw_image+0xe4/0x3c0 drivers/base/firmware_loader/main.c:1498
 dpm_for_each_dev+0x60/0xc0 drivers/base/power/main.c:2429
 device_cache_fw_images drivers/base/firmware_loader/main.c:1568 [inline]
 fw_pm_notify+0x208/0x2b8 drivers/base/firmware_loader/main.c:1618
 notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:86
 notifier_call_chain_robust+0x54/0xc4 kernel/notifier.c:121
 blocking_notifier_call_chain_robust+0x74/0xa8 kernel/notifier.c:398
 pm_notifier_call_chain_robust+0x34/0x60 kernel/power/main.c:172
 snapshot_open+0x11c/0x270 kernel/power/user.c:87
 misc_open+0x2dc/0x338 drivers/char/misc.c:163
 chrdev_open+0x398/0x3e8 fs/char_dev.c:413
 do_dentry_open+0x5bc/0xfb4 fs/open.c:1000
 vfs_open_consume+0x54/0x2ec fs/open.c:1131
 do_open fs/namei.c:4851 [inline]
 path_openat+0x1098/0x1910 fs/namei.c:5016
 do_file_open+0x1c8/0x2e8 fs/namei.c:5045
 do_sys_openat2+0x114/0x1ec fs/open.c:1442
 do_sys_open+0xb0/0xe0 fs/open.c:1448
 __do_sys_openat fs/open.c:1464 [inline]
 __se_sys_openat fs/open.c:1459 [inline]
 __arm64_sys_openat+0xa8/0xc4 fs/open.c:1459
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
Unable to handle kernel paging request at virtual address dfff800000000001
KASAN: null-ptr-deref in range [0x0000000000000008-0x000000000000000f]
Mem abort info:
  ESR = 0x0000000096000005
  EC = 0x25: DABT (current EL), IL = 32 bits
  SET = 0, FnV = 0
  EA = 0, S1PTW = 0
  FSC = 0x05: level 1 translation fault
Data abort info:
  ISV = 0, ISS = 0x00000005, ISS2 = 0x00000000
  CM = 0, WnR = 0, TnD = 0, TagAccess = 0
  GCS = 0, Overlay = 0, DirtyBit = 0
[dfff800000000001] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 0 UID: 0 PID: 6639 Comm: syz.7.332 Tainted: G   M                syzkaller #0 PREEMPT 
Tainted: [M]=MACHINE_CHECK
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
pstate: 034000c5 (nzcv daIF +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : devres_for_each_res+0x94/0x1a8 drivers/base/devres.c:224
lr : class_spinlock_irqsave_constructor include/linux/spinlock.h:643 [inline]
lr : devres_for_each_res+0x54/0x1a8 drivers/base/devres.c:223
sp : ffff800098c07360
x29: ffff800098c07380 x28: ffff0000c9442c60 x27: dfff800000000000
x26: ffff80008f852650 x25: ffff80008259ffd8 x24: ffff8000825d8d0c
x23: ffff8000825d9c6c x22: 0000000000000000 x21: ffff8000825d9ccc
x20: ffff0000c9442c68 x19: ffff0000c94427d8 x18: 1fffe000359cf228
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000e68 x13: 0000000000000001 x12: 0000000000000004
x11: ffff700013180e50 x10: ffff700013180e50 x9 : 3eb6a59f390f4600
x8 : 0000000000000001 x7 : 0000000000000000 x6 : ffff8000804a0a1c
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff80008047ebe8
x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 devres_for_each_res+0x94/0x1a8 drivers/base/devres.c:224 (P)
 dev_cache_fw_image+0xe4/0x3c0 drivers/base/firmware_loader/main.c:1498
 dpm_for_each_dev+0x60/0xc0 drivers/base/power/main.c:2429
 device_cache_fw_images drivers/base/firmware_loader/main.c:1568 [inline]
 fw_pm_notify+0x208/0x2b8 drivers/base/firmware_loader/main.c:1618
 notifier_call_chain+0x1a4/0x4cc kernel/notifier.c:86
 notifier_call_chain_robust+0x54/0xc4 kernel/notifier.c:121
 blocking_notifier_call_chain_robust+0x74/0xa8 kernel/notifier.c:398
 pm_notifier_call_chain_robust+0x34/0x60 kernel/power/main.c:172
 snapshot_open+0x11c/0x270 kernel/power/user.c:87
 misc_open+0x2dc/0x338 drivers/char/misc.c:163
 chrdev_open+0x398/0x3e8 fs/char_dev.c:413
 do_dentry_open+0x5bc/0xfb4 fs/open.c:1000
 vfs_open_consume+0x54/0x2ec fs/open.c:1131
 do_open fs/namei.c:4851 [inline]
 path_openat+0x1098/0x1910 fs/namei.c:5016
 do_file_open+0x1c8/0x2e8 fs/namei.c:5045
 do_sys_openat2+0x114/0x1ec fs/open.c:1442
 do_sys_open+0xb0/0xe0 fs/open.c:1448
 __do_sys_openat fs/open.c:1464 [inline]
 __se_sys_openat fs/open.c:1459 [inline]
 __arm64_sys_openat+0xa8/0xc4 fs/open.c:1459
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x60/0x1d8 arch/arm64/kernel/entry-common.c:797
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:816
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:606
Code: 90000019 913f6339 910022c8 d343fd08 (387b6908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	90000019 	adrp	x25, 0x0
   4:	913f6339 	add	x25, x25, #0xfd8
   8:	910022c8 	add	x8, x22, #0x8
   c:	d343fd08 	lsr	x8, x8, #3
* 10:	387b6908 	ldrb	w8, [x8, x27] <-- trapping instruction


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
