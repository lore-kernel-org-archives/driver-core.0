Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794604690;
	b=scjYUPF0i7Wwvw+CjXWjXBJ0TJazLQsDShvnWd3SenSjUzH17VZ7Yt2343IRYgDkmVMk
	 rRmMjRO0GrepE/GdkUXHcoifs09yFKIBhBz/Wd29AD7NJkDtngTgqSm3zP/Fu9DgB86X7
	 rZ02y8YGXl+yUiRpyZKknIPcouoSmR5s7ieN70at64Dy7VcVoUTmbBaPeSgMn4cTLZ7+j
	 B95DbnR+eF+2TtbBCIuP319+VbAXDi9aP1GIILMLchLGGZr0Y6Dm+glT0ttqcwRVAKCFN
	 4vdXkZb+NORH9oDd0Ha8QCjcOYouFctrusQIF9vsrEt7US/uqoJl9d5pmx4Kw8zzefA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794604690;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type:Content-Transfer-Encoding;
	bh=9vqpt0IFr8008rX5aatdg032iJZtTAHNaLQJVOcXEVc=;
	b=nGRdkBHvJNpiixHK9xbMcYXpLa4lfiQNk9m8YrAu4XGzZVw3zhzPvomahl9lC1P71jGK
	 9gxqOeqAGCNz+Q5MBEd+DRxryd4ziOvbPdhoXy/OPi+/jObmcqs9/Po98PnyW4uUSioJX
	 4KjdYqThYcJnkyayqTvciVsid5vYt6riZzAIgIcgOMVVk+50qCb5PCIQO2LwtyUfhlHAS
	 jTRachrfmq3Net0kQBZn8PIGEJoSgHAuCTA3VZTUSa7Oy3vVjyc6M4Qr/b/u/Rhn3uDEp
	 AbcxL3gXwOsjO4A8ibmcHccC7Ir4qeZxop8liRcSa78+lEnvo5j+rZ//7cdWly8H2tQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F27606A880
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 21:18:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E3F27606A880
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4e778acdbc6so1909348b6e.3
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 13:18:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794604689; x=1795209489;
        h=content-transfer-encoding:content-type:to:from:subject:message-id
         :date:mime-version:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9vqpt0IFr8008rX5aatdg032iJZtTAHNaLQJVOcXEVc=;
        b=Q1VLcZF5JiUA+TIsCSA7MqF/+yo02K2IxYWXXSp5jJ4dqwf/hIz2IaWWhY6sPk8xHJ
         23owPh5AHQjL5J+a6FCTq9yQsXR/9EE0XwYW3V4lITDvS6dpL6ItyaJl3skEhgyTEp+i
         wnma4dSA8ahBmkvHSkyTy5R9emiLX3KFP0NtsQ9HT+p5HxbwLkQocNTN5SZNxS44eCvP
         QRTfMnwT0zX4VdsqaiT7FFtwd7rOSMiKXRrk3OEqbT9jeHMrfMf/YkQ1fpD7AzNvZQ+D
         VxRSrRLJTghZklBK+wM82WBlPjdXuUsEoraOy7Zp63lTdrF6OANSzMbAdN3Hch5LsewN
         6yDA==
X-Gm-Message-State: APuU4Z8Yu6Yx0B9xWyRP32HVJ70v6hni+Eo/h0drTcaG2Ip3TjWOK4UA
	OeG8vw82UcIkuJuyw64nJbxS6ogU6NknIOCOYfYOkZb8AMak9vNCC8p6RNt6X8ggJe36Bc3ypae
	eKvtwqBOstoAVYCITNzBhvVIR8fNsRQHFLPZo6IxJReZSoIaNVu22MhXPmyU=
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:c2b5:b0:4dc:1374:99ae with SMTP id
 5614622812f47-56e65735230mr3158095b6e.56.1794604688881; Fri, 13 Nov 2026
 13:18:08 -0800 (PST)
Date: Fri, 13 Nov 2026 13:18:08 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6af77e90.ff6dfe28.557e.0029.GAE@google.com>
Subject: [syzbot] [kernfs?] possible deadlock in ovl_copy_up_start (6)
From: syzbot <syzbot+da1d15f707a556f6e48c@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

syzbot found the following issue on:

