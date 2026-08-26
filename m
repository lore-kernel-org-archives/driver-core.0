Received: from mail-oi2-f4.google.com (mail-oi2-f4.google.com [74.125.231.196])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9E1B3793BD
	for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 17:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.196
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787764009; cv=none; b=drn8UnxLpUU7FnbzG0mudyXGtV2zGeeBuUz0wG4xSOtEkdy0Zi4QvaqaHPrAG+BcOZncNbI+d4mBFcxliC4vxSZI1fzxSIVFpiw7EYYa/EkqvZc/OFAqt5OWGP5gycSrOQA2HyBExjnHNgzbSxkSaTRCuhEAk89K2rhJ48Cl9Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787764009; c=relaxed/simple;
	bh=tNadVRUx9xM98oZHnsM8E6u7/CLdwJRBVqwBq5PX/JU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=gx7yjZmfCj69J5R+I2+8fdaxgblYmleJZ9ZLeN9zlBnZvK45UQxzITyiVrw8HkiBjevaAGUt0wNfuNnT8fL4tVRb8jtNLrz5VPQti1IcKX+lVA5QzW6ik+6w5M2eESDue2jhgp9uBii56kN1cj4GY/UYiI+jHA7359U2YLJWEi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=74.125.231.196
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi2-f4.google.com with SMTP id 5614622812f47-4ab2d8e7e4cso384630b6e.1
        for <driver-core@lists.linux.dev>; Wed, 26 Aug 2026 10:06:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787763996; x=1788368796;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wfuXQyF+Q4dAMrgB0Y4AFqDXZjpxQb3j3oEIdtkZmzQ=;
        b=B7ApUmjBH9m+4dfdZ3Etq/eHbqyjk3AXhha4Os4xB49AbRIbiLA/tRXSdSmWIHpfHm
         tfMCTMp8CjuA3S7uI+wikUDkgcJNSwp8I11HiqpE4BBFDpTPppoiM23dR2+PdeStj3X0
         cFylraLkahTumzUneksISmoWSZc6eXfi2IM7uDgTY6RBAzPMSWl05l5vJXAJ4sZ1x8ms
         G88soZjzD8GDx/IgvubYUHnAbYJb+ND96o1q7zatu4J7caq6YYjOgOZtqiS+pnDJfO79
         moa2rtHMmjU7iRm0niUUAt1S5PmWatLIwid7a+PaEkV4jV1hzEzJ1Czh1onGCJWPYJND
         tr4w==
X-Forwarded-Encrypted: i=1; AHgh+Robyx5RNoU8/0uEDpM5mwTau3ebSL00syDFG0Tu3F6s8gXMeSSiIBp+x+1M+mPDuynqEmMd8NnC8BCrVg==@lists.linux.dev
X-Gm-Message-State: AFuF++m8qBhsLKATneShDL9dJRnW0Bjrkt8n7xyXlrbY53rnSzkYel1S
	W/H36HIY37Oq7MWmtqChh9mnhubB7e1wIbpkONNwuFMHQJ9iAUumymzvzrzSh8UxX50H8EVy7a3
	5TGjO0ihTVmGVpn+MlE9tnI8DxdI1lMyYAN5MuxJPe8SUoAGFauH+smuOaIk=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c3c7:b0:4ab:32ea:95f6 with SMTP id
 5614622812f47-4b3669eeb47mr9694783b6e.13.1787763996489; Wed, 26 Aug 2026
 10:06:36 -0700 (PDT)
Date: Wed, 26 Aug 2026 10:06:36 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8f1d1c.27659fcc.2ceef7.0005.GAE@google.com>
Subject: [syzbot] [kernel?] BUG: unable to handle kernel paging request in
 netdev_unregister_kobject (2)
From: syzbot <syzbot+be6bbcdae3e70335dfa2@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    21d6ac051080 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10ceee79580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d1128bc53f2ef7f3
dashboard link: https://syzkaller.appspot.com/bug?extid=be6bbcdae3e70335dfa2
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/88380e2ddcb9/disk-21d6ac05.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5dba5c2896b7/vmlinux-21d6ac05.xz
kernel image: https://storage.googleapis.com/syzbot-assets/52ac739e37e0/Image-21d6ac05.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+be6bbcdae3e70335dfa2@syzkaller.appspotmail.com

Unable to handle kernel paging request at virtual address dfff80000000000b
KASAN: null-ptr-deref in range [0x0000000000000058-0x000000000000005f]
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
[dfff80000000000b] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 8158 Comm: kbnepd bnep0 Tainted: G             L      syzkaller #0 PREEMPT 
Tainted: [L]=SOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/07/2026
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : klist_put+0x50/0x11c lib/klist.c:212
lr : klist_put+0x2c/0x11c lib/klist.c:210
sp : ffff8000939e7800
x29: ffff8000939e7800 x28: 1fffe0001a7819c2 x27: ffff0000d3c0c008
x26: 1fffe0001a781805 x25: dfff800000000000 x24: 1fffe0001e9b428c
x23: dfff800000000000 x22: ffff0000d3c0c800 x21: 0000000000000001
x20: 0000000000000000 x19: ffff0000f4da1460 x18: 0000000000000000
x17: ffff800084d7fe14 x16: ffff8000824e8a44 x15: ffff80008251a5d0
x14: ffff800080f08a9c x13: 0000000000000001 x12: 0000000000000000
x11: 0000000000000000 x10: ffff60001e5d5ab5 x9 : 0000000000000000
x8 : 000000000000000b x7 : 0000000000000000 x6 : ffff800080b95428
x5 : ffff0000c9f78710 x4 : 0000000000000008 x3 : ffff800080ef89ec
x2 : 0000000000000001 x1 : ffff0000cfd33a80 x0 : 0000000000000000
Call trace:
 klist_put+0x50/0x11c lib/klist.c:212 (P)
 klist_del+0x24/0x34 lib/klist.c:230
 device_del+0x188/0x71c drivers/base/core.c:3938
 netdev_unregister_kobject+0x2a8/0x39c net/core/net-sysfs.c:2308
 unregister_netdevice_many_notify+0x123c/0x1760 net/core/dev.c:12481
 unregister_netdevice_many net/core/dev.c:12509 [inline]
 unregister_netdevice_queue+0x274/0x30c net/core/dev.c:12320
 unregister_netdevice include/linux/netdevice.h:3474 [inline]
 unregister_netdev+0x2c/0x70 net/core/dev.c:12527
 bnep_session+0x21b8/0x239c net/bluetooth/bnep/core.c:544
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838
Code: f9400268 927ff914 91016288 d343fd08 (38776908) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	f9400268 	ldr	x8, [x19]
   4:	927ff914 	and	x20, x8, #0xfffffffffffffffe
   8:	91016288 	add	x8, x20, #0x58
   c:	d343fd08 	lsr	x8, x8, #3
* 10:	38776908 	ldrb	w8, [x8, x23] <-- trapping instruction


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
