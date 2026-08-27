Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com [209.85.210.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A24A22A7F6
	for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 07:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787816646; cv=none; b=A9irNSA8dqW5Pa9bgQCiZO+qIJsb/CMf0vz1Fh9Dt5WapLoBDK+QFDYKMch+0WSqed00T4G5VvThoJ4NT6o9bjs+Q18grazKIJXoYtKQz7aUZ+CNFPiOqajfMTQJCaYGoRp4DqF/HoF6Hpq85wH9pKC2fua6yCJByLyGkbo+hDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787816646; c=relaxed/simple;
	bh=qLvwCXRy3RLAF1jAexP/5dC0+vxp3bNryOjD/RQVrGY=;
	h=MIME-Version:Date:In-Reply-To:Message-ID:Subject:From:To:
	 Content-Type; b=rfliJlRuq3yZieQjfaAlCbG7beX2LSWQeLbIRrhagRSecMirEEk4PLrf8fKdV+mY/4xfoIWHOrCKHHMWUQmDcB3VqJ4ZkDucQs4mQuQALMuz4jkiCAvGHHQLkX1y5doJR2JSzVvRrOBPFjqT2BOpIlZU1C66RROF1nBs3FiPLNQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com; arc=none smtp.client-ip=209.85.210.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=syzkaller.appspotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com
Received: by mail-ot1-f69.google.com with SMTP id 46e09a7af769-7f43c6b6d64so2458127a34.3
        for <driver-core@lists.linux.dev>; Thu, 27 Aug 2026 00:44:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787816642; x=1788421442;
        h=content-type:to:from:subject:message-id:in-reply-to:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=U2oh1UrHxyt7XY5/MlGcd+3IUC5ZbqN/eEEyPs+3890=;
        b=lSB4fZD8H9OzRcIWFXLkAMeyhi3hzmFKif4sHDUGiwFOQsI4sT6haVSuznjK9dh5Sh
         b6UMWdKTYnn/4Nto9fByqQIbqKfa2JgMyDNvmr7OuOuRX+obUKRVMgamFh0dLfr3pezl
         AWTGgnTTtulMttGGv81KahbHhCa6OZs0JCBhcLyW4/9aAx8ybDbgtwGKmkPsb3mJB0QR
         RMxhSWzOOklNih7IZmvPcsaFIAERFA9cx7uqOi7SepvUgKtm4/Q2LcIX9lvOwAe0FHYi
         57AK6xqseheZGlxm9a49+pG2XTE2EtpdoOa8uw9c3PmZDNjmEJBXSOzAxB3zzDxXXUVJ
         LynQ==
X-Forwarded-Encrypted: i=1; AHgh+RoyZCaZFSJEXHlz6cBUMu/nsWUzmrK4pIIZuh2vSoO48/ruVeRchp0hVVx02RiWMQJuHrb5roe5xWKZ4A==@lists.linux.dev
X-Gm-Message-State: AFuF++kMDMlGXLZEm6H9mrsLa3wsHnq0RptYX7CPFAYvaSSyhn3hC9NN
	YUtxJYqD56LrIRc5146ETnCmdGRcA0ySjROWQP8UcmaJvzkhbJIrSPCO6sIUc57uSbuepVXnOgw
	gNJr7RMNVkkeMQi7c0qhjio6OcIY/Jg/7YlbagBGNpZ9D4v1rUhGaQq+b/+s=
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Received: by 2002:a4a:e2cc:0:b0:6b1:55d0:6e69 with SMTP id
 006d021491bc7-6b1a049cda9mr9733598eaf.18.1787816642360; Thu, 27 Aug 2026
 00:44:02 -0700 (PDT)
Date: Thu, 27 Aug 2026 00:44:02 -0700
In-Reply-To: <20260827080226.4ec229d3.michal.pecio@gmail.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6a8feac2.50659fcc.60cd.0010.GAE@google.com>
Subject: Re: [syzbot] [usb?] INFO: task hung in unbind_store
From: syzbot <syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com>
To: dakr@kernel.org, driver-core@lists.linux.dev, gregkh@linuxfoundation.org, 
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org, 
	michal.pecio@gmail.com, rafael@kernel.org, stern@rowland.harvard.edu, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com
Tested-by: syzbot+fd7be5ad9795b7f29df3@syzkaller.appspotmail.com

Tested on:

commit:         73e3f071 Merge tag 'nfs-for-7.3-1' of git://git.linux-..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15bc4579580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=22381429a4c2735a
dashboard link: https://syzkaller.appspot.com/bug?extid=fd7be5ad9795b7f29df3
compiler:       Debian clang version 22.1.8 (++20260613092233+e80beda6e255-1~exp1~20260613092250.77), Debian LLD 22.1.8
userspace arch: i386
patch:          https://syzkaller.appspot.com/x/patch.diff?x=124f3979580000

Note: testing is done by a robot and is best-effort only.