HEAD commit:    6d582d78fad9 Add linux-next specific files for 20261112
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=3D169916fd580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3D95f6af5dfe89cd1=
b
dashboard link: https://syzkaller.appspot.com/bug?extid=3Dda1d15f707a556f6e=
48c
compiler:       Debian clang version 22.1.8 (1~deb13u4), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f69f3ef14401/disk-=
6d582d78.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/cf338d53804b/vmlinux-=
6d582d78.xz
kernel image: https://storage.googleapis.com/syzbot-assets/98aa6b0c26da/bzI=
mage-6d582d78.xz

AI-generated root cause summary:
Lockdep detected a false positive circular dependency between overlayfs
directory locking, superblock write protection, IMA integrity locking, and
kernfs file locking. OverlayFS by design acquires an inode's i_rwsem
(&ovl_i_mutex_dir_key) followed by ovl_inode_lock (&ovl_i_lock_key) on the =
same
inode during copy-up, and then takes upper filesystem freeze protection
(sb_writers). A reverse chain was registered because do_open() holds sb_wri=
ters
across security_file_post_open(), kernfs open files share a single &of->mut=
ex
class, IMA shares &ima_iint_mutex_key[0] across all non-stacked filesystems
(both upper-fs regular files and kernfs files), and resume_store() performs=
 a
full VFS path walk (lookup_bdev) under &of->mutex that re-enters OverlayFS
directory locking. Because the intermediate lock instances belong to disjoi=
nt
objects on different filesystems, no actual deadlock can materialize at run=
time.

full analysis:  https://syzkaller.appspot.com/x/ai_root_cause?x=3Dda1d15f70=
7a556f6e48c

IMPORTANT: if you fix the issue, please add the following tag to the commit=
:
Reported-by: syzbot+da1d15f707a556f6e48c@syzkaller.appspotmail.com

overlayfs: workdir is in-use as upperdir/workdir of another mount, mount wi=
th '-o index=3Doff' to override exclusive upperdir protection.
overlayfs: getxattr(12/file1, "trusted.overlay.origin", "", 0, 0) =3D -61
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
WARNING: possible circular locking dependency detected
syzkaller #0 Tainted: G             L    =20
------------------------------------------------------
syz.0.4657/23299 is trying to acquire lock:
ffff8880587977a8 (&ovl_i_lock_key[depth]){+.+.}-{4:4}, at: ovl_inode_lock_i=
nterruptible fs/overlayfs/overlayfs.h:731 [inline]
ffff8880587977a8 (&ovl_i_lock_key[depth]){+.+.}-{4:4}, at: ovl_copy_up_star=
t+0x56/0x330 fs/overlayfs/util.c:744

