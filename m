Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB23A3F58E5
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 08:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.197
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789632791; cv=none; b=SrVouWDODBlkoYLuzb8SINOuO+N+vKd9VbfZE+wDGoE2xSGFBJRC7mlXcFJCeyWxMhaEbkrZqpZo2uCs/CVVRGu+qGz2Oygxn5KQeWnYfSIFGYWmVRoq0Rlov0bvLFd3wuaFypxnwiIhpyD9IOyd/EU3a/sc6w0csVMZOdSIVzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789632791; c=relaxed/simple;
	bh=Hs68hwnq6v6JB6u5yjPs1ot3/dTWyi3j667K22UbsPk=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=EXXEmdjbSgyuSzPpqsWiSyQgfGfjGoARiTRWLG0idaYlqfGTISODf7wPp48Id5BzGZeOA0/SZ9+l0lLAnhkrJbfsC3n7iM+rirVlTxCpTK0nHRAVSb7RzaGE40gCVzHQUvrF/6kVVWEvcoisu7YplBJwa0g/1ERmyViKfuVYrA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.167.197
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4c307941971so811990b6e.1
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 01:13:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789632785; x=1790237585;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jLd9W0G+g0fEhC1pzO8g1eY0KUSU+n4SflMsM+Hy+ss=;
        b=pTE/raoC0OUjy4r1Tat0HhdIZ6ds0f6v7w0mR2z6mmXc2/USqt0/QSzZCLrG+wM5ON
         adgtLTwUmX52LhXuTAvyVb3Rc96iM/OpQNlqQM7eDfcVvTwCz/aZcWtHBxvombgUS9Xn
         eNRS8UBfdVdziwIi1XLPRpuzeEKWj2pg3jJNq0p/d0rf/HXeUb9nBnlBj9lV3C8k4c7a
         /u9ceGFJmFIkb4gQECkqbY4BTY+DSqGs9FmoIz0Vg3b/F0f+bqdpYUmdodfGmrBd8/91
         xZENTBZRcQ7XVTFkYu14/dEfYkpYNLAaaFW8yJmH8vfo9eaC5va7chj3UGES+zEHYJbR
         kn1A==
X-Forwarded-Encrypted: i=1; AKwUvBwP61x4xXo+z5h/XsaOemqmWZXici6wrDLQ1pxrWPM9PBNVtMHUq+GBVq7MbN3ecmXahb2ufoFC/Y0a1w==@lists.linux.dev
X-Gm-Message-State: AFuF++nN+thQWyBKmclr94IovF0ehv2kOE4kXUWW2SREoqi1sFkjnFPn
	D9pF508g1n7CPYi3wqTIdKdAubWrzF7/ndjpMnkRCHwcL63ol6k+WEiUnKn36PdZPSQUx4o2hXI
	66PEmRyAJuYTEfCvpePv3lJJarxieMjf5pHhNagtiBPQp7rBm0H3pzAJaZns=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6808:470c:b0:4b9:a829:f016 with SMTP id
 5614622812f47-4ca4c6aaf9fmr5278837b6e.34.1789632785213; Thu, 17 Sep 2026
 01:13:05 -0700 (PDT)
Date: Thu, 17 Sep 2026 01:13:05 -0700
In-Reply-To: <CAE2Bdm14hif17B8RTAE+PhWEps5Fzh=WPurZeSNp9C6TqCKumg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aaba111.b398a7c9.1f86be.0013.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
From: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	iam@thechris.in, joern@lazybastard.org, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mtd@lists.infradead.org, 
	miquel.raynal@bootlin.com, rafael@kernel.org, richard@nod.at, 
	syzkaller-bugs@googlegroups.com, vigneshr@ti.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
Tested-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com

Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=165358c9580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=117a3bf9580000

Note: testing is done by a robot and is best-effort only.
