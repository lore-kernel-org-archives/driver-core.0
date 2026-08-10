Received: from mail-ot1-f78.google.com (mail-ot1-f78.google.com [209.85.210.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFF9233A03F
	for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 17:13:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786382010; cv=none; b=YMOFdB9+ZyjZlZqkOaopkhLLrexY2VAurn+7bbRx9JlVkzZK4+MQsCRIYC+0J7xAFcb/DElW1S6yqmtdg5xWtoEbQjIGexEr95eGJ1HnAtPB8BcjtU1cKNf2u3LhbsMMKHSMAlQuoFSXgD73BaWehdyyZ9ilrdnj6EnKjvMAYgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786382010; c=relaxed/simple;
	bh=u5DnQ2ug+50etOvEZvocOH+ftMP2Go6yy14/ZXFft3Y=;
	h=MIME-Version:Date:Message-ID:Subject:From:To:Content-Type; b=N70sqPZtK8xr1LHDAl17BL9zc0EhTQbwuss0WV3oadFF6L7VesMGt8So6sp7BraOvJWhz76i87FR7XuzryraLHOb5WF71QAsptythlGd+kGfcPJ/jCP7oz77RsAOQlcnCRdOP5Ldk4Fw1h7uWkpztm41H7gR7M6+UyFM/dKfgt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f78.google.com with SMTP id 46e09a7af769-7e9e2db9914so124067a34.1
        for <driver-core@lists.linux.dev>; Mon, 10 Aug 2026 10:13:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786382008; x=1786986808;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bXv1DkYpQZeAyefREq26kKDCDQkUPtTwOw+3ClE4bcg=;
        b=SPVBYRM81jojzzVWDMOqHOMoRsX55UEf2NrhPpdHEu9Z37qlrDc8TpaPsVd67Eww71
         nHSTooedFEpWSFYCsr1WEFQY3kMH+KSJhLX9U/K8KJEgOZlTLl/57aJHh3Wi5+MGMlJI
         9tdqX0ZWhMCiDecBL5/xA0AlbqYx02tb61sk7eSgdJP/O6JrQAiBU57fPIBg2LOGmwaq
         nLYVAPjq2+bnioiltrLv36XzrrNwZIgbvzQGOOAzGVc4ZtHbdGozPYwoDKsZInjOJ1Y8
         sBeurigYTw70r9w36ymVeKRkX33H25gzwCXffpo5TOPsjkQDPMvghz35rpYryNcqNIQY
         FeEg==
X-Forwarded-Encrypted: i=1; AHgh+RqZ64m5jB1QfVDwlkfwqMOTkHy81SvPBwjF0rSX0xqqwYbiRa67UEv3jJkQREXqHimp1OAPPRYCoNIYKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzjd9j5MzstxftzYFS+u1poLp8RG+fBYLDkcv0hLaDU2Lmk5xQV
	NYB9qRz4mhT/mqxCgeWC4Fx4WfWuRcRzIjAW//AQ50oBOJo8K+129UutzEXbJxT50VSaiCMfO+g
	N/0XDZ38NUaJV1fuGr0M4fhMJpoGZj3HXQNzyP4mvnyDhru/gVqkCnMGXUdc=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:d47:b0:4ab:224d:6dd6 with SMTP id
 5614622812f47-4b1af98e2eamr10474075b6e.15.1786382007866; Mon, 10 Aug 2026
 10:13:27 -0700 (PDT)
Date: Mon, 10 Aug 2026 10:13:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a7a06b7.b50370da.49fe0.0057.GAE@google.com>
Subject: [syzbot] [kernel?] memory leak in dev_set_name
From: syzbot <syzbot+87ce68d9f48eca96a84a@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot found the following issue on:

HEAD commit:    06cf61899d64 Merge tag 'x86-urgent-2026-08-08' of git://gi..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=124d4079580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6843f8fd2336602d
dashboard link: https://syzkaller.appspot.com/bug?extid=87ce68d9f48eca96a84a
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=134722c6580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=164d4079580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/e023ff6ad9bc/disk-06cf6189.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ea49527ba5df/vmlinux-06cf6189.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e3d6468d0490/bzImage-06cf6189.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+87ce68d9f48eca96a84a@syzkaller.appspotmail.com

BUG: memory leak
unreferenced object 0xffff88810628f840 (size 16):
  comm "swapper/0", pid 1, jiffies 4294937753
  hex dump (first 16 bytes):
    67 61 64 67 65 74 2e 30 00 00 00 00 00 00 00 00  gadget.0........
  backtrace (crc 5823fe15):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __do_kmalloc_node mm/slub.c:5333 [inline]
    __kmalloc_node_track_caller_noprof+0x3d3/0x570 mm/slub.c:5471
    kvasprintf+0x6e/0xf0 lib/kasprintf.c:25
    kvasprintf_const+0x5c/0x110 lib/kasprintf.c:49
    kobject_set_name_vargs+0x40/0xd0 lib/kobject.c:274
    dev_set_name+0x6d/0x90 drivers/base/core.c:3560
    usb_add_gadget+0x219/0x330 drivers/usb/gadget/udc/core.c:1459
    usb_add_gadget_udc_release drivers/usb/gadget/udc/core.c:1517 [inline]
    usb_add_gadget_udc+0x6e/0xb0 drivers/usb/gadget/udc/core.c:1564
    dummy_udc_probe+0x26c/0x2e0 drivers/usb/gadget/udc/dummy_hcd.c:1121
    platform_probe+0x86/0xf0 drivers/base/platform.c:1439
    call_driver_probe drivers/base/dd.c:628 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:706
    __driver_probe_device+0xe9/0x1a0 drivers/base/dd.c:868
    driver_probe_device+0x28/0xf0 drivers/base/dd.c:898
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:1026
    bus_for_each_drv+0xd2/0x130 drivers/base/bus.c:500
    __device_attach+0xf9/0x290 drivers/base/dd.c:1098
    device_initial_probe+0x6f/0x80 drivers/base/dd.c:1153

BUG: memory leak
unreferenced object 0xffff88810629da00 (size 256):
  comm "swapper/0", pid 1, jiffies 4294937753
  hex dump (first 32 bytes):
    00 00 00 00 00 00 00 00 08 da 29 06 81 88 ff ff  ..........).....
    08 da 29 06 81 88 ff ff 80 cd 4e 83 ff ff ff ff  ..).......N.....
  backtrace (crc a134a33e):
    kmemleak_alloc_recursive include/linux/kmemleak.h:44 [inline]
    slab_post_alloc_hook mm/slub.c:4597 [inline]
    slab_alloc_node mm/slub.c:4917 [inline]
    __kmalloc_cache_noprof+0x356/0x440 mm/slub.c:5485
    _kmalloc_noprof include/linux/slab.h:988 [inline]
    _kzalloc_noprof include/linux/slab.h:1309 [inline]
    device_private_init drivers/base/core.c:3602 [inline]
    device_add+0x740/0xc80 drivers/base/core.c:3653
    usb_add_gadget+0x221/0x330 drivers/usb/gadget/udc/core.c:1461
    usb_add_gadget_udc_release drivers/usb/gadget/udc/core.c:1517 [inline]
    usb_add_gadget_udc+0x6e/0xb0 drivers/usb/gadget/udc/core.c:1564
    dummy_udc_probe+0x26c/0x2e0 drivers/usb/gadget/udc/dummy_hcd.c:1121
    platform_probe+0x86/0xf0 drivers/base/platform.c:1439
    call_driver_probe drivers/base/dd.c:628 [inline]
    really_probe+0x12f/0x3a0 drivers/base/dd.c:706
    __driver_probe_device+0xe9/0x1a0 drivers/base/dd.c:868
    driver_probe_device+0x28/0xf0 drivers/base/dd.c:898
    __device_attach_driver+0x10f/0x170 drivers/base/dd.c:1026
    bus_for_each_drv+0xd2/0x130 drivers/base/bus.c:500
    __device_attach+0xf9/0x290 drivers/base/dd.c:1098
    device_initial_probe+0x6f/0x80 drivers/base/dd.c:1153
    bus_probe_device+0x3e/0xb0 drivers/base/bus.c:620
    device_add+0x99f/0xc80 drivers/base/core.c:3772
    platform_device_add+0x1c2/0x300 drivers/base/platform.c:762

connection error: failed to recv *flatrpc.ExecutorMessageRawT: EOF


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
