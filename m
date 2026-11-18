Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.196
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795005439;
	b=aVCDyNLKS0lQmxtqWpdYy2/eXt1k2kdjHhZjXUcdJ8QHS57BinRVP2bp6aye/6MY5D40
	 DyKE+v2+JWSJGW4MDBVzWDILsD8U1M+F5904U7c2N3FRwHJDkS6gjuSgS93v5KPlSBwew
	 GoIIijv+DQruPn+wlKJQoYP/pUTnnC+Gh25KDf0FZZ9cnsRIhJQSiODZSiBeNWa31m4jP
	 UWpdMuXFdF01SWCc8OXFsOjqjYqomRpCLwuhp1PHU9D1vWXgDXB3df8k1UidhALqhKLIV
	 18AO5ShC6qHFNTVjoT5xZyRjQrReSMoSEXmeB/4XoPfHM7G2V+wSgAWqY78CBvqGF7Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795005439;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type;
	bh=ULKfBiyPUodGwChJ6W1HqXCemItu/hB9DisezQMSBXg=;
	b=f8uketxXp4vRay19nugfqPaDJPmQ/BEb394lFIa1glVCCnMzEp3FodL4m5EmrfUdZl2v
	 rEFwAZV/9veEz1sHNdU+D9IAsrerV1mANTE7lvzPffLP5cib7WAE8+bAcVHx9e8KXabTJ
	 Bi3vdDVOdDRbWt1dNvQqSn0V5DEC7HIqo+FPs0Db65T6d4fYVfKwrw87rfNlX8pSmGcMw
	 MhFmOjEwX7N2COeUAGHfptPO9Pjx21pEycq8eK9NG33rc8RO7/31Dv0enfQ/Tly2NQAAp
	 /K0KN4IQeD/LGDCnUy2u8DjdZAGiFFF84N4wHkRAz15QevGkcSNktVvvqhtZk4O0JJg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDS+LXIh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.196
Received: from mail-lj1-f196.google.com (mail-lj1-f196.google.com [209.85.208.196])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C11606A320
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 12:37:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 58C11606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDS+LXIh
Received: by mail-lj1-f196.google.com with SMTP id 38308e7fff4ca-3adff684a52so8517411fa.1
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 04:37:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795005437; cv=none;
        d=google.com; s=arc-20260327;
        b=mgOKEwS5YuP4zRl/VwXLqc5mV7zzmLy/XZPieGF5z0ncMtl7r9Swgpfx/382ietFwi
         F2UDBtvs66Zc0KC24ky4TIfMOIrvuPs15ICLUUIDiXymgbU9faYdqv2JJbz8uAtNTcQh
         JhskySdrWLwjpuMg9YkVfwRA52NQ9Yc3RxdzSi+Z9LB9u9LE4afTG4Mg662u2fHr+z1t
         sYV5aNTKmZclRHa+tuKflGv1LClse2sy6J+0xGHPhS1IsCxVBAp7hdPfq0o4ex0braP/
         OC/onluQ8fX7uiMcMvtnzn/GdzYF1tRCieUDhf/syDTQkGoa/w0lPi1w0Xy8AAk779C/
         kmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=ULKfBiyPUodGwChJ6W1HqXCemItu/hB9DisezQMSBXg=;
        fh=3Gd0DGIuFoSDxgCB1N0KlLyvyZgkKoIVwskPvlI6y54=;
        b=oi745fMx0W3tCRYedLscvT7jPAMzBb2+8qe7HLfnTlWrHEe3k3cPr/T2iVsHIoP+08
         LTqhw66G25HUb/0lrG8vznv4ewRCY5Nfz7P8XHqlhdRFyu5Iu5oxS+iQmzadbVGPq7om
         hCfL37YEmaUjfOZtEbEodVIRXH5knoR5lsu0rWTnafm1DOVyDb4qBjXQ39dEeygay1t/
         6g0btoWDimmdEzTFtgd5kwSsF/PHnbBJ8YluvIrA0q9k7w32tzvrdM/AvskhAdUi/wup
         lzdwhpBz4W0umNKBwN6JnKlD8zYXV+VVWkDeFTsEKL2PPzYO6rzjl9kMliE4iibbiNyu
         5sdg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795005437; x=1795610237; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ULKfBiyPUodGwChJ6W1HqXCemItu/hB9DisezQMSBXg=;
        b=WDS+LXIh9k7V1cIOWXQtBpM+gpWMAsvw4MFQN7R7xwdxTcZlaclxVGwEfiYx1NbwSx
         gx4K8wy9BsbLdxNzu9CtFJxnSZw0HSl+UaaVGPoEdooA4DytZyz3OOsu4P9Rr7m7JH2/
         dVHqHZQ8iEMuEPYE4N03M84ZaB6OCbuW+dwthkznNge7Wx3svveM4i+ICUEDN15a36gf
         SnL1fFi13HLJmxjo6GFOBEEywvwy/Z/EWBa8gE5SHz5m5lvVMjqvJ2rOgxV2jIT3L7Vi
         mWcfLpEBK+JdgvFr+vS4FnOzG/xM3FiwNZnF8RI9yscIOL7B87zQ81hPfGWPQbk2sC+T
         YuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795005437; x=1795610237;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ULKfBiyPUodGwChJ6W1HqXCemItu/hB9DisezQMSBXg=;
        b=MA/IF+9xwY9L0FILrFQ0pNjG6zktQmwfddfP+osN/Udn+s2zl5+sGMtnob9FU3wk60
         U/tIz7WXMbzkIupkr5qN7yyDX04bqSSRAWVuf2vHQZWuZNNvLDH8rpOK/RWpRVXZMiCA
         HpBoqf/PVb4uAgmaFETagoSXzKZiQqPUCIh/rD18x33cIms1yEIGND57PnSRycBwcuzh
         fq5DoFA3lXn7+gdeCO1XKpU3ldta7wWwoFJ7OVsGtnN+NUkCgnfFTE/gV+jkRxFsqn49
         8ipynCYL0wnIPbK7vDmPQNIq4v2/6DwjswyuD9Wdz2Xn1+MfeIedQ3KoLtS/YmNG8qGE
         uOWQ==
