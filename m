Received: from mail-oo1-f78.google.com (mail-oo1-f78.google.com [209.85.161.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E5CB1E7C02
	for <driver-core@lists.linux.dev>; Mon, 14 Sep 2026 00:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789347033; cv=none; b=djCbOu7cdFp3K24lNhY/vzzV7/SMNs5UMZGOtT9t1nqsGLauwLuawodK/lyi5YE+GpASbfRYAa1RgaXm0NR/0+cKCTmi/s7+lWg+4MENSFqID0/4qN5g88L3txY2WFFRHxJCffd2Ee73d6WaUW9DG3hUyEiABvi1uAROZnsSax8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789347033; c=relaxed/simple;
	bh=N8Sj/46xOrd4MmG2zyzsVbynJnFJeSzEyp6wiD1izVU=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=ryYO2L2sJxm/rHXCM9ugCxL+g/zBXja558AdcaZTazEIGSAY9xMePruvhfARnxdo4SihdJ97K9cQFotezhEo02R3Cqbi+UQpWJ0Wf4KDHo4ECKfZZaSl5g9uTt9tGx5jdRDRKXbEQ/i2uM2vUfVdVqTq+FSy8MfmQyezj6esRIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f78.google.com with SMTP id 006d021491bc7-6c18e7d53b9so3189506eaf.1
        for <driver-core@lists.linux.dev>; Sun, 13 Sep 2026 17:50:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789347030; x=1789951830;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mRRM5dshULzfbwZ3jlw5DrysetDGvPOIjZm8NVz77HY=;
        b=YnybBjM7DuGCoueZ+ZwcEGU3rcm4cYJckIvdcaJefYheuNS/ic6VJyyJAoY4NPmC+p
         lM1dJnR1K1F+1yyAGSoLEonUhQ/77kJ4N/28TEvL14CDM2he3xCOQAN+U/sqMMukSmSe
         9j4o4a6hcGkW+7Dvn2Y0O9PK8KjkMcMf92Ed1V488c7ixhCie4ZEKqUgC9FwgNrUBHek
         K64Mq/YJyVEMJH0Lohp1GDqy+iDXTQHP38BLPeGjOYfuNRcfdffaIL1WWwR+QrMVvJOP
         9hfmgxXTkkGkyqrUZCbziwccheeIFQpCAW8ocNrbwMdMV0OG/zc8u92O1TF+gD1OI2ig
         RMSA==
X-Forwarded-Encrypted: i=1; AKwUvByvGWFyEVDyLFbzI8YxtrM3Ia1QvjR8yPIZVxdy56iKub6y/9pRd5LC3ZEJJ0UDuFhGNB6B0YVzKhZ+PQ==@lists.linux.dev
X-Gm-Message-State: AFuF++l95ALhtXXfzAKF+mLwlKb8JK1La64PsPTedmms4olYql/zHq4b
	R1Rok/8oL5WXt/StLNK66zgaBfxjklMLJhXfmznXHd9faVZ097zBgTnN6VUxrpy7L18jjoD3NPS
	xinSQqCPNn6kmX3xtrvXsoDOEZJDpc0884v9ICSKMKLLmuhsxjaNv710hLMM=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:c8d:b0:6c3:a421:5a97 with SMTP id
 006d021491bc7-6c3cc7004camr1591591eaf.7.1789347030503; Sun, 13 Sep 2026
 17:50:30 -0700 (PDT)
Date: Sun, 13 Sep 2026 17:50:30 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aa744d6.a211d2ce.1a5198.0285.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: slab-use-after-free Read in remove_one_compat_dev
From: syzbot <syzbot+7db35adbc02c5b86d4e0@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5445d6419962 arm64: Don't read GMID_EL1 when MTE is disabled
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13c87615580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56ed23170c168d4c
dashboard link: https://syzkaller.appspot.com/bug?extid=7db35adbc02c5b86d4e0
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: arm64

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e8b70e3bd109/disk-5445d641.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e5227e56ac93/vmlinux-5445d641.xz
kernel image: https://storage.googleapis.com/syzbot-assets/54905f78be59/Image-5445d641.gz.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7db35adbc02c5b86d4e0@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in kobject_uevent_net_broadcast+0x110/0x53c lib/kobject_uevent.c:415
Read of size 8 at addr ffff0000f621ced0 by task kworker/u8:17/6617

CPU: 0 UID: 0 PID: 6617 Comm: kworker/u8:17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/14/2026
Workqueue: ib-unreg-wq ib_unregister_work
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:499 (C)
 __dump_stack+0x30/0x40 lib/dump_stack.c:94
 dump_stack_lvl+0xd8/0x12c lib/dump_stack.c:120
 print_address_description+0xb0/0x238 mm/kasan/report.c:378
 print_report+0x68/0x84 mm/kasan/report.c:482
 kasan_report+0x8c/0xc4 mm/kasan/report.c:595
 __asan_report_load8_noabort+0x20/0x2c mm/kasan/report_generic.c:381
 kobject_uevent_net_broadcast+0x110/0x53c lib/kobject_uevent.c:415
 kobject_uevent_env+0x518/0x944 lib/kobject_uevent.c:611
 kobject_uevent+0x2c/0x3c lib/kobject_uevent.c:659
 device_del+0x5f8/0x71c drivers/base/core.c:3983
 remove_one_compat_dev+0x5c/0x7c drivers/infiniband/core/device.c:1036
 remove_compat_devs drivers/infiniband/core/device.c:1047 [inline]
 disable_device+0x184/0x240 drivers/infiniband/core/device.c:1339
 __ib_unregister_device+0x214/0x33c drivers/infiniband/core/device.c:1571
 ib_unregister_work+0x20/0x38 drivers/infiniband/core/device.c:1683
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3470
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3551
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838

Allocated by task 7081:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_alloc_info+0x40/0x50 mm/kasan/generic.c:570
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x9c/0xb4 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x2f4/0x5fc mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 uevent_net_init+0xcc/0x2a0 lib/kobject_uevent.c:782
 ops_init+0x2cc/0x528 net/core/net_namespace.c:137
 setup_net+0x118/0x2fc net/core/net_namespace.c:443
 copy_net_ns+0x454/0x698 net/core/net_namespace.c:582
 create_new_namespaces+0x304/0x50c kernel/nsproxy.c:132
 copy_namespaces+0x3fc/0x474 kernel/nsproxy.c:195
 copy_process+0x177c/0x332c kernel/fork.c:2310
 kernel_clone+0x234/0x9fc kernel/fork.c:2766
 __do_sys_clone kernel/fork.c:2908 [inline]
 __se_sys_clone kernel/fork.c:2876 [inline]
 __arm64_sys_clone+0x168/0x1d4 kernel/fork.c:2876
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x244 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0xec/0x23c arch/arm64/kernel/syscall.c:121
 do_el0_svc+0x4c/0x5c arch/arm64/kernel/syscall.c:140
 el0_svc+0x64/0x260 arch/arm64/kernel/entry-common.c:758
 el0t_64_sync_handler+0x44/0x104 arch/arm64/kernel/entry-common.c:777
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:590

Freed by task 13:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:78
 kasan_save_free_info+0x54/0x6c mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x74/0xa4 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x188/0x698 mm/slub.c:6792
 uevent_net_exit+0x1b0/0x1cc lib/kobject_uevent.c:816
 ops_exit_list net/core/net_namespace.c:200 [inline]
 ops_undo_list+0x3cc/0x81c net/core/net_namespace.c:253
 cleanup_net+0x474/0x6c4 net/core/net_namespace.c:706
 process_one_work kernel/workqueue.c:3387 [inline]
 process_scheduled_works+0x91c/0x1250 kernel/workqueue.c:3470
 worker_thread+0x798/0xbd0 kernel/workqueue.c:3551
 kthread+0x304/0x3d4 kernel/kthread.c:436
 ret_from_fork+0x10/0x20 arch/arm64/kernel/entry.S:838

The buggy address belongs to the object at ffff0000f621cec0
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 16 bytes inside of
 freed 32-byte region [ffff0000f621cec0, ffff0000f621cee0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff0000f621ca40 pfn:0x13621c
flags: 0x5ffc00000000200(workingset|node=0|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 05ffc00000000200 ffff0000c0001780 fffffdffc3334710 fffffdffc346e790
raw: ffff0000f621ca40 0000000000400039 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff0000f621cd80: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
 ffff0000f621ce00: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>ffff0000f621ce80: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
                                                 ^
 ffff0000f621cf00: 00 00 00 fc fc fc fc fc 00 00 00 fc fc fc fc fc
 ffff0000f621cf80: fa fb fb fb fc fc fc fc 00 00 00 fc fc fc fc fc
==================================================================


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
