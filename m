Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794550249;
	b=iJlfAbZ9RpB634G5yKhb45MqaF5+1jC95c1+A2iap3zTa6iyfDXQLfCUheEdecgl8xQL
	 gYW6v8upg5RXmfgJJEt4b7b9EAcJQGKFwtaxOaoLqq74+ZcwLKdr6iZgSBqEqJy29H9Kw
	 xo1FG6iSPnO/NOQWxZj3ErOGNJaYE1OjhEoYAgNRSp5e9smVMTfp1MuykBPEMU0Gb69Nj
	 ofr4ZcOexFSIp4/6omdSLIQfKzx7idWKAbJapmDA78JNIYA3xG6cLzF40+26SyHvcVvkD
	 aqI1WsqAbXHnC1bHKSa+OhnZl+fpOZcGZJlWIGRQK3iq+yE6YYzu4wMgc1n+RfIHi2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794550249;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=Oi8+m7i7ep+MfkQtGAeEFulTFN9QQYveST2FSv3idns=;
	b=NZZ0I0xEmhR6KtJF/2xEBWR4fTiquw6dR/2qTGRabslltekSDupvFuv+xne9XDiJMmen
	 Ul3jEKhGwqX/fD6hoXft+H5f2pwRykjFcxnv1+mAAj1PgqmB2tYEKN7XVhOxoflAw6Ota
	 XFvjViBlk9/UKuEfdjSO/xtZ5F9ju+wAU/csjyDyJjzqofQgCyXFf9uNhiAM64xOC6JMx
	 M+Qk1P+OMLuf0yspTVH/3iXRwuj6Gat0xT0mq1SciOiEJZKBh5ihuS+KheC+qpgZWnOM7
	 3jR4fRb0N+Ip7m2RnZpq61DyInrarYD/sJ843JClkynX3PbOLoxaMoLGKsx0azARtdg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.210.69
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338C9606A31C
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 06:10:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 338C9606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-83edc5c5ae9so348422a34.1
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 22:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794550248; x=1795155048;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Oi8+m7i7ep+MfkQtGAeEFulTFN9QQYveST2FSv3idns=;
        b=kyZYEeIwBQrhFseRgOiLkO27R1dMQ93eyQ2EzPcDekWZsrNX+E9uFCVDgO8BOYpg8y
         yOxAOfXzXeTOsiCXNOiwxy5hiNP4KNHKY6A7Se6Oi5niwGa8SNZUlc3/65on2s7p+/pQ
         PT70WA7oDBT54EIr4j06S2xQ7bOng6q1ziZ1DeziTryY/IUoIL2+XmJeauxWDj8fhcII
         AmeL0AZIm1EI/1VWLEw9xbUHSW+DU7qit7q++RWxfqnA+GLGls4SbpoRRO1NV0LOybR+
         Cd3nt0eroWBVYwaTIsRzpYyCLzeRjJ2YFWrLXZd9ZjxnEAQK0ywXYsGS5RPeirUFKy93
         xljQ==
X-Gm-Message-State: APuU4Z+O7uoiu/H4f9TE5ox92FQOPceCOH7PK2Xc66667MUGJil/v2Hr
	sDtjtZ1xhT5xm17+Y5HyG1lBOuYy7UYhuWEGPOSNSjdl2YiGMjvw1zaYa7t6X3WggQWXaAFQOrk
	dxpO40fjonNQGzjdPHEdk2ocGU3cSj/ffDU0fgIIC0hHG5k6f+njE/xmppxk=
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:17a3:b0:4d6:92b3:5c86 with SMTP id
 5614622812f47-56e65735c9emr1080356b6e.67.1794550248187; Thu, 12 Nov 2026
 22:10:48 -0800 (PST)
Date: Thu, 12 Nov 2026 22:10:48 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af6a9e8.fe96acdb.12252b.0000.GAE@google.com>
Subject: [syzbot] [kernfs?] BUG: unable to handle kernel paging request in kernfs_unlink_sibling
From: syzbot <syzbot+02ab1258b7fa66eb1f7f@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    58c1eb84e977 arm64: sdei: Preserve the interrupted context..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=10ee7f8d580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=a58b6b4d667e7a61
dashboard link: https://syzkaller.appspot.com/bug?extid=02ab1258b7fa66eb1f7f
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17119f8d580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/b1ec47537e12/disk-58c1eb84.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3bca0c2b1169/vmlinux-58c1eb84.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0a7c49594d5a/Image-58c1eb84.gz.xz

