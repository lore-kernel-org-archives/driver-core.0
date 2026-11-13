Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794578104;
	b=TgrJtd4RRSrwiBJC88ILPnRa67Rt78Y+m9wtKMC5vMx5S4TGzBtiELVxf5nt4hMe9fEd
	 qn6LrIiRNvLYL1ZH0COvNuQcjUOn2QpxzOJP0QKC2roy5IZB34lwA+O0dEimeXAvQwN4h
	 pl3B9v6aF7FiHY/SsK2klD5g0kWYJ8qbrDNenLfW+FoZwgeJLScti0RZ5s9VTwJJWoqP/
	 bgFjrUgwIO9Bdgb4z/IZ6q/EbTO5VjOrB4VJtRjM2Pi+yEQqZ0tdVzmZO2EvSBwF1HjCd
	 4Bz/5zKVcaHn8goUDL8BxxM2J7+ZA2csqU0s5uT6N+/YB0FR1TGDkLFLFTejM/xybZQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794578104;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=0C2yalGdx6wKGFDsGp7XJEGbyjvOgIDpciutSW90K6w=;
	b=oymeNzr7I7QPoCEka9Joji9tnlPrsCCx/s3Hh/ezDjnW+4YPj1MjnA1eZ5qM0CJBL5Xk
	 A8WbYh7GO+iICLPjbZ9X2VfhUtNvXNv4ZJTRxfDAKol+dRIb7o65FwLs74W5LtWokQPUW
	 Iv08ph1AUNPhIxAmbuIpVXD49BfI36VRN8F64a6al6+Jzveg/MJeUN+9zzS4wWhjs+jCA
	 zoLEnv9fBaXpDWkJ+vhlPNUCFa+fjwZSZ9XdOv/9BrmwP91aY+GJQ1gUm66kXqax+JDyI
	 g+ExXPD9mNnzMQytTwfOWQYTA8lTIwTb5cbTiQo1sMQjYh3OWgoS4mGbWFCkcmg8THQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b="o5i3QQ/O";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.175
Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C210B606A32E
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 13:55:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C210B606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=o5i3QQ/O
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-5641f26ce05so1092496b6e.2
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 05:55:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794578103; cv=none;
        d=google.com; s=arc-20260327;
        b=MYvRHi/7QESF6SVe6Cx7BaXRXaCDTVMe8u+XOL2pJ5piyIFwBauvwUYi0uqI8vQCPj
         j/5g3T26XVBAIne9qGFdvhx6TJ3A80j+dXcJZSpE0JTCPdQ6bnxaq7dr7414UZ8GnMn7
         xGmJWir45wnHcWwCjfIl5RKPFcvooo88xc8K119j0Fz7y7u81C48DMyFR1gU9ZzmCTHR
         +XU0+n8Q7SD7btZ/XxW634f2awXOaZiK4wMGI/JYBL8+5pU2n/CA5fk0QjwiWZOBc/CX
         vxWOoS/El6Q7vaOhRMkRuPbM1SAmXUd7UFB+3oh/oUoZRM5QeRvHIUi8/fyRpxIQdHug
         GuLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0C2yalGdx6wKGFDsGp7XJEGbyjvOgIDpciutSW90K6w=;
        fh=/ogii+O/SRvz8Sgzb8t2IhDxueF/JVzwxHTXbTzeBa8=;
        b=YsHxoRYqsv3kMu3tyw/+9hWNvxACWhyQHhrVo3DMvd9pDTCR3PtUWZWB0m/2X4u8Er
         3wdWhj2MjeMDc17oL5dA2xNVtxh91Rd/KWfmTYGYvngLYogFfPwj4hp5js/sohCpkD7p
         mrS9xQ/78l5UOxr1QyNL2RDPNNguSz2PPxG+7pSIN5gV7tpde+v4iv88olap9Udlk2cg
         zieNjkAjA/PCDFlHkt0JhqH+nVXBioETpPWLZSJjVZZwCE026Gep6Cy21PrAUy6Sv0qS
         d6T9z/+OTcFDhfteatbhibP/E+XHu2iOsi5dEo6OV7VeiphHySkjJaEzB/Fi1f6wxM+Q
         9XRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794578103; x=1795182903; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0C2yalGdx6wKGFDsGp7XJEGbyjvOgIDpciutSW90K6w=;
        b=o5i3QQ/OXEt7makHeAl0MqGc6WMV8L8dJzBMAMsQ2yd3eedRjkCI4v3Q+gzCMl7k9X
         H/3TSwRXy0ud2niLJ48N5T8noHQarbSP5Tn1sA3uuMml1VM93ND1mkSOSdBFSvTUFu2K
         lj+076EJhAP0fB8lg/E+SlmQBLMtEODkcE5zaal6Arn29MoQFgRIipdnFnMMPK6zaSoa
         X2cFjj2j3AfBImkrBbtoF4N09TVVezabpVvyWMQchr5xKYSGOTWelsqs2zoyeH4wlwdw
         zMh7TWZJthOEuN3rjKSVctO+Fq/VK9ebq/6Ruj5tVn9GsINPP+hIyvJYHROryXa/Rs0P
         D8mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794578103; x=1795182903;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0C2yalGdx6wKGFDsGp7XJEGbyjvOgIDpciutSW90K6w=;
        b=d11+or7lWhvHtWFKKJtOr2iriyYcUBhmjzLlbepqe4KLWZcrEbJz/CretFbr+ntoXY
         7XpvlTkq7KYCGKLSauz3Q0PDLlRsmuP5UHJQfFhFAQ3aLCNUeB3+L8kKU95lKGydA9+U
         CqRT58ZuZxQkRcLTohdcxgoKlcOZabaVOnYtCBE3oqxJElFipK9ihsBwM+oCOBW7qhRt
         3IL1xYgP2d1mU26cfr8RSFI6cvbCmWpNMb79YsY9iU1pFGWCmLBOlHOtuAnsO9r13R5j
         kO3udRpo4wB6lljphPfK2BNKJztTS5txjRfeSXKqzDEmMogwp9/tG9eJxNoklhky00Ky
         7EAQ==