X-Forwarded-Encrypted: i=1; AL+hErHdv2XVO1jSRvDjGYHCw2N8I9QGgrMzDikrY0XqvoK6ALdcUaWW5ry7cWCiQPT4DeX8tBvYgt9tVPBSWw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Ae2UkfWYAOYftLPuuKVO3IZnZMB19x8gxnUuFJ0ofYwQxIqoB
	8RDzZ8gmXg/E/gCzhbq24PDBHmgY5NokOYkU3NgSZ2coRAg5SuePhQRmhL0bvnfPrnxkK0xBSeC
	eSvVrMg/nIHqZu73bFh1ZKsGRMa5N2qo=
X-Gm-Gg: AYBFou03C1c3O7UuxzrL6lf99OndoALemR+tFA97AYRTpM9UGAcSWrnlkQmTxl6I/mE
	nE5EKqyO+ETH1E/PkdiM4oyrtZjZd+eJ0KOazvDkRy/HEGql6wiyDotugEDXgfVUQoZjSvJVcxJ
	kyRjW83AHordt5zbyM7MSH6zZ/BtjBdrPvUnBpG38qx4bCRkEswioUW2r0yr1+J9gX0XTAuuhI2
	qOC17W9Yx6BMIYkUiEvEcI9c+WudaxTkqswoWjfnZh4XUd4MFb3UtKrjT46mg7MVqoJyxvS5kPg
	0FySXQenVcs5l7YF/MoajZJxBWcr7Dmq/THwyrTy3hu4F3BO8wSDLJxAGIcNdxX5SGs4byQ3JgD
	MJUm+EV/8oedG5XtGsa4R19x7nkJfbwNQhf2uE7Fw8br9h+GxKM+KHl8aODR1KSTsHiiI7WDh/J
	tWRR6iMfJq+tUBxjQ=
X-Received: by 2002:a05:651c:a14c:b0:3ae:c43:d892 with SMTP id
 38308e7fff4ca-3ae5c91dd47mr17035981fa.1.1795005437159; Wed, 18 Nov 2026
 04:37:17 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
From: Zheng Zheng <fengaojigui88@gmail.com>
Date: Wed, 18 Nov 2026 20:37:03 +0800
X-Gm-Features: AclHuK882m7RkIPXulNkPGmJF5W6vqJWzBXr7PYXZHgIM8IyUvzbKABo3YeYs70
Message-ID: <CAO-4RZ1DiPS2+=3WPxRGSEajO=dnsfYi4zDyjcVp3LBy2670AQ@mail.gmail.com>
Subject: [BUG] WARNING in kernfs_remove_by_name_ns (fs/kernfs/dir.c:1784, v7.4-rc3)
To: dsterba@suse.com, mason@kernel.org
Cc: gregkh@linuxfoundation.org, tj@kernel.org, linux-btrfs@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hi David, Chris, Greg, Tejun,

We found a reproducible WARNING in the kernfs/sysfs removal path on
v7.4-rc3 with syzkaller. It is triggered while enabling Btrfs quotas and is
stable on fresh VMs.

The archive and reproducer are here:

  https://github.com/Zheng-zheng-codes/kernfs-remove-by-name-ns-warning
  commit 1d8c9a81d3f812c9ea320afba737bb4be8643ed4

Warning
-------

The warning is preceded by a kobject allocation failure for the Btrfs
`qgroups` sysfs kobject:

  kobject: kobject_add_internal failed for qgroups (error: -12 parent:
d1a4d035-71e5-4764-8138-3b7234c5bdf5)
  ------------[ cut here ]------------
  kernfs: can not remove 'enabled', no directory
  WARNING: fs/kernfs/dir.c:1784 at
