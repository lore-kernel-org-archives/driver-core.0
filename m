Received: from mail-ot1-f79.google.com (mail-ot1-f79.google.com [209.85.210.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A983047126A
	for <driver-core@lists.linux.dev>; Wed,  5 Aug 2026 22:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.79
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785969928; cv=none; b=rIjwZyZgiDC2uTByBIwXCY+/ZoVOH7CKbMAyHTzvlk/wiUXkBN4jOAu5rXf4nnfq2zsZuBthAoU+DxiE76jv2Ou4HXE/9deOzlgDNooXyjLN1JU8LgoKI+5CA+7j7Om2DQJ0UJgRzsof3lUKB4+frDFaz2/CmHRedwgUHGJ7GDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785969928; c=relaxed/simple;
	bh=ObrrrhVIABvmMsjgtGxn0fo10sgWBJJq1fSzxCxi5tc=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=n2ngHIe244Ze+Fspj6e6BhEsuQcE7TD6tsopg1Q+1KS8h0r6PxJ/4RxhwYeThwlPXuwU5qkV66TtK4/AhPHLMoe0lp/m1TfwDzqDpiT1cldmVxoGxZOXMycTPi1VPLUWVMwKkGMqSEIhz67W0ZhHfJE/I3OS81mmu7AJkKS5Y6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f79.google.com with SMTP id 46e09a7af769-7ec6685adabso2187410a34.0
        for <driver-core@lists.linux.dev>; Wed, 05 Aug 2026 15:45:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785969926; x=1786574726;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SREuf9Mlu8ZYiOLiOyDH/te4HL0atuAHoIKIhO5+8Ck=;
        b=mAUfCrEIM+zWXG4UYqlSBoQ0RKd/8G8AR/FWsEr/73ORAcaGC0RxhsWYwTPsfUwcFB
         ojo2KJCiNRfSE4rviGxEOVlJXjMRdCMD9SAoRE0fxtJj5GSeWiqtfMKHP88nJLjurgwn
         Z1C8LXOhP3GSRRrFX7NoVyV3FaNVXykYj5kLvf9imQ2jv56zubxiqC3KJqUrhgGGqeTY
         W4SWe75naNt2Q4JkbUcEsBYz2Ypw8CDIgEI3nhMjCFhxfwing59rlCuRiKAW0HYmx0Ly
         D9wIKHUkZKL4FKdYW8YC21DXIZbdMizQSDw5ff53xsUWMHaYQGXPg65gicxXf1b+a5DL
         hrmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrLEl7KJ9csNx5ATg92gd7T5A3qVUCXd44RFx8uQWv7Qp/GH640+mIrVGz1q7jGyBXnu6h75gjq1m4skw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz6P66GleKm/x+7MwTL+3y9VM9GaZvotl+uI2MM9y3NuCbSbvs6
	wyB7jiUY3Yo2TjatfZ78DDnKt3ldwHbVEenmOdSm34HiIkbM8csx2HT/nHzRu1JNcRcFFZ+A0An
	hjB4tVNgf+FG9hqR34kcmfKlemvrIYGUeRNZ086Awcn3rx1s10OwYkECFquQ=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1a0e:b0:6aa:da04:b583 with SMTP id
 006d021491bc7-6ae96ed3e2dmr5417575eaf.17.1785969925759; Wed, 05 Aug 2026
 15:45:25 -0700 (PDT)
Date: Wed, 05 Aug 2026 15:45:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a73bd05.5aeeccc9.207e63.0005.GAE@google.com>
Subject: [syzbot] [acpi?] general protection fault in software_node_register
From: syzbot <syzbot+665bae0a102933788e1a@syzkaller.appspotmail.com>
To: andriy.shevchenko@linux.intel.com, dakr@kernel.org, djrscally@gmail.com, 
	driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	heikki.krogerus@linux.intel.com, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, sakari.ailus@linux.intel.com, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    7235a3e71949 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=122e13b9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ccf4bea59f67007
dashboard link: https://syzkaller.appspot.com/bug?extid=665bae0a102933788e1a
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=142f9bb9580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16abbe32580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/fd45635beaae/disk-7235a3e7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/d7d2e6507223/vmlinux-7235a3e7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/b5b5d8de4cea/Image-7235a3e7.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+665bae0a102933788e1a@syzkaller.appspotmail.com

EXT4-fs (nvme0n1p2): shut down requested (2)
Aborting journal on device nvme0n1p2-8.
Unable to handle kernel paging request at virtual address dfff800000
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
CPU: 1 UID: 0 PID: 4917 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/02/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : software_node_register+0x30/0xd4 drivers/base/swnode.c:927
lr : software_node_register+0x28/0xd4 drivers/base/swnode.c:926
sp : ffff800095917500
x29: ffff800095917500 x28: 0000000000000000 x27: ffff0000c2b100d0
x26: dfff800000000000 x25: ffff700012b22eb4 x24: 0000000000001ae0
x23: 0000000000000001 x22: dfff800000000000 x21: 0000000000000008
x20: 0000000000000000 x19: 0000000000000000 x18: 00000000ffffffff
x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
x11: 0000000000000000 x10: 0000000000000003 x9 : 0000000000000000
x8 : 0000000000000000 x7 : 0000010000003fff x6 : 0000010000000000
x5 : ffff0000c6f62980 x4 : 0000000000000400 x3 : ffff8000831b8d98
x2 : 0000000000001ae0 x1 : ffff0000d09aba80 x0 : 0000000000000000
Call trace:
 software_node_register+0x30/0xd4 drivers/base/swnode.c:927 (P)
 device_add_software_node+0x16c/0x1cc drivers/base/swnode.c:1015
 dwc3_pci_quirks drivers/usb/dwc3/dwc3-pci.c:311 [inline]
 dwc3_pci_probe+0x460/0x8e4 drivers/usb/dwc3/dwc3-pci.c:375
 local_pci_probe+0xc8/0x158 drivers/pci/pci-driver.c:332
 pci_call_probe drivers/pci/pci-driver.c:394 [inline]
 __pci_device_probe drivers/pci/pci-driver.c:455 [inline]
 pci_device_probe+0x460/0x8d4 drivers/pci/pci-driver.c:489
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x29c/0x800 drivers/base/dd.c:706
 __driver_probe_device+0x1e0/0x350 drivers/base/dd.c:868
 device_driver_attach+0x58/0xac drivers/base/dd.c:1203
 bind_store+0xf4/0x14c drivers/base/bus.c:267
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
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:736
 el0t_64_sync_handler+0x48/0x148 arch/arm64/kernel/entry-common.c:755
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:594
Code: f2fbfff6 9784f9dc 91002275 d343feb7 (38766ae8) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	f2fbfff6 	movk	x22, #0xdfff, lsl #48
   4:	9784f9dc 	bl	0xfffffffffe13e774
   8:	91002275 	add	x21, x19, #0x8
   c:	d343feb7 	lsr	x23, x21, #3
* 10:	38766ae8 	ldrb	w8, [x23, x22] <-- trapping instruction


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
