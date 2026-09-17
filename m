Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 572253B7751
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 06:59:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789628344; cv=none; b=eRMEEZSRtVxZZ2NTw2cql6bsYYtcfItdbG8uJlIYT+TD4xh5M5CVQrQ4ewUyBPocbjCZyH+zxVH28YPv1h2gcD3qWdag1Fcpy6t09ScL1/bckdaYIP6nVEU9uvGNm2gelMhF6qukJqOwqrVUHl6KLKzXWYK+5hh0b2YE+zOZQhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789628344; c=relaxed/simple;
	bh=ocm1oz3D6bzdO8b23gwQ0fUOwUowt/136rgo1dwg4wc=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=hk5+eb/jYtXeZLxxRQJuygz4eK4jGhq0nYfN3SlyJLfPZV6p3512Gq2Eoq0gr9Vtezg8VEsRrIZphmU7uZzyiVue6MnNLaPUoN2ZgRlUv5IWQ6PuaYdzP0f+6Ghabt0TnkdW5H0E2dv8FdqmkwApswGJOHeUtiOCfsOwKNccii8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.161.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-6c2bb8200b0so852711eaf.1
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 23:59:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789628342; x=1790233142;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=RA/zTH478ZP9Kc/vn5sqCuMNo+mxE1VsaPGXCtRcBhc=;
        b=0lWrZcGyAdnqK0inWar5ZvPyS+GaTeESTnCt2Xz+Iyo0cRq6RzQ7feS5KHaitTTI3a
         8jnkoN1/Yg/Ef0BJbk8YFreqv18WK9QmDs6429xrxTqPxlMMuln31KYmwp+j10SfAYFI
         f1a9HTQcPgv0oHzypQpAVf/3WdUfq2MgPyP9rpzCVgt8sf3sdrHQO2xE+7VzWuq4pSho
         SxP/r+aRpxnhw7WWv9BAa/a6oGvSioL3QJX9A92PeMbpqqM3YQRUjl+qJUvsfzNjTP9J
         eu1ZHYweHVqZDNd3HJ1Wyss0gHbDyGGnYl8tCz2PNjNZ7SWywT4fIWJbwhgqMWJad2CG
         0+3w==
X-Forwarded-Encrypted: i=1; AKwUvBzH004GGe0M4LSFyA8KAMshEVWHinknoX1uE1UzB35RyxztxWy3RYVAaIc3eko/zR0H6UVLgGZY+Jidyw==@lists.linux.dev
X-Gm-Message-State: AFuF++n5ladCCX4stsIGc3QXdqRbg6oNT2tfHKNwQMiz5Vf4//Fb+rAr
	MIDANYIFN6sjapzp9xlvw9LP09elSh40klnKCwa7c5vmCnNsI1Evp4fIC4Gj/9DAr8aKWondDjh
	d5tTOgD1/tYAfVz17f6QPskhUHivegUkrvn+qhami3IRsSsvebIp/yk/g5ME=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:2087:b0:6b1:4e36:fb80 with SMTP id
 006d021491bc7-6c7d1ac9aaamr5783579eaf.15.1789628342287; Wed, 16 Sep 2026
 23:59:02 -0700 (PDT)
Date: Wed, 16 Sep 2026 23:59:02 -0700
In-Reply-To: <CAE2Bdm2wzxj-J0TM8F+3SVnu0W3HeiROW97U4qvBeyHKdHJFmg@mail.gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6aab8fb6.71f81b7d.278072.0019.GAE@google.com>
Subject: Re: [syzbot] [fs?] possible deadlock in ovl_create_object (2)
From: syzbot <syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	iam@thechris.in, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rafael@kernel.org, syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com
Tested-by: syzbot+7cab6a19619f1b8efc00@syzkaller.appspotmail.com

Tested on:

commit:         238650ef Merge tag 'powerpc-7.3-4' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13824915580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=8c5c3949d762a91f
dashboard link: https://syzkaller.appspot.com/bug?extid=7cab6a19619f1b8efc00
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=1493b925580000

Note: testing is done by a robot and is best-effort only.