AI-generated root cause summary:
The crash manifests during network namespace teardown (cleanup_net ->
rdma_dev_exit_net -> ib_free_port_attrs -> destroy_gid_attrs ->
kernfs_unlink_sibling -> rb_erase) when ____rb_erase_color encounters a NULL
sibling pointer and dereferences address 0x0 (detected by KASAN at shadow
address dfff800000000000). In a valid red-black tree, ____rb_erase_color is only
entered after deleting a black node, so the sibling subtree must contain at
least one black node and sibling can never be NULL; furthermore, all kernfs
directory operations are strictly protected by root->kernfs_rwsem. This rbtree
corruption is induced externally: userspace mmaps the PCI BAR0 MMIO window
exposed via sysfs (/sys/bus/pci/devices/.../resource0 in
drivers/pci/pci-sysfs.c) and writes arbitrary data into device MMIO space,
reprogramming hardware DMA queues and causing device DMA to overwrite kernel
memory structures.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=02ab1258b7fa66eb1f7f

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+02ab1258b7fa66eb1f7f@syzkaller.appspotmail.com

Unable to handle kernel paging request at virtual address dfff800000000000
KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
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
[dfff800000000000] address between user and kernel address ranges
Internal error: Oops: 0000000096000005 [#1]  SMP
Modules linked in:
CPU: 1 UID: 0 PID: 1195 Comm: kworker/u8:6 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/06/2026
Workqueue: netns cleanup_net
pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : ____rb_erase_color lib/rbtree.c:354 [inline]
pc : rb_erase+0x4e4/0xba0 lib/rbtree.c:445
lr : kernfs_unlink_sibling+0x190/0x218 fs/kernfs/dir.c:449
sp : ffff800094d775f0
x29: ffff800094d77600 x28: ffff0000d985c408 x27: ffff0000d985c410
x26: 1fffe0001b30b882 x25: dfff800000000000 x24: ffff0000c6b58ca0
x23: 0000000000000000 x22: 0000000000000000 x21: ffff0000d98545e0
x20: ffff0000d985c400 x19: 0000000000000000 x18: 1fffe000359d3e28
x17: 0000000000000003 x16: ffff8000898b7000 x15: 0000000000000000
x14: 0000000000287419 x13: 0000000000000001 x12: 0000000000000003
x11: 0000000000000000 x10: 0000000000000001 x9 : 0000000000000000
x8 : 0000000000000000 x7 : ffff800080f6a0dc x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff80008046e414
x2 : 0000000000000001 x1 : ffff0000c6b58ca0 x0 : ffff0000d98545e0
Call trace:
 ____rb_erase_color lib/rbtree.c:354 [inline] (P)
 rb_erase+0x4e4/0xba0 lib/rbtree.c:445 (P)
 kernfs_unlink_sibling+0x190/0x218 fs/kernfs/dir.c:449
 __kernfs_remove+0x36c/0x748 fs/kernfs/dir.c:1584
 kernfs_remove_by_name_ns+0x70/0xd0 fs/kernfs/dir.c:1796
 kernfs_remove_by_name include/linux/kernfs.h:644 [inline]
 remove_files+0x90/0x184 fs/sysfs/group.c:28
 sysfs_remove_group+0x98/0x160 fs/sysfs/group.c:328
 sysfs_remove_groups+0x5c/0xb4 fs/sysfs/group.c:352
 destroy_gid_attrs drivers/infiniband/core/sysfs.c:1143 [inline]
 ib_free_port_attrs+0xa8/0x340 drivers/infiniband/core/sysfs.c:1367
 remove_one_compat_dev+0x54/0x7c drivers/infiniband/core/device.c:1035
 rdma_dev_exit_net+0x188/0x388 drivers/infiniband/core/device.c:1173
 ops_exit_list net/core/net_namespace.c:200 [inline]
 ops_undo_list+0x3cc/0x81c net/core/net_namespace.c:253
 cleanup_net+0x474/0x6c4 net/core/net_namespace.c:708
 process_one_work kernel/workqueue.c:3495 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
Code: 91004280 968b3531 f9400376 d343fed7 (38796ae8) 
---[ end trace 0000000000000000 ]---
----------------
Code disassembly (best guess):
   0:	91004280 	add	x0, x20, #0x10
   4:	968b3531 	bl	0xfffffffffa2cd4c8
   8:	f9400376 	ldr	x22, [x27]
   c:	d343fed7 	lsr	x23, x22, #3
* 10:	38796ae8 	ldrb	w8, [x23, x25] <-- trapping instruction


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