but task is already holding lock:
ffff888058797438 (&ovl_i_mutex_dir_key[depth]#2){++++}-{4:4}, at: inode_loc=
k include/linux/fs.h:1027 [inline]
ffff888058797438 (&ovl_i_mutex_dir_key[depth]#2){++++}-{4:4}, at: vfs_setxa=
ttr+0x12b/0x370 fs/xattr.c:343

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (&ovl_i_mutex_dir_key[depth]#2){++++}-{4:4}:
       down_read+0x45/0x320 kernel/locking/rwsem.c:1574
       inode_lock_shared include/linux/fs.h:1042 [inline]
       lookup_slow+0x46/0x80 fs/namei.c:1979
       walk_component fs/namei.c:2325 [inline]
       lookup_last fs/namei.c:2839 [inline]
       path_lookupat+0x3f5/0x8c0 fs/namei.c:2864
       filename_lookup+0x265/0x5d0 fs/namei.c:2893
       kern_path+0x3d/0x150 fs/namei.c:3087
       lookup_bdev+0xc8/0x2b0 block/bdev.c:1268
       resume_store+0x181/0x500 kernel/power/hibernate.c:1292
       kernfs_fop_write_iter+0x3a4/0x540 fs/kernfs/file.c:345
       new_sync_write fs/read_write.c:575 [inline]
       vfs_write+0x612/0xba0 fs/read_write.c:667
       ksys_write+0x150/0x270 fs/read_write.c:1016
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #3 (&of->mutex){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       kernfs_file_read_iter fs/kernfs/file.c:251 [inline]
       kernfs_fop_read_iter+0x18b/0x6a0 fs/kernfs/file.c:291
       __kernel_read+0x4ca/0x960 fs/read_write.c:512
       integrity_kernel_read+0x89/0xd0 security/integrity/iint.c:28
       ima_calc_file_hash_tfm security/integrity/ima/ima_crypto.c:222 [inli=
ne]
       ima_calc_file_hash+0x451/0x890 security/integrity/ima/ima_crypto.c:2=
80
       ima_collect_measurement+0x51b/0xa00 security/integrity/ima/ima_api.c=
:300
       process_measurement+0x1272/0x1c10 security/integrity/ima/ima_main.c:=
425
       ima_file_check+0xdc/0x130 security/integrity/ima/ima_main.c:686
       security_file_post_open+0xb3/0x260 security/security.c:2777
       do_open fs/namei.c:4959 [inline]
       path_openat+0x179e/0x20e0 fs/namei.c:5122
       do_file_open+0x23e/0x4a0 fs/namei.c:5151
       do_sys_openat2+0x115/0x200 fs/open.c:1492
       do_sys_open fs/open.c:1498 [inline]
       __do_sys_openat fs/open.c:1838 [inline]
       __se_sys_openat fs/open.c:1833 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1833
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #2 (&ima_iint_mutex_key[depth]){+.+.}-{4:4}:
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       process_measurement+0x7d0/0x1c10 security/integrity/ima/ima_main.c:3=
19
       ima_file_check+0xdc/0x130 security/integrity/ima/ima_main.c:686
       security_file_post_open+0xb3/0x260 security/security.c:2777
       do_open fs/namei.c:4959 [inline]
       path_openat+0x179e/0x20e0 fs/namei.c:5122
       do_file_open+0x23e/0x4a0 fs/namei.c:5151
       do_sys_openat2+0x115/0x200 fs/open.c:1492
       do_sys_open fs/open.c:1498 [inline]
       __do_sys_openat fs/open.c:1838 [inline]
       __se_sys_openat fs/open.c:1833 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1833
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (sb_writers#5){.+.+}-{0:0}:
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read_freezable include/linux/percpu-rwsem.h:83 [inline]
       __sb_start_write include/linux/fs/super.h:19 [inline]
       sb_start_write include/linux/fs/super.h:125 [inline]
       ovl_start_write+0x115/0x290 fs/overlayfs/util.c:32
       ovl_do_copy_up fs/overlayfs/copy_up.c:992 [inline]
       ovl_copy_up_one fs/overlayfs/copy_up.c:1221 [inline]
       ovl_copy_up_flags+0xe90/0x3890 fs/overlayfs/copy_up.c:1275
       ovl_fileattr_set+0x204/0x580 fs/overlayfs/inode.c:669
       vfs_fileattr_set+0xa2b/0xd10 fs/file_attr.c:306
       ioctl_fssetxattr+0x349/0x3b0 fs/file_attr.c:372
       do_vfs_ioctl+0x914/0x15a0 fs/ioctl.c:573
       __do_sys_ioctl fs/ioctl.c:602 [inline]
       __se_sys_ioctl+0x82/0x170 fs/ioctl.c:590
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&ovl_i_lock_key[depth]){+.+.}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3209 [inline]
       check_prevs_add kernel/locking/lockdep.c:3328 [inline]
       validate_chain kernel/locking/lockdep.c:3952 [inline]
       __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
       lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
       __mutex_lock_common kernel/locking/mutex.c:646 [inline]
       __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
       ovl_inode_lock_interruptible fs/overlayfs/overlayfs.h:731 [inline]
       ovl_copy_up_start+0x56/0x330 fs/overlayfs/util.c:744
       ovl_copy_up_one fs/overlayfs/copy_up.c:1214 [inline]
       ovl_copy_up_flags+0xaf7/0x3890 fs/overlayfs/copy_up.c:1275
       ovl_xattr_set+0x395/0x5e0 fs/overlayfs/xattrs.c:54
       __vfs_setxattr+0x442/0x480 fs/xattr.c:223
       __vfs_setxattr_noperm+0x12a/0x660 fs/xattr.c:257
       vfs_setxattr+0x151/0x370 fs/xattr.c:344
       do_setxattr fs/xattr.c:662 [inline]
       filename_setxattr+0x296/0x630 fs/xattr.c:690
       path_setxattrat+0x408/0x450 fs/xattr.c:734
       __do_sys_lsetxattr fs/xattr.c:775 [inline]
       __se_sys_lsetxattr fs/xattr.c:771 [inline]
       __x64_sys_lsetxattr+0xbf/0xe0 fs/xattr.c:771
       do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
       do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

other info that might help us debug this:

Chain exists of:
  &ovl_i_lock_key[depth] --> &of->mutex --> &ovl_i_mutex_dir_key[depth]#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&ovl_i_mutex_dir_key[depth]#2);
                               lock(&of->mutex);
                               lock(&ovl_i_mutex_dir_key[depth]#2);
  lock(&ovl_i_lock_key[depth]);

 *** DEADLOCK ***

locks held by syz.0.4657/23299: 2, on CPU#0:
 #0: ffff888035472478 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/=
0x90 fs/namespace.c:534
 #1: ffff888058797438 (&ovl_i_mutex_dir_key[depth]#2){++++}-{4:4}, at: inod=
e_lock include/linux/fs.h:1027 [inline]
 #1: ffff888058797438 (&ovl_i_mutex_dir_key[depth]#2){++++}-{4:4}, at: vfs_=
setxattr+0x12b/0x370 fs/xattr.c:343

stack backtrace:
CPU: 0 UID: 0 PID: 23299 Comm: syz.0.4657 Tainted: G             L      syz=
kaller #0 PREEMPT(full)=20
Tainted: [L]=3DSOFTLOCKUP
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Goo=
gle 11/06/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_circular_bug+0x2e2/0x300 kernel/locking/lockdep.c:2087
 check_noncircular+0x12f/0x150 kernel/locking/lockdep.c:2219
 check_prev_add kernel/locking/lockdep.c:3209 [inline]
 check_prevs_add kernel/locking/lockdep.c:3328 [inline]
 validate_chain kernel/locking/lockdep.c:3952 [inline]
 __lock_acquire+0x164c/0x2de0 kernel/locking/lockdep.c:5288
 lock_acquire+0x115/0x350 kernel/locking/lockdep.c:5942
 __mutex_lock_common kernel/locking/mutex.c:646 [inline]
 __mutex_lock+0x197/0x15a0 kernel/locking/mutex.c:821
 ovl_inode_lock_interruptible fs/overlayfs/overlayfs.h:731 [inline]
 ovl_copy_up_start+0x56/0x330 fs/overlayfs/util.c:744
 ovl_copy_up_one fs/overlayfs/copy_up.c:1214 [inline]
 ovl_copy_up_flags+0xaf7/0x3890 fs/overlayfs/copy_up.c:1275
 ovl_xattr_set+0x395/0x5e0 fs/overlayfs/xattrs.c:54
 __vfs_setxattr+0x442/0x480 fs/xattr.c:223
 __vfs_setxattr_noperm+0x12a/0x660 fs/xattr.c:257
 vfs_setxattr+0x151/0x370 fs/xattr.c:344
 do_setxattr fs/xattr.c:662 [inline]
 filename_setxattr+0x296/0x630 fs/xattr.c:690
 path_setxattrat+0x408/0x450 fs/xattr.c:734
 __do_sys_lsetxattr fs/xattr.c:775 [inline]
 __se_sys_lsetxattr fs/xattr.c:771 [inline]
 __x64_sys_lsetxattr+0xbf/0xe0 fs/xattr.c:771
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x171/0x540 arch/x86/entry/syscall_64.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x00007f47a49a94d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 =
48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff f=
f 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f47a5807028 EFLAGS: 00000246 ORIG_RAX: 00000000000000bd
RAX: ffffffffffffffda RBX: 00007f47a4c25fa0 RCX: 00007f47a49a94d9
RDX: 0000000000000000 RSI: 0000200000000380 RDI: 0000200000000340
RBP: 00007f47a4a3804e R08: 0000000000000002 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f47a4c26038 R14: 00007f47a4c25fa0 R15: 00007ffc5b6de328
 </TASK>
overlayfs: setxattr(12/file0, "trusted.overlay.impure", "y", 1, 0) =3D 0
overlayfs: mkdir(index/#5d, 040000)
overlayfs: ...mkdir =3D 0
overlayfs: setxattr(index/#5d, "trusted.overlay.origin", "\0=EF=BF=BD!\0\00=
12=EF=BF=BD,=EF=BF=BD\023dO<\202\024=EF=BF=BD(4xI+=EF=BF=BD=EF=BF=BD=EF=BF=
=BD\202V\0\0\0\0\0\0\0", 33, 0) =3D 0
overlayfs: rename(index/#5d, file0/file1, 0x0)
overlayfs: setxattr(file0/file1, "trusted.upperdir", "", 0, 2) =3D -61
kcov: kcov_task_exit: t =3D ffff888029733e80, kcov->t =3D ffff888029733e80
ffff888029b44000 name hci5 bus 0
hci5: Updating devcoredump state from IDLE to IDLE.
hci5: err 0x13
hci5 ffff888029b44000
hci5:=20
hci5: err 0x13
hci5: cancelling interleave scan
All LE pending actions cleared
hdev hci5
hcon ffff888037a84000 reason 22
hcon ffff888037a84000 conn ffff888037a0a800, err 103
hci5 hcon ffff888037a84000 chan ffff888077237700
hci5 hcon ffff888037a84000 handle 200
hci5: hcon ffff888037a84000
hcon ffff888037a84000
hci5: conn ffff888037a84000
device: 'hci5:200': device_unregister
kernfs runtime_status: removing
kernfs control: removing
kernfs runtime_suspended_time: removing
kernfs runtime_active_time: removing
kernfs autosuspend_delay_ms: removing
kernfs power: removing
kernfs device: removing
kernfs subsystem: removing
kernfs hci5:200: removing
kernfs uevent: removing
PM: Removing info for No Bus:hci5:200
kobject: 'hci5:200' (ffff888037a84cf8): kobject_uevent_env
kobject: 'hci5:200' (ffff888037a84cf8): fill_kobj_path: path =3D '/devices/=
virtual/bluetooth/hci5/hci5:200'
kernfs hci5:200: removing
kobject: 'hci5:200' (ffff888037a84cf8): kobject_cleanup, parent 00000000000=
00000
kobject: 'hci5:200' (ffff888037a84cf8): calling ktype release
kobject: 'hci5:200': free name
hci5 orig refcnt 11
hcon ffff88807cc40000 reason 22
hcon ffff88807cc40000 conn ffff888037a0f000, err 103
hci5 hcon ffff88807cc40000 chan ffff8880597fe100
hci5 hcon ffff88807cc40000 handle 201
hci5: hcon ffff88807cc40000
hcon ffff88807cc40000
hci5: conn ffff88807cc40000
device: 'hci5:201': device_unregister
kernfs runtime_status: removing
kernfs control: removing
kernfs runtime_suspended_time: removing
kernfs runtime_active_time: removing
kernfs autosuspend_delay_ms: removing
kernfs power: removing
kernfs device: removing
kernfs subsystem: removing
kernfs hci5:201: removing
kernfs uevent: removing
PM: Removing info for No Bus:hci5:201
kobject: 'hci5:201' (ffff88807cc40cf8): kobject_uevent_env
kobject: 'hci5:201' (ffff88807cc40cf8): fill_kobj_path: path =3D '/devices/=
virtual/bluetooth/hci5/hci5:201'
kernfs hci5:201: removing
kobject: 'hci5:201' (ffff88807cc40cf8): kobject_cleanup, parent 00000000000=
00000
kobject: 'hci5:201' (ffff88807cc40cf8): calling ktype release
kobject: 'hci5:201': free name
hci5 orig refcnt 7
hdev hci5 event 4
hdev 0000000000000000 len 8
hci5: Cleanup of MSFT extension
hdev hci5 event 8
hci5 orig refcnt 6
channel 3 len 6
channel 3 len 8
hdev hci5 event 2
hdev 0000000000000000 len 8
kernfs runtime_status: removing
kernfs control: removing
kernfs runtime_suspended_time: removing
kernfs runtime_active_time: removing
kernfs autosuspend_delay_ms: removing
kernfs power: removing
kernfs device: removing
kernfs subsystem: removing
kernfs rfkill88: removing
kernfs uevent: removing
kernfs name: removing
kernfs type: removing
kernfs index: removing
kernfs persistent: removing
kernfs state: removing
kernfs soft: removing
kernfs hard: removing
kernfs hard_block_reasons: removing
PM: Removing info for No Bus:rfkill88
kobject: 'rfkill88' (ffff88802cb86118): kobject_uevent_env
kobject: 'rfkill88' (ffff88802cb86118): fill_kobj_path: path =3D '/devices/=
virtual/bluetooth/hci5/rfkill88'
kernfs rfkill88: removing
kobject: 'rfkill88' (ffff88802cb86118): kobject_cleanup, parent 00000000000=
00000
kobject: 'rfkill88' (ffff88802cb86118): calling ktype release
kobject: 'rfkill88': free name
kernfs runtime_status: removing
kernfs control: removing
kernfs runtime_suspended_time: removing
kernfs runtime_active_time: removing
kernfs autosuspend_delay_ms: removing
kernfs power: removing
kernfs subsystem: removing
kernfs hci5: removing
kernfs uevent: removing
kernfs reset: removing
PM: Removing info for No Bus:hci5
kobject: 'hci5' (ffff888029b455d8): kobject_uevent_env
kobject: 'hci5' (ffff888029b455d8): fill_kobj_path: path =3D '/devices/virt=
ual/bluetooth/hci5'
kernfs hci5: removing
hci5 orig refcnt 2
kobject: 'hci5' (ffff888029b455d8): kobject_cleanup, parent 000000000000000=
0
kobject: 'hci5' (ffff888029b455d8): calling ktype release
All LE connection parameters were removed
hci5: Unregister MSFT extension
kobject: 'hci5': free name
syz_tun: bond_netdev_event received NETDEV_GOING_DOWN
net syz_tun: siw: event 10
In tnode_resize ffff888022f14120 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff888058988020 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff888067c91820 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff888051684520 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff88807d0908a0 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff88804393b1a0 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff88802af88420 inflate_threshold=3D50 threshold=3D25
trie_flush found=3D1
In tnode_resize ffff888022f14120 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff888058988020 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff888067c91820 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff888051684520 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff88807d0908a0 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff88804393b1a0 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff88802af88420 inflate_threshold=3D50 threshold=3D25
trie_flush found=3D1
IPv6: walker ffffc90003727140 adjusted by unlink of ffff88803831b000
IPv6: walker ffffc90003727140 adjusted by unlink of ffff88803ba18000
IPv6: walker ffffc90003727140 adjusted by unlink of ffff888039a5f800
IPv6: fixing tree: plen=3D128 iter=3D0
IPv6: W ffffc90003727140 adjusted by delnode 1, s=3D4/2
IPv6: fixing tree: plen=3D120 iter=3D1
IPv6: W ffffc90003727140 adjusted by delnode 2, s=3D2
IPv6: fixing tree: plen=3D97 iter=3D2
IPv6: walker ffffc90003727140 adjusted by unlink of ffff88803ba18400
IPv6: fixing tree: plen=3D128 iter=3D0
IPv6: W ffffc90003727140 adjusted by delnode 1, s=3D4/2
IPv6: fixing tree: plen=3D120 iter=3D1
IPv6: W ffffc90003727140 adjusted by delnode 2, s=3D2
IPv6: fixing tree: plen=3D73 iter=3D2
IPv6: walker ffffc90003727140 adjusted by unlink of ffff88803ba18800
syz_tun: bond_netdev_event received NETDEV_DOWN
net syz_tun: siw: event 2
Deleting ac141400/24 dsfield=3D0x00 t=3Dffff88803002c6b8
Deleting ac1414ff/32 dsfield=3D0x00 t=3Dffff88803002c6b8
Deleting ac1414aa/32 dsfield=3D0x00 t=3Dffff88803002c6b8
In tnode_resize ffff888051684520 inflate_threshold=3D50 threshold=3D25
In tnode_resize ffff88802af88420 inflate_threshold=3D50 threshold=3D25
syz_tun (unregistering): bond_netdev_event received NETDEV_UNREGISTER
net syz_tun: siw: event 6
syz_tun (unregistering): bond_netdev_event received NETDEV_PRE_UNINIT
net syz_tun: siw: event 18
kernfs rps_cpus: removing
kernfs rps_flow_cnt: removing
kobject: 'rx-0' (ffff888059944c50): kobject_cleanup, parent ffff888013a47b5=
0
kobject: 'rx-0' (ffff888059944c50): auto cleanup kobject_del
kobject: 'rx-0' (ffff888059944c50): auto cleanup 'remove' event
kobject: 'rx-0' (ffff888059944c50): kobject_uevent_env
kobject: 'rx-0' (ffff888059944c50): fill_kobj_path: path =3D '/devices/virt=
ual/net/syz_tun/queues/rx-0'
kernfs rx-0: removing
kobject: 'rx-0' (ffff888059944c50): calling ktype release
kobject: 'rx-0': free name
kernfs tx_timeout: removing
kernfs traffic_class: removing
kernfs xps_cpus: removing
kernfs xps_rxqs: removing
kernfs tx_maxrate: removing
kobject: 'tx-0' (ffff888050658420): kobject_cleanup, parent ffff888013a47b5=
0
kobject: 'tx-0' (ffff888050658420): auto cleanup kobject_del
kobject: 'tx-0' (ffff888050658420): auto cleanup 'remove' event
kobject: 'tx-0' (ffff888050658420): kobject_uevent_env
kobject: 'tx-0' (ffff888050658420): fill_kobj_path: path =3D '/devices/virt=
ual/net/syz_tun/queues/tx-0'
kernfs tx-0: removing
kobject: 'tx-0' (ffff888050658420): calling ktype release
kobject: 'tx-0': free name
kernfs queues: removing
kobject: 'queues' (ffff888013a47b50): kobject_cleanup, parent 0000000000000=
000
kobject: 'queues' (ffff888013a47b50): calling ktype release
kobject: 'queues' (ffff888013a47b50): kset_release
kobject: 'queues': free name
kernfs runtime_status: removing
kernfs control: removing
kernfs runtime_suspended_time: removing
kernfs runtime_active_time: removing
kernfs autosuspend_delay_ms: removing
kernfs power: removing
kernfs subsystem: removing
kernfs syz_tun: removing
kernfs uevent: removing
kernfs tun_flags: removing
kernfs owner: removing
kernfs group: removing
kernfs rx_packets: removing
kernfs tx_packets: removing
kernfs rx_bytes: removing
kernfs tx_bytes: removing
kernfs rx_errors: removing
kernfs tx_errors: removing
kernfs rx_dropped: removing
kernfs tx_dropped: removing
kernfs multicast: removing
kernfs collisions: removing
kernfs rx_length_errors: removing
kernfs rx_over_errors: removing
kernfs rx_crc_errors: removing
kernfs rx_frame_errors: removing
kernfs rx_fifo_errors: removing
kernfs rx_missed_errors: removing
kernfs tx_aborted_errors: removing
kernfs tx_carrier_errors: removing
kernfs tx_fifo_errors: removing
kernfs tx_heartbeat_errors: removing
kernfs tx_window_errors: removing
kernfs rx_compressed: removing
kernfs tx_compressed: removing
kernfs rx_nohandler: removing
kernfs statistics: removing
kernfs netdev_group: removing
kernfs type: removing
kernfs dev_id: removing
kernfs dev_port: removing
kernfs iflink: removing
kernfs ifindex: removing
kernfs name_assign_type: removing
kernfs addr_assign_type: removing
kernfs addr_len: removing
kernfs link_mode: removing
kernfs address: removing
kernfs broadcast: removing
kernfs speed: removing
kernfs duplex: removing
kernfs dormant: removing
kernfs testing: removing
kernfs operstate: removing
kernfs carrier_changes: removing
kernfs ifalias: removing
kernfs carrier: removing
kernfs mtu: removing
kernfs flags: removing
kernfs tx_queue_len: removing
kernfs gro_flush_timeout: removing
kernfs napi_defer_hard_irqs: removing
kernfs proto_down: removing
kernfs carrier_up_count: removing
kernfs carrier_down_count: removing
kernfs threaded: removing
PM: Removing info for No Bus:syz_tun
kobject: 'syz_tun' (ffff888037e107e0): kobject_uevent_env
kobject: 'syz_tun' (ffff888037e107e0): fill_kobj_path: path =3D '/devices/v=
irtual/net/syz_tun'
kernfs syz_tun: removing
kobject: 'syz_tun' (ffff888037e107e0): kobject_cleanup, parent 000000000000=
0000
kobject: 'syz_tun' (ffff888037e107e0): calling ktype release
kobject: 'syz_tun': free name


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
