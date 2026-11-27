Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795754012;
	b=ReDuLQNnhu9aFGH9LScmyAA8Rorx3FfxSucWHgHkcxmCvLe4ff7tssf/aiHQdgHDEc3R
	 h4jie2bR2trhE6jl9U/o+1EEWSJ80mUuUcXXxAwVUU/0wwXvRM6ghGUmLMvQxEIEcvReI
	 pqExzjtij5ml7ahVxlYKKj/ix/Ez5waQAAXV+RJjJqa7eMdNZHClgasBr7ijE1jC06O/n
	 g3oj6/BztwQWTysyJuaPNOL1wEt+nHVguZGwuQ9uWvKROgM2NlAIbX9jfZ0P0kA3xAtVk
	 Mo02FdDeDMCZcYEaFGhZzeerEu7yOTaFQGb335hUAqnHd+IZeh6B8F3L7F/RsxTogfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795754012;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:MIME-Version:X-Received:Date:
	 X-Google-Appengine-App-Id:X-Google-Appengine-App-Id-Alias:Message-ID:
	 Subject:From:To:Content-Type;
	bh=2dhXw0zfnp8cVCgUurE6Um5lhjtBVnxHBaJDVg1JQUA=;
	b=R/E9x4sOK/qpP3yX3w2mrSBOPFHtZrrLLugcka7ikzdOjY53ap7ZmhNZWjy76m255AOD
	 +NzxoaWj+CCEjYCnDkRwU9fKgx1bGvCwyiSw4zq8dy15u4YGQnHRJ+vmhmTXGuRujqoVx
	 qo2C3QmALUtA567n56IAVz+6VQA76i0ZyFnr89wqSF/9hgE7MO100QQUR8bRAdJ2Rzp+B
	 iNSBmBJhRGYeEuEGoOClbo8Jg+uyoiLbCvwiGpVH9GMapX1PZy5YiXspMTzELFQiMMtam
	 XGfDIO2UHIq+kIuqi5JEkVTxJexft7NZHlXsgBYhcbpwIIgE8QgA8eg54VBIVWkiSXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=fail header.from=syzkaller.appspotmail.com;
	spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com;
	arc=none smtp.remote-ip=209.85.167.199
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8168606A31E
	for <driver-core@lists.linux.dev>; Fri, 27 Nov 2026 04:33:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8168606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4c55ba309c2so8701881b6e.1
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 20:33:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795754011; x=1796358811;
        h=content-type:to:from:subject:message-id:date:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2dhXw0zfnp8cVCgUurE6Um5lhjtBVnxHBaJDVg1JQUA=;
        b=ZKF6JdygRBz4uLWG62//gAe1StQ5RkdWCQUd9TBivGcFBSB/1IFao5VESg7hEelYKR
         WY9Q+FYyWZo6VRnqZqy73aUHzcu0QkhZwJFX8XQ9Z8b4BI20Iz/v3XM6HY5pwygU9rhq
         hRHIghO9m26hCZAZOVtCQJtsyF8K439cdeQ8dYJvPyqT9rD+hNROw/TXT9ef3OYwKFqz
         E5IxwD5DslsiywD3gtVxiLw/t74Byqxa46Xw5IAoW7UNrtU4uqDvDiKdS+ciaZBKT0/0
         MsgbUfkgOc6nFlU0u7FA2sjhYifWMT3wsE3irVV1vPv/Bs2Z10Vk8NZvhhuI2rchMxF+
         wQmg==
X-Forwarded-Encrypted: i=1; AL+hErHJzsa79Hoe/KsewoHgoU6HgsmhtVaq1ZtUydcdebxnvEjl8AARj9PcODbZcW+E1CpNEEhQm52yXmh6fg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8otzzgBLx331GEnhlumpAehHdlW06h/PKTx1qN8IJe1TjQxcI0
	ZLYLVwnRLYRtDKk/xr9xrBaMGxUupHkvrYep2tsSev12V6ZEu6/UGmb6Tue4lVE0ghASaEaVO1x
	yX4JzHVQURq2jh1D5ODpllXBn82Xr/SO63pRpE5MaQRqNChXQi4AgmYANxoo=
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
X-Received: by 2002:a05:6808:318b:b0:4fb:ac9b:b06a with SMTP id
 5614622812f47-57a0c6b5401mr23997648b6e.48.1795754010881; Thu, 26 Nov 2026
 20:33:30 -0800 (PST)
Date: Thu, 26 Nov 2026 20:33:30 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6b09081a.904258e1.78503.002b.GAE@google.com>
Subject: [syzbot] Monthly driver-core report (Nov 2026)
From: syzbot <syzbot+listcda40a291aae20a5f196@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello driver-core maintainers/developers,

This is a 31-day syzbot report for the driver-core subsystem.
All related reports/information can be found at:
https://syzkaller.appspot.com/upstream/s/driver-core

During the period, 2 new issues were detected and 0 were fixed.
In total, 24 issues are still open and 83 have already been fixed.
There are also 15 low-priority issues.

Some of the still happening issues:

Ref Crashes Repro Title
<1> 261     Yes   KASAN: slab-use-after-free Read in disable_device
                  https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0
<2> 103     No    INFO: task hung in usb_disable_device (2)
                  https://syzkaller.appspot.com/bug?extid=5cf28d3643d94bfb0821
<3> 43      Yes   KASAN: slab-use-after-free Read in lockref_get (2)
                  https://syzkaller.appspot.com/bug?extid=227dbc9afd022922d624
<4> 20      Yes   general protection fault in bus_remove_device
                  https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
<5> 6       Yes   BUG: unable to handle kernel paging request in usb_driver_release_interface
                  https://syzkaller.appspot.com/bug?extid=863936f50214e843ae0c
<6> 12      Yes   kernel BUG in sysfs_break_active_protection
                  https://syzkaller.appspot.com/bug?extid=dcad997ed2b5bd95cc5e
<7> 4       Yes   possible deadlock in device_register (2)
                  https://syzkaller.appspot.com/bug?extid=a246ab421a728c78b4ad

---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

To disable reminders for individual bugs, reply with the following command:
#syz set <Ref> no-reminders

To change bug's subsystems, reply with:
#syz set <Ref> subsystems: new-subsystem

You may send multiple commands in a single email message.