kernfs_remove_by_name_ns+0x10b/0x120 fs/kernfs/dir.c:1784, CPU#1:
syz.7.1656/40887
  Modules linked in: crc32c_cryptoapi(E) cifs(E) smbdirect(E)
rdma_cm(E) iw_cm(E) ib_cm(E) nbd(E) ext2(E) smc(E) ib_core(E)
dm_multipath(E)
  CPU: 1 UID: 0 PID: 40887 Comm: syz.7.1656 Tainted: G            EL
   7.4.0-rc3-kernsight-kasan #1 PREEMPT(full)
  Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.15.0-1
04/01/2014
  RIP: 0010:kernfs_remove_by_name_ns+0x10e/0x120 fs/kernfs/dir.c:1784
  RSP: 0018:ffa00000064479c0 EFLAGS: 00010293
  Call Trace:
   <TASK>
   kernfs_remove_by_name include/linux/kernfs.h:644 [inline]
   remove_files+0x9b/0x1c0 fs/sysfs/group.c:28
   sysfs_remove_group+0x90/0x1b0 fs/sysfs/group.c:328
   sysfs_remove_groups fs/sysfs/group.c:352 [inline]
   sysfs_remove_groups+0x65/0xb0 fs/sysfs/group.c:344
   __kobject_del+0x89/0x220 lib/kobject.c:595
   kobject_del lib/kobject.c:627 [inline]
   kobject_del+0x40/0x60 lib/kobject.c:619
   btrfs_sysfs_del_qgroups+0x156/0x230 fs/btrfs/sysfs.c:2463
   btrfs_sysfs_add_qgroups+0x1c2/0x230 fs/btrfs/sysfs.c:2502
   btrfs_quota_enable+0x2e7/0x1ce0 fs/btrfs/qgroup.c:1034
   btrfs_ioctl_quota_ctl fs/btrfs/ioctl.c:3605 [inline]
   btrfs_ioctl+0x46d4/0x5e10 fs/btrfs/ioctl.c:5663
   __x64_sys_ioctl+0x194/0x210 fs/ioctl.c:584
   do_syscall_64+0x132/0x7c0 arch/x86/entry/syscall_64.c:89
   entry_SYSCALL_64_after_hwframe+0x77/0x7f
   </TASK>

Important annotations
--------------------

- The first line is the Btrfs qgroups kobject add failure with `-ENOMEM`
  (`error: -12`). This `-ENOMEM` is triggered by the reproducer's `failslab`
  fault injection, not by a real memory shortage. The warning is then emitted
  from the cleanup path trying to remove the `enabled` file from a sysfs group
  that was never fully created.
- The call path is:
  `BTRFS_IOC_QUOTA_CTL` -> `btrfs_quota_enable()` ->
  `btrfs_sysfs_add_qgroups()` -> `btrfs_sysfs_del_qgroups()` ->
  `sysfs_remove_groups()` -> `remove_files()` -> `kernfs_remove_by_name()`.
- `kernfs_remove_by_name_ns()` warns when the target node cannot be found;
  here it cannot find `enabled` under the qgroups directory.
- The warning becomes a panic because the test kernel boots with
  `panic_on_warn=1`. This may be a cleanup-path warning after an injected
  allocation failure rather than memory corruption; we have not confirmed a
  root cause or a fix.
- The warning is user-triggerable through Btrfs quota control, but we are not
  claiming it is a security issue.

How to reproduce
----------------

The recipe reproduces on a fresh, unmodified VM; no state snapshot is needed.

  git clone https://github.com/Zheng-zheng-codes/kernfs-remove-by-name-ns-warning
  cd kernfs-remove-by-name-ns-warning

  # boot the v7.4-rc3 kernel with the supplied config and guest image

  # in the guest, as root:
  syz-execprog -procs=8 -threaded -repeat=0 \
      -executor ./syz-executor reproducer/repro.kernsight.prog

`-repeat=0` repeats until the warning fires; the external runs hit in 43 s
and 45 s. The recipe has 76 entries (75 replay programs followed by the
testcase).

Verification:

- Main Kernsight pipeline: `confirmed=true`, `status=verified`,
  2026-11-18T05:11:34Z, 75 replay programs, fresh-VM 2/2.
- Independent external fresh-VM verification: 2/2, target hit after 43 s and
  45 s; serial logs are in `external-verify/serial-1.log` and
  `external-verify/serial-2.log`.
- C reproducer: not generated; the syzkaller recipe is the primary
  reproducer.

Kernel/guest details:

  kernel: v7.4-rc3, bzImage sha256
    0c16409f8aec508ac44a63e631c2bd352536401f3fd0856df1d839fb953a1882
  guest: Debian trixie x86_64, 6 GiB RAM, 4 vCPU, QEMU/KVM
  boot: oops=panic panic_on_warn=1
  config: CONFIG_KASAN=y, CONFIG_PROVE_LOCKING=y, CONFIG_BTRFS_FS=y

Thanks,
Zheng
