Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8A33C1D62
	for <driver-core@lists.linux.dev>; Sat, 19 Sep 2026 09:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789808824; cv=none; b=Ml8kcB8vsMPnHLKFzJ+UEOsn95jmYtMaJAk/3tggjVkJRjnksCmEIPnnKxMaBb9XUgeBQoupGISKEMxEZHueejfetfE/85xa5BSUZLCCVgWCcZvtHUwXETfTYR4Jnrj6sw6EyBaLxslBBiFojn99u0SAQW9TTRt2ENZH2kN/jEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789808824; c=relaxed/simple;
	bh=nPkKPzM0dz0Mo+MVSDVf/sJzkjHbvyKHBTrQJIlCn7c=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=MmVPBq3oVbhb+bzB6zKzkxh09eV5EcflcetrF5PXlAWDCaVzJBXqaz6fhck5BmcGpUYRQsX7J41t11A16SxrZLQR27fMV1YKLGiklwOu8D5ntynvkOM4Sue00mCEKuJbZ4JN0TytW8LHV/AKxUANMb5Zkrw7FrbvTuXzZ3lah5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c1e5079d43so2155535eaf.3
        for <driver-core@lists.linux.dev>; Sat, 19 Sep 2026 02:07:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789808821; x=1790413621;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x9yRw9D2gXRvIc/0u4uYuzMHzcogsHQUYAKktJ4OjqM=;
        b=MvZsrLVPblyUjMwXrN08c6ekItE0+daMFAsO4bQVSUf8aV+2h3rfLoYpzgOQbRFrz0
         chYNXcG4+Utpu5ogEntVPYzMIhGv9o/evgWBDiv2A6eHGZpL8m/MLX/APLIrk1xG1/KS
         GJnClGu9Al2axju+KRQskGMjnr5FpbAbp8gKBLgMZScwpggAw6c+L4CBWJ9BBT3VnyTY
         7x7jzh/Y2A8hPD70mK7PFjStAT3aFXu2Cy+CGXYgSV0XiO3ngmOUxux9VTMjm7iRLW7r
         BzsfqCcmsesDSVPdqX7ZG8GuqG3CRXCHKlfywU3n2eSrfrDyFB3zVJI0LtBjJNppDH0n
         CfJg==
X-Forwarded-Encrypted: i=1; AKwUvByzwLLwVHpHHiD8nyb4IafJtdTtyhoQNwzkcnypjzTW/GukG9gF8BqM7ng5YeObYPVhCruGyhzYL53vGw==@lists.linux.dev
X-Gm-Message-State: AFuF++lWH20rP0Ns/FRhVHcF1ynDjCHuz42Q3rP+ohC1mIk48udsTJNp
	w6F6hHueDo0F6bTGy9HcipWg6hKTsvwJy7pkgbuqx7PIZgyESTayqS17/4GWDC6KA21h0sirhi3
	M8YvvQvFdpdutqzx3VEnLsBWnH32stSjF9dIssQMPpd2Q4bWehZiYh09PDcs=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:80c8:b0:6be:7782:5a51 with SMTP id
 006d021491bc7-6ca9a026f21mr4393980eaf.10.1789808821682; Sat, 19 Sep 2026
 02:07:01 -0700 (PDT)
Date: Sat, 19 Sep 2026 02:07:01 -0700
In-Reply-To: <CAE2Bdm3FqBPAMxqKoz_h1cw+OXpm=LJHdJjsME_Jy966tqhq_A@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aae50b5.e548f532.1ca396.0003.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
From: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	iam@thechris.in, joern@barelysecure.org, joern@lazybastard.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mtd@lists.infradead.org, miquel.raynal@bootlin.com, rafael@kernel.org, 
	richard@nod.at, syzkaller-bugs@googlegroups.com, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
Tested-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com

Tested on:

commit:         40288c92 Merge tag 'drm-fixes-2026-09-19' of https://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=169d2ff9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=84649d3ff8d550cb
dashboard link: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=11b52ff9580000

Note: testing is done by a robot and is best-effort only.
