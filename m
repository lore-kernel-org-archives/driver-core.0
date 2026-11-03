Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793680439;
	b=mOR7k4hzuhdxYnoON/DglggdfRiJlH6A9nNUDaYJDYtYScp/sZdTnDNOho3u7Mvt2nRj
	 2RlEhU3L32CKNEZLZiYRhbr3EOomlG1HzNNVU1vJccUkTA2UfqQDvG1n7MbdCIFYxm/Ch
	 40G0+nSstzV3V9bkjDzg7s1HoEij0MORv7tLus95lM+vty0+RTyEV38QvwjCten6QuNOe
	 iEf10qyxPccXij36PqysMUDncy8i5sp+VVDkPoeUZ5UBM1j7H+LmsvyOvrLIRHjUJX/nH
	 Vuh1g/qyM0lzLfojiTevcho7L0z/I5cSZKUh66fl7A2yLoIOSrF6eexv1hesnD0WtRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793680439;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
	 MIME-Version:X-Received:Date:X-Google-Appengine-App-Id:
	 X-Google-Appengine-App-Id-Alias:Message-ID:Subject:From:To:
	 Content-Type;
	bh=QJLlgJibOZQAdPrh0+nB+7dj+jYgjo70c2i017bH7Rw=;
	b=qVyg+2EVN762m5Q/2yAG9SOE/RSNuHFshd1P0lbQdIhyB1gAnRrw/vZr2FFngnsmfdqb
	 TK4raZ6IPKGit7krsVzsl3KdoDEmSkswqG/ZzW07pBdqNEwDcCL3vNr4vHcoqX0Gb100W
	 cNoOBXW7r2P6q/rS+nqTSXf8EhZeZ5C6HtL49HP2sOODWDm3aCsIw9PM2yprG/ntZClSX
	 mkrlOBLECIUhFxpodzdkOoZ2l/+AJM/8jyfeJtnF+ilA0fCa0YSeXVt9mK+Irb8GIpd7I
	 anim1wRsO8t8J6Wu5vhHg5hEXyiVttKHMYBWQwwSDxfmYW8rO2yDkj46bh7XPGe1nUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.197
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F148606A326
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 04:33:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F148606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ea2c058e67so5512308b6e.1
        for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 20:33:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793680438; x=1794285238;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QJLlgJibOZQAdPrh0+nB+7dj+jYgjo70c2i017bH7Rw=;
        b=E3KstcSMdV3BVZPUDLbXvu2pI7qTPRb46Jj8wKIL5ttKNF6dV6kA/Vqn4agUK0MzkZ
         BKAyRpMpf7pykCj5aXXHTC1jxUI1Zs0A3iKrMwMhvuj6pe3nyMziM2C2Zz/4Rp5W+Mke
         Ym7NSqWQKkd3Iva6rOSR5JbM3L4fDE9ykg+3Y4qdJ5PSoWvkgOv1FivA09fI7fQk+79X
         NhGd/Je9QunlJ9PEvIsxo8cxhi2ZoKV/co05vOk25WBDRum4xGfp/ysw46SJdwjlaWyo
         xAy7VxXdzTxGdDa6UaFzymc2b4TgHaa4D3gGvVhAqsCCCVGAs0WmVpA1Y2PT6MOJ/ooW
         h+EA==
X-Gm-Message-State: AFq9FYI/UC9/4LJ0k88/RsUXBvC+icQjZEPNNgzfI8tJiXmxtHCv5Sec
	UR1XD6dYRmQNgc1vx5GdQ7dwbIHKV6KxFp8E2J7pH5cfrMRy1rylLHjNuTF1ScVrsM1FumjZ6LB
	u7y73b0EKS+I9JicagVQCG7zVOwCH/hC8P6VzrX0Q3PZaZAHWxAQOQBbwZlw=
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:30a1:b0:55c:844:98ff with SMTP id
 5614622812f47-5640dccb4b3mr9126269b6e.34.1793680438636; Mon, 02 Nov 2026
 20:33:58 -0800 (PST)
Date: Mon, 02 Nov 2026 20:33:58 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6ae96436.abb90550.19e2c9.0001.GAE@google.com>
Subject: [syzbot] Monthly kernfs report (Nov 2026)
From: syzbot <syzbot+list19f90e5105228a5cb2f0@syzkaller.appspotmail.com>
To: driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello kernfs maintainers/developers,

This is a 31-day syzbot report for the kernfs subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/kernfs

During the period, 1 new issues were detected and 0 were fixed.
In total, 23 issues are still open and 31 have already been fixed.
There are also 9 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 4626    No    possible deadlock in kernfs_remove_by_name_ns (2)
                  https://syzkaller.appspot.com/bug?extid=b50eba6bf6cd3f8ba7d0
<2> 2249    Yes   possible deadlock in kernfs_remove
                  https://syzkaller.appspot.com/bug?extid=2d7d0fbb5fb979113ff3
<3> 732     Yes   WARNING in kernfs_remove_by_name_ns (3)
                  https://syzkaller.appspot.com/bug?extid=93cbdd0ab421adc5275d
<4> 193     Yes   INFO: task hung in fdget_pos
                  https://syzkaller.appspot.com/bug?extid=0ee1ef35cf7e70ce55d7
<5> 105     Yes   INFO: task hung in kernfs_add_one
                  https://syzkaller.appspot.com/bug?extid=e4804edf2708e8b7d2a5
<6> 8       No    possible deadlock in array_state_store
                  https://syzkaller.appspot.com/bug?extid=7657131267c5111921e2
<7> 2       Yes   INFO: rcu detected stall in kernfs_fop_release (3)
                  https://syzkaller.appspot.com/bug?extid=087d9dac1f398074ca9f

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