X-Gm-Message-State: APuU4Z8ocbXKylf+X3v2vYCFYn4/rV3NyJxN6ati5daEaRU3v1CLCs2o
	Kr4Gh3Mip+26babSdWtdlw3fe/85MVQnO5tA5H1LKC36wNQ/Tw2c+jy4g3MfVbyAs43qOQ6L+ZJ
	1ke1Mav3pp1sAtGUSSdiyop3Bc8N13zy2NeN+fUgV
X-Gm-Gg: AYBFou09lTXkOP4Cr0olYTO0Ff8Tj/ChZiQDUSubIESEuOGo4QuX9BE8tjGawlxfJY0
	gHSQqzXQbI/XIqqW2rWmD/wAdn6nzrnUSR62xouLE3e+cEhDDTJDVXT4tgNdwmBNai4WlBfapFw
	IhQMXMSthvGbuMXK/u/kUAjCpQdVm2eqLb7lys4+Rh1CSaDs1ZitptCNgS7Gq37wzggv+qg3xSE
	vNTS8zlG8Vx0B/OHQ61P+TVAYcTpNZCYRp9HQy2y7POee3K1kN1dKcBv1KSrTqkcN3Q8zvbueNS
	6qoSRiI34k1YyVhsbr2pS0YZ2BNyiuT2pm0Dc+Igiun8CE90gd2pMMHp6nB08jJP1Br/oIbMuMk
	Rz6dVltZu5YcfnC69CEhmLDJlfP7Y0EFBwkCSYQiwslnHxuYUjsdvL1iDnvfo7F3WbD9iCt5reS
	jca2y60iEOV38KOXdQjXkcUalvHkzTHD3epcJz3vWZeo6OpJCyD75+MiXK2kDX4Ot/lsaKwEDLc
	V8JSc7r
X-Received: by 2002:a05:6808:179e:b0:4d6:9252:48c9 with SMTP id
 5614622812f47-56e6520efa1mr1712240b6e.53.1794578102089; Fri, 13 Nov 2026
 05:55:02 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <6af6a9e8.fe96acdb.12252b.0000.GAE@google.com>
