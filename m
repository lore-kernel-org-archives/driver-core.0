Received: from mail-oo1-f80.google.com (mail-oo1-f80.google.com [209.85.161.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A58AE272E6D
	for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 02:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786935515; cv=none; b=mnCqDF5x6qYGfN393tPx9M8r/klGyxFtEAXG1NzyV46wUUxB8nem8YwbClUnISb5e6wmz7ACyKaM388Ndss4QVWqPGzIU0N4RQ161A48D2FMlrzFCKwXQ6hzpG7hbVI7NCQfyR+pS+mCblf5Hxq2XC4Qz8B/TUFl+S955Y1VBrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786935515; c=relaxed/simple;
	bh=Im5bKDGdWdK58cOUdZIBLWB9Xnrn4oafP6uQ4FqytMg=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=rEmQuxlzBBHVlKHnd6bxkW3aLSLTvJgfSqIEFknaI55TWHKvnZW1816hAhVe8RZpsi753HuQgTxtc7XMOZtdrHS6S0TTBKjJyjis3RRVkz9gCtjD8CRwTZmOvsP3eB7ZTcJgVnrlEVCA/qEZeIAluRMrMJddjZEIOUrG4x2H5UM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f80.google.com with SMTP id 006d021491bc7-6aca189b5a9so2694834eaf.0
        for <driver-core@lists.linux.dev>; Sun, 16 Aug 2026 19:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786935512; x=1787540312;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XCSZP/1LVTJiQKs2DQ4Ek3pmmtf6ojeIfOI4bKrApIM=;
        b=m1kPO/HIYSeeirjkmZ1rK/+hNXd3pZoTvsfgXbEF4eSdUN8LaaNPw/CZzeAmaY0YOr
         2qk+K3ba62IvNBIh3W38b4dx/b5f+lcuK14g8ychGuNoz4EgqxMSm9/Hyiqqb816+38h
         rZkAoHgyapTfan3btRs0SQu75lXSd6nub2ZuDaL7O0MbA6QrIvSmY4Qjbq5ddxSao3ye
         eF3SWd+WvhjOXqXlPhIlTPK0cbFS9UYccQhmkRmnQMa5fEo0H9ONbXnZ5kc6UIPMDD8K
         +2NfabWz7gPBEWqS69rVDHP2NuNsvZSLpfv0praw5vix20SfzREMYxyv14z1anY1Jc3u
         jYfA==
X-Forwarded-Encrypted: i=1; AHgh+RqFxCVNxMz0R0T+xUXyBxUjInQW8bhrpPSb4qJoNKUJLMJBnOhlDSMsBpdcgpwKdIG4j9Bsm9nhWhg5GQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwMGyhIVS5FIqzofUWJ1kJ1JazNNJrgFhDFqkpC3+7diTzQPNjm
	/wdNunBFKk72X7cxLEmXiLZMW+P2L3gJGZGpBXMOJ7+rjhCuoXWiCz+Rm6HM0lNongEe7NuN6rF
	d8p6uqEQQTVWOAg0lNKC7y6LzrcecxhBE1ibJXTRRNk9uJlrA5rXAmdzW+Nw=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:16a7:b0:6b1:30e:75d6 with SMTP id
 006d021491bc7-6b1030e832fmr5979797eaf.20.1786935512503; Sun, 16 Aug 2026
 19:58:32 -0700 (PDT)
Date: Sun, 16 Aug 2026 19:58:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8278d8.dbb3a75c.20434b.0041.GAE@google.com>
Subject: [syzbot] [kernel?] KASAN: slab-use-after-free Read in disable_device
From: syzbot <syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    5e6de6a2b522 Add linux-next specific files for 20260811
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=12ef52c6580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dd154b7aa6fe745e
dashboard link: https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/78d1a91d7316/disk-5e6de6a2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/a85543278af6/vmlinux-5e6de6a2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c66856080afa/bzImage-5e6de6a2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com

smc: removing ib device syz0
smbdirect: ib_dev[syz0] removed
==================================================================
BUG: KASAN: slab-use-after-
BUG: KASAN: slab-use-after-free in kobject_uevent_net_broadcast+0x12c/0x560 lib/kobject_uevent.c:415
Read of size 8 at addr ffff88807719dd90 by task syz.3.2890/12793

CPU: 0 UID: 0 PID: 12793 Comm: syz.3.2890 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/24/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 kobject_uevent_net_broadcast+0x12c/0x560 lib/kobject_uevent.c:415
 kobject_uevent_env+0x566/0x9e0 lib/kobject_uevent.c:611
 device_del+0x74d/0x8f0 drivers/base/core.c:3983
 remove_one_compat_dev drivers/infiniband/core/device.c:1036 [inline]
 remove_compat_devs drivers/infiniband/core/device.c:1047 [inline]
 disable_device+0x248/0x330 drivers/infiniband/core/device.c:1339
 __ib_unregister_device+0x2c9/0x400 drivers/infiniband/core/device.c:1571
 ib_unregister_device_and_put+0xb8/0xf0 drivers/infiniband/core/device.c:1636
 nldev_dellink+0x39c/0x430 drivers/infiniband/core/nldev.c:1902
 rdma_nl_rcv_msg drivers/infiniband/core/netlink.c:-1 [inline]
 rdma_nl_rcv_skb drivers/infiniband/core/netlink.c:239 [inline]
 rdma_nl_rcv+0x6ef/0xa40 drivers/infiniband/core/netlink.c:259
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x7bd/0x940 net/netlink/af_netlink.c:1345
 netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1900
 sock_sendmsg_nosec+0x13a/0x180 net/socket.c:800
 __sock_sendmsg net/socket.c:815 [inline]
 ____sys_sendmsg+0x54e/0x850 net/socket.c:2709
 ___sys_sendmsg+0x2a5/0x360 net/socket.c:2763
 __sys_sendmsg net/socket.c:2795 [inline]
 __do_sys_sendmsg net/socket.c:2800 [inline]
 __se_sys_sendmsg net/socket.c:2798 [inline]
 __x64_sys_sendmsg+0x1b1/0x290 net/socket.c:2798
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fad7359e0d9
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 e8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fad744e8028 EFLAGS: 00000246 ORIG_RAX: 000000000000002e
RAX: ffffffffffffffda RBX: 00007fad73825fa0 RCX: 00007fad7359e0d9
RDX: 0000000000000000 RSI: 00002000000002c0 RDI: 0000000000000003
RBP: 00007fad73635024 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fad73826038 R14: 00007fad73825fa0 R15: 00007fff44643058
 </TASK>

Allocated by task 12759:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __kmalloc_cache_noprof+0x321/0x600 mm/slub.c:5563
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 _kzalloc_noprof include/linux/slab.h:1312 [inline]
 uevent_net_init+0xdb/0x2d0 lib/kobject_uevent.c:782
 ops_init+0x35d/0x5d0 net/core/net_namespace.c:137
 setup_net+0x118/0x350 net/core/net_namespace.c:450
 copy_net_ns+0x4f9/0x720 net/core/net_namespace.c:583
 create_new_namespaces+0x3f0/0x6b0 kernel/nsproxy.c:132
 copy_namespaces+0x432/0x4b0 kernel/nsproxy.c:195
 copy_process+0x1ec0/0x43e0 kernel/fork.c:2310
 kernel_clone+0x2d7/0x940 kernel/fork.c:2766
 __do_sys_clone kernel/fork.c:2908 [inline]
 __se_sys_clone kernel/fork.c:2892 [inline]
 __x64_sys_clone+0x1b6/0x230 kernel/fork.c:2892
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 12759:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2748 [inline]
 slab_free mm/slub.c:6499 [inline]
 kfree+0x1c5/0x650 mm/slub.c:6792
 ops_exit_list net/core/net_namespace.c:200 [inline]
 ops_undo_list+0x43d/0x8d0 net/core/net_namespace.c:253
 setup_net+0x2f6/0x350 net/core/net_namespace.c:466
 copy_net_ns+0x4f9/0x720 net/core/net_namespace.c:583
 create_new_namespaces+0x3f0/0x6b0 kernel/nsproxy.c:132
 copy_namespaces+0x432/0x4b0 kernel/nsproxy.c:195
 copy_process+0x1ec0/0x43e0 kernel/fork.c:2310
 kernel_clone+0x2d7/0x940 kernel/fork.c:2766
 __do_sys_clone kernel/fork.c:2908 [inline]
 __se_sys_clone kernel/fork.c:2892 [inline]
 __x64_sys_clone+0x1b6/0x230 kernel/fork.c:2892
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x166/0x520 arch/x86/entry/syscall_64.c:84
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88807719dd80
 which belongs to the cache kmalloc-32 of size 32
The buggy address is located 16 bytes inside of
 freed 32-byte region [ffff88807719dd80, ffff88807719dda0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0xffff88807719de00 pfn:0x7719d
flags: 0xfff00000000200(workingset|node=0|zone=1|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 00fff00000000200 ffff88801b005780 ffffea0001ddee90 ffffea0001d3c010
raw: ffff88807719de00 0000000000400032 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2800(GFP_NOWAIT|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 5763, tgid 5763 (modprobe), ts 88225820550
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x2209/0x2280 mm/page_alloc.c:3943
 __alloc_frozen_pages_noprof+0x217/0x5a0 mm/page_alloc.c:5436
 alloc_slab_page mm/slub.c:3347 [inline]
 allocate_slab+0x7d/0x620 mm/slub.c:3462
 new_slab mm/slub.c:3513 [inline]
 refill_objects+0x2d5/0x350 mm/slub.c:7410
 refill_sheaf mm/slub.c:2885 [inline]
 __pcs_replace_empty_main+0x2c8/0x6c0 mm/slub.c:4774
 alloc_from_pcs mm/slub.c:4850 [inline]
 slab_alloc_node mm/slub.c:4984 [inline]
 __kmalloc_cache_noprof+0x39b/0x600 mm/slub.c:5559
 _kmalloc_noprof include/linux/slab.h:991 [inline]
 slab_free_hook mm/slub.c:2700 [inline]
 slab_free mm/slub.c:6499 [inline]
 kmem_cache_free+0x156/0x650 mm/slub.c:6626
 anon_vma_free mm/rmap.c:137 [inline]
 __put_anon_vma+0x12b/0x2d0 mm/rmap.c:2970
 put_anon_vma mm/internal.h:293 [inline]
 unlink_anon_vmas+0x544/0x720 mm/rmap.c:536
 free_pgtables+0x836/0xb70 mm/memory.c:414
 exit_mmap+0x4aa/0x9f0 mm/mmap.c:1327
 __mmput+0x118/0x420 kernel/fork.c:1193
 exit_mm+0x221/0x2d0 kernel/exit.c:614
 do_exit+0x6cd/0x2360 kernel/exit.c:996
 do_group_exit+0x22d/0x2f0 kernel/exit.c:1151
page last free pid 5633 tgid 5633 ts 88208835587 stack trace:
 reset_page_owner include/linux/page_owner.h:26 [inline]
 __free_pages_prepare mm/page_alloc.c:1418 [inline]
 __free_frozen_pages+0xc93/0xd90 mm/page_alloc.c:2962
 rcu_do_batch kernel/rcu/tree.c:2650 [inline]
 rcu_core+0x926/0x1260 kernel/rcu/tree.c:2919
 handle_softirqs+0x226/0x860 kernel/softirq.c:645
 do_softirq+0x77/0xd0 kernel/softirq.c:546
 __local_bh_enable_ip+0x100/0x140 kernel/softirq.c:473
 local_bh_enable include/linux/bottom_half.h:33 [inline]
 __alloc_skb+0x1b1/0x7a0 net/core/skbuff.c:699
 alloc_skb include/linux/skbuff.h:1384 [inline]
 nlmsg_new include/net/netlink.h:1055 [inline]
 inet6_ifa_notify net/ipv6/addrconf.c:5646 [inline]
 __ipv6_ifa_notify+0x1d0/0xc60 net/ipv6/addrconf.c:6306
 ipv6_ifa_notify net/ipv6/addrconf.c:6358 [inline]
 inet6_addr_add+0x6b4/0xb50 net/ipv6/addrconf.c:3085
 inet6_rtm_newaddr+0x9fc/0xe00 net/ipv6/addrconf.c:5094
 rtnetlink_rcv_msg+0x802/0xc00 net/core/rtnetlink.c:7132
 netlink_rcv_skb+0x226/0x4a0 net/netlink/af_netlink.c:2556
 netlink_unicast_kernel net/netlink/af_netlink.c:1319 [inline]
 netlink_unicast+0x7bd/0x940 net/netlink/af_netlink.c:1345
 netlink_sendmsg+0x813/0xb40 net/netlink/af_netlink.c:1900
 sock_sendmsg_nosec+0x13a/0x180 net/socket.c:800
 __sock_sendmsg net/socket.c:815 [inline]
 __sys_sendto+0x408/0x5a0 net/socket.c:2277
 __do_sys_sendto net/socket.c:2284 [inline]
 __se_sys_sendto net/socket.c:2280 [inline]
 __x64_sys_sendto+0xde/0x100 net/socket.c:2280

Memory state around the buggy address:
 ffff88807719dc80: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
 ffff88807719dd00: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
>ffff88807719dd80: fa fb fb fb fc fc fc fc 00 00 00 fc fc fc fc fc
                         ^
 ffff88807719de00: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
 ffff88807719de80: fa fb fb fb fc fc fc fc fa fb fb fb fc fc fc fc
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
