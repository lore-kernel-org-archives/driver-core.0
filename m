Received: from mail-ot1-f80.google.com (mail-ot1-f80.google.com [209.85.210.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EAB8230BD5
	for <driver-core@lists.linux.dev>; Wed, 29 Jul 2026 01:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785289825; cv=none; b=XPK1A7hrqmepdMgAg6Aye6HTw6jf8LJj0Kl4LzztJ0JoW/ajHnkwWJlHWPY11XLfdWeirAI/MDy3a5mXZz2AbLhWm2JMf6EZW/efgPXBaSIE6R5wGpbul+yHkPKhYLsDNQMUJTsGCFgEijHNFw+o8SUy1H1BDXFHAgPtCQUVmFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785289825; c=relaxed/simple;
	bh=AR4nesymKOZATuSKgWbW4ipyDo+53x29OiIeL+BsgGA=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=JRRBBHez3tRu6ABWtCPjX8mTdYbdpEPUti/WZc/ZkBOZ9u6NuOmlqqQNgptDCICZUvUfa+q2/Xad8+kMqShuDn2ISKkMe1XiovEuBcJim5TZ5zAKATVJx7rEIp/I64FzVvcgxwWP9hJUEGBKAi4u86IwfET3JhSe1Z0jm/IJq+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f80.google.com with SMTP id 46e09a7af769-7e9dc0f5900so2064527a34.0
        for <driver-core@lists.linux.dev>; Tue, 28 Jul 2026 18:50:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785289822; x=1785894622;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Iax3v7C3Wn06c5btbSjnp58y3YGPZm+HHgJl9N4RfBA=;
        b=p765I0/z+W0/UwfGI3fNiq7HayYc1HrSORmXmJcy2vzVoCP9no2eia7th/++C7yxvO
         J7GGoPYdJrFJVcFxCZrQgDmGWdwwpnZb5yHNluN3n6auQs+SFodeZ0kORjK9ury/cjBA
         DlrxaABZq8B1WRKRDhHJZCsn3+temIdRXRXXDkDw74r/t+XHfxGXyL1O23Ssh1z3367C
         CTdVhzPDbylGtU/Mwl6GOcXd8xFq1/7Ym8u55k2ZsqsVy+cW3BnEdWk03A0zkkkk14Tm
         xciXgaCHQOlz8mrFn9qA18zWKMo2fhcjoEXY99pIDI/yKrGodXhmC3lzmy7cZO+o72ae
         vyLQ==
X-Forwarded-Encrypted: i=1; AHgh+RoogEgyqx0OGiRSAFbAO9NxmVSMZSMgboW3YvUgtcp7ndPH/QeZJ3NPUWblYagMNnjg42vCPfdtNR/KGQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YysrhZLOWrNuDf8FumJmqCJu1M/S6985H6co9EJOYLIG2TtRA08
	K1KMyAt030XVC5b3i4o8OC/iINOX5XBYm65XcJwv6xjWcAIH8v4vjA+8AJwzmrCh31Qn3vGS7Am
	2wC9iXLwy8sbSmgg1sB2zZNUqTaTu1dvTNNopI+cgL/s13wFc6sc3OvfTZNs=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1c85:b0:6ab:1956:9d3b with SMTP id
 006d021491bc7-6aca99835f1mr174801eaf.20.1785289822428; Tue, 28 Jul 2026
 18:50:22 -0700 (PDT)
Date: Tue, 28 Jul 2026 18:50:22 -0700
In-Reply-To: <6a68b426.b6659fcc.241ab8.00ea.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a695c5e.e3659fcc.2a40b8.002e.GAE@google.com>
Subject: Re: [syzbot] [usb?] KASAN: slab-use-after-free Read in raw_process_ep0_io
From: syzbot <syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

syzbot has found a reproducer for the following issue on:

HEAD commit:    cc2b5f627e8c Add linux-next specific files for 20260714
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=1312e401580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2290ccbf984c524f
dashboard link: https://syzkaller.appspot.com/bug?extid=9aacea11bc70c3ddaff2
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17ab25c1580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13edc03e580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/6836f8efb1da/disk-cc2b5f62.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0109d3477cc7/vmlinux-cc2b5f62.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c2e49e350bbf/bzImage-cc2b5f62.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9aacea11bc70c3ddaff2@syzkaller.appspotmail.com

==================================================================
BUG: KASAN: slab-use-after-free in string[  341.221266][ T6232] BUG: KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648 [inline]
BUG: KASAN: slab-use-after-free in string[  341.221266][ T6232] BUG: KASAN: slab-use-after-free in string+0x216/0x2d0 lib/vsprintf.c:730
Read of size 1 at addr ffff88802aed30e0 by task syz.0.219/6232

CPU: 1 UID: 0 PID: 6232 Comm: syz.0.219 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/16/2026
Call Trace:
 <TASK>
 dump_stack_lvl+0xe8/0x150 lib/dump_stack.c:120
 print_address_description+0x55/0x1e0 mm/kasan/report.c:378
 print_report+0x58/0x70 mm/kasan/report.c:482
 kasan_report+0x117/0x150 mm/kasan/report.c:595
 string_nocheck lib/vsprintf.c:648 [inline]
 string+0x216/0x2d0 lib/vsprintf.c:730
 vsnprintf+0x74a/0xef0 lib/vsprintf.c:2949
 snprintf+0xe8/0x140 lib/vsprintf.c:3047
 set_dev_info drivers/base/core.c:4984 [inline]
 dev_vprintk_emit+0x30f/0x400 drivers/base/core.c:4994
 dev_printk_emit+0xee/0x140 drivers/base/core.c:5007
 _dev_err+0x11e/0x180 drivers/base/core.c:5062
 raw_process_ep0_io+0x531/0x990 drivers/usb/gadget/legacy/raw_gadget.c:730
 raw_ioctl_ep0_read drivers/usb/gadget/legacy/raw_gadget.c:782 [inline]
 raw_ioctl+0x2721/0x40d0 drivers/usb/gadget/legacy/raw_gadget.c:1316
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:597 [inline]
 __se_sys_ioctl+0xff/0x170 fs/ioctl.c:583
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x17b/0x530 arch/x86/entry/syscall_64.c:85
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f4973c5db2b
Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <89> c2 3d 00 f0 ff ff 77 1c 48 8b 44 24 18 64 48 2b 04 25 28 00 00
RSP: 002b:00007ffc26cc96f0 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 0000000000000003 RCX: 00007f4973c5db2b
RDX: 00007ffc26cc9770 RSI: 00000000c0085504 RDI: 0000000000000003
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000003 R11: 0000000000000246 R12: 00007ffc26cc9778
R13: 0000000000000000 R14: 00007f4973ee5fa0 R15: 00007f4973ee5fa0
 </TASK>

Allocated by task 6231:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 poison_kmalloc_redzone mm/kasan/common.c:398 [inline]
 __kasan_kmalloc+0x93/0xb0 mm/kasan/common.c:415
 kasan_kmalloc include/linux/kasan.h:263 [inline]
 __do_kmalloc_node mm/slub.c:5339 [inline]
 __kmalloc_node_track_caller_noprof+0x566/0x7b0 mm/slub.c:5468
 kvasprintf+0xeb/0x1a0 lib/kasprintf.c:25
 kobject_set_name_vargs+0x61/0x110 lib/kobject.c:274
 dev_set_name+0xe2/0x140 drivers/base/core.c:3560
 usb_add_gadget+0x475/0x700 drivers/usb/gadget/udc/core.c:1459
 usb_add_gadget_udc_release+0x1a4/0x1f0 drivers/usb/gadget/udc/core.c:1517
 dummy_udc_probe+0x6e1/0x7e0 drivers/usb/gadget/udc/dummy_hcd.c:1103
 platform_probe+0xf9/0x190 drivers/base/platform.c:1494
 call_driver_probe drivers/base/dd.c:-1 [inline]
 really_probe+0x254/0xae0 drivers/base/dd.c:706
 __driver_probe_device+0x1e8/0x360 drivers/base/dd.c:868
 device_driver_attach+0xe0/0x1d0 drivers/base/dd.c:1203
 bind_store+0x1d3/0x220 drivers/base/bus.c:267
 kernfs_fop_write_iter+0x3a5/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x17b/0x530 arch/x86/entry/syscall_64.c:85
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Freed by task 6233:
 kasan_save_stack mm/kasan/common.c:57 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:78
 kasan_save_free_info+0x40/0x50 mm/kasan/generic.c:584
 poison_slab_object mm/kasan/common.c:253 [inline]
 __kasan_slab_free+0x5c/0x80 mm/kasan/common.c:285
 kasan_slab_free include/linux/kasan.h:235 [inline]
 slab_free_hook mm/slub.c:2706 [inline]
 slab_free mm/slub.c:6388 [inline]
 kfree+0x1c5/0x6c0 mm/slub.c:6703
 kobject_cleanup lib/kobject.c:695 [inline]
 kobject_release lib/kobject.c:720 [inline]
 kref_put include/linux/kref.h:65 [inline]
 kobject_put+0x267/0x550 lib/kobject.c:737
 device_remove drivers/base/dd.c:616 [inline]
 __device_release_driver drivers/base/dd.c:1349 [inline]
 device_release_driver_internal+0x48b/0x880 drivers/base/dd.c:1372
 unbind_store+0x1a4/0x1d0 drivers/base/bus.c:244
 kernfs_fop_write_iter+0x3a5/0x540 fs/kernfs/file.c:345
 new_sync_write fs/read_write.c:595 [inline]
 vfs_write+0x61e/0xbb0 fs/read_write.c:687
 ksys_write+0x156/0x270 fs/read_write.c:739
 do_syscall_x64 arch/x86/entry/syscall_64.c:61 [inline]
 do_syscall_64+0x17b/0x530 arch/x86/entry/syscall_64.c:85
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88802aed30e0
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 0 bytes inside of
 freed 16-byte region [ffff88802aed30e0, ffff88802aed30f0)

The buggy address belongs to the physical page:
page: refcount:0 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2aed3
flags: 0x80000000000000(node=0|zone=1)
page_type: f5(slab)
raw: 0080000000000000 ffff88813fe37640 dead000000000100 dead000000000122
raw: 0000000000000000 0000000800800080 00000000f5000000 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0xd2cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 1, tgid 1 (swapper/0), ts 13143981484
 set_page_owner include/linux/page_owner.h:33 [inline]
 post_alloc_hook+0x1f9/0x250 mm/page_alloc.c:1871
 prep_new_page mm/page_alloc.c:1879 [inline]
 get_page_from_freelist+0x264c/0x26c0 mm/page_alloc.c:3955
 __alloc_frozen_pages_noprof+0x222/0x5b0 mm/page_alloc.c:5394
 alloc_slab_page mm/slub.c:3295 [inline]
 allocate_slab+0x7c/0x5e0 mm/slub.c:3410
 new_slab mm/slub.c:3456 [inline]
 refill_objects+0x2d8/0x350 mm/slub.c:7321
 refill_sheaf mm/slub.c:2833 [inline]
 __pcs_replace_empty_main+0x330/0x690 mm/slub.c:4699
 alloc_from_pcs mm/slub.c:4775 [inline]
 slab_alloc_node mm/slub.c:4909 [inline]
 __do_kmalloc_node mm/slub.c:5338 [inline]
 __kmalloc_node_track_caller_noprof+0x616/0x7b0 mm/slub.c:5468
 __kmemdup_nul mm/util.c:64 [inline]
 kstrdup+0x42/0x100 mm/util.c:84
 __kernfs_new_node+0xac/0xa70 fs/kernfs/dir.c:661
 kernfs_new_node fs/kernfs/dir.c:751 [inline]
 kernfs_create_dir_ns+0xfe/0x230 fs/kernfs/dir.c:1120
 sysfs_create_dir_ns+0x12f/0x2a0 fs/sysfs/dir.c:59
 create_dir lib/kobject.c:73 [inline]
 kobject_add_internal+0x62c/0xce0 lib/kobject.c:240
 kobject_add_varg lib/kobject.c:374 [inline]
 kobject_add+0x163/0x240 lib/kobject.c:426
 device_add+0x3fa/0xb80 drivers/base/core.c:3695
 usb_add_gadget+0x47d/0x700 drivers/usb/gadget/udc/core.c:1461
 usb_add_gadget_udc_release+0x1a4/0x1f0 drivers/usb/gadget/udc/core.c:1517
page_owner free stack trace missing

Memory state around the buggy address:
 ffff88802aed2f80: ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff ff
 ffff88802aed3000: fa fb fc fc 00 02 fc fc fa fb fc fc 00 05 fc fc
>ffff88802aed3080: 00 05 fc fc 00 05 fc fc fa fb fc fc fa fb fc fc
                                                       ^
 ffff88802aed3100: 00 02 fc fc 00 02 fc fc 00 02 fc fc 00 01 fc fc
 ffff88802aed3180: 00 05 fc fc 00 05 fc fc 00 05 fc fc 00 05 fc fc
==================================================================


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.
