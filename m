Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com [209.85.160.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A84F3389453
	for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 07:30:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787556604; cv=none; b=QH/xWUzTke+VgdTjPBAk1BRords0pNcL3H2Dd/+/c9eTVYOiHg1/+VV7zd4Ye57UnT3WlNcEhO0Npau4T1v/OWEhgvflqwBnF4yQt4VOJb6S+UY5bDDJo+yszShaVYfIeEyeZpitXxdRK0i7B4/FctlUEEtjvrempAnxFkOhOFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787556604; c=relaxed/simple;
	bh=AKyqJPOOkg7zWsjesNyC29jF1e00D1+rH+5B1YaoOYs=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=M4tM5fMEPexmu3cS30RcFOyfJk035ZEq8ex+CLWHCeLuOTN6MU5bQx3h0j0TJSeIzuodQgFfdF0w8lrDO/gV2Ab4E2cIr3j46J/jKV0XXE1MDq9Pvr5WjlyeBFGJMA0VmRfyU8ZzAhLAozwBFoLVvhvEZry/AoGw/XxzH/MpnUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.160.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-45eef45a188so4129735fac.1
        for <driver-core@lists.linux.dev>; Mon, 24 Aug 2026 00:30:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787556601; x=1788161401;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=42sM+iYXadK5By9PE6FdcspEJv/qZnmSf1jkXc+JZv0=;
        b=p4QWU2u0GkcqypSlzUpovSX0o+wkh7YUvwHdeiNAJLrTzKfo7R4JzARm0sNfCXjym6
         UJlUyw3qPrg3hiaRCxA1GdNu7ZZQbTMDMOh5Cp4+G1Hk9YWOAbE3r2axe5/GQ9AATi+m
         BwFUBTN+5x+op8gyOil9OehZ20jca/pCN+NpLFb5qdtmiEfqlQXoilruLzECoLbtSjuY
         R8h0TUB6FwCo+AWeHPrs9dw+659vPLPX/wEZsRv5t6UC2qCD5CjtG1BmIyhiuWkjnw+8
         fHWn7PmIVBvYQH/RMGhWnQNVNTTxgcC9BTOPHpIgJu9BT3UYcHFPbf8JtoQy651a2FpY
         6hRQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNtxrvNfSj+NLyxfg7lQswILuN/Gni9Wav0U2tq2Qw//QzcuJ/LbRSAHk4Av4LOoENTAj7hU/Niuz6Hw==@lists.linux.dev
X-Gm-Message-State: AFuF++nuTrV/SkIU18XyPgCOdd27X5EBiTYfRgwcDHCJcUC0Ns9vj4m/
	8q8MIYZRIrlrMU7T6tMYcr9DPwRR5WqqLoylSFWuFsKMIJuhsJjkAdOXIJRIxgyDzQ9xlRkt60m
	nL1GfGi1hjO6pGn7YvVAPwSgoc2XpMS+1irtbMzxdz5Sme46sXPgVC6uV06Y=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a05:6820:1a0e:b0:6ae:aa38:a0aa with SMTP id
 006d021491bc7-6b15941c2ecmr23710279eaf.32.1787556601699; Mon, 24 Aug 2026
 00:30:01 -0700 (PDT)
Date: Mon, 24 Aug 2026 00:30:01 -0700
In-Reply-To: <20260824071055.96724-1-jeffinphilip14@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8bf2f9.91706f20.16b6e3.02d1.GAE@google.com>
Subject: Re: [syzbot] [kernel?] KASAN: global-out-of-bounds Read in uevent_store
From: syzbot <syzbot+d164947c037324221043@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	jeffinphilip14@gmail.com, linux-kernel@vger.kernel.org, rafael@kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+d164947c037324221043@syzkaller.appspotmail.com
Tested-by: syzbot+d164947c037324221043@syzkaller.appspotmail.com

Tested on:

commit:         9d2ed026 Merge tag 'sysctl-7.03-rc1' of git://git.kern..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
console output: https://syzkaller.appspot.com/x/log.txt?x=12f66415580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=996f19b48f3c7123
dashboard link: https://syzkaller.appspot.com/bug?extid=d164947c037324221043
compiler:       gcc (Debian 14.2.0-19) 14.2.0, GNU ld (GNU Binutils for Debian) 2.44
patch:          https://syzkaller.appspot.com/x/patch.diff?x=14e91179580000

Note: testing is done by a robot and is best-effort only.
