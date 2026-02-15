Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBBC91B7F4
	for <driver-core@lists.linux.dev>; Sun, 15 Feb 2026 05:42:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771134144; cv=none; b=ha8ooTeGtBkn3LQpTbVc0ikGGECmICGvY0RcKqlSzl+olWlMLvt8TBPZqEVkpmLXU5OPHMHLCRiz2tp1xhMNHjOUEynsHu36oDU8Jwq3AtM52ZiFJ4eVj68XwmPdGk/n+0BjmrkCQ48M3ixs0M5RvNEeA3+XviG9R5c8c5QusQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771134144; c=relaxed/simple;
	bh=MzyqnMDKNx/HANQvDwSq8pqIhkvw5nwaf3bUX133VkQ=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=nfZ4E7hmZe+dX/niNb24k/6pBHA9wCmWjjY0DnnxWHW57+vzl1Y0pDVCRNeKo+amq5eXqZXDv3hxIQ2Oj37aqs35Rnwbbicwl4IkfF357GAqQQ3naLUWBCLLAqm3hhjOaRZRnHyH/6Lr7YGAJe2o1kRrB9GjKgngi+qW5xM5SwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-678e130a87fso10835370eaf.3
        for <driver-core@lists.linux.dev>; Sat, 14 Feb 2026 21:42:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771134142; x=1771738942;
        h=to:from:subject:message-id:date:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CoQ/Ap6BVtRhVNflygAxI5dfzW7LzJ9IDoOS60zUKUw=;
        b=CvNnP96o7iVqNnBYkyh0Htam0GhuKFUp1eAGn4CLdm5dSHAGG5WAZHvwMLCfgRio7f
         mNabV7eiKhkOIytWsdWYcvrI/WMcDCB9X5lYpYgEl9rfejIVHGk71/BcJJ/jmaGSfPKq
         pXD/CuaAcXuw/KbF/UrmTa0/9pfuQcmYaen6Z6p2WHc+5Oqns7T27EGqSYM58sX5of+g
         Dm9e9LHRHY4tKgZXTyrgdMhl1FxK+lMsOhk0mT3DFf1EpngtCgy4LqCZSq72F8SM3xBB
         uQKQ7NymrN/BtoO7lWIK4tctW8NhujnVv4NJJBlE8t2MJYE6L/pCnNqAVc2fmmpb1d2Q
         hnKw==
X-Gm-Message-State: AOJu0Yw8VLVp3DybSNkeBU72UhTF2XwB/Q633KzYC8nBZY+aaB9rFTPd
	KznU7LaCb3seW9yXcfvwmdLsYzWNq7R1Y2Z+YM5mBl0U4jCdSrBvrtPvHm/eXO7zfmymt/EDM3P
	c/RAmU3zwsEleUnZk7rpn7BHygMGB3uF6abL4WwYlLNG8kqHxCEUQ03K/vwQ=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2207:b0:66e:3015:ca58 with SMTP id
 006d021491bc7-67720560a92mr3708322eaf.18.1771134141966; Sat, 14 Feb 2026
 21:42:21 -0800 (PST)