In-Reply-To: <6af6a9e8.fe96acdb.12252b.0000.GAE@google.com>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 13 Nov 2026 14:54:50 +0100
X-Gm-Features: AclHuK9gPAeneZ0by_7S8O--DcO6yZl6a4icpapqzvMYjM1LieCofYV3lTcxPMw
Message-ID: <CANp29Y63u6oNiz96PGUtH+pg+miU6Rk9bNty6-J2Ggz_HfbFgw@mail.gmail.com>
Subject: Re: [syzbot] [kernfs?] BUG: unable to handle kernel paging request in kernfs_unlink_sibling
To: syzbot <syzbot+02ab1258b7fa66eb1f7f@syzkaller.appspotmail.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

#syz invalid

Should no longer appear after https://github.com/google/syzkaller/pull/8111

On Fri, Nov 13, 2026 at 7:10=E2=80=AFAM syzbot
<syzbot+02ab1258b7fa66eb1f7f@syzkaller.appspotmail.com> wrote:
>
> Hello,
>
> syzbot found the following issue on:
>
> HEAD commit:    58c1eb84e977 arm64: sdei: Preserve the interrupted contex=
t..
> git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux=
.git for-kernelci
> console output: https://syzkaller.appspot.com/x/log.txt?x=3D10ee7f8d58000=
0
> kernel config:  https://syzkaller.appspot.com/x/.config?x=3Da58b6b4d667e7=
a61
> dashboard link: https://syzkaller.appspot.com/bug?extid=3D02ab1258b7fa66e=
b1f7f
> compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.=
8
> userspace arch: arm64
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=3D17119f8d580=
000
>
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/b1ec47537e12/dis=
k-58c1eb84.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/3bca0c2b1169/vmlinu=
x-58c1eb84.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/0a7c49594d5a/I=
mage-58c1eb84.gz.xz
>
> AI-generated root cause summary:
> The crash manifests during network namespace teardown (cleanup_net ->
> rdma_dev_exit_net -> ib_free_port_attrs -> destroy_gid_attrs ->
> kernfs_unlink_sibling -> rb_erase) when ____rb_erase_color encounters a N=
ULL
> sibling pointer and dereferences address 0x0 (detected by KASAN at shadow
> address dfff800000000000). In a valid red-black tree, ____rb_erase_color =
is only
> entered after deleting a black node, so the sibling subtree must contain =
at
> least one black node and sibling can never be NULL; furthermore, all kern=
fs
> directory operations are strictly protected by root->kernfs_rwsem. This r=
btree
> corruption is induced externally: userspace mmaps the PCI BAR0 MMIO windo=
w
> exposed via sysfs (/sys/bus/pci/devices/.../resource0 in
> drivers/pci/pci-sysfs.c) and writes arbitrary data into device MMIO space=
,
> reprogramming hardware DMA queues and causing device DMA to overwrite ker=
nel
> memory structures.
>
> full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3D02ab125=
8b7fa66eb1f7f
>
> IMPORTANT: if you fix the issue, please add the following tag to the comm=
it:
> Reported-by: syzbot+02ab1258b7fa66eb1f7f@syzkaller.appspotmail.com
>
> Unable to handle kernel paging request at virtual address dfff80000000000=
0
> KASAN: null-ptr-deref in range [0x0000000000000000-0x0000000000000007]
> Mem abort info:
>   ESR =3D 0x0000000096000005
>   EC =3D 0x25: DABT (current EL), IL =3D 32 bits
>   SET =3D 0, FnV =3D 0
>   EA =3D 0, S1PTW =3D 0
>   FSC =3D 0x05: level 1 translation fault
> Data abort info:
>   ISV =3D 0, ISS =3D 0x00000005, ISS2 =3D 0x00000000
>   CM =3D 0, WnR =3D 0, TnD =3D 0, TagAccess =3D 0
>   GCS =3D 0, Overlay =3D 0, DirtyBit =3D 0
> [dfff800000000000] address between user and kernel address ranges
> Internal error: Oops: 0000000096000005 [#1]  SMP
> Modules linked in:
> CPU: 1 UID: 0 PID: 1195 Comm: kworker/u8:6 Not tainted syzkaller #0 PREEM=
PT
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS G=
oogle 11/06/2026
> Workqueue: netns cleanup_net
> pstate: 63400005 (nZCv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=3D--)
> pc : ____rb_erase_color lib/rbtree.c:354 [inline]
> pc : rb_erase+0x4e4/0xba0 lib/rbtree.c:445
> lr : kernfs_unlink_sibling+0x190/0x218 fs/kernfs/dir.c:449
> sp : ffff800094d775f0
> x29: ffff800094d77600 x28: ffff0000d985c408 x27: ffff0000d985c410
> x26: 1fffe0001b30b882 x25: dfff800000000000 x24: ffff0000c6b58ca0
> x23: 0000000000000000 x22: 0000000000000000 x21: ffff0000d98545e0
> x20: ffff0000d985c400 x19: 0000000000000000 x18: 1fffe000359d3e28
> x17: 0000000000000003 x16: ffff8000898b7000 x15: 0000000000000000
> x14: 0000000000287419 x13: 0000000000000001 x12: 0000000000000003
> x11: 0000000000000000 x10: 0000000000000001 x9 : 0000000000000000
> x8 : 0000000000000000 x7 : ffff800080f6a0dc x6 : 0000000000000000
> x5 : 0000000000000000 x4 : 0000000000000000 x3 : ffff80008046e414
> x2 : 0000000000000001 x1 : ffff0000c6b58ca0 x0 : ffff0000d98545e0
> Call trace:
>  ____rb_erase_color lib/rbtree.c:354 [inline] (P)
>  rb_erase+0x4e4/0xba0 lib/rbtree.c:445 (P)
>  kernfs_unlink_sibling+0x190/0x218 fs/kernfs/dir.c:449
>  __kernfs_remove+0x36c/0x748 fs/kernfs/dir.c:1584
>  kernfs_remove_by_name_ns+0x70/0xd0 fs/kernfs/dir.c:1796
>  kernfs_remove_by_name include/linux/kernfs.h:644 [inline]
>  remove_files+0x90/0x184 fs/sysfs/group.c:28
>  sysfs_remove_group+0x98/0x160 fs/sysfs/group.c:328
>  sysfs_remove_groups+0x5c/0xb4 fs/sysfs/group.c:352
>  destroy_gid_attrs drivers/infiniband/core/sysfs.c:1143 [inline]
>  ib_free_port_attrs+0xa8/0x340 drivers/infiniband/core/sysfs.c:1367
>  remove_one_compat_dev+0x54/0x7c drivers/infiniband/core/device.c:1035
>  rdma_dev_exit_net+0x188/0x388 drivers/infiniband/core/device.c:1173
>  ops_exit_list net/core/net_namespace.c:200 [inline]
>  ops_undo_list+0x3cc/0x81c net/core/net_namespace.c:253
>  cleanup_net+0x474/0x6c4 net/core/net_namespace.c:708
>  process_one_work kernel/workqueue.c:3495 [inline]
>  process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3578
>  worker_thread+0x798/0xbd0 kernel/workqueue.c:3659
>  kthread+0x304/0x3d4 kernel/kthread.c:436
>  ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:854
> Code: 91004280 968b3531 f9400376 d343fed7 (38796ae8)
> ---[ end trace 0000000000000000 ]---
> ----------------
> Code disassembly (best guess):
>    0:   91004280        add     x0, x20, #0x10
>    4:   968b3531        bl      0xfffffffffa2cd4c8
>    8:   f9400376        ldr     x22, [x27]
>    c:   d343fed7        lsr     x23, x22, #3
> * 10:   38796ae8        ldrb    w8, [x23, x25] <-- trapping instruction
>
>
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
>
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
>
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
>
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
>
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
>
> If you want to undo deduplication, reply with:
> #syz undup
>
> --
> You received this message because you are subscribed to the Google Groups=
 "syzkaller-bugs" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to syzkaller-bugs+unsubscribe@googlegroups.com.
> To view this discussion visit https://groups.google.com/d/msgid/syzkaller=
-bugs/6af6a9e8.fe96acdb.12252b.0000.GAE%40google.com.
