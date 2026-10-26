Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793046824;
	b=EoCaVCZUSjUlGFk54IDgXFba4iTBzx/3T6KmETZ5F7d21hOCWa8VmxkowzNtihXAX5FN
	 RISzs/0vGguM2UPsBg6sQWGIJbnojpD3CjYeF28XQhxQRksjC2Y/FtMmtYua5D6PR9oey
	 wJnFinSx7Fc3c3NrHGYxYI5+COEC2RpfCl6Eoj+BUkkh4GsSwNn46YZILsQ5Yk7rO0AI/
	 xqw0SYA7R8KB/nGLWo8ef06JcBxjH1Z48vFgE5Y2bB2ff9pIsN5r0hjyPKttVunKfm0vf
	 JzXL1hXDYMeDaqTVYbhhhuYnv2OkQNdCSGaJ0C96XwL0LBXUiw9qXXXBGEPozh2GRvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793046824;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=h7Aq+vqPvdElieptV/YoncWuNTXZ1m+hINrzzecmweY=;
	b=sc8E7azNyCiBywSqvvQA4h/t2FL1Zv4UFDt7//eX5l5abclEqNPblVmF9tBsdrhIgruG
	 9CjAgYk1lwcYw5p+WpmGj9QXgadLd1spreGBCTiM7o6amTIj4GeKYne/vlKOmhwhzJgb2
	 vMqt0jXROnc/0GLt24jo5v/sl2luS9dHTkP/N+gzlyyg5d3/vfpBEDUkwrlnFrkPf5nAI
	 nngTMgAonaV3w9pf6boxQ5ga8+4LVz1AXOyQMTHmqM9MM8JQDEluzwDSYBci4dj54LIvO
	 LCuq/hygIP3xNc1nMi0XgXgQOC7sFIuAFisRw4Cug8i8SQx7km2NFaPWrmEya6MYNwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BA8606A321
	for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 20:33:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07BA8606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4dc57e2a3f2so5550104b6e.0
        for <driver-core@lists.linux.dev>; Mon, 26 Oct 2026 13:33:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793046823; x=1793651623;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h7Aq+vqPvdElieptV/YoncWuNTXZ1m+hINrzzecmweY=;
        b=mbxjsUf5Dt1FEYJyeTZpp15i5HZ1FFi8REo9LVTOnbiSfPZcAESy4wRDt6bQG4B9L6
         /poMSPafw2Gf/7D0bidl8T627yHPAFrg0k7WHwLALDi7fE0HISzt50tRNk4mpKXc3zIs
         h5zI5RaX7NuZEnWanWN9Nnri3N9Ui/bL6Yy+rZgzMkNoqm/yDbyPz/6iFQsRaVBnOiXq
         d+Yv6IQDopPyssqGAxgqqyFLrXoo2HqGim17/0OY8l8/GWl5j5a6Yool0qzJDwjBI85m
         5ls633P0mm1o0rIQjWVUmLIBZO+1v/IVco17oj9gjjTIx0FfXboPJVBPci7ecXKku/Yt
         zHCg==
X-Forwarded-Encrypted: i=1; AKwUvBw3ImWuLzI9fnPDlFj5IEC7ZBG4AGHOOS+Mjd1HqJaoiH+ERvCnDubWzoFG/T73uPz89V1+J9Til5X8wA==@lists.linux.dev
X-Gm-Message-State: AFq9FYI/ClbDKDwbdmJx0qH5K72xePxVNEGf/peRs7YogQtVB5vFq/j3
	97tjqGU4iaVJLlx78YnEnrqtQmL2k2FvJeE921S5jlECrwnb8YJi2iYGeJ26ymAAya5N6a4d+D/
	LdgB6Tit5zhf+j5B92QzqSh1pqNJAqgSh3zbE5uUI4CZq9zyE4+aAnHIO3EA=
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:15a4:b0:4ab:230c:5faa with SMTP id
 5614622812f47-55c002622e3mr4970843b6e.18.1793046823037; Mon, 26 Oct 2026
 13:33:43 -0700 (PDT)
Date: Mon, 26 Oct 2026 13:33:43 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6adfb927.3a3d6196.2ecadf.001f.GAE@google.com>
Subject: [syzbot] Monthly driver-core report (Oct 2026)
From: syzbot <syzbot+list3acbd9912bd634558b43@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello driver-core maintainers/developers,

This is a 31-day syzbot report for the driver-core subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/driver-core

During the period, 1 new issues were detected and 1 were fixed.
In total, 26 issues are still open and 4 have already been fixed.
There are also 14 low-priority issues.

Some of the still happening issues:

Ref  Crashes Repro Title
<1>  137     Yes   KASAN: slab-use-after-free Read in disable_device
                   https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0
<2>  91      No    INFO: task hung in usb_disable_device (2)
                   https://syzkaller.appspot.com/bug?extid=5cf28d3643d94bfb0821
<3>  35      Yes   KASAN: slab-use-after-free Read in lockref_get (2)
                   https://syzkaller.appspot.com/bug?extid=227dbc9afd022922d624
<4>  22      Yes   KASAN: global-out-of-bounds Read in uevent_store
                   https://syzkaller.appspot.com/bug?extid=d164947c037324221043
<5>  18      Yes   general protection fault in bus_remove_device
                   https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
<6>  11      Yes   INFO: task hung in unbind_store
                   https://syzkaller.appspot.com/bug?extid=fd7be5ad9795b7f29df3
<7>  4       Yes   BUG: unable to handle kernel paging request in usb_driver_release_interface
                   https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
<8>  14      Yes   KASAN: global-out-of-bounds Read in bus_uevent_store
                   https://syzkaller.appspot.com/bug?extid=9a321aea9d851b299486
<9>  8       Yes   KASAN: slab-use-after-free Write in do_bad_area
                   https://syzkaller.appspot.com/bug?extid=7bf725ed337e37307001
<10> 7       No    KASAN: slab-use-after-free Read in remove_one_compat_dev
                   https://syzkaller.appspot.com/bug?extid=7db35adbc02c5b86d4e0

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