Date: Sat, 14 Feb 2026 21:42:21 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69915cbd.050a0220.2757fb.002f.GAE@google.com>
Subject: [syzbot] [kernfs?] KMSAN: uninit-value in inode_set_ctime_to_ts
From: syzbot <syzbot+e2fd93a2773af7f9ea51@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    cd7a5651db26 alpha: add missing address argument in call t..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1037415a580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=50148b563a4d5941
dashboard link: https://syzkaller.appspot.com/bug?extid=e2fd93a2773af7f9ea51
compiler:       Debian clang version 21.1.8 (++20251221033036+2078da43e25a-1~exp1~20251221153213.50), Debian LLD 21.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/23c623fcb1bf/disk-cd7a5651.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5128bb44f38d/vmlinux-cd7a5651.xz
kernel image: https://storage.googleapis.com/syzbot-assets/a65d6b263e08/bzImage-cd7a5651.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e2fd93a2773af7f9ea51@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in inode_set_ctime_to_ts+0x1eb/0x3a0 fs/inode.c:2777
 inode_set_ctime_to_ts+0x1eb/0x3a0 fs/inode.c:2777
 inode_set_ctime_current+0x646/0x1690 fs/inode.c:2842
 simple_inode_init_ts+0x43/0x180 fs/libfs.c:2133
 set_default_inode_attr fs/kernfs/inode.c:155 [inline]
 kernfs_init_inode fs/kernfs/inode.c:209 [inline]
 kernfs_get_inode+0x23a/0xb60 fs/kernfs/inode.c:255
 kernfs_iop_lookup+0x2ff/0x600 fs/kernfs/dir.c:1241
 __lookup_slow+0x56a/0x770 fs/namei.c:1916
 lookup_slow+0x6a/0xd0 fs/namei.c:1933
 walk_component fs/namei.c:2279 [inline]
 link_path_walk+0x170f/0x2650 fs/namei.c:2647
 path_lookupat+0x107/0xdf0 fs/namei.c:2803
 filename_lookup+0x2bc/0x800 fs/namei.c:2833
 vfs_statx+0xcf/0x290 fs/stat.c:353
 vfs_fstatat+0x2dc/0x400 fs/stat.c:373
 __do_sys_newfstatat fs/stat.c:538 [inline]
 __se_sys_newfstatat+0x64/0x870 fs/stat.c:532
 __x64_sys_newfstatat+0xbd/0x120 fs/stat.c:532
 x64_sys_call+0x3824/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:263
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 inode_set_ctime_to_ts+0x1e4/0x3a0 fs/inode.c:2777
 inode_set_ctime_current+0x646/0x1690 fs/inode.c:2842
 simple_inode_init_ts+0x43/0x180 fs/libfs.c:2133
 set_default_inode_attr fs/kernfs/inode.c:155 [inline]
 kernfs_init_inode fs/kernfs/inode.c:209 [inline]
 kernfs_get_inode+0x23a/0xb60 fs/kernfs/inode.c:255
 kernfs_iop_lookup+0x2ff/0x600 fs/kernfs/dir.c:1241
 __lookup_slow+0x56a/0x770 fs/namei.c:1916
 lookup_slow+0x6a/0xd0 fs/namei.c:1933
 walk_component fs/namei.c:2279 [inline]
 link_path_walk+0x170f/0x2650 fs/namei.c:2647
 path_lookupat+0x107/0xdf0 fs/namei.c:2803
 filename_lookup+0x2bc/0x800 fs/namei.c:2833
 vfs_statx+0xcf/0x290 fs/stat.c:353
 vfs_fstatat+0x2dc/0x400 fs/stat.c:373
 __do_sys_newfstatat fs/stat.c:538 [inline]
 __se_sys_newfstatat+0x64/0x870 fs/stat.c:532
 __x64_sys_newfstatat+0xbd/0x120 fs/stat.c:532
 x64_sys_call+0x3824/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:263
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Uninit was stored to memory at:
 inode_set_ctime_to_ts+0x19f/0x3a0 fs/inode.c:-1
 inode_set_ctime_current+0x646/0x1690 fs/inode.c:2842
 simple_inode_init_ts+0x43/0x180 fs/libfs.c:2133
 set_default_inode_attr fs/kernfs/inode.c:155 [inline]
 kernfs_init_inode fs/kernfs/inode.c:209 [inline]
 kernfs_get_inode+0x23a/0xb60 fs/kernfs/inode.c:255
 kernfs_iop_lookup+0x2ff/0x600 fs/kernfs/dir.c:1241
 __lookup_slow+0x56a/0x770 fs/namei.c:1916
 lookup_slow+0x6a/0xd0 fs/namei.c:1933
 walk_component fs/namei.c:2279 [inline]
 link_path_walk+0x170f/0x2650 fs/namei.c:2647
 path_lookupat+0x107/0xdf0 fs/namei.c:2803
 filename_lookup+0x2bc/0x800 fs/namei.c:2833
 vfs_statx+0xcf/0x290 fs/stat.c:353
 vfs_fstatat+0x2dc/0x400 fs/stat.c:373
 __do_sys_newfstatat fs/stat.c:538 [inline]
 __se_sys_newfstatat+0x64/0x870 fs/stat.c:532
 __x64_sys_newfstatat+0xbd/0x120 fs/stat.c:532
 x64_sys_call+0x3824/0x3ea0 arch/x86/include/generated/asm/syscalls_64.h:263
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0x134/0xf80 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable retval created at:
 inode_set_ctime_current+0x3b/0x1690 fs/inode.c:2833
 simple_inode_init_ts+0x43/0x180 fs/libfs.c:2133

CPU: 0 UID: 0 PID: 5142 Comm: udevadm Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2026
=====================================================


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
